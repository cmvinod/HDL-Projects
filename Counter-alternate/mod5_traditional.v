module mod5_traditional(CNT,clk,rst);
input        clk,rst;
output reg [2:0] CNT;

and G2 (d2,CNT[1],CNT[0]);
xor G1 (d1,CNT[1],CNT[0]);
nor G0 (d0,CNT[2],CNT[0]);

always @(posedge clk, posedge rst)
begin
    if(rst) CNT <= 0;
	else begin
        CNT[2] <= d2;  	
        CNT[1] <= d1;  	
        CNT[0] <= d0;  	
	end
end

/*
always @(posedge clk, posedge rst)
begin
    if(rst) CNT[2]<= 0;
	else begin
        CNT[2] <= d2;  	  	
	end
end

always @(posedge clk, posedge rst)
begin
    if(rst) CNT[1]<= 0;
	else begin        
        CNT[1] <= d1;  	      
	end
end

always @(posedge clk, posedge rst)
begin
    if(rst) CNT[0]<= 0;
	else begin       	
        CNT[0] <= d0;  	
	end
end
*/
endmodule