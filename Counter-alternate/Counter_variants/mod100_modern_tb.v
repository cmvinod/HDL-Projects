module tb();

reg        clk,rst;
wire [6:0] CNT;

mod100_modern DUT (CNT,clk,rst);

always #5 clk = ~clk;

initial begin
{clk,rst} = 0;
#6;
rst = 1; #2; rst = 0;
#1500 $finish;
end


endmodule