# MoonRewardForge

MoonRewardForge is a MoonBit toolkit for modeling, normalizing, clipping, and debugging reward signals in reinforcement-learning style workflows.

Repository links:

- GitLink: <https://gitlink.org.cn/wdkwdk89/moonrewardforge>
- GitHub: <https://github.com/weidekais/MoonRewardForge>

It focuses on four practical questions:

1. How much reward comes from the base objective, shaping terms, and penalties?
2. Is the signal too sparse to learn from reliably?
3. Is clipping hiding useful signal?
4. How do different normalization modes change the final score?

## What it does

- Composes reward terms into a per-step breakdown.
- Computes trace-level totals and sparsity ratios.
- Compares `None`, `ScaleToAbsSum`, and `ZScore` normalization modes.
- Renders a plain-text report that is easy to inspect in CI or from the terminal.
- Ships with a small demo scenario matrix so the project runs out of the box.

## Why this topic

Reward shaping is a mature engineering problem in RL systems, and it has room to grow into a larger debugging workflow without becoming too narrow.

This project is intentionally framed as a reusable base:

- today it is a scoring and reporting library,
- later it can grow into log ingestion, YAML/JSON config parsing, visual dashboards, and experiment comparisons,
- and it can be reused for robotics, game AI, recommendation, or agent-evaluation pipelines.

## Repository layout

- `moonrewardforge.mbt` core reward model and analysis routines
- `rewardforge_report.mbt` report rendering helpers
- `cmd/main/main.mbt` runnable demo
- `moonrewardforge_test.mbt` blackbox tests
- `moonrewardforge_wbtest.mbt` whitebox tests
- `.github/workflows/moon-ci.yml` minimal CI
- `LICENSE` Apache-2.0
- `docs/OSC2026_CHECKLIST.md` submission self-check

## Installation

Add this library to your project by running:

```bash
moon add weidekais/moonrewardforge
```

## Core API Example

Here is a quick example of how to evaluate a simple trace and print the summary:

```moonbit
import weidekais/moonrewardforge


fn main {
  let step = @moonrewardforge.RewardStep::{
    index: 0,
    terms: [
      @moonrewardforge.RewardTerm::{ name: "goal", raw: 1.0, weight: 1.0, kind: Base },
      @moonrewardforge.RewardTerm::{ name: "time_penalty", raw: -0.1, weight: 1.0, kind: Penalty },
    ],
    terminal: true,
  }
  let trace = [step]
  let config = @moonrewardforge.default_config()
  let (_breakdowns, summary) = @moonrewardforge.evaluate_trace(trace, config)
  
  println("Reward span: \{summary.reward_span}")
  println("Final clipped total: \{summary.total_clipped}")
}
```

## Run locally

```bash
moon check
moon test
moon run cmd/main
```

## Source and scope note

This repository is an original implementation.

The only external references used for design were:

- the MoonBit language and toolchain documentation,
- the OSC2026 submission guide,
- and general reward shaping literature for the underlying RL concepts.

No upstream project was ported line-for-line.
No other contributor should be introduced when you submit the project.

## License

Apache-2.0
