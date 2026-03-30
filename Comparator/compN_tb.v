module tb;

parameter m=15;
parameter k = (m/32)+1;
parameter l = (m-1)/2;
reg [m-1:0] A,B;
wire        gt,eq,lt;

compN #(.N(m)) DUT (gt,eq,lt,A,B);

/* initial begin
#1; $display(l);
end */

initial
    begin
	repeat(20)
	    begin
		A={k{$random}};
		B={k{$random}};
		#1;
		$display (A," ",B,":"," ",gt,eq,lt);
		end
	A={k{$random}};
	B=A;
	#1;$display (A," ",B,":"," ",gt,eq,lt);
	#1;$display ("%b %b",A,B);
	
	end
	
endmodule