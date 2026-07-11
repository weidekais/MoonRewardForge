///|
test {
  let step = RewardStep::{ index: 7, terms: sample_terms(), terminal: true }
  let breakdown = evaluate_step(step, default_config())

  @test.assert_eq(breakdown.step_index, 7)
  @test.assert_eq(breakdown.dominant_name == "goal", true)
}

///|
test {
  @test.assert_eq(clamp(8.0, -2.0, 4.0), 4.0)
  @test.assert_eq(safe_div(3.0, 0.0, 0.5), 6.0)
}
