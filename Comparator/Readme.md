# N-bit comparator (recursive)

Outputs `gt`, `eq`, `lt` for two N-bit inputs.

## Design
- `comp1.v` – 1-bit comparator from primitive gates.
- `mux.v`, `mux3.v` – gate-level 2:1 mux and a 3-bit-wide mux.
- `compN.v` – splits the operands into an upper and lower half, compares each half recursively, then uses the upper half's `eq` to choose: if the upper halves are equal take the lower half's result, otherwise take the upper half's. Recursion ends at N = 1.

Recursion depth is log2(N), so the structure is a tree rather than a serial chain.

## Run
```
iverilog -g2012 -o sim compN.v compN_tb.v comp1.v mux3.v mux.v && vvp sim
```
or `vsim -do run.do` in ModelSim. The testbench applies 20 random pairs, then an equal pair, and prints `A B : gt eq lt`.