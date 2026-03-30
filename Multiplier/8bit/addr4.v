module addr4(cout,sum,a,b,c,d);
	output[1:0] cout;
	output sum;
	input a,b,c,d;
	
	wire sum;
	wire [1:0] cout;
	wire s0,c0,c1;
	
	fa FA1 (c0,s0,a,b,c);
	ha HA1 (c1,sum,s0,d);
	ha HA2 (cout[1],cout[0],c1,c0);
	
endmodule