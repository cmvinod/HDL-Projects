module four_num_sorter(Y1,Y2,Y3,Y4,A,B,C,D);
input[7:0] A,B,C,D;
output[7:0] Y1,Y2,Y3,Y4;

wire[7:0] out1_sort3num_u1,out2_sort3num_u1,out3_sort3num_u1;
wire[7:0] out2_sort2num_u2;

three_num_sorter u1 (out1_sort3num_u1,out2_sort3num_u1,out3_sort3num_u1,A,B,C);
two_num_sorter   u2 (Y1,out2_sort2num_u2,out1_sort3num_u1,D);
three_num_sorter u3 (Y2,Y3,Y4,out2_sort3num_u1,out3_sort3num_u1,out2_sort2num_u2);

//Y1>Y2>Y3>Y4
/*
       SORT3NUM                   SORT2NUM
	   ________                   ________                                                                                              
      |        |                 |        |	  
  A --| THREE  |-- OUT1      A --|  TWO   |-- OUT1                                                                                       
  B --|  NUM   |-- OUT2          |  NUM   |                                                                                       
  C --| SORTER |-- OUT3      B --| SORTER |-- OUT2                                                                                          
      |________|                 |________|                                                                                      
                                                                                                                           
*/
endmodule