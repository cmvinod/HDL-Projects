module mul8(Y,A,B);
input  [7:0] A,B;
output [16:0] Y;

wire 	p00,p01,p02,p03,p04,p05,p06,p07,
		p10,p11,p12,p13,p14,p15,p16,p17,
		p20,p21,p22,p23,p24,p25,p26,p27,
		p30,p31,p32,p33,p34,p35,p36,p37,
		p40,p41,p42,p43,p44,p45,p46,p47,
		p50,p51,p52,p53,p54,p55,p56,p57,
		p60,p61,p62,p63,p64,p65,p66,p67,
		p70,p71,p72,p73,p74,p75,p76,p77;
		
wire    c0,c1,c2,c3,c4,c5,c6,c7,c8,c9,
		c10,c11,c12,c13,c14,c15,c16,c17,
		c18,c19,c20,c21,c22,c23,c24,c25,
		c26,c27,c28,c29,c30,c31,c32;

and G00 (p00,A[0],B[0]);
and G10 (p10,A[1],B[0]);
and G20 (p20,A[2],B[0]);
and G30 (p30,A[3],B[0]);
and G40 (p40,A[4],B[0]);
and G50 (p50,A[5],B[0]);
and G60 (p60,A[6],B[0]);
and G70 (p70,A[7],B[0]);

and G01 (p01,A[0],B[1]);
and G11 (p11,A[1],B[1]);
and G21 (p21,A[2],B[1]);
and G31 (p31,A[3],B[1]);
and G41 (p41,A[4],B[1]);
and G51 (p51,A[5],B[1]);
and G61 (p61,A[6],B[1]);
and G71 (p71,A[7],B[1]);

and G02 (p02,A[0],B[2]);
and G12 (p12,A[1],B[2]);
and G22 (p22,A[2],B[2]);
and G32 (p32,A[3],B[2]);
and G42 (p42,A[4],B[2]);
and G52 (p52,A[5],B[2]);
and G62 (p62,A[6],B[2]);
and G72 (p72,A[7],B[2]);

and G03 (p03,A[0],B[3]);
and G13 (p13,A[1],B[3]);
and G23 (p23,A[2],B[3]);
and G33 (p33,A[3],B[3]);
and G43 (p43,A[4],B[3]);
and G53 (p53,A[5],B[3]);
and G63 (p63,A[6],B[3]);
and G73 (p73,A[7],B[3]);

and G04 (p04,A[0],B[4]);
and G14 (p14,A[1],B[4]);
and G24 (p24,A[2],B[4]);
and G34 (p34,A[3],B[4]);
and G44 (p44,A[4],B[4]);
and G54 (p54,A[5],B[4]);
and G64 (p64,A[6],B[4]);
and G74 (p74,A[7],B[4]);

and G05 (p05,A[0],B[5]);
and G15 (p15,A[1],B[5]);
and G25 (p25,A[2],B[5]);
and G35 (p35,A[3],B[5]);
and G45 (p45,A[4],B[5]);
and G55 (p55,A[5],B[5]);
and G65 (p65,A[6],B[5]);
and G75 (p75,A[7],B[5]);

and G06 (p06,A[0],B[6]);
and G16 (p16,A[1],B[6]);
and G26 (p26,A[2],B[6]);
and G36 (p36,A[3],B[6]);
and G46 (p46,A[4],B[6]);
and G56 (p56,A[5],B[6]);
and G66 (p66,A[6],B[6]);
and G76 (p76,A[7],B[6]);

and G07 (p07,A[0],B[7]);
and G17 (p17,A[1],B[7]);
and G27 (p27,A[2],B[7]);
and G37 (p37,A[3],B[7]);
and G47 (p47,A[4],B[7]);
and G57 (p57,A[5],B[7]);
and G67 (p67,A[6],B[7]);
and G77 (p77,A[7],B[7]);

buf    Col0  (              Y[0],  p00);
ha     Col1  (c0,           Y[1],  p10,p01);
addr4  Col2  ({c2,c1},      Y[2],  p20,p11,p02,c0);
addr5  Col3  ({c4,c3},      Y[3],  p30,p21,p12,p03,c1);
addr7  Col4  ({c6,c5},      Y[4],  p40,p31,p22,p13,p04,c2,c3);
addr8  Col5  ({c9,c8,c7},   Y[5],  p50,p41,p32,p23,p14,p05,c4,c5);
addr9  Col6  ({c12,c11,c10},Y[6],  p60,p51,p42,p33,p24,p15,p06,c6,c7);
addr10 Col7  ({c15,c14,c13},Y[7],  p70,p61,p52,p43,p34,p25,p16,p07,c8,c10);
addr10 Col8  ({c18,c17,c16},Y[8],  p71,p62,p53,p44,p35,p26,p17,c9,c11,c13);
addr9  Col9  ({c21,c20,c19},Y[9],  p72,p63,p54,p45,p36,p27,c12,c14,c16);
addr8  Col10 ({c24,c23,c22},Y[10], p73,p64,p55,p46,p37,c15,c17,c19);
addr7  Col11 ({c26,c25},    Y[11], p74,p65,p56,p47,c18,c20,c22);
addr6  Col12 ({c28,c27},    Y[12], p75,p66,p57,c21,c23,c25);
addr5  Col13 ({c30,c29},    Y[13], p76,p67,c24,c26,c27);
fa     Col14 (c31,          Y[14], p77,c28,c29);
ha     Col15 (c32,          Y[15], c30,c31);
buf    Col16 (              Y[16], c32);

endmodule