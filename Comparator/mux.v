module mux (y,s,i1,i0);

output wire y;
input  s;
input  i1,i0;

not G1 (s_bar,s);
and G2 (p1,s_bar,i0);
and G3 (p2,s,i1);
or  G4 (y,p1,p2);

endmodule