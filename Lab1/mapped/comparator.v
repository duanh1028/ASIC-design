/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : K-2015.06-SP1
// Date      : Tue Jan 14 14:08:30 2020
/////////////////////////////////////////////////////////////


module comparator_DW01_cmp6_0 ( A, B, TC, LT, GT, EQ, LE, GE, NE );
  input [15:0] A;
  input [15:0] B;
  input TC;
  output LT, GT, EQ, LE, GE, NE;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44,
         n45, n46, n47, n48, n49, n50, n51, n52, n53, n54, n55, n56, n57, n58,
         n59, n60, n61, n62, n63, n64, n65, n66, n67, n68, n69, n70, n71, n72,
         n73;

  INVX2 U1 ( .A(LT), .Y(n1) );
  INVX2 U2 ( .A(n34), .Y(n2) );
  INVX2 U3 ( .A(A[14]), .Y(n3) );
  INVX2 U4 ( .A(n67), .Y(n4) );
  INVX2 U5 ( .A(A[12]), .Y(n5) );
  INVX2 U6 ( .A(n65), .Y(n6) );
  INVX2 U7 ( .A(n63), .Y(n7) );
  INVX2 U8 ( .A(A[10]), .Y(n8) );
  INVX2 U9 ( .A(A[8]), .Y(n9) );
  INVX2 U10 ( .A(n29), .Y(n10) );
  INVX2 U11 ( .A(n33), .Y(n11) );
  INVX2 U12 ( .A(A[6]), .Y(n12) );
  INVX2 U13 ( .A(A[4]), .Y(n13) );
  INVX2 U14 ( .A(n36), .Y(n14) );
  INVX2 U15 ( .A(A[2]), .Y(n15) );
  INVX2 U16 ( .A(B[15]), .Y(n16) );
  INVX2 U17 ( .A(B[13]), .Y(n17) );
  INVX2 U18 ( .A(B[11]), .Y(n18) );
  INVX2 U19 ( .A(B[9]), .Y(n19) );
  INVX2 U20 ( .A(B[7]), .Y(n20) );
  INVX2 U21 ( .A(B[5]), .Y(n21) );
  INVX2 U22 ( .A(B[3]), .Y(n22) );
  INVX2 U23 ( .A(B[1]), .Y(n23) );
  INVX2 U24 ( .A(B[0]), .Y(n24) );
  AND2X1 U25 ( .A(n25), .B(n26), .Y(EQ) );
  NOR2X1 U26 ( .A(n27), .B(n28), .Y(n26) );
  NAND3X1 U27 ( .A(n29), .B(n11), .C(n30), .Y(n28) );
  NOR2X1 U28 ( .A(n31), .B(n32), .Y(n30) );
  NAND3X1 U29 ( .A(n34), .B(n1), .C(n35), .Y(n27) );
  NOR2X1 U30 ( .A(n36), .B(n37), .Y(n35) );
  OAI22X1 U31 ( .A(A[15]), .B(n16), .C(n2), .D(n38), .Y(LT) );
  AOI22X1 U32 ( .A(B[14]), .B(n3), .C(n39), .D(n40), .Y(n38) );
  OAI21X1 U33 ( .A(A[13]), .B(n17), .C(n41), .Y(n40) );
  AOI22X1 U34 ( .A(B[12]), .B(n5), .C(n42), .D(n43), .Y(n41) );
  OAI21X1 U35 ( .A(A[11]), .B(n18), .C(n44), .Y(n43) );
  AOI22X1 U36 ( .A(B[10]), .B(n8), .C(n45), .D(n46), .Y(n44) );
  OAI21X1 U37 ( .A(A[9]), .B(n19), .C(n47), .Y(n46) );
  AOI22X1 U38 ( .A(B[8]), .B(n9), .C(n48), .D(n49), .Y(n47) );
  OAI21X1 U39 ( .A(A[7]), .B(n20), .C(n50), .Y(n49) );
  AOI22X1 U40 ( .A(B[6]), .B(n12), .C(n51), .D(n52), .Y(n50) );
  OAI21X1 U41 ( .A(A[5]), .B(n21), .C(n53), .Y(n52) );
  AOI22X1 U42 ( .A(B[4]), .B(n13), .C(n54), .D(n55), .Y(n53) );
  OAI21X1 U43 ( .A(A[3]), .B(n22), .C(n56), .Y(n55) );
  AOI21X1 U44 ( .A(B[2]), .B(n15), .C(n57), .Y(n56) );
  AOI21X1 U45 ( .A(A[1]), .B(n58), .C(n59), .Y(n57) );
  NAND2X1 U46 ( .A(n60), .B(n14), .Y(n59) );
  NOR2X1 U47 ( .A(n15), .B(B[2]), .Y(n36) );
  OAI21X1 U48 ( .A(A[1]), .B(n58), .C(n23), .Y(n60) );
  OR2X1 U49 ( .A(n24), .B(A[0]), .Y(n58) );
  NOR2X1 U50 ( .A(n37), .B(n31), .Y(n54) );
  NOR2X1 U51 ( .A(n13), .B(B[4]), .Y(n31) );
  AND2X1 U52 ( .A(A[3]), .B(n22), .Y(n37) );
  NOR2X1 U53 ( .A(n32), .B(n33), .Y(n51) );
  NOR2X1 U54 ( .A(n12), .B(B[6]), .Y(n33) );
  AND2X1 U55 ( .A(A[5]), .B(n21), .Y(n32) );
  NOR2X1 U56 ( .A(n10), .B(n61), .Y(n48) );
  NAND2X1 U57 ( .A(A[7]), .B(n20), .Y(n29) );
  NOR2X1 U58 ( .A(n62), .B(n63), .Y(n45) );
  NOR2X1 U59 ( .A(n6), .B(n64), .Y(n42) );
  NOR2X1 U60 ( .A(n66), .B(n4), .Y(n39) );
  NAND2X1 U61 ( .A(A[15]), .B(n16), .Y(n34) );
  NOR2X1 U62 ( .A(n68), .B(n69), .Y(n25) );
  NAND3X1 U63 ( .A(n70), .B(n67), .C(n71), .Y(n69) );
  NOR2X1 U64 ( .A(n64), .B(n66), .Y(n71) );
  NOR2X1 U65 ( .A(n3), .B(B[14]), .Y(n66) );
  NOR2X1 U66 ( .A(n5), .B(B[12]), .Y(n64) );
  NAND2X1 U67 ( .A(A[13]), .B(n17), .Y(n67) );
  OAI22X1 U68 ( .A(A[1]), .B(n72), .C(n72), .D(n23), .Y(n70) );
  AND2X1 U69 ( .A(A[0]), .B(n24), .Y(n72) );
  NAND3X1 U70 ( .A(n65), .B(n7), .C(n73), .Y(n68) );
  NOR2X1 U71 ( .A(n61), .B(n62), .Y(n73) );
  AND2X1 U72 ( .A(A[9]), .B(n19), .Y(n62) );
  NOR2X1 U73 ( .A(n9), .B(B[8]), .Y(n61) );
  NOR2X1 U74 ( .A(n8), .B(B[10]), .Y(n63) );
  NAND2X1 U75 ( .A(A[11]), .B(n18), .Y(n65) );
endmodule


module comparator ( a, b, gt, lt, eq );
  input [15:0] a;
  input [15:0] b;
  output gt, lt, eq;
  wire   N2, n8;

  comparator_DW01_cmp6_0 r299 ( .A(a), .B(b), .TC(1'b0), .LT(lt), .EQ(N2) );
  NOR2X1 U8 ( .A(lt), .B(N2), .Y(gt) );
  NOR2X1 U9 ( .A(lt), .B(n8), .Y(eq) );
  INVX1 U10 ( .A(N2), .Y(n8) );
endmodule

