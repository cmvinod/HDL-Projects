vlib work
vdel -all
vlib work

vlog ha.v
vlog fa.v

vlog addr4.v
vlog addr5.v
vlog addr6.v
vlog addr7.v
vlog addr8.v
vlog addr9.v
vlog addr10.v

vlog mul8.v

#TB for all modules listed above is included in the single file tb.v with multiple conditional ifdef.
#To include different module kindly type the filename in CAPS along with +define. Also,just to understand
#usage of ifdef, I have tried using two styles of codig with ifdef and written tb1/tb2,both are same,just different styles.
#e.g. --> For addr7.v modify the below command as vlog tb.v +define+tb1 +define+ADDR7

vlog tb.v +define+tb1 +define+MUL8

vsim work.tb

run -all
