/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : K-2015.06-SP1
// Date      : Fri May  1 18:22:04 2020
/////////////////////////////////////////////////////////////


module flex_counter_NUM_CNT_BITS4_1 ( clk, n_rst, clear, count_enable, 
        rollover_val, count_out, rollover_flag );
  input [3:0] rollover_val;
  output [3:0] count_out;
  input clk, n_rst, clear, count_enable;
  output rollover_flag;
  wire   n50, N15, n6, n7, n8, n9, n10, n11, n12, n14, n15, n16, n17, n18, n19,
         n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32, n33,
         n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44, n45, n46, n47,
         n48, n49;
  wire   [3:0] next_count_out;

  DFFSR \count_out_reg[0]  ( .D(next_count_out[0]), .CLK(clk), .R(n_rst), .S(
        1'b1), .Q(count_out[0]) );
  DFFSR \count_out_reg[1]  ( .D(next_count_out[1]), .CLK(clk), .R(n_rst), .S(
        1'b1), .Q(n50) );
  DFFSR \count_out_reg[3]  ( .D(next_count_out[3]), .CLK(clk), .R(n_rst), .S(
        1'b1), .Q(count_out[3]) );
  DFFSR \count_out_reg[2]  ( .D(next_count_out[2]), .CLK(clk), .R(n_rst), .S(
        1'b1), .Q(count_out[2]) );
  DFFSR rollover_flag_reg ( .D(N15), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        rollover_flag) );
  INVX2 U3 ( .A(n12), .Y(count_out[1]) );
  INVX1 U9 ( .A(n14), .Y(n8) );
  INVX1 U10 ( .A(n12), .Y(n6) );
  AND2X2 U11 ( .A(n43), .B(n12), .Y(n7) );
  MUX2X1 U12 ( .B(n39), .A(n40), .S(n15), .Y(next_count_out[3]) );
  INVX1 U13 ( .A(count_out[0]), .Y(n24) );
  BUFX2 U14 ( .A(n43), .Y(n9) );
  BUFX2 U15 ( .A(n37), .Y(n10) );
  INVX1 U16 ( .A(n24), .Y(n11) );
  INVX2 U17 ( .A(n50), .Y(n12) );
  MUX2X1 U18 ( .B(n33), .A(n34), .S(n14), .Y(next_count_out[2]) );
  XOR2X1 U19 ( .A(n12), .B(rollover_val[1]), .Y(n21) );
  INVX2 U20 ( .A(count_out[2]), .Y(n14) );
  XOR2X1 U21 ( .A(n14), .B(rollover_val[2]), .Y(n23) );
  NAND2X1 U22 ( .A(n21), .B(n23), .Y(n19) );
  INVX2 U23 ( .A(count_out[3]), .Y(n15) );
  XOR2X1 U24 ( .A(n15), .B(rollover_val[3]), .Y(n22) );
  XOR2X1 U25 ( .A(n24), .B(rollover_val[0]), .Y(n16) );
  NAND2X1 U26 ( .A(n22), .B(n16), .Y(n18) );
  INVX2 U27 ( .A(clear), .Y(n28) );
  NAND2X1 U28 ( .A(count_enable), .B(n28), .Y(n30) );
  INVX2 U29 ( .A(n30), .Y(n17) );
  OAI21X1 U30 ( .A(n18), .B(n19), .C(n17), .Y(n37) );
  INVX2 U31 ( .A(n37), .Y(n43) );
  NAND2X1 U32 ( .A(n9), .B(n11), .Y(n31) );
  INVX2 U33 ( .A(rollover_val[0]), .Y(n20) );
  NAND2X1 U34 ( .A(n21), .B(n20), .Y(n26) );
  NAND2X1 U35 ( .A(n23), .B(n22), .Y(n25) );
  OAI21X1 U36 ( .A(n26), .B(n25), .C(n24), .Y(n29) );
  INVX2 U37 ( .A(count_enable), .Y(n27) );
  NAND2X1 U38 ( .A(n28), .B(n27), .Y(n41) );
  OAI21X1 U39 ( .A(n30), .B(n29), .C(n41), .Y(n32) );
  INVX2 U40 ( .A(n32), .Y(n36) );
  MUX2X1 U41 ( .B(n31), .A(n36), .S(n6), .Y(next_count_out[1]) );
  NAND3X1 U42 ( .A(n6), .B(n11), .C(n43), .Y(n34) );
  NOR2X1 U43 ( .A(n7), .B(n32), .Y(n33) );
  INVX2 U44 ( .A(n34), .Y(n35) );
  NAND2X1 U45 ( .A(n8), .B(n35), .Y(n40) );
  OAI21X1 U46 ( .A(n8), .B(n10), .C(n36), .Y(n38) );
  NOR2X1 U47 ( .A(n7), .B(n38), .Y(n39) );
  INVX2 U48 ( .A(n41), .Y(n42) );
  MUX2X1 U49 ( .B(n9), .A(n42), .S(n11), .Y(n44) );
  INVX2 U50 ( .A(n44), .Y(next_count_out[0]) );
  XOR2X1 U51 ( .A(next_count_out[3]), .B(rollover_val[3]), .Y(n49) );
  XNOR2X1 U52 ( .A(n44), .B(rollover_val[0]), .Y(n48) );
  XNOR2X1 U53 ( .A(next_count_out[2]), .B(rollover_val[2]), .Y(n46) );
  XNOR2X1 U54 ( .A(rollover_val[1]), .B(next_count_out[1]), .Y(n45) );
  NAND2X1 U55 ( .A(n46), .B(n45), .Y(n47) );
  NOR3X1 U56 ( .A(n49), .B(n48), .C(n47), .Y(N15) );
endmodule


module flex_counter_NUM_CNT_BITS4_0 ( clk, n_rst, clear, count_enable, 
        rollover_val, count_out, rollover_flag );
  input [3:0] rollover_val;
  output [3:0] count_out;
  input clk, n_rst, clear, count_enable;
  output rollover_flag;
  wire   n45, n46, n47, N15, n6, n9, n10, n11, n12, n13, n14, n16, n17, n18,
         n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32,
         n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44;
  wire   [3:0] next_count_out;

  DFFSR \count_out_reg[1]  ( .D(next_count_out[1]), .CLK(clk), .R(n_rst), .S(
        1'b1), .Q(n46) );
  DFFSR \count_out_reg[0]  ( .D(next_count_out[0]), .CLK(clk), .R(n_rst), .S(
        1'b1), .Q(n47) );
  DFFSR \count_out_reg[2]  ( .D(next_count_out[2]), .CLK(clk), .R(n_rst), .S(
        1'b1), .Q(n45) );
  DFFSR \count_out_reg[3]  ( .D(next_count_out[3]), .CLK(clk), .R(n_rst), .S(
        1'b1), .Q(count_out[3]) );
  DFFSR rollover_flag_reg ( .D(N15), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        rollover_flag) );
  AND2X2 U8 ( .A(n30), .B(n6), .Y(n13) );
  AND2X1 U9 ( .A(n30), .B(n29), .Y(n10) );
  INVX1 U10 ( .A(n11), .Y(n12) );
  INVX2 U11 ( .A(n30), .Y(n11) );
  INVX2 U12 ( .A(n34), .Y(n30) );
  MUX2X1 U13 ( .B(n38), .A(n37), .S(count_out[3]), .Y(next_count_out[3]) );
  AND2X2 U14 ( .A(count_out[1]), .B(n47), .Y(n6) );
  INVX2 U15 ( .A(n13), .Y(n32) );
  INVX1 U16 ( .A(n24), .Y(count_out[0]) );
  INVX2 U17 ( .A(n29), .Y(count_out[1]) );
  XNOR2X1 U18 ( .A(n14), .B(rollover_val[2]), .Y(n17) );
  INVX1 U19 ( .A(n14), .Y(count_out[2]) );
  AND2X2 U20 ( .A(n27), .B(n25), .Y(n9) );
  INVX1 U21 ( .A(count_enable), .Y(n21) );
  INVX1 U22 ( .A(n46), .Y(n29) );
  INVX2 U23 ( .A(n45), .Y(n14) );
  INVX2 U24 ( .A(clear), .Y(n23) );
  INVX2 U25 ( .A(n47), .Y(n24) );
  XOR2X1 U26 ( .A(n24), .B(rollover_val[0]), .Y(n20) );
  XOR2X1 U27 ( .A(n46), .B(rollover_val[1]), .Y(n16) );
  NOR2X1 U28 ( .A(n16), .B(n17), .Y(n19) );
  XNOR2X1 U29 ( .A(count_out[3]), .B(rollover_val[3]), .Y(n18) );
  NAND3X1 U30 ( .A(n20), .B(n18), .C(n19), .Y(n22) );
  NAND3X1 U31 ( .A(n22), .B(n23), .C(count_enable), .Y(n34) );
  NAND2X1 U32 ( .A(n30), .B(count_out[0]), .Y(n26) );
  NAND2X1 U33 ( .A(n23), .B(n21), .Y(n27) );
  NAND3X1 U34 ( .A(n24), .B(n22), .C(n23), .Y(n25) );
  NAND2X1 U35 ( .A(n27), .B(n25), .Y(n36) );
  MUX2X1 U36 ( .B(n26), .A(n9), .S(count_out[1]), .Y(next_count_out[1]) );
  INVX2 U37 ( .A(n27), .Y(n28) );
  MUX2X1 U38 ( .B(n12), .A(n28), .S(count_out[0]), .Y(n39) );
  INVX2 U39 ( .A(n39), .Y(next_count_out[0]) );
  NAND2X1 U40 ( .A(n30), .B(n29), .Y(n33) );
  NOR2X1 U41 ( .A(n36), .B(n10), .Y(n31) );
  MUX2X1 U42 ( .B(n32), .A(n31), .S(count_out[2]), .Y(next_count_out[2]) );
  NAND2X1 U43 ( .A(n13), .B(count_out[2]), .Y(n38) );
  OAI21X1 U44 ( .A(count_out[2]), .B(n11), .C(n33), .Y(n35) );
  NOR2X1 U45 ( .A(n36), .B(n35), .Y(n37) );
  XOR2X1 U46 ( .A(next_count_out[3]), .B(rollover_val[3]), .Y(n44) );
  XOR2X1 U47 ( .A(rollover_val[1]), .B(next_count_out[1]), .Y(n43) );
  XOR2X1 U48 ( .A(n39), .B(rollover_val[0]), .Y(n41) );
  XNOR2X1 U49 ( .A(rollover_val[2]), .B(next_count_out[2]), .Y(n40) );
  NAND2X1 U50 ( .A(n41), .B(n40), .Y(n42) );
  NOR3X1 U51 ( .A(n44), .B(n43), .C(n42), .Y(N15) );
endmodule


module timer ( clk, n_rst, d_edge, rcving, stuff_bit_indicator, shift_enable, 
        byte_received );
  input clk, n_rst, d_edge, rcving, stuff_bit_indicator;
  output shift_enable, byte_received;
  wire   next_byte_received, byte_received_temp, _2_net_, n3, n7, n8, n9, n10,
         n11, n12, n13, n14, n15;
  wire   [3:0] clock_count_out;

  flex_counter_NUM_CNT_BITS4_1 BIT_CLOCK ( .clk(clk), .n_rst(n_rst), .clear(
        d_edge), .count_enable(rcving), .rollover_val({1'b0, 1'b1, 1'b1, 1'b1}), .count_out(clock_count_out) );
  flex_counter_NUM_CNT_BITS4_0 BYTE_CLOCK ( .clk(clk), .n_rst(n_rst), .clear(
        n3), .count_enable(_2_net_), .rollover_val({1'b0, 1'b1, 1'b1, 1'b1}), 
        .rollover_flag(byte_received_temp) );
  INVX2 U6 ( .A(rcving), .Y(n3) );
  DFFSR byte_received_reg ( .D(next_byte_received), .CLK(clk), .R(n_rst), .S(
        1'b1), .Q(byte_received) );
  INVX1 U11 ( .A(clock_count_out[3]), .Y(n13) );
  INVX1 U12 ( .A(n8), .Y(n7) );
  INVX1 U13 ( .A(clock_count_out[0]), .Y(n8) );
  INVX1 U14 ( .A(clock_count_out[2]), .Y(n12) );
  NOR2X1 U15 ( .A(stuff_bit_indicator), .B(clock_count_out[3]), .Y(n10) );
  NOR2X1 U16 ( .A(clock_count_out[2]), .B(n8), .Y(n9) );
  NAND3X1 U17 ( .A(n10), .B(clock_count_out[1]), .C(n9), .Y(n11) );
  INVX2 U18 ( .A(n11), .Y(_2_net_) );
  AND2X2 U19 ( .A(byte_received_temp), .B(_2_net_), .Y(next_byte_received) );
  NAND2X1 U20 ( .A(n13), .B(n12), .Y(n15) );
  NAND2X1 U21 ( .A(n7), .B(clock_count_out[1]), .Y(n14) );
  NOR2X1 U22 ( .A(n15), .B(n14), .Y(shift_enable) );
endmodule

