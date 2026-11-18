# Mod-5 counter: two implementations

The same 0→1→2→3→4→0 counter written two ways, to compare styles.

| File | Style |
|---|---|
| `mod5_traditional.v` | Classic state-machine design: next-state equations derived by hand and built from gates (`d2 = q1·q0`, `d1 = q1⊕q0`, `d0 = ¬(q2+q0)`) feeding three flip-flops. |
| `mod5_modern.v` | Behavioural: an incrementer plus a compare-to-4 mux in front of one register (block diagram in the file comment). |
| `mod5_tb.v` | Testbench; select the DUT with `+define+TRADITIONAL` or `+define+MODERN`. |
| `abnormal_counter.v` | A counter that skips multiples of a parameter (`MOD_VAL`, `SKIP_VAL`). Not yet verified. |

More counters are in [`Counter_variants/`](Counter_variants).

## Run
```
iverilog -g2012 -DMODERN -o sim mod5_modern.v mod5_tb.v && vvp sim
```
(or `runw.do` in ModelSim)