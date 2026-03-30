module mod100_evencounter(CNT,clk,rst);
input clk,rst;
output reg [6:0] CNT;

wire[6:0] din;

assign din = (CNT==100)? 0 : CNT + 2;

always @(posedge clk,posedge rst) begin
if(rst) CNT <=  0;
else    CNT <= din;

end

endmodule