/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : K-2015.06-SP1
// Date      : Thu Apr  2 10:41:50 2020
/////////////////////////////////////////////////////////////


module ahb_lite_slave ( clk, n_rst, sample_data, data_ready, 
        new_coefficient_set, coefficient_num, fir_coefficient, modwait, 
        fir_out, err, hsel, haddr, hsize, htrans, hwrite, hwdata, hrdata, 
        hresp );
  output [15:0] sample_data;
  input [1:0] coefficient_num;
  output [15:0] fir_coefficient;
  input [15:0] fir_out;
  input [3:0] haddr;
  input [1:0] htrans;
  input [15:0] hwdata;
  output [15:0] hrdata;
  input clk, n_rst, modwait, err, hsel, hsize, hwrite;
  output data_ready, new_coefficient_set, hresp;
  wire   N34, N86, N87, N88, N89, N90, \ahb_reg[14][7] , \ahb_reg[14][6] ,
         \ahb_reg[14][5] , \ahb_reg[14][4] , \ahb_reg[14][3] ,
         \ahb_reg[14][2] , \ahb_reg[14][1] , \ahb_reg[13][7] ,
         \ahb_reg[13][6] , \ahb_reg[13][5] , \ahb_reg[13][4] ,
         \ahb_reg[13][3] , \ahb_reg[13][2] , \ahb_reg[13][1] ,
         \ahb_reg[13][0] , \ahb_reg[12][7] , \ahb_reg[12][6] ,
         \ahb_reg[12][5] , \ahb_reg[12][4] , \ahb_reg[12][3] ,
         \ahb_reg[12][2] , \ahb_reg[12][1] , \ahb_reg[12][0] ,
         \ahb_reg[11][7] , \ahb_reg[11][6] , \ahb_reg[11][5] ,
         \ahb_reg[11][4] , \ahb_reg[11][3] , \ahb_reg[11][2] ,
         \ahb_reg[11][1] , \ahb_reg[11][0] , \ahb_reg[10][7] ,
         \ahb_reg[10][6] , \ahb_reg[10][5] , \ahb_reg[10][4] ,
         \ahb_reg[10][3] , \ahb_reg[10][2] , \ahb_reg[10][1] ,
         \ahb_reg[10][0] , \ahb_reg[9][7] , \ahb_reg[9][6] , \ahb_reg[9][5] ,
         \ahb_reg[9][4] , \ahb_reg[9][3] , \ahb_reg[9][2] , \ahb_reg[9][1] ,
         \ahb_reg[9][0] , \ahb_reg[8][7] , \ahb_reg[8][6] , \ahb_reg[8][5] ,
         \ahb_reg[8][4] , \ahb_reg[8][3] , \ahb_reg[8][2] , \ahb_reg[8][1] ,
         \ahb_reg[8][0] , \ahb_reg[7][7] , \ahb_reg[7][6] , \ahb_reg[7][5] ,
         \ahb_reg[7][4] , \ahb_reg[7][3] , \ahb_reg[7][2] , \ahb_reg[7][1] ,
         \ahb_reg[7][0] , \ahb_reg[6][7] , \ahb_reg[6][6] , \ahb_reg[6][5] ,
         \ahb_reg[6][4] , \ahb_reg[6][3] , \ahb_reg[6][2] , \ahb_reg[6][1] ,
         \ahb_reg[6][0] , \ahb_reg[3][7] , \ahb_reg[3][6] , \ahb_reg[3][5] ,
         \ahb_reg[3][4] , \ahb_reg[3][3] , \ahb_reg[3][2] , \ahb_reg[3][1] ,
         \ahb_reg[3][0] , \ahb_reg[2][7] , \ahb_reg[2][6] , \ahb_reg[2][5] ,
         \ahb_reg[2][4] , \ahb_reg[2][3] , \ahb_reg[2][2] , \ahb_reg[2][1] ,
         \ahb_reg[2][0] , \ahb_reg[1][7] , \ahb_reg[1][6] , \ahb_reg[1][5] ,
         \ahb_reg[1][4] , \ahb_reg[1][3] , \ahb_reg[1][2] , \ahb_reg[1][1] ,
         \ahb_reg[1][0] , \ahb_reg[0][7] , \ahb_reg[0][6] , \ahb_reg[0][5] ,
         \ahb_reg[0][4] , \ahb_reg[0][3] , \ahb_reg[0][2] , \ahb_reg[0][1] ,
         \ahb_reg[0][0] , \copy_hsize[0] , \next_ahb_reg[14][7] ,
         \next_ahb_reg[14][6] , \next_ahb_reg[14][5] , \next_ahb_reg[14][4] ,
         \next_ahb_reg[14][3] , \next_ahb_reg[14][2] , \next_ahb_reg[14][1] ,
         \next_ahb_reg[14][0] , \next_ahb_reg[3][7] , \next_ahb_reg[3][6] ,
         \next_ahb_reg[3][5] , \next_ahb_reg[3][4] , \next_ahb_reg[3][3] ,
         \next_ahb_reg[3][2] , \next_ahb_reg[3][1] , \next_ahb_reg[3][0] ,
         \next_ahb_reg[2][7] , \next_ahb_reg[2][6] , \next_ahb_reg[2][5] ,
         \next_ahb_reg[2][4] , \next_ahb_reg[2][3] , \next_ahb_reg[2][2] ,
         \next_ahb_reg[2][1] , \next_ahb_reg[2][0] , \next_ahb_reg[1][7] ,
         \next_ahb_reg[1][6] , \next_ahb_reg[1][5] , \next_ahb_reg[1][4] ,
         \next_ahb_reg[1][3] , \next_ahb_reg[1][2] , \next_ahb_reg[1][1] ,
         \next_ahb_reg[1][0] , \next_ahb_reg[0][7] , \next_ahb_reg[0][6] ,
         \next_ahb_reg[0][5] , \next_ahb_reg[0][4] , \next_ahb_reg[0][3] ,
         \next_ahb_reg[0][2] , \next_ahb_reg[0][1] , \next_ahb_reg[0][0] ,
         N673, N674, N675, N676, N677, N678, N679, N680, N697, N698, N699,
         N700, N701, N702, N703, N704, N705, N706, N707, N708, N709, N710,
         N711, N712, n423, n424, n425, n426, n429, n432, n434, n436, n438,
         n440, n442, n444, n449, n454, n455, n456, n457, n458, n464, n465,
         n466, n467, n470, n471, n472, n473, n474, n475, n476, n477, n478,
         n479, n480, n482, n483, n484, n485, n486, n487, n488, n490, n491,
         n493, n494, n495, n497, n498, n499, n500, n501, n502, n503, n504,
         n505, n506, n507, n508, n509, n510, n511, n512, n513, n514, n515,
         n516, n517, n518, n519, n520, n521, n522, n523, n524, n525, n526,
         n528, n529, n530, n531, n532, n533, n534, n535, n536, n537, n538,
         n540, n541, n542, n543, n544, n545, n546, n547, n548, n549, n551,
         n552, n553, n554, n555, n556, n557, n558, n559, n560, n561, n562,
         n563, n564, n565, n566, n567, n568, n569, n570, n571, n572, n574,
         n575, n576, n577, n578, n579, n580, n581, n582, n583, n584, n586,
         n587, n588, n589, n590, n591, n592, n593, n594, n595, n597, n598,
         n599, n600, n601, n602, n603, n604, n605, n606, n607, n609, n610,
         n611, n612, n613, n614, n615, n616, n618, n619, n620, n621, n622,
         n623, n624, n625, n626, n627, n628, n629, n630, n631, n632, n633,
         n634, n635, n636, n637, n638, n639, n640, n641, n642, n643, n644,
         n646, n647, n648, n649, n650, n651, n652, n653, n654, n655, n656,
         n657, n658, n659, n660, n661, n662, n663, n664, n665, n666, n667,
         n668, n669, n670, n671, n672, n673, n674, n675, n676, n677, n678,
         n679, n680, n681, n682, n683, n684, n685, n686, n687, n688, n689,
         n690, n691, n692, n693, n694, n695, n696, n697, n698, n699, n700,
         n701, n702, n703, n704, n705, n706, n707, n708, n709, n710, n711,
         n712, n713, n714, n715, n716, n717, n718, n719, n720, n721, n722,
         n723, n724, n725, n726, n1, n2, n3, n4, n5, n6, n135, n136, n137,
         n138, n139, n140, n141, n142, n143, n144, n145, n146, n147, n148,
         n149, n150, n151, n152, n153, n154, n155, n156, n157, n158, n159,
         n160, n161, n162, n163, n164, n165, n166, n167, n168, n169, n170,
         n171, n172, n173, n174, n175, n176, n177, n178, n179, n180, n181,
         n182, n183, n184, n185, n186, n187, n188, n189, n190, n191, n192,
         n193, n194, n195, n196, n197, n198, n199, n200, n201, n202, n203,
         n204, n205, n206, n207, n208, n209, n210, n211, n212, n213, n214,
         n215, n216, n217, n218, n219, n220, n221, n222, n223, n224, n225,
         n226, n227, n228, n229, n230, n231, n232, n233, n234, n235, n236,
         n237, n238, n239, n240, n241, n242, n243, n244, n245, n246, n247,
         n248, n249, n250, n251, n252, n253, n254, n255, n256, n257, n258,
         n259, n260, n261, n262, n263, n264, n265, n266, n267, n268, n269,
         n270, n271, n272, n273, n274, n275, n276, n277, n278, n279, n280,
         n281, n282, n283, n284, n285, n286, n287, n288, n289, n290, n291,
         n292, n293, n294, n295, n296, n297, n298, n299, n300, n301, n302,
         n303, n304, n305, n306, n307, n308, n309, n310, n311, n312, n313,
         n314, n315, n316, n317, n318, n319, n320, n321, n322, n323, n324,
         n325, n326, n327, n328, n329, n330, n331, n332, n333, n334, n335,
         n336, n337, n338, n339, n340, n341, n342, n343, n344, n345, n346,
         n347, n348, n349, n350, n351, n352, n353, n354, n355, n356, n357,
         n358, n359, n360, n361, n362, n363, n364, n365, n366, n367, n368,
         n369, n370, n371, n372, n373, n374, n375, n376, n377, n378, n379,
         n380, n381, n382, n383, n384, n385, n386, n387, n388, n389, n390,
         n391, n392, n393, n394, n395, n396, n397, n398, n399, n400, n401,
         n402, n403, n404, n405, n406, n407, n408, n409, n410, n411, n412,
         n413, n414, n415, n416, n417, n418, n419, n420, n421, n422, n427,
         n428, n430, n431, n433, n435, n437, n439, n441, n443, n445, n446,
         n447, n448, n450, n451, n452, n453, n459, n460, n461, n462, n463,
         n468, n469, n481, n489, n492, n496, n527, n539, n550, n573, n585,
         n596, n608, n617, n645, n727, n728, n729, n730, n731, n732, n733,
         n734, n735, n736, n737, n738, n739, n740, n741, n742, n743, n744,
         n745, n746, n747, n748, n749, n750, n751, n752, n753, n754, n755,
         n756, n757, n758, n759, n760, n761, n762, n763, n764, n765, n766,
         n767, n768, n769, n770, n771, n772, n773, n774, n775, n776, n777,
         n778, n779, n780, n781, n782, n783, n784, n785, n786, n787, n788,
         n789, n790, n791, n792, n793, n794, n795, n796, n797, n798, n799,
         n800, n801, n802, n803, n804, n805, n806, n807, n808, n809, n810,
         n811, n812, n813, n814, n815, n816, n817, n818, n819, n820, n821,
         n822, n823, n824, n825, n826, n827, n828, n829, n830, n831, n832,
         n833, n834, n835, n836, n837, n838, n839, n840, n841, n842, n843,
         n844, n845, n846, n847, n848, n849, n850, n851, n852, n853, n854,
         n855, n856, n857, n858, n859, n860, n861, n862, n863, n864, n865,
         n866, n867, n868, n869, n870, n871, n872, n873, n874, n875, n876,
         n877, n878, n879, n880, n881, n882, n883, n884, n885, n886, n887,
         n888, n889, n890, n891, n892, n893, n894, n895, n896, n897, n898,
         n899, n900, n901, n902, n903, n904, n905, n906, n907, n908, n909,
         n910, n911, n912, n913, n914, n915, n916, n917, n918, n919, n920,
         n921, n922, n923, n924, n925, n926, n927, n928, n929, n930, n931,
         n932, n933, n934, n935, n936, n937, n938, n939, n940, n941, n942,
         n943, n944, n945, n946, n947, n948, n949, n950, n951, n952, n953,
         n954, n955, n956, n957, n958, n959, n960, n961, n962, n963, n964,
         n965;
  wire   [2:0] state;
  wire   [1:0] next_state;

  DFFSR \copy_hsize_reg[0]  ( .D(hsize), .CLK(clk), .R(n808), .S(1'b1), .Q(
        \copy_hsize[0] ) );
  DFFSR \state_reg[1]  ( .D(next_state[1]), .CLK(clk), .R(n808), .S(1'b1), .Q(
        state[1]) );
  DFFSR \state_reg[0]  ( .D(next_state[0]), .CLK(clk), .R(n808), .S(1'b1), .Q(
        state[0]) );
  DFFSR \copy_haddr_reg[3]  ( .D(haddr[3]), .CLK(clk), .R(n808), .S(1'b1), .Q(
        N90) );
  DFFSR \copy_haddr_reg[2]  ( .D(haddr[2]), .CLK(clk), .R(n808), .S(1'b1), .Q(
        N89) );
  DFFSR \copy_haddr_reg[1]  ( .D(haddr[1]), .CLK(clk), .R(n808), .S(1'b1), .Q(
        N88) );
  DFFSR data_ready_reg ( .D(n726), .CLK(clk), .R(n808), .S(1'b1), .Q(
        data_ready) );
  DFFSR \copy_haddr_reg[0]  ( .D(haddr[0]), .CLK(clk), .R(n808), .S(1'b1), .Q(
        N34) );
  DFFSR \ahb_reg_reg[2][0]  ( .D(\next_ahb_reg[2][0] ), .CLK(clk), .R(n807), 
        .S(1'b1), .Q(\ahb_reg[2][0] ) );
  DFFSR \ahb_reg_reg[14][0]  ( .D(\next_ahb_reg[14][0] ), .CLK(clk), .R(n807), 
        .S(1'b1), .Q(new_coefficient_set) );
  DFFSR \ahb_reg_reg[0][0]  ( .D(\next_ahb_reg[0][0] ), .CLK(clk), .R(n807), 
        .S(1'b1), .Q(\ahb_reg[0][0] ) );
  DFFSR \ahb_reg_reg[12][0]  ( .D(n661), .CLK(clk), .R(n807), .S(1'b1), .Q(
        \ahb_reg[12][0] ) );
  DFFSR \ahb_reg_reg[10][0]  ( .D(n677), .CLK(clk), .R(n807), .S(1'b1), .Q(
        \ahb_reg[10][0] ) );
  DFFSR \ahb_reg_reg[8][0]  ( .D(n693), .CLK(clk), .R(n807), .S(1'b1), .Q(
        \ahb_reg[8][0] ) );
  DFFSR \ahb_reg_reg[6][0]  ( .D(n709), .CLK(clk), .R(n807), .S(1'b1), .Q(
        \ahb_reg[6][0] ) );
  DFFSR \ahb_reg_reg[4][0]  ( .D(n725), .CLK(clk), .R(n807), .S(1'b1), .Q(
        sample_data[0]) );
  DFFSR \ahb_reg_reg[2][1]  ( .D(\next_ahb_reg[2][1] ), .CLK(clk), .R(n807), 
        .S(1'b1), .Q(\ahb_reg[2][1] ) );
  DFFSR \ahb_reg_reg[14][1]  ( .D(\next_ahb_reg[14][1] ), .CLK(clk), .R(n807), 
        .S(1'b1), .Q(\ahb_reg[14][1] ) );
  DFFSR \ahb_reg_reg[0][1]  ( .D(\next_ahb_reg[0][1] ), .CLK(clk), .R(n807), 
        .S(1'b1), .Q(\ahb_reg[0][1] ) );
  DFFSR \ahb_reg_reg[12][1]  ( .D(n660), .CLK(clk), .R(n807), .S(1'b1), .Q(
        \ahb_reg[12][1] ) );
  DFFSR \ahb_reg_reg[10][1]  ( .D(n676), .CLK(clk), .R(n806), .S(1'b1), .Q(
        \ahb_reg[10][1] ) );
  DFFSR \ahb_reg_reg[8][1]  ( .D(n692), .CLK(clk), .R(n806), .S(1'b1), .Q(
        \ahb_reg[8][1] ) );
  DFFSR \ahb_reg_reg[6][1]  ( .D(n708), .CLK(clk), .R(n806), .S(1'b1), .Q(
        \ahb_reg[6][1] ) );
  DFFSR \ahb_reg_reg[4][1]  ( .D(n724), .CLK(clk), .R(n806), .S(1'b1), .Q(
        sample_data[1]) );
  DFFSR \ahb_reg_reg[2][2]  ( .D(\next_ahb_reg[2][2] ), .CLK(clk), .R(n806), 
        .S(1'b1), .Q(\ahb_reg[2][2] ) );
  DFFSR \ahb_reg_reg[14][2]  ( .D(\next_ahb_reg[14][2] ), .CLK(clk), .R(n806), 
        .S(1'b1), .Q(\ahb_reg[14][2] ) );
  DFFSR \ahb_reg_reg[0][2]  ( .D(\next_ahb_reg[0][2] ), .CLK(clk), .R(n806), 
        .S(1'b1), .Q(\ahb_reg[0][2] ) );
  DFFSR \ahb_reg_reg[12][2]  ( .D(n659), .CLK(clk), .R(n806), .S(1'b1), .Q(
        \ahb_reg[12][2] ) );
  DFFSR \ahb_reg_reg[10][2]  ( .D(n675), .CLK(clk), .R(n806), .S(1'b1), .Q(
        \ahb_reg[10][2] ) );
  DFFSR \ahb_reg_reg[8][2]  ( .D(n691), .CLK(clk), .R(n806), .S(1'b1), .Q(
        \ahb_reg[8][2] ) );
  DFFSR \ahb_reg_reg[6][2]  ( .D(n707), .CLK(clk), .R(n806), .S(1'b1), .Q(
        \ahb_reg[6][2] ) );
  DFFSR \ahb_reg_reg[4][2]  ( .D(n723), .CLK(clk), .R(n806), .S(1'b1), .Q(
        sample_data[2]) );
  DFFSR \ahb_reg_reg[2][3]  ( .D(\next_ahb_reg[2][3] ), .CLK(clk), .R(n805), 
        .S(1'b1), .Q(\ahb_reg[2][3] ) );
  DFFSR \ahb_reg_reg[14][3]  ( .D(\next_ahb_reg[14][3] ), .CLK(clk), .R(n805), 
        .S(1'b1), .Q(\ahb_reg[14][3] ) );
  DFFSR \ahb_reg_reg[0][3]  ( .D(\next_ahb_reg[0][3] ), .CLK(clk), .R(n805), 
        .S(1'b1), .Q(\ahb_reg[0][3] ) );
  DFFSR \ahb_reg_reg[12][3]  ( .D(n658), .CLK(clk), .R(n805), .S(1'b1), .Q(
        \ahb_reg[12][3] ) );
  DFFSR \ahb_reg_reg[10][3]  ( .D(n674), .CLK(clk), .R(n805), .S(1'b1), .Q(
        \ahb_reg[10][3] ) );
  DFFSR \ahb_reg_reg[8][3]  ( .D(n690), .CLK(clk), .R(n805), .S(1'b1), .Q(
        \ahb_reg[8][3] ) );
  DFFSR \ahb_reg_reg[6][3]  ( .D(n706), .CLK(clk), .R(n805), .S(1'b1), .Q(
        \ahb_reg[6][3] ) );
  DFFSR \ahb_reg_reg[4][3]  ( .D(n722), .CLK(clk), .R(n805), .S(1'b1), .Q(
        sample_data[3]) );
  DFFSR \ahb_reg_reg[2][4]  ( .D(\next_ahb_reg[2][4] ), .CLK(clk), .R(n805), 
        .S(1'b1), .Q(\ahb_reg[2][4] ) );
  DFFSR \ahb_reg_reg[14][4]  ( .D(\next_ahb_reg[14][4] ), .CLK(clk), .R(n805), 
        .S(1'b1), .Q(\ahb_reg[14][4] ) );
  DFFSR \ahb_reg_reg[0][4]  ( .D(\next_ahb_reg[0][4] ), .CLK(clk), .R(n805), 
        .S(1'b1), .Q(\ahb_reg[0][4] ) );
  DFFSR \ahb_reg_reg[12][4]  ( .D(n657), .CLK(clk), .R(n805), .S(1'b1), .Q(
        \ahb_reg[12][4] ) );
  DFFSR \ahb_reg_reg[10][4]  ( .D(n673), .CLK(clk), .R(n804), .S(1'b1), .Q(
        \ahb_reg[10][4] ) );
  DFFSR \ahb_reg_reg[8][4]  ( .D(n689), .CLK(clk), .R(n804), .S(1'b1), .Q(
        \ahb_reg[8][4] ) );
  DFFSR \ahb_reg_reg[6][4]  ( .D(n705), .CLK(clk), .R(n804), .S(1'b1), .Q(
        \ahb_reg[6][4] ) );
  DFFSR \ahb_reg_reg[4][4]  ( .D(n721), .CLK(clk), .R(n804), .S(1'b1), .Q(
        sample_data[4]) );
  DFFSR \ahb_reg_reg[2][5]  ( .D(\next_ahb_reg[2][5] ), .CLK(clk), .R(n804), 
        .S(1'b1), .Q(\ahb_reg[2][5] ) );
  DFFSR \ahb_reg_reg[14][5]  ( .D(\next_ahb_reg[14][5] ), .CLK(clk), .R(n804), 
        .S(1'b1), .Q(\ahb_reg[14][5] ) );
  DFFSR \ahb_reg_reg[0][5]  ( .D(\next_ahb_reg[0][5] ), .CLK(clk), .R(n804), 
        .S(1'b1), .Q(\ahb_reg[0][5] ) );
  DFFSR \ahb_reg_reg[12][5]  ( .D(n656), .CLK(clk), .R(n804), .S(1'b1), .Q(
        \ahb_reg[12][5] ) );
  DFFSR \ahb_reg_reg[10][5]  ( .D(n672), .CLK(clk), .R(n804), .S(1'b1), .Q(
        \ahb_reg[10][5] ) );
  DFFSR \ahb_reg_reg[8][5]  ( .D(n688), .CLK(clk), .R(n804), .S(1'b1), .Q(
        \ahb_reg[8][5] ) );
  DFFSR \ahb_reg_reg[6][5]  ( .D(n704), .CLK(clk), .R(n804), .S(1'b1), .Q(
        \ahb_reg[6][5] ) );
  DFFSR \ahb_reg_reg[4][5]  ( .D(n720), .CLK(clk), .R(n804), .S(1'b1), .Q(
        sample_data[5]) );
  DFFSR \ahb_reg_reg[2][6]  ( .D(\next_ahb_reg[2][6] ), .CLK(clk), .R(n803), 
        .S(1'b1), .Q(\ahb_reg[2][6] ) );
  DFFSR \ahb_reg_reg[14][6]  ( .D(\next_ahb_reg[14][6] ), .CLK(clk), .R(n803), 
        .S(1'b1), .Q(\ahb_reg[14][6] ) );
  DFFSR \ahb_reg_reg[0][6]  ( .D(\next_ahb_reg[0][6] ), .CLK(clk), .R(n803), 
        .S(1'b1), .Q(\ahb_reg[0][6] ) );
  DFFSR \ahb_reg_reg[12][6]  ( .D(n655), .CLK(clk), .R(n803), .S(1'b1), .Q(
        \ahb_reg[12][6] ) );
  DFFSR \ahb_reg_reg[10][6]  ( .D(n671), .CLK(clk), .R(n803), .S(1'b1), .Q(
        \ahb_reg[10][6] ) );
  DFFSR \ahb_reg_reg[8][6]  ( .D(n687), .CLK(clk), .R(n803), .S(1'b1), .Q(
        \ahb_reg[8][6] ) );
  DFFSR \ahb_reg_reg[6][6]  ( .D(n703), .CLK(clk), .R(n803), .S(1'b1), .Q(
        \ahb_reg[6][6] ) );
  DFFSR \ahb_reg_reg[4][6]  ( .D(n719), .CLK(clk), .R(n803), .S(1'b1), .Q(
        sample_data[6]) );
  DFFSR \ahb_reg_reg[2][7]  ( .D(\next_ahb_reg[2][7] ), .CLK(clk), .R(n803), 
        .S(1'b1), .Q(\ahb_reg[2][7] ) );
  DFFSR \ahb_reg_reg[14][7]  ( .D(\next_ahb_reg[14][7] ), .CLK(clk), .R(n803), 
        .S(1'b1), .Q(\ahb_reg[14][7] ) );
  DFFSR \ahb_reg_reg[0][7]  ( .D(\next_ahb_reg[0][7] ), .CLK(clk), .R(n803), 
        .S(1'b1), .Q(\ahb_reg[0][7] ) );
  DFFSR \ahb_reg_reg[12][7]  ( .D(n654), .CLK(clk), .R(n803), .S(1'b1), .Q(
        \ahb_reg[12][7] ) );
  DFFSR \ahb_reg_reg[10][7]  ( .D(n670), .CLK(clk), .R(n802), .S(1'b1), .Q(
        \ahb_reg[10][7] ) );
  DFFSR \ahb_reg_reg[8][7]  ( .D(n686), .CLK(clk), .R(n802), .S(1'b1), .Q(
        \ahb_reg[8][7] ) );
  DFFSR \ahb_reg_reg[6][7]  ( .D(n702), .CLK(clk), .R(n802), .S(1'b1), .Q(
        \ahb_reg[6][7] ) );
  DFFSR \ahb_reg_reg[4][7]  ( .D(n718), .CLK(clk), .R(n802), .S(1'b1), .Q(
        sample_data[7]) );
  DFFSR \ahb_reg_reg[5][0]  ( .D(n717), .CLK(clk), .R(n802), .S(1'b1), .Q(
        sample_data[8]) );
  DFFSR \ahb_reg_reg[5][1]  ( .D(n716), .CLK(clk), .R(n802), .S(1'b1), .Q(
        sample_data[9]) );
  DFFSR \ahb_reg_reg[5][2]  ( .D(n715), .CLK(clk), .R(n802), .S(1'b1), .Q(
        sample_data[10]) );
  DFFSR \ahb_reg_reg[5][3]  ( .D(n714), .CLK(clk), .R(n802), .S(1'b1), .Q(
        sample_data[11]) );
  DFFSR \ahb_reg_reg[5][4]  ( .D(n713), .CLK(clk), .R(n802), .S(1'b1), .Q(
        sample_data[12]) );
  DFFSR \ahb_reg_reg[5][5]  ( .D(n712), .CLK(clk), .R(n802), .S(1'b1), .Q(
        sample_data[13]) );
  DFFSR \ahb_reg_reg[5][6]  ( .D(n711), .CLK(clk), .R(n802), .S(1'b1), .Q(
        sample_data[14]) );
  DFFSR \ahb_reg_reg[5][7]  ( .D(n710), .CLK(clk), .R(n802), .S(1'b1), .Q(
        sample_data[15]) );
  DFFSR \ahb_reg_reg[7][0]  ( .D(n701), .CLK(clk), .R(n801), .S(1'b1), .Q(
        \ahb_reg[7][0] ) );
  DFFSR \ahb_reg_reg[7][1]  ( .D(n700), .CLK(clk), .R(n801), .S(1'b1), .Q(
        \ahb_reg[7][1] ) );
  DFFSR \ahb_reg_reg[7][2]  ( .D(n699), .CLK(clk), .R(n801), .S(1'b1), .Q(
        \ahb_reg[7][2] ) );
  DFFSR \ahb_reg_reg[7][3]  ( .D(n698), .CLK(clk), .R(n801), .S(1'b1), .Q(
        \ahb_reg[7][3] ) );
  DFFSR \ahb_reg_reg[7][4]  ( .D(n697), .CLK(clk), .R(n801), .S(1'b1), .Q(
        \ahb_reg[7][4] ) );
  DFFSR \ahb_reg_reg[7][5]  ( .D(n696), .CLK(clk), .R(n801), .S(1'b1), .Q(
        \ahb_reg[7][5] ) );
  DFFSR \ahb_reg_reg[7][6]  ( .D(n695), .CLK(clk), .R(n801), .S(1'b1), .Q(
        \ahb_reg[7][6] ) );
  DFFSR \ahb_reg_reg[7][7]  ( .D(n694), .CLK(clk), .R(n801), .S(1'b1), .Q(
        \ahb_reg[7][7] ) );
  DFFSR \ahb_reg_reg[9][0]  ( .D(n685), .CLK(clk), .R(n801), .S(1'b1), .Q(
        \ahb_reg[9][0] ) );
  DFFSR \ahb_reg_reg[9][1]  ( .D(n684), .CLK(clk), .R(n801), .S(1'b1), .Q(
        \ahb_reg[9][1] ) );
  DFFSR \ahb_reg_reg[9][2]  ( .D(n683), .CLK(clk), .R(n801), .S(1'b1), .Q(
        \ahb_reg[9][2] ) );
  DFFSR \ahb_reg_reg[9][3]  ( .D(n682), .CLK(clk), .R(n801), .S(1'b1), .Q(
        \ahb_reg[9][3] ) );
  DFFSR \ahb_reg_reg[9][4]  ( .D(n681), .CLK(clk), .R(n800), .S(1'b1), .Q(
        \ahb_reg[9][4] ) );
  DFFSR \ahb_reg_reg[9][5]  ( .D(n680), .CLK(clk), .R(n800), .S(1'b1), .Q(
        \ahb_reg[9][5] ) );
  DFFSR \ahb_reg_reg[9][6]  ( .D(n679), .CLK(clk), .R(n800), .S(1'b1), .Q(
        \ahb_reg[9][6] ) );
  DFFSR \ahb_reg_reg[9][7]  ( .D(n678), .CLK(clk), .R(n800), .S(1'b1), .Q(
        \ahb_reg[9][7] ) );
  DFFSR \ahb_reg_reg[11][0]  ( .D(n669), .CLK(clk), .R(n800), .S(1'b1), .Q(
        \ahb_reg[11][0] ) );
  DFFSR \ahb_reg_reg[11][1]  ( .D(n668), .CLK(clk), .R(n800), .S(1'b1), .Q(
        \ahb_reg[11][1] ) );
  DFFSR \ahb_reg_reg[11][2]  ( .D(n667), .CLK(clk), .R(n800), .S(1'b1), .Q(
        \ahb_reg[11][2] ) );
  DFFSR \ahb_reg_reg[11][3]  ( .D(n666), .CLK(clk), .R(n800), .S(1'b1), .Q(
        \ahb_reg[11][3] ) );
  DFFSR \ahb_reg_reg[11][4]  ( .D(n665), .CLK(clk), .R(n800), .S(1'b1), .Q(
        \ahb_reg[11][4] ) );
  DFFSR \ahb_reg_reg[11][5]  ( .D(n664), .CLK(clk), .R(n800), .S(1'b1), .Q(
        \ahb_reg[11][5] ) );
  DFFSR \ahb_reg_reg[11][6]  ( .D(n663), .CLK(clk), .R(n800), .S(1'b1), .Q(
        \ahb_reg[11][6] ) );
  DFFSR \ahb_reg_reg[11][7]  ( .D(n662), .CLK(clk), .R(n800), .S(1'b1), .Q(
        \ahb_reg[11][7] ) );
  DFFSR \ahb_reg_reg[13][0]  ( .D(n653), .CLK(clk), .R(n799), .S(1'b1), .Q(
        \ahb_reg[13][0] ) );
  DFFSR \ahb_reg_reg[13][1]  ( .D(n652), .CLK(clk), .R(n799), .S(1'b1), .Q(
        \ahb_reg[13][1] ) );
  DFFSR \ahb_reg_reg[13][2]  ( .D(n651), .CLK(clk), .R(n799), .S(1'b1), .Q(
        \ahb_reg[13][2] ) );
  DFFSR \ahb_reg_reg[13][3]  ( .D(n650), .CLK(clk), .R(n799), .S(1'b1), .Q(
        \ahb_reg[13][3] ) );
  DFFSR \ahb_reg_reg[13][4]  ( .D(n649), .CLK(clk), .R(n799), .S(1'b1), .Q(
        \ahb_reg[13][4] ) );
  DFFSR \ahb_reg_reg[13][5]  ( .D(n648), .CLK(clk), .R(n799), .S(1'b1), .Q(
        \ahb_reg[13][5] ) );
  DFFSR \ahb_reg_reg[13][6]  ( .D(n647), .CLK(clk), .R(n799), .S(1'b1), .Q(
        \ahb_reg[13][6] ) );
  DFFSR \ahb_reg_reg[13][7]  ( .D(n646), .CLK(clk), .R(n799), .S(1'b1), .Q(
        \ahb_reg[13][7] ) );
  DFFSR \ahb_reg_reg[1][7]  ( .D(\next_ahb_reg[1][7] ), .CLK(clk), .R(n799), 
        .S(1'b1), .Q(\ahb_reg[1][7] ) );
  DFFSR \ahb_reg_reg[1][6]  ( .D(\next_ahb_reg[1][6] ), .CLK(clk), .R(n799), 
        .S(1'b1), .Q(\ahb_reg[1][6] ) );
  DFFSR \ahb_reg_reg[1][5]  ( .D(\next_ahb_reg[1][5] ), .CLK(clk), .R(n799), 
        .S(1'b1), .Q(\ahb_reg[1][5] ) );
  DFFSR \ahb_reg_reg[1][4]  ( .D(\next_ahb_reg[1][4] ), .CLK(clk), .R(n799), 
        .S(1'b1), .Q(\ahb_reg[1][4] ) );
  DFFSR \ahb_reg_reg[1][3]  ( .D(\next_ahb_reg[1][3] ), .CLK(clk), .R(n798), 
        .S(1'b1), .Q(\ahb_reg[1][3] ) );
  DFFSR \ahb_reg_reg[1][2]  ( .D(\next_ahb_reg[1][2] ), .CLK(clk), .R(n798), 
        .S(1'b1), .Q(\ahb_reg[1][2] ) );
  DFFSR \ahb_reg_reg[1][1]  ( .D(\next_ahb_reg[1][1] ), .CLK(clk), .R(n798), 
        .S(1'b1), .Q(\ahb_reg[1][1] ) );
  DFFSR \ahb_reg_reg[1][0]  ( .D(\next_ahb_reg[1][0] ), .CLK(clk), .R(n798), 
        .S(1'b1), .Q(\ahb_reg[1][0] ) );
  DFFSR \ahb_reg_reg[3][7]  ( .D(\next_ahb_reg[3][7] ), .CLK(clk), .R(n798), 
        .S(1'b1), .Q(\ahb_reg[3][7] ) );
  DFFSR \ahb_reg_reg[3][6]  ( .D(\next_ahb_reg[3][6] ), .CLK(clk), .R(n798), 
        .S(1'b1), .Q(\ahb_reg[3][6] ) );
  DFFSR \ahb_reg_reg[3][5]  ( .D(\next_ahb_reg[3][5] ), .CLK(clk), .R(n798), 
        .S(1'b1), .Q(\ahb_reg[3][5] ) );
  DFFSR \ahb_reg_reg[3][4]  ( .D(\next_ahb_reg[3][4] ), .CLK(clk), .R(n798), 
        .S(1'b1), .Q(\ahb_reg[3][4] ) );
  DFFSR \ahb_reg_reg[3][3]  ( .D(\next_ahb_reg[3][3] ), .CLK(clk), .R(n798), 
        .S(1'b1), .Q(\ahb_reg[3][3] ) );
  DFFSR \ahb_reg_reg[3][2]  ( .D(\next_ahb_reg[3][2] ), .CLK(clk), .R(n798), 
        .S(1'b1), .Q(\ahb_reg[3][2] ) );
  DFFSR \ahb_reg_reg[3][1]  ( .D(\next_ahb_reg[3][1] ), .CLK(clk), .R(n798), 
        .S(1'b1), .Q(\ahb_reg[3][1] ) );
  DFFSR \ahb_reg_reg[3][0]  ( .D(\next_ahb_reg[3][0] ), .CLK(clk), .R(n798), 
        .S(1'b1), .Q(\ahb_reg[3][0] ) );
  AND2X2 U142 ( .A(n482), .B(n141), .Y(n474) );
  AND2X2 U143 ( .A(n887), .B(n859), .Y(n470) );
  AND2X2 U145 ( .A(n889), .B(n859), .Y(n512) );
  AND2X2 U147 ( .A(n890), .B(n859), .Y(n536) );
  AND2X2 U149 ( .A(n891), .B(n859), .Y(n559) );
  AND2X2 U151 ( .A(n886), .B(n859), .Y(n582) );
  AND2X2 U152 ( .A(n609), .B(n429), .Y(n495) );
  AND2X2 U153 ( .A(n609), .B(n432), .Y(n498) );
  AND2X2 U154 ( .A(n609), .B(n434), .Y(n500) );
  AND2X2 U155 ( .A(n609), .B(n436), .Y(n502) );
  AND2X2 U156 ( .A(n609), .B(n438), .Y(n504) );
  AND2X2 U157 ( .A(n609), .B(n440), .Y(n506) );
  AND2X2 U158 ( .A(n609), .B(n442), .Y(n508) );
  AND2X2 U160 ( .A(n859), .B(n797), .Y(n523) );
  AND2X2 U161 ( .A(n609), .B(n444), .Y(n510) );
  AND2X2 U162 ( .A(n859), .B(n849), .Y(n609) );
  AND2X2 U163 ( .A(n885), .B(n859), .Y(n605) );
  AND2X2 U164 ( .A(n953), .B(n621), .Y(hresp) );
  AND2X2 U165 ( .A(haddr[2]), .B(haddr[3]), .Y(n623) );
  AND2X2 U166 ( .A(n644), .B(n797), .Y(n626) );
  AND2X2 U167 ( .A(n644), .B(n849), .Y(n642) );
  NOR2X1 U453 ( .A(n956), .B(n423), .Y(next_state[1]) );
  NAND2X1 U454 ( .A(n953), .B(n954), .Y(n423) );
  NOR2X1 U455 ( .A(n424), .B(n425), .Y(next_state[0]) );
  NAND2X1 U456 ( .A(n426), .B(n956), .Y(n425) );
  OAI21X1 U481 ( .A(n847), .B(n860), .C(n454), .Y(\next_ahb_reg[2][4] ) );
  AOI22X1 U482 ( .A(n846), .B(n436), .C(hwdata[4]), .D(n848), .Y(n454) );
  OAI21X1 U483 ( .A(n847), .B(n861), .C(n455), .Y(\next_ahb_reg[2][3] ) );
  AOI22X1 U484 ( .A(n846), .B(n438), .C(hwdata[3]), .D(n848), .Y(n455) );
  OAI21X1 U485 ( .A(n847), .B(n862), .C(n456), .Y(\next_ahb_reg[2][2] ) );
  AOI22X1 U486 ( .A(n846), .B(n440), .C(hwdata[2]), .D(n848), .Y(n456) );
  OAI21X1 U487 ( .A(n847), .B(n863), .C(n457), .Y(\next_ahb_reg[2][1] ) );
  AOI22X1 U488 ( .A(n846), .B(n442), .C(hwdata[1]), .D(n848), .Y(n457) );
  OAI21X1 U489 ( .A(n847), .B(n864), .C(n458), .Y(\next_ahb_reg[2][0] ) );
  AOI22X1 U490 ( .A(n846), .B(n444), .C(hwdata[0]), .D(n848), .Y(n458) );
  NAND3X1 U493 ( .A(n892), .B(n888), .C(N88), .Y(n449) );
  OAI22X1 U494 ( .A(n957), .B(n781), .C(n809), .D(n464), .Y(
        \next_ahb_reg[1][7] ) );
  OAI22X1 U495 ( .A(n958), .B(n780), .C(n895), .D(n464), .Y(
        \next_ahb_reg[1][6] ) );
  OAI22X1 U496 ( .A(n959), .B(n781), .C(n815), .D(n464), .Y(
        \next_ahb_reg[1][5] ) );
  OAI22X1 U497 ( .A(n960), .B(n780), .C(n894), .D(n464), .Y(
        \next_ahb_reg[1][4] ) );
  OAI22X1 U498 ( .A(n961), .B(n781), .C(n819), .D(n464), .Y(
        \next_ahb_reg[1][3] ) );
  OAI22X1 U499 ( .A(n962), .B(n780), .C(n893), .D(n464), .Y(
        \next_ahb_reg[1][2] ) );
  OAI22X1 U500 ( .A(n963), .B(n781), .C(n823), .D(n464), .Y(
        \next_ahb_reg[1][1] ) );
  OAI21X1 U501 ( .A(n964), .B(n781), .C(n465), .Y(\next_ahb_reg[1][0] ) );
  AOI22X1 U502 ( .A(n466), .B(err), .C(n875), .D(n444), .Y(n465) );
  NAND2X1 U503 ( .A(n467), .B(n141), .Y(n464) );
  NOR2X1 U505 ( .A(n471), .B(n896), .Y(n467) );
  OAI21X1 U506 ( .A(n852), .B(n472), .C(n473), .Y(\next_ahb_reg[14][7] ) );
  AOI22X1 U507 ( .A(\ahb_reg[14][7] ), .B(n850), .C(n474), .D(n429), .Y(n473)
         );
  OAI21X1 U508 ( .A(n853), .B(n472), .C(n475), .Y(\next_ahb_reg[14][6] ) );
  AOI22X1 U509 ( .A(\ahb_reg[14][6] ), .B(n850), .C(n474), .D(n432), .Y(n475)
         );
  OAI21X1 U510 ( .A(n854), .B(n472), .C(n476), .Y(\next_ahb_reg[14][5] ) );
  AOI22X1 U511 ( .A(\ahb_reg[14][5] ), .B(n850), .C(n474), .D(n434), .Y(n476)
         );
  OAI21X1 U512 ( .A(n855), .B(n472), .C(n477), .Y(\next_ahb_reg[14][4] ) );
  AOI22X1 U513 ( .A(\ahb_reg[14][4] ), .B(n850), .C(n474), .D(n436), .Y(n477)
         );
  OAI21X1 U514 ( .A(n856), .B(n472), .C(n478), .Y(\next_ahb_reg[14][3] ) );
  AOI22X1 U515 ( .A(\ahb_reg[14][3] ), .B(n850), .C(n474), .D(n438), .Y(n478)
         );
  OAI21X1 U516 ( .A(n857), .B(n472), .C(n479), .Y(\next_ahb_reg[14][2] ) );
  AOI22X1 U517 ( .A(\ahb_reg[14][2] ), .B(n850), .C(n474), .D(n440), .Y(n479)
         );
  OAI21X1 U518 ( .A(n858), .B(n472), .C(n480), .Y(\next_ahb_reg[14][1] ) );
  AOI22X1 U519 ( .A(\ahb_reg[14][1] ), .B(n850), .C(n474), .D(n442), .Y(n480)
         );
  OAI21X1 U522 ( .A(n484), .B(n485), .C(n486), .Y(n483) );
  NAND3X1 U523 ( .A(coefficient_num[1]), .B(coefficient_num[0]), .C(modwait), 
        .Y(n486) );
  OAI21X1 U524 ( .A(n482), .B(n797), .C(n859), .Y(n485) );
  NOR2X1 U525 ( .A(n484), .B(n793), .Y(n482) );
  NAND3X1 U527 ( .A(N89), .B(N88), .C(N90), .Y(n484) );
  OAI22X1 U528 ( .A(n852), .B(n780), .C(n809), .D(n487), .Y(
        \next_ahb_reg[0][7] ) );
  OAI22X1 U529 ( .A(n853), .B(n781), .C(n895), .D(n487), .Y(
        \next_ahb_reg[0][6] ) );
  OAI22X1 U530 ( .A(n854), .B(n780), .C(n815), .D(n487), .Y(
        \next_ahb_reg[0][5] ) );
  OAI22X1 U531 ( .A(n855), .B(n781), .C(n894), .D(n487), .Y(
        \next_ahb_reg[0][4] ) );
  OAI22X1 U532 ( .A(n856), .B(n780), .C(n819), .D(n487), .Y(
        \next_ahb_reg[0][3] ) );
  OAI22X1 U533 ( .A(n857), .B(n781), .C(n893), .D(n487), .Y(
        \next_ahb_reg[0][2] ) );
  OAI22X1 U534 ( .A(n858), .B(n780), .C(n823), .D(n487), .Y(
        \next_ahb_reg[0][1] ) );
  OAI21X1 U535 ( .A(n965), .B(n780), .C(n488), .Y(\next_ahb_reg[0][0] ) );
  NAND2X1 U537 ( .A(n490), .B(n141), .Y(n487) );
  NOR2X1 U541 ( .A(n471), .B(n794), .Y(n490) );
  NAND3X1 U544 ( .A(n892), .B(n888), .C(n753), .Y(n471) );
  OAI21X1 U545 ( .A(n874), .B(n206), .C(n493), .Y(n646) );
  AOI22X1 U546 ( .A(n779), .B(n495), .C(n791), .D(hwdata[15]), .Y(n493) );
  OAI21X1 U547 ( .A(n874), .B(n198), .C(n497), .Y(n647) );
  AOI22X1 U548 ( .A(n498), .B(n779), .C(n790), .D(hwdata[14]), .Y(n497) );
  OAI21X1 U549 ( .A(n874), .B(n190), .C(n499), .Y(n648) );
  AOI22X1 U550 ( .A(n500), .B(n779), .C(n791), .D(hwdata[13]), .Y(n499) );
  OAI21X1 U551 ( .A(n874), .B(n182), .C(n501), .Y(n649) );
  AOI22X1 U552 ( .A(n502), .B(n779), .C(n790), .D(hwdata[12]), .Y(n501) );
  OAI21X1 U553 ( .A(n874), .B(n174), .C(n503), .Y(n650) );
  AOI22X1 U554 ( .A(n504), .B(n779), .C(n791), .D(hwdata[11]), .Y(n503) );
  OAI21X1 U555 ( .A(n874), .B(n166), .C(n505), .Y(n651) );
  AOI22X1 U556 ( .A(n506), .B(n779), .C(n790), .D(hwdata[10]), .Y(n505) );
  OAI21X1 U557 ( .A(n874), .B(n158), .C(n507), .Y(n652) );
  AOI22X1 U558 ( .A(n508), .B(n779), .C(n791), .D(hwdata[9]), .Y(n507) );
  OAI21X1 U559 ( .A(n874), .B(n148), .C(n509), .Y(n653) );
  AOI22X1 U560 ( .A(n510), .B(n779), .C(n790), .D(hwdata[8]), .Y(n509) );
  OAI21X1 U561 ( .A(n779), .B(n797), .C(n512), .Y(n511) );
  NOR2X1 U562 ( .A(n513), .B(n896), .Y(n494) );
  OAI21X1 U563 ( .A(n873), .B(n932), .C(n514), .Y(n654) );
  AOI22X1 U564 ( .A(n778), .B(n495), .C(n791), .D(hwdata[7]), .Y(n514) );
  OAI21X1 U565 ( .A(n873), .B(n927), .C(n516), .Y(n655) );
  AOI22X1 U566 ( .A(n778), .B(n498), .C(n790), .D(hwdata[6]), .Y(n516) );
  OAI21X1 U567 ( .A(n873), .B(n922), .C(n517), .Y(n656) );
  AOI22X1 U568 ( .A(n778), .B(n500), .C(n791), .D(hwdata[5]), .Y(n517) );
  OAI21X1 U569 ( .A(n873), .B(n917), .C(n518), .Y(n657) );
  AOI22X1 U570 ( .A(n778), .B(n502), .C(n790), .D(hwdata[4]), .Y(n518) );
  OAI21X1 U571 ( .A(n873), .B(n912), .C(n519), .Y(n658) );
  AOI22X1 U572 ( .A(n778), .B(n504), .C(n791), .D(hwdata[3]), .Y(n519) );
  OAI21X1 U573 ( .A(n873), .B(n907), .C(n520), .Y(n659) );
  AOI22X1 U574 ( .A(n778), .B(n506), .C(n790), .D(hwdata[2]), .Y(n520) );
  OAI21X1 U575 ( .A(n873), .B(n902), .C(n521), .Y(n660) );
  AOI22X1 U576 ( .A(n778), .B(n508), .C(n791), .D(hwdata[1]), .Y(n521) );
  OAI21X1 U577 ( .A(n873), .B(n897), .C(n522), .Y(n661) );
  AOI22X1 U578 ( .A(n778), .B(n510), .C(n790), .D(hwdata[0]), .Y(n522) );
  OAI21X1 U579 ( .A(n778), .B(n797), .C(n512), .Y(n524) );
  NOR2X1 U580 ( .A(n513), .B(n793), .Y(n515) );
  NAND3X1 U581 ( .A(N89), .B(n753), .C(N90), .Y(n513) );
  OAI21X1 U582 ( .A(n872), .B(n210), .C(n525), .Y(n662) );
  AOI22X1 U583 ( .A(n776), .B(n495), .C(n789), .D(hwdata[15]), .Y(n525) );
  OAI21X1 U584 ( .A(n872), .B(n202), .C(n528), .Y(n663) );
  AOI22X1 U585 ( .A(n776), .B(n498), .C(n788), .D(hwdata[14]), .Y(n528) );
  OAI21X1 U586 ( .A(n872), .B(n194), .C(n529), .Y(n664) );
  AOI22X1 U587 ( .A(n776), .B(n500), .C(n789), .D(hwdata[13]), .Y(n529) );
  OAI21X1 U588 ( .A(n872), .B(n186), .C(n530), .Y(n665) );
  AOI22X1 U589 ( .A(n776), .B(n502), .C(n788), .D(hwdata[12]), .Y(n530) );
  OAI21X1 U590 ( .A(n872), .B(n178), .C(n531), .Y(n666) );
  AOI22X1 U591 ( .A(n776), .B(n504), .C(n789), .D(hwdata[11]), .Y(n531) );
  OAI21X1 U592 ( .A(n872), .B(n170), .C(n532), .Y(n667) );
  AOI22X1 U593 ( .A(n776), .B(n506), .C(n788), .D(hwdata[10]), .Y(n532) );
  OAI21X1 U594 ( .A(n872), .B(n162), .C(n533), .Y(n668) );
  AOI22X1 U595 ( .A(n776), .B(n508), .C(n789), .D(hwdata[9]), .Y(n533) );
  OAI21X1 U596 ( .A(n872), .B(n152), .C(n534), .Y(n669) );
  AOI22X1 U597 ( .A(n776), .B(n510), .C(n788), .D(hwdata[8]), .Y(n534) );
  OAI21X1 U598 ( .A(n776), .B(n797), .C(n536), .Y(n535) );
  NOR2X1 U599 ( .A(n537), .B(n896), .Y(n526) );
  OAI21X1 U600 ( .A(n871), .B(n933), .C(n538), .Y(n670) );
  AOI22X1 U601 ( .A(n775), .B(n495), .C(n789), .D(hwdata[7]), .Y(n538) );
  OAI21X1 U602 ( .A(n871), .B(n928), .C(n540), .Y(n671) );
  AOI22X1 U603 ( .A(n775), .B(n498), .C(n788), .D(hwdata[6]), .Y(n540) );
  OAI21X1 U604 ( .A(n871), .B(n923), .C(n541), .Y(n672) );
  AOI22X1 U605 ( .A(n775), .B(n500), .C(n789), .D(hwdata[5]), .Y(n541) );
  OAI21X1 U606 ( .A(n871), .B(n918), .C(n542), .Y(n673) );
  AOI22X1 U607 ( .A(n775), .B(n502), .C(n788), .D(hwdata[4]), .Y(n542) );
  OAI21X1 U608 ( .A(n871), .B(n913), .C(n543), .Y(n674) );
  AOI22X1 U609 ( .A(n775), .B(n504), .C(n789), .D(hwdata[3]), .Y(n543) );
  OAI21X1 U610 ( .A(n871), .B(n908), .C(n544), .Y(n675) );
  AOI22X1 U611 ( .A(n775), .B(n506), .C(n788), .D(hwdata[2]), .Y(n544) );
  OAI21X1 U612 ( .A(n871), .B(n903), .C(n545), .Y(n676) );
  AOI22X1 U613 ( .A(n775), .B(n508), .C(n789), .D(hwdata[1]), .Y(n545) );
  OAI21X1 U614 ( .A(n871), .B(n898), .C(n546), .Y(n677) );
  AOI22X1 U615 ( .A(n775), .B(n510), .C(n788), .D(hwdata[0]), .Y(n546) );
  OAI21X1 U616 ( .A(n775), .B(n797), .C(n536), .Y(n547) );
  NAND3X1 U618 ( .A(N88), .B(n892), .C(N90), .Y(n537) );
  OAI21X1 U619 ( .A(n870), .B(n212), .C(n548), .Y(n678) );
  AOI22X1 U620 ( .A(n774), .B(n495), .C(n787), .D(hwdata[15]), .Y(n548) );
  OAI21X1 U621 ( .A(n870), .B(n204), .C(n551), .Y(n679) );
  AOI22X1 U622 ( .A(n774), .B(n498), .C(n786), .D(hwdata[14]), .Y(n551) );
  OAI21X1 U623 ( .A(n870), .B(n196), .C(n552), .Y(n680) );
  AOI22X1 U624 ( .A(n774), .B(n500), .C(n787), .D(hwdata[13]), .Y(n552) );
  OAI21X1 U625 ( .A(n870), .B(n188), .C(n553), .Y(n681) );
  AOI22X1 U626 ( .A(n774), .B(n502), .C(n786), .D(hwdata[12]), .Y(n553) );
  OAI21X1 U627 ( .A(n870), .B(n180), .C(n554), .Y(n682) );
  AOI22X1 U628 ( .A(n774), .B(n504), .C(n787), .D(hwdata[11]), .Y(n554) );
  OAI21X1 U629 ( .A(n870), .B(n172), .C(n555), .Y(n683) );
  AOI22X1 U630 ( .A(n774), .B(n506), .C(n786), .D(hwdata[10]), .Y(n555) );
  OAI21X1 U631 ( .A(n870), .B(n164), .C(n556), .Y(n684) );
  AOI22X1 U632 ( .A(n774), .B(n508), .C(n787), .D(hwdata[9]), .Y(n556) );
  OAI21X1 U633 ( .A(n870), .B(n156), .C(n557), .Y(n685) );
  AOI22X1 U634 ( .A(n774), .B(n510), .C(n786), .D(hwdata[8]), .Y(n557) );
  OAI21X1 U635 ( .A(n774), .B(n797), .C(n559), .Y(n558) );
  NOR2X1 U636 ( .A(n560), .B(n896), .Y(n549) );
  OAI21X1 U637 ( .A(n869), .B(n934), .C(n561), .Y(n686) );
  AOI22X1 U638 ( .A(n773), .B(n495), .C(n787), .D(hwdata[7]), .Y(n561) );
  OAI21X1 U639 ( .A(n869), .B(n929), .C(n563), .Y(n687) );
  AOI22X1 U640 ( .A(n773), .B(n498), .C(n786), .D(hwdata[6]), .Y(n563) );
  OAI21X1 U641 ( .A(n869), .B(n924), .C(n564), .Y(n688) );
  AOI22X1 U642 ( .A(n773), .B(n500), .C(n787), .D(hwdata[5]), .Y(n564) );
  OAI21X1 U643 ( .A(n869), .B(n919), .C(n565), .Y(n689) );
  AOI22X1 U644 ( .A(n773), .B(n502), .C(n786), .D(hwdata[4]), .Y(n565) );
  OAI21X1 U645 ( .A(n869), .B(n914), .C(n566), .Y(n690) );
  AOI22X1 U646 ( .A(n773), .B(n504), .C(n787), .D(hwdata[3]), .Y(n566) );
  OAI21X1 U647 ( .A(n869), .B(n909), .C(n567), .Y(n691) );
  AOI22X1 U648 ( .A(n773), .B(n506), .C(n786), .D(hwdata[2]), .Y(n567) );
  OAI21X1 U649 ( .A(n869), .B(n904), .C(n568), .Y(n692) );
  AOI22X1 U650 ( .A(n773), .B(n508), .C(n787), .D(hwdata[1]), .Y(n568) );
  OAI21X1 U651 ( .A(n869), .B(n899), .C(n569), .Y(n693) );
  AOI22X1 U652 ( .A(n773), .B(n510), .C(n786), .D(hwdata[0]), .Y(n569) );
  OAI21X1 U653 ( .A(n773), .B(n796), .C(n559), .Y(n570) );
  NOR2X1 U654 ( .A(n560), .B(n793), .Y(n562) );
  NAND3X1 U655 ( .A(n753), .B(n892), .C(N90), .Y(n560) );
  OAI21X1 U656 ( .A(n868), .B(n952), .C(n571), .Y(n694) );
  AOI22X1 U657 ( .A(n771), .B(n495), .C(n785), .D(hwdata[15]), .Y(n571) );
  OAI21X1 U658 ( .A(n868), .B(n951), .C(n574), .Y(n695) );
  AOI22X1 U659 ( .A(n771), .B(n498), .C(n784), .D(hwdata[14]), .Y(n574) );
  OAI21X1 U660 ( .A(n868), .B(n950), .C(n575), .Y(n696) );
  AOI22X1 U661 ( .A(n771), .B(n500), .C(n785), .D(hwdata[13]), .Y(n575) );
  OAI21X1 U662 ( .A(n868), .B(n949), .C(n576), .Y(n697) );
  AOI22X1 U663 ( .A(n771), .B(n502), .C(n784), .D(hwdata[12]), .Y(n576) );
  OAI21X1 U664 ( .A(n868), .B(n948), .C(n577), .Y(n698) );
  AOI22X1 U665 ( .A(n771), .B(n504), .C(n785), .D(hwdata[11]), .Y(n577) );
  OAI21X1 U666 ( .A(n868), .B(n947), .C(n578), .Y(n699) );
  AOI22X1 U667 ( .A(n771), .B(n506), .C(n784), .D(hwdata[10]), .Y(n578) );
  OAI21X1 U668 ( .A(n868), .B(n946), .C(n579), .Y(n700) );
  AOI22X1 U669 ( .A(n771), .B(n508), .C(n785), .D(hwdata[9]), .Y(n579) );
  OAI21X1 U670 ( .A(n868), .B(n945), .C(n580), .Y(n701) );
  AOI22X1 U671 ( .A(n771), .B(n510), .C(n784), .D(hwdata[8]), .Y(n580) );
  OAI21X1 U672 ( .A(n771), .B(n796), .C(n582), .Y(n581) );
  NOR2X1 U673 ( .A(n583), .B(n896), .Y(n572) );
  OAI21X1 U674 ( .A(n867), .B(n935), .C(n584), .Y(n702) );
  AOI22X1 U675 ( .A(n770), .B(n495), .C(n785), .D(hwdata[7]), .Y(n584) );
  OAI21X1 U676 ( .A(n867), .B(n930), .C(n586), .Y(n703) );
  AOI22X1 U677 ( .A(n770), .B(n498), .C(n784), .D(hwdata[6]), .Y(n586) );
  OAI21X1 U678 ( .A(n867), .B(n925), .C(n587), .Y(n704) );
  AOI22X1 U679 ( .A(n770), .B(n500), .C(n785), .D(hwdata[5]), .Y(n587) );
  OAI21X1 U680 ( .A(n867), .B(n920), .C(n588), .Y(n705) );
  AOI22X1 U681 ( .A(n770), .B(n502), .C(n784), .D(hwdata[4]), .Y(n588) );
  OAI21X1 U682 ( .A(n867), .B(n915), .C(n589), .Y(n706) );
  AOI22X1 U683 ( .A(n770), .B(n504), .C(n785), .D(hwdata[3]), .Y(n589) );
  OAI21X1 U684 ( .A(n867), .B(n910), .C(n590), .Y(n707) );
  AOI22X1 U685 ( .A(n770), .B(n506), .C(n784), .D(hwdata[2]), .Y(n590) );
  OAI21X1 U686 ( .A(n867), .B(n905), .C(n591), .Y(n708) );
  AOI22X1 U687 ( .A(n770), .B(n508), .C(n785), .D(hwdata[1]), .Y(n591) );
  OAI21X1 U688 ( .A(n867), .B(n900), .C(n592), .Y(n709) );
  AOI22X1 U689 ( .A(n770), .B(n510), .C(n784), .D(hwdata[0]), .Y(n592) );
  OAI21X1 U690 ( .A(n770), .B(n796), .C(n582), .Y(n593) );
  NAND3X1 U692 ( .A(N88), .B(n888), .C(N89), .Y(n583) );
  OAI21X1 U693 ( .A(n866), .B(n944), .C(n594), .Y(n710) );
  AOI22X1 U694 ( .A(n769), .B(n495), .C(n783), .D(hwdata[15]), .Y(n594) );
  OAI21X1 U695 ( .A(n866), .B(n943), .C(n597), .Y(n711) );
  AOI22X1 U696 ( .A(n769), .B(n498), .C(n782), .D(hwdata[14]), .Y(n597) );
  OAI21X1 U697 ( .A(n866), .B(n942), .C(n598), .Y(n712) );
  AOI22X1 U698 ( .A(n769), .B(n500), .C(n783), .D(hwdata[13]), .Y(n598) );
  OAI21X1 U699 ( .A(n866), .B(n941), .C(n599), .Y(n713) );
  AOI22X1 U700 ( .A(n769), .B(n502), .C(n782), .D(hwdata[12]), .Y(n599) );
  OAI21X1 U701 ( .A(n866), .B(n940), .C(n600), .Y(n714) );
  AOI22X1 U702 ( .A(n769), .B(n504), .C(n783), .D(hwdata[11]), .Y(n600) );
  OAI21X1 U703 ( .A(n866), .B(n939), .C(n601), .Y(n715) );
  AOI22X1 U704 ( .A(n769), .B(n506), .C(n782), .D(hwdata[10]), .Y(n601) );
  OAI21X1 U705 ( .A(n866), .B(n938), .C(n602), .Y(n716) );
  AOI22X1 U706 ( .A(n769), .B(n508), .C(n783), .D(hwdata[9]), .Y(n602) );
  OAI21X1 U707 ( .A(n866), .B(n937), .C(n603), .Y(n717) );
  AOI22X1 U708 ( .A(n769), .B(n510), .C(n782), .D(hwdata[8]), .Y(n603) );
  OAI21X1 U709 ( .A(n769), .B(n796), .C(n605), .Y(n604) );
  NOR2X1 U710 ( .A(n606), .B(n896), .Y(n595) );
  OAI21X1 U711 ( .A(n865), .B(n936), .C(n607), .Y(n718) );
  AOI22X1 U712 ( .A(n768), .B(n495), .C(n783), .D(hwdata[7]), .Y(n607) );
  OAI21X1 U714 ( .A(n865), .B(n931), .C(n610), .Y(n719) );
  AOI22X1 U715 ( .A(n768), .B(n498), .C(n782), .D(hwdata[6]), .Y(n610) );
  OAI21X1 U717 ( .A(n865), .B(n926), .C(n611), .Y(n720) );
  AOI22X1 U718 ( .A(n768), .B(n500), .C(n783), .D(hwdata[5]), .Y(n611) );
  OAI21X1 U720 ( .A(n865), .B(n921), .C(n612), .Y(n721) );
  AOI22X1 U721 ( .A(n768), .B(n502), .C(n782), .D(hwdata[4]), .Y(n612) );
  OAI21X1 U723 ( .A(n865), .B(n916), .C(n613), .Y(n722) );
  AOI22X1 U724 ( .A(n768), .B(n504), .C(n783), .D(hwdata[3]), .Y(n613) );
  OAI21X1 U726 ( .A(n865), .B(n911), .C(n614), .Y(n723) );
  AOI22X1 U727 ( .A(n768), .B(n506), .C(n782), .D(hwdata[2]), .Y(n614) );
  OAI21X1 U729 ( .A(n865), .B(n906), .C(n615), .Y(n724) );
  AOI22X1 U730 ( .A(n768), .B(n508), .C(n783), .D(hwdata[1]), .Y(n615) );
  OAI21X1 U732 ( .A(n865), .B(n901), .C(n616), .Y(n725) );
  AOI22X1 U733 ( .A(n768), .B(n510), .C(n782), .D(hwdata[0]), .Y(n616) );
  OAI21X1 U735 ( .A(n768), .B(n796), .C(n605), .Y(n618) );
  OAI21X1 U738 ( .A(modwait), .B(n619), .C(n620), .Y(n726) );
  NAND2X1 U739 ( .A(data_ready), .B(n619), .Y(n620) );
  AOI21X1 U740 ( .A(n859), .B(n885), .C(modwait), .Y(n619) );
  NAND3X1 U741 ( .A(n753), .B(n888), .C(N89), .Y(n606) );
  OAI21X1 U743 ( .A(n954), .B(n956), .C(n426), .Y(n621) );
  OAI21X1 U744 ( .A(haddr[3]), .B(haddr[2]), .C(n426), .Y(n622) );
  NAND3X1 U745 ( .A(haddr[1]), .B(haddr[0]), .C(n623), .Y(n426) );
  OAI21X1 U746 ( .A(htrans[0]), .B(htrans[1]), .C(hsel), .Y(n424) );
  OAI21X1 U747 ( .A(n624), .B(n878), .C(n625), .Y(hrdata[9]) );
  NAND2X1 U748 ( .A(N711), .B(n626), .Y(n625) );
  OAI21X1 U749 ( .A(n624), .B(n877), .C(n627), .Y(hrdata[8]) );
  NAND2X1 U750 ( .A(N712), .B(n626), .Y(n627) );
  OAI21X1 U751 ( .A(n628), .B(n884), .C(n629), .Y(hrdata[7]) );
  NAND2X1 U752 ( .A(N697), .B(n626), .Y(n629) );
  OAI21X1 U753 ( .A(n628), .B(n883), .C(n630), .Y(hrdata[6]) );
  NAND2X1 U754 ( .A(N698), .B(n626), .Y(n630) );
  OAI21X1 U755 ( .A(n628), .B(n882), .C(n631), .Y(hrdata[5]) );
  NAND2X1 U756 ( .A(N699), .B(n626), .Y(n631) );
  OAI21X1 U757 ( .A(n628), .B(n881), .C(n632), .Y(hrdata[4]) );
  NAND2X1 U758 ( .A(N700), .B(n626), .Y(n632) );
  OAI21X1 U759 ( .A(n628), .B(n880), .C(n633), .Y(hrdata[3]) );
  NAND2X1 U760 ( .A(N701), .B(n626), .Y(n633) );
  OAI21X1 U761 ( .A(n628), .B(n879), .C(n634), .Y(hrdata[2]) );
  NAND2X1 U762 ( .A(N702), .B(n626), .Y(n634) );
  OAI21X1 U763 ( .A(n878), .B(n628), .C(n635), .Y(hrdata[1]) );
  NAND2X1 U764 ( .A(N703), .B(n626), .Y(n635) );
  OAI21X1 U765 ( .A(n624), .B(n884), .C(n636), .Y(hrdata[15]) );
  NAND2X1 U766 ( .A(N705), .B(n626), .Y(n636) );
  OAI21X1 U767 ( .A(n624), .B(n883), .C(n637), .Y(hrdata[14]) );
  NAND2X1 U768 ( .A(N706), .B(n626), .Y(n637) );
  OAI21X1 U769 ( .A(n624), .B(n882), .C(n638), .Y(hrdata[13]) );
  NAND2X1 U770 ( .A(N707), .B(n626), .Y(n638) );
  OAI21X1 U771 ( .A(n624), .B(n881), .C(n639), .Y(hrdata[12]) );
  NAND2X1 U772 ( .A(N708), .B(n626), .Y(n639) );
  OAI21X1 U773 ( .A(n624), .B(n880), .C(n640), .Y(hrdata[11]) );
  NAND2X1 U774 ( .A(N709), .B(n626), .Y(n640) );
  OAI21X1 U775 ( .A(n624), .B(n879), .C(n641), .Y(hrdata[10]) );
  NAND2X1 U776 ( .A(N710), .B(n626), .Y(n641) );
  NAND2X1 U777 ( .A(n642), .B(haddr[0]), .Y(n624) );
  OAI21X1 U778 ( .A(n877), .B(n628), .C(n643), .Y(hrdata[0]) );
  NAND2X1 U779 ( .A(N704), .B(n626), .Y(n643) );
  NAND2X1 U781 ( .A(n642), .B(n955), .Y(n628) );
  INVX2 U66 ( .A(n146), .Y(n766) );
  INVX1 U132 ( .A(n888), .Y(n405) );
  INVX1 U133 ( .A(n888), .Y(n404) );
  INVX1 U135 ( .A(n888), .Y(n403) );
  INVX2 U136 ( .A(N88), .Y(n753) );
  AND2X2 U137 ( .A(n411), .B(n753), .Y(n1) );
  AND2X2 U138 ( .A(n408), .B(n753), .Y(n2) );
  OR2X2 U139 ( .A(n583), .B(n794), .Y(n3) );
  OR2X2 U140 ( .A(n537), .B(n794), .Y(n4) );
  OR2X2 U141 ( .A(n606), .B(n793), .Y(n5) );
  AND2X1 U144 ( .A(n145), .B(n833), .Y(n6) );
  AND2X2 U146 ( .A(n410), .B(n753), .Y(n135) );
  INVX1 U148 ( .A(n888), .Y(n764) );
  INVX1 U150 ( .A(n896), .Y(n402) );
  INVX1 U159 ( .A(n792), .Y(n794) );
  AND2X1 U168 ( .A(N87), .B(n271), .Y(n137) );
  AND2X1 U169 ( .A(n887), .B(n145), .Y(n138) );
  INVX2 U170 ( .A(n6), .Y(n767) );
  INVX4 U171 ( .A(n792), .Y(n793) );
  INVX1 U172 ( .A(n888), .Y(n765) );
  INVX2 U173 ( .A(n137), .Y(n219) );
  INVX2 U174 ( .A(n137), .Y(n218) );
  INVX2 U175 ( .A(n138), .Y(n781) );
  INVX2 U176 ( .A(n138), .Y(n780) );
  AND2X2 U177 ( .A(N87), .B(n271), .Y(n136) );
  INVX2 U178 ( .A(n139), .Y(n783) );
  INVX2 U179 ( .A(n139), .Y(n782) );
  INVX2 U180 ( .A(n144), .Y(n791) );
  INVX2 U181 ( .A(n144), .Y(n790) );
  INVX2 U182 ( .A(n140), .Y(n785) );
  INVX2 U183 ( .A(n140), .Y(n784) );
  INVX2 U184 ( .A(n142), .Y(n789) );
  INVX2 U185 ( .A(n142), .Y(n788) );
  INVX2 U186 ( .A(n143), .Y(n787) );
  INVX2 U187 ( .A(n143), .Y(n786) );
  NAND2X1 U188 ( .A(n885), .B(n523), .Y(n139) );
  NAND2X1 U189 ( .A(n886), .B(n523), .Y(n140) );
  INVX2 U190 ( .A(n793), .Y(n896) );
  AND2X2 U191 ( .A(n859), .B(n849), .Y(n141) );
  NAND2X1 U192 ( .A(n890), .B(n523), .Y(n142) );
  NAND2X1 U193 ( .A(n891), .B(n523), .Y(n143) );
  NAND2X1 U194 ( .A(n523), .B(n889), .Y(n144) );
  AND2X2 U195 ( .A(n797), .B(n859), .Y(n145) );
  BUFX2 U196 ( .A(n494), .Y(n779) );
  INVX2 U197 ( .A(n777), .Y(n778) );
  INVX1 U198 ( .A(n515), .Y(n777) );
  INVX2 U199 ( .A(n772), .Y(n773) );
  INVX1 U200 ( .A(n562), .Y(n772) );
  BUFX2 U201 ( .A(n572), .Y(n771) );
  BUFX2 U202 ( .A(n526), .Y(n776) );
  BUFX2 U203 ( .A(n595), .Y(n769) );
  INVX2 U204 ( .A(n491), .Y(n859) );
  BUFX2 U205 ( .A(n549), .Y(n774) );
  INVX2 U206 ( .A(n795), .Y(n796) );
  INVX2 U207 ( .A(n795), .Y(n797) );
  INVX2 U208 ( .A(n3), .Y(n770) );
  INVX2 U209 ( .A(n4), .Y(n775) );
  INVX2 U210 ( .A(n5), .Y(n768) );
  INVX2 U211 ( .A(N34), .Y(n792) );
  INVX2 U212 ( .A(\copy_hsize[0] ), .Y(n795) );
  INVX2 U213 ( .A(n409), .Y(n754) );
  BUFX2 U214 ( .A(n_rst), .Y(n798) );
  BUFX2 U215 ( .A(n_rst), .Y(n799) );
  BUFX2 U216 ( .A(n_rst), .Y(n800) );
  BUFX2 U217 ( .A(n_rst), .Y(n801) );
  BUFX2 U218 ( .A(n_rst), .Y(n802) );
  BUFX2 U219 ( .A(n_rst), .Y(n803) );
  BUFX2 U220 ( .A(n_rst), .Y(n804) );
  BUFX2 U221 ( .A(n_rst), .Y(n805) );
  BUFX2 U222 ( .A(n_rst), .Y(n806) );
  BUFX2 U223 ( .A(n_rst), .Y(n807) );
  BUFX2 U224 ( .A(n_rst), .Y(n808) );
  NAND2X1 U225 ( .A(N88), .B(n411), .Y(n146) );
  OAI21X1 U226 ( .A(n147), .B(n148), .C(n149), .Y(fir_coefficient[8]) );
  MUX2X1 U227 ( .B(n150), .A(n151), .S(n851), .Y(n149) );
  OAI21X1 U228 ( .A(n218), .B(n152), .C(n153), .Y(n151) );
  AOI22X1 U229 ( .A(\ahb_reg[7][0] ), .B(n154), .C(\ahb_reg[3][0] ), .D(n155), 
        .Y(n153) );
  INVX2 U230 ( .A(\ahb_reg[11][0] ), .Y(n152) );
  OAI21X1 U231 ( .A(n219), .B(n156), .C(n157), .Y(n150) );
  AOI22X1 U232 ( .A(sample_data[8]), .B(n154), .C(\ahb_reg[1][0] ), .D(n155), 
        .Y(n157) );
  INVX2 U233 ( .A(\ahb_reg[9][0] ), .Y(n156) );
  INVX2 U234 ( .A(\ahb_reg[13][0] ), .Y(n148) );
  OAI21X1 U235 ( .A(n147), .B(n158), .C(n159), .Y(fir_coefficient[9]) );
  MUX2X1 U236 ( .B(n160), .A(n161), .S(n851), .Y(n159) );
  OAI21X1 U237 ( .A(n218), .B(n162), .C(n163), .Y(n161) );
  AOI22X1 U238 ( .A(\ahb_reg[7][1] ), .B(n154), .C(\ahb_reg[3][1] ), .D(n155), 
        .Y(n163) );
  INVX2 U239 ( .A(\ahb_reg[11][1] ), .Y(n162) );
  OAI21X1 U240 ( .A(n219), .B(n164), .C(n165), .Y(n160) );
  AOI22X1 U241 ( .A(sample_data[9]), .B(n154), .C(\ahb_reg[1][1] ), .D(n155), 
        .Y(n165) );
  INVX2 U242 ( .A(\ahb_reg[9][1] ), .Y(n164) );
  INVX2 U243 ( .A(\ahb_reg[13][1] ), .Y(n158) );
  OAI21X1 U244 ( .A(n147), .B(n166), .C(n167), .Y(fir_coefficient[10]) );
  MUX2X1 U245 ( .B(n168), .A(n169), .S(n851), .Y(n167) );
  OAI21X1 U246 ( .A(n218), .B(n170), .C(n171), .Y(n169) );
  AOI22X1 U247 ( .A(\ahb_reg[7][2] ), .B(n154), .C(\ahb_reg[3][2] ), .D(n155), 
        .Y(n171) );
  INVX2 U248 ( .A(\ahb_reg[11][2] ), .Y(n170) );
  OAI21X1 U249 ( .A(n219), .B(n172), .C(n173), .Y(n168) );
  AOI22X1 U250 ( .A(sample_data[10]), .B(n154), .C(\ahb_reg[1][2] ), .D(n155), 
        .Y(n173) );
  INVX2 U251 ( .A(\ahb_reg[9][2] ), .Y(n172) );
  INVX2 U252 ( .A(\ahb_reg[13][2] ), .Y(n166) );
  OAI21X1 U253 ( .A(n147), .B(n174), .C(n175), .Y(fir_coefficient[11]) );
  MUX2X1 U254 ( .B(n176), .A(n177), .S(n851), .Y(n175) );
  OAI21X1 U255 ( .A(n218), .B(n178), .C(n179), .Y(n177) );
  AOI22X1 U256 ( .A(\ahb_reg[7][3] ), .B(n154), .C(\ahb_reg[3][3] ), .D(n155), 
        .Y(n179) );
  INVX2 U257 ( .A(\ahb_reg[11][3] ), .Y(n178) );
  OAI21X1 U258 ( .A(n219), .B(n180), .C(n181), .Y(n176) );
  AOI22X1 U259 ( .A(sample_data[11]), .B(n154), .C(\ahb_reg[1][3] ), .D(n155), 
        .Y(n181) );
  INVX2 U260 ( .A(\ahb_reg[9][3] ), .Y(n180) );
  INVX2 U261 ( .A(\ahb_reg[13][3] ), .Y(n174) );
  OAI21X1 U262 ( .A(n147), .B(n182), .C(n183), .Y(fir_coefficient[12]) );
  MUX2X1 U263 ( .B(n184), .A(n185), .S(n851), .Y(n183) );
  OAI21X1 U264 ( .A(n218), .B(n186), .C(n187), .Y(n185) );
  AOI22X1 U265 ( .A(\ahb_reg[7][4] ), .B(n154), .C(\ahb_reg[3][4] ), .D(n155), 
        .Y(n187) );
  INVX2 U266 ( .A(\ahb_reg[11][4] ), .Y(n186) );
  OAI21X1 U267 ( .A(n219), .B(n188), .C(n189), .Y(n184) );
  AOI22X1 U268 ( .A(sample_data[12]), .B(n154), .C(\ahb_reg[1][4] ), .D(n155), 
        .Y(n189) );
  INVX2 U269 ( .A(\ahb_reg[9][4] ), .Y(n188) );
  INVX2 U270 ( .A(\ahb_reg[13][4] ), .Y(n182) );
  OAI21X1 U271 ( .A(n147), .B(n190), .C(n191), .Y(fir_coefficient[13]) );
  MUX2X1 U272 ( .B(n192), .A(n193), .S(n851), .Y(n191) );
  OAI21X1 U273 ( .A(n218), .B(n194), .C(n195), .Y(n193) );
  AOI22X1 U274 ( .A(\ahb_reg[7][5] ), .B(n154), .C(\ahb_reg[3][5] ), .D(n155), 
        .Y(n195) );
  INVX2 U275 ( .A(\ahb_reg[11][5] ), .Y(n194) );
  OAI21X1 U276 ( .A(n219), .B(n196), .C(n197), .Y(n192) );
  AOI22X1 U277 ( .A(sample_data[13]), .B(n154), .C(\ahb_reg[1][5] ), .D(n155), 
        .Y(n197) );
  INVX2 U278 ( .A(\ahb_reg[9][5] ), .Y(n196) );
  INVX2 U279 ( .A(\ahb_reg[13][5] ), .Y(n190) );
  OAI21X1 U280 ( .A(n147), .B(n198), .C(n199), .Y(fir_coefficient[14]) );
  MUX2X1 U281 ( .B(n200), .A(n201), .S(n851), .Y(n199) );
  OAI21X1 U282 ( .A(n218), .B(n202), .C(n203), .Y(n201) );
  AOI22X1 U283 ( .A(\ahb_reg[7][6] ), .B(n154), .C(\ahb_reg[3][6] ), .D(n155), 
        .Y(n203) );
  INVX2 U284 ( .A(\ahb_reg[11][6] ), .Y(n202) );
  OAI21X1 U285 ( .A(n219), .B(n204), .C(n205), .Y(n200) );
  AOI22X1 U286 ( .A(sample_data[14]), .B(n154), .C(\ahb_reg[1][6] ), .D(n155), 
        .Y(n205) );
  INVX2 U287 ( .A(\ahb_reg[9][6] ), .Y(n204) );
  INVX2 U288 ( .A(\ahb_reg[13][6] ), .Y(n198) );
  OAI21X1 U289 ( .A(n147), .B(n206), .C(n207), .Y(fir_coefficient[15]) );
  MUX2X1 U290 ( .B(n208), .A(n209), .S(n851), .Y(n207) );
  OAI21X1 U291 ( .A(n218), .B(n210), .C(n211), .Y(n209) );
  AOI22X1 U292 ( .A(\ahb_reg[7][7] ), .B(n154), .C(\ahb_reg[3][7] ), .D(n155), 
        .Y(n211) );
  INVX2 U293 ( .A(\ahb_reg[11][7] ), .Y(n210) );
  OAI21X1 U294 ( .A(n219), .B(n212), .C(n213), .Y(n208) );
  AOI22X1 U295 ( .A(sample_data[15]), .B(n154), .C(\ahb_reg[1][7] ), .D(n155), 
        .Y(n213) );
  NAND2X1 U296 ( .A(n215), .B(n271), .Y(n214) );
  NAND2X1 U297 ( .A(N86), .B(n215), .Y(n216) );
  INVX2 U298 ( .A(N87), .Y(n215) );
  INVX2 U299 ( .A(\ahb_reg[9][7] ), .Y(n212) );
  INVX2 U300 ( .A(\ahb_reg[13][7] ), .Y(n206) );
  NAND3X1 U301 ( .A(N87), .B(N86), .C(n217), .Y(n147) );
  INVX2 U302 ( .A(n851), .Y(n217) );
  INVX4 U303 ( .A(n214), .Y(n155) );
  INVX4 U304 ( .A(n216), .Y(n154) );
  MUX2X1 U305 ( .B(n220), .A(n221), .S(n851), .Y(fir_coefficient[0]) );
  AND2X2 U306 ( .A(n222), .B(n223), .Y(n221) );
  AOI22X1 U307 ( .A(new_coefficient_set), .B(n224), .C(\ahb_reg[10][0] ), .D(
        n136), .Y(n223) );
  AOI22X1 U308 ( .A(\ahb_reg[6][0] ), .B(n225), .C(\ahb_reg[2][0] ), .D(n226), 
        .Y(n222) );
  AND2X2 U309 ( .A(n227), .B(n228), .Y(n220) );
  AOI22X1 U310 ( .A(\ahb_reg[12][0] ), .B(n224), .C(\ahb_reg[8][0] ), .D(n136), 
        .Y(n228) );
  AOI22X1 U311 ( .A(sample_data[0]), .B(n225), .C(\ahb_reg[0][0] ), .D(n226), 
        .Y(n227) );
  MUX2X1 U312 ( .B(n229), .A(n230), .S(n851), .Y(fir_coefficient[1]) );
  AND2X2 U313 ( .A(n231), .B(n232), .Y(n230) );
  AOI22X1 U314 ( .A(\ahb_reg[14][1] ), .B(n224), .C(\ahb_reg[10][1] ), .D(n136), .Y(n232) );
  AOI22X1 U315 ( .A(\ahb_reg[6][1] ), .B(n225), .C(\ahb_reg[2][1] ), .D(n226), 
        .Y(n231) );
  AND2X2 U316 ( .A(n233), .B(n234), .Y(n229) );
  AOI22X1 U317 ( .A(\ahb_reg[12][1] ), .B(n224), .C(\ahb_reg[8][1] ), .D(n136), 
        .Y(n234) );
  AOI22X1 U318 ( .A(sample_data[1]), .B(n225), .C(\ahb_reg[0][1] ), .D(n226), 
        .Y(n233) );
  MUX2X1 U319 ( .B(n235), .A(n236), .S(n851), .Y(fir_coefficient[2]) );
  AND2X2 U320 ( .A(n237), .B(n238), .Y(n236) );
  AOI22X1 U321 ( .A(\ahb_reg[14][2] ), .B(n224), .C(\ahb_reg[10][2] ), .D(n136), .Y(n238) );
  AOI22X1 U322 ( .A(\ahb_reg[6][2] ), .B(n225), .C(\ahb_reg[2][2] ), .D(n226), 
        .Y(n237) );
  AND2X2 U323 ( .A(n239), .B(n240), .Y(n235) );
  AOI22X1 U324 ( .A(\ahb_reg[12][2] ), .B(n224), .C(\ahb_reg[8][2] ), .D(n136), 
        .Y(n240) );
  AOI22X1 U325 ( .A(sample_data[2]), .B(n225), .C(\ahb_reg[0][2] ), .D(n226), 
        .Y(n239) );
  MUX2X1 U326 ( .B(n241), .A(n242), .S(n851), .Y(fir_coefficient[3]) );
  AND2X2 U327 ( .A(n243), .B(n244), .Y(n242) );
  AOI22X1 U328 ( .A(\ahb_reg[14][3] ), .B(n224), .C(\ahb_reg[10][3] ), .D(n136), .Y(n244) );
  AOI22X1 U329 ( .A(\ahb_reg[6][3] ), .B(n225), .C(\ahb_reg[2][3] ), .D(n226), 
        .Y(n243) );
  AND2X2 U330 ( .A(n245), .B(n246), .Y(n241) );
  AOI22X1 U331 ( .A(\ahb_reg[12][3] ), .B(n224), .C(\ahb_reg[8][3] ), .D(n136), 
        .Y(n246) );
  AOI22X1 U332 ( .A(sample_data[3]), .B(n225), .C(\ahb_reg[0][3] ), .D(n226), 
        .Y(n245) );
  MUX2X1 U333 ( .B(n247), .A(n248), .S(n851), .Y(fir_coefficient[4]) );
  AND2X2 U334 ( .A(n249), .B(n250), .Y(n248) );
  AOI22X1 U335 ( .A(\ahb_reg[14][4] ), .B(n224), .C(\ahb_reg[10][4] ), .D(n136), .Y(n250) );
  AOI22X1 U336 ( .A(\ahb_reg[6][4] ), .B(n225), .C(\ahb_reg[2][4] ), .D(n226), 
        .Y(n249) );
  AND2X2 U337 ( .A(n251), .B(n252), .Y(n247) );
  AOI22X1 U338 ( .A(\ahb_reg[12][4] ), .B(n224), .C(\ahb_reg[8][4] ), .D(n136), 
        .Y(n252) );
  AOI22X1 U339 ( .A(sample_data[4]), .B(n225), .C(\ahb_reg[0][4] ), .D(n226), 
        .Y(n251) );
  MUX2X1 U340 ( .B(n253), .A(n254), .S(n851), .Y(fir_coefficient[5]) );
  AND2X2 U341 ( .A(n255), .B(n256), .Y(n254) );
  AOI22X1 U342 ( .A(\ahb_reg[14][5] ), .B(n224), .C(\ahb_reg[10][5] ), .D(n136), .Y(n256) );
  AOI22X1 U343 ( .A(\ahb_reg[6][5] ), .B(n225), .C(\ahb_reg[2][5] ), .D(n226), 
        .Y(n255) );
  AND2X2 U344 ( .A(n257), .B(n258), .Y(n253) );
  AOI22X1 U345 ( .A(\ahb_reg[12][5] ), .B(n224), .C(\ahb_reg[8][5] ), .D(n136), 
        .Y(n258) );
  AOI22X1 U346 ( .A(sample_data[5]), .B(n225), .C(\ahb_reg[0][5] ), .D(n226), 
        .Y(n257) );
  MUX2X1 U347 ( .B(n259), .A(n260), .S(n851), .Y(fir_coefficient[6]) );
  AND2X2 U348 ( .A(n261), .B(n262), .Y(n260) );
  AOI22X1 U349 ( .A(\ahb_reg[14][6] ), .B(n224), .C(\ahb_reg[10][6] ), .D(n136), .Y(n262) );
  AOI22X1 U350 ( .A(\ahb_reg[6][6] ), .B(n225), .C(\ahb_reg[2][6] ), .D(n226), 
        .Y(n261) );
  AND2X2 U351 ( .A(n263), .B(n264), .Y(n259) );
  AOI22X1 U352 ( .A(\ahb_reg[12][6] ), .B(n224), .C(\ahb_reg[8][6] ), .D(n136), 
        .Y(n264) );
  AOI22X1 U353 ( .A(sample_data[6]), .B(n225), .C(\ahb_reg[0][6] ), .D(n226), 
        .Y(n263) );
  MUX2X1 U354 ( .B(n265), .A(n266), .S(n851), .Y(fir_coefficient[7]) );
  AND2X2 U355 ( .A(n267), .B(n268), .Y(n266) );
  AOI22X1 U356 ( .A(\ahb_reg[14][7] ), .B(n224), .C(\ahb_reg[10][7] ), .D(n136), .Y(n268) );
  AOI22X1 U357 ( .A(\ahb_reg[6][7] ), .B(n225), .C(\ahb_reg[2][7] ), .D(n226), 
        .Y(n267) );
  AND2X2 U358 ( .A(n269), .B(n270), .Y(n265) );
  AOI22X1 U359 ( .A(\ahb_reg[12][7] ), .B(n224), .C(\ahb_reg[8][7] ), .D(n136), 
        .Y(n270) );
  NAND2X1 U360 ( .A(N87), .B(N86), .Y(n272) );
  AOI22X1 U361 ( .A(sample_data[7]), .B(n225), .C(\ahb_reg[0][7] ), .D(n226), 
        .Y(n269) );
  NAND2X1 U362 ( .A(n274), .B(n271), .Y(n273) );
  INVX2 U363 ( .A(N86), .Y(n271) );
  NAND2X1 U364 ( .A(N86), .B(n274), .Y(n275) );
  INVX2 U365 ( .A(N87), .Y(n274) );
  INVX4 U366 ( .A(n272), .Y(n224) );
  INVX4 U367 ( .A(n273), .Y(n226) );
  INVX4 U368 ( .A(n275), .Y(n225) );
  NOR2X1 U369 ( .A(n753), .B(n402), .Y(n288) );
  NAND2X1 U370 ( .A(N89), .B(n288), .Y(n370) );
  NOR2X1 U371 ( .A(n888), .B(n370), .Y(n382) );
  NAND2X1 U372 ( .A(n288), .B(n892), .Y(n368) );
  NOR2X1 U373 ( .A(n896), .B(n753), .Y(n287) );
  NAND2X1 U374 ( .A(n287), .B(n892), .Y(n367) );
  OAI22X1 U375 ( .A(\ahb_reg[2][0] ), .B(n368), .C(\ahb_reg[3][0] ), .D(n367), 
        .Y(n277) );
  NAND2X1 U376 ( .A(n287), .B(N89), .Y(n369) );
  OAI22X1 U377 ( .A(\ahb_reg[6][0] ), .B(n370), .C(\ahb_reg[7][0] ), .D(n369), 
        .Y(n276) );
  NOR2X1 U378 ( .A(n277), .B(n276), .Y(n283) );
  NOR2X1 U379 ( .A(n892), .B(N88), .Y(n284) );
  NAND2X1 U380 ( .A(n284), .B(n896), .Y(n375) );
  NOR2X1 U381 ( .A(N88), .B(N89), .Y(n279) );
  AND2X1 U382 ( .A(n279), .B(n896), .Y(n373) );
  AOI21X1 U383 ( .A(n373), .B(n401), .C(n407), .Y(n278) );
  OAI21X1 U384 ( .A(sample_data[0]), .B(n375), .C(n278), .Y(n281) );
  NAND2X1 U385 ( .A(n284), .B(n402), .Y(n377) );
  NAND2X1 U386 ( .A(n279), .B(n402), .Y(n376) );
  OAI22X1 U387 ( .A(sample_data[8]), .B(n377), .C(\ahb_reg[1][0] ), .D(n376), 
        .Y(n280) );
  NOR2X1 U388 ( .A(n281), .B(n280), .Y(n282) );
  AOI22X1 U389 ( .A(new_coefficient_set), .B(n382), .C(n283), .D(n282), .Y(
        n294) );
  NOR2X1 U390 ( .A(n888), .B(N89), .Y(n289) );
  AND2X1 U391 ( .A(n289), .B(n753), .Y(n285) );
  AND2X1 U392 ( .A(n285), .B(n402), .Y(n384) );
  AND2X1 U393 ( .A(n764), .B(n284), .Y(n286) );
  AND2X1 U394 ( .A(n286), .B(n402), .Y(n383) );
  AOI22X1 U395 ( .A(\ahb_reg[9][0] ), .B(n384), .C(\ahb_reg[13][0] ), .D(n383), 
        .Y(n293) );
  AND2X1 U396 ( .A(n285), .B(n896), .Y(n386) );
  AND2X1 U397 ( .A(n286), .B(n896), .Y(n385) );
  AOI22X1 U398 ( .A(\ahb_reg[8][0] ), .B(n386), .C(\ahb_reg[12][0] ), .D(n385), 
        .Y(n291) );
  AND2X1 U399 ( .A(n289), .B(n287), .Y(n388) );
  AND2X1 U400 ( .A(n289), .B(n288), .Y(n387) );
  AOI22X1 U401 ( .A(\ahb_reg[11][0] ), .B(n388), .C(\ahb_reg[10][0] ), .D(n387), .Y(n290) );
  AND2X1 U402 ( .A(n291), .B(n290), .Y(n292) );
  NAND3X1 U403 ( .A(n294), .B(n293), .C(n292), .Y(N680) );
  OAI22X1 U404 ( .A(\ahb_reg[2][1] ), .B(n368), .C(\ahb_reg[3][1] ), .D(n367), 
        .Y(n296) );
  OAI22X1 U405 ( .A(\ahb_reg[6][1] ), .B(n370), .C(\ahb_reg[7][1] ), .D(n369), 
        .Y(n295) );
  NOR2X1 U406 ( .A(n296), .B(n295), .Y(n301) );
  AOI21X1 U407 ( .A(n373), .B(n400), .C(n406), .Y(n297) );
  OAI21X1 U408 ( .A(sample_data[1]), .B(n375), .C(n297), .Y(n299) );
  OAI22X1 U409 ( .A(sample_data[9]), .B(n377), .C(\ahb_reg[1][1] ), .D(n376), 
        .Y(n298) );
  NOR2X1 U410 ( .A(n299), .B(n298), .Y(n300) );
  AOI22X1 U411 ( .A(\ahb_reg[14][1] ), .B(n382), .C(n301), .D(n300), .Y(n306)
         );
  AOI22X1 U412 ( .A(\ahb_reg[9][1] ), .B(n384), .C(\ahb_reg[13][1] ), .D(n383), 
        .Y(n305) );
  AOI22X1 U413 ( .A(\ahb_reg[8][1] ), .B(n386), .C(\ahb_reg[12][1] ), .D(n385), 
        .Y(n303) );
  AOI22X1 U414 ( .A(\ahb_reg[11][1] ), .B(n388), .C(\ahb_reg[10][1] ), .D(n387), .Y(n302) );
  AND2X1 U415 ( .A(n303), .B(n302), .Y(n304) );
  NAND3X1 U416 ( .A(n306), .B(n305), .C(n304), .Y(N679) );
  OAI22X1 U417 ( .A(\ahb_reg[2][2] ), .B(n368), .C(\ahb_reg[3][2] ), .D(n367), 
        .Y(n308) );
  OAI22X1 U418 ( .A(\ahb_reg[6][2] ), .B(n370), .C(\ahb_reg[7][2] ), .D(n369), 
        .Y(n307) );
  NOR2X1 U419 ( .A(n308), .B(n307), .Y(n313) );
  AOI21X1 U420 ( .A(n373), .B(n399), .C(n405), .Y(n309) );
  OAI21X1 U421 ( .A(sample_data[2]), .B(n375), .C(n309), .Y(n311) );
  OAI22X1 U422 ( .A(sample_data[10]), .B(n377), .C(\ahb_reg[1][2] ), .D(n376), 
        .Y(n310) );
  NOR2X1 U423 ( .A(n311), .B(n310), .Y(n312) );
  AOI22X1 U424 ( .A(\ahb_reg[14][2] ), .B(n382), .C(n313), .D(n312), .Y(n318)
         );
  AOI22X1 U425 ( .A(\ahb_reg[9][2] ), .B(n384), .C(\ahb_reg[13][2] ), .D(n383), 
        .Y(n317) );
  AOI22X1 U426 ( .A(\ahb_reg[8][2] ), .B(n386), .C(\ahb_reg[12][2] ), .D(n385), 
        .Y(n315) );
  AOI22X1 U427 ( .A(\ahb_reg[11][2] ), .B(n388), .C(\ahb_reg[10][2] ), .D(n387), .Y(n314) );
  AND2X1 U428 ( .A(n315), .B(n314), .Y(n316) );
  NAND3X1 U429 ( .A(n318), .B(n317), .C(n316), .Y(N678) );
  OAI22X1 U430 ( .A(\ahb_reg[2][3] ), .B(n368), .C(\ahb_reg[3][3] ), .D(n367), 
        .Y(n320) );
  OAI22X1 U431 ( .A(\ahb_reg[6][3] ), .B(n370), .C(\ahb_reg[7][3] ), .D(n369), 
        .Y(n319) );
  NOR2X1 U432 ( .A(n320), .B(n319), .Y(n325) );
  AOI21X1 U433 ( .A(n373), .B(n398), .C(n405), .Y(n321) );
  OAI21X1 U434 ( .A(sample_data[3]), .B(n375), .C(n321), .Y(n323) );
  OAI22X1 U435 ( .A(sample_data[11]), .B(n377), .C(\ahb_reg[1][3] ), .D(n376), 
        .Y(n322) );
  NOR2X1 U436 ( .A(n323), .B(n322), .Y(n324) );
  AOI22X1 U437 ( .A(\ahb_reg[14][3] ), .B(n382), .C(n325), .D(n324), .Y(n330)
         );
  AOI22X1 U438 ( .A(\ahb_reg[9][3] ), .B(n384), .C(\ahb_reg[13][3] ), .D(n383), 
        .Y(n329) );
  AOI22X1 U439 ( .A(\ahb_reg[8][3] ), .B(n386), .C(\ahb_reg[12][3] ), .D(n385), 
        .Y(n327) );
  AOI22X1 U440 ( .A(\ahb_reg[11][3] ), .B(n388), .C(\ahb_reg[10][3] ), .D(n387), .Y(n326) );
  AND2X1 U441 ( .A(n327), .B(n326), .Y(n328) );
  NAND3X1 U442 ( .A(n330), .B(n329), .C(n328), .Y(N677) );
  OAI22X1 U443 ( .A(\ahb_reg[2][4] ), .B(n368), .C(\ahb_reg[3][4] ), .D(n367), 
        .Y(n332) );
  OAI22X1 U444 ( .A(\ahb_reg[6][4] ), .B(n370), .C(\ahb_reg[7][4] ), .D(n369), 
        .Y(n331) );
  NOR2X1 U445 ( .A(n332), .B(n331), .Y(n337) );
  AOI21X1 U446 ( .A(n373), .B(n397), .C(n404), .Y(n333) );
  OAI21X1 U447 ( .A(sample_data[4]), .B(n375), .C(n333), .Y(n335) );
  OAI22X1 U448 ( .A(sample_data[12]), .B(n377), .C(\ahb_reg[1][4] ), .D(n376), 
        .Y(n334) );
  NOR2X1 U449 ( .A(n335), .B(n334), .Y(n336) );
  AOI22X1 U450 ( .A(\ahb_reg[14][4] ), .B(n382), .C(n337), .D(n336), .Y(n342)
         );
  AOI22X1 U451 ( .A(\ahb_reg[9][4] ), .B(n384), .C(\ahb_reg[13][4] ), .D(n383), 
        .Y(n341) );
  AOI22X1 U452 ( .A(\ahb_reg[8][4] ), .B(n386), .C(\ahb_reg[12][4] ), .D(n385), 
        .Y(n339) );
  AOI22X1 U457 ( .A(\ahb_reg[11][4] ), .B(n388), .C(\ahb_reg[10][4] ), .D(n387), .Y(n338) );
  AND2X1 U458 ( .A(n339), .B(n338), .Y(n340) );
  NAND3X1 U459 ( .A(n342), .B(n341), .C(n340), .Y(N676) );
  OAI22X1 U460 ( .A(\ahb_reg[2][5] ), .B(n368), .C(\ahb_reg[3][5] ), .D(n367), 
        .Y(n344) );
  OAI22X1 U461 ( .A(\ahb_reg[6][5] ), .B(n370), .C(\ahb_reg[7][5] ), .D(n369), 
        .Y(n343) );
  NOR2X1 U462 ( .A(n344), .B(n343), .Y(n349) );
  AOI21X1 U463 ( .A(n373), .B(n396), .C(n404), .Y(n345) );
  OAI21X1 U464 ( .A(sample_data[5]), .B(n375), .C(n345), .Y(n347) );
  OAI22X1 U465 ( .A(sample_data[13]), .B(n377), .C(\ahb_reg[1][5] ), .D(n376), 
        .Y(n346) );
  NOR2X1 U466 ( .A(n347), .B(n346), .Y(n348) );
  AOI22X1 U467 ( .A(\ahb_reg[14][5] ), .B(n382), .C(n349), .D(n348), .Y(n354)
         );
  AOI22X1 U468 ( .A(\ahb_reg[9][5] ), .B(n384), .C(\ahb_reg[13][5] ), .D(n383), 
        .Y(n353) );
  AOI22X1 U469 ( .A(\ahb_reg[8][5] ), .B(n386), .C(\ahb_reg[12][5] ), .D(n385), 
        .Y(n351) );
  AOI22X1 U470 ( .A(\ahb_reg[11][5] ), .B(n388), .C(\ahb_reg[10][5] ), .D(n387), .Y(n350) );
  AND2X1 U471 ( .A(n351), .B(n350), .Y(n352) );
  NAND3X1 U472 ( .A(n354), .B(n353), .C(n352), .Y(N675) );
  OAI22X1 U473 ( .A(\ahb_reg[2][6] ), .B(n368), .C(\ahb_reg[3][6] ), .D(n367), 
        .Y(n356) );
  OAI22X1 U474 ( .A(\ahb_reg[6][6] ), .B(n370), .C(\ahb_reg[7][6] ), .D(n369), 
        .Y(n355) );
  NOR2X1 U475 ( .A(n356), .B(n355), .Y(n361) );
  AOI21X1 U476 ( .A(n373), .B(n395), .C(n403), .Y(n357) );
  OAI21X1 U477 ( .A(sample_data[6]), .B(n375), .C(n357), .Y(n359) );
  OAI22X1 U478 ( .A(sample_data[14]), .B(n377), .C(\ahb_reg[1][6] ), .D(n376), 
        .Y(n358) );
  NOR2X1 U479 ( .A(n359), .B(n358), .Y(n360) );
  AOI22X1 U480 ( .A(\ahb_reg[14][6] ), .B(n382), .C(n361), .D(n360), .Y(n366)
         );
  AOI22X1 U491 ( .A(\ahb_reg[9][6] ), .B(n384), .C(\ahb_reg[13][6] ), .D(n383), 
        .Y(n365) );
  AOI22X1 U492 ( .A(\ahb_reg[8][6] ), .B(n386), .C(\ahb_reg[12][6] ), .D(n385), 
        .Y(n363) );
  AOI22X1 U504 ( .A(\ahb_reg[11][6] ), .B(n388), .C(\ahb_reg[10][6] ), .D(n387), .Y(n362) );
  AND2X1 U520 ( .A(n363), .B(n362), .Y(n364) );
  NAND3X1 U521 ( .A(n366), .B(n365), .C(n364), .Y(N674) );
  OAI22X1 U526 ( .A(\ahb_reg[2][7] ), .B(n368), .C(\ahb_reg[3][7] ), .D(n367), 
        .Y(n372) );
  OAI22X1 U536 ( .A(\ahb_reg[6][7] ), .B(n370), .C(\ahb_reg[7][7] ), .D(n369), 
        .Y(n371) );
  NOR2X1 U538 ( .A(n372), .B(n371), .Y(n381) );
  AOI21X1 U539 ( .A(n373), .B(n394), .C(n403), .Y(n374) );
  OAI21X1 U540 ( .A(sample_data[7]), .B(n375), .C(n374), .Y(n379) );
  OAI22X1 U542 ( .A(sample_data[15]), .B(n377), .C(\ahb_reg[1][7] ), .D(n376), 
        .Y(n378) );
  NOR2X1 U543 ( .A(n379), .B(n378), .Y(n380) );
  AOI22X1 U617 ( .A(\ahb_reg[14][7] ), .B(n382), .C(n381), .D(n380), .Y(n393)
         );
  AOI22X1 U691 ( .A(\ahb_reg[9][7] ), .B(n384), .C(\ahb_reg[13][7] ), .D(n383), 
        .Y(n392) );
  AOI22X1 U713 ( .A(\ahb_reg[8][7] ), .B(n386), .C(\ahb_reg[12][7] ), .D(n385), 
        .Y(n390) );
  AOI22X1 U716 ( .A(\ahb_reg[11][7] ), .B(n388), .C(\ahb_reg[10][7] ), .D(n387), .Y(n389) );
  AND2X1 U719 ( .A(n390), .B(n389), .Y(n391) );
  NAND3X1 U722 ( .A(n393), .B(n392), .C(n391), .Y(N673) );
  INVX2 U725 ( .A(\ahb_reg[0][7] ), .Y(n394) );
  INVX2 U728 ( .A(\ahb_reg[0][6] ), .Y(n395) );
  INVX2 U731 ( .A(\ahb_reg[0][5] ), .Y(n396) );
  INVX2 U734 ( .A(\ahb_reg[0][4] ), .Y(n397) );
  INVX2 U736 ( .A(\ahb_reg[0][3] ), .Y(n398) );
  INVX2 U737 ( .A(\ahb_reg[0][2] ), .Y(n399) );
  INVX2 U742 ( .A(\ahb_reg[0][1] ), .Y(n400) );
  INVX2 U780 ( .A(\ahb_reg[0][0] ), .Y(n401) );
  INVX2 U782 ( .A(n888), .Y(n406) );
  INVX2 U783 ( .A(n888), .Y(n407) );
  NOR2X1 U784 ( .A(n888), .B(N89), .Y(n411) );
  NOR2X1 U785 ( .A(N89), .B(n765), .Y(n408) );
  AOI22X1 U786 ( .A(\ahb_reg[9][0] ), .B(n1), .C(\ahb_reg[3][0] ), .D(n747), 
        .Y(n415) );
  AND2X1 U787 ( .A(N89), .B(n888), .Y(n410) );
  AOI22X1 U788 ( .A(\ahb_reg[1][0] ), .B(n2), .C(sample_data[8]), .D(n135), 
        .Y(n414) );
  NAND3X1 U789 ( .A(N89), .B(n753), .C(n765), .Y(n409) );
  AOI22X1 U790 ( .A(\ahb_reg[7][0] ), .B(n746), .C(\ahb_reg[11][0] ), .D(n766), 
        .Y(n412) );
  AOI21X1 U791 ( .A(\ahb_reg[13][0] ), .B(n754), .C(n763), .Y(n413) );
  NAND3X1 U792 ( .A(n415), .B(n414), .C(n413), .Y(N712) );
  AOI22X1 U793 ( .A(\ahb_reg[9][1] ), .B(n1), .C(\ahb_reg[3][1] ), .D(n747), 
        .Y(n419) );
  AOI22X1 U794 ( .A(\ahb_reg[1][1] ), .B(n2), .C(sample_data[9]), .D(n135), 
        .Y(n418) );
  AOI22X1 U795 ( .A(\ahb_reg[7][1] ), .B(n746), .C(\ahb_reg[11][1] ), .D(n766), 
        .Y(n416) );
  AOI21X1 U796 ( .A(\ahb_reg[13][1] ), .B(n754), .C(n762), .Y(n417) );
  NAND3X1 U797 ( .A(n419), .B(n418), .C(n417), .Y(N711) );
  AOI22X1 U798 ( .A(\ahb_reg[9][2] ), .B(n1), .C(\ahb_reg[3][2] ), .D(n747), 
        .Y(n427) );
  AOI22X1 U799 ( .A(\ahb_reg[1][2] ), .B(n2), .C(sample_data[10]), .D(n135), 
        .Y(n422) );
  AOI22X1 U800 ( .A(\ahb_reg[7][2] ), .B(n746), .C(\ahb_reg[11][2] ), .D(n766), 
        .Y(n420) );
  AOI21X1 U801 ( .A(\ahb_reg[13][2] ), .B(n754), .C(n761), .Y(n421) );
  NAND3X1 U802 ( .A(n427), .B(n422), .C(n421), .Y(N710) );
  AOI22X1 U803 ( .A(\ahb_reg[9][3] ), .B(n1), .C(\ahb_reg[3][3] ), .D(n747), 
        .Y(n433) );
  AOI22X1 U804 ( .A(\ahb_reg[1][3] ), .B(n2), .C(sample_data[11]), .D(n135), 
        .Y(n431) );
  AOI22X1 U805 ( .A(\ahb_reg[7][3] ), .B(n746), .C(\ahb_reg[11][3] ), .D(n766), 
        .Y(n428) );
  AOI21X1 U806 ( .A(\ahb_reg[13][3] ), .B(n754), .C(n760), .Y(n430) );
  NAND3X1 U807 ( .A(n433), .B(n431), .C(n430), .Y(N709) );
  AOI22X1 U808 ( .A(\ahb_reg[9][4] ), .B(n1), .C(\ahb_reg[3][4] ), .D(n747), 
        .Y(n441) );
  AOI22X1 U809 ( .A(\ahb_reg[1][4] ), .B(n2), .C(sample_data[12]), .D(n135), 
        .Y(n439) );
  AOI22X1 U810 ( .A(\ahb_reg[7][4] ), .B(n746), .C(\ahb_reg[11][4] ), .D(n766), 
        .Y(n435) );
  AOI21X1 U811 ( .A(\ahb_reg[13][4] ), .B(n754), .C(n759), .Y(n437) );
  NAND3X1 U812 ( .A(n441), .B(n439), .C(n437), .Y(N708) );
  AOI22X1 U813 ( .A(\ahb_reg[9][5] ), .B(n1), .C(\ahb_reg[3][5] ), .D(n747), 
        .Y(n447) );
  AOI22X1 U814 ( .A(\ahb_reg[1][5] ), .B(n2), .C(sample_data[13]), .D(n135), 
        .Y(n446) );
  AOI22X1 U815 ( .A(\ahb_reg[7][5] ), .B(n746), .C(\ahb_reg[11][5] ), .D(n766), 
        .Y(n443) );
  AOI21X1 U816 ( .A(\ahb_reg[13][5] ), .B(n754), .C(n758), .Y(n445) );
  NAND3X1 U817 ( .A(n447), .B(n446), .C(n445), .Y(N707) );
  AOI22X1 U818 ( .A(\ahb_reg[9][6] ), .B(n1), .C(\ahb_reg[3][6] ), .D(n747), 
        .Y(n452) );
  AOI22X1 U819 ( .A(\ahb_reg[1][6] ), .B(n2), .C(sample_data[14]), .D(n135), 
        .Y(n451) );
  AOI22X1 U820 ( .A(\ahb_reg[7][6] ), .B(n746), .C(\ahb_reg[11][6] ), .D(n766), 
        .Y(n448) );
  AOI21X1 U821 ( .A(\ahb_reg[13][6] ), .B(n754), .C(n757), .Y(n450) );
  NAND3X1 U822 ( .A(n452), .B(n451), .C(n450), .Y(N706) );
  AOI22X1 U823 ( .A(\ahb_reg[9][7] ), .B(n1), .C(\ahb_reg[3][7] ), .D(n747), 
        .Y(n461) );
  AOI22X1 U824 ( .A(\ahb_reg[1][7] ), .B(n2), .C(sample_data[15]), .D(n135), 
        .Y(n460) );
  AOI22X1 U825 ( .A(\ahb_reg[7][7] ), .B(n746), .C(\ahb_reg[11][7] ), .D(n766), 
        .Y(n453) );
  AOI21X1 U826 ( .A(\ahb_reg[13][7] ), .B(n754), .C(n756), .Y(n459) );
  NAND3X1 U827 ( .A(n461), .B(n460), .C(n459), .Y(N705) );
  AOI22X1 U828 ( .A(\ahb_reg[10][0] ), .B(n766), .C(\ahb_reg[12][0] ), .D(n754), .Y(n489) );
  AOI22X1 U829 ( .A(\ahb_reg[2][0] ), .B(n747), .C(\ahb_reg[6][0] ), .D(n746), 
        .Y(n481) );
  AOI22X1 U830 ( .A(sample_data[0]), .B(n135), .C(\ahb_reg[8][0] ), .D(n1), 
        .Y(n468) );
  NAND3X1 U831 ( .A(n764), .B(N89), .C(N88), .Y(n462) );
  AOI22X1 U832 ( .A(new_coefficient_set), .B(n755), .C(\ahb_reg[0][0] ), .D(n2), .Y(n463) );
  AND2X1 U833 ( .A(n468), .B(n463), .Y(n469) );
  NAND3X1 U834 ( .A(n489), .B(n481), .C(n469), .Y(N704) );
  AOI22X1 U835 ( .A(\ahb_reg[10][1] ), .B(n766), .C(\ahb_reg[12][1] ), .D(n754), .Y(n550) );
  AOI22X1 U836 ( .A(\ahb_reg[2][1] ), .B(n747), .C(\ahb_reg[6][1] ), .D(n746), 
        .Y(n539) );
  AOI22X1 U837 ( .A(sample_data[1]), .B(n135), .C(\ahb_reg[8][1] ), .D(n1), 
        .Y(n496) );
  AOI22X1 U838 ( .A(\ahb_reg[14][1] ), .B(n755), .C(\ahb_reg[0][1] ), .D(n2), 
        .Y(n492) );
  AND2X1 U839 ( .A(n496), .B(n492), .Y(n527) );
  NAND3X1 U840 ( .A(n550), .B(n539), .C(n527), .Y(N703) );
  AOI22X1 U841 ( .A(\ahb_reg[10][2] ), .B(n766), .C(\ahb_reg[12][2] ), .D(n754), .Y(n617) );
  AOI22X1 U842 ( .A(\ahb_reg[2][2] ), .B(n747), .C(\ahb_reg[6][2] ), .D(n746), 
        .Y(n608) );
  AOI22X1 U843 ( .A(sample_data[2]), .B(n135), .C(\ahb_reg[8][2] ), .D(n1), 
        .Y(n585) );
  AOI22X1 U844 ( .A(\ahb_reg[14][2] ), .B(n755), .C(\ahb_reg[0][2] ), .D(n2), 
        .Y(n573) );
  AND2X1 U845 ( .A(n585), .B(n573), .Y(n596) );
  NAND3X1 U846 ( .A(n617), .B(n608), .C(n596), .Y(N702) );
  AOI22X1 U847 ( .A(\ahb_reg[10][3] ), .B(n766), .C(\ahb_reg[12][3] ), .D(n754), .Y(n730) );
  AOI22X1 U848 ( .A(\ahb_reg[2][3] ), .B(n747), .C(\ahb_reg[6][3] ), .D(n746), 
        .Y(n729) );
  AOI22X1 U849 ( .A(sample_data[3]), .B(n135), .C(\ahb_reg[8][3] ), .D(n1), 
        .Y(n727) );
  AOI22X1 U850 ( .A(\ahb_reg[14][3] ), .B(n755), .C(\ahb_reg[0][3] ), .D(n2), 
        .Y(n645) );
  AND2X1 U851 ( .A(n727), .B(n645), .Y(n728) );
  NAND3X1 U852 ( .A(n730), .B(n729), .C(n728), .Y(N701) );
  AOI22X1 U853 ( .A(\ahb_reg[10][4] ), .B(n766), .C(\ahb_reg[12][4] ), .D(n754), .Y(n735) );
  AOI22X1 U854 ( .A(\ahb_reg[2][4] ), .B(n747), .C(\ahb_reg[6][4] ), .D(n746), 
        .Y(n734) );
  AOI22X1 U855 ( .A(sample_data[4]), .B(n135), .C(\ahb_reg[8][4] ), .D(n1), 
        .Y(n732) );
  AOI22X1 U856 ( .A(\ahb_reg[14][4] ), .B(n755), .C(\ahb_reg[0][4] ), .D(n2), 
        .Y(n731) );
  AND2X1 U857 ( .A(n732), .B(n731), .Y(n733) );
  NAND3X1 U858 ( .A(n735), .B(n734), .C(n733), .Y(N700) );
  AOI22X1 U859 ( .A(\ahb_reg[10][5] ), .B(n766), .C(\ahb_reg[12][5] ), .D(n754), .Y(n740) );
  AOI22X1 U860 ( .A(\ahb_reg[2][5] ), .B(n747), .C(\ahb_reg[6][5] ), .D(n746), 
        .Y(n739) );
  AOI22X1 U861 ( .A(sample_data[5]), .B(n135), .C(\ahb_reg[8][5] ), .D(n1), 
        .Y(n737) );
  AOI22X1 U862 ( .A(\ahb_reg[14][5] ), .B(n755), .C(\ahb_reg[0][5] ), .D(n2), 
        .Y(n736) );
  AND2X1 U863 ( .A(n737), .B(n736), .Y(n738) );
  NAND3X1 U864 ( .A(n740), .B(n739), .C(n738), .Y(N699) );
  AOI22X1 U865 ( .A(\ahb_reg[10][6] ), .B(n766), .C(\ahb_reg[12][6] ), .D(n754), .Y(n745) );
  AOI22X1 U866 ( .A(\ahb_reg[2][6] ), .B(n747), .C(\ahb_reg[6][6] ), .D(n746), 
        .Y(n744) );
  AOI22X1 U867 ( .A(sample_data[6]), .B(n135), .C(\ahb_reg[8][6] ), .D(n1), 
        .Y(n742) );
  AOI22X1 U868 ( .A(\ahb_reg[14][6] ), .B(n755), .C(\ahb_reg[0][6] ), .D(n2), 
        .Y(n741) );
  AND2X1 U869 ( .A(n742), .B(n741), .Y(n743) );
  NAND3X1 U870 ( .A(n745), .B(n744), .C(n743), .Y(N698) );
  AOI22X1 U871 ( .A(\ahb_reg[10][7] ), .B(n766), .C(\ahb_reg[12][7] ), .D(n754), .Y(n752) );
  AOI22X1 U872 ( .A(\ahb_reg[2][7] ), .B(n747), .C(\ahb_reg[6][7] ), .D(n746), 
        .Y(n751) );
  AOI22X1 U873 ( .A(sample_data[7]), .B(n135), .C(\ahb_reg[8][7] ), .D(n1), 
        .Y(n749) );
  AOI22X1 U874 ( .A(\ahb_reg[14][7] ), .B(n755), .C(\ahb_reg[0][7] ), .D(n2), 
        .Y(n748) );
  AND2X1 U875 ( .A(n749), .B(n748), .Y(n750) );
  NAND3X1 U876 ( .A(n752), .B(n751), .C(n750), .Y(N697) );
  INVX2 U877 ( .A(n462), .Y(n755) );
  INVX2 U878 ( .A(n453), .Y(n756) );
  INVX2 U879 ( .A(n448), .Y(n757) );
  INVX2 U880 ( .A(n443), .Y(n758) );
  INVX2 U881 ( .A(n435), .Y(n759) );
  INVX2 U882 ( .A(n428), .Y(n760) );
  INVX2 U883 ( .A(n420), .Y(n761) );
  INVX2 U884 ( .A(n416), .Y(n762) );
  INVX2 U885 ( .A(n412), .Y(n763) );
  AND2X2 U886 ( .A(n408), .B(N88), .Y(n747) );
  AND2X2 U887 ( .A(n410), .B(N88), .Y(n746) );
  MUX2X1 U888 ( .B(hwdata[7]), .A(hwdata[15]), .S(n793), .Y(n809) );
  INVX2 U889 ( .A(n809), .Y(n429) );
  INVX2 U890 ( .A(hwdata[15]), .Y(n957) );
  INVX2 U891 ( .A(n449), .Y(n833) );
  INVX2 U892 ( .A(n796), .Y(n849) );
  NAND3X1 U893 ( .A(n141), .B(n794), .C(n833), .Y(n810) );
  INVX2 U894 ( .A(n810), .Y(n826) );
  NOR2X1 U895 ( .A(n449), .B(n491), .Y(n811) );
  OAI21X1 U896 ( .A(n794), .B(n796), .C(n811), .Y(n825) );
  AOI22X1 U897 ( .A(n826), .B(n429), .C(fir_out[15]), .D(n825), .Y(n812) );
  OAI21X1 U898 ( .A(n957), .B(n767), .C(n812), .Y(\next_ahb_reg[3][7] ) );
  MUX2X1 U899 ( .B(hwdata[6]), .A(hwdata[14]), .S(n794), .Y(n813) );
  INVX2 U900 ( .A(n813), .Y(n432) );
  INVX2 U901 ( .A(hwdata[14]), .Y(n958) );
  AOI22X1 U902 ( .A(n826), .B(n432), .C(fir_out[14]), .D(n825), .Y(n814) );
  OAI21X1 U903 ( .A(n958), .B(n767), .C(n814), .Y(\next_ahb_reg[3][6] ) );
  MUX2X1 U904 ( .B(hwdata[5]), .A(hwdata[13]), .S(n793), .Y(n815) );
  INVX2 U905 ( .A(n815), .Y(n434) );
  INVX2 U906 ( .A(hwdata[13]), .Y(n959) );
  AOI22X1 U907 ( .A(n826), .B(n434), .C(fir_out[13]), .D(n825), .Y(n816) );
  OAI21X1 U908 ( .A(n959), .B(n767), .C(n816), .Y(\next_ahb_reg[3][5] ) );
  MUX2X1 U909 ( .B(hwdata[4]), .A(hwdata[12]), .S(n794), .Y(n817) );
  INVX2 U910 ( .A(n817), .Y(n436) );
  INVX2 U911 ( .A(hwdata[12]), .Y(n960) );
  AOI22X1 U912 ( .A(n826), .B(n436), .C(fir_out[12]), .D(n825), .Y(n818) );
  OAI21X1 U913 ( .A(n960), .B(n767), .C(n818), .Y(\next_ahb_reg[3][4] ) );
  MUX2X1 U914 ( .B(hwdata[3]), .A(hwdata[11]), .S(n793), .Y(n819) );
  INVX2 U915 ( .A(n819), .Y(n438) );
  INVX2 U916 ( .A(hwdata[11]), .Y(n961) );
  AOI22X1 U917 ( .A(n826), .B(n438), .C(fir_out[11]), .D(n825), .Y(n820) );
  OAI21X1 U918 ( .A(n961), .B(n767), .C(n820), .Y(\next_ahb_reg[3][3] ) );
  MUX2X1 U919 ( .B(hwdata[2]), .A(hwdata[10]), .S(n794), .Y(n821) );
  INVX2 U920 ( .A(n821), .Y(n440) );
  INVX2 U921 ( .A(hwdata[10]), .Y(n962) );
  AOI22X1 U922 ( .A(n826), .B(n440), .C(fir_out[10]), .D(n825), .Y(n822) );
  OAI21X1 U923 ( .A(n962), .B(n767), .C(n822), .Y(\next_ahb_reg[3][2] ) );
  MUX2X1 U924 ( .B(hwdata[1]), .A(hwdata[9]), .S(n793), .Y(n823) );
  INVX2 U925 ( .A(n823), .Y(n442) );
  INVX2 U926 ( .A(hwdata[9]), .Y(n963) );
  AOI22X1 U927 ( .A(n826), .B(n442), .C(fir_out[9]), .D(n825), .Y(n824) );
  OAI21X1 U928 ( .A(n963), .B(n767), .C(n824), .Y(\next_ahb_reg[3][1] ) );
  MUX2X1 U929 ( .B(hwdata[0]), .A(hwdata[8]), .S(n794), .Y(n840) );
  INVX2 U930 ( .A(n840), .Y(n444) );
  INVX2 U931 ( .A(hwdata[8]), .Y(n964) );
  AOI22X1 U932 ( .A(n826), .B(n444), .C(fir_out[8]), .D(n825), .Y(n827) );
  OAI21X1 U933 ( .A(n964), .B(n767), .C(n827), .Y(\next_ahb_reg[3][0] ) );
  INVX2 U934 ( .A(coefficient_num[0]), .Y(n851) );
  XOR2X1 U935 ( .A(n851), .B(coefficient_num[1]), .Y(N86) );
  NAND2X1 U936 ( .A(n851), .B(N86), .Y(N87) );
  INVX2 U937 ( .A(n484), .Y(n828) );
  NAND2X1 U938 ( .A(n145), .B(n828), .Y(n472) );
  INVX2 U939 ( .A(new_coefficient_set), .Y(n831) );
  INVX2 U940 ( .A(n472), .Y(n829) );
  AOI22X1 U941 ( .A(n829), .B(hwdata[0]), .C(n474), .D(n444), .Y(n830) );
  OAI21X1 U942 ( .A(n483), .B(n831), .C(n830), .Y(\next_ahb_reg[14][0] ) );
  INVX2 U943 ( .A(hwdata[7]), .Y(n852) );
  OAI21X1 U944 ( .A(n797), .B(n896), .C(n859), .Y(n832) );
  OR2X1 U945 ( .A(n449), .B(n832), .Y(n845) );
  NAND3X1 U946 ( .A(n141), .B(n896), .C(n833), .Y(n834) );
  INVX2 U947 ( .A(n834), .Y(n846) );
  AOI22X1 U948 ( .A(fir_out[7]), .B(n845), .C(n846), .D(n429), .Y(n835) );
  OAI21X1 U949 ( .A(n852), .B(n767), .C(n835), .Y(\next_ahb_reg[2][7] ) );
  INVX2 U950 ( .A(hwdata[6]), .Y(n853) );
  AOI22X1 U951 ( .A(fir_out[6]), .B(n845), .C(n846), .D(n432), .Y(n836) );
  OAI21X1 U952 ( .A(n853), .B(n767), .C(n836), .Y(\next_ahb_reg[2][6] ) );
  INVX2 U953 ( .A(hwdata[5]), .Y(n854) );
  AOI22X1 U954 ( .A(fir_out[5]), .B(n845), .C(n846), .D(n434), .Y(n837) );
  OAI21X1 U955 ( .A(n854), .B(n767), .C(n837), .Y(\next_ahb_reg[2][5] ) );
  INVX2 U956 ( .A(hwdata[0]), .Y(n965) );
  OAI21X1 U957 ( .A(n490), .B(n796), .C(n470), .Y(n838) );
  OAI21X1 U958 ( .A(modwait), .B(new_coefficient_set), .C(n838), .Y(n839) );
  OAI21X1 U959 ( .A(n487), .B(n840), .C(n839), .Y(n841) );
  INVX2 U960 ( .A(n841), .Y(n488) );
  INVX2 U961 ( .A(hwdata[1]), .Y(n858) );
  INVX2 U962 ( .A(hwdata[2]), .Y(n857) );
  INVX2 U963 ( .A(hwdata[3]), .Y(n856) );
  INVX2 U964 ( .A(hwdata[4]), .Y(n855) );
  INVX2 U965 ( .A(n483), .Y(n850) );
  OAI21X1 U966 ( .A(n467), .B(n796), .C(n470), .Y(n843) );
  INVX2 U967 ( .A(modwait), .Y(n842) );
  NAND2X1 U968 ( .A(n843), .B(n842), .Y(n844) );
  NOR2X1 U969 ( .A(new_coefficient_set), .B(n844), .Y(n466) );
  INVX2 U970 ( .A(n767), .Y(n848) );
  INVX2 U971 ( .A(n845), .Y(n847) );
  INVX2 U972 ( .A(fir_out[4]), .Y(n860) );
  INVX2 U973 ( .A(fir_out[3]), .Y(n861) );
  INVX2 U974 ( .A(fir_out[2]), .Y(n862) );
  INVX2 U975 ( .A(fir_out[1]), .Y(n863) );
  INVX2 U976 ( .A(fir_out[0]), .Y(n864) );
  INVX2 U977 ( .A(n618), .Y(n865) );
  INVX2 U978 ( .A(n604), .Y(n866) );
  INVX2 U979 ( .A(n593), .Y(n867) );
  INVX2 U980 ( .A(n581), .Y(n868) );
  INVX2 U981 ( .A(n570), .Y(n869) );
  INVX2 U982 ( .A(n558), .Y(n870) );
  INVX2 U983 ( .A(n547), .Y(n871) );
  INVX2 U984 ( .A(n535), .Y(n872) );
  INVX2 U985 ( .A(n524), .Y(n873) );
  INVX2 U986 ( .A(n511), .Y(n874) );
  INVX2 U987 ( .A(n464), .Y(n875) );
  INVX2 U988 ( .A(state[0]), .Y(n876) );
  INVX2 U989 ( .A(N680), .Y(n877) );
  INVX2 U990 ( .A(N679), .Y(n878) );
  INVX2 U991 ( .A(N678), .Y(n879) );
  INVX2 U992 ( .A(N677), .Y(n880) );
  INVX2 U993 ( .A(N676), .Y(n881) );
  INVX2 U994 ( .A(N675), .Y(n882) );
  INVX2 U995 ( .A(N674), .Y(n883) );
  INVX2 U996 ( .A(N673), .Y(n884) );
  INVX2 U997 ( .A(n606), .Y(n885) );
  INVX2 U998 ( .A(n583), .Y(n886) );
  INVX2 U999 ( .A(n471), .Y(n887) );
  INVX2 U1000 ( .A(N90), .Y(n888) );
  INVX2 U1001 ( .A(n513), .Y(n889) );
  INVX2 U1002 ( .A(n537), .Y(n890) );
  INVX2 U1003 ( .A(n560), .Y(n891) );
  INVX2 U1004 ( .A(N89), .Y(n892) );
  INVX2 U1005 ( .A(n440), .Y(n893) );
  INVX2 U1006 ( .A(n436), .Y(n894) );
  INVX2 U1007 ( .A(n432), .Y(n895) );
  INVX2 U1008 ( .A(\ahb_reg[12][0] ), .Y(n897) );
  INVX2 U1009 ( .A(\ahb_reg[10][0] ), .Y(n898) );
  INVX2 U1010 ( .A(\ahb_reg[8][0] ), .Y(n899) );
  INVX2 U1011 ( .A(\ahb_reg[6][0] ), .Y(n900) );
  INVX2 U1012 ( .A(sample_data[0]), .Y(n901) );
  INVX2 U1013 ( .A(\ahb_reg[12][1] ), .Y(n902) );
  INVX2 U1014 ( .A(\ahb_reg[10][1] ), .Y(n903) );
  INVX2 U1015 ( .A(\ahb_reg[8][1] ), .Y(n904) );
  INVX2 U1016 ( .A(\ahb_reg[6][1] ), .Y(n905) );
  INVX2 U1017 ( .A(sample_data[1]), .Y(n906) );
  INVX2 U1018 ( .A(\ahb_reg[12][2] ), .Y(n907) );
  INVX2 U1019 ( .A(\ahb_reg[10][2] ), .Y(n908) );
  INVX2 U1020 ( .A(\ahb_reg[8][2] ), .Y(n909) );
  INVX2 U1021 ( .A(\ahb_reg[6][2] ), .Y(n910) );
  INVX2 U1022 ( .A(sample_data[2]), .Y(n911) );
  INVX2 U1023 ( .A(\ahb_reg[12][3] ), .Y(n912) );
  INVX2 U1024 ( .A(\ahb_reg[10][3] ), .Y(n913) );
  INVX2 U1025 ( .A(\ahb_reg[8][3] ), .Y(n914) );
  INVX2 U1026 ( .A(\ahb_reg[6][3] ), .Y(n915) );
  INVX2 U1027 ( .A(sample_data[3]), .Y(n916) );
  INVX2 U1028 ( .A(\ahb_reg[12][4] ), .Y(n917) );
  INVX2 U1029 ( .A(\ahb_reg[10][4] ), .Y(n918) );
  INVX2 U1030 ( .A(\ahb_reg[8][4] ), .Y(n919) );
  INVX2 U1031 ( .A(\ahb_reg[6][4] ), .Y(n920) );
  INVX2 U1032 ( .A(sample_data[4]), .Y(n921) );
  INVX2 U1033 ( .A(\ahb_reg[12][5] ), .Y(n922) );
  INVX2 U1034 ( .A(\ahb_reg[10][5] ), .Y(n923) );
  INVX2 U1035 ( .A(\ahb_reg[8][5] ), .Y(n924) );
  INVX2 U1036 ( .A(\ahb_reg[6][5] ), .Y(n925) );
  INVX2 U1037 ( .A(sample_data[5]), .Y(n926) );
  INVX2 U1038 ( .A(\ahb_reg[12][6] ), .Y(n927) );
  INVX2 U1039 ( .A(\ahb_reg[10][6] ), .Y(n928) );
  INVX2 U1040 ( .A(\ahb_reg[8][6] ), .Y(n929) );
  INVX2 U1041 ( .A(\ahb_reg[6][6] ), .Y(n930) );
  INVX2 U1042 ( .A(sample_data[6]), .Y(n931) );
  INVX2 U1043 ( .A(\ahb_reg[12][7] ), .Y(n932) );
  INVX2 U1044 ( .A(\ahb_reg[10][7] ), .Y(n933) );
  INVX2 U1045 ( .A(\ahb_reg[8][7] ), .Y(n934) );
  INVX2 U1046 ( .A(\ahb_reg[6][7] ), .Y(n935) );
  INVX2 U1047 ( .A(sample_data[7]), .Y(n936) );
  INVX2 U1048 ( .A(sample_data[8]), .Y(n937) );
  INVX2 U1049 ( .A(sample_data[9]), .Y(n938) );
  INVX2 U1050 ( .A(sample_data[10]), .Y(n939) );
  INVX2 U1051 ( .A(sample_data[11]), .Y(n940) );
  INVX2 U1052 ( .A(sample_data[12]), .Y(n941) );
  INVX2 U1053 ( .A(sample_data[13]), .Y(n942) );
  INVX2 U1054 ( .A(sample_data[14]), .Y(n943) );
  INVX2 U1055 ( .A(sample_data[15]), .Y(n944) );
  INVX2 U1056 ( .A(\ahb_reg[7][0] ), .Y(n945) );
  INVX2 U1057 ( .A(\ahb_reg[7][1] ), .Y(n946) );
  INVX2 U1058 ( .A(\ahb_reg[7][2] ), .Y(n947) );
  INVX2 U1059 ( .A(\ahb_reg[7][3] ), .Y(n948) );
  INVX2 U1060 ( .A(\ahb_reg[7][4] ), .Y(n949) );
  INVX2 U1061 ( .A(\ahb_reg[7][5] ), .Y(n950) );
  INVX2 U1062 ( .A(\ahb_reg[7][6] ), .Y(n951) );
  INVX2 U1063 ( .A(\ahb_reg[7][7] ), .Y(n952) );
  INVX2 U1064 ( .A(n424), .Y(n953) );
  INVX2 U1065 ( .A(n622), .Y(n954) );
  INVX2 U1066 ( .A(haddr[0]), .Y(n955) );
  INVX2 U1067 ( .A(hwrite), .Y(n956) );
  NOR2X1 U1068 ( .A(state[1]), .B(n876), .Y(n644) );
  NAND2X1 U1069 ( .A(n876), .B(state[1]), .Y(n491) );
endmodule


module coefficient_loader ( clk, n_reset, new_coefficient_set, modwait, 
        load_coeff, coefficient_num );
  output [1:0] coefficient_num;
  input clk, n_reset, new_coefficient_set, modwait;
  output load_coeff;
  wire   n56, n57, n58, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15,
         n16, n17, n18, n19, n20, n21, n22, n23, n24;
  wire   [31:0] state;

  DFFSR \state_reg[0]  ( .D(n58), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        state[0]) );
  DFFSR \state_reg[1]  ( .D(n57), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        state[1]) );
  DFFSR \state_reg[2]  ( .D(n56), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        state[2]) );
  INVX2 U6 ( .A(modwait), .Y(n4) );
  NAND2X1 U7 ( .A(new_coefficient_set), .B(n4), .Y(n15) );
  INVX2 U8 ( .A(n15), .Y(load_coeff) );
  OAI21X1 U9 ( .A(state[1]), .B(state[0]), .C(state[2]), .Y(n5) );
  NAND2X1 U10 ( .A(load_coeff), .B(n5), .Y(n6) );
  INVX2 U11 ( .A(n6), .Y(n10) );
  INVX2 U12 ( .A(state[1]), .Y(n13) );
  INVX2 U13 ( .A(state[2]), .Y(n16) );
  NAND2X1 U14 ( .A(state[1]), .B(n16), .Y(n23) );
  NOR2X1 U15 ( .A(state[1]), .B(n6), .Y(n7) );
  MUX2X1 U16 ( .B(n19), .A(n7), .S(state[0]), .Y(n8) );
  OAI21X1 U17 ( .A(n10), .B(n13), .C(n8), .Y(n57) );
  NAND2X1 U18 ( .A(n10), .B(n16), .Y(n9) );
  MUX2X1 U19 ( .B(n9), .A(n10), .S(state[0]), .Y(n58) );
  NAND2X1 U20 ( .A(n19), .B(state[0]), .Y(n11) );
  MUX2X1 U21 ( .B(n16), .A(n11), .S(n10), .Y(n56) );
  INVX2 U22 ( .A(state[0]), .Y(n12) );
  NAND3X1 U23 ( .A(modwait), .B(new_coefficient_set), .C(n12), .Y(n18) );
  INVX2 U24 ( .A(n18), .Y(n14) );
  NAND3X1 U25 ( .A(state[2]), .B(n14), .C(n13), .Y(n22) );
  INVX2 U26 ( .A(n15), .Y(n17) );
  NAND3X1 U27 ( .A(n17), .B(state[0]), .C(n16), .Y(n21) );
  INVX2 U28 ( .A(n23), .Y(n19) );
  NAND2X1 U29 ( .A(n19), .B(n14), .Y(n20) );
  NAND3X1 U30 ( .A(n22), .B(n21), .C(n20), .Y(coefficient_num[0]) );
  AOI21X1 U31 ( .A(state[0]), .B(new_coefficient_set), .C(load_coeff), .Y(n24)
         );
  OAI21X1 U32 ( .A(n24), .B(n23), .C(n22), .Y(coefficient_num[1]) );
endmodule


module controller ( clk, n_rst, dr, lc, overflow, cnt_up, clear, modwait, op, 
        src1, src2, dest, err );
  output [2:0] op;
  output [3:0] src1;
  output [3:0] src2;
  output [3:0] dest;
  input clk, n_rst, dr, lc, overflow;
  output cnt_up, clear, modwait, err;
  wire   n200, next_modwait, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n30, n31,
         n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44, n45,
         n46, n47, n48, n49, n50, n51, n52, n53, n54, n55, n56, n58, n59, n60,
         n61, n62, n63, n65, n66, n67, n68, n69, n70, n71, n72, n74, n75, n76,
         n77, n78, n79, n80, n81, n82, n83, n84, n85, n86, n87, n88, n89, n90,
         n91, n92, n93, n94, n95, n96, n97, n98, n99, n100, n101, n102, n103,
         n104, n105, n106, n107, n108, n109, n110, n111, n112, n113, n114,
         n115, n116, n117, n118, n119, n120, n121, n122, n123, n124, n125,
         n126, n127, n128, n129, n130, n131, n132, n133, n134, n135, n136,
         n137, n138, n139, n140, n141, n142, n143, n144, n145, n146, n147,
         n148, n149, n150, n151, n152, n153, n154, n155, n156, n157, n158,
         n159, n160, n161, n162, n163, n164, n165, n166, n167, n168, n169,
         n170, n171, n172, n173, n174, n175, n176, n177, n178, n179, n180,
         n181, n182, n183, n184, n185, n186, n187, n188, n189, n190, n191,
         n192, n193, n194, n195, n197;
  wire   [4:0] state;
  wire   [4:0] next_state;
  assign src1[3] = 1'b0;

  DFFSR \state_reg[0]  ( .D(next_state[0]), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(state[0]) );
  DFFSR \state_reg[4]  ( .D(next_state[4]), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(state[4]) );
  DFFSR \state_reg[2]  ( .D(next_state[2]), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(state[2]) );
  DFFSR \state_reg[3]  ( .D(next_state[3]), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(state[3]) );
  DFFSR \state_reg[1]  ( .D(n197), .CLK(clk), .R(n_rst), .S(1'b1), .Q(state[1]) );
  DFFSR modwait_reg ( .D(next_modwait), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        modwait) );
  INVX1 U9 ( .A(n44), .Y(n7) );
  INVX1 U10 ( .A(n78), .Y(n37) );
  INVX2 U11 ( .A(overflow), .Y(n127) );
  INVX2 U12 ( .A(n15), .Y(n18) );
  INVX2 U13 ( .A(n136), .Y(n11) );
  INVX1 U14 ( .A(next_state[0]), .Y(n190) );
  INVX1 U15 ( .A(n7), .Y(n8) );
  INVX2 U16 ( .A(n69), .Y(n43) );
  INVX2 U17 ( .A(n101), .Y(n44) );
  INVX2 U18 ( .A(n17), .Y(n25) );
  INVX1 U19 ( .A(n71), .Y(n168) );
  NAND2X1 U20 ( .A(n42), .B(n8), .Y(n9) );
  INVX1 U21 ( .A(n119), .Y(n10) );
  AND2X1 U22 ( .A(n69), .B(n162), .Y(n66) );
  BUFX4 U23 ( .A(state[2]), .Y(n69) );
  NAND2X1 U24 ( .A(n51), .B(n42), .Y(n12) );
  AND2X2 U25 ( .A(n80), .B(n22), .Y(n42) );
  BUFX2 U26 ( .A(n105), .Y(n13) );
  BUFX2 U27 ( .A(n56), .Y(n14) );
  INVX1 U28 ( .A(n51), .Y(n15) );
  INVX2 U29 ( .A(n74), .Y(n19) );
  NOR2X1 U30 ( .A(n33), .B(n16), .Y(n61) );
  NAND2X1 U31 ( .A(n38), .B(n31), .Y(n16) );
  INVX2 U32 ( .A(n75), .Y(n33) );
  AND2X2 U33 ( .A(n21), .B(n65), .Y(err) );
  BUFX2 U34 ( .A(state[4]), .Y(n17) );
  BUFX2 U35 ( .A(state[4]), .Y(n68) );
  INVX1 U36 ( .A(n74), .Y(n75) );
  AND2X2 U37 ( .A(n69), .B(n162), .Y(n20) );
  INVX2 U38 ( .A(n78), .Y(n162) );
  NOR2X1 U39 ( .A(n168), .B(n14), .Y(n21) );
  INVX1 U40 ( .A(n69), .Y(n22) );
  INVX1 U41 ( .A(n69), .Y(n166) );
  INVX1 U42 ( .A(n20), .Y(n23) );
  BUFX2 U43 ( .A(n9), .Y(n24) );
  BUFX2 U44 ( .A(state[2]), .Y(n26) );
  BUFX2 U45 ( .A(n153), .Y(n27) );
  BUFX2 U46 ( .A(n20), .Y(n28) );
  INVX4 U47 ( .A(n46), .Y(src2[2]) );
  BUFX2 U48 ( .A(n70), .Y(n30) );
  INVX2 U49 ( .A(n70), .Y(n72) );
  INVX2 U50 ( .A(n71), .Y(n31) );
  BUFX2 U51 ( .A(n54), .Y(n32) );
  INVX2 U52 ( .A(n30), .Y(n34) );
  BUFX2 U53 ( .A(n31), .Y(n35) );
  BUFX2 U54 ( .A(n79), .Y(n36) );
  AND2X2 U55 ( .A(n19), .B(n72), .Y(n59) );
  BUFX2 U56 ( .A(n76), .Y(n54) );
  INVX4 U57 ( .A(n68), .Y(n38) );
  INVX2 U58 ( .A(n17), .Y(n167) );
  NOR2X1 U59 ( .A(n72), .B(n39), .Y(n169) );
  NAND2X1 U60 ( .A(n38), .B(n132), .Y(n39) );
  INVX2 U61 ( .A(n76), .Y(n132) );
  INVX2 U62 ( .A(n74), .Y(n76) );
  INVX1 U63 ( .A(n21), .Y(n138) );
  INVX2 U64 ( .A(n8), .Y(n40) );
  INVX1 U65 ( .A(n55), .Y(n41) );
  AND2X2 U66 ( .A(n80), .B(n26), .Y(n65) );
  INVX1 U67 ( .A(n150), .Y(n136) );
  NAND2X1 U68 ( .A(n51), .B(n60), .Y(n151) );
  INVX2 U69 ( .A(n91), .Y(n51) );
  NOR2X1 U70 ( .A(n168), .B(n56), .Y(n45) );
  AND2X2 U71 ( .A(n12), .B(n152), .Y(n46) );
  AND2X2 U72 ( .A(n35), .B(n62), .Y(n47) );
  INVX1 U73 ( .A(n47), .Y(n48) );
  INVX1 U74 ( .A(n48), .Y(n49) );
  INVX1 U75 ( .A(n167), .Y(n50) );
  BUFX2 U76 ( .A(n92), .Y(n52) );
  INVX1 U77 ( .A(n76), .Y(n53) );
  INVX4 U78 ( .A(n200), .Y(n92) );
  BUFX2 U79 ( .A(n72), .Y(n55) );
  NAND2X1 U80 ( .A(n38), .B(n19), .Y(n56) );
  AND2X2 U81 ( .A(n51), .B(n36), .Y(src2[0]) );
  INVX2 U82 ( .A(n70), .Y(n71) );
  INVX8 U83 ( .A(n92), .Y(src1[2]) );
  AND2X2 U84 ( .A(n111), .B(n100), .Y(n58) );
  AND2X2 U85 ( .A(n79), .B(n166), .Y(n60) );
  AND2X2 U86 ( .A(n19), .B(n38), .Y(n62) );
  AND2X2 U87 ( .A(n131), .B(n32), .Y(n63) );
  AND2X2 U88 ( .A(n35), .B(n50), .Y(n67) );
  INVX2 U89 ( .A(state[0]), .Y(n70) );
  INVX2 U90 ( .A(state[1]), .Y(n74) );
  INVX2 U91 ( .A(state[3]), .Y(n77) );
  INVX2 U92 ( .A(n77), .Y(n78) );
  INVX1 U93 ( .A(n77), .Y(n79) );
  INVX1 U94 ( .A(n77), .Y(n80) );
  INVX2 U95 ( .A(dr), .Y(n112) );
  NAND2X1 U96 ( .A(n112), .B(n41), .Y(n82) );
  NAND2X1 U97 ( .A(n37), .B(n22), .Y(n139) );
  INVX2 U98 ( .A(n139), .Y(n131) );
  NAND3X1 U99 ( .A(lc), .B(n131), .C(n53), .Y(n81) );
  NAND2X1 U100 ( .A(n63), .B(n67), .Y(n100) );
  OAI21X1 U101 ( .A(n82), .B(n81), .C(n100), .Y(n88) );
  NAND2X1 U102 ( .A(n72), .B(n50), .Y(n84) );
  INVX2 U103 ( .A(n84), .Y(n83) );
  NAND2X1 U104 ( .A(n83), .B(n63), .Y(n129) );
  OAI21X1 U105 ( .A(n131), .B(n28), .C(n53), .Y(n85) );
  OR2X1 U106 ( .A(n85), .B(n84), .Y(n93) );
  NAND2X1 U107 ( .A(n129), .B(n93), .Y(n110) );
  INVX2 U108 ( .A(n110), .Y(n86) );
  NAND3X1 U109 ( .A(n28), .B(n67), .C(n53), .Y(n148) );
  NAND3X1 U110 ( .A(n67), .B(n131), .C(n53), .Y(n195) );
  NAND3X1 U111 ( .A(n86), .B(n148), .C(n195), .Y(n87) );
  OR2X1 U112 ( .A(n88), .B(n87), .Y(next_state[4]) );
  NAND2X1 U113 ( .A(n25), .B(n31), .Y(n105) );
  NAND3X1 U114 ( .A(n19), .B(n37), .C(n26), .Y(n90) );
  NAND3X1 U115 ( .A(n167), .B(n72), .C(n66), .Y(n89) );
  OAI21X1 U116 ( .A(n105), .B(n90), .C(n89), .Y(n200) );
  NAND3X1 U117 ( .A(n71), .B(n33), .C(n25), .Y(n91) );
  NAND2X1 U118 ( .A(n18), .B(n131), .Y(n111) );
  NAND3X1 U119 ( .A(n132), .B(n38), .C(n30), .Y(n101) );
  NAND2X1 U120 ( .A(n60), .B(n44), .Y(n159) );
  NAND3X1 U121 ( .A(n24), .B(n52), .C(n58), .Y(n97) );
  NAND2X1 U122 ( .A(err), .B(n112), .Y(n122) );
  NAND3X1 U123 ( .A(n42), .B(n55), .C(n62), .Y(n118) );
  NAND2X1 U124 ( .A(n131), .B(n49), .Y(n178) );
  INVX2 U125 ( .A(n178), .Y(cnt_up) );
  MUX2X1 U126 ( .B(n129), .A(n93), .S(lc), .Y(n94) );
  NOR2X1 U127 ( .A(cnt_up), .B(n94), .Y(n95) );
  NAND3X1 U128 ( .A(n122), .B(n118), .C(n95), .Y(n96) );
  OR2X1 U129 ( .A(n97), .B(n96), .Y(n184) );
  INVX2 U130 ( .A(n184), .Y(n187) );
  NAND2X1 U131 ( .A(n18), .B(n36), .Y(n119) );
  NAND2X1 U132 ( .A(n65), .B(n47), .Y(n157) );
  NAND2X1 U133 ( .A(n61), .B(n60), .Y(n153) );
  NAND2X1 U134 ( .A(n27), .B(n157), .Y(n104) );
  INVX2 U135 ( .A(n104), .Y(n98) );
  NAND2X1 U136 ( .A(n65), .B(n44), .Y(n150) );
  NAND2X1 U137 ( .A(n98), .B(n11), .Y(n158) );
  OAI21X1 U138 ( .A(n10), .B(n158), .C(overflow), .Y(n99) );
  NAND2X1 U139 ( .A(n187), .B(n99), .Y(n197) );
  NAND2X1 U140 ( .A(n20), .B(n45), .Y(n152) );
  INVX2 U141 ( .A(lc), .Y(n128) );
  INVX2 U142 ( .A(n100), .Y(n103) );
  OAI21X1 U143 ( .A(n40), .B(n23), .C(n195), .Y(n102) );
  OR2X1 U144 ( .A(n103), .B(n102), .Y(n142) );
  NOR2X1 U145 ( .A(n104), .B(n142), .Y(n109) );
  NOR2X1 U146 ( .A(n13), .B(n36), .Y(n107) );
  NOR2X1 U147 ( .A(n53), .B(n43), .Y(n106) );
  NAND2X1 U148 ( .A(n107), .B(n106), .Y(n146) );
  AND2X2 U149 ( .A(n148), .B(n146), .Y(n108) );
  NAND3X1 U150 ( .A(n178), .B(n109), .C(n108), .Y(n174) );
  AOI21X1 U151 ( .A(n110), .B(n128), .C(n174), .Y(n117) );
  NAND2X1 U152 ( .A(dr), .B(n8), .Y(n114) );
  INVX2 U153 ( .A(n111), .Y(n113) );
  NAND2X1 U154 ( .A(n113), .B(n112), .Y(n123) );
  OAI21X1 U155 ( .A(n36), .B(n114), .C(n123), .Y(n115) );
  NOR2X1 U156 ( .A(err), .B(n115), .Y(n116) );
  NAND3X1 U157 ( .A(n24), .B(n117), .C(n116), .Y(n181) );
  INVX2 U158 ( .A(n181), .Y(n121) );
  OAI21X1 U159 ( .A(n43), .B(n119), .C(n118), .Y(n125) );
  INVX2 U160 ( .A(n125), .Y(n160) );
  INVX2 U161 ( .A(src2[2]), .Y(n180) );
  NAND2X1 U162 ( .A(n160), .B(n180), .Y(n143) );
  OAI21X1 U163 ( .A(n136), .B(n143), .C(overflow), .Y(n120) );
  NAND2X1 U164 ( .A(n121), .B(n120), .Y(next_state[0]) );
  NAND3X1 U165 ( .A(n24), .B(n180), .C(n27), .Y(n135) );
  INVX2 U166 ( .A(n135), .Y(n126) );
  NAND3X1 U167 ( .A(n157), .B(n123), .C(n122), .Y(n124) );
  NOR2X1 U168 ( .A(n125), .B(n124), .Y(n134) );
  NAND2X1 U169 ( .A(n126), .B(n134), .Y(n186) );
  INVX2 U170 ( .A(n186), .Y(n182) );
  OAI21X1 U171 ( .A(n127), .B(n11), .C(n182), .Y(next_state[3]) );
  OAI21X1 U172 ( .A(n129), .B(n128), .C(n138), .Y(n130) );
  AOI22X1 U173 ( .A(n28), .B(n53), .C(n131), .D(n130), .Y(n133) );
  NAND3X1 U174 ( .A(n134), .B(n146), .C(n133), .Y(n183) );
  INVX2 U175 ( .A(n183), .Y(n188) );
  OAI21X1 U176 ( .A(n136), .B(n135), .C(overflow), .Y(n137) );
  NAND2X1 U177 ( .A(n188), .B(n137), .Y(next_state[2]) );
  NAND2X1 U178 ( .A(n18), .B(n28), .Y(n144) );
  OAI21X1 U179 ( .A(n139), .B(n138), .C(n144), .Y(n141) );
  NAND3X1 U180 ( .A(n28), .B(n32), .C(n67), .Y(n149) );
  INVX2 U181 ( .A(n149), .Y(n140) );
  NOR2X1 U182 ( .A(n141), .B(n140), .Y(n175) );
  NAND2X1 U183 ( .A(n58), .B(n175), .Y(dest[0]) );
  INVX2 U184 ( .A(n142), .Y(n145) );
  INVX2 U185 ( .A(n143), .Y(n147) );
  NAND3X1 U186 ( .A(n145), .B(n144), .C(n147), .Y(dest[1]) );
  NAND3X1 U187 ( .A(n58), .B(n146), .C(n195), .Y(dest[2]) );
  NAND3X1 U188 ( .A(n149), .B(n148), .C(n147), .Y(dest[3]) );
  NAND2X1 U189 ( .A(n151), .B(n150), .Y(n155) );
  NAND3X1 U190 ( .A(n159), .B(n152), .C(n153), .Y(n154) );
  NOR2X1 U191 ( .A(n155), .B(n154), .Y(n156) );
  NAND2X1 U192 ( .A(n157), .B(n156), .Y(src2[1]) );
  INVX2 U193 ( .A(n158), .Y(n161) );
  NAND3X1 U194 ( .A(n160), .B(n9), .C(n161), .Y(src2[3]) );
  NAND3X1 U195 ( .A(n25), .B(n80), .C(n34), .Y(n165) );
  NAND2X1 U196 ( .A(n26), .B(n167), .Y(n164) );
  NAND2X1 U197 ( .A(n31), .B(n37), .Y(n163) );
  OAI22X1 U198 ( .A(n54), .B(n165), .C(n164), .D(n163), .Y(src1[0]) );
  NAND2X1 U199 ( .A(n43), .B(n79), .Y(n173) );
  NAND2X1 U200 ( .A(n72), .B(n167), .Y(n172) );
  NOR2X1 U201 ( .A(n17), .B(n26), .Y(n170) );
  AOI22X1 U202 ( .A(n170), .B(n59), .C(n169), .D(n20), .Y(n171) );
  OAI21X1 U203 ( .A(n173), .B(n172), .C(n171), .Y(src1[1]) );
  INVX2 U204 ( .A(n174), .Y(n176) );
  NAND2X1 U205 ( .A(n176), .B(n175), .Y(op[0]) );
  INVX2 U206 ( .A(dest[3]), .Y(n177) );
  NAND3X1 U207 ( .A(n58), .B(n177), .C(n195), .Y(op[1]) );
  INVX2 U208 ( .A(src2[3]), .Y(n179) );
  NAND3X1 U209 ( .A(n180), .B(n179), .C(n178), .Y(op[2]) );
  INVX2 U210 ( .A(next_state[4]), .Y(n189) );
  NAND3X1 U211 ( .A(n189), .B(n182), .C(n181), .Y(n194) );
  NAND2X1 U212 ( .A(n184), .B(n183), .Y(n185) );
  NAND3X1 U213 ( .A(n186), .B(n185), .C(n127), .Y(n193) );
  NAND3X1 U214 ( .A(n189), .B(n188), .C(n187), .Y(n191) );
  NAND2X1 U215 ( .A(n191), .B(n190), .Y(n192) );
  NAND3X1 U216 ( .A(n194), .B(n193), .C(n192), .Y(next_modwait) );
  INVX2 U217 ( .A(n195), .Y(clear) );
endmodule


module magnitude ( in, out );
  input [16:0] in;
  output [15:0] out;
  wire   N2, n37, n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14,
         n15, n16, n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28,
         n29, n30, n31, n32, n33, n34, n35, n36, n38, n39, n40, n41, n42, n59;
  assign N2 = in[0];

  AOI22X1 U37 ( .A(N2), .B(in[16]), .C(N2), .D(n59), .Y(n37) );
  XNOR2X1 U2 ( .A(in[14]), .B(n40), .Y(out[14]) );
  NOR2X1 U3 ( .A(N2), .B(in[1]), .Y(n1) );
  AND2X2 U4 ( .A(n1), .B(n16), .Y(n2) );
  AND2X2 U5 ( .A(n2), .B(n18), .Y(n3) );
  AND2X2 U6 ( .A(n10), .B(n26), .Y(n4) );
  AND2X2 U7 ( .A(n4), .B(n28), .Y(n5) );
  AND2X2 U8 ( .A(n5), .B(n30), .Y(n6) );
  AND2X2 U9 ( .A(n6), .B(n32), .Y(n7) );
  AND2X2 U10 ( .A(n7), .B(n34), .Y(n8) );
  AND2X2 U11 ( .A(n8), .B(n36), .Y(n9) );
  AND2X2 U12 ( .A(n11), .B(n24), .Y(n10) );
  AND2X2 U13 ( .A(n12), .B(n22), .Y(n11) );
  AND2X2 U14 ( .A(n3), .B(n20), .Y(n12) );
  INVX1 U15 ( .A(in[16]), .Y(n59) );
  INVX2 U16 ( .A(in[1]), .Y(n14) );
  NAND2X1 U17 ( .A(N2), .B(in[16]), .Y(n13) );
  XOR2X1 U18 ( .A(n14), .B(n13), .Y(out[1]) );
  NOR2X1 U19 ( .A(n59), .B(n1), .Y(n15) );
  XOR2X1 U20 ( .A(in[2]), .B(n15), .Y(out[2]) );
  INVX2 U21 ( .A(in[2]), .Y(n16) );
  NOR2X1 U22 ( .A(n59), .B(n2), .Y(n17) );
  XOR2X1 U23 ( .A(in[3]), .B(n17), .Y(out[3]) );
  INVX2 U24 ( .A(in[3]), .Y(n18) );
  NOR2X1 U25 ( .A(n59), .B(n3), .Y(n19) );
  XOR2X1 U26 ( .A(in[4]), .B(n19), .Y(out[4]) );
  INVX2 U27 ( .A(in[4]), .Y(n20) );
  NOR2X1 U28 ( .A(n59), .B(n12), .Y(n21) );
  XOR2X1 U29 ( .A(in[5]), .B(n21), .Y(out[5]) );
  INVX2 U30 ( .A(in[5]), .Y(n22) );
  NOR2X1 U31 ( .A(n59), .B(n11), .Y(n23) );
  XOR2X1 U32 ( .A(in[6]), .B(n23), .Y(out[6]) );
  INVX2 U33 ( .A(in[6]), .Y(n24) );
  NOR2X1 U34 ( .A(n59), .B(n10), .Y(n25) );
  XOR2X1 U35 ( .A(in[7]), .B(n25), .Y(out[7]) );
  INVX2 U36 ( .A(in[7]), .Y(n26) );
  NOR2X1 U38 ( .A(n59), .B(n4), .Y(n27) );
  XOR2X1 U39 ( .A(in[8]), .B(n27), .Y(out[8]) );
  INVX2 U40 ( .A(in[8]), .Y(n28) );
  NOR2X1 U41 ( .A(n59), .B(n5), .Y(n29) );
  XOR2X1 U42 ( .A(in[9]), .B(n29), .Y(out[9]) );
  INVX2 U43 ( .A(in[9]), .Y(n30) );
  NOR2X1 U44 ( .A(n59), .B(n6), .Y(n31) );
  XOR2X1 U45 ( .A(in[10]), .B(n31), .Y(out[10]) );
  INVX2 U46 ( .A(in[10]), .Y(n32) );
  NOR2X1 U47 ( .A(n59), .B(n7), .Y(n33) );
  XOR2X1 U48 ( .A(in[11]), .B(n33), .Y(out[11]) );
  INVX2 U49 ( .A(in[11]), .Y(n34) );
  NOR2X1 U50 ( .A(n59), .B(n8), .Y(n35) );
  XOR2X1 U51 ( .A(in[12]), .B(n35), .Y(out[12]) );
  INVX2 U52 ( .A(in[12]), .Y(n36) );
  NOR2X1 U53 ( .A(n59), .B(n9), .Y(n38) );
  XOR2X1 U54 ( .A(in[13]), .B(n38), .Y(out[13]) );
  INVX2 U55 ( .A(in[13]), .Y(n39) );
  NAND2X1 U56 ( .A(n9), .B(n39), .Y(n41) );
  NAND2X1 U57 ( .A(n41), .B(in[16]), .Y(n40) );
  OAI21X1 U58 ( .A(in[14]), .B(n41), .C(in[16]), .Y(n42) );
  XNOR2X1 U59 ( .A(in[15]), .B(n42), .Y(out[15]) );
  INVX2 U60 ( .A(n37), .Y(out[0]) );
endmodule


module datapath_decode ( op, w_en, w_data_sel, alu_op );
  input [2:0] op;
  output [1:0] w_data_sel;
  output [1:0] alu_op;
  output w_en;
  wire   n1, n2, n3, n4, n5;

  INVX2 U3 ( .A(op[0]), .Y(n3) );
  NAND2X1 U4 ( .A(op[2]), .B(n3), .Y(n1) );
  INVX2 U5 ( .A(n1), .Y(alu_op[0]) );
  NAND2X1 U6 ( .A(op[2]), .B(op[0]), .Y(n2) );
  MUX2X1 U7 ( .B(n2), .A(n1), .S(op[1]), .Y(alu_op[1]) );
  INVX2 U8 ( .A(op[2]), .Y(n5) );
  NAND2X1 U9 ( .A(op[1]), .B(n5), .Y(w_data_sel[1]) );
  NOR2X1 U10 ( .A(w_data_sel[1]), .B(n3), .Y(w_data_sel[0]) );
  INVX2 U11 ( .A(op[1]), .Y(n4) );
  NAND3X1 U12 ( .A(n5), .B(n4), .C(n3), .Y(w_en) );
endmodule


module alu_DW01_add_1 ( A, B, CI, SUM, CO );
  input [17:0] A;
  input [17:0] B;
  output [17:0] SUM;
  input CI;
  output CO;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30, n31,
         n32, n33, n34, n35, n38, n39, n40, n41, n42, n43, n44, n45, n48, n49,
         n50, n51, n52, n53, n54, n55, n56, n57, n58, n59, n60, n61, n64, n65,
         n66, n67, n68, n69, n70, n71, n72, n73, n74, n75, n76, n77, n78, n79,
         n84, n85, n86, n87, n88, n89, n90, n91, n92, n93, n94, n95, n96, n97,
         n98, n99, n100, n103, n104, n105, n106, n107, n108, n111, n112, n113,
         n115, n116, n117, n118, n119, n120, n121, n122, n123, n124, n125,
         n126, n127, n128, n129, n130, n131, n132, n133, n134, n135, n136,
         n138, n140, n141, n142, n143, n144, n145, n146, n147, n148, n149,
         n150, n151;

  XOR2X1 U2 ( .A(n21), .B(n1), .Y(SUM[16]) );
  OAI21X1 U3 ( .A(n21), .B(n19), .C(n20), .Y(n18) );
  NAND2X1 U4 ( .A(n20), .B(n133), .Y(n1) );
  NOR2X1 U6 ( .A(n151), .B(n150), .Y(n19) );
  NAND2X1 U7 ( .A(n151), .B(n150), .Y(n20) );
  XNOR2X1 U8 ( .A(n30), .B(n2), .Y(SUM[15]) );
  AOI21X1 U9 ( .A(n90), .B(n22), .C(n23), .Y(n21) );
  NOR2X1 U10 ( .A(n24), .B(n58), .Y(n22) );
  OAI21X1 U11 ( .A(n24), .B(n59), .C(n25), .Y(n23) );
  NAND2X1 U12 ( .A(n26), .B(n42), .Y(n24) );
  AOI21X1 U13 ( .A(n43), .B(n26), .C(n27), .Y(n25) );
  NOR2X1 U14 ( .A(n28), .B(n35), .Y(n26) );
  OAI21X1 U15 ( .A(n28), .B(n38), .C(n29), .Y(n27) );
  NAND2X1 U16 ( .A(n29), .B(n134), .Y(n2) );
  NOR2X1 U18 ( .A(A[15]), .B(B[15]), .Y(n28) );
  NAND2X1 U19 ( .A(A[15]), .B(B[15]), .Y(n29) );
  XNOR2X1 U20 ( .A(n39), .B(n3), .Y(SUM[14]) );
  OAI21X1 U21 ( .A(n31), .B(n89), .C(n32), .Y(n30) );
  NAND2X1 U22 ( .A(n60), .B(n33), .Y(n31) );
  AOI21X1 U23 ( .A(n61), .B(n33), .C(n34), .Y(n32) );
  NOR2X1 U24 ( .A(n35), .B(n44), .Y(n33) );
  OAI21X1 U25 ( .A(n45), .B(n35), .C(n38), .Y(n34) );
  NAND2X1 U28 ( .A(n38), .B(n135), .Y(n3) );
  NOR2X1 U30 ( .A(A[14]), .B(B[14]), .Y(n35) );
  NAND2X1 U31 ( .A(A[14]), .B(B[14]), .Y(n38) );
  XNOR2X1 U32 ( .A(n50), .B(n4), .Y(SUM[13]) );
  OAI21X1 U33 ( .A(n89), .B(n40), .C(n41), .Y(n39) );
  NAND2X1 U34 ( .A(n42), .B(n60), .Y(n40) );
  AOI21X1 U35 ( .A(n42), .B(n61), .C(n43), .Y(n41) );
  NOR2X1 U40 ( .A(n48), .B(n55), .Y(n42) );
  OAI21X1 U41 ( .A(n48), .B(n56), .C(n49), .Y(n43) );
  NAND2X1 U42 ( .A(n49), .B(n136), .Y(n4) );
  NOR2X1 U44 ( .A(A[13]), .B(B[13]), .Y(n48) );
  NAND2X1 U45 ( .A(A[13]), .B(B[13]), .Y(n49) );
  XNOR2X1 U46 ( .A(n57), .B(n5), .Y(SUM[12]) );
  OAI21X1 U47 ( .A(n89), .B(n51), .C(n52), .Y(n50) );
  NAND2X1 U48 ( .A(n53), .B(n60), .Y(n51) );
  AOI21X1 U49 ( .A(n53), .B(n61), .C(n54), .Y(n52) );
  NAND2X1 U52 ( .A(n56), .B(n53), .Y(n5) );
  NOR2X1 U54 ( .A(A[12]), .B(B[12]), .Y(n55) );
  NAND2X1 U55 ( .A(A[12]), .B(B[12]), .Y(n56) );
  XNOR2X1 U56 ( .A(n68), .B(n6), .Y(SUM[11]) );
  OAI21X1 U57 ( .A(n89), .B(n58), .C(n59), .Y(n57) );
  NAND2X1 U62 ( .A(n64), .B(n78), .Y(n58) );
  AOI21X1 U63 ( .A(n79), .B(n64), .C(n65), .Y(n59) );
  NOR2X1 U64 ( .A(n66), .B(n73), .Y(n64) );
  OAI21X1 U65 ( .A(n66), .B(n74), .C(n67), .Y(n65) );
  NAND2X1 U66 ( .A(n67), .B(n138), .Y(n6) );
  NOR2X1 U68 ( .A(A[11]), .B(B[11]), .Y(n66) );
  NAND2X1 U69 ( .A(A[11]), .B(B[11]), .Y(n67) );
  XNOR2X1 U70 ( .A(n75), .B(n7), .Y(SUM[10]) );
  OAI21X1 U71 ( .A(n89), .B(n69), .C(n70), .Y(n68) );
  NAND2X1 U72 ( .A(n71), .B(n78), .Y(n69) );
  AOI21X1 U73 ( .A(n71), .B(n79), .C(n72), .Y(n70) );
  NAND2X1 U76 ( .A(n74), .B(n71), .Y(n7) );
  NOR2X1 U78 ( .A(A[10]), .B(B[10]), .Y(n73) );
  NAND2X1 U79 ( .A(A[10]), .B(B[10]), .Y(n74) );
  XNOR2X1 U80 ( .A(n86), .B(n8), .Y(SUM[9]) );
  OAI21X1 U81 ( .A(n89), .B(n76), .C(n77), .Y(n75) );
  NOR2X1 U88 ( .A(n84), .B(n87), .Y(n78) );
  OAI21X1 U89 ( .A(n84), .B(n88), .C(n85), .Y(n79) );
  NAND2X1 U90 ( .A(n85), .B(n140), .Y(n8) );
  NOR2X1 U92 ( .A(A[9]), .B(B[9]), .Y(n84) );
  NAND2X1 U93 ( .A(A[9]), .B(B[9]), .Y(n85) );
  XOR2X1 U94 ( .A(n89), .B(n9), .Y(SUM[8]) );
  OAI21X1 U95 ( .A(n89), .B(n87), .C(n88), .Y(n86) );
  NAND2X1 U96 ( .A(n88), .B(n141), .Y(n9) );
  NOR2X1 U98 ( .A(A[8]), .B(B[8]), .Y(n87) );
  NAND2X1 U99 ( .A(A[8]), .B(B[8]), .Y(n88) );
  XOR2X1 U100 ( .A(n97), .B(n10), .Y(SUM[7]) );
  OAI21X1 U102 ( .A(n91), .B(n119), .C(n92), .Y(n90) );
  NAND2X1 U103 ( .A(n93), .B(n105), .Y(n91) );
  AOI21X1 U104 ( .A(n106), .B(n93), .C(n94), .Y(n92) );
  NOR2X1 U105 ( .A(n95), .B(n100), .Y(n93) );
  OAI21X1 U106 ( .A(n95), .B(n103), .C(n96), .Y(n94) );
  NAND2X1 U107 ( .A(n96), .B(n142), .Y(n10) );
  NOR2X1 U109 ( .A(A[7]), .B(B[7]), .Y(n95) );
  NAND2X1 U110 ( .A(A[7]), .B(B[7]), .Y(n96) );
  XOR2X1 U111 ( .A(n104), .B(n11), .Y(SUM[6]) );
  AOI21X1 U112 ( .A(n118), .B(n98), .C(n99), .Y(n97) );
  NOR2X1 U113 ( .A(n100), .B(n107), .Y(n98) );
  OAI21X1 U114 ( .A(n108), .B(n100), .C(n103), .Y(n99) );
  NAND2X1 U117 ( .A(n103), .B(n143), .Y(n11) );
  NOR2X1 U119 ( .A(A[6]), .B(B[6]), .Y(n100) );
  NAND2X1 U120 ( .A(A[6]), .B(B[6]), .Y(n103) );
  XOR2X1 U121 ( .A(n113), .B(n12), .Y(SUM[5]) );
  AOI21X1 U122 ( .A(n105), .B(n118), .C(n106), .Y(n104) );
  NOR2X1 U127 ( .A(n111), .B(n116), .Y(n105) );
  OAI21X1 U128 ( .A(n111), .B(n117), .C(n112), .Y(n106) );
  NAND2X1 U129 ( .A(n112), .B(n144), .Y(n12) );
  NOR2X1 U131 ( .A(A[5]), .B(B[5]), .Y(n111) );
  NAND2X1 U132 ( .A(A[5]), .B(B[5]), .Y(n112) );
  XNOR2X1 U133 ( .A(n118), .B(n13), .Y(SUM[4]) );
  AOI21X1 U134 ( .A(n145), .B(n118), .C(n115), .Y(n113) );
  NAND2X1 U137 ( .A(n117), .B(n145), .Y(n13) );
  NOR2X1 U139 ( .A(A[4]), .B(B[4]), .Y(n116) );
  NAND2X1 U140 ( .A(A[4]), .B(B[4]), .Y(n117) );
  XNOR2X1 U141 ( .A(n124), .B(n14), .Y(SUM[3]) );
  AOI21X1 U143 ( .A(n128), .B(n120), .C(n121), .Y(n119) );
  NOR2X1 U144 ( .A(n122), .B(n125), .Y(n120) );
  OAI21X1 U145 ( .A(n122), .B(n126), .C(n123), .Y(n121) );
  NAND2X1 U146 ( .A(n123), .B(n146), .Y(n14) );
  NOR2X1 U148 ( .A(A[3]), .B(B[3]), .Y(n122) );
  NAND2X1 U149 ( .A(A[3]), .B(B[3]), .Y(n123) );
  XOR2X1 U150 ( .A(n127), .B(n15), .Y(SUM[2]) );
  OAI21X1 U151 ( .A(n127), .B(n125), .C(n126), .Y(n124) );
  NAND2X1 U152 ( .A(n126), .B(n147), .Y(n15) );
  NOR2X1 U154 ( .A(A[2]), .B(B[2]), .Y(n125) );
  NAND2X1 U155 ( .A(A[2]), .B(B[2]), .Y(n126) );
  XOR2X1 U156 ( .A(n16), .B(n132), .Y(SUM[1]) );
  OAI21X1 U158 ( .A(n129), .B(n132), .C(n130), .Y(n128) );
  NAND2X1 U159 ( .A(n130), .B(n148), .Y(n16) );
  NOR2X1 U161 ( .A(A[1]), .B(B[1]), .Y(n129) );
  NAND2X1 U162 ( .A(A[1]), .B(B[1]), .Y(n130) );
  NOR2X1 U166 ( .A(A[0]), .B(B[0]), .Y(n131) );
  NAND2X1 U167 ( .A(A[0]), .B(B[0]), .Y(n132) );
  AND2X1 U173 ( .A(n132), .B(n149), .Y(SUM[0]) );
  INVX2 U174 ( .A(n90), .Y(n89) );
  INVX2 U175 ( .A(n79), .Y(n77) );
  INVX2 U176 ( .A(n78), .Y(n76) );
  INVX2 U177 ( .A(n74), .Y(n72) );
  INVX2 U178 ( .A(n59), .Y(n61) );
  INVX2 U179 ( .A(n58), .Y(n60) );
  INVX2 U180 ( .A(n56), .Y(n54) );
  INVX2 U181 ( .A(n43), .Y(n45) );
  INVX2 U182 ( .A(n42), .Y(n44) );
  INVX2 U183 ( .A(A[17]), .Y(n151) );
  INVX2 U184 ( .A(B[17]), .Y(n150) );
  INVX2 U185 ( .A(n131), .Y(n149) );
  INVX2 U186 ( .A(n129), .Y(n148) );
  INVX2 U187 ( .A(n125), .Y(n147) );
  INVX2 U188 ( .A(n122), .Y(n146) );
  INVX2 U189 ( .A(n111), .Y(n144) );
  INVX2 U190 ( .A(n100), .Y(n143) );
  INVX2 U191 ( .A(n95), .Y(n142) );
  INVX2 U192 ( .A(n87), .Y(n141) );
  INVX2 U193 ( .A(n84), .Y(n140) );
  INVX2 U194 ( .A(n73), .Y(n71) );
  INVX2 U195 ( .A(n66), .Y(n138) );
  INVX2 U196 ( .A(n55), .Y(n53) );
  INVX2 U197 ( .A(n48), .Y(n136) );
  INVX2 U198 ( .A(n35), .Y(n135) );
  INVX2 U199 ( .A(n28), .Y(n134) );
  INVX2 U200 ( .A(n19), .Y(n133) );
  INVX2 U201 ( .A(n128), .Y(n127) );
  INVX2 U202 ( .A(n119), .Y(n118) );
  INVX2 U203 ( .A(n117), .Y(n115) );
  INVX2 U204 ( .A(n116), .Y(n145) );
  INVX2 U205 ( .A(n106), .Y(n108) );
  INVX2 U206 ( .A(n105), .Y(n107) );
  INVX2 U207 ( .A(n18), .Y(SUM[17]) );
endmodule


module alu_DW01_sub_1 ( A, B, CI, DIFF, CO );
  input [17:0] A;
  input [17:0] B;
  output [17:0] DIFF;
  input CI;
  output CO;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33, n34, n37, n38, n39, n40, n41, n42, n43, n44, n47, n48,
         n49, n50, n51, n52, n53, n54, n55, n56, n57, n58, n59, n60, n63, n64,
         n65, n66, n67, n68, n69, n70, n71, n72, n73, n74, n75, n76, n77, n78,
         n83, n84, n85, n86, n87, n88, n89, n90, n91, n92, n93, n94, n95, n96,
         n97, n98, n99, n102, n103, n104, n105, n106, n107, n110, n111, n112,
         n114, n115, n116, n117, n118, n119, n120, n121, n122, n123, n124,
         n125, n126, n127, n128, n129, n130, n131, n132, n133, n134, n136,
         n138, n139, n140, n141, n142, n143, n144, n145, n146, n147, n148,
         n149, n150, n151, n152, n153, n154, n155, n156, n157, n158, n159,
         n160, n161, n163, n222;

  XOR2X1 U2 ( .A(n20), .B(n1), .Y(DIFF[16]) );
  OAI21X1 U3 ( .A(n20), .B(n18), .C(n19), .Y(n17) );
  NAND2X1 U4 ( .A(n19), .B(n131), .Y(n1) );
  NOR2X1 U6 ( .A(n163), .B(B[16]), .Y(n18) );
  NAND2X1 U7 ( .A(n163), .B(B[16]), .Y(n19) );
  XNOR2X1 U8 ( .A(n29), .B(n2), .Y(DIFF[15]) );
  AOI21X1 U9 ( .A(n89), .B(n21), .C(n22), .Y(n20) );
  NOR2X1 U10 ( .A(n23), .B(n57), .Y(n21) );
  OAI21X1 U11 ( .A(n23), .B(n58), .C(n24), .Y(n22) );
  NAND2X1 U12 ( .A(n25), .B(n41), .Y(n23) );
  AOI21X1 U13 ( .A(n42), .B(n25), .C(n26), .Y(n24) );
  NOR2X1 U14 ( .A(n27), .B(n34), .Y(n25) );
  OAI21X1 U15 ( .A(n27), .B(n37), .C(n28), .Y(n26) );
  NAND2X1 U16 ( .A(n28), .B(n132), .Y(n2) );
  NOR2X1 U18 ( .A(A[15]), .B(n147), .Y(n27) );
  NAND2X1 U19 ( .A(A[15]), .B(n147), .Y(n28) );
  XNOR2X1 U20 ( .A(n38), .B(n3), .Y(DIFF[14]) );
  OAI21X1 U21 ( .A(n30), .B(n88), .C(n31), .Y(n29) );
  NAND2X1 U22 ( .A(n59), .B(n32), .Y(n30) );
  AOI21X1 U23 ( .A(n60), .B(n32), .C(n33), .Y(n31) );
  NOR2X1 U24 ( .A(n34), .B(n43), .Y(n32) );
  OAI21X1 U25 ( .A(n44), .B(n34), .C(n37), .Y(n33) );
  NAND2X1 U28 ( .A(n37), .B(n133), .Y(n3) );
  NOR2X1 U30 ( .A(A[14]), .B(n148), .Y(n34) );
  NAND2X1 U31 ( .A(A[14]), .B(n148), .Y(n37) );
  XNOR2X1 U32 ( .A(n49), .B(n4), .Y(DIFF[13]) );
  OAI21X1 U33 ( .A(n88), .B(n39), .C(n40), .Y(n38) );
  NAND2X1 U34 ( .A(n41), .B(n59), .Y(n39) );
  AOI21X1 U35 ( .A(n41), .B(n60), .C(n42), .Y(n40) );
  NOR2X1 U40 ( .A(n47), .B(n54), .Y(n41) );
  OAI21X1 U41 ( .A(n47), .B(n55), .C(n48), .Y(n42) );
  NAND2X1 U42 ( .A(n48), .B(n134), .Y(n4) );
  NOR2X1 U44 ( .A(A[13]), .B(n149), .Y(n47) );
  NAND2X1 U45 ( .A(A[13]), .B(n149), .Y(n48) );
  XNOR2X1 U46 ( .A(n56), .B(n5), .Y(DIFF[12]) );
  OAI21X1 U47 ( .A(n88), .B(n50), .C(n51), .Y(n49) );
  NAND2X1 U48 ( .A(n52), .B(n59), .Y(n50) );
  AOI21X1 U49 ( .A(n52), .B(n60), .C(n53), .Y(n51) );
  NAND2X1 U52 ( .A(n55), .B(n52), .Y(n5) );
  NOR2X1 U54 ( .A(A[12]), .B(n150), .Y(n54) );
  NAND2X1 U55 ( .A(A[12]), .B(n150), .Y(n55) );
  XNOR2X1 U56 ( .A(n67), .B(n6), .Y(DIFF[11]) );
  OAI21X1 U57 ( .A(n88), .B(n57), .C(n58), .Y(n56) );
  NAND2X1 U62 ( .A(n63), .B(n77), .Y(n57) );
  AOI21X1 U63 ( .A(n78), .B(n63), .C(n64), .Y(n58) );
  NOR2X1 U64 ( .A(n65), .B(n72), .Y(n63) );
  OAI21X1 U65 ( .A(n65), .B(n73), .C(n66), .Y(n64) );
  NAND2X1 U66 ( .A(n66), .B(n136), .Y(n6) );
  NOR2X1 U68 ( .A(A[11]), .B(n151), .Y(n65) );
  NAND2X1 U69 ( .A(A[11]), .B(n151), .Y(n66) );
  XNOR2X1 U70 ( .A(n74), .B(n7), .Y(DIFF[10]) );
  OAI21X1 U71 ( .A(n88), .B(n68), .C(n69), .Y(n67) );
  NAND2X1 U72 ( .A(n70), .B(n77), .Y(n68) );
  AOI21X1 U73 ( .A(n70), .B(n78), .C(n71), .Y(n69) );
  NAND2X1 U76 ( .A(n73), .B(n70), .Y(n7) );
  NOR2X1 U78 ( .A(A[10]), .B(n152), .Y(n72) );
  NAND2X1 U79 ( .A(A[10]), .B(n152), .Y(n73) );
  XNOR2X1 U80 ( .A(n85), .B(n8), .Y(DIFF[9]) );
  OAI21X1 U81 ( .A(n88), .B(n75), .C(n76), .Y(n74) );
  NOR2X1 U88 ( .A(n83), .B(n86), .Y(n77) );
  OAI21X1 U89 ( .A(n83), .B(n87), .C(n84), .Y(n78) );
  NAND2X1 U90 ( .A(n84), .B(n138), .Y(n8) );
  NOR2X1 U92 ( .A(A[9]), .B(n153), .Y(n83) );
  NAND2X1 U93 ( .A(A[9]), .B(n153), .Y(n84) );
  XOR2X1 U94 ( .A(n88), .B(n9), .Y(DIFF[8]) );
  OAI21X1 U95 ( .A(n88), .B(n86), .C(n87), .Y(n85) );
  NAND2X1 U96 ( .A(n87), .B(n139), .Y(n9) );
  NOR2X1 U98 ( .A(A[8]), .B(n154), .Y(n86) );
  NAND2X1 U99 ( .A(A[8]), .B(n154), .Y(n87) );
  XOR2X1 U100 ( .A(n96), .B(n10), .Y(DIFF[7]) );
  OAI21X1 U102 ( .A(n90), .B(n118), .C(n91), .Y(n89) );
  NAND2X1 U103 ( .A(n92), .B(n104), .Y(n90) );
  AOI21X1 U104 ( .A(n105), .B(n92), .C(n93), .Y(n91) );
  NOR2X1 U105 ( .A(n94), .B(n99), .Y(n92) );
  OAI21X1 U106 ( .A(n94), .B(n102), .C(n95), .Y(n93) );
  NAND2X1 U107 ( .A(n95), .B(n140), .Y(n10) );
  NOR2X1 U109 ( .A(A[7]), .B(n155), .Y(n94) );
  NAND2X1 U110 ( .A(A[7]), .B(n155), .Y(n95) );
  XOR2X1 U111 ( .A(n103), .B(n11), .Y(DIFF[6]) );
  AOI21X1 U112 ( .A(n117), .B(n97), .C(n98), .Y(n96) );
  NOR2X1 U113 ( .A(n99), .B(n106), .Y(n97) );
  OAI21X1 U114 ( .A(n107), .B(n99), .C(n102), .Y(n98) );
  NAND2X1 U117 ( .A(n102), .B(n141), .Y(n11) );
  NOR2X1 U119 ( .A(A[6]), .B(n156), .Y(n99) );
  NAND2X1 U120 ( .A(A[6]), .B(n156), .Y(n102) );
  XOR2X1 U121 ( .A(n112), .B(n12), .Y(DIFF[5]) );
  AOI21X1 U122 ( .A(n104), .B(n117), .C(n105), .Y(n103) );
  NOR2X1 U127 ( .A(n110), .B(n115), .Y(n104) );
  OAI21X1 U128 ( .A(n110), .B(n116), .C(n111), .Y(n105) );
  NAND2X1 U129 ( .A(n111), .B(n142), .Y(n12) );
  NOR2X1 U131 ( .A(A[5]), .B(n157), .Y(n110) );
  NAND2X1 U132 ( .A(A[5]), .B(n157), .Y(n111) );
  XNOR2X1 U133 ( .A(n117), .B(n13), .Y(DIFF[4]) );
  AOI21X1 U134 ( .A(n143), .B(n117), .C(n114), .Y(n112) );
  NAND2X1 U137 ( .A(n116), .B(n143), .Y(n13) );
  NOR2X1 U139 ( .A(A[4]), .B(n158), .Y(n115) );
  NAND2X1 U140 ( .A(A[4]), .B(n158), .Y(n116) );
  XNOR2X1 U141 ( .A(n123), .B(n14), .Y(DIFF[3]) );
  AOI21X1 U143 ( .A(n127), .B(n119), .C(n120), .Y(n118) );
  NOR2X1 U144 ( .A(n121), .B(n124), .Y(n119) );
  OAI21X1 U145 ( .A(n121), .B(n125), .C(n122), .Y(n120) );
  NAND2X1 U146 ( .A(n122), .B(n144), .Y(n14) );
  NOR2X1 U148 ( .A(A[3]), .B(n159), .Y(n121) );
  NAND2X1 U149 ( .A(A[3]), .B(n159), .Y(n122) );
  XOR2X1 U150 ( .A(n126), .B(n15), .Y(DIFF[2]) );
  OAI21X1 U151 ( .A(n126), .B(n124), .C(n125), .Y(n123) );
  NAND2X1 U152 ( .A(n125), .B(n145), .Y(n15) );
  NOR2X1 U154 ( .A(A[2]), .B(n160), .Y(n124) );
  NAND2X1 U155 ( .A(A[2]), .B(n160), .Y(n125) );
  XOR2X1 U156 ( .A(n16), .B(n130), .Y(DIFF[1]) );
  OAI21X1 U158 ( .A(n128), .B(n130), .C(n129), .Y(n127) );
  NAND2X1 U159 ( .A(n129), .B(n146), .Y(n16) );
  NOR2X1 U161 ( .A(A[1]), .B(n161), .Y(n128) );
  NAND2X1 U162 ( .A(A[1]), .B(n161), .Y(n129) );
  XNOR2X1 U163 ( .A(n222), .B(A[0]), .Y(DIFF[0]) );
  NOR2X1 U164 ( .A(A[0]), .B(n222), .Y(n130) );
  INVX1 U185 ( .A(B[9]), .Y(n153) );
  INVX1 U186 ( .A(B[13]), .Y(n149) );
  INVX1 U187 ( .A(B[0]), .Y(n222) );
  INVX1 U188 ( .A(B[5]), .Y(n157) );
  INVX1 U189 ( .A(B[8]), .Y(n154) );
  INVX1 U190 ( .A(B[3]), .Y(n159) );
  INVX1 U191 ( .A(B[12]), .Y(n150) );
  INVX1 U192 ( .A(B[11]), .Y(n151) );
  INVX1 U193 ( .A(B[7]), .Y(n155) );
  INVX1 U194 ( .A(B[2]), .Y(n160) );
  INVX1 U195 ( .A(B[10]), .Y(n152) );
  INVX1 U196 ( .A(B[1]), .Y(n161) );
  INVX1 U197 ( .A(B[6]), .Y(n156) );
  INVX1 U198 ( .A(B[15]), .Y(n147) );
  INVX1 U199 ( .A(B[14]), .Y(n148) );
  INVX1 U200 ( .A(B[4]), .Y(n158) );
  INVX2 U201 ( .A(n89), .Y(n88) );
  INVX2 U202 ( .A(n78), .Y(n76) );
  INVX2 U203 ( .A(n77), .Y(n75) );
  INVX2 U204 ( .A(n73), .Y(n71) );
  INVX2 U205 ( .A(n58), .Y(n60) );
  INVX2 U206 ( .A(n57), .Y(n59) );
  INVX2 U207 ( .A(n55), .Y(n53) );
  INVX2 U208 ( .A(n42), .Y(n44) );
  INVX2 U209 ( .A(n41), .Y(n43) );
  INVX2 U210 ( .A(A[17]), .Y(n163) );
  INVX2 U211 ( .A(n128), .Y(n146) );
  INVX2 U212 ( .A(n124), .Y(n145) );
  INVX2 U213 ( .A(n121), .Y(n144) );
  INVX2 U214 ( .A(n110), .Y(n142) );
  INVX2 U215 ( .A(n99), .Y(n141) );
  INVX2 U216 ( .A(n94), .Y(n140) );
  INVX2 U217 ( .A(n86), .Y(n139) );
  INVX2 U218 ( .A(n83), .Y(n138) );
  INVX2 U219 ( .A(n72), .Y(n70) );
  INVX2 U220 ( .A(n65), .Y(n136) );
  INVX2 U221 ( .A(n54), .Y(n52) );
  INVX2 U222 ( .A(n47), .Y(n134) );
  INVX2 U223 ( .A(n34), .Y(n133) );
  INVX2 U224 ( .A(n27), .Y(n132) );
  INVX2 U225 ( .A(n18), .Y(n131) );
  INVX2 U226 ( .A(n127), .Y(n126) );
  INVX2 U227 ( .A(n118), .Y(n117) );
  INVX2 U228 ( .A(n116), .Y(n114) );
  INVX2 U229 ( .A(n115), .Y(n143) );
  INVX2 U230 ( .A(n105), .Y(n107) );
  INVX2 U231 ( .A(n104), .Y(n106) );
  INVX2 U232 ( .A(n17), .Y(DIFF[17]) );
endmodule


module alu_DW_mult_uns_5 ( a, b, product );
  input [30:0] a;
  input [15:0] b;
  output [46:0] product;
  wire   n1, n7, n13, n18, n19, n25, n31, n37, n42, n46, n49, n51, n52, n53,
         n54, n55, n62, n63, n65, n66, n67, n68, n69, n70, n72, n73, n74, n75,
         n76, n77, n78, n79, n80, n81, n82, n83, n84, n85, n86, n87, n88, n89,
         n90, n91, n92, n93, n94, n95, n96, n97, n98, n99, n100, n101, n102,
         n103, n104, n105, n106, n107, n109, n111, n112, n113, n114, n115,
         n116, n120, n122, n123, n124, n125, n126, n127, n128, n129, n130,
         n133, n134, n135, n136, n140, n142, n144, n145, n146, n147, n148,
         n149, n151, n154, n156, n159, n160, n161, n162, n163, n164, n165,
         n166, n169, n170, n171, n172, n173, n174, n177, n178, n179, n181,
         n182, n183, n185, n186, n187, n188, n189, n190, n191, n192, n193,
         n194, n197, n198, n199, n200, n201, n202, n205, n206, n207, n209,
         n210, n211, n212, n213, n214, n215, n216, n217, n218, n219, n220,
         n221, n222, n223, n224, n233, n234, n235, n236, n237, n238, n239,
         n240, n241, n242, n243, n248, n249, n250, n251, n256, n257, n258,
         n259, n264, n265, n266, n267, n275, n279, n282, n283, n284, n285,
         n286, n287, n288, n289, n290, n291, n292, n293, n294, n295, n296,
         n297, n298, n299, n300, n301, n302, n303, n304, n305, n306, n307,
         n308, n309, n310, n311, n312, n313, n314, n315, n316, n317, n318,
         n319, n320, n321, n322, n323, n324, n325, n326, n327, n328, n329,
         n330, n331, n332, n333, n334, n335, n336, n337, n338, n339, n340,
         n341, n342, n343, n344, n345, n346, n348, n349, n350, n351, n352,
         n353, n354, n355, n356, n357, n358, n359, n360, n361, n362, n363,
         n364, n365, n366, n367, n368, n369, n370, n371, n372, n373, n374,
         n375, n376, n377, n378, n379, n381, n382, n383, n384, n385, n386,
         n387, n388, n389, n390, n391, n392, n393, n394, n395, n396, n397,
         n398, n399, n400, n401, n402, n403, n404, n405, n406, n407, n409,
         n410, n411, n412, n413, n414, n415, n416, n417, n418, n419, n420,
         n421, n422, n423, n424, n425, n426, n427, n429, n430, n431, n432,
         n433, n434, n435, n436, n437, n438, n439, n440, n441, n442, n443,
         n444, n445, n447, n448, n449, n450, n451, n452, n453, n454, n457,
         n458, n459, n460, n461, n462, n463, n464, n465, n466, n467, n468,
         n469, n470, n471, n472, n473, n474, n475, n476, n477, n478, n480,
         n481, n482, n483, n484, n485, n486, n487, n488, n489, n490, n491,
         n493, n494, n495, n496, n497, n498, n500, n501, n502, n503, n504,
         n505, n506, n507, n508, n509, n510, n511, n512, n513, n514, n515,
         n516, n517, n518, n519, n520, n521, n522, n523, n524, n525, n526,
         n527, n528, n529, n530, n531, n532, n533, n534, n535, n536, n537,
         n538, n539, n540, n541, n542, n543, n545, n546, n548, n549, n552,
         n554, n561, n565, n566, n567, n568, n569, n570, n571, n572, n573,
         n574, n575, n576, n577, n578, n579, n580, n581, n582, n584, n585,
         n586, n587, n588, n589, n590, n591, n592, n593, n594, n595, n596,
         n597, n598, n599, n600, n601, n602, n603, n604, n605, n606, n607,
         n608, n609, n610, n611, n612, n613, n614, n615, n616, n617, n618,
         n619, n620, n621, n622, n623, n624, n625, n626, n627, n628, n629,
         n630, n631, n632, n633, n634, n635, n636, n638, n639, n640, n641,
         n642, n643, n644, n645, n646, n648, n649, n650, n651, n652, n653,
         n654, n655, n656, n657, n658, n659, n660, n661, n662, n663, n664,
         n665, n666, n667, n668, n669, n670, n671, n672, n674, n675, n676,
         n677, n678, n679, n680, n681, n682, n683, n684, n685, n686, n687,
         n688, n689, n690, n692, n693, n694, n695, n696, n697, n698, n699,
         n700, n701, n702, n703, n704, n705, n706, n707, n708, n710, n711,
         n712, n713, n714, n715, n716, n717, n718, n719, n720, n721, n722,
         n723, n724, n725, n726, n727, n728, n729, n730, n741, n742, n743,
         n744, n745, n746, n747, n748, n749, n750, n751, n752, n753, n754,
         n755, n756, n757, n758, n759, n760, n761, n762, n763, n764, n765,
         n766, n767, n768, n769, n770, n771, n772, n773, n774, n775, n776,
         n777, n778, n779, n780, n781, n782, n783, n784, n785, n786, n787,
         n788, n789, n790, n791, n792, n793, n794, n795, n796, n797, n798,
         n799, n800, n801, n802, n803, n804, n805, n806, n807, n808, n809,
         n810, n811, n812, n813, n814, n815, n816, n817, n818, n819, n820,
         n821, n822, n823, n824, n825, n826, n827, n828, n829, n830, n831,
         n832, n833, n834, n835, n836, n837, n838, n839, n840, n841, n842,
         n843, n844, n845, n846, n847, n848, n849, n850, n851, n852, n853,
         n854, n855, n856, n857, n858, n859, n860, n861, n862, n863, n864,
         n865, n866, n867, n868, n869, n871, n872, n873, n874, n875, n876,
         n877, n878, n879, n880, n881, n882, n883, n884, n885, n886, n887,
         n888, n889, n890, n891, n893, n895, n896, n897, n898, n899, n900,
         n917, n995, n996, n997, n998, n999, n1000, n1001, n1002, n1003, n1004,
         n1005, n1006, n1007, n1008, n1009, n1010, n1011, n1012, n1013, n1014,
         n1015, n1016, n1017, n1018, n1019, n1020, n1021, n1022, n1023, n1024,
         n1025, n1026, n1027, n1028, n1029, n1030, n1031, n1032, n1033, n1034,
         n1035, n1036, n1037, n1038, n1039, n1040, n1041, n1042, n1043, n1044,
         n1045, n1046, n1047, n1048, n1049, n1050, n1051, n1052, n1053, n1054,
         n1055, n1056, n1057, n1058, n1059, n1060, n1061, n1062, n1063, n1064,
         n1065, n1066, n1067, n1068, n1069, n1070, n1071, n1072, n1073, n1074,
         n1075, n1076, n1077, n1078, n1079, n1080, n1081, n1082, n1083, n1084,
         n1085, n1086, n1087, n1088, n1089, n1090, n1091, n1092, n1093, n1094,
         n1095, n1096, n1097, n1098, n1099, n1100, n1101, n1102, n1103, n1104,
         n1105, n1106, n1107, n1108, n1109, n1110, n1111, n1112, n1113, n1114,
         n1115, n1116, n1117, n1118, n1119, n1120, n1121, n1122, n1123, n1124,
         n1125, n1126, n1127, n1128, n1129, n1130, n1131, n1132, n1133, n1134,
         n1135, n1136, n1137, n1138, n1139, n1140, n1141, n1142, n1143, n1144,
         n1145, n1146, n1147, n1148, n1149, n1150, n1151, n1152, n1153, n1154,
         n1155, n1156, n1157, n1158, n1159, n1160, n1161, n1162, n1163, n1164,
         n1165, n1166, n1167, n1168, n1169, n1170, n1171, n1172, n1173, n1174,
         n1175, n1176, n1177, n1178, n1179, n1180, n1181, n1182, n1183, n1184,
         n1185, n1186, n1187, n1188, n1189, n1190, n1191, n1192, n1193, n1194,
         n1195, n1196, n1197, n1198, n1199, n1200, n1201, n1202, n1203, n1204,
         n1205, n1206, n1207, n1208, n1209, n1210, n1211, n1212, n1213, n1214,
         n1215, n1216, n1217, n1218, n1219, n1220, n1221, n1222, n1223, n1224,
         n1225, n1226, n1227, n1228, n1229, n1230, n1231, n1232, n1233, n1234,
         n1235, n1236, n1237, n1238, n1239, n1240, n1241, n1242, n1243, n1244,
         n1245, n1246, n1247, n1248, n1249, n1250, n1251, n1252, n1253, n1254,
         n1255, n1256, n1257, n1258, n1259, n1260, n1261, n1262, n1263, n1264,
         n1265, n1266, n1267, n1268, n1269, n1270, n1271, n1272, n1273, n1274,
         n1275, n1276, n1277, n1278, n1279, n1280, n1281, n1282, n1283, n1284,
         n1285, n1286, n1287, n1288, n1289, n1290, n1291, n1292, n1293, n1294,
         n1295, n1296, n1297, n1298, n1299, n1300, n1301, n1302, n1303, n1304,
         n1305, n1306, n1307, n1308, n1309, n1310, n1311, n1312, n1313, n1314,
         n1315, n1316, n1317, n1318, n1319, n1320, n1321, n1322, n1323, n1324,
         n1325, n1326, n1327, n1328, n1329, n1330, n1331, n1332, n1333, n1334,
         n1335, n1336, n1337, n1338, n1339, n1340, n1341, n1342, n1343, n1344,
         n1345, n1346, n1347, n1348, n1349, n1350, n1351, n1352, n1353, n1354,
         n1355, n1356, n1357, n1358, n1359, n1360, n1361, n1362, n1363, n1364,
         n1365, n1366, n1367, n1368, n1369, n1370, n1371, n1372, n1373, n1374,
         n1375, n1376, n1377, n1378, n1379, n1380, n1381, n1382, n1383, n1384,
         n1385, n1386, n1387, n1388, n1389, n1390, n1391, n1392, n1393, n1394,
         n1395, n1396, n1397, n1398, n1399, n1400, n1401, n1402, n1403, n1404,
         n1405, n1406, n1407, n1408, n1409, n1410, n1411, n1412, n1413, n1414,
         n1415, n1416, n1417, n1418, n1419, n1420, n1421, n1422, n1423, n1424,
         n1425, n1426, n1427, n1428, n1429, n1430, n1431, n1432, n1433, n1434,
         n1435, n1436, n1437, n1438, n1439, n1440, n1441, n1442, n1443, n1444,
         n1445, n1446, n1447, n1448, n1449, n1450, n1451, n1452, n1453, n1454,
         n1455, n1456, n1457, n1458, n1459, n1460, n1461, n1462, n1463, n1464,
         n1465, n1466, n1467, n1468, n1469, n1470, n1471, n1472, n1473, n1474,
         n1475, n1476, n1477, n1478, n1479, n1480, n1481, n1482, n1483, n1484,
         n1485, n1486, n1487, n1488, n1489, n1490, n1491, n1492, n1493, n1494,
         n1495, n1496, n1497, n1498, n1499, n1500, n1501, n1502, n1503, n1504,
         n1505, n1506, n1507, n1508, n1509, n1510, n1511, n1512, n1513, n1514,
         n1515, n1516, n1517, n1518, n1519, n1520, n1521, n1522, n1523, n1524,
         n1525, n1526, n1527, n1528, n1529, n1530, n1531, n1532, n1533, n1534,
         n1535, n1536, n1537, n1538, n1539, n1540, n1541, n1542, n1543, n1544,
         n1545, n1546, n1547, n1548, n1549, n1550, n1551, n1552, n1553, n1554,
         n1555, n1556, n1557, n1558, n1559, n1560, n1561, n1562, n1563, n1564,
         n1565, n1566, n1567, n1568, n1569, n1570, n1571, n1572, n1573, n1574,
         n1575, n1576, n1577, n1578, n1579, n1580, n1581, n1582, n1583, n1584,
         n1585, n1586, n1587, n1588, n1589, n1590, n1591, n1592, n1593, n1594,
         n1595, n1596, n1597, n1598, n1599, n1600, n1601, n1602, n1603, n1604,
         n1605, n1606, n1607, n1608, n1609, n1610, n1611, n1612, n1613, n1614,
         n1615, n1616, n1617, n1618, n1619, n1620, n1621, n1622, n1623, n1624,
         n1625, n1626, n1627, n1628, n1629, n1630, n1631, n1632, n1633, n1634,
         n1635, n1636, n1637, n1638, n1639, n1640, n1641, n1642, n1643, n1644,
         n1645, n1646, n1647, n1648, n1649, n1650, n1651, n1652, n1653, n1654,
         n1655, n1656, n1657, n1658, n1659, n1660, n1661, n1662, n1663, n1664,
         n1665, n1666, n1667, n1668, n1669, n1670, n1671, n1672, n1673, n1674,
         n1675, n1676, n1677, n1678, n1679, n1680, n1681, n1682, n1683, n1684,
         n1685, n1686, n1687, n1688, n1689, n1690, n1691, n1692, n1693, n1694,
         n1695, n1696, n1697, n1698, n1699, n1700, n1701, n1702;
  assign n1 = a[16];
  assign n7 = a[18];
  assign n13 = a[20];
  assign n19 = a[22];
  assign n25 = a[24];
  assign n31 = a[26];
  assign n37 = a[28];
  assign n49 = b[0];
  assign n541 = a[30];
  assign n877 = b[15];
  assign n878 = b[14];
  assign n879 = b[13];
  assign n880 = b[12];
  assign n881 = b[11];
  assign n882 = b[10];
  assign n883 = b[9];
  assign n884 = b[8];
  assign n885 = b[7];
  assign n886 = b[6];
  assign n887 = b[5];
  assign n888 = b[4];
  assign n889 = b[3];
  assign n890 = b[2];
  assign n891 = b[1];

  XOR2X1 U54 ( .A(n73), .B(n54), .Y(product[46]) );
  NAND2X1 U55 ( .A(n72), .B(n1592), .Y(n54) );
  NAND2X1 U58 ( .A(n292), .B(n293), .Y(n72) );
  AOI21X1 U60 ( .A(n1649), .B(n74), .C(n75), .Y(n73) );
  NOR2X1 U61 ( .A(n76), .B(n53), .Y(n74) );
  OAI21X1 U62 ( .A(n1609), .B(n76), .C(n77), .Y(n75) );
  NOR2X1 U65 ( .A(n1497), .B(n80), .Y(n78) );
  OAI21X1 U66 ( .A(n80), .B(n140), .C(n81), .Y(n79) );
  NAND2X1 U67 ( .A(n104), .B(n82), .Y(n80) );
  AOI21X1 U68 ( .A(n82), .B(n105), .C(n83), .Y(n81) );
  NOR2X1 U69 ( .A(n84), .B(n93), .Y(n82) );
  OAI21X1 U70 ( .A(n94), .B(n84), .C(n85), .Y(n83) );
  NAND2X1 U71 ( .A(n85), .B(n275), .Y(n55) );
  NOR2X1 U73 ( .A(n294), .B(n297), .Y(n84) );
  NAND2X1 U74 ( .A(n294), .B(n297), .Y(n85) );
  AOI21X1 U76 ( .A(n1649), .B(n87), .C(n88), .Y(n86) );
  NOR2X1 U77 ( .A(n53), .B(n89), .Y(n87) );
  OAI21X1 U78 ( .A(n1609), .B(n89), .C(n90), .Y(n88) );
  NAND2X1 U79 ( .A(n91), .B(n100), .Y(n89) );
  AOI21X1 U80 ( .A(n91), .B(n101), .C(n92), .Y(n90) );
  NOR2X1 U85 ( .A(n298), .B(n301), .Y(n93) );
  NAND2X1 U86 ( .A(n298), .B(n301), .Y(n94) );
  AOI21X1 U88 ( .A(n1649), .B(n96), .C(n97), .Y(n95) );
  NOR2X1 U89 ( .A(n98), .B(n53), .Y(n96) );
  OAI21X1 U90 ( .A(n1609), .B(n98), .C(n99), .Y(n97) );
  NOR2X1 U93 ( .A(n102), .B(n1496), .Y(n100) );
  OAI21X1 U94 ( .A(n140), .B(n102), .C(n103), .Y(n101) );
  NOR2X1 U97 ( .A(n130), .B(n106), .Y(n104) );
  OAI21X1 U98 ( .A(n1452), .B(n133), .C(n107), .Y(n105) );
  NAND2X1 U99 ( .A(n1588), .B(n1063), .Y(n106) );
  AOI21X1 U100 ( .A(n120), .B(n1588), .C(n109), .Y(n107) );
  NAND2X1 U106 ( .A(n302), .B(n307), .Y(n111) );
  AOI21X1 U108 ( .A(n1649), .B(n113), .C(n114), .Y(n112) );
  NOR2X1 U109 ( .A(n115), .B(n53), .Y(n113) );
  OAI21X1 U110 ( .A(n1610), .B(n115), .C(n116), .Y(n114) );
  NAND2X1 U111 ( .A(n1063), .B(n128), .Y(n115) );
  AOI21X1 U112 ( .A(n129), .B(n1064), .C(n120), .Y(n116) );
  NAND2X1 U120 ( .A(n308), .B(n1187), .Y(n122) );
  AOI21X1 U122 ( .A(n1649), .B(n124), .C(n125), .Y(n123) );
  NOR2X1 U123 ( .A(n126), .B(n53), .Y(n124) );
  OAI21X1 U124 ( .A(n1610), .B(n126), .C(n127), .Y(n125) );
  NOR2X1 U127 ( .A(n1254), .B(n1496), .Y(n128) );
  OAI21X1 U128 ( .A(n1262), .B(n1254), .C(n133), .Y(n129) );
  NOR2X1 U133 ( .A(n314), .B(n321), .Y(n130) );
  NAND2X1 U134 ( .A(n314), .B(n321), .Y(n133) );
  AOI21X1 U136 ( .A(n1649), .B(n135), .C(n136), .Y(n134) );
  NOR2X1 U137 ( .A(n1497), .B(n53), .Y(n135) );
  OAI21X1 U138 ( .A(n1188), .B(n1610), .C(n1262), .Y(n136) );
  AOI21X1 U142 ( .A(n151), .B(n1584), .C(n142), .Y(n140) );
  NAND2X1 U148 ( .A(n322), .B(n329), .Y(n144) );
  AOI21X1 U150 ( .A(n1649), .B(n146), .C(n147), .Y(n145) );
  NOR2X1 U151 ( .A(n148), .B(n53), .Y(n146) );
  OAI21X1 U152 ( .A(n1610), .B(n148), .C(n149), .Y(n147) );
  NAND2X1 U160 ( .A(n330), .B(n339), .Y(n149) );
  AOI21X1 U162 ( .A(n1649), .B(n1574), .C(n156), .Y(n154) );
  AOI21X1 U166 ( .A(n172), .B(n159), .C(n160), .Y(n52) );
  NOR2X1 U167 ( .A(n161), .B(n166), .Y(n159) );
  OAI21X1 U168 ( .A(n161), .B(n169), .C(n162), .Y(n160) );
  NAND2X1 U169 ( .A(n162), .B(n282), .Y(n62) );
  NOR2X1 U171 ( .A(n340), .B(n349), .Y(n161) );
  NAND2X1 U172 ( .A(n340), .B(n1341), .Y(n162) );
  AOI21X1 U174 ( .A(n1649), .B(n164), .C(n165), .Y(n163) );
  NOR2X1 U175 ( .A(n1393), .B(n173), .Y(n164) );
  OAI21X1 U176 ( .A(n174), .B(n1393), .C(n169), .Y(n165) );
  NAND2X1 U179 ( .A(n169), .B(n283), .Y(n63) );
  NOR2X1 U181 ( .A(n350), .B(n361), .Y(n166) );
  NAND2X1 U182 ( .A(n350), .B(n361), .Y(n169) );
  AOI21X1 U184 ( .A(n1649), .B(n1575), .C(n1626), .Y(n170) );
  NOR2X1 U189 ( .A(n177), .B(n182), .Y(n171) );
  OAI21X1 U190 ( .A(n177), .B(n183), .C(n178), .Y(n172) );
  NOR2X1 U193 ( .A(n373), .B(n362), .Y(n177) );
  NAND2X1 U194 ( .A(n1130), .B(n1625), .Y(n178) );
  XNOR2X1 U195 ( .A(n1306), .B(n65), .Y(product[35]) );
  AOI21X1 U196 ( .A(n1649), .B(n285), .C(n181), .Y(n179) );
  NAND2X1 U199 ( .A(n1217), .B(n285), .Y(n65) );
  NOR2X1 U201 ( .A(n387), .B(n374), .Y(n182) );
  NAND2X1 U202 ( .A(n374), .B(n387), .Y(n183) );
  XOR2X1 U203 ( .A(n191), .B(n66), .Y(product[34]) );
  OAI21X1 U204 ( .A(n213), .B(n185), .C(n186), .Y(n51) );
  NAND2X1 U205 ( .A(n187), .B(n199), .Y(n185) );
  AOI21X1 U206 ( .A(n200), .B(n1349), .C(n188), .Y(n186) );
  NOR2X1 U207 ( .A(n189), .B(n194), .Y(n187) );
  OAI21X1 U208 ( .A(n1481), .B(n197), .C(n190), .Y(n188) );
  NAND2X1 U209 ( .A(n286), .B(n190), .Y(n66) );
  NOR2X1 U211 ( .A(n1375), .B(n388), .Y(n189) );
  NAND2X1 U212 ( .A(n1375), .B(n388), .Y(n190) );
  XOR2X1 U213 ( .A(n198), .B(n67), .Y(product[33]) );
  AOI21X1 U214 ( .A(n212), .B(n192), .C(n193), .Y(n191) );
  NOR2X1 U215 ( .A(n1576), .B(n201), .Y(n192) );
  OAI21X1 U216 ( .A(n202), .B(n1576), .C(n1203), .Y(n193) );
  NAND2X1 U219 ( .A(n1203), .B(n287), .Y(n67) );
  NOR2X1 U221 ( .A(n415), .B(n402), .Y(n194) );
  NAND2X1 U222 ( .A(n402), .B(n415), .Y(n197) );
  XOR2X1 U223 ( .A(n207), .B(n68), .Y(product[32]) );
  AOI21X1 U224 ( .A(n212), .B(n1572), .C(n1485), .Y(n198) );
  NOR2X1 U229 ( .A(n205), .B(n210), .Y(n199) );
  OAI21X1 U230 ( .A(n205), .B(n211), .C(n206), .Y(n200) );
  NAND2X1 U231 ( .A(n1232), .B(n288), .Y(n68) );
  NOR2X1 U233 ( .A(n429), .B(n416), .Y(n205) );
  NAND2X1 U234 ( .A(n1280), .B(n1547), .Y(n206) );
  AOI21X1 U236 ( .A(n212), .B(n289), .C(n209), .Y(n207) );
  NAND2X1 U239 ( .A(n1125), .B(n289), .Y(n69) );
  NOR2X1 U241 ( .A(n430), .B(n443), .Y(n210) );
  NAND2X1 U242 ( .A(n443), .B(n430), .Y(n211) );
  XNOR2X1 U243 ( .A(n218), .B(n70), .Y(product[30]) );
  AOI21X1 U245 ( .A(n222), .B(n214), .C(n215), .Y(n213) );
  NOR2X1 U246 ( .A(n219), .B(n1532), .Y(n214) );
  OAI21X1 U247 ( .A(n216), .B(n220), .C(n217), .Y(n215) );
  NAND2X1 U248 ( .A(n217), .B(n290), .Y(n70) );
  NOR2X1 U250 ( .A(n1221), .B(n444), .Y(n216) );
  NAND2X1 U251 ( .A(n444), .B(n1221), .Y(n217) );
  OAI21X1 U252 ( .A(n221), .B(n1429), .C(n220), .Y(n218) );
  NOR2X1 U253 ( .A(n469), .B(n458), .Y(n219) );
  NAND2X1 U254 ( .A(n469), .B(n458), .Y(n220) );
  OAI21X1 U256 ( .A(n233), .B(n223), .C(n224), .Y(n222) );
  NAND2X1 U257 ( .A(n1590), .B(n1585), .Y(n223) );
  AOI21X1 U258 ( .A(n1585), .B(n1589), .C(n1583), .Y(n224) );
  AOI21X1 U267 ( .A(n240), .B(n234), .C(n235), .Y(n233) );
  NOR2X1 U268 ( .A(n238), .B(n1417), .Y(n234) );
  OAI21X1 U269 ( .A(n236), .B(n239), .C(n237), .Y(n235) );
  NOR2X1 U270 ( .A(n501), .B(n1288), .Y(n236) );
  NAND2X1 U271 ( .A(n1288), .B(n501), .Y(n237) );
  NOR2X1 U272 ( .A(n509), .B(n502), .Y(n238) );
  NAND2X1 U273 ( .A(n509), .B(n502), .Y(n239) );
  OAI21X1 U274 ( .A(n243), .B(n241), .C(n242), .Y(n240) );
  NOR2X1 U275 ( .A(n517), .B(n510), .Y(n241) );
  NAND2X1 U276 ( .A(n517), .B(n510), .Y(n242) );
  AOI21X1 U277 ( .A(n248), .B(n1587), .C(n1591), .Y(n243) );
  OAI21X1 U282 ( .A(n251), .B(n249), .C(n250), .Y(n248) );
  NOR2X1 U283 ( .A(n529), .B(n524), .Y(n249) );
  NAND2X1 U284 ( .A(n529), .B(n524), .Y(n250) );
  AOI21X1 U285 ( .A(n256), .B(n1593), .C(n1595), .Y(n251) );
  OAI21X1 U290 ( .A(n257), .B(n259), .C(n258), .Y(n256) );
  NOR2X1 U291 ( .A(n537), .B(n534), .Y(n257) );
  NAND2X1 U292 ( .A(n534), .B(n537), .Y(n258) );
  AOI21X1 U293 ( .A(n264), .B(n1594), .C(n1596), .Y(n259) );
  OAI21X1 U298 ( .A(n265), .B(n267), .C(n266), .Y(n264) );
  NOR2X1 U299 ( .A(n707), .B(n540), .Y(n265) );
  NAND2X1 U300 ( .A(n707), .B(n540), .Y(n266) );
  AOI21X1 U301 ( .A(n1600), .B(n1597), .C(n1598), .Y(n267) );
  XOR2X1 U308 ( .A(n295), .B(n291), .Y(n292) );
  FAX1 U310 ( .A(n296), .B(n584), .C(n299), .YC(n293), .YS(n294) );
  FAX1 U312 ( .A(n585), .B(n300), .C(n303), .YC(n297), .YS(n298) );
  FAX1 U313 ( .A(n601), .B(n574), .C(n305), .YC(n299), .YS(n300) );
  FAX1 U315 ( .A(n306), .B(n602), .C(n586), .YC(n303), .YS(n304) );
  FAX1 U319 ( .A(n619), .B(n319), .C(n575), .YC(n311), .YS(n312) );
  FAX1 U322 ( .A(n320), .B(n620), .C(n588), .YC(n317), .YS(n318) );
  FAX1 U324 ( .A(n333), .B(n331), .C(n324), .YC(n321), .YS(n322) );
  FAX1 U325 ( .A(n1213), .B(n328), .C(n326), .YC(n323), .YS(n324) );
  FAX1 U326 ( .A(n605), .B(n621), .C(n589), .YC(n325), .YS(n326) );
  FAX1 U327 ( .A(n337), .B(n576), .C(n1337), .YC(n327), .YS(n328) );
  FAX1 U331 ( .A(n338), .B(n638), .C(n590), .YC(n335), .YS(n336) );
  FAX1 U336 ( .A(n607), .B(n639), .C(n591), .YC(n345), .YS(n346) );
  FAX1 U341 ( .A(n608), .B(n624), .C(n640), .YC(n355), .YS(n356) );
  FAX1 U350 ( .A(n378), .B(n389), .C(n376), .YC(n373), .YS(n374) );
  FAX1 U354 ( .A(n642), .B(n610), .C(n658), .YC(n381), .YS(n382) );
  FAX1 U355 ( .A(n386), .B(n674), .C(n594), .YC(n383), .YS(n384) );
  FAX1 U363 ( .A(n1529), .B(n579), .C(n1238), .YC(n399), .YS(n400) );
  FAX1 U368 ( .A(n660), .B(n644), .C(n612), .YC(n409), .YS(n410) );
  FAX1 U375 ( .A(n613), .B(n661), .C(n645), .YC(n423), .YS(n424) );
  FAX1 U383 ( .A(n614), .B(n694), .C(n630), .YC(n439), .YS(n440) );
  FAX1 U397 ( .A(n600), .B(n616), .C(n632), .YC(n467), .YS(n468) );
  FAX1 U401 ( .A(n649), .B(n665), .C(n566), .YC(n475), .YS(n476) );
  FAX1 U410 ( .A(n507), .B(n505), .C(n498), .YC(n493), .YS(n494) );
  FAX1 U414 ( .A(n506), .B(n511), .C(n504), .YC(n501), .YS(n502) );
  FAX1 U416 ( .A(n684), .B(n716), .C(n700), .YC(n505), .YS(n506) );
  HAX1 U421 ( .A(n717), .B(n701), .YC(n515), .YS(n516) );
  FAX1 U422 ( .A(n525), .B(n522), .C(n520), .YC(n517), .YS(n518) );
  FAX1 U425 ( .A(n531), .B(n528), .C(n526), .YC(n523), .YS(n524) );
  FAX1 U426 ( .A(n719), .B(n569), .C(n671), .YC(n525), .YS(n526) );
  HAX1 U427 ( .A(n687), .B(n703), .YC(n527), .YS(n528) );
  HAX1 U431 ( .A(n705), .B(n721), .YC(n535), .YS(n536) );
  FAX1 U432 ( .A(n690), .B(n722), .C(n706), .YC(n537), .YS(n538) );
  HAX1 U433 ( .A(n723), .B(n571), .YC(n539), .YS(n540) );
  NOR2X1 U434 ( .A(n1702), .B(n726), .Y(n573) );
  NOR2X1 U435 ( .A(n1702), .B(n727), .Y(n295) );
  NOR2X1 U436 ( .A(n1702), .B(n728), .Y(n574) );
  NOR2X1 U437 ( .A(n1702), .B(n729), .Y(n305) );
  NOR2X1 U438 ( .A(n1702), .B(n730), .Y(n575) );
  NOR2X1 U439 ( .A(n1200), .B(n1702), .Y(n319) );
  NOR2X1 U440 ( .A(n1702), .B(n1267), .Y(n576) );
  OAI22X1 U466 ( .A(n1701), .B(n1647), .C(n1301), .D(n757), .Y(n565) );
  OAI22X1 U469 ( .A(n1701), .B(n1301), .C(n1646), .D(n741), .Y(n584) );
  OAI22X1 U470 ( .A(n1070), .B(n742), .C(n1300), .D(n741), .Y(n585) );
  OAI22X1 U471 ( .A(n1646), .B(n743), .C(n1300), .D(n742), .Y(n586) );
  OAI22X1 U472 ( .A(n1646), .B(n744), .C(n1300), .D(n743), .Y(n587) );
  OAI22X1 U473 ( .A(n1646), .B(n745), .C(n1301), .D(n744), .Y(n588) );
  OAI22X1 U474 ( .A(n1646), .B(n746), .C(n1301), .D(n745), .Y(n589) );
  OAI22X1 U475 ( .A(n1646), .B(n747), .C(n1301), .D(n746), .Y(n590) );
  OAI22X1 U476 ( .A(n1646), .B(n748), .C(n1301), .D(n747), .Y(n591) );
  OAI22X1 U477 ( .A(n1646), .B(n749), .C(n1301), .D(n748), .Y(n592) );
  OAI22X1 U478 ( .A(n1646), .B(n750), .C(n1300), .D(n749), .Y(n593) );
  OAI22X1 U479 ( .A(n751), .B(n1647), .C(n1300), .D(n750), .Y(n594) );
  OAI22X1 U480 ( .A(n1070), .B(n752), .C(n751), .D(n1300), .Y(n595) );
  OAI22X1 U481 ( .A(n1070), .B(n753), .C(n1300), .D(n752), .Y(n596) );
  OAI22X1 U482 ( .A(n754), .B(n1647), .C(n1300), .D(n753), .Y(n597) );
  OAI22X1 U483 ( .A(n755), .B(n1070), .C(n1300), .D(n754), .Y(n598) );
  OAI22X1 U484 ( .A(n1301), .B(n755), .C(n1646), .D(n756), .Y(n599) );
  AND2X1 U485 ( .A(n1679), .B(n543), .Y(n600) );
  XNOR2X1 U487 ( .A(n1678), .B(n1700), .Y(n741) );
  XNOR2X1 U488 ( .A(n1500), .B(n1700), .Y(n742) );
  XNOR2X1 U489 ( .A(n1104), .B(n1700), .Y(n743) );
  XNOR2X1 U490 ( .A(n1071), .B(n1700), .Y(n744) );
  XNOR2X1 U491 ( .A(n1159), .B(n1700), .Y(n745) );
  XNOR2X1 U492 ( .A(n1011), .B(n1700), .Y(n746) );
  XNOR2X1 U493 ( .A(n1667), .B(n1700), .Y(n747) );
  XNOR2X1 U494 ( .A(n1028), .B(n1511), .Y(n748) );
  XNOR2X1 U495 ( .A(n1663), .B(n1700), .Y(n749) );
  XNOR2X1 U496 ( .A(n1661), .B(n1699), .Y(n750) );
  XNOR2X1 U497 ( .A(n1659), .B(n1699), .Y(n751) );
  XNOR2X1 U498 ( .A(n1111), .B(n1699), .Y(n752) );
  XNOR2X1 U499 ( .A(n1655), .B(n1699), .Y(n753) );
  XNOR2X1 U502 ( .A(n1206), .B(n1511), .Y(n756) );
  OAI22X1 U505 ( .A(n1623), .B(n1642), .C(n1498), .D(n774), .Y(n566) );
  OAI22X1 U508 ( .A(n1623), .B(n1498), .C(n1642), .D(n758), .Y(n602) );
  OAI22X1 U509 ( .A(n1642), .B(n759), .C(n1498), .D(n758), .Y(n603) );
  OAI22X1 U510 ( .A(n1642), .B(n760), .C(n1498), .D(n759), .Y(n604) );
  OAI22X1 U511 ( .A(n1642), .B(n761), .C(n1498), .D(n760), .Y(n605) );
  OAI22X1 U512 ( .A(n762), .B(n1642), .C(n1498), .D(n761), .Y(n606) );
  OAI22X1 U513 ( .A(n1642), .B(n763), .C(n1498), .D(n762), .Y(n607) );
  OAI22X1 U514 ( .A(n1642), .B(n764), .C(n1498), .D(n763), .Y(n608) );
  OAI22X1 U515 ( .A(n1643), .B(n765), .C(n1498), .D(n764), .Y(n609) );
  OAI22X1 U516 ( .A(n766), .B(n1643), .C(n1498), .D(n765), .Y(n610) );
  OAI22X1 U517 ( .A(n1643), .B(n767), .C(n1498), .D(n766), .Y(n611) );
  OAI22X1 U518 ( .A(n1643), .B(n768), .C(n1498), .D(n767), .Y(n612) );
  OAI22X1 U519 ( .A(n1643), .B(n769), .C(n1498), .D(n768), .Y(n613) );
  OAI22X1 U520 ( .A(n1643), .B(n770), .C(n1498), .D(n769), .Y(n614) );
  OAI22X1 U521 ( .A(n771), .B(n1643), .C(n1498), .D(n770), .Y(n615) );
  OAI22X1 U522 ( .A(n772), .B(n1643), .C(n1498), .D(n771), .Y(n616) );
  OAI22X1 U523 ( .A(n1498), .B(n772), .C(n1642), .D(n773), .Y(n617) );
  XNOR2X1 U526 ( .A(n1678), .B(n1695), .Y(n758) );
  XNOR2X1 U527 ( .A(n1695), .B(n1500), .Y(n759) );
  XNOR2X1 U528 ( .A(n1675), .B(n1695), .Y(n760) );
  XNOR2X1 U529 ( .A(n1034), .B(n1695), .Y(n761) );
  XNOR2X1 U530 ( .A(n1159), .B(n1695), .Y(n762) );
  XNOR2X1 U531 ( .A(n1011), .B(n1695), .Y(n763) );
  XNOR2X1 U533 ( .A(n1665), .B(n1695), .Y(n765) );
  XNOR2X1 U534 ( .A(n1663), .B(n1695), .Y(n766) );
  XNOR2X1 U535 ( .A(n1661), .B(n1695), .Y(n767) );
  XNOR2X1 U540 ( .A(n1651), .B(n1695), .Y(n772) );
  XNOR2X1 U541 ( .A(n1207), .B(n1695), .Y(n773) );
  OAI22X1 U544 ( .A(n1427), .B(n1640), .C(n1245), .D(n791), .Y(n567) );
  OAI22X1 U547 ( .A(n1427), .B(n1245), .C(n1438), .D(n775), .Y(n620) );
  OAI22X1 U548 ( .A(n1438), .B(n776), .C(n1245), .D(n775), .Y(n621) );
  OAI22X1 U549 ( .A(n1640), .B(n777), .C(n1245), .D(n776), .Y(n622) );
  OAI22X1 U550 ( .A(n1640), .B(n778), .C(n1201), .D(n777), .Y(n623) );
  OAI22X1 U551 ( .A(n1640), .B(n779), .C(n1245), .D(n778), .Y(n624) );
  OAI22X1 U552 ( .A(n1013), .B(n780), .C(n1201), .D(n779), .Y(n625) );
  OAI22X1 U553 ( .A(n1438), .B(n781), .C(n1201), .D(n780), .Y(n626) );
  OAI22X1 U554 ( .A(n1640), .B(n782), .C(n1201), .D(n781), .Y(n627) );
  OAI22X1 U555 ( .A(n1013), .B(n783), .C(n1245), .D(n782), .Y(n628) );
  OAI22X1 U556 ( .A(n1640), .B(n784), .C(n1201), .D(n783), .Y(n629) );
  OAI22X1 U557 ( .A(n1013), .B(n785), .C(n1201), .D(n784), .Y(n630) );
  OAI22X1 U558 ( .A(n1640), .B(n786), .C(n1126), .D(n785), .Y(n631) );
  OAI22X1 U559 ( .A(n1640), .B(n787), .C(n1245), .D(n786), .Y(n632) );
  OAI22X1 U560 ( .A(n1640), .B(n788), .C(n1201), .D(n1412), .Y(n633) );
  OAI22X1 U561 ( .A(n1438), .B(n789), .C(n1245), .D(n788), .Y(n634) );
  OAI22X1 U562 ( .A(n1245), .B(n789), .C(n1438), .D(n790), .Y(n635) );
  XNOR2X1 U566 ( .A(n1500), .B(n1521), .Y(n776) );
  XNOR2X1 U567 ( .A(n1675), .B(n1521), .Y(n777) );
  XNOR2X1 U568 ( .A(n1034), .B(n1521), .Y(n778) );
  XNOR2X1 U569 ( .A(n1159), .B(n1607), .Y(n779) );
  XNOR2X1 U571 ( .A(n1667), .B(n1607), .Y(n781) );
  XNOR2X1 U572 ( .A(n1665), .B(n1607), .Y(n782) );
  XNOR2X1 U573 ( .A(n1663), .B(n1607), .Y(n783) );
  XNOR2X1 U574 ( .A(n1661), .B(n1607), .Y(n784) );
  XNOR2X1 U575 ( .A(n1469), .B(n1607), .Y(n785) );
  XNOR2X1 U578 ( .A(n1653), .B(n1607), .Y(n788) );
  XNOR2X1 U579 ( .A(n1651), .B(n1607), .Y(n789) );
  XNOR2X1 U580 ( .A(n1679), .B(n1607), .Y(n790) );
  OR2X1 U581 ( .A(n1207), .B(n1427), .Y(n791) );
  OAI22X1 U583 ( .A(n1356), .B(n1637), .C(n1612), .D(n808), .Y(n568) );
  OAI22X1 U586 ( .A(n1356), .B(n1612), .C(n1637), .D(n792), .Y(n638) );
  OAI22X1 U587 ( .A(n1637), .B(n793), .C(n1612), .D(n792), .Y(n639) );
  OAI22X1 U588 ( .A(n1637), .B(n794), .C(n1612), .D(n793), .Y(n640) );
  OAI22X1 U589 ( .A(n1637), .B(n795), .C(n1612), .D(n794), .Y(n641) );
  OAI22X1 U590 ( .A(n1637), .B(n796), .C(n1612), .D(n795), .Y(n642) );
  OAI22X1 U591 ( .A(n797), .B(n1637), .C(n796), .D(n1612), .Y(n643) );
  OAI22X1 U592 ( .A(n798), .B(n1637), .C(n1612), .D(n797), .Y(n644) );
  OAI22X1 U593 ( .A(n799), .B(n1637), .C(n798), .D(n1612), .Y(n645) );
  OAI22X1 U594 ( .A(n1637), .B(n800), .C(n1612), .D(n799), .Y(n646) );
  OAI22X1 U596 ( .A(n802), .B(n1637), .C(n1612), .D(n801), .Y(n648) );
  OAI22X1 U597 ( .A(n803), .B(n1637), .C(n1612), .D(n802), .Y(n649) );
  OAI22X1 U598 ( .A(n1637), .B(n804), .C(n1612), .D(n803), .Y(n650) );
  OAI22X1 U600 ( .A(n806), .B(n1637), .C(n805), .D(n1612), .Y(n652) );
  OAI22X1 U601 ( .A(n806), .B(n1612), .C(n1637), .D(n807), .Y(n653) );
  AND2X1 U602 ( .A(n1582), .B(n552), .Y(n654) );
  XNOR2X1 U604 ( .A(n1678), .B(n1690), .Y(n792) );
  XNOR2X1 U605 ( .A(n1500), .B(n1690), .Y(n793) );
  XNOR2X1 U606 ( .A(n1675), .B(n1690), .Y(n794) );
  XNOR2X1 U607 ( .A(n1673), .B(n1690), .Y(n795) );
  XNOR2X1 U608 ( .A(n1671), .B(n1255), .Y(n796) );
  XNOR2X1 U614 ( .A(n1469), .B(n1255), .Y(n802) );
  XNOR2X1 U615 ( .A(n1112), .B(n1608), .Y(n803) );
  XNOR2X1 U617 ( .A(n1653), .B(n1255), .Y(n805) );
  XNOR2X1 U618 ( .A(n1175), .B(n1255), .Y(n806) );
  OR2X1 U620 ( .A(n1679), .B(n1356), .Y(n808) );
  OAI22X1 U622 ( .A(n1689), .B(n1374), .C(n1355), .D(n825), .Y(n569) );
  OAI22X1 U625 ( .A(n1689), .B(n1355), .C(n1374), .D(n809), .Y(n656) );
  OAI22X1 U626 ( .A(n1621), .B(n810), .C(n1355), .D(n809), .Y(n657) );
  OAI22X1 U627 ( .A(n811), .B(n1374), .C(n1355), .D(n810), .Y(n658) );
  OAI22X1 U628 ( .A(n812), .B(n1621), .C(n811), .D(n1549), .Y(n659) );
  OAI22X1 U629 ( .A(n1374), .B(n813), .C(n812), .D(n1635), .Y(n660) );
  OAI22X1 U630 ( .A(n814), .B(n1636), .C(n1549), .D(n813), .Y(n661) );
  OAI22X1 U631 ( .A(n1621), .B(n815), .C(n1549), .D(n814), .Y(n662) );
  OAI22X1 U632 ( .A(n1374), .B(n816), .C(n815), .D(n1635), .Y(n663) );
  OAI22X1 U633 ( .A(n1374), .B(n817), .C(n1355), .D(n816), .Y(n664) );
  OAI22X1 U634 ( .A(n818), .B(n1636), .C(n1355), .D(n817), .Y(n665) );
  OAI22X1 U635 ( .A(n1621), .B(n819), .C(n1355), .D(n818), .Y(n666) );
  OAI22X1 U636 ( .A(n1374), .B(n820), .C(n1635), .D(n819), .Y(n667) );
  OAI22X1 U637 ( .A(n1374), .B(n821), .C(n1355), .D(n820), .Y(n668) );
  OAI22X1 U638 ( .A(n822), .B(n1621), .C(n1355), .D(n821), .Y(n669) );
  OAI22X1 U639 ( .A(n1621), .B(n823), .C(n1355), .D(n822), .Y(n670) );
  OAI22X1 U640 ( .A(n1355), .B(n823), .C(n1636), .D(n824), .Y(n671) );
  XNOR2X1 U643 ( .A(n1678), .B(n1687), .Y(n809) );
  XNOR2X1 U644 ( .A(n1500), .B(n1687), .Y(n810) );
  XNOR2X1 U645 ( .A(n1675), .B(n1687), .Y(n811) );
  XNOR2X1 U646 ( .A(n1673), .B(n1687), .Y(n812) );
  XNOR2X1 U649 ( .A(n1667), .B(n1687), .Y(n815) );
  XNOR2X1 U650 ( .A(n1028), .B(n1687), .Y(n816) );
  XNOR2X1 U651 ( .A(n1663), .B(n1687), .Y(n817) );
  XNOR2X1 U653 ( .A(n1469), .B(n1687), .Y(n819) );
  XNOR2X1 U654 ( .A(n1112), .B(n1687), .Y(n820) );
  XNOR2X1 U656 ( .A(n1653), .B(n1687), .Y(n822) );
  XNOR2X1 U657 ( .A(n1651), .B(n1687), .Y(n823) );
  XNOR2X1 U658 ( .A(n1582), .B(n1687), .Y(n824) );
  OR2X1 U659 ( .A(n1206), .B(n1689), .Y(n825) );
  OAI22X1 U661 ( .A(n1686), .B(n1230), .C(n1632), .D(n842), .Y(n570) );
  OAI22X1 U664 ( .A(n1686), .B(n1632), .C(n826), .D(n1634), .Y(n674) );
  OAI22X1 U665 ( .A(n1634), .B(n827), .C(n1632), .D(n826), .Y(n675) );
  OAI22X1 U666 ( .A(n1634), .B(n828), .C(n827), .D(n1632), .Y(n676) );
  OAI22X1 U667 ( .A(n829), .B(n1634), .C(n1632), .D(n828), .Y(n677) );
  OAI22X1 U668 ( .A(n830), .B(n1634), .C(n1632), .D(n829), .Y(n678) );
  OAI22X1 U669 ( .A(n831), .B(n1634), .C(n830), .D(n1632), .Y(n679) );
  OAI22X1 U670 ( .A(n1634), .B(n832), .C(n1190), .D(n1632), .Y(n680) );
  OAI22X1 U671 ( .A(n1634), .B(n833), .C(n1632), .D(n832), .Y(n681) );
  OAI22X1 U672 ( .A(n834), .B(n1634), .C(n1632), .D(n833), .Y(n682) );
  OAI22X1 U673 ( .A(n1634), .B(n835), .C(n1632), .D(n834), .Y(n683) );
  OAI22X1 U674 ( .A(n1634), .B(n836), .C(n1632), .D(n835), .Y(n684) );
  OAI22X1 U675 ( .A(n1634), .B(n837), .C(n1632), .D(n836), .Y(n685) );
  OAI22X1 U676 ( .A(n1634), .B(n838), .C(n1632), .D(n837), .Y(n686) );
  OAI22X1 U677 ( .A(n1634), .B(n839), .C(n1632), .D(n838), .Y(n687) );
  OAI22X1 U678 ( .A(n1634), .B(n840), .C(n1632), .D(n839), .Y(n688) );
  OAI22X1 U679 ( .A(n1632), .B(n840), .C(n1230), .D(n841), .Y(n689) );
  AND2X1 U680 ( .A(n1582), .B(n1602), .Y(n690) );
  XNOR2X1 U683 ( .A(n1500), .B(n1684), .Y(n827) );
  XNOR2X1 U685 ( .A(n1034), .B(n1684), .Y(n829) );
  XNOR2X1 U686 ( .A(n1671), .B(n1685), .Y(n830) );
  XNOR2X1 U687 ( .A(n1669), .B(n1684), .Y(n831) );
  XNOR2X1 U689 ( .A(n1028), .B(n1684), .Y(n833) );
  XNOR2X1 U690 ( .A(n1663), .B(n1684), .Y(n834) );
  XNOR2X1 U691 ( .A(n1661), .B(n1684), .Y(n835) );
  XNOR2X1 U692 ( .A(n1530), .B(n1684), .Y(n836) );
  XNOR2X1 U693 ( .A(n1111), .B(n1684), .Y(n837) );
  XNOR2X1 U694 ( .A(n1120), .B(n1684), .Y(n838) );
  XNOR2X1 U695 ( .A(n1025), .B(n1684), .Y(n839) );
  XNOR2X1 U696 ( .A(n1651), .B(n1684), .Y(n840) );
  XNOR2X1 U697 ( .A(n1206), .B(n1684), .Y(n841) );
  OR2X1 U698 ( .A(n1582), .B(n1686), .Y(n842) );
  OAI22X1 U700 ( .A(n1382), .B(n1631), .C(n1580), .D(n859), .Y(n571) );
  OAI22X1 U703 ( .A(n1630), .B(n1382), .C(n843), .D(n1631), .Y(n692) );
  OAI22X1 U704 ( .A(n1631), .B(n844), .C(n1630), .D(n843), .Y(n693) );
  OAI22X1 U705 ( .A(n845), .B(n1631), .C(n1580), .D(n844), .Y(n694) );
  OAI22X1 U706 ( .A(n1631), .B(n846), .C(n1630), .D(n845), .Y(n695) );
  OAI22X1 U707 ( .A(n1631), .B(n847), .C(n1580), .D(n846), .Y(n696) );
  OAI22X1 U708 ( .A(n1631), .B(n848), .C(n1630), .D(n847), .Y(n697) );
  OAI22X1 U709 ( .A(n1631), .B(n849), .C(n1580), .D(n848), .Y(n698) );
  OAI22X1 U710 ( .A(n1631), .B(n850), .C(n1630), .D(n849), .Y(n699) );
  OAI22X1 U711 ( .A(n1631), .B(n851), .C(n1580), .D(n850), .Y(n700) );
  OAI22X1 U712 ( .A(n1631), .B(n852), .C(n1630), .D(n851), .Y(n701) );
  OAI22X1 U713 ( .A(n1631), .B(n853), .C(n1580), .D(n852), .Y(n702) );
  OAI22X1 U715 ( .A(n1631), .B(n855), .C(n1580), .D(n854), .Y(n704) );
  OAI22X1 U716 ( .A(n1631), .B(n856), .C(n1630), .D(n855), .Y(n705) );
  OAI22X1 U717 ( .A(n1631), .B(n857), .C(n1580), .D(n856), .Y(n706) );
  OAI22X1 U718 ( .A(n1630), .B(n857), .C(n1631), .D(n858), .Y(n707) );
  AND2X1 U719 ( .A(n1582), .B(n561), .Y(n708) );
  XNOR2X1 U724 ( .A(n1034), .B(n1236), .Y(n846) );
  XNOR2X1 U725 ( .A(n1159), .B(n1237), .Y(n847) );
  XNOR2X1 U726 ( .A(n1011), .B(n1236), .Y(n848) );
  XNOR2X1 U727 ( .A(n1667), .B(n1237), .Y(n849) );
  XNOR2X1 U728 ( .A(n1028), .B(n1237), .Y(n850) );
  XNOR2X1 U729 ( .A(n1663), .B(n1236), .Y(n851) );
  XNOR2X1 U731 ( .A(n1530), .B(n1237), .Y(n853) );
  XNOR2X1 U732 ( .A(n1112), .B(n1236), .Y(n854) );
  XNOR2X1 U734 ( .A(n1653), .B(n1237), .Y(n856) );
  XNOR2X1 U735 ( .A(n1651), .B(n1236), .Y(n857) );
  XNOR2X1 U736 ( .A(n1207), .B(n1236), .Y(n858) );
  OR2X1 U737 ( .A(n1207), .B(n1382), .Y(n859) );
  OAI22X1 U739 ( .A(n1682), .B(n1253), .C(n1326), .D(n876), .Y(n572) );
  OAI22X1 U742 ( .A(n1682), .B(n1327), .C(n1629), .D(n860), .Y(n710) );
  OAI22X1 U743 ( .A(n861), .B(n1251), .C(n1327), .D(n860), .Y(n711) );
  OAI22X1 U744 ( .A(n1629), .B(n862), .C(n1326), .D(n861), .Y(n712) );
  OAI22X1 U745 ( .A(n1629), .B(n863), .C(n1326), .D(n862), .Y(n713) );
  OAI22X1 U746 ( .A(n864), .B(n1629), .C(n1326), .D(n863), .Y(n714) );
  OAI22X1 U747 ( .A(n1252), .B(n865), .C(n1326), .D(n864), .Y(n715) );
  OAI22X1 U748 ( .A(n1251), .B(n866), .C(n1327), .D(n865), .Y(n716) );
  OAI22X1 U749 ( .A(n1253), .B(n867), .C(n1326), .D(n866), .Y(n717) );
  OAI22X1 U750 ( .A(n1252), .B(n868), .C(n1326), .D(n867), .Y(n718) );
  OAI22X1 U751 ( .A(n1252), .B(n869), .C(n1326), .D(n868), .Y(n719) );
  OAI22X1 U752 ( .A(n1233), .B(n1629), .C(n1327), .D(n869), .Y(n720) );
  OAI22X1 U753 ( .A(n1253), .B(n871), .C(n1327), .D(n1233), .Y(n721) );
  OAI22X1 U754 ( .A(n1253), .B(n872), .C(n1327), .D(n871), .Y(n722) );
  OAI22X1 U755 ( .A(n1253), .B(n873), .C(n1327), .D(n872), .Y(n723) );
  OAI22X1 U756 ( .A(n1252), .B(n874), .C(n1326), .D(n873), .Y(n724) );
  OAI22X1 U757 ( .A(n1327), .B(n874), .C(n1252), .D(n875), .Y(n725) );
  XNOR2X1 U760 ( .A(n1675), .B(n1579), .Y(n862) );
  XNOR2X1 U761 ( .A(n1673), .B(n1579), .Y(n863) );
  XNOR2X1 U762 ( .A(n1671), .B(n1681), .Y(n864) );
  XNOR2X1 U763 ( .A(n1669), .B(n1681), .Y(n865) );
  XNOR2X1 U764 ( .A(n1667), .B(n1681), .Y(n866) );
  XNOR2X1 U765 ( .A(n1028), .B(n1681), .Y(n867) );
  XNOR2X1 U766 ( .A(n1663), .B(n1681), .Y(n868) );
  XNOR2X1 U769 ( .A(n1111), .B(n1681), .Y(n871) );
  XNOR2X1 U770 ( .A(n1655), .B(n1681), .Y(n872) );
  XNOR2X1 U771 ( .A(n1025), .B(n1681), .Y(n873) );
  XNOR2X1 U772 ( .A(n1651), .B(n1681), .Y(n874) );
  XNOR2X1 U773 ( .A(n1206), .B(n1681), .Y(n875) );
  OR2X1 U774 ( .A(n1582), .B(n1682), .Y(n876) );
  XNOR2X1 U803 ( .A(n37), .B(a[29]), .Y(n46) );
  NAND2X1 U816 ( .A(n898), .B(n1581), .Y(n18) );
  BUFX2 U828 ( .A(n412), .Y(n995) );
  INVX1 U829 ( .A(n643), .Y(n996) );
  INVX1 U830 ( .A(n996), .Y(n997) );
  INVX1 U831 ( .A(n1675), .Y(n998) );
  INVX1 U832 ( .A(n729), .Y(n999) );
  INVX2 U833 ( .A(n1548), .Y(n1549) );
  NAND3X1 U834 ( .A(n1542), .B(n1543), .C(n1544), .Y(n1000) );
  INVX4 U835 ( .A(n1016), .Y(n579) );
  INVX1 U836 ( .A(n695), .Y(n1001) );
  INVX1 U837 ( .A(n1001), .Y(n1002) );
  BUFX2 U838 ( .A(n410), .Y(n1003) );
  BUFX2 U839 ( .A(n323), .Y(n1004) );
  BUFX2 U840 ( .A(n631), .Y(n1005) );
  INVX1 U841 ( .A(n1499), .Y(n1006) );
  INVX8 U842 ( .A(n1692), .Y(n1499) );
  INVX2 U843 ( .A(n597), .Y(n1114) );
  BUFX2 U844 ( .A(n664), .Y(n1007) );
  XOR2X1 U845 ( .A(n1500), .B(n1008), .Y(n861) );
  INVX8 U846 ( .A(n1579), .Y(n1008) );
  INVX4 U847 ( .A(n37), .Y(n1696) );
  OAI22X1 U848 ( .A(n1637), .B(n801), .C(n1612), .D(n800), .Y(n1009) );
  INVX2 U849 ( .A(n365), .Y(n1385) );
  XOR2X1 U850 ( .A(n1211), .B(n1010), .Y(n364) );
  INVX1 U851 ( .A(n377), .Y(n1010) );
  INVX4 U852 ( .A(n1668), .Y(n1011) );
  INVX4 U853 ( .A(n1668), .Y(n1669) );
  BUFX2 U854 ( .A(n622), .Y(n1012) );
  XNOR2X1 U855 ( .A(n1110), .B(n69), .Y(product[31]) );
  BUFX4 U856 ( .A(n1573), .Y(n1013) );
  XNOR2X1 U857 ( .A(n494), .B(n1014), .Y(n1288) );
  XNOR2X1 U858 ( .A(n503), .B(n496), .Y(n1014) );
  XNOR2X1 U859 ( .A(n1015), .B(n1177), .Y(n498) );
  XNOR2X1 U860 ( .A(n683), .B(n635), .Y(n1015) );
  OR2X2 U861 ( .A(n1654), .B(n1702), .Y(n1016) );
  AND2X2 U862 ( .A(n1697), .B(n1663), .Y(n577) );
  BUFX2 U863 ( .A(n426), .Y(n1017) );
  INVX4 U864 ( .A(n1655), .Y(n1307) );
  INVX4 U865 ( .A(n1658), .Y(n1469) );
  INVX2 U866 ( .A(n1562), .Y(n1636) );
  INVX4 U867 ( .A(n1562), .Y(n1374) );
  XOR2X1 U868 ( .A(a[17]), .B(n1682), .Y(n1018) );
  BUFX4 U869 ( .A(n25), .Y(n1608) );
  INVX4 U870 ( .A(n1608), .Y(n1356) );
  INVX8 U871 ( .A(n1691), .Y(n1690) );
  AND2X2 U872 ( .A(n1018), .B(n899), .Y(n1019) );
  INVX4 U873 ( .A(n917), .Y(n1325) );
  INVX2 U874 ( .A(a[15]), .Y(n917) );
  INVX8 U875 ( .A(n1604), .Y(n1612) );
  INVX2 U876 ( .A(n1545), .Y(n1604) );
  AND2X2 U877 ( .A(n651), .B(n715), .Y(n1020) );
  AND2X2 U878 ( .A(n133), .B(n279), .Y(n1021) );
  AND2X1 U879 ( .A(n178), .B(n284), .Y(n1022) );
  INVX8 U880 ( .A(n1641), .Y(n1642) );
  INVX2 U881 ( .A(n598), .Y(n1234) );
  INVX4 U882 ( .A(n1024), .Y(n1640) );
  XNOR2X1 U883 ( .A(n1023), .B(n1005), .Y(n452) );
  XNOR2X1 U884 ( .A(n679), .B(n565), .Y(n1023) );
  AND2X2 U885 ( .A(n895), .B(n1639), .Y(n1024) );
  INVX1 U886 ( .A(n1652), .Y(n1025) );
  INVX2 U887 ( .A(n877), .Y(n1026) );
  INVX2 U888 ( .A(n877), .Y(n1677) );
  XNOR2X1 U889 ( .A(n7), .B(n1027), .Y(n899) );
  INVX2 U890 ( .A(a[17]), .Y(n1027) );
  INVX4 U891 ( .A(n1664), .Y(n1028) );
  INVX4 U892 ( .A(n1664), .Y(n1665) );
  XOR2X1 U893 ( .A(n1661), .B(n1425), .Y(n818) );
  XOR2X1 U894 ( .A(n662), .B(n678), .Y(n1029) );
  XOR2X1 U895 ( .A(n1029), .B(n646), .Y(n438) );
  NAND2X1 U896 ( .A(n646), .B(n662), .Y(n1030) );
  NAND2X1 U897 ( .A(n646), .B(n678), .Y(n1031) );
  NAND2X1 U898 ( .A(n662), .B(n678), .Y(n1032) );
  NAND3X1 U899 ( .A(n1031), .B(n1030), .C(n1032), .Y(n437) );
  INVX1 U900 ( .A(n1650), .Y(n1175) );
  AND2X2 U901 ( .A(n687), .B(n703), .Y(n1033) );
  INVX4 U902 ( .A(n1672), .Y(n1034) );
  INVX4 U903 ( .A(n1672), .Y(n1673) );
  XOR2X1 U904 ( .A(n570), .B(n689), .Y(n1035) );
  XOR2X1 U905 ( .A(n536), .B(n1035), .Y(n534) );
  NAND2X1 U906 ( .A(n536), .B(n570), .Y(n1036) );
  NAND2X1 U907 ( .A(n536), .B(n689), .Y(n1037) );
  NAND2X1 U908 ( .A(n570), .B(n689), .Y(n1038) );
  NAND3X1 U909 ( .A(n1037), .B(n1036), .C(n1038), .Y(n533) );
  NAND2X1 U910 ( .A(n1115), .B(n1194), .Y(n1039) );
  INVX1 U911 ( .A(n1561), .Y(n1040) );
  BUFX2 U912 ( .A(n655), .Y(n1041) );
  XNOR2X1 U913 ( .A(n1042), .B(n453), .Y(n436) );
  XNOR2X1 U914 ( .A(n451), .B(n1107), .Y(n1042) );
  INVX1 U915 ( .A(n235), .Y(n1043) );
  INVX1 U916 ( .A(n1043), .Y(n1044) );
  XOR2X1 U917 ( .A(n1668), .B(n1255), .Y(n797) );
  BUFX2 U918 ( .A(n1486), .Y(n1045) );
  XNOR2X1 U919 ( .A(a[15]), .B(n1682), .Y(n900) );
  XOR2X1 U920 ( .A(n1046), .B(n1047), .Y(n444) );
  XNOR2X1 U921 ( .A(n448), .B(n459), .Y(n1046) );
  XOR2X1 U922 ( .A(n1586), .B(n1260), .Y(n1047) );
  XOR2X1 U923 ( .A(n467), .B(n1048), .Y(n450) );
  XNOR2X1 U924 ( .A(n1426), .B(n663), .Y(n1048) );
  XOR2X1 U925 ( .A(n450), .B(n1049), .Y(n1586) );
  INVX8 U926 ( .A(n463), .Y(n1049) );
  NAND3X1 U927 ( .A(n1618), .B(n1619), .C(n1620), .Y(n1050) );
  XOR2X1 U928 ( .A(n1051), .B(n1328), .Y(n418) );
  XNOR2X1 U929 ( .A(n422), .B(n435), .Y(n1051) );
  XNOR2X1 U930 ( .A(n1083), .B(n611), .Y(n1052) );
  XOR2X1 U931 ( .A(n680), .B(n696), .Y(n1053) );
  XOR2X1 U932 ( .A(n1199), .B(n1053), .Y(n464) );
  NAND2X1 U933 ( .A(n1199), .B(n680), .Y(n1054) );
  NAND2X1 U934 ( .A(n1199), .B(n696), .Y(n1055) );
  NAND2X1 U935 ( .A(n680), .B(n696), .Y(n1056) );
  NAND3X1 U936 ( .A(n1055), .B(n1054), .C(n1056), .Y(n463) );
  XOR2X1 U937 ( .A(n681), .B(n633), .Y(n1057) );
  XOR2X1 U938 ( .A(n617), .B(n1057), .Y(n478) );
  NAND2X1 U939 ( .A(n617), .B(n633), .Y(n1058) );
  NAND2X1 U940 ( .A(n617), .B(n681), .Y(n1059) );
  NAND2X1 U941 ( .A(n633), .B(n681), .Y(n1060) );
  NAND3X1 U942 ( .A(n1059), .B(n1058), .C(n1060), .Y(n477) );
  INVX1 U943 ( .A(n149), .Y(n151) );
  NAND3X1 U944 ( .A(n1416), .B(n1414), .C(n1415), .Y(n1061) );
  XNOR2X1 U945 ( .A(n1651), .B(n1699), .Y(n755) );
  XNOR2X1 U946 ( .A(n1062), .B(n1105), .Y(n442) );
  XOR2X1 U947 ( .A(n1234), .B(n582), .Y(n1062) );
  OR2X2 U948 ( .A(n308), .B(n313), .Y(n1063) );
  OR2X2 U949 ( .A(n308), .B(n313), .Y(n1064) );
  INVX2 U950 ( .A(n887), .Y(n1065) );
  INVX2 U951 ( .A(n887), .Y(n1658) );
  XOR2X1 U952 ( .A(n685), .B(n653), .Y(n1066) );
  XOR2X1 U953 ( .A(n669), .B(n1066), .Y(n514) );
  NAND2X1 U954 ( .A(n669), .B(n653), .Y(n1067) );
  NAND2X1 U955 ( .A(n669), .B(n685), .Y(n1068) );
  NAND2X1 U956 ( .A(n653), .B(n685), .Y(n1069) );
  NAND3X1 U957 ( .A(n1068), .B(n1067), .C(n1069), .Y(n513) );
  INVX2 U958 ( .A(n1551), .Y(n1070) );
  INVX2 U959 ( .A(n1551), .Y(n1647) );
  BUFX2 U960 ( .A(n999), .Y(n1071) );
  BUFX2 U961 ( .A(n437), .Y(n1072) );
  INVX2 U962 ( .A(n1250), .Y(n1252) );
  XNOR2X1 U963 ( .A(n1073), .B(n391), .Y(n376) );
  XNOR2X1 U964 ( .A(n393), .B(n1154), .Y(n1073) );
  BUFX2 U965 ( .A(n1463), .Y(n1074) );
  XOR2X1 U966 ( .A(n682), .B(n714), .Y(n1075) );
  XOR2X1 U967 ( .A(n1075), .B(n666), .Y(n488) );
  NAND2X1 U968 ( .A(n714), .B(n682), .Y(n1076) );
  NAND2X1 U969 ( .A(n714), .B(n666), .Y(n1077) );
  NAND2X1 U970 ( .A(n682), .B(n666), .Y(n1078) );
  NAND3X1 U971 ( .A(n1076), .B(n1077), .C(n1078), .Y(n487) );
  XOR2X1 U972 ( .A(n480), .B(n489), .Y(n1079) );
  XOR2X1 U973 ( .A(n1079), .B(n487), .Y(n474) );
  NAND2X1 U974 ( .A(n480), .B(n489), .Y(n1080) );
  NAND2X1 U975 ( .A(n480), .B(n487), .Y(n1081) );
  NAND2X1 U976 ( .A(n489), .B(n487), .Y(n1082) );
  NAND3X1 U977 ( .A(n1080), .B(n1081), .C(n1082), .Y(n473) );
  XNOR2X1 U978 ( .A(n1083), .B(n611), .Y(n396) );
  XNOR2X1 U979 ( .A(n643), .B(n659), .Y(n1083) );
  XOR2X1 U980 ( .A(n1676), .B(n1577), .Y(n844) );
  XOR2X1 U981 ( .A(n672), .B(n720), .Y(n1084) );
  XOR2X1 U982 ( .A(n1084), .B(n688), .Y(n532) );
  XOR2X1 U983 ( .A(n704), .B(n535), .Y(n1085) );
  XOR2X1 U984 ( .A(n1085), .B(n532), .Y(n530) );
  NAND2X1 U985 ( .A(n672), .B(n1092), .Y(n1086) );
  NAND2X1 U986 ( .A(n672), .B(n688), .Y(n1087) );
  NAND2X1 U987 ( .A(n1092), .B(n688), .Y(n1088) );
  NAND3X1 U988 ( .A(n1086), .B(n1087), .C(n1088), .Y(n531) );
  NAND2X1 U989 ( .A(n704), .B(n535), .Y(n1089) );
  NAND2X1 U990 ( .A(n704), .B(n532), .Y(n1090) );
  NAND2X1 U991 ( .A(n535), .B(n532), .Y(n1091) );
  NAND3X1 U992 ( .A(n1089), .B(n1090), .C(n1091), .Y(n529) );
  BUFX2 U993 ( .A(n720), .Y(n1092) );
  XOR2X1 U994 ( .A(n519), .B(n514), .Y(n1093) );
  XOR2X1 U995 ( .A(n512), .B(n1093), .Y(n510) );
  NAND2X1 U996 ( .A(n512), .B(n519), .Y(n1094) );
  NAND2X1 U997 ( .A(n512), .B(n514), .Y(n1095) );
  NAND2X1 U998 ( .A(n519), .B(n514), .Y(n1096) );
  NAND3X1 U999 ( .A(n1095), .B(n1094), .C(n1096), .Y(n509) );
  NAND2X1 U1000 ( .A(n1103), .B(n516), .Y(n1099) );
  NAND2X1 U1001 ( .A(n1097), .B(n1098), .Y(n1100) );
  NAND2X1 U1002 ( .A(n1099), .B(n1100), .Y(n1370) );
  INVX2 U1003 ( .A(n1103), .Y(n1097) );
  INVX1 U1004 ( .A(n516), .Y(n1098) );
  INVX1 U1005 ( .A(n568), .Y(n1103) );
  XNOR2X1 U1006 ( .A(n1101), .B(n713), .Y(n480) );
  INVX1 U1007 ( .A(n697), .Y(n1101) );
  XOR2X1 U1008 ( .A(n418), .B(n1102), .Y(n416) );
  XNOR2X1 U1009 ( .A(n431), .B(n1531), .Y(n1102) );
  INVX1 U1010 ( .A(n998), .Y(n1104) );
  BUFX2 U1011 ( .A(n710), .Y(n1105) );
  XOR2X1 U1012 ( .A(n1215), .B(n1689), .Y(n897) );
  XOR2X1 U1013 ( .A(n1661), .B(n1683), .Y(n852) );
  BUFX2 U1014 ( .A(n1487), .Y(n1106) );
  INVX2 U1015 ( .A(n623), .Y(n1350) );
  INVX2 U1016 ( .A(n548), .Y(n619) );
  INVX4 U1017 ( .A(n1552), .Y(n1646) );
  INVX2 U1018 ( .A(n63), .Y(n1550) );
  INVX2 U1019 ( .A(n62), .Y(n1560) );
  INVX2 U1020 ( .A(n1702), .Y(n1291) );
  INVX2 U1021 ( .A(n1654), .Y(n1120) );
  AND2X2 U1022 ( .A(n711), .B(n615), .Y(n1107) );
  INVX2 U1023 ( .A(n1601), .Y(n1622) );
  INVX2 U1024 ( .A(n1244), .Y(n1239) );
  OAI22X1 U1025 ( .A(n1637), .B(n801), .C(n1612), .D(n800), .Y(n1108) );
  XNOR2X1 U1026 ( .A(n1109), .B(n1521), .Y(n895) );
  INVX2 U1027 ( .A(a[25]), .Y(n1109) );
  XOR2X1 U1028 ( .A(n1307), .B(n1607), .Y(n787) );
  INVX1 U1029 ( .A(n1613), .Y(n1110) );
  XOR2X1 U1030 ( .A(n86), .B(n55), .Y(product[45]) );
  INVX1 U1031 ( .A(n1426), .Y(n1439) );
  INVX4 U1032 ( .A(n1656), .Y(n1111) );
  INVX4 U1033 ( .A(n1656), .Y(n1112) );
  INVX2 U1034 ( .A(n1656), .Y(n1657) );
  BUFX2 U1035 ( .A(n493), .Y(n1113) );
  BUFX2 U1036 ( .A(n473), .Y(n1223) );
  INVX1 U1037 ( .A(n1114), .Y(n1115) );
  XOR2X1 U1038 ( .A(n1116), .B(n1226), .Y(n1198) );
  XOR2X1 U1039 ( .A(n1376), .B(n581), .Y(n1116) );
  NAND3X1 U1040 ( .A(n1503), .B(n1501), .C(n1502), .Y(n1117) );
  BUFX2 U1041 ( .A(n497), .Y(n1118) );
  BUFX2 U1042 ( .A(n485), .Y(n1119) );
  INVX2 U1043 ( .A(n508), .Y(n1257) );
  XOR2X1 U1044 ( .A(n1121), .B(n404), .Y(n402) );
  XOR2X1 U1045 ( .A(n417), .B(n406), .Y(n1121) );
  INVX1 U1046 ( .A(a[21]), .Y(n1215) );
  NAND3X1 U1047 ( .A(n1303), .B(n1302), .C(n1304), .Y(n1122) );
  BUFX4 U1048 ( .A(n475), .Y(n1123) );
  AOI22X1 U1049 ( .A(n1325), .B(n1681), .C(n1603), .D(n1681), .Y(n1124) );
  BUFX2 U1050 ( .A(n211), .Y(n1125) );
  INVX2 U1051 ( .A(n659), .Y(n1244) );
  XNOR2X1 U1052 ( .A(a[23]), .B(n1691), .Y(n896) );
  INVX2 U1053 ( .A(n25), .Y(n1691) );
  AND2X2 U1054 ( .A(n1207), .B(n549), .Y(n636) );
  INVX1 U1055 ( .A(n549), .Y(n1126) );
  INVX4 U1056 ( .A(n886), .Y(n1127) );
  INVX1 U1057 ( .A(n886), .Y(n1309) );
  XOR2X1 U1058 ( .A(n1128), .B(n1129), .Y(n1525) );
  INVX1 U1059 ( .A(n452), .Y(n1128) );
  INVX1 U1060 ( .A(n454), .Y(n1129) );
  OR2X2 U1061 ( .A(n1679), .B(n1702), .Y(n757) );
  BUFX2 U1062 ( .A(n373), .Y(n1130) );
  BUFX2 U1063 ( .A(n466), .Y(n1131) );
  XOR2X1 U1064 ( .A(n1132), .B(n397), .Y(n1154) );
  XOR2X1 U1065 ( .A(n399), .B(n626), .Y(n1132) );
  BUFX2 U1066 ( .A(n1464), .Y(n1133) );
  XNOR2X1 U1067 ( .A(n1134), .B(n1007), .Y(n466) );
  XNOR2X1 U1068 ( .A(n648), .B(n712), .Y(n1134) );
  XOR2X1 U1069 ( .A(n493), .B(n486), .Y(n1135) );
  XOR2X1 U1070 ( .A(n1135), .B(n484), .Y(n482) );
  NAND2X1 U1071 ( .A(n484), .B(n1113), .Y(n1136) );
  NAND2X1 U1072 ( .A(n484), .B(n486), .Y(n1137) );
  NAND2X1 U1073 ( .A(n1113), .B(n486), .Y(n1138) );
  NAND3X1 U1074 ( .A(n1137), .B(n1136), .C(n1138), .Y(n481) );
  XOR2X1 U1075 ( .A(n1267), .B(n1684), .Y(n832) );
  XOR2X1 U1076 ( .A(n358), .B(n371), .Y(n1139) );
  XOR2X1 U1077 ( .A(n1139), .B(n369), .Y(n354) );
  NAND2X1 U1078 ( .A(n369), .B(n358), .Y(n1140) );
  NAND2X1 U1079 ( .A(n369), .B(n371), .Y(n1141) );
  NAND2X1 U1080 ( .A(n358), .B(n371), .Y(n1142) );
  NAND3X1 U1081 ( .A(n1141), .B(n1140), .C(n1142), .Y(n353) );
  INVX4 U1082 ( .A(n7), .Y(n1683) );
  INVX2 U1083 ( .A(n1236), .Y(n1382) );
  XOR2X1 U1084 ( .A(n1143), .B(n1144), .Y(n430) );
  INVX1 U1085 ( .A(n432), .Y(n1143) );
  XNOR2X1 U1086 ( .A(n434), .B(n445), .Y(n1144) );
  XOR2X1 U1087 ( .A(n1297), .B(n1145), .Y(n432) );
  INVX1 U1088 ( .A(n449), .Y(n1145) );
  INVX4 U1089 ( .A(n1637), .Y(n1339) );
  XOR2X1 U1090 ( .A(n385), .B(n578), .Y(n1146) );
  XOR2X1 U1091 ( .A(n1146), .B(n1266), .Y(n372) );
  XOR2X1 U1092 ( .A(n625), .B(n593), .Y(n1147) );
  XOR2X1 U1093 ( .A(n1147), .B(n372), .Y(n368) );
  NAND2X1 U1094 ( .A(n385), .B(n578), .Y(n1148) );
  NAND2X1 U1095 ( .A(n385), .B(n1266), .Y(n1149) );
  NAND2X1 U1096 ( .A(n578), .B(n1266), .Y(n1150) );
  NAND3X1 U1097 ( .A(n1148), .B(n1149), .C(n1150), .Y(n371) );
  NAND2X1 U1098 ( .A(n625), .B(n593), .Y(n1151) );
  NAND2X1 U1099 ( .A(n372), .B(n625), .Y(n1152) );
  NAND2X1 U1100 ( .A(n372), .B(n593), .Y(n1153) );
  NAND3X1 U1101 ( .A(n1151), .B(n1152), .C(n1153), .Y(n367) );
  BUFX2 U1102 ( .A(n25), .Y(n1191) );
  XOR2X1 U1103 ( .A(n334), .B(n345), .Y(n1155) );
  XOR2X1 U1104 ( .A(n336), .B(n1155), .Y(n332) );
  NAND2X1 U1105 ( .A(n334), .B(n336), .Y(n1156) );
  NAND2X1 U1106 ( .A(n336), .B(n345), .Y(n1157) );
  NAND2X1 U1107 ( .A(n334), .B(n345), .Y(n1158) );
  NAND3X1 U1108 ( .A(n1157), .B(n1156), .C(n1158), .Y(n331) );
  INVX4 U1109 ( .A(n1670), .Y(n1159) );
  INVX4 U1110 ( .A(n1670), .Y(n1671) );
  XOR2X1 U1111 ( .A(n1160), .B(n1248), .Y(n1264) );
  XOR2X1 U1112 ( .A(n414), .B(n427), .Y(n1160) );
  OR2X2 U1113 ( .A(n1702), .B(n1656), .Y(n1599) );
  XOR2X1 U1114 ( .A(n650), .B(n618), .Y(n1161) );
  XOR2X1 U1115 ( .A(n634), .B(n1161), .Y(n490) );
  NAND2X1 U1116 ( .A(n634), .B(n650), .Y(n1162) );
  NAND2X1 U1117 ( .A(n634), .B(n618), .Y(n1163) );
  NAND2X1 U1118 ( .A(n650), .B(n618), .Y(n1164) );
  NAND3X1 U1119 ( .A(n1163), .B(n1162), .C(n1164), .Y(n489) );
  OR2X1 U1120 ( .A(n1631), .B(n854), .Y(n1165) );
  OR2X1 U1121 ( .A(n1630), .B(n853), .Y(n1166) );
  NAND2X1 U1122 ( .A(n1165), .B(n1166), .Y(n703) );
  XOR2X1 U1123 ( .A(n702), .B(n718), .Y(n1167) );
  XOR2X1 U1124 ( .A(n527), .B(n1167), .Y(n520) );
  NAND2X1 U1125 ( .A(n1033), .B(n702), .Y(n1168) );
  NAND2X1 U1126 ( .A(n1033), .B(n718), .Y(n1169) );
  NAND2X1 U1127 ( .A(n702), .B(n718), .Y(n1170) );
  NAND3X1 U1128 ( .A(n1169), .B(n1168), .C(n1170), .Y(n519) );
  INVX4 U1129 ( .A(n1383), .Y(n1630) );
  XOR2X1 U1130 ( .A(n316), .B(n318), .Y(n1171) );
  XOR2X1 U1131 ( .A(n1004), .B(n1171), .Y(n314) );
  NAND2X1 U1132 ( .A(n323), .B(n316), .Y(n1172) );
  NAND2X1 U1133 ( .A(n323), .B(n318), .Y(n1173) );
  NAND2X1 U1134 ( .A(n316), .B(n318), .Y(n1174) );
  NAND3X1 U1135 ( .A(n1173), .B(n1172), .C(n1174), .Y(n313) );
  INVX4 U1136 ( .A(n1687), .Y(n1425) );
  XNOR2X1 U1137 ( .A(n1176), .B(n1240), .Y(n484) );
  XNOR2X1 U1138 ( .A(n488), .B(n490), .Y(n1176) );
  BUFX2 U1139 ( .A(n667), .Y(n1177) );
  XOR2X1 U1140 ( .A(n424), .B(n439), .Y(n1178) );
  XOR2X1 U1141 ( .A(n1178), .B(n1017), .Y(n420) );
  NAND2X1 U1142 ( .A(n424), .B(n426), .Y(n1179) );
  NAND2X1 U1143 ( .A(n426), .B(n439), .Y(n1180) );
  NAND2X1 U1144 ( .A(n424), .B(n439), .Y(n1181) );
  NAND3X1 U1145 ( .A(n1180), .B(n1181), .C(n1179), .Y(n419) );
  XOR2X1 U1146 ( .A(n441), .B(n1198), .Y(n1182) );
  XOR2X1 U1147 ( .A(n1182), .B(n1072), .Y(n422) );
  NAND2X1 U1148 ( .A(n437), .B(n441), .Y(n1183) );
  NAND2X1 U1149 ( .A(n437), .B(n1198), .Y(n1184) );
  NAND2X1 U1150 ( .A(n1198), .B(n441), .Y(n1185) );
  NAND3X1 U1151 ( .A(n1184), .B(n1183), .C(n1185), .Y(n421) );
  INVX1 U1152 ( .A(n313), .Y(n1186) );
  INVX1 U1153 ( .A(n1186), .Y(n1187) );
  BUFX2 U1154 ( .A(n1497), .Y(n1188) );
  BUFX2 U1155 ( .A(n420), .Y(n1189) );
  BUFX2 U1156 ( .A(n831), .Y(n1190) );
  INVX2 U1157 ( .A(n433), .Y(n1328) );
  XOR2X1 U1158 ( .A(n1219), .B(n1192), .Y(n496) );
  XNOR2X1 U1159 ( .A(n699), .B(n567), .Y(n1192) );
  XOR2X1 U1160 ( .A(n13), .B(a[19]), .Y(n898) );
  INVX4 U1161 ( .A(n13), .Y(n1686) );
  INVX1 U1162 ( .A(n677), .Y(n1193) );
  INVX1 U1163 ( .A(n1193), .Y(n1194) );
  NAND3X1 U1164 ( .A(n1460), .B(n1461), .C(n1462), .Y(n1195) );
  XOR2X1 U1165 ( .A(n1667), .B(n1356), .Y(n798) );
  INVX2 U1166 ( .A(n1612), .Y(n1338) );
  BUFX2 U1167 ( .A(n327), .Y(n1196) );
  AND2X2 U1168 ( .A(n917), .B(n900), .Y(n1197) );
  XOR2X1 U1169 ( .A(n1680), .B(n1255), .Y(n807) );
  AND2X2 U1170 ( .A(n713), .B(n697), .Y(n1199) );
  BUFX2 U1171 ( .A(n1668), .Y(n1200) );
  BUFX4 U1172 ( .A(n1638), .Y(n1201) );
  INVX1 U1173 ( .A(n1605), .Y(n1638) );
  XNOR2X1 U1174 ( .A(n325), .B(n1202), .Y(n316) );
  XNOR2X1 U1175 ( .A(n327), .B(n604), .Y(n1202) );
  INVX2 U1176 ( .A(n385), .Y(n386) );
  BUFX2 U1177 ( .A(n197), .Y(n1203) );
  XNOR2X1 U1178 ( .A(n1204), .B(n352), .Y(n350) );
  XNOR2X1 U1179 ( .A(n363), .B(n354), .Y(n1204) );
  XOR2X1 U1180 ( .A(n390), .B(n1205), .Y(n388) );
  XOR2X1 U1181 ( .A(n403), .B(n392), .Y(n1205) );
  INVX4 U1182 ( .A(n1680), .Y(n1206) );
  INVX4 U1183 ( .A(n1680), .Y(n1207) );
  INVX1 U1184 ( .A(n500), .Y(n1219) );
  NAND3X1 U1185 ( .A(n1446), .B(n1447), .C(n1448), .Y(n1208) );
  BUFX2 U1186 ( .A(n332), .Y(n1209) );
  INVX8 U1187 ( .A(n1), .Y(n1682) );
  BUFX2 U1188 ( .A(n1), .Y(n1579) );
  INVX1 U1189 ( .A(n1474), .Y(n1210) );
  XNOR2X1 U1190 ( .A(n368), .B(n379), .Y(n1211) );
  NAND3X1 U1191 ( .A(n1565), .B(n1566), .C(n1567), .Y(n1212) );
  XOR2X1 U1192 ( .A(n1307), .B(n1237), .Y(n855) );
  BUFX4 U1193 ( .A(n335), .Y(n1213) );
  INVX2 U1194 ( .A(n420), .Y(n1531) );
  BUFX2 U1195 ( .A(n448), .Y(n1214) );
  NAND3X1 U1196 ( .A(n1539), .B(n1540), .C(n1541), .Y(n1216) );
  INVX1 U1197 ( .A(n181), .Y(n1217) );
  XOR2X1 U1198 ( .A(n1430), .B(n1223), .Y(n1218) );
  BUFX2 U1199 ( .A(n414), .Y(n1220) );
  XOR2X1 U1200 ( .A(n1200), .B(n1006), .Y(n780) );
  NAND3X1 U1201 ( .A(n1435), .B(n1436), .C(n1437), .Y(n1221) );
  NAND3X1 U1202 ( .A(n1295), .B(n1294), .C(n1296), .Y(n1222) );
  NOR2X1 U1203 ( .A(n415), .B(n402), .Y(n1224) );
  BUFX2 U1204 ( .A(n382), .Y(n1225) );
  OAI22X1 U1205 ( .A(n1631), .B(n844), .C(n1630), .D(n843), .Y(n1226) );
  XOR2X1 U1206 ( .A(n1227), .B(n1228), .Y(n404) );
  XNOR2X1 U1207 ( .A(n1264), .B(n421), .Y(n1227) );
  INVX1 U1208 ( .A(n419), .Y(n1228) );
  INVX2 U1209 ( .A(n1696), .Y(n1229) );
  INVX8 U1210 ( .A(n1019), .Y(n1631) );
  BUFX2 U1211 ( .A(n1634), .Y(n1230) );
  NAND3X1 U1212 ( .A(n1488), .B(n1106), .C(n1045), .Y(n1231) );
  NAND2X1 U1213 ( .A(n1280), .B(n1547), .Y(n1232) );
  INVX2 U1214 ( .A(n1546), .Y(n1547) );
  XNOR2X1 U1215 ( .A(n1469), .B(n1611), .Y(n1233) );
  BUFX2 U1216 ( .A(n370), .Y(n1235) );
  INVX4 U1217 ( .A(n1683), .Y(n1236) );
  INVX4 U1218 ( .A(n1683), .Y(n1237) );
  INVX2 U1219 ( .A(n1683), .Y(n1577) );
  AOI22X1 U1220 ( .A(n1383), .B(n1237), .C(n1236), .D(n1019), .Y(n1238) );
  NAND3X1 U1221 ( .A(n1329), .B(n1330), .C(n1331), .Y(n1240) );
  NOR2X1 U1222 ( .A(n238), .B(n1417), .Y(n1241) );
  NAND3X1 U1223 ( .A(n1352), .B(n1351), .C(n1353), .Y(n1242) );
  XNOR2X1 U1224 ( .A(n1586), .B(n1260), .Y(n1243) );
  BUFX4 U1225 ( .A(n461), .Y(n1260) );
  INVX2 U1226 ( .A(n1605), .Y(n1245) );
  NAND2X1 U1227 ( .A(n1476), .B(n1475), .Y(n1246) );
  XNOR2X1 U1228 ( .A(n1247), .B(n411), .Y(n394) );
  XNOR2X1 U1229 ( .A(n400), .B(n413), .Y(n1247) );
  XNOR2X1 U1230 ( .A(a[27]), .B(n1499), .Y(n1305) );
  NAND3X1 U1231 ( .A(n1505), .B(n1504), .C(n1506), .Y(n1248) );
  BUFX2 U1232 ( .A(n398), .Y(n1249) );
  XNOR2X1 U1233 ( .A(n1309), .B(n1682), .Y(n869) );
  INVX8 U1234 ( .A(n1682), .Y(n1681) );
  INVX4 U1235 ( .A(n1628), .Y(n1250) );
  INVX2 U1236 ( .A(n1250), .Y(n1251) );
  INVX4 U1237 ( .A(n1250), .Y(n1253) );
  XNOR2X1 U1238 ( .A(n1662), .B(n1356), .Y(n800) );
  INVX1 U1239 ( .A(n279), .Y(n1254) );
  BUFX4 U1240 ( .A(n1608), .Y(n1255) );
  INVX2 U1241 ( .A(n1325), .Y(n1327) );
  AOI21X1 U1242 ( .A(n240), .B(n1241), .C(n1044), .Y(n1256) );
  XNOR2X1 U1243 ( .A(n1418), .B(n1257), .Y(n504) );
  NAND3X1 U1244 ( .A(n1516), .B(n1517), .C(n1518), .Y(n1258) );
  BUFX2 U1245 ( .A(n609), .Y(n1259) );
  INVX1 U1246 ( .A(n1529), .Y(n1261) );
  AOI21X1 U1247 ( .A(n151), .B(n1584), .C(n142), .Y(n1262) );
  BUFX4 U1248 ( .A(n1124), .Y(n1529) );
  NAND3X1 U1249 ( .A(n1526), .B(n1527), .C(n1528), .Y(n1263) );
  NAND3X1 U1250 ( .A(n1434), .B(n1433), .C(n1432), .Y(n1265) );
  INVX2 U1251 ( .A(n1498), .Y(n546) );
  AOI22X1 U1252 ( .A(n1602), .B(n1685), .C(n1633), .D(n1684), .Y(n1266) );
  INVX2 U1253 ( .A(n1667), .Y(n1267) );
  XOR2X1 U1254 ( .A(n304), .B(n311), .Y(n1268) );
  XOR2X1 U1255 ( .A(n309), .B(n1268), .Y(n302) );
  NAND2X1 U1256 ( .A(n309), .B(n304), .Y(n1269) );
  NAND2X1 U1257 ( .A(n309), .B(n311), .Y(n1270) );
  NAND2X1 U1258 ( .A(n304), .B(n311), .Y(n1271) );
  NAND3X1 U1259 ( .A(n1270), .B(n1269), .C(n1271), .Y(n301) );
  XOR2X1 U1260 ( .A(n603), .B(n587), .Y(n1272) );
  XOR2X1 U1261 ( .A(n312), .B(n1272), .Y(n310) );
  NAND2X1 U1262 ( .A(n312), .B(n603), .Y(n1273) );
  NAND2X1 U1263 ( .A(n312), .B(n587), .Y(n1274) );
  NAND2X1 U1264 ( .A(n603), .B(n587), .Y(n1275) );
  NAND3X1 U1265 ( .A(n1274), .B(n1273), .C(n1275), .Y(n309) );
  XOR2X1 U1266 ( .A(n1026), .B(n1521), .Y(n775) );
  INVX4 U1267 ( .A(n1677), .Y(n1678) );
  XNOR2X1 U1268 ( .A(n1675), .B(n1684), .Y(n828) );
  XOR2X1 U1269 ( .A(n442), .B(n440), .Y(n1276) );
  XOR2X1 U1270 ( .A(n438), .B(n1276), .Y(n434) );
  NAND2X1 U1271 ( .A(n442), .B(n438), .Y(n1277) );
  NAND2X1 U1272 ( .A(n440), .B(n438), .Y(n1278) );
  NAND2X1 U1273 ( .A(n442), .B(n440), .Y(n1279) );
  NAND3X1 U1274 ( .A(n1278), .B(n1277), .C(n1279), .Y(n433) );
  INVX8 U1275 ( .A(n1633), .Y(n1634) );
  BUFX2 U1276 ( .A(n429), .Y(n1280) );
  XNOR2X1 U1277 ( .A(n1664), .B(n1356), .Y(n799) );
  XOR2X1 U1278 ( .A(n1026), .B(n1), .Y(n860) );
  INVX1 U1279 ( .A(n1018), .Y(n1383) );
  INVX2 U1280 ( .A(n1325), .Y(n1326) );
  NAND2X1 U1281 ( .A(n432), .B(n1050), .Y(n1281) );
  NAND2X1 U1282 ( .A(n432), .B(n434), .Y(n1282) );
  NAND2X1 U1283 ( .A(n1050), .B(n434), .Y(n1283) );
  NAND3X1 U1284 ( .A(n1283), .B(n1281), .C(n1282), .Y(n429) );
  XOR2X1 U1285 ( .A(n1675), .B(n1683), .Y(n845) );
  NAND2X1 U1286 ( .A(n611), .B(n643), .Y(n1284) );
  NAND2X1 U1287 ( .A(n611), .B(n1239), .Y(n1285) );
  NAND2X1 U1288 ( .A(n997), .B(n1239), .Y(n1286) );
  NAND3X1 U1289 ( .A(n1285), .B(n1284), .C(n1286), .Y(n395) );
  XNOR2X1 U1290 ( .A(n1287), .B(n599), .Y(n454) );
  XNOR2X1 U1291 ( .A(n695), .B(n1108), .Y(n1287) );
  NAND3X1 U1292 ( .A(n1422), .B(n1423), .C(n1424), .Y(n1289) );
  NAND3X1 U1293 ( .A(n1484), .B(n1482), .C(n1483), .Y(n1290) );
  AND2X2 U1294 ( .A(n1291), .B(n1028), .Y(n337) );
  INVX2 U1295 ( .A(n1689), .Y(n1688) );
  XNOR2X1 U1296 ( .A(n1292), .B(n652), .Y(n508) );
  XNOR2X1 U1297 ( .A(n668), .B(n636), .Y(n1292) );
  XOR2X1 U1298 ( .A(n577), .B(n359), .Y(n1293) );
  XOR2X1 U1299 ( .A(n1041), .B(n1293), .Y(n348) );
  NAND2X1 U1300 ( .A(n577), .B(n655), .Y(n1294) );
  NAND2X1 U1301 ( .A(n655), .B(n359), .Y(n1295) );
  NAND2X1 U1302 ( .A(n577), .B(n359), .Y(n1296) );
  XNOR2X1 U1303 ( .A(n436), .B(n1263), .Y(n1297) );
  NAND3X1 U1304 ( .A(n1533), .B(n1534), .C(n1535), .Y(n1298) );
  XOR2X1 U1305 ( .A(n13), .B(a[21]), .Y(n1601) );
  INVX8 U1306 ( .A(n1305), .Y(n1498) );
  INVX8 U1307 ( .A(n1645), .Y(n1299) );
  INVX8 U1308 ( .A(n1299), .Y(n1300) );
  INVX8 U1309 ( .A(n1299), .Y(n1301) );
  NAND2X1 U1310 ( .A(n325), .B(n1196), .Y(n1302) );
  NAND2X1 U1311 ( .A(n325), .B(n604), .Y(n1303) );
  NAND2X1 U1312 ( .A(n1196), .B(n604), .Y(n1304) );
  NAND3X1 U1313 ( .A(n1303), .B(n1302), .C(n1304), .Y(n315) );
  INVX1 U1314 ( .A(n182), .Y(n285) );
  INVX1 U1315 ( .A(n1648), .Y(n1306) );
  NAND3X1 U1316 ( .A(n1332), .B(n1333), .C(n1334), .Y(n1308) );
  INVX1 U1317 ( .A(n886), .Y(n1660) );
  XOR2X1 U1318 ( .A(n609), .B(n641), .Y(n1310) );
  XOR2X1 U1319 ( .A(n1310), .B(n657), .Y(n370) );
  XOR2X1 U1320 ( .A(n381), .B(n383), .Y(n1311) );
  XOR2X1 U1321 ( .A(n1311), .B(n1235), .Y(n366) );
  NAND2X1 U1322 ( .A(n641), .B(n1259), .Y(n1312) );
  NAND2X1 U1323 ( .A(n641), .B(n657), .Y(n1313) );
  NAND2X1 U1324 ( .A(n1259), .B(n657), .Y(n1314) );
  NAND3X1 U1325 ( .A(n1312), .B(n1313), .C(n1314), .Y(n369) );
  NAND2X1 U1326 ( .A(n381), .B(n383), .Y(n1315) );
  NAND2X1 U1327 ( .A(n383), .B(n370), .Y(n1316) );
  NAND2X1 U1328 ( .A(n381), .B(n370), .Y(n1317) );
  NAND3X1 U1329 ( .A(n1315), .B(n1317), .C(n1316), .Y(n365) );
  XOR2X1 U1330 ( .A(n628), .B(n676), .Y(n1318) );
  XOR2X1 U1331 ( .A(n1318), .B(n596), .Y(n412) );
  NAND2X1 U1332 ( .A(n628), .B(n676), .Y(n1319) );
  NAND2X1 U1333 ( .A(n628), .B(n596), .Y(n1320) );
  NAND2X1 U1334 ( .A(n596), .B(n676), .Y(n1321) );
  NAND3X1 U1335 ( .A(n1319), .B(n1320), .C(n1321), .Y(n411) );
  NAND2X1 U1336 ( .A(n400), .B(n1061), .Y(n1322) );
  NAND2X1 U1337 ( .A(n411), .B(n400), .Y(n1323) );
  NAND2X1 U1338 ( .A(n1061), .B(n411), .Y(n1324) );
  NAND3X1 U1339 ( .A(n1322), .B(n1323), .C(n1324), .Y(n393) );
  NAND2X1 U1340 ( .A(n699), .B(n567), .Y(n1329) );
  NAND2X1 U1341 ( .A(n500), .B(n699), .Y(n1330) );
  NAND2X1 U1342 ( .A(n500), .B(n567), .Y(n1331) );
  NAND3X1 U1343 ( .A(n1329), .B(n1330), .C(n1331), .Y(n495) );
  NAND2X1 U1344 ( .A(n488), .B(n490), .Y(n1332) );
  NAND2X1 U1345 ( .A(n495), .B(n490), .Y(n1333) );
  NAND2X1 U1346 ( .A(n488), .B(n495), .Y(n1334) );
  NAND3X1 U1347 ( .A(n1332), .B(n1333), .C(n1334), .Y(n483) );
  OR2X1 U1348 ( .A(n1637), .B(n805), .Y(n1335) );
  OR2X1 U1349 ( .A(n1612), .B(n804), .Y(n1336) );
  NAND2X1 U1350 ( .A(n1335), .B(n1336), .Y(n651) );
  AOI22X1 U1351 ( .A(n1338), .B(n1690), .C(n1339), .D(n1690), .Y(n1337) );
  INVX1 U1352 ( .A(n349), .Y(n1340) );
  INVX1 U1353 ( .A(n1340), .Y(n1341) );
  NAND3X1 U1354 ( .A(n1453), .B(n1454), .C(n1455), .Y(n1342) );
  XOR2X1 U1355 ( .A(n1653), .B(n1701), .Y(n754) );
  XOR2X1 U1356 ( .A(a[27]), .B(n1499), .Y(n1343) );
  INVX1 U1357 ( .A(n1034), .Y(n729) );
  INVX1 U1358 ( .A(n210), .Y(n289) );
  XNOR2X1 U1359 ( .A(n1344), .B(n629), .Y(n426) );
  XNOR2X1 U1360 ( .A(n677), .B(n597), .Y(n1344) );
  XOR2X1 U1361 ( .A(n332), .B(n343), .Y(n1345) );
  XOR2X1 U1362 ( .A(n1212), .B(n1345), .Y(n330) );
  NAND2X1 U1363 ( .A(n341), .B(n1209), .Y(n1346) );
  NAND2X1 U1364 ( .A(n341), .B(n343), .Y(n1347) );
  NAND2X1 U1365 ( .A(n1209), .B(n343), .Y(n1348) );
  NAND3X1 U1366 ( .A(n1347), .B(n1346), .C(n1348), .Y(n329) );
  NOR2X1 U1367 ( .A(n189), .B(n1224), .Y(n1349) );
  INVX2 U1368 ( .A(n1124), .Y(n1376) );
  INVX4 U1369 ( .A(n885), .Y(n1662) );
  XNOR2X1 U1370 ( .A(n348), .B(n1350), .Y(n1362) );
  INVX4 U1371 ( .A(n878), .Y(n1676) );
  NAND2X1 U1372 ( .A(n693), .B(n1376), .Y(n1351) );
  NAND2X1 U1373 ( .A(n693), .B(n581), .Y(n1352) );
  NAND2X1 U1374 ( .A(n1376), .B(n581), .Y(n1353) );
  NAND3X1 U1375 ( .A(n1352), .B(n1351), .C(n1353), .Y(n427) );
  BUFX2 U1376 ( .A(n46), .Y(n1354) );
  INVX1 U1377 ( .A(n46), .Y(n1644) );
  INVX4 U1378 ( .A(n1548), .Y(n1355) );
  BUFX2 U1379 ( .A(n1666), .Y(n1357) );
  XOR2X1 U1380 ( .A(n360), .B(n656), .Y(n1358) );
  XOR2X1 U1381 ( .A(n1358), .B(n592), .Y(n358) );
  NAND2X1 U1382 ( .A(n360), .B(n656), .Y(n1359) );
  NAND2X1 U1383 ( .A(n592), .B(n360), .Y(n1360) );
  NAND2X1 U1384 ( .A(n656), .B(n592), .Y(n1361) );
  NAND3X1 U1385 ( .A(n1359), .B(n1360), .C(n1361), .Y(n357) );
  XOR2X1 U1386 ( .A(n1362), .B(n357), .Y(n344) );
  NAND2X1 U1387 ( .A(n623), .B(n348), .Y(n1363) );
  NAND2X1 U1388 ( .A(n623), .B(n357), .Y(n1364) );
  NAND2X1 U1389 ( .A(n348), .B(n357), .Y(n1365) );
  NAND3X1 U1390 ( .A(n1363), .B(n1364), .C(n1365), .Y(n343) );
  XOR2X1 U1391 ( .A(n1668), .B(n1688), .Y(n814) );
  XOR2X1 U1392 ( .A(n654), .B(n686), .Y(n1366) );
  XOR2X1 U1393 ( .A(n1366), .B(n670), .Y(n522) );
  NAND2X1 U1394 ( .A(n654), .B(n686), .Y(n1367) );
  NAND2X1 U1395 ( .A(n654), .B(n670), .Y(n1368) );
  NAND2X1 U1396 ( .A(n686), .B(n670), .Y(n1369) );
  NAND3X1 U1397 ( .A(n1367), .B(n1368), .C(n1369), .Y(n521) );
  XOR2X1 U1398 ( .A(n1370), .B(n521), .Y(n512) );
  NAND2X1 U1399 ( .A(n568), .B(n516), .Y(n1371) );
  NAND2X1 U1400 ( .A(n568), .B(n521), .Y(n1372) );
  NAND2X1 U1401 ( .A(n516), .B(n521), .Y(n1373) );
  NAND3X1 U1402 ( .A(n1371), .B(n1372), .C(n1373), .Y(n511) );
  INVX1 U1403 ( .A(n1354), .Y(n543) );
  INVX1 U1404 ( .A(n100), .Y(n98) );
  INVX4 U1405 ( .A(n1599), .Y(n385) );
  INVX1 U1406 ( .A(n128), .Y(n126) );
  XOR2X1 U1407 ( .A(n1670), .B(n1688), .Y(n813) );
  XOR2X1 U1408 ( .A(n1656), .B(n1229), .Y(n769) );
  NAND3X1 U1409 ( .A(n1380), .B(n1378), .C(n1379), .Y(n1375) );
  NAND2X1 U1410 ( .A(n1343), .B(n1377), .Y(n42) );
  XOR2X1 U1411 ( .A(n37), .B(a[27]), .Y(n1377) );
  INVX1 U1412 ( .A(n211), .Y(n209) );
  INVX1 U1413 ( .A(n101), .Y(n99) );
  NAND2X1 U1414 ( .A(n404), .B(n1298), .Y(n1378) );
  NAND2X1 U1415 ( .A(n404), .B(n406), .Y(n1379) );
  NAND2X1 U1416 ( .A(n1298), .B(n406), .Y(n1380) );
  NAND3X1 U1417 ( .A(n1378), .B(n1379), .C(n1380), .Y(n401) );
  INVX1 U1418 ( .A(n129), .Y(n127) );
  INVX1 U1419 ( .A(n130), .Y(n279) );
  NAND3X1 U1420 ( .A(n1074), .B(n1133), .C(n1465), .Y(n1381) );
  AND2X2 U1421 ( .A(n1207), .B(n1548), .Y(n672) );
  XOR2X1 U1422 ( .A(n1384), .B(n1385), .Y(n352) );
  XNOR2X1 U1423 ( .A(n367), .B(n356), .Y(n1384) );
  BUFX2 U1424 ( .A(n431), .Y(n1386) );
  NAND2X1 U1425 ( .A(n1439), .B(n663), .Y(n1387) );
  NAND2X1 U1426 ( .A(n467), .B(n1439), .Y(n1388) );
  NAND2X1 U1427 ( .A(n467), .B(n663), .Y(n1389) );
  NAND3X1 U1428 ( .A(n1387), .B(n1388), .C(n1389), .Y(n449) );
  NAND2X1 U1429 ( .A(n436), .B(n447), .Y(n1390) );
  NAND2X1 U1430 ( .A(n436), .B(n449), .Y(n1391) );
  NAND2X1 U1431 ( .A(n447), .B(n449), .Y(n1392) );
  NAND3X1 U1432 ( .A(n1392), .B(n1391), .C(n1390), .Y(n431) );
  INVX2 U1433 ( .A(n283), .Y(n1393) );
  INVX8 U1434 ( .A(n1686), .Y(n1684) );
  NAND2X1 U1435 ( .A(n598), .B(n710), .Y(n1394) );
  NAND2X1 U1436 ( .A(n710), .B(n582), .Y(n1395) );
  NAND2X1 U1437 ( .A(n598), .B(n582), .Y(n1396) );
  NAND3X1 U1438 ( .A(n1395), .B(n1394), .C(n1396), .Y(n441) );
  XOR2X1 U1439 ( .A(n698), .B(n1020), .Y(n1397) );
  XOR2X1 U1440 ( .A(n1397), .B(n1118), .Y(n486) );
  NAND2X1 U1441 ( .A(n698), .B(n1020), .Y(n1398) );
  NAND2X1 U1442 ( .A(n698), .B(n497), .Y(n1399) );
  NAND2X1 U1443 ( .A(n1020), .B(n497), .Y(n1400) );
  NAND3X1 U1444 ( .A(n1398), .B(n1399), .C(n1400), .Y(n485) );
  XOR2X1 U1445 ( .A(n478), .B(n476), .Y(n1401) );
  XOR2X1 U1446 ( .A(n1401), .B(n1119), .Y(n472) );
  NAND2X1 U1447 ( .A(n476), .B(n478), .Y(n1402) );
  NAND2X1 U1448 ( .A(n476), .B(n485), .Y(n1403) );
  NAND2X1 U1449 ( .A(n478), .B(n485), .Y(n1404) );
  NAND3X1 U1450 ( .A(n1402), .B(n1403), .C(n1404), .Y(n471) );
  NAND2X1 U1451 ( .A(n667), .B(n683), .Y(n1405) );
  NAND2X1 U1452 ( .A(n635), .B(n667), .Y(n1406) );
  NAND2X1 U1453 ( .A(n635), .B(n683), .Y(n1407) );
  NAND3X1 U1454 ( .A(n1406), .B(n1405), .C(n1407), .Y(n497) );
  XOR2X1 U1455 ( .A(n375), .B(n366), .Y(n1408) );
  XOR2X1 U1456 ( .A(n364), .B(n1408), .Y(n362) );
  NAND2X1 U1457 ( .A(n364), .B(n1381), .Y(n1409) );
  NAND2X1 U1458 ( .A(n364), .B(n366), .Y(n1410) );
  NAND2X1 U1459 ( .A(n1381), .B(n366), .Y(n1411) );
  NAND3X1 U1460 ( .A(n1410), .B(n1409), .C(n1411), .Y(n361) );
  XOR2X1 U1461 ( .A(n651), .B(n715), .Y(n500) );
  XOR2X1 U1462 ( .A(n1655), .B(n1356), .Y(n804) );
  XNOR2X1 U1463 ( .A(n1120), .B(n1006), .Y(n1412) );
  XOR2X1 U1464 ( .A(n1376), .B(n580), .Y(n1413) );
  XOR2X1 U1465 ( .A(n1413), .B(n692), .Y(n414) );
  NAND2X1 U1466 ( .A(n692), .B(n1261), .Y(n1414) );
  NAND2X1 U1467 ( .A(n692), .B(n580), .Y(n1415) );
  NAND2X1 U1468 ( .A(n1261), .B(n580), .Y(n1416) );
  NAND3X1 U1469 ( .A(n1416), .B(n1414), .C(n1415), .Y(n413) );
  NOR2X1 U1470 ( .A(n501), .B(n1288), .Y(n1417) );
  XOR2X1 U1471 ( .A(n513), .B(n515), .Y(n1418) );
  NAND2X1 U1472 ( .A(n668), .B(n636), .Y(n1419) );
  NAND2X1 U1473 ( .A(n636), .B(n652), .Y(n1420) );
  NAND2X1 U1474 ( .A(n668), .B(n652), .Y(n1421) );
  NAND3X1 U1475 ( .A(n1419), .B(n1420), .C(n1421), .Y(n507) );
  NAND2X1 U1476 ( .A(n515), .B(n513), .Y(n1422) );
  NAND2X1 U1477 ( .A(n508), .B(n515), .Y(n1423) );
  NAND2X1 U1478 ( .A(n513), .B(n508), .Y(n1424) );
  NAND3X1 U1479 ( .A(n1422), .B(n1423), .C(n1424), .Y(n503) );
  XOR2X1 U1480 ( .A(n1655), .B(n1425), .Y(n821) );
  AND2X2 U1481 ( .A(n1697), .B(n1651), .Y(n581) );
  XNOR2X1 U1482 ( .A(n711), .B(n615), .Y(n1426) );
  INVX2 U1483 ( .A(n1065), .Y(n1659) );
  BUFX2 U1484 ( .A(n1694), .Y(n1427) );
  INVX4 U1485 ( .A(n31), .Y(n1694) );
  OR2X2 U1486 ( .A(n330), .B(n339), .Y(n1428) );
  INVX1 U1487 ( .A(n1428), .Y(n148) );
  BUFX4 U1488 ( .A(n1573), .Y(n1438) );
  XOR2X1 U1489 ( .A(n1657), .B(n1499), .Y(n786) );
  INVX8 U1490 ( .A(n1689), .Y(n1687) );
  BUFX2 U1491 ( .A(n219), .Y(n1429) );
  XOR2X1 U1492 ( .A(n464), .B(n468), .Y(n1430) );
  XOR2X1 U1493 ( .A(n1223), .B(n1430), .Y(n460) );
  XOR2X1 U1494 ( .A(n462), .B(n471), .Y(n1431) );
  XOR2X1 U1495 ( .A(n1431), .B(n1218), .Y(n458) );
  NAND2X1 U1496 ( .A(n468), .B(n464), .Y(n1432) );
  NAND2X1 U1497 ( .A(n473), .B(n468), .Y(n1433) );
  NAND2X1 U1498 ( .A(n473), .B(n464), .Y(n1434) );
  NAND3X1 U1499 ( .A(n1434), .B(n1433), .C(n1432), .Y(n459) );
  NAND2X1 U1500 ( .A(n462), .B(n471), .Y(n1435) );
  NAND2X1 U1501 ( .A(n460), .B(n462), .Y(n1436) );
  NAND2X1 U1502 ( .A(n460), .B(n471), .Y(n1437) );
  NAND3X1 U1503 ( .A(n1435), .B(n1436), .C(n1437), .Y(n457) );
  AND2X2 U1504 ( .A(n1511), .B(n1659), .Y(n578) );
  XOR2X1 U1505 ( .A(n1653), .B(n1696), .Y(n771) );
  INVX8 U1506 ( .A(n1696), .Y(n1695) );
  XNOR2X1 U1507 ( .A(n1026), .B(n1686), .Y(n826) );
  XOR2X1 U1508 ( .A(n1655), .B(n1696), .Y(n770) );
  XOR2X1 U1509 ( .A(n315), .B(n317), .Y(n1440) );
  XOR2X1 U1510 ( .A(n1440), .B(n310), .Y(n308) );
  NAND2X1 U1511 ( .A(n310), .B(n1122), .Y(n1441) );
  NAND2X1 U1512 ( .A(n310), .B(n317), .Y(n1442) );
  NAND2X1 U1513 ( .A(n1122), .B(n317), .Y(n1443) );
  NAND3X1 U1514 ( .A(n1442), .B(n1441), .C(n1443), .Y(n307) );
  XNOR2X1 U1515 ( .A(n145), .B(n1444), .Y(product[40]) );
  AND2X2 U1516 ( .A(n144), .B(n1584), .Y(n1444) );
  XOR2X1 U1517 ( .A(n675), .B(n627), .Y(n1445) );
  XOR2X1 U1518 ( .A(n1445), .B(n595), .Y(n398) );
  NAND2X1 U1519 ( .A(n675), .B(n627), .Y(n1446) );
  NAND2X1 U1520 ( .A(n627), .B(n595), .Y(n1447) );
  NAND2X1 U1521 ( .A(n675), .B(n595), .Y(n1448) );
  NAND3X1 U1522 ( .A(n1446), .B(n1447), .C(n1448), .Y(n397) );
  NAND2X1 U1523 ( .A(n626), .B(n399), .Y(n1449) );
  NAND2X1 U1524 ( .A(n626), .B(n1208), .Y(n1450) );
  NAND2X1 U1525 ( .A(n399), .B(n1208), .Y(n1451) );
  NAND3X1 U1526 ( .A(n1449), .B(n1450), .C(n1451), .Y(n379) );
  NAND2X1 U1527 ( .A(n1588), .B(n1064), .Y(n1452) );
  NAND2X1 U1528 ( .A(n356), .B(n367), .Y(n1453) );
  NAND2X1 U1529 ( .A(n365), .B(n356), .Y(n1454) );
  NAND2X1 U1530 ( .A(n365), .B(n367), .Y(n1455) );
  NAND3X1 U1531 ( .A(n1453), .B(n1454), .C(n1455), .Y(n351) );
  NAND2X1 U1532 ( .A(n354), .B(n1258), .Y(n1456) );
  NAND2X1 U1533 ( .A(n354), .B(n352), .Y(n1457) );
  NAND2X1 U1534 ( .A(n1258), .B(n352), .Y(n1458) );
  NAND3X1 U1535 ( .A(n1457), .B(n1456), .C(n1458), .Y(n349) );
  INVX2 U1536 ( .A(n1581), .Y(n1602) );
  INVX8 U1537 ( .A(n1602), .Y(n1632) );
  XOR2X1 U1538 ( .A(n1052), .B(n1578), .Y(n1459) );
  XOR2X1 U1539 ( .A(n1459), .B(n1249), .Y(n392) );
  NAND2X1 U1540 ( .A(n396), .B(n1578), .Y(n1460) );
  NAND2X1 U1541 ( .A(n1578), .B(n398), .Y(n1461) );
  NAND2X1 U1542 ( .A(n396), .B(n398), .Y(n1462) );
  NAND3X1 U1543 ( .A(n1460), .B(n1461), .C(n1462), .Y(n391) );
  NAND2X1 U1544 ( .A(n1154), .B(n393), .Y(n1463) );
  NAND2X1 U1545 ( .A(n1195), .B(n393), .Y(n1464) );
  NAND2X1 U1546 ( .A(n1195), .B(n1154), .Y(n1465) );
  NAND3X1 U1547 ( .A(n1463), .B(n1464), .C(n1465), .Y(n375) );
  NAND2X1 U1548 ( .A(n494), .B(n1289), .Y(n1466) );
  NAND2X1 U1549 ( .A(n494), .B(n496), .Y(n1467) );
  NAND2X1 U1550 ( .A(n1289), .B(n496), .Y(n1468) );
  NAND3X1 U1551 ( .A(n1467), .B(n1466), .C(n1468), .Y(n491) );
  NAND2X1 U1552 ( .A(n1246), .B(n1290), .Y(n1470) );
  NAND2X1 U1553 ( .A(n1246), .B(n392), .Y(n1471) );
  NAND2X1 U1554 ( .A(n1290), .B(n392), .Y(n1472) );
  NAND3X1 U1555 ( .A(n1471), .B(n1470), .C(n1472), .Y(n387) );
  NAND2X1 U1556 ( .A(n1480), .B(n1210), .Y(n1475) );
  NAND2X1 U1557 ( .A(n1473), .B(n1474), .Y(n1476) );
  NAND2X1 U1558 ( .A(n1475), .B(n1476), .Y(n390) );
  INVX1 U1559 ( .A(n1480), .Y(n1473) );
  INVX1 U1560 ( .A(n405), .Y(n1474) );
  NAND2X1 U1561 ( .A(n1243), .B(n1265), .Y(n1477) );
  NAND2X1 U1562 ( .A(n1243), .B(n1214), .Y(n1478) );
  NAND2X1 U1563 ( .A(n1265), .B(n1214), .Y(n1479) );
  NAND3X1 U1564 ( .A(n1478), .B(n1477), .C(n1479), .Y(n443) );
  XNOR2X1 U1565 ( .A(n394), .B(n407), .Y(n1480) );
  NOR2X1 U1566 ( .A(n401), .B(n388), .Y(n1481) );
  NAND2X1 U1567 ( .A(n419), .B(n421), .Y(n1482) );
  NAND2X1 U1568 ( .A(n419), .B(n1264), .Y(n1483) );
  NAND2X1 U1569 ( .A(n1264), .B(n421), .Y(n1484) );
  NAND3X1 U1570 ( .A(n1484), .B(n1482), .C(n1483), .Y(n403) );
  INVX1 U1571 ( .A(n202), .Y(n1485) );
  NAND2X1 U1572 ( .A(n631), .B(n679), .Y(n1486) );
  NAND2X1 U1573 ( .A(n631), .B(n565), .Y(n1487) );
  NAND2X1 U1574 ( .A(n679), .B(n565), .Y(n1488) );
  NAND3X1 U1575 ( .A(n1486), .B(n1487), .C(n1488), .Y(n451) );
  XOR2X1 U1576 ( .A(n1003), .B(n423), .Y(n1489) );
  XOR2X1 U1577 ( .A(n1489), .B(n995), .Y(n406) );
  NAND2X1 U1578 ( .A(n410), .B(n423), .Y(n1490) );
  NAND2X1 U1579 ( .A(n423), .B(n412), .Y(n1491) );
  NAND2X1 U1580 ( .A(n410), .B(n412), .Y(n1492) );
  NAND3X1 U1581 ( .A(n1490), .B(n1491), .C(n1492), .Y(n405) );
  NAND2X1 U1582 ( .A(n394), .B(n1117), .Y(n1493) );
  NAND2X1 U1583 ( .A(n1117), .B(n405), .Y(n1494) );
  NAND2X1 U1584 ( .A(n394), .B(n405), .Y(n1495) );
  NAND3X1 U1585 ( .A(n1493), .B(n1495), .C(n1494), .Y(n389) );
  NAND2X1 U1586 ( .A(n1428), .B(n1584), .Y(n1496) );
  NAND2X1 U1587 ( .A(n1428), .B(n1584), .Y(n1497) );
  INVX8 U1588 ( .A(n1676), .Y(n1500) );
  NAND2X1 U1589 ( .A(n425), .B(n1220), .Y(n1501) );
  NAND2X1 U1590 ( .A(n425), .B(n1242), .Y(n1502) );
  NAND2X1 U1591 ( .A(n1220), .B(n1242), .Y(n1503) );
  NAND3X1 U1592 ( .A(n1503), .B(n1501), .C(n1502), .Y(n407) );
  NAND2X1 U1593 ( .A(n629), .B(n597), .Y(n1504) );
  NAND2X1 U1594 ( .A(n629), .B(n677), .Y(n1505) );
  NAND2X1 U1595 ( .A(n1115), .B(n1194), .Y(n1506) );
  NAND3X1 U1596 ( .A(n1505), .B(n1504), .C(n1039), .Y(n425) );
  INVX4 U1597 ( .A(n884), .Y(n1664) );
  XOR2X1 U1598 ( .A(n474), .B(n483), .Y(n1507) );
  XOR2X1 U1599 ( .A(n1507), .B(n472), .Y(n470) );
  NAND2X1 U1600 ( .A(n472), .B(n1308), .Y(n1508) );
  NAND2X1 U1601 ( .A(n472), .B(n474), .Y(n1509) );
  NAND2X1 U1602 ( .A(n1308), .B(n474), .Y(n1510) );
  NAND3X1 U1603 ( .A(n1509), .B(n1508), .C(n1510), .Y(n469) );
  AND2X2 U1604 ( .A(n1697), .B(n1653), .Y(n580) );
  INVX4 U1605 ( .A(n1702), .Y(n1511) );
  XOR2X1 U1606 ( .A(n384), .B(n395), .Y(n1512) );
  XOR2X1 U1607 ( .A(n1512), .B(n1225), .Y(n378) );
  NAND2X1 U1608 ( .A(n395), .B(n384), .Y(n1513) );
  NAND2X1 U1609 ( .A(n395), .B(n382), .Y(n1514) );
  NAND2X1 U1610 ( .A(n384), .B(n382), .Y(n1515) );
  NAND3X1 U1611 ( .A(n1513), .B(n1514), .C(n1515), .Y(n377) );
  NAND2X1 U1612 ( .A(n368), .B(n379), .Y(n1516) );
  NAND2X1 U1613 ( .A(n377), .B(n368), .Y(n1517) );
  NAND2X1 U1614 ( .A(n377), .B(n379), .Y(n1518) );
  NAND3X1 U1615 ( .A(n1516), .B(n1517), .C(n1518), .Y(n363) );
  INVX8 U1616 ( .A(n1697), .Y(n1702) );
  INVX2 U1617 ( .A(n1065), .Y(n1530) );
  OAI21X1 U1618 ( .A(n1256), .B(n223), .C(n224), .Y(n1519) );
  INVX4 U1619 ( .A(n1693), .Y(n1520) );
  INVX8 U1620 ( .A(n1520), .Y(n1521) );
  XOR2X1 U1621 ( .A(n1677), .B(n1577), .Y(n843) );
  INVX1 U1622 ( .A(n1638), .Y(n549) );
  NAND2X1 U1623 ( .A(n712), .B(n648), .Y(n1522) );
  NAND2X1 U1624 ( .A(n712), .B(n664), .Y(n1523) );
  NAND2X1 U1625 ( .A(n648), .B(n664), .Y(n1524) );
  NAND3X1 U1626 ( .A(n1522), .B(n1523), .C(n1524), .Y(n465) );
  XOR2X1 U1627 ( .A(n1525), .B(n465), .Y(n448) );
  NAND2X1 U1628 ( .A(n452), .B(n454), .Y(n1526) );
  NAND2X1 U1629 ( .A(n452), .B(n465), .Y(n1527) );
  NAND2X1 U1630 ( .A(n454), .B(n465), .Y(n1528) );
  NAND3X1 U1631 ( .A(n1526), .B(n1527), .C(n1528), .Y(n447) );
  INVX2 U1632 ( .A(n1605), .Y(n1639) );
  INVX8 U1633 ( .A(n49), .Y(n1680) );
  INVX4 U1634 ( .A(n1680), .Y(n1582) );
  XNOR2X1 U1635 ( .A(n134), .B(n1021), .Y(product[41]) );
  NOR2X1 U1636 ( .A(n457), .B(n444), .Y(n1532) );
  NAND2X1 U1637 ( .A(n422), .B(n1000), .Y(n1533) );
  NAND2X1 U1638 ( .A(n433), .B(n1000), .Y(n1534) );
  NAND2X1 U1639 ( .A(n433), .B(n422), .Y(n1535) );
  NAND3X1 U1640 ( .A(n1533), .B(n1534), .C(n1535), .Y(n417) );
  NAND2X1 U1641 ( .A(n1189), .B(n1386), .Y(n1536) );
  NAND2X1 U1642 ( .A(n418), .B(n1189), .Y(n1537) );
  NAND2X1 U1643 ( .A(n418), .B(n1386), .Y(n1538) );
  NAND3X1 U1644 ( .A(n1536), .B(n1537), .C(n1538), .Y(n415) );
  NAND2X1 U1645 ( .A(n695), .B(n1009), .Y(n1539) );
  NAND2X1 U1646 ( .A(n1009), .B(n599), .Y(n1540) );
  NAND2X1 U1647 ( .A(n1002), .B(n599), .Y(n1541) );
  NAND3X1 U1648 ( .A(n1539), .B(n1540), .C(n1541), .Y(n453) );
  NAND2X1 U1649 ( .A(n1231), .B(n1107), .Y(n1542) );
  NAND2X1 U1650 ( .A(n1107), .B(n1216), .Y(n1543) );
  NAND2X1 U1651 ( .A(n1231), .B(n1216), .Y(n1544) );
  NAND3X1 U1652 ( .A(n1542), .B(n1543), .C(n1544), .Y(n435) );
  XNOR2X1 U1653 ( .A(n1065), .B(n1696), .Y(n768) );
  INVX1 U1654 ( .A(n1678), .Y(n726) );
  AND2X2 U1655 ( .A(n1206), .B(n546), .Y(n618) );
  INVX1 U1656 ( .A(n222), .Y(n221) );
  INVX4 U1657 ( .A(n881), .Y(n1670) );
  INVX8 U1658 ( .A(n1701), .Y(n1700) );
  XNOR2X1 U1659 ( .A(n19), .B(a[23]), .Y(n1545) );
  INVX1 U1660 ( .A(n1686), .Y(n1685) );
  INVX4 U1661 ( .A(n1644), .Y(n1645) );
  INVX4 U1662 ( .A(n889), .Y(n1654) );
  INVX1 U1663 ( .A(n416), .Y(n1546) );
  INVX2 U1664 ( .A(n1622), .Y(n1548) );
  INVX4 U1665 ( .A(n880), .Y(n1672) );
  INVX1 U1666 ( .A(n1610), .Y(n156) );
  XNOR2X1 U1667 ( .A(n170), .B(n1550), .Y(product[37]) );
  XOR2X1 U1668 ( .A(n1660), .B(n1255), .Y(n801) );
  BUFX2 U1669 ( .A(n52), .Y(n1609) );
  AND2X2 U1670 ( .A(n1354), .B(n893), .Y(n1551) );
  AND2X2 U1671 ( .A(n1354), .B(n893), .Y(n1552) );
  INVX4 U1672 ( .A(n882), .Y(n1668) );
  XNOR2X1 U1673 ( .A(n179), .B(n1022), .Y(product[36]) );
  XNOR2X1 U1674 ( .A(n112), .B(n1553), .Y(product[43]) );
  AND2X2 U1675 ( .A(n111), .B(n1588), .Y(n1553) );
  XNOR2X1 U1676 ( .A(n154), .B(n1554), .Y(product[39]) );
  AND2X2 U1677 ( .A(n149), .B(n1428), .Y(n1554) );
  XNOR2X1 U1678 ( .A(n123), .B(n1555), .Y(product[42]) );
  AND2X2 U1679 ( .A(n122), .B(n1063), .Y(n1555) );
  XOR2X1 U1680 ( .A(n606), .B(n622), .Y(n1556) );
  XOR2X1 U1681 ( .A(n1222), .B(n1556), .Y(n334) );
  NAND2X1 U1682 ( .A(n1222), .B(n1012), .Y(n1557) );
  NAND2X1 U1683 ( .A(n1222), .B(n606), .Y(n1558) );
  NAND2X1 U1684 ( .A(n606), .B(n1012), .Y(n1559) );
  NAND3X1 U1685 ( .A(n1558), .B(n1557), .C(n1559), .Y(n333) );
  XNOR2X1 U1686 ( .A(n163), .B(n1560), .Y(product[38]) );
  AND2X2 U1687 ( .A(n1622), .B(n897), .Y(n1561) );
  AND2X2 U1688 ( .A(n1622), .B(n897), .Y(n1562) );
  XOR2X1 U1689 ( .A(n355), .B(n346), .Y(n1563) );
  XOR2X1 U1690 ( .A(n344), .B(n1563), .Y(n342) );
  XOR2X1 U1691 ( .A(n351), .B(n353), .Y(n1564) );
  XOR2X1 U1692 ( .A(n1564), .B(n342), .Y(n340) );
  NAND2X1 U1693 ( .A(n355), .B(n346), .Y(n1565) );
  NAND2X1 U1694 ( .A(n344), .B(n355), .Y(n1566) );
  NAND2X1 U1695 ( .A(n346), .B(n344), .Y(n1567) );
  NAND3X1 U1696 ( .A(n1565), .B(n1566), .C(n1567), .Y(n341) );
  NAND2X1 U1697 ( .A(n353), .B(n1342), .Y(n1568) );
  NAND2X1 U1698 ( .A(n353), .B(n342), .Y(n1569) );
  NAND2X1 U1699 ( .A(n1342), .B(n342), .Y(n1570) );
  NAND3X1 U1700 ( .A(n1568), .B(n1569), .C(n1570), .Y(n339) );
  XOR2X1 U1701 ( .A(n1357), .B(n1695), .Y(n764) );
  XNOR2X1 U1702 ( .A(n95), .B(n1571), .Y(product[44]) );
  AND2X2 U1703 ( .A(n94), .B(n91), .Y(n1571) );
  INVX1 U1704 ( .A(n201), .Y(n1572) );
  NAND2X1 U1705 ( .A(n895), .B(n1639), .Y(n1573) );
  INVX1 U1706 ( .A(n1601), .Y(n1635) );
  OR2X2 U1707 ( .A(n1582), .B(n1623), .Y(n774) );
  INVX4 U1708 ( .A(n1695), .Y(n1623) );
  INVX1 U1709 ( .A(n53), .Y(n1574) );
  INVX1 U1710 ( .A(n173), .Y(n1575) );
  AND2X2 U1711 ( .A(n1207), .B(n1700), .Y(n582) );
  INVX2 U1712 ( .A(n287), .Y(n1576) );
  INVX4 U1713 ( .A(n1627), .Y(n53) );
  BUFX4 U1714 ( .A(n409), .Y(n1578) );
  BUFX2 U1715 ( .A(n1018), .Y(n1580) );
  INVX8 U1716 ( .A(n1606), .Y(n1637) );
  INVX8 U1717 ( .A(n1680), .Y(n1679) );
  XNOR2X1 U1718 ( .A(a[19]), .B(n7), .Y(n1581) );
  OR2X2 U1719 ( .A(n329), .B(n322), .Y(n1584) );
  OR2X2 U1720 ( .A(n470), .B(n481), .Y(n1585) );
  OR2X2 U1721 ( .A(n302), .B(n307), .Y(n1588) );
  INVX1 U1722 ( .A(n1159), .Y(n730) );
  INVX1 U1723 ( .A(n1104), .Y(n728) );
  AND2X1 U1724 ( .A(n572), .B(n725), .Y(n1600) );
  XOR2X1 U1725 ( .A(a[25]), .B(n1191), .Y(n1605) );
  AND2X2 U1726 ( .A(n481), .B(n470), .Y(n1583) );
  OR2X1 U1727 ( .A(n518), .B(n523), .Y(n1587) );
  AND2X2 U1728 ( .A(n491), .B(n482), .Y(n1589) );
  OR2X1 U1729 ( .A(n482), .B(n491), .Y(n1590) );
  AND2X2 U1730 ( .A(n523), .B(n518), .Y(n1591) );
  OR2X1 U1731 ( .A(n292), .B(n293), .Y(n1592) );
  OR2X1 U1732 ( .A(n530), .B(n533), .Y(n1593) );
  OR2X1 U1733 ( .A(n539), .B(n538), .Y(n1594) );
  AND2X2 U1734 ( .A(n533), .B(n530), .Y(n1595) );
  AND2X2 U1735 ( .A(n539), .B(n538), .Y(n1596) );
  OR2X1 U1736 ( .A(n708), .B(n724), .Y(n1597) );
  AND2X2 U1737 ( .A(n708), .B(n724), .Y(n1598) );
  XNOR2X1 U1738 ( .A(n542), .B(n573), .Y(n291) );
  AND2X2 U1739 ( .A(n1291), .B(n1661), .Y(n359) );
  INVX2 U1740 ( .A(n554), .Y(n655) );
  INVX2 U1741 ( .A(n1694), .Y(n1693) );
  INVX2 U1742 ( .A(n545), .Y(n601) );
  INVX4 U1743 ( .A(n883), .Y(n1666) );
  INVX4 U1744 ( .A(n879), .Y(n1674) );
  XNOR2X1 U1745 ( .A(n1698), .B(a[29]), .Y(n893) );
  AND2X2 U1746 ( .A(n917), .B(n900), .Y(n1603) );
  AND2X2 U1747 ( .A(n1545), .B(n896), .Y(n1606) );
  INVX1 U1748 ( .A(n1500), .Y(n727) );
  INVX4 U1749 ( .A(n1561), .Y(n1621) );
  BUFX4 U1750 ( .A(n1692), .Y(n1607) );
  INVX4 U1751 ( .A(n1694), .Y(n1692) );
  INVX1 U1752 ( .A(n200), .Y(n202) );
  INVX4 U1753 ( .A(n890), .Y(n1652) );
  INVX4 U1754 ( .A(n891), .Y(n1650) );
  INVX1 U1755 ( .A(n1481), .Y(n286) );
  INVX1 U1756 ( .A(n1532), .Y(n290) );
  INVX8 U1757 ( .A(n1641), .Y(n1643) );
  INVX1 U1758 ( .A(n171), .Y(n173) );
  INVX1 U1759 ( .A(n194), .Y(n287) );
  BUFX4 U1760 ( .A(n52), .Y(n1610) );
  INVX1 U1761 ( .A(n1682), .Y(n1611) );
  AOI21X1 U1762 ( .A(n214), .B(n1519), .C(n215), .Y(n1613) );
  XOR2X1 U1763 ( .A(n477), .B(n1123), .Y(n1614) );
  XOR2X1 U1764 ( .A(n1614), .B(n1131), .Y(n462) );
  NAND2X1 U1765 ( .A(n477), .B(n1123), .Y(n1615) );
  NAND2X1 U1766 ( .A(n477), .B(n466), .Y(n1616) );
  NAND2X1 U1767 ( .A(n1123), .B(n466), .Y(n1617) );
  NAND3X1 U1768 ( .A(n1615), .B(n1616), .C(n1617), .Y(n461) );
  NAND2X1 U1769 ( .A(n450), .B(n463), .Y(n1618) );
  NAND2X1 U1770 ( .A(n461), .B(n463), .Y(n1619) );
  NAND2X1 U1771 ( .A(n461), .B(n450), .Y(n1620) );
  NAND3X1 U1772 ( .A(n1618), .B(n1620), .C(n1619), .Y(n445) );
  INVX4 U1773 ( .A(n888), .Y(n1656) );
  INVX2 U1774 ( .A(n1197), .Y(n1628) );
  INVX1 U1775 ( .A(n183), .Y(n181) );
  INVX4 U1776 ( .A(n51), .Y(n1648) );
  INVX1 U1777 ( .A(n205), .Y(n288) );
  INVX1 U1778 ( .A(n199), .Y(n201) );
  INVX4 U1779 ( .A(n42), .Y(n1641) );
  INVX1 U1780 ( .A(n362), .Y(n1624) );
  INVX1 U1781 ( .A(n1624), .Y(n1625) );
  INVX1 U1782 ( .A(n174), .Y(n1626) );
  AND2X2 U1783 ( .A(n171), .B(n159), .Y(n1627) );
  INVX1 U1784 ( .A(n172), .Y(n174) );
  INVX2 U1785 ( .A(n1197), .Y(n1629) );
  INVX1 U1786 ( .A(n166), .Y(n283) );
  INVX4 U1787 ( .A(n18), .Y(n1633) );
  INVX1 U1788 ( .A(n177), .Y(n284) );
  INVX1 U1789 ( .A(n161), .Y(n282) );
  INVX8 U1790 ( .A(n1648), .Y(n1649) );
  INVX8 U1791 ( .A(n1650), .Y(n1651) );
  INVX8 U1792 ( .A(n1652), .Y(n1653) );
  INVX8 U1793 ( .A(n1654), .Y(n1655) );
  INVX8 U1794 ( .A(n1127), .Y(n1661) );
  INVX8 U1795 ( .A(n1662), .Y(n1663) );
  INVX8 U1796 ( .A(n1666), .Y(n1667) );
  INVX8 U1797 ( .A(n1674), .Y(n1675) );
  INVX8 U1798 ( .A(n19), .Y(n1689) );
  INVX8 U1799 ( .A(n1698), .Y(n1697) );
  INVX8 U1800 ( .A(n541), .Y(n1698) );
  INVX8 U1801 ( .A(n1701), .Y(n1699) );
  INVX8 U1802 ( .A(n1697), .Y(n1701) );
  INVX2 U1803 ( .A(n94), .Y(n92) );
  INVX2 U1804 ( .A(n79), .Y(n77) );
  INVX2 U1805 ( .A(n78), .Y(n76) );
  INVX2 U1806 ( .A(n1630), .Y(n561) );
  OAI22X1 U1807 ( .A(n1635), .B(n1689), .C(n1689), .D(n1040), .Y(n554) );
  INVX2 U1808 ( .A(n1612), .Y(n552) );
  OAI22X1 U1809 ( .A(n1201), .B(n1427), .C(n1013), .D(n1427), .Y(n548) );
  OAI22X1 U1810 ( .A(n1498), .B(n1623), .C(n1642), .D(n1623), .Y(n545) );
  OAI22X1 U1811 ( .A(n1301), .B(n1701), .C(n1646), .D(n1701), .Y(n542) );
  INVX2 U1812 ( .A(n359), .Y(n360) );
  INVX2 U1813 ( .A(n337), .Y(n338) );
  INVX2 U1814 ( .A(n319), .Y(n320) );
  INVX2 U1815 ( .A(n305), .Y(n306) );
  INVX2 U1816 ( .A(n295), .Y(n296) );
  INVX2 U1817 ( .A(n93), .Y(n91) );
  INVX2 U1818 ( .A(n84), .Y(n275) );
  INVX2 U1819 ( .A(n1613), .Y(n212) );
  INVX2 U1820 ( .A(n144), .Y(n142) );
  INVX2 U1821 ( .A(n122), .Y(n120) );
  INVX2 U1822 ( .A(n111), .Y(n109) );
  INVX2 U1823 ( .A(n105), .Y(n103) );
  INVX2 U1824 ( .A(n104), .Y(n102) );
endmodule


module alu ( src1_data, src2_data, alu_op, result, overflow );
  input [16:0] src1_data;
  input [16:0] src2_data;
  input [1:0] alu_op;
  output [16:0] result;
  output overflow;
  wire   N26, n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15,
         n16, n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n29, n30, n31,
         n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44, n45,
         n46, n47, n48, n49, n50, n51, n52, n53, n54, n55, n56, n57, n58, n59,
         n60, n61, n62, n63, n64, n65, n66, n67, n68, n69, n70, n71, n72, n73,
         n74, n75, n76, n77, n78, n79, n80, n81, n82, n83, n84, n85, n86, n87,
         n88, n89, n90, n91, n92, n93, n94, n95, n96, n97, n98, n99, n100,
         n101, n102, n103, n104, n105, n106, n107, n108, n109, n110, n111,
         n112, n113, n114, n115, n116, n117, n118, n119, n120, n121;
  wire   [46:30] full_mult;
  wire   [17:0] large_sum;
  wire   [17:0] large_dif;
  wire   SYNOPSYS_UNCONNECTED__0, SYNOPSYS_UNCONNECTED__1, 
        SYNOPSYS_UNCONNECTED__2, SYNOPSYS_UNCONNECTED__3, 
        SYNOPSYS_UNCONNECTED__4, SYNOPSYS_UNCONNECTED__5, 
        SYNOPSYS_UNCONNECTED__6, SYNOPSYS_UNCONNECTED__7, 
        SYNOPSYS_UNCONNECTED__8, SYNOPSYS_UNCONNECTED__9, 
        SYNOPSYS_UNCONNECTED__10, SYNOPSYS_UNCONNECTED__11, 
        SYNOPSYS_UNCONNECTED__12, SYNOPSYS_UNCONNECTED__13, 
        SYNOPSYS_UNCONNECTED__14, SYNOPSYS_UNCONNECTED__15, 
        SYNOPSYS_UNCONNECTED__16, SYNOPSYS_UNCONNECTED__17, 
        SYNOPSYS_UNCONNECTED__18, SYNOPSYS_UNCONNECTED__19, 
        SYNOPSYS_UNCONNECTED__20, SYNOPSYS_UNCONNECTED__21, 
        SYNOPSYS_UNCONNECTED__22, SYNOPSYS_UNCONNECTED__23, 
        SYNOPSYS_UNCONNECTED__24, SYNOPSYS_UNCONNECTED__25, 
        SYNOPSYS_UNCONNECTED__26, SYNOPSYS_UNCONNECTED__27, 
        SYNOPSYS_UNCONNECTED__28, SYNOPSYS_UNCONNECTED__29;

  alu_DW01_add_1 add_41 ( .A({src1_data[16], src1_data[16], n18, n44, n41, n10, 
        n17, n26, n30, n43, n19, n6, n31, n29, n23, n36, n49, n45}), .B({
        src2_data[16], src2_data[16], n25, n22, n38, n37, n14, n39, n21, n42, 
        n9, n34, n12, n16, n2, n4, n40, n35}), .CI(1'b0), .SUM(large_sum) );
  alu_DW01_sub_1 sub_44 ( .A({src1_data[16], src1_data[16], n18, n44, n41, n10, 
        n17, n26, n30, n43, n19, n6, n31, n29, n23, n36, n49, n45}), .B({
        src2_data[16], src2_data[16], n25, n22, n38, n37, n14, n39, n21, n42, 
        n9, n34, n12, n16, n2, n4, n40, n35}), .CI(1'b0), .DIFF(large_dif) );
  alu_DW_mult_uns_5 mult_35 ( .a({src1_data[15:8], n7, src1_data[6], n51, 
        src1_data[4:2], n49, src1_data[0], 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 
        1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0}), .b(
        src2_data[15:0]), .product({N26, full_mult[45:30], 
        SYNOPSYS_UNCONNECTED__0, SYNOPSYS_UNCONNECTED__1, 
        SYNOPSYS_UNCONNECTED__2, SYNOPSYS_UNCONNECTED__3, 
        SYNOPSYS_UNCONNECTED__4, SYNOPSYS_UNCONNECTED__5, 
        SYNOPSYS_UNCONNECTED__6, SYNOPSYS_UNCONNECTED__7, 
        SYNOPSYS_UNCONNECTED__8, SYNOPSYS_UNCONNECTED__9, 
        SYNOPSYS_UNCONNECTED__10, SYNOPSYS_UNCONNECTED__11, 
        SYNOPSYS_UNCONNECTED__12, SYNOPSYS_UNCONNECTED__13, 
        SYNOPSYS_UNCONNECTED__14, SYNOPSYS_UNCONNECTED__15, 
        SYNOPSYS_UNCONNECTED__16, SYNOPSYS_UNCONNECTED__17, 
        SYNOPSYS_UNCONNECTED__18, SYNOPSYS_UNCONNECTED__19, 
        SYNOPSYS_UNCONNECTED__20, SYNOPSYS_UNCONNECTED__21, 
        SYNOPSYS_UNCONNECTED__22, SYNOPSYS_UNCONNECTED__23, 
        SYNOPSYS_UNCONNECTED__24, SYNOPSYS_UNCONNECTED__25, 
        SYNOPSYS_UNCONNECTED__26, SYNOPSYS_UNCONNECTED__27, 
        SYNOPSYS_UNCONNECTED__28, SYNOPSYS_UNCONNECTED__29}) );
  INVX1 U3 ( .A(src2_data[0]), .Y(n48) );
  INVX2 U4 ( .A(n48), .Y(n35) );
  INVX2 U6 ( .A(n33), .Y(n34) );
  INVX2 U7 ( .A(n3), .Y(n4) );
  INVX2 U9 ( .A(n11), .Y(n12) );
  INVX2 U10 ( .A(n8), .Y(n9) );
  INVX2 U11 ( .A(n1), .Y(n2) );
  INVX2 U12 ( .A(n15), .Y(n16) );
  INVX2 U13 ( .A(n5), .Y(n6) );
  INVX2 U14 ( .A(n13), .Y(n14) );
  INVX2 U15 ( .A(n24), .Y(n25) );
  INVX2 U16 ( .A(n20), .Y(n21) );
  INVX2 U17 ( .A(n56), .Y(overflow) );
  INVX1 U18 ( .A(src2_data[3]), .Y(n1) );
  INVX1 U19 ( .A(src2_data[2]), .Y(n3) );
  INVX1 U20 ( .A(src1_data[6]), .Y(n5) );
  BUFX4 U21 ( .A(src1_data[7]), .Y(n7) );
  INVX1 U22 ( .A(src2_data[7]), .Y(n8) );
  BUFX2 U23 ( .A(src1_data[12]), .Y(n10) );
  INVX1 U24 ( .A(src2_data[5]), .Y(n11) );
  INVX1 U25 ( .A(src2_data[11]), .Y(n13) );
  INVX1 U26 ( .A(src2_data[4]), .Y(n15) );
  BUFX2 U27 ( .A(src1_data[11]), .Y(n17) );
  INVX4 U28 ( .A(n52), .Y(n51) );
  INVX2 U29 ( .A(src1_data[5]), .Y(n52) );
  BUFX2 U30 ( .A(src1_data[15]), .Y(n18) );
  BUFX2 U31 ( .A(n7), .Y(n19) );
  INVX1 U32 ( .A(src2_data[9]), .Y(n20) );
  BUFX2 U33 ( .A(src2_data[14]), .Y(n22) );
  BUFX2 U34 ( .A(src1_data[3]), .Y(n23) );
  INVX1 U35 ( .A(src2_data[15]), .Y(n24) );
  BUFX2 U36 ( .A(src1_data[10]), .Y(n26) );
  BUFX2 U37 ( .A(src1_data[4]), .Y(n29) );
  BUFX2 U38 ( .A(src1_data[9]), .Y(n30) );
  BUFX2 U39 ( .A(n51), .Y(n31) );
  INVX2 U40 ( .A(n31), .Y(n32) );
  INVX1 U41 ( .A(src2_data[6]), .Y(n33) );
  BUFX2 U42 ( .A(src1_data[2]), .Y(n36) );
  BUFX2 U43 ( .A(src2_data[12]), .Y(n37) );
  BUFX2 U44 ( .A(src2_data[13]), .Y(n38) );
  BUFX2 U45 ( .A(src2_data[10]), .Y(n39) );
  BUFX2 U46 ( .A(src2_data[1]), .Y(n40) );
  BUFX2 U47 ( .A(src1_data[13]), .Y(n41) );
  BUFX2 U48 ( .A(src2_data[8]), .Y(n42) );
  BUFX2 U49 ( .A(src1_data[8]), .Y(n43) );
  BUFX2 U50 ( .A(src1_data[14]), .Y(n44) );
  BUFX2 U51 ( .A(src1_data[0]), .Y(n45) );
  INVX4 U52 ( .A(src1_data[1]), .Y(n50) );
  AND2X2 U53 ( .A(alu_op[0]), .B(n58), .Y(n46) );
  INVX8 U54 ( .A(n46), .Y(n47) );
  INVX4 U55 ( .A(n76), .Y(n116) );
  INVX4 U56 ( .A(n71), .Y(n119) );
  INVX4 U57 ( .A(n59), .Y(n118) );
  INVX8 U58 ( .A(n50), .Y(n49) );
  INVX2 U59 ( .A(large_sum[16]), .Y(n121) );
  XOR2X1 U60 ( .A(n121), .B(large_sum[17]), .Y(n54) );
  INVX2 U61 ( .A(alu_op[1]), .Y(n58) );
  INVX2 U62 ( .A(alu_op[0]), .Y(n57) );
  NAND2X1 U63 ( .A(alu_op[1]), .B(n57), .Y(n59) );
  XNOR2X1 U64 ( .A(large_dif[16]), .B(large_dif[17]), .Y(n53) );
  OAI22X1 U65 ( .A(n54), .B(n47), .C(n59), .D(n53), .Y(n55) );
  NAND2X1 U66 ( .A(alu_op[0]), .B(alu_op[1]), .Y(n76) );
  OAI22X1 U67 ( .A(n55), .B(N26), .C(n116), .D(n55), .Y(n56) );
  NAND2X1 U68 ( .A(n58), .B(n57), .Y(n71) );
  AOI22X1 U69 ( .A(n45), .B(n119), .C(full_mult[30]), .D(n116), .Y(n61) );
  INVX2 U70 ( .A(n47), .Y(n73) );
  AOI22X1 U71 ( .A(large_dif[0]), .B(n118), .C(large_sum[0]), .D(n73), .Y(n60)
         );
  NAND2X1 U72 ( .A(n60), .B(n61), .Y(result[0]) );
  AOI22X1 U73 ( .A(n49), .B(n119), .C(full_mult[31]), .D(n116), .Y(n63) );
  AOI22X1 U74 ( .A(large_dif[1]), .B(n118), .C(large_sum[1]), .D(n73), .Y(n62)
         );
  NAND2X1 U75 ( .A(n62), .B(n63), .Y(result[1]) );
  AOI22X1 U76 ( .A(n36), .B(n119), .C(full_mult[32]), .D(n116), .Y(n65) );
  AOI22X1 U77 ( .A(large_dif[2]), .B(n118), .C(large_sum[2]), .D(n73), .Y(n64)
         );
  NAND2X1 U78 ( .A(n64), .B(n65), .Y(result[2]) );
  AOI22X1 U79 ( .A(n23), .B(n119), .C(full_mult[33]), .D(n116), .Y(n67) );
  AOI22X1 U80 ( .A(large_dif[3]), .B(n118), .C(large_sum[3]), .D(n73), .Y(n66)
         );
  NAND2X1 U81 ( .A(n66), .B(n67), .Y(result[3]) );
  AOI22X1 U82 ( .A(n29), .B(n119), .C(full_mult[34]), .D(n116), .Y(n69) );
  AOI22X1 U83 ( .A(large_dif[4]), .B(n118), .C(large_sum[4]), .D(n73), .Y(n68)
         );
  NAND2X1 U84 ( .A(n68), .B(n69), .Y(result[4]) );
  INVX2 U85 ( .A(full_mult[35]), .Y(n75) );
  NAND2X1 U86 ( .A(large_dif[5]), .B(n118), .Y(n70) );
  OAI21X1 U87 ( .A(n71), .B(n32), .C(n70), .Y(n72) );
  AOI21X1 U88 ( .A(large_sum[5]), .B(n73), .C(n72), .Y(n74) );
  OAI21X1 U89 ( .A(n76), .B(n75), .C(n74), .Y(result[5]) );
  INVX2 U90 ( .A(large_sum[6]), .Y(n78) );
  AOI22X1 U91 ( .A(n6), .B(n119), .C(large_dif[6]), .D(n118), .Y(n77) );
  OAI21X1 U92 ( .A(n47), .B(n78), .C(n77), .Y(n79) );
  OAI22X1 U93 ( .A(n116), .B(n79), .C(n79), .D(full_mult[36]), .Y(n80) );
  INVX2 U94 ( .A(n80), .Y(result[6]) );
  INVX2 U95 ( .A(large_sum[7]), .Y(n82) );
  AOI22X1 U96 ( .A(n19), .B(n119), .C(large_dif[7]), .D(n118), .Y(n81) );
  OAI21X1 U97 ( .A(n47), .B(n82), .C(n81), .Y(n83) );
  OAI22X1 U98 ( .A(n116), .B(n83), .C(n83), .D(full_mult[37]), .Y(n84) );
  INVX2 U99 ( .A(n84), .Y(result[7]) );
  INVX2 U100 ( .A(large_sum[8]), .Y(n86) );
  AOI22X1 U101 ( .A(n43), .B(n119), .C(large_dif[8]), .D(n118), .Y(n85) );
  OAI21X1 U102 ( .A(n47), .B(n86), .C(n85), .Y(n87) );
  OAI22X1 U103 ( .A(n116), .B(n87), .C(n87), .D(full_mult[38]), .Y(n88) );
  INVX2 U104 ( .A(n88), .Y(result[8]) );
  INVX2 U105 ( .A(large_sum[9]), .Y(n90) );
  AOI22X1 U106 ( .A(n30), .B(n119), .C(large_dif[9]), .D(n118), .Y(n89) );
  OAI21X1 U107 ( .A(n47), .B(n90), .C(n89), .Y(n91) );
  OAI22X1 U108 ( .A(n116), .B(n91), .C(n91), .D(full_mult[39]), .Y(n92) );
  INVX2 U109 ( .A(n92), .Y(result[9]) );
  INVX2 U110 ( .A(large_sum[10]), .Y(n94) );
  AOI22X1 U111 ( .A(n26), .B(n119), .C(large_dif[10]), .D(n118), .Y(n93) );
  OAI21X1 U112 ( .A(n47), .B(n94), .C(n93), .Y(n95) );
  OAI22X1 U113 ( .A(n116), .B(n95), .C(n95), .D(full_mult[40]), .Y(n96) );
  INVX2 U114 ( .A(n96), .Y(result[10]) );
  INVX2 U115 ( .A(large_sum[11]), .Y(n98) );
  AOI22X1 U116 ( .A(n17), .B(n119), .C(large_dif[11]), .D(n118), .Y(n97) );
  OAI21X1 U117 ( .A(n47), .B(n98), .C(n97), .Y(n99) );
  OAI22X1 U118 ( .A(n116), .B(n99), .C(n99), .D(full_mult[41]), .Y(n100) );
  INVX2 U119 ( .A(n100), .Y(result[11]) );
  INVX2 U120 ( .A(large_sum[12]), .Y(n102) );
  AOI22X1 U121 ( .A(n10), .B(n119), .C(large_dif[12]), .D(n118), .Y(n101) );
  OAI21X1 U122 ( .A(n47), .B(n102), .C(n101), .Y(n103) );
  OAI22X1 U123 ( .A(n116), .B(n103), .C(n103), .D(full_mult[42]), .Y(n104) );
  INVX2 U124 ( .A(n104), .Y(result[12]) );
  INVX2 U125 ( .A(large_sum[13]), .Y(n106) );
  AOI22X1 U126 ( .A(n41), .B(n119), .C(large_dif[13]), .D(n118), .Y(n105) );
  OAI21X1 U127 ( .A(n47), .B(n106), .C(n105), .Y(n107) );
  OAI22X1 U128 ( .A(n116), .B(n107), .C(n107), .D(full_mult[43]), .Y(n108) );
  INVX2 U129 ( .A(n108), .Y(result[13]) );
  INVX2 U130 ( .A(large_sum[14]), .Y(n110) );
  AOI22X1 U131 ( .A(n44), .B(n119), .C(large_dif[14]), .D(n118), .Y(n109) );
  OAI21X1 U132 ( .A(n47), .B(n110), .C(n109), .Y(n111) );
  OAI22X1 U133 ( .A(n116), .B(n111), .C(n111), .D(full_mult[44]), .Y(n112) );
  INVX2 U134 ( .A(n112), .Y(result[14]) );
  INVX2 U135 ( .A(large_sum[15]), .Y(n114) );
  AOI22X1 U136 ( .A(n18), .B(n119), .C(large_dif[15]), .D(n118), .Y(n113) );
  OAI21X1 U137 ( .A(n47), .B(n114), .C(n113), .Y(n115) );
  OAI22X1 U138 ( .A(n116), .B(n115), .C(n115), .D(full_mult[45]), .Y(n117) );
  INVX2 U139 ( .A(n117), .Y(result[15]) );
  AOI22X1 U140 ( .A(src1_data[16]), .B(n119), .C(large_dif[16]), .D(n118), .Y(
        n120) );
  OAI21X1 U141 ( .A(n47), .B(n121), .C(n120), .Y(result[16]) );
endmodule


module flex_sreg_NUM_BITS17_15 ( clk, n_reset, write_enable, new_value, 
        current_value );
  input [16:0] new_value;
  output [16:0] current_value;
  input clk, n_reset, write_enable;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n20, n22, n24, n26, n28, n30, n32, n34, n36, n38, n40, n42,
         n44, n46, n48, n50, n52, n53, n54, n55;

  DFFSR \value_reg[16]  ( .D(n26), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[16]) );
  DFFSR \value_reg[15]  ( .D(n28), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[15]) );
  DFFSR \value_reg[14]  ( .D(n30), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[14]) );
  DFFSR \value_reg[13]  ( .D(n32), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[13]) );
  DFFSR \value_reg[12]  ( .D(n34), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[12]) );
  DFFSR \value_reg[11]  ( .D(n36), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[11]) );
  DFFSR \value_reg[10]  ( .D(n38), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[10]) );
  DFFSR \value_reg[9]  ( .D(n40), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[9]) );
  DFFSR \value_reg[8]  ( .D(n42), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[8]) );
  DFFSR \value_reg[7]  ( .D(n44), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[7]) );
  DFFSR \value_reg[6]  ( .D(n46), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[6]) );
  DFFSR \value_reg[5]  ( .D(n48), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[5]) );
  DFFSR \value_reg[4]  ( .D(n50), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[4]) );
  DFFSR \value_reg[3]  ( .D(n52), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[3]) );
  DFFSR \value_reg[2]  ( .D(n53), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[2]) );
  DFFSR \value_reg[1]  ( .D(n54), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[1]) );
  DFFSR \value_reg[0]  ( .D(n55), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[0]) );
  INVX4 U2 ( .A(n1), .Y(n2) );
  INVX1 U3 ( .A(n6), .Y(n54) );
  INVX1 U4 ( .A(n16), .Y(n36) );
  INVX1 U5 ( .A(n22), .Y(n28) );
  INVX1 U6 ( .A(n11), .Y(n46) );
  INVX2 U7 ( .A(write_enable), .Y(n1) );
  INVX2 U8 ( .A(n4), .Y(n3) );
  INVX2 U9 ( .A(n_reset), .Y(n4) );
  INVX1 U10 ( .A(n14), .Y(n40) );
  INVX1 U11 ( .A(n17), .Y(n34) );
  INVX1 U12 ( .A(n13), .Y(n42) );
  INVX1 U13 ( .A(n20), .Y(n30) );
  INVX1 U14 ( .A(n15), .Y(n38) );
  INVX1 U15 ( .A(n12), .Y(n44) );
  INVX1 U16 ( .A(n18), .Y(n32) );
  MUX2X1 U17 ( .B(current_value[0]), .A(new_value[0]), .S(n2), .Y(n5) );
  INVX2 U18 ( .A(n5), .Y(n55) );
  MUX2X1 U19 ( .B(current_value[1]), .A(new_value[1]), .S(n2), .Y(n6) );
  MUX2X1 U20 ( .B(current_value[2]), .A(new_value[2]), .S(write_enable), .Y(n7) );
  INVX2 U21 ( .A(n7), .Y(n53) );
  MUX2X1 U22 ( .B(current_value[3]), .A(new_value[3]), .S(n2), .Y(n8) );
  INVX2 U23 ( .A(n8), .Y(n52) );
  MUX2X1 U24 ( .B(current_value[4]), .A(new_value[4]), .S(write_enable), .Y(n9) );
  INVX2 U25 ( .A(n9), .Y(n50) );
  MUX2X1 U26 ( .B(current_value[5]), .A(new_value[5]), .S(n2), .Y(n10) );
  INVX2 U27 ( .A(n10), .Y(n48) );
  MUX2X1 U28 ( .B(current_value[6]), .A(new_value[6]), .S(write_enable), .Y(
        n11) );
  MUX2X1 U29 ( .B(current_value[7]), .A(new_value[7]), .S(n2), .Y(n12) );
  MUX2X1 U30 ( .B(current_value[8]), .A(new_value[8]), .S(write_enable), .Y(
        n13) );
  MUX2X1 U31 ( .B(current_value[9]), .A(new_value[9]), .S(n2), .Y(n14) );
  MUX2X1 U32 ( .B(current_value[10]), .A(new_value[10]), .S(write_enable), .Y(
        n15) );
  MUX2X1 U33 ( .B(current_value[11]), .A(new_value[11]), .S(n2), .Y(n16) );
  MUX2X1 U34 ( .B(current_value[12]), .A(new_value[12]), .S(write_enable), .Y(
        n17) );
  MUX2X1 U35 ( .B(current_value[13]), .A(new_value[13]), .S(n2), .Y(n18) );
  MUX2X1 U36 ( .B(current_value[14]), .A(new_value[14]), .S(write_enable), .Y(
        n20) );
  MUX2X1 U54 ( .B(current_value[15]), .A(new_value[15]), .S(n2), .Y(n22) );
  MUX2X1 U55 ( .B(current_value[16]), .A(new_value[16]), .S(write_enable), .Y(
        n24) );
  INVX2 U56 ( .A(n24), .Y(n26) );
endmodule


module flex_sreg_NUM_BITS17_14 ( clk, n_reset, write_enable, new_value, 
        current_value );
  input [16:0] new_value;
  output [16:0] current_value;
  input clk, n_reset, write_enable;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n20, n22, n24, n26, n28, n30, n32, n34, n36, n38, n40, n42,
         n44, n46, n48, n50, n52, n53, n54, n55;

  DFFSR \value_reg[16]  ( .D(n26), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[16]) );
  DFFSR \value_reg[15]  ( .D(n28), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[15]) );
  DFFSR \value_reg[14]  ( .D(n30), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[14]) );
  DFFSR \value_reg[13]  ( .D(n32), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[13]) );
  DFFSR \value_reg[12]  ( .D(n34), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[12]) );
  DFFSR \value_reg[11]  ( .D(n36), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[11]) );
  DFFSR \value_reg[10]  ( .D(n38), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[10]) );
  DFFSR \value_reg[9]  ( .D(n40), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[9]) );
  DFFSR \value_reg[8]  ( .D(n42), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[8]) );
  DFFSR \value_reg[7]  ( .D(n44), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[7]) );
  DFFSR \value_reg[6]  ( .D(n46), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[6]) );
  DFFSR \value_reg[5]  ( .D(n48), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[5]) );
  DFFSR \value_reg[4]  ( .D(n50), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[4]) );
  DFFSR \value_reg[3]  ( .D(n52), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[3]) );
  DFFSR \value_reg[2]  ( .D(n53), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[2]) );
  DFFSR \value_reg[1]  ( .D(n54), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[1]) );
  DFFSR \value_reg[0]  ( .D(n55), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[0]) );
  INVX4 U2 ( .A(n1), .Y(n2) );
  INVX1 U3 ( .A(n16), .Y(n36) );
  INVX1 U4 ( .A(n22), .Y(n28) );
  INVX1 U5 ( .A(n11), .Y(n46) );
  INVX1 U6 ( .A(n14), .Y(n40) );
  INVX1 U7 ( .A(n17), .Y(n34) );
  INVX2 U8 ( .A(write_enable), .Y(n1) );
  INVX2 U9 ( .A(n4), .Y(n3) );
  INVX2 U10 ( .A(n_reset), .Y(n4) );
  INVX1 U11 ( .A(n13), .Y(n42) );
  INVX1 U12 ( .A(n12), .Y(n44) );
  INVX1 U13 ( .A(n15), .Y(n38) );
  INVX1 U14 ( .A(n20), .Y(n30) );
  INVX1 U15 ( .A(n18), .Y(n32) );
  MUX2X1 U16 ( .B(current_value[0]), .A(new_value[0]), .S(n2), .Y(n5) );
  INVX2 U17 ( .A(n5), .Y(n55) );
  MUX2X1 U18 ( .B(current_value[1]), .A(new_value[1]), .S(n2), .Y(n6) );
  INVX2 U19 ( .A(n6), .Y(n54) );
  MUX2X1 U20 ( .B(current_value[2]), .A(new_value[2]), .S(n2), .Y(n7) );
  INVX2 U21 ( .A(n7), .Y(n53) );
  MUX2X1 U22 ( .B(current_value[3]), .A(new_value[3]), .S(write_enable), .Y(n8) );
  INVX2 U23 ( .A(n8), .Y(n52) );
  MUX2X1 U24 ( .B(current_value[4]), .A(new_value[4]), .S(n2), .Y(n9) );
  INVX2 U25 ( .A(n9), .Y(n50) );
  MUX2X1 U26 ( .B(current_value[5]), .A(new_value[5]), .S(n2), .Y(n10) );
  INVX2 U27 ( .A(n10), .Y(n48) );
  MUX2X1 U28 ( .B(current_value[6]), .A(new_value[6]), .S(n2), .Y(n11) );
  MUX2X1 U29 ( .B(current_value[7]), .A(new_value[7]), .S(write_enable), .Y(
        n12) );
  MUX2X1 U30 ( .B(current_value[8]), .A(new_value[8]), .S(n2), .Y(n13) );
  MUX2X1 U31 ( .B(current_value[9]), .A(new_value[9]), .S(write_enable), .Y(
        n14) );
  MUX2X1 U32 ( .B(current_value[10]), .A(new_value[10]), .S(n2), .Y(n15) );
  MUX2X1 U33 ( .B(current_value[11]), .A(new_value[11]), .S(write_enable), .Y(
        n16) );
  MUX2X1 U34 ( .B(current_value[12]), .A(new_value[12]), .S(n2), .Y(n17) );
  MUX2X1 U35 ( .B(current_value[13]), .A(new_value[13]), .S(write_enable), .Y(
        n18) );
  MUX2X1 U36 ( .B(current_value[14]), .A(new_value[14]), .S(n2), .Y(n20) );
  MUX2X1 U54 ( .B(current_value[15]), .A(new_value[15]), .S(write_enable), .Y(
        n22) );
  MUX2X1 U55 ( .B(current_value[16]), .A(new_value[16]), .S(n2), .Y(n24) );
  INVX2 U56 ( .A(n24), .Y(n26) );
endmodule


module flex_sreg_NUM_BITS17_13 ( clk, n_reset, write_enable, new_value, 
        current_value );
  input [16:0] new_value;
  output [16:0] current_value;
  input clk, n_reset, write_enable;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n20, n22, n24, n26, n28, n30, n32, n34, n36, n38, n40, n42,
         n44, n46, n48, n50, n52, n53, n54, n55;

  DFFSR \value_reg[16]  ( .D(n26), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[16]) );
  DFFSR \value_reg[15]  ( .D(n28), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[15]) );
  DFFSR \value_reg[14]  ( .D(n30), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[14]) );
  DFFSR \value_reg[13]  ( .D(n32), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[13]) );
  DFFSR \value_reg[12]  ( .D(n34), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[12]) );
  DFFSR \value_reg[11]  ( .D(n36), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[11]) );
  DFFSR \value_reg[10]  ( .D(n38), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[10]) );
  DFFSR \value_reg[9]  ( .D(n40), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[9]) );
  DFFSR \value_reg[8]  ( .D(n42), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[8]) );
  DFFSR \value_reg[7]  ( .D(n44), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[7]) );
  DFFSR \value_reg[6]  ( .D(n46), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[6]) );
  DFFSR \value_reg[5]  ( .D(n48), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[5]) );
  DFFSR \value_reg[4]  ( .D(n50), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[4]) );
  DFFSR \value_reg[3]  ( .D(n52), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[3]) );
  DFFSR \value_reg[2]  ( .D(n53), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[2]) );
  DFFSR \value_reg[1]  ( .D(n54), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[1]) );
  DFFSR \value_reg[0]  ( .D(n55), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[0]) );
  INVX4 U2 ( .A(n1), .Y(n2) );
  INVX1 U3 ( .A(n16), .Y(n36) );
  INVX1 U4 ( .A(n22), .Y(n28) );
  INVX1 U5 ( .A(n11), .Y(n46) );
  INVX1 U6 ( .A(n14), .Y(n40) );
  INVX1 U7 ( .A(n12), .Y(n44) );
  INVX1 U8 ( .A(n17), .Y(n34) );
  INVX1 U9 ( .A(n15), .Y(n38) );
  INVX1 U10 ( .A(n20), .Y(n30) );
  INVX2 U11 ( .A(write_enable), .Y(n1) );
  INVX2 U12 ( .A(n4), .Y(n3) );
  INVX2 U13 ( .A(n_reset), .Y(n4) );
  INVX1 U14 ( .A(n13), .Y(n42) );
  INVX1 U15 ( .A(n18), .Y(n32) );
  MUX2X1 U16 ( .B(current_value[0]), .A(new_value[0]), .S(n2), .Y(n5) );
  INVX2 U17 ( .A(n5), .Y(n55) );
  MUX2X1 U18 ( .B(current_value[1]), .A(new_value[1]), .S(n2), .Y(n6) );
  INVX2 U19 ( .A(n6), .Y(n54) );
  MUX2X1 U20 ( .B(current_value[2]), .A(new_value[2]), .S(n2), .Y(n7) );
  INVX2 U21 ( .A(n7), .Y(n53) );
  MUX2X1 U22 ( .B(current_value[3]), .A(new_value[3]), .S(n2), .Y(n8) );
  INVX2 U23 ( .A(n8), .Y(n52) );
  MUX2X1 U24 ( .B(current_value[4]), .A(new_value[4]), .S(n2), .Y(n9) );
  INVX2 U25 ( .A(n9), .Y(n50) );
  MUX2X1 U26 ( .B(current_value[5]), .A(new_value[5]), .S(write_enable), .Y(
        n10) );
  INVX2 U27 ( .A(n10), .Y(n48) );
  MUX2X1 U28 ( .B(current_value[6]), .A(new_value[6]), .S(n2), .Y(n11) );
  MUX2X1 U29 ( .B(current_value[7]), .A(new_value[7]), .S(write_enable), .Y(
        n12) );
  MUX2X1 U30 ( .B(current_value[8]), .A(new_value[8]), .S(n2), .Y(n13) );
  MUX2X1 U31 ( .B(current_value[9]), .A(new_value[9]), .S(write_enable), .Y(
        n14) );
  MUX2X1 U32 ( .B(current_value[10]), .A(new_value[10]), .S(n2), .Y(n15) );
  MUX2X1 U33 ( .B(current_value[11]), .A(new_value[11]), .S(write_enable), .Y(
        n16) );
  MUX2X1 U34 ( .B(current_value[12]), .A(new_value[12]), .S(n2), .Y(n17) );
  MUX2X1 U35 ( .B(current_value[13]), .A(new_value[13]), .S(write_enable), .Y(
        n18) );
  MUX2X1 U36 ( .B(current_value[14]), .A(new_value[14]), .S(n2), .Y(n20) );
  MUX2X1 U54 ( .B(current_value[15]), .A(new_value[15]), .S(write_enable), .Y(
        n22) );
  MUX2X1 U55 ( .B(current_value[16]), .A(new_value[16]), .S(n2), .Y(n24) );
  INVX2 U56 ( .A(n24), .Y(n26) );
endmodule


module flex_sreg_NUM_BITS17_12 ( clk, n_reset, write_enable, new_value, 
        current_value );
  input [16:0] new_value;
  output [16:0] current_value;
  input clk, n_reset, write_enable;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n20, n22, n24, n26, n28, n30, n32, n34, n36, n38, n40, n42,
         n44, n46, n48, n50, n52, n53, n54, n55;

  DFFSR \value_reg[16]  ( .D(n26), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[16]) );
  DFFSR \value_reg[15]  ( .D(n28), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[15]) );
  DFFSR \value_reg[14]  ( .D(n30), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[14]) );
  DFFSR \value_reg[13]  ( .D(n32), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[13]) );
  DFFSR \value_reg[12]  ( .D(n34), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[12]) );
  DFFSR \value_reg[11]  ( .D(n36), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[11]) );
  DFFSR \value_reg[10]  ( .D(n38), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[10]) );
  DFFSR \value_reg[9]  ( .D(n40), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[9]) );
  DFFSR \value_reg[8]  ( .D(n42), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[8]) );
  DFFSR \value_reg[7]  ( .D(n44), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[7]) );
  DFFSR \value_reg[6]  ( .D(n46), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[6]) );
  DFFSR \value_reg[5]  ( .D(n48), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[5]) );
  DFFSR \value_reg[4]  ( .D(n50), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[4]) );
  DFFSR \value_reg[3]  ( .D(n52), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[3]) );
  DFFSR \value_reg[2]  ( .D(n53), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[2]) );
  DFFSR \value_reg[1]  ( .D(n54), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[1]) );
  DFFSR \value_reg[0]  ( .D(n55), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[0]) );
  INVX4 U2 ( .A(n1), .Y(n2) );
  INVX1 U3 ( .A(n16), .Y(n36) );
  INVX1 U4 ( .A(n22), .Y(n28) );
  INVX1 U5 ( .A(n11), .Y(n46) );
  INVX1 U6 ( .A(n14), .Y(n40) );
  INVX1 U7 ( .A(n12), .Y(n44) );
  INVX1 U8 ( .A(n17), .Y(n34) );
  INVX1 U9 ( .A(n15), .Y(n38) );
  INVX1 U10 ( .A(n20), .Y(n30) );
  INVX2 U11 ( .A(write_enable), .Y(n1) );
  INVX2 U12 ( .A(n4), .Y(n3) );
  INVX2 U13 ( .A(n_reset), .Y(n4) );
  INVX1 U14 ( .A(n13), .Y(n42) );
  INVX1 U15 ( .A(n18), .Y(n32) );
  MUX2X1 U16 ( .B(current_value[0]), .A(new_value[0]), .S(n2), .Y(n5) );
  INVX2 U17 ( .A(n5), .Y(n55) );
  MUX2X1 U18 ( .B(current_value[1]), .A(new_value[1]), .S(n2), .Y(n6) );
  INVX2 U19 ( .A(n6), .Y(n54) );
  MUX2X1 U20 ( .B(current_value[2]), .A(new_value[2]), .S(n2), .Y(n7) );
  INVX2 U21 ( .A(n7), .Y(n53) );
  MUX2X1 U22 ( .B(current_value[3]), .A(new_value[3]), .S(write_enable), .Y(n8) );
  INVX2 U23 ( .A(n8), .Y(n52) );
  MUX2X1 U24 ( .B(current_value[4]), .A(new_value[4]), .S(n2), .Y(n9) );
  INVX2 U25 ( .A(n9), .Y(n50) );
  MUX2X1 U26 ( .B(current_value[5]), .A(new_value[5]), .S(n2), .Y(n10) );
  INVX2 U27 ( .A(n10), .Y(n48) );
  MUX2X1 U28 ( .B(current_value[6]), .A(new_value[6]), .S(n2), .Y(n11) );
  MUX2X1 U29 ( .B(current_value[7]), .A(new_value[7]), .S(write_enable), .Y(
        n12) );
  MUX2X1 U30 ( .B(current_value[8]), .A(new_value[8]), .S(n2), .Y(n13) );
  MUX2X1 U31 ( .B(current_value[9]), .A(new_value[9]), .S(write_enable), .Y(
        n14) );
  MUX2X1 U32 ( .B(current_value[10]), .A(new_value[10]), .S(n2), .Y(n15) );
  MUX2X1 U33 ( .B(current_value[11]), .A(new_value[11]), .S(write_enable), .Y(
        n16) );
  MUX2X1 U34 ( .B(current_value[12]), .A(new_value[12]), .S(n2), .Y(n17) );
  MUX2X1 U35 ( .B(current_value[13]), .A(new_value[13]), .S(write_enable), .Y(
        n18) );
  MUX2X1 U36 ( .B(current_value[14]), .A(new_value[14]), .S(n2), .Y(n20) );
  MUX2X1 U54 ( .B(current_value[15]), .A(new_value[15]), .S(write_enable), .Y(
        n22) );
  MUX2X1 U55 ( .B(current_value[16]), .A(new_value[16]), .S(n2), .Y(n24) );
  INVX2 U56 ( .A(n24), .Y(n26) );
endmodule


module flex_sreg_NUM_BITS17_11 ( clk, n_reset, write_enable, new_value, 
        current_value );
  input [16:0] new_value;
  output [16:0] current_value;
  input clk, n_reset, write_enable;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n20, n22, n24, n26, n28, n30, n32, n34, n36, n38, n40, n42,
         n44, n46, n48, n50, n52, n53, n54, n55;

  DFFSR \value_reg[16]  ( .D(n26), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[16]) );
  DFFSR \value_reg[15]  ( .D(n28), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[15]) );
  DFFSR \value_reg[14]  ( .D(n30), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[14]) );
  DFFSR \value_reg[13]  ( .D(n32), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[13]) );
  DFFSR \value_reg[12]  ( .D(n34), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[12]) );
  DFFSR \value_reg[11]  ( .D(n36), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[11]) );
  DFFSR \value_reg[10]  ( .D(n38), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[10]) );
  DFFSR \value_reg[9]  ( .D(n40), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[9]) );
  DFFSR \value_reg[8]  ( .D(n42), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[8]) );
  DFFSR \value_reg[7]  ( .D(n44), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[7]) );
  DFFSR \value_reg[6]  ( .D(n46), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[6]) );
  DFFSR \value_reg[5]  ( .D(n48), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[5]) );
  DFFSR \value_reg[4]  ( .D(n50), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[4]) );
  DFFSR \value_reg[3]  ( .D(n52), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[3]) );
  DFFSR \value_reg[2]  ( .D(n53), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[2]) );
  DFFSR \value_reg[1]  ( .D(n54), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[1]) );
  DFFSR \value_reg[0]  ( .D(n55), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[0]) );
  INVX4 U2 ( .A(n1), .Y(n2) );
  INVX1 U3 ( .A(n16), .Y(n36) );
  INVX1 U4 ( .A(n22), .Y(n28) );
  INVX1 U5 ( .A(n11), .Y(n46) );
  INVX1 U6 ( .A(n14), .Y(n40) );
  INVX1 U7 ( .A(n12), .Y(n44) );
  INVX1 U8 ( .A(n17), .Y(n34) );
  INVX1 U9 ( .A(n15), .Y(n38) );
  INVX1 U10 ( .A(n20), .Y(n30) );
  INVX2 U11 ( .A(write_enable), .Y(n1) );
  INVX2 U12 ( .A(n4), .Y(n3) );
  INVX2 U13 ( .A(n_reset), .Y(n4) );
  INVX1 U14 ( .A(n13), .Y(n42) );
  INVX1 U15 ( .A(n18), .Y(n32) );
  MUX2X1 U16 ( .B(current_value[0]), .A(new_value[0]), .S(n2), .Y(n5) );
  INVX2 U17 ( .A(n5), .Y(n55) );
  MUX2X1 U18 ( .B(current_value[1]), .A(new_value[1]), .S(n2), .Y(n6) );
  INVX2 U19 ( .A(n6), .Y(n54) );
  MUX2X1 U20 ( .B(current_value[2]), .A(new_value[2]), .S(n2), .Y(n7) );
  INVX2 U21 ( .A(n7), .Y(n53) );
  MUX2X1 U22 ( .B(current_value[3]), .A(new_value[3]), .S(write_enable), .Y(n8) );
  INVX2 U23 ( .A(n8), .Y(n52) );
  MUX2X1 U24 ( .B(current_value[4]), .A(new_value[4]), .S(n2), .Y(n9) );
  INVX2 U25 ( .A(n9), .Y(n50) );
  MUX2X1 U26 ( .B(current_value[5]), .A(new_value[5]), .S(n2), .Y(n10) );
  INVX2 U27 ( .A(n10), .Y(n48) );
  MUX2X1 U28 ( .B(current_value[6]), .A(new_value[6]), .S(n2), .Y(n11) );
  MUX2X1 U29 ( .B(current_value[7]), .A(new_value[7]), .S(write_enable), .Y(
        n12) );
  MUX2X1 U30 ( .B(current_value[8]), .A(new_value[8]), .S(n2), .Y(n13) );
  MUX2X1 U31 ( .B(current_value[9]), .A(new_value[9]), .S(write_enable), .Y(
        n14) );
  MUX2X1 U32 ( .B(current_value[10]), .A(new_value[10]), .S(n2), .Y(n15) );
  MUX2X1 U33 ( .B(current_value[11]), .A(new_value[11]), .S(write_enable), .Y(
        n16) );
  MUX2X1 U34 ( .B(current_value[12]), .A(new_value[12]), .S(n2), .Y(n17) );
  MUX2X1 U35 ( .B(current_value[13]), .A(new_value[13]), .S(write_enable), .Y(
        n18) );
  MUX2X1 U36 ( .B(current_value[14]), .A(new_value[14]), .S(n2), .Y(n20) );
  MUX2X1 U54 ( .B(current_value[15]), .A(new_value[15]), .S(write_enable), .Y(
        n22) );
  MUX2X1 U55 ( .B(current_value[16]), .A(new_value[16]), .S(n2), .Y(n24) );
  INVX2 U56 ( .A(n24), .Y(n26) );
endmodule


module flex_sreg_NUM_BITS17_10 ( clk, n_reset, write_enable, new_value, 
        current_value );
  input [16:0] new_value;
  output [16:0] current_value;
  input clk, n_reset, write_enable;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n20, n22, n24, n26, n28, n30, n32, n34, n36, n38, n40, n42,
         n44, n46, n48, n50, n52, n53, n54, n55;

  DFFSR \value_reg[16]  ( .D(n26), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[16]) );
  DFFSR \value_reg[15]  ( .D(n28), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[15]) );
  DFFSR \value_reg[14]  ( .D(n30), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[14]) );
  DFFSR \value_reg[13]  ( .D(n32), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[13]) );
  DFFSR \value_reg[12]  ( .D(n34), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[12]) );
  DFFSR \value_reg[11]  ( .D(n36), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[11]) );
  DFFSR \value_reg[10]  ( .D(n38), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[10]) );
  DFFSR \value_reg[9]  ( .D(n40), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[9]) );
  DFFSR \value_reg[8]  ( .D(n42), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[8]) );
  DFFSR \value_reg[7]  ( .D(n44), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[7]) );
  DFFSR \value_reg[6]  ( .D(n46), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[6]) );
  DFFSR \value_reg[5]  ( .D(n48), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[5]) );
  DFFSR \value_reg[4]  ( .D(n50), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[4]) );
  DFFSR \value_reg[3]  ( .D(n52), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[3]) );
  DFFSR \value_reg[2]  ( .D(n53), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[2]) );
  DFFSR \value_reg[1]  ( .D(n54), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[1]) );
  DFFSR \value_reg[0]  ( .D(n55), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[0]) );
  INVX4 U2 ( .A(n1), .Y(n2) );
  INVX1 U3 ( .A(n16), .Y(n36) );
  INVX1 U4 ( .A(n22), .Y(n28) );
  INVX1 U5 ( .A(n11), .Y(n46) );
  INVX1 U6 ( .A(n14), .Y(n40) );
  INVX1 U7 ( .A(n17), .Y(n34) );
  INVX1 U8 ( .A(n15), .Y(n38) );
  INVX1 U9 ( .A(n20), .Y(n30) );
  INVX2 U10 ( .A(write_enable), .Y(n1) );
  INVX2 U11 ( .A(n4), .Y(n3) );
  INVX2 U12 ( .A(n_reset), .Y(n4) );
  INVX1 U13 ( .A(n13), .Y(n42) );
  INVX1 U14 ( .A(n12), .Y(n44) );
  INVX1 U15 ( .A(n18), .Y(n32) );
  MUX2X1 U16 ( .B(current_value[0]), .A(new_value[0]), .S(n2), .Y(n5) );
  INVX2 U17 ( .A(n5), .Y(n55) );
  MUX2X1 U18 ( .B(current_value[1]), .A(new_value[1]), .S(n2), .Y(n6) );
  INVX2 U19 ( .A(n6), .Y(n54) );
  MUX2X1 U20 ( .B(current_value[2]), .A(new_value[2]), .S(n2), .Y(n7) );
  INVX2 U21 ( .A(n7), .Y(n53) );
  MUX2X1 U22 ( .B(current_value[3]), .A(new_value[3]), .S(n2), .Y(n8) );
  INVX2 U23 ( .A(n8), .Y(n52) );
  MUX2X1 U24 ( .B(current_value[4]), .A(new_value[4]), .S(n2), .Y(n9) );
  INVX2 U25 ( .A(n9), .Y(n50) );
  MUX2X1 U26 ( .B(current_value[5]), .A(new_value[5]), .S(write_enable), .Y(
        n10) );
  INVX2 U27 ( .A(n10), .Y(n48) );
  MUX2X1 U28 ( .B(current_value[6]), .A(new_value[6]), .S(n2), .Y(n11) );
  MUX2X1 U29 ( .B(current_value[7]), .A(new_value[7]), .S(write_enable), .Y(
        n12) );
  MUX2X1 U30 ( .B(current_value[8]), .A(new_value[8]), .S(n2), .Y(n13) );
  MUX2X1 U31 ( .B(current_value[9]), .A(new_value[9]), .S(write_enable), .Y(
        n14) );
  MUX2X1 U32 ( .B(current_value[10]), .A(new_value[10]), .S(n2), .Y(n15) );
  MUX2X1 U33 ( .B(current_value[11]), .A(new_value[11]), .S(write_enable), .Y(
        n16) );
  MUX2X1 U34 ( .B(current_value[12]), .A(new_value[12]), .S(n2), .Y(n17) );
  MUX2X1 U35 ( .B(current_value[13]), .A(new_value[13]), .S(write_enable), .Y(
        n18) );
  MUX2X1 U36 ( .B(current_value[14]), .A(new_value[14]), .S(n2), .Y(n20) );
  MUX2X1 U54 ( .B(current_value[15]), .A(new_value[15]), .S(write_enable), .Y(
        n22) );
  MUX2X1 U55 ( .B(current_value[16]), .A(new_value[16]), .S(n2), .Y(n24) );
  INVX2 U56 ( .A(n24), .Y(n26) );
endmodule


module flex_sreg_NUM_BITS17_9 ( clk, n_reset, write_enable, new_value, 
        current_value );
  input [16:0] new_value;
  output [16:0] current_value;
  input clk, n_reset, write_enable;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n20, n22, n24, n26, n28, n30, n32, n34, n36, n38, n40, n42,
         n44, n46, n48, n50, n52, n53, n54, n55;

  DFFSR \value_reg[16]  ( .D(n26), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[16]) );
  DFFSR \value_reg[15]  ( .D(n28), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[15]) );
  DFFSR \value_reg[14]  ( .D(n30), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[14]) );
  DFFSR \value_reg[13]  ( .D(n32), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[13]) );
  DFFSR \value_reg[12]  ( .D(n34), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[12]) );
  DFFSR \value_reg[11]  ( .D(n36), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[11]) );
  DFFSR \value_reg[10]  ( .D(n38), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[10]) );
  DFFSR \value_reg[9]  ( .D(n40), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[9]) );
  DFFSR \value_reg[8]  ( .D(n42), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[8]) );
  DFFSR \value_reg[7]  ( .D(n44), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[7]) );
  DFFSR \value_reg[6]  ( .D(n46), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[6]) );
  DFFSR \value_reg[5]  ( .D(n48), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[5]) );
  DFFSR \value_reg[4]  ( .D(n50), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[4]) );
  DFFSR \value_reg[3]  ( .D(n52), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[3]) );
  DFFSR \value_reg[2]  ( .D(n53), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[2]) );
  DFFSR \value_reg[1]  ( .D(n54), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[1]) );
  DFFSR \value_reg[0]  ( .D(n55), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[0]) );
  INVX4 U2 ( .A(n1), .Y(n2) );
  INVX1 U3 ( .A(n16), .Y(n36) );
  INVX1 U4 ( .A(n22), .Y(n28) );
  INVX1 U5 ( .A(n11), .Y(n46) );
  INVX1 U6 ( .A(n14), .Y(n40) );
  INVX1 U7 ( .A(n12), .Y(n44) );
  INVX1 U8 ( .A(n17), .Y(n34) );
  INVX1 U9 ( .A(n15), .Y(n38) );
  INVX1 U10 ( .A(n20), .Y(n30) );
  INVX2 U11 ( .A(write_enable), .Y(n1) );
  INVX2 U12 ( .A(n4), .Y(n3) );
  INVX2 U13 ( .A(n_reset), .Y(n4) );
  INVX1 U14 ( .A(n13), .Y(n42) );
  INVX1 U15 ( .A(n18), .Y(n32) );
  MUX2X1 U16 ( .B(current_value[0]), .A(new_value[0]), .S(n2), .Y(n5) );
  INVX2 U17 ( .A(n5), .Y(n55) );
  MUX2X1 U18 ( .B(current_value[1]), .A(new_value[1]), .S(n2), .Y(n6) );
  INVX2 U19 ( .A(n6), .Y(n54) );
  MUX2X1 U20 ( .B(current_value[2]), .A(new_value[2]), .S(n2), .Y(n7) );
  INVX2 U21 ( .A(n7), .Y(n53) );
  MUX2X1 U22 ( .B(current_value[3]), .A(new_value[3]), .S(n2), .Y(n8) );
  INVX2 U23 ( .A(n8), .Y(n52) );
  MUX2X1 U24 ( .B(current_value[4]), .A(new_value[4]), .S(n2), .Y(n9) );
  INVX2 U25 ( .A(n9), .Y(n50) );
  MUX2X1 U26 ( .B(current_value[5]), .A(new_value[5]), .S(write_enable), .Y(
        n10) );
  INVX2 U27 ( .A(n10), .Y(n48) );
  MUX2X1 U28 ( .B(current_value[6]), .A(new_value[6]), .S(n2), .Y(n11) );
  MUX2X1 U29 ( .B(current_value[7]), .A(new_value[7]), .S(write_enable), .Y(
        n12) );
  MUX2X1 U30 ( .B(current_value[8]), .A(new_value[8]), .S(n2), .Y(n13) );
  MUX2X1 U31 ( .B(current_value[9]), .A(new_value[9]), .S(write_enable), .Y(
        n14) );
  MUX2X1 U32 ( .B(current_value[10]), .A(new_value[10]), .S(n2), .Y(n15) );
  MUX2X1 U33 ( .B(current_value[11]), .A(new_value[11]), .S(write_enable), .Y(
        n16) );
  MUX2X1 U34 ( .B(current_value[12]), .A(new_value[12]), .S(n2), .Y(n17) );
  MUX2X1 U35 ( .B(current_value[13]), .A(new_value[13]), .S(write_enable), .Y(
        n18) );
  MUX2X1 U36 ( .B(current_value[14]), .A(new_value[14]), .S(n2), .Y(n20) );
  MUX2X1 U54 ( .B(current_value[15]), .A(new_value[15]), .S(write_enable), .Y(
        n22) );
  MUX2X1 U55 ( .B(current_value[16]), .A(new_value[16]), .S(n2), .Y(n24) );
  INVX2 U56 ( .A(n24), .Y(n26) );
endmodule


module flex_sreg_NUM_BITS17_8 ( clk, n_reset, write_enable, new_value, 
        current_value );
  input [16:0] new_value;
  output [16:0] current_value;
  input clk, n_reset, write_enable;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n20, n22, n24, n26, n28, n30, n32, n34, n36, n38, n40, n42,
         n44, n46, n48, n50, n52, n53, n54, n55;

  DFFSR \value_reg[16]  ( .D(n26), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[16]) );
  DFFSR \value_reg[15]  ( .D(n28), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[15]) );
  DFFSR \value_reg[14]  ( .D(n30), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[14]) );
  DFFSR \value_reg[13]  ( .D(n32), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[13]) );
  DFFSR \value_reg[12]  ( .D(n34), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[12]) );
  DFFSR \value_reg[11]  ( .D(n36), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[11]) );
  DFFSR \value_reg[10]  ( .D(n38), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[10]) );
  DFFSR \value_reg[9]  ( .D(n40), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[9]) );
  DFFSR \value_reg[8]  ( .D(n42), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[8]) );
  DFFSR \value_reg[7]  ( .D(n44), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[7]) );
  DFFSR \value_reg[6]  ( .D(n46), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[6]) );
  DFFSR \value_reg[5]  ( .D(n48), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[5]) );
  DFFSR \value_reg[4]  ( .D(n50), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[4]) );
  DFFSR \value_reg[3]  ( .D(n52), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[3]) );
  DFFSR \value_reg[2]  ( .D(n53), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[2]) );
  DFFSR \value_reg[1]  ( .D(n54), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[1]) );
  DFFSR \value_reg[0]  ( .D(n55), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[0]) );
  INVX4 U2 ( .A(n1), .Y(n2) );
  INVX1 U3 ( .A(n16), .Y(n36) );
  INVX1 U4 ( .A(n22), .Y(n28) );
  INVX1 U5 ( .A(n11), .Y(n46) );
  INVX1 U6 ( .A(n14), .Y(n40) );
  INVX1 U7 ( .A(n12), .Y(n44) );
  INVX1 U8 ( .A(n17), .Y(n34) );
  INVX1 U9 ( .A(n15), .Y(n38) );
  INVX1 U10 ( .A(n20), .Y(n30) );
  INVX2 U11 ( .A(write_enable), .Y(n1) );
  INVX2 U12 ( .A(n4), .Y(n3) );
  INVX2 U13 ( .A(n_reset), .Y(n4) );
  INVX1 U14 ( .A(n13), .Y(n42) );
  INVX1 U15 ( .A(n18), .Y(n32) );
  MUX2X1 U16 ( .B(current_value[0]), .A(new_value[0]), .S(n2), .Y(n5) );
  INVX2 U17 ( .A(n5), .Y(n55) );
  MUX2X1 U18 ( .B(current_value[1]), .A(new_value[1]), .S(n2), .Y(n6) );
  INVX2 U19 ( .A(n6), .Y(n54) );
  MUX2X1 U20 ( .B(current_value[2]), .A(new_value[2]), .S(n2), .Y(n7) );
  INVX2 U21 ( .A(n7), .Y(n53) );
  MUX2X1 U22 ( .B(current_value[3]), .A(new_value[3]), .S(write_enable), .Y(n8) );
  INVX2 U23 ( .A(n8), .Y(n52) );
  MUX2X1 U24 ( .B(current_value[4]), .A(new_value[4]), .S(n2), .Y(n9) );
  INVX2 U25 ( .A(n9), .Y(n50) );
  MUX2X1 U26 ( .B(current_value[5]), .A(new_value[5]), .S(n2), .Y(n10) );
  INVX2 U27 ( .A(n10), .Y(n48) );
  MUX2X1 U28 ( .B(current_value[6]), .A(new_value[6]), .S(n2), .Y(n11) );
  MUX2X1 U29 ( .B(current_value[7]), .A(new_value[7]), .S(write_enable), .Y(
        n12) );
  MUX2X1 U30 ( .B(current_value[8]), .A(new_value[8]), .S(n2), .Y(n13) );
  MUX2X1 U31 ( .B(current_value[9]), .A(new_value[9]), .S(write_enable), .Y(
        n14) );
  MUX2X1 U32 ( .B(current_value[10]), .A(new_value[10]), .S(n2), .Y(n15) );
  MUX2X1 U33 ( .B(current_value[11]), .A(new_value[11]), .S(write_enable), .Y(
        n16) );
  MUX2X1 U34 ( .B(current_value[12]), .A(new_value[12]), .S(n2), .Y(n17) );
  MUX2X1 U35 ( .B(current_value[13]), .A(new_value[13]), .S(write_enable), .Y(
        n18) );
  MUX2X1 U36 ( .B(current_value[14]), .A(new_value[14]), .S(n2), .Y(n20) );
  MUX2X1 U54 ( .B(current_value[15]), .A(new_value[15]), .S(write_enable), .Y(
        n22) );
  MUX2X1 U55 ( .B(current_value[16]), .A(new_value[16]), .S(n2), .Y(n24) );
  INVX2 U56 ( .A(n24), .Y(n26) );
endmodule


module flex_sreg_NUM_BITS17_7 ( clk, n_reset, write_enable, new_value, 
        current_value );
  input [16:0] new_value;
  output [16:0] current_value;
  input clk, n_reset, write_enable;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n20, n22, n24, n26, n28, n30, n32, n34, n36, n38, n40, n42,
         n44, n46, n48, n50, n52, n53, n54, n55, n56;

  DFFSR \value_reg[16]  ( .D(n28), .CLK(clk), .R(n4), .S(1'b1), .Q(
        current_value[16]) );
  DFFSR \value_reg[15]  ( .D(n30), .CLK(clk), .R(n4), .S(1'b1), .Q(
        current_value[15]) );
  DFFSR \value_reg[14]  ( .D(n32), .CLK(clk), .R(n4), .S(1'b1), .Q(
        current_value[14]) );
  DFFSR \value_reg[13]  ( .D(n34), .CLK(clk), .R(n4), .S(1'b1), .Q(
        current_value[13]) );
  DFFSR \value_reg[12]  ( .D(n36), .CLK(clk), .R(n4), .S(1'b1), .Q(
        current_value[12]) );
  DFFSR \value_reg[11]  ( .D(n38), .CLK(clk), .R(n4), .S(1'b1), .Q(
        current_value[11]) );
  DFFSR \value_reg[10]  ( .D(n40), .CLK(clk), .R(n4), .S(1'b1), .Q(
        current_value[10]) );
  DFFSR \value_reg[9]  ( .D(n42), .CLK(clk), .R(n4), .S(1'b1), .Q(
        current_value[9]) );
  DFFSR \value_reg[8]  ( .D(n44), .CLK(clk), .R(n4), .S(1'b1), .Q(
        current_value[8]) );
  DFFSR \value_reg[7]  ( .D(n46), .CLK(clk), .R(n4), .S(1'b1), .Q(
        current_value[7]) );
  DFFSR \value_reg[6]  ( .D(n48), .CLK(clk), .R(n4), .S(1'b1), .Q(
        current_value[6]) );
  DFFSR \value_reg[5]  ( .D(n50), .CLK(clk), .R(n4), .S(1'b1), .Q(
        current_value[5]) );
  DFFSR \value_reg[4]  ( .D(n52), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[4]) );
  DFFSR \value_reg[3]  ( .D(n53), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[3]) );
  DFFSR \value_reg[2]  ( .D(n54), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[2]) );
  DFFSR \value_reg[1]  ( .D(n55), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[1]) );
  DFFSR \value_reg[0]  ( .D(n56), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[0]) );
  INVX1 U2 ( .A(n17), .Y(n38) );
  INVX1 U3 ( .A(n24), .Y(n30) );
  INVX1 U4 ( .A(n12), .Y(n48) );
  INVX1 U5 ( .A(n15), .Y(n42) );
  INVX1 U6 ( .A(n18), .Y(n36) );
  INVX1 U7 ( .A(n16), .Y(n40) );
  INVX1 U8 ( .A(n22), .Y(n32) );
  INVX2 U9 ( .A(n1), .Y(n2) );
  INVX2 U10 ( .A(n1), .Y(n3) );
  INVX2 U11 ( .A(write_enable), .Y(n1) );
  INVX2 U12 ( .A(n5), .Y(n4) );
  INVX2 U13 ( .A(n_reset), .Y(n5) );
  INVX1 U14 ( .A(n14), .Y(n44) );
  INVX1 U15 ( .A(n13), .Y(n46) );
  INVX1 U16 ( .A(n20), .Y(n34) );
  MUX2X1 U17 ( .B(current_value[0]), .A(new_value[0]), .S(n2), .Y(n6) );
  INVX2 U18 ( .A(n6), .Y(n56) );
  MUX2X1 U19 ( .B(current_value[1]), .A(new_value[1]), .S(n3), .Y(n7) );
  INVX2 U20 ( .A(n7), .Y(n55) );
  MUX2X1 U21 ( .B(current_value[2]), .A(new_value[2]), .S(n2), .Y(n8) );
  INVX2 U22 ( .A(n8), .Y(n54) );
  MUX2X1 U23 ( .B(current_value[3]), .A(new_value[3]), .S(n3), .Y(n9) );
  INVX2 U24 ( .A(n9), .Y(n53) );
  MUX2X1 U25 ( .B(current_value[4]), .A(new_value[4]), .S(n2), .Y(n10) );
  INVX2 U26 ( .A(n10), .Y(n52) );
  MUX2X1 U27 ( .B(current_value[5]), .A(new_value[5]), .S(n3), .Y(n11) );
  INVX2 U28 ( .A(n11), .Y(n50) );
  MUX2X1 U29 ( .B(current_value[6]), .A(new_value[6]), .S(n2), .Y(n12) );
  MUX2X1 U30 ( .B(current_value[7]), .A(new_value[7]), .S(n3), .Y(n13) );
  MUX2X1 U31 ( .B(current_value[8]), .A(new_value[8]), .S(n2), .Y(n14) );
  MUX2X1 U32 ( .B(current_value[9]), .A(new_value[9]), .S(n3), .Y(n15) );
  MUX2X1 U33 ( .B(current_value[10]), .A(new_value[10]), .S(n2), .Y(n16) );
  MUX2X1 U34 ( .B(current_value[11]), .A(new_value[11]), .S(n3), .Y(n17) );
  MUX2X1 U35 ( .B(current_value[12]), .A(new_value[12]), .S(n2), .Y(n18) );
  MUX2X1 U36 ( .B(current_value[13]), .A(new_value[13]), .S(n3), .Y(n20) );
  MUX2X1 U54 ( .B(current_value[14]), .A(new_value[14]), .S(n2), .Y(n22) );
  MUX2X1 U55 ( .B(current_value[15]), .A(new_value[15]), .S(n3), .Y(n24) );
  MUX2X1 U56 ( .B(current_value[16]), .A(new_value[16]), .S(n2), .Y(n26) );
  INVX2 U57 ( .A(n26), .Y(n28) );
endmodule


module flex_sreg_NUM_BITS17_6 ( clk, n_reset, write_enable, new_value, 
        current_value );
  input [16:0] new_value;
  output [16:0] current_value;
  input clk, n_reset, write_enable;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n20, n22, n24, n26, n28, n30, n32, n34, n36, n38, n40, n42,
         n44, n46, n48, n50, n52, n53, n54, n55;

  DFFSR \value_reg[16]  ( .D(n26), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[16]) );
  DFFSR \value_reg[15]  ( .D(n28), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[15]) );
  DFFSR \value_reg[14]  ( .D(n30), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[14]) );
  DFFSR \value_reg[13]  ( .D(n32), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[13]) );
  DFFSR \value_reg[12]  ( .D(n34), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[12]) );
  DFFSR \value_reg[11]  ( .D(n36), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[11]) );
  DFFSR \value_reg[10]  ( .D(n38), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[10]) );
  DFFSR \value_reg[9]  ( .D(n40), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[9]) );
  DFFSR \value_reg[8]  ( .D(n42), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[8]) );
  DFFSR \value_reg[7]  ( .D(n44), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[7]) );
  DFFSR \value_reg[6]  ( .D(n46), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[6]) );
  DFFSR \value_reg[5]  ( .D(n48), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[5]) );
  DFFSR \value_reg[4]  ( .D(n50), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[4]) );
  DFFSR \value_reg[3]  ( .D(n52), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[3]) );
  DFFSR \value_reg[2]  ( .D(n53), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[2]) );
  DFFSR \value_reg[1]  ( .D(n54), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[1]) );
  DFFSR \value_reg[0]  ( .D(n55), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[0]) );
  INVX4 U2 ( .A(n1), .Y(n2) );
  INVX1 U3 ( .A(n16), .Y(n36) );
  INVX1 U4 ( .A(n22), .Y(n28) );
  INVX1 U5 ( .A(n11), .Y(n46) );
  INVX1 U6 ( .A(n14), .Y(n40) );
  INVX1 U7 ( .A(n17), .Y(n34) );
  INVX1 U8 ( .A(n20), .Y(n30) );
  INVX2 U9 ( .A(write_enable), .Y(n1) );
  INVX2 U10 ( .A(n4), .Y(n3) );
  INVX2 U11 ( .A(n_reset), .Y(n4) );
  INVX1 U12 ( .A(n13), .Y(n42) );
  INVX1 U13 ( .A(n12), .Y(n44) );
  INVX1 U14 ( .A(n15), .Y(n38) );
  INVX1 U15 ( .A(n18), .Y(n32) );
  MUX2X1 U16 ( .B(current_value[0]), .A(new_value[0]), .S(n2), .Y(n5) );
  INVX2 U17 ( .A(n5), .Y(n55) );
  MUX2X1 U18 ( .B(current_value[1]), .A(new_value[1]), .S(n2), .Y(n6) );
  INVX2 U19 ( .A(n6), .Y(n54) );
  MUX2X1 U20 ( .B(current_value[2]), .A(new_value[2]), .S(n2), .Y(n7) );
  INVX2 U21 ( .A(n7), .Y(n53) );
  MUX2X1 U22 ( .B(current_value[3]), .A(new_value[3]), .S(n2), .Y(n8) );
  INVX2 U23 ( .A(n8), .Y(n52) );
  MUX2X1 U24 ( .B(current_value[4]), .A(new_value[4]), .S(n2), .Y(n9) );
  INVX2 U25 ( .A(n9), .Y(n50) );
  MUX2X1 U26 ( .B(current_value[5]), .A(new_value[5]), .S(write_enable), .Y(
        n10) );
  INVX2 U27 ( .A(n10), .Y(n48) );
  MUX2X1 U28 ( .B(current_value[6]), .A(new_value[6]), .S(n2), .Y(n11) );
  MUX2X1 U29 ( .B(current_value[7]), .A(new_value[7]), .S(write_enable), .Y(
        n12) );
  MUX2X1 U30 ( .B(current_value[8]), .A(new_value[8]), .S(n2), .Y(n13) );
  MUX2X1 U31 ( .B(current_value[9]), .A(new_value[9]), .S(write_enable), .Y(
        n14) );
  MUX2X1 U32 ( .B(current_value[10]), .A(new_value[10]), .S(n2), .Y(n15) );
  MUX2X1 U33 ( .B(current_value[11]), .A(new_value[11]), .S(write_enable), .Y(
        n16) );
  MUX2X1 U34 ( .B(current_value[12]), .A(new_value[12]), .S(n2), .Y(n17) );
  MUX2X1 U35 ( .B(current_value[13]), .A(new_value[13]), .S(write_enable), .Y(
        n18) );
  MUX2X1 U36 ( .B(current_value[14]), .A(new_value[14]), .S(n2), .Y(n20) );
  MUX2X1 U54 ( .B(current_value[15]), .A(new_value[15]), .S(write_enable), .Y(
        n22) );
  MUX2X1 U55 ( .B(current_value[16]), .A(new_value[16]), .S(n2), .Y(n24) );
  INVX2 U56 ( .A(n24), .Y(n26) );
endmodule


module flex_sreg_NUM_BITS17_5 ( clk, n_reset, write_enable, new_value, 
        current_value );
  input [16:0] new_value;
  output [16:0] current_value;
  input clk, n_reset, write_enable;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n20, n22, n24, n26, n28, n30, n32, n34, n36, n38, n40, n42,
         n44, n46, n48, n50, n52, n53, n54, n55, n56;

  DFFSR \value_reg[16]  ( .D(n28), .CLK(clk), .R(n4), .S(1'b1), .Q(
        current_value[16]) );
  DFFSR \value_reg[15]  ( .D(n30), .CLK(clk), .R(n4), .S(1'b1), .Q(
        current_value[15]) );
  DFFSR \value_reg[14]  ( .D(n32), .CLK(clk), .R(n4), .S(1'b1), .Q(
        current_value[14]) );
  DFFSR \value_reg[13]  ( .D(n34), .CLK(clk), .R(n4), .S(1'b1), .Q(
        current_value[13]) );
  DFFSR \value_reg[12]  ( .D(n36), .CLK(clk), .R(n4), .S(1'b1), .Q(
        current_value[12]) );
  DFFSR \value_reg[11]  ( .D(n38), .CLK(clk), .R(n4), .S(1'b1), .Q(
        current_value[11]) );
  DFFSR \value_reg[10]  ( .D(n40), .CLK(clk), .R(n4), .S(1'b1), .Q(
        current_value[10]) );
  DFFSR \value_reg[9]  ( .D(n42), .CLK(clk), .R(n4), .S(1'b1), .Q(
        current_value[9]) );
  DFFSR \value_reg[8]  ( .D(n44), .CLK(clk), .R(n4), .S(1'b1), .Q(
        current_value[8]) );
  DFFSR \value_reg[7]  ( .D(n46), .CLK(clk), .R(n4), .S(1'b1), .Q(
        current_value[7]) );
  DFFSR \value_reg[6]  ( .D(n48), .CLK(clk), .R(n4), .S(1'b1), .Q(
        current_value[6]) );
  DFFSR \value_reg[5]  ( .D(n50), .CLK(clk), .R(n4), .S(1'b1), .Q(
        current_value[5]) );
  DFFSR \value_reg[4]  ( .D(n52), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[4]) );
  DFFSR \value_reg[3]  ( .D(n53), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[3]) );
  DFFSR \value_reg[2]  ( .D(n54), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[2]) );
  DFFSR \value_reg[1]  ( .D(n55), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[1]) );
  DFFSR \value_reg[0]  ( .D(n56), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[0]) );
  INVX1 U2 ( .A(n12), .Y(n48) );
  INVX1 U3 ( .A(n17), .Y(n38) );
  INVX1 U4 ( .A(n24), .Y(n30) );
  INVX1 U5 ( .A(n20), .Y(n34) );
  INVX1 U6 ( .A(n15), .Y(n42) );
  INVX1 U7 ( .A(n18), .Y(n36) );
  INVX1 U8 ( .A(n16), .Y(n40) );
  INVX1 U9 ( .A(n22), .Y(n32) );
  INVX2 U10 ( .A(n1), .Y(n2) );
  INVX2 U11 ( .A(n1), .Y(n3) );
  INVX2 U12 ( .A(write_enable), .Y(n1) );
  INVX2 U13 ( .A(n5), .Y(n4) );
  INVX2 U14 ( .A(n_reset), .Y(n5) );
  INVX1 U15 ( .A(n14), .Y(n44) );
  INVX1 U16 ( .A(n13), .Y(n46) );
  MUX2X1 U17 ( .B(current_value[0]), .A(new_value[0]), .S(n2), .Y(n6) );
  INVX2 U18 ( .A(n6), .Y(n56) );
  MUX2X1 U19 ( .B(current_value[1]), .A(new_value[1]), .S(n3), .Y(n7) );
  INVX2 U20 ( .A(n7), .Y(n55) );
  MUX2X1 U21 ( .B(current_value[2]), .A(new_value[2]), .S(n2), .Y(n8) );
  INVX2 U22 ( .A(n8), .Y(n54) );
  MUX2X1 U23 ( .B(current_value[3]), .A(new_value[3]), .S(n3), .Y(n9) );
  INVX2 U24 ( .A(n9), .Y(n53) );
  MUX2X1 U25 ( .B(current_value[4]), .A(new_value[4]), .S(n2), .Y(n10) );
  INVX2 U26 ( .A(n10), .Y(n52) );
  MUX2X1 U27 ( .B(current_value[5]), .A(new_value[5]), .S(n3), .Y(n11) );
  INVX2 U28 ( .A(n11), .Y(n50) );
  MUX2X1 U29 ( .B(current_value[6]), .A(new_value[6]), .S(n2), .Y(n12) );
  MUX2X1 U30 ( .B(current_value[7]), .A(new_value[7]), .S(n3), .Y(n13) );
  MUX2X1 U31 ( .B(current_value[8]), .A(new_value[8]), .S(n2), .Y(n14) );
  MUX2X1 U32 ( .B(current_value[9]), .A(new_value[9]), .S(n3), .Y(n15) );
  MUX2X1 U33 ( .B(current_value[10]), .A(new_value[10]), .S(n2), .Y(n16) );
  MUX2X1 U34 ( .B(current_value[11]), .A(new_value[11]), .S(n3), .Y(n17) );
  MUX2X1 U35 ( .B(current_value[12]), .A(new_value[12]), .S(n2), .Y(n18) );
  MUX2X1 U36 ( .B(current_value[13]), .A(new_value[13]), .S(n3), .Y(n20) );
  MUX2X1 U54 ( .B(current_value[14]), .A(new_value[14]), .S(n2), .Y(n22) );
  MUX2X1 U55 ( .B(current_value[15]), .A(new_value[15]), .S(n3), .Y(n24) );
  MUX2X1 U56 ( .B(current_value[16]), .A(new_value[16]), .S(n2), .Y(n26) );
  INVX2 U57 ( .A(n26), .Y(n28) );
endmodule


module flex_sreg_NUM_BITS17_4 ( clk, n_reset, write_enable, new_value, 
        current_value );
  input [16:0] new_value;
  output [16:0] current_value;
  input clk, n_reset, write_enable;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n20, n22, n24, n26, n28, n30, n32, n34, n36, n38, n40, n42,
         n44, n46, n48, n50, n52, n53, n54, n55;

  DFFSR \value_reg[16]  ( .D(n26), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[16]) );
  DFFSR \value_reg[15]  ( .D(n28), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[15]) );
  DFFSR \value_reg[14]  ( .D(n30), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[14]) );
  DFFSR \value_reg[13]  ( .D(n32), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[13]) );
  DFFSR \value_reg[12]  ( .D(n34), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[12]) );
  DFFSR \value_reg[11]  ( .D(n36), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[11]) );
  DFFSR \value_reg[10]  ( .D(n38), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[10]) );
  DFFSR \value_reg[9]  ( .D(n40), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[9]) );
  DFFSR \value_reg[8]  ( .D(n42), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[8]) );
  DFFSR \value_reg[7]  ( .D(n44), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[7]) );
  DFFSR \value_reg[6]  ( .D(n46), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[6]) );
  DFFSR \value_reg[5]  ( .D(n48), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[5]) );
  DFFSR \value_reg[4]  ( .D(n50), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[4]) );
  DFFSR \value_reg[3]  ( .D(n52), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[3]) );
  DFFSR \value_reg[2]  ( .D(n53), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[2]) );
  DFFSR \value_reg[1]  ( .D(n54), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[1]) );
  DFFSR \value_reg[0]  ( .D(n55), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[0]) );
  INVX4 U2 ( .A(n1), .Y(n2) );
  INVX1 U3 ( .A(n11), .Y(n46) );
  INVX1 U4 ( .A(n16), .Y(n36) );
  INVX1 U5 ( .A(n22), .Y(n28) );
  INVX1 U6 ( .A(n14), .Y(n40) );
  INVX1 U7 ( .A(n13), .Y(n42) );
  INVX1 U8 ( .A(n17), .Y(n34) );
  INVX1 U9 ( .A(n15), .Y(n38) );
  INVX1 U10 ( .A(n20), .Y(n30) );
  INVX2 U11 ( .A(write_enable), .Y(n1) );
  INVX2 U12 ( .A(n4), .Y(n3) );
  INVX2 U13 ( .A(n_reset), .Y(n4) );
  INVX1 U14 ( .A(n12), .Y(n44) );
  INVX1 U15 ( .A(n18), .Y(n32) );
  MUX2X1 U16 ( .B(current_value[0]), .A(new_value[0]), .S(n2), .Y(n5) );
  INVX2 U17 ( .A(n5), .Y(n55) );
  MUX2X1 U18 ( .B(current_value[1]), .A(new_value[1]), .S(n2), .Y(n6) );
  INVX2 U19 ( .A(n6), .Y(n54) );
  MUX2X1 U20 ( .B(current_value[2]), .A(new_value[2]), .S(n2), .Y(n7) );
  INVX2 U21 ( .A(n7), .Y(n53) );
  MUX2X1 U22 ( .B(current_value[3]), .A(new_value[3]), .S(n2), .Y(n8) );
  INVX2 U23 ( .A(n8), .Y(n52) );
  MUX2X1 U24 ( .B(current_value[4]), .A(new_value[4]), .S(n2), .Y(n9) );
  INVX2 U25 ( .A(n9), .Y(n50) );
  MUX2X1 U26 ( .B(current_value[5]), .A(new_value[5]), .S(write_enable), .Y(
        n10) );
  INVX2 U27 ( .A(n10), .Y(n48) );
  MUX2X1 U28 ( .B(current_value[6]), .A(new_value[6]), .S(n2), .Y(n11) );
  MUX2X1 U29 ( .B(current_value[7]), .A(new_value[7]), .S(write_enable), .Y(
        n12) );
  MUX2X1 U30 ( .B(current_value[8]), .A(new_value[8]), .S(n2), .Y(n13) );
  MUX2X1 U31 ( .B(current_value[9]), .A(new_value[9]), .S(write_enable), .Y(
        n14) );
  MUX2X1 U32 ( .B(current_value[10]), .A(new_value[10]), .S(n2), .Y(n15) );
  MUX2X1 U33 ( .B(current_value[11]), .A(new_value[11]), .S(write_enable), .Y(
        n16) );
  MUX2X1 U34 ( .B(current_value[12]), .A(new_value[12]), .S(n2), .Y(n17) );
  MUX2X1 U35 ( .B(current_value[13]), .A(new_value[13]), .S(write_enable), .Y(
        n18) );
  MUX2X1 U36 ( .B(current_value[14]), .A(new_value[14]), .S(n2), .Y(n20) );
  MUX2X1 U54 ( .B(current_value[15]), .A(new_value[15]), .S(write_enable), .Y(
        n22) );
  MUX2X1 U55 ( .B(current_value[16]), .A(new_value[16]), .S(n2), .Y(n24) );
  INVX2 U56 ( .A(n24), .Y(n26) );
endmodule


module flex_sreg_NUM_BITS17_3 ( clk, n_reset, write_enable, new_value, 
        current_value );
  input [16:0] new_value;
  output [16:0] current_value;
  input clk, n_reset, write_enable;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n20, n22, n24, n26, n28, n30, n32, n34, n36, n38, n40, n42,
         n44, n46, n48, n50, n52, n53, n54, n55, n56;

  DFFSR \value_reg[16]  ( .D(n28), .CLK(clk), .R(n4), .S(1'b1), .Q(
        current_value[16]) );
  DFFSR \value_reg[15]  ( .D(n30), .CLK(clk), .R(n4), .S(1'b1), .Q(
        current_value[15]) );
  DFFSR \value_reg[14]  ( .D(n32), .CLK(clk), .R(n4), .S(1'b1), .Q(
        current_value[14]) );
  DFFSR \value_reg[13]  ( .D(n34), .CLK(clk), .R(n4), .S(1'b1), .Q(
        current_value[13]) );
  DFFSR \value_reg[12]  ( .D(n36), .CLK(clk), .R(n4), .S(1'b1), .Q(
        current_value[12]) );
  DFFSR \value_reg[11]  ( .D(n38), .CLK(clk), .R(n4), .S(1'b1), .Q(
        current_value[11]) );
  DFFSR \value_reg[10]  ( .D(n40), .CLK(clk), .R(n4), .S(1'b1), .Q(
        current_value[10]) );
  DFFSR \value_reg[9]  ( .D(n42), .CLK(clk), .R(n4), .S(1'b1), .Q(
        current_value[9]) );
  DFFSR \value_reg[8]  ( .D(n44), .CLK(clk), .R(n4), .S(1'b1), .Q(
        current_value[8]) );
  DFFSR \value_reg[7]  ( .D(n46), .CLK(clk), .R(n4), .S(1'b1), .Q(
        current_value[7]) );
  DFFSR \value_reg[6]  ( .D(n48), .CLK(clk), .R(n4), .S(1'b1), .Q(
        current_value[6]) );
  DFFSR \value_reg[5]  ( .D(n50), .CLK(clk), .R(n4), .S(1'b1), .Q(
        current_value[5]) );
  DFFSR \value_reg[4]  ( .D(n52), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[4]) );
  DFFSR \value_reg[3]  ( .D(n53), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[3]) );
  DFFSR \value_reg[2]  ( .D(n54), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[2]) );
  DFFSR \value_reg[1]  ( .D(n55), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[1]) );
  DFFSR \value_reg[0]  ( .D(n56), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[0]) );
  INVX1 U2 ( .A(n12), .Y(n48) );
  INVX1 U3 ( .A(n17), .Y(n38) );
  INVX1 U4 ( .A(n24), .Y(n30) );
  INVX1 U5 ( .A(n15), .Y(n42) );
  INVX1 U6 ( .A(n18), .Y(n36) );
  INVX1 U7 ( .A(n16), .Y(n40) );
  INVX1 U8 ( .A(n22), .Y(n32) );
  INVX2 U9 ( .A(n1), .Y(n2) );
  INVX2 U10 ( .A(n1), .Y(n3) );
  INVX2 U11 ( .A(write_enable), .Y(n1) );
  INVX2 U12 ( .A(n5), .Y(n4) );
  INVX2 U13 ( .A(n_reset), .Y(n5) );
  INVX1 U14 ( .A(n14), .Y(n44) );
  INVX1 U15 ( .A(n13), .Y(n46) );
  INVX1 U16 ( .A(n20), .Y(n34) );
  MUX2X1 U17 ( .B(current_value[0]), .A(new_value[0]), .S(n2), .Y(n6) );
  INVX2 U18 ( .A(n6), .Y(n56) );
  MUX2X1 U19 ( .B(current_value[1]), .A(new_value[1]), .S(n3), .Y(n7) );
  INVX2 U20 ( .A(n7), .Y(n55) );
  MUX2X1 U21 ( .B(current_value[2]), .A(new_value[2]), .S(n2), .Y(n8) );
  INVX2 U22 ( .A(n8), .Y(n54) );
  MUX2X1 U23 ( .B(current_value[3]), .A(new_value[3]), .S(n3), .Y(n9) );
  INVX2 U24 ( .A(n9), .Y(n53) );
  MUX2X1 U25 ( .B(current_value[4]), .A(new_value[4]), .S(n2), .Y(n10) );
  INVX2 U26 ( .A(n10), .Y(n52) );
  MUX2X1 U27 ( .B(current_value[5]), .A(new_value[5]), .S(n3), .Y(n11) );
  INVX2 U28 ( .A(n11), .Y(n50) );
  MUX2X1 U29 ( .B(current_value[6]), .A(new_value[6]), .S(n2), .Y(n12) );
  MUX2X1 U30 ( .B(current_value[7]), .A(new_value[7]), .S(n3), .Y(n13) );
  MUX2X1 U31 ( .B(current_value[8]), .A(new_value[8]), .S(n2), .Y(n14) );
  MUX2X1 U32 ( .B(current_value[9]), .A(new_value[9]), .S(n3), .Y(n15) );
  MUX2X1 U33 ( .B(current_value[10]), .A(new_value[10]), .S(n2), .Y(n16) );
  MUX2X1 U34 ( .B(current_value[11]), .A(new_value[11]), .S(n3), .Y(n17) );
  MUX2X1 U35 ( .B(current_value[12]), .A(new_value[12]), .S(n2), .Y(n18) );
  MUX2X1 U36 ( .B(current_value[13]), .A(new_value[13]), .S(n3), .Y(n20) );
  MUX2X1 U54 ( .B(current_value[14]), .A(new_value[14]), .S(n2), .Y(n22) );
  MUX2X1 U55 ( .B(current_value[15]), .A(new_value[15]), .S(n3), .Y(n24) );
  MUX2X1 U56 ( .B(current_value[16]), .A(new_value[16]), .S(n2), .Y(n26) );
  INVX2 U57 ( .A(n26), .Y(n28) );
endmodule


module flex_sreg_NUM_BITS17_2 ( clk, n_reset, write_enable, new_value, 
        current_value );
  input [16:0] new_value;
  output [16:0] current_value;
  input clk, n_reset, write_enable;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n20, n22, n24, n26, n28, n30, n32, n34, n36, n38, n40, n42,
         n44, n46, n48, n50, n52, n53, n54, n55;

  DFFSR \value_reg[16]  ( .D(n26), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[16]) );
  DFFSR \value_reg[15]  ( .D(n28), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[15]) );
  DFFSR \value_reg[14]  ( .D(n30), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[14]) );
  DFFSR \value_reg[13]  ( .D(n32), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[13]) );
  DFFSR \value_reg[12]  ( .D(n34), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[12]) );
  DFFSR \value_reg[11]  ( .D(n36), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[11]) );
  DFFSR \value_reg[10]  ( .D(n38), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[10]) );
  DFFSR \value_reg[9]  ( .D(n40), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[9]) );
  DFFSR \value_reg[8]  ( .D(n42), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[8]) );
  DFFSR \value_reg[7]  ( .D(n44), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[7]) );
  DFFSR \value_reg[6]  ( .D(n46), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[6]) );
  DFFSR \value_reg[5]  ( .D(n48), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[5]) );
  DFFSR \value_reg[4]  ( .D(n50), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[4]) );
  DFFSR \value_reg[3]  ( .D(n52), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[3]) );
  DFFSR \value_reg[2]  ( .D(n53), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[2]) );
  DFFSR \value_reg[1]  ( .D(n54), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[1]) );
  DFFSR \value_reg[0]  ( .D(n55), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[0]) );
  INVX4 U2 ( .A(n1), .Y(n2) );
  INVX1 U3 ( .A(n11), .Y(n46) );
  INVX1 U4 ( .A(n16), .Y(n36) );
  INVX1 U5 ( .A(n22), .Y(n28) );
  INVX1 U6 ( .A(n14), .Y(n40) );
  INVX1 U7 ( .A(n17), .Y(n34) );
  INVX1 U8 ( .A(n15), .Y(n38) );
  INVX1 U9 ( .A(n20), .Y(n30) );
  INVX2 U10 ( .A(write_enable), .Y(n1) );
  INVX2 U11 ( .A(n4), .Y(n3) );
  INVX2 U12 ( .A(n_reset), .Y(n4) );
  INVX1 U13 ( .A(n13), .Y(n42) );
  INVX1 U14 ( .A(n12), .Y(n44) );
  INVX1 U15 ( .A(n18), .Y(n32) );
  MUX2X1 U16 ( .B(current_value[0]), .A(new_value[0]), .S(n2), .Y(n5) );
  INVX2 U17 ( .A(n5), .Y(n55) );
  MUX2X1 U18 ( .B(current_value[1]), .A(new_value[1]), .S(n2), .Y(n6) );
  INVX2 U19 ( .A(n6), .Y(n54) );
  MUX2X1 U20 ( .B(current_value[2]), .A(new_value[2]), .S(n2), .Y(n7) );
  INVX2 U21 ( .A(n7), .Y(n53) );
  MUX2X1 U22 ( .B(current_value[3]), .A(new_value[3]), .S(n2), .Y(n8) );
  INVX2 U23 ( .A(n8), .Y(n52) );
  MUX2X1 U24 ( .B(current_value[4]), .A(new_value[4]), .S(n2), .Y(n9) );
  INVX2 U25 ( .A(n9), .Y(n50) );
  MUX2X1 U26 ( .B(current_value[5]), .A(new_value[5]), .S(write_enable), .Y(
        n10) );
  INVX2 U27 ( .A(n10), .Y(n48) );
  MUX2X1 U28 ( .B(current_value[6]), .A(new_value[6]), .S(n2), .Y(n11) );
  MUX2X1 U29 ( .B(current_value[7]), .A(new_value[7]), .S(write_enable), .Y(
        n12) );
  MUX2X1 U30 ( .B(current_value[8]), .A(new_value[8]), .S(n2), .Y(n13) );
  MUX2X1 U31 ( .B(current_value[9]), .A(new_value[9]), .S(write_enable), .Y(
        n14) );
  MUX2X1 U32 ( .B(current_value[10]), .A(new_value[10]), .S(n2), .Y(n15) );
  MUX2X1 U33 ( .B(current_value[11]), .A(new_value[11]), .S(write_enable), .Y(
        n16) );
  MUX2X1 U34 ( .B(current_value[12]), .A(new_value[12]), .S(n2), .Y(n17) );
  MUX2X1 U35 ( .B(current_value[13]), .A(new_value[13]), .S(write_enable), .Y(
        n18) );
  MUX2X1 U36 ( .B(current_value[14]), .A(new_value[14]), .S(n2), .Y(n20) );
  MUX2X1 U54 ( .B(current_value[15]), .A(new_value[15]), .S(write_enable), .Y(
        n22) );
  MUX2X1 U55 ( .B(current_value[16]), .A(new_value[16]), .S(n2), .Y(n24) );
  INVX2 U56 ( .A(n24), .Y(n26) );
endmodule


module flex_sreg_NUM_BITS17_1 ( clk, n_reset, write_enable, new_value, 
        current_value );
  input [16:0] new_value;
  output [16:0] current_value;
  input clk, n_reset, write_enable;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n20, n22, n24, n26, n28, n30, n32, n34, n36, n38, n40, n42,
         n44, n46, n48, n50, n52, n53, n54, n55, n56;

  DFFSR \value_reg[16]  ( .D(n28), .CLK(clk), .R(n4), .S(1'b1), .Q(
        current_value[16]) );
  DFFSR \value_reg[15]  ( .D(n30), .CLK(clk), .R(n4), .S(1'b1), .Q(
        current_value[15]) );
  DFFSR \value_reg[14]  ( .D(n32), .CLK(clk), .R(n4), .S(1'b1), .Q(
        current_value[14]) );
  DFFSR \value_reg[13]  ( .D(n34), .CLK(clk), .R(n4), .S(1'b1), .Q(
        current_value[13]) );
  DFFSR \value_reg[12]  ( .D(n36), .CLK(clk), .R(n4), .S(1'b1), .Q(
        current_value[12]) );
  DFFSR \value_reg[11]  ( .D(n38), .CLK(clk), .R(n4), .S(1'b1), .Q(
        current_value[11]) );
  DFFSR \value_reg[10]  ( .D(n40), .CLK(clk), .R(n4), .S(1'b1), .Q(
        current_value[10]) );
  DFFSR \value_reg[9]  ( .D(n42), .CLK(clk), .R(n4), .S(1'b1), .Q(
        current_value[9]) );
  DFFSR \value_reg[8]  ( .D(n44), .CLK(clk), .R(n4), .S(1'b1), .Q(
        current_value[8]) );
  DFFSR \value_reg[7]  ( .D(n46), .CLK(clk), .R(n4), .S(1'b1), .Q(
        current_value[7]) );
  DFFSR \value_reg[6]  ( .D(n48), .CLK(clk), .R(n4), .S(1'b1), .Q(
        current_value[6]) );
  DFFSR \value_reg[5]  ( .D(n50), .CLK(clk), .R(n4), .S(1'b1), .Q(
        current_value[5]) );
  DFFSR \value_reg[4]  ( .D(n52), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[4]) );
  DFFSR \value_reg[3]  ( .D(n53), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[3]) );
  DFFSR \value_reg[2]  ( .D(n54), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[2]) );
  DFFSR \value_reg[1]  ( .D(n55), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[1]) );
  DFFSR \value_reg[0]  ( .D(n56), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[0]) );
  INVX1 U2 ( .A(n12), .Y(n48) );
  INVX1 U3 ( .A(n17), .Y(n38) );
  INVX1 U4 ( .A(n24), .Y(n30) );
  INVX1 U5 ( .A(n15), .Y(n42) );
  INVX1 U6 ( .A(n18), .Y(n36) );
  INVX1 U7 ( .A(n16), .Y(n40) );
  INVX1 U8 ( .A(n22), .Y(n32) );
  INVX2 U9 ( .A(n1), .Y(n2) );
  INVX2 U10 ( .A(n1), .Y(n3) );
  INVX2 U11 ( .A(write_enable), .Y(n1) );
  INVX2 U12 ( .A(n5), .Y(n4) );
  INVX2 U13 ( .A(n_reset), .Y(n5) );
  INVX1 U14 ( .A(n14), .Y(n44) );
  INVX1 U15 ( .A(n13), .Y(n46) );
  INVX1 U16 ( .A(n20), .Y(n34) );
  MUX2X1 U17 ( .B(current_value[0]), .A(new_value[0]), .S(n2), .Y(n6) );
  INVX2 U18 ( .A(n6), .Y(n56) );
  MUX2X1 U19 ( .B(current_value[1]), .A(new_value[1]), .S(n3), .Y(n7) );
  INVX2 U20 ( .A(n7), .Y(n55) );
  MUX2X1 U21 ( .B(current_value[2]), .A(new_value[2]), .S(n2), .Y(n8) );
  INVX2 U22 ( .A(n8), .Y(n54) );
  MUX2X1 U23 ( .B(current_value[3]), .A(new_value[3]), .S(n3), .Y(n9) );
  INVX2 U24 ( .A(n9), .Y(n53) );
  MUX2X1 U25 ( .B(current_value[4]), .A(new_value[4]), .S(n2), .Y(n10) );
  INVX2 U26 ( .A(n10), .Y(n52) );
  MUX2X1 U27 ( .B(current_value[5]), .A(new_value[5]), .S(n3), .Y(n11) );
  INVX2 U28 ( .A(n11), .Y(n50) );
  MUX2X1 U29 ( .B(current_value[6]), .A(new_value[6]), .S(n2), .Y(n12) );
  MUX2X1 U30 ( .B(current_value[7]), .A(new_value[7]), .S(n3), .Y(n13) );
  MUX2X1 U31 ( .B(current_value[8]), .A(new_value[8]), .S(n2), .Y(n14) );
  MUX2X1 U32 ( .B(current_value[9]), .A(new_value[9]), .S(n3), .Y(n15) );
  MUX2X1 U33 ( .B(current_value[10]), .A(new_value[10]), .S(n2), .Y(n16) );
  MUX2X1 U34 ( .B(current_value[11]), .A(new_value[11]), .S(n3), .Y(n17) );
  MUX2X1 U35 ( .B(current_value[12]), .A(new_value[12]), .S(n2), .Y(n18) );
  MUX2X1 U36 ( .B(current_value[13]), .A(new_value[13]), .S(n3), .Y(n20) );
  MUX2X1 U54 ( .B(current_value[14]), .A(new_value[14]), .S(n2), .Y(n22) );
  MUX2X1 U55 ( .B(current_value[15]), .A(new_value[15]), .S(n3), .Y(n24) );
  MUX2X1 U56 ( .B(current_value[16]), .A(new_value[16]), .S(n2), .Y(n26) );
  INVX2 U57 ( .A(n26), .Y(n28) );
endmodule


module flex_sreg_NUM_BITS17_0 ( clk, n_reset, write_enable, new_value, 
        current_value );
  input [16:0] new_value;
  output [16:0] current_value;
  input clk, n_reset, write_enable;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n20, n22, n24, n26, n28, n30, n32, n34, n36, n38, n40, n42,
         n44, n46, n48, n50, n52, n53, n54, n55;

  DFFSR \value_reg[16]  ( .D(n26), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[16]) );
  DFFSR \value_reg[15]  ( .D(n28), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[15]) );
  DFFSR \value_reg[14]  ( .D(n30), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[14]) );
  DFFSR \value_reg[13]  ( .D(n32), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[13]) );
  DFFSR \value_reg[12]  ( .D(n34), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[12]) );
  DFFSR \value_reg[11]  ( .D(n36), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[11]) );
  DFFSR \value_reg[10]  ( .D(n38), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[10]) );
  DFFSR \value_reg[9]  ( .D(n40), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[9]) );
  DFFSR \value_reg[8]  ( .D(n42), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[8]) );
  DFFSR \value_reg[7]  ( .D(n44), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[7]) );
  DFFSR \value_reg[6]  ( .D(n46), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[6]) );
  DFFSR \value_reg[5]  ( .D(n48), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[5]) );
  DFFSR \value_reg[4]  ( .D(n50), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[4]) );
  DFFSR \value_reg[3]  ( .D(n52), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[3]) );
  DFFSR \value_reg[2]  ( .D(n53), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[2]) );
  DFFSR \value_reg[1]  ( .D(n54), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[1]) );
  DFFSR \value_reg[0]  ( .D(n55), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[0]) );
  INVX4 U2 ( .A(n1), .Y(n2) );
  INVX1 U3 ( .A(n11), .Y(n46) );
  INVX1 U4 ( .A(n16), .Y(n36) );
  INVX1 U5 ( .A(n22), .Y(n28) );
  INVX1 U6 ( .A(n14), .Y(n40) );
  INVX1 U7 ( .A(n17), .Y(n34) );
  INVX1 U8 ( .A(n15), .Y(n38) );
  INVX1 U9 ( .A(n20), .Y(n30) );
  INVX2 U10 ( .A(write_enable), .Y(n1) );
  INVX2 U11 ( .A(n4), .Y(n3) );
  INVX2 U12 ( .A(n_reset), .Y(n4) );
  INVX1 U13 ( .A(n13), .Y(n42) );
  INVX1 U14 ( .A(n12), .Y(n44) );
  INVX1 U15 ( .A(n18), .Y(n32) );
  MUX2X1 U16 ( .B(current_value[0]), .A(new_value[0]), .S(n2), .Y(n5) );
  INVX2 U17 ( .A(n5), .Y(n55) );
  MUX2X1 U18 ( .B(current_value[1]), .A(new_value[1]), .S(n2), .Y(n6) );
  INVX2 U19 ( .A(n6), .Y(n54) );
  MUX2X1 U20 ( .B(current_value[2]), .A(new_value[2]), .S(n2), .Y(n7) );
  INVX2 U21 ( .A(n7), .Y(n53) );
  MUX2X1 U22 ( .B(current_value[3]), .A(new_value[3]), .S(n2), .Y(n8) );
  INVX2 U23 ( .A(n8), .Y(n52) );
  MUX2X1 U24 ( .B(current_value[4]), .A(new_value[4]), .S(n2), .Y(n9) );
  INVX2 U25 ( .A(n9), .Y(n50) );
  MUX2X1 U26 ( .B(current_value[5]), .A(new_value[5]), .S(write_enable), .Y(
        n10) );
  INVX2 U27 ( .A(n10), .Y(n48) );
  MUX2X1 U28 ( .B(current_value[6]), .A(new_value[6]), .S(n2), .Y(n11) );
  MUX2X1 U29 ( .B(current_value[7]), .A(new_value[7]), .S(write_enable), .Y(
        n12) );
  MUX2X1 U30 ( .B(current_value[8]), .A(new_value[8]), .S(n2), .Y(n13) );
  MUX2X1 U31 ( .B(current_value[9]), .A(new_value[9]), .S(write_enable), .Y(
        n14) );
  MUX2X1 U32 ( .B(current_value[10]), .A(new_value[10]), .S(n2), .Y(n15) );
  MUX2X1 U33 ( .B(current_value[11]), .A(new_value[11]), .S(write_enable), .Y(
        n16) );
  MUX2X1 U34 ( .B(current_value[12]), .A(new_value[12]), .S(n2), .Y(n17) );
  MUX2X1 U35 ( .B(current_value[13]), .A(new_value[13]), .S(write_enable), .Y(
        n18) );
  MUX2X1 U36 ( .B(current_value[14]), .A(new_value[14]), .S(n2), .Y(n20) );
  MUX2X1 U54 ( .B(current_value[15]), .A(new_value[15]), .S(write_enable), .Y(
        n22) );
  MUX2X1 U55 ( .B(current_value[16]), .A(new_value[16]), .S(n2), .Y(n24) );
  INVX2 U56 ( .A(n24), .Y(n26) );
endmodule


module register_file ( clk, n_reset, w_en, r1_sel, r2_sel, w_sel, w_data, 
        r1_data, r2_data, outreg_data );
  input [3:0] r1_sel;
  input [3:0] r2_sel;
  input [3:0] w_sel;
  input [16:0] w_data;
  output [16:0] r1_data;
  output [16:0] r2_data;
  output [16:0] outreg_data;
  input clk, n_reset, w_en;
  wire   N10, N11, N12, N13, N14, N15, N16, N17, \regs_matrix[15][16] ,
         \regs_matrix[15][15] , \regs_matrix[15][14] , \regs_matrix[15][13] ,
         \regs_matrix[15][12] , \regs_matrix[15][11] , \regs_matrix[15][10] ,
         \regs_matrix[15][9] , \regs_matrix[15][8] , \regs_matrix[15][7] ,
         \regs_matrix[15][6] , \regs_matrix[15][5] , \regs_matrix[15][4] ,
         \regs_matrix[15][3] , \regs_matrix[15][2] , \regs_matrix[15][1] ,
         \regs_matrix[15][0] , \regs_matrix[14][16] , \regs_matrix[14][15] ,
         \regs_matrix[14][14] , \regs_matrix[14][13] , \regs_matrix[14][12] ,
         \regs_matrix[14][11] , \regs_matrix[14][10] , \regs_matrix[14][9] ,
         \regs_matrix[14][8] , \regs_matrix[14][7] , \regs_matrix[14][6] ,
         \regs_matrix[14][5] , \regs_matrix[14][4] , \regs_matrix[14][3] ,
         \regs_matrix[14][2] , \regs_matrix[14][1] , \regs_matrix[14][0] ,
         \regs_matrix[13][16] , \regs_matrix[13][15] , \regs_matrix[13][14] ,
         \regs_matrix[13][13] , \regs_matrix[13][12] , \regs_matrix[13][11] ,
         \regs_matrix[13][10] , \regs_matrix[13][9] , \regs_matrix[13][8] ,
         \regs_matrix[13][7] , \regs_matrix[13][6] , \regs_matrix[13][5] ,
         \regs_matrix[13][4] , \regs_matrix[13][3] , \regs_matrix[13][2] ,
         \regs_matrix[13][1] , \regs_matrix[13][0] , \regs_matrix[12][16] ,
         \regs_matrix[12][15] , \regs_matrix[12][14] , \regs_matrix[12][13] ,
         \regs_matrix[12][12] , \regs_matrix[12][11] , \regs_matrix[12][10] ,
         \regs_matrix[12][9] , \regs_matrix[12][8] , \regs_matrix[12][7] ,
         \regs_matrix[12][6] , \regs_matrix[12][5] , \regs_matrix[12][4] ,
         \regs_matrix[12][3] , \regs_matrix[12][2] , \regs_matrix[12][1] ,
         \regs_matrix[12][0] , \regs_matrix[11][16] , \regs_matrix[11][15] ,
         \regs_matrix[11][14] , \regs_matrix[11][13] , \regs_matrix[11][12] ,
         \regs_matrix[11][11] , \regs_matrix[11][10] , \regs_matrix[11][9] ,
         \regs_matrix[11][8] , \regs_matrix[11][7] , \regs_matrix[11][6] ,
         \regs_matrix[11][5] , \regs_matrix[11][4] , \regs_matrix[11][3] ,
         \regs_matrix[11][2] , \regs_matrix[11][1] , \regs_matrix[11][0] ,
         \regs_matrix[10][16] , \regs_matrix[10][15] , \regs_matrix[10][14] ,
         \regs_matrix[10][13] , \regs_matrix[10][12] , \regs_matrix[10][11] ,
         \regs_matrix[10][10] , \regs_matrix[10][9] , \regs_matrix[10][8] ,
         \regs_matrix[10][7] , \regs_matrix[10][6] , \regs_matrix[10][5] ,
         \regs_matrix[10][4] , \regs_matrix[10][3] , \regs_matrix[10][2] ,
         \regs_matrix[10][1] , \regs_matrix[10][0] , \regs_matrix[9][16] ,
         \regs_matrix[9][15] , \regs_matrix[9][14] , \regs_matrix[9][13] ,
         \regs_matrix[9][12] , \regs_matrix[9][11] , \regs_matrix[9][10] ,
         \regs_matrix[9][9] , \regs_matrix[9][8] , \regs_matrix[9][7] ,
         \regs_matrix[9][6] , \regs_matrix[9][5] , \regs_matrix[9][4] ,
         \regs_matrix[9][3] , \regs_matrix[9][2] , \regs_matrix[9][1] ,
         \regs_matrix[9][0] , \regs_matrix[8][16] , \regs_matrix[8][15] ,
         \regs_matrix[8][14] , \regs_matrix[8][13] , \regs_matrix[8][12] ,
         \regs_matrix[8][11] , \regs_matrix[8][10] , \regs_matrix[8][9] ,
         \regs_matrix[8][8] , \regs_matrix[8][7] , \regs_matrix[8][6] ,
         \regs_matrix[8][5] , \regs_matrix[8][4] , \regs_matrix[8][3] ,
         \regs_matrix[8][2] , \regs_matrix[8][1] , \regs_matrix[8][0] ,
         \regs_matrix[7][16] , \regs_matrix[7][15] , \regs_matrix[7][14] ,
         \regs_matrix[7][13] , \regs_matrix[7][12] , \regs_matrix[7][11] ,
         \regs_matrix[7][10] , \regs_matrix[7][9] , \regs_matrix[7][8] ,
         \regs_matrix[7][7] , \regs_matrix[7][6] , \regs_matrix[7][5] ,
         \regs_matrix[7][4] , \regs_matrix[7][3] , \regs_matrix[7][2] ,
         \regs_matrix[7][1] , \regs_matrix[7][0] , \regs_matrix[6][16] ,
         \regs_matrix[6][15] , \regs_matrix[6][14] , \regs_matrix[6][13] ,
         \regs_matrix[6][12] , \regs_matrix[6][11] , \regs_matrix[6][10] ,
         \regs_matrix[6][9] , \regs_matrix[6][8] , \regs_matrix[6][7] ,
         \regs_matrix[6][6] , \regs_matrix[6][5] , \regs_matrix[6][4] ,
         \regs_matrix[6][3] , \regs_matrix[6][2] , \regs_matrix[6][1] ,
         \regs_matrix[6][0] , \regs_matrix[5][16] , \regs_matrix[5][15] ,
         \regs_matrix[5][14] , \regs_matrix[5][13] , \regs_matrix[5][12] ,
         \regs_matrix[5][11] , \regs_matrix[5][10] , \regs_matrix[5][9] ,
         \regs_matrix[5][8] , \regs_matrix[5][7] , \regs_matrix[5][6] ,
         \regs_matrix[5][5] , \regs_matrix[5][4] , \regs_matrix[5][3] ,
         \regs_matrix[5][2] , \regs_matrix[5][1] , \regs_matrix[5][0] ,
         \regs_matrix[4][16] , \regs_matrix[4][15] , \regs_matrix[4][14] ,
         \regs_matrix[4][13] , \regs_matrix[4][12] , \regs_matrix[4][11] ,
         \regs_matrix[4][10] , \regs_matrix[4][9] , \regs_matrix[4][8] ,
         \regs_matrix[4][7] , \regs_matrix[4][6] , \regs_matrix[4][5] ,
         \regs_matrix[4][4] , \regs_matrix[4][3] , \regs_matrix[4][2] ,
         \regs_matrix[4][1] , \regs_matrix[4][0] , \regs_matrix[3][16] ,
         \regs_matrix[3][15] , \regs_matrix[3][14] , \regs_matrix[3][13] ,
         \regs_matrix[3][12] , \regs_matrix[3][11] , \regs_matrix[3][10] ,
         \regs_matrix[3][9] , \regs_matrix[3][8] , \regs_matrix[3][7] ,
         \regs_matrix[3][6] , \regs_matrix[3][5] , \regs_matrix[3][4] ,
         \regs_matrix[3][3] , \regs_matrix[3][2] , \regs_matrix[3][1] ,
         \regs_matrix[3][0] , \regs_matrix[2][16] , \regs_matrix[2][15] ,
         \regs_matrix[2][14] , \regs_matrix[2][13] , \regs_matrix[2][12] ,
         \regs_matrix[2][11] , \regs_matrix[2][10] , \regs_matrix[2][9] ,
         \regs_matrix[2][8] , \regs_matrix[2][7] , \regs_matrix[2][6] ,
         \regs_matrix[2][5] , \regs_matrix[2][4] , \regs_matrix[2][3] ,
         \regs_matrix[2][2] , \regs_matrix[2][1] , \regs_matrix[2][0] ,
         \regs_matrix[1][16] , \regs_matrix[1][15] , \regs_matrix[1][14] ,
         \regs_matrix[1][13] , \regs_matrix[1][12] , \regs_matrix[1][11] ,
         \regs_matrix[1][10] , \regs_matrix[1][9] , \regs_matrix[1][8] ,
         \regs_matrix[1][7] , \regs_matrix[1][6] , \regs_matrix[1][5] ,
         \regs_matrix[1][4] , \regs_matrix[1][3] , \regs_matrix[1][2] ,
         \regs_matrix[1][1] , \regs_matrix[1][0] , n1, n2, n3, n4, n5, n6, n7,
         n8, n9, n10, n11, n12, n13, n14, n15, n16, n17, n18, n19, n20, n21,
         n22, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32, n33, n34, n35,
         n36, n37, n38, n39, n40, n41, n42, n43, n44, n45, n46, n47, n48, n49,
         n50, n51, n52, n53, n54, n55, n56, n57, n58, n59, n60, n61, n62, n63,
         n64, n65, n66, n67, n68, n69, n70, n71, n72, n73, n74, n75, n76, n77,
         n78, n79, n80, n81, n82, n83, n84, n85, n86, n87, n88, n89, n90, n91,
         n92, n93, n94, n95, n96, n97, n98, n99, n100, n101, n102, n103, n104,
         n105, n106, n107, n108, n109, n110, n111, n112, n116, n117, n118,
         n119, n120, n121, n122, n123, n124, n125, n126, n127, n128, n129,
         n130, n131, n132, n133, n134, n135, n136, n137, n138, n139, n140,
         n141, n142, n143, n144, n145, n146, n147, n148, n149, n150, n151,
         n152, n153, n154, n155, n156, n157, n158, n159, n160, n161, n162,
         n163, n164, n165, n166, n167, n168, n169, n170, n171, n172, n173,
         n174, n175, n176, n177, n178, n179, n180, n181, n182, n183, n184,
         n185, n186, n187, n188, n189, n190, n191, n192, n193, n194, n195,
         n196, n197, n198, n199, n200, n201, n202, n203, n204, n205, n206,
         n207, n208, n209, n210, n211, n212, n213, n214, n215, n216, n217,
         n218, n219, n220, n221, n222, n223, n224, n225, n226, n227, n228,
         n229, n230, n231, n232, n233, n234, n235, n236, n237, n238, n239,
         n240, n241, n242, n243, n244, n245, n246, n247, n248, n249, n250,
         n251, n252, n253, n254, n255, n256, n257, n258, n259, n260, n261,
         n262, n263, n264, n265, n266, n267, n268, n269, n270, n271, n272,
         n273, n274, n275, n276, n277, n278, n279, n280, n281, n282, n283,
         n284, n285, n286, n287, n288, n289, n290, n291, n292, n293, n294,
         n295, n296, n297, n298, n299, n300, n301, n302, n303, n304, n305,
         n306, n307, n308, n309, n310, n311, n312, n313, n314, n315, n316,
         n317, n318, n319, n320, n321, n322, n323, n324, n325, n326, n327,
         n328, n329, n330, n331, n332, n333, n334, n335, n336, n337, n338,
         n339, n340, n341, n342, n343, n344, n345, n346, n347, n348, n349,
         n350, n351, n352, n353, n354, n355, n356, n357, n358, n359, n360,
         n361, n362, n363, n364, n365, n366, n367, n368, n369, n370, n371,
         n372, n373, n374, n375, n376, n377, n378, n379, n380, n381, n382,
         n383, n384, n385, n386, n387, n388, n389, n390, n391, n392, n393,
         n394, n395, n396, n397, n398, n399, n400, n401, n402, n403, n404,
         n405, n406, n407, n408, n409, n410, n411, n412, n413, n414, n415,
         n416, n417, n418, n419, n420, n421, n422, n423, n424, n425, n426,
         n427, n428, n429, n430, n431, n432, n433, n434, n435, n436, n437,
         n438, n439, n440, n441, n442, n443, n444, n445, n446, n447, n448,
         n449, n450, n451, n452, n453, n454, n455, n456, n457, n458, n459,
         n460, n461, n462, n463, n464, n465, n466, n467, n468, n469, n470,
         n471, n472, n473, n474, n475, n476, n477, n478, n479, n480, n481,
         n482, n483, n484, n485, n486, n487, n488, n489, n490, n491, n492,
         n493, n494, n495, n496, n497, n498, n499, n500, n501, n502, n503,
         n504, n505, n506, n507, n508, n509, n510, n511, n512, n513, n514,
         n515, n516, n517, n518, n519, n520, n521, n522, n523, n524, n525,
         n526, n527, n528, n529, n530, n531, n532, n533, n534, n535, n536,
         n537, n538, n539, n540, n541, n542, n543, n544, n545, n546, n547,
         n548, n549, n550, n551, n552, n553, n554, n555, n556, n557, n558,
         n559, n560, n561, n562, n563, n564, n565, n566, n567, n568, n569,
         n570, n571, n572, n573, n574, n575, n576, n577, n578, n579, n580,
         n581, n582, n583, n584, n585, n586, n587, n588, n589, n590, n591,
         n592, n593, n594, n595, n596, n597, n598, n599, n600, n601, n602,
         n603, n604, n605, n606, n607, n608, n609, n610, n611, n612, n613,
         n614, n615, n616, n617, n618, n619, n620, n621, n622, n623, n624,
         n625, n626, n627, n628, n629, n630, n631, n632, n633, n634, n635,
         n636, n637, n638, n639, n640, n641, n642, n643, n644, n645, n646,
         n647, n648, n649, n650, n651, n652, n653, n654, n655, n656, n657,
         n658, n659, n660, n661, n662, n663, n664, n665, n666, n667, n668,
         n669, n670, n671, n672, n673, n674, n675, n676, n677, n678, n679,
         n680, n681, n682, n683, n684, n685, n686, n687, n688, n689, n690,
         n691, n692, n693, n694, n695, n696, n697, n698, n699, n700, n701,
         n702, n703, n704, n705, n706, n707, n708, n709, n710, n711, n712,
         n713, n714, n715, n716, n717, n718, n719, n720, n721, n722, n723,
         n724, n725, n726, n727, n728, n729, n730, n731, n732, n733, n734,
         n735, n736, n737, n738, n739, n740, n741, n742, n743, n744, n745,
         n746, n747, n748, n749, n750, n751, n752, n753, n754, n755, n756,
         n757, n758, n759, n760, n761, n762, n763, n764, n765, n766, n767,
         n768, n769, n770, n771, n772, n773, n774, n775, n776, n777, n778,
         n779, n780, n781, n782, n783, n784, n785, n786, n787, n788, n789,
         n790, n791, n792, n793, n794, n795, n796, n797, n798, n799, n800,
         n801, n802, n803, n804, n805, n806, n807, n808, n809, n810, n811,
         n812, n813, n814, n815, n816, n817, n818, n819, n820, n821, n822,
         n823, n824, n825;
  wire   [15:0] write_enables;
  assign N10 = r1_sel[0];
  assign N11 = r1_sel[1];
  assign N12 = r1_sel[2];
  assign N13 = r1_sel[3];
  assign N14 = r2_sel[0];
  assign N15 = r2_sel[1];
  assign N16 = r2_sel[2];
  assign N17 = r2_sel[3];

  flex_sreg_NUM_BITS17_15 \genblk1[0].REGX  ( .clk(clk), .n_reset(n813), 
        .write_enable(write_enables[0]), .new_value({n805, w_data[15:6], n5, 
        n802, n6, n800, n798, n796}), .current_value(outreg_data) );
  flex_sreg_NUM_BITS17_14 \genblk1[1].REGX  ( .clk(clk), .n_reset(n806), 
        .write_enable(write_enables[1]), .new_value({n804, w_data[15:6], n14, 
        n802, n13, n800, n798, n796}), .current_value({\regs_matrix[1][16] , 
        \regs_matrix[1][15] , \regs_matrix[1][14] , \regs_matrix[1][13] , 
        \regs_matrix[1][12] , \regs_matrix[1][11] , \regs_matrix[1][10] , 
        \regs_matrix[1][9] , \regs_matrix[1][8] , \regs_matrix[1][7] , 
        \regs_matrix[1][6] , \regs_matrix[1][5] , \regs_matrix[1][4] , 
        \regs_matrix[1][3] , \regs_matrix[1][2] , \regs_matrix[1][1] , 
        \regs_matrix[1][0] }) );
  flex_sreg_NUM_BITS17_13 \genblk1[2].REGX  ( .clk(clk), .n_reset(n806), 
        .write_enable(write_enables[2]), .new_value({n805, w_data[15:6], n5, 
        n802, n6, n800, n798, n796}), .current_value({\regs_matrix[2][16] , 
        \regs_matrix[2][15] , \regs_matrix[2][14] , \regs_matrix[2][13] , 
        \regs_matrix[2][12] , \regs_matrix[2][11] , \regs_matrix[2][10] , 
        \regs_matrix[2][9] , \regs_matrix[2][8] , \regs_matrix[2][7] , 
        \regs_matrix[2][6] , \regs_matrix[2][5] , \regs_matrix[2][4] , 
        \regs_matrix[2][3] , \regs_matrix[2][2] , \regs_matrix[2][1] , 
        \regs_matrix[2][0] }) );
  flex_sreg_NUM_BITS17_12 \genblk1[3].REGX  ( .clk(clk), .n_reset(n807), 
        .write_enable(write_enables[3]), .new_value({n804, w_data[15:6], n14, 
        n802, n13, n800, n798, n796}), .current_value({\regs_matrix[3][16] , 
        \regs_matrix[3][15] , \regs_matrix[3][14] , \regs_matrix[3][13] , 
        \regs_matrix[3][12] , \regs_matrix[3][11] , \regs_matrix[3][10] , 
        \regs_matrix[3][9] , \regs_matrix[3][8] , \regs_matrix[3][7] , 
        \regs_matrix[3][6] , \regs_matrix[3][5] , \regs_matrix[3][4] , 
        \regs_matrix[3][3] , \regs_matrix[3][2] , \regs_matrix[3][1] , 
        \regs_matrix[3][0] }) );
  flex_sreg_NUM_BITS17_11 \genblk1[4].REGX  ( .clk(clk), .n_reset(n807), 
        .write_enable(write_enables[4]), .new_value({n805, w_data[15:6], n5, 
        n802, n6, n800, n798, n796}), .current_value({\regs_matrix[4][16] , 
        \regs_matrix[4][15] , \regs_matrix[4][14] , \regs_matrix[4][13] , 
        \regs_matrix[4][12] , \regs_matrix[4][11] , \regs_matrix[4][10] , 
        \regs_matrix[4][9] , \regs_matrix[4][8] , \regs_matrix[4][7] , 
        \regs_matrix[4][6] , \regs_matrix[4][5] , \regs_matrix[4][4] , 
        \regs_matrix[4][3] , \regs_matrix[4][2] , \regs_matrix[4][1] , 
        \regs_matrix[4][0] }) );
  flex_sreg_NUM_BITS17_10 \genblk1[5].REGX  ( .clk(clk), .n_reset(n808), 
        .write_enable(write_enables[5]), .new_value({n804, w_data[15:6], n14, 
        n802, n13, n800, n798, n796}), .current_value({\regs_matrix[5][16] , 
        \regs_matrix[5][15] , \regs_matrix[5][14] , \regs_matrix[5][13] , 
        \regs_matrix[5][12] , \regs_matrix[5][11] , \regs_matrix[5][10] , 
        \regs_matrix[5][9] , \regs_matrix[5][8] , \regs_matrix[5][7] , 
        \regs_matrix[5][6] , \regs_matrix[5][5] , \regs_matrix[5][4] , 
        \regs_matrix[5][3] , \regs_matrix[5][2] , \regs_matrix[5][1] , 
        \regs_matrix[5][0] }) );
  flex_sreg_NUM_BITS17_9 \genblk1[6].REGX  ( .clk(clk), .n_reset(n808), 
        .write_enable(write_enables[6]), .new_value({n805, w_data[15:6], n5, 
        n802, n6, n800, n798, n796}), .current_value({\regs_matrix[6][16] , 
        \regs_matrix[6][15] , \regs_matrix[6][14] , \regs_matrix[6][13] , 
        \regs_matrix[6][12] , \regs_matrix[6][11] , \regs_matrix[6][10] , 
        \regs_matrix[6][9] , \regs_matrix[6][8] , \regs_matrix[6][7] , 
        \regs_matrix[6][6] , \regs_matrix[6][5] , \regs_matrix[6][4] , 
        \regs_matrix[6][3] , \regs_matrix[6][2] , \regs_matrix[6][1] , 
        \regs_matrix[6][0] }) );
  flex_sreg_NUM_BITS17_8 \genblk1[7].REGX  ( .clk(clk), .n_reset(n809), 
        .write_enable(write_enables[7]), .new_value({n804, w_data[15:6], n14, 
        n802, n13, n800, n798, n796}), .current_value({\regs_matrix[7][16] , 
        \regs_matrix[7][15] , \regs_matrix[7][14] , \regs_matrix[7][13] , 
        \regs_matrix[7][12] , \regs_matrix[7][11] , \regs_matrix[7][10] , 
        \regs_matrix[7][9] , \regs_matrix[7][8] , \regs_matrix[7][7] , 
        \regs_matrix[7][6] , \regs_matrix[7][5] , \regs_matrix[7][4] , 
        \regs_matrix[7][3] , \regs_matrix[7][2] , \regs_matrix[7][1] , 
        \regs_matrix[7][0] }) );
  flex_sreg_NUM_BITS17_7 \genblk1[8].REGX  ( .clk(clk), .n_reset(n809), 
        .write_enable(write_enables[8]), .new_value({n805, w_data[15:6], n5, 
        n802, n6, n800, n798, n796}), .current_value({\regs_matrix[8][16] , 
        \regs_matrix[8][15] , \regs_matrix[8][14] , \regs_matrix[8][13] , 
        \regs_matrix[8][12] , \regs_matrix[8][11] , \regs_matrix[8][10] , 
        \regs_matrix[8][9] , \regs_matrix[8][8] , \regs_matrix[8][7] , 
        \regs_matrix[8][6] , \regs_matrix[8][5] , \regs_matrix[8][4] , 
        \regs_matrix[8][3] , \regs_matrix[8][2] , \regs_matrix[8][1] , 
        \regs_matrix[8][0] }) );
  flex_sreg_NUM_BITS17_6 \genblk1[9].REGX  ( .clk(clk), .n_reset(n810), 
        .write_enable(write_enables[9]), .new_value({n804, w_data[15:6], n14, 
        n802, n13, n800, n798, n796}), .current_value({\regs_matrix[9][16] , 
        \regs_matrix[9][15] , \regs_matrix[9][14] , \regs_matrix[9][13] , 
        \regs_matrix[9][12] , \regs_matrix[9][11] , \regs_matrix[9][10] , 
        \regs_matrix[9][9] , \regs_matrix[9][8] , \regs_matrix[9][7] , 
        \regs_matrix[9][6] , \regs_matrix[9][5] , \regs_matrix[9][4] , 
        \regs_matrix[9][3] , \regs_matrix[9][2] , \regs_matrix[9][1] , 
        \regs_matrix[9][0] }) );
  flex_sreg_NUM_BITS17_5 \genblk1[10].REGX  ( .clk(clk), .n_reset(n810), 
        .write_enable(write_enables[10]), .new_value({n805, w_data[15:6], n5, 
        n802, n6, n800, n798, n796}), .current_value({\regs_matrix[10][16] , 
        \regs_matrix[10][15] , \regs_matrix[10][14] , \regs_matrix[10][13] , 
        \regs_matrix[10][12] , \regs_matrix[10][11] , \regs_matrix[10][10] , 
        \regs_matrix[10][9] , \regs_matrix[10][8] , \regs_matrix[10][7] , 
        \regs_matrix[10][6] , \regs_matrix[10][5] , \regs_matrix[10][4] , 
        \regs_matrix[10][3] , \regs_matrix[10][2] , \regs_matrix[10][1] , 
        \regs_matrix[10][0] }) );
  flex_sreg_NUM_BITS17_4 \genblk1[11].REGX  ( .clk(clk), .n_reset(n811), 
        .write_enable(write_enables[11]), .new_value({n804, w_data[15:6], n14, 
        n802, n13, n800, n798, n796}), .current_value({\regs_matrix[11][16] , 
        \regs_matrix[11][15] , \regs_matrix[11][14] , \regs_matrix[11][13] , 
        \regs_matrix[11][12] , \regs_matrix[11][11] , \regs_matrix[11][10] , 
        \regs_matrix[11][9] , \regs_matrix[11][8] , \regs_matrix[11][7] , 
        \regs_matrix[11][6] , \regs_matrix[11][5] , \regs_matrix[11][4] , 
        \regs_matrix[11][3] , \regs_matrix[11][2] , \regs_matrix[11][1] , 
        \regs_matrix[11][0] }) );
  flex_sreg_NUM_BITS17_3 \genblk1[12].REGX  ( .clk(clk), .n_reset(n811), 
        .write_enable(write_enables[12]), .new_value({n805, w_data[15:6], n5, 
        n802, n6, n800, n798, n796}), .current_value({\regs_matrix[12][16] , 
        \regs_matrix[12][15] , \regs_matrix[12][14] , \regs_matrix[12][13] , 
        \regs_matrix[12][12] , \regs_matrix[12][11] , \regs_matrix[12][10] , 
        \regs_matrix[12][9] , \regs_matrix[12][8] , \regs_matrix[12][7] , 
        \regs_matrix[12][6] , \regs_matrix[12][5] , \regs_matrix[12][4] , 
        \regs_matrix[12][3] , \regs_matrix[12][2] , \regs_matrix[12][1] , 
        \regs_matrix[12][0] }) );
  flex_sreg_NUM_BITS17_2 \genblk1[13].REGX  ( .clk(clk), .n_reset(n812), 
        .write_enable(write_enables[13]), .new_value({n804, w_data[15:6], n14, 
        n802, n13, n800, n798, n796}), .current_value({\regs_matrix[13][16] , 
        \regs_matrix[13][15] , \regs_matrix[13][14] , \regs_matrix[13][13] , 
        \regs_matrix[13][12] , \regs_matrix[13][11] , \regs_matrix[13][10] , 
        \regs_matrix[13][9] , \regs_matrix[13][8] , \regs_matrix[13][7] , 
        \regs_matrix[13][6] , \regs_matrix[13][5] , \regs_matrix[13][4] , 
        \regs_matrix[13][3] , \regs_matrix[13][2] , \regs_matrix[13][1] , 
        \regs_matrix[13][0] }) );
  flex_sreg_NUM_BITS17_1 \genblk1[14].REGX  ( .clk(clk), .n_reset(n812), 
        .write_enable(write_enables[14]), .new_value({n805, w_data[15:6], n5, 
        n802, n6, n800, n798, n796}), .current_value({\regs_matrix[14][16] , 
        \regs_matrix[14][15] , \regs_matrix[14][14] , \regs_matrix[14][13] , 
        \regs_matrix[14][12] , \regs_matrix[14][11] , \regs_matrix[14][10] , 
        \regs_matrix[14][9] , \regs_matrix[14][8] , \regs_matrix[14][7] , 
        \regs_matrix[14][6] , \regs_matrix[14][5] , \regs_matrix[14][4] , 
        \regs_matrix[14][3] , \regs_matrix[14][2] , \regs_matrix[14][1] , 
        \regs_matrix[14][0] }) );
  flex_sreg_NUM_BITS17_0 \genblk1[15].REGX  ( .clk(clk), .n_reset(n813), 
        .write_enable(write_enables[15]), .new_value({n804, w_data[15:6], n14, 
        n802, n13, n800, n798, n796}), .current_value({\regs_matrix[15][16] , 
        \regs_matrix[15][15] , \regs_matrix[15][14] , \regs_matrix[15][13] , 
        \regs_matrix[15][12] , \regs_matrix[15][11] , \regs_matrix[15][10] , 
        \regs_matrix[15][9] , \regs_matrix[15][8] , \regs_matrix[15][7] , 
        \regs_matrix[15][6] , \regs_matrix[15][5] , \regs_matrix[15][4] , 
        \regs_matrix[15][3] , \regs_matrix[15][2] , \regs_matrix[15][1] , 
        \regs_matrix[15][0] }) );
  BUFX2 U2 ( .A(n182), .Y(n1) );
  INVX1 U3 ( .A(n138), .Y(n512) );
  INVX4 U4 ( .A(n138), .Y(n40) );
  INVX2 U5 ( .A(n794), .Y(n2) );
  INVX2 U6 ( .A(n794), .Y(n772) );
  INVX1 U7 ( .A(n500), .Y(n3) );
  INVX1 U8 ( .A(n3), .Y(n4) );
  INVX8 U9 ( .A(n795), .Y(n796) );
  BUFX4 U10 ( .A(w_data[5]), .Y(n5) );
  INVX8 U11 ( .A(n799), .Y(n800) );
  BUFX4 U12 ( .A(w_data[3]), .Y(n6) );
  INVX4 U13 ( .A(w_data[2]), .Y(n799) );
  INVX1 U14 ( .A(n522), .Y(n7) );
  BUFX4 U15 ( .A(n53), .Y(n88) );
  BUFX4 U16 ( .A(n53), .Y(n89) );
  INVX2 U17 ( .A(n46), .Y(n43) );
  INVX4 U18 ( .A(n108), .Y(n32) );
  BUFX4 U19 ( .A(n499), .Y(n523) );
  INVX2 U20 ( .A(n282), .Y(n130) );
  AND2X2 U21 ( .A(n167), .B(n168), .Y(n166) );
  INVX8 U22 ( .A(n509), .Y(n508) );
  MUX2X1 U23 ( .B(n647), .A(n646), .S(n793), .Y(r2_data[8]) );
  BUFX2 U24 ( .A(n81), .Y(n97) );
  BUFX2 U25 ( .A(n133), .Y(n524) );
  INVX4 U26 ( .A(n224), .Y(r1_data[4]) );
  INVX2 U27 ( .A(n507), .Y(n173) );
  INVX2 U28 ( .A(n538), .Y(n783) );
  INVX1 U29 ( .A(n133), .Y(n497) );
  AND2X2 U30 ( .A(N16), .B(N14), .Y(n8) );
  INVX2 U31 ( .A(n342), .Y(r1_data[9]) );
  INVX1 U32 ( .A(n52), .Y(n31) );
  INVX2 U33 ( .A(n31), .Y(n25) );
  AND2X2 U34 ( .A(n771), .B(N16), .Y(n9) );
  AND2X1 U35 ( .A(n770), .B(N14), .Y(n10) );
  AND2X1 U36 ( .A(n770), .B(n771), .Y(n11) );
  AND2X1 U37 ( .A(N16), .B(n771), .Y(n12) );
  INVX8 U38 ( .A(n797), .Y(n798) );
  INVX4 U39 ( .A(w_data[0]), .Y(n795) );
  INVX4 U40 ( .A(w_data[1]), .Y(n797) );
  BUFX4 U41 ( .A(w_data[3]), .Y(n13) );
  INVX8 U42 ( .A(n801), .Y(n802) );
  BUFX4 U43 ( .A(w_data[5]), .Y(n14) );
  INVX4 U44 ( .A(w_data[4]), .Y(n801) );
  INVX2 U45 ( .A(n214), .Y(n171) );
  MUX2X1 U46 ( .B(n590), .A(n591), .S(n792), .Y(r2_data[4]) );
  AND2X2 U47 ( .A(n513), .B(n46), .Y(n60) );
  INVX4 U48 ( .A(n59), .Y(n91) );
  AND2X2 U49 ( .A(n77), .B(n9), .Y(n15) );
  AND2X2 U50 ( .A(n77), .B(n9), .Y(n16) );
  BUFX2 U51 ( .A(n83), .Y(n102) );
  MUX2X1 U52 ( .B(n633), .A(n632), .S(n793), .Y(r2_data[7]) );
  INVX1 U53 ( .A(n130), .Y(n17) );
  INVX2 U54 ( .A(n17), .Y(n18) );
  INVX1 U55 ( .A(n141), .Y(n19) );
  INVX2 U56 ( .A(n19), .Y(n20) );
  INVX1 U57 ( .A(n36), .Y(n21) );
  INVX2 U58 ( .A(n21), .Y(n22) );
  NOR2X1 U59 ( .A(n35), .B(N12), .Y(n23) );
  INVX2 U60 ( .A(n23), .Y(n182) );
  BUFX4 U61 ( .A(N10), .Y(n35) );
  INVX2 U62 ( .A(N12), .Y(n153) );
  BUFX2 U63 ( .A(n52), .Y(n24) );
  BUFX2 U64 ( .A(n49), .Y(n29) );
  OR2X2 U65 ( .A(n75), .B(n513), .Y(n26) );
  OR2X2 U66 ( .A(n75), .B(n513), .Y(n27) );
  BUFX2 U67 ( .A(n496), .Y(n28) );
  NAND2X1 U68 ( .A(n76), .B(n56), .Y(n30) );
  BUFX4 U69 ( .A(n500), .Y(n46) );
  INVX1 U70 ( .A(n522), .Y(n33) );
  INVX2 U71 ( .A(n26), .Y(n175) );
  MUX2X1 U72 ( .B(n548), .A(n549), .S(n792), .Y(r2_data[1]) );
  INVX2 U73 ( .A(n791), .Y(n45) );
  INVX2 U74 ( .A(n45), .Y(n34) );
  BUFX2 U75 ( .A(n518), .Y(n36) );
  INVX1 U76 ( .A(n182), .Y(n37) );
  AND2X2 U77 ( .A(n54), .B(n74), .Y(n38) );
  INVX4 U78 ( .A(n16), .Y(n39) );
  BUFX2 U79 ( .A(n538), .Y(n86) );
  AND2X2 U80 ( .A(n110), .B(n55), .Y(n41) );
  NAND2X1 U81 ( .A(n109), .B(n56), .Y(n42) );
  INVX4 U82 ( .A(n792), .Y(n44) );
  MUX2X1 U83 ( .B(n619), .A(n618), .S(n44), .Y(r2_data[6]) );
  INVX2 U84 ( .A(n501), .Y(n150) );
  INVX2 U85 ( .A(n501), .Y(n56) );
  OR2X2 U86 ( .A(outreg_data[2]), .B(n1), .Y(n179) );
  INVX2 U87 ( .A(n500), .Y(n47) );
  AND2X2 U88 ( .A(n35), .B(n153), .Y(n48) );
  NAND2X1 U89 ( .A(n10), .B(n2), .Y(n539) );
  INVX2 U90 ( .A(n40), .Y(n511) );
  BUFX4 U91 ( .A(n81), .Y(n95) );
  INVX2 U92 ( .A(N12), .Y(n49) );
  INVX2 U93 ( .A(n382), .Y(r1_data[11]) );
  INVX2 U94 ( .A(n512), .Y(n510) );
  INVX2 U95 ( .A(n775), .Y(n50) );
  BUFX2 U96 ( .A(n533), .Y(n83) );
  NAND2X1 U97 ( .A(n60), .B(n55), .Y(n51) );
  INVX1 U98 ( .A(n508), .Y(n141) );
  INVX4 U99 ( .A(n461), .Y(r1_data[15]) );
  BUFX4 U100 ( .A(N11), .Y(n52) );
  INVX2 U101 ( .A(N11), .Y(n502) );
  INVX2 U102 ( .A(n106), .Y(n499) );
  INVX1 U103 ( .A(n494), .Y(n432) );
  NAND3X1 U104 ( .A(N14), .B(n77), .C(n770), .Y(n53) );
  INVX4 U105 ( .A(n513), .Y(n54) );
  INVX2 U106 ( .A(n163), .Y(r1_data[2]) );
  INVX4 U107 ( .A(n784), .Y(n93) );
  INVX4 U108 ( .A(n501), .Y(n55) );
  AND2X2 U109 ( .A(n109), .B(n24), .Y(n57) );
  INVX8 U110 ( .A(n72), .Y(n776) );
  INVX4 U111 ( .A(N12), .Y(n513) );
  INVX2 U112 ( .A(n81), .Y(n59) );
  INVX4 U113 ( .A(n502), .Y(n501) );
  INVX2 U114 ( .A(n251), .Y(n250) );
  BUFX2 U115 ( .A(n124), .Y(n58) );
  BUFX4 U116 ( .A(n53), .Y(n87) );
  INVX2 U117 ( .A(n775), .Y(n100) );
  INVX2 U118 ( .A(n363), .Y(r1_data[10]) );
  BUFX2 U119 ( .A(n81), .Y(n94) );
  INVX2 U120 ( .A(n775), .Y(n98) );
  BUFX4 U121 ( .A(n81), .Y(n71) );
  BUFX4 U122 ( .A(n81), .Y(n96) );
  BUFX2 U123 ( .A(n41), .Y(n61) );
  INVX1 U124 ( .A(n46), .Y(n62) );
  INVX1 U125 ( .A(n47), .Y(n63) );
  AND2X2 U126 ( .A(n111), .B(n52), .Y(n64) );
  INVX4 U127 ( .A(n64), .Y(n124) );
  INVX4 U128 ( .A(n534), .Y(n72) );
  INVX4 U129 ( .A(n783), .Y(n84) );
  INVX2 U130 ( .A(n777), .Y(n778) );
  INVX4 U131 ( .A(n777), .Y(n779) );
  AND2X2 U132 ( .A(n48), .B(n55), .Y(n65) );
  INVX4 U133 ( .A(n516), .Y(n282) );
  NAND2X1 U134 ( .A(n794), .B(n8), .Y(n541) );
  INVX4 U135 ( .A(n128), .Y(n509) );
  NAND2X1 U136 ( .A(n772), .B(n11), .Y(n533) );
  INVX4 U137 ( .A(N16), .Y(n770) );
  OR2X2 U138 ( .A(\regs_matrix[4][5] ), .B(n52), .Y(n259) );
  NAND2X1 U139 ( .A(n2), .B(n12), .Y(n535) );
  INVX2 U140 ( .A(N14), .Y(n771) );
  INVX1 U141 ( .A(n133), .Y(n522) );
  INVX4 U142 ( .A(n57), .Y(n496) );
  INVX2 U143 ( .A(n83), .Y(n66) );
  INVX2 U144 ( .A(n783), .Y(n85) );
  INVX2 U145 ( .A(n35), .Y(n74) );
  INVX4 U146 ( .A(n66), .Y(n101) );
  BUFX4 U147 ( .A(n82), .Y(n103) );
  INVX4 U148 ( .A(n15), .Y(n67) );
  MUX2X1 U149 ( .B(n744), .A(n745), .S(n34), .Y(r2_data[15]) );
  INVX4 U150 ( .A(N17), .Y(n793) );
  INVX4 U151 ( .A(n793), .Y(n791) );
  BUFX4 U152 ( .A(n83), .Y(n104) );
  INVX8 U153 ( .A(n788), .Y(n790) );
  INVX8 U154 ( .A(n788), .Y(n789) );
  BUFX4 U155 ( .A(n82), .Y(n68) );
  INVX4 U156 ( .A(n777), .Y(n69) );
  BUFX4 U157 ( .A(n533), .Y(n82) );
  INVX8 U158 ( .A(n72), .Y(n70) );
  OR2X2 U159 ( .A(n196), .B(n197), .Y(n73) );
  INVX4 U160 ( .A(n73), .Y(r1_data[3]) );
  MUX2X1 U161 ( .B(n675), .A(n674), .S(n793), .Y(r2_data[10]) );
  INVX4 U162 ( .A(n793), .Y(n792) );
  INVX4 U163 ( .A(n541), .Y(n788) );
  OR2X2 U164 ( .A(n494), .B(n52), .Y(n138) );
  BUFX4 U165 ( .A(N15), .Y(n794) );
  INVX2 U166 ( .A(N10), .Y(n500) );
  AND2X2 U167 ( .A(n35), .B(N12), .Y(n111) );
  NAND2X1 U168 ( .A(n46), .B(n501), .Y(n75) );
  INVX4 U169 ( .A(n15), .Y(n781) );
  INVX4 U170 ( .A(n16), .Y(n782) );
  OR2X2 U171 ( .A(n182), .B(n55), .Y(n214) );
  AND2X2 U172 ( .A(n47), .B(n49), .Y(n76) );
  INVX1 U173 ( .A(n76), .Y(n184) );
  BUFX2 U174 ( .A(N15), .Y(n77) );
  AND2X1 U175 ( .A(n422), .B(n423), .Y(n515) );
  NAND2X1 U176 ( .A(n56), .B(n76), .Y(n78) );
  NAND2X1 U177 ( .A(n150), .B(n76), .Y(n79) );
  AND2X2 U178 ( .A(n4), .B(N12), .Y(n109) );
  NAND2X1 U179 ( .A(n772), .B(n8), .Y(n540) );
  BUFX2 U180 ( .A(n539), .Y(n80) );
  BUFX4 U181 ( .A(n539), .Y(n81) );
  INVX4 U182 ( .A(n777), .Y(n780) );
  INVX2 U183 ( .A(n784), .Y(n90) );
  INVX2 U184 ( .A(n784), .Y(n92) );
  INVX4 U185 ( .A(n80), .Y(n784) );
  INVX2 U186 ( .A(n775), .Y(n99) );
  INVX4 U187 ( .A(n82), .Y(n775) );
  AND2X2 U188 ( .A(n49), .B(n46), .Y(n110) );
  AND2X2 U189 ( .A(n262), .B(n52), .Y(n105) );
  INVX4 U190 ( .A(n105), .Y(n125) );
  AND2X1 U191 ( .A(w_sel[3]), .B(w_en), .Y(n107) );
  OR2X2 U192 ( .A(n156), .B(n157), .Y(n144) );
  INVX2 U193 ( .A(w_data[16]), .Y(n803) );
  AND2X2 U194 ( .A(n109), .B(n55), .Y(n106) );
  AND2X2 U195 ( .A(n109), .B(n25), .Y(n108) );
  INVX2 U196 ( .A(n803), .Y(n805) );
  INVX2 U197 ( .A(n803), .Y(n804) );
  BUFX2 U198 ( .A(n_reset), .Y(n806) );
  BUFX2 U199 ( .A(n_reset), .Y(n807) );
  BUFX2 U200 ( .A(n_reset), .Y(n808) );
  BUFX2 U201 ( .A(n_reset), .Y(n809) );
  BUFX2 U202 ( .A(n_reset), .Y(n810) );
  BUFX2 U203 ( .A(n_reset), .Y(n811) );
  BUFX2 U204 ( .A(n_reset), .Y(n812) );
  BUFX2 U205 ( .A(n_reset), .Y(n813) );
  INVX1 U206 ( .A(n171), .Y(n495) );
  INVX2 U207 ( .A(N13), .Y(n112) );
  AOI22X1 U208 ( .A(n118), .B(n119), .C(n120), .D(n121), .Y(n117) );
  NOR2X1 U209 ( .A(n122), .B(n123), .Y(n121) );
  OAI22X1 U210 ( .A(\regs_matrix[7][0] ), .B(n504), .C(\regs_matrix[2][0] ), 
        .D(n125), .Y(n123) );
  OAI21X1 U211 ( .A(\regs_matrix[6][0] ), .B(n496), .C(n112), .Y(n122) );
  NOR2X1 U212 ( .A(n126), .B(n127), .Y(n120) );
  OAI21X1 U213 ( .A(outreg_data[0]), .B(n508), .C(n129), .Y(n127) );
  AOI22X1 U214 ( .A(n65), .B(n131), .C(n40), .D(n132), .Y(n129) );
  INVX2 U215 ( .A(\regs_matrix[5][0] ), .Y(n132) );
  INVX2 U216 ( .A(\regs_matrix[1][0] ), .Y(n131) );
  OAI22X1 U217 ( .A(\regs_matrix[3][0] ), .B(n524), .C(\regs_matrix[4][0] ), 
        .D(n42), .Y(n126) );
  NOR2X1 U218 ( .A(n134), .B(n135), .Y(n119) );
  OAI22X1 U219 ( .A(\regs_matrix[15][0] ), .B(n505), .C(\regs_matrix[10][0] ), 
        .D(n22), .Y(n135) );
  OAI21X1 U220 ( .A(\regs_matrix[14][0] ), .B(n28), .C(N13), .Y(n134) );
  NOR2X1 U221 ( .A(n136), .B(n137), .Y(n118) );
  OAI21X1 U222 ( .A(\regs_matrix[13][0] ), .B(n510), .C(n139), .Y(n137) );
  AOI22X1 U223 ( .A(n18), .B(n140), .C(n20), .D(n142), .Y(n139) );
  INVX2 U224 ( .A(\regs_matrix[8][0] ), .Y(n142) );
  INVX2 U225 ( .A(\regs_matrix[9][0] ), .Y(n140) );
  OAI22X1 U226 ( .A(\regs_matrix[11][0] ), .B(n521), .C(\regs_matrix[12][0] ), 
        .D(n523), .Y(n136) );
  OAI21X1 U227 ( .A(n143), .B(n144), .C(n145), .Y(r1_data[1]) );
  AOI22X1 U228 ( .A(n146), .B(n147), .C(n148), .D(n149), .Y(n145) );
  NOR2X1 U229 ( .A(N13), .B(n150), .Y(n149) );
  AOI22X1 U230 ( .A(n54), .B(n151), .C(n29), .D(n152), .Y(n148) );
  OAI22X1 U231 ( .A(\regs_matrix[2][1] ), .B(n43), .C(\regs_matrix[3][1] ), 
        .D(n74), .Y(n152) );
  OAI22X1 U232 ( .A(\regs_matrix[6][1] ), .B(n47), .C(\regs_matrix[7][1] ), 
        .D(n74), .Y(n151) );
  NOR2X1 U233 ( .A(N13), .B(n24), .Y(n147) );
  AOI22X1 U234 ( .A(n54), .B(n154), .C(n155), .D(n29), .Y(n146) );
  OAI22X1 U235 ( .A(outreg_data[1]), .B(n62), .C(\regs_matrix[1][1] ), .D(n63), 
        .Y(n155) );
  OAI22X1 U236 ( .A(\regs_matrix[4][1] ), .B(n47), .C(\regs_matrix[5][1] ), 
        .D(n46), .Y(n154) );
  OAI21X1 U237 ( .A(\regs_matrix[13][1] ), .B(n510), .C(n158), .Y(n157) );
  AOI22X1 U238 ( .A(n18), .B(n159), .C(n20), .D(n160), .Y(n158) );
  INVX2 U239 ( .A(\regs_matrix[8][1] ), .Y(n160) );
  INVX2 U240 ( .A(\regs_matrix[9][1] ), .Y(n159) );
  OAI22X1 U241 ( .A(\regs_matrix[11][1] ), .B(n521), .C(\regs_matrix[12][1] ), 
        .D(n523), .Y(n156) );
  OR2X1 U242 ( .A(n161), .B(n162), .Y(n143) );
  OAI22X1 U243 ( .A(\regs_matrix[15][1] ), .B(n505), .C(\regs_matrix[10][1] ), 
        .D(n22), .Y(n162) );
  OAI21X1 U244 ( .A(\regs_matrix[14][1] ), .B(n28), .C(N13), .Y(n161) );
  OAI21X1 U245 ( .A(n164), .B(n165), .C(n166), .Y(n163) );
  AOI22X1 U246 ( .A(N13), .B(n169), .C(n170), .D(n171), .Y(n168) );
  NOR2X1 U247 ( .A(\regs_matrix[2][2] ), .B(n164), .Y(n170) );
  AOI22X1 U248 ( .A(n172), .B(n173), .C(n174), .D(n175), .Y(n167) );
  NOR2X1 U249 ( .A(\regs_matrix[6][2] ), .B(n164), .Y(n174) );
  NOR2X1 U250 ( .A(\regs_matrix[7][2] ), .B(n164), .Y(n172) );
  AOI21X1 U251 ( .A(n176), .B(n177), .C(n178), .Y(n165) );
  OAI21X1 U252 ( .A(n25), .B(n179), .C(n180), .Y(n178) );
  NAND2X1 U253 ( .A(n181), .B(n150), .Y(n180) );
  NOR2X1 U254 ( .A(\regs_matrix[5][2] ), .B(n494), .Y(n181) );
  OAI21X1 U255 ( .A(n54), .B(n183), .C(n24), .Y(n177) );
  OR2X1 U256 ( .A(\regs_matrix[3][2] ), .B(n74), .Y(n183) );
  OAI21X1 U257 ( .A(\regs_matrix[1][2] ), .B(n184), .C(n185), .Y(n176) );
  AOI21X1 U258 ( .A(n186), .B(n54), .C(n25), .Y(n185) );
  NOR2X1 U259 ( .A(\regs_matrix[4][2] ), .B(n43), .Y(n186) );
  INVX2 U260 ( .A(n169), .Y(n164) );
  NAND2X1 U261 ( .A(n187), .B(n188), .Y(n169) );
  NOR2X1 U262 ( .A(n189), .B(n190), .Y(n188) );
  OAI22X1 U263 ( .A(\regs_matrix[15][2] ), .B(n505), .C(\regs_matrix[10][2] ), 
        .D(n22), .Y(n190) );
  OAI21X1 U264 ( .A(\regs_matrix[14][2] ), .B(n28), .C(N13), .Y(n189) );
  NOR2X1 U265 ( .A(n191), .B(n192), .Y(n187) );
  OAI21X1 U266 ( .A(\regs_matrix[13][2] ), .B(n510), .C(n193), .Y(n192) );
  AOI22X1 U267 ( .A(n18), .B(n194), .C(n20), .D(n195), .Y(n193) );
  INVX2 U268 ( .A(\regs_matrix[8][2] ), .Y(n195) );
  INVX2 U269 ( .A(\regs_matrix[9][2] ), .Y(n194) );
  OAI22X1 U270 ( .A(\regs_matrix[11][2] ), .B(n521), .C(\regs_matrix[12][2] ), 
        .D(n523), .Y(n191) );
  OAI21X1 U271 ( .A(n198), .B(n199), .C(n200), .Y(n197) );
  NAND2X1 U272 ( .A(n202), .B(n201), .Y(n200) );
  OAI21X1 U273 ( .A(\regs_matrix[1][3] ), .B(n79), .C(n203), .Y(n201) );
  AOI21X1 U274 ( .A(n204), .B(n38), .C(n205), .Y(n203) );
  OAI21X1 U275 ( .A(n56), .B(n206), .C(n112), .Y(n205) );
  NOR2X1 U276 ( .A(\regs_matrix[4][3] ), .B(n52), .Y(n204) );
  INVX2 U277 ( .A(n208), .Y(n199) );
  OAI22X1 U278 ( .A(\regs_matrix[5][3] ), .B(n209), .C(outreg_data[3]), .D(
        n520), .Y(n208) );
  OAI21X1 U279 ( .A(n198), .B(n211), .C(n212), .Y(n196) );
  NAND2X1 U280 ( .A(n202), .B(n213), .Y(n212) );
  OAI22X1 U281 ( .A(n27), .B(\regs_matrix[6][3] ), .C(n517), .D(
        \regs_matrix[2][3] ), .Y(n213) );
  OR2X1 U282 ( .A(\regs_matrix[7][3] ), .B(n124), .Y(n211) );
  INVX2 U283 ( .A(n202), .Y(n198) );
  NAND2X1 U284 ( .A(n215), .B(n216), .Y(n202) );
  NOR2X1 U285 ( .A(n217), .B(n218), .Y(n216) );
  OAI22X1 U286 ( .A(\regs_matrix[15][3] ), .B(n505), .C(\regs_matrix[10][3] ), 
        .D(n22), .Y(n218) );
  OAI21X1 U287 ( .A(\regs_matrix[14][3] ), .B(n28), .C(N13), .Y(n217) );
  NOR2X1 U288 ( .A(n219), .B(n220), .Y(n215) );
  OAI21X1 U289 ( .A(\regs_matrix[13][3] ), .B(n510), .C(n221), .Y(n220) );
  AOI22X1 U290 ( .A(n18), .B(n222), .C(n20), .D(n223), .Y(n221) );
  INVX2 U291 ( .A(\regs_matrix[8][3] ), .Y(n223) );
  INVX2 U292 ( .A(\regs_matrix[9][3] ), .Y(n222) );
  OAI22X1 U293 ( .A(\regs_matrix[11][3] ), .B(n521), .C(\regs_matrix[12][3] ), 
        .D(n523), .Y(n219) );
  NAND3X1 U294 ( .A(n225), .B(n226), .C(n227), .Y(n224) );
  OAI21X1 U295 ( .A(n228), .B(n229), .C(n230), .Y(n227) );
  OAI21X1 U296 ( .A(\regs_matrix[3][4] ), .B(n33), .C(n231), .Y(n229) );
  AOI22X1 U297 ( .A(n175), .B(n232), .C(n173), .D(n233), .Y(n231) );
  INVX2 U298 ( .A(\regs_matrix[7][4] ), .Y(n233) );
  INVX2 U299 ( .A(\regs_matrix[6][4] ), .Y(n232) );
  OAI21X1 U300 ( .A(\regs_matrix[2][4] ), .B(n36), .C(n112), .Y(n228) );
  AOI22X1 U301 ( .A(n234), .B(n509), .C(n235), .D(n512), .Y(n226) );
  NOR2X1 U302 ( .A(\regs_matrix[5][4] ), .B(n236), .Y(n235) );
  NOR2X1 U303 ( .A(outreg_data[4]), .B(n236), .Y(n234) );
  AOI22X1 U304 ( .A(n237), .B(n106), .C(n238), .D(n130), .Y(n225) );
  NOR2X1 U305 ( .A(\regs_matrix[1][4] ), .B(n236), .Y(n238) );
  NOR2X1 U306 ( .A(\regs_matrix[4][4] ), .B(n236), .Y(n237) );
  INVX2 U307 ( .A(n230), .Y(n236) );
  NAND2X1 U308 ( .A(n239), .B(n240), .Y(n230) );
  NOR2X1 U309 ( .A(n241), .B(n242), .Y(n240) );
  OAI22X1 U310 ( .A(\regs_matrix[15][4] ), .B(n505), .C(\regs_matrix[10][4] ), 
        .D(n22), .Y(n242) );
  OAI21X1 U311 ( .A(\regs_matrix[14][4] ), .B(n28), .C(N13), .Y(n241) );
  NOR2X1 U312 ( .A(n243), .B(n244), .Y(n239) );
  OAI21X1 U313 ( .A(\regs_matrix[13][4] ), .B(n510), .C(n245), .Y(n244) );
  AOI22X1 U314 ( .A(n18), .B(n246), .C(n20), .D(n247), .Y(n245) );
  INVX2 U315 ( .A(\regs_matrix[8][4] ), .Y(n247) );
  INVX2 U316 ( .A(\regs_matrix[9][4] ), .Y(n246) );
  OAI22X1 U317 ( .A(\regs_matrix[11][4] ), .B(n521), .C(\regs_matrix[12][4] ), 
        .D(n523), .Y(n243) );
  AOI21X1 U318 ( .A(n248), .B(n249), .C(n250), .Y(r1_data[5]) );
  OAI21X1 U319 ( .A(n252), .B(n253), .C(n254), .Y(n251) );
  OAI21X1 U320 ( .A(n79), .B(\regs_matrix[1][5] ), .C(n255), .Y(n253) );
  AOI21X1 U321 ( .A(n256), .B(n38), .C(n257), .Y(n255) );
  OAI21X1 U322 ( .A(n258), .B(n259), .C(n112), .Y(n257) );
  NOR2X1 U323 ( .A(\regs_matrix[6][5] ), .B(n56), .Y(n256) );
  OAI21X1 U324 ( .A(\regs_matrix[5][5] ), .B(n138), .C(n260), .Y(n252) );
  AOI22X1 U325 ( .A(n261), .B(n37), .C(n41), .D(n263), .Y(n260) );
  INVX2 U326 ( .A(outreg_data[5]), .Y(n263) );
  NOR2X1 U327 ( .A(\regs_matrix[2][5] ), .B(n150), .Y(n261) );
  OAI21X1 U328 ( .A(\regs_matrix[7][5] ), .B(n503), .C(n7), .Y(n249) );
  AOI21X1 U329 ( .A(\regs_matrix[3][5] ), .B(n124), .C(n264), .Y(n248) );
  INVX2 U330 ( .A(n254), .Y(n264) );
  NAND2X1 U331 ( .A(n265), .B(n266), .Y(n254) );
  NOR2X1 U332 ( .A(n267), .B(n268), .Y(n266) );
  OAI22X1 U333 ( .A(\regs_matrix[15][5] ), .B(n58), .C(\regs_matrix[10][5] ), 
        .D(n22), .Y(n268) );
  OAI21X1 U334 ( .A(\regs_matrix[14][5] ), .B(n28), .C(N13), .Y(n267) );
  NOR2X1 U335 ( .A(n269), .B(n270), .Y(n265) );
  OAI21X1 U336 ( .A(\regs_matrix[13][5] ), .B(n510), .C(n271), .Y(n270) );
  AOI22X1 U337 ( .A(n18), .B(n272), .C(n20), .D(n273), .Y(n271) );
  INVX2 U338 ( .A(\regs_matrix[8][5] ), .Y(n273) );
  INVX2 U339 ( .A(\regs_matrix[9][5] ), .Y(n272) );
  OAI22X1 U340 ( .A(\regs_matrix[11][5] ), .B(n521), .C(\regs_matrix[12][5] ), 
        .D(n523), .Y(n269) );
  NOR2X1 U341 ( .A(n274), .B(n275), .Y(r1_data[6]) );
  OAI21X1 U342 ( .A(n276), .B(n277), .C(n278), .Y(n275) );
  OAI21X1 U343 ( .A(n279), .B(n280), .C(n281), .Y(n278) );
  OAI21X1 U344 ( .A(\regs_matrix[7][6] ), .B(n124), .C(n112), .Y(n280) );
  NOR2X1 U345 ( .A(\regs_matrix[1][6] ), .B(n282), .Y(n279) );
  INVX2 U346 ( .A(n283), .Y(n277) );
  OAI22X1 U347 ( .A(\regs_matrix[4][6] ), .B(n526), .C(\regs_matrix[3][6] ), 
        .D(n525), .Y(n283) );
  NAND2X1 U348 ( .A(n284), .B(n285), .Y(n274) );
  AOI22X1 U349 ( .A(n286), .B(n57), .C(n287), .D(n40), .Y(n285) );
  NOR2X1 U350 ( .A(\regs_matrix[5][6] ), .B(n276), .Y(n287) );
  NOR2X1 U351 ( .A(\regs_matrix[6][6] ), .B(n276), .Y(n286) );
  AOI22X1 U352 ( .A(n288), .B(n171), .C(n289), .D(n61), .Y(n284) );
  NOR2X1 U353 ( .A(outreg_data[6]), .B(n276), .Y(n289) );
  NOR2X1 U354 ( .A(\regs_matrix[2][6] ), .B(n276), .Y(n288) );
  INVX2 U355 ( .A(n281), .Y(n276) );
  NAND2X1 U356 ( .A(n290), .B(n291), .Y(n281) );
  NOR2X1 U357 ( .A(n292), .B(n293), .Y(n291) );
  OAI22X1 U358 ( .A(\regs_matrix[15][6] ), .B(n505), .C(\regs_matrix[10][6] ), 
        .D(n22), .Y(n293) );
  OAI21X1 U359 ( .A(\regs_matrix[14][6] ), .B(n28), .C(N13), .Y(n292) );
  NOR2X1 U360 ( .A(n294), .B(n295), .Y(n290) );
  OAI21X1 U361 ( .A(\regs_matrix[13][6] ), .B(n510), .C(n296), .Y(n295) );
  AOI22X1 U362 ( .A(n18), .B(n297), .C(n20), .D(n298), .Y(n296) );
  INVX2 U363 ( .A(\regs_matrix[8][6] ), .Y(n298) );
  INVX2 U364 ( .A(\regs_matrix[9][6] ), .Y(n297) );
  OAI22X1 U365 ( .A(\regs_matrix[11][6] ), .B(n521), .C(\regs_matrix[12][6] ), 
        .D(n523), .Y(n294) );
  NOR2X1 U366 ( .A(n299), .B(n300), .Y(r1_data[7]) );
  NAND2X1 U367 ( .A(n302), .B(n301), .Y(n300) );
  OAI21X1 U368 ( .A(n303), .B(n304), .C(n305), .Y(n302) );
  OAI22X1 U369 ( .A(\regs_matrix[5][7] ), .B(n209), .C(n78), .D(
        \regs_matrix[1][7] ), .Y(n304) );
  NOR2X1 U370 ( .A(outreg_data[7]), .B(n51), .Y(n303) );
  AOI22X1 U371 ( .A(n306), .B(n497), .C(n307), .D(n106), .Y(n301) );
  NOR2X1 U372 ( .A(\regs_matrix[4][7] ), .B(n308), .Y(n307) );
  NOR2X1 U373 ( .A(\regs_matrix[3][7] ), .B(n308), .Y(n306) );
  NAND2X1 U374 ( .A(n309), .B(n310), .Y(n299) );
  AOI22X1 U375 ( .A(N13), .B(n305), .C(n311), .D(n171), .Y(n310) );
  NOR2X1 U376 ( .A(\regs_matrix[2][7] ), .B(n308), .Y(n311) );
  AOI22X1 U377 ( .A(n312), .B(n173), .C(n175), .D(n313), .Y(n309) );
  NOR2X1 U378 ( .A(\regs_matrix[6][7] ), .B(n308), .Y(n313) );
  NOR2X1 U379 ( .A(\regs_matrix[7][7] ), .B(n308), .Y(n312) );
  INVX2 U380 ( .A(n305), .Y(n308) );
  NAND3X1 U381 ( .A(n314), .B(n315), .C(n316), .Y(n305) );
  NOR2X1 U382 ( .A(n317), .B(n318), .Y(n316) );
  OAI22X1 U383 ( .A(\regs_matrix[15][7] ), .B(n505), .C(\regs_matrix[10][7] ), 
        .D(n22), .Y(n318) );
  OAI21X1 U384 ( .A(\regs_matrix[14][7] ), .B(n28), .C(N13), .Y(n317) );
  AOI22X1 U385 ( .A(n514), .B(n319), .C(n498), .D(n320), .Y(n315) );
  INVX2 U386 ( .A(\regs_matrix[11][7] ), .Y(n320) );
  INVX2 U387 ( .A(\regs_matrix[12][7] ), .Y(n319) );
  AOI21X1 U388 ( .A(n321), .B(n322), .C(n323), .Y(n314) );
  OAI22X1 U389 ( .A(\regs_matrix[9][7] ), .B(n282), .C(\regs_matrix[8][7] ), 
        .D(n508), .Y(n323) );
  INVX2 U390 ( .A(\regs_matrix[13][7] ), .Y(n322) );
  AND2X2 U391 ( .A(n324), .B(n325), .Y(r1_data[8]) );
  OAI21X1 U392 ( .A(n326), .B(n327), .C(n328), .Y(n325) );
  OAI22X1 U393 ( .A(outreg_data[8]), .B(n508), .C(\regs_matrix[2][8] ), .D(
        n125), .Y(n327) );
  OAI22X1 U394 ( .A(\regs_matrix[4][8] ), .B(n42), .C(\regs_matrix[5][8] ), 
        .D(n511), .Y(n326) );
  OAI21X1 U395 ( .A(n329), .B(n330), .C(n328), .Y(n324) );
  NAND2X1 U396 ( .A(n331), .B(n332), .Y(n328) );
  NOR2X1 U397 ( .A(n333), .B(n334), .Y(n332) );
  OAI22X1 U398 ( .A(\regs_matrix[15][8] ), .B(n505), .C(\regs_matrix[10][8] ), 
        .D(n22), .Y(n334) );
  OAI21X1 U399 ( .A(\regs_matrix[14][8] ), .B(n28), .C(N13), .Y(n333) );
  NOR2X1 U400 ( .A(n335), .B(n336), .Y(n331) );
  OAI21X1 U401 ( .A(\regs_matrix[13][8] ), .B(n510), .C(n337), .Y(n336) );
  AOI22X1 U402 ( .A(n18), .B(n338), .C(n20), .D(n339), .Y(n337) );
  INVX2 U403 ( .A(\regs_matrix[8][8] ), .Y(n339) );
  INVX2 U404 ( .A(\regs_matrix[9][8] ), .Y(n338) );
  OAI22X1 U405 ( .A(\regs_matrix[11][8] ), .B(n521), .C(\regs_matrix[12][8] ), 
        .D(n523), .Y(n335) );
  OAI22X1 U406 ( .A(\regs_matrix[1][8] ), .B(n282), .C(\regs_matrix[3][8] ), 
        .D(n524), .Y(n330) );
  OAI21X1 U407 ( .A(\regs_matrix[6][8] ), .B(n32), .C(n340), .Y(n329) );
  AOI21X1 U408 ( .A(n173), .B(n341), .C(N13), .Y(n340) );
  INVX2 U409 ( .A(\regs_matrix[7][8] ), .Y(n341) );
  NAND3X1 U410 ( .A(n344), .B(n345), .C(n343), .Y(n342) );
  OAI21X1 U411 ( .A(n346), .B(n347), .C(n348), .Y(n345) );
  OAI22X1 U412 ( .A(\regs_matrix[7][9] ), .B(n124), .C(\regs_matrix[2][9] ), 
        .D(n517), .Y(n347) );
  OAI21X1 U413 ( .A(n27), .B(\regs_matrix[6][9] ), .C(n112), .Y(n346) );
  OAI21X1 U414 ( .A(n349), .B(n350), .C(n348), .Y(n344) );
  OAI22X1 U415 ( .A(outreg_data[9]), .B(n210), .C(\regs_matrix[1][9] ), .D(n30), .Y(n350) );
  NOR2X1 U416 ( .A(\regs_matrix[5][9] ), .B(n519), .Y(n349) );
  AOI22X1 U417 ( .A(n351), .B(n106), .C(n352), .D(n497), .Y(n343) );
  NOR2X1 U418 ( .A(\regs_matrix[3][9] ), .B(n353), .Y(n352) );
  NOR2X1 U419 ( .A(\regs_matrix[4][9] ), .B(n353), .Y(n351) );
  INVX2 U420 ( .A(n348), .Y(n353) );
  NAND2X1 U421 ( .A(n354), .B(n355), .Y(n348) );
  NOR2X1 U422 ( .A(n356), .B(n357), .Y(n355) );
  OAI22X1 U423 ( .A(\regs_matrix[15][9] ), .B(n58), .C(\regs_matrix[10][9] ), 
        .D(n22), .Y(n357) );
  OAI21X1 U424 ( .A(\regs_matrix[14][9] ), .B(n28), .C(N13), .Y(n356) );
  NOR2X1 U425 ( .A(n358), .B(n359), .Y(n354) );
  OAI21X1 U426 ( .A(\regs_matrix[13][9] ), .B(n510), .C(n360), .Y(n359) );
  AOI22X1 U427 ( .A(n18), .B(n361), .C(n20), .D(n362), .Y(n360) );
  INVX2 U428 ( .A(\regs_matrix[8][9] ), .Y(n362) );
  INVX2 U429 ( .A(\regs_matrix[9][9] ), .Y(n361) );
  OAI22X1 U430 ( .A(\regs_matrix[11][9] ), .B(n521), .C(\regs_matrix[12][9] ), 
        .D(n523), .Y(n358) );
  AOI22X1 U431 ( .A(n364), .B(n365), .C(n366), .D(n367), .Y(n363) );
  NOR2X1 U432 ( .A(n368), .B(n369), .Y(n367) );
  OAI21X1 U433 ( .A(outreg_data[10]), .B(n508), .C(n370), .Y(n369) );
  AOI22X1 U434 ( .A(n65), .B(n371), .C(n40), .D(n372), .Y(n370) );
  INVX2 U435 ( .A(\regs_matrix[5][10] ), .Y(n372) );
  INVX2 U436 ( .A(\regs_matrix[1][10] ), .Y(n371) );
  OAI22X1 U437 ( .A(\regs_matrix[3][10] ), .B(n7), .C(\regs_matrix[4][10] ), 
        .D(n499), .Y(n368) );
  NOR2X1 U438 ( .A(n373), .B(n374), .Y(n366) );
  OAI22X1 U439 ( .A(\regs_matrix[7][10] ), .B(n503), .C(\regs_matrix[2][10] ), 
        .D(n125), .Y(n374) );
  OAI21X1 U440 ( .A(\regs_matrix[6][10] ), .B(n32), .C(n112), .Y(n373) );
  NOR2X1 U441 ( .A(n375), .B(n376), .Y(n365) );
  OAI22X1 U442 ( .A(\regs_matrix[15][10] ), .B(n505), .C(\regs_matrix[10][10] ), .D(n22), .Y(n376) );
  OAI21X1 U443 ( .A(\regs_matrix[14][10] ), .B(n28), .C(N13), .Y(n375) );
  NOR2X1 U444 ( .A(n377), .B(n378), .Y(n364) );
  OAI21X1 U445 ( .A(\regs_matrix[13][10] ), .B(n510), .C(n379), .Y(n378) );
  AOI22X1 U446 ( .A(n18), .B(n380), .C(n20), .D(n381), .Y(n379) );
  INVX2 U447 ( .A(\regs_matrix[8][10] ), .Y(n381) );
  INVX2 U448 ( .A(\regs_matrix[9][10] ), .Y(n380) );
  OAI22X1 U449 ( .A(\regs_matrix[11][10] ), .B(n521), .C(\regs_matrix[12][10] ), .D(n523), .Y(n377) );
  NAND3X1 U450 ( .A(n384), .B(n385), .C(n383), .Y(n382) );
  OAI21X1 U451 ( .A(n386), .B(n387), .C(n388), .Y(n385) );
  OAI22X1 U452 ( .A(\regs_matrix[7][11] ), .B(n506), .C(\regs_matrix[2][11] ), 
        .D(n518), .Y(n387) );
  OAI21X1 U453 ( .A(\regs_matrix[6][11] ), .B(n26), .C(n112), .Y(n386) );
  OAI21X1 U454 ( .A(n389), .B(n390), .C(n388), .Y(n384) );
  OAI22X1 U455 ( .A(outreg_data[11]), .B(n520), .C(\regs_matrix[1][11] ), .D(
        n78), .Y(n390) );
  NOR2X1 U456 ( .A(\regs_matrix[5][11] ), .B(n519), .Y(n389) );
  AOI22X1 U457 ( .A(n391), .B(n106), .C(n392), .D(n522), .Y(n383) );
  NOR2X1 U458 ( .A(\regs_matrix[3][11] ), .B(n393), .Y(n392) );
  NOR2X1 U459 ( .A(\regs_matrix[4][11] ), .B(n393), .Y(n391) );
  INVX2 U460 ( .A(n388), .Y(n393) );
  NAND2X1 U461 ( .A(n394), .B(n395), .Y(n388) );
  NOR2X1 U462 ( .A(n396), .B(n397), .Y(n395) );
  OAI22X1 U463 ( .A(\regs_matrix[15][11] ), .B(n505), .C(\regs_matrix[10][11] ), .D(n22), .Y(n397) );
  OAI21X1 U464 ( .A(\regs_matrix[14][11] ), .B(n28), .C(N13), .Y(n396) );
  NOR2X1 U465 ( .A(n398), .B(n399), .Y(n394) );
  OAI21X1 U466 ( .A(\regs_matrix[13][11] ), .B(n510), .C(n400), .Y(n399) );
  AOI22X1 U467 ( .A(n18), .B(n401), .C(n20), .D(n402), .Y(n400) );
  INVX2 U468 ( .A(\regs_matrix[8][11] ), .Y(n402) );
  INVX2 U469 ( .A(\regs_matrix[9][11] ), .Y(n401) );
  OAI22X1 U470 ( .A(\regs_matrix[11][11] ), .B(n521), .C(\regs_matrix[12][11] ), .D(n523), .Y(n398) );
  AOI22X1 U471 ( .A(n404), .B(n405), .C(n406), .D(n407), .Y(n403) );
  NOR2X1 U472 ( .A(n408), .B(n409), .Y(n407) );
  OAI22X1 U473 ( .A(\regs_matrix[7][12] ), .B(n124), .C(\regs_matrix[2][12] ), 
        .D(n36), .Y(n409) );
  OAI21X1 U474 ( .A(\regs_matrix[6][12] ), .B(n32), .C(n112), .Y(n408) );
  NOR2X1 U475 ( .A(n410), .B(n411), .Y(n406) );
  OAI21X1 U476 ( .A(outreg_data[12]), .B(n508), .C(n412), .Y(n411) );
  AOI22X1 U477 ( .A(n65), .B(n413), .C(n40), .D(n414), .Y(n412) );
  INVX2 U478 ( .A(\regs_matrix[5][12] ), .Y(n414) );
  INVX2 U479 ( .A(\regs_matrix[1][12] ), .Y(n413) );
  OAI22X1 U480 ( .A(\regs_matrix[3][12] ), .B(n525), .C(\regs_matrix[4][12] ), 
        .D(n526), .Y(n410) );
  NOR2X1 U481 ( .A(n415), .B(n416), .Y(n405) );
  OAI22X1 U482 ( .A(\regs_matrix[15][12] ), .B(n505), .C(\regs_matrix[10][12] ), .D(n22), .Y(n416) );
  OAI21X1 U483 ( .A(\regs_matrix[14][12] ), .B(n28), .C(N13), .Y(n415) );
  NOR2X1 U484 ( .A(n417), .B(n418), .Y(n404) );
  OAI21X1 U485 ( .A(\regs_matrix[13][12] ), .B(n510), .C(n419), .Y(n418) );
  AOI22X1 U486 ( .A(n18), .B(n420), .C(n20), .D(n421), .Y(n419) );
  INVX2 U487 ( .A(\regs_matrix[8][12] ), .Y(n421) );
  INVX2 U488 ( .A(\regs_matrix[9][12] ), .Y(n420) );
  OAI22X1 U489 ( .A(\regs_matrix[11][12] ), .B(n521), .C(\regs_matrix[12][12] ), .D(n523), .Y(n417) );
  AOI21X1 U490 ( .A(n425), .B(n426), .C(n427), .Y(n424) );
  INVX2 U491 ( .A(n422), .Y(n427) );
  AOI21X1 U492 ( .A(n173), .B(n428), .C(n429), .Y(n426) );
  OAI22X1 U493 ( .A(\regs_matrix[6][13] ), .B(n27), .C(\regs_matrix[1][13] ), 
        .D(n79), .Y(n429) );
  INVX2 U494 ( .A(\regs_matrix[7][13] ), .Y(n428) );
  NOR2X1 U495 ( .A(n431), .B(n430), .Y(n425) );
  OAI21X1 U496 ( .A(outreg_data[13]), .B(n51), .C(n112), .Y(n431) );
  NAND2X1 U497 ( .A(n60), .B(n56), .Y(n210) );
  OAI22X1 U498 ( .A(\regs_matrix[2][13] ), .B(n214), .C(\regs_matrix[5][13] ), 
        .D(n209), .Y(n430) );
  NAND2X1 U499 ( .A(n111), .B(n55), .Y(n209) );
  OAI22X1 U500 ( .A(\regs_matrix[3][13] ), .B(n525), .C(\regs_matrix[4][13] ), 
        .D(n526), .Y(n423) );
  NAND2X1 U501 ( .A(n433), .B(n434), .Y(n422) );
  NOR2X1 U502 ( .A(n435), .B(n436), .Y(n434) );
  OAI22X1 U503 ( .A(\regs_matrix[15][13] ), .B(n505), .C(\regs_matrix[10][13] ), .D(n22), .Y(n436) );
  OAI21X1 U504 ( .A(\regs_matrix[14][13] ), .B(n28), .C(N13), .Y(n435) );
  NOR2X1 U505 ( .A(n437), .B(n438), .Y(n433) );
  OAI21X1 U506 ( .A(\regs_matrix[13][13] ), .B(n510), .C(n439), .Y(n438) );
  AOI22X1 U507 ( .A(n18), .B(n440), .C(n20), .D(n441), .Y(n439) );
  INVX2 U508 ( .A(\regs_matrix[8][13] ), .Y(n441) );
  INVX2 U509 ( .A(\regs_matrix[9][13] ), .Y(n440) );
  OAI22X1 U510 ( .A(\regs_matrix[11][13] ), .B(n521), .C(\regs_matrix[12][13] ), .D(n523), .Y(n437) );
  AOI22X1 U511 ( .A(n443), .B(n444), .C(n445), .D(n446), .Y(n442) );
  NOR2X1 U512 ( .A(n448), .B(n447), .Y(n446) );
  OAI22X1 U513 ( .A(\regs_matrix[7][14] ), .B(n504), .C(\regs_matrix[2][14] ), 
        .D(n125), .Y(n448) );
  OAI21X1 U514 ( .A(\regs_matrix[6][14] ), .B(n496), .C(n112), .Y(n447) );
  NOR2X1 U515 ( .A(n449), .B(n450), .Y(n445) );
  OAI21X1 U516 ( .A(outreg_data[14]), .B(n508), .C(n451), .Y(n450) );
  AOI22X1 U517 ( .A(n65), .B(n452), .C(n40), .D(n453), .Y(n451) );
  INVX2 U518 ( .A(\regs_matrix[5][14] ), .Y(n453) );
  INVX2 U519 ( .A(\regs_matrix[1][14] ), .Y(n452) );
  OAI22X1 U520 ( .A(\regs_matrix[3][14] ), .B(n524), .C(\regs_matrix[4][14] ), 
        .D(n42), .Y(n449) );
  NOR2X1 U521 ( .A(n454), .B(n455), .Y(n444) );
  OAI22X1 U522 ( .A(\regs_matrix[15][14] ), .B(n505), .C(\regs_matrix[10][14] ), .D(n22), .Y(n455) );
  OAI21X1 U523 ( .A(\regs_matrix[14][14] ), .B(n28), .C(N13), .Y(n454) );
  NOR2X1 U524 ( .A(n456), .B(n457), .Y(n443) );
  OAI21X1 U525 ( .A(\regs_matrix[13][14] ), .B(n510), .C(n458), .Y(n457) );
  AOI22X1 U526 ( .A(n18), .B(n459), .C(n20), .D(n460), .Y(n458) );
  INVX2 U527 ( .A(\regs_matrix[8][14] ), .Y(n460) );
  INVX2 U528 ( .A(\regs_matrix[9][14] ), .Y(n459) );
  OAI22X1 U529 ( .A(\regs_matrix[11][14] ), .B(n521), .C(\regs_matrix[12][14] ), .D(n523), .Y(n456) );
  AOI22X1 U530 ( .A(n462), .B(n463), .C(n464), .D(n465), .Y(n461) );
  NOR2X1 U531 ( .A(n466), .B(n467), .Y(n465) );
  OAI22X1 U532 ( .A(\regs_matrix[7][15] ), .B(n503), .C(\regs_matrix[2][15] ), 
        .D(n125), .Y(n467) );
  OAI21X1 U533 ( .A(\regs_matrix[6][15] ), .B(n496), .C(n112), .Y(n466) );
  NOR2X1 U534 ( .A(n468), .B(n469), .Y(n464) );
  OAI21X1 U535 ( .A(\regs_matrix[5][15] ), .B(n511), .C(n470), .Y(n469) );
  AOI22X1 U536 ( .A(n65), .B(n471), .C(n509), .D(n472), .Y(n470) );
  INVX2 U537 ( .A(outreg_data[15]), .Y(n472) );
  INVX2 U538 ( .A(\regs_matrix[1][15] ), .Y(n471) );
  OAI22X1 U539 ( .A(\regs_matrix[3][15] ), .B(n524), .C(\regs_matrix[4][15] ), 
        .D(n42), .Y(n468) );
  NOR2X1 U540 ( .A(n473), .B(n474), .Y(n463) );
  OAI22X1 U541 ( .A(\regs_matrix[15][15] ), .B(n505), .C(\regs_matrix[10][15] ), .D(n22), .Y(n474) );
  OAI21X1 U542 ( .A(\regs_matrix[14][15] ), .B(n28), .C(N13), .Y(n473) );
  NOR2X1 U543 ( .A(n475), .B(n476), .Y(n462) );
  OAI21X1 U544 ( .A(\regs_matrix[13][15] ), .B(n510), .C(n477), .Y(n476) );
  AOI22X1 U545 ( .A(n18), .B(n478), .C(n20), .D(n479), .Y(n477) );
  INVX2 U546 ( .A(\regs_matrix[8][15] ), .Y(n479) );
  INVX2 U547 ( .A(\regs_matrix[9][15] ), .Y(n478) );
  OAI22X1 U548 ( .A(\regs_matrix[11][15] ), .B(n521), .C(\regs_matrix[12][15] ), .D(n523), .Y(n475) );
  MUX2X1 U549 ( .B(n480), .A(n481), .S(N13), .Y(r1_data[16]) );
  NAND2X1 U550 ( .A(n482), .B(n483), .Y(n481) );
  NOR2X1 U551 ( .A(n484), .B(n485), .Y(n483) );
  OAI22X1 U552 ( .A(\regs_matrix[10][16] ), .B(n22), .C(\regs_matrix[11][16] ), 
        .D(n521), .Y(n485) );
  OAI22X1 U553 ( .A(\regs_matrix[15][16] ), .B(n505), .C(\regs_matrix[14][16] ), .D(n28), .Y(n484) );
  NOR2X1 U554 ( .A(n486), .B(n487), .Y(n482) );
  OAI22X1 U555 ( .A(\regs_matrix[9][16] ), .B(n282), .C(\regs_matrix[8][16] ), 
        .D(n508), .Y(n487) );
  OAI22X1 U556 ( .A(\regs_matrix[12][16] ), .B(n523), .C(\regs_matrix[13][16] ), .D(n510), .Y(n486) );
  NAND2X1 U557 ( .A(n488), .B(n489), .Y(n480) );
  NOR2X1 U558 ( .A(n490), .B(n491), .Y(n489) );
  OAI22X1 U559 ( .A(\regs_matrix[2][16] ), .B(n495), .C(\regs_matrix[3][16] ), 
        .D(n33), .Y(n491) );
  NAND3X1 U560 ( .A(n47), .B(n513), .C(n501), .Y(n133) );
  INVX2 U561 ( .A(n182), .Y(n262) );
  OAI22X1 U562 ( .A(\regs_matrix[6][16] ), .B(n32), .C(\regs_matrix[7][16] ), 
        .D(n58), .Y(n490) );
  NAND2X1 U563 ( .A(n54), .B(n74), .Y(n258) );
  NOR2X1 U564 ( .A(n492), .B(n493), .Y(n488) );
  OAI22X1 U565 ( .A(outreg_data[16]), .B(n508), .C(\regs_matrix[1][16] ), .D(
        n282), .Y(n493) );
  NAND2X1 U566 ( .A(n153), .B(n47), .Y(n207) );
  NAND2X1 U567 ( .A(n110), .B(n55), .Y(n128) );
  OAI22X1 U568 ( .A(\regs_matrix[4][16] ), .B(n523), .C(\regs_matrix[5][16] ), 
        .D(n510), .Y(n492) );
  NAND2X1 U569 ( .A(N12), .B(n35), .Y(n494) );
  BUFX4 U570 ( .A(n116), .Y(r1_data[13]) );
  BUFX2 U571 ( .A(n506), .Y(n503) );
  BUFX2 U572 ( .A(n506), .Y(n504) );
  BUFX2 U573 ( .A(n506), .Y(n505) );
  NAND2X1 U574 ( .A(n111), .B(n52), .Y(n506) );
  NAND2X1 U575 ( .A(n111), .B(n52), .Y(n507) );
  INVX4 U576 ( .A(n117), .Y(r1_data[0]) );
  OR2X2 U577 ( .A(\regs_matrix[3][3] ), .B(n207), .Y(n206) );
  INVX2 U578 ( .A(n523), .Y(n514) );
  INVX4 U579 ( .A(n403), .Y(r1_data[12]) );
  NOR2X1 U580 ( .A(n515), .B(n424), .Y(n116) );
  INVX4 U581 ( .A(n442), .Y(r1_data[14]) );
  AND2X2 U582 ( .A(n48), .B(n55), .Y(n516) );
  NAND2X1 U583 ( .A(n262), .B(n25), .Y(n517) );
  NAND2X1 U584 ( .A(n262), .B(n24), .Y(n518) );
  INVX1 U585 ( .A(n510), .Y(n321) );
  NAND2X1 U586 ( .A(n432), .B(n150), .Y(n519) );
  NAND2X1 U587 ( .A(n60), .B(n55), .Y(n520) );
  BUFX2 U588 ( .A(n497), .Y(n498) );
  INVX2 U589 ( .A(n498), .Y(n521) );
  BUFX2 U590 ( .A(n133), .Y(n525) );
  NAND2X1 U591 ( .A(n109), .B(n150), .Y(n526) );
  MUX2X1 U592 ( .B(n527), .A(n528), .S(n792), .Y(r2_data[0]) );
  NAND2X1 U593 ( .A(n529), .B(n530), .Y(n528) );
  NOR2X1 U594 ( .A(n531), .B(n532), .Y(n530) );
  OAI22X1 U595 ( .A(\regs_matrix[8][0] ), .B(n103), .C(\regs_matrix[10][0] ), 
        .D(n776), .Y(n532) );
  OAI22X1 U596 ( .A(n69), .B(\regs_matrix[12][0] ), .C(\regs_matrix[14][0] ), 
        .D(n782), .Y(n531) );
  NOR2X1 U597 ( .A(n536), .B(n537), .Y(n529) );
  OAI22X1 U598 ( .A(\regs_matrix[11][0] ), .B(n87), .C(\regs_matrix[9][0] ), 
        .D(n71), .Y(n537) );
  OAI22X1 U599 ( .A(\regs_matrix[13][0] ), .B(n787), .C(\regs_matrix[15][0] ), 
        .D(n790), .Y(n536) );
  NAND2X1 U600 ( .A(n542), .B(n543), .Y(n527) );
  NOR2X1 U601 ( .A(n544), .B(n545), .Y(n543) );
  OAI22X1 U602 ( .A(outreg_data[0]), .B(n103), .C(\regs_matrix[2][0] ), .D(
        n776), .Y(n545) );
  OAI22X1 U603 ( .A(\regs_matrix[4][0] ), .B(n779), .C(\regs_matrix[6][0] ), 
        .D(n782), .Y(n544) );
  NOR2X1 U604 ( .A(n546), .B(n547), .Y(n542) );
  OAI22X1 U605 ( .A(\regs_matrix[3][0] ), .B(n87), .C(\regs_matrix[1][0] ), 
        .D(n71), .Y(n547) );
  OAI22X1 U606 ( .A(\regs_matrix[5][0] ), .B(n787), .C(\regs_matrix[7][0] ), 
        .D(n790), .Y(n546) );
  NAND2X1 U607 ( .A(n550), .B(n551), .Y(n549) );
  NOR2X1 U608 ( .A(n552), .B(n553), .Y(n551) );
  OAI22X1 U609 ( .A(\regs_matrix[8][1] ), .B(n68), .C(\regs_matrix[10][1] ), 
        .D(n70), .Y(n553) );
  OAI22X1 U610 ( .A(\regs_matrix[12][1] ), .B(n779), .C(\regs_matrix[14][1] ), 
        .D(n781), .Y(n552) );
  NOR2X1 U611 ( .A(n554), .B(n555), .Y(n550) );
  OAI22X1 U612 ( .A(\regs_matrix[11][1] ), .B(n86), .C(\regs_matrix[9][1] ), 
        .D(n91), .Y(n555) );
  OAI22X1 U613 ( .A(n787), .B(\regs_matrix[13][1] ), .C(\regs_matrix[15][1] ), 
        .D(n790), .Y(n554) );
  NAND2X1 U614 ( .A(n556), .B(n557), .Y(n548) );
  NOR2X1 U615 ( .A(n558), .B(n559), .Y(n557) );
  OAI22X1 U616 ( .A(outreg_data[1]), .B(n68), .C(\regs_matrix[2][1] ), .D(n776), .Y(n559) );
  OAI22X1 U617 ( .A(\regs_matrix[4][1] ), .B(n779), .C(\regs_matrix[6][1] ), 
        .D(n39), .Y(n558) );
  NOR2X1 U618 ( .A(n560), .B(n561), .Y(n556) );
  OAI22X1 U619 ( .A(\regs_matrix[3][1] ), .B(n89), .C(\regs_matrix[1][1] ), 
        .D(n90), .Y(n561) );
  OAI22X1 U620 ( .A(\regs_matrix[5][1] ), .B(n787), .C(\regs_matrix[7][1] ), 
        .D(n790), .Y(n560) );
  MUX2X1 U621 ( .B(n562), .A(n563), .S(n792), .Y(r2_data[2]) );
  NAND2X1 U622 ( .A(n564), .B(n565), .Y(n563) );
  NOR2X1 U623 ( .A(n566), .B(n567), .Y(n565) );
  OAI22X1 U624 ( .A(\regs_matrix[8][2] ), .B(n68), .C(\regs_matrix[10][2] ), 
        .D(n776), .Y(n567) );
  OAI22X1 U625 ( .A(\regs_matrix[12][2] ), .B(n778), .C(\regs_matrix[14][2] ), 
        .D(n39), .Y(n566) );
  NOR2X1 U626 ( .A(n569), .B(n568), .Y(n564) );
  OAI22X1 U627 ( .A(\regs_matrix[11][2] ), .B(n84), .C(\regs_matrix[9][2] ), 
        .D(n92), .Y(n569) );
  OAI22X1 U628 ( .A(\regs_matrix[13][2] ), .B(n786), .C(\regs_matrix[15][2] ), 
        .D(n790), .Y(n568) );
  NAND2X1 U629 ( .A(n570), .B(n571), .Y(n562) );
  NOR2X1 U630 ( .A(n572), .B(n573), .Y(n571) );
  OAI22X1 U631 ( .A(outreg_data[2]), .B(n104), .C(\regs_matrix[2][2] ), .D(
        n776), .Y(n573) );
  OAI22X1 U632 ( .A(\regs_matrix[4][2] ), .B(n69), .C(\regs_matrix[6][2] ), 
        .D(n782), .Y(n572) );
  NOR2X1 U633 ( .A(n574), .B(n575), .Y(n570) );
  OAI22X1 U634 ( .A(\regs_matrix[3][2] ), .B(n84), .C(\regs_matrix[1][2] ), 
        .D(n93), .Y(n575) );
  OAI22X1 U635 ( .A(\regs_matrix[5][2] ), .B(n787), .C(\regs_matrix[7][2] ), 
        .D(n790), .Y(n574) );
  MUX2X1 U636 ( .B(n576), .A(n577), .S(n791), .Y(r2_data[3]) );
  NAND2X1 U637 ( .A(n579), .B(n578), .Y(n577) );
  NOR2X1 U638 ( .A(n580), .B(n581), .Y(n579) );
  OAI22X1 U639 ( .A(\regs_matrix[8][3] ), .B(n99), .C(\regs_matrix[10][3] ), 
        .D(n776), .Y(n581) );
  OAI22X1 U640 ( .A(\regs_matrix[12][3] ), .B(n779), .C(\regs_matrix[14][3] ), 
        .D(n781), .Y(n580) );
  NOR2X1 U641 ( .A(n582), .B(n583), .Y(n578) );
  OAI22X1 U642 ( .A(\regs_matrix[11][3] ), .B(n87), .C(\regs_matrix[9][3] ), 
        .D(n93), .Y(n583) );
  OAI22X1 U643 ( .A(\regs_matrix[13][3] ), .B(n786), .C(\regs_matrix[15][3] ), 
        .D(n790), .Y(n582) );
  NAND2X1 U644 ( .A(n584), .B(n585), .Y(n576) );
  NOR2X1 U645 ( .A(n586), .B(n587), .Y(n585) );
  OAI22X1 U646 ( .A(outreg_data[3]), .B(n103), .C(\regs_matrix[2][3] ), .D(
        n776), .Y(n587) );
  OAI22X1 U647 ( .A(\regs_matrix[4][3] ), .B(n69), .C(n782), .D(
        \regs_matrix[6][3] ), .Y(n586) );
  NOR2X1 U648 ( .A(n588), .B(n589), .Y(n584) );
  OAI22X1 U649 ( .A(\regs_matrix[3][3] ), .B(n84), .C(\regs_matrix[1][3] ), 
        .D(n96), .Y(n589) );
  OAI22X1 U650 ( .A(n787), .B(\regs_matrix[5][3] ), .C(\regs_matrix[7][3] ), 
        .D(n790), .Y(n588) );
  NAND2X1 U651 ( .A(n592), .B(n593), .Y(n591) );
  NOR2X1 U652 ( .A(n594), .B(n595), .Y(n593) );
  OAI22X1 U653 ( .A(\regs_matrix[8][4] ), .B(n101), .C(\regs_matrix[10][4] ), 
        .D(n776), .Y(n595) );
  OAI22X1 U654 ( .A(n778), .B(\regs_matrix[12][4] ), .C(\regs_matrix[14][4] ), 
        .D(n782), .Y(n594) );
  NOR2X1 U655 ( .A(n596), .B(n597), .Y(n592) );
  OAI22X1 U656 ( .A(\regs_matrix[11][4] ), .B(n86), .C(\regs_matrix[9][4] ), 
        .D(n96), .Y(n597) );
  OAI22X1 U657 ( .A(n786), .B(\regs_matrix[13][4] ), .C(\regs_matrix[15][4] ), 
        .D(n790), .Y(n596) );
  NAND2X1 U658 ( .A(n599), .B(n598), .Y(n590) );
  NOR2X1 U659 ( .A(n600), .B(n601), .Y(n599) );
  OAI22X1 U660 ( .A(outreg_data[4]), .B(n103), .C(\regs_matrix[2][4] ), .D(
        n776), .Y(n601) );
  OAI22X1 U661 ( .A(n780), .B(\regs_matrix[4][4] ), .C(n782), .D(
        \regs_matrix[6][4] ), .Y(n600) );
  NOR2X1 U662 ( .A(n603), .B(n602), .Y(n598) );
  OAI22X1 U663 ( .A(\regs_matrix[3][4] ), .B(n84), .C(\regs_matrix[1][4] ), 
        .D(n94), .Y(n603) );
  OAI22X1 U664 ( .A(\regs_matrix[5][4] ), .B(n786), .C(\regs_matrix[7][4] ), 
        .D(n790), .Y(n602) );
  MUX2X1 U665 ( .B(n604), .A(n605), .S(n791), .Y(r2_data[5]) );
  NAND2X1 U666 ( .A(n607), .B(n606), .Y(n605) );
  NOR2X1 U667 ( .A(n608), .B(n609), .Y(n607) );
  OAI22X1 U668 ( .A(\regs_matrix[8][5] ), .B(n50), .C(\regs_matrix[10][5] ), 
        .D(n70), .Y(n609) );
  OAI22X1 U669 ( .A(n69), .B(\regs_matrix[12][5] ), .C(\regs_matrix[14][5] ), 
        .D(n781), .Y(n608) );
  NOR2X1 U670 ( .A(n611), .B(n610), .Y(n606) );
  OAI22X1 U671 ( .A(\regs_matrix[11][5] ), .B(n86), .C(\regs_matrix[9][5] ), 
        .D(n94), .Y(n611) );
  OAI22X1 U672 ( .A(\regs_matrix[13][5] ), .B(n786), .C(\regs_matrix[15][5] ), 
        .D(n790), .Y(n610) );
  NAND2X1 U673 ( .A(n612), .B(n613), .Y(n604) );
  NOR2X1 U674 ( .A(n614), .B(n615), .Y(n613) );
  OAI22X1 U675 ( .A(outreg_data[5]), .B(n101), .C(\regs_matrix[2][5] ), .D(n70), .Y(n615) );
  OAI22X1 U676 ( .A(\regs_matrix[4][5] ), .B(n779), .C(\regs_matrix[6][5] ), 
        .D(n782), .Y(n614) );
  NOR2X1 U677 ( .A(n616), .B(n617), .Y(n612) );
  OAI22X1 U678 ( .A(\regs_matrix[3][5] ), .B(n84), .C(\regs_matrix[1][5] ), 
        .D(n91), .Y(n617) );
  OAI22X1 U679 ( .A(\regs_matrix[5][5] ), .B(n787), .C(\regs_matrix[7][5] ), 
        .D(n790), .Y(n616) );
  NAND2X1 U680 ( .A(n620), .B(n621), .Y(n619) );
  NOR2X1 U681 ( .A(n622), .B(n623), .Y(n621) );
  OAI22X1 U682 ( .A(\regs_matrix[8][6] ), .B(n102), .C(\regs_matrix[10][6] ), 
        .D(n70), .Y(n623) );
  OAI22X1 U683 ( .A(\regs_matrix[12][6] ), .B(n779), .C(\regs_matrix[14][6] ), 
        .D(n67), .Y(n622) );
  NOR2X1 U684 ( .A(n624), .B(n625), .Y(n620) );
  OAI22X1 U685 ( .A(\regs_matrix[11][6] ), .B(n87), .C(\regs_matrix[9][6] ), 
        .D(n95), .Y(n625) );
  OAI22X1 U686 ( .A(\regs_matrix[13][6] ), .B(n787), .C(\regs_matrix[15][6] ), 
        .D(n790), .Y(n624) );
  NAND2X1 U687 ( .A(n627), .B(n626), .Y(n618) );
  NOR2X1 U688 ( .A(n628), .B(n629), .Y(n627) );
  OAI22X1 U689 ( .A(outreg_data[6]), .B(n101), .C(\regs_matrix[2][6] ), .D(n70), .Y(n629) );
  OAI22X1 U690 ( .A(\regs_matrix[4][6] ), .B(n779), .C(\regs_matrix[6][6] ), 
        .D(n67), .Y(n628) );
  NOR2X1 U691 ( .A(n630), .B(n631), .Y(n626) );
  OAI22X1 U692 ( .A(\regs_matrix[3][6] ), .B(n89), .C(\regs_matrix[1][6] ), 
        .D(n96), .Y(n631) );
  OAI22X1 U693 ( .A(\regs_matrix[5][6] ), .B(n786), .C(\regs_matrix[7][6] ), 
        .D(n790), .Y(n630) );
  NAND2X1 U694 ( .A(n634), .B(n635), .Y(n633) );
  NOR2X1 U695 ( .A(n636), .B(n637), .Y(n635) );
  OAI22X1 U696 ( .A(\regs_matrix[8][7] ), .B(n100), .C(\regs_matrix[10][7] ), 
        .D(n70), .Y(n637) );
  OAI22X1 U697 ( .A(\regs_matrix[12][7] ), .B(n69), .C(\regs_matrix[14][7] ), 
        .D(n67), .Y(n636) );
  NOR2X1 U698 ( .A(n638), .B(n639), .Y(n634) );
  OAI22X1 U699 ( .A(\regs_matrix[11][7] ), .B(n88), .C(\regs_matrix[9][7] ), 
        .D(n97), .Y(n639) );
  OAI22X1 U700 ( .A(\regs_matrix[13][7] ), .B(n786), .C(\regs_matrix[15][7] ), 
        .D(n789), .Y(n638) );
  NAND2X1 U701 ( .A(n641), .B(n640), .Y(n632) );
  NOR2X1 U702 ( .A(n642), .B(n643), .Y(n641) );
  OAI22X1 U703 ( .A(outreg_data[7]), .B(n102), .C(\regs_matrix[2][7] ), .D(n70), .Y(n643) );
  OAI22X1 U704 ( .A(\regs_matrix[4][7] ), .B(n778), .C(\regs_matrix[6][7] ), 
        .D(n781), .Y(n642) );
  NOR2X1 U705 ( .A(n644), .B(n645), .Y(n640) );
  OAI22X1 U706 ( .A(\regs_matrix[3][7] ), .B(n89), .C(\regs_matrix[1][7] ), 
        .D(n95), .Y(n645) );
  OAI22X1 U707 ( .A(\regs_matrix[5][7] ), .B(n786), .C(\regs_matrix[7][7] ), 
        .D(n789), .Y(n644) );
  NAND2X1 U708 ( .A(n648), .B(n649), .Y(n647) );
  NOR2X1 U709 ( .A(n650), .B(n651), .Y(n649) );
  OAI22X1 U710 ( .A(\regs_matrix[8][8] ), .B(n98), .C(\regs_matrix[10][8] ), 
        .D(n70), .Y(n651) );
  OAI22X1 U711 ( .A(\regs_matrix[12][8] ), .B(n778), .C(\regs_matrix[14][8] ), 
        .D(n781), .Y(n650) );
  NOR2X1 U712 ( .A(n652), .B(n653), .Y(n648) );
  OAI22X1 U713 ( .A(\regs_matrix[11][8] ), .B(n85), .C(\regs_matrix[9][8] ), 
        .D(n93), .Y(n653) );
  OAI22X1 U714 ( .A(\regs_matrix[13][8] ), .B(n787), .C(\regs_matrix[15][8] ), 
        .D(n789), .Y(n652) );
  NAND2X1 U715 ( .A(n655), .B(n654), .Y(n646) );
  NOR2X1 U716 ( .A(n656), .B(n657), .Y(n655) );
  OAI22X1 U717 ( .A(n102), .B(outreg_data[8]), .C(\regs_matrix[2][8] ), .D(n70), .Y(n657) );
  OAI22X1 U718 ( .A(\regs_matrix[4][8] ), .B(n778), .C(n39), .D(
        \regs_matrix[6][8] ), .Y(n656) );
  NOR2X1 U719 ( .A(n658), .B(n659), .Y(n654) );
  OAI22X1 U720 ( .A(\regs_matrix[3][8] ), .B(n88), .C(\regs_matrix[1][8] ), 
        .D(n91), .Y(n659) );
  OAI22X1 U721 ( .A(\regs_matrix[5][8] ), .B(n786), .C(\regs_matrix[7][8] ), 
        .D(n789), .Y(n658) );
  MUX2X1 U722 ( .B(n660), .A(n661), .S(n791), .Y(r2_data[9]) );
  NAND2X1 U723 ( .A(n662), .B(n663), .Y(n661) );
  NOR2X1 U724 ( .A(n664), .B(n665), .Y(n663) );
  OAI22X1 U725 ( .A(\regs_matrix[8][9] ), .B(n68), .C(\regs_matrix[10][9] ), 
        .D(n70), .Y(n665) );
  OAI22X1 U726 ( .A(\regs_matrix[12][9] ), .B(n780), .C(\regs_matrix[14][9] ), 
        .D(n39), .Y(n664) );
  NOR2X1 U727 ( .A(n666), .B(n667), .Y(n662) );
  OAI22X1 U728 ( .A(\regs_matrix[11][9] ), .B(n84), .C(\regs_matrix[9][9] ), 
        .D(n92), .Y(n667) );
  OAI22X1 U729 ( .A(\regs_matrix[13][9] ), .B(n786), .C(\regs_matrix[15][9] ), 
        .D(n789), .Y(n666) );
  NAND2X1 U730 ( .A(n668), .B(n669), .Y(n660) );
  NOR2X1 U731 ( .A(n670), .B(n671), .Y(n669) );
  OAI22X1 U732 ( .A(outreg_data[9]), .B(n100), .C(\regs_matrix[2][9] ), .D(n70), .Y(n671) );
  OAI22X1 U733 ( .A(\regs_matrix[4][9] ), .B(n780), .C(\regs_matrix[6][9] ), 
        .D(n781), .Y(n670) );
  NOR2X1 U734 ( .A(n672), .B(n673), .Y(n668) );
  OAI22X1 U735 ( .A(\regs_matrix[3][9] ), .B(n89), .C(\regs_matrix[1][9] ), 
        .D(n90), .Y(n673) );
  OAI22X1 U736 ( .A(\regs_matrix[5][9] ), .B(n786), .C(\regs_matrix[7][9] ), 
        .D(n790), .Y(n672) );
  NAND2X1 U737 ( .A(n676), .B(n677), .Y(n675) );
  NOR2X1 U738 ( .A(n678), .B(n679), .Y(n677) );
  OAI22X1 U739 ( .A(\regs_matrix[8][10] ), .B(n98), .C(\regs_matrix[10][10] ), 
        .D(n776), .Y(n679) );
  OAI22X1 U740 ( .A(\regs_matrix[12][10] ), .B(n69), .C(\regs_matrix[14][10] ), 
        .D(n782), .Y(n678) );
  NOR2X1 U741 ( .A(n680), .B(n681), .Y(n676) );
  OAI22X1 U742 ( .A(\regs_matrix[11][10] ), .B(n86), .C(\regs_matrix[9][10] ), 
        .D(n91), .Y(n681) );
  OAI22X1 U743 ( .A(\regs_matrix[13][10] ), .B(n786), .C(\regs_matrix[15][10] ), .D(n789), .Y(n680) );
  NAND2X1 U744 ( .A(n683), .B(n682), .Y(n674) );
  NOR2X1 U745 ( .A(n684), .B(n685), .Y(n683) );
  OAI22X1 U746 ( .A(outreg_data[10]), .B(n50), .C(\regs_matrix[2][10] ), .D(
        n70), .Y(n685) );
  OAI22X1 U747 ( .A(\regs_matrix[4][10] ), .B(n69), .C(\regs_matrix[6][10] ), 
        .D(n782), .Y(n684) );
  NOR2X1 U748 ( .A(n687), .B(n686), .Y(n682) );
  OAI22X1 U749 ( .A(\regs_matrix[3][10] ), .B(n85), .C(\regs_matrix[1][10] ), 
        .D(n93), .Y(n687) );
  OAI22X1 U750 ( .A(\regs_matrix[5][10] ), .B(n786), .C(\regs_matrix[7][10] ), 
        .D(n790), .Y(n686) );
  MUX2X1 U751 ( .B(n688), .A(n689), .S(n791), .Y(r2_data[11]) );
  NAND2X1 U752 ( .A(n690), .B(n691), .Y(n689) );
  NOR2X1 U753 ( .A(n692), .B(n693), .Y(n691) );
  OAI22X1 U754 ( .A(\regs_matrix[8][11] ), .B(n104), .C(\regs_matrix[10][11] ), 
        .D(n776), .Y(n693) );
  OAI22X1 U755 ( .A(\regs_matrix[12][11] ), .B(n780), .C(\regs_matrix[14][11] ), .D(n39), .Y(n692) );
  NOR2X1 U756 ( .A(n694), .B(n695), .Y(n690) );
  OAI22X1 U757 ( .A(\regs_matrix[11][11] ), .B(n89), .C(\regs_matrix[9][11] ), 
        .D(n92), .Y(n695) );
  OAI22X1 U758 ( .A(\regs_matrix[13][11] ), .B(n786), .C(\regs_matrix[15][11] ), .D(n789), .Y(n694) );
  NAND2X1 U759 ( .A(n696), .B(n697), .Y(n688) );
  NOR2X1 U760 ( .A(n698), .B(n699), .Y(n697) );
  OAI22X1 U761 ( .A(outreg_data[11]), .B(n99), .C(\regs_matrix[2][11] ), .D(
        n70), .Y(n699) );
  OAI22X1 U762 ( .A(n780), .B(\regs_matrix[4][11] ), .C(\regs_matrix[6][11] ), 
        .D(n39), .Y(n698) );
  NOR2X1 U763 ( .A(n700), .B(n701), .Y(n696) );
  OAI22X1 U764 ( .A(\regs_matrix[3][11] ), .B(n87), .C(\regs_matrix[1][11] ), 
        .D(n93), .Y(n701) );
  OAI22X1 U765 ( .A(\regs_matrix[5][11] ), .B(n787), .C(\regs_matrix[7][11] ), 
        .D(n789), .Y(n700) );
  MUX2X1 U766 ( .B(n702), .A(n703), .S(n792), .Y(r2_data[12]) );
  NAND2X1 U767 ( .A(n704), .B(n705), .Y(n703) );
  NOR2X1 U768 ( .A(n706), .B(n707), .Y(n705) );
  OAI22X1 U769 ( .A(\regs_matrix[8][12] ), .B(n104), .C(\regs_matrix[10][12] ), 
        .D(n70), .Y(n707) );
  OAI22X1 U770 ( .A(\regs_matrix[12][12] ), .B(n780), .C(\regs_matrix[14][12] ), .D(n39), .Y(n706) );
  NOR2X1 U771 ( .A(n708), .B(n709), .Y(n704) );
  OAI22X1 U772 ( .A(\regs_matrix[11][12] ), .B(n84), .C(\regs_matrix[9][12] ), 
        .D(n95), .Y(n709) );
  OAI22X1 U773 ( .A(\regs_matrix[13][12] ), .B(n787), .C(\regs_matrix[15][12] ), .D(n789), .Y(n708) );
  NAND2X1 U774 ( .A(n710), .B(n711), .Y(n702) );
  NOR2X1 U775 ( .A(n712), .B(n713), .Y(n711) );
  OAI22X1 U776 ( .A(n101), .B(outreg_data[12]), .C(\regs_matrix[2][12] ), .D(
        n70), .Y(n713) );
  OAI22X1 U777 ( .A(\regs_matrix[4][12] ), .B(n779), .C(\regs_matrix[6][12] ), 
        .D(n67), .Y(n712) );
  NOR2X1 U778 ( .A(n714), .B(n715), .Y(n710) );
  OAI22X1 U779 ( .A(\regs_matrix[3][12] ), .B(n85), .C(\regs_matrix[1][12] ), 
        .D(n95), .Y(n715) );
  OAI22X1 U780 ( .A(\regs_matrix[5][12] ), .B(n787), .C(\regs_matrix[7][12] ), 
        .D(n789), .Y(n714) );
  MUX2X1 U781 ( .B(n716), .A(n717), .S(n791), .Y(r2_data[13]) );
  NAND2X1 U782 ( .A(n718), .B(n719), .Y(n717) );
  NOR2X1 U783 ( .A(n720), .B(n721), .Y(n719) );
  OAI22X1 U784 ( .A(\regs_matrix[8][13] ), .B(n100), .C(\regs_matrix[10][13] ), 
        .D(n776), .Y(n721) );
  OAI22X1 U785 ( .A(\regs_matrix[12][13] ), .B(n69), .C(\regs_matrix[14][13] ), 
        .D(n67), .Y(n720) );
  NOR2X1 U786 ( .A(n722), .B(n723), .Y(n718) );
  OAI22X1 U787 ( .A(\regs_matrix[11][13] ), .B(n85), .C(\regs_matrix[9][13] ), 
        .D(n97), .Y(n723) );
  OAI22X1 U788 ( .A(\regs_matrix[13][13] ), .B(n787), .C(\regs_matrix[15][13] ), .D(n789), .Y(n722) );
  NAND2X1 U789 ( .A(n724), .B(n725), .Y(n716) );
  NOR2X1 U790 ( .A(n726), .B(n727), .Y(n725) );
  OAI22X1 U791 ( .A(outreg_data[13]), .B(n101), .C(\regs_matrix[2][13] ), .D(
        n776), .Y(n727) );
  OAI22X1 U792 ( .A(\regs_matrix[4][13] ), .B(n780), .C(\regs_matrix[6][13] ), 
        .D(n67), .Y(n726) );
  NOR2X1 U793 ( .A(n728), .B(n729), .Y(n724) );
  OAI22X1 U794 ( .A(\regs_matrix[3][13] ), .B(n88), .C(\regs_matrix[1][13] ), 
        .D(n71), .Y(n729) );
  OAI22X1 U795 ( .A(\regs_matrix[5][13] ), .B(n787), .C(\regs_matrix[7][13] ), 
        .D(n789), .Y(n728) );
  MUX2X1 U796 ( .B(n730), .A(n731), .S(n792), .Y(r2_data[14]) );
  NAND2X1 U797 ( .A(n732), .B(n733), .Y(n731) );
  NOR2X1 U798 ( .A(n734), .B(n735), .Y(n733) );
  OAI22X1 U799 ( .A(\regs_matrix[8][14] ), .B(n50), .C(\regs_matrix[10][14] ), 
        .D(n776), .Y(n735) );
  OAI22X1 U800 ( .A(\regs_matrix[12][14] ), .B(n69), .C(\regs_matrix[14][14] ), 
        .D(n39), .Y(n734) );
  NOR2X1 U801 ( .A(n736), .B(n737), .Y(n732) );
  OAI22X1 U802 ( .A(n87), .B(\regs_matrix[11][14] ), .C(\regs_matrix[9][14] ), 
        .D(n71), .Y(n737) );
  OAI22X1 U803 ( .A(\regs_matrix[13][14] ), .B(n786), .C(\regs_matrix[15][14] ), .D(n789), .Y(n736) );
  NAND2X1 U804 ( .A(n738), .B(n739), .Y(n730) );
  NOR2X1 U805 ( .A(n740), .B(n741), .Y(n739) );
  OAI22X1 U806 ( .A(outreg_data[14]), .B(n99), .C(n776), .D(
        \regs_matrix[2][14] ), .Y(n741) );
  OAI22X1 U807 ( .A(\regs_matrix[4][14] ), .B(n779), .C(n39), .D(
        \regs_matrix[6][14] ), .Y(n740) );
  NOR2X1 U808 ( .A(n742), .B(n743), .Y(n738) );
  OAI22X1 U809 ( .A(\regs_matrix[3][14] ), .B(n87), .C(\regs_matrix[1][14] ), 
        .D(n90), .Y(n743) );
  OAI22X1 U810 ( .A(\regs_matrix[5][14] ), .B(n787), .C(\regs_matrix[7][14] ), 
        .D(n789), .Y(n742) );
  NAND2X1 U811 ( .A(n746), .B(n747), .Y(n745) );
  NOR2X1 U812 ( .A(n748), .B(n749), .Y(n747) );
  OAI22X1 U813 ( .A(\regs_matrix[8][15] ), .B(n68), .C(\regs_matrix[10][15] ), 
        .D(n776), .Y(n749) );
  OAI22X1 U814 ( .A(\regs_matrix[12][15] ), .B(n780), .C(\regs_matrix[14][15] ), .D(n781), .Y(n748) );
  NOR2X1 U815 ( .A(n750), .B(n751), .Y(n746) );
  OAI22X1 U816 ( .A(\regs_matrix[11][15] ), .B(n87), .C(\regs_matrix[9][15] ), 
        .D(n96), .Y(n751) );
  OAI22X1 U817 ( .A(\regs_matrix[13][15] ), .B(n786), .C(\regs_matrix[15][15] ), .D(n789), .Y(n750) );
  NAND2X1 U818 ( .A(n752), .B(n753), .Y(n744) );
  NOR2X1 U819 ( .A(n754), .B(n755), .Y(n753) );
  OAI22X1 U820 ( .A(outreg_data[15]), .B(n104), .C(\regs_matrix[2][15] ), .D(
        n70), .Y(n755) );
  OAI22X1 U821 ( .A(\regs_matrix[4][15] ), .B(n780), .C(\regs_matrix[6][15] ), 
        .D(n67), .Y(n754) );
  NOR2X1 U822 ( .A(n756), .B(n757), .Y(n752) );
  OAI22X1 U823 ( .A(\regs_matrix[3][15] ), .B(n88), .C(\regs_matrix[1][15] ), 
        .D(n97), .Y(n757) );
  OAI22X1 U824 ( .A(\regs_matrix[5][15] ), .B(n787), .C(\regs_matrix[7][15] ), 
        .D(n789), .Y(n756) );
  MUX2X1 U825 ( .B(n758), .A(n759), .S(n792), .Y(r2_data[16]) );
  NAND2X1 U826 ( .A(n760), .B(n761), .Y(n759) );
  NOR2X1 U827 ( .A(n762), .B(n763), .Y(n761) );
  OAI22X1 U828 ( .A(\regs_matrix[14][16] ), .B(n781), .C(\regs_matrix[12][16] ), .D(n69), .Y(n763) );
  OAI22X1 U829 ( .A(\regs_matrix[15][16] ), .B(n789), .C(\regs_matrix[9][16] ), 
        .D(n91), .Y(n762) );
  NOR2X1 U830 ( .A(n764), .B(n765), .Y(n760) );
  OAI22X1 U831 ( .A(\regs_matrix[13][16] ), .B(n786), .C(\regs_matrix[11][16] ), .D(n88), .Y(n765) );
  OAI22X1 U832 ( .A(\regs_matrix[8][16] ), .B(n104), .C(\regs_matrix[10][16] ), 
        .D(n70), .Y(n764) );
  NAND2X1 U833 ( .A(n766), .B(n767), .Y(n758) );
  NOR2X1 U834 ( .A(n768), .B(n769), .Y(n767) );
  OAI22X1 U835 ( .A(outreg_data[16]), .B(n98), .C(\regs_matrix[2][16] ), .D(
        n776), .Y(n769) );
  NAND3X1 U836 ( .A(n770), .B(n77), .C(n771), .Y(n534) );
  OAI22X1 U837 ( .A(\regs_matrix[4][16] ), .B(n780), .C(\regs_matrix[6][16] ), 
        .D(n67), .Y(n768) );
  NOR2X1 U838 ( .A(n773), .B(n774), .Y(n766) );
  OAI22X1 U839 ( .A(\regs_matrix[3][16] ), .B(n86), .C(\regs_matrix[1][16] ), 
        .D(n93), .Y(n774) );
  NAND3X1 U840 ( .A(N14), .B(n77), .C(n770), .Y(n538) );
  OAI22X1 U841 ( .A(\regs_matrix[5][16] ), .B(n786), .C(\regs_matrix[7][16] ), 
        .D(n790), .Y(n773) );
  INVX8 U842 ( .A(n785), .Y(n786) );
  INVX8 U843 ( .A(n785), .Y(n787) );
  INVX4 U844 ( .A(n535), .Y(n777) );
  INVX4 U845 ( .A(n540), .Y(n785) );
  NAND2X1 U846 ( .A(w_sel[2]), .B(w_sel[1]), .Y(n820) );
  NAND2X1 U847 ( .A(n107), .B(w_sel[0]), .Y(n816) );
  NOR2X1 U848 ( .A(n820), .B(n816), .Y(write_enables[15]) );
  INVX2 U849 ( .A(w_sel[0]), .Y(n819) );
  NAND2X1 U850 ( .A(n107), .B(n819), .Y(n817) );
  NOR2X1 U851 ( .A(n820), .B(n817), .Y(write_enables[14]) );
  INVX2 U852 ( .A(w_sel[1]), .Y(n814) );
  NAND2X1 U853 ( .A(w_sel[2]), .B(n814), .Y(n821) );
  NOR2X1 U854 ( .A(n821), .B(n816), .Y(write_enables[13]) );
  NOR2X1 U855 ( .A(n821), .B(n817), .Y(write_enables[12]) );
  INVX2 U856 ( .A(w_sel[2]), .Y(n815) );
  NAND2X1 U857 ( .A(w_sel[1]), .B(n815), .Y(n822) );
  NOR2X1 U858 ( .A(n822), .B(n816), .Y(write_enables[11]) );
  NOR2X1 U859 ( .A(n822), .B(n817), .Y(write_enables[10]) );
  NAND2X1 U860 ( .A(n815), .B(n814), .Y(n824) );
  NOR2X1 U861 ( .A(n824), .B(n816), .Y(write_enables[9]) );
  NOR2X1 U862 ( .A(n824), .B(n817), .Y(write_enables[8]) );
  INVX2 U863 ( .A(w_sel[3]), .Y(n818) );
  NAND3X1 U864 ( .A(w_sel[0]), .B(w_en), .C(n818), .Y(n823) );
  NOR2X1 U865 ( .A(n823), .B(n820), .Y(write_enables[7]) );
  NAND3X1 U866 ( .A(w_en), .B(n819), .C(n818), .Y(n825) );
  NOR2X1 U867 ( .A(n825), .B(n820), .Y(write_enables[6]) );
  NOR2X1 U868 ( .A(n823), .B(n821), .Y(write_enables[5]) );
  NOR2X1 U869 ( .A(n825), .B(n821), .Y(write_enables[4]) );
  NOR2X1 U870 ( .A(n823), .B(n822), .Y(write_enables[3]) );
  NOR2X1 U871 ( .A(n825), .B(n822), .Y(write_enables[2]) );
  NOR2X1 U872 ( .A(n824), .B(n823), .Y(write_enables[1]) );
  NOR2X1 U873 ( .A(n825), .B(n824), .Y(write_enables[0]) );
endmodule


module datapath ( clk, n_reset, op, src1, src2, dest, ext_data1, ext_data2, 
        outreg_data, overflow );
  input [2:0] op;
  input [3:0] src1;
  input [3:0] src2;
  input [3:0] dest;
  input [15:0] ext_data1;
  input [15:0] ext_data2;
  output [16:0] outreg_data;
  input clk, n_reset;
  output overflow;
  wire   w_en, n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14,
         n15, n16, n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28,
         n29, n30, n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42,
         n43, n44, n45, n46, n47, n48, n49, n50, n51, n52, n53, n54, n55, n56,
         n57, n58, n59;
  wire   [1:0] w_data_sel;
  wire   [1:0] alu_op;
  wire   [16:0] src1_data;
  wire   [16:0] src2_data;
  wire   [16:0] alu_result;
  wire   [16:0] dest_data;

  datapath_decode DEC ( .op(op), .w_en(w_en), .w_data_sel(w_data_sel), 
        .alu_op(alu_op) );
  alu CORE ( .src1_data(src1_data), .src2_data(src2_data), .alu_op(alu_op), 
        .result(alu_result), .overflow(overflow) );
  register_file RF ( .clk(clk), .n_reset(n_reset), .w_en(w_en), .r1_sel(src1), 
        .r2_sel(src2), .w_sel(dest), .w_data({dest_data[16], n59, n58, n57, 
        n56, n55, n54, n53, n52, n51, n50, dest_data[5:0]}), .r1_data(
        src1_data), .r2_data(src2_data), .outreg_data(outreg_data) );
  AND2X2 U2 ( .A(w_data_sel[0]), .B(n18), .Y(n1) );
  INVX4 U3 ( .A(n33), .Y(n54) );
  INVX4 U4 ( .A(n39), .Y(n56) );
  INVX4 U5 ( .A(n42), .Y(n57) );
  INVX4 U6 ( .A(n45), .Y(n58) );
  INVX4 U7 ( .A(w_data_sel[1]), .Y(n2) );
  INVX4 U8 ( .A(n27), .Y(n52) );
  INVX4 U9 ( .A(n24), .Y(n51) );
  INVX4 U10 ( .A(n21), .Y(n50) );
  INVX4 U11 ( .A(n30), .Y(n53) );
  INVX4 U12 ( .A(n49), .Y(n59) );
  INVX4 U13 ( .A(n36), .Y(n55) );
  INVX8 U14 ( .A(n2), .Y(n3) );
  INVX4 U15 ( .A(n5), .Y(n46) );
  INVX2 U16 ( .A(n3), .Y(n18) );
  INVX2 U17 ( .A(alu_result[0]), .Y(n7) );
  INVX2 U18 ( .A(w_data_sel[0]), .Y(n4) );
  NAND2X1 U19 ( .A(n18), .B(n4), .Y(n5) );
  AOI22X1 U20 ( .A(ext_data2[0]), .B(n1), .C(ext_data1[0]), .D(n46), .Y(n6) );
  OAI21X1 U21 ( .A(n18), .B(n7), .C(n6), .Y(dest_data[0]) );
  INVX2 U22 ( .A(alu_result[1]), .Y(n9) );
  AOI22X1 U23 ( .A(ext_data2[1]), .B(n1), .C(ext_data1[1]), .D(n46), .Y(n8) );
  OAI21X1 U24 ( .A(n18), .B(n9), .C(n8), .Y(dest_data[1]) );
  INVX2 U25 ( .A(alu_result[2]), .Y(n11) );
  AOI22X1 U26 ( .A(ext_data2[2]), .B(n1), .C(ext_data1[2]), .D(n46), .Y(n10)
         );
  OAI21X1 U27 ( .A(n18), .B(n11), .C(n10), .Y(dest_data[2]) );
  INVX2 U28 ( .A(alu_result[3]), .Y(n13) );
  AOI22X1 U29 ( .A(ext_data2[3]), .B(n1), .C(ext_data1[3]), .D(n46), .Y(n12)
         );
  OAI21X1 U30 ( .A(n18), .B(n13), .C(n12), .Y(dest_data[3]) );
  INVX2 U31 ( .A(alu_result[4]), .Y(n15) );
  AOI22X1 U32 ( .A(ext_data2[4]), .B(n1), .C(ext_data1[4]), .D(n46), .Y(n14)
         );
  OAI21X1 U33 ( .A(n18), .B(n15), .C(n14), .Y(dest_data[4]) );
  INVX2 U34 ( .A(alu_result[5]), .Y(n17) );
  AOI22X1 U35 ( .A(ext_data2[5]), .B(n1), .C(ext_data1[5]), .D(n46), .Y(n16)
         );
  OAI21X1 U36 ( .A(n18), .B(n17), .C(n16), .Y(dest_data[5]) );
  AOI22X1 U37 ( .A(ext_data2[6]), .B(n1), .C(ext_data1[6]), .D(n46), .Y(n19)
         );
  INVX2 U38 ( .A(n19), .Y(n20) );
  OAI22X1 U39 ( .A(n3), .B(n20), .C(n20), .D(alu_result[6]), .Y(n21) );
  AOI22X1 U40 ( .A(ext_data2[7]), .B(n1), .C(ext_data1[7]), .D(n46), .Y(n22)
         );
  INVX2 U41 ( .A(n22), .Y(n23) );
  OAI22X1 U42 ( .A(n3), .B(n23), .C(n23), .D(alu_result[7]), .Y(n24) );
  AOI22X1 U43 ( .A(ext_data2[8]), .B(n1), .C(ext_data1[8]), .D(n46), .Y(n25)
         );
  INVX2 U44 ( .A(n25), .Y(n26) );
  OAI22X1 U45 ( .A(n3), .B(n26), .C(n26), .D(alu_result[8]), .Y(n27) );
  AOI22X1 U46 ( .A(ext_data2[9]), .B(n1), .C(ext_data1[9]), .D(n46), .Y(n28)
         );
  INVX2 U47 ( .A(n28), .Y(n29) );
  OAI22X1 U48 ( .A(n3), .B(n29), .C(n29), .D(alu_result[9]), .Y(n30) );
  AOI22X1 U49 ( .A(ext_data2[10]), .B(n1), .C(ext_data1[10]), .D(n46), .Y(n31)
         );
  INVX2 U50 ( .A(n31), .Y(n32) );
  OAI22X1 U51 ( .A(n3), .B(n32), .C(n32), .D(alu_result[10]), .Y(n33) );
  AOI22X1 U52 ( .A(ext_data2[11]), .B(n1), .C(ext_data1[11]), .D(n46), .Y(n34)
         );
  INVX2 U53 ( .A(n34), .Y(n35) );
  OAI22X1 U54 ( .A(n3), .B(n35), .C(n35), .D(alu_result[11]), .Y(n36) );
  AOI22X1 U55 ( .A(ext_data2[12]), .B(n1), .C(ext_data1[12]), .D(n46), .Y(n37)
         );
  INVX2 U56 ( .A(n37), .Y(n38) );
  OAI22X1 U57 ( .A(n3), .B(n38), .C(n38), .D(alu_result[12]), .Y(n39) );
  AOI22X1 U58 ( .A(ext_data2[13]), .B(n1), .C(ext_data1[13]), .D(n46), .Y(n40)
         );
  INVX2 U59 ( .A(n40), .Y(n41) );
  OAI22X1 U60 ( .A(n3), .B(n41), .C(n41), .D(alu_result[13]), .Y(n42) );
  AOI22X1 U61 ( .A(ext_data2[14]), .B(n1), .C(ext_data1[14]), .D(n46), .Y(n43)
         );
  INVX2 U62 ( .A(n43), .Y(n44) );
  OAI22X1 U63 ( .A(n3), .B(n44), .C(n44), .D(alu_result[14]), .Y(n45) );
  AOI22X1 U64 ( .A(ext_data2[15]), .B(n1), .C(ext_data1[15]), .D(n46), .Y(n47)
         );
  INVX2 U65 ( .A(n47), .Y(n48) );
  OAI22X1 U66 ( .A(n3), .B(n48), .C(n48), .D(alu_result[15]), .Y(n49) );
  AND2X2 U67 ( .A(alu_result[16]), .B(n3), .Y(dest_data[16]) );
endmodule


module fir_filter ( clk, n_reset, load_coeff, data_ready, sample_data, 
        fir_coefficient, modwait, err, fir_out );
  input [15:0] sample_data;
  input [15:0] fir_coefficient;
  output [15:0] fir_out;
  input clk, n_reset, load_coeff, data_ready;
  output modwait, err;
  wire   overflow;
  wire   [2:0] op;
  wire   [3:0] src1;
  wire   [3:0] src2;
  wire   [3:0] dest;
  wire   [16:0] outreg_data;
  wire   SYNOPSYS_UNCONNECTED__0;

  controller CONTROL ( .clk(clk), .n_rst(n_reset), .dr(data_ready), .lc(
        load_coeff), .overflow(overflow), .modwait(modwait), .op(op), .src1({
        SYNOPSYS_UNCONNECTED__0, src1[2:0]}), .src2(src2), .dest(dest), .err(
        err) );
  magnitude MAGNITUDE ( .in(outreg_data), .out(fir_out) );
  datapath DATAPATH ( .clk(clk), .n_reset(n_reset), .op(op), .src1({1'b0, 
        src1[2:0]}), .src2(src2), .dest(dest), .ext_data1(sample_data), 
        .ext_data2(fir_coefficient), .outreg_data(outreg_data), .overflow(
        overflow) );
endmodule


module ahb_lite_fir_filter ( clk, n_rst, hsel, haddr, hsize, htrans, hwrite, 
        hwdata, hrdata, hresp );
  input [3:0] haddr;
  input [1:0] htrans;
  input [15:0] hwdata;
  output [15:0] hrdata;
  input clk, n_rst, hsel, hsize, hwrite;
  output hresp;
  wire   data_ready, new_coefficient_set, modwait, err, load_coeff;
  wire   [15:0] sample_data;
  wire   [1:0] coefficient_num;
  wire   [15:0] fir_coefficient;
  wire   [15:0] fir_out;

  ahb_lite_slave SLAVE ( .clk(clk), .n_rst(n_rst), .sample_data(sample_data), 
        .data_ready(data_ready), .new_coefficient_set(new_coefficient_set), 
        .coefficient_num(coefficient_num), .fir_coefficient(fir_coefficient), 
        .modwait(modwait), .fir_out(fir_out), .err(err), .hsel(hsel), .haddr(
        haddr), .hsize(hsize), .htrans(htrans), .hwrite(hwrite), .hwdata(
        hwdata), .hrdata(hrdata), .hresp(hresp) );
  coefficient_loader LOADER ( .clk(clk), .n_reset(n_rst), 
        .new_coefficient_set(new_coefficient_set), .modwait(modwait), 
        .load_coeff(load_coeff), .coefficient_num(coefficient_num) );
  fir_filter FIR_FILTER ( .clk(clk), .n_reset(n_rst), .load_coeff(load_coeff), 
        .data_ready(data_ready), .sample_data(sample_data), .fir_coefficient(
        fir_coefficient), .modwait(modwait), .err(err), .fir_out(fir_out) );
endmodule

