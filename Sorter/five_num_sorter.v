module five_num_sorter(Y1,Y2,Y3,Y4,Y5,A,B,C,D,E);
input[7:0] A,B,C,D,E;
output[7:0] Y1,Y2,Y3,Y4,Y5;

wire[7:0] out1_sort4num_u1,out2_sort4num_u1,out3_sort4num_u1,out4_sout4num_u1;
wire[7:0] out2_sort2num_u2;

four_num_sorter  u1 (out1_sort4num_u1,out2_sort4num_u1,out3_sort4num_u1,out4_sout4num_u1,A,B,C,D);
two_num_sorter   u2 (Y1,out2_sort2num_u2,out1_sort4num_u1,E);
four_num_sorter  u3 (Y2,Y3,Y4,Y5,out2_sort4num_u1,out3_sort4num_u1,out4_sout4num_u1,out2_sort2num_u2);

//Y1>Y2>Y3>Y4>Y5
/*
                    SORT4NUM              
                    ________                                                                                                            
                   |        |             
               A --| FOUR   |-- OUT1                                                                                            
               B --|  NUM   |-- OUT2                                                                                     
               C --| SORTER |-- OUT3
			   D --|        |-- OUT4 
                   |________|
				   
               

       SORT3NUM                   SORT2NUM
	   ________                   ________                                                                                              
      |        |                 |        |	  
  A --| THREE  |-- OUT1      A --|  TWO   |-- OUT1                                                                                       
  B --|  NUM   |-- OUT2          |  NUM   |                                                                                       
  C --| SORTER |-- OUT3      B --| SORTER |-- OUT2                                                                                          
      |________|                 |________|                                                                                      
                                                                                                                           
*/

endmodule