/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : K-2015.06-SP1
// Date      : Fri May  1 18:18:38 2020
/////////////////////////////////////////////////////////////


module shift_register ( stuff_bit_indicator, clk, n_rst, shift_enable, d_orig, 
        rcv_data );
  output [3:0] rcv_data;
  input stuff_bit_indicator, clk, n_rst, shift_enable, d_orig;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n10, n12, n14, n16;

  DFFSR \rcv_data_reg[0]  ( .D(n16), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        rcv_data[0]) );
  DFFSR \rcv_data_reg[1]  ( .D(n14), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        rcv_data[1]) );
  DFFSR \rcv_data_reg[2]  ( .D(n12), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        rcv_data[2]) );
  DFFSR \rcv_data_reg[3]  ( .D(n10), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        rcv_data[3]) );
  OAI21X1 U2 ( .A(n1), .B(n2), .C(n3), .Y(n10) );
  NAND2X1 U3 ( .A(rcv_data[3]), .B(n1), .Y(n3) );
  OAI22X1 U4 ( .A(n4), .B(n2), .C(n1), .D(n5), .Y(n12) );
  INVX1 U5 ( .A(rcv_data[2]), .Y(n2) );
  OAI22X1 U6 ( .A(n4), .B(n5), .C(n1), .D(n6), .Y(n14) );
  INVX1 U7 ( .A(rcv_data[1]), .Y(n5) );
  OAI21X1 U8 ( .A(n4), .B(n6), .C(n7), .Y(n16) );
  NAND2X1 U9 ( .A(d_orig), .B(n4), .Y(n7) );
  INVX1 U10 ( .A(rcv_data[0]), .Y(n6) );
  INVX1 U11 ( .A(n1), .Y(n4) );
  NAND2X1 U12 ( .A(shift_enable), .B(n8), .Y(n1) );
  INVX1 U13 ( .A(stuff_bit_indicator), .Y(n8) );
endmodule

