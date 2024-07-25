import Lake
open Lake DSL

package «mictlan» where
  -- add package configuration options here

lean_lib «internal» where
  -- add library configuration options here

require mathlib from git "https://github.com/leanprover-community/mathlib4"

lean_exe «dependenttypetheory» where
  root := `examples.«TheoremProvingInLean4».DependentTypeTheory
