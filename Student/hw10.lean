-- 1.
variable
  (Dog Cat : Type)
  (likes : Dog → Cat → Prop)

example : ∀ (d : Dog), ∃ (c : Cat), likes d c :=

/-!
example :
  (∃ (timmy : Cat), ∀ (d : Dog), likes d timmy) →
  (∀ (d : Dog), ∃ (t : Cat), likes d t)

| ⟨ timmy, everydog_likes_timmy ⟩ => fun (d : Dog) =>
  ⟨timmy, (everydog_likes_timmy d)⟩

-/

-- 2. If any dog, d, likes any dog, g, and that dog, g, likes any dog,
-- w, then d likes w. (d → g → w) => d → w
variable
  -- (Dog : Type) already defined above
  (likes_dog : Dog → Dog → Prop)

example :
  ∀ (a b c : Dog), likes_dog a b ∧ likes_dog b c → likes_dog a c :=
  -- fun a b c are matched to the elements in for all function
  -- ⟨tuple⟩ is matched to (likes_dog a b) and (likes_dog b c)
  -- Ignore this proof for now.
  fun a b c ⟨a_likes_b, b_likes_c⟩ =>


-- 3.
-- If any cat, c, likes any cat, d, then d also likes c.
variable
  (likes_cat : Cat → Cat → Prop)

example : ∀ (c d : Cat), likes_cat c d → likes_cat d c :=
  -- Proof here
  -- Ignore this proof for now.
  /-
  fun c d h =>
    match h with
    | likes_cat _ _ => likes_cat d c
  -/

-- 4.
-- Every cat, c, likes itself.
example : ∀ (c : Cat), likes_cat c c :=
  -- Proof here
  -- Ignore this proof for now.
  /-
  fun c => likes_cat c c
  -/

-- 5.
-- If every cat likes every other cat, and c and d are cats, then c likes d.
variable
  -- (Dog Cat : Type) Already defined above
  (likes' : Cat → Cat → Prop)

example : (∀ (c d : Cat), likes' c d) → ∀ (c d : Cat), likes' c d :=
  -- Proof here
  fun h c d => h c d
