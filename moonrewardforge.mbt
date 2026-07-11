///|
pub enum RewardKind {
  Base
  Shaping
  Penalty
} derive(Debug)

///|
pub enum NormalizationMode {
  None
  ScaleToAbsSum
  ZScore
} derive(Debug)

///|
pub struct RewardTerm {
  name : String
  raw : Double
  weight : Double
  kind : RewardKind
} derive(Debug)

///|
pub struct RewardStep {
  index : Int
  terms : Array[RewardTerm]
  terminal : Bool
} derive(Debug)

///|
pub struct RewardScenario {
  name : String
  steps : Array[RewardStep]
} derive(Debug)

///|
pub struct RewardConfig {
  mode : NormalizationMode
  clip_min : Double
  clip_max : Double
  epsilon : Double
} derive(Debug)

///|
pub struct RewardBreakdown {
  step_index : Int
  term_count : Int
  raw_total : Double
  weighted_total : Double
  normalized_total : Double
  clipped_total : Double
  mean : Double
  spread : Double
  sparse_terms : Int
  zero_ratio : Double
  shaping_share : Double
  penalty_share : Double
  dominant_name : String
  terminal : Bool
} derive(Debug)

///|
pub struct TraceSummary {
  mut step_count : Int
  mut sparse_steps : Int
  mut clipped_steps : Int
  mut avg_zero_ratio : Double
  mut total_raw : Double
  mut total_weighted : Double
  mut total_normalized : Double
  mut total_clipped : Double
  mut best_step : Int
  mut worst_step : Int
  mut best_score : Double
  mut worst_score : Double
  mut terminal_score : Double
  mut reward_span : Double
} derive(Debug)

///|
pub fn default_config() -> RewardConfig {
  RewardConfig::{
    mode: ScaleToAbsSum,
    clip_min: -5.0,
    clip_max: 5.0,
    epsilon: 0.000001,
  }
}

///|
pub fn NormalizationMode::label(self : Self) -> String {
  match self {
    None => "none"
    ScaleToAbsSum => "scale-to-abs-sum"
    ZScore => "z-score"
  }
}

///|
pub fn clamp(value : Double, low : Double, high : Double) -> Double {
  if value < low {
    low
  } else if value > high {
    high
  } else {
    value
  }
}

///|
pub fn abs_value(value : Double) -> Double {
  if value < 0.0 {
    -value
  } else {
    value
  }
}

///|
pub fn max_double(left : Double, right : Double) -> Double {
  if left > right {
    left
  } else {
    right
  }
}

///|
pub fn min_double(left : Double, right : Double) -> Double {
  if left < right {
    left
  } else {
    right
  }
}

///|
pub fn RewardTerm::contribution(self : Self) -> Double {
  self.raw * self.weight
}

///|
pub fn RewardTerm::is_sparse(self : Self) -> Bool {
  self.raw == 0.0 || self.contribution() == 0.0
}

///|
pub fn RewardTerm::is_penalty(self : Self) -> Bool {
  match self.kind {
    Penalty => true
    _ => false
  }
}

///|
pub fn RewardTerm::is_shaping(self : Self) -> Bool {
  match self.kind {
    Shaping => true
    _ => false
  }
}

///|
pub fn sum_contributions(terms : Array[RewardTerm]) -> Double {
  let mut total = 0.0
  for term in terms {
    total = total + term.contribution()
  }
  total
}

///|
pub fn sum_raw(terms : Array[RewardTerm]) -> Double {
  let mut total = 0.0
  for term in terms {
    total = total + term.raw
  }
  total
}

///|
pub fn count_sparse_terms(terms : Array[RewardTerm]) -> Int {
  let mut count = 0
  for term in terms {
    if term.is_sparse() {
      count = count + 1
    }
  }
  count
}

///|
pub fn safe_div(
  numerator : Double,
  denominator : Double,
  epsilon : Double,
) -> Double {
  if abs_value(denominator) < epsilon {
    numerator / epsilon
  } else {
    numerator / denominator
  }
}

///|
fn mean_and_spread(
  values : Array[Double],
  epsilon : Double,
) -> (Double, Double) {
  if values.length() == 0 {
    (0.0, epsilon)
  } else {
    let mut sum = 0.0
    for value in values {
      sum = sum + value
    }
    let mean = sum / values.length().to_double()

    let mut spread_sum = 0.0
    for value in values {
      spread_sum = spread_sum + abs_value(value - mean)
    }
    let spread = spread_sum / values.length().to_double()
    let safe_spread = if spread < epsilon { epsilon } else { spread }
    (mean, safe_spread)
  }
}

///|
fn reward_values(terms : Array[RewardTerm]) -> Array[Double] {
  let values = Array::new(capacity=terms.length())
  for term in terms {
    values.push(term.contribution())
  }
  values
}

///|
fn dominant_term_name(terms : Array[RewardTerm]) -> String {
  if terms.length() == 0 {
    "none"
  } else {
    let mut best_name = terms[0].name
    let mut best_score = abs_value(terms[0].contribution())
    for term in terms[1:] {
      let score = abs_value(term.contribution())
      if score > best_score {
        best_score = score
        best_name = term.name
      }
    }
    best_name
  }
}

///|
fn shaping_share(terms : Array[RewardTerm], epsilon : Double) -> Double {
  let mut selected = 0.0
  let mut all = 0.0
  for term in terms {
    let contribution = abs_value(term.contribution())
    all = all + contribution
    if term.is_shaping() {
      selected = selected + contribution
    }
  }
  safe_div(selected, all, epsilon)
}

///|
fn penalty_share(terms : Array[RewardTerm], epsilon : Double) -> Double {
  let mut selected = 0.0
  let mut all = 0.0
  for term in terms {
    let contribution = abs_value(term.contribution())
    all = all + contribution
    if term.is_penalty() {
      selected = selected + contribution
    }
  }
  safe_div(selected, all, epsilon)
}

///|
fn normalize_total(
  weighted_total : Double,
  mode : NormalizationMode,
  mean : Double,
  spread : Double,
  abs_sum : Double,
  epsilon : Double,
) -> Double {
  match mode {
    None => weighted_total
    ScaleToAbsSum => safe_div(weighted_total, abs_sum, epsilon)
    ZScore => safe_div(weighted_total - mean, spread, epsilon)
  }
}

///|
pub fn evaluate_step(
  step : RewardStep,
  config : RewardConfig,
) -> RewardBreakdown {
  let values = reward_values(step.terms)
  let raw_total = sum_raw(step.terms)
  let weighted_total = sum_contributions(step.terms)
  let (mean, spread) = mean_and_spread(values, config.epsilon)

  let mut abs_sum = 0.0
  for value in values {
    abs_sum = abs_sum + abs_value(value)
  }

  let normalized_total = normalize_total(
    weighted_total,
    config.mode,
    mean,
    spread,
    abs_sum,
    config.epsilon,
  )
  let clipped_total = clamp(normalized_total, config.clip_min, config.clip_max)
  let sparse_terms = count_sparse_terms(step.terms)
  let term_count = step.terms.length()
  let zero_ratio = if term_count == 0 {
    0.0
  } else {
    safe_div(sparse_terms.to_double(), term_count.to_double(), config.epsilon)
  }

  RewardBreakdown::{
    step_index: step.index,
    term_count,
    raw_total,
    weighted_total,
    normalized_total,
    clipped_total,
    mean,
    spread,
    sparse_terms,
    zero_ratio,
    shaping_share: shaping_share(step.terms, config.epsilon),
    penalty_share: penalty_share(step.terms, config.epsilon),
    dominant_name: dominant_term_name(step.terms),
    terminal: step.terminal,
  }
}

///|
pub fn evaluate_trace(
  steps : Array[RewardStep],
  config : RewardConfig,
) -> (Array[RewardBreakdown], TraceSummary) {
  let breakdowns = Array::new(capacity=steps.length())
  let summary = TraceSummary::{
    step_count: 0,
    sparse_steps: 0,
    clipped_steps: 0,
    avg_zero_ratio: 0.0,
    total_raw: 0.0,
    total_weighted: 0.0,
    total_normalized: 0.0,
    total_clipped: 0.0,
    best_step: -1,
    worst_step: -1,
    best_score: -999999999.0,
    worst_score: 999999999.0,
    terminal_score: 0.0,
    reward_span: 0.0,
  }

  let mut zero_ratio_sum = 0.0
  for step in steps {
    let breakdown = evaluate_step(step, config)
    breakdowns.push(breakdown)

    summary.step_count = summary.step_count + 1
    summary.total_raw = summary.total_raw + breakdown.raw_total
    summary.total_weighted = summary.total_weighted + breakdown.weighted_total
    summary.total_normalized = summary.total_normalized +
      breakdown.normalized_total
    summary.total_clipped = summary.total_clipped + breakdown.clipped_total
    zero_ratio_sum = zero_ratio_sum + breakdown.zero_ratio

    if breakdown.zero_ratio >= 0.5 {
      summary.sparse_steps = summary.sparse_steps + 1
    }
    if breakdown.clipped_total != breakdown.normalized_total {
      summary.clipped_steps = summary.clipped_steps + 1
    }
    if breakdown.clipped_total > summary.best_score {
      summary.best_score = breakdown.clipped_total
      summary.best_step = breakdown.step_index
    }
    if breakdown.clipped_total < summary.worst_score {
      summary.worst_score = breakdown.clipped_total
      summary.worst_step = breakdown.step_index
    }
    if breakdown.terminal {
      summary.terminal_score = breakdown.clipped_total
    }
  }

  summary.avg_zero_ratio = if summary.step_count == 0 {
    0.0
  } else {
    safe_div(zero_ratio_sum, summary.step_count.to_double(), config.epsilon)
  }
  summary.reward_span = summary.best_score - summary.worst_score

  (breakdowns, summary)
}

///|
pub fn sample_terms() -> Array[RewardTerm] {
  [
    RewardTerm::{ name: "goal", raw: 1.0, weight: 1.0, kind: Base },
    RewardTerm::{ name: "progress", raw: 0.35, weight: 0.8, kind: Shaping },
    RewardTerm::{ name: "time_penalty", raw: -0.08, weight: 2.0, kind: Penalty },
  ]
}

///|
pub fn sparse_terms() -> Array[RewardTerm] {
  [
    RewardTerm::{ name: "goal", raw: 0.0, weight: 1.0, kind: Base },
    RewardTerm::{ name: "waypoint", raw: 0.0, weight: 0.75, kind: Shaping },
    RewardTerm::{ name: "collision", raw: -1.0, weight: 1.2, kind: Penalty },
  ]
}

///|
pub fn oscillating_terms() -> Array[RewardTerm] {
  [
    RewardTerm::{ name: "goal", raw: 0.55, weight: 1.0, kind: Base },
    RewardTerm::{ name: "smoothness", raw: 0.2, weight: 1.4, kind: Shaping },
    RewardTerm::{ name: "risk", raw: -0.9, weight: 0.6, kind: Penalty },
    RewardTerm::{ name: "entropy", raw: 0.1, weight: 0.2, kind: Shaping },
  ]
}

///|
pub fn sample_trace() -> Array[RewardStep] {
  sample_scenarios()[0].steps
}

///|
pub fn sample_scenarios() -> Array[RewardScenario] {
  [
    RewardScenario::{
      name: "baseline",
      steps: [
        RewardStep::{ index: 0, terms: sample_terms(), terminal: false },
        RewardStep::{ index: 1, terms: sparse_terms(), terminal: false },
        RewardStep::{ index: 2, terms: oscillating_terms(), terminal: true },
      ],
    },
    RewardScenario::{
      name: "sparse_goal",
      steps: [
        RewardStep::{ index: 0, terms: sparse_terms(), terminal: false },
        RewardStep::{ index: 1, terms: sample_terms(), terminal: false },
        RewardStep::{ index: 2, terms: sparse_terms(), terminal: true },
      ],
    },
    RewardScenario::{
      name: "control_loop",
      steps: [
        RewardStep::{ index: 0, terms: oscillating_terms(), terminal: false },
        RewardStep::{ index: 1, terms: sample_terms(), terminal: false },
        RewardStep::{ index: 2, terms: oscillating_terms(), terminal: true },
      ],
    },
  ]
}

///|
pub fn sample_configs() -> Array[RewardConfig] {
  [
    RewardConfig::{
      mode: None,
      clip_min: -10.0,
      clip_max: 10.0,
      epsilon: 0.000001,
    },
    RewardConfig::{
      mode: ScaleToAbsSum,
      clip_min: -5.0,
      clip_max: 5.0,
      epsilon: 0.000001,
    },
    RewardConfig::{
      mode: ZScore,
      clip_min: -3.0,
      clip_max: 3.0,
      epsilon: 0.000001,
    },
  ]
}
