module tb;

reg  [3:0] A,B;
wire [4:0] S;

add4 DUT (S,A,B);

initial begin
    repeat(20) begin
        A=$random;
		B=$random;
		#1;
		$display ("%d+%d=%d",A,B,S);
	end
end

endmodule