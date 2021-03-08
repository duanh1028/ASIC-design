/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : K-2015.06-SP1
// Date      : Fri May  1 18:17:53 2020
/////////////////////////////////////////////////////////////


module flex_counter_NUM_CNT_BITS4 ( clk, n_rst, clear, count_enable, 
        rollover_val, count_out, rollover_flag );
  input [3:0] rollover_val;
  output [3:0] count_out;
  input clk, n_rst, clear, count_enable;
  output rollover_flag;
  wire   n42, n43, N15, n1, n3, n5, n6, n7, n8, n14, n15, n16, n17, n18, n19,
         n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32, n33,
         n34, n35, n36, n37, n38, n39, n40, n41;
  wire   [3:0] next_count_out;

  DFFSR \count_out_reg[0]  ( .D(next_count_out[0]), .CLK(clk), .R(n_rst), .S(
        1'b1), .Q(count_out[0]) );
  DFFSR \count_out_reg[3]  ( .D(next_count_out[3]), .CLK(clk), .R(n_rst), .S(
        1'b1), .Q(count_out[3]) );
  DFFSR \count_out_reg[1]  ( .D(next_count_out[1]), .CLK(clk), .R(n_rst), .S(
        1'b1), .Q(n43) );
  DFFSR \count_out_reg[2]  ( .D(next_count_out[2]), .CLK(clk), .R(n_rst), .S(
        1'b1), .Q(n42) );
  DFFSR rollover_flag_reg ( .D(N15), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        rollover_flag) );
  AND2X2 U8 ( .A(n26), .B(n24), .Y(n1) );
  XNOR2X1 U9 ( .A(count_out[3]), .B(rollover_val[3]), .Y(n19) );
  XNOR2X1 U10 ( .A(n43), .B(rollover_val[1]), .Y(n18) );
  XNOR2X1 U11 ( .A(count_out[0]), .B(rollover_val[0]), .Y(n6) );
  INVX2 U12 ( .A(n32), .Y(count_out[2]) );
  NOR2X1 U13 ( .A(n28), .B(n5), .Y(n3) );
  INVX1 U14 ( .A(n3), .Y(n30) );
  INVX2 U15 ( .A(n28), .Y(n33) );
  XNOR2X1 U16 ( .A(n42), .B(rollover_val[2]), .Y(n20) );
  INVX1 U17 ( .A(n42), .Y(n32) );
  BUFX2 U18 ( .A(n43), .Y(count_out[1]) );
  NAND2X1 U19 ( .A(n43), .B(count_out[0]), .Y(n5) );
  INVX1 U20 ( .A(n31), .Y(n29) );
  NAND2X1 U21 ( .A(n18), .B(n20), .Y(n14) );
  NAND2X1 U22 ( .A(n19), .B(n6), .Y(n8) );
  INVX2 U23 ( .A(count_enable), .Y(n16) );
  NOR2X1 U24 ( .A(clear), .B(n16), .Y(n7) );
  OAI21X1 U25 ( .A(n14), .B(n8), .C(n7), .Y(n28) );
  NAND2X1 U26 ( .A(n33), .B(count_out[0]), .Y(n25) );
  INVX2 U27 ( .A(clear), .Y(n15) );
  NAND2X1 U28 ( .A(n16), .B(n15), .Y(n26) );
  INVX2 U29 ( .A(rollover_val[0]), .Y(n17) );
  NAND2X1 U30 ( .A(n18), .B(n17), .Y(n23) );
  NAND2X1 U31 ( .A(n20), .B(n19), .Y(n22) );
  NOR2X1 U32 ( .A(clear), .B(count_out[0]), .Y(n21) );
  OAI21X1 U33 ( .A(n23), .B(n22), .C(n21), .Y(n24) );
  MUX2X1 U34 ( .B(n25), .A(n1), .S(count_out[1]), .Y(next_count_out[1]) );
  INVX2 U35 ( .A(n26), .Y(n27) );
  MUX2X1 U36 ( .B(n33), .A(n27), .S(count_out[0]), .Y(n36) );
  INVX2 U37 ( .A(n36), .Y(next_count_out[0]) );
  OAI21X1 U38 ( .A(n28), .B(count_out[1]), .C(n1), .Y(n31) );
  MUX2X1 U39 ( .B(n30), .A(n29), .S(count_out[2]), .Y(next_count_out[2]) );
  NAND2X1 U40 ( .A(n42), .B(n3), .Y(n35) );
  AOI21X1 U41 ( .A(n33), .B(n32), .C(n31), .Y(n34) );
  MUX2X1 U42 ( .B(n35), .A(n34), .S(count_out[3]), .Y(next_count_out[3]) );
  XOR2X1 U43 ( .A(next_count_out[3]), .B(rollover_val[3]), .Y(n41) );
  XNOR2X1 U44 ( .A(n36), .B(rollover_val[0]), .Y(n40) );
  XNOR2X1 U45 ( .A(rollover_val[2]), .B(next_count_out[2]), .Y(n38) );
  XNOR2X1 U46 ( .A(rollover_val[1]), .B(next_count_out[1]), .Y(n37) );
  NAND2X1 U47 ( .A(n38), .B(n37), .Y(n39) );
  NOR3X1 U48 ( .A(n41), .B(n40), .C(n39), .Y(N15) );
endmodule


module stuff_bit_detector ( clk, n_rst, shift_enable, d_orig, 
        stuff_bit_indicator );
  input clk, n_rst, shift_enable, d_orig;
  output stuff_bit_indicator;
  wire   _0_net_, _1_net_, n1;

  flex_counter_NUM_CNT_BITS4 COUNTER ( .clk(clk), .n_rst(n_rst), .clear(
        _0_net_), .count_enable(_1_net_), .rollover_val({1'b0, 1'b1, 1'b1, 
        1'b0}), .rollover_flag(stuff_bit_indicator) );
  AND2X2 U3 ( .A(d_orig), .B(shift_enable), .Y(_1_net_) );
  INVX2 U4 ( .A(shift_enable), .Y(n1) );
  NOR2X1 U5 ( .A(d_orig), .B(n1), .Y(_0_net_) );
endmodule

