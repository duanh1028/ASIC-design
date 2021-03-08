/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : K-2015.06-SP1
// Date      : Fri May  1 18:01:30 2020
/////////////////////////////////////////////////////////////


module decode ( clk, n_rst, d_plus, shift_enable, eop, d_orig );
  input clk, n_rst, d_plus, shift_enable, eop;
  output d_orig;
  wire   last_d_plus, n3, n4, n5, n6;

  DFFSR last_d_plus_reg ( .D(d_plus), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        last_d_plus) );
  DFFSR d_orig_reg ( .D(n6), .CLK(clk), .R(1'b1), .S(n_rst), .Q(d_orig) );
  INVX2 U5 ( .A(d_orig), .Y(n3) );
  OAI21X1 U6 ( .A(n3), .B(n4), .C(n5), .Y(n6) );
  NAND2X1 U7 ( .A(shift_enable), .B(n3), .Y(n5) );
  XOR2X1 U8 ( .A(last_d_plus), .B(d_plus), .Y(n4) );
endmodule

