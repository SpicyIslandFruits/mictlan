import Mathlib.Tactic.NormNum.Core
import internal.Leandemo.Basic

theorem demo : 1 > 0 :=  by
  norm_num

def main : IO Unit :=
  IO.println s!"Hello, world!"
