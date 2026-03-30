module sandwich_counter(CNT,clk,rst);
input            clk,rst;
output reg [2:0] CNT;

reg state;

wire[2:0] mod5_CNT,mod7_CNT;
wire mod5_to_mod7,mod7_to_mod5;
wire [2:0] din_count;
wire din_state;

parameter mod5 =0;
parameter mod7 =1;

assign mod5_to_mod7 = (CNT==4)? mod7 : mod5;
assign mod7_to_mod5 = (CNT==6)? mod5 : mod7;
assign din_state    = state   ? mod7_to_mod5 : mod5_to_mod7;

always @(posedge clk,posedge rst) begin
if(rst) state <= mod5;
else    state <= din_state;
end

assign mod5_CNT  = (CNT==4)? 0 : (CNT+1);
assign mod7_CNT  = (CNT==6)? 0 : (CNT+1);
assign din_count = state   ? mod7_CNT : mod5_CNT;
always @(posedge clk,posedge rst) begin
if(rst) CNT <= 0;
else    CNT <= din_count;
end
endmodule