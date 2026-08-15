///|
/// A reproducible catalog of domain-neutral stress samples.
/// Values are intentionally varied to exercise sign, sparsity, and terminal
/// behavior without depending on random number generators.
pub fn benchmark_catalog() -> Array[BenchmarkCase] {
  let cases = Array::new(capacity=120)
  cases.push(
    make_benchmark_case(
      "catalog-001",
      [
        RewardStep::{
          index: 1,
          terms: [
            RewardTerm::{
              name: "objective",
              raw: -0.92,
              weight: 1.0,
              kind: Base,
            },
            RewardTerm::{
              name: "progress",
              raw: -0.33,
              weight: 0.8,
              kind: Shaping,
            },
            RewardTerm::{ name: "risk", raw: -0.14, weight: 1.0, kind: Penalty },
          ],
          terminal: false,
        },
      ],
      -10.0,
      10.0,
    ),
  )
  cases.push(
    make_benchmark_case(
      "catalog-002",
      [
        RewardStep::{
          index: 2,
          terms: [
            RewardTerm::{
              name: "objective",
              raw: -0.69,
              weight: 1.0,
              kind: Base,
            },
            RewardTerm::{
              name: "progress",
              raw: -0.22,
              weight: 0.8,
              kind: Shaping,
            },
            RewardTerm::{ name: "risk", raw: -0.21, weight: 1.0, kind: Penalty },
          ],
          terminal: false,
        },
      ],
      -10.0,
      10.0,
    ),
  )
  cases.push(
    make_benchmark_case(
      "catalog-003",
      [
        RewardStep::{
          index: 3,
          terms: [
            RewardTerm::{
              name: "objective",
              raw: -0.46,
              weight: 1.0,
              kind: Base,
            },
            RewardTerm::{
              name: "progress",
              raw: -0.11,
              weight: 0.8,
              kind: Shaping,
            },
            RewardTerm::{ name: "risk", raw: -0.28, weight: 1.0, kind: Penalty },
          ],
          terminal: false,
        },
      ],
      -10.0,
      10.0,
    ),
  )
  cases.push(
    make_benchmark_case(
      "catalog-004",
      [
        RewardStep::{
          index: 4,
          terms: [
            RewardTerm::{
              name: "objective",
              raw: -0.23,
              weight: 1.0,
              kind: Base,
            },
            RewardTerm::{
              name: "progress",
              raw: 0.00,
              weight: 0.8,
              kind: Shaping,
            },
            RewardTerm::{ name: "risk", raw: -0.35, weight: 1.0, kind: Penalty },
          ],
          terminal: false,
        },
      ],
      -10.0,
      10.0,
    ),
  )
  cases.push(
    make_benchmark_case(
      "catalog-005",
      [
        RewardStep::{
          index: 5,
          terms: [
            RewardTerm::{
              name: "objective",
              raw: 0.00,
              weight: 1.0,
              kind: Base,
            },
            RewardTerm::{
              name: "progress",
              raw: 0.11,
              weight: 0.8,
              kind: Shaping,
            },
            RewardTerm::{ name: "risk", raw: -0.42, weight: 1.0, kind: Penalty },
          ],
          terminal: true,
        },
      ],
      -10.0,
      10.0,
    ),
  )
  cases.push(
    make_benchmark_case(
      "catalog-006",
      [
        RewardStep::{
          index: 6,
          terms: [
            RewardTerm::{
              name: "objective",
              raw: 0.23,
              weight: 1.0,
              kind: Base,
            },
            RewardTerm::{
              name: "progress",
              raw: 0.22,
              weight: 0.8,
              kind: Shaping,
            },
            RewardTerm::{ name: "risk", raw: -0.49, weight: 1.0, kind: Penalty },
          ],
          terminal: false,
        },
      ],
      -10.0,
      10.0,
    ),
  )
  cases.push(
    make_benchmark_case(
      "catalog-007",
      [
        RewardStep::{
          index: 7,
          terms: [
            RewardTerm::{
              name: "objective",
              raw: 0.46,
              weight: 1.0,
              kind: Base,
            },
            RewardTerm::{
              name: "progress",
              raw: 0.33,
              weight: 0.8,
              kind: Shaping,
            },
            RewardTerm::{ name: "risk", raw: -0.56, weight: 1.0, kind: Penalty },
          ],
          terminal: false,
        },
      ],
      -10.0,
      10.0,
    ),
  )
  cases.push(
    make_benchmark_case(
      "catalog-008",
      [
        RewardStep::{
          index: 8,
          terms: [
            RewardTerm::{
              name: "objective",
              raw: 0.69,
              weight: 1.0,
              kind: Base,
            },
            RewardTerm::{
              name: "progress",
              raw: 0.44,
              weight: 0.8,
              kind: Shaping,
            },
            RewardTerm::{ name: "risk", raw: -0.63, weight: 1.0, kind: Penalty },
          ],
          terminal: false,
        },
      ],
      -10.0,
      10.0,
    ),
  )
  cases.push(
    make_benchmark_case(
      "catalog-009",
      [
        RewardStep::{
          index: 9,
          terms: [
            RewardTerm::{
              name: "objective",
              raw: 0.92,
              weight: 1.0,
              kind: Base,
            },
            RewardTerm::{
              name: "progress",
              raw: -0.44,
              weight: 0.8,
              kind: Shaping,
            },
            RewardTerm::{ name: "risk", raw: -0.70, weight: 1.0, kind: Penalty },
          ],
          terminal: false,
        },
      ],
      -10.0,
      10.0,
    ),
  )
  cases.push(
    make_benchmark_case(
      "catalog-010",
      [
        RewardStep::{
          index: 10,
          terms: [
            RewardTerm::{
              name: "objective",
              raw: 1.15,
              weight: 1.0,
              kind: Base,
            },
            RewardTerm::{
              name: "progress",
              raw: -0.33,
              weight: 0.8,
              kind: Shaping,
            },
            RewardTerm::{ name: "risk", raw: -0.77, weight: 1.0, kind: Penalty },
          ],
          terminal: true,
        },
      ],
      -10.0,
      10.0,
    ),
  )
  cases.push(
    make_benchmark_case(
      "catalog-011",
      [
        RewardStep::{
          index: 11,
          terms: [
            RewardTerm::{
              name: "objective",
              raw: -1.15,
              weight: 1.0,
              kind: Base,
            },
            RewardTerm::{
              name: "progress",
              raw: -0.22,
              weight: 0.8,
              kind: Shaping,
            },
            RewardTerm::{ name: "risk", raw: -0.84, weight: 1.0, kind: Penalty },
          ],
          terminal: false,
        },
      ],
      -10.0,
      10.0,
    ),
  )
  cases.push(
    make_benchmark_case(
      "catalog-012",
      [
        RewardStep::{
          index: 12,
          terms: [
            RewardTerm::{
              name: "objective",
              raw: -0.92,
              weight: 1.0,
              kind: Base,
            },
            RewardTerm::{
              name: "progress",
              raw: -0.11,
              weight: 0.8,
              kind: Shaping,
            },
            RewardTerm::{ name: "risk", raw: -0.91, weight: 1.0, kind: Penalty },
          ],
          terminal: false,
        },
      ],
      -10.0,
      10.0,
    ),
  )
  cases.push(
    make_benchmark_case(
      "catalog-013",
      [
        RewardStep::{
          index: 13,
          terms: [
            RewardTerm::{
              name: "objective",
              raw: -0.69,
              weight: 1.0,
              kind: Base,
            },
            RewardTerm::{
              name: "progress",
              raw: 0.00,
              weight: 0.8,
              kind: Shaping,
            },
            RewardTerm::{ name: "risk", raw: -0.07, weight: 1.0, kind: Penalty },
          ],
          terminal: false,
        },
      ],
      -10.0,
      10.0,
    ),
  )
  cases.push(
    make_benchmark_case(
      "catalog-014",
      [
        RewardStep::{
          index: 14,
          terms: [
            RewardTerm::{
              name: "objective",
              raw: -0.46,
              weight: 1.0,
              kind: Base,
            },
            RewardTerm::{
              name: "progress",
              raw: 0.11,
              weight: 0.8,
              kind: Shaping,
            },
            RewardTerm::{ name: "risk", raw: -0.14, weight: 1.0, kind: Penalty },
          ],
          terminal: false,
        },
      ],
      -10.0,
      10.0,
    ),
  )
  cases.push(
    make_benchmark_case(
      "catalog-015",
      [
        RewardStep::{
          index: 15,
          terms: [
            RewardTerm::{
              name: "objective",
              raw: -0.23,
              weight: 1.0,
              kind: Base,
            },
            RewardTerm::{
              name: "progress",
              raw: 0.22,
              weight: 0.8,
              kind: Shaping,
            },
            RewardTerm::{ name: "risk", raw: -0.21, weight: 1.0, kind: Penalty },
          ],
          terminal: true,
        },
      ],
      -10.0,
      10.0,
    ),
  )
  cases.push(
    make_benchmark_case(
      "catalog-016",
      [
        RewardStep::{
          index: 16,
          terms: [
            RewardTerm::{
              name: "objective",
              raw: 0.00,
              weight: 1.0,
              kind: Base,
            },
            RewardTerm::{
              name: "progress",
              raw: 0.33,
              weight: 0.8,
              kind: Shaping,
            },
            RewardTerm::{ name: "risk", raw: -0.28, weight: 1.0, kind: Penalty },
          ],
          terminal: false,
        },
      ],
      -10.0,
      10.0,
    ),
  )
  cases.push(
    make_benchmark_case(
      "catalog-017",
      [
        RewardStep::{
          index: 17,
          terms: [
            RewardTerm::{
              name: "objective",
              raw: 0.23,
              weight: 1.0,
              kind: Base,
            },
            RewardTerm::{
              name: "progress",
              raw: 0.44,
              weight: 0.8,
              kind: Shaping,
            },
            RewardTerm::{ name: "risk", raw: -0.35, weight: 1.0, kind: Penalty },
          ],
          terminal: false,
        },
      ],
      -10.0,
      10.0,
    ),
  )
  cases.push(
    make_benchmark_case(
      "catalog-018",
      [
        RewardStep::{
          index: 18,
          terms: [
            RewardTerm::{
              name: "objective",
              raw: 0.46,
              weight: 1.0,
              kind: Base,
            },
            RewardTerm::{
              name: "progress",
              raw: -0.44,
              weight: 0.8,
              kind: Shaping,
            },
            RewardTerm::{ name: "risk", raw: -0.42, weight: 1.0, kind: Penalty },
          ],
          terminal: false,
        },
      ],
      -10.0,
      10.0,
    ),
  )
  cases.push(
    make_benchmark_case(
      "catalog-019",
      [
        RewardStep::{
          index: 19,
          terms: [
            RewardTerm::{
              name: "objective",
              raw: 0.69,
              weight: 1.0,
              kind: Base,
            },
            RewardTerm::{
              name: "progress",
              raw: -0.33,
              weight: 0.8,
              kind: Shaping,
            },
            RewardTerm::{ name: "risk", raw: -0.49, weight: 1.0, kind: Penalty },
          ],
          terminal: false,
        },
      ],
      -10.0,
      10.0,
    ),
  )
  cases.push(
    make_benchmark_case(
      "catalog-020",
      [
        RewardStep::{
          index: 20,
          terms: [
            RewardTerm::{
              name: "objective",
              raw: 0.92,
              weight: 1.0,
              kind: Base,
            },
            RewardTerm::{
              name: "progress",
              raw: -0.22,
              weight: 0.8,
              kind: Shaping,
            },
            RewardTerm::{ name: "risk", raw: -0.56, weight: 1.0, kind: Penalty },
          ],
          terminal: true,
        },
      ],
      -10.0,
      10.0,
    ),
  )
  cases.push(
    make_benchmark_case(
      "catalog-021",
      [
        RewardStep::{
          index: 21,
          terms: [
            RewardTerm::{
              name: "objective",
              raw: 1.15,
              weight: 1.0,
              kind: Base,
            },
            RewardTerm::{
              name: "progress",
              raw: -0.11,
              weight: 0.8,
              kind: Shaping,
            },
            RewardTerm::{ name: "risk", raw: -0.63, weight: 1.0, kind: Penalty },
          ],
          terminal: false,
        },
      ],
      -10.0,
      10.0,
    ),
  )
  cases.push(
    make_benchmark_case(
      "catalog-022",
      [
        RewardStep::{
          index: 22,
          terms: [
            RewardTerm::{
              name: "objective",
              raw: -1.15,
              weight: 1.0,
              kind: Base,
            },
            RewardTerm::{
              name: "progress",
              raw: 0.00,
              weight: 0.8,
              kind: Shaping,
            },
            RewardTerm::{ name: "risk", raw: -0.70, weight: 1.0, kind: Penalty },
          ],
          terminal: false,
        },
      ],
      -10.0,
      10.0,
    ),
  )
  cases.push(
    make_benchmark_case(
      "catalog-023",
      [
        RewardStep::{
          index: 23,
          terms: [
            RewardTerm::{
              name: "objective",
              raw: -0.92,
              weight: 1.0,
              kind: Base,
            },
            RewardTerm::{
              name: "progress",
              raw: 0.11,
              weight: 0.8,
              kind: Shaping,
            },
            RewardTerm::{ name: "risk", raw: -0.77, weight: 1.0, kind: Penalty },
          ],
          terminal: false,
        },
      ],
      -10.0,
      10.0,
    ),
  )
  cases.push(
    make_benchmark_case(
      "catalog-024",
      [
        RewardStep::{
          index: 24,
          terms: [
            RewardTerm::{
              name: "objective",
              raw: -0.69,
              weight: 1.0,
              kind: Base,
            },
            RewardTerm::{
              name: "progress",
              raw: 0.22,
              weight: 0.8,
              kind: Shaping,
            },
            RewardTerm::{ name: "risk", raw: -0.84, weight: 1.0, kind: Penalty },
          ],
          terminal: false,
        },
      ],
      -10.0,
      10.0,
    ),
  )
  cases.push(
    make_benchmark_case(
      "catalog-025",
      [
        RewardStep::{
          index: 25,
          terms: [
            RewardTerm::{
              name: "objective",
              raw: -0.46,
              weight: 1.0,
              kind: Base,
            },
            RewardTerm::{
              name: "progress",
              raw: 0.33,
              weight: 0.8,
              kind: Shaping,
            },
            RewardTerm::{ name: "risk", raw: -0.91, weight: 1.0, kind: Penalty },
          ],
          terminal: true,
        },
      ],
      -10.0,
      10.0,
    ),
  )
  cases.push(
    make_benchmark_case(
      "catalog-026",
      [
        RewardStep::{
          index: 26,
          terms: [
            RewardTerm::{
              name: "objective",
              raw: -0.23,
              weight: 1.0,
              kind: Base,
            },
            RewardTerm::{
              name: "progress",
              raw: 0.44,
              weight: 0.8,
              kind: Shaping,
            },
            RewardTerm::{ name: "risk", raw: -0.07, weight: 1.0, kind: Penalty },
          ],
          terminal: false,
        },
      ],
      -10.0,
      10.0,
    ),
  )
  cases.push(
    make_benchmark_case(
      "catalog-027",
      [
        RewardStep::{
          index: 27,
          terms: [
            RewardTerm::{
              name: "objective",
              raw: 0.00,
              weight: 1.0,
              kind: Base,
            },
            RewardTerm::{
              name: "progress",
              raw: -0.44,
              weight: 0.8,
              kind: Shaping,
            },
            RewardTerm::{ name: "risk", raw: -0.14, weight: 1.0, kind: Penalty },
          ],
          terminal: false,
        },
      ],
      -10.0,
      10.0,
    ),
  )
  cases.push(
    make_benchmark_case(
      "catalog-028",
      [
        RewardStep::{
          index: 28,
          terms: [
            RewardTerm::{
              name: "objective",
              raw: 0.23,
              weight: 1.0,
              kind: Base,
            },
            RewardTerm::{
              name: "progress",
              raw: -0.33,
              weight: 0.8,
              kind: Shaping,
            },
            RewardTerm::{ name: "risk", raw: -0.21, weight: 1.0, kind: Penalty },
          ],
          terminal: false,
        },
      ],
      -10.0,
      10.0,
    ),
  )
  cases.push(
    make_benchmark_case(
      "catalog-029",
      [
        RewardStep::{
          index: 29,
          terms: [
            RewardTerm::{
              name: "objective",
              raw: 0.46,
              weight: 1.0,
              kind: Base,
            },
            RewardTerm::{
              name: "progress",
              raw: -0.22,
              weight: 0.8,
              kind: Shaping,
            },
            RewardTerm::{ name: "risk", raw: -0.28, weight: 1.0, kind: Penalty },
          ],
          terminal: false,
        },
      ],
      -10.0,
      10.0,
    ),
  )
  cases.push(
    make_benchmark_case(
      "catalog-030",
      [
        RewardStep::{
          index: 30,
          terms: [
            RewardTerm::{
              name: "objective",
              raw: 0.69,
              weight: 1.0,
              kind: Base,
            },
            RewardTerm::{
              name: "progress",
              raw: -0.11,
              weight: 0.8,
              kind: Shaping,
            },
            RewardTerm::{ name: "risk", raw: -0.35, weight: 1.0, kind: Penalty },
          ],
          terminal: true,
        },
      ],
      -10.0,
      10.0,
    ),
  )
  cases.push(
    make_benchmark_case(
      "catalog-031",
      [
        RewardStep::{
          index: 31,
          terms: [
            RewardTerm::{
              name: "objective",
              raw: 0.92,
              weight: 1.0,
              kind: Base,
            },
            RewardTerm::{
              name: "progress",
              raw: 0.00,
              weight: 0.8,
              kind: Shaping,
            },
            RewardTerm::{ name: "risk", raw: -0.42, weight: 1.0, kind: Penalty },
          ],
          terminal: false,
        },
      ],
      -10.0,
      10.0,
    ),
  )
  cases.push(
    make_benchmark_case(
      "catalog-032",
      [
        RewardStep::{
          index: 32,
          terms: [
            RewardTerm::{
              name: "objective",
              raw: 1.15,
              weight: 1.0,
              kind: Base,
            },
            RewardTerm::{
              name: "progress",
              raw: 0.11,
              weight: 0.8,
              kind: Shaping,
            },
            RewardTerm::{ name: "risk", raw: -0.49, weight: 1.0, kind: Penalty },
          ],
          terminal: false,
        },
      ],
      -10.0,
      10.0,
    ),
  )
  cases.push(
    make_benchmark_case(
      "catalog-033",
      [
        RewardStep::{
          index: 33,
          terms: [
            RewardTerm::{
              name: "objective",
              raw: -1.15,
              weight: 1.0,
              kind: Base,
            },
            RewardTerm::{
              name: "progress",
              raw: 0.22,
              weight: 0.8,
              kind: Shaping,
            },
            RewardTerm::{ name: "risk", raw: -0.56, weight: 1.0, kind: Penalty },
          ],
          terminal: false,
        },
      ],
      -10.0,
      10.0,
    ),
  )
  cases.push(
    make_benchmark_case(
      "catalog-034",
      [
        RewardStep::{
          index: 34,
          terms: [
            RewardTerm::{
              name: "objective",
              raw: -0.92,
              weight: 1.0,
              kind: Base,
            },
            RewardTerm::{
              name: "progress",
              raw: 0.33,
              weight: 0.8,
              kind: Shaping,
            },
            RewardTerm::{ name: "risk", raw: -0.63, weight: 1.0, kind: Penalty },
          ],
          terminal: false,
        },
      ],
      -10.0,
      10.0,
    ),
  )
  cases.push(
    make_benchmark_case(
      "catalog-035",
      [
        RewardStep::{
          index: 35,
          terms: [
            RewardTerm::{
              name: "objective",
              raw: -0.69,
              weight: 1.0,
              kind: Base,
            },
            RewardTerm::{
              name: "progress",
              raw: 0.44,
              weight: 0.8,
              kind: Shaping,
            },
            RewardTerm::{ name: "risk", raw: -0.70, weight: 1.0, kind: Penalty },
          ],
          terminal: true,
        },
      ],
      -10.0,
      10.0,
    ),
  )
  cases.push(
    make_benchmark_case(
      "catalog-036",
      [
        RewardStep::{
          index: 36,
          terms: [
            RewardTerm::{
              name: "objective",
              raw: -0.46,
              weight: 1.0,
              kind: Base,
            },
            RewardTerm::{
              name: "progress",
              raw: -0.44,
              weight: 0.8,
              kind: Shaping,
            },
            RewardTerm::{ name: "risk", raw: -0.77, weight: 1.0, kind: Penalty },
          ],
          terminal: false,
        },
      ],
      -10.0,
      10.0,
    ),
  )
  cases.push(
    make_benchmark_case(
      "catalog-037",
      [
        RewardStep::{
          index: 37,
          terms: [
            RewardTerm::{
              name: "objective",
              raw: -0.23,
              weight: 1.0,
              kind: Base,
            },
            RewardTerm::{
              name: "progress",
              raw: -0.33,
              weight: 0.8,
              kind: Shaping,
            },
            RewardTerm::{ name: "risk", raw: -0.84, weight: 1.0, kind: Penalty },
          ],
          terminal: false,
        },
      ],
      -10.0,
      10.0,
    ),
  )
  cases.push(
    make_benchmark_case(
      "catalog-038",
      [
        RewardStep::{
          index: 38,
          terms: [
            RewardTerm::{
              name: "objective",
              raw: 0.00,
              weight: 1.0,
              kind: Base,
            },
            RewardTerm::{
              name: "progress",
              raw: -0.22,
              weight: 0.8,
              kind: Shaping,
            },
            RewardTerm::{ name: "risk", raw: -0.91, weight: 1.0, kind: Penalty },
          ],
          terminal: false,
        },
      ],
      -10.0,
      10.0,
    ),
  )
  cases.push(
    make_benchmark_case(
      "catalog-039",
      [
        RewardStep::{
          index: 39,
          terms: [
            RewardTerm::{
              name: "objective",
              raw: 0.23,
              weight: 1.0,
              kind: Base,
            },
            RewardTerm::{
              name: "progress",
              raw: -0.11,
              weight: 0.8,
              kind: Shaping,
            },
            RewardTerm::{ name: "risk", raw: -0.07, weight: 1.0, kind: Penalty },
          ],
          terminal: false,
        },
      ],
      -10.0,
      10.0,
    ),
  )
  cases.push(
    make_benchmark_case(
      "catalog-040",
      [
        RewardStep::{
          index: 40,
          terms: [
            RewardTerm::{
              name: "objective",
              raw: 0.46,
              weight: 1.0,
              kind: Base,
            },
            RewardTerm::{
              name: "progress",
              raw: 0.00,
              weight: 0.8,
              kind: Shaping,
            },
            RewardTerm::{ name: "risk", raw: -0.14, weight: 1.0, kind: Penalty },
          ],
          terminal: true,
        },
      ],
      -10.0,
      10.0,
    ),
  )
  cases.push(
    make_benchmark_case(
      "catalog-041",
      [
        RewardStep::{
          index: 41,
          terms: [
            RewardTerm::{
              name: "objective",
              raw: 0.69,
              weight: 1.0,
              kind: Base,
            },
            RewardTerm::{
              name: "progress",
              raw: 0.11,
              weight: 0.8,
              kind: Shaping,
            },
            RewardTerm::{ name: "risk", raw: -0.21, weight: 1.0, kind: Penalty },
          ],
          terminal: false,
        },
      ],
      -10.0,
      10.0,
    ),
  )
  cases.push(
    make_benchmark_case(
      "catalog-042",
      [
        RewardStep::{
          index: 42,
          terms: [
            RewardTerm::{
              name: "objective",
              raw: 0.92,
              weight: 1.0,
              kind: Base,
            },
            RewardTerm::{
              name: "progress",
              raw: 0.22,
              weight: 0.8,
              kind: Shaping,
            },
            RewardTerm::{ name: "risk", raw: -0.28, weight: 1.0, kind: Penalty },
          ],
          terminal: false,
        },
      ],
      -10.0,
      10.0,
    ),
  )
  cases.push(
    make_benchmark_case(
      "catalog-043",
      [
        RewardStep::{
          index: 43,
          terms: [
            RewardTerm::{
              name: "objective",
              raw: 1.15,
              weight: 1.0,
              kind: Base,
            },
            RewardTerm::{
              name: "progress",
              raw: 0.33,
              weight: 0.8,
              kind: Shaping,
            },
            RewardTerm::{ name: "risk", raw: -0.35, weight: 1.0, kind: Penalty },
          ],
          terminal: false,
        },
      ],
      -10.0,
      10.0,
    ),
  )
  cases.push(
    make_benchmark_case(
      "catalog-044",
      [
        RewardStep::{
          index: 44,
          terms: [
            RewardTerm::{
              name: "objective",
              raw: -1.15,
              weight: 1.0,
              kind: Base,
            },
            RewardTerm::{
              name: "progress",
              raw: 0.44,
              weight: 0.8,
              kind: Shaping,
            },
            RewardTerm::{ name: "risk", raw: -0.42, weight: 1.0, kind: Penalty },
          ],
          terminal: false,
        },
      ],
      -10.0,
      10.0,
    ),
  )
  cases.push(
    make_benchmark_case(
      "catalog-045",
      [
        RewardStep::{
          index: 45,
          terms: [
            RewardTerm::{
              name: "objective",
              raw: -0.92,
              weight: 1.0,
              kind: Base,
            },
            RewardTerm::{
              name: "progress",
              raw: -0.44,
              weight: 0.8,
              kind: Shaping,
            },
            RewardTerm::{ name: "risk", raw: -0.49, weight: 1.0, kind: Penalty },
          ],
          terminal: true,
        },
      ],
      -10.0,
      10.0,
    ),
  )
  cases.push(
    make_benchmark_case(
      "catalog-046",
      [
        RewardStep::{
          index: 46,
          terms: [
            RewardTerm::{
              name: "objective",
              raw: -0.69,
              weight: 1.0,
              kind: Base,
            },
            RewardTerm::{
              name: "progress",
              raw: -0.33,
              weight: 0.8,
              kind: Shaping,
            },
            RewardTerm::{ name: "risk", raw: -0.56, weight: 1.0, kind: Penalty },
          ],
          terminal: false,
        },
      ],
      -10.0,
      10.0,
    ),
  )
  cases.push(
    make_benchmark_case(
      "catalog-047",
      [
        RewardStep::{
          index: 47,
          terms: [
            RewardTerm::{
              name: "objective",
              raw: -0.46,
              weight: 1.0,
              kind: Base,
            },
            RewardTerm::{
              name: "progress",
              raw: -0.22,
              weight: 0.8,
              kind: Shaping,
            },
            RewardTerm::{ name: "risk", raw: -0.63, weight: 1.0, kind: Penalty },
          ],
          terminal: false,
        },
      ],
      -10.0,
      10.0,
    ),
  )
  cases.push(
    make_benchmark_case(
      "catalog-048",
      [
        RewardStep::{
          index: 48,
          terms: [
            RewardTerm::{
              name: "objective",
              raw: -0.23,
              weight: 1.0,
              kind: Base,
            },
            RewardTerm::{
              name: "progress",
              raw: -0.11,
              weight: 0.8,
              kind: Shaping,
            },
            RewardTerm::{ name: "risk", raw: -0.70, weight: 1.0, kind: Penalty },
          ],
          terminal: false,
        },
      ],
      -10.0,
      10.0,
    ),
  )
  cases.push(
    make_benchmark_case(
      "catalog-049",
      [
        RewardStep::{
          index: 49,
          terms: [
            RewardTerm::{
              name: "objective",
              raw: 0.00,
              weight: 1.0,
              kind: Base,
            },
            RewardTerm::{
              name: "progress",
              raw: 0.00,
              weight: 0.8,
              kind: Shaping,
            },
            RewardTerm::{ name: "risk", raw: -0.77, weight: 1.0, kind: Penalty },
          ],
          terminal: false,
        },
      ],
      -10.0,
      10.0,
    ),
  )
  cases.push(
    make_benchmark_case(
      "catalog-050",
      [
        RewardStep::{
          index: 50,
          terms: [
            RewardTerm::{
              name: "objective",
              raw: 0.23,
              weight: 1.0,
              kind: Base,
            },
            RewardTerm::{
              name: "progress",
              raw: 0.11,
              weight: 0.8,
              kind: Shaping,
            },
            RewardTerm::{ name: "risk", raw: -0.84, weight: 1.0, kind: Penalty },
          ],
          terminal: true,
        },
      ],
      -10.0,
      10.0,
    ),
  )
  cases.push(
    make_benchmark_case(
      "catalog-051",
      [
        RewardStep::{
          index: 51,
          terms: [
            RewardTerm::{
              name: "objective",
              raw: 0.46,
              weight: 1.0,
              kind: Base,
            },
            RewardTerm::{
              name: "progress",
              raw: 0.22,
              weight: 0.8,
              kind: Shaping,
            },
            RewardTerm::{ name: "risk", raw: -0.91, weight: 1.0, kind: Penalty },
          ],
          terminal: false,
        },
      ],
      -10.0,
      10.0,
    ),
  )
  cases.push(
    make_benchmark_case(
      "catalog-052",
      [
        RewardStep::{
          index: 52,
          terms: [
            RewardTerm::{
              name: "objective",
              raw: 0.69,
              weight: 1.0,
              kind: Base,
            },
            RewardTerm::{
              name: "progress",
              raw: 0.33,
              weight: 0.8,
              kind: Shaping,
            },
            RewardTerm::{ name: "risk", raw: -0.07, weight: 1.0, kind: Penalty },
          ],
          terminal: false,
        },
      ],
      -10.0,
      10.0,
    ),
  )
  cases.push(
    make_benchmark_case(
      "catalog-053",
      [
        RewardStep::{
          index: 53,
          terms: [
            RewardTerm::{
              name: "objective",
              raw: 0.92,
              weight: 1.0,
              kind: Base,
            },
            RewardTerm::{
              name: "progress",
              raw: 0.44,
              weight: 0.8,
              kind: Shaping,
            },
            RewardTerm::{ name: "risk", raw: -0.14, weight: 1.0, kind: Penalty },
          ],
          terminal: false,
        },
      ],
      -10.0,
      10.0,
    ),
  )
  cases.push(
    make_benchmark_case(
      "catalog-054",
      [
        RewardStep::{
          index: 54,
          terms: [
            RewardTerm::{
              name: "objective",
              raw: 1.15,
              weight: 1.0,
              kind: Base,
            },
            RewardTerm::{
              name: "progress",
              raw: -0.44,
              weight: 0.8,
              kind: Shaping,
            },
            RewardTerm::{ name: "risk", raw: -0.21, weight: 1.0, kind: Penalty },
          ],
          terminal: false,
        },
      ],
      -10.0,
      10.0,
    ),
  )
  cases.push(
    make_benchmark_case(
      "catalog-055",
      [
        RewardStep::{
          index: 55,
          terms: [
            RewardTerm::{
              name: "objective",
              raw: -1.15,
              weight: 1.0,
              kind: Base,
            },
            RewardTerm::{
              name: "progress",
              raw: -0.33,
              weight: 0.8,
              kind: Shaping,
            },
            RewardTerm::{ name: "risk", raw: -0.28, weight: 1.0, kind: Penalty },
          ],
          terminal: true,
        },
      ],
      -10.0,
      10.0,
    ),
  )
  cases.push(
    make_benchmark_case(
      "catalog-056",
      [
        RewardStep::{
          index: 56,
          terms: [
            RewardTerm::{
              name: "objective",
              raw: -0.92,
              weight: 1.0,
              kind: Base,
            },
            RewardTerm::{
              name: "progress",
              raw: -0.22,
              weight: 0.8,
              kind: Shaping,
            },
            RewardTerm::{ name: "risk", raw: -0.35, weight: 1.0, kind: Penalty },
          ],
          terminal: false,
        },
      ],
      -10.0,
      10.0,
    ),
  )
  cases.push(
    make_benchmark_case(
      "catalog-057",
      [
        RewardStep::{
          index: 57,
          terms: [
            RewardTerm::{
              name: "objective",
              raw: -0.69,
              weight: 1.0,
              kind: Base,
            },
            RewardTerm::{
              name: "progress",
              raw: -0.11,
              weight: 0.8,
              kind: Shaping,
            },
            RewardTerm::{ name: "risk", raw: -0.42, weight: 1.0, kind: Penalty },
          ],
          terminal: false,
        },
      ],
      -10.0,
      10.0,
    ),
  )
  cases.push(
    make_benchmark_case(
      "catalog-058",
      [
        RewardStep::{
          index: 58,
          terms: [
            RewardTerm::{
              name: "objective",
              raw: -0.46,
              weight: 1.0,
              kind: Base,
            },
            RewardTerm::{
              name: "progress",
              raw: 0.00,
              weight: 0.8,
              kind: Shaping,
            },
            RewardTerm::{ name: "risk", raw: -0.49, weight: 1.0, kind: Penalty },
          ],
          terminal: false,
        },
      ],
      -10.0,
      10.0,
    ),
  )
  cases.push(
    make_benchmark_case(
      "catalog-059",
      [
        RewardStep::{
          index: 59,
          terms: [
            RewardTerm::{
              name: "objective",
              raw: -0.23,
              weight: 1.0,
              kind: Base,
            },
            RewardTerm::{
              name: "progress",
              raw: 0.11,
              weight: 0.8,
              kind: Shaping,
            },
            RewardTerm::{ name: "risk", raw: -0.56, weight: 1.0, kind: Penalty },
          ],
          terminal: false,
        },
      ],
      -10.0,
      10.0,
    ),
  )
  cases.push(
    make_benchmark_case(
      "catalog-060",
      [
        RewardStep::{
          index: 60,
          terms: [
            RewardTerm::{
              name: "objective",
              raw: 0.00,
              weight: 1.0,
              kind: Base,
            },
            RewardTerm::{
              name: "progress",
              raw: 0.22,
              weight: 0.8,
              kind: Shaping,
            },
            RewardTerm::{ name: "risk", raw: -0.63, weight: 1.0, kind: Penalty },
          ],
          terminal: true,
        },
      ],
      -10.0,
      10.0,
    ),
  )
  cases.push(
    make_benchmark_case(
      "catalog-061",
      [
        RewardStep::{
          index: 61,
          terms: [
            RewardTerm::{
              name: "objective",
              raw: 0.23,
              weight: 1.0,
              kind: Base,
            },
            RewardTerm::{
              name: "progress",
              raw: 0.33,
              weight: 0.8,
              kind: Shaping,
            },
            RewardTerm::{ name: "risk", raw: -0.70, weight: 1.0, kind: Penalty },
          ],
          terminal: false,
        },
      ],
      -10.0,
      10.0,
    ),
  )
  cases.push(
    make_benchmark_case(
      "catalog-062",
      [
        RewardStep::{
          index: 62,
          terms: [
            RewardTerm::{
              name: "objective",
              raw: 0.46,
              weight: 1.0,
              kind: Base,
            },
            RewardTerm::{
              name: "progress",
              raw: 0.44,
              weight: 0.8,
              kind: Shaping,
            },
            RewardTerm::{ name: "risk", raw: -0.77, weight: 1.0, kind: Penalty },
          ],
          terminal: false,
        },
      ],
      -10.0,
      10.0,
    ),
  )
  cases.push(
    make_benchmark_case(
      "catalog-063",
      [
        RewardStep::{
          index: 63,
          terms: [
            RewardTerm::{
              name: "objective",
              raw: 0.69,
              weight: 1.0,
              kind: Base,
            },
            RewardTerm::{
              name: "progress",
              raw: -0.44,
              weight: 0.8,
              kind: Shaping,
            },
            RewardTerm::{ name: "risk", raw: -0.84, weight: 1.0, kind: Penalty },
          ],
          terminal: false,
        },
      ],
      -10.0,
      10.0,
    ),
  )
  cases.push(
    make_benchmark_case(
      "catalog-064",
      [
        RewardStep::{
          index: 64,
          terms: [
            RewardTerm::{
              name: "objective",
              raw: 0.92,
              weight: 1.0,
              kind: Base,
            },
            RewardTerm::{
              name: "progress",
              raw: -0.33,
              weight: 0.8,
              kind: Shaping,
            },
            RewardTerm::{ name: "risk", raw: -0.91, weight: 1.0, kind: Penalty },
          ],
          terminal: false,
        },
      ],
      -10.0,
      10.0,
    ),
  )
  cases.push(
    make_benchmark_case(
      "catalog-065",
      [
        RewardStep::{
          index: 65,
          terms: [
            RewardTerm::{
              name: "objective",
              raw: 1.15,
              weight: 1.0,
              kind: Base,
            },
            RewardTerm::{
              name: "progress",
              raw: -0.22,
              weight: 0.8,
              kind: Shaping,
            },
            RewardTerm::{ name: "risk", raw: -0.07, weight: 1.0, kind: Penalty },
          ],
          terminal: true,
        },
      ],
      -10.0,
      10.0,
    ),
  )
  cases.push(
    make_benchmark_case(
      "catalog-066",
      [
        RewardStep::{
          index: 66,
          terms: [
            RewardTerm::{
              name: "objective",
              raw: -1.15,
              weight: 1.0,
              kind: Base,
            },
            RewardTerm::{
              name: "progress",
              raw: -0.11,
              weight: 0.8,
              kind: Shaping,
            },
            RewardTerm::{ name: "risk", raw: -0.14, weight: 1.0, kind: Penalty },
          ],
          terminal: false,
        },
      ],
      -10.0,
      10.0,
    ),
  )
  cases.push(
    make_benchmark_case(
      "catalog-067",
      [
        RewardStep::{
          index: 67,
          terms: [
            RewardTerm::{
              name: "objective",
              raw: -0.92,
              weight: 1.0,
              kind: Base,
            },
            RewardTerm::{
              name: "progress",
              raw: 0.00,
              weight: 0.8,
              kind: Shaping,
            },
            RewardTerm::{ name: "risk", raw: -0.21, weight: 1.0, kind: Penalty },
          ],
          terminal: false,
        },
      ],
      -10.0,
      10.0,
    ),
  )
  cases.push(
    make_benchmark_case(
      "catalog-068",
      [
        RewardStep::{
          index: 68,
          terms: [
            RewardTerm::{
              name: "objective",
              raw: -0.69,
              weight: 1.0,
              kind: Base,
            },
            RewardTerm::{
              name: "progress",
              raw: 0.11,
              weight: 0.8,
              kind: Shaping,
            },
            RewardTerm::{ name: "risk", raw: -0.28, weight: 1.0, kind: Penalty },
          ],
          terminal: false,
        },
      ],
      -10.0,
      10.0,
    ),
  )
  cases.push(
    make_benchmark_case(
      "catalog-069",
      [
        RewardStep::{
          index: 69,
          terms: [
            RewardTerm::{
              name: "objective",
              raw: -0.46,
              weight: 1.0,
              kind: Base,
            },
            RewardTerm::{
              name: "progress",
              raw: 0.22,
              weight: 0.8,
              kind: Shaping,
            },
            RewardTerm::{ name: "risk", raw: -0.35, weight: 1.0, kind: Penalty },
          ],
          terminal: false,
        },
      ],
      -10.0,
      10.0,
    ),
  )
  cases.push(
    make_benchmark_case(
      "catalog-070",
      [
        RewardStep::{
          index: 70,
          terms: [
            RewardTerm::{
              name: "objective",
              raw: -0.23,
              weight: 1.0,
              kind: Base,
            },
            RewardTerm::{
              name: "progress",
              raw: 0.33,
              weight: 0.8,
              kind: Shaping,
            },
            RewardTerm::{ name: "risk", raw: -0.42, weight: 1.0, kind: Penalty },
          ],
          terminal: true,
        },
      ],
      -10.0,
      10.0,
    ),
  )
  cases.push(
    make_benchmark_case(
      "catalog-071",
      [
        RewardStep::{
          index: 71,
          terms: [
            RewardTerm::{
              name: "objective",
              raw: 0.00,
              weight: 1.0,
              kind: Base,
            },
            RewardTerm::{
              name: "progress",
              raw: 0.44,
              weight: 0.8,
              kind: Shaping,
            },
            RewardTerm::{ name: "risk", raw: -0.49, weight: 1.0, kind: Penalty },
          ],
          terminal: false,
        },
      ],
      -10.0,
      10.0,
    ),
  )
  cases.push(
    make_benchmark_case(
      "catalog-072",
      [
        RewardStep::{
          index: 72,
          terms: [
            RewardTerm::{
              name: "objective",
              raw: 0.23,
              weight: 1.0,
              kind: Base,
            },
            RewardTerm::{
              name: "progress",
              raw: -0.44,
              weight: 0.8,
              kind: Shaping,
            },
            RewardTerm::{ name: "risk", raw: -0.56, weight: 1.0, kind: Penalty },
          ],
          terminal: false,
        },
      ],
      -10.0,
      10.0,
    ),
  )
  cases.push(
    make_benchmark_case(
      "catalog-073",
      [
        RewardStep::{
          index: 73,
          terms: [
            RewardTerm::{
              name: "objective",
              raw: 0.46,
              weight: 1.0,
              kind: Base,
            },
            RewardTerm::{
              name: "progress",
              raw: -0.33,
              weight: 0.8,
              kind: Shaping,
            },
            RewardTerm::{ name: "risk", raw: -0.63, weight: 1.0, kind: Penalty },
          ],
          terminal: false,
        },
      ],
      -10.0,
      10.0,
    ),
  )
  cases.push(
    make_benchmark_case(
      "catalog-074",
      [
        RewardStep::{
          index: 74,
          terms: [
            RewardTerm::{
              name: "objective",
              raw: 0.69,
              weight: 1.0,
              kind: Base,
            },
            RewardTerm::{
              name: "progress",
              raw: -0.22,
              weight: 0.8,
              kind: Shaping,
            },
            RewardTerm::{ name: "risk", raw: -0.70, weight: 1.0, kind: Penalty },
          ],
          terminal: false,
        },
      ],
      -10.0,
      10.0,
    ),
  )
  cases.push(
    make_benchmark_case(
      "catalog-075",
      [
        RewardStep::{
          index: 75,
          terms: [
            RewardTerm::{
              name: "objective",
              raw: 0.92,
              weight: 1.0,
              kind: Base,
            },
            RewardTerm::{
              name: "progress",
              raw: -0.11,
              weight: 0.8,
              kind: Shaping,
            },
            RewardTerm::{ name: "risk", raw: -0.77, weight: 1.0, kind: Penalty },
          ],
          terminal: true,
        },
      ],
      -10.0,
      10.0,
    ),
  )
  cases.push(
    make_benchmark_case(
      "catalog-076",
      [
        RewardStep::{
          index: 76,
          terms: [
            RewardTerm::{
              name: "objective",
              raw: 1.15,
              weight: 1.0,
              kind: Base,
            },
            RewardTerm::{
              name: "progress",
              raw: 0.00,
              weight: 0.8,
              kind: Shaping,
            },
            RewardTerm::{ name: "risk", raw: -0.84, weight: 1.0, kind: Penalty },
          ],
          terminal: false,
        },
      ],
      -10.0,
      10.0,
    ),
  )
  cases.push(
    make_benchmark_case(
      "catalog-077",
      [
        RewardStep::{
          index: 77,
          terms: [
            RewardTerm::{
              name: "objective",
              raw: -1.15,
              weight: 1.0,
              kind: Base,
            },
            RewardTerm::{
              name: "progress",
              raw: 0.11,
              weight: 0.8,
              kind: Shaping,
            },
            RewardTerm::{ name: "risk", raw: -0.91, weight: 1.0, kind: Penalty },
          ],
          terminal: false,
        },
      ],
      -10.0,
      10.0,
    ),
  )
  cases.push(
    make_benchmark_case(
      "catalog-078",
      [
        RewardStep::{
          index: 78,
          terms: [
            RewardTerm::{
              name: "objective",
              raw: -0.92,
              weight: 1.0,
              kind: Base,
            },
            RewardTerm::{
              name: "progress",
              raw: 0.22,
              weight: 0.8,
              kind: Shaping,
            },
            RewardTerm::{ name: "risk", raw: -0.07, weight: 1.0, kind: Penalty },
          ],
          terminal: false,
        },
      ],
      -10.0,
      10.0,
    ),
  )
  cases.push(
    make_benchmark_case(
      "catalog-079",
      [
        RewardStep::{
          index: 79,
          terms: [
            RewardTerm::{
              name: "objective",
              raw: -0.69,
              weight: 1.0,
              kind: Base,
            },
            RewardTerm::{
              name: "progress",
              raw: 0.33,
              weight: 0.8,
              kind: Shaping,
            },
            RewardTerm::{ name: "risk", raw: -0.14, weight: 1.0, kind: Penalty },
          ],
          terminal: false,
        },
      ],
      -10.0,
      10.0,
    ),
  )
  cases.push(
    make_benchmark_case(
      "catalog-080",
      [
        RewardStep::{
          index: 80,
          terms: [
            RewardTerm::{
              name: "objective",
              raw: -0.46,
              weight: 1.0,
              kind: Base,
            },
            RewardTerm::{
              name: "progress",
              raw: 0.44,
              weight: 0.8,
              kind: Shaping,
            },
            RewardTerm::{ name: "risk", raw: -0.21, weight: 1.0, kind: Penalty },
          ],
          terminal: true,
        },
      ],
      -10.0,
      10.0,
    ),
  )
  cases.push(
    make_benchmark_case(
      "catalog-081",
      [
        RewardStep::{
          index: 81,
          terms: [
            RewardTerm::{
              name: "objective",
              raw: -0.23,
              weight: 1.0,
              kind: Base,
            },
            RewardTerm::{
              name: "progress",
              raw: -0.44,
              weight: 0.8,
              kind: Shaping,
            },
            RewardTerm::{ name: "risk", raw: -0.28, weight: 1.0, kind: Penalty },
          ],
          terminal: false,
        },
      ],
      -10.0,
      10.0,
    ),
  )
  cases.push(
    make_benchmark_case(
      "catalog-082",
      [
        RewardStep::{
          index: 82,
          terms: [
            RewardTerm::{
              name: "objective",
              raw: 0.00,
              weight: 1.0,
              kind: Base,
            },
            RewardTerm::{
              name: "progress",
              raw: -0.33,
              weight: 0.8,
              kind: Shaping,
            },
            RewardTerm::{ name: "risk", raw: -0.35, weight: 1.0, kind: Penalty },
          ],
          terminal: false,
        },
      ],
      -10.0,
      10.0,
    ),
  )
  cases.push(
    make_benchmark_case(
      "catalog-083",
      [
        RewardStep::{
          index: 83,
          terms: [
            RewardTerm::{
              name: "objective",
              raw: 0.23,
              weight: 1.0,
              kind: Base,
            },
            RewardTerm::{
              name: "progress",
              raw: -0.22,
              weight: 0.8,
              kind: Shaping,
            },
            RewardTerm::{ name: "risk", raw: -0.42, weight: 1.0, kind: Penalty },
          ],
          terminal: false,
        },
      ],
      -10.0,
      10.0,
    ),
  )
  cases.push(
    make_benchmark_case(
      "catalog-084",
      [
        RewardStep::{
          index: 84,
          terms: [
            RewardTerm::{
              name: "objective",
              raw: 0.46,
              weight: 1.0,
              kind: Base,
            },
            RewardTerm::{
              name: "progress",
              raw: -0.11,
              weight: 0.8,
              kind: Shaping,
            },
            RewardTerm::{ name: "risk", raw: -0.49, weight: 1.0, kind: Penalty },
          ],
          terminal: false,
        },
      ],
      -10.0,
      10.0,
    ),
  )
  cases.push(
    make_benchmark_case(
      "catalog-085",
      [
        RewardStep::{
          index: 85,
          terms: [
            RewardTerm::{
              name: "objective",
              raw: 0.69,
              weight: 1.0,
              kind: Base,
            },
            RewardTerm::{
              name: "progress",
              raw: 0.00,
              weight: 0.8,
              kind: Shaping,
            },
            RewardTerm::{ name: "risk", raw: -0.56, weight: 1.0, kind: Penalty },
          ],
          terminal: true,
        },
      ],
      -10.0,
      10.0,
    ),
  )
  cases.push(
    make_benchmark_case(
      "catalog-086",
      [
        RewardStep::{
          index: 86,
          terms: [
            RewardTerm::{
              name: "objective",
              raw: 0.92,
              weight: 1.0,
              kind: Base,
            },
            RewardTerm::{
              name: "progress",
              raw: 0.11,
              weight: 0.8,
              kind: Shaping,
            },
            RewardTerm::{ name: "risk", raw: -0.63, weight: 1.0, kind: Penalty },
          ],
          terminal: false,
        },
      ],
      -10.0,
      10.0,
    ),
  )
  cases.push(
    make_benchmark_case(
      "catalog-087",
      [
        RewardStep::{
          index: 87,
          terms: [
            RewardTerm::{
              name: "objective",
              raw: 1.15,
              weight: 1.0,
              kind: Base,
            },
            RewardTerm::{
              name: "progress",
              raw: 0.22,
              weight: 0.8,
              kind: Shaping,
            },
            RewardTerm::{ name: "risk", raw: -0.70, weight: 1.0, kind: Penalty },
          ],
          terminal: false,
        },
      ],
      -10.0,
      10.0,
    ),
  )
  cases.push(
    make_benchmark_case(
      "catalog-088",
      [
        RewardStep::{
          index: 88,
          terms: [
            RewardTerm::{
              name: "objective",
              raw: -1.15,
              weight: 1.0,
              kind: Base,
            },
            RewardTerm::{
              name: "progress",
              raw: 0.33,
              weight: 0.8,
              kind: Shaping,
            },
            RewardTerm::{ name: "risk", raw: -0.77, weight: 1.0, kind: Penalty },
          ],
          terminal: false,
        },
      ],
      -10.0,
      10.0,
    ),
  )
  cases.push(
    make_benchmark_case(
      "catalog-089",
      [
        RewardStep::{
          index: 89,
          terms: [
            RewardTerm::{
              name: "objective",
              raw: -0.92,
              weight: 1.0,
              kind: Base,
            },
            RewardTerm::{
              name: "progress",
              raw: 0.44,
              weight: 0.8,
              kind: Shaping,
            },
            RewardTerm::{ name: "risk", raw: -0.84, weight: 1.0, kind: Penalty },
          ],
          terminal: false,
        },
      ],
      -10.0,
      10.0,
    ),
  )
  cases.push(
    make_benchmark_case(
      "catalog-090",
      [
        RewardStep::{
          index: 90,
          terms: [
            RewardTerm::{
              name: "objective",
              raw: -0.69,
              weight: 1.0,
              kind: Base,
            },
            RewardTerm::{
              name: "progress",
              raw: -0.44,
              weight: 0.8,
              kind: Shaping,
            },
            RewardTerm::{ name: "risk", raw: -0.91, weight: 1.0, kind: Penalty },
          ],
          terminal: true,
        },
      ],
      -10.0,
      10.0,
    ),
  )
  cases.push(
    make_benchmark_case(
      "catalog-091",
      [
        RewardStep::{
          index: 91,
          terms: [
            RewardTerm::{
              name: "objective",
              raw: -0.46,
              weight: 1.0,
              kind: Base,
            },
            RewardTerm::{
              name: "progress",
              raw: -0.33,
              weight: 0.8,
              kind: Shaping,
            },
            RewardTerm::{ name: "risk", raw: -0.07, weight: 1.0, kind: Penalty },
          ],
          terminal: false,
        },
      ],
      -10.0,
      10.0,
    ),
  )
  cases.push(
    make_benchmark_case(
      "catalog-092",
      [
        RewardStep::{
          index: 92,
          terms: [
            RewardTerm::{
              name: "objective",
              raw: -0.23,
              weight: 1.0,
              kind: Base,
            },
            RewardTerm::{
              name: "progress",
              raw: -0.22,
              weight: 0.8,
              kind: Shaping,
            },
            RewardTerm::{ name: "risk", raw: -0.14, weight: 1.0, kind: Penalty },
          ],
          terminal: false,
        },
      ],
      -10.0,
      10.0,
    ),
  )
  cases.push(
    make_benchmark_case(
      "catalog-093",
      [
        RewardStep::{
          index: 93,
          terms: [
            RewardTerm::{
              name: "objective",
              raw: 0.00,
              weight: 1.0,
              kind: Base,
            },
            RewardTerm::{
              name: "progress",
              raw: -0.11,
              weight: 0.8,
              kind: Shaping,
            },
            RewardTerm::{ name: "risk", raw: -0.21, weight: 1.0, kind: Penalty },
          ],
          terminal: false,
        },
      ],
      -10.0,
      10.0,
    ),
  )
  cases.push(
    make_benchmark_case(
      "catalog-094",
      [
        RewardStep::{
          index: 94,
          terms: [
            RewardTerm::{
              name: "objective",
              raw: 0.23,
              weight: 1.0,
              kind: Base,
            },
            RewardTerm::{
              name: "progress",
              raw: 0.00,
              weight: 0.8,
              kind: Shaping,
            },
            RewardTerm::{ name: "risk", raw: -0.28, weight: 1.0, kind: Penalty },
          ],
          terminal: false,
        },
      ],
      -10.0,
      10.0,
    ),
  )
  cases.push(
    make_benchmark_case(
      "catalog-095",
      [
        RewardStep::{
          index: 95,
          terms: [
            RewardTerm::{
              name: "objective",
              raw: 0.46,
              weight: 1.0,
              kind: Base,
            },
            RewardTerm::{
              name: "progress",
              raw: 0.11,
              weight: 0.8,
              kind: Shaping,
            },
            RewardTerm::{ name: "risk", raw: -0.35, weight: 1.0, kind: Penalty },
          ],
          terminal: true,
        },
      ],
      -10.0,
      10.0,
    ),
  )
  cases.push(
    make_benchmark_case(
      "catalog-096",
      [
        RewardStep::{
          index: 96,
          terms: [
            RewardTerm::{
              name: "objective",
              raw: 0.69,
              weight: 1.0,
              kind: Base,
            },
            RewardTerm::{
              name: "progress",
              raw: 0.22,
              weight: 0.8,
              kind: Shaping,
            },
            RewardTerm::{ name: "risk", raw: -0.42, weight: 1.0, kind: Penalty },
          ],
          terminal: false,
        },
      ],
      -10.0,
      10.0,
    ),
  )
  cases.push(
    make_benchmark_case(
      "catalog-097",
      [
        RewardStep::{
          index: 97,
          terms: [
            RewardTerm::{
              name: "objective",
              raw: 0.92,
              weight: 1.0,
              kind: Base,
            },
            RewardTerm::{
              name: "progress",
              raw: 0.33,
              weight: 0.8,
              kind: Shaping,
            },
            RewardTerm::{ name: "risk", raw: -0.49, weight: 1.0, kind: Penalty },
          ],
          terminal: false,
        },
      ],
      -10.0,
      10.0,
    ),
  )
  cases.push(
    make_benchmark_case(
      "catalog-098",
      [
        RewardStep::{
          index: 98,
          terms: [
            RewardTerm::{
              name: "objective",
              raw: 1.15,
              weight: 1.0,
              kind: Base,
            },
            RewardTerm::{
              name: "progress",
              raw: 0.44,
              weight: 0.8,
              kind: Shaping,
            },
            RewardTerm::{ name: "risk", raw: -0.56, weight: 1.0, kind: Penalty },
          ],
          terminal: false,
        },
      ],
      -10.0,
      10.0,
    ),
  )
  cases.push(
    make_benchmark_case(
      "catalog-099",
      [
        RewardStep::{
          index: 99,
          terms: [
            RewardTerm::{
              name: "objective",
              raw: -1.15,
              weight: 1.0,
              kind: Base,
            },
            RewardTerm::{
              name: "progress",
              raw: -0.44,
              weight: 0.8,
              kind: Shaping,
            },
            RewardTerm::{ name: "risk", raw: -0.63, weight: 1.0, kind: Penalty },
          ],
          terminal: false,
        },
      ],
      -10.0,
      10.0,
    ),
  )
  cases.push(
    make_benchmark_case(
      "catalog-100",
      [
        RewardStep::{
          index: 100,
          terms: [
            RewardTerm::{
              name: "objective",
              raw: -0.92,
              weight: 1.0,
              kind: Base,
            },
            RewardTerm::{
              name: "progress",
              raw: -0.33,
              weight: 0.8,
              kind: Shaping,
            },
            RewardTerm::{ name: "risk", raw: -0.70, weight: 1.0, kind: Penalty },
          ],
          terminal: true,
        },
      ],
      -10.0,
      10.0,
    ),
  )
  cases.push(
    make_benchmark_case(
      "catalog-101",
      [
        RewardStep::{
          index: 101,
          terms: [
            RewardTerm::{
              name: "objective",
              raw: -0.69,
              weight: 1.0,
              kind: Base,
            },
            RewardTerm::{
              name: "progress",
              raw: -0.22,
              weight: 0.8,
              kind: Shaping,
            },
            RewardTerm::{ name: "risk", raw: -0.77, weight: 1.0, kind: Penalty },
          ],
          terminal: false,
        },
      ],
      -10.0,
      10.0,
    ),
  )
  cases.push(
    make_benchmark_case(
      "catalog-102",
      [
        RewardStep::{
          index: 102,
          terms: [
            RewardTerm::{
              name: "objective",
              raw: -0.46,
              weight: 1.0,
              kind: Base,
            },
            RewardTerm::{
              name: "progress",
              raw: -0.11,
              weight: 0.8,
              kind: Shaping,
            },
            RewardTerm::{ name: "risk", raw: -0.84, weight: 1.0, kind: Penalty },
          ],
          terminal: false,
        },
      ],
      -10.0,
      10.0,
    ),
  )
  cases.push(
    make_benchmark_case(
      "catalog-103",
      [
        RewardStep::{
          index: 103,
          terms: [
            RewardTerm::{
              name: "objective",
              raw: -0.23,
              weight: 1.0,
              kind: Base,
            },
            RewardTerm::{
              name: "progress",
              raw: 0.00,
              weight: 0.8,
              kind: Shaping,
            },
            RewardTerm::{ name: "risk", raw: -0.91, weight: 1.0, kind: Penalty },
          ],
          terminal: false,
        },
      ],
      -10.0,
      10.0,
    ),
  )
  cases.push(
    make_benchmark_case(
      "catalog-104",
      [
        RewardStep::{
          index: 104,
          terms: [
            RewardTerm::{
              name: "objective",
              raw: 0.00,
              weight: 1.0,
              kind: Base,
            },
            RewardTerm::{
              name: "progress",
              raw: 0.11,
              weight: 0.8,
              kind: Shaping,
            },
            RewardTerm::{ name: "risk", raw: -0.07, weight: 1.0, kind: Penalty },
          ],
          terminal: false,
        },
      ],
      -10.0,
      10.0,
    ),
  )
  cases.push(
    make_benchmark_case(
      "catalog-105",
      [
        RewardStep::{
          index: 105,
          terms: [
            RewardTerm::{
              name: "objective",
              raw: 0.23,
              weight: 1.0,
              kind: Base,
            },
            RewardTerm::{
              name: "progress",
              raw: 0.22,
              weight: 0.8,
              kind: Shaping,
            },
            RewardTerm::{ name: "risk", raw: -0.14, weight: 1.0, kind: Penalty },
          ],
          terminal: true,
        },
      ],
      -10.0,
      10.0,
    ),
  )
  cases.push(
    make_benchmark_case(
      "catalog-106",
      [
        RewardStep::{
          index: 106,
          terms: [
            RewardTerm::{
              name: "objective",
              raw: 0.46,
              weight: 1.0,
              kind: Base,
            },
            RewardTerm::{
              name: "progress",
              raw: 0.33,
              weight: 0.8,
              kind: Shaping,
            },
            RewardTerm::{ name: "risk", raw: -0.21, weight: 1.0, kind: Penalty },
          ],
          terminal: false,
        },
      ],
      -10.0,
      10.0,
    ),
  )
  cases.push(
    make_benchmark_case(
      "catalog-107",
      [
        RewardStep::{
          index: 107,
          terms: [
            RewardTerm::{
              name: "objective",
              raw: 0.69,
              weight: 1.0,
              kind: Base,
            },
            RewardTerm::{
              name: "progress",
              raw: 0.44,
              weight: 0.8,
              kind: Shaping,
            },
            RewardTerm::{ name: "risk", raw: -0.28, weight: 1.0, kind: Penalty },
          ],
          terminal: false,
        },
      ],
      -10.0,
      10.0,
    ),
  )
  cases.push(
    make_benchmark_case(
      "catalog-108",
      [
        RewardStep::{
          index: 108,
          terms: [
            RewardTerm::{
              name: "objective",
              raw: 0.92,
              weight: 1.0,
              kind: Base,
            },
            RewardTerm::{
              name: "progress",
              raw: -0.44,
              weight: 0.8,
              kind: Shaping,
            },
            RewardTerm::{ name: "risk", raw: -0.35, weight: 1.0, kind: Penalty },
          ],
          terminal: false,
        },
      ],
      -10.0,
      10.0,
    ),
  )
  cases.push(
    make_benchmark_case(
      "catalog-109",
      [
        RewardStep::{
          index: 109,
          terms: [
            RewardTerm::{
              name: "objective",
              raw: 1.15,
              weight: 1.0,
              kind: Base,
            },
            RewardTerm::{
              name: "progress",
              raw: -0.33,
              weight: 0.8,
              kind: Shaping,
            },
            RewardTerm::{ name: "risk", raw: -0.42, weight: 1.0, kind: Penalty },
          ],
          terminal: false,
        },
      ],
      -10.0,
      10.0,
    ),
  )
  cases.push(
    make_benchmark_case(
      "catalog-110",
      [
        RewardStep::{
          index: 110,
          terms: [
            RewardTerm::{
              name: "objective",
              raw: -1.15,
              weight: 1.0,
              kind: Base,
            },
            RewardTerm::{
              name: "progress",
              raw: -0.22,
              weight: 0.8,
              kind: Shaping,
            },
            RewardTerm::{ name: "risk", raw: -0.49, weight: 1.0, kind: Penalty },
          ],
          terminal: true,
        },
      ],
      -10.0,
      10.0,
    ),
  )
  cases.push(
    make_benchmark_case(
      "catalog-111",
      [
        RewardStep::{
          index: 111,
          terms: [
            RewardTerm::{
              name: "objective",
              raw: -0.92,
              weight: 1.0,
              kind: Base,
            },
            RewardTerm::{
              name: "progress",
              raw: -0.11,
              weight: 0.8,
              kind: Shaping,
            },
            RewardTerm::{ name: "risk", raw: -0.56, weight: 1.0, kind: Penalty },
          ],
          terminal: false,
        },
      ],
      -10.0,
      10.0,
    ),
  )
  cases.push(
    make_benchmark_case(
      "catalog-112",
      [
        RewardStep::{
          index: 112,
          terms: [
            RewardTerm::{
              name: "objective",
              raw: -0.69,
              weight: 1.0,
              kind: Base,
            },
            RewardTerm::{
              name: "progress",
              raw: 0.00,
              weight: 0.8,
              kind: Shaping,
            },
            RewardTerm::{ name: "risk", raw: -0.63, weight: 1.0, kind: Penalty },
          ],
          terminal: false,
        },
      ],
      -10.0,
      10.0,
    ),
  )
  cases.push(
    make_benchmark_case(
      "catalog-113",
      [
        RewardStep::{
          index: 113,
          terms: [
            RewardTerm::{
              name: "objective",
              raw: -0.46,
              weight: 1.0,
              kind: Base,
            },
            RewardTerm::{
              name: "progress",
              raw: 0.11,
              weight: 0.8,
              kind: Shaping,
            },
            RewardTerm::{ name: "risk", raw: -0.70, weight: 1.0, kind: Penalty },
          ],
          terminal: false,
        },
      ],
      -10.0,
      10.0,
    ),
  )
  cases.push(
    make_benchmark_case(
      "catalog-114",
      [
        RewardStep::{
          index: 114,
          terms: [
            RewardTerm::{
              name: "objective",
              raw: -0.23,
              weight: 1.0,
              kind: Base,
            },
            RewardTerm::{
              name: "progress",
              raw: 0.22,
              weight: 0.8,
              kind: Shaping,
            },
            RewardTerm::{ name: "risk", raw: -0.77, weight: 1.0, kind: Penalty },
          ],
          terminal: false,
        },
      ],
      -10.0,
      10.0,
    ),
  )
  cases.push(
    make_benchmark_case(
      "catalog-115",
      [
        RewardStep::{
          index: 115,
          terms: [
            RewardTerm::{
              name: "objective",
              raw: 0.00,
              weight: 1.0,
              kind: Base,
            },
            RewardTerm::{
              name: "progress",
              raw: 0.33,
              weight: 0.8,
              kind: Shaping,
            },
            RewardTerm::{ name: "risk", raw: -0.84, weight: 1.0, kind: Penalty },
          ],
          terminal: true,
        },
      ],
      -10.0,
      10.0,
    ),
  )
  cases.push(
    make_benchmark_case(
      "catalog-116",
      [
        RewardStep::{
          index: 116,
          terms: [
            RewardTerm::{
              name: "objective",
              raw: 0.23,
              weight: 1.0,
              kind: Base,
            },
            RewardTerm::{
              name: "progress",
              raw: 0.44,
              weight: 0.8,
              kind: Shaping,
            },
            RewardTerm::{ name: "risk", raw: -0.91, weight: 1.0, kind: Penalty },
          ],
          terminal: false,
        },
      ],
      -10.0,
      10.0,
    ),
  )
  cases.push(
    make_benchmark_case(
      "catalog-117",
      [
        RewardStep::{
          index: 117,
          terms: [
            RewardTerm::{
              name: "objective",
              raw: 0.46,
              weight: 1.0,
              kind: Base,
            },
            RewardTerm::{
              name: "progress",
              raw: -0.44,
              weight: 0.8,
              kind: Shaping,
            },
            RewardTerm::{ name: "risk", raw: -0.07, weight: 1.0, kind: Penalty },
          ],
          terminal: false,
        },
      ],
      -10.0,
      10.0,
    ),
  )
  cases.push(
    make_benchmark_case(
      "catalog-118",
      [
        RewardStep::{
          index: 118,
          terms: [
            RewardTerm::{
              name: "objective",
              raw: 0.69,
              weight: 1.0,
              kind: Base,
            },
            RewardTerm::{
              name: "progress",
              raw: -0.33,
              weight: 0.8,
              kind: Shaping,
            },
            RewardTerm::{ name: "risk", raw: -0.14, weight: 1.0, kind: Penalty },
          ],
          terminal: false,
        },
      ],
      -10.0,
      10.0,
    ),
  )
  cases.push(
    make_benchmark_case(
      "catalog-119",
      [
        RewardStep::{
          index: 119,
          terms: [
            RewardTerm::{
              name: "objective",
              raw: 0.92,
              weight: 1.0,
              kind: Base,
            },
            RewardTerm::{
              name: "progress",
              raw: -0.22,
              weight: 0.8,
              kind: Shaping,
            },
            RewardTerm::{ name: "risk", raw: -0.21, weight: 1.0, kind: Penalty },
          ],
          terminal: false,
        },
      ],
      -10.0,
      10.0,
    ),
  )
  cases.push(
    make_benchmark_case(
      "catalog-120",
      [
        RewardStep::{
          index: 120,
          terms: [
            RewardTerm::{
              name: "objective",
              raw: 1.15,
              weight: 1.0,
              kind: Base,
            },
            RewardTerm::{
              name: "progress",
              raw: -0.11,
              weight: 0.8,
              kind: Shaping,
            },
            RewardTerm::{ name: "risk", raw: -0.28, weight: 1.0, kind: Penalty },
          ],
          terminal: true,
        },
      ],
      -10.0,
      10.0,
    ),
  )
  cases
}

///|
pub fn run_catalog_benchmarks(config : RewardConfig) -> Array[TraceSummary] {
  let results = Array::new(capacity=benchmark_catalog().length())
  for case in benchmark_catalog() {
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
pub fn catalog_report(config : RewardConfig) -> String {
  let summaries = run_catalog_benchmarks(config)
  let mut positive = 0
  let mut sparse = 0
  let mut clipped = 0
  for summary in summaries {
    if summary.total_clipped > 0.0 {
      positive = positive + 1
    }
    sparse = sparse + summary.sparse_steps
    clipped = clipped + summary.clipped_steps
  }
  "Catalog benchmark report\n" +
  "cases: \{summaries.length()}\n" +
  "positive_total_cases: \{positive}\n" +
  "sparse_steps: \{sparse}\n" +
  "clipped_steps: \{clipped}\n"
}
