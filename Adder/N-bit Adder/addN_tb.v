module tb;

parameter STB = 1-0;
reg [STB-1:0] A,B;
wire [STB-1:0] S;

addN #(.SIZE(STB)) DUT (S,A,B);

initial begin
    repeat(20) begin
	    A = $random;
		B = $random;
		#1;
		$display("%d+%d=%0d",A,B,S);
	end
	$display("%b+%b=%b",A,B,S);
end


endmodule