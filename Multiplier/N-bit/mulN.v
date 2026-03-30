module mulN(Y,A,B);

parameter SIZE = 4;

input[SIZE-1:0] A,B;
output [SIZE*2:0] Y;

genvar i,j;

wire [SIZE-1:0] p[SIZE-1:0];
wire [SIZE*2:0] R[0:SIZE-1],T[0:SIZE-1];
//wire [SIZE*2:0] T [0:SIZE-1];
wire [SIZE*2:0] Y;

for(i=0;i<=SIZE-1;i=i+1) begin
    for(j=0;j<=SIZE-1;j=j+1) begin
	    //and Gij (p[i][j],A[i],B[j]);
		assign p[i][j] = A[i] & B[j];
	end
	
	assign R[i] = p[i]<<i;
	
	if(i==0) assign T[0] = R[0];
	else     assign T[i] = T[i-1] + R[i];
end 

assign Y = T[SIZE-1];
	
endmodule