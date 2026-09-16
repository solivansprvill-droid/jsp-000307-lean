# JSP-000307 — Lean formalization of a descending-P triple

**Problem (Justin Sun Prize problem bank, JSP-000307):**
> Can three consecutive integers have strictly decreasing largest prime factors?

The problem bank records this as **Solved** with **Lean proof: No**. The original Erdős–Pomerance question (Erdős problem #372) asks for infinitely many such `n`; Balog [Ba01] settled that. The JSP record as written is the weaker existence question, so a single explicit triple is a complete answer to the recorded statement.

## The witness

```
13 = 13          P(13) = 13
14 = 2 * 7       P(14) =  7
15 = 3 * 5       P(15) =  5
```

and `13 > 7 > 5`.

## Contents

| File | Purpose |
| --- | --- |
| `JSP000307.lean` | The formalization. Lean core only, no Mathlib. |
| `lakefile.toml` | Library target. |
| `lean-toolchain` | Pins `leanprover/lean4:v4.34.0`. |

`largestPrimeB n` walks primes up to `n` and keeps the last divisor; `existence` then compares the three values with `native_decide`.

## Verification status

- Arithmetic: settled by trial division.
- Predicate semantics: `isPrimeB` agrees with a from-scratch ground truth for every `n` in 1..20000; `largestPrimeB` agrees for every `n` in 2..5000; zero mismatches.
- **Lean kernel check: not yet performed.** If `native_decide` is unavailable, replace it with `decide`.

Run with `lake build`.
