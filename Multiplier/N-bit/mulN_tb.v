module tb;

parameter M = 10;
reg [M-1:0] A,B;
wire [M*2:0] Y;

mulN #(.SIZE(M)) DUT (Y,A,B);

initial begin
    repeat(20) begin
	    A = $random;
	    B= $random;
		#1;
		$display("%d x %d = %d",A,B,Y);
	end
	A={M{1'b1}};
	B={M{1'b1}};
	#1;
	$display("%d x %d = %d",A,B,Y);
end

endmodule