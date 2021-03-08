/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : K-2015.06-SP1
// Date      : Fri May  1 18:19:03 2020
/////////////////////////////////////////////////////////////


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
         n89, n90, n91, n92, n93, n94, n95, n96, n97, n98, n99, n100, n101,
         n102, n103, n104, n105, n106, n107, n108, n109, n110, n111, n112,
         n113, n114, n115, n116, n117, n118, n119, n120, n121, n122, n123,
         n124, n125, n126, n127, n128, n129, n130, n131, n132, n133, n134,
         n135, n136, n137, n138, n139, n140, n141, n142, n143, n144, n145,
         n146, n147, n148, n149, n150, n151, n152, net2477, net2495, net2496,
         net2497, net2498, net2505, net2506, net2508, net2518, net2525,
         net2526, net2528, net2538, net2548, net2561, net2622, net2631,
         \C46/net2652 , \C46/net2653 , \C46/net2475 , \C46/net2473 ,
         \C46/net2471 , \C46/net2467 , \C46/net2461 , \C46/net2426 ,
         \C46/net2424 , \C46/net2423 , net2924, net2938, net2982, net2985,
         net2992, net2996, net2999, net3004, net2621, net2559, N24,
         \C46/net2422 , \C46/net2420 , \C46/net2474 , \C46/net2472 , n1, n2,
         n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16, n17,
         n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30, n31,
         n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44, n45,
         n46, n47, n48, n49, n50, n51, n52, n53, n54, n55, n56, n57, n58, n59,
         n60, n61, n62, n63, n64, n65, n66, n67, n68, n69, n70, n71, n72, n73,
         n74, n75, n76, n77, n78, n79, n80, n81, n82, n83, n84, n85, n86, n87,
         n88, n153, n154, n155, n156, n157, n158, n159, n160, n161, n162, n163,
         n164, n165, n166, n167, n168, n169, n170, n171, n172, n173, n174,
         n175, n176, n177, n178, n179, n180, n181, n182, n183, n184, n185,
         n186, n187, n188, n189, n190, n191, n192, n193, n194, n195, n196,
         n197, n198, n199, n200, n201, n202, n203, n204, n205, n206, n207,
         n208, n209, n210, n211, n212, n213, n214, n215, n216, n217, n218,
         n219, n220, n221, n222, n223, n224, n225, n226, n227, n228, n229,
         n230, n231, n232, n233, n234, n235, n236, n237, n238, n239, n240,
         n241, n242, n243, n244, n245, n246, n247, n248, n249, n250, n251,
         n252, n253, n254, n255, n256, n257, n258, n259, n260, n261, n262,
         n263, n264, n265, n266, n267, n268, n269, n270, n271, n272, n273;
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
  INVX4 U2 ( .A(n1), .Y(\C46/net2652 ) );
  INVX4 U3 ( .A(n2), .Y(\C46/net2653 ) );
  INVX2 U4 ( .A(n258), .Y(n273) );
  INVX2 U5 ( .A(net2985), .Y(net2495) );
  NAND2X1 U6 ( .A(N14), .B(n4), .Y(n1) );
  NAND2X1 U7 ( .A(N14), .B(\C46/net2475 ), .Y(n2) );
  NOR2X1 U8 ( .A(N14), .B(N15), .Y(n3) );
  INVX2 U9 ( .A(n3), .Y(\C46/net2474 ) );
  INVX8 U10 ( .A(\C46/net2474 ), .Y(\C46/net2426 ) );
  INVX1 U11 ( .A(N15), .Y(\C46/net2475 ) );
  INVX1 U12 ( .A(N15), .Y(n4) );
  INVX1 U13 ( .A(N15), .Y(net2982) );
  MUX2X1 U14 ( .B(n201), .A(n270), .S(n258), .Y(n147) );
  MUX2X1 U15 ( .B(n202), .A(n248), .S(n242), .Y(n131) );
  MUX2X1 U16 ( .B(n10), .A(n239), .S(n235), .Y(n123) );
  MUX2X1 U17 ( .B(n200), .A(n223), .S(n217), .Y(n107) );
  INVX2 U18 ( .A(N14), .Y(\C46/net2472 ) );
  NAND2X1 U19 ( .A(\C46/net2472 ), .B(N15), .Y(\C46/net2471 ) );
  AOI22X1 U20 ( .A(\C46/net2652 ), .B(\fiforeg[3][0] ), .C(\fiforeg[1][0] ), 
        .D(\C46/net2426 ), .Y(n5) );
  AND2X2 U21 ( .A(n5), .B(\C46/net2422 ), .Y(\C46/net2420 ) );
  AOI22X1 U22 ( .A(\fiforeg[3][7] ), .B(\C46/net2652 ), .C(\fiforeg[1][7] ), 
        .D(\C46/net2426 ), .Y(\C46/net2467 ) );
  AOI22X1 U23 ( .A(\fiforeg[3][6] ), .B(\C46/net2653 ), .C(\fiforeg[1][6] ), 
        .D(\C46/net2426 ), .Y(\C46/net2461 ) );
  AOI22X1 U24 ( .A(wdata[0]), .B(wenable), .C(N24), .D(net2561), .Y(n9) );
  MUX2X1 U25 ( .B(n6), .A(\C46/net2420 ), .S(net2631), .Y(N24) );
  AND2X2 U26 ( .A(n7), .B(n8), .Y(n6) );
  AOI22X1 U27 ( .A(\fiforeg[2][0] ), .B(\C46/net2653 ), .C(\fiforeg[0][0] ), 
        .D(\C46/net2426 ), .Y(n7) );
  AOI22X1 U28 ( .A(\fiforeg[6][0] ), .B(\C46/net2423 ), .C(\fiforeg[4][0] ), 
        .D(\C46/net2424 ), .Y(n8) );
  INVX4 U29 ( .A(\C46/net2473 ), .Y(\C46/net2423 ) );
  INVX4 U30 ( .A(\C46/net2471 ), .Y(\C46/net2424 ) );
  AOI22X1 U31 ( .A(\fiforeg[7][0] ), .B(\C46/net2423 ), .C(\fiforeg[5][0] ), 
        .D(net2992), .Y(\C46/net2422 ) );
  AND2X2 U32 ( .A(net2999), .B(net3004), .Y(net2992) );
  INVX2 U33 ( .A(net2497), .Y(net2631) );
  INVX2 U34 ( .A(wenable), .Y(net2561) );
  INVX4 U35 ( .A(n9), .Y(net2621) );
  MUX2X1 U36 ( .B(net2559), .A(net2622), .S(net2938), .Y(n89) );
  INVX2 U37 ( .A(\fiforeg[7][0] ), .Y(net2559) );
  INVX8 U38 ( .A(net2621), .Y(net2622) );
  AND2X2 U39 ( .A(net2924), .B(net2631), .Y(net2938) );
  INVX1 U40 ( .A(N14), .Y(net3004) );
  INVX1 U41 ( .A(net2982), .Y(net2999) );
  AND2X1 U42 ( .A(n156), .B(n157), .Y(n155) );
  INVX1 U43 ( .A(net3004), .Y(net2996) );
  INVX1 U44 ( .A(net2982), .Y(net2985) );
  BUFX2 U45 ( .A(n269), .Y(n10) );
  BUFX2 U46 ( .A(n271), .Y(n11) );
  BUFX2 U47 ( .A(n261), .Y(n12) );
  BUFX2 U48 ( .A(n263), .Y(n13) );
  BUFX2 U49 ( .A(n265), .Y(n14) );
  BUFX2 U50 ( .A(n267), .Y(n15) );
  BUFX2 U51 ( .A(n259), .Y(n16) );
  AND2X1 U52 ( .A(net2985), .B(net2996), .Y(net2924) );
  INVX2 U53 ( .A(n18), .Y(n75) );
  AND2X2 U54 ( .A(net2924), .B(net2497), .Y(n17) );
  OR2X1 U55 ( .A(n72), .B(n71), .Y(n18) );
  INVX2 U56 ( .A(n20), .Y(n77) );
  INVX2 U57 ( .A(n19), .Y(n76) );
  INVX2 U58 ( .A(n21), .Y(n74) );
  OR2X1 U59 ( .A(N11), .B(N12), .Y(n19) );
  OR2X1 U60 ( .A(n71), .B(N12), .Y(n20) );
  OR2X1 U61 ( .A(n72), .B(N11), .Y(n21) );
  BUFX2 U62 ( .A(N10), .Y(n73) );
  AOI22X1 U63 ( .A(\fiforeg[4][0] ), .B(n74), .C(\fiforeg[6][0] ), .D(n75), 
        .Y(n23) );
  AOI22X1 U64 ( .A(\fiforeg[0][0] ), .B(n76), .C(\fiforeg[2][0] ), .D(n77), 
        .Y(n22) );
  AOI21X1 U65 ( .A(n23), .B(n22), .C(n73), .Y(n27) );
  AOI22X1 U66 ( .A(\fiforeg[5][0] ), .B(n74), .C(\fiforeg[7][0] ), .D(n75), 
        .Y(n25) );
  AOI22X1 U67 ( .A(\fiforeg[1][0] ), .B(n76), .C(\fiforeg[3][0] ), .D(n77), 
        .Y(n24) );
  AOI21X1 U68 ( .A(n25), .B(n24), .C(n70), .Y(n26) );
  OR2X1 U69 ( .A(n27), .B(n26), .Y(rdata[0]) );
  AOI22X1 U70 ( .A(\fiforeg[4][1] ), .B(n74), .C(\fiforeg[6][1] ), .D(n75), 
        .Y(n29) );
  AOI22X1 U71 ( .A(\fiforeg[0][1] ), .B(n76), .C(\fiforeg[2][1] ), .D(n77), 
        .Y(n28) );
  AOI21X1 U72 ( .A(n29), .B(n28), .C(n73), .Y(n33) );
  AOI22X1 U73 ( .A(\fiforeg[5][1] ), .B(n74), .C(\fiforeg[7][1] ), .D(n75), 
        .Y(n31) );
  AOI22X1 U74 ( .A(\fiforeg[1][1] ), .B(n76), .C(\fiforeg[3][1] ), .D(n77), 
        .Y(n30) );
  AOI21X1 U75 ( .A(n31), .B(n30), .C(n70), .Y(n32) );
  OR2X1 U76 ( .A(n33), .B(n32), .Y(rdata[1]) );
  AOI22X1 U77 ( .A(\fiforeg[4][2] ), .B(n74), .C(\fiforeg[6][2] ), .D(n75), 
        .Y(n35) );
  AOI22X1 U78 ( .A(\fiforeg[0][2] ), .B(n76), .C(\fiforeg[2][2] ), .D(n77), 
        .Y(n34) );
  AOI21X1 U79 ( .A(n35), .B(n34), .C(n73), .Y(n39) );
  AOI22X1 U80 ( .A(\fiforeg[5][2] ), .B(n74), .C(\fiforeg[7][2] ), .D(n75), 
        .Y(n37) );
  AOI22X1 U81 ( .A(\fiforeg[1][2] ), .B(n76), .C(\fiforeg[3][2] ), .D(n77), 
        .Y(n36) );
  AOI21X1 U82 ( .A(n37), .B(n36), .C(n70), .Y(n38) );
  OR2X1 U83 ( .A(n39), .B(n38), .Y(rdata[2]) );
  AOI22X1 U84 ( .A(\fiforeg[4][3] ), .B(n74), .C(\fiforeg[6][3] ), .D(n75), 
        .Y(n41) );
  AOI22X1 U85 ( .A(\fiforeg[0][3] ), .B(n76), .C(\fiforeg[2][3] ), .D(n77), 
        .Y(n40) );
  AOI21X1 U86 ( .A(n41), .B(n40), .C(n73), .Y(n45) );
  AOI22X1 U87 ( .A(\fiforeg[5][3] ), .B(n74), .C(\fiforeg[7][3] ), .D(n75), 
        .Y(n43) );
  AOI22X1 U88 ( .A(\fiforeg[1][3] ), .B(n76), .C(\fiforeg[3][3] ), .D(n77), 
        .Y(n42) );
  AOI21X1 U89 ( .A(n43), .B(n42), .C(n70), .Y(n44) );
  OR2X1 U90 ( .A(n45), .B(n44), .Y(rdata[3]) );
  AOI22X1 U91 ( .A(\fiforeg[4][4] ), .B(n74), .C(\fiforeg[6][4] ), .D(n75), 
        .Y(n47) );
  AOI22X1 U92 ( .A(\fiforeg[0][4] ), .B(n76), .C(\fiforeg[2][4] ), .D(n77), 
        .Y(n46) );
  AOI21X1 U93 ( .A(n47), .B(n46), .C(n73), .Y(n51) );
  AOI22X1 U94 ( .A(\fiforeg[5][4] ), .B(n74), .C(\fiforeg[7][4] ), .D(n75), 
        .Y(n49) );
  AOI22X1 U95 ( .A(\fiforeg[1][4] ), .B(n76), .C(\fiforeg[3][4] ), .D(n77), 
        .Y(n48) );
  AOI21X1 U96 ( .A(n49), .B(n48), .C(n70), .Y(n50) );
  OR2X1 U97 ( .A(n51), .B(n50), .Y(rdata[4]) );
  AOI22X1 U98 ( .A(\fiforeg[4][5] ), .B(n74), .C(\fiforeg[6][5] ), .D(n75), 
        .Y(n53) );
  AOI22X1 U99 ( .A(\fiforeg[0][5] ), .B(n76), .C(\fiforeg[2][5] ), .D(n77), 
        .Y(n52) );
  AOI21X1 U100 ( .A(n53), .B(n52), .C(n73), .Y(n57) );
  AOI22X1 U101 ( .A(\fiforeg[5][5] ), .B(n74), .C(\fiforeg[7][5] ), .D(n75), 
        .Y(n55) );
  AOI22X1 U102 ( .A(\fiforeg[1][5] ), .B(n76), .C(\fiforeg[3][5] ), .D(n77), 
        .Y(n54) );
  AOI21X1 U103 ( .A(n55), .B(n54), .C(n70), .Y(n56) );
  OR2X1 U104 ( .A(n57), .B(n56), .Y(rdata[5]) );
  AOI22X1 U105 ( .A(\fiforeg[4][6] ), .B(n74), .C(\fiforeg[6][6] ), .D(n75), 
        .Y(n59) );
  AOI22X1 U106 ( .A(\fiforeg[0][6] ), .B(n76), .C(\fiforeg[2][6] ), .D(n77), 
        .Y(n58) );
  AOI21X1 U107 ( .A(n59), .B(n58), .C(n73), .Y(n63) );
  AOI22X1 U108 ( .A(\fiforeg[5][6] ), .B(n74), .C(\fiforeg[7][6] ), .D(n75), 
        .Y(n61) );
  AOI22X1 U109 ( .A(\fiforeg[1][6] ), .B(n76), .C(\fiforeg[3][6] ), .D(n77), 
        .Y(n60) );
  AOI21X1 U110 ( .A(n61), .B(n60), .C(n70), .Y(n62) );
  OR2X1 U111 ( .A(n63), .B(n62), .Y(rdata[6]) );
  AOI22X1 U112 ( .A(\fiforeg[4][7] ), .B(n74), .C(\fiforeg[6][7] ), .D(n75), 
        .Y(n65) );
  AOI22X1 U113 ( .A(\fiforeg[0][7] ), .B(n76), .C(\fiforeg[2][7] ), .D(n77), 
        .Y(n64) );
  AOI21X1 U114 ( .A(n65), .B(n64), .C(n73), .Y(n69) );
  AOI22X1 U115 ( .A(\fiforeg[5][7] ), .B(n74), .C(\fiforeg[7][7] ), .D(n75), 
        .Y(n67) );
  AOI22X1 U116 ( .A(\fiforeg[1][7] ), .B(n76), .C(\fiforeg[3][7] ), .D(n77), 
        .Y(n66) );
  AOI21X1 U117 ( .A(n67), .B(n66), .C(n70), .Y(n68) );
  OR2X1 U118 ( .A(n69), .B(n68), .Y(rdata[7]) );
  INVX2 U119 ( .A(n73), .Y(n70) );
  INVX2 U120 ( .A(N11), .Y(n71) );
  INVX2 U121 ( .A(N12), .Y(n72) );
  MUX2X1 U122 ( .B(n78), .A(n79), .S(net2631), .Y(N23) );
  AND2X2 U123 ( .A(n80), .B(n81), .Y(n79) );
  AOI22X1 U124 ( .A(\fiforeg[7][1] ), .B(\C46/net2423 ), .C(\fiforeg[5][1] ), 
        .D(\C46/net2424 ), .Y(n81) );
  AOI22X1 U125 ( .A(\fiforeg[3][1] ), .B(\C46/net2652 ), .C(\C46/net2426 ), 
        .D(\fiforeg[1][1] ), .Y(n80) );
  AND2X2 U126 ( .A(n82), .B(n83), .Y(n78) );
  AOI22X1 U127 ( .A(\fiforeg[6][1] ), .B(\C46/net2423 ), .C(\fiforeg[4][1] ), 
        .D(\C46/net2424 ), .Y(n83) );
  AOI22X1 U128 ( .A(\fiforeg[2][1] ), .B(\C46/net2653 ), .C(\fiforeg[0][1] ), 
        .D(\C46/net2426 ), .Y(n82) );
  MUX2X1 U129 ( .B(n84), .A(n85), .S(net2631), .Y(N22) );
  AND2X2 U130 ( .A(n86), .B(n87), .Y(n85) );
  AOI22X1 U131 ( .A(\fiforeg[7][2] ), .B(\C46/net2423 ), .C(\fiforeg[5][2] ), 
        .D(\C46/net2424 ), .Y(n87) );
  AOI22X1 U132 ( .A(\C46/net2653 ), .B(\fiforeg[3][2] ), .C(\fiforeg[1][2] ), 
        .D(\C46/net2426 ), .Y(n86) );
  AND2X2 U133 ( .A(n88), .B(n153), .Y(n84) );
  AOI22X1 U134 ( .A(\fiforeg[6][2] ), .B(\C46/net2423 ), .C(\fiforeg[4][2] ), 
        .D(\C46/net2424 ), .Y(n153) );
  AOI22X1 U135 ( .A(\fiforeg[2][2] ), .B(\C46/net2652 ), .C(\fiforeg[0][2] ), 
        .D(\C46/net2426 ), .Y(n88) );
  MUX2X1 U136 ( .B(n154), .A(n155), .S(net2631), .Y(N21) );
  AOI22X1 U137 ( .A(\fiforeg[7][3] ), .B(\C46/net2423 ), .C(\C46/net2424 ), 
        .D(\fiforeg[5][3] ), .Y(n157) );
  AOI22X1 U138 ( .A(\C46/net2652 ), .B(\fiforeg[3][3] ), .C(\C46/net2426 ), 
        .D(\fiforeg[1][3] ), .Y(n156) );
  AND2X2 U139 ( .A(n158), .B(n159), .Y(n154) );
  AOI22X1 U140 ( .A(\fiforeg[6][3] ), .B(\C46/net2423 ), .C(\fiforeg[4][3] ), 
        .D(\C46/net2424 ), .Y(n159) );
  AOI22X1 U141 ( .A(\fiforeg[2][3] ), .B(\C46/net2653 ), .C(\fiforeg[0][3] ), 
        .D(\C46/net2426 ), .Y(n158) );
  MUX2X1 U142 ( .B(n160), .A(n161), .S(net2631), .Y(N20) );
  AND2X2 U143 ( .A(n162), .B(n163), .Y(n161) );
  AOI22X1 U144 ( .A(\fiforeg[7][4] ), .B(\C46/net2423 ), .C(\fiforeg[5][4] ), 
        .D(\C46/net2424 ), .Y(n163) );
  AOI22X1 U145 ( .A(\fiforeg[3][4] ), .B(\C46/net2653 ), .C(\C46/net2426 ), 
        .D(\fiforeg[1][4] ), .Y(n162) );
  AND2X2 U146 ( .A(n164), .B(n165), .Y(n160) );
  AOI22X1 U147 ( .A(\fiforeg[6][4] ), .B(\C46/net2423 ), .C(\fiforeg[4][4] ), 
        .D(\C46/net2424 ), .Y(n165) );
  AOI22X1 U148 ( .A(\fiforeg[2][4] ), .B(\C46/net2652 ), .C(\fiforeg[0][4] ), 
        .D(\C46/net2426 ), .Y(n164) );
  MUX2X1 U149 ( .B(n166), .A(n167), .S(net2631), .Y(N19) );
  AND2X2 U150 ( .A(n168), .B(n169), .Y(n167) );
  AOI22X1 U151 ( .A(\fiforeg[7][5] ), .B(\C46/net2423 ), .C(\fiforeg[5][5] ), 
        .D(\C46/net2424 ), .Y(n169) );
  AOI22X1 U152 ( .A(\fiforeg[3][5] ), .B(\C46/net2652 ), .C(\C46/net2426 ), 
        .D(\fiforeg[1][5] ), .Y(n168) );
  AND2X2 U153 ( .A(n170), .B(n171), .Y(n166) );
  AOI22X1 U154 ( .A(\fiforeg[6][5] ), .B(\C46/net2423 ), .C(\fiforeg[4][5] ), 
        .D(\C46/net2424 ), .Y(n171) );
  AOI22X1 U155 ( .A(\fiforeg[2][5] ), .B(\C46/net2653 ), .C(\fiforeg[0][5] ), 
        .D(\C46/net2426 ), .Y(n170) );
  MUX2X1 U156 ( .B(n172), .A(n173), .S(net2631), .Y(N18) );
  AND2X2 U157 ( .A(\C46/net2461 ), .B(n174), .Y(n173) );
  AOI22X1 U158 ( .A(\fiforeg[7][6] ), .B(\C46/net2423 ), .C(\fiforeg[5][6] ), 
        .D(net2992), .Y(n174) );
  AND2X2 U159 ( .A(n175), .B(n176), .Y(n172) );
  AOI22X1 U160 ( .A(\fiforeg[6][6] ), .B(\C46/net2423 ), .C(\fiforeg[4][6] ), 
        .D(\C46/net2424 ), .Y(n176) );
  AOI22X1 U161 ( .A(\fiforeg[2][6] ), .B(\C46/net2652 ), .C(\fiforeg[0][6] ), 
        .D(\C46/net2426 ), .Y(n175) );
  MUX2X1 U162 ( .B(n177), .A(n178), .S(net2631), .Y(N17) );
  AND2X2 U163 ( .A(\C46/net2467 ), .B(n179), .Y(n178) );
  AOI22X1 U164 ( .A(\fiforeg[7][7] ), .B(\C46/net2423 ), .C(\fiforeg[5][7] ), 
        .D(net2992), .Y(n179) );
  AND2X2 U165 ( .A(n180), .B(n181), .Y(n177) );
  AOI22X1 U166 ( .A(\fiforeg[6][7] ), .B(\C46/net2423 ), .C(\fiforeg[4][7] ), 
        .D(\C46/net2424 ), .Y(n181) );
  NAND2X1 U167 ( .A(N15), .B(N14), .Y(\C46/net2473 ) );
  AOI22X1 U168 ( .A(\fiforeg[2][7] ), .B(\C46/net2653 ), .C(\fiforeg[0][7] ), 
        .D(\C46/net2426 ), .Y(n180) );
  BUFX2 U169 ( .A(n263), .Y(n182) );
  BUFX2 U170 ( .A(n263), .Y(n183) );
  BUFX2 U171 ( .A(n263), .Y(n184) );
  BUFX2 U172 ( .A(n271), .Y(n185) );
  BUFX2 U173 ( .A(n271), .Y(n186) );
  BUFX2 U174 ( .A(n271), .Y(n187) );
  BUFX2 U175 ( .A(n259), .Y(n188) );
  BUFX2 U176 ( .A(n259), .Y(n189) );
  BUFX2 U177 ( .A(n259), .Y(n190) );
  BUFX2 U178 ( .A(n261), .Y(n191) );
  BUFX2 U179 ( .A(n261), .Y(n192) );
  BUFX2 U180 ( .A(n261), .Y(n193) );
  BUFX2 U181 ( .A(n265), .Y(n194) );
  BUFX2 U182 ( .A(n265), .Y(n195) );
  BUFX2 U183 ( .A(n265), .Y(n196) );
  BUFX2 U184 ( .A(n267), .Y(n197) );
  BUFX2 U185 ( .A(n267), .Y(n198) );
  BUFX2 U186 ( .A(n267), .Y(n199) );
  BUFX2 U187 ( .A(n269), .Y(n200) );
  BUFX2 U188 ( .A(n269), .Y(n201) );
  BUFX2 U189 ( .A(n269), .Y(n202) );
  INVX2 U190 ( .A(\fiforeg[7][7] ), .Y(n203) );
  AOI22X1 U191 ( .A(wdata[7]), .B(wenable), .C(N17), .D(net2561), .Y(n259) );
  MUX2X1 U192 ( .B(n203), .A(n188), .S(net2938), .Y(n96) );
  INVX2 U193 ( .A(\fiforeg[7][6] ), .Y(n204) );
  AOI22X1 U194 ( .A(wdata[6]), .B(wenable), .C(N18), .D(net2561), .Y(n261) );
  MUX2X1 U195 ( .B(n204), .A(n191), .S(net2938), .Y(n95) );
  INVX2 U196 ( .A(\fiforeg[7][5] ), .Y(n205) );
  AOI22X1 U197 ( .A(wdata[5]), .B(wenable), .C(N19), .D(net2561), .Y(n263) );
  MUX2X1 U198 ( .B(n205), .A(n182), .S(net2938), .Y(n94) );
  INVX2 U199 ( .A(\fiforeg[7][4] ), .Y(n206) );
  AOI22X1 U200 ( .A(wdata[4]), .B(wenable), .C(N20), .D(net2561), .Y(n265) );
  MUX2X1 U201 ( .B(n206), .A(n194), .S(net2938), .Y(n93) );
  INVX2 U202 ( .A(\fiforeg[7][3] ), .Y(n207) );
  AOI22X1 U203 ( .A(wdata[3]), .B(wenable), .C(N21), .D(net2561), .Y(n267) );
  MUX2X1 U204 ( .B(n207), .A(n197), .S(net2938), .Y(n92) );
  INVX2 U205 ( .A(\fiforeg[7][2] ), .Y(n208) );
  AOI22X1 U206 ( .A(wdata[2]), .B(wenable), .C(N22), .D(net2561), .Y(n269) );
  MUX2X1 U207 ( .B(n208), .A(n10), .S(net2938), .Y(n91) );
  INVX2 U208 ( .A(\fiforeg[7][1] ), .Y(n209) );
  AOI22X1 U209 ( .A(wdata[1]), .B(wenable), .C(N23), .D(net2561), .Y(n271) );
  MUX2X1 U210 ( .B(n209), .A(n11), .S(net2938), .Y(n90) );
  INVX2 U211 ( .A(\fiforeg[6][7] ), .Y(n210) );
  INVX2 U212 ( .A(N13), .Y(net2497) );
  MUX2X1 U213 ( .B(n210), .A(n189), .S(n17), .Y(n104) );
  INVX2 U214 ( .A(\fiforeg[6][6] ), .Y(n211) );
  MUX2X1 U215 ( .B(n211), .A(n192), .S(n17), .Y(n103) );
  INVX2 U216 ( .A(\fiforeg[6][5] ), .Y(n212) );
  MUX2X1 U217 ( .B(n212), .A(n183), .S(n17), .Y(n102) );
  INVX2 U218 ( .A(\fiforeg[6][4] ), .Y(n213) );
  MUX2X1 U219 ( .B(n213), .A(n195), .S(n17), .Y(n101) );
  INVX2 U220 ( .A(\fiforeg[6][3] ), .Y(n214) );
  MUX2X1 U221 ( .B(n214), .A(n198), .S(n17), .Y(n100) );
  INVX2 U222 ( .A(\fiforeg[6][2] ), .Y(n215) );
  MUX2X1 U223 ( .B(n215), .A(n201), .S(n17), .Y(n99) );
  INVX2 U224 ( .A(\fiforeg[6][1] ), .Y(n216) );
  MUX2X1 U225 ( .B(n216), .A(n185), .S(n17), .Y(n98) );
  INVX2 U226 ( .A(\fiforeg[6][0] ), .Y(net2548) );
  MUX2X1 U227 ( .B(net2548), .A(net2622), .S(n17), .Y(n97) );
  INVX2 U228 ( .A(\fiforeg[5][7] ), .Y(n218) );
  INVX2 U229 ( .A(net2996), .Y(net2496) );
  NAND3X1 U230 ( .A(net2985), .B(N13), .C(net2496), .Y(n217) );
  INVX2 U231 ( .A(n217), .Y(n225) );
  MUX2X1 U232 ( .B(n218), .A(n190), .S(n225), .Y(n112) );
  INVX2 U233 ( .A(\fiforeg[5][6] ), .Y(n219) );
  MUX2X1 U234 ( .B(n219), .A(n193), .S(n225), .Y(n111) );
  INVX2 U235 ( .A(\fiforeg[5][5] ), .Y(n220) );
  MUX2X1 U236 ( .B(n220), .A(n184), .S(n225), .Y(n110) );
  INVX2 U237 ( .A(\fiforeg[5][4] ), .Y(n221) );
  MUX2X1 U238 ( .B(n221), .A(n196), .S(n225), .Y(n109) );
  INVX2 U239 ( .A(\fiforeg[5][3] ), .Y(n222) );
  MUX2X1 U240 ( .B(n222), .A(n199), .S(n225), .Y(n108) );
  INVX2 U241 ( .A(\fiforeg[5][2] ), .Y(n223) );
  INVX2 U242 ( .A(\fiforeg[5][1] ), .Y(n224) );
  MUX2X1 U243 ( .B(n224), .A(n186), .S(n225), .Y(n106) );
  INVX2 U244 ( .A(\fiforeg[5][0] ), .Y(net2538) );
  MUX2X1 U245 ( .B(net2538), .A(net2622), .S(n225), .Y(n105) );
  INVX2 U246 ( .A(\fiforeg[4][7] ), .Y(n227) );
  NAND3X1 U247 ( .A(net2985), .B(net2496), .C(net2497), .Y(n226) );
  INVX2 U248 ( .A(n226), .Y(n234) );
  MUX2X1 U249 ( .B(n227), .A(n188), .S(n234), .Y(n120) );
  INVX2 U250 ( .A(\fiforeg[4][6] ), .Y(n228) );
  MUX2X1 U251 ( .B(n228), .A(n191), .S(n234), .Y(n119) );
  INVX2 U252 ( .A(\fiforeg[4][5] ), .Y(n229) );
  MUX2X1 U253 ( .B(n229), .A(n182), .S(n234), .Y(n118) );
  INVX2 U254 ( .A(\fiforeg[4][4] ), .Y(n230) );
  MUX2X1 U255 ( .B(n230), .A(n194), .S(n234), .Y(n117) );
  INVX2 U256 ( .A(\fiforeg[4][3] ), .Y(n231) );
  MUX2X1 U257 ( .B(n231), .A(n197), .S(n234), .Y(n116) );
  INVX2 U258 ( .A(\fiforeg[4][2] ), .Y(n232) );
  MUX2X1 U259 ( .B(n232), .A(n200), .S(n234), .Y(n115) );
  INVX2 U260 ( .A(\fiforeg[4][1] ), .Y(n233) );
  MUX2X1 U261 ( .B(n233), .A(n186), .S(n234), .Y(n114) );
  INVX2 U262 ( .A(\fiforeg[4][0] ), .Y(net2528) );
  MUX2X1 U263 ( .B(net2528), .A(net2622), .S(n234), .Y(n113) );
  INVX2 U264 ( .A(\fiforeg[3][7] ), .Y(net2526) );
  NAND3X1 U265 ( .A(net2996), .B(net2631), .C(net2495), .Y(n235) );
  INVX2 U266 ( .A(n235), .Y(n241) );
  MUX2X1 U267 ( .B(net2526), .A(n16), .S(n241), .Y(n128) );
  INVX2 U268 ( .A(\fiforeg[3][6] ), .Y(net2525) );
  MUX2X1 U269 ( .B(net2525), .A(n12), .S(n241), .Y(n127) );
  INVX2 U270 ( .A(\fiforeg[3][5] ), .Y(n236) );
  MUX2X1 U271 ( .B(n236), .A(n13), .S(n241), .Y(n126) );
  INVX2 U272 ( .A(\fiforeg[3][4] ), .Y(n237) );
  MUX2X1 U273 ( .B(n237), .A(n14), .S(n241), .Y(n125) );
  INVX2 U274 ( .A(\fiforeg[3][3] ), .Y(n238) );
  MUX2X1 U275 ( .B(n238), .A(n15), .S(n241), .Y(n124) );
  INVX2 U276 ( .A(\fiforeg[3][2] ), .Y(n239) );
  INVX2 U277 ( .A(\fiforeg[3][1] ), .Y(n240) );
  MUX2X1 U278 ( .B(n240), .A(n187), .S(n241), .Y(n122) );
  INVX2 U279 ( .A(\fiforeg[3][0] ), .Y(net2518) );
  MUX2X1 U280 ( .B(net2518), .A(net2622), .S(n241), .Y(n121) );
  INVX2 U281 ( .A(\fiforeg[2][7] ), .Y(n243) );
  NAND3X1 U282 ( .A(net2996), .B(net2495), .C(net2497), .Y(n242) );
  INVX2 U283 ( .A(n242), .Y(n250) );
  MUX2X1 U284 ( .B(n243), .A(n189), .S(n250), .Y(n136) );
  INVX2 U285 ( .A(\fiforeg[2][6] ), .Y(n244) );
  MUX2X1 U286 ( .B(n244), .A(n192), .S(n250), .Y(n135) );
  INVX2 U287 ( .A(\fiforeg[2][5] ), .Y(n245) );
  MUX2X1 U288 ( .B(n245), .A(n183), .S(n250), .Y(n134) );
  INVX2 U289 ( .A(\fiforeg[2][4] ), .Y(n246) );
  MUX2X1 U290 ( .B(n246), .A(n195), .S(n250), .Y(n133) );
  INVX2 U291 ( .A(\fiforeg[2][3] ), .Y(n247) );
  MUX2X1 U292 ( .B(n247), .A(n198), .S(n250), .Y(n132) );
  INVX2 U293 ( .A(\fiforeg[2][2] ), .Y(n248) );
  INVX2 U294 ( .A(\fiforeg[2][1] ), .Y(n249) );
  MUX2X1 U295 ( .B(n249), .A(n187), .S(n250), .Y(n130) );
  INVX2 U296 ( .A(\fiforeg[2][0] ), .Y(net2508) );
  MUX2X1 U297 ( .B(net2508), .A(net2622), .S(n250), .Y(n129) );
  INVX2 U298 ( .A(\fiforeg[1][7] ), .Y(net2506) );
  NAND3X1 U299 ( .A(N13), .B(net2495), .C(net2496), .Y(n251) );
  INVX2 U300 ( .A(n251), .Y(n257) );
  MUX2X1 U301 ( .B(net2506), .A(n190), .S(n257), .Y(n144) );
  INVX2 U302 ( .A(\fiforeg[1][6] ), .Y(net2505) );
  MUX2X1 U303 ( .B(net2505), .A(n193), .S(n257), .Y(n143) );
  INVX2 U304 ( .A(\fiforeg[1][5] ), .Y(n252) );
  MUX2X1 U305 ( .B(n252), .A(n184), .S(n257), .Y(n142) );
  INVX2 U306 ( .A(\fiforeg[1][4] ), .Y(n253) );
  MUX2X1 U307 ( .B(n253), .A(n196), .S(n257), .Y(n141) );
  INVX2 U308 ( .A(\fiforeg[1][3] ), .Y(n254) );
  MUX2X1 U309 ( .B(n254), .A(n199), .S(n257), .Y(n140) );
  INVX2 U310 ( .A(\fiforeg[1][2] ), .Y(n255) );
  MUX2X1 U311 ( .B(n255), .A(n202), .S(n257), .Y(n139) );
  INVX2 U312 ( .A(\fiforeg[1][1] ), .Y(n256) );
  MUX2X1 U313 ( .B(n256), .A(n11), .S(n257), .Y(n138) );
  INVX2 U314 ( .A(\fiforeg[1][0] ), .Y(net2498) );
  MUX2X1 U315 ( .B(net2498), .A(net2622), .S(n257), .Y(n137) );
  INVX2 U316 ( .A(\fiforeg[0][7] ), .Y(n260) );
  NAND3X1 U317 ( .A(net2495), .B(net2496), .C(net2497), .Y(n258) );
  MUX2X1 U318 ( .B(n260), .A(n16), .S(n273), .Y(n152) );
  INVX2 U319 ( .A(\fiforeg[0][6] ), .Y(n262) );
  MUX2X1 U320 ( .B(n262), .A(n12), .S(n273), .Y(n151) );
  INVX2 U321 ( .A(\fiforeg[0][5] ), .Y(n264) );
  MUX2X1 U322 ( .B(n264), .A(n13), .S(n273), .Y(n150) );
  INVX2 U323 ( .A(\fiforeg[0][4] ), .Y(n266) );
  MUX2X1 U324 ( .B(n266), .A(n14), .S(n273), .Y(n149) );
  INVX2 U325 ( .A(\fiforeg[0][3] ), .Y(n268) );
  MUX2X1 U326 ( .B(n268), .A(n15), .S(n273), .Y(n148) );
  INVX2 U327 ( .A(\fiforeg[0][2] ), .Y(n270) );
  INVX2 U328 ( .A(\fiforeg[0][1] ), .Y(n272) );
  MUX2X1 U329 ( .B(n272), .A(n185), .S(n273), .Y(n146) );
  INVX2 U330 ( .A(\fiforeg[0][0] ), .Y(net2477) );
  MUX2X1 U331 ( .B(net2477), .A(net2622), .S(n273), .Y(n145) );
endmodule


module write_ptr ( wclk, rst_n, wenable, wptr, wptr_nxt );
  output [3:0] wptr;
  output [3:0] wptr_nxt;
  input wclk, rst_n, wenable;
  wire   n1, n10, n11, n12, n13, n16, n18, n19, n20, n21, n22, n23, n24, n25,
         n26, n27, n28, n29, n30;
  wire   [3:0] binary_r;

  DFFSR \binary_r_reg[0]  ( .D(n16), .CLK(wclk), .R(rst_n), .S(1'b1), .Q(
        binary_r[0]) );
  DFFSR \binary_r_reg[2]  ( .D(n18), .CLK(wclk), .R(rst_n), .S(1'b1), .Q(
        binary_r[2]) );
  DFFSR \gray_r_reg[2]  ( .D(wptr_nxt[2]), .CLK(wclk), .R(rst_n), .S(1'b1), 
        .Q(wptr[2]) );
  DFFSR \binary_r_reg[1]  ( .D(n11), .CLK(wclk), .R(rst_n), .S(1'b1), .Q(
        binary_r[1]) );
  DFFSR \gray_r_reg[0]  ( .D(wptr_nxt[0]), .CLK(wclk), .R(rst_n), .S(1'b1), 
        .Q(wptr[0]) );
  DFFSR \gray_r_reg[3]  ( .D(wptr_nxt[3]), .CLK(wclk), .R(rst_n), .S(1'b1), 
        .Q(wptr[3]) );
  DFFSR \binary_r_reg[3]  ( .D(wptr_nxt[3]), .CLK(wclk), .R(rst_n), .S(1'b1), 
        .Q(binary_r[3]) );
  DFFSR \gray_r_reg[1]  ( .D(wptr_nxt[1]), .CLK(wclk), .R(rst_n), .S(1'b1), 
        .Q(wptr[1]) );
  INVX1 U3 ( .A(wenable), .Y(n22) );
  AND2X2 U4 ( .A(wenable), .B(n10), .Y(n1) );
  AND2X2 U13 ( .A(binary_r[1]), .B(binary_r[0]), .Y(n10) );
  INVX2 U14 ( .A(n10), .Y(n24) );
  XOR2X1 U15 ( .A(n11), .B(n18), .Y(wptr_nxt[1]) );
  INVX1 U16 ( .A(n25), .Y(n26) );
  INVX2 U17 ( .A(n19), .Y(n11) );
  INVX1 U18 ( .A(n1), .Y(n12) );
  XOR2X1 U19 ( .A(n20), .B(binary_r[3]), .Y(n13) );
  INVX4 U20 ( .A(n13), .Y(wptr_nxt[3]) );
  XNOR2X1 U21 ( .A(n19), .B(n16), .Y(wptr_nxt[0]) );
  INVX2 U22 ( .A(binary_r[3]), .Y(n27) );
  XOR2X1 U23 ( .A(binary_r[0]), .B(wenable), .Y(n16) );
  XNOR2X1 U24 ( .A(n12), .B(binary_r[2]), .Y(n18) );
  NAND2X1 U25 ( .A(wenable), .B(binary_r[0]), .Y(n25) );
  XOR2X1 U26 ( .A(n25), .B(binary_r[1]), .Y(n19) );
  NAND2X1 U27 ( .A(binary_r[2]), .B(n1), .Y(n20) );
  INVX2 U28 ( .A(binary_r[2]), .Y(n21) );
  NAND3X1 U29 ( .A(binary_r[3]), .B(n22), .C(n21), .Y(n30) );
  XOR2X1 U30 ( .A(binary_r[3]), .B(binary_r[2]), .Y(n23) );
  OAI21X1 U31 ( .A(binary_r[2]), .B(n24), .C(n23), .Y(n29) );
  NAND3X1 U32 ( .A(binary_r[1]), .B(n27), .C(n26), .Y(n28) );
  NAND3X1 U33 ( .A(n30), .B(n29), .C(n28), .Y(wptr_nxt[2]) );
endmodule


module write_fifo_ctrl ( wclk, rst_n, wenable, rptr, wenable_fifo, wptr, waddr, 
        full_flag );
  input [3:0] rptr;
  output [3:0] wptr;
  output [2:0] waddr;
  input wclk, rst_n, wenable;
  output wenable_fifo, full_flag;
  wire   n23, n24, \gray_wptr[2] , N5, net2955, n14, n15, n16, n17, n18, n19,
         n20, n21, n22;
  wire   [3:0] wptr_nxt;
  wire   [3:0] wrptr_r2;
  wire   [3:0] wrptr_r1;
  assign waddr[1] = net2955;

  DFFSR \waddr_reg[2]  ( .D(\gray_wptr[2] ), .CLK(wclk), .R(rst_n), .S(1'b1), 
        .Q(n23) );
  DFFSR \waddr_reg[1]  ( .D(wptr_nxt[1]), .CLK(wclk), .R(rst_n), .S(1'b1), .Q(
        n24) );
  write_ptr WPU1 ( .wclk(wclk), .rst_n(rst_n), .wenable(wenable_fifo), .wptr(
        wptr), .wptr_nxt(wptr_nxt) );
  DFFSR \wrptr_r2_reg[3]  ( .D(wrptr_r1[3]), .CLK(wclk), .R(rst_n), .S(1'b1), 
        .Q(wrptr_r2[3]) );
  DFFSR \wrptr_r2_reg[2]  ( .D(wrptr_r1[2]), .CLK(wclk), .R(rst_n), .S(1'b1), 
        .Q(wrptr_r2[2]) );
  DFFSR \wrptr_r2_reg[1]  ( .D(wrptr_r1[1]), .CLK(wclk), .R(rst_n), .S(1'b1), 
        .Q(wrptr_r2[1]) );
  DFFSR \wrptr_r2_reg[0]  ( .D(wrptr_r1[0]), .CLK(wclk), .R(rst_n), .S(1'b1), 
        .Q(wrptr_r2[0]) );
  DFFSR \wrptr_r1_reg[3]  ( .D(rptr[3]), .CLK(wclk), .R(rst_n), .S(1'b1), .Q(
        wrptr_r1[3]) );
  DFFSR \wrptr_r1_reg[2]  ( .D(rptr[2]), .CLK(wclk), .R(rst_n), .S(1'b1), .Q(
        wrptr_r1[2]) );
  DFFSR \wrptr_r1_reg[1]  ( .D(rptr[1]), .CLK(wclk), .R(rst_n), .S(1'b1), .Q(
        wrptr_r1[1]) );
  DFFSR \wrptr_r1_reg[0]  ( .D(rptr[0]), .CLK(wclk), .R(rst_n), .S(1'b1), .Q(
        wrptr_r1[0]) );
  DFFSR \waddr_reg[0]  ( .D(wptr_nxt[0]), .CLK(wclk), .R(rst_n), .S(1'b1), .Q(
        waddr[0]) );
  DFFSR full_flag_r_reg ( .D(N5), .CLK(wclk), .R(rst_n), .S(1'b1), .Q(
        full_flag) );
  BUFX4 U15 ( .A(n24), .Y(net2955) );
  BUFX4 U16 ( .A(n23), .Y(waddr[2]) );
  XOR2X1 U17 ( .A(wptr_nxt[3]), .B(wptr_nxt[2]), .Y(\gray_wptr[2] ) );
  XOR2X1 U18 ( .A(wptr_nxt[3]), .B(wptr_nxt[2]), .Y(n16) );
  INVX4 U19 ( .A(n22), .Y(wenable_fifo) );
  XNOR2X1 U20 ( .A(wptr_nxt[0]), .B(wrptr_r2[0]), .Y(n15) );
  XOR2X1 U21 ( .A(wptr_nxt[3]), .B(wrptr_r2[3]), .Y(n14) );
  NAND2X1 U22 ( .A(n15), .B(n14), .Y(n20) );
  XOR2X1 U23 ( .A(wrptr_r2[3]), .B(wrptr_r2[2]), .Y(n17) );
  XOR2X1 U24 ( .A(n16), .B(n17), .Y(n19) );
  XOR2X1 U25 ( .A(wptr_nxt[1]), .B(wrptr_r2[1]), .Y(n18) );
  NOR3X1 U26 ( .A(n20), .B(n18), .C(n19), .Y(N5) );
  INVX2 U27 ( .A(full_flag), .Y(n21) );
  NAND2X1 U28 ( .A(wenable), .B(n21), .Y(n22) );
endmodule


module read_ptr ( rclk, rst_n, renable, rptr, rptr_nxt );
  output [3:0] rptr;
  output [3:0] rptr_nxt;
  input rclk, rst_n, renable;
  wire   n9, n10, n11, n12, n13, n16, n17, n18, n19, n20, n21, n22, n23, n24,
         n25, n26, n27, n28, n29, n30, n31;
  wire   [2:0] binary_nxt;
  wire   [3:0] binary_r;

  DFFSR \binary_r_reg[0]  ( .D(n16), .CLK(rclk), .R(rst_n), .S(1'b1), .Q(
        binary_r[0]) );
  DFFSR \binary_r_reg[1]  ( .D(binary_nxt[1]), .CLK(rclk), .R(rst_n), .S(1'b1), 
        .Q(binary_r[1]) );
  DFFSR \gray_r_reg[2]  ( .D(rptr_nxt[2]), .CLK(rclk), .R(rst_n), .S(1'b1), 
        .Q(rptr[2]) );
  DFFSR \binary_r_reg[2]  ( .D(binary_nxt[2]), .CLK(rclk), .R(rst_n), .S(1'b1), 
        .Q(binary_r[2]) );
  DFFSR \gray_r_reg[0]  ( .D(rptr_nxt[0]), .CLK(rclk), .R(rst_n), .S(1'b1), 
        .Q(rptr[0]) );
  DFFSR \gray_r_reg[3]  ( .D(rptr_nxt[3]), .CLK(rclk), .R(rst_n), .S(1'b1), 
        .Q(rptr[3]) );
  DFFSR \binary_r_reg[3]  ( .D(rptr_nxt[3]), .CLK(rclk), .R(rst_n), .S(1'b1), 
        .Q(binary_r[3]) );
  DFFSR \gray_r_reg[1]  ( .D(rptr_nxt[1]), .CLK(rclk), .R(rst_n), .S(1'b1), 
        .Q(rptr[1]) );
  BUFX2 U3 ( .A(binary_r[1]), .Y(n17) );
  INVX4 U12 ( .A(n9), .Y(n10) );
  INVX2 U13 ( .A(binary_r[0]), .Y(n9) );
  INVX2 U14 ( .A(binary_r[3]), .Y(n11) );
  INVX2 U15 ( .A(renable), .Y(n13) );
  XNOR2X1 U16 ( .A(n22), .B(n11), .Y(n23) );
  NOR2X1 U17 ( .A(n26), .B(n13), .Y(n12) );
  INVX1 U18 ( .A(n12), .Y(n21) );
  XNOR2X1 U19 ( .A(n20), .B(binary_nxt[1]), .Y(rptr_nxt[1]) );
  XNOR2X1 U20 ( .A(n19), .B(n16), .Y(rptr_nxt[0]) );
  XOR2X1 U21 ( .A(n10), .B(renable), .Y(n16) );
  INVX1 U22 ( .A(n17), .Y(n27) );
  INVX4 U23 ( .A(n23), .Y(rptr_nxt[3]) );
  NAND2X1 U24 ( .A(renable), .B(n10), .Y(n18) );
  XOR2X1 U25 ( .A(n18), .B(n17), .Y(n19) );
  INVX2 U26 ( .A(n19), .Y(binary_nxt[1]) );
  NAND2X1 U27 ( .A(n17), .B(n10), .Y(n26) );
  XOR2X1 U28 ( .A(n21), .B(binary_r[2]), .Y(n20) );
  INVX2 U29 ( .A(n20), .Y(binary_nxt[2]) );
  NAND2X1 U30 ( .A(binary_r[2]), .B(n12), .Y(n22) );
  INVX2 U31 ( .A(binary_r[2]), .Y(n24) );
  NAND3X1 U32 ( .A(binary_r[3]), .B(n13), .C(n24), .Y(n31) );
  XOR2X1 U33 ( .A(binary_r[3]), .B(binary_r[2]), .Y(n25) );
  OAI21X1 U34 ( .A(binary_r[2]), .B(n26), .C(n25), .Y(n30) );
  NOR2X1 U35 ( .A(binary_r[3]), .B(n27), .Y(n28) );
  NAND3X1 U36 ( .A(renable), .B(n10), .C(n28), .Y(n29) );
  NAND3X1 U37 ( .A(n31), .B(n30), .C(n29), .Y(rptr_nxt[2]) );
endmodule


module read_fifo_ctrl ( rclk, rst_n, renable, wptr, rptr, raddr, empty_flag );
  input [3:0] wptr;
  output [3:0] rptr;
  output [2:0] raddr;
  input rclk, rst_n, renable;
  output empty_flag;
  wire   renable_p2, \gray_rptr[2] , N3, n1, n14, n15, n16, n17, n18, n19, n20
;
  wire   [3:0] rptr_nxt;
  wire   [3:0] rwptr_r2;
  wire   [3:0] rwptr_r1;

  DFFSR empty_flag_r_reg ( .D(N3), .CLK(rclk), .R(1'b1), .S(rst_n), .Q(
        empty_flag) );
  read_ptr RPU1 ( .rclk(rclk), .rst_n(rst_n), .renable(renable_p2), .rptr(rptr), .rptr_nxt(rptr_nxt) );
  DFFSR \rwptr_r2_reg[3]  ( .D(rwptr_r1[3]), .CLK(rclk), .R(rst_n), .S(1'b1), 
        .Q(rwptr_r2[3]) );
  DFFSR \rwptr_r2_reg[2]  ( .D(rwptr_r1[2]), .CLK(rclk), .R(rst_n), .S(1'b1), 
        .Q(rwptr_r2[2]) );
  DFFSR \rwptr_r2_reg[1]  ( .D(rwptr_r1[1]), .CLK(rclk), .R(rst_n), .S(1'b1), 
        .Q(rwptr_r2[1]) );
  DFFSR \rwptr_r2_reg[0]  ( .D(rwptr_r1[0]), .CLK(rclk), .R(rst_n), .S(1'b1), 
        .Q(rwptr_r2[0]) );
  DFFSR \rwptr_r1_reg[3]  ( .D(wptr[3]), .CLK(rclk), .R(rst_n), .S(1'b1), .Q(
        rwptr_r1[3]) );
  DFFSR \rwptr_r1_reg[2]  ( .D(wptr[2]), .CLK(rclk), .R(rst_n), .S(1'b1), .Q(
        rwptr_r1[2]) );
  DFFSR \rwptr_r1_reg[1]  ( .D(wptr[1]), .CLK(rclk), .R(rst_n), .S(1'b1), .Q(
        rwptr_r1[1]) );
  DFFSR \rwptr_r1_reg[0]  ( .D(wptr[0]), .CLK(rclk), .R(rst_n), .S(1'b1), .Q(
        rwptr_r1[0]) );
  DFFSR \raddr_reg[0]  ( .D(rptr_nxt[0]), .CLK(rclk), .R(rst_n), .S(1'b1), .Q(
        raddr[0]) );
  DFFSR \raddr_reg[1]  ( .D(rptr_nxt[1]), .CLK(rclk), .R(rst_n), .S(1'b1), .Q(
        raddr[1]) );
  DFFSR \raddr_reg[2]  ( .D(\gray_rptr[2] ), .CLK(rclk), .R(rst_n), .S(1'b1), 
        .Q(raddr[2]) );
  XNOR2X1 U3 ( .A(rwptr_r2[3]), .B(rwptr_r2[2]), .Y(n1) );
  XNOR2X1 U16 ( .A(n1), .B(n16), .Y(n18) );
  XNOR2X1 U17 ( .A(rptr_nxt[3]), .B(rwptr_r2[3]), .Y(n15) );
  XNOR2X1 U18 ( .A(rptr_nxt[0]), .B(rwptr_r2[0]), .Y(n14) );
  NAND2X1 U19 ( .A(n15), .B(n14), .Y(n19) );
  XOR2X1 U20 ( .A(rptr_nxt[3]), .B(rptr_nxt[2]), .Y(n16) );
  XOR2X1 U21 ( .A(rptr_nxt[1]), .B(rwptr_r2[1]), .Y(n17) );
  NOR3X1 U22 ( .A(n19), .B(n18), .C(n17), .Y(N3) );
  INVX2 U23 ( .A(empty_flag), .Y(n20) );
  AND2X2 U24 ( .A(renable), .B(n20), .Y(renable_p2) );
  XOR2X1 U25 ( .A(rptr_nxt[3]), .B(rptr_nxt[2]), .Y(\gray_rptr[2] ) );
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

