/-
  UoB Perspectives — Lean Project
  Starter file

  The imports below give you Mathlib's standard tactics and the common
  number systems. Do NOT replace them with `import Mathlib` — that
  imports the entire library and is very slow to load, especially in
  Codespaces.

  If you need something that isn't available, you can add a specific
  import at the top of this file. Ask if you're not sure which one.
-/

-- Starter imports for common first-year projects
import Mathlib.Algebra.BigOperators.Basic    -- finite sums and products
import Mathlib.Algebra.Group.Subgroup.Basic  -- groups and subgroups
import Mathlib.Data.Nat.Prime.Basic          -- divisibility and prime numbers
import Mathlib.Data.Real.Basic               -- real numbers and inequalities
import Mathlib.Data.Set.Function             -- sets, functions and bijections
import Mathlib.Data.Set.Countable            -- countability
import Mathlib.Topology.Sequences            -- sequences and convergence
import Mathlib.Tactic                        -- commonly used tactics

/-! ## Check your setup works

Click on each line below and look at the Lean Infoview panel on the right.
If you see results there, everything is working. -/

#eval 2 + 2                  -- should show: 4

#check @Nat.add_comm         -- should show the statement of commutativity

example : 2 + 2 = 4 := by norm_num


/-! ## Worked examples

These are complete proofs. Read them to see the shape of a Lean proof. -/

-- `ring` proves identities in commutative rings
example (a b : ℝ) : (a + b) ^ 2 = a ^ 2 + 2 * a * b + b ^ 2 := by
  ring

-- `linarith` proves goals that follow by linear arithmetic
example (x : ℝ) (h : x > 3) : x > 1 := by
  linarith

-- `norm_num` evaluates concrete numerical claims
example : (7 : ℕ) ∣ 49 := by
  norm_num

-- Introducing hypotheses with `intro`
example (P Q : Prop) (hp : P) : Q → P := by
  intro _
  exact hp

-- Proof by induction
example (n : ℕ) : 0 + n = n := by
  induction n with
  | zero => rfl
  | succ k ih => simp


/-! ## Your turn

Replace `sorry` with a proof. `sorry` makes Lean accept anything, so a
yellow warning means the proof is still incomplete. -/

example (a b : ℝ) : (a - b) ^ 2 = a ^ 2 - 2 * a * b + b ^ 2 := by
  ring


example (x : ℝ) (h : x ≥ 5) : x ≥ 2 := by
  linarith

example (n : ℕ) : n + 0 = n := by
  induction n with
  | zero => rfl
  | succ k ih => simp


/-! ## Useful tactics

  ring      — algebraic identities in rings
  linarith  — goals following from linear arithmetic over ordered fields
  norm_num  — concrete numerical computations
  simp      — simplify using Mathlib's simp lemmas
  omega     — linear arithmetic over ℕ and ℤ
  exact     — supply a term that exactly matches the goal
  intro     — introduce a hypothesis or variable
  apply     — apply a lemma to the goal
  rfl       — prove something true by definition
  sorry     — placeholder; accepts any goal (leave none in final work)

Search Mathlib for lemma names: https://leanprover-community.github.io/mathlib4_docs/
-/
