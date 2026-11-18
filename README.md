# HDL-Projects

Small RTL design exercises in Verilog / SystemVerilog, built to practise digital-design fundamentals: combinational structure, FSMs, counters, arithmetic datapaths and FIFOs. Each folder is self-contained and has its own README with what it does, how to run it and its current status.

> Work from my professional and research roles is covered by NDAs and is not in this repository. This repo is a learning portfolio, still evolving
## Projects

| Folder | What it is | Status |
|---|---|---|
| [`Adder/`](Adder) | Ripple-carry adder built from full adders (`genvar`) | needs width fix, see README |
| [`Comparator/`](Comparator) | Recursive N-bit comparator from 1-bit cells and muxes | simulates |
| [`Counter-alternate/`](Counter-alternate) | Mod-5 counter two ways, plus counter variants | simulates; `updown.v` broken |
| [`Digital_Clock/`](Digital_Clock) | 24-hour clock with a set-time FSM | testbench runs; not yet checked against a reference |
| [`Multiplier/`](Multiplier) | 8-bit column-compression multiplier; N-bit shift-and-add | simulates, spot-checked |
| [`Sorter/`](Sorter) | 2- to 5-input 8-bit sorters built hierarchically | dataflow path verified |
| [`sync_fifo/`](sync_fifo) | 8-bit synchronous FIFO | being rewritten |
| [`vinDOS/`](vinDOS) | Hack-style CPU building blocks (nand2tetris HDL) | chips written; RV32I core planned |

## Tools
ModelSim/Questa (`run.do` / `runw.do` scripts and `.list` file lists in each folder). The code also elaborates with Icarus Verilog 12 (`iverilog -g2012`).

## Conventions
- Testbenches in this repo started as waveform/`$display` benches. Self-checking testbenches with assertions are being added.
- Each README has a **Status / known issues** section so you can see what has and has not been verified.