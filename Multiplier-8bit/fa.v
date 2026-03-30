module fa(cout,sum,a,b,c);
	output cout,sum;
	input a,b,c;
	
	wire cout,sum,s0,c0,c1,nc;
	
	ha HA1 (c0,s0,a,b);
	ha HA2 (c1,sum,s0,c);
	ha HA3 (nc,cout,c0,c1);
	
endmodule