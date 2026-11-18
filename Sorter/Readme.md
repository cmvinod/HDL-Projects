# Hardware number sorter (2–5 inputs, 8-bit, descending)

Sorts up to five 8-bit values, largest first (`Y1 ≥ Y2 ≥ …`).

## Structure
- `two_num_sorter` – compare-and-swap: a comparator drives a 16-bit mux that swaps the pair.
- `three_num_sorter`, `four_num_sorter`, `five_num_sorter` – built by reusing the smaller sorters (for example the five-input sorter is a four-input sorter, a compare with the fifth value, and a second four-input sorter), instead of writing new logic.
- Comparator hierarchy: `comp1` → `comp2` → `comp4` → `comp8`; muxes `mux`, `mux3`, `mux16`.

Two implementations can be selected with defines:
- `` `define DATAFLOW `` – `assign {MAX,MIN} = (A>B) ? {A,B} : {B,A};`
- `` `define STRUCTURAL `` – gate-level comparator + mux (`comp8`, `mux16`).

## Run
`sorter.do` compiles and runs in ModelSim; `sorter_tb.v` selects the case with `+define+TWO|THREE|FOUR|FIVE`.

**Known issue:** the fully structural two-input path (`comp8` structural + `mux16`) gave wrong/unknown outputs in my Icarus run. The `mux16` block itself checks out on its own, so the fault is somewhere in the structural comparator wiring or define handling. Under investigation; I'll update this README when fixed. The testbench prints results rather than checking them.

## Next steps
Replace the nested sorters with a proper sorting network (Batcher/odd-even), add a self-checking testbench against a sorted reference, and compare area/depth.
