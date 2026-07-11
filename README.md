# MoonRewardForge

MoonRewardForge is a MoonBit toolkit for modeling, normalizing, clipping, and debugging reward signals in reinforcement-learning style workflows.

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

## License

Apache-2.0
