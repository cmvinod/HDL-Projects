module tb();

reg      clk,rst;
wire [6:0] CNT;

mod100_skip13 DUT (CNT,clk,rst);

initial {clk,rst} = 0;

always #5 clk = ~clk;

initial begin
#6; rst = 1; #2; rst = 0;

#1200 $finish;

end

endmodule