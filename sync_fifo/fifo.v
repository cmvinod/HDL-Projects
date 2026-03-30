module fifo(clk,rst,wr,rd,din,dout,full,empty);
input clk,rst;
input wr,rd;
input [7:0] din;
output full,empty;
output reg[7:0] dout;

reg[2:0] rdptr,wrptr;
reg [7:0] mem [3:0];
//reg[1:0] state;

enum {EMPTY,PARTIAL,FULL} state;
parameter[2:0] UL = 3'd7; 
parameter[2:0] LL = 0; 

always @(posedge clk or posedge rst)
begin
     if(rst)
         state <= EMPTY;
     else
	     case (state)
		     EMPTY     : state <= wr? PARTIAL : EMPTY;
			 PARTIAL : case {rd,wr}
			            2'b01   : state <= (wrptr+1==rdptr)? FULL  : PARTIAL;
                        2'b10   : state <= (rdptr+1==wptr)? EMPTY : PARTIAL;						
						default : state <= PARTIAL;              
					   endcase
			 FULL    : state <= rd? PARTIAL : FULL;
         endcase			 
end

always @(posedge clk or posedge rst)
begin
    if(rst)
	    wrptr <= 0;
	else
	    if(wr)
		    wrptr <= wrptr+1;
		else
		    wrptr <= wrptr;
end

always @(posedge clk or posedge rst)
begin
    if(rst)
	    rdptr <= 0;
	else
	    if(rd)
		    rdptr <= rdptr + 1;
		else
		    rdptr <= rdptr;	    
end

always @(posedge clk or posedge rst)
begin
	// if(rst)
	// 	mem <= 0;
	// else
		if(wr)
			mem[wrptr] <= din;
		else
			mem[wrptr] <= mem[wrptr];
end

always @(posedge clk or posedge rst)
begin
	if(rst)
		dout <= 0;
	else
		if(rd)
			dout <= mem[rdptr];
		else
			dout <= dout;
end

endmodule