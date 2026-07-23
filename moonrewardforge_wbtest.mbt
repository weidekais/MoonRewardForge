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

///|
test {
  // test boundary config validation
  let config = RewardConfig::{
    mode: None,
    clip_min: -5.0,
    clip_max: 5.0,
    epsilon: 0.000001,
  }
  validate_config(config)
  @test.assert_eq(config.epsilon > 0.0, true)
}
