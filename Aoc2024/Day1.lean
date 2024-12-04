import Aoc2024.Basic


def solve_day1_part1 (input: String): Except String Nat := do
  let pairs ← input.to_nat_pairs
  let (x, y) := pairs.unzip
  let x := x.mergeSort (. ≤ .)
  let y := y.mergeSort (. ≤ .)
  let diffs: List Int := List.zipWith (fun x y => ↑x - ↑y) x y
  return diffs.map Int.natAbs |> List.sum

def solve_day1_part2 (input: String): Except String Nat := do
  let pairs ← input.to_nat_pairs
  let (src, copied) := pairs.unzip
  return src.map (fun x => x * copied.count x) |> List.sum



