/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : K-2015.06-SP1
// Date      : Fri May  1 17:55:26 2020
/////////////////////////////////////////////////////////////


module rcu ( pid, clk, n_rst, d_edge, eop, shift_enable, byte_received, 
        rcv_data, rcving, w_enable, r_error, state_output );
  input [3:0] pid;
  input [7:0] rcv_data;
  output [3:0] state_output;
  input clk, n_rst, d_edge, eop, shift_enable, byte_received;
  output rcving, w_enable, r_error;
  wire   n92, n5, n6, n7, n8, n9, n10, n11, n12, n14, n16, n17, n19, n20, n21,
         n22, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32, n33, n34, n35,
         n36, n37, n38, n39, n40, n41, n42, n43, n44, n45, n46, n47, n48, n49,
         n50, n51, n52, n53, n54, n55, n56, n57, n58, n59, n60, n61, n62, n63,
         n64, n65, n66, n67, n68, n69, n70, n71, n72, n73, n74, n75, n76, n77,
         n78, n79, n80, n81, n82, n83, n84, n85, n86, n87, n88, n89, n90;

  DFFSR \state_reg[0]  ( .D(n84), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        state_output[0]) );
  DFFSR \state_reg[3]  ( .D(n81), .CLK(clk), .R(n_rst), .S(1'b1), .Q(n92) );
  DFFSR \state_reg[2]  ( .D(n82), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        state_output[2]) );
  DFFSR \state_reg[1]  ( .D(n83), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        state_output[1]) );
  INVX2 U7 ( .A(w_enable), .Y(n5) );
  INVX2 U10 ( .A(n66), .Y(n8) );
  INVX2 U11 ( .A(n87), .Y(n9) );
  INVX2 U12 ( .A(n42), .Y(n10) );
  INVX2 U14 ( .A(n41), .Y(n12) );
  INVX2 U16 ( .A(n25), .Y(n14) );
  INVX2 U18 ( .A(state_output[2]), .Y(n16) );
  INVX2 U21 ( .A(d_edge), .Y(n19) );
  INVX2 U22 ( .A(n62), .Y(n20) );
  INVX2 U23 ( .A(shift_enable), .Y(n21) );
  INVX2 U24 ( .A(byte_received), .Y(n22) );
  INVX2 U25 ( .A(rcv_data[2]), .Y(n23) );
  INVX2 U26 ( .A(rcv_data[0]), .Y(n24) );
  OAI21X1 U27 ( .A(state_output[3]), .B(n88), .C(n14), .Y(rcving) );
  OAI21X1 U28 ( .A(n26), .B(state_output[2]), .C(n27), .Y(n25) );
  NOR2X1 U29 ( .A(n16), .B(n28), .Y(r_error) );
  OR2X1 U30 ( .A(n29), .B(state_output[3]), .Y(n28) );
  NAND2X1 U31 ( .A(n30), .B(n31), .Y(n81) );
  AOI21X1 U32 ( .A(n7), .B(n32), .C(n33), .Y(n31) );
  NAND2X1 U33 ( .A(n34), .B(n5), .Y(n33) );
  NOR2X1 U34 ( .A(n27), .B(state_output[3]), .Y(w_enable) );
  OAI21X1 U35 ( .A(n9), .B(n8), .C(n20), .Y(n34) );
  AOI22X1 U36 ( .A(n36), .B(n12), .C(state_output[3]), .D(n85), .Y(n30) );
  OAI21X1 U37 ( .A(n86), .B(n16), .C(n38), .Y(n82) );
  OAI21X1 U38 ( .A(n39), .B(n40), .C(n6), .Y(n38) );
  OAI21X1 U39 ( .A(n36), .B(n41), .C(n10), .Y(n40) );
  NOR2X1 U40 ( .A(n43), .B(n44), .Y(n36) );
  NAND3X1 U41 ( .A(n45), .B(n23), .C(rcv_data[7]), .Y(n44) );
  NAND2X1 U42 ( .A(n46), .B(n47), .Y(n43) );
  NOR2X1 U43 ( .A(rcv_data[6]), .B(rcv_data[5]), .Y(n47) );
  NOR2X1 U44 ( .A(rcv_data[4]), .B(rcv_data[3]), .Y(n46) );
  NAND3X1 U45 ( .A(n48), .B(n35), .C(n49), .Y(n39) );
  OAI21X1 U46 ( .A(n86), .B(n17), .C(n50), .Y(n83) );
  OAI21X1 U47 ( .A(n51), .B(n52), .C(n86), .Y(n50) );
  OR2X1 U48 ( .A(n53), .B(n42), .Y(n52) );
  OAI21X1 U49 ( .A(n20), .B(n87), .C(n55), .Y(n42) );
  NAND2X1 U50 ( .A(n56), .B(n27), .Y(n51) );
  OAI21X1 U51 ( .A(n86), .B(n88), .C(n57), .Y(n84) );
  OAI21X1 U52 ( .A(n58), .B(n59), .C(n6), .Y(n57) );
  OR2X1 U53 ( .A(n53), .B(n60), .Y(n59) );
  OAI21X1 U54 ( .A(n27), .B(n90), .C(n61), .Y(n60) );
  OAI21X1 U55 ( .A(n9), .B(n11), .C(n20), .Y(n61) );
  NAND2X1 U56 ( .A(state_output[2]), .B(n29), .Y(n27) );
  OAI21X1 U57 ( .A(n35), .B(n32), .C(n63), .Y(n53) );
  AOI21X1 U58 ( .A(n64), .B(n8), .C(n12), .Y(n63) );
  NAND3X1 U59 ( .A(n88), .B(n16), .C(n65), .Y(n41) );
  OAI21X1 U60 ( .A(rcv_data[2]), .B(n45), .C(n67), .Y(n32) );
  NAND3X1 U61 ( .A(rcv_data[1]), .B(n24), .C(rcv_data[3]), .Y(n67) );
  NOR2X1 U62 ( .A(rcv_data[1]), .B(rcv_data[0]), .Y(n45) );
  NAND3X1 U63 ( .A(n68), .B(n48), .C(n69), .Y(n58) );
  NAND3X1 U64 ( .A(n70), .B(n71), .C(n72), .Y(n37) );
  AOI22X1 U65 ( .A(n73), .B(state_output[3]), .C(n22), .D(n74), .Y(n72) );
  NAND2X1 U66 ( .A(n35), .B(n56), .Y(n74) );
  NAND2X1 U67 ( .A(n26), .B(n75), .Y(n56) );
  NAND3X1 U68 ( .A(state_output[1]), .B(state_output[3]), .C(n75), .Y(n35) );
  NOR2X1 U69 ( .A(n29), .B(n16), .Y(n73) );
  OAI21X1 U70 ( .A(n76), .B(n77), .C(n62), .Y(n71) );
  NAND2X1 U71 ( .A(shift_enable), .B(eop), .Y(n62) );
  OAI22X1 U72 ( .A(n64), .B(n66), .C(byte_received), .D(n49), .Y(n77) );
  NAND2X1 U73 ( .A(n65), .B(n75), .Y(n49) );
  NAND3X1 U74 ( .A(state_output[3]), .B(n88), .C(state_output[1]), .Y(n66) );
  NOR2X1 U75 ( .A(n21), .B(eop), .Y(n64) );
  OAI21X1 U76 ( .A(d_edge), .B(n54), .C(n48), .Y(n76) );
  NAND3X1 U77 ( .A(state_output[0]), .B(state_output[2]), .C(n65), .Y(n48) );
  NAND3X1 U78 ( .A(n29), .B(n16), .C(state_output[3]), .Y(n54) );
  OAI21X1 U79 ( .A(n78), .B(n79), .C(n19), .Y(n70) );
  OAI21X1 U80 ( .A(n89), .B(n80), .C(n69), .Y(n79) );
  NAND3X1 U81 ( .A(state_output[2]), .B(n88), .C(n65), .Y(n69) );
  NAND2X1 U83 ( .A(state_output[3]), .B(n17), .Y(n80) );
  NAND2X1 U85 ( .A(n55), .B(n68), .Y(n78) );
  NAND3X1 U86 ( .A(n16), .B(n90), .C(n29), .Y(n68) );
  NAND3X1 U88 ( .A(state_output[0]), .B(state_output[2]), .C(n26), .Y(n55) );
  NOR2X1 U89 ( .A(state_output[3]), .B(state_output[1]), .Y(n26) );
  NAND3X1 U90 ( .A(n72), .B(n71), .C(n70), .Y(n85) );
  INVX2 U91 ( .A(n37), .Y(n86) );
  INVX1 U92 ( .A(n85), .Y(n6) );
  NAND3X1 U93 ( .A(n29), .B(n16), .C(state_output[3]), .Y(n87) );
  INVX2 U94 ( .A(n90), .Y(state_output[3]) );
  INVX2 U95 ( .A(n89), .Y(n75) );
  INVX2 U96 ( .A(n92), .Y(n90) );
  AND2X2 U97 ( .A(n17), .B(n88), .Y(n29) );
  INVX2 U98 ( .A(state_output[1]), .Y(n17) );
  INVX2 U99 ( .A(state_output[0]), .Y(n88) );
  INVX1 U100 ( .A(n35), .Y(n7) );
  INVX1 U101 ( .A(n49), .Y(n11) );
  OR2X2 U102 ( .A(n88), .B(state_output[2]), .Y(n89) );
  AND2X1 U103 ( .A(state_output[1]), .B(n90), .Y(n65) );
endmodule

