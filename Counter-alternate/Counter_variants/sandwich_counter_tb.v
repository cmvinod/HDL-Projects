module tb;
reg clk,rst;
wire [2:0] cnt;

sandwich_counter DUT (cnt,clk,rst);

always #5 clk=!clk;

initial
begin
rst=0;clk=0;
#1;
rst=1;
#1;
rst=0;
#400;
$finish;
end
endmodule