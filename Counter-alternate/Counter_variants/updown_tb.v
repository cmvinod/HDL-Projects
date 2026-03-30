module tb;
reg clk,rst;
wire[2:0] cnt;

updown KABALI (clk,rst,cnt);

always #5 clk = !clk;

initial {clk,rst} = 0;

initial begin #6; rst = 1; #2; rst = 0;
#300;$finish;
end

endmodule