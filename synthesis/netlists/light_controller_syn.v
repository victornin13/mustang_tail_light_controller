/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : O-2018.06-SP1
// Date      : Thu Oct 24 09:54:57 2024
/////////////////////////////////////////////////////////////


module light_controller ( clk, rst_n, brake, turn_right, turn_left, 
        right_taillight_control, left_taillight_control );
  output [2:0] right_taillight_control;
  output [2:0] left_taillight_control;
  input clk, rst_n, brake, turn_right, turn_left;
  wire   n198, n199, n200, n201, n202, N48, N49, N50, n3, n4, n5, n6, n7, n10,
         n12, n13, n14, n15, n16, n18, n19, n20, n22, n23, n24, n25, n26, n27,
         n28, n29, n30, n31, n32, n33, n34, n35, n37, n38, n39, n40, n41, n42,
         n43, n44, n45, n46, n48, n49, n50, n51, n52, n53, n54, n56, n57, n58,
         n59, n60, n61, n62, n63, n64, n65, n66, n68, n69, n70, n71, n72, n73,
         n74, n75, n76, n77, n78, n79, n80, n81, n82, n83, n84, n85, n86, n87,
         n88, n89, n90, n91, n92, n93, n94, n95, n96, n97, n98, n99, n100,
         n101, n102, n103, n104, n105, n106, n107, n108, n109, n110, n111,
         n112, n113, n114, n115, n116, n117, n118, n119, n120, n121, n122,
         n123, n124, n125, n126, n127, n128, n129, n130, n131, n132, n133,
         n134, n135, n136, n137, n138, n139, n140, n141, n142, n143, n144,
         n145, n146, n147, n148, n149, n150, n151, n152, n153, n154, n155,
         n156, n157, n158, n159, n160, n161, n162, n163, n164, n165, n166,
         n167, n168, n170, n172, n174, n176, n178, n180, n181, n182, n183,
         n184, n185, n186, n187, n188, n189, n190, n191, n192, n193, n194,
         n195, n196, n197;
  wire   [2:0] state;

  DFFR_E \state_reg[1]  ( .D(n70), .CLK(clk), .RN(n86), .Q(state[1]), .QBAR(
        n188) );
  DFFR_E \state_reg[2]  ( .D(n68), .CLK(clk), .RN(n85), .Q(state[2]), .QBAR(
        n186) );
  DFFR_E \counter_clk_reg[0]  ( .D(n153), .CLK(clk), .RN(n85), .Q(n75), .QBAR(
        n65) );
  DFFR_E \counter_clk_reg[1]  ( .D(N49), .CLK(clk), .RN(n86), .QBAR(n66) );
  DFFR_E \prev_inputs_reg[2]  ( .D(n81), .CLK(clk), .RN(n84), .QBAR(n61) );
  DFFR_E \prev_inputs_reg[1]  ( .D(n79), .CLK(clk), .RN(n83), .QBAR(n62) );
  DFFR_E \prev_inputs_reg[0]  ( .D(n77), .CLK(clk), .RN(n83), .QBAR(n63) );
  DFFR_E \counter_clk_reg[2]  ( .D(n116), .CLK(clk), .RN(n83), .Q(n74), .QBAR(
        n64) );
  DFFS_E \state_reg[0]  ( .D(n69), .CLK(clk), .S(n82), .Q(state[0]), .QBAR(n72) );
  INVERTBAL_E U74 ( .A(n166), .Z(n135) );
  INVERT_H U75 ( .A(state[0]), .Z(n164) );
  INVERT_F U76 ( .A(n32), .Z(n183) );
  INVERT_E U77 ( .A(n75), .Z(n107) );
  INVERT_D U78 ( .A(n128), .Z(n126) );
  INVERT_D U79 ( .A(n131), .Z(n129) );
  INVERT_E U80 ( .A(n30), .Z(n158) );
  INVERT_D U81 ( .A(n120), .Z(n118) );
  INVERT_I U82 ( .A(n125), .Z(n166) );
  INVERTBAL_J U83 ( .A(n71), .Z(n163) );
  INVERT_D U84 ( .A(n92), .Z(n90) );
  NOR2_D U85 ( .A(n28), .B(n93), .Z(n44) );
  INVERT_H U86 ( .A(n41), .Z(n162) );
  NOR2_D U87 ( .A(n124), .B(n97), .Z(n123) );
  AND2_K U88 ( .A(n26), .B(n165), .Z(n71) );
  INVERT_H U89 ( .A(n15), .Z(n125) );
  NOR2_F U90 ( .A(n142), .B(n139), .Z(n31) );
  INVERT_H U91 ( .A(n88), .Z(n89) );
  INVERT_H U92 ( .A(n97), .Z(n98) );
  NOR2_D U93 ( .A(n148), .B(n149), .Z(n144) );
  INVERT_D U94 ( .A(n53), .Z(n113) );
  NOR3_D U95 ( .A(n137), .B(n157), .C(n54), .Z(n73) );
  INVERT_H U96 ( .A(n156), .Z(n157) );
  INVERT_H U97 ( .A(turn_left), .Z(n76) );
  INVERT_K U98 ( .A(n76), .Z(n77) );
  INVERT_H U99 ( .A(turn_right), .Z(n78) );
  INVERT_I U100 ( .A(n78), .Z(n79) );
  INVERT_H U101 ( .A(brake), .Z(n80) );
  INVERT_L U102 ( .A(n80), .Z(n81) );
  INVERT_K U103 ( .A(rst_n), .Z(n82) );
  INVERT_I U104 ( .A(n82), .Z(n83) );
  INVERT_H U105 ( .A(n82), .Z(n84) );
  INVERT_F U106 ( .A(n82), .Z(n85) );
  INVERT_F U107 ( .A(n82), .Z(n86) );
  NAND2BAL_E U108 ( .A(n119), .B(n98), .Z(n199) );
  BUFFER_F U109 ( .A(n20), .Z(n87) );
  INVERT_H U110 ( .A(n44), .Z(n88) );
  INVERT_E U111 ( .A(n90), .Z(n91) );
  BUFFER_F U112 ( .A(n57), .Z(n92) );
  INVERT_K U113 ( .A(n162), .Z(n93) );
  AOI22_B U114 ( .A1(n93), .A2(n26), .B1(n89), .B2(n32), .Z(n42) );
  BUFFER_F U115 ( .A(n42), .Z(n94) );
  NOR2_C U116 ( .A(n91), .B(n96), .Z(N49) );
  NAND2_D U117 ( .A(n87), .B(n166), .Z(n69) );
  INVERT_H U118 ( .A(n56), .Z(n95) );
  INVERT_I U119 ( .A(n95), .Z(n96) );
  NAND2_E U120 ( .A(n166), .B(n140), .Z(n56) );
  INVERT_H U121 ( .A(n159), .Z(n97) );
  INVERT_H U122 ( .A(n158), .Z(n159) );
  BUFFER_F U123 ( .A(n3), .Z(n99) );
  NAND2BAL_E U124 ( .A(n101), .B(n102), .Z(n100) );
  NAND2BAL_E U125 ( .A(n22), .B(n23), .Z(n103) );
  INVERT_F U126 ( .A(n103), .Z(n101) );
  NAND2BAL_E U127 ( .A(n115), .B(n155), .Z(n104) );
  INVERT_F U128 ( .A(n104), .Z(n102) );
  INVERT_H U129 ( .A(n154), .Z(n155) );
  NOR2_C U130 ( .A(n105), .B(n106), .Z(n53) );
  INVERT_H U131 ( .A(n54), .Z(n108) );
  INVERT_F U132 ( .A(n6), .Z(n109) );
  NOR2_C U133 ( .A(n107), .B(n108), .Z(n110) );
  INVERT_E U134 ( .A(n110), .Z(n105) );
  NOR2_C U135 ( .A(n109), .B(n74), .Z(n111) );
  INVERT_E U136 ( .A(n111), .Z(n106) );
  NAND2BAL_E U137 ( .A(n18), .B(n163), .Z(n22) );
  AO21_E U138 ( .A1(n7), .A2(n143), .B(n167), .Z(n5) );
  INVERT_D U139 ( .A(n5), .Z(n112) );
  INVERT_E U140 ( .A(n122), .Z(n190) );
  INVERT_D U141 ( .A(n202), .Z(n122) );
  INVERT_E U142 ( .A(n130), .Z(n193) );
  INVERT_D U143 ( .A(n129), .Z(n130) );
  INVERT_E U144 ( .A(n127), .Z(n195) );
  INVERT_D U145 ( .A(n126), .Z(n127) );
  NOR2_D U146 ( .A(n160), .B(n139), .Z(n49) );
  INVERT_K U147 ( .A(n138), .Z(n139) );
  INVERT_H U148 ( .A(n14), .Z(n114) );
  INVERT_H U149 ( .A(n114), .Z(n115) );
  AO21_F U150 ( .A1(n25), .A2(state[2]), .B(n26), .Z(n14) );
  BUFFER_L U151 ( .A(n12), .Z(n160) );
  INVERT_F U152 ( .A(n155), .Z(n12) );
  AND3_I U153 ( .A(n58), .B(n59), .C(n60), .Z(n15) );
  XNOR2_C U154 ( .A(n7), .B(n61), .Z(n59) );
  XNOR2_C U155 ( .A(n50), .B(n63), .Z(n58) );
  OA21_F U156 ( .A1(n157), .A2(n52), .B(n113), .Z(N50) );
  INVERT_C U157 ( .A(N50), .Z(n116) );
  INVERT_F U158 ( .A(n153), .Z(n52) );
  OAI21_C U159 ( .A1(n38), .A2(n48), .B(n49), .Z(n43) );
  INVERT_D U160 ( .A(n93), .Z(n48) );
  BUFFER_F U161 ( .A(n45), .Z(n117) );
  AOI22_B U162 ( .A1(n35), .A2(n89), .B1(n32), .B2(n93), .Z(n45) );
  INVERT_E U163 ( .A(n118), .Z(n119) );
  BUFFER_F U164 ( .A(n34), .Z(n120) );
  AOI22_B U165 ( .A1(n35), .A2(n31), .B1(n139), .B2(n32), .Z(n34) );
  AOI22_B U166 ( .A1(n13), .A2(n100), .B1(n6), .B2(n165), .Z(n20) );
  AOI22_D U167 ( .A1(n132), .A2(n81), .B1(n160), .B2(n13), .Z(n4) );
  INVERT_J U168 ( .A(n140), .Z(n13) );
  BUFFER_F U169 ( .A(n10), .Z(n121) );
  OAI21_C U170 ( .A1(n7), .A2(n163), .B(n143), .Z(n16) );
  AOI22_B U171 ( .A1(n13), .A2(n16), .B1(n6), .B2(n189), .Z(n10) );
  OA21_F U172 ( .A1(n37), .A2(n88), .B(n161), .Z(n202) );
  NOR2_C U173 ( .A(n184), .B(n37), .Z(n124) );
  OAI21_D U174 ( .A1(n189), .A2(n19), .B(n165), .Z(n37) );
  NAND3_D U175 ( .A(n142), .B(n7), .C(n28), .Z(n23) );
  AND2_H U176 ( .A(n29), .B(n98), .Z(n197) );
  NAND2_D U177 ( .A(n121), .B(n4), .Z(n70) );
  NAND2_D U178 ( .A(n99), .B(n4), .Z(n68) );
  AOI22_B U179 ( .A1(n189), .A2(n112), .B1(n6), .B2(state[2]), .Z(n3) );
  AOI21_E U180 ( .A1(n142), .A2(n28), .B(n81), .Z(n18) );
  XNOR2_B U181 ( .A(n75), .B(n54), .Z(n57) );
  XNOR2_C U182 ( .A(n51), .B(n62), .Z(n60) );
  INVERT_J U183 ( .A(n79), .Z(n51) );
  BUFFER_F U184 ( .A(n201), .Z(n128) );
  NAND2_D U185 ( .A(n117), .B(n161), .Z(n201) );
  BUFFER_F U186 ( .A(n200), .Z(n131) );
  NAND2_D U187 ( .A(n94), .B(n161), .Z(n200) );
  INVERT_E U188 ( .A(n26), .Z(n185) );
  INVERT_E U189 ( .A(n133), .Z(n132) );
  NOR2_C U190 ( .A(n115), .B(n167), .Z(n134) );
  NOR2_C U191 ( .A(n134), .B(n135), .Z(n133) );
  INVERT_H U192 ( .A(n65), .Z(n136) );
  INVERT_H U193 ( .A(n136), .Z(n137) );
  INVERT_H U194 ( .A(n33), .Z(n138) );
  NOR2_D U195 ( .A(n142), .B(n7), .Z(n33) );
  INVERT_I U196 ( .A(n188), .Z(n189) );
  INVERT_I U197 ( .A(n73), .Z(n140) );
  INVERT_H U198 ( .A(n27), .Z(n141) );
  INVERT_K U199 ( .A(n141), .Z(n142) );
  NAND2BAL_E U200 ( .A(n79), .B(n50), .Z(n27) );
  INVERT_F U201 ( .A(n144), .Z(n143) );
  INVERT_H U202 ( .A(n19), .Z(n145) );
  INVERT_D U203 ( .A(n166), .Z(n146) );
  INVERT_F U204 ( .A(n18), .Z(n147) );
  NOR2_C U205 ( .A(n145), .B(n146), .Z(n150) );
  INVERT_E U206 ( .A(n150), .Z(n148) );
  NOR2_C U207 ( .A(n147), .B(n72), .Z(n151) );
  INVERT_E U208 ( .A(n151), .Z(n149) );
  INVERT_K U209 ( .A(n164), .Z(n165) );
  INVERT_E U210 ( .A(N48), .Z(n152) );
  INVERT_F U211 ( .A(n152), .Z(n153) );
  NOR2_C U212 ( .A(n136), .B(n96), .Z(N48) );
  INVERT_E U213 ( .A(n24), .Z(n154) );
  NAND3_C U214 ( .A(n50), .B(n51), .C(n81), .Z(n24) );
  INVERT_H U215 ( .A(n64), .Z(n156) );
  INVERT_K U216 ( .A(n187), .Z(n19) );
  OA21_H U217 ( .A1(n38), .A2(n39), .B(n40), .Z(n30) );
  NOR2_C U218 ( .A(n160), .B(n93), .Z(n40) );
  CLKI_O U219 ( .A(n43), .Z(n161) );
  NOR2_D U220 ( .A(n28), .B(n7), .Z(n41) );
  NAND3_E U221 ( .A(n46), .B(n19), .C(n25), .Z(n38) );
  INVERT_I U222 ( .A(n165), .Z(n25) );
  NAND2_I U223 ( .A(n77), .B(n51), .Z(n28) );
  INVERT_I U224 ( .A(n96), .Z(n6) );
  INVERT_F U225 ( .A(n13), .Z(n167) );
  INVERT_I U226 ( .A(n66), .Z(n54) );
  INVERT_I U227 ( .A(n77), .Z(n50) );
  INVERT_J U228 ( .A(n191), .Z(n168) );
  INVERT_O U229 ( .A(n168), .Z(left_taillight_control[0]) );
  INVERT_F U230 ( .A(n190), .Z(n191) );
  INVERT_J U231 ( .A(n192), .Z(n170) );
  INVERT_O U232 ( .A(n170), .Z(right_taillight_control[0]) );
  INVERT_F U233 ( .A(n123), .Z(n192) );
  INVERT_J U234 ( .A(n194), .Z(n172) );
  INVERT_O U235 ( .A(n172), .Z(left_taillight_control[2]) );
  INVERT_F U236 ( .A(n193), .Z(n194) );
  INVERT_J U237 ( .A(n196), .Z(n174) );
  INVERT_O U238 ( .A(n174), .Z(left_taillight_control[1]) );
  INVERT_F U239 ( .A(n195), .Z(n196) );
  INVERT_J U240 ( .A(n199), .Z(n176) );
  INVERT_O U241 ( .A(n176), .Z(right_taillight_control[1]) );
  NOR2_E U242 ( .A(n46), .B(n25), .Z(n35) );
  INVERT_J U243 ( .A(state[1]), .Z(n46) );
  INVERT_F U244 ( .A(n139), .Z(n39) );
  INVERT_J U245 ( .A(n198), .Z(n178) );
  INVERT_O U246 ( .A(n178), .Z(right_taillight_control[2]) );
  BUFFER_H U247 ( .A(n197), .Z(n180) );
  NOR2_C U248 ( .A(n181), .B(n182), .Z(n29) );
  INVERT_F U249 ( .A(n31), .Z(n184) );
  NOR2_C U250 ( .A(n183), .B(n184), .Z(n181) );
  NOR2_C U251 ( .A(n185), .B(n39), .Z(n182) );
  INVERT_F U252 ( .A(n180), .Z(n198) );
  INVERT_I U253 ( .A(n163), .Z(n32) );
  NOR2_H U254 ( .A(n46), .B(n19), .Z(n26) );
  INVERT_H U255 ( .A(n186), .Z(n187) );
  INVERT_K U256 ( .A(n81), .Z(n7) );
endmodule

