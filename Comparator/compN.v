module compN (gt,eq,lt,A,B);
parameter N=15;
input[N-1:0] A,B;
output gt,eq,lt;
parameter MSB_UL = N-1;
parameter MSB_LL = N/2;
parameter LSB_UL = MSB_LL-1;
parameter LSB_LL = 0;
wire g,h,i;

initial begin
#1; $display(N);
end

generate
begin
    if(N==1)
        begin
            comp1 G1 (gt,eq,lt,A,B);
        end
    else
        begin
            compN #(.N(N-(N/2))) MSB (a,b,c,A[MSB_UL:MSB_LL],B[MSB_UL:MSB_LL]);
            compN #(.N(N/2)) LSB (d,e,f,A[LSB_UL:LSB_LL],B[LSB_UL:LSB_LL]);
    	    mux3             OUT ({gt,eq,lt},b,{d,e,f},{a,b,c});
        end
    end
endgenerate

endmodule       