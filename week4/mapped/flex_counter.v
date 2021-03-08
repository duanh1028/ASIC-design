/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : K-2015.06-SP1
// Date      : Mon Feb 10 20:34:46 2020
/////////////////////////////////////////////////////////////


module flex_counter ( clk, n_rst, clear, count_enable, rollover_val, count_out, 
        rollover_flag );
  input [3:0] rollover_val;
  output [3:0] count_out;
  input clk, n_rst, clear, count_enable;
  output rollover_flag;
  wire   N5, N8, N9, N10, N11, n19, n20, n21, n22, n23, n24, n25, n26, n27,
         n28, n29, n30, n31, n32, n33, n34, n35, N18, N16, N15, n36, n37, n38,
         n39, n40, n41, n42, n43, n44;
  wire   [3:0] next_count_out;

  DFFSR \count_out_reg[3]  ( .D(next_count_out[3]), .CLK(clk), .R(n_rst), .S(
        1'b1), .Q(count_out[3]) );
  DFFSR \count_out_reg[2]  ( .D(next_count_out[2]), .CLK(clk), .R(n_rst), .S(
        1'b1), .Q(count_out[2]) );
  DFFSR \count_out_reg[1]  ( .D(next_count_out[1]), .CLK(clk), .R(n_rst), .S(
        1'b1), .Q(count_out[1]) );
  DFFSR \count_out_reg[0]  ( .D(next_count_out[0]), .CLK(clk), .R(n_rst), .S(
        1'b1), .Q(count_out[0]) );
  DFFSR rollover_flag_reg ( .D(N11), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        rollover_flag) );
  NAND3X1 U13 ( .A(n19), .B(n20), .C(n21), .Y(N5) );
  NOR2X1 U14 ( .A(n22), .B(n23), .Y(n21) );
  XNOR2X1 U15 ( .A(rollover_val[0]), .B(n42), .Y(n23) );
  XNOR2X1 U16 ( .A(rollover_val[3]), .B(n39), .Y(n22) );
  XNOR2X1 U17 ( .A(count_out[2]), .B(rollover_val[2]), .Y(n20) );
  XNOR2X1 U18 ( .A(count_out[1]), .B(rollover_val[1]), .Y(n19) );
  NOR2X1 U19 ( .A(n24), .B(n25), .Y(N11) );
  NAND2X1 U20 ( .A(n26), .B(n27), .Y(n25) );
  XNOR2X1 U21 ( .A(rollover_val[2]), .B(next_count_out[2]), .Y(n27) );
  OAI21X1 U22 ( .A(n28), .B(n40), .C(n29), .Y(next_count_out[2]) );
  NAND2X1 U23 ( .A(N9), .B(n30), .Y(n29) );
  XNOR2X1 U24 ( .A(rollover_val[1]), .B(next_count_out[1]), .Y(n26) );
  OAI21X1 U25 ( .A(n28), .B(n41), .C(n31), .Y(next_count_out[1]) );
  NAND2X1 U26 ( .A(N8), .B(n30), .Y(n31) );
  NAND2X1 U27 ( .A(n32), .B(n33), .Y(n24) );
  XNOR2X1 U28 ( .A(rollover_val[3]), .B(next_count_out[3]), .Y(n33) );
  OAI21X1 U29 ( .A(n28), .B(n39), .C(n34), .Y(next_count_out[3]) );
  NAND2X1 U30 ( .A(N10), .B(n30), .Y(n34) );
  XNOR2X1 U31 ( .A(rollover_val[0]), .B(next_count_out[0]), .Y(n32) );
  OAI21X1 U32 ( .A(n28), .B(n42), .C(n35), .Y(next_count_out[0]) );
  NAND2X1 U33 ( .A(n38), .B(n30), .Y(n35) );
  NOR2X1 U34 ( .A(n37), .B(clear), .Y(n30) );
  OR2X1 U35 ( .A(clear), .B(count_enable), .Y(n28) );
  NAND2X1 U36 ( .A(count_out[2]), .B(N5), .Y(n36) );
  AND2X1 U37 ( .A(count_out[0]), .B(N5), .Y(N15) );
  AND2X1 U38 ( .A(count_out[1]), .B(N5), .Y(N16) );
  AND2X1 U39 ( .A(N5), .B(count_out[3]), .Y(N18) );
  INVX2 U40 ( .A(count_enable), .Y(n37) );
  INVX2 U41 ( .A(N15), .Y(n38) );
  INVX2 U42 ( .A(count_out[3]), .Y(n39) );
  INVX2 U43 ( .A(count_out[2]), .Y(n40) );
  INVX2 U44 ( .A(count_out[1]), .Y(n41) );
  INVX2 U45 ( .A(count_out[0]), .Y(n42) );
  XOR2X1 U46 ( .A(N18), .B(n43), .Y(N10) );
  NOR2X1 U47 ( .A(n44), .B(n36), .Y(n43) );
  XOR2X1 U48 ( .A(n36), .B(n44), .Y(N9) );
  NAND2X1 U49 ( .A(N16), .B(N15), .Y(n44) );
  XOR2X1 U50 ( .A(N16), .B(N15), .Y(N8) );
endmodule

