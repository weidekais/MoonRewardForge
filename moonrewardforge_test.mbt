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
