/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : K-2015.06-SP1
// Date      : Fri May  1 18:14:25 2020
/////////////////////////////////////////////////////////////


module sync_high ( clk, n_rst, async_in, sync_out );
  input clk, n_rst, async_in;
  output sync_out;
  wire   n4, in;

  DFFSR in_reg ( .D(async_in), .CLK(clk), .R(1'b1), .S(n_rst), .Q(in) );
  DFFSR sync_out_reg ( .D(in), .CLK(clk), .R(1'b1), .S(n_rst), .Q(n4) );
  BUFX4 U5 ( .A(n4), .Y(sync_out) );
endmodule


module sync_low ( clk, n_rst, async_in, sync_out );
  input clk, n_rst, async_in;
  output sync_out;
  wire   in;

  DFFSR in_reg ( .D(async_in), .CLK(clk), .R(n_rst), .S(1'b1), .Q(in) );
  DFFSR sync_out_reg ( .D(in), .CLK(clk), .R(n_rst), .S(1'b1), .Q(sync_out) );
endmodule


module edge_detect ( clk, n_rst, d_plus, d_edge );
  input clk, n_rst, d_plus;
  output d_edge;
  wire   last_d_plus, N1;
  assign d_edge = N1;

  DFFSR last_d_plus_reg ( .D(d_plus), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        last_d_plus) );
  XOR2X1 U4 ( .A(d_plus), .B(last_d_plus), .Y(N1) );
endmodule


module decode ( clk, n_rst, d_plus, shift_enable, eop, d_orig );
  input clk, n_rst, d_plus, shift_enable, eop;
  output d_orig;
  wire   last_d_plus, n4, n5, n6, n3;

  DFFSR last_d_plus_reg ( .D(d_plus), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        last_d_plus) );
  DFFSR d_orig_reg ( .D(n6), .CLK(clk), .R(1'b1), .S(n_rst), .Q(d_orig) );
  OAI21X1 U6 ( .A(n3), .B(n4), .C(n5), .Y(n6) );
  NAND2X1 U7 ( .A(shift_enable), .B(n3), .Y(n5) );
  XOR2X1 U8 ( .A(last_d_plus), .B(d_plus), .Y(n4) );
  INVX2 U5 ( .A(d_orig), .Y(n3) );
endmodule


module eop_detect ( d_plus, d_minus, eop );
  input d_plus, d_minus;
  output eop;


  NOR2X1 U1 ( .A(d_plus), .B(d_minus), .Y(eop) );
endmodule


module flex_counter_NUM_CNT_BITS4_2 ( clk, n_rst, clear, count_enable, 
        rollover_val, count_out, rollover_flag );
  input [3:0] rollover_val;
  output [3:0] count_out;
  input clk, n_rst, clear, count_enable;
  output rollover_flag;
  wire   n57, n1, n2, n3, n5, n6, n11, n12, n14, n15, n16, n17, n18, n19, n20,
         n21, n22, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32, n33, n34,
         n35, n36, n37, n38, n39, n40, n41, n42, n43, n44, n45, n46, n47, n48,
         n49, n50, n51, n52, n53, n54, n55, n56;
  wire   [3:0] next_count_out;

  DFFSR \count_out_reg[0]  ( .D(next_count_out[0]), .CLK(clk), .R(n_rst), .S(
        1'b1), .Q(n57) );
  DFFSR rollover_flag_reg ( .D(n56), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        rollover_flag) );
  DFFSR \count_out_reg[2]  ( .D(next_count_out[2]), .CLK(clk), .R(n_rst), .S(
        1'b1), .Q(count_out[2]) );
  DFFSR \count_out_reg[1]  ( .D(next_count_out[1]), .CLK(clk), .R(n_rst), .S(
        1'b1), .Q(count_out[1]) );
  DFFSR \count_out_reg[3]  ( .D(n6), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[3]) );
  OR2X2 U4 ( .A(n33), .B(n32), .Y(n1) );
  AND2X2 U5 ( .A(n57), .B(n21), .Y(n2) );
  INVX2 U6 ( .A(n28), .Y(n3) );
  INVX2 U8 ( .A(n32), .Y(count_out[0]) );
  INVX1 U9 ( .A(next_count_out[3]), .Y(n5) );
  INVX1 U10 ( .A(n5), .Y(n6) );
  INVX1 U11 ( .A(n50), .Y(next_count_out[0]) );
  AND2X2 U15 ( .A(n28), .B(n22), .Y(n14) );
  NOR2X1 U16 ( .A(n1), .B(n34), .Y(n11) );
  NAND2X1 U17 ( .A(n16), .B(n2), .Y(n27) );
  INVX1 U18 ( .A(n20), .Y(n12) );
  NOR2X1 U19 ( .A(n1), .B(n34), .Y(n44) );
  INVX2 U20 ( .A(rollover_val[1]), .Y(n15) );
  INVX2 U21 ( .A(n20), .Y(n16) );
  XOR2X1 U22 ( .A(next_count_out[1]), .B(n15), .Y(n51) );
  MUX2X1 U23 ( .B(n47), .A(n48), .S(n17), .Y(next_count_out[3]) );
  INVX1 U24 ( .A(n49), .Y(next_count_out[2]) );
  INVX1 U25 ( .A(count_enable), .Y(n22) );
  INVX2 U26 ( .A(count_out[1]), .Y(n21) );
  INVX2 U27 ( .A(count_out[3]), .Y(n17) );
  XOR2X1 U28 ( .A(n17), .B(rollover_val[3]), .Y(n37) );
  INVX2 U29 ( .A(count_out[2]), .Y(n46) );
  XOR2X1 U30 ( .A(n46), .B(rollover_val[2]), .Y(n29) );
  XOR2X1 U31 ( .A(n21), .B(rollover_val[1]), .Y(n36) );
  AND2X2 U32 ( .A(n29), .B(n36), .Y(n19) );
  INVX2 U33 ( .A(n57), .Y(n32) );
  XOR2X1 U34 ( .A(n32), .B(rollover_val[0]), .Y(n18) );
  NAND3X1 U35 ( .A(n37), .B(n19), .C(n18), .Y(n23) );
  INVX2 U36 ( .A(clear), .Y(n28) );
  NAND3X1 U37 ( .A(count_enable), .B(n23), .C(n28), .Y(n20) );
  INVX2 U38 ( .A(n23), .Y(n24) );
  NOR3X1 U39 ( .A(n3), .B(n57), .C(n24), .Y(n25) );
  OAI21X1 U40 ( .A(n14), .B(n25), .C(count_out[1]), .Y(n26) );
  NAND2X1 U41 ( .A(n27), .B(n26), .Y(next_count_out[1]) );
  MUX2X1 U42 ( .B(n12), .A(n14), .S(count_out[0]), .Y(n50) );
  NAND2X1 U43 ( .A(n28), .B(count_enable), .Y(n34) );
  NAND2X1 U44 ( .A(rollover_val[1]), .B(rollover_val[0]), .Y(n31) );
  NAND2X1 U45 ( .A(n37), .B(n29), .Y(n30) );
  OAI21X1 U46 ( .A(n31), .B(n30), .C(count_out[1]), .Y(n33) );
  NAND2X1 U47 ( .A(n57), .B(count_out[1]), .Y(n42) );
  INVX2 U48 ( .A(rollover_val[2]), .Y(n35) );
  NAND2X1 U49 ( .A(count_out[2]), .B(n35), .Y(n40) );
  XNOR2X1 U50 ( .A(rollover_val[0]), .B(n57), .Y(n39) );
  AND2X2 U51 ( .A(n37), .B(n36), .Y(n38) );
  NAND3X1 U52 ( .A(n40), .B(n39), .C(n38), .Y(n41) );
  NAND2X1 U53 ( .A(n42), .B(n41), .Y(n43) );
  AOI21X1 U54 ( .A(count_enable), .B(n43), .C(clear), .Y(n45) );
  MUX2X1 U55 ( .B(n44), .A(n45), .S(count_out[2]), .Y(n49) );
  NAND2X1 U56 ( .A(count_out[2]), .B(n11), .Y(n48) );
  AOI21X1 U57 ( .A(n46), .B(n16), .C(n45), .Y(n47) );
  XOR2X1 U58 ( .A(n49), .B(rollover_val[2]), .Y(n53) );
  XOR2X1 U59 ( .A(n50), .B(rollover_val[0]), .Y(n52) );
  NAND3X1 U60 ( .A(n53), .B(n52), .C(n51), .Y(n55) );
  XOR2X1 U61 ( .A(next_count_out[3]), .B(rollover_val[3]), .Y(n54) );
  NOR2X1 U62 ( .A(n54), .B(n55), .Y(n56) );
endmodule


module stuff_bit_detector ( clk, n_rst, shift_enable, d_orig, 
        stuff_bit_indicator );
  input clk, n_rst, shift_enable, d_orig;
  output stuff_bit_indicator;
  wire   _0_net_, _1_net_, n1, n2, n3, n4;

  flex_counter_NUM_CNT_BITS4_2 COUNTER ( .clk(clk), .n_rst(n_rst), .clear(
        _0_net_), .count_enable(n2), .rollover_val({1'b0, 1'b1, 1'b1, 1'b0}), 
        .rollover_flag(stuff_bit_indicator) );
  INVX2 U3 ( .A(_1_net_), .Y(n1) );
  INVX4 U4 ( .A(n1), .Y(n2) );
  INVX2 U5 ( .A(shift_enable), .Y(n4) );
  INVX2 U6 ( .A(d_orig), .Y(n3) );
  NOR2X1 U7 ( .A(n3), .B(n4), .Y(_1_net_) );
  NOR2X1 U8 ( .A(d_orig), .B(n4), .Y(_0_net_) );
endmodule


module flex_counter_NUM_CNT_BITS4_1 ( clk, n_rst, clear, count_enable, 
        rollover_val, count_out, rollover_flag );
  input [3:0] rollover_val;
  output [3:0] count_out;
  input clk, n_rst, clear, count_enable;
  output rollover_flag;
  wire   n55, n1, n2, n3, n4, n5, n7, n8, n14, n15, n16, n17, n18, n19, n20,
         n21, n22, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32, n33, n34,
         n35, n36, n37, n38, n39, n40, n41, n42, n43, n44, n45, n46, n47, n48,
         n49;
  wire   [3:0] next_count_out;

  DFFSR \count_out_reg[0]  ( .D(next_count_out[0]), .CLK(clk), .R(n_rst), .S(
        1'b1), .Q(n55) );
  DFFSR \count_out_reg[3]  ( .D(n3), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[3]) );
  DFFSR \count_out_reg[1]  ( .D(n48), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[1]) );
  DFFSR \count_out_reg[2]  ( .D(next_count_out[2]), .CLK(clk), .R(n_rst), .S(
        1'b1), .Q(count_out[2]) );
  DFFSR rollover_flag_reg ( .D(n49), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        rollover_flag) );
  AND2X2 U8 ( .A(n16), .B(n18), .Y(n1) );
  BUFX2 U9 ( .A(count_out[3]), .Y(n20) );
  INVX1 U10 ( .A(next_count_out[3]), .Y(n2) );
  INVX1 U11 ( .A(n2), .Y(n3) );
  INVX1 U12 ( .A(n34), .Y(n4) );
  BUFX2 U13 ( .A(n7), .Y(n5) );
  BUFX4 U14 ( .A(n55), .Y(count_out[0]) );
  AND2X2 U15 ( .A(n33), .B(n35), .Y(n7) );
  AND2X2 U16 ( .A(n35), .B(n36), .Y(n8) );
  BUFX2 U17 ( .A(count_out[1]), .Y(n14) );
  INVX1 U18 ( .A(n39), .Y(n17) );
  INVX1 U19 ( .A(n14), .Y(n15) );
  INVX2 U20 ( .A(n15), .Y(n16) );
  BUFX2 U21 ( .A(count_out[0]), .Y(n18) );
  INVX1 U22 ( .A(n7), .Y(n19) );
  AND2X2 U23 ( .A(n7), .B(count_enable), .Y(n21) );
  AND2X2 U24 ( .A(n29), .B(n35), .Y(n22) );
  BUFX2 U25 ( .A(n18), .Y(n23) );
  INVX1 U26 ( .A(count_enable), .Y(n29) );
  INVX2 U27 ( .A(count_out[2]), .Y(n39) );
  XOR2X1 U28 ( .A(n39), .B(rollover_val[2]), .Y(n28) );
  XOR2X1 U29 ( .A(n14), .B(rollover_val[1]), .Y(n25) );
  XOR2X1 U30 ( .A(n20), .B(rollover_val[3]), .Y(n24) );
  NOR2X1 U31 ( .A(n25), .B(n24), .Y(n27) );
  XNOR2X1 U32 ( .A(count_out[0]), .B(rollover_val[0]), .Y(n26) );
  NAND3X1 U33 ( .A(n28), .B(n26), .C(n27), .Y(n33) );
  INVX2 U34 ( .A(clear), .Y(n35) );
  NAND3X1 U35 ( .A(count_enable), .B(n23), .C(n5), .Y(n32) );
  NOR2X1 U36 ( .A(clear), .B(n23), .Y(n30) );
  AOI21X1 U37 ( .A(n30), .B(n4), .C(n22), .Y(n31) );
  MUX2X1 U38 ( .B(n32), .A(n31), .S(n16), .Y(n48) );
  NAND3X1 U39 ( .A(count_enable), .B(n1), .C(n39), .Y(n38) );
  INVX2 U40 ( .A(n33), .Y(n34) );
  OAI21X1 U41 ( .A(n1), .B(n34), .C(count_enable), .Y(n36) );
  NAND2X1 U42 ( .A(n8), .B(n17), .Y(n37) );
  OAI21X1 U43 ( .A(n19), .B(n38), .C(n37), .Y(next_count_out[2]) );
  NAND3X1 U44 ( .A(n17), .B(n1), .C(n21), .Y(n41) );
  AOI21X1 U45 ( .A(n21), .B(n39), .C(n8), .Y(n40) );
  MUX2X1 U46 ( .B(n41), .A(n40), .S(n20), .Y(next_count_out[3]) );
  MUX2X1 U47 ( .B(n21), .A(n22), .S(n23), .Y(n42) );
  INVX2 U48 ( .A(n42), .Y(next_count_out[0]) );
  XOR2X1 U49 ( .A(next_count_out[3]), .B(rollover_val[3]), .Y(n47) );
  XOR2X1 U50 ( .A(rollover_val[1]), .B(n48), .Y(n46) );
  XOR2X1 U51 ( .A(n42), .B(rollover_val[0]), .Y(n44) );
  XNOR2X1 U52 ( .A(rollover_val[2]), .B(next_count_out[2]), .Y(n43) );
  NAND2X1 U53 ( .A(n44), .B(n43), .Y(n45) );
  NOR3X1 U54 ( .A(n46), .B(n47), .C(n45), .Y(n49) );
endmodule


module flex_counter_NUM_CNT_BITS4_0 ( clk, n_rst, clear, count_enable, 
        rollover_val, count_out, rollover_flag );
  input [3:0] rollover_val;
  output [3:0] count_out;
  input clk, n_rst, clear, count_enable;
  output rollover_flag;
  wire   n75, n76, n77, n78, N15, n1, n2, n3, n5, n6, n7, n8, n14, n15, n16,
         n17, n18, n19, n20, n21, n25, n26, n27, n28, n29, n30, n31, n32, n33,
         n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44, n45, n46, n47,
         n48, n49, n50, n51, n52, n53, n54, n55, n56, n57, n58, n59, n60, n61,
         n62, n63, n64, n65, n66, n67, n68, n69;
  wire   [3:0] next_count_out;

  DFFSR \count_out_reg[0]  ( .D(next_count_out[0]), .CLK(clk), .R(n_rst), .S(
        1'b1), .Q(n78) );
  DFFSR \count_out_reg[3]  ( .D(n69), .CLK(clk), .R(n_rst), .S(1'b1), .Q(n75)
         );
  DFFSR \count_out_reg[1]  ( .D(n26), .CLK(clk), .R(n_rst), .S(1'b1), .Q(n77)
         );
  DFFSR \count_out_reg[2]  ( .D(next_count_out[2]), .CLK(clk), .R(n_rst), .S(
        1'b1), .Q(n76) );
  DFFSR rollover_flag_reg ( .D(N15), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        rollover_flag) );
  NAND2X1 U8 ( .A(n50), .B(count_out[0]), .Y(n1) );
  INVX1 U9 ( .A(clear), .Y(n42) );
  INVX2 U10 ( .A(clear), .Y(n5) );
  INVX1 U11 ( .A(n66), .Y(n2) );
  INVX2 U12 ( .A(n2), .Y(n3) );
  INVX1 U13 ( .A(n62), .Y(next_count_out[2]) );
  INVX1 U14 ( .A(n43), .Y(count_out[3]) );
  INVX1 U15 ( .A(n5), .Y(n6) );
  INVX1 U16 ( .A(n59), .Y(n7) );
  INVX2 U17 ( .A(n7), .Y(n8) );
  INVX1 U18 ( .A(n45), .Y(n14) );
  INVX2 U19 ( .A(n14), .Y(n15) );
  NAND2X1 U20 ( .A(n36), .B(n16), .Y(n33) );
  NOR2X1 U21 ( .A(clear), .B(n1), .Y(n16) );
  NAND2X1 U22 ( .A(n19), .B(n18), .Y(n17) );
  XOR2X1 U23 ( .A(n67), .B(rollover_val[0]), .Y(n18) );
  XNOR2X1 U24 ( .A(n20), .B(rollover_val[3]), .Y(n19) );
  NAND2X1 U25 ( .A(n66), .B(n59), .Y(n20) );
  AND2X2 U26 ( .A(n46), .B(count_out[3]), .Y(n21) );
  BUFX4 U27 ( .A(n77), .Y(count_out[1]) );
  INVX2 U28 ( .A(n65), .Y(n59) );
  BUFX4 U29 ( .A(n76), .Y(count_out[2]) );
  BUFX2 U30 ( .A(n78), .Y(count_out[0]) );
  INVX2 U31 ( .A(n51), .Y(n25) );
  INVX1 U32 ( .A(count_out[1]), .Y(n50) );
  NAND2X1 U33 ( .A(n61), .B(n21), .Y(n66) );
  NOR2X1 U34 ( .A(n68), .B(n17), .Y(N15) );
  OAI21X1 U35 ( .A(n35), .B(n34), .C(n33), .Y(n26) );
  INVX2 U36 ( .A(count_enable), .Y(n51) );
  INVX2 U37 ( .A(n78), .Y(n47) );
  OAI21X1 U38 ( .A(n51), .B(n47), .C(count_out[1]), .Y(n35) );
  INVX2 U39 ( .A(n75), .Y(n43) );
  XOR2X1 U40 ( .A(n43), .B(rollover_val[3]), .Y(n31) );
  XOR2X1 U41 ( .A(n47), .B(rollover_val[0]), .Y(n30) );
  XOR2X1 U42 ( .A(rollover_val[2]), .B(count_out[2]), .Y(n28) );
  XOR2X1 U43 ( .A(rollover_val[1]), .B(count_out[1]), .Y(n27) );
  NOR2X1 U44 ( .A(n28), .B(n27), .Y(n29) );
  NAND3X1 U45 ( .A(n31), .B(n30), .C(n29), .Y(n45) );
  OAI21X1 U46 ( .A(n51), .B(n15), .C(n42), .Y(n34) );
  NAND2X1 U47 ( .A(n45), .B(count_enable), .Y(n44) );
  INVX2 U48 ( .A(n44), .Y(n36) );
  NAND2X1 U49 ( .A(n36), .B(n5), .Y(n32) );
  INVX2 U50 ( .A(n32), .Y(n61) );
  NAND2X1 U51 ( .A(count_out[2]), .B(n36), .Y(n40) );
  INVX2 U52 ( .A(count_out[2]), .Y(n46) );
  NAND3X1 U53 ( .A(count_out[1]), .B(n46), .C(count_out[0]), .Y(n37) );
  OAI22X1 U54 ( .A(n51), .B(n37), .C(count_out[1]), .D(n46), .Y(n38) );
  AOI22X1 U55 ( .A(count_out[2]), .B(n51), .C(n38), .D(n15), .Y(n39) );
  OAI21X1 U56 ( .A(count_out[0]), .B(n40), .C(n39), .Y(n41) );
  NAND2X1 U57 ( .A(n42), .B(n41), .Y(n62) );
  NAND2X1 U58 ( .A(count_out[3]), .B(n5), .Y(n58) );
  NOR2X1 U59 ( .A(n44), .B(n43), .Y(n56) );
  NOR2X1 U60 ( .A(count_out[0]), .B(clear), .Y(n55) );
  NOR2X1 U61 ( .A(n14), .B(clear), .Y(n54) );
  NOR2X1 U62 ( .A(n75), .B(n50), .Y(n49) );
  NOR2X1 U63 ( .A(n47), .B(n46), .Y(n48) );
  AOI22X1 U64 ( .A(n75), .B(n50), .C(n49), .D(n48), .Y(n52) );
  NOR2X1 U65 ( .A(n52), .B(n51), .Y(n53) );
  AOI22X1 U66 ( .A(n55), .B(n56), .C(n54), .D(n53), .Y(n57) );
  OAI21X1 U67 ( .A(n25), .B(n58), .C(n57), .Y(n65) );
  NAND2X1 U68 ( .A(n3), .B(n8), .Y(n69) );
  NOR2X1 U69 ( .A(n25), .B(n6), .Y(n60) );
  MUX2X1 U70 ( .B(n61), .A(n60), .S(count_out[0]), .Y(n67) );
  INVX2 U71 ( .A(n67), .Y(next_count_out[0]) );
  XNOR2X1 U72 ( .A(rollover_val[1]), .B(n26), .Y(n64) );
  XOR2X1 U73 ( .A(n62), .B(rollover_val[2]), .Y(n63) );
  NAND2X1 U74 ( .A(n64), .B(n63), .Y(n68) );
endmodule


module timer ( clk, n_rst, d_edge, rcving, stuff_bit_indicator, shift_enable, 
        byte_received );
  input clk, n_rst, d_edge, rcving, stuff_bit_indicator;
  output shift_enable, byte_received;
  wire   next_byte_received, byte_received_temp, _2_net_, n2, n3, n4, n5, n6,
         n7, n9;
  wire   [3:0] clock_count_out;

  DFFSR byte_received_reg ( .D(next_byte_received), .CLK(clk), .R(n_rst), .S(
        1'b1), .Q(byte_received) );
  flex_counter_NUM_CNT_BITS4_1 BIT_CLOCK ( .clk(clk), .n_rst(n_rst), .clear(
        d_edge), .count_enable(rcving), .rollover_val({1'b0, 1'b1, 1'b1, 1'b1}), .count_out(clock_count_out) );
  flex_counter_NUM_CNT_BITS4_0 BYTE_CLOCK ( .clk(clk), .n_rst(n_rst), .clear(
        n9), .count_enable(_2_net_), .rollover_val({1'b0, 1'b1, 1'b1, 1'b1}), 
        .rollover_flag(byte_received_temp) );
  INVX2 U4 ( .A(stuff_bit_indicator), .Y(n4) );
  INVX1 U5 ( .A(_2_net_), .Y(n2) );
  INVX2 U6 ( .A(n2), .Y(n3) );
  INVX2 U7 ( .A(n6), .Y(_2_net_) );
  NAND2X1 U8 ( .A(n4), .B(shift_enable), .Y(n6) );
  INVX4 U9 ( .A(rcving), .Y(n9) );
  NOR2X1 U10 ( .A(clock_count_out[3]), .B(clock_count_out[2]), .Y(n5) );
  NAND3X1 U11 ( .A(clock_count_out[1]), .B(n5), .C(clock_count_out[0]), .Y(n7)
         );
  AND2X2 U12 ( .A(byte_received_temp), .B(n3), .Y(next_byte_received) );
  INVX2 U13 ( .A(n7), .Y(shift_enable) );
endmodule


module shift_register_NUM_BITS8_SHIFT_MSB0 ( stuff_bit_indicator, clk, n_rst, 
        shift_enable, d_orig, rcv_data );
  output [7:0] rcv_data;
  input stuff_bit_indicator, clk, n_rst, shift_enable, d_orig;
  wire   n3, n11, n14, n16, n18, n20, n22, n24, n26, n28, n1, n2, n4, n5, n6,
         n7, n8, n9, n10, n12, n29;

  DFFSR \rcv_data_reg[7]  ( .D(n28), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        rcv_data[7]) );
  DFFSR \rcv_data_reg[6]  ( .D(n26), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        rcv_data[6]) );
  DFFSR \rcv_data_reg[5]  ( .D(n24), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        rcv_data[5]) );
  DFFSR \rcv_data_reg[4]  ( .D(n22), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        rcv_data[4]) );
  DFFSR \rcv_data_reg[3]  ( .D(n20), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        rcv_data[3]) );
  DFFSR \rcv_data_reg[2]  ( .D(n18), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        rcv_data[2]) );
  DFFSR \rcv_data_reg[1]  ( .D(n16), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        rcv_data[1]) );
  DFFSR \rcv_data_reg[0]  ( .D(n14), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        rcv_data[0]) );
  OAI21X1 U2 ( .A(n2), .B(n29), .C(n3), .Y(n14) );
  NAND2X1 U3 ( .A(rcv_data[0]), .B(n2), .Y(n3) );
  OAI22X1 U4 ( .A(n4), .B(n29), .C(n2), .D(n12), .Y(n16) );
  OAI22X1 U6 ( .A(n4), .B(n12), .C(n2), .D(n10), .Y(n18) );
  OAI22X1 U8 ( .A(n4), .B(n10), .C(n2), .D(n9), .Y(n20) );
  OAI22X1 U10 ( .A(n4), .B(n9), .C(n2), .D(n8), .Y(n22) );
  OAI22X1 U12 ( .A(n4), .B(n8), .C(n2), .D(n7), .Y(n24) );
  OAI22X1 U14 ( .A(n4), .B(n7), .C(n2), .D(n6), .Y(n26) );
  OAI21X1 U16 ( .A(n4), .B(n6), .C(n11), .Y(n28) );
  NAND2X1 U17 ( .A(d_orig), .B(n4), .Y(n11) );
  INVX2 U5 ( .A(n1), .Y(n2) );
  AND2X1 U7 ( .A(shift_enable), .B(n5), .Y(n1) );
  INVX2 U9 ( .A(n2), .Y(n4) );
  INVX2 U11 ( .A(stuff_bit_indicator), .Y(n5) );
  INVX2 U13 ( .A(rcv_data[7]), .Y(n6) );
  INVX2 U15 ( .A(rcv_data[6]), .Y(n7) );
  INVX2 U18 ( .A(rcv_data[5]), .Y(n8) );
  INVX2 U19 ( .A(rcv_data[4]), .Y(n9) );
  INVX2 U20 ( .A(rcv_data[3]), .Y(n10) );
  INVX2 U21 ( .A(rcv_data[2]), .Y(n12) );
  INVX2 U30 ( .A(rcv_data[1]), .Y(n29) );
endmodule


module rcu ( pid, clk, n_rst, d_edge, eop, shift_enable, byte_received, 
        rcv_data, rcving, w_enable, r_error, state_output );
  input [3:0] pid;
  input [7:0] rcv_data;
  output [3:0] state_output;
  input clk, n_rst, d_edge, eop, shift_enable, byte_received;
  output rcving, w_enable, r_error;
  wire   n109, n110, n111, n112, n32, n36, n43, n44, n45, n46, n47, n62, n64,
         n67, n81, n82, n83, n84, n5, n6, n7, n8, n9, n10, n12, n13, n14, n15,
         n17, n18, n19, n20, n21, n22, n23, n24, n26, n28, n29, n30, n31, n33,
         n34, n35, n37, n38, n39, n40, n41, n42, n48, n49, n50, n51, n52, n53,
         n54, n55, n56, n57, n58, n59, n60, n61, n63, n65, n66, n68, n69, n70,
         n71, n72, n73, n74, n75, n76, n77, n78, n79, n80, n85, n86, n87, n88,
         n89, n90, n91, n92, n93, n94, n95, n96, n97, n98, n99, n100, n101,
         n102, n103, n104, n105, n106, n107, n108;

  DFFSR \state_reg[0]  ( .D(n84), .CLK(clk), .R(n_rst), .S(1'b1), .Q(n112) );
  DFFSR \state_reg[3]  ( .D(n81), .CLK(clk), .R(n_rst), .S(1'b1), .Q(n109) );
  DFFSR \state_reg[2]  ( .D(n82), .CLK(clk), .R(n_rst), .S(1'b1), .Q(n110) );
  DFFSR \state_reg[1]  ( .D(n83), .CLK(clk), .R(n_rst), .S(1'b1), .Q(n111) );
  NOR2X1 U40 ( .A(n43), .B(n44), .Y(n36) );
  NAND3X1 U41 ( .A(n45), .B(n105), .C(rcv_data[7]), .Y(n44) );
  NAND2X1 U42 ( .A(n46), .B(n47), .Y(n43) );
  NOR2X1 U43 ( .A(rcv_data[6]), .B(rcv_data[5]), .Y(n47) );
  NOR2X1 U44 ( .A(rcv_data[4]), .B(rcv_data[3]), .Y(n46) );
  OAI21X1 U60 ( .A(rcv_data[2]), .B(n45), .C(n67), .Y(n32) );
  NAND3X1 U61 ( .A(rcv_data[1]), .B(n106), .C(rcv_data[3]), .Y(n67) );
  NOR2X1 U62 ( .A(rcv_data[1]), .B(rcv_data[0]), .Y(n45) );
  NAND2X1 U71 ( .A(shift_enable), .B(eop), .Y(n62) );
  AND2X2 U7 ( .A(n26), .B(n33), .Y(n5) );
  INVX2 U8 ( .A(n28), .Y(n6) );
  INVX2 U9 ( .A(n28), .Y(n29) );
  INVX2 U10 ( .A(state_output[0]), .Y(n15) );
  INVX1 U11 ( .A(n29), .Y(n7) );
  NAND2X1 U12 ( .A(n8), .B(n9), .Y(n10) );
  INVX1 U13 ( .A(n109), .Y(n8) );
  INVX1 U14 ( .A(n111), .Y(n9) );
  INVX2 U15 ( .A(n10), .Y(n21) );
  INVX2 U16 ( .A(n49), .Y(state_output[0]) );
  INVX2 U17 ( .A(state_output[3]), .Y(n12) );
  INVX1 U18 ( .A(n109), .Y(n96) );
  BUFX2 U19 ( .A(n24), .Y(n13) );
  INVX1 U20 ( .A(n111), .Y(n24) );
  INVX2 U21 ( .A(n33), .Y(n14) );
  NAND2X1 U22 ( .A(n98), .B(n5), .Y(n38) );
  INVX1 U23 ( .A(n38), .Y(n86) );
  INVX1 U24 ( .A(n112), .Y(n49) );
  INVX1 U25 ( .A(n7), .Y(state_output[2]) );
  INVX1 U26 ( .A(n103), .Y(n17) );
  INVX2 U27 ( .A(eop), .Y(n19) );
  AND2X2 U28 ( .A(n20), .B(n33), .Y(n18) );
  AND2X2 U29 ( .A(shift_enable), .B(n19), .Y(n64) );
  AND2X2 U30 ( .A(state_output[1]), .B(n96), .Y(n20) );
  INVX2 U31 ( .A(n24), .Y(state_output[1]) );
  INVX1 U32 ( .A(n29), .Y(n33) );
  INVX2 U33 ( .A(n110), .Y(n28) );
  INVX4 U34 ( .A(n61), .Y(n94) );
  INVX2 U35 ( .A(n112), .Y(n22) );
  NAND2X1 U36 ( .A(n28), .B(n10), .Y(n23) );
  NAND2X1 U37 ( .A(n23), .B(n101), .Y(n102) );
  INVX1 U38 ( .A(n96), .Y(n26) );
  INVX1 U39 ( .A(n96), .Y(state_output[3]) );
  INVX1 U45 ( .A(n101), .Y(n31) );
  OR2X2 U46 ( .A(n102), .B(n103), .Y(rcving) );
  NAND3X1 U47 ( .A(n26), .B(state_output[1]), .C(n15), .Y(n37) );
  INVX2 U48 ( .A(n37), .Y(n76) );
  NAND3X1 U49 ( .A(state_output[3]), .B(state_output[0]), .C(state_output[1]), 
        .Y(n73) );
  INVX2 U50 ( .A(n73), .Y(n55) );
  INVX2 U51 ( .A(n32), .Y(n72) );
  AOI22X1 U52 ( .A(n64), .B(n76), .C(n55), .D(n72), .Y(n30) );
  NAND2X1 U53 ( .A(n18), .B(n15), .Y(n71) );
  AND2X2 U54 ( .A(n30), .B(n71), .Y(n91) );
  NAND2X1 U55 ( .A(n96), .B(n112), .Y(n101) );
  NAND2X1 U56 ( .A(n31), .B(n13), .Y(n60) );
  NAND2X1 U57 ( .A(n91), .B(n60), .Y(n35) );
  NAND2X1 U58 ( .A(n49), .B(n13), .Y(n51) );
  INVX2 U59 ( .A(n51), .Y(n98) );
  NAND2X1 U63 ( .A(n86), .B(n62), .Y(n65) );
  NAND3X1 U64 ( .A(n22), .B(n6), .C(n24), .Y(n100) );
  NAND2X1 U65 ( .A(n65), .B(n17), .Y(n34) );
  NOR2X1 U66 ( .A(n35), .B(n34), .Y(n59) );
  OAI22X1 U67 ( .A(d_edge), .B(n38), .C(n64), .D(n37), .Y(n40) );
  NAND2X1 U68 ( .A(n18), .B(state_output[0]), .Y(n85) );
  NAND3X1 U69 ( .A(state_output[0]), .B(n14), .C(n20), .Y(n90) );
  OAI21X1 U70 ( .A(byte_received), .B(n85), .C(n90), .Y(n39) );
  OAI21X1 U72 ( .A(n39), .B(n40), .C(n62), .Y(n58) );
  NAND2X1 U73 ( .A(n107), .B(n12), .Y(n42) );
  OAI21X1 U74 ( .A(n26), .B(state_output[2]), .C(n108), .Y(n41) );
  OAI21X1 U75 ( .A(state_output[2]), .B(n42), .C(n41), .Y(n48) );
  NAND3X1 U76 ( .A(state_output[0]), .B(n13), .C(n48), .Y(n57) );
  NAND2X1 U77 ( .A(state_output[1]), .B(n49), .Y(n50) );
  MUX2X1 U78 ( .B(n51), .A(n50), .S(n14), .Y(n80) );
  NAND2X1 U79 ( .A(n108), .B(n80), .Y(n53) );
  NAND2X1 U80 ( .A(state_output[2]), .B(n51), .Y(n52) );
  MUX2X1 U81 ( .B(n53), .A(n52), .S(state_output[3]), .Y(n54) );
  AOI21X1 U82 ( .A(n107), .B(n55), .C(n54), .Y(n56) );
  NAND3X1 U83 ( .A(n58), .B(n57), .C(n56), .Y(n61) );
  MUX2X1 U84 ( .B(n13), .A(n59), .S(n94), .Y(n83) );
  INVX2 U85 ( .A(n60), .Y(n63) );
  OAI21X1 U86 ( .A(n63), .B(n61), .C(state_output[2]), .Y(n70) );
  OAI21X1 U87 ( .A(n36), .B(n71), .C(n65), .Y(n68) );
  NAND3X1 U88 ( .A(n73), .B(n90), .C(n85), .Y(n66) );
  OAI21X1 U89 ( .A(n68), .B(n66), .C(n94), .Y(n69) );
  NAND2X1 U90 ( .A(n70), .B(n69), .Y(n82) );
  INVX2 U91 ( .A(n71), .Y(n75) );
  NAND3X1 U92 ( .A(n29), .B(n22), .C(n21), .Y(n99) );
  OAI21X1 U93 ( .A(n73), .B(n72), .C(n99), .Y(n74) );
  AOI21X1 U94 ( .A(n36), .B(n75), .C(n74), .Y(n78) );
  OAI21X1 U95 ( .A(n76), .B(n86), .C(n104), .Y(n77) );
  AND2X2 U96 ( .A(n78), .B(n77), .Y(n79) );
  OAI21X1 U97 ( .A(n94), .B(n12), .C(n79), .Y(n81) );
  MUX2X1 U98 ( .B(n80), .A(state_output[2]), .S(n26), .Y(n89) );
  INVX2 U99 ( .A(n85), .Y(n87) );
  OAI21X1 U100 ( .A(n87), .B(n86), .C(n104), .Y(n88) );
  NAND2X1 U101 ( .A(n89), .B(n88), .Y(n93) );
  NAND2X1 U102 ( .A(n91), .B(n90), .Y(n92) );
  NOR2X1 U103 ( .A(n93), .B(n92), .Y(n95) );
  MUX2X1 U104 ( .B(n15), .A(n95), .S(n94), .Y(n84) );
  NAND2X1 U105 ( .A(state_output[2]), .B(n12), .Y(n97) );
  NOR2X1 U106 ( .A(n98), .B(n97), .Y(r_error) );
  INVX2 U107 ( .A(n99), .Y(w_enable) );
  INVX2 U108 ( .A(n100), .Y(n103) );
  INVX2 U109 ( .A(n62), .Y(n104) );
  INVX2 U110 ( .A(rcv_data[2]), .Y(n105) );
  INVX2 U111 ( .A(rcv_data[0]), .Y(n106) );
  INVX2 U112 ( .A(byte_received), .Y(n107) );
  INVX2 U113 ( .A(d_edge), .Y(n108) );
endmodule


module fiforam ( wclk, wenable, waddr, raddr, wdata, rdata );
  input [2:0] waddr;
  input [2:0] raddr;
  input [7:0] wdata;
  output [7:0] rdata;
  input wclk, wenable;
  wire   N10, N11, N12, N13, N14, N15, \fiforeg[0][7] , \fiforeg[0][6] ,
         \fiforeg[0][5] , \fiforeg[0][4] , \fiforeg[0][3] , \fiforeg[0][2] ,
         \fiforeg[0][1] , \fiforeg[0][0] , \fiforeg[1][7] , \fiforeg[1][6] ,
         \fiforeg[1][5] , \fiforeg[1][4] , \fiforeg[1][3] , \fiforeg[1][2] ,
         \fiforeg[1][1] , \fiforeg[1][0] , \fiforeg[2][7] , \fiforeg[2][6] ,
         \fiforeg[2][5] , \fiforeg[2][4] , \fiforeg[2][3] , \fiforeg[2][2] ,
         \fiforeg[2][1] , \fiforeg[2][0] , \fiforeg[3][7] , \fiforeg[3][6] ,
         \fiforeg[3][5] , \fiforeg[3][4] , \fiforeg[3][3] , \fiforeg[3][2] ,
         \fiforeg[3][1] , \fiforeg[3][0] , \fiforeg[4][7] , \fiforeg[4][6] ,
         \fiforeg[4][5] , \fiforeg[4][4] , \fiforeg[4][3] , \fiforeg[4][2] ,
         \fiforeg[4][1] , \fiforeg[4][0] , \fiforeg[5][7] , \fiforeg[5][6] ,
         \fiforeg[5][5] , \fiforeg[5][4] , \fiforeg[5][3] , \fiforeg[5][2] ,
         \fiforeg[5][1] , \fiforeg[5][0] , \fiforeg[6][7] , \fiforeg[6][6] ,
         \fiforeg[6][5] , \fiforeg[6][4] , \fiforeg[6][3] , \fiforeg[6][2] ,
         \fiforeg[6][1] , \fiforeg[6][0] , \fiforeg[7][7] , \fiforeg[7][6] ,
         \fiforeg[7][5] , \fiforeg[7][4] , \fiforeg[7][3] , \fiforeg[7][2] ,
         \fiforeg[7][1] , \fiforeg[7][0] , N17, N18, N19, N20, N21, N22, N23,
         N24, n89, n90, n91, n92, n93, n94, n95, n96, n97, n98, n99, n100,
         n101, n102, n103, n104, n105, n106, n107, n108, n109, n110, n111,
         n112, n113, n114, n115, n116, n117, n118, n119, n120, n121, n122,
         n123, n124, n125, n126, n127, n128, n129, n130, n131, n132, n133,
         n134, n135, n136, n137, n138, n139, n140, n141, n142, n143, n144,
         n145, n146, n147, n148, n149, n150, n151, n152, n1, n2, n3, n4, n5,
         n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16, n17, n18, n19, n20,
         n21, n22, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32, n33, n34,
         n35, n36, n37, n38, n39, n40, n41, n42, n43, n44, n45, n46, n47, n48,
         n49, n50, n51, n52, n53, n54, n55, n56, n57, n58, n59, n60, n61, n62,
         n63, n64, n65, n66, n67, n68, n69, n70, n71, n72, n73, n74, n75, n76,
         n77, n78, n79, n80, n81, n82, n83, n84, n85, n86, n87, n88, n153,
         n154, n155, n156, n157, n158, n159, n160, n161, n162, n163, n164,
         n165, n166, n167, n168, n169, n170, n171, n172, n173, n174, n175,
         n176, n177, n178, n179, n180, n181, n182, n183, n184, n185, n186,
         n187, n188, n189, n190, n191, n192, n193, n194, n195, n196, n197,
         n198, n199, n200, n201, n202, n203, n204, n205, n206, n207, n208,
         n209, n210, n211, n212, n213, n214, n215, n216, n217, n218, n219,
         n220, n221, n222, n223, n224, n225, n226, n227, n228, n229, n230,
         n231, n232, n233, n234, n235, n236, n237, n238, n239, n240, n241,
         n242, n243, n244, n245, n246, n247, n248, n249, n250, n251, n252,
         n253, n254, n255, n256, n257, n258, n259, n260, n261, n262, n263,
         n264, n265, n266, n267, n268, n269, n270, n271, n272, n273, n274,
         n275, n276, n277, n278, n279, n280, n281, n282, n283, n284, n285,
         n286, n287, n288, n289, n290, n291, n292, n293, n294, n295, n296,
         n297, n298, n299;
  assign N10 = raddr[0];
  assign N11 = raddr[1];
  assign N12 = raddr[2];
  assign N13 = waddr[0];
  assign N14 = waddr[1];
  assign N15 = waddr[2];

  DFFPOSX1 \fiforeg_reg[0][7]  ( .D(n152), .CLK(wclk), .Q(\fiforeg[0][7] ) );
  DFFPOSX1 \fiforeg_reg[0][6]  ( .D(n151), .CLK(wclk), .Q(\fiforeg[0][6] ) );
  DFFPOSX1 \fiforeg_reg[0][5]  ( .D(n150), .CLK(wclk), .Q(\fiforeg[0][5] ) );
  DFFPOSX1 \fiforeg_reg[0][4]  ( .D(n149), .CLK(wclk), .Q(\fiforeg[0][4] ) );
  DFFPOSX1 \fiforeg_reg[0][3]  ( .D(n148), .CLK(wclk), .Q(\fiforeg[0][3] ) );
  DFFPOSX1 \fiforeg_reg[0][2]  ( .D(n147), .CLK(wclk), .Q(\fiforeg[0][2] ) );
  DFFPOSX1 \fiforeg_reg[0][1]  ( .D(n146), .CLK(wclk), .Q(\fiforeg[0][1] ) );
  DFFPOSX1 \fiforeg_reg[0][0]  ( .D(n145), .CLK(wclk), .Q(\fiforeg[0][0] ) );
  DFFPOSX1 \fiforeg_reg[1][7]  ( .D(n144), .CLK(wclk), .Q(\fiforeg[1][7] ) );
  DFFPOSX1 \fiforeg_reg[1][6]  ( .D(n143), .CLK(wclk), .Q(\fiforeg[1][6] ) );
  DFFPOSX1 \fiforeg_reg[1][5]  ( .D(n142), .CLK(wclk), .Q(\fiforeg[1][5] ) );
  DFFPOSX1 \fiforeg_reg[1][4]  ( .D(n141), .CLK(wclk), .Q(\fiforeg[1][4] ) );
  DFFPOSX1 \fiforeg_reg[1][3]  ( .D(n140), .CLK(wclk), .Q(\fiforeg[1][3] ) );
  DFFPOSX1 \fiforeg_reg[1][2]  ( .D(n139), .CLK(wclk), .Q(\fiforeg[1][2] ) );
  DFFPOSX1 \fiforeg_reg[1][1]  ( .D(n138), .CLK(wclk), .Q(\fiforeg[1][1] ) );
  DFFPOSX1 \fiforeg_reg[1][0]  ( .D(n137), .CLK(wclk), .Q(\fiforeg[1][0] ) );
  DFFPOSX1 \fiforeg_reg[2][7]  ( .D(n136), .CLK(wclk), .Q(\fiforeg[2][7] ) );
  DFFPOSX1 \fiforeg_reg[2][6]  ( .D(n135), .CLK(wclk), .Q(\fiforeg[2][6] ) );
  DFFPOSX1 \fiforeg_reg[2][5]  ( .D(n134), .CLK(wclk), .Q(\fiforeg[2][5] ) );
  DFFPOSX1 \fiforeg_reg[2][4]  ( .D(n133), .CLK(wclk), .Q(\fiforeg[2][4] ) );
  DFFPOSX1 \fiforeg_reg[2][3]  ( .D(n132), .CLK(wclk), .Q(\fiforeg[2][3] ) );
  DFFPOSX1 \fiforeg_reg[2][2]  ( .D(n131), .CLK(wclk), .Q(\fiforeg[2][2] ) );
  DFFPOSX1 \fiforeg_reg[2][1]  ( .D(n130), .CLK(wclk), .Q(\fiforeg[2][1] ) );
  DFFPOSX1 \fiforeg_reg[2][0]  ( .D(n129), .CLK(wclk), .Q(\fiforeg[2][0] ) );
  DFFPOSX1 \fiforeg_reg[3][7]  ( .D(n128), .CLK(wclk), .Q(\fiforeg[3][7] ) );
  DFFPOSX1 \fiforeg_reg[3][6]  ( .D(n127), .CLK(wclk), .Q(\fiforeg[3][6] ) );
  DFFPOSX1 \fiforeg_reg[3][5]  ( .D(n126), .CLK(wclk), .Q(\fiforeg[3][5] ) );
  DFFPOSX1 \fiforeg_reg[3][4]  ( .D(n125), .CLK(wclk), .Q(\fiforeg[3][4] ) );
  DFFPOSX1 \fiforeg_reg[3][3]  ( .D(n124), .CLK(wclk), .Q(\fiforeg[3][3] ) );
  DFFPOSX1 \fiforeg_reg[3][2]  ( .D(n123), .CLK(wclk), .Q(\fiforeg[3][2] ) );
  DFFPOSX1 \fiforeg_reg[3][1]  ( .D(n122), .CLK(wclk), .Q(\fiforeg[3][1] ) );
  DFFPOSX1 \fiforeg_reg[3][0]  ( .D(n121), .CLK(wclk), .Q(\fiforeg[3][0] ) );
  DFFPOSX1 \fiforeg_reg[4][7]  ( .D(n120), .CLK(wclk), .Q(\fiforeg[4][7] ) );
  DFFPOSX1 \fiforeg_reg[4][6]  ( .D(n119), .CLK(wclk), .Q(\fiforeg[4][6] ) );
  DFFPOSX1 \fiforeg_reg[4][5]  ( .D(n118), .CLK(wclk), .Q(\fiforeg[4][5] ) );
  DFFPOSX1 \fiforeg_reg[4][4]  ( .D(n117), .CLK(wclk), .Q(\fiforeg[4][4] ) );
  DFFPOSX1 \fiforeg_reg[4][3]  ( .D(n116), .CLK(wclk), .Q(\fiforeg[4][3] ) );
  DFFPOSX1 \fiforeg_reg[4][2]  ( .D(n115), .CLK(wclk), .Q(\fiforeg[4][2] ) );
  DFFPOSX1 \fiforeg_reg[4][1]  ( .D(n114), .CLK(wclk), .Q(\fiforeg[4][1] ) );
  DFFPOSX1 \fiforeg_reg[4][0]  ( .D(n113), .CLK(wclk), .Q(\fiforeg[4][0] ) );
  DFFPOSX1 \fiforeg_reg[5][7]  ( .D(n112), .CLK(wclk), .Q(\fiforeg[5][7] ) );
  DFFPOSX1 \fiforeg_reg[5][6]  ( .D(n111), .CLK(wclk), .Q(\fiforeg[5][6] ) );
  DFFPOSX1 \fiforeg_reg[5][5]  ( .D(n110), .CLK(wclk), .Q(\fiforeg[5][5] ) );
  DFFPOSX1 \fiforeg_reg[5][4]  ( .D(n109), .CLK(wclk), .Q(\fiforeg[5][4] ) );
  DFFPOSX1 \fiforeg_reg[5][3]  ( .D(n108), .CLK(wclk), .Q(\fiforeg[5][3] ) );
  DFFPOSX1 \fiforeg_reg[5][2]  ( .D(n107), .CLK(wclk), .Q(\fiforeg[5][2] ) );
  DFFPOSX1 \fiforeg_reg[5][1]  ( .D(n106), .CLK(wclk), .Q(\fiforeg[5][1] ) );
  DFFPOSX1 \fiforeg_reg[5][0]  ( .D(n105), .CLK(wclk), .Q(\fiforeg[5][0] ) );
  DFFPOSX1 \fiforeg_reg[6][7]  ( .D(n104), .CLK(wclk), .Q(\fiforeg[6][7] ) );
  DFFPOSX1 \fiforeg_reg[6][6]  ( .D(n103), .CLK(wclk), .Q(\fiforeg[6][6] ) );
  DFFPOSX1 \fiforeg_reg[6][5]  ( .D(n102), .CLK(wclk), .Q(\fiforeg[6][5] ) );
  DFFPOSX1 \fiforeg_reg[6][4]  ( .D(n101), .CLK(wclk), .Q(\fiforeg[6][4] ) );
  DFFPOSX1 \fiforeg_reg[6][3]  ( .D(n100), .CLK(wclk), .Q(\fiforeg[6][3] ) );
  DFFPOSX1 \fiforeg_reg[6][2]  ( .D(n99), .CLK(wclk), .Q(\fiforeg[6][2] ) );
  DFFPOSX1 \fiforeg_reg[6][1]  ( .D(n98), .CLK(wclk), .Q(\fiforeg[6][1] ) );
  DFFPOSX1 \fiforeg_reg[6][0]  ( .D(n97), .CLK(wclk), .Q(\fiforeg[6][0] ) );
  DFFPOSX1 \fiforeg_reg[7][7]  ( .D(n96), .CLK(wclk), .Q(\fiforeg[7][7] ) );
  DFFPOSX1 \fiforeg_reg[7][6]  ( .D(n95), .CLK(wclk), .Q(\fiforeg[7][6] ) );
  DFFPOSX1 \fiforeg_reg[7][5]  ( .D(n94), .CLK(wclk), .Q(\fiforeg[7][5] ) );
  DFFPOSX1 \fiforeg_reg[7][4]  ( .D(n93), .CLK(wclk), .Q(\fiforeg[7][4] ) );
  DFFPOSX1 \fiforeg_reg[7][3]  ( .D(n92), .CLK(wclk), .Q(\fiforeg[7][3] ) );
  DFFPOSX1 \fiforeg_reg[7][2]  ( .D(n91), .CLK(wclk), .Q(\fiforeg[7][2] ) );
  DFFPOSX1 \fiforeg_reg[7][1]  ( .D(n90), .CLK(wclk), .Q(\fiforeg[7][1] ) );
  DFFPOSX1 \fiforeg_reg[7][0]  ( .D(n89), .CLK(wclk), .Q(\fiforeg[7][0] ) );
  INVX8 U2 ( .A(wenable), .Y(n219) );
  AND2X2 U3 ( .A(n16), .B(n279), .Y(n1) );
  AND2X2 U4 ( .A(n7), .B(n191), .Y(n2) );
  AND2X2 U5 ( .A(n6), .B(n191), .Y(n3) );
  INVX4 U6 ( .A(N15), .Y(n5) );
  INVX1 U7 ( .A(n191), .Y(n4) );
  INVX1 U8 ( .A(n5), .Y(n6) );
  INVX1 U9 ( .A(n5), .Y(n7) );
  INVX2 U10 ( .A(N14), .Y(n8) );
  INVX2 U11 ( .A(N14), .Y(n191) );
  INVX1 U12 ( .A(n193), .Y(n9) );
  INVX1 U13 ( .A(n4), .Y(n280) );
  AND2X2 U14 ( .A(n6), .B(n191), .Y(n10) );
  AND2X2 U15 ( .A(n7), .B(n191), .Y(n11) );
  INVX1 U16 ( .A(n5), .Y(n12) );
  INVX1 U17 ( .A(n194), .Y(n13) );
  INVX2 U18 ( .A(n15), .Y(n73) );
  AND2X2 U19 ( .A(n16), .B(n195), .Y(n14) );
  OR2X1 U20 ( .A(n70), .B(n69), .Y(n15) );
  INVX2 U21 ( .A(n18), .Y(n75) );
  INVX2 U22 ( .A(n17), .Y(n74) );
  INVX2 U23 ( .A(n19), .Y(n72) );
  AND2X2 U24 ( .A(n12), .B(n4), .Y(n16) );
  OR2X1 U25 ( .A(N11), .B(N12), .Y(n17) );
  OR2X1 U26 ( .A(n69), .B(N12), .Y(n18) );
  OR2X1 U27 ( .A(n70), .B(N11), .Y(n19) );
  BUFX2 U28 ( .A(N10), .Y(n71) );
  AOI22X1 U29 ( .A(\fiforeg[4][0] ), .B(n72), .C(\fiforeg[6][0] ), .D(n73), 
        .Y(n21) );
  AOI22X1 U30 ( .A(\fiforeg[0][0] ), .B(n74), .C(\fiforeg[2][0] ), .D(n75), 
        .Y(n20) );
  AOI21X1 U31 ( .A(n21), .B(n20), .C(n71), .Y(n25) );
  AOI22X1 U32 ( .A(\fiforeg[5][0] ), .B(n72), .C(\fiforeg[7][0] ), .D(n73), 
        .Y(n23) );
  AOI22X1 U33 ( .A(\fiforeg[1][0] ), .B(n74), .C(\fiforeg[3][0] ), .D(n75), 
        .Y(n22) );
  AOI21X1 U34 ( .A(n23), .B(n22), .C(n68), .Y(n24) );
  OR2X1 U35 ( .A(n25), .B(n24), .Y(rdata[0]) );
  AOI22X1 U36 ( .A(\fiforeg[4][1] ), .B(n72), .C(\fiforeg[6][1] ), .D(n73), 
        .Y(n27) );
  AOI22X1 U37 ( .A(\fiforeg[0][1] ), .B(n74), .C(\fiforeg[2][1] ), .D(n75), 
        .Y(n26) );
  AOI21X1 U38 ( .A(n27), .B(n26), .C(n71), .Y(n31) );
  AOI22X1 U39 ( .A(\fiforeg[5][1] ), .B(n72), .C(\fiforeg[7][1] ), .D(n73), 
        .Y(n29) );
  AOI22X1 U40 ( .A(\fiforeg[1][1] ), .B(n74), .C(\fiforeg[3][1] ), .D(n75), 
        .Y(n28) );
  AOI21X1 U41 ( .A(n29), .B(n28), .C(n68), .Y(n30) );
  OR2X1 U42 ( .A(n31), .B(n30), .Y(rdata[1]) );
  AOI22X1 U43 ( .A(\fiforeg[4][2] ), .B(n72), .C(\fiforeg[6][2] ), .D(n73), 
        .Y(n33) );
  AOI22X1 U44 ( .A(\fiforeg[0][2] ), .B(n74), .C(\fiforeg[2][2] ), .D(n75), 
        .Y(n32) );
  AOI21X1 U45 ( .A(n33), .B(n32), .C(n71), .Y(n37) );
  AOI22X1 U46 ( .A(\fiforeg[5][2] ), .B(n72), .C(\fiforeg[7][2] ), .D(n73), 
        .Y(n35) );
  AOI22X1 U47 ( .A(\fiforeg[1][2] ), .B(n74), .C(\fiforeg[3][2] ), .D(n75), 
        .Y(n34) );
  AOI21X1 U48 ( .A(n35), .B(n34), .C(n68), .Y(n36) );
  OR2X1 U49 ( .A(n37), .B(n36), .Y(rdata[2]) );
  AOI22X1 U50 ( .A(\fiforeg[4][3] ), .B(n72), .C(\fiforeg[6][3] ), .D(n73), 
        .Y(n39) );
  AOI22X1 U51 ( .A(\fiforeg[0][3] ), .B(n74), .C(\fiforeg[2][3] ), .D(n75), 
        .Y(n38) );
  AOI21X1 U52 ( .A(n39), .B(n38), .C(n71), .Y(n43) );
  AOI22X1 U53 ( .A(\fiforeg[5][3] ), .B(n72), .C(\fiforeg[7][3] ), .D(n73), 
        .Y(n41) );
  AOI22X1 U54 ( .A(\fiforeg[1][3] ), .B(n74), .C(\fiforeg[3][3] ), .D(n75), 
        .Y(n40) );
  AOI21X1 U55 ( .A(n41), .B(n40), .C(n68), .Y(n42) );
  OR2X1 U56 ( .A(n43), .B(n42), .Y(rdata[3]) );
  AOI22X1 U57 ( .A(\fiforeg[4][4] ), .B(n72), .C(\fiforeg[6][4] ), .D(n73), 
        .Y(n45) );
  AOI22X1 U58 ( .A(\fiforeg[0][4] ), .B(n74), .C(\fiforeg[2][4] ), .D(n75), 
        .Y(n44) );
  AOI21X1 U59 ( .A(n45), .B(n44), .C(n71), .Y(n49) );
  AOI22X1 U60 ( .A(\fiforeg[5][4] ), .B(n72), .C(\fiforeg[7][4] ), .D(n73), 
        .Y(n47) );
  AOI22X1 U61 ( .A(\fiforeg[1][4] ), .B(n74), .C(\fiforeg[3][4] ), .D(n75), 
        .Y(n46) );
  AOI21X1 U62 ( .A(n47), .B(n46), .C(n68), .Y(n48) );
  OR2X1 U63 ( .A(n49), .B(n48), .Y(rdata[4]) );
  AOI22X1 U64 ( .A(\fiforeg[4][5] ), .B(n72), .C(\fiforeg[6][5] ), .D(n73), 
        .Y(n51) );
  AOI22X1 U65 ( .A(\fiforeg[0][5] ), .B(n74), .C(\fiforeg[2][5] ), .D(n75), 
        .Y(n50) );
  AOI21X1 U66 ( .A(n51), .B(n50), .C(n71), .Y(n55) );
  AOI22X1 U67 ( .A(\fiforeg[5][5] ), .B(n72), .C(\fiforeg[7][5] ), .D(n73), 
        .Y(n53) );
  AOI22X1 U68 ( .A(\fiforeg[1][5] ), .B(n74), .C(\fiforeg[3][5] ), .D(n75), 
        .Y(n52) );
  AOI21X1 U69 ( .A(n53), .B(n52), .C(n68), .Y(n54) );
  OR2X1 U70 ( .A(n55), .B(n54), .Y(rdata[5]) );
  AOI22X1 U71 ( .A(\fiforeg[4][6] ), .B(n72), .C(\fiforeg[6][6] ), .D(n73), 
        .Y(n57) );
  AOI22X1 U72 ( .A(\fiforeg[0][6] ), .B(n74), .C(\fiforeg[2][6] ), .D(n75), 
        .Y(n56) );
  AOI21X1 U73 ( .A(n57), .B(n56), .C(n71), .Y(n61) );
  AOI22X1 U74 ( .A(\fiforeg[5][6] ), .B(n72), .C(\fiforeg[7][6] ), .D(n73), 
        .Y(n59) );
  AOI22X1 U75 ( .A(\fiforeg[1][6] ), .B(n74), .C(\fiforeg[3][6] ), .D(n75), 
        .Y(n58) );
  AOI21X1 U76 ( .A(n59), .B(n58), .C(n68), .Y(n60) );
  OR2X1 U77 ( .A(n61), .B(n60), .Y(rdata[6]) );
  AOI22X1 U78 ( .A(\fiforeg[4][7] ), .B(n72), .C(\fiforeg[6][7] ), .D(n73), 
        .Y(n63) );
  AOI22X1 U79 ( .A(\fiforeg[0][7] ), .B(n74), .C(\fiforeg[2][7] ), .D(n75), 
        .Y(n62) );
  AOI21X1 U80 ( .A(n63), .B(n62), .C(n71), .Y(n67) );
  AOI22X1 U81 ( .A(\fiforeg[5][7] ), .B(n72), .C(\fiforeg[7][7] ), .D(n73), 
        .Y(n65) );
  AOI22X1 U82 ( .A(\fiforeg[1][7] ), .B(n74), .C(\fiforeg[3][7] ), .D(n75), 
        .Y(n64) );
  AOI21X1 U83 ( .A(n65), .B(n64), .C(n68), .Y(n66) );
  OR2X1 U84 ( .A(n67), .B(n66), .Y(rdata[7]) );
  INVX2 U85 ( .A(n71), .Y(n68) );
  INVX2 U86 ( .A(N11), .Y(n69) );
  INVX2 U87 ( .A(N12), .Y(n70) );
  MUX2X1 U88 ( .B(n76), .A(n77), .S(n195), .Y(N24) );
  AND2X2 U89 ( .A(n78), .B(n79), .Y(n77) );
  AOI22X1 U90 ( .A(\fiforeg[7][0] ), .B(n80), .C(\fiforeg[5][0] ), .D(n3), .Y(
        n79) );
  AOI22X1 U91 ( .A(n81), .B(\fiforeg[3][0] ), .C(\fiforeg[1][0] ), .D(n82), 
        .Y(n78) );
  AND2X2 U92 ( .A(n83), .B(n84), .Y(n76) );
  AOI22X1 U93 ( .A(\fiforeg[6][0] ), .B(n80), .C(\fiforeg[4][0] ), .D(n2), .Y(
        n84) );
  AOI22X1 U94 ( .A(\fiforeg[2][0] ), .B(n81), .C(\fiforeg[0][0] ), .D(n82), 
        .Y(n83) );
  MUX2X1 U95 ( .B(n85), .A(n86), .S(n195), .Y(N23) );
  AND2X2 U96 ( .A(n87), .B(n88), .Y(n86) );
  AOI22X1 U97 ( .A(\fiforeg[7][1] ), .B(n80), .C(\fiforeg[5][1] ), .D(n10), 
        .Y(n88) );
  AOI22X1 U98 ( .A(n81), .B(\fiforeg[3][1] ), .C(\fiforeg[1][1] ), .D(n82), 
        .Y(n87) );
  AND2X2 U99 ( .A(n153), .B(n154), .Y(n85) );
  AOI22X1 U100 ( .A(\fiforeg[6][1] ), .B(n80), .C(\fiforeg[4][1] ), .D(n11), 
        .Y(n154) );
  AOI22X1 U101 ( .A(\fiforeg[2][1] ), .B(n81), .C(\fiforeg[0][1] ), .D(n82), 
        .Y(n153) );
  MUX2X1 U102 ( .B(n155), .A(n156), .S(n195), .Y(N22) );
  AND2X2 U103 ( .A(n157), .B(n158), .Y(n156) );
  AOI22X1 U104 ( .A(\fiforeg[7][2] ), .B(n80), .C(\fiforeg[5][2] ), .D(n10), 
        .Y(n158) );
  AOI22X1 U105 ( .A(n81), .B(\fiforeg[3][2] ), .C(n82), .D(\fiforeg[1][2] ), 
        .Y(n157) );
  AND2X2 U106 ( .A(n159), .B(n160), .Y(n155) );
  AOI22X1 U107 ( .A(\fiforeg[6][2] ), .B(n80), .C(\fiforeg[4][2] ), .D(n10), 
        .Y(n160) );
  AOI22X1 U108 ( .A(\fiforeg[2][2] ), .B(n81), .C(\fiforeg[0][2] ), .D(n82), 
        .Y(n159) );
  MUX2X1 U109 ( .B(n161), .A(n162), .S(n195), .Y(N21) );
  AND2X2 U110 ( .A(n163), .B(n164), .Y(n162) );
  AOI22X1 U111 ( .A(\fiforeg[7][3] ), .B(n80), .C(\fiforeg[5][3] ), .D(n3), 
        .Y(n164) );
  AOI22X1 U112 ( .A(n81), .B(\fiforeg[3][3] ), .C(\fiforeg[1][3] ), .D(n82), 
        .Y(n163) );
  AND2X2 U113 ( .A(n165), .B(n166), .Y(n161) );
  AOI22X1 U114 ( .A(\fiforeg[6][3] ), .B(n80), .C(\fiforeg[4][3] ), .D(n2), 
        .Y(n166) );
  AOI22X1 U115 ( .A(\fiforeg[2][3] ), .B(n81), .C(\fiforeg[0][3] ), .D(n82), 
        .Y(n165) );
  MUX2X1 U116 ( .B(n167), .A(n168), .S(n195), .Y(N20) );
  AND2X2 U117 ( .A(n169), .B(n170), .Y(n168) );
  AOI22X1 U118 ( .A(\fiforeg[7][4] ), .B(n80), .C(\fiforeg[5][4] ), .D(n11), 
        .Y(n170) );
  AOI22X1 U119 ( .A(\fiforeg[3][4] ), .B(n81), .C(\fiforeg[1][4] ), .D(n82), 
        .Y(n169) );
  AND2X2 U120 ( .A(n171), .B(n172), .Y(n167) );
  AOI22X1 U121 ( .A(\fiforeg[6][4] ), .B(n80), .C(\fiforeg[4][4] ), .D(n2), 
        .Y(n172) );
  AOI22X1 U122 ( .A(\fiforeg[2][4] ), .B(n13), .C(\fiforeg[0][4] ), .D(n9), 
        .Y(n171) );
  MUX2X1 U123 ( .B(n173), .A(n174), .S(n195), .Y(N19) );
  AND2X2 U124 ( .A(n175), .B(n176), .Y(n174) );
  AOI22X1 U125 ( .A(\fiforeg[7][5] ), .B(n80), .C(\fiforeg[5][5] ), .D(n3), 
        .Y(n176) );
  AOI22X1 U126 ( .A(\fiforeg[3][5] ), .B(n81), .C(\fiforeg[1][5] ), .D(n82), 
        .Y(n175) );
  AND2X2 U127 ( .A(n177), .B(n178), .Y(n173) );
  AOI22X1 U128 ( .A(\fiforeg[6][5] ), .B(n80), .C(\fiforeg[4][5] ), .D(n11), 
        .Y(n178) );
  AOI22X1 U129 ( .A(\fiforeg[2][5] ), .B(n81), .C(\fiforeg[0][5] ), .D(n82), 
        .Y(n177) );
  MUX2X1 U130 ( .B(n179), .A(n180), .S(n195), .Y(N18) );
  AND2X2 U131 ( .A(n181), .B(n182), .Y(n180) );
  AOI22X1 U132 ( .A(\fiforeg[7][6] ), .B(n80), .C(\fiforeg[5][6] ), .D(n3), 
        .Y(n182) );
  AOI22X1 U133 ( .A(\fiforeg[3][6] ), .B(n81), .C(\fiforeg[1][6] ), .D(n82), 
        .Y(n181) );
  AND2X2 U134 ( .A(n183), .B(n184), .Y(n179) );
  AOI22X1 U135 ( .A(\fiforeg[6][6] ), .B(n80), .C(\fiforeg[4][6] ), .D(n11), 
        .Y(n184) );
  AOI22X1 U136 ( .A(\fiforeg[2][6] ), .B(n13), .C(\fiforeg[0][6] ), .D(n9), 
        .Y(n183) );
  MUX2X1 U137 ( .B(n185), .A(n186), .S(n195), .Y(N17) );
  AND2X2 U138 ( .A(n187), .B(n188), .Y(n186) );
  AOI22X1 U139 ( .A(\fiforeg[7][7] ), .B(n80), .C(\fiforeg[5][7] ), .D(n10), 
        .Y(n188) );
  AOI22X1 U140 ( .A(\fiforeg[3][7] ), .B(n81), .C(\fiforeg[1][7] ), .D(n82), 
        .Y(n187) );
  AND2X2 U141 ( .A(n189), .B(n190), .Y(n185) );
  AOI22X1 U142 ( .A(\fiforeg[6][7] ), .B(n80), .C(\fiforeg[4][7] ), .D(n2), 
        .Y(n190) );
  NAND2X1 U143 ( .A(N15), .B(N14), .Y(n192) );
  AOI22X1 U144 ( .A(\fiforeg[2][7] ), .B(n13), .C(\fiforeg[0][7] ), .D(n9), 
        .Y(n189) );
  NAND2X1 U145 ( .A(n5), .B(n8), .Y(n193) );
  NAND2X1 U146 ( .A(N14), .B(n5), .Y(n194) );
  INVX4 U147 ( .A(n192), .Y(n80) );
  INVX4 U148 ( .A(n193), .Y(n82) );
  INVX4 U149 ( .A(n194), .Y(n81) );
  BUFX2 U150 ( .A(N13), .Y(n195) );
  BUFX4 U151 ( .A(n285), .Y(n196) );
  BUFX4 U152 ( .A(n285), .Y(n197) );
  BUFX4 U153 ( .A(n289), .Y(n198) );
  BUFX4 U154 ( .A(n289), .Y(n199) );
  BUFX4 U155 ( .A(n283), .Y(n200) );
  BUFX4 U156 ( .A(n283), .Y(n201) );
  BUFX4 U157 ( .A(n287), .Y(n202) );
  BUFX4 U158 ( .A(n287), .Y(n203) );
  BUFX4 U159 ( .A(n298), .Y(n204) );
  BUFX4 U160 ( .A(n298), .Y(n205) );
  BUFX4 U161 ( .A(n295), .Y(n206) );
  BUFX4 U162 ( .A(n295), .Y(n207) );
  BUFX4 U163 ( .A(n291), .Y(n208) );
  BUFX4 U164 ( .A(n291), .Y(n209) );
  BUFX4 U165 ( .A(n293), .Y(n210) );
  BUFX4 U166 ( .A(n293), .Y(n211) );
  INVX2 U167 ( .A(\fiforeg[7][7] ), .Y(n212) );
  AOI22X1 U168 ( .A(wdata[7]), .B(wenable), .C(N17), .D(n219), .Y(n283) );
  MUX2X1 U169 ( .B(n212), .A(n200), .S(n14), .Y(n96) );
  INVX2 U170 ( .A(\fiforeg[7][6] ), .Y(n213) );
  AOI22X1 U171 ( .A(wdata[6]), .B(wenable), .C(N18), .D(n219), .Y(n285) );
  MUX2X1 U172 ( .B(n213), .A(n196), .S(n14), .Y(n95) );
  INVX2 U173 ( .A(\fiforeg[7][5] ), .Y(n214) );
  AOI22X1 U174 ( .A(wdata[5]), .B(wenable), .C(N19), .D(n219), .Y(n287) );
  MUX2X1 U175 ( .B(n214), .A(n202), .S(n14), .Y(n94) );
  INVX2 U176 ( .A(\fiforeg[7][4] ), .Y(n215) );
  AOI22X1 U177 ( .A(wdata[4]), .B(wenable), .C(N20), .D(n219), .Y(n289) );
  MUX2X1 U178 ( .B(n215), .A(n198), .S(n14), .Y(n93) );
  INVX2 U179 ( .A(\fiforeg[7][3] ), .Y(n216) );
  AOI22X1 U180 ( .A(wdata[3]), .B(wenable), .C(N21), .D(n219), .Y(n291) );
  MUX2X1 U181 ( .B(n216), .A(n208), .S(n14), .Y(n92) );
  INVX2 U182 ( .A(\fiforeg[7][2] ), .Y(n217) );
  AOI22X1 U183 ( .A(wdata[2]), .B(wenable), .C(N22), .D(n219), .Y(n293) );
  MUX2X1 U184 ( .B(n217), .A(n210), .S(n14), .Y(n91) );
  INVX2 U185 ( .A(\fiforeg[7][1] ), .Y(n218) );
  AOI22X1 U186 ( .A(wdata[1]), .B(wenable), .C(N23), .D(n219), .Y(n295) );
  MUX2X1 U187 ( .B(n218), .A(n206), .S(n14), .Y(n90) );
  INVX2 U188 ( .A(\fiforeg[7][0] ), .Y(n220) );
  AOI22X1 U189 ( .A(wdata[0]), .B(wenable), .C(N24), .D(n219), .Y(n298) );
  MUX2X1 U190 ( .B(n220), .A(n204), .S(n14), .Y(n89) );
  INVX2 U191 ( .A(\fiforeg[6][7] ), .Y(n221) );
  INVX2 U192 ( .A(n195), .Y(n279) );
  MUX2X1 U193 ( .B(n221), .A(n200), .S(n1), .Y(n104) );
  INVX2 U194 ( .A(\fiforeg[6][6] ), .Y(n222) );
  MUX2X1 U195 ( .B(n222), .A(n196), .S(n1), .Y(n103) );
  INVX2 U196 ( .A(\fiforeg[6][5] ), .Y(n223) );
  MUX2X1 U197 ( .B(n223), .A(n202), .S(n1), .Y(n102) );
  INVX2 U198 ( .A(\fiforeg[6][4] ), .Y(n224) );
  MUX2X1 U199 ( .B(n224), .A(n198), .S(n1), .Y(n101) );
  INVX2 U200 ( .A(\fiforeg[6][3] ), .Y(n225) );
  MUX2X1 U201 ( .B(n225), .A(n208), .S(n1), .Y(n100) );
  INVX2 U202 ( .A(\fiforeg[6][2] ), .Y(n226) );
  MUX2X1 U203 ( .B(n226), .A(n210), .S(n1), .Y(n99) );
  INVX2 U204 ( .A(\fiforeg[6][1] ), .Y(n227) );
  MUX2X1 U205 ( .B(n227), .A(n206), .S(n1), .Y(n98) );
  INVX2 U206 ( .A(\fiforeg[6][0] ), .Y(n228) );
  MUX2X1 U207 ( .B(n228), .A(n204), .S(n1), .Y(n97) );
  INVX2 U208 ( .A(\fiforeg[5][7] ), .Y(n230) );
  NAND3X1 U209 ( .A(n12), .B(n195), .C(n280), .Y(n229) );
  INVX2 U210 ( .A(n229), .Y(n237) );
  MUX2X1 U211 ( .B(n230), .A(n200), .S(n237), .Y(n112) );
  INVX2 U212 ( .A(\fiforeg[5][6] ), .Y(n231) );
  MUX2X1 U213 ( .B(n231), .A(n196), .S(n237), .Y(n111) );
  INVX2 U214 ( .A(\fiforeg[5][5] ), .Y(n232) );
  MUX2X1 U215 ( .B(n232), .A(n202), .S(n237), .Y(n110) );
  INVX2 U216 ( .A(\fiforeg[5][4] ), .Y(n233) );
  MUX2X1 U217 ( .B(n233), .A(n198), .S(n237), .Y(n109) );
  INVX2 U218 ( .A(\fiforeg[5][3] ), .Y(n234) );
  MUX2X1 U219 ( .B(n234), .A(n208), .S(n237), .Y(n108) );
  INVX2 U220 ( .A(\fiforeg[5][2] ), .Y(n235) );
  MUX2X1 U221 ( .B(n235), .A(n210), .S(n237), .Y(n107) );
  INVX2 U222 ( .A(\fiforeg[5][1] ), .Y(n236) );
  MUX2X1 U223 ( .B(n236), .A(n206), .S(n237), .Y(n106) );
  INVX2 U224 ( .A(\fiforeg[5][0] ), .Y(n238) );
  MUX2X1 U225 ( .B(n238), .A(n204), .S(n237), .Y(n105) );
  INVX2 U226 ( .A(\fiforeg[4][7] ), .Y(n240) );
  NAND3X1 U227 ( .A(n12), .B(n280), .C(n279), .Y(n239) );
  INVX2 U228 ( .A(n239), .Y(n247) );
  MUX2X1 U229 ( .B(n240), .A(n200), .S(n247), .Y(n120) );
  INVX2 U230 ( .A(\fiforeg[4][6] ), .Y(n241) );
  MUX2X1 U231 ( .B(n241), .A(n196), .S(n247), .Y(n119) );
  INVX2 U232 ( .A(\fiforeg[4][5] ), .Y(n242) );
  MUX2X1 U233 ( .B(n242), .A(n202), .S(n247), .Y(n118) );
  INVX2 U234 ( .A(\fiforeg[4][4] ), .Y(n243) );
  MUX2X1 U235 ( .B(n243), .A(n198), .S(n247), .Y(n117) );
  INVX2 U236 ( .A(\fiforeg[4][3] ), .Y(n244) );
  MUX2X1 U237 ( .B(n244), .A(n208), .S(n247), .Y(n116) );
  INVX2 U238 ( .A(\fiforeg[4][2] ), .Y(n245) );
  MUX2X1 U239 ( .B(n245), .A(n210), .S(n247), .Y(n115) );
  INVX2 U240 ( .A(\fiforeg[4][1] ), .Y(n246) );
  MUX2X1 U241 ( .B(n246), .A(n206), .S(n247), .Y(n114) );
  INVX2 U242 ( .A(\fiforeg[4][0] ), .Y(n248) );
  MUX2X1 U243 ( .B(n248), .A(n204), .S(n247), .Y(n113) );
  INVX2 U244 ( .A(\fiforeg[3][7] ), .Y(n250) );
  INVX2 U245 ( .A(n12), .Y(n281) );
  NAND3X1 U246 ( .A(n4), .B(n195), .C(n281), .Y(n249) );
  INVX2 U247 ( .A(n249), .Y(n257) );
  MUX2X1 U248 ( .B(n250), .A(n201), .S(n257), .Y(n128) );
  INVX2 U249 ( .A(\fiforeg[3][6] ), .Y(n251) );
  MUX2X1 U250 ( .B(n251), .A(n197), .S(n257), .Y(n127) );
  INVX2 U251 ( .A(\fiforeg[3][5] ), .Y(n252) );
  MUX2X1 U252 ( .B(n252), .A(n203), .S(n257), .Y(n126) );
  INVX2 U253 ( .A(\fiforeg[3][4] ), .Y(n253) );
  MUX2X1 U254 ( .B(n253), .A(n199), .S(n257), .Y(n125) );
  INVX2 U255 ( .A(\fiforeg[3][3] ), .Y(n254) );
  MUX2X1 U256 ( .B(n254), .A(n209), .S(n257), .Y(n124) );
  INVX2 U257 ( .A(\fiforeg[3][2] ), .Y(n255) );
  MUX2X1 U258 ( .B(n255), .A(n211), .S(n257), .Y(n123) );
  INVX2 U259 ( .A(\fiforeg[3][1] ), .Y(n256) );
  MUX2X1 U260 ( .B(n256), .A(n207), .S(n257), .Y(n122) );
  INVX2 U261 ( .A(\fiforeg[3][0] ), .Y(n258) );
  MUX2X1 U262 ( .B(n258), .A(n205), .S(n257), .Y(n121) );
  INVX2 U263 ( .A(\fiforeg[2][7] ), .Y(n260) );
  NAND3X1 U264 ( .A(n4), .B(n281), .C(n279), .Y(n259) );
  INVX2 U265 ( .A(n259), .Y(n267) );
  MUX2X1 U266 ( .B(n260), .A(n201), .S(n267), .Y(n136) );
  INVX2 U267 ( .A(\fiforeg[2][6] ), .Y(n261) );
  MUX2X1 U268 ( .B(n261), .A(n197), .S(n267), .Y(n135) );
  INVX2 U269 ( .A(\fiforeg[2][5] ), .Y(n262) );
  MUX2X1 U270 ( .B(n262), .A(n203), .S(n267), .Y(n134) );
  INVX2 U271 ( .A(\fiforeg[2][4] ), .Y(n263) );
  MUX2X1 U272 ( .B(n263), .A(n199), .S(n267), .Y(n133) );
  INVX2 U273 ( .A(\fiforeg[2][3] ), .Y(n264) );
  MUX2X1 U274 ( .B(n264), .A(n209), .S(n267), .Y(n132) );
  INVX2 U275 ( .A(\fiforeg[2][2] ), .Y(n265) );
  MUX2X1 U276 ( .B(n265), .A(n211), .S(n267), .Y(n131) );
  INVX2 U277 ( .A(\fiforeg[2][1] ), .Y(n266) );
  MUX2X1 U278 ( .B(n266), .A(n207), .S(n267), .Y(n130) );
  INVX2 U279 ( .A(\fiforeg[2][0] ), .Y(n268) );
  MUX2X1 U280 ( .B(n268), .A(n205), .S(n267), .Y(n129) );
  INVX2 U281 ( .A(\fiforeg[1][7] ), .Y(n270) );
  NAND3X1 U282 ( .A(n195), .B(n281), .C(n280), .Y(n269) );
  INVX2 U283 ( .A(n269), .Y(n277) );
  MUX2X1 U284 ( .B(n270), .A(n201), .S(n277), .Y(n144) );
  INVX2 U285 ( .A(\fiforeg[1][6] ), .Y(n271) );
  MUX2X1 U286 ( .B(n271), .A(n197), .S(n277), .Y(n143) );
  INVX2 U287 ( .A(\fiforeg[1][5] ), .Y(n272) );
  MUX2X1 U288 ( .B(n272), .A(n203), .S(n277), .Y(n142) );
  INVX2 U289 ( .A(\fiforeg[1][4] ), .Y(n273) );
  MUX2X1 U290 ( .B(n273), .A(n199), .S(n277), .Y(n141) );
  INVX2 U291 ( .A(\fiforeg[1][3] ), .Y(n274) );
  MUX2X1 U292 ( .B(n274), .A(n209), .S(n277), .Y(n140) );
  INVX2 U293 ( .A(\fiforeg[1][2] ), .Y(n275) );
  MUX2X1 U294 ( .B(n275), .A(n211), .S(n277), .Y(n139) );
  INVX2 U295 ( .A(\fiforeg[1][1] ), .Y(n276) );
  MUX2X1 U296 ( .B(n276), .A(n207), .S(n277), .Y(n138) );
  INVX2 U297 ( .A(\fiforeg[1][0] ), .Y(n278) );
  MUX2X1 U298 ( .B(n278), .A(n205), .S(n277), .Y(n137) );
  INVX2 U299 ( .A(\fiforeg[0][7] ), .Y(n284) );
  NAND3X1 U300 ( .A(n281), .B(n280), .C(n279), .Y(n282) );
  INVX2 U301 ( .A(n282), .Y(n297) );
  MUX2X1 U302 ( .B(n284), .A(n201), .S(n297), .Y(n152) );
  INVX2 U303 ( .A(\fiforeg[0][6] ), .Y(n286) );
  MUX2X1 U304 ( .B(n286), .A(n197), .S(n297), .Y(n151) );
  INVX2 U305 ( .A(\fiforeg[0][5] ), .Y(n288) );
  MUX2X1 U306 ( .B(n288), .A(n203), .S(n297), .Y(n150) );
  INVX2 U307 ( .A(\fiforeg[0][4] ), .Y(n290) );
  MUX2X1 U308 ( .B(n290), .A(n199), .S(n297), .Y(n149) );
  INVX2 U309 ( .A(\fiforeg[0][3] ), .Y(n292) );
  MUX2X1 U310 ( .B(n292), .A(n209), .S(n297), .Y(n148) );
  INVX2 U311 ( .A(\fiforeg[0][2] ), .Y(n294) );
  MUX2X1 U312 ( .B(n294), .A(n211), .S(n297), .Y(n147) );
  INVX2 U313 ( .A(\fiforeg[0][1] ), .Y(n296) );
  MUX2X1 U314 ( .B(n296), .A(n207), .S(n297), .Y(n146) );
  INVX2 U315 ( .A(\fiforeg[0][0] ), .Y(n299) );
  MUX2X1 U316 ( .B(n299), .A(n205), .S(n297), .Y(n145) );
endmodule


module write_ptr ( wclk, rst_n, wenable, wptr, wptr_nxt );
  output [3:0] wptr;
  output [3:0] wptr_nxt;
  input wclk, rst_n, wenable;
  wire   \binary_nxt[0] , n2, n3, n4, n5, n6, n14, n15, n16, n17, n18, n19,
         n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32, n33,
         n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44, n45, n46, n47,
         n48, n49, n51;
  wire   [3:0] binary_r;

  DFFSR \binary_r_reg[0]  ( .D(\binary_nxt[0] ), .CLK(wclk), .R(rst_n), .S(
        1'b1), .Q(binary_r[0]) );
  DFFSR \binary_r_reg[1]  ( .D(n51), .CLK(wclk), .R(rst_n), .S(1'b1), .Q(
        binary_r[1]) );
  DFFSR \gray_r_reg[0]  ( .D(wptr_nxt[0]), .CLK(wclk), .R(rst_n), .S(1'b1), 
        .Q(wptr[0]) );
  DFFSR \gray_r_reg[3]  ( .D(wptr_nxt[3]), .CLK(wclk), .R(rst_n), .S(1'b1), 
        .Q(wptr[3]) );
  DFFSR \binary_r_reg[3]  ( .D(wptr_nxt[3]), .CLK(wclk), .R(rst_n), .S(1'b1), 
        .Q(binary_r[3]) );
  DFFSR \gray_r_reg[1]  ( .D(n6), .CLK(wclk), .R(rst_n), .S(1'b1), .Q(wptr[1])
         );
  DFFSR \gray_r_reg[2]  ( .D(wptr_nxt[2]), .CLK(wclk), .R(rst_n), .S(1'b1), 
        .Q(wptr[2]) );
  DFFSR \binary_r_reg[2]  ( .D(n49), .CLK(wclk), .R(rst_n), .S(1'b1), .Q(
        binary_r[2]) );
  AND2X2 U4 ( .A(n42), .B(binary_r[0]), .Y(n2) );
  AND2X2 U5 ( .A(binary_r[1]), .B(binary_r[0]), .Y(n3) );
  AND2X1 U6 ( .A(n48), .B(n47), .Y(n4) );
  INVX1 U7 ( .A(wptr_nxt[1]), .Y(n5) );
  INVX2 U8 ( .A(n5), .Y(n6) );
  INVX1 U11 ( .A(binary_r[0]), .Y(n23) );
  BUFX4 U17 ( .A(wenable), .Y(n14) );
  BUFX2 U18 ( .A(wenable), .Y(n15) );
  BUFX2 U19 ( .A(wenable), .Y(n16) );
  NAND2X1 U20 ( .A(n44), .B(binary_r[3]), .Y(n17) );
  NAND2X1 U21 ( .A(n45), .B(n18), .Y(n46) );
  INVX2 U22 ( .A(n17), .Y(n18) );
  INVX1 U23 ( .A(binary_r[2]), .Y(n44) );
  NAND2X1 U24 ( .A(binary_r[1]), .B(binary_r[0]), .Y(n19) );
  NAND2X1 U25 ( .A(binary_r[1]), .B(binary_r[0]), .Y(n20) );
  NAND2X1 U26 ( .A(n14), .B(n2), .Y(n48) );
  NAND2X1 U27 ( .A(n4), .B(n46), .Y(wptr_nxt[2]) );
  INVX4 U28 ( .A(n14), .Y(n45) );
  XOR2X1 U29 ( .A(n15), .B(binary_r[0]), .Y(\binary_nxt[0] ) );
  INVX2 U30 ( .A(binary_r[1]), .Y(n41) );
  NAND2X1 U31 ( .A(n23), .B(n41), .Y(n29) );
  INVX2 U32 ( .A(n29), .Y(n22) );
  OAI22X1 U33 ( .A(n19), .B(n45), .C(binary_r[1]), .D(n16), .Y(n21) );
  NOR2X1 U34 ( .A(n22), .B(n21), .Y(n51) );
  OAI21X1 U35 ( .A(binary_r[0]), .B(n22), .C(n20), .Y(n25) );
  OAI21X1 U36 ( .A(n23), .B(n41), .C(n29), .Y(n24) );
  AOI22X1 U37 ( .A(n16), .B(n25), .C(n24), .D(n45), .Y(wptr_nxt[0]) );
  NAND2X1 U38 ( .A(n19), .B(n44), .Y(n30) );
  NAND2X1 U39 ( .A(binary_r[2]), .B(n3), .Y(n38) );
  INVX2 U40 ( .A(n38), .Y(n26) );
  NAND2X1 U41 ( .A(n26), .B(n16), .Y(n28) );
  NAND2X1 U42 ( .A(n30), .B(n28), .Y(n27) );
  AOI21X1 U43 ( .A(n45), .B(n44), .C(n27), .Y(n49) );
  OAI21X1 U44 ( .A(n29), .B(n30), .C(n28), .Y(n34) );
  AOI22X1 U45 ( .A(binary_r[2]), .B(binary_r[1]), .C(n41), .D(n44), .Y(n32) );
  NAND3X1 U46 ( .A(n30), .B(n20), .C(n29), .Y(n31) );
  OAI22X1 U47 ( .A(n16), .B(n32), .C(n45), .D(n31), .Y(n33) );
  NOR2X1 U48 ( .A(n34), .B(n33), .Y(wptr_nxt[1]) );
  INVX2 U49 ( .A(binary_r[3]), .Y(n37) );
  NAND2X1 U50 ( .A(binary_r[3]), .B(binary_r[2]), .Y(n35) );
  NOR2X1 U51 ( .A(n20), .B(n35), .Y(n36) );
  AOI22X1 U52 ( .A(n38), .B(n37), .C(n15), .D(n36), .Y(n39) );
  OAI21X1 U53 ( .A(binary_r[3]), .B(n15), .C(n39), .Y(n40) );
  INVX2 U54 ( .A(n40), .Y(wptr_nxt[3]) );
  NOR2X1 U55 ( .A(binary_r[3]), .B(n41), .Y(n42) );
  XOR2X1 U56 ( .A(binary_r[3]), .B(binary_r[2]), .Y(n43) );
  OAI21X1 U57 ( .A(binary_r[2]), .B(n19), .C(n43), .Y(n47) );
endmodule


module write_fifo_ctrl ( wclk, rst_n, wenable, rptr, wenable_fifo, wptr, waddr, 
        full_flag );
  input [3:0] rptr;
  output [3:0] wptr;
  output [2:0] waddr;
  input wclk, rst_n, wenable;
  output wenable_fifo, full_flag;
  wire   n25, \gray_wptr[2] , N5, n1, n2, n3, n18, n19, n20, n21, n22, n23,
         n24;
  wire   [3:0] wptr_nxt;
  wire   [3:0] wrptr_r2;
  wire   [3:0] wrptr_r1;

  DFFSR \wrptr_r1_reg[3]  ( .D(rptr[3]), .CLK(wclk), .R(rst_n), .S(1'b1), .Q(
        wrptr_r1[3]) );
  DFFSR \wrptr_r1_reg[2]  ( .D(rptr[2]), .CLK(wclk), .R(rst_n), .S(1'b1), .Q(
        wrptr_r1[2]) );
  DFFSR \wrptr_r1_reg[1]  ( .D(rptr[1]), .CLK(wclk), .R(rst_n), .S(1'b1), .Q(
        wrptr_r1[1]) );
  DFFSR \wrptr_r1_reg[0]  ( .D(rptr[0]), .CLK(wclk), .R(rst_n), .S(1'b1), .Q(
        wrptr_r1[0]) );
  DFFSR \wrptr_r2_reg[3]  ( .D(wrptr_r1[3]), .CLK(wclk), .R(rst_n), .S(1'b1), 
        .Q(wrptr_r2[3]) );
  DFFSR \wrptr_r2_reg[2]  ( .D(wrptr_r1[2]), .CLK(wclk), .R(rst_n), .S(1'b1), 
        .Q(wrptr_r2[2]) );
  DFFSR \wrptr_r2_reg[1]  ( .D(wrptr_r1[1]), .CLK(wclk), .R(rst_n), .S(1'b1), 
        .Q(wrptr_r2[1]) );
  DFFSR \wrptr_r2_reg[0]  ( .D(wrptr_r1[0]), .CLK(wclk), .R(rst_n), .S(1'b1), 
        .Q(wrptr_r2[0]) );
  DFFSR full_flag_r_reg ( .D(N5), .CLK(wclk), .R(rst_n), .S(1'b1), .Q(
        full_flag) );
  DFFSR \waddr_reg[2]  ( .D(\gray_wptr[2] ), .CLK(wclk), .R(rst_n), .S(1'b1), 
        .Q(waddr[2]) );
  DFFSR \waddr_reg[1]  ( .D(wptr_nxt[1]), .CLK(wclk), .R(rst_n), .S(1'b1), .Q(
        n25) );
  DFFSR \waddr_reg[0]  ( .D(wptr_nxt[0]), .CLK(wclk), .R(rst_n), .S(1'b1), .Q(
        waddr[0]) );
  write_ptr WPU1 ( .wclk(wclk), .rst_n(rst_n), .wenable(n2), .wptr(wptr), 
        .wptr_nxt(wptr_nxt) );
  BUFX2 U15 ( .A(wptr_nxt[2]), .Y(n1) );
  XOR2X1 U16 ( .A(wrptr_r2[2]), .B(wptr_nxt[2]), .Y(n18) );
  AND2X2 U17 ( .A(wenable), .B(n24), .Y(n2) );
  INVX4 U18 ( .A(n3), .Y(wenable_fifo) );
  NAND2X1 U19 ( .A(wenable), .B(n24), .Y(n3) );
  BUFX4 U20 ( .A(n25), .Y(waddr[1]) );
  XNOR2X1 U21 ( .A(wptr_nxt[0]), .B(wrptr_r2[0]), .Y(n19) );
  NAND2X1 U22 ( .A(n19), .B(n18), .Y(n23) );
  XOR2X1 U23 ( .A(wptr_nxt[3]), .B(wrptr_r2[3]), .Y(n21) );
  XNOR2X1 U24 ( .A(wptr_nxt[1]), .B(wrptr_r2[1]), .Y(n20) );
  NAND2X1 U25 ( .A(n20), .B(n21), .Y(n22) );
  NOR2X1 U26 ( .A(n23), .B(n22), .Y(N5) );
  INVX2 U27 ( .A(full_flag), .Y(n24) );
  XOR2X1 U28 ( .A(n1), .B(wptr_nxt[3]), .Y(\gray_wptr[2] ) );
endmodule


module read_ptr ( rclk, rst_n, renable, rptr, rptr_nxt );
  output [3:0] rptr;
  output [3:0] rptr_nxt;
  input rclk, rst_n, renable;
  wire   n9, n10, n11, n15, n16, n17, n18, n19, n20, n21, n22, n23, n24, n25,
         n26, n27, n28, n29, n30, n31;
  wire   [2:0] binary_nxt;
  wire   [3:0] binary_r;

  DFFSR \binary_r_reg[0]  ( .D(n15), .CLK(rclk), .R(rst_n), .S(1'b1), .Q(
        binary_r[0]) );
  DFFSR \binary_r_reg[1]  ( .D(binary_nxt[1]), .CLK(rclk), .R(rst_n), .S(1'b1), 
        .Q(binary_r[1]) );
  DFFSR \binary_r_reg[2]  ( .D(binary_nxt[2]), .CLK(rclk), .R(rst_n), .S(1'b1), 
        .Q(binary_r[2]) );
  DFFSR \binary_r_reg[3]  ( .D(rptr_nxt[3]), .CLK(rclk), .R(rst_n), .S(1'b1), 
        .Q(binary_r[3]) );
  DFFSR \gray_r_reg[3]  ( .D(rptr_nxt[3]), .CLK(rclk), .R(rst_n), .S(1'b1), 
        .Q(rptr[3]) );
  DFFSR \gray_r_reg[2]  ( .D(rptr_nxt[2]), .CLK(rclk), .R(rst_n), .S(1'b1), 
        .Q(rptr[2]) );
  DFFSR \gray_r_reg[1]  ( .D(rptr_nxt[1]), .CLK(rclk), .R(rst_n), .S(1'b1), 
        .Q(rptr[1]) );
  DFFSR \gray_r_reg[0]  ( .D(rptr_nxt[0]), .CLK(rclk), .R(rst_n), .S(1'b1), 
        .Q(rptr[0]) );
  INVX2 U11 ( .A(n9), .Y(rptr_nxt[3]) );
  XOR2X1 U12 ( .A(n21), .B(binary_r[3]), .Y(n9) );
  INVX1 U13 ( .A(n18), .Y(n10) );
  AND2X2 U14 ( .A(n18), .B(renable), .Y(n11) );
  INVX1 U15 ( .A(n11), .Y(n20) );
  BUFX2 U16 ( .A(binary_r[1]), .Y(n16) );
  XNOR2X1 U17 ( .A(n19), .B(binary_nxt[1]), .Y(rptr_nxt[1]) );
  XNOR2X1 U18 ( .A(n17), .B(n15), .Y(rptr_nxt[0]) );
  XOR2X1 U19 ( .A(binary_r[0]), .B(renable), .Y(n15) );
  NAND2X1 U20 ( .A(renable), .B(binary_r[0]), .Y(n26) );
  XOR2X1 U21 ( .A(n26), .B(n16), .Y(n17) );
  INVX2 U22 ( .A(n17), .Y(binary_nxt[1]) );
  NAND2X1 U23 ( .A(binary_r[1]), .B(binary_r[0]), .Y(n25) );
  INVX2 U24 ( .A(n25), .Y(n18) );
  XOR2X1 U25 ( .A(n20), .B(binary_r[2]), .Y(n19) );
  INVX2 U26 ( .A(n19), .Y(binary_nxt[2]) );
  NAND2X1 U27 ( .A(binary_r[2]), .B(n11), .Y(n21) );
  INVX2 U28 ( .A(renable), .Y(n23) );
  INVX2 U29 ( .A(binary_r[2]), .Y(n22) );
  NAND3X1 U30 ( .A(binary_r[3]), .B(n23), .C(n22), .Y(n31) );
  XOR2X1 U31 ( .A(binary_r[3]), .B(binary_r[2]), .Y(n24) );
  OAI21X1 U32 ( .A(binary_r[2]), .B(n10), .C(n24), .Y(n30) );
  INVX2 U33 ( .A(binary_r[3]), .Y(n28) );
  INVX2 U34 ( .A(n26), .Y(n27) );
  NAND3X1 U35 ( .A(n16), .B(n28), .C(n27), .Y(n29) );
  NAND3X1 U36 ( .A(n31), .B(n30), .C(n29), .Y(rptr_nxt[2]) );
endmodule


module read_fifo_ctrl ( rclk, rst_n, renable, wptr, rptr, raddr, empty_flag );
  input [3:0] wptr;
  output [3:0] rptr;
  output [2:0] raddr;
  input rclk, rst_n, renable;
  output empty_flag;
  wire   renable_p2, \gray_rptr[2] , N3, n1, n3, n4, n7, n17, n18, n19, n20,
         n21, n22, n23;
  wire   [3:0] rptr_nxt;
  wire   [3:0] rwptr_r2;
  wire   [3:0] rwptr_r1;

  DFFSR \rwptr_r1_reg[3]  ( .D(wptr[3]), .CLK(rclk), .R(rst_n), .S(1'b1), .Q(
        rwptr_r1[3]) );
  DFFSR \rwptr_r1_reg[2]  ( .D(wptr[2]), .CLK(rclk), .R(rst_n), .S(1'b1), .Q(
        rwptr_r1[2]) );
  DFFSR \rwptr_r1_reg[1]  ( .D(wptr[1]), .CLK(rclk), .R(rst_n), .S(1'b1), .Q(
        rwptr_r1[1]) );
  DFFSR \rwptr_r1_reg[0]  ( .D(wptr[0]), .CLK(rclk), .R(rst_n), .S(1'b1), .Q(
        rwptr_r1[0]) );
  DFFSR \rwptr_r2_reg[3]  ( .D(rwptr_r1[3]), .CLK(rclk), .R(rst_n), .S(1'b1), 
        .Q(rwptr_r2[3]) );
  DFFSR \rwptr_r2_reg[2]  ( .D(rwptr_r1[2]), .CLK(rclk), .R(rst_n), .S(1'b1), 
        .Q(rwptr_r2[2]) );
  DFFSR \rwptr_r2_reg[1]  ( .D(rwptr_r1[1]), .CLK(rclk), .R(rst_n), .S(1'b1), 
        .Q(rwptr_r2[1]) );
  DFFSR \rwptr_r2_reg[0]  ( .D(rwptr_r1[0]), .CLK(rclk), .R(rst_n), .S(1'b1), 
        .Q(rwptr_r2[0]) );
  DFFSR empty_flag_r_reg ( .D(N3), .CLK(rclk), .R(1'b1), .S(rst_n), .Q(
        empty_flag) );
  DFFSR \raddr_reg[1]  ( .D(rptr_nxt[1]), .CLK(rclk), .R(rst_n), .S(1'b1), .Q(
        raddr[1]) );
  DFFSR \raddr_reg[0]  ( .D(rptr_nxt[0]), .CLK(rclk), .R(rst_n), .S(1'b1), .Q(
        raddr[0]) );
  read_ptr RPU1 ( .rclk(rclk), .rst_n(rst_n), .renable(renable_p2), .rptr(rptr), .rptr_nxt(rptr_nxt) );
  DFFSR \raddr_reg[2]  ( .D(\gray_rptr[2] ), .CLK(rclk), .R(rst_n), .S(1'b1), 
        .Q(raddr[2]) );
  AND2X2 U5 ( .A(n19), .B(n18), .Y(n1) );
  NAND2X1 U16 ( .A(n20), .B(n1), .Y(n21) );
  XNOR2X1 U17 ( .A(n3), .B(n4), .Y(n20) );
  XNOR2X1 U18 ( .A(rptr_nxt[2]), .B(rptr_nxt[3]), .Y(n3) );
  XOR2X1 U19 ( .A(rptr_nxt[1]), .B(rwptr_r2[1]), .Y(n22) );
  INVX2 U20 ( .A(rwptr_r2[3]), .Y(n7) );
  XOR2X1 U21 ( .A(n7), .B(rwptr_r2[2]), .Y(n4) );
  XOR2X1 U22 ( .A(n7), .B(rptr_nxt[3]), .Y(n19) );
  INVX2 U23 ( .A(rptr_nxt[0]), .Y(n17) );
  XOR2X1 U24 ( .A(n17), .B(rwptr_r2[0]), .Y(n18) );
  NOR2X1 U25 ( .A(n22), .B(n21), .Y(N3) );
  INVX2 U26 ( .A(empty_flag), .Y(n23) );
  AND2X2 U27 ( .A(renable), .B(n23), .Y(renable_p2) );
  XOR2X1 U28 ( .A(rptr_nxt[2]), .B(rptr_nxt[3]), .Y(\gray_rptr[2] ) );
endmodule


module fifo ( r_clk, w_clk, n_rst, r_enable, w_enable, w_data, r_data, empty, 
        full );
  input [7:0] w_data;
  output [7:0] r_data;
  input r_clk, w_clk, n_rst, r_enable, w_enable;
  output empty, full;
  wire   wenable_fifo;
  wire   [2:0] waddr;
  wire   [2:0] raddr;
  wire   [3:0] rptr;
  wire   [3:0] wptr;

  fiforam UFIFORAM ( .wclk(w_clk), .wenable(wenable_fifo), .waddr(waddr), 
        .raddr(raddr), .wdata(w_data), .rdata(r_data) );
  write_fifo_ctrl UWFC ( .wclk(w_clk), .rst_n(n_rst), .wenable(w_enable), 
        .rptr(rptr), .wenable_fifo(wenable_fifo), .wptr(wptr), .waddr(waddr), 
        .full_flag(full) );
  read_fifo_ctrl URFC ( .rclk(r_clk), .rst_n(n_rst), .renable(r_enable), 
        .wptr(wptr), .rptr(rptr), .raddr(raddr), .empty_flag(empty) );
endmodule


module rx_fifo ( clk, n_rst, w_enable, r_enable, w_data, r_data, full, empty
 );
  input [7:0] w_data;
  output [7:0] r_data;
  input clk, n_rst, w_enable, r_enable;
  output full, empty;


  fifo FIFO ( .r_clk(clk), .w_clk(clk), .n_rst(n_rst), .r_enable(r_enable), 
        .w_enable(w_enable), .w_data(w_data), .r_data(r_data), .empty(empty), 
        .full(full) );
endmodule


module usb_receiver ( clk, n_rst, d_plus, d_minus, r_enable, r_data, empty, 
        full, rcving, r_error, PID );
  output [7:0] r_data;
  output [3:0] PID;
  input clk, n_rst, d_plus, d_minus, r_enable;
  output empty, full, rcving, r_error;
  wire   d_plus_sync, d_minus_sync, d_edge, shift_enable, eop, d_orig,
         stuff_bit_indicator, byte_received, w_enable, n10, n11, n12, n13, n14,
         n15, n16, n17, n18, n19, n20, n21, n22, n23;
  wire   [3:0] state;
  wire   [7:0] rcv_data;

  DFFSR \PID_reg[0]  ( .D(n19), .CLK(clk), .R(1'b1), .S(n_rst), .Q(PID[0]) );
  DFFSR \PID_reg[1]  ( .D(n20), .CLK(clk), .R(1'b1), .S(n_rst), .Q(PID[1]) );
  DFFSR \PID_reg[2]  ( .D(n21), .CLK(clk), .R(1'b1), .S(n_rst), .Q(PID[2]) );
  DFFSR \PID_reg[3]  ( .D(n22), .CLK(clk), .R(1'b1), .S(n_rst), .Q(PID[3]) );
  AOI22X1 U12 ( .A(rcv_data[3]), .B(n23), .C(PID[3]), .D(n11), .Y(n10) );
  AOI22X1 U13 ( .A(rcv_data[2]), .B(n23), .C(PID[2]), .D(n11), .Y(n12) );
  AOI22X1 U14 ( .A(rcv_data[1]), .B(n23), .C(PID[1]), .D(n11), .Y(n13) );
  AOI22X1 U15 ( .A(rcv_data[0]), .B(n23), .C(PID[0]), .D(n11), .Y(n14) );
  NAND3X1 U16 ( .A(state[3]), .B(state[2]), .C(n15), .Y(n11) );
  NOR2X1 U17 ( .A(state[1]), .B(state[0]), .Y(n15) );
  sync_high SYNC_HIGH ( .clk(clk), .n_rst(n_rst), .async_in(d_plus), 
        .sync_out(d_plus_sync) );
  sync_low SYNC_LOW ( .clk(clk), .n_rst(n_rst), .async_in(d_minus), .sync_out(
        d_minus_sync) );
  edge_detect EDGE_DETECT ( .clk(clk), .n_rst(n_rst), .d_plus(d_plus_sync), 
        .d_edge(d_edge) );
  decode DECODE ( .clk(clk), .n_rst(n_rst), .d_plus(d_plus_sync), 
        .shift_enable(n18), .eop(eop), .d_orig(d_orig) );
  eop_detect EOP ( .d_plus(d_plus_sync), .d_minus(d_minus_sync), .eop(eop) );
  stuff_bit_detector STUFF_BIT ( .clk(clk), .n_rst(n_rst), .shift_enable(
        shift_enable), .d_orig(d_orig), .stuff_bit_indicator(
        stuff_bit_indicator) );
  timer TIMER ( .clk(clk), .n_rst(n_rst), .d_edge(d_edge), .rcving(rcving), 
        .stuff_bit_indicator(stuff_bit_indicator), .shift_enable(shift_enable), 
        .byte_received(byte_received) );
  shift_register_NUM_BITS8_SHIFT_MSB0 SHIFT_REGISTER ( .stuff_bit_indicator(
        stuff_bit_indicator), .clk(clk), .n_rst(n_rst), .shift_enable(n18), 
        .d_orig(d_orig), .rcv_data(rcv_data) );
  rcu RCU ( .pid(PID), .clk(clk), .n_rst(n_rst), .d_edge(n16), .eop(eop), 
        .shift_enable(n18), .byte_received(byte_received), .rcv_data(rcv_data), 
        .rcving(rcving), .w_enable(w_enable), .r_error(r_error), 
        .state_output(state) );
  rx_fifo FIFO ( .clk(clk), .n_rst(n_rst), .w_enable(w_enable), .r_enable(
        r_enable), .w_data(rcv_data), .r_data(r_data), .full(full), .empty(
        empty) );
  BUFX2 U18 ( .A(d_edge), .Y(n16) );
  INVX2 U19 ( .A(n17), .Y(n18) );
  INVX1 U20 ( .A(shift_enable), .Y(n17) );
  INVX2 U21 ( .A(n14), .Y(n19) );
  INVX2 U22 ( .A(n13), .Y(n20) );
  INVX2 U23 ( .A(n12), .Y(n21) );
  INVX2 U24 ( .A(n10), .Y(n22) );
  INVX2 U25 ( .A(n11), .Y(n23) );
endmodule

