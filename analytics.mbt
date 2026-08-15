///|
/// A stable, machine-readable severity used by integration quality gates.
pub(all) enum AlertLevel {
  Info
  Warning
  Critical
} derive(Debug)

///|
/// A diagnostic produced from one evaluated reward step.
pub(all) struct RewardAlert {
  step_index : Int
  level : AlertLevel
  code : String
  message : String
  value : Double
} derive(Debug)

///|
pub fn AlertLevel::label(self : Self) -> String {
  match self {
    Info => "info"
    Warning => "warning"
    Critical => "critical"
  }
}

///|
pub fn RewardAlert::render(self : Self) -> String {
  "[\{self.level.label()}] \{self.code} step=\{self.step_index}: \{self.message} (\{self.value})"
}

///|
pub fn inspect_breakdown(
  breakdown : RewardBreakdown,
  sparse_threshold : Double,
  clip_threshold : Double,
) -> Array[RewardAlert] {
  let alerts = Array::new()
  if breakdown.zero_ratio >= sparse_threshold {
    alerts.push(RewardAlert::{
      step_index: breakdown.step_index,
      level: if breakdown.zero_ratio >= 0.8 {
        Critical
      } else {
        Warning
      },
      code: "SPARSE_SIGNAL",
      message: "too many reward terms contributed zero",
      value: breakdown.zero_ratio,
    })
  }
  if breakdown.clipped_total == clip_threshold ||
    breakdown.clipped_total == -clip_threshold {
    alerts.push(RewardAlert::{
      step_index: breakdown.step_index,
      level: Warning,
      code: "CLIPPED_SIGNAL",
      message: "normalized reward reached the configured clip boundary",
      value: breakdown.clipped_total,
    })
  }
  if breakdown.penalty_share >= 0.8 {
    alerts.push(RewardAlert::{
      step_index: breakdown.step_index,
      level: Warning,
      code: "PENALTY_DOMINATED",
      message: "penalty terms dominate the absolute contribution",
      value: breakdown.penalty_share,
    })
  }
  if breakdown.shaping_share >= 0.8 {
    alerts.push(RewardAlert::{
      step_index: breakdown.step_index,
      level: Info,
      code: "SHAPING_DOMINATED",
      message: "shaping terms dominate the absolute contribution",
      value: breakdown.shaping_share,
    })
  }
  alerts
}

///|
pub fn audit_trace(
  steps : Array[RewardStep],
  config : RewardConfig,
  sparse_threshold : Double,
) -> Array[RewardAlert] {
  if sparse_threshold < 0.0 || sparse_threshold > 1.0 {
    panic()
  }
  let (breakdowns, _) = evaluate_trace(steps, config)
  let alerts = Array::new()
  for breakdown in breakdowns {
    let step_alerts = inspect_breakdown(
      breakdown,
      sparse_threshold,
      config.clip_max,
    )
    for alert in step_alerts {
      alerts.push(alert)
    }
  }
  alerts
}

///|
pub fn render_alerts(alerts : Array[RewardAlert]) -> String {
  if alerts.length() == 0 {
    "No reward-quality alerts."
  } else {
    let mut text = "Reward quality alerts\n"
    for alert in alerts {
      text = text + "- " + alert.render() + "\n"
    }
    text
  }
}

///|
pub fn compare_traces(
  left : Array[RewardStep],
  right : Array[RewardStep],
  config : RewardConfig,
) -> (TraceSummary, TraceSummary, Double) {
  let (_, left_summary) = evaluate_trace(left, config)
  let (_, right_summary) = evaluate_trace(right, config)
  let delta = right_summary.total_clipped - left_summary.total_clipped
  (left_summary, right_summary, delta)
}
