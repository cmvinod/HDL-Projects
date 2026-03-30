module tb();

reg        clk,rst;
wire [2:0] CNT;

`ifdef TRADITIONAL 
mod5_traditional DUT (CNT,clk,rst);
`endif

`ifdef MODERN
mod5_modern DUT (CNT,clk,rst);
`endif 

always #5 clk = ~clk;

initial begin
{clk,rst} = 0;
#6;
rst = 1; #2; rst = 0;
#300 $finish;
end


endmodule