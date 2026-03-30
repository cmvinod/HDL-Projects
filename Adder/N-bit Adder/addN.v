module addN (S,A,B);

parameter SIZE = 4;

input [SIZE-1:0] A,B;
output [SIZE-1:0] S;
wire [SIZE-1:0] S;

genvar i;
wire [SIZE-1:0]c;

for (i=0;i<=SIZE-1;i=i+1) begin
    if(i==0) fa G0 (c[0],S[0],A[0],B[0],1'b0);
	else     fa Gi (c[i],S[i],A[i],B[i],c[i-1]);
end

assign S[SIZE] = c[SIZE-1];
	
endmodule