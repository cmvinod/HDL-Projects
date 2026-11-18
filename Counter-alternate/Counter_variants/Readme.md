# Counter variants

Different counting patterns, each with its own testbench.

| File | Behaviour |
|---|---|
| `mod100_modern.v` | Mod-100 counter in next-state-plus-register style |
| `mod100_evencounter.v` | Counts 0, 2, 4 … 100, then wraps to 0 |
| `mod100_skip13.v` | Counts 0…99 but jumps from 12 to 14 |
| `repeat5.v` | 2-bit output that holds each value for five clock cycles (0,0,0,0,0,1,1,…) |
| `sandwich_counter.v` | Alternates a mod-5 phase (0–4) with a mod-7 phase (0–6), switching at the end of each |
| `updown.v` | Up/down counter (three coding styles under `ifdef`) |

## Run
Each design has `<name>_tb.v` (and `.list` for ModelSim):
```
iverilog -g2012 -o sim mod100_skip13.v mod100_skip13_tb.v && vvp sim
```