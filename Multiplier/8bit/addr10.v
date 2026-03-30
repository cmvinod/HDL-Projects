module addr10(cout,sum,a,b,c,d,e,f,g,h,i,j);
	output[2:0] cout;
	output sum;
	input a,b,c,d,e,f,g,h,i,j;
	
	wire sum;
	wire[2:0] cout;
	wire[2:0] c0;
	wire s0,c1,c2,c3;
	wire nc;
	
	addr9 ADD9 (c0,s0,a,b,c,d,e,f,g,h,i);
	ha    HA1   (c1,sum,s0,j);
	ha    HA2   (c2,cout[0],c0[0],c1);
	ha    HA3   (c3,cout[1],c0[1],c2);
	ha    HA4   (nc,cout[2],c0[2],c3);
	
endmodule