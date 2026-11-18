module fifo #
  ( parameter [3:0] DEPTH = 8,
    parameter [3:0] WIDTH = 8)
  ( input logic             clk,
    input logic             rst,
    input logic             wr,
    input logic             rd,
    input logic[WIDTH-1:0]  din,
    output logic            full,
    output logic            empty,
    output logic[WIDTH-1:0] dout
  );

  logic  [WIDTH-1:0]          mem [DEPTH-1:0];
  logic  [$clog2(DEPTH)-1:0]  rdptr,wrptr;
  logic  [$clog2(DEPTH)-1:0]  wrptrplus1,rdptrplus1;

  typedef enum {EMPTY,PARTIAL,FULL} state_t;
  state_t state;

  //State machine
  always_ff @(posedge clk or posedge rst)
    begin
      if(rst)
        state <= EMPTY;
      else
        case (state)
          EMPTY   : state <= wr? PARTIAL : EMPTY;
          PARTIAL : case ({rd,wr})
                      2'b01   : state <= (wrptrplus1==rdptr)? FULL  :PARTIAL;
                      2'b10   : state <= (rdptrplus1==wrptr)? EMPTY :PARTIAL;
                      default : state <= PARTIAL;
                    endcase
         FULL    : state <= rd? PARTIAL : FULL;
        endcase
    end

  //Write pointer control
  assign wrptrplus1 = (wrptr==DEPTH-1)? 0 : (wrptr+1);
  always_ff @(posedge clk or posedge rst)
    begin
      if(rst)
        wrptr <= 0;
      else
          case (state)
            EMPTY,PARTIAL : wrptr <= wr? wrptrplus1:wrptr;
            FULL          : wrptr <= wrptr;
          endcase
    end

  //Read pointer control
  assign rdptrplus1 = (rdptr==DEPTH-1)? 0 : (rdptr+1);
  always_ff @(posedge clk or posedge rst) begin
    if(rst)
      rdptr <= 0;
    else
      case (state)
        FULL,PARTIAL : rdptr <= rd? rdptrplus1:rdptr;
        EMPTY        : rdptr <= rdptr;
      endcase
  end

  //Datapath
  always_ff @(posedge clk or posedge rst) begin
    if(rst) begin
      for(int i = 0; i<DEPTH; i++) begin
        mem[i] <= 8'b0;
      end
    end else begin
      if(wr && !full) begin
        mem[wrptr] <= din;
      end
    end
  end

  always_ff @(posedge clk or posedge rst) begin
    if(rst) begin
      dout <= 8'b0;
    end else begin
      if(rd && !empty) begin
        dout <= mem[rdptr];
      end
    end
  end

  assign full  = (state==FULL);
  assign empty = (state==EMPTY);

endmodule