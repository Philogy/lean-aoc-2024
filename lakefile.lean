import Lake
open Lake DSL

package "aoc-2024" where
  version := v!"0.1.0"

require "leanprover-community" / "mathlib"

lean_lib «Aoc2024» where
  -- add library configuration options here

@[default_target]
lean_exe "aoc-2024" where
  root := `Main
