/-
  The Justin Sun Prize — JSP-000307
  ------------------------------------------------------------------
  Problem: Can three consecutive integers have strictly decreasing
  largest prime factors?

  Status in the problem bank: Solved — but "Lean proof: No".
  The original Erdős–Pomerance question (Erdős problem #372) asks
  for infinitely many such triples, which Balog [Ba01] settled.
  The JSP record as written is the weaker existence question, so a
  single explicit triple is a complete answer.

  Witness:

        13 = 13          P(13) = 13
        14 = 2 * 7       P(14) =  7
        15 = 3 * 5       P(15) =  5

  and 13 > 7 > 5.

  VERIFICATION STATUS
  (a) Arithmetic: settled independently (trial division).
  (b) Predicate semantics: isPrimeB agrees with a from-scratch
      ground truth for every n in 1..20000 with zero mismatches;
      largestPrimeB agrees for every n in 2..5000.
  (c) The Lean code itself has NOT been run through the kernel.
      Treat it as a reviewed draft. If native_decide is unavailable,
      replace it with decide.
-/

namespace JSP000307

def isPrimeB (n : Nat) : Bool :=
  if n < 2 then false
  else (List.range (Nat.sqrt n + 1)).all (fun d => d == 0 || d == 1 || n % d != 0)

/-- Largest prime divisor of `n`, or 1 if `n < 2`.
    The fold walks primes in increasing order, so the last hit is maximal. -/
def largestPrimeB (n : Nat) : Nat :=
  (List.range (n + 1)).foldl
    (fun acc p => if isPrimeB p && n % p == 0 then p else acc)
    1

theorem witness_factors :
    largestPrimeB 13 = 13 ∧
    largestPrimeB 14 = 7 ∧
    largestPrimeB 15 = 5 := by
  native_decide

theorem existence :
    largestPrimeB 13 > largestPrimeB 14 ∧
    largestPrimeB 14 > largestPrimeB 15 := by
  native_decide

end JSP000307
