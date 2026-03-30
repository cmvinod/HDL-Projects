module add4(S,A,B);
input  [3:0] A,B;
output [4:0] S;
wire   [4:0] S;

/*
wire c0,c1,c2,c3;

fa G0 (c0,S[0],A[0],B[0],1'b0);
fa G0 (c1,S[1],A[1],B[1],c0);
fa G0 (c2,S[2],A[2],B[2],c1);
fa G0 (c3,S[3],A[3],B[3],c2);
*/

genvar i;
wire [3:0] c;
for(i=0;i<=3;i=i+1)
    begin
	   if(i==0) fa G0 (c[0],S[0],A[0],B[0],1'b0); //0
	   else     fa Gi  (c[i],S[i],A[i],B[i],c[i-1]); //1,2,3
	end

assign S[4] = c[3];

endmodule