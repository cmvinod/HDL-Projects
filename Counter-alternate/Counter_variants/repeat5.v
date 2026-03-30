module repeat5(CNT,clk,rst);
input            clk,rst;
output reg [1:0] CNT;

wire [2:0] din_ICNT;
reg  [2:0] ICNT;
wire [1:0] din_CNT;

assign din_ICNT = (ICNT==5)? 1 : ICNT+1;
assign din_CNT  = (ICNT==5)? CNT+1 : CNT;

always @(posedge clk, posedge rst) begin
if(rst) ICNT <= 1;
else    ICNT <= din_ICNT;
end

always @(posedge clk, posedge rst) begin
if (rst) CNT <= 0;
else     CNT <= din_CNT;
end

endmodule