module comp4(gt,eq,lt,A,B);
input[3:0] A,B;
output gt,eq,lt;

wire[2:0] BUS;
wire gt,eq,lt;
wire a,b,c,d,e,f;

comp2 Th_Hu(a,b,c, A[3],A[2],B[3],B[2]);
comp2 TeUni(d,e,f, A[1],A[0],B[1],B[0]);

mux3 LEFT (BUS,c,3'b001,{d,e,f});
mux3 RIGHT ({gt,eq,lt},a,3'b100,BUS);

endmodule