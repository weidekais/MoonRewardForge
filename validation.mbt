///|
/// Stable preflight diagnostics for callers that need to reject bad input
/// without triggering the fail-fast evaluation API.
pub(all) enum ValidationCode {
  EmptyTrace
  EmptyStep
  InvalidClipRange
  InvalidEpsilon
  InvalidSparseThreshold
} derive(Debug)

///|
pub(all) struct ValidationIssue {
  code : ValidationCode
  step_index : Int
  message : String
} derive(Debug)

///|
pub fn ValidationCode::label(self : Self) -> String {
  match self {
    EmptyTrace => "EMPTY_TRACE"
    EmptyStep => "EMPTY_STEP"
    InvalidClipRange => "INVALID_CLIP_RANGE"
    InvalidEpsilon => "INVALID_EPSILON"
    InvalidSparseThreshold => "INVALID_SPARSE_THRESHOLD"
  }
}

///|
pub fn ValidationIssue::render(self : Self) -> String {
  let location = if self.step_index < 0 {
    "trace"
  } else {
    "step \{self.step_index}"
  }
  "[\{self.code.label()}] \{location}: \{self.message}"
}

///|
pub fn validate_config_issues(config : RewardConfig) -> Array[ValidationIssue] {
  let issues = Array::new()
  if config.clip_min > config.clip_max {
    issues.push(ValidationIssue::{
      code: InvalidClipRange,
      step_index: -1,
      message: "clip_min must not exceed clip_max",
    })
  }
  if config.epsilon <= 0.0 {
    issues.push(ValidationIssue::{
      code: InvalidEpsilon,
      step_index: -1,
      message: "epsilon must be greater than zero",
    })
  }
  issues
}

///|
pub fn validate_trace_issues(
  steps : Array[RewardStep],
  config : RewardConfig,
  sparse_threshold : Double,
) -> Array[ValidationIssue] {
  let issues = validate_config_issues(config)
  if steps.length() == 0 {
    issues.push(ValidationIssue::{
      code: EmptyTrace,
      step_index: -1,
      message: "at least one reward step is required",
    })
  }
  if sparse_threshold < 0.0 || sparse_threshold > 1.0 {
    issues.push(ValidationIssue::{
      code: InvalidSparseThreshold,
      step_index: -1,
      message: "sparse threshold must be between zero and one",
    })
  }
  for step in steps {
    if step.terms.length() == 0 {
      issues.push(ValidationIssue::{
        code: EmptyStep,
        step_index: step.index,
        message: "a reward step must contain at least one term",
      })
    }
  }
  issues
}

///|
pub fn is_valid_trace(
  steps : Array[RewardStep],
  config : RewardConfig,
  sparse_threshold : Double,
) -> Bool {
  validate_trace_issues(steps, config, sparse_threshold).length() == 0
}

///|
pub fn render_validation_issues(issues : Array[ValidationIssue]) -> String {
  if issues.length() == 0 {
    "Input validation passed."
  } else {
    let mut text = "Input validation failed\n"
    for issue in issues {
      text = text + "- " + issue.render() + "\n"
    }
    text
  }
}
