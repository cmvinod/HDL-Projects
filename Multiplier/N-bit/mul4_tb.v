module tb;



reg [3:0] A,B;
wire [8:0] Y;

mul4 DUT (Y,A,B);

initial begin
    repeat(20) begin
	    A = $random;
	    B= $random;
		#1;
		$display("%d x %d = %d",A,B,Y);
	end
	A=4'b1111;
	B=15;
	#1;
	$display("%d x %d = %d",A,B,Y);
end

endmodule