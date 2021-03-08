/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : K-2015.06-SP1
// Date      : Fri May  1 18:01:17 2020
/////////////////////////////////////////////////////////////


module sync_low ( clk, n_rst, async_in, sync_out );
  input clk, n_rst, async_in;
  output sync_out;
  wire   in;

  DFFSR in_reg ( .D(async_in), .CLK(clk), .R(n_rst), .S(1'b1), .Q(in) );
  DFFSR sync_out_reg ( .D(in), .CLK(clk), .R(n_rst), .S(1'b1), .Q(sync_out) );
endmodule

