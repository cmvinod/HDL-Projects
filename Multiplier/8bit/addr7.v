module addr7(cout,sum,a,b,c,d,e,f,g);
	output[1:0] cout;
	output sum;
	input a,b,c,d,e,f,g;
	
	wire sum;
	wire[1:0] cout;
	wire[1:0] c0;
	wire s0,c1,c2;
	
	addr6 ADD6 (c0,s0,a,b,c,d,e,f);
	ha    HA1   (c1,sum,s0,g);
	ha    HA2   (c2,cout[0],c0[0],c1);
	ha    HA3   (nc,cout[1],c0[1],c2);
	
endmodule