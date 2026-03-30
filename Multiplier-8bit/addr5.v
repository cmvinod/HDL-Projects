module addr5(cout,sum,a,b,c,d,e);
	output[1:0] cout;
	output sum;
	input a,b,c,d,e;
	
	wire sum;
	wire[1:0] cout;
	wire[1:0] c0;
	wire s0,c1,c2;
	
	addr4 ADD4 (c0,s0,a,b,c,d);
	ha    HA1   (c1,sum,s0,e);
	ha    HA2   (c2,cout[0],c0[0],c1);
	ha    HA3   (nc,cout[1],c0[1],c2);
	
endmodule