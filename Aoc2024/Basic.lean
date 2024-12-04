namespace List
def filter_empty: List String → List String :=
  List.filter (not ∘ String.isEmpty)

end List

namespace Option

universe u v

def ok {α : Type u} : Option α → Except Unit α
  | .some x => .ok x
  | .none => .error ()

def ok_with_err {α : Type u} {β : Type v} : Option α → β → Except β α
  | .some x => fun _ => .ok x
  | .none => .error

end Option

namespace String

def row_to_nums (line: String): Except String (List Nat) := do
  let components := line.splitOn.filter_empty
  (components.mapM String.toNat?).ok_with_err "Failed to parse number"

def to_nat_rows (input : String): Except String (List (List Nat)) := do
  let lines := (input.splitOn "\n").filter_empty
  lines.mapM row_to_nums

def to_nat_pairs (input : String): Except String (List (Nat × Nat)) := do
  let nums ← input.to_nat_rows
  nums.mapM (fun row =>
    match row with
    | [x, y] => .ok (x, y)
    | l => .error s!"Unexpected lengh of row numbers (expected: 2): {l}"
  )

end String
