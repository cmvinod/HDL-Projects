module mux(y,s,i1,i0);
input i1,i0;
input s;
output y;

wire y;
wire s_bar,s0,s1;

not G1 (s_bar,s);
and G2 (s0,s_bar,i0);
and G3 (s1,s,i1);
or  G4 (y,s1,s0);

endmodule