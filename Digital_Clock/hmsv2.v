module hmsv2 (clk,rst,stop_run,inc,dec,next,hrs,min,sec);
input clk,rst,stop_run,next,inc,dec;
output reg [4:0] hrs;
output reg [5:0] min,sec;

wire [5:0] secplus1;
wire [5:0] minplus1;
wire [4:0] hrsplus1;
wire [5:0] secminus1;
wire [5:0] minminus1;
wire [4:0] hrsminus1;

enum {RUN,HB,MB,SB} state; //vlog -sv

assign chk1 = {inc,dec}==2'b11;
assign chk2 = {next,inc}==2'b11;
assign chk3 = {stop_run,next}==2'b11;

always @(posedge clk or posedge rst)
begin
    if(rst) state <= RUN;
	else
	case (state)
	RUN : state <= stop_run ? HB : RUN;
	HB  : if (chk2 | next) state <= MB;
	      else state <= stop_run?RUN:HB;
    MB  : case (next)
	        1 : state <= SB;
			0 : state <= stop_run?RUN:MB;
		  endcase
	SB  : case(1)
	        next     : state <= HB;
			stop_run : state <= RUN;
			default  : state <= SB;
		  endcase
	endcase
end

assign secplus1 = sec==59 ? 0 : (sec+1);
assign minplus1 = min==59 ? 0 : (min+1);
assign hrsplus1 = hrs==23 ? 0 : (hrs+1);

assign secminus1 = sec==0 ? 59 : (sec-1);
assign minminus1 = min==0 ? 59 : (min-1);
assign hrsminus1 = hrs==0 ? 23 : (hrs-1);

always @(posedge clk or posedge rst)
begin
    if(rst) sec <= 0;
	else
	case (state)
	RUN : if (stop_run) sec <= sec;
	      else          sec <= secplus1;
    HB  : if (stop_run) sec <= secplus1;
	      else          sec <= sec;
	MB  : sec <= sec;
    SB  : if (chk1) sec <= sec;
	      else
	      case(1)
	          inc     : sec <= secplus1;  
	          dec     : sec <= secminus1;
              default : sec <= sec;			  
		  endcase
    endcase
end

always @(posedge clk or posedge rst)
begin
    if(rst) min <= 0;
	else
	case (state)
	RUN : if (sec==59) min <= minplus1;
	      else         min <= min;
    HB  : min <= min;
	MB  : if (chk1) min <= min;
	      else
	      case(1)
	          inc     : min<=minplus1;  
	          dec     : min<=minminus1;
              default : min <= min;			  
		  endcase
    SB  : min<=min;
    endcase
end

always @(posedge clk or posedge rst)
begin
    if(rst) hrs <= 0;
	else
	case (state)
	RUN : if({min,sec}=={6'd59,6'd59}) hrs <= hrsplus1;
	      else                         hrs <= hrs;
	MB  : hrs <= hrs;
    SB  : hrs <= hrs;
    HB  : if (chk1) hrs <= hrs;
	      else
	      case (1)
              inc : hrs<=hrsplus1;
              dec : hrs<=hrsminus1;
              default : hrs <= hrs;			  
		  endcase
    endcase		  
end 
	
endmodule