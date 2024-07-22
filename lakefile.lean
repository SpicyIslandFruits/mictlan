import Lake
open Lake DSL

package «leandemo» where
  -- add package configuration options here

lean_lib «internal» where
  -- add library configuration options here

lean_exe «leandemo» where
  root := `cmd.«Leandemo».Main
