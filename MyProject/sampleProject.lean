/-
==========================================================================
  SAMPLE PROJECT — Formalising Mathematics in Lean (group project)

  Title : The sum of the first n odd numbers is n²
  Group : Sara, Ben, Chloe  (Group 7)


  ── STUDENT GUIDANCE — not part of the sample project ──────────────
  This example is intentionally small. It demonstrates the structure of
  the deliverables: lead-contributor comments, a build-vs-reuse decision, a
  written-up finding, and a documented `sorry`. A full group project
  should contain a main result and several supporting lemmas, with a
  meaningful contribution from each member. Use the structure as a
  guide, not the scope.

  Timeline followed: proposal (one day before the wk-5 session),
  skeleton milestone (wk 6),
  draft (wk 8), feedback (wk 9), final (wk 10), presentation (wk 11).

  Source : University of Bristol, first-year Introduction to Proofs and
           Group Theory lecture notes.
  Context: this is the classic "each odd number is the next L-shaped
           layer of a square" identity. See report §1.

  Every declaration records its lead contributor. The report and
  presentation form a shared group account; each member explains the
  detailed Lean code they contributed.
==========================================================================
-/

-- We import only what we use — NOT `import Mathlib`. Importing the whole
-- library makes the file slow to load (handbook, week-4 warn box).
import Mathlib.Algebra.BigOperators.Group.Finset.Basic -- finite sums, including `Finset.sum_range_succ`
import Mathlib.Algebra.Ring.Parity                     -- `Odd` and basic parity results
import Mathlib.Tactic

open Finset

namespace OddSumSquare

/-! ### Step 1: the inductive-step identity  (lead contributor: Sara)

The whole proof turns on one line of algebra, `n² + (2n+1) = (n+1)²`.
We isolate it so the induction reads cleanly and `ring` does the work. -/

/-- The algebraic heart of the induction: adding the next odd number
`2n+1` to `n²` gives `(n+1)²`. -/
lemma step (n : ℕ) : n ^ 2 + (2 * n + 1) = (n + 1) ^ 2 := by ring

/-! ### Step 2: the main theorem  (lead contributor: Ben)

We index the k-th odd number as `2*k + 1` (k from 0), *not* as `2*k - 1`
(k from 1). Step 4 explains why that choice is forced. -/

/-- **Main theorem.** The sum of the first `n` odd numbers is `n ^ 2`. -/
theorem sum_odd (n : ℕ) : ∑ k ∈ range n, (2 * k + 1) = n ^ 2 := by
  induction n with
  | zero => simp
  | succ d hd =>
      -- peel off the last term, then rewrite the sum by the hypothesis
      rw [Finset.sum_range_succ, hd]
      -- the goal is now `d² + (2d+1) = (d+1)²`; reuse Sara's `step`
      exact step d

/-! ### Step 3: build-vs-reuse note  (lead contributor: Ben, librarian)

We searched with `exact?` and LeanSearch and found the *sum API* used in
the proof (`Finset.sum_range_succ`, `Finset.sum_range_zero`). We did not
find a suitable theorem matching `step`, so we proved it directly.
For contrast, the Gauss companion (∑ of the first n naturals) *is* in
Mathlib, as `Finset.sum_range_id_mul_two`; we cite it in the report. -/

/-! ### Step 4 (a finding): why `2*k + 1`, not `2*k - 1`
    (lead contributor: Ben)

The natural first guess writes the k-th odd number as `2*k - 1`
(k = 1..n). In ℕ this is a trap: at `k = 0`, `2*0 - 1 = 0` because
subtraction truncates (handbook, week-6 pitfalls). So the `2*k - 1`
version over `range n` is NOT the sum of odds and the identity fails.
The `#eval`s below make the trap visible; re-indexing as `2*k + 1`
removes the subtraction entirely. -/

-- The truncation trap, made concrete:
#eval ∑ k ∈ range 3, (2 * k - 1)   -- 4  (= 0 + 1 + 3), NOT 9
#eval ∑ k ∈ range 3, (2 * k + 1)   -- 9  ✓  (= 1 + 3 + 5 = 3²)

/-- The broken indexing really is broken, not merely suspicious. -/
example : ∑ k ∈ range 3, (2 * k - 1) ≠ 3 ^ 2 := by decide

/-! ### Step 5: a completed lemma for the filtered version
    (lead contributor: Chloe)

The next lemma verifies that the parameterised term `2*k+1` belongs to
the filtered set of odd numbers below `2*n`. -/

/-- Each parameterised odd term belongs to the filtered set. -/
lemma odd_term_mem (n k : ℕ) (hk : k < n) :
    2 * k + 1 ∈ (range (2 * n)).filter (fun m => Odd m) := by
  simp only [Finset.mem_filter, Finset.mem_range]
  constructor
  · omega
  · exact odd_two_mul_add_one k

/-! ### Step 6 (documented `sorry` / stretch goal)
    (lead contributor: Chloe)

Our theorem sums the *parameterised* expression `2*k + 1`. An
alternative, less parameterised formulation sums over the numbers ℕ
genuinely recognises as `Odd`, i.e. the odd numbers below `2n`:

    ∑ m ∈ (range (2*n)).filter Odd, m = n².

Bridging the two needs a bijection between the index set `range n` (the
`k`) and the filtered set of odds below `2n` (the value `2k+1`). The lemma
`odd_term_mem` proves that the forward map lands in the filtered set. We
leave the full bijection as a documented `sorry`: the obstacle is the
`Finset.sum_bij` boilerplate — proving the map
`k ↦ 2k+1` is well-defined into the filtered set, injective, and
surjective onto it. The precise unresolved obligation is to prove that
every odd `m < 2n` is `2k+1` for some `k < n`, and then complete the
`Finset.sum_bij` proof. The submitted file does not claim that a partial
proof of this obligation has been completed. -/
theorem sum_odd_filter (n : ℕ) :
    ∑ m ∈ (range (2 * n)).filter (fun m => Odd m), m = n ^ 2 := by
  sorry

end OddSumSquare
