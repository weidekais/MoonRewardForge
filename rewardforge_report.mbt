///|
pub fn render_breakdown(breakdown : RewardBreakdown) -> String {
  let mut text = ""
  text = text + "step \{breakdown.step_index}\n"
  text = text +
    "  terms: \{breakdown.term_count}  terminal: \{breakdown.terminal}\n"
  text = text + "  raw: \{breakdown.raw_total}\n"
  text = text + "  weighted: \{breakdown.weighted_total}\n"
  text = text + "  normalized: \{breakdown.normalized_total}\n"
  text = text + "  clipped: \{breakdown.clipped_total}\n"
  text = text + "  mean: \{breakdown.mean}  spread: \{breakdown.spread}\n"
  text = text +
    "  sparse_terms: \{breakdown.sparse_terms}  zero_ratio: \{breakdown.zero_ratio}\n"
  text = text +
    "  shaping_share: \{breakdown.shaping_share}  penalty_share: \{breakdown.penalty_share}\n"
  text = text + "  dominant: \{breakdown.dominant_name}\n"
  text
}

///|
pub fn render_summary(summary : TraceSummary) -> String {
  let mut text = ""
  text = text + "trace summary\n"
  text = text + "  steps: \{summary.step_count}\n"
  text = text + "  sparse_steps: \{summary.sparse_steps}\n"
  text = text + "  clipped_steps: \{summary.clipped_steps}\n"
  text = text + "  avg_zero_ratio: \{summary.avg_zero_ratio}\n"
  text = text + "  total_raw: \{summary.total_raw}\n"
  text = text + "  total_weighted: \{summary.total_weighted}\n"
  text = text + "  total_normalized: \{summary.total_normalized}\n"
  text = text + "  total_clipped: \{summary.total_clipped}\n"
  text = text + "  best_step: \{summary.best_step} (\{summary.best_score})\n"
  text = text + "  worst_step: \{summary.worst_step} (\{summary.worst_score})\n"
  text
}

///|
pub fn render_trace(steps : Array[RewardStep], config : RewardConfig) -> String {
  let (breakdowns, summary) = evaluate_trace(steps, config)
  let mut text = ""
  text = text + "MoonRewardForge report\n"
  text = text + "mode: \{config.mode.label()}\n"
  text = text + "clip: [\{config.clip_min}, \{config.clip_max}]\n"
  text = text + "\n"
  for breakdown in breakdowns {
    text = text + render_breakdown(breakdown)
    text = text + "\n"
  }
  text = text + render_summary(summary)
  text
}

///|
pub fn render_scenario_matrix() -> String {
  let traces = sample_trace()
  let configs = sample_configs()
  let mut text = ""
  for config in configs {
    text = text + "=== \{config.mode.label()} ===\n"
    text = text + render_trace(traces, config)
    text = text + "\n\n"
  }
  text
}
