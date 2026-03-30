module mod100_skip13(CNT,clk,rst);
input clk,rst;
output reg [6:0] CNT;

wire [6:0] din;

`ifdef MY_APPROACH
assign din = (CNT==12)? 6'd14:(CNT==99)? 0 : (CNT+1); 
`endif

assign din = (CNT==99)? 0 : (CNT==12)? 14 : (CNT+1); 

always @(posedge clk,posedge rst) begin
if (rst) CNT <= 0;
else     CNT <= din;
end

endmodule