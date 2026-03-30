module tb;

reg clk=0; always begin #5 clk = !clk; end
reg rst=1; initial begin #2 rst = 0; end 	

reg wr,rd;
reg [7:0] din;
wire full,empty;
wire [7:0] dout;

reg wrNBA,rdNBA;

always @(*) wrNBA <= wr;
always @(*) rdNBA <= rd;

fifo  DUT (clk,rst,wr,rd,din,dout,full,empty);

`include "tasks_fifo.txt"

initial
    begin
	    cycles(10);
        wr_en(1);
		wr_en(0);
        cycles(20);
		wr_en(1);
		wr_en(0);
		cycles(20);
		wr_en(1);
		wr_en(0);
		cycles(20);
		wr_en(1);
		wr_en(0);
		cycles(20);
		wr_en(1);
		wr_en(0);
		cycles(20);
		wr_en(1);
		wr_en(0);
		cycles(20);
		wr_en(1);
		wr_en(0);
		cycles(20);
		wr_en(1);
		wr_en(0);
		cycles(20);
		wr_en(1);
		wr_en(0);
		cycles(20);
		wr_en(1);
		wr_en(0);
        $finish;		
	end
endmodule