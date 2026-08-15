///|
/// A deterministic benchmark case for regression testing and demonstrations.
pub(all) struct BenchmarkCase {
  name : String
  scenario : RewardScenario
  expected_min_total : Double
  expected_max_total : Double
} derive(Debug)

///|
pub fn make_benchmark_case(
  name : String,
  steps : Array[RewardStep],
  expected_min_total : Double,
  expected_max_total : Double,
) -> BenchmarkCase {
  if steps.length() == 0 || expected_min_total > expected_max_total {
    panic()
  }
  BenchmarkCase::{
    name,
    scenario: RewardScenario::{ name, steps },
    expected_min_total,
    expected_max_total,
  }
}

///|
pub fn benchmark_cases() -> Array[BenchmarkCase] {
  let cases = Array::new()
  cases.push(
    make_benchmark_case("baseline", sample_scenarios()[0].steps, -10.0, 10.0),
  )
  cases.push(
    make_benchmark_case("sparse-goal", sample_scenarios()[1].steps, -10.0, 10.0),
  )
  cases.push(
    make_benchmark_case(
      "control-loop",
      sample_scenarios()[2].steps,
      -10.0,
      10.0,
    ),
  )
  let dense = [
    RewardStep::{ index: 0, terms: sample_terms(), terminal: false },
    RewardStep::{ index: 1, terms: oscillating_terms(), terminal: false },
    RewardStep::{ index: 2, terms: sample_terms(), terminal: true },
  ]
  cases.push(make_benchmark_case("dense-progress", dense, -10.0, 10.0))
  let failure = [
    RewardStep::{ index: 0, terms: sparse_terms(), terminal: false },
    RewardStep::{ index: 1, terms: sparse_terms(), terminal: true },
  ]
  cases.push(make_benchmark_case("collision-recovery", failure, -10.0, 10.0))
  cases
}

///|
pub fn run_benchmarks(config : RewardConfig) -> Array[TraceSummary] {
  let cases = benchmark_cases()
  let results = Array::new(capacity=cases.length())
  for case in cases {
    let (_, summary) = evaluate_trace(case.scenario.steps, config)
    if summary.total_clipped < case.expected_min_total ||
      summary.total_clipped > case.expected_max_total {
      panic()
    }
    results.push(summary)
  }
  results
}

///|
pub fn benchmark_report(config : RewardConfig) -> String {
  let cases = benchmark_cases()
  let summaries = run_benchmarks(config)
  let mut text = "Benchmark report (\{config.mode.label()})\n"
  for i, case in cases {
    let summary = summaries[i]
    text = text +
      "- \{case.name}: total=\{summary.total_clipped}, span=\{summary.reward_span}, sparse=\{summary.sparse_steps}\n"
  }
  text
}
