import Mathlib.Data.Set.Basic

/-!
# Final Exam: Part 2

Here you can show that you've got what we covered in class,
up to and including set theory. The focus is on set theory,
as it encompassess the underlying logic as well. A hint: You
will want to review the existential quantifier and proofs of
existentially quantified propositions.

## Problem #1:

Use set comprehension notation in Lean to define *odds*
as the set of odd numbers, by way of a membership predicate
for this set.
-/

-- Here
def odds : Set Nat := { n | n % 2 ≠ 0 }

/-!
## Problem #2:

Use set comprehension and other set notations in Lean to
define the set, *perfect_squares*, of natural numbers, n,
such that each n is the square of some natural number, m.
For example, 36 is a perfect square because it is the square
of another number, namely m = 6.
-/

-- Here
def perfect_squares : Set Nat := { n | ∃ m, n = m * m }

/-!
## Problem #3:

Use set comprehension notation to define the set, odd_perfects,
to be the intersection of the odds and the perfect squares.
-/

-- Here
def odd_perfects : Set Nat := odds ∩ perfect_squares

/-!
## Problem #4:

Formally state and prove the proposition that 9 ∈ odd_perfects.
Hint: A proof within a proof.
-/

#reduce 9 ∈ odd_perfects  -- membership proposition
-- I need a proof that 9 is odd and a proof that 9 is a perfect square

-- Proof that 9 is odd

-- I cannot use Or.inl/Or.inr in the proof of 9 ∈ odds because the set is not constructed that way
-- I could supply a proof that (9 % 2 = 0 → False)
def nine_is_not_even : ¬ (9 % 2 = 0) := λ h => nomatch h

-- Proof that 9 is a perfect square

-- I need to prove that there exists a natural number m such that 9 = m * m
-- I can use the fact that 3 * 3 = 9
def nine_is_perfect_square : ∃ m, 9 = m * m := ⟨ 3, rfl ⟩

example : 9 ∈ odd_perfects := ⟨ nine_is_not_even, nine_is_perfect_square ⟩ -- membership proof
