/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : K-2015.06-SP1
// Date      : Fri May  1 18:20:39 2020
/////////////////////////////////////////////////////////////


module edge_detect ( clk, n_rst, d_plus, d_edge );
  input clk, n_rst, d_plus;
  output d_edge;
  wire   last_d_plus, N1;
  assign d_edge = N1;

  DFFSR last_d_plus_reg ( .D(d_plus), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        last_d_plus) );
  XOR2X1 U4 ( .A(last_d_plus), .B(d_plus), .Y(N1) );
endmodule

