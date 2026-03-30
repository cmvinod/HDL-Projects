module mul4(Y,A,B);

input [3:0] A,B;
output [8:0] Y;

genvar i,j;

wire [3:0] p [3:0];
wire [8:0] R0,R1,R2,R3;
wire [8:0] Y;

for (i=0;i<4;i=i+1) begin
    for(j=0;j<4;j=j+1) begin
	    and Gij (p[i][j],A[i],B[j]);
	end
end 

assign R0 = {5'b00000,p[0]};
assign R1 = {4'b0000,p[1],1'b0};
assign R2 = {3'b000,p[2],2'b00};
assign R3 = {2'b00,p[3],3'b000};

assign Y = R0 + R1 + R2 + R3;

endmodule