module updown (clk,rst,cnt);
input clk,rstl
output [2:0] cnt;

reg [2:0] cnt;

`ifdef  PREVIOUS_CNT;
reg [2:0] pcnt;

always @(poseddge clk, posedge rst_
vegin
if (rst) pcnt <=1;
else pct <=cnt;
end

always @(posedge clk, posedge rst)
begin
 if(rst) cnt <= 0;
 else
 begin 
 if(cnt ==7) cnt <=6;
 else
 beginif(cnt==0) cnt <=1;
 else
 begin
 cnt <= (pcnt>cnt)? (cnt-1) : (cnt+1);
 end
 end
 end
 end
 `endif
 
 `ifdef FSM
 parameter UP = 0;
 parameter DOWN = 1;
 reg state;
 always @(posedge clk, posedge rst)
 begin
 if(rst) state <= UP;
 else
 case(state)
 UP : state <= cnt==6 ? DOWN :UP;
 DOWN : state <= cnt==1? UP : DOWN;
end

always @(posedge clk, posedge rst)
begin
if(rst) cnt <= 0;
elseif(cnt==7) cnt <= 6;
else
begin
if(cnt==0) cnt <= 1;
else
case(state)
UP : cnt <= cnt+1;
DOWN : cnt <= cnt-1;
endcase
end
end
`endif

`ifdef DOUBLE4

`ifdef VERILOG
 reg[1:0] state;
 parameter UP=0;
 parameter DOWN =1;
 parameter F4=2;
 parameter S4=3;
 `endif
 
 `ifdef SV
 enum {UP,DOWN,F4,S4} state;
 `endif
 
 always @(posedge clk,posedge rst)
 begin
 if(rst) state <= UP;
 else 
 case (state)
 UP : state <= cnt ==7? SOWN : UP;
 DOWN : if (cnt==0) state <= UP;
        else state <= cnt==5? F4 : DOWN;
 F4   : state <= S4;
 S4 : state <= DOWN;
 endcase
 endcase
 always @(posedge clk,posedge rst)
 begin
 if(rst) cnt <= 0;
 else
 if (cnt == 7) cnt <= 6;
 else
 if(cnt ==0) cnt <= 1;
 else
 case(state)
 UP : cnt <= cnt+1;
 DOWN : cnt <= cnt-1;
 F4 : cnt <=4;
 S4 : cnt<=3;
 endcase
 end
 `endif
 endmodule