module comp2(gt,eq,lt, a1,a0,b1,b0);
input a1,a0,b1,b0;
output gt,eq,lt;

wire gt,eq,lt;
wire a,b,c,d,e,f;
wire[2:0] BUS;

// comp1 TENS(a,b,c,a1,b1);
// comp1 UNITS(d,e,f,a0,b0);
// mux3 LEFT(BUS,c,3'b001,{d,e,f});
// mux3 RIGHT ({gt,eq,lt},a,3'b100,BUS);
comp1 TENS  (a,b,c,a1,b1);
comp1 UNITS (d,e,f,a0,b0);

mux3 OUT ({gt,eq,lt},a,3'b100,{d,e,f});

endmodule

/*
  A      B
(A0A1) (B0B1)  gt eq lt
 -----|----- |---------|
| 00  | 00   | 0  1  0 | 
| 00  | 01   | 0  0  1 |
| 00  | 10   | 0  0  1 |
| 00  | 11   | 0  0  1 |
| 01  | 00   | 1  0  0 |
| 01  | 01   | 0  1  0 |
| 01  | 10   | 0  0  1 |
| 01  | 11   | 0  0  1 |
| 10  | 00   | 1  0  0 |
| 10  | 01   | 1  0  0 |
| 10  | 10   | 1  0  0 |
| 10  | 11   | 0  0  1 |
| 11  | 00   | 1  0  0 |
| 11  | 01   | 1  0  0 |
| 11  | 10   | 1  0  0 |
| 11  | 11   | 0  1  0 |
 ----------------------
 
*/