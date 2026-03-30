module tb;
reg clk=0; always #5 clk = !clk;
reg rst=1; initial #2 rst = 0;

reg stop_run = 0;
reg next     = 0;
reg inc      = 0;
reg dec      = 0;

reg stop_run_NBA = 0;
reg next_NBA     = 0;
reg inc_NBA      = 0;
reg dec_NBA      = 0;

always @* stop_run_NBA <= stop_run;
always @* next_NBA     <= next;
always @* inc_NBA      <= inc;
always @* dec_NBA      <= dec;

wire[4:0] ghanta;
wire[5:0] nimush,kshan;

//             (clk,rst,stop_run,      inc,     dec,   next,  hrs,min,sec); 
//hmsv2 JAILER (clk,rst stop_run_NBA,next_NBA,inc_NBA,dec_NBA,hrs,min,sec); //port by order

hmsv2 JAILER (//port by name
//.DUT(TB)
.min(nimush),
.rst(rst),
.sec(kshan),
.inc(inc_NBA),
.stop_run(stop_run_NBA),
.dec(dec_NBA),
.hrs(ghanta),
.next(next_NBA),
.clk(clk)
);

initial begin

repeat(300)@(posedge clk);
stop_run=1; @(posedge clk); stop_run=0;

repeat (5) @(posedge clk);
//inc=1;@(posedge clk);inc=0;
stop_run=1;
{inc,dec}=2'b11;@(posedge clk); {inc,dec}=2'b00;
@(posedge clk); stop_run=0;

repeat (5) @(posedge clk);
//inc=1;@(posedge clk);inc=0;
stop_run=1;
{inc,next}=2'b11;@(posedge clk); {inc,next}=2'b00;
@(posedge clk); stop_run=0;


repeat (5) @(posedge clk);
//inc=1;@(posedge clk);inc=0;
{next,inc}=2'b11;@(posedge clk); {inc,next}=2'b00;

repeat(5) @(posedge clk);

{stop_run,next}=2'b11;@(posedge clk); {stop_run,next}=2'b00;

repeat(5) @(posedge clk);

repeat(30) begin
inc=1;@(posedge clk);inc=0;
repeat ($urandom_range(3,10))@(posedge clk);
end
repeat(5) @(posedge clk);

repeat(30) begin
dec=1;@(posedge clk);dec=0;
repeat ($urandom_range(3,10))@(posedge clk);
end
repeat(5) @(posedge clk);
stop_run=1;@(posedge clk); stop_run=0;
repeat(5) @(posedge clk);

$finish;
end


endmodule