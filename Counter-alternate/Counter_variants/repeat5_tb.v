module tb();

reg        clk,rst;
wire [1:0] CNT;

repeat5 DUT (CNT,clk,rst);

initial {clk,rst} = 0;

always #5 clk = ~clk;

initial begin
#6; rst = 1; #2; rst = 0;
#300 $finish;
end


endmodule