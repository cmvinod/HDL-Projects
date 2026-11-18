# 24-hour digital clock with set mode

`hmsv2.v` – outputs `hrs` (0–23), `min`, `sec` (0–59) and has a small FSM for setting the time.

## Ports
`clk`, `rst`, `stop_run` (toggle between run and set), `next` (move to the next field), `inc`, `dec` (adjust the selected field, wrapping 23→0 / 59→0 and the reverse).

## Design
- States: `RUN`, then set states for hours (`HB`), minutes (`MB`) and seconds (`SB`). `next` steps hours → minutes → seconds → hours; `stop_run` returns to `RUN`.
- Next-value logic uses wrap-around plus/minus-one wires (`secplus1`, `minminus1`, …) shared by run and set modes.
- In run mode, seconds increment every clock; minutes and hours carry on 59 and 59:59.
- `inc` and `dec` pressed together is ignored.

## Run
```
vsim -do runw.do      # ModelSim, uses hmsv2.list (needs -sv)
```
`hmsv2_tb.v` lets the clock run, then exercises stop/run, inc/dec and next.

## Status
The code elaborates and the testbench drives the stop/run, inc/dec and next sequences, but I have not yet verified the waveforms against expected values. Next step: a self-checking bench with a reference model (a plain counter) and directed checks of each set state.