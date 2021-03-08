/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : K-2015.06-SP1
// Date      : Mon Mar  9 23:19:33 2020
/////////////////////////////////////////////////////////////


module apb_slave ( clk, n_rst, data_ready, overrun_error, framing_error, 
        rx_data, data_read, psel, penable, pwrite, paddr, pwdata, prdata, 
        pslverr, data_size, bit_period );
  input [7:0] rx_data;
  input [2:0] paddr;
  input [7:0] pwdata;
  output [7:0] prdata;
  output [3:0] data_size;
  output [13:0] bit_period;
  input clk, n_rst, data_ready, overrun_error, framing_error, psel, penable,
         pwrite;
  output data_read, pslverr;
  wire   N25, N26, N27, n168, n169, n170, n171, \apb_reg[6][7] ,
         \apb_reg[6][6] , \apb_reg[6][5] , \apb_reg[6][4] , \apb_reg[6][3] ,
         \apb_reg[6][2] , \apb_reg[6][1] , \apb_reg[6][0] , \apb_reg[4][7] ,
         \apb_reg[4][6] , \apb_reg[4][5] , \apb_reg[4][4] , \apb_reg[3][7] ,
         \apb_reg[3][6] , \apb_reg[1][1] , \apb_reg[1][0] , \apb_reg[0][0] ,
         \next_state[0] , \next_apb_reg[6][7] , \next_apb_reg[6][6] ,
         \next_apb_reg[6][5] , \next_apb_reg[6][4] , \next_apb_reg[6][3] ,
         \next_apb_reg[6][2] , \next_apb_reg[6][1] , \next_apb_reg[6][0] ,
         \next_apb_reg[4][7] , \next_apb_reg[4][6] , \next_apb_reg[4][5] ,
         \next_apb_reg[4][4] , \next_apb_reg[4][3] , \next_apb_reg[4][2] ,
         \next_apb_reg[4][1] , \next_apb_reg[4][0] , \next_apb_reg[3][7] ,
         \next_apb_reg[3][6] , \next_apb_reg[3][5] , \next_apb_reg[3][4] ,
         \next_apb_reg[3][3] , \next_apb_reg[3][2] , \next_apb_reg[3][1] ,
         \next_apb_reg[3][0] , \next_apb_reg[2][7] , \next_apb_reg[2][6] ,
         \next_apb_reg[2][5] , \next_apb_reg[2][4] , \next_apb_reg[2][3] ,
         \next_apb_reg[2][2] , \next_apb_reg[2][1] , \next_apb_reg[2][0] ,
         \next_apb_reg[1][1] , \next_apb_reg[1][0] , \next_apb_reg[0][0] ,
         next_pslverr, N133, N134, N135, N136, N137, N138, N139, N140, n64,
         n65, n66, n67, n68, n69, n70, n71, n76, n77, n78, n79, n95, n96, n97,
         n98, n99, n100, n101, n47, n48, n50, n51, n52, n53, n55, n57, n58,
         n59, n60, n61, n62, n63, n72, n73, n74, n75, n80, n81, n82, n83, n84,
         n85, n86, n87, n88, n89, n90, n91, n92, n93, n94, n102, n103, n104,
         n105, n106, n107, n108, n109, n110, n111, n112, n113, n114, n115,
         n116, n117, n118, n119, n120, n121, n122, n123, n124, n125, n126,
         n127, n129, n130, n131, n132, n133, n134, n135, n136, n137, n138,
         n139, n140, n141, n142, n143, n144, n145, n146, n147, n148, n149,
         n150, n151, n152, n153, n154, n155, n156, n157, n158, n159, n160,
         n161, n163, n164, n165, n166, n167;
  wire   [1:0] state;
  wire   [7:0] next_prdata;
  assign N25 = paddr[0];
  assign N26 = paddr[1];
  assign N27 = paddr[2];
  assign \next_apb_reg[6][7]  = rx_data[7];
  assign \next_apb_reg[6][6]  = rx_data[6];
  assign \next_apb_reg[6][5]  = rx_data[5];
  assign \next_apb_reg[6][4]  = rx_data[4];
  assign \next_apb_reg[6][3]  = rx_data[3];
  assign \next_apb_reg[6][2]  = rx_data[2];
  assign \next_apb_reg[6][1]  = rx_data[1];
  assign \next_apb_reg[6][0]  = rx_data[0];
  assign \next_apb_reg[1][0]  = framing_error;

  DFFSR \prdata_reg[7]  ( .D(next_prdata[7]), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(prdata[7]) );
  DFFSR \prdata_reg[6]  ( .D(next_prdata[6]), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(prdata[6]) );
  DFFSR \prdata_reg[5]  ( .D(next_prdata[5]), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(prdata[5]) );
  DFFSR \prdata_reg[4]  ( .D(next_prdata[4]), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(prdata[4]) );
  DFFSR \prdata_reg[3]  ( .D(next_prdata[3]), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(prdata[3]) );
  DFFSR \prdata_reg[2]  ( .D(next_prdata[2]), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(prdata[2]) );
  DFFSR \prdata_reg[1]  ( .D(next_prdata[1]), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(prdata[1]) );
  DFFSR \prdata_reg[0]  ( .D(next_prdata[0]), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(prdata[0]) );
  DFFSR \state_reg[1]  ( .D(n165), .CLK(clk), .R(n_rst), .S(1'b1), .Q(state[1]) );
  DFFSR \state_reg[0]  ( .D(\next_state[0] ), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(state[0]) );
  DFFSR \apb_reg_reg[6][7]  ( .D(\next_apb_reg[6][7] ), .CLK(clk), .R(n129), 
        .S(1'b1), .Q(\apb_reg[6][7] ) );
  DFFSR \apb_reg_reg[6][6]  ( .D(\next_apb_reg[6][6] ), .CLK(clk), .R(n129), 
        .S(1'b1), .Q(\apb_reg[6][6] ) );
  DFFSR \apb_reg_reg[6][5]  ( .D(\next_apb_reg[6][5] ), .CLK(clk), .R(n129), 
        .S(1'b1), .Q(\apb_reg[6][5] ) );
  DFFSR \apb_reg_reg[6][4]  ( .D(\next_apb_reg[6][4] ), .CLK(clk), .R(n129), 
        .S(1'b1), .Q(\apb_reg[6][4] ) );
  DFFSR \apb_reg_reg[6][3]  ( .D(\next_apb_reg[6][3] ), .CLK(clk), .R(n129), 
        .S(1'b1), .Q(\apb_reg[6][3] ) );
  DFFSR \apb_reg_reg[6][2]  ( .D(\next_apb_reg[6][2] ), .CLK(clk), .R(n129), 
        .S(1'b1), .Q(\apb_reg[6][2] ) );
  DFFSR \apb_reg_reg[6][1]  ( .D(\next_apb_reg[6][1] ), .CLK(clk), .R(n_rst), 
        .S(1'b1), .Q(\apb_reg[6][1] ) );
  DFFSR \apb_reg_reg[6][0]  ( .D(\next_apb_reg[6][0] ), .CLK(clk), .R(n129), 
        .S(1'b1), .Q(\apb_reg[6][0] ) );
  DFFSR \apb_reg_reg[4][7]  ( .D(\next_apb_reg[4][7] ), .CLK(clk), .R(n_rst), 
        .S(1'b1), .Q(\apb_reg[4][7] ) );
  DFFSR \apb_reg_reg[4][6]  ( .D(\next_apb_reg[4][6] ), .CLK(clk), .R(n129), 
        .S(1'b1), .Q(\apb_reg[4][6] ) );
  DFFSR \apb_reg_reg[4][5]  ( .D(\next_apb_reg[4][5] ), .CLK(clk), .R(n_rst), 
        .S(1'b1), .Q(\apb_reg[4][5] ) );
  DFFSR \apb_reg_reg[4][4]  ( .D(\next_apb_reg[4][4] ), .CLK(clk), .R(n129), 
        .S(1'b1), .Q(\apb_reg[4][4] ) );
  DFFSR \apb_reg_reg[4][3]  ( .D(\next_apb_reg[4][3] ), .CLK(clk), .R(n_rst), 
        .S(1'b1), .Q(data_size[3]) );
  DFFSR \apb_reg_reg[4][2]  ( .D(\next_apb_reg[4][2] ), .CLK(clk), .R(n_rst), 
        .S(1'b1), .Q(data_size[2]) );
  DFFSR \apb_reg_reg[4][1]  ( .D(\next_apb_reg[4][1] ), .CLK(clk), .R(n_rst), 
        .S(1'b1), .Q(data_size[1]) );
  DFFSR \apb_reg_reg[4][0]  ( .D(\next_apb_reg[4][0] ), .CLK(clk), .R(n_rst), 
        .S(1'b1), .Q(data_size[0]) );
  DFFSR \apb_reg_reg[3][7]  ( .D(\next_apb_reg[3][7] ), .CLK(clk), .R(n_rst), 
        .S(1'b1), .Q(\apb_reg[3][7] ) );
  DFFSR \apb_reg_reg[3][6]  ( .D(\next_apb_reg[3][6] ), .CLK(clk), .R(n_rst), 
        .S(1'b1), .Q(\apb_reg[3][6] ) );
  DFFSR \apb_reg_reg[3][5]  ( .D(\next_apb_reg[3][5] ), .CLK(clk), .R(n_rst), 
        .S(1'b1), .Q(n168) );
  DFFSR \apb_reg_reg[3][4]  ( .D(\next_apb_reg[3][4] ), .CLK(clk), .R(n_rst), 
        .S(1'b1), .Q(n169) );
  DFFSR \apb_reg_reg[3][3]  ( .D(\next_apb_reg[3][3] ), .CLK(clk), .R(n_rst), 
        .S(1'b1), .Q(bit_period[11]) );
  DFFSR \apb_reg_reg[3][2]  ( .D(\next_apb_reg[3][2] ), .CLK(clk), .R(n_rst), 
        .S(1'b1), .Q(bit_period[10]) );
  DFFSR \apb_reg_reg[3][1]  ( .D(\next_apb_reg[3][1] ), .CLK(clk), .R(n_rst), 
        .S(1'b1), .Q(n170) );
  DFFSR \apb_reg_reg[3][0]  ( .D(\next_apb_reg[3][0] ), .CLK(clk), .R(n_rst), 
        .S(1'b1), .Q(bit_period[8]) );
  DFFSR \apb_reg_reg[2][7]  ( .D(\next_apb_reg[2][7] ), .CLK(clk), .R(n129), 
        .S(1'b1), .Q(n171) );
  DFFSR \apb_reg_reg[2][6]  ( .D(\next_apb_reg[2][6] ), .CLK(clk), .R(n129), 
        .S(1'b1), .Q(bit_period[6]) );
  DFFSR \apb_reg_reg[2][5]  ( .D(\next_apb_reg[2][5] ), .CLK(clk), .R(n129), 
        .S(1'b1), .Q(bit_period[5]) );
  DFFSR \apb_reg_reg[2][4]  ( .D(\next_apb_reg[2][4] ), .CLK(clk), .R(n129), 
        .S(1'b1), .Q(bit_period[4]) );
  DFFSR \apb_reg_reg[2][3]  ( .D(\next_apb_reg[2][3] ), .CLK(clk), .R(n129), 
        .S(1'b1), .Q(bit_period[3]) );
  DFFSR \apb_reg_reg[2][2]  ( .D(\next_apb_reg[2][2] ), .CLK(clk), .R(n129), 
        .S(1'b1), .Q(bit_period[2]) );
  DFFSR \apb_reg_reg[2][1]  ( .D(\next_apb_reg[2][1] ), .CLK(clk), .R(n129), 
        .S(1'b1), .Q(bit_period[1]) );
  DFFSR \apb_reg_reg[2][0]  ( .D(\next_apb_reg[2][0] ), .CLK(clk), .R(n129), 
        .S(1'b1), .Q(bit_period[0]) );
  DFFSR \apb_reg_reg[1][1]  ( .D(\next_apb_reg[1][1] ), .CLK(clk), .R(n129), 
        .S(1'b1), .Q(\apb_reg[1][1] ) );
  DFFSR \apb_reg_reg[1][0]  ( .D(\next_apb_reg[1][0] ), .CLK(clk), .R(n129), 
        .S(1'b1), .Q(\apb_reg[1][0] ) );
  DFFSR \apb_reg_reg[0][0]  ( .D(\next_apb_reg[0][0] ), .CLK(clk), .R(n129), 
        .S(1'b1), .Q(\apb_reg[0][0] ) );
  DFFSR pslverr_reg ( .D(next_pslverr), .CLK(clk), .R(n129), .S(1'b1), .Q(
        pslverr) );
  AND2X2 U78 ( .A(N133), .B(n65), .Y(next_prdata[7]) );
  AND2X2 U79 ( .A(N134), .B(n65), .Y(next_prdata[6]) );
  AND2X2 U80 ( .A(N135), .B(n65), .Y(next_prdata[5]) );
  AND2X2 U81 ( .A(N136), .B(n65), .Y(next_prdata[4]) );
  AND2X2 U82 ( .A(N137), .B(n65), .Y(next_prdata[3]) );
  AND2X2 U83 ( .A(N138), .B(n65), .Y(next_prdata[2]) );
  AND2X2 U84 ( .A(N139), .B(n65), .Y(next_prdata[1]) );
  AND2X2 U85 ( .A(N140), .B(n65), .Y(next_prdata[0]) );
  AND2X2 U86 ( .A(n165), .B(n64), .Y(n76) );
  AND2X2 U87 ( .A(state[0]), .B(N27), .Y(n101) );
  OAI21X1 U105 ( .A(n164), .B(n64), .C(n163), .Y(\next_state[0] ) );
  NOR2X1 U106 ( .A(n64), .B(n66), .Y(next_pslverr) );
  NOR2X1 U107 ( .A(n164), .B(pwrite), .Y(n65) );
  OAI21X1 U108 ( .A(n67), .B(n158), .C(n68), .Y(\next_apb_reg[4][7] ) );
  NAND2X1 U109 ( .A(\apb_reg[4][7] ), .B(n67), .Y(n68) );
  OAI21X1 U110 ( .A(n67), .B(n159), .C(n69), .Y(\next_apb_reg[4][6] ) );
  NAND2X1 U111 ( .A(\apb_reg[4][6] ), .B(n67), .Y(n69) );
  OAI21X1 U112 ( .A(n67), .B(n166), .C(n70), .Y(\next_apb_reg[4][5] ) );
  NAND2X1 U113 ( .A(\apb_reg[4][5] ), .B(n67), .Y(n70) );
  OAI21X1 U114 ( .A(n67), .B(n167), .C(n71), .Y(\next_apb_reg[4][4] ) );
  NAND2X1 U115 ( .A(\apb_reg[4][4] ), .B(n67), .Y(n71) );
  OAI21X1 U125 ( .A(n158), .B(n77), .C(n78), .Y(\next_apb_reg[3][7] ) );
  NAND2X1 U126 ( .A(\apb_reg[3][7] ), .B(n77), .Y(n78) );
  OAI21X1 U127 ( .A(n159), .B(n77), .C(n79), .Y(\next_apb_reg[3][6] ) );
  NAND2X1 U128 ( .A(\apb_reg[3][6] ), .B(n77), .Y(n79) );
  OR2X1 U159 ( .A(n156), .B(n95), .Y(n64) );
  NOR2X1 U160 ( .A(n119), .B(N27), .Y(n95) );
  NAND3X1 U161 ( .A(n157), .B(n119), .C(N27), .Y(n96) );
  NAND2X1 U162 ( .A(pwrite), .B(psel), .Y(n66) );
  NOR2X1 U163 ( .A(n161), .B(\next_apb_reg[1][0] ), .Y(\next_apb_reg[1][1] )
         );
  OAI21X1 U164 ( .A(data_read), .B(n160), .C(n98), .Y(\next_apb_reg[0][0] ) );
  NAND2X1 U165 ( .A(\apb_reg[0][0] ), .B(n97), .Y(n98) );
  NOR2X1 U166 ( .A(data_read), .B(data_ready), .Y(n97) );
  NAND3X1 U167 ( .A(n100), .B(N26), .C(n101), .Y(n99) );
  NOR2X1 U168 ( .A(state[1]), .B(N25), .Y(n100) );
  INVX1 U5 ( .A(bit_period[13]), .Y(n47) );
  NOR2X1 U6 ( .A(n119), .B(N27), .Y(n48) );
  INVX4 U7 ( .A(n53), .Y(bit_period[13]) );
  INVX2 U8 ( .A(n168), .Y(n53) );
  BUFX4 U9 ( .A(n169), .Y(bit_period[12]) );
  INVX2 U10 ( .A(n142), .Y(n50) );
  INVX2 U11 ( .A(n145), .Y(n51) );
  INVX2 U14 ( .A(n134), .Y(n52) );
  INVX2 U15 ( .A(n171), .Y(n55) );
  INVX4 U16 ( .A(n55), .Y(bit_period[7]) );
  INVX2 U17 ( .A(n130), .Y(n129) );
  INVX2 U18 ( .A(n_rst), .Y(n130) );
  INVX4 U19 ( .A(n127), .Y(bit_period[9]) );
  INVX2 U44 ( .A(n170), .Y(n127) );
  NOR2X1 U45 ( .A(n120), .B(N26), .Y(n114) );
  NOR2X1 U46 ( .A(n120), .B(n119), .Y(n113) );
  AOI22X1 U47 ( .A(data_size[0]), .B(n114), .C(\apb_reg[6][0] ), .D(n113), .Y(
        n58) );
  NOR2X1 U48 ( .A(N26), .B(N27), .Y(n115) );
  AOI22X1 U49 ( .A(\apb_reg[0][0] ), .B(n115), .C(n124), .D(n95), .Y(n57) );
  AOI21X1 U50 ( .A(n58), .B(n57), .C(N25), .Y(n61) );
  AOI22X1 U51 ( .A(\apb_reg[1][0] ), .B(n115), .C(n126), .D(n95), .Y(n59) );
  OR2X1 U60 ( .A(n61), .B(n60), .Y(N140) );
  AOI22X1 U61 ( .A(data_size[1]), .B(n114), .C(\apb_reg[6][1] ), .D(n113), .Y(
        n63) );
  AOI21X1 U62 ( .A(n63), .B(n62), .C(N25), .Y(n74) );
  AOI22X1 U63 ( .A(\apb_reg[1][1] ), .B(n115), .C(n50), .D(n95), .Y(n72) );
  OR2X1 U64 ( .A(n74), .B(n73), .Y(N139) );
  AOI22X1 U65 ( .A(data_size[2]), .B(n114), .C(\apb_reg[6][2] ), .D(n113), .Y(
        n80) );
  AOI21X1 U66 ( .A(n80), .B(n75), .C(N25), .Y(n83) );
  OR2X1 U67 ( .A(n83), .B(n82), .Y(N138) );
  AOI22X1 U88 ( .A(data_size[3]), .B(n114), .C(\apb_reg[6][3] ), .D(n113), .Y(
        n85) );
  AOI21X1 U89 ( .A(n85), .B(n84), .C(N25), .Y(n88) );
  OR2X1 U90 ( .A(n88), .B(n87), .Y(N137) );
  AOI22X1 U91 ( .A(\apb_reg[4][4] ), .B(n114), .C(\apb_reg[6][4] ), .D(n113), 
        .Y(n90) );
  AOI21X1 U92 ( .A(n90), .B(n89), .C(N25), .Y(n93) );
  OR2X1 U93 ( .A(n93), .B(n92), .Y(N136) );
  AOI22X1 U94 ( .A(\apb_reg[4][5] ), .B(n114), .C(\apb_reg[6][5] ), .D(n113), 
        .Y(n102) );
  AOI21X1 U95 ( .A(n102), .B(n94), .C(N25), .Y(n105) );
  OR2X1 U96 ( .A(n105), .B(n104), .Y(N135) );
  AOI22X1 U97 ( .A(\apb_reg[4][6] ), .B(n114), .C(\apb_reg[6][6] ), .D(n113), 
        .Y(n107) );
  AOI21X1 U98 ( .A(n107), .B(n106), .C(N25), .Y(n110) );
  OR2X1 U99 ( .A(n110), .B(n109), .Y(N134) );
  AOI22X1 U100 ( .A(\apb_reg[4][7] ), .B(n114), .C(\apb_reg[6][7] ), .D(n113), 
        .Y(n112) );
  AOI21X1 U101 ( .A(n112), .B(n111), .C(N25), .Y(n118) );
  OR2X1 U102 ( .A(n118), .B(n117), .Y(N133) );
  NAND2X1 U103 ( .A(\apb_reg[3][7] ), .B(n48), .Y(n116) );
  NAND2X1 U104 ( .A(\apb_reg[3][6] ), .B(n48), .Y(n108) );
  NAND2X1 U116 ( .A(bit_period[13]), .B(n48), .Y(n103) );
  NAND2X1 U117 ( .A(n51), .B(n48), .Y(n91) );
  NAND2X1 U118 ( .A(bit_period[11]), .B(n48), .Y(n86) );
  NAND2X1 U119 ( .A(n122), .B(n48), .Y(n81) );
  NAND2X1 U120 ( .A(bit_period[7]), .B(n48), .Y(n111) );
  NAND2X1 U121 ( .A(bit_period[6]), .B(n48), .Y(n106) );
  NAND2X1 U122 ( .A(n123), .B(n48), .Y(n94) );
  NAND2X1 U123 ( .A(n125), .B(n95), .Y(n89) );
  NAND2X1 U124 ( .A(bit_period[3]), .B(n95), .Y(n84) );
  NAND2X1 U129 ( .A(n52), .B(n48), .Y(n75) );
  NAND2X1 U130 ( .A(n121), .B(n95), .Y(n62) );
  NOR2X1 U131 ( .A(n116), .B(n157), .Y(n117) );
  NOR2X1 U132 ( .A(n108), .B(n157), .Y(n109) );
  NOR2X1 U133 ( .A(n103), .B(n157), .Y(n104) );
  NOR2X1 U134 ( .A(n91), .B(n157), .Y(n92) );
  NOR2X1 U135 ( .A(n86), .B(n157), .Y(n87) );
  NOR2X1 U136 ( .A(n81), .B(n157), .Y(n82) );
  NOR2X1 U137 ( .A(n72), .B(n157), .Y(n73) );
  NOR2X1 U138 ( .A(n59), .B(n157), .Y(n60) );
  INVX2 U139 ( .A(N26), .Y(n119) );
  INVX2 U140 ( .A(N27), .Y(n120) );
  INVX1 U141 ( .A(bit_period[6]), .Y(n138) );
  INVX2 U142 ( .A(n133), .Y(n121) );
  INVX1 U143 ( .A(bit_period[1]), .Y(n133) );
  INVX2 U144 ( .A(n143), .Y(n122) );
  INVX2 U145 ( .A(n137), .Y(n123) );
  INVX1 U146 ( .A(bit_period[7]), .Y(n140) );
  INVX2 U147 ( .A(n132), .Y(n124) );
  INVX2 U148 ( .A(n136), .Y(n125) );
  INVX2 U149 ( .A(n141), .Y(n126) );
  INVX1 U150 ( .A(bit_period[4]), .Y(n136) );
  INVX1 U151 ( .A(bit_period[12]), .Y(n145) );
  INVX1 U152 ( .A(bit_period[0]), .Y(n132) );
  INVX1 U153 ( .A(bit_period[9]), .Y(n142) );
  INVX1 U154 ( .A(bit_period[5]), .Y(n137) );
  INVX1 U155 ( .A(bit_period[11]), .Y(n144) );
  INVX1 U156 ( .A(bit_period[2]), .Y(n134) );
  INVX1 U157 ( .A(bit_period[10]), .Y(n143) );
  INVX1 U158 ( .A(bit_period[8]), .Y(n141) );
  INVX2 U169 ( .A(pwdata[0]), .Y(n147) );
  INVX2 U170 ( .A(N25), .Y(n157) );
  NAND3X1 U171 ( .A(n95), .B(n76), .C(n157), .Y(n131) );
  INVX2 U172 ( .A(n131), .Y(n139) );
  MUX2X1 U173 ( .B(n132), .A(n147), .S(n139), .Y(\next_apb_reg[2][0] ) );
  INVX2 U174 ( .A(pwdata[1]), .Y(n149) );
  MUX2X1 U175 ( .B(n133), .A(n149), .S(n139), .Y(\next_apb_reg[2][1] ) );
  INVX2 U176 ( .A(pwdata[2]), .Y(n151) );
  MUX2X1 U177 ( .B(n134), .A(n151), .S(n139), .Y(\next_apb_reg[2][2] ) );
  INVX2 U178 ( .A(bit_period[3]), .Y(n135) );
  INVX2 U179 ( .A(pwdata[3]), .Y(n154) );
  MUX2X1 U180 ( .B(n135), .A(n154), .S(n139), .Y(\next_apb_reg[2][3] ) );
  INVX2 U181 ( .A(pwdata[4]), .Y(n167) );
  MUX2X1 U182 ( .B(n136), .A(n167), .S(n139), .Y(\next_apb_reg[2][4] ) );
  INVX2 U183 ( .A(pwdata[5]), .Y(n166) );
  MUX2X1 U184 ( .B(n137), .A(n166), .S(n139), .Y(\next_apb_reg[2][5] ) );
  INVX2 U185 ( .A(pwdata[6]), .Y(n159) );
  MUX2X1 U186 ( .B(n138), .A(n159), .S(n139), .Y(\next_apb_reg[2][6] ) );
  INVX2 U187 ( .A(pwdata[7]), .Y(n158) );
  MUX2X1 U188 ( .B(n140), .A(n158), .S(n139), .Y(\next_apb_reg[2][7] ) );
  NAND2X1 U189 ( .A(n76), .B(N25), .Y(n77) );
  INVX2 U190 ( .A(n77), .Y(n146) );
  MUX2X1 U191 ( .B(n141), .A(n147), .S(n146), .Y(\next_apb_reg[3][0] ) );
  MUX2X1 U192 ( .B(n142), .A(n149), .S(n146), .Y(\next_apb_reg[3][1] ) );
  MUX2X1 U193 ( .B(n143), .A(n151), .S(n146), .Y(\next_apb_reg[3][2] ) );
  MUX2X1 U194 ( .B(n144), .A(n154), .S(n146), .Y(\next_apb_reg[3][3] ) );
  MUX2X1 U195 ( .B(n145), .A(n167), .S(n146), .Y(\next_apb_reg[3][4] ) );
  MUX2X1 U196 ( .B(n47), .A(n166), .S(n146), .Y(\next_apb_reg[3][5] ) );
  INVX2 U197 ( .A(n96), .Y(n156) );
  NAND2X1 U198 ( .A(n76), .B(n156), .Y(n67) );
  INVX2 U199 ( .A(data_size[0]), .Y(n148) );
  INVX2 U200 ( .A(n67), .Y(n153) );
  MUX2X1 U201 ( .B(n148), .A(n147), .S(n153), .Y(\next_apb_reg[4][0] ) );
  INVX2 U202 ( .A(data_size[1]), .Y(n150) );
  MUX2X1 U203 ( .B(n150), .A(n149), .S(n153), .Y(\next_apb_reg[4][1] ) );
  INVX2 U204 ( .A(data_size[2]), .Y(n152) );
  MUX2X1 U205 ( .B(n152), .A(n151), .S(n153), .Y(\next_apb_reg[4][2] ) );
  INVX2 U206 ( .A(data_size[3]), .Y(n155) );
  MUX2X1 U207 ( .B(n155), .A(n154), .S(n153), .Y(\next_apb_reg[4][3] ) );
  INVX2 U208 ( .A(data_ready), .Y(n160) );
  INVX2 U209 ( .A(overrun_error), .Y(n161) );
  INVX2 U210 ( .A(n99), .Y(data_read) );
  INVX2 U211 ( .A(n65), .Y(n163) );
  INVX2 U212 ( .A(psel), .Y(n164) );
  INVX2 U213 ( .A(n66), .Y(n165) );
endmodule


module start_bit_det ( clk, n_rst, serial_in, start_bit_detected, 
        new_package_detected );
  input clk, n_rst, serial_in;
  output start_bit_detected, new_package_detected;
  wire   start_bit_detected, old_sample, new_sample, sync_phase, n4;
  assign new_package_detected = start_bit_detected;

  DFFSR sync_phase_reg ( .D(serial_in), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        sync_phase) );
  DFFSR new_sample_reg ( .D(sync_phase), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        new_sample) );
  DFFSR old_sample_reg ( .D(new_sample), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        old_sample) );
  NOR2X1 U7 ( .A(n4), .B(new_sample), .Y(start_bit_detected) );
  INVX2 U6 ( .A(old_sample), .Y(n4) );
endmodule


module rcu ( clk, n_rst, new_packet_detected, packet_done, framing_error, 
        sbc_clear, sbc_enable, load_buffer, enable_timer );
  input clk, n_rst, new_packet_detected, packet_done, framing_error;
  output sbc_clear, sbc_enable, load_buffer, enable_timer;
  wire   n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16, n17, n18, n19,
         n20;
  wire   [2:0] state;
  wire   [2:0] next_state;

  DFFSR \state_reg[0]  ( .D(next_state[0]), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(state[0]) );
  DFFSR \state_reg[2]  ( .D(next_state[2]), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(state[2]) );
  DFFSR \state_reg[1]  ( .D(next_state[1]), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(state[1]) );
  AND2X1 U6 ( .A(n13), .B(n20), .Y(n5) );
  AND2X2 U7 ( .A(n8), .B(n18), .Y(enable_timer) );
  INVX2 U8 ( .A(framing_error), .Y(n11) );
  MUX2X1 U9 ( .B(new_packet_detected), .A(n11), .S(state[2]), .Y(n6) );
  OR2X1 U10 ( .A(state[1]), .B(n6), .Y(n10) );
  INVX2 U11 ( .A(state[0]), .Y(n7) );
  NAND2X1 U12 ( .A(state[1]), .B(n7), .Y(n13) );
  INVX2 U13 ( .A(n13), .Y(n8) );
  INVX2 U14 ( .A(state[2]), .Y(n18) );
  NAND2X1 U15 ( .A(packet_done), .B(enable_timer), .Y(n9) );
  OAI21X1 U16 ( .A(state[0]), .B(n10), .C(n9), .Y(next_state[0]) );
  NAND2X1 U17 ( .A(state[1]), .B(state[0]), .Y(n14) );
  NAND2X1 U18 ( .A(n14), .B(n11), .Y(n17) );
  INVX2 U19 ( .A(state[1]), .Y(n12) );
  NAND2X1 U20 ( .A(state[0]), .B(n12), .Y(n20) );
  NAND2X1 U21 ( .A(n5), .B(state[2]), .Y(n16) );
  INVX2 U22 ( .A(n14), .Y(n15) );
  NAND2X1 U23 ( .A(n15), .B(n18), .Y(n19) );
  OAI21X1 U24 ( .A(n17), .B(n16), .C(n19), .Y(next_state[2]) );
  NOR2X1 U25 ( .A(state[2]), .B(n5), .Y(next_state[1]) );
  NOR2X1 U26 ( .A(n20), .B(n18), .Y(load_buffer) );
  INVX2 U27 ( .A(n19), .Y(sbc_enable) );
  NOR2X1 U28 ( .A(state[2]), .B(n20), .Y(sbc_clear) );
endmodule


module stop_bit_chk ( clk, n_rst, sbc_clear, sbc_enable, stop_bit, 
        framing_error );
  input clk, n_rst, sbc_clear, sbc_enable, stop_bit;
  output framing_error;
  wire   n4, n5, n2, n3;

  DFFSR framing_error_reg ( .D(n5), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        framing_error) );
  NOR2X1 U5 ( .A(sbc_clear), .B(n4), .Y(n5) );
  AOI22X1 U6 ( .A(framing_error), .B(n3), .C(sbc_enable), .D(n2), .Y(n4) );
  INVX2 U3 ( .A(stop_bit), .Y(n2) );
  INVX2 U4 ( .A(sbc_enable), .Y(n3) );
endmodule


module flex_counter_NUM_CNT_BITS14_DW01_inc_2 ( A, SUM );
  input [13:0] A;
  output [13:0] SUM;
  wire   n3, n4, n5, n7, n8, n9, n10, n11, n13, n14, n15, n17, n18, n19, n21,
         n22, n23, n25, n26, n28, n29, n30, n31, n32, n33, n34, n35, n36, n37,
         n38, n40, n41, n42, n44, n45, n46, n47, n48, n49, n50, n51, n52, n53,
         n54, n55, n56, n57, n58, n91, n92, n93, n94, n95, n96, n97, n98, n99,
         n100;
  assign n5 = A[12];
  assign n11 = A[11];
  assign n15 = A[10];
  assign n21 = A[9];
  assign n25 = A[8];
  assign n30 = A[7];
  assign n34 = A[6];
  assign n40 = A[5];
  assign n44 = A[4];
  assign n49 = A[3];
  assign n52 = A[2];
  assign n56 = A[1];
  assign n58 = A[0];

  NOR2X1 U5 ( .A(n96), .B(n4), .Y(n3) );
  NAND2X1 U6 ( .A(n5), .B(n9), .Y(n4) );
  NOR2X1 U10 ( .A(n96), .B(n8), .Y(n7) );
  NOR2X1 U12 ( .A(n18), .B(n10), .Y(n9) );
  NAND2X1 U13 ( .A(n11), .B(n15), .Y(n10) );
  NOR2X1 U17 ( .A(n14), .B(n96), .Y(n13) );
  NAND2X1 U18 ( .A(n15), .B(n19), .Y(n14) );
  XNOR2X1 U21 ( .A(n23), .B(n22), .Y(SUM[9]) );
  NOR2X1 U22 ( .A(n18), .B(n96), .Y(n17) );
  NAND2X1 U25 ( .A(n21), .B(n25), .Y(n18) );
  XOR2X1 U28 ( .A(n96), .B(n26), .Y(SUM[8]) );
  NOR2X1 U29 ( .A(n96), .B(n26), .Y(n23) );
  XNOR2X1 U33 ( .A(n32), .B(n31), .Y(SUM[7]) );
  NOR2X1 U35 ( .A(n37), .B(n29), .Y(n28) );
  NAND2X1 U36 ( .A(n30), .B(n34), .Y(n29) );
  XNOR2X1 U39 ( .A(n36), .B(n35), .Y(SUM[6]) );
  NOR2X1 U40 ( .A(n33), .B(n99), .Y(n32) );
  NAND2X1 U41 ( .A(n95), .B(n38), .Y(n33) );
  XNOR2X1 U44 ( .A(n42), .B(n41), .Y(SUM[5]) );
  NOR2X1 U45 ( .A(n46), .B(n94), .Y(n36) );
  NAND2X1 U48 ( .A(n40), .B(n44), .Y(n37) );
  NOR2X1 U52 ( .A(n45), .B(n99), .Y(n42) );
  XOR2X1 U56 ( .A(n51), .B(n50), .Y(SUM[3]) );
  NOR2X1 U58 ( .A(n55), .B(n48), .Y(n47) );
  NAND2X1 U59 ( .A(n49), .B(n52), .Y(n48) );
  XNOR2X1 U62 ( .A(n53), .B(n54), .Y(SUM[2]) );
  NAND2X1 U63 ( .A(n97), .B(n54), .Y(n51) );
  XNOR2X1 U66 ( .A(n57), .B(n93), .Y(SUM[1]) );
  NAND2X1 U68 ( .A(n56), .B(n58), .Y(n55) );
  XOR2X1 U75 ( .A(n3), .B(n91), .Y(SUM[13]) );
  INVX8 U76 ( .A(n92), .Y(n91) );
  INVX8 U77 ( .A(A[13]), .Y(n92) );
  INVX4 U78 ( .A(n100), .Y(n96) );
  XNOR2X1 U79 ( .A(n98), .B(n45), .Y(SUM[4]) );
  INVX2 U80 ( .A(n98), .Y(n99) );
  INVX2 U81 ( .A(SUM[0]), .Y(n93) );
  INVX2 U82 ( .A(n58), .Y(SUM[0]) );
  INVX1 U83 ( .A(n38), .Y(n94) );
  BUFX2 U84 ( .A(n34), .Y(n95) );
  INVX1 U85 ( .A(n9), .Y(n8) );
  XOR2X1 U86 ( .A(n17), .B(n15), .Y(SUM[10]) );
  XOR2X1 U87 ( .A(n13), .B(n11), .Y(SUM[11]) );
  XOR2X1 U88 ( .A(n7), .B(n5), .Y(SUM[12]) );
  INVX1 U89 ( .A(n30), .Y(n31) );
  INVX1 U90 ( .A(n56), .Y(n57) );
  INVX1 U91 ( .A(n53), .Y(n97) );
  INVX1 U92 ( .A(n49), .Y(n50) );
  INVX1 U93 ( .A(n44), .Y(n45) );
  INVX1 U94 ( .A(n95), .Y(n35) );
  INVX1 U95 ( .A(n40), .Y(n41) );
  INVX1 U96 ( .A(n55), .Y(n54) );
  INVX2 U97 ( .A(n46), .Y(n98) );
  INVX1 U98 ( .A(n37), .Y(n38) );
  INVX1 U99 ( .A(n47), .Y(n46) );
  INVX1 U100 ( .A(n52), .Y(n53) );
  AND2X2 U101 ( .A(n47), .B(n28), .Y(n100) );
  INVX2 U102 ( .A(n25), .Y(n26) );
  INVX2 U103 ( .A(n21), .Y(n22) );
  INVX2 U104 ( .A(n18), .Y(n19) );
endmodule


module flex_counter_NUM_CNT_BITS14 ( clk, n_rst, clear, count_enable, 
        rollover_val, count_out, rollover_flag );
  input [13:0] rollover_val;
  output [13:0] count_out;
  input clk, n_rst, clear, count_enable;
  output rollover_flag;
  wire   N7, N8, N9, N10, N11, N12, N13, N14, N15, N16, N17, N18, N19, N20,
         N21, N38, N37, N36, N35, N34, N33, N32, N31, N30, N29, N28, N27, N26,
         N25, n1, n2, n3, n4, n5, n6, n7, n8, n24, n25, n26, n27, n28, n29,
         n30, n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43,
         n44, n45, n46, n47, n48, n49, n50, n51, n52, n53, n54, n55, n56, n57,
         n58, n59, n60, n61, n62, n63, n64, n65, n66, n67, n68, n69, n70, n71,
         n72, n73, n74, n75, n76, n77, n78, n79, n80, n81, n82, n83, n84, n85,
         n86, n87, n88, n89, n90, n91, n92, n93, n94, n95, n96, n97, n98, n99,
         n100, n101, n102, n103, n104, n105, n106, n107, n108, n109, n110,
         n111, n112, n113, n114, n115, n116, n117, n118, n119, n120, n121,
         n122, n123, n124, n125, n126, n127, n128, n129, n130, n131, n132,
         n133, n134, n135, n136, n137, n138, n139, n140, n141, n142, n143,
         n144, n145, n146, n147, n148, n149, n150, n151, n152, n153, n154,
         n155, n156;
  wire   [13:0] next_count_out;

  DFFSR \count_out_reg[13]  ( .D(next_count_out[13]), .CLK(clk), .R(n_rst), 
        .S(1'b1), .Q(count_out[13]) );
  DFFSR \count_out_reg[12]  ( .D(next_count_out[12]), .CLK(clk), .R(n_rst), 
        .S(1'b1), .Q(count_out[12]) );
  DFFSR \count_out_reg[11]  ( .D(next_count_out[11]), .CLK(clk), .R(n_rst), 
        .S(1'b1), .Q(count_out[11]) );
  DFFSR \count_out_reg[10]  ( .D(next_count_out[10]), .CLK(clk), .R(n_rst), 
        .S(1'b1), .Q(count_out[10]) );
  DFFSR \count_out_reg[9]  ( .D(next_count_out[9]), .CLK(clk), .R(n_rst), .S(
        1'b1), .Q(count_out[9]) );
  DFFSR \count_out_reg[8]  ( .D(next_count_out[8]), .CLK(clk), .R(n_rst), .S(
        1'b1), .Q(count_out[8]) );
  DFFSR \count_out_reg[7]  ( .D(next_count_out[7]), .CLK(clk), .R(n_rst), .S(
        1'b1), .Q(count_out[7]) );
  DFFSR \count_out_reg[6]  ( .D(next_count_out[6]), .CLK(clk), .R(n_rst), .S(
        1'b1), .Q(count_out[6]) );
  DFFSR \count_out_reg[5]  ( .D(next_count_out[5]), .CLK(clk), .R(n_rst), .S(
        1'b1), .Q(count_out[5]) );
  DFFSR \count_out_reg[4]  ( .D(next_count_out[4]), .CLK(clk), .R(n_rst), .S(
        1'b1), .Q(count_out[4]) );
  DFFSR \count_out_reg[3]  ( .D(n6), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[3]) );
  DFFSR \count_out_reg[2]  ( .D(next_count_out[2]), .CLK(clk), .R(n_rst), .S(
        1'b1), .Q(count_out[2]) );
  DFFSR \count_out_reg[1]  ( .D(next_count_out[1]), .CLK(clk), .R(n_rst), .S(
        1'b1), .Q(count_out[1]) );
  DFFSR \count_out_reg[0]  ( .D(next_count_out[0]), .CLK(clk), .R(n_rst), .S(
        1'b1), .Q(count_out[0]) );
  DFFSR rollover_flag_reg ( .D(N21), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        rollover_flag) );
  flex_counter_NUM_CNT_BITS14_DW01_inc_2 add_45_aco ( .A({N38, N37, N36, N35, 
        N34, N33, N32, N31, N30, N29, N28, N27, N26, N25}), .SUM({N20, N19, 
        N18, N17, N16, N15, N14, N13, N12, N11, N10, N9, N8, N7}) );
  NAND2X1 U18 ( .A(n1), .B(n2), .Y(n3) );
  NAND2X1 U19 ( .A(n3), .B(n56), .Y(next_count_out[3]) );
  INVX1 U20 ( .A(n58), .Y(n1) );
  INVX1 U21 ( .A(n90), .Y(n2) );
  INVX2 U22 ( .A(next_count_out[2]), .Y(n141) );
  INVX2 U23 ( .A(n90), .Y(n29) );
  INVX2 U24 ( .A(n30), .Y(n25) );
  AND2X1 U25 ( .A(n143), .B(n144), .Y(n4) );
  INVX1 U26 ( .A(next_count_out[3]), .Y(n5) );
  INVX1 U27 ( .A(n5), .Y(n6) );
  INVX1 U28 ( .A(rollover_val[4]), .Y(n24) );
  AOI22X1 U29 ( .A(n7), .B(count_out[1]), .C(n41), .D(N8), .Y(n140) );
  INVX1 U30 ( .A(n58), .Y(n7) );
  INVX4 U31 ( .A(n131), .Y(n41) );
  OAI21X1 U32 ( .A(n148), .B(n149), .C(n147), .Y(n150) );
  INVX2 U33 ( .A(n75), .Y(n8) );
  INVX2 U34 ( .A(n75), .Y(n92) );
  AND2X1 U35 ( .A(n87), .B(count_out[4]), .Y(N29) );
  AND2X1 U36 ( .A(n87), .B(count_out[1]), .Y(N26) );
  INVX1 U37 ( .A(count_out[1]), .Y(n93) );
  XOR2X1 U38 ( .A(next_count_out[4]), .B(n24), .Y(n129) );
  XOR2X1 U39 ( .A(next_count_out[8]), .B(n25), .Y(n127) );
  AND2X2 U40 ( .A(n27), .B(n26), .Y(n84) );
  NOR2X1 U41 ( .A(n65), .B(n66), .Y(n26) );
  NOR2X1 U42 ( .A(n73), .B(n74), .Y(n27) );
  AND2X2 U43 ( .A(count_out[5]), .B(n87), .Y(N30) );
  INVX1 U44 ( .A(N17), .Y(n48) );
  BUFX2 U45 ( .A(n8), .Y(n28) );
  OR2X1 U46 ( .A(N13), .B(n31), .Y(n124) );
  INVX1 U47 ( .A(N13), .Y(n121) );
  XNOR2X1 U48 ( .A(rollover_val[3]), .B(n29), .Y(n85) );
  BUFX2 U49 ( .A(rollover_val[8]), .Y(n30) );
  NAND2X1 U50 ( .A(n123), .B(n122), .Y(n31) );
  INVX1 U51 ( .A(rollover_val[6]), .Y(n122) );
  NAND2X1 U52 ( .A(n142), .B(n4), .Y(n145) );
  NAND2X1 U53 ( .A(n7), .B(n32), .Y(n33) );
  NAND2X1 U54 ( .A(n33), .B(n50), .Y(next_count_out[2]) );
  INVX1 U55 ( .A(n91), .Y(n32) );
  XNOR2X1 U56 ( .A(next_count_out[3]), .B(n34), .Y(n146) );
  INVX1 U57 ( .A(rollover_val[3]), .Y(n34) );
  NOR2X1 U58 ( .A(n36), .B(n37), .Y(n35) );
  XNOR2X1 U59 ( .A(n97), .B(rollover_val[10]), .Y(n36) );
  XNOR2X1 U60 ( .A(n100), .B(rollover_val[9]), .Y(n37) );
  BUFX2 U61 ( .A(rollover_val[1]), .Y(n38) );
  BUFX2 U62 ( .A(n137), .Y(n39) );
  INVX1 U63 ( .A(N16), .Y(n47) );
  INVX1 U64 ( .A(N19), .Y(n52) );
  INVX1 U65 ( .A(rollover_val[13]), .Y(n135) );
  NAND2X1 U66 ( .A(n35), .B(n111), .Y(n156) );
  INVX1 U67 ( .A(rollover_val[12]), .Y(n108) );
  OR2X2 U68 ( .A(n58), .B(n89), .Y(n40) );
  NAND2X1 U69 ( .A(n40), .B(n45), .Y(next_count_out[4]) );
  INVX1 U70 ( .A(rollover_val[11]), .Y(n104) );
  INVX1 U71 ( .A(N18), .Y(n49) );
  AND2X2 U72 ( .A(count_out[0]), .B(n87), .Y(N25) );
  INVX8 U73 ( .A(n41), .Y(n42) );
  INVX4 U74 ( .A(n42), .Y(n116) );
  INVX2 U75 ( .A(clear), .Y(n44) );
  NAND2X1 U76 ( .A(count_enable), .B(n44), .Y(n131) );
  INVX2 U77 ( .A(N20), .Y(n137) );
  INVX2 U78 ( .A(count_enable), .Y(n43) );
  NAND2X1 U79 ( .A(n44), .B(n43), .Y(n58) );
  INVX2 U80 ( .A(n58), .Y(n55) );
  NAND2X1 U81 ( .A(count_out[13]), .B(n55), .Y(n132) );
  OAI21X1 U82 ( .A(n42), .B(n39), .C(n132), .Y(next_count_out[13]) );
  INVX2 U83 ( .A(count_out[4]), .Y(n89) );
  NAND2X1 U84 ( .A(N11), .B(n116), .Y(n45) );
  INVX2 U85 ( .A(N14), .Y(n46) );
  NAND2X1 U86 ( .A(count_out[7]), .B(n55), .Y(n115) );
  OAI21X1 U87 ( .A(n42), .B(n46), .C(n115), .Y(next_count_out[7]) );
  NAND2X1 U88 ( .A(count_out[9]), .B(n55), .Y(n98) );
  OAI21X1 U89 ( .A(n42), .B(n47), .C(n98), .Y(next_count_out[9]) );
  NAND2X1 U90 ( .A(count_out[10]), .B(n55), .Y(n95) );
  OAI21X1 U91 ( .A(n42), .B(n48), .C(n95), .Y(next_count_out[10]) );
  NAND2X1 U92 ( .A(count_out[11]), .B(n55), .Y(n101) );
  OAI21X1 U93 ( .A(n42), .B(n49), .C(n101), .Y(next_count_out[11]) );
  INVX2 U94 ( .A(count_out[2]), .Y(n91) );
  NAND2X1 U95 ( .A(N9), .B(n116), .Y(n50) );
  INVX2 U96 ( .A(count_out[0]), .Y(n94) );
  NAND2X1 U97 ( .A(N7), .B(n116), .Y(n51) );
  OAI21X1 U98 ( .A(n58), .B(n94), .C(n51), .Y(next_count_out[0]) );
  NAND2X1 U99 ( .A(count_out[12]), .B(n55), .Y(n105) );
  OAI21X1 U100 ( .A(n42), .B(n52), .C(n105), .Y(next_count_out[12]) );
  INVX2 U101 ( .A(N12), .Y(n53) );
  NAND2X1 U102 ( .A(count_out[5]), .B(n55), .Y(n112) );
  OAI21X1 U103 ( .A(n42), .B(n53), .C(n112), .Y(next_count_out[5]) );
  INVX2 U104 ( .A(count_out[8]), .Y(n81) );
  NAND2X1 U105 ( .A(n116), .B(N15), .Y(n54) );
  OAI21X1 U106 ( .A(n58), .B(n81), .C(n54), .Y(next_count_out[8]) );
  NAND2X1 U107 ( .A(count_out[6]), .B(n55), .Y(n123) );
  OAI21X1 U108 ( .A(n42), .B(n121), .C(n123), .Y(next_count_out[6]) );
  INVX2 U109 ( .A(count_out[3]), .Y(n90) );
  NAND2X1 U110 ( .A(N10), .B(n116), .Y(n56) );
  NAND2X1 U111 ( .A(N8), .B(n116), .Y(n57) );
  OAI21X1 U112 ( .A(n58), .B(n93), .C(n57), .Y(next_count_out[1]) );
  XOR2X1 U113 ( .A(rollover_val[1]), .B(n93), .Y(n86) );
  INVX2 U114 ( .A(count_out[10]), .Y(n79) );
  XOR2X1 U115 ( .A(n79), .B(rollover_val[10]), .Y(n61) );
  XOR2X1 U116 ( .A(n91), .B(rollover_val[2]), .Y(n60) );
  INVX2 U117 ( .A(count_out[11]), .Y(n78) );
  XOR2X1 U118 ( .A(n78), .B(rollover_val[11]), .Y(n59) );
  NAND3X1 U119 ( .A(n61), .B(n60), .C(n59), .Y(n66) );
  XOR2X1 U120 ( .A(n89), .B(rollover_val[4]), .Y(n64) );
  INVX2 U121 ( .A(count_out[9]), .Y(n80) );
  XOR2X1 U122 ( .A(n80), .B(rollover_val[9]), .Y(n63) );
  INVX2 U123 ( .A(count_out[7]), .Y(n82) );
  XOR2X1 U124 ( .A(n82), .B(rollover_val[7]), .Y(n62) );
  NAND3X1 U125 ( .A(n64), .B(n63), .C(n62), .Y(n65) );
  INVX2 U126 ( .A(count_out[5]), .Y(n88) );
  XOR2X1 U127 ( .A(n88), .B(rollover_val[5]), .Y(n69) );
  INVX2 U128 ( .A(count_out[6]), .Y(n83) );
  XOR2X1 U129 ( .A(n83), .B(rollover_val[6]), .Y(n68) );
  XOR2X1 U130 ( .A(n81), .B(rollover_val[8]), .Y(n67) );
  NAND3X1 U131 ( .A(n69), .B(n68), .C(n67), .Y(n74) );
  XOR2X1 U132 ( .A(n94), .B(rollover_val[0]), .Y(n72) );
  INVX2 U133 ( .A(count_out[12]), .Y(n77) );
  XOR2X1 U134 ( .A(n77), .B(rollover_val[12]), .Y(n71) );
  INVX2 U135 ( .A(count_out[13]), .Y(n76) );
  XOR2X1 U136 ( .A(n76), .B(rollover_val[13]), .Y(n70) );
  NAND3X1 U137 ( .A(n72), .B(n71), .C(n70), .Y(n73) );
  NAND3X1 U138 ( .A(n86), .B(n85), .C(n84), .Y(n75) );
  NOR2X1 U139 ( .A(n28), .B(n76), .Y(N38) );
  NOR2X1 U140 ( .A(n28), .B(n77), .Y(N37) );
  NOR2X1 U141 ( .A(n92), .B(n78), .Y(N36) );
  NOR2X1 U142 ( .A(n8), .B(n79), .Y(N35) );
  NOR2X1 U143 ( .A(n92), .B(n80), .Y(N34) );
  NOR2X1 U144 ( .A(n8), .B(n81), .Y(N33) );
  NOR2X1 U145 ( .A(n82), .B(n8), .Y(N32) );
  NOR2X1 U146 ( .A(n83), .B(n8), .Y(N31) );
  NAND3X1 U147 ( .A(n86), .B(n85), .C(n84), .Y(n87) );
  NOR2X1 U148 ( .A(n90), .B(n92), .Y(N28) );
  NOR2X1 U149 ( .A(n91), .B(n92), .Y(N27) );
  INVX2 U150 ( .A(n95), .Y(n96) );
  OAI22X1 U151 ( .A(n116), .B(n96), .C(N17), .D(n96), .Y(n97) );
  INVX2 U152 ( .A(n98), .Y(n99) );
  OAI22X1 U153 ( .A(n116), .B(n99), .C(N16), .D(n99), .Y(n100) );
  INVX2 U154 ( .A(n101), .Y(n102) );
  OAI22X1 U155 ( .A(n116), .B(n102), .C(N18), .D(n102), .Y(n103) );
  XOR2X1 U156 ( .A(n103), .B(n104), .Y(n110) );
  INVX2 U157 ( .A(n105), .Y(n106) );
  OAI22X1 U158 ( .A(n116), .B(n106), .C(N19), .D(n106), .Y(n107) );
  XOR2X1 U159 ( .A(n107), .B(n108), .Y(n109) );
  NOR2X1 U160 ( .A(n110), .B(n109), .Y(n111) );
  INVX2 U161 ( .A(n112), .Y(n113) );
  OAI22X1 U162 ( .A(n116), .B(n113), .C(N12), .D(n113), .Y(n114) );
  XOR2X1 U163 ( .A(n114), .B(rollover_val[5]), .Y(n154) );
  INVX2 U164 ( .A(n115), .Y(n117) );
  OAI22X1 U165 ( .A(n117), .B(n116), .C(N14), .D(n117), .Y(n118) );
  XOR2X1 U166 ( .A(n118), .B(rollover_val[7]), .Y(n153) );
  NAND2X1 U167 ( .A(n123), .B(n42), .Y(n120) );
  NAND3X1 U168 ( .A(N13), .B(n120), .C(rollover_val[6]), .Y(n126) );
  OAI21X1 U169 ( .A(n123), .B(n122), .C(n120), .Y(n119) );
  OAI21X1 U170 ( .A(n122), .B(n120), .C(n119), .Y(n125) );
  NAND3X1 U171 ( .A(n126), .B(n125), .C(n124), .Y(n128) );
  NAND3X1 U172 ( .A(n128), .B(n129), .C(n127), .Y(n151) );
  NAND2X1 U173 ( .A(n132), .B(n135), .Y(n130) );
  NOR2X1 U174 ( .A(N20), .B(n130), .Y(n149) );
  NAND2X1 U175 ( .A(n132), .B(n42), .Y(n134) );
  NAND2X1 U176 ( .A(rollover_val[13]), .B(n134), .Y(n138) );
  OAI21X1 U177 ( .A(n132), .B(n135), .C(n134), .Y(n133) );
  OAI21X1 U178 ( .A(n135), .B(n134), .C(n133), .Y(n136) );
  OAI21X1 U179 ( .A(n138), .B(n137), .C(n136), .Y(n148) );
  INVX2 U180 ( .A(next_count_out[0]), .Y(n139) );
  XOR2X1 U181 ( .A(rollover_val[0]), .B(n139), .Y(n144) );
  XOR2X1 U182 ( .A(n38), .B(n140), .Y(n143) );
  XOR2X1 U183 ( .A(rollover_val[2]), .B(n141), .Y(n142) );
  NOR2X1 U184 ( .A(n146), .B(n145), .Y(n147) );
  NOR2X1 U185 ( .A(n151), .B(n150), .Y(n152) );
  NAND3X1 U186 ( .A(n154), .B(n153), .C(n152), .Y(n155) );
  NOR2X1 U187 ( .A(n156), .B(n155), .Y(N21) );
endmodule


module flex_counter_NUM_CNT_BITS4 ( clk, n_rst, clear, count_enable, 
        rollover_val, count_out, rollover_flag );
  input [3:0] rollover_val;
  output [3:0] count_out;
  input clk, n_rst, clear, count_enable;
  output rollover_flag;
  wire   N11, n1, n2, n3, n4, n5, n6, n7, n8, n14, n15, n16, n17, n18, n19,
         n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32, n33,
         n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44, n45, n46, n47,
         n48, n49, n50, n51;
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
  INVX1 U8 ( .A(n34), .Y(n1) );
  INVX1 U9 ( .A(n1), .Y(n2) );
  BUFX2 U10 ( .A(rollover_val[3]), .Y(n3) );
  INVX1 U11 ( .A(n5), .Y(n4) );
  INVX1 U12 ( .A(n36), .Y(n5) );
  INVX2 U13 ( .A(n35), .Y(n36) );
  NAND2X1 U14 ( .A(count_out[1]), .B(n36), .Y(n6) );
  NAND2X1 U15 ( .A(count_out[1]), .B(n36), .Y(n7) );
  INVX2 U16 ( .A(count_out[2]), .Y(n21) );
  INVX2 U17 ( .A(count_out[0]), .Y(n23) );
  XOR2X1 U18 ( .A(n23), .B(rollover_val[0]), .Y(n17) );
  XOR2X1 U19 ( .A(rollover_val[2]), .B(count_out[2]), .Y(n14) );
  XOR2X1 U20 ( .A(rollover_val[1]), .B(count_out[1]), .Y(n8) );
  NOR2X1 U21 ( .A(n14), .B(n8), .Y(n16) );
  INVX2 U22 ( .A(count_out[3]), .Y(n25) );
  XOR2X1 U23 ( .A(n25), .B(rollover_val[3]), .Y(n15) );
  NAND3X1 U24 ( .A(n17), .B(n16), .C(n15), .Y(n34) );
  NAND2X1 U25 ( .A(count_out[0]), .B(n34), .Y(n35) );
  NAND2X1 U26 ( .A(count_out[1]), .B(n36), .Y(n27) );
  INVX2 U27 ( .A(count_enable), .Y(n33) );
  NOR2X1 U28 ( .A(n7), .B(n33), .Y(n19) );
  NAND2X1 U29 ( .A(count_out[2]), .B(n34), .Y(n26) );
  INVX2 U30 ( .A(n26), .Y(n18) );
  MUX2X1 U31 ( .B(n19), .A(n27), .S(n18), .Y(n20) );
  OAI21X1 U32 ( .A(count_enable), .B(n21), .C(n20), .Y(n22) );
  INVX2 U33 ( .A(clear), .Y(n40) );
  NAND2X1 U34 ( .A(n22), .B(n40), .Y(n47) );
  INVX2 U35 ( .A(n47), .Y(next_count_out[2]) );
  MUX2X1 U36 ( .B(n23), .A(n4), .S(count_enable), .Y(n24) );
  NAND2X1 U37 ( .A(n24), .B(n40), .Y(n42) );
  INVX2 U38 ( .A(n42), .Y(next_count_out[0]) );
  NOR2X1 U39 ( .A(count_enable), .B(n25), .Y(n32) );
  NAND2X1 U40 ( .A(count_out[3]), .B(n34), .Y(n30) );
  NAND2X1 U41 ( .A(count_enable), .B(n30), .Y(n29) );
  NOR2X1 U42 ( .A(n6), .B(n26), .Y(n28) );
  MUX2X1 U43 ( .B(n30), .A(n29), .S(n28), .Y(n31) );
  OAI21X1 U44 ( .A(n32), .B(n31), .C(n40), .Y(n43) );
  INVX2 U45 ( .A(n43), .Y(next_count_out[3]) );
  AOI21X1 U46 ( .A(n5), .B(n2), .C(n33), .Y(n39) );
  INVX2 U47 ( .A(count_out[1]), .Y(n38) );
  NAND3X1 U48 ( .A(count_enable), .B(n4), .C(n38), .Y(n37) );
  OAI21X1 U49 ( .A(n39), .B(n38), .C(n37), .Y(n41) );
  NAND2X1 U50 ( .A(n41), .B(n40), .Y(n46) );
  INVX2 U51 ( .A(n46), .Y(next_count_out[1]) );
  XOR2X1 U52 ( .A(n42), .B(rollover_val[0]), .Y(n45) );
  XOR2X1 U53 ( .A(n43), .B(n3), .Y(n44) );
  NAND2X1 U54 ( .A(n45), .B(n44), .Y(n51) );
  XOR2X1 U55 ( .A(n46), .B(rollover_val[1]), .Y(n49) );
  XOR2X1 U56 ( .A(n47), .B(rollover_val[2]), .Y(n48) );
  NAND2X1 U57 ( .A(n49), .B(n48), .Y(n50) );
  NOR2X1 U58 ( .A(n51), .B(n50), .Y(N11) );
endmodule


module timer ( data_size, bit_period, clk, n_rst, enable_timer, shift_enable, 
        packet_done );
  input [3:0] data_size;
  input [13:0] bit_period;
  input clk, n_rst, enable_timer;
  output shift_enable, packet_done;
  wire   \_2_net_[3] , \_2_net_[2] , \_2_net_[1] , n1, n2, n3, n4, n5, n6, n7,
         n8, n9, n10, n11, n12, n13, n14, n15, n16, n17, n18, n19, n20, n21,
         n22, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32, n33, n34, n35,
         n36, n37, n38, n39, n40;
  wire   [13:0] bit_period_default;
  assign bit_period_default[13] = bit_period[13];
  assign bit_period_default[12] = bit_period[12];
  assign bit_period_default[11] = bit_period[11];
  assign bit_period_default[10] = bit_period[10];
  assign bit_period_default[9] = bit_period[9];
  assign bit_period_default[8] = bit_period[8];
  assign bit_period_default[7] = bit_period[7];
  assign bit_period_default[6] = bit_period[6];
  assign bit_period_default[5] = bit_period[5];
  assign bit_period_default[4] = bit_period[4];
  assign bit_period_default[2] = bit_period[2];
  assign bit_period_default[0] = bit_period[0];

  flex_counter_NUM_CNT_BITS14 CLOCK ( .clk(clk), .n_rst(n22), .clear(n39), 
        .count_enable(enable_timer), .rollover_val({bit_period_default[13], n2, 
        n9, n7, bit_period_default[9], n18, bit_period_default[7], n19, n16, 
        n21, bit_period_default[3], n15, bit_period_default[1], n5}), 
        .rollover_flag(shift_enable) );
  flex_counter_NUM_CNT_BITS4 BIT ( .clk(clk), .n_rst(n22), .clear(n39), 
        .count_enable(shift_enable), .rollover_val({\_2_net_[3] , \_2_net_[2] , 
        \_2_net_[1] , n40}), .rollover_flag(packet_done) );
  INVX2 U3 ( .A(bit_period_default[12]), .Y(n1) );
  INVX4 U4 ( .A(n1), .Y(n2) );
  BUFX2 U5 ( .A(bit_period_default[6]), .Y(n19) );
  INVX2 U6 ( .A(n8), .Y(n9) );
  BUFX2 U7 ( .A(data_size[1]), .Y(n3) );
  BUFX4 U8 ( .A(data_size[0]), .Y(n4) );
  BUFX2 U9 ( .A(bit_period_default[0]), .Y(n5) );
  BUFX2 U10 ( .A(bit_period_default[0]), .Y(n20) );
  INVX1 U11 ( .A(bit_period_default[11]), .Y(n8) );
  BUFX2 U12 ( .A(bit_period_default[8]), .Y(n18) );
  INVX2 U13 ( .A(bit_period_default[10]), .Y(n6) );
  INVX4 U14 ( .A(n6), .Y(n7) );
  NAND3X1 U15 ( .A(n10), .B(n11), .C(n12), .Y(n13) );
  INVX1 U16 ( .A(bit_period_default[4]), .Y(n10) );
  INVX1 U17 ( .A(bit_period_default[5]), .Y(n11) );
  INVX1 U18 ( .A(bit_period_default[6]), .Y(n12) );
  INVX2 U19 ( .A(n13), .Y(n33) );
  INVX2 U20 ( .A(bit_period_default[2]), .Y(n14) );
  INVX4 U21 ( .A(n14), .Y(n15) );
  BUFX4 U22 ( .A(bit_period_default[5]), .Y(n16) );
  NAND2X1 U23 ( .A(n3), .B(n17), .Y(n29) );
  AND2X1 U24 ( .A(n4), .B(data_size[2]), .Y(n17) );
  INVX2 U25 ( .A(n23), .Y(n22) );
  INVX2 U26 ( .A(n_rst), .Y(n23) );
  BUFX2 U27 ( .A(bit_period_default[4]), .Y(n21) );
  INVX1 U28 ( .A(bit_period_default[7]), .Y(n31) );
  INVX2 U29 ( .A(n4), .Y(n40) );
  XOR2X1 U30 ( .A(n3), .B(n4), .Y(\_2_net_[1] ) );
  NAND2X1 U31 ( .A(data_size[1]), .B(n4), .Y(n24) );
  INVX2 U32 ( .A(n24), .Y(n25) );
  XOR2X1 U33 ( .A(n25), .B(data_size[2]), .Y(\_2_net_[2] ) );
  NOR2X1 U34 ( .A(data_size[2]), .B(n4), .Y(n27) );
  INVX2 U35 ( .A(data_size[1]), .Y(n26) );
  AOI21X1 U36 ( .A(n27), .B(n26), .C(data_size[3]), .Y(n28) );
  XOR2X1 U37 ( .A(n29), .B(n28), .Y(\_2_net_[3] ) );
  INVX2 U38 ( .A(enable_timer), .Y(n39) );
  NOR3X1 U39 ( .A(bit_period_default[8]), .B(bit_period_default[10]), .C(
        bit_period_default[9]), .Y(n32) );
  NOR3X1 U40 ( .A(bit_period_default[11]), .B(bit_period_default[12]), .C(
        bit_period_default[13]), .Y(n30) );
  NAND3X1 U41 ( .A(n31), .B(n32), .C(n30), .Y(n38) );
  NOR3X1 U42 ( .A(bit_period[1]), .B(bit_period_default[2]), .C(n20), .Y(n34)
         );
  INVX2 U43 ( .A(bit_period[3]), .Y(n36) );
  NAND3X1 U44 ( .A(n36), .B(n33), .C(n34), .Y(n37) );
  INVX2 U45 ( .A(bit_period[1]), .Y(n35) );
  OAI21X1 U46 ( .A(n37), .B(n38), .C(n35), .Y(bit_period_default[1]) );
  OAI21X1 U47 ( .A(n37), .B(n38), .C(n36), .Y(bit_period_default[3]) );
endmodule


module flex_stp_sr_NUM_BITS9_SHIFT_MSB0 ( clk, n_rst, shift_enable, serial_in, 
        parallel_out );
  output [8:0] parallel_out;
  input clk, n_rst, shift_enable, serial_in;
  wire   n3, n11, n13, n15, n17, n19, n21, n23, n25, n27, n29, n1, n2, n4, n5,
         n6, n7, n8, n9, n10, n30;

  DFFSR \parallel_out_reg[8]  ( .D(n29), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel_out[8]) );
  DFFSR \parallel_out_reg[7]  ( .D(n27), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel_out[7]) );
  DFFSR \parallel_out_reg[6]  ( .D(n25), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel_out[6]) );
  DFFSR \parallel_out_reg[5]  ( .D(n23), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel_out[5]) );
  DFFSR \parallel_out_reg[4]  ( .D(n21), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel_out[4]) );
  DFFSR \parallel_out_reg[3]  ( .D(n19), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel_out[3]) );
  DFFSR \parallel_out_reg[2]  ( .D(n17), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel_out[2]) );
  DFFSR \parallel_out_reg[1]  ( .D(n15), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel_out[1]) );
  DFFSR \parallel_out_reg[0]  ( .D(n13), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel_out[0]) );
  OAI21X1 U2 ( .A(n30), .B(n1), .C(n3), .Y(n13) );
  NAND2X1 U3 ( .A(parallel_out[0]), .B(n1), .Y(n3) );
  OAI22X1 U4 ( .A(n1), .B(n10), .C(n2), .D(n30), .Y(n15) );
  OAI22X1 U6 ( .A(n1), .B(n9), .C(n2), .D(n10), .Y(n17) );
  OAI22X1 U8 ( .A(n1), .B(n8), .C(n2), .D(n9), .Y(n19) );
  OAI22X1 U10 ( .A(n1), .B(n7), .C(n2), .D(n8), .Y(n21) );
  OAI22X1 U12 ( .A(n1), .B(n6), .C(n2), .D(n7), .Y(n23) );
  OAI22X1 U14 ( .A(n1), .B(n5), .C(n2), .D(n6), .Y(n25) );
  OAI22X1 U16 ( .A(n1), .B(n4), .C(n2), .D(n5), .Y(n27) );
  OAI21X1 U19 ( .A(n2), .B(n4), .C(n11), .Y(n29) );
  NAND2X1 U20 ( .A(serial_in), .B(n2), .Y(n11) );
  INVX2 U5 ( .A(n1), .Y(n2) );
  INVX2 U7 ( .A(shift_enable), .Y(n1) );
  INVX2 U9 ( .A(parallel_out[8]), .Y(n4) );
  INVX2 U11 ( .A(parallel_out[7]), .Y(n5) );
  INVX2 U13 ( .A(parallel_out[6]), .Y(n6) );
  INVX2 U15 ( .A(parallel_out[5]), .Y(n7) );
  INVX2 U17 ( .A(parallel_out[4]), .Y(n8) );
  INVX2 U18 ( .A(parallel_out[3]), .Y(n9) );
  INVX2 U21 ( .A(parallel_out[2]), .Y(n10) );
  INVX2 U31 ( .A(parallel_out[1]), .Y(n30) );
endmodule


module sr_bit ( clk, n_rst, shift_strobe, serial_in, packet_data, stop_bit );
  output [7:0] packet_data;
  input clk, n_rst, shift_strobe, serial_in;
  output stop_bit;


  flex_stp_sr_NUM_BITS9_SHIFT_MSB0 SHIFT ( .clk(clk), .n_rst(n_rst), 
        .shift_enable(shift_strobe), .serial_in(serial_in), .parallel_out({
        stop_bit, packet_data}) );
endmodule


module rx_data_buff ( clk, n_rst, load_buffer, packet_data, data_read, rx_data, 
        data_ready, overrun_error );
  input [7:0] packet_data;
  output [7:0] rx_data;
  input clk, n_rst, load_buffer, data_read;
  output data_ready, overrun_error;
  wire   n1, n3, n4, n5, n6, n7, n8, n9, n10, n30, n31, n2, n11, n15, n17, n19,
         n21, n23, n25, n27, n29, n32, n33, n34;

  DFFSR \rx_data_reg[7]  ( .D(n21), .CLK(clk), .R(1'b1), .S(n15), .Q(
        rx_data[7]) );
  DFFSR \rx_data_reg[6]  ( .D(n19), .CLK(clk), .R(1'b1), .S(n15), .Q(
        rx_data[6]) );
  DFFSR \rx_data_reg[5]  ( .D(n25), .CLK(clk), .R(1'b1), .S(n15), .Q(
        rx_data[5]) );
  DFFSR \rx_data_reg[4]  ( .D(n23), .CLK(clk), .R(1'b1), .S(n15), .Q(
        rx_data[4]) );
  DFFSR \rx_data_reg[3]  ( .D(n27), .CLK(clk), .R(1'b1), .S(n15), .Q(
        rx_data[3]) );
  DFFSR \rx_data_reg[2]  ( .D(n29), .CLK(clk), .R(1'b1), .S(n15), .Q(
        rx_data[2]) );
  DFFSR \rx_data_reg[1]  ( .D(n32), .CLK(clk), .R(1'b1), .S(n15), .Q(
        rx_data[1]) );
  DFFSR \rx_data_reg[0]  ( .D(n33), .CLK(clk), .R(1'b1), .S(n15), .Q(
        rx_data[0]) );
  DFFSR data_ready_reg ( .D(n31), .CLK(clk), .R(n15), .S(1'b1), .Q(data_ready)
         );
  DFFSR overrun_error_reg ( .D(n30), .CLK(clk), .R(n15), .S(1'b1), .Q(
        overrun_error) );
  AOI22X1 U4 ( .A(rx_data[0]), .B(n2), .C(packet_data[0]), .D(n11), .Y(n1) );
  AOI22X1 U6 ( .A(rx_data[1]), .B(n2), .C(packet_data[1]), .D(n11), .Y(n3) );
  AOI22X1 U8 ( .A(rx_data[2]), .B(n2), .C(packet_data[2]), .D(n11), .Y(n4) );
  AOI22X1 U10 ( .A(rx_data[3]), .B(n2), .C(packet_data[3]), .D(n11), .Y(n5) );
  AOI22X1 U12 ( .A(rx_data[4]), .B(n2), .C(packet_data[4]), .D(n11), .Y(n6) );
  AOI22X1 U14 ( .A(rx_data[5]), .B(n2), .C(packet_data[5]), .D(n11), .Y(n7) );
  AOI22X1 U16 ( .A(rx_data[6]), .B(n2), .C(packet_data[6]), .D(n11), .Y(n8) );
  AOI22X1 U18 ( .A(rx_data[7]), .B(n2), .C(packet_data[7]), .D(n11), .Y(n9) );
  NOR2X1 U19 ( .A(data_read), .B(n10), .Y(n30) );
  AOI21X1 U20 ( .A(data_ready), .B(n11), .C(overrun_error), .Y(n10) );
  OAI21X1 U21 ( .A(data_read), .B(n34), .C(n2), .Y(n31) );
  INVX2 U3 ( .A(load_buffer), .Y(n2) );
  INVX2 U5 ( .A(n2), .Y(n11) );
  INVX2 U7 ( .A(n17), .Y(n15) );
  INVX2 U9 ( .A(n_rst), .Y(n17) );
  INVX2 U11 ( .A(n8), .Y(n19) );
  INVX2 U13 ( .A(n9), .Y(n21) );
  INVX2 U15 ( .A(n6), .Y(n23) );
  INVX2 U17 ( .A(n7), .Y(n25) );
  INVX2 U22 ( .A(n5), .Y(n27) );
  INVX2 U23 ( .A(n4), .Y(n29) );
  INVX2 U34 ( .A(n3), .Y(n32) );
  INVX2 U35 ( .A(n1), .Y(n33) );
  INVX2 U36 ( .A(data_ready), .Y(n34) );
endmodule


module rcv_block ( clk, n_rst, serial_in, data_read, bit_period, data_size, 
        rx_data, data_ready, overrun_error, framing_error );
  input [13:0] bit_period;
  input [3:0] data_size;
  output [7:0] rx_data;
  input clk, n_rst, serial_in, data_read;
  output data_ready, overrun_error, framing_error;
  wire   new_packet_detected, packet_done, sbc_clear, sbc_enable, load_buffer,
         enable_timer, stop_bit, shift_enable, n12, n13, n14, n15, n16, n17,
         n18, n19, n20, n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11;
  wire   [7:0] processed_packet_data;
  wire   [7:0] packet_data;

  NOR2X1 U13 ( .A(n12), .B(n1), .Y(processed_packet_data[7]) );
  OAI22X1 U14 ( .A(n1), .B(n13), .C(n12), .D(n2), .Y(processed_packet_data[6])
         );
  OAI22X1 U15 ( .A(n2), .B(n13), .C(n12), .D(n3), .Y(processed_packet_data[5])
         );
  OAI21X1 U16 ( .A(n13), .B(n3), .C(n14), .Y(processed_packet_data[4]) );
  AOI22X1 U17 ( .A(packet_data[4]), .B(n8), .C(n15), .D(packet_data[7]), .Y(
        n14) );
  OAI21X1 U18 ( .A(n13), .B(n4), .C(n16), .Y(processed_packet_data[3]) );
  AOI22X1 U19 ( .A(packet_data[3]), .B(n8), .C(n15), .D(packet_data[6]), .Y(
        n16) );
  OAI21X1 U20 ( .A(n13), .B(n5), .C(n17), .Y(processed_packet_data[2]) );
  AOI22X1 U21 ( .A(packet_data[2]), .B(n8), .C(n15), .D(packet_data[5]), .Y(
        n17) );
  OAI21X1 U22 ( .A(n13), .B(n6), .C(n18), .Y(processed_packet_data[1]) );
  AOI22X1 U23 ( .A(packet_data[1]), .B(n8), .C(n15), .D(packet_data[4]), .Y(
        n18) );
  OAI21X1 U24 ( .A(n13), .B(n7), .C(n19), .Y(processed_packet_data[0]) );
  AOI22X1 U25 ( .A(packet_data[0]), .B(n8), .C(packet_data[3]), .D(n15), .Y(
        n19) );
  NAND2X1 U26 ( .A(n10), .B(n13), .Y(n12) );
  NOR2X1 U27 ( .A(n20), .B(data_size[1]), .Y(n15) );
  NAND2X1 U28 ( .A(data_size[1]), .B(n9), .Y(n13) );
  NAND3X1 U29 ( .A(data_size[0]), .B(n11), .C(data_size[2]), .Y(n20) );
  start_bit_det START ( .clk(clk), .n_rst(n_rst), .serial_in(serial_in), 
        .new_package_detected(new_packet_detected) );
  rcu R ( .clk(clk), .n_rst(n_rst), .new_packet_detected(new_packet_detected), 
        .packet_done(packet_done), .framing_error(framing_error), .sbc_clear(
        sbc_clear), .sbc_enable(sbc_enable), .load_buffer(load_buffer), 
        .enable_timer(enable_timer) );
  stop_bit_chk STOP ( .clk(clk), .n_rst(n_rst), .sbc_clear(sbc_clear), 
        .sbc_enable(sbc_enable), .stop_bit(stop_bit), .framing_error(
        framing_error) );
  timer TIMER ( .data_size(data_size), .bit_period(bit_period), .clk(clk), 
        .n_rst(n_rst), .enable_timer(enable_timer), .shift_enable(shift_enable), .packet_done(packet_done) );
  sr_bit SR ( .clk(clk), .n_rst(n_rst), .shift_strobe(shift_enable), 
        .serial_in(serial_in), .packet_data(packet_data), .stop_bit(stop_bit)
         );
  rx_data_buff RX ( .clk(clk), .n_rst(n_rst), .load_buffer(load_buffer), 
        .packet_data(processed_packet_data), .data_read(data_read), .rx_data(
        rx_data), .data_ready(data_ready), .overrun_error(overrun_error) );
  INVX2 U2 ( .A(packet_data[7]), .Y(n1) );
  INVX2 U3 ( .A(packet_data[6]), .Y(n2) );
  INVX2 U4 ( .A(packet_data[5]), .Y(n3) );
  INVX2 U5 ( .A(packet_data[4]), .Y(n4) );
  INVX2 U6 ( .A(packet_data[3]), .Y(n5) );
  INVX2 U7 ( .A(packet_data[2]), .Y(n6) );
  INVX2 U8 ( .A(packet_data[1]), .Y(n7) );
  INVX2 U9 ( .A(n12), .Y(n8) );
  INVX2 U10 ( .A(n20), .Y(n9) );
  INVX2 U11 ( .A(n15), .Y(n10) );
  INVX2 U12 ( .A(data_size[3]), .Y(n11) );
endmodule


module apb_uart_rx ( clk, n_rst, serial_in, psel, penable, pwrite, paddr, 
        pwdata, prdata, pslverr );
  input [2:0] paddr;
  input [7:0] pwdata;
  output [7:0] prdata;
  input clk, n_rst, serial_in, psel, penable, pwrite;
  output pslverr;
  wire   data_ready, overrun_error, framing_error, data_read;
  wire   [7:0] rx_data;
  wire   [3:0] data_size;
  wire   [13:0] bit_period;

  apb_slave SLAVE ( .clk(clk), .n_rst(n_rst), .data_ready(data_ready), 
        .overrun_error(overrun_error), .framing_error(framing_error), 
        .rx_data(rx_data), .data_read(data_read), .psel(psel), .penable(
        penable), .pwrite(pwrite), .paddr(paddr), .pwdata(pwdata), .prdata(
        prdata), .pslverr(pslverr), .data_size(data_size), .bit_period(
        bit_period) );
  rcv_block UART ( .clk(clk), .n_rst(n_rst), .serial_in(serial_in), 
        .data_read(data_read), .bit_period(bit_period), .data_size(data_size), 
        .rx_data(rx_data), .data_ready(data_ready), .overrun_error(
        overrun_error), .framing_error(framing_error) );
endmodule

