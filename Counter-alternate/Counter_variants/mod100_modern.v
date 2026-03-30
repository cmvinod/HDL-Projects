module mod100_modern(CNT,clk,rst);
input clk,rst;
output reg [6:0] CNT;

wire[6:0] din;

assign din = (CNT==99)? 0 : CNT+1;

always @(posedge clk, posedge rst)
begin
	if(rst) CNT <= 0;
	else    CNT <= din;
end


endmodule