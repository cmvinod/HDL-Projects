# N-bit multiplier (shift-and-add, `genvar`)

`mulN.v` – parameter `SIZE`. Each bit of `B` selects a shifted copy of `A` (partial product `p[i] = A & B[i]`, shifted left by `i`), and the partial products are summed in a chain: `T[i] = T[i-1] + R[i]`.

`mul4.v` is a fixed 4-bit version; `mul4_tb.v` / `mulN_tb.v` are the testbenches.

## Run
```
iverilog -g2012 -o sim mulN.v mulN_tb.v && vvp sim
```
Prints `A x B = Y` for random operands.

## Status
Simulates and spot-checks correct (for example 292×641 = 187172, 1005×908 = 912540). Fully combinational; the adder chain makes it slow at wide sizes, which is the point of comparison with the column-compression version in `../8bit`. Output is `2·SIZE+1` bits wide (one more than needed).