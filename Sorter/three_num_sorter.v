module three_num_sorter(Y1,Y2,Y3,A,B,C);
input[7:0] A,B,C;
output[7:0] Y1,Y2,Y3;

wire[7:0] Y1,Y2,Y3;
wire[7:0] out1_sort2num_u1,out2_sort2num_u1;
wire[7:0] out2_sort2num_u2;

two_num_sorter u1 (out1_sort2num_u1,out2_sort2num_u1,A,B);
two_num_sorter u2 (Y1,out2_sort2num_u2,out1_sort2num_u1,C);
two_num_sorter u3 (Y2,Y3,out2_sort2num_u2,out2_sort2num_u1);

//Y1>Y2>Y3
endmodule