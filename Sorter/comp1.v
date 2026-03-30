module comp1(gt,eq,lt,a,b);
input a,b;
output gt,eq,lt;

not (a_bar,a);
not (b_bar,b);
and DHOOM (gt,a,b_bar);
and SOLDIER (lt,a_bar,b);
xnor(eq,a,b);

endmodule



