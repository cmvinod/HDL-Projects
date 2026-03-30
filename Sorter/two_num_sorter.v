module two_num_sorter(MAX,MIN,A,B);
input[7:0] A,B;
output[7:0] MAX,MIN;

wire[7:0] MAX,MIN;

`ifdef STRUCTURAL
comp8 COMP_A_B    (gt,eq,lt,A,B);
mux16 DESCENDING  ({MAX,MIN},gt,{A,B},{B,A});
`endif

`ifdef DATAFLOW
assign {MAX,MIN} = (A>B)?{A,B}:{B,A};
`endif

endmodule