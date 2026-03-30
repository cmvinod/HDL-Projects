vlib work
vdel -all
vlib work

vlog five_num_sorter.v
vlog four_num_sorter.v
vlog three_num_sorter.v
vlog two_num_sorter.v +define+STRUCTURAL

vlog comp8.v +define+DATAFLOW

vlog mux16.v
vlog mux3.v
vlog mux.v

vlog sorter_tb.v +define+FIVE

vsim work.tb
run -all
