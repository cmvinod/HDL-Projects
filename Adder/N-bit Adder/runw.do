vlib work
vdel -all
vlib work
vlog -f $1.list +acc
#vlog test3.v
vsim work.tb
add wave -r *
#do wave.do
run -all