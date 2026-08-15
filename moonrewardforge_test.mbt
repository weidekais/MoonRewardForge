///|
test {
  let (breakdowns, summary) = @moonrewardforge.evaluate_trace(
    @moonrewardforge.sample_trace(),
    @moonrewardforge.default_config(),
  )

  @test.assert_eq(breakdowns.length(), 3)
  @test.assert_eq(summary.step_count, 3)
  @test.assert_eq(summary.total_clipped <= 5.0, true)
  @test.assert_eq(summary.reward_span >= 0.0, true)
}

///|
test {
  let report = @moonrewardforge.render_trace(
    @moonrewardforge.sample_trace(),
    @moonrewardforge.default_config(),
  )

  @test.assert_eq(report.contains("MoonRewardForge report"), true)
  @test.assert_eq(report.contains("trace summary"), true)
}

///|
test {
  let matrix = @moonrewardforge.render_scenario_matrix()

  @test.assert_eq(matrix.contains("scenario: baseline"), true)
  @test.assert_eq(matrix.contains("scenario: control_loop"), true)
}

///|
test {
  // Edge case: test with single zero-contribution term
  let steps = [
    @moonrewardforge.RewardStep::{
      index: 0,
      terms: [
        @moonrewardforge.RewardTerm::{
          name: "zero",
          raw: 0.0,
          weight: 0.0,
          kind: Base,
        },
      ],
      terminal: true,
    },
  ]
  let (breakdowns, summary) = @moonrewardforge.evaluate_trace(
    steps,
    @moonrewardforge.default_config(),
  )
  @test.assert_eq(breakdowns.length(), 1)
  @test.assert_eq(summary.sparse_steps, 1)
  @test.assert_eq(summary.total_clipped, 0.0)
}

///|
test {
  let alerts = @moonrewardforge.audit_trace(
    @moonrewardforge.sample_trace(),
    @moonrewardforge.default_config(),
    0.5,
  )
  @test.assert_eq(alerts.length() > 0, true)
  @test.assert_eq(
    @moonrewardforge.render_alerts(alerts).contains("SPARSE_SIGNAL"),
    true,
  )
}

///|
test {
  let cases = @moonrewardforge.benchmark_cases()
  let summaries = @moonrewardforge.run_benchmarks(
    @moonrewardforge.default_config(),
  )
  @test.assert_eq(cases.length(), 5)
  @test.assert_eq(summaries.length(), cases.length())
  @test.assert_eq(
    @moonrewardforge.benchmark_report(@moonrewardforge.default_config()).contains(
      "dense-progress",
    ),
    true,
  )
}

///|
test {
  let (left, right, delta) = @moonrewardforge.compare_traces(
    @moonrewardforge.sample_trace(),
    @moonrewardforge.sample_scenarios()[1].steps,
    @moonrewardforge.default_config(),
  )
  @test.assert_eq(left.step_count, 3)
  @test.assert_eq(right.step_count, 3)
  @test.assert_eq(delta < 0.0, true)
}

///|
test {
  let issues = @moonrewardforge.validate_trace_issues(
    [],
    @moonrewardforge.default_config(),
    0.5,
  )
  @test.assert_eq(issues.length(), 1)
  @test.assert_eq(
    @moonrewardforge.render_validation_issues(issues).contains("EMPTY_TRACE"),
    true,
  )
  @test.assert_eq(
    @moonrewardforge.is_valid_trace(
      @moonrewardforge.sample_trace(),
      @moonrewardforge.default_config(),
      0.5,
    ),
    true,
  )
  let empty_step = @moonrewardforge.RewardStep::{
    index: 9,
    terms: [],
    terminal: false,
  }
  let step_issues = @moonrewardforge.validate_trace_issues(
    [empty_step],
    @moonrewardforge.default_config(),
    0.5,
  )
  @test.assert_eq(step_issues.length(), 1)
  @test.assert_eq(
    @moonrewardforge.render_validation_issues(step_issues).contains(
      "EMPTY_STEP",
    ),
    true,
  )
}

///|
test {
  let invalid = @moonrewardforge.RewardConfig::{
    mode: @moonrewardforge.NormalizationMode::None,
    clip_min: 2.0,
    clip_max: -2.0,
    epsilon: 0.0,
  }
  let issues = @moonrewardforge.validate_trace_issues(
    @moonrewardforge.sample_trace(),
    invalid,
    1.5,
  )
  @test.assert_eq(issues.length(), 3)
  @test.assert_eq(
    @moonrewardforge.render_validation_issues(issues).contains(
      "INVALID_CLIP_RANGE",
    ),
    true,
  )
  @test.assert_eq(
    @moonrewardforge.render_validation_issues(issues).contains(
      "INVALID_EPSILON",
    ),
    true,
  )
}

///|
test {
  let clipped_config = @moonrewardforge.RewardConfig::{
    mode: @moonrewardforge.NormalizationMode::None,
    clip_min: -1.0,
    clip_max: 1.0,
    epsilon: 0.000001,
  }
  let step = @moonrewardforge.RewardStep::{
    index: 4,
    terms: [
      @moonrewardforge.RewardTerm::{
        name: "large_goal",
        raw: 10.0,
        weight: 1.0,
        kind: @moonrewardforge.RewardKind::Base,
      },
    ],
    terminal: true,
  }
  let breakdown = @moonrewardforge.evaluate_step(step, clipped_config)
  @test.assert_eq(breakdown.normalized_total, 10.0)
  @test.assert_eq(breakdown.clipped_total, 1.0)
}

///|
test {
  let terms = [
    @moonrewardforge.RewardTerm::{
      name: "positive",
      raw: 1.0,
      weight: 1.0,
      kind: @moonrewardforge.RewardKind::Base,
    },
    @moonrewardforge.RewardTerm::{
      name: "negative",
      raw: -1.0,
      weight: 1.0,
      kind: @moonrewardforge.RewardKind::Penalty,
    },
  ]
  let step = @moonrewardforge.RewardStep::{ index: 5, terms, terminal: false }
  let scale_config = @moonrewardforge.RewardConfig::{
    mode: @moonrewardforge.NormalizationMode::ScaleToAbsSum,
    clip_min: -5.0,
    clip_max: 5.0,
    epsilon: 0.000001,
  }
  let zscore_config = @moonrewardforge.RewardConfig::{
    mode: @moonrewardforge.NormalizationMode::ZScore,
    clip_min: -3.0,
    clip_max: 3.0,
    epsilon: 0.000001,
  }
  let scaled = @moonrewardforge.evaluate_step(step, scale_config)
  let zscored = @moonrewardforge.evaluate_step(step, zscore_config)
  @test.assert_eq(scaled.normalized_total, 0.0)
  @test.assert_eq(scaled.clipped_total, 0.0)
  @test.assert_eq(zscored.normalized_total, 0.0)
  @test.assert_eq(zscored.clipped_total, 0.0)
}

///|
test {
  let catalog = @moonrewardforge.benchmark_catalog()
  let summaries = @moonrewardforge.run_catalog_benchmarks(
    @moonrewardforge.default_config(),
  )
  @test.assert_eq(catalog.length(), 120)
  @test.assert_eq(summaries.length(), 120)
  @test.assert_eq(
    @moonrewardforge.catalog_report(@moonrewardforge.default_config()).contains(
      "cases: 120",
    ),
    true,
  )
}
