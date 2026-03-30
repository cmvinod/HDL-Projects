`ifdef tb1
module tb;

`ifdef MUL8
reg  [7:0] A,B;
wire [16:0] Y;

mul8 DUT (Y,A,B);

initial 
	begin
		repeat(10)
			begin
				A=$random(); B = $random();#1 $display("%d \t* %d \t= %d",A,B,Y);
			end
	end
	
`endif

`ifdef ADDR10
wire [2:0] cout;
wire sum;
reg a,b,c,d,e,f,g,h,i,j;

addr10 DUT (cout,sum,a,b,c,d,e,f,g,h,i,j);

initial 
	begin
		repeat(10)
		begin
		{a,b,c,d,e,f,g,h,i,j} = $random();
		#1;
		$display("%b\t%b\t%b\t%b\t%b\t%b\t%b\t%b\t%b\t%b\t%d",a,b,c,d,e,f,g,h,i,j,{cout,sum});
	end
	end
`endif	

`ifdef ADDR9
wire [2:0] cout;
wire sum;
reg a,b,c,d,e,f,g,h,i;

addr9 DUT (cout,sum,a,b,c,d,e,f,g,h,i);

initial 
	begin
		repeat(10)
		begin
		{a,b,c,d,e,f,g,h,i} = $random();
		#1;
		$display("%b\t%b\t%b\t%b\t%b\t%b\t%b\t%b\t%b\t%d",a,b,c,d,e,f,g,h,i,{cout,sum});
	end
	end
`endif	

`ifdef ADDR8
wire [2:0] cout;
wire sum;
reg a,b,c,d,e,f,g,h;

addr8 DUT (cout,sum,a,b,c,d,e,f,g,h);

initial 
	begin
		repeat(10)
		begin
		{a,b,c,d,e,f,g,h} = $random();
		#1;
		$display("%b\t%b\t%b\t%b\t%b\t%b\t%b\t%b\t%d",a,b,c,d,e,f,g,h,{cout,sum});
	end
	end
`endif	

`ifdef ADDR7
wire [1:0] cout;
wire sum;
reg a,b,c,d,e,f,g;

addr7 DUT (cout,sum,a,b,c,d,e,f,g);

initial 
	begin
		repeat(10)
		begin
		{a,b,c,d,e,f,g} = $random();
		#1;
		$display("%b\t%b\t%b\t%b\t%b\t%b\t%b\t%d",a,b,c,d,e,f,g,{cout,sum});
	end
	end
`endif
	
`ifdef ADDR6
wire [1:0] cout;
wire sum;
reg a,b,c,d,e,f;

addr6 DUT (cout,sum,a,b,c,d,e,f);

initial 
	begin
		repeat(10)
		begin
		{a,b,c,d,e,f} = $random();
		#1;
		$display("%b\t%b\t%b\t%b\t%b\t%b\t%d",a,b,c,d,e,f,{cout,sum});
	end
	end
`endif

`ifdef ADDR5
wire [1:0] cout;
wire sum;
reg a,b,c,d,e;

addr5 DUT (cout,sum,a,b,c,d,e);

initial 
	begin
		repeat(10)
		begin
		{a,b,c,d,e} = $random();
		#1;
		$display("%b\t%b\t%b\t%b\t%b\t%b\t%d",a,b,c,d,e,{cout,sum});
		end
	end
`endif

`ifdef ADDR4
wire[1:0] cout;
wire sum;
reg a,b,c,d;

addr4 DUT (cout,sum,a,b,c,d);

initial 
	begin
		repeat(10)
		begin
		{a,b,c,d} = $random();
		#1;
		$display("%b\t%b\t%b\t%b\t%d",a,b,c,d,{cout,sum});
		end
	end
`endif

`ifdef FA
wire cout,sum;
reg a,b,c;

fa DUT (cout,sum,a,b,c);

initial 
	begin
		repeat(10)
		begin
		{a,b,c} = $random();
		#1;
		$display("%b\t%b\t%b\t%d",a,b,c,{cout,sum});
		end
	end
`endif

`ifdef HA
wire cout,sum;
reg a,b,c;

ha DUT (cout,sum,a,b);

initial 
	begin
		repeat(10)
		begin
		{a,b} = $random();
		#1;
		$display("%b\t%b\t%d",a,b{cout,sum});
		end
	end
`endif	


endmodule
`endif

`ifdef tb2
module tb;

`ifdef MUL8
reg  [7:0] A,B;
wire [16:0] Y;

mul8 DUT_mul8 (Y,A,B);
`endif

`ifdef ADDR10
wire [2:0] cout;
wire sum;
reg a,b,c,d,e,f,g,h,i,j;

addr10 DUT_addr10 (cout,sum,a,b,c,d,e,f,g,h,i,j);
`endif

`ifdef ADDR9
wire [2:0] cout;
wire sum;
reg a,b,c,d,e,f,g,h,i;

addr9 DUT_addr9 (cout,sum,a,b,c,d,e,f,g,h,i);
`endif

`ifdef ADDR8
wire [2:0] cout;
wire sum;
reg a,b,c,d,e,f,g,h;

addr8 DUT_addr8 (cout,sum,a,b,c,d,e,f,g,h);
`endif

`ifdef ADDR7
wire [1:0] cout;
wire sum;
reg a,b,c,d,e,f,g;

addr7 DUT_addr7 (cout,sum,a,b,c,d,e,f,g);
`endif

`ifdef ADDR6
wire [1:0] cout;
wire sum;
reg a,b,c,d,e,f;

addr6 DUT_addr6 (cout,sum,a,b,c,d,e,f);
`endif

`ifdef ADDR5
wire [1:0] cout;
wire sum;
reg a,b,c,d,e;

addr5 DUT_addr5 (cout,sum,a,b,c,d,e);
`endif

`ifdef ADDR4
wire[1:0] cout;
wire sum;
reg a,b,c,d;

addr4 DUT_addr4 (cout,sum,a,b,c,d);
`endif

`ifdef FA
wire cout,sum;
reg a,b,c;

fa DUT_fa (cout,sum,a,b,c);
`endif

`ifdef HA
wire cout,sum;
reg a,b,c;

ha DUT_ha (cout,sum,a,b);
`endif

initial 
	begin
		repeat(10)
			begin
				`ifdef MUL8
				 A=$random(); B = $random();#1 $display("%d \t* %d \t= %d",A,B,Y);
				 `endif
				 `ifdef ADDR10
				 {a,b,c,d,e,f,g,h,i,j} = $random();
				 #1;
				 $display("%b\t%b\t%b\t%b\t%b\t%b\t%b\t%b\t%b\t%b\t%d",a,b,c,d,e,f,g,h,i,j,{cout,sum});
				 `endif
				 `ifdef ADDR9
				 {a,b,c,d,e,f,g,h,i} = $random();
				 #1;
				 $display("%b\t%b\t%b\t%b\t%b\t%b\t%b\t%b\t%b\t%d",a,b,c,d,e,f,g,h,i,{cout,sum});
				 `endif
				 `ifdef ADDR8
				 {a,b,c,d,e,f,g,h} = $random();
				 #1;
				 $display("%b\t%b\t%b\t%b\t%b\t%b\t%b\t%b\t%d",a,b,c,d,e,f,g,h,{cout,sum});
				 `endif
				 `ifdef ADDR7
				 {a,b,c,d,e,f,g} = $random();
				 #1;
				 $display("%b\t%b\t%b\t%b\t%b\t%b\t%b\t%d",a,b,c,d,e,f,g,{cout,sum});
				 `endif
				 `ifdef ADDR6
				 {a,b,c,d,e,f} = $random();
				 #1;
				 $display("%b\t%b\t%b\t%b\t%b\t%b\t%d",a,b,c,d,e,f,{cout,sum});
				 `endif
				 `ifdef ADDR5
				 {a,b,c,d,e} = $random();
				 #1;
				 $display("%b\t%b\t%b\t%b\t%b\t%d",a,b,c,d,e,{cout,sum});
				 `endif
				 `ifdef ADDR4
				 {a,b,c,d} = $random();
				 #1;
				 $display("%b\t%b\t%b\t%b\t%d",a,b,c,d,{cout,sum});
				 `endif
				 `ifdef FA
				 {a,b,c} = $random();
				 #1;
				 $display("%b\t%b\t%b\t%d",a,b,c,{cout,sum});
				 `endif
				 `ifdef HA
				 {a,b} = $random();
				 #1;
				 $display("%b\t%b\t%d",a,b,{cout,sum});
				 `endif

			end
	end


endmodule
`endif