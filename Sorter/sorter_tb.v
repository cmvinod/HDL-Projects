module tb();

`ifdef FIVE
reg[7:0] A,B,C,D,E;
wire[7:0] Y1,Y2,Y3,Y4,Y5;

five_num_sorter DUT (Y1,Y2,Y3,Y4,Y5,A,B,C,D,E);

initial
begin
	A=$random();B=$random();C=$random();D=$random();E=$random();#1;$display("%d : %d : %d : %d : %d --> %d : %d : %d : %d :%d",A,B,C,D,E,Y1,Y2,Y3,Y4,Y5);	
	A=$random();B=$random();C=$random();D=$random();E=$random();#1;$display("%d : %d : %d : %d : %d --> %d : %d : %d : %d :%d",A,B,C,D,E,Y1,Y2,Y3,Y4,Y5);	
	A=$random();B=$random();C=$random();D=$random();E=$random();#1;$display("%d : %d : %d : %d : %d --> %d : %d : %d : %d :%d",A,B,C,D,E,Y1,Y2,Y3,Y4,Y5);	
	A=$random();B=$random();C=$random();D=$random();E=$random();#1;$display("%d : %d : %d : %d : %d --> %d : %d : %d : %d :%d",A,B,C,D,E,Y1,Y2,Y3,Y4,Y5);	
	A=$random();B=$random();C=$random();D=$random();E=$random();#1;$display("%d : %d : %d : %d : %d --> %d : %d : %d : %d :%d",A,B,C,D,E,Y1,Y2,Y3,Y4,Y5);	
end
`endif

`ifdef FOUR

reg[7:0] A,B,C,D;
wire[7:0] Y1,Y2,Y3,Y4;

four_num_sorter DUT (Y1,Y2,Y3,Y4,A,B,C,D);

initial
begin
	A=$random();B=$random();C=$random();D=$random();#1;$display("%d : %d : %d : %d --> %d : %d : %d : %d",A,B,C,D,Y1,Y2,Y3,Y4);	
	A=$random();B=$random();C=$random();D=$random();#1;$display("%d : %d : %d : %d --> %d : %d : %d : %d",A,B,C,D,Y1,Y2,Y3,Y4);	
	A=$random();B=$random();C=$random();D=$random();#1;$display("%d : %d : %d : %d --> %d : %d : %d : %d",A,B,C,D,Y1,Y2,Y3,Y4);	
	A=$random();B=$random();C=$random();D=$random();#1;$display("%d : %d : %d : %d --> %d : %d : %d : %d",A,B,C,D,Y1,Y2,Y3,Y4);	
	A=$random();B=$random();C=$random();D=$random();#1;$display("%d : %d : %d : %d --> %d : %d : %d : %d",A,B,C,D,Y1,Y2,Y3,Y4);	
end
`endif


`ifdef THREE

reg[7:0] A,B,C;
wire[7:0] Y1,Y2,Y3;

three_num_sorter DUT (Y1,Y2,Y3,A,B,C);

initial
begin
	A=$random();B=$random();C=$random();#1;$display("%d : %d : %d --> %d : %d : %d",A,B,C,Y1,Y2,Y3);	
	A=$random();B=$random();C=$random();#1;$display("%d : %d : %d --> %d : %d : %d",A,B,C,Y1,Y2,Y3);	
	A=$random();B=$random();C=$random();#1;$display("%d : %d : %d --> %d : %d : %d",A,B,C,Y1,Y2,Y3);	
	A=$random();B=$random();C=$random();#1;$display("%d : %d : %d --> %d : %d : %d",A,B,C,Y1,Y2,Y3);	
	A=$random();B=$random();C=$random();#1;$display("%d : %d : %d --> %d : %d : %d",A,B,C,Y1,Y2,Y3);	
end
`endif

`ifdef TWO
reg  [7:0] A,B;
wire [7:0] MAX,MIN;

two_num_sorter DUT (MAX,MIN,A,B);

initial
begin
	A=$random();B=$random();#1;$display("%d : %d --> %d : %d",A,B,MAX,MIN);	
	A=$random();B=$random();#1;$display("%d : %d --> %d : %d",A,B,MAX,MIN);	
	A=$random();B=$random();#1;$display("%d : %d --> %d : %d",A,B,MAX,MIN);	
	A=$random();B=$random();#1;$display("%d : %d --> %d : %d",A,B,MAX,MIN);	
	A=$random();B=$random();#1;$display("%d : %d --> %d : %d",A,B,MAX,MIN);	
end
`endif
endmodule