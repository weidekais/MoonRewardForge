# OSC2026 Self-Check

Use this checklist before submission.

## Repository

- Public repository is reachable.
- Default branch is `master`.
- Repository contains a clear `README.md`.
- Repository contains an OSI-approved `LICENSE`.
- There is a source note file such as `SOURCE.md`.

## MoonBit

- MoonBit is the primary implementation language.
- `moon check` passes.
- `moon test` passes.
- `moon run cmd/main` produces a readable demo report.
- Generated interface files are up to date.
- moon check --deny-warn passes.
- moon test --deny-warn passes.
- Deterministic benchmark cases cover dense, sparse, penalty-heavy, and
  oscillating reward behavior.

## History

- Commit history shows incremental, meaningful progress.
- The author and committer are the same person.
- No virtual contributors or stray authors appear in `git log`.

## Content

- The project explains what it does and what it does not do.
- The source scope is clear.
- The project can grow into a broader tool without changing its core model.
- Runtime quality alerts are documented and exercised by tests.

## Final acceptance evidence to capture before submission

- Copy the exact passing CI run URL for the default branch.
- Verify the package namespace in moon.mod matches the publishing account.
- Verify the published moon.mod version and package name on mooncakes.io.
- Verify GitHub and GitLink default branches contain the same reviewed commit.
- Keep the final repository free of _build, caches, tokens, and local reports.
