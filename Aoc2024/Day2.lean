import Aoc2024.Basic
import Mathlib.Data.Nat.Dist

def example_input := "
7 6 4 2 1
1 2 7 8 9
9 7 6 2 1
1 3 2 4 5
8 6 4 4 1
1 3 6 7 9
"

def report_safe (report : List ℕ): Bool :=
  let rec report_safe_inner : Option Bool → List ℕ → Bool
    | _, [] => true
    | _, [_] => true
    | inc, a::b::r =>
      let d := a.dist b
      if d == 0 || d > 3 then false
      else let new_is_inc: Bool := (a < b)
        match inc, new_is_inc with
        | .some false, true => false
        | .some true, false => false
        | _, _ => report_safe_inner new_is_inc (b::r)
  report_safe_inner .none report


def solve_day2_part1 (input: String): Except String ℕ := do
  let rows ← input.to_nat_rows
  return rows.countP report_safe
