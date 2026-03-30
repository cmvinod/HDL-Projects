module comp8(gt,eq,lt,A,B);
input[7:0]A,B;
output gt,eq,lt;

wire gt,eq,lt;

`ifdef DATAFLOW
assign gt = A>B;
assign eq = A==B;
assign lt = A<B;
`endif

`ifdef STRUCTURAL
wire a,b,c,d,e,f;
wire [2:0] BUS;
comp4 MSB   (a,b,c,A[7:4],B[7:4]);
comp4 LSB   (d,e,f,A[3:0],B[3:0]);
mux3  LEFT  (BUS,c,3'b001,{d,e,f});
mux3  RIGHT ({gt,eq,lt},c,3'b100,BUS);
`endif
endmodule

/*
      -------
     |       | 
 A---|       |-- gt -----------------------------      
[7:4]|       |                               __ |                                  
     |       |-- eq                         |  \|                                   
 B---|       |-- lt----------        _______|0  \                                                            
[7:4] -------               |       |       |    |_____{gt,lt,eq}
					        |       |       |    |
                         	|       | 100___|1  /                                                                     
                            |       |       |__/
      -------    ____    __ |       |              
     |       |  |    |  |  \|       |              
 A---|       |--|gt  |__|0  \       |     
[3:0]|       |--|eq     |    |-------            
 B---|       |--| lt    |    |                 
[3:0] -------     001 __|1  / 
						|__/
				  
				  
				  				  
*/