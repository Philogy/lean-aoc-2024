import Aoc2024.Day1
/- import Aoc2024.Day2 -/


def main : IO Unit := do
  let input ← IO.FS.readFile ⟨ "my-inputs/input-1.txt" ⟩
  match solve_day1_part1 input with
  | .ok result => IO.println s!"Output: {result}"
  | .error err_msg => IO.eprintln s!"Error: {err_msg}"
