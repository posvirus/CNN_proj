module Ring_Oscillator(
input rst_n,
input clk_signal_ext,
input scan_clk_sel,
input scan_clk_start,
input [2:0] scan_tap_sel,
input [1:0] scan_internal_div_sel,
output clk_out,
output clk_div10_out
);

 // input rst_n;
 // input scan_clk_sel;
 // input clk_signal_ext; 
 // input [2:0] scan_tap_sel;
 // input [1:0] scan_internal_div_sel;
 // input scan_clk_start;
 // output clk_out;
 // output clk_div10_out;
  
  //scan start
  SVN_ND2_2 X0 ( .A1(tap_out), .A2(scan_clk_start), .X(tc_0) );
  
  //CKB SVT
  SVN_BUF_S_2 Xring_coarse_1_1 ( .A(tc_0), .X(tc_1) );
  SVN_BUF_S_2 Xring_coarse_1_2 ( .A(tc_0), .X(tc_1_tmp2) );
  SVN_BUF_S_2 Xring_coarse_1_3 ( .A(tc_0), .X(tc_1_tmp3) );
  SVN_BUF_S_2 Xring_coarse_1_4 ( .A(tc_0), .X(tc_1_tmp4) );

//  SVN_BUF_S_2 Xring_coarse_2_1 ( .A(tc_1), .X(tc_2) );
//  SVN_BUF_S_2 Xring_coarse_2_2 ( .A(tc_1), .X(tc_2_tmp2) );
//  SVN_BUF_S_2 Xring_coarse_2_3 ( .A(tc_1), .X(tc_2_tmp3) );
//  SVN_BUF_S_2 Xring_coarse_2_4 ( .A(tc_1), .X(tc_2_tmp4) );
//
//  SVN_BUF_S_2 Xring_coarse_3_1 ( .A(tc_2), .X(tc_3) );
//  SVN_BUF_S_2 Xring_coarse_3_2 ( .A(tc_2), .X(tc_3_tmp2) );
//  SVN_BUF_S_2 Xring_coarse_3_3 ( .A(tc_2), .X(tc_3_tmp3) );
//  SVN_BUF_S_2 Xring_coarse_3_4 ( .A(tc_2), .X(tc_3_tmp4) );
//
//  SVN_BUF_S_2 Xring_coarse_4_1 ( .A(tc_3), .X(tc_4) );
//  SVN_BUF_S_2 Xring_coarse_4_2 ( .A(tc_3), .X(tc_4_tmp2) );
//  SVN_BUF_S_2 Xring_coarse_4_3 ( .A(tc_3), .X(tc_4_tmp3) );
//  SVN_BUF_S_2 Xring_coarse_4_4 ( .A(tc_3), .X(tc_4_tmp4) );
//
//  SVN_BUF_S_2 Xring_coarse_5_1 ( .A(tc_4), .X(tc_5) );
//  SVN_BUF_S_2 Xring_coarse_5_2 ( .A(tc_4), .X(tc_5_tmp2) );
//  SVN_BUF_S_2 Xring_coarse_5_3 ( .A(tc_4), .X(tc_5_tmp3) );
//  SVN_BUF_S_2 Xring_coarse_5_4 ( .A(tc_4), .X(tc_5_tmp4) );
//
//  SVN_BUF_S_2 Xring_coarse_6_1 ( .A(tc_5), .X(tc_6) );
//  SVN_BUF_S_2 Xring_coarse_6_2 ( .A(tc_5), .X(tc_6_tmp2) );
//  SVN_BUF_S_2 Xring_coarse_6_3 ( .A(tc_5), .X(tc_6_tmp3) );
//  SVN_BUF_S_2 Xring_coarse_6_4 ( .A(tc_5), .X(tc_6_tmp4) );  
//
//  SVN_BUF_S_2 Xring_coarse_7_1 ( .A(tc_6), .X(tc_7) );
//  SVN_BUF_S_2 Xring_coarse_7_2 ( .A(tc_6), .X(tc_7_tmp2) );
//  SVN_BUF_S_2 Xring_coarse_7_3 ( .A(tc_6), .X(tc_7_tmp3) );
//  SVN_BUF_S_2 Xring_coarse_7_4 ( .A(tc_6), .X(tc_7_tmp4) );
//
//  SVN_BUF_S_2 Xring_coarse_8_1 ( .A(tc_7), .X(tc_8) );
//  SVN_BUF_S_2 Xring_coarse_8_2 ( .A(tc_7), .X(tc_8_tmp2) );
//  SVN_BUF_S_2 Xring_coarse_8_3 ( .A(tc_7), .X(tc_8_tmp3) );
//  SVN_BUF_S_2 Xring_coarse_8_4 ( .A(tc_7), .X(tc_8_tmp4) );

  SVN_BUF_S_2 Xring_coarse_9_1 ( .A(tc_1), .X(tc_9) );
  SVN_BUF_S_2 Xring_coarse_9_2 ( .A(tc_1), .X(tc_9_tmp2) );
  SVN_BUF_S_2 Xring_coarse_9_3 ( .A(tc_1), .X(tc_9_tmp3) );
  SVN_BUF_S_2 Xring_coarse_9_4 ( .A(tc_1), .X(tc_9_tmp4) );

  SVN_BUF_S_2 Xring_coarse_10_1 ( .A(tc_9), .X(tc_10) );
  SVN_BUF_S_2 Xring_coarse_10_2 ( .A(tc_9), .X(tc_10_tmp2) );
  SVN_BUF_S_2 Xring_coarse_10_3 ( .A(tc_9), .X(tc_10_tmp3) );
  SVN_BUF_S_2 Xring_coarse_10_4 ( .A(tc_9), .X(tc_10_tmp4) );

  SVN_BUF_S_2 Xring_coarse_11_1 ( .A(tc_10), .X(tc_11) );
  SVN_BUF_S_2 Xring_coarse_11_2 ( .A(tc_10), .X(tc_11_tmp2) );
  SVN_BUF_S_2 Xring_coarse_11_3 ( .A(tc_10), .X(tc_11_tmp3) );
  SVN_BUF_S_2 Xring_coarse_11_4 ( .A(tc_10), .X(tc_11_tmp4) );

  SVN_BUF_S_2 Xring_coarse_12_1 ( .A(tc_11), .X(tc_12) );
  SVN_BUF_S_2 Xring_coarse_12_2 ( .A(tc_11), .X(tc_12_tmp2) );
  SVN_BUF_S_2 Xring_coarse_12_3 ( .A(tc_11), .X(tc_12_tmp3) );
  SVN_BUF_S_2 Xring_coarse_12_4 ( .A(tc_11), .X(tc_12_tmp4) );

  SVN_BUF_S_2 Xring_coarse_13_1 ( .A(tc_12), .X(tc_13) );
  SVN_BUF_S_2 Xring_coarse_13_2 ( .A(tc_12), .X(tc_13_tmp2) );
  SVN_BUF_S_2 Xring_coarse_13_3 ( .A(tc_12), .X(tc_13_tmp3) );
  SVN_BUF_S_2 Xring_coarse_13_4 ( .A(tc_12), .X(tc_13_tmp4) );

  SVN_BUF_S_2 Xring_coarse_14_1 ( .A(tc_13), .X(tc_14) );
  SVN_BUF_S_2 Xring_coarse_14_2 ( .A(tc_13), .X(tc_14_tmp2) );
  SVN_BUF_S_2 Xring_coarse_14_3 ( .A(tc_13), .X(tc_14_tmp3) );
  SVN_BUF_S_2 Xring_coarse_14_4 ( .A(tc_13), .X(tc_14_tmp4) );

  SVN_BUF_S_2 Xring_coarse_15_1 ( .A(tc_14), .X(tc_15) );
  SVN_BUF_S_2 Xring_coarse_15_2 ( .A(tc_14), .X(tc_15_tmp2) );
  SVN_BUF_S_2 Xring_coarse_15_3 ( .A(tc_14), .X(tc_15_tmp3) );
  SVN_BUF_S_2 Xring_coarse_15_4 ( .A(tc_14), .X(tc_15_tmp4) );

  SVN_BUF_S_2 Xring_coarse_16_1 ( .A(tc_15), .X(tc_16) );
  SVN_BUF_S_2 Xring_coarse_16_2 ( .A(tc_15), .X(tc_16_tmp2) );
  SVN_BUF_S_2 Xring_coarse_16_3 ( .A(tc_15), .X(tc_16_tmp3) );
  SVN_BUF_S_2 Xring_coarse_16_4 ( .A(tc_15), .X(tc_16_tmp4) );

  SVN_BUF_S_2 Xring_coarse_17_1 ( .A(tc_16), .X(tc_17) );
  SVN_BUF_S_2 Xring_coarse_17_2 ( .A(tc_16), .X(tc_17_tmp2) );
  SVN_BUF_S_2 Xring_coarse_17_3 ( .A(tc_16), .X(tc_17_tmp3) );
  SVN_BUF_S_2 Xring_coarse_17_4 ( .A(tc_16), .X(tc_17_tmp4) );
  
  SVN_BUF_S_2 Xring_coarse_18_1 ( .A(tc_17), .X(tc_18) );
  SVN_BUF_S_2 Xring_coarse_18_2 ( .A(tc_17), .X(tc_18_tmp2) );
  SVN_BUF_S_2 Xring_coarse_18_3 ( .A(tc_17), .X(tc_18_tmp3) );
  SVN_BUF_S_2 Xring_coarse_18_4 ( .A(tc_17), .X(tc_18_tmp4) );

  SVN_BUF_S_2 Xring_coarse_19_1 ( .A(tc_18), .X(tc_19) );
  SVN_BUF_S_2 Xring_coarse_19_2 ( .A(tc_18), .X(tc_19_tmp2) );
  SVN_BUF_S_2 Xring_coarse_19_3 ( .A(tc_18), .X(tc_19_tmp3) );
  SVN_BUF_S_2 Xring_coarse_19_4 ( .A(tc_18), .X(tc_19_tmp4) );
  
  //MUX
  SVN_MUX2_1 XPA_C_MUX0 ( .D0(tc_9),   .D1(tc_13), .S(scan_tap_sel[2]), .X(pac_mux_out_0) );
  SVN_MUX2_1 XPA_C_MUX1 ( .D0(tc_10),  .D1(tc_14), .S(scan_tap_sel[2]), .X(pac_mux_out_1) );
  SVN_MUX2_1 XPA_C_MUX2 ( .D0(tc_11),  .D1(tc_15), .S(scan_tap_sel[2]), .X(pac_mux_out_2) );
  SVN_MUX2_1 XPA_C_MUX3 ( .D0(tc_12),  .D1(tc_16), .S(scan_tap_sel[2]), .X(pac_mux_out_3) );
  SVN_MUX2_1 XPA_C_MUX4 ( .D0(pac_mux_out_0), .D1(pac_mux_out_2), .S(scan_tap_sel[1]), .X(pac_mux_out_4) );
  SVN_MUX2_1 XPA_C_MUX5 ( .D0(pac_mux_out_1), .D1(pac_mux_out_3),.S(scan_tap_sel[1]), .X(pac_mux_out_5) );
  SVN_MUX2_1 XPA_C_MUX6 ( .D0(pac_mux_out_4), .D1(pac_mux_out_5), .S(scan_tap_sel[0]), .X(tap_out) );

  //OUT BUFFER
  SVN_BUF_S_2 XOUTBUF ( .A(clk_os_no_buf), .X(clk_out) );

  //DIV1/2/4/8
 SVN_FDPRBQ_F_1 XDIV00 ( .CK(tap_out), .D(clk_ro_b), .Q(clk_ro),.RD(rst_n) );
  SVN_INV_1 XIV00 ( .A(clk_ro), .X(clk_ro_b) );
 SVN_FDPRBQ_F_1 XDIV01 ( .CK(clk_ro), .D(clk_ro2_b), .Q(clk_ro2),.RD(rst_n) );
  SVN_INV_1 XIV01 ( .A(clk_ro2), .X(clk_ro2_b) );
 SVN_FDPRBQ_F_1 XDIV02 ( .CK(clk_ro2), .D(clk_ro3_b), .Q(clk_ro3),.RD(rst_n) );
  SVN_INV_1 XIV02 ( .A(clk_ro3), .X(clk_ro3_b) );


  //DIV1024
 SVN_FDPRBQ_F_1 XDIV03 ( .CK(clk_out), .D(clk_ro4_b), .Q(clk_ro4),.RD(rst_n) );
  SVN_INV_1 XIV03 ( .A(clk_ro4), .X(clk_ro4_b) );
 SVN_FDPRBQ_F_1 XDIV04 ( .CK(clk_ro4), .D(clk_ro5_b), .Q(clk_ro5),.RD(rst_n) );
  SVN_INV_1 XIV04 ( .A(clk_ro5), .X(clk_ro5_b) );
 SVN_FDPRBQ_F_1 XDIV05 ( .CK(clk_ro5), .D(clk_ro6_b), .Q(clk_ro6),.RD(rst_n) );
  SVN_INV_1 XIV05 ( .A(clk_ro6), .X(clk_ro6_b) );
 SVN_FDPRBQ_F_1 XDIV06 ( .CK(clk_ro6), .D(clk_ro7_b), .Q(clk_ro7),.RD(rst_n) );
  SVN_INV_1 XIV06 ( .A(clk_ro7), .X(clk_ro7_b) );
 SVN_FDPRBQ_F_1 XDIV07 ( .CK(clk_ro7), .D(clk_ro8_b), .Q(clk_ro8),.RD(rst_n) );
  SVN_INV_1 XIV07 ( .A(clk_ro8), .X(clk_ro8_b) );
 SVN_FDPRBQ_F_1 XDIV08 ( .CK(clk_ro8), .D(clk_ro9_b), .Q(clk_ro9),.RD(rst_n) );
  SVN_INV_1 XIV08 ( .A(clk_ro9), .X(clk_ro9_b) );
 SVN_FDPRBQ_F_1 XDIV09 ( .CK(clk_ro9), .D(clk_ro10_b), .Q(clk_ro10),.RD(rst_n) );
  SVN_INV_1 XIV09 ( .A(clk_ro10), .X(clk_ro10_b) );
 SVN_FDPRBQ_F_1 XDIV10 ( .CK(clk_ro10), .D(clk_ro11_b), .Q(clk_ro11),.RD(rst_n) );
  SVN_INV_1 XIV10 ( .A(clk_ro11), .X(clk_ro11_b) );
 SVN_FDPRBQ_F_1 XDIV11 ( .CK(clk_ro11), .D(clk_ro12_b), .Q(clk_ro12),.RD(rst_n) );
  SVN_INV_1 XIV11 ( .A(clk_ro12), .X(clk_ro12_b) );
 SVN_FDPRBQ_F_1 XDIV12 ( .CK(clk_ro12), .D(clk_ro13_b), .Q(clk_div10_out),.RD(rst_n) );
  SVN_INV_1 XIV12 ( .A(clk_div10_out), .X(clk_ro13_b) );

  //INTERNAL DIV SEL
  SVN_MUX2_1 CLKMUX_0_1 ( .D0(tap_out), .D1(clk_ro), .S(scan_internal_div_sel[0]), .X(clk_ro_0_1) );
  SVN_MUX2_1 CLKMUX_0_2 ( .D0(clk_ro2), .D1(clk_ro3), .S(scan_internal_div_sel[0]), .X(clk_ro_2_3) );
  SVN_MUX2_1 CLKMUX_1_0 ( .D0(clk_ro_0_1), .D1(clk_ro_2_3), .S(scan_internal_div_sel[1]), .X(clk_os_no_buf_IN) );

  //INTERNALEXTERNAL CLK SEL
  SVN_MUX2_1 CLK_MUX_EXT ( .D0(clk_os_no_buf_IN), .D1(clk_signal_ext), .S(scan_clk_sel), .X(clk_os_no_buf) );
endmodule
