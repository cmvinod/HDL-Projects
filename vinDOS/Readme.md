# vinDOS

A processor project from the bottom up: first the Hack-style building blocks from *nand2tetris* in HDL (`pseudocodes/`), then a planned **RV32I** core able to run a small Tetris game (the name is a pun on my name and DOS).

## Status
- Done: the chip set in [`pseudocodes/`](pseudocodes): gates, 16-bit muxes/ALU pieces, `Add16`, `ALU`, registers, `PC`, and `RAM8` … `RAM16K`.
- Planned: RV32I pipeline in Verilog/SystemVerilog, instruction memory, simple memory-mapped output, FPGA bring-up.

Inspired by nand2tetris and Bruno Levy's FPGA tutorials (link to be added).
