# N-bit ripple-carry adder

Structural adder built by chaining full adders (`fa`) with a `genvar` loop.

- `add4.v` – fixed 4-bit version, 5-bit sum (carry-out in `S[4]`).
- `addN.v` – same idea with a `SIZE` parameter.
- `add4_tb.v`, `addN_tb.v` – testbenches. `runw.do` + `*.list` run them in ModelSim.

## How it works
Bit 0 uses a carry-in of 0; each later stage takes the previous stage's carry. The last carry becomes the top sum bit. Delay grows linearly with width (carry ripples through every stage), which is the trade-off against carry-lookahead adders.

## Dependency
`fa.v` (and `ha.v`) live in [`../../Multiplier/8bit/`](../../Multiplier/8bit). Compile them together:
```
iverilog -g2012 -o sim addN.v addN_tb.v ../../Multiplier/8bit/fa.v ../../Multiplier/8bit/ha.v && vvp sim
```
