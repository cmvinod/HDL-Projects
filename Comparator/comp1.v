module comp1(gt,eq,lt,a,b);
output wire gt,eq,lt;
input a,b;

not G1 (abar,a);
not G2 (bbar,b);
and G3 (gt,a,bbar);
and G4 (lt,abar,b);
//xnor G5 (eq,a,b);
nor G5 (eq,gt,lt);

endmodule