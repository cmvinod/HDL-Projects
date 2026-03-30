//A counter which skips multiples of specified value
module abnormal_ctr (clk,rst,cnt);
input clk,rst;
output reg [6:0] cnt;

reg [6:0] ICNT;
reg       state;

parameter ABNORMAL_COUNTER = 0;
parameter NORMAL_COUNTER   = 1;

parameter [6:0] MOD_VAL  = 100;
parameter [6:0] SKIP_VAL = 9;

parameter [6:0] ABNORMAL_COUNTER_UL = MOD_VAL-2;
parameter [6:0] NORMAL_COUNTER_UL   = MOD_VAL-1;
parameter [6:0] ICNT_DEFAULT_VAL    = SKIP_VAL-1;

always @(posedge clk, posedge rst) begin
if(rst) state <= ABNORMAL_COUNTER;
else
if(state) state <= (cnt == NORMAL_COUNTER_UL)  ? ABNORMAL_COUNTER : NORMAL_COUNTER;
else      state <= (cnt == ABNORMAL_COUNTER_UL)? NORMAL_COUNTER   : ABNORMAL_COUNTER;
end

always @(posedge clk or posedge rst) begin
if(rst) ICNT <= ICNT_DEFAULT_VAL;
else  
case (state)
ABNORMAL_COUNTER: if(cnt==(ABNORMAL_COUNTER_UL)) ICNT <= ICNT_DEFAULT_VAL;
                  else ICNT <= (ICNT == cnt)? ICNT+SKIP_VAL : ICNT;

NORMAL_COUNTER  : ICNT <= ICNT_DEFAULT_VAL;
endcase
end

always @(posedge clk, posedge rst) begin
if(rst) cnt = 0;
else
if(state) cnt <= (cnt==NORMAL_COUNTER_UL)? 0 : (cnt+1);
else      
if(cnt==ABNORMAL_COUNTER_UL)cnt <= 0;
else cnt <= (ICNT == cnt)? (cnt+2) : (cnt+1);
end

endmodule
