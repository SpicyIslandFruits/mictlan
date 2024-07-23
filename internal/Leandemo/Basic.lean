variable {α : Type}

/-- Insert an element in a way that
does not break the order of the sorted list. -/
def orderedInsert (a : α) (ord : α → Nat) : List α → List α
  | [] => [a]
  | b :: l =>
    if ord a ≤ ord b then a :: b :: l
    else b :: orderedInsert a ord l

/-- insertion sort -/
def insertionSort (ord : α → Nat) : List α → List α
  | [] => []
  | b :: l => orderedInsert b ord <| insertionSort ord l

/-
  正しくソートされていることを証明するために、
  `insertionSort ord xs` に以下の性質が成り立てば良いとする
  - ソート前とソート後は「並べ替え」の関係にある (Permutationとして定義)
    - ソート前とソート後で長さが変化しない
    - 含む要素が変化しない
  - リストが昇順に並んでいる (Sortedとして定義)
-/

/-- 二つのリストが並べ替えの関係にあることを定義 -/
inductive Permutation : List α -> List α -> Prop where
  | Nil: Permutation [] []
  | Skip {l l'} x (h : Permutation l l') : Permutation (x :: l) (x :: l')
  | Swap {l} x y : Permutation (x :: y :: l) (y :: x :: l)
  | Trans {l l' l''} : Permutation l l' → Permutation l' l'' → Permutation l l''

@[refl]
theorem Permutation.refl (l : List α) : Permutation l l := by
  induction l
  . apply Nil
  . apply Skip; assumption

@[symm]
theorem Permutation.symm {l l' : List α} : Permutation l l' → Permutation l' l := by
  intro h; induction h
  . apply Nil
  . apply Skip; assumption
  . apply Swap <;> assumption
  . apply Trans <;> assumption

theorem Permutation.ex_of_in {l : List α} {a : α} (h : a ∈ l)
  : ∃ tl, Permutation (a :: tl) l := by
  induction l
  case nil => nomatch h
  case cons hd tl ih =>
    rcases List.mem_cons.mp h with eq_h | in_h
    . rw [eq_h]; exists tl
    . specialize ih in_h; obtain ⟨tl', h⟩ := ih
      exists hd :: tl'
      apply Trans (l' := hd :: a :: tl')
      . apply Swap
      . apply Skip; assumption

/-- 並べ替え関係なら長さは同じ -/
theorem Permutation.length {xs ys : List α}
  (h : Permutation xs ys) : xs.length = ys.length := by
  induction h <;> { first | rfl | simp_all }

/-- 並べ替え関係なら含んでいる要素が全て同じ -/
theorem Permutation.mem {xs ys : List α}
  (h : Permutation xs ys) : (∀ x, x ∈ xs → x ∈ ys) ∧ (∀ y, y ∈ ys → y ∈ xs) := by
  constructor <;> intro a in_h
  all_goals
    induction h
    case Nil => nomatch in_h
    case Skip =>
      cases in_h; { simp }; { rename_i ih h; right; apply ih; assumption }
    case Swap =>
      rw [List.mem_cons, List.mem_cons] at in_h ⊢
      rcases in_h with h | h | h <;> simp_all
    case Trans =>
      apply_assumption; apply_assumption; assumption

theorem insertionSort.nil {ord : α → Nat} {l : List α}
  (h : insertionSort ord l = []) : l = [] := by
  induction l; case nil => rfl
  dsimp [insertionSort] at h; unfold orderedInsert at h; split at h
  . nomatch h
  . rename_i hd _ _ _ a _ _
    rcases Nat.lt_or_ge (ord a) (ord hd) with h1 | h1
    . simp [Nat.not_le_of_lt h1] at h
    . simp [h1] at h

theorem orderedInsert.perm (ord : α → Nat) (xs : List α) (a : α)
  : Permutation (a :: xs) (orderedInsert a ord xs) := by
  induction xs
  case nil => rfl
  case cons hd tl ih =>
    unfold orderedInsert; split
    . rfl
    . symm; apply Permutation.Trans (l' := hd :: a :: tl)
      . apply Permutation.Skip; symm; assumption
      . apply Permutation.Swap

/-- ソート前とソート後が並べ替え関係にある -/
theorem insertionSort.perm (l : List α) (ord : α → Nat)
  : Permutation l (insertionSort ord l) := by
  induction l
  case nil => dsimp [insertionSort]; rfl
  case cons hd tl ih =>
    dsimp [insertionSort]; unfold orderedInsert; split <;> rename_i eq_h
    . have eq_h : tl = [] := by apply insertionSort.nil; assumption
      rw [eq_h]
    . split
      . apply Permutation.Skip; rw [← eq_h]; assumption
      . rename_i b tl' _
        apply Permutation.Trans (l' := b :: hd :: tl')
        . apply Permutation.Trans (l' := hd :: b :: tl')
          . apply Permutation.Skip; rw [← eq_h]; assumption
          . apply Permutation.Swap
        . apply Permutation.Skip; apply orderedInsert.perm

/-- insertionSortによって長さが変わることはない -/
theorem insertionSort.length_eq (xs : List α) (ord : α → Nat)
  : xs.length = (insertionSort ord xs).length := by
  apply Permutation.length; exact perm xs ord

/-- insertionSortによって要素が変化することはない -/
theorem insertionSort.in (a : α) (xs : List α) (ord : α → Nat)
  : a ∈ xs ↔ a ∈ insertionSort ord xs := by
  obtain ⟨h1, h2⟩ := Permutation.mem (perm xs ord)
  constructor <;> { intro h; apply_assumption; assumption }

inductive Sorted (ord : α → Nat) : List α → Prop where
  | Nil : Sorted ord []
  | Cons {a : α} {xs : List α}
    (xs_sorted : Sorted ord xs) (le_h : ∀ b, b ∈ xs → ord a ≤ ord b)
    : Sorted ord (a :: xs)

theorem orderedInsert.mem_cons (ord : α → Nat) (xs : List α) (a : α)
  : ∀ x, (x ∈ orderedInsert a ord xs ↔ x = a ∨ x ∈ xs) := by
  intro x
  obtain ⟨l_h, r_h⟩ := (orderedInsert.perm ord xs a).mem
  constructor <;> intro h
  . rw [← List.mem_cons]; apply r_h; assumption
  . apply l_h; simp [h]

theorem orderedInsert.sorted (ord : α → Nat) (xs : List α) (xs_sorted : Sorted ord xs)
  : ∀ a, Sorted ord (orderedInsert a ord xs) := by
  induction xs_sorted <;> (intro a; dsimp [orderedInsert])
  case Nil => apply Sorted.Cons Sorted.Nil (by intro _ h; nomatch h)
  case Cons xs_sorted le_h ih =>
    split
    . apply Sorted.Cons
      . apply Sorted.Cons xs_sorted le_h
      . intro b in_h
        rcases List.mem_cons.mp in_h with eq_h | in_h
        . rw [eq_h]; apply Nat.le_of_not_gt; simpa
        . apply Nat.le_trans (by assumption) (by apply le_h; assumption)
    . apply Sorted.Cons (ih _)
      intro b in_h
      rw [orderedInsert.mem_cons] at in_h
      rcases in_h with eq_h | in_h
      . apply Nat.le_of_lt; simp_all
      . apply le_h; assumption

/-- ソートされている -/
theorem insertionSort.sorted (ord : α → Nat) (xs : List α)
  : Sorted ord (insertionSort ord xs) := by
  match xs with
  | [] => apply Sorted.Nil
  | a :: xs =>
    dsimp [insertionSort]
    apply orderedInsert.sorted
    apply sorted
