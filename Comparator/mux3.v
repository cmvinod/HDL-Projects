module mux3 (Y,s,I1,I0);
input[2:0] I1,I0;
input s;
output wire [2:0] Y;

mux u2 (Y[2],s,I1[2],I0[2]);
mux u1 (Y[1],s,I1[1],I0[1]);
mux u0 (Y[0],s,I1[0],I0[0]);

endmodule