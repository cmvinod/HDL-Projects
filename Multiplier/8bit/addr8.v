module addr8(cout,sum,a,b,c,d,e,f,g,h);
	output[2:0] cout;
	output sum;
	input a,b,c,d,e,f,g,h;
	
	wire sum;
	wire[2:0] cout;
	wire[1:0] c0;
	wire s0,c1,c2;
	
	addr7 ADD7 (c0,s0,a,b,c,d,e,f,g);
	ha    HA1   (c1,sum,s0,h);
	ha    HA2   (c2,cout[0],c0[0],c1);
	ha    HA3   (cout[2],cout[1],c0[1],c2);
	
endmodule