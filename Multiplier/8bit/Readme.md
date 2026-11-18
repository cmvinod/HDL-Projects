# 8×8 unsigned multiplier (structural, column compression)

## Approach
1. 64 AND gates produce the partial products `pXY = A[X] & B[Y]`.
2. Partial products are grouped **by column** (equal bit weight). Each column is reduced by an adder block (`ha`, `fa`, `addr4` … `addr10`) that sums its inputs and passes carries into the next columns, until every column has one result bit.
3. Output `Y[16:0]` – the top bit is the last carry (17 bits are wider than strictly needed for 8×8).

Files: `ha.v`, `fa.v` (built from half adders), `addr4.v`–`addr10.v` (multi-input column adders), `mul8.v` (top level), `tb.v` (testbench, selected with `-Dtb1 -DMUL8`), `var_decl.py` (generates the `wire` declarations), and two spreadsheets (`mul8_pen&paper.xlsx`, `mul8_worked_out.xlsx`) with the hand derivation of the column structure.

## Run
```
iverilog -g2012 -Dtb1 -DMUL8 -o sim mul8.v addr4.v addr5.v addr6.v addr7.v addr8.v addr9.v addr10.v fa.v ha.v tb.v && vvp sim
```
prints `A * B = Y` for random inputs.

## Status
Spot-checked in simulation; products match (for example 36×129 = 4644, 237×140 = 33180). Not yet exhaustively tested; an exhaustive 65,536-case self-checking bench is planned.

## Why this design
It trades the regular but slow array multiplier for a compression layout where carries from one column feed the next. It is the by-hand version of what Wallace/Dadda trees do; the spreadsheets show the working.