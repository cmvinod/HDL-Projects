# Synchronous FIFO

Single-clock FIFO with registered read data, written in SystemVerilog, with a self-checking testbench and an SVA checker.

| | |
|---|---|
| Entries | `DEPTH` (default 8) |
| Data width | `WIDTH` (default 8) |
| Clock / reset | one clock, active-high asynchronous reset |
| Read latency | 1 cycle: `dout` is registered, data appears the cycle after an accepted read |

## Interface
| Signal | Dir | Description |
|---|---|---|
| `clk`, `rst` | in | clock, asynchronous active-high reset |
| `wr`, `din` | in | write request and data; accepted when `wr && !full` |
| `rd` | in | read request; accepted when `rd && !empty` |
| `dout` | out | read data; changes only after an accepted read, cleared to 0 by reset |
| `full`, `empty` | out | status flags, valid in the cycle after the operation that caused them |

**Behaviour**
- A write while `full` and a read while `empty` are ignored (no overflow, no underflow).
- Simultaneous `rd` and `wr`: both happen in the middle of the FIFO. When empty, only the write is accepted; when full, only the read is accepted.
- No bypass: data written in a cycle can be read from the next cycle at the earliest.

## Architecture
- **Memory:** `WIDTH` bits × `DEPTH` entries, written at `wrptr` on an accepted write.
- **Pointers:** `wrptr` and `rdptr` wrap at `DEPTH-1`.
- **State machine:** `EMPTY → PARTIAL → FULL`. `full` and `empty` come straight from the state, so they are registered outputs. The FSM goes to `FULL` when a write makes `wrptr` catch up with `rdptr`, and to `EMPTY` when a read makes `rdptr` catch up with `wrptr`. Because the state is held separately, all `DEPTH` entries are usable, with no wasted slot.

The existing `fifo_tb.v`, `tasks_fifo.txt`, `runw.do` and `wave.do` show the original ModelSim setup.

## To Do:
**Testbench (`fifo_tb.sv`)** - self-checking, with a queue as the reference model:
- Directed cases: fill past full, drain past empty, simultaneous read/write when empty, mid-level and full, streaming at occupancy 1 and `DEPTH-1` (pointer wrap-around), and reset in the middle of operation.
- Constrained-random phases with read/write pressure mixes (write-heavy, read-heavy, balanced).
- Every cycle it checks the read data, both flags, and that `dout` holds when no read is accepted.
- Counts corner cases (reached full/empty, write while full, read while empty, simultaneous read/write at each level) and fails if any was never hit.
- Ends with `PASS`, or `FAIL` and a non-zero exit code, so CI can use it.

**SVA (`fifo_checker.sv`)**