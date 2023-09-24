//SCAN CELLS FOR ST 65

module so_bit( phi, phib, scan_i0o1, load, scan_in, chip_out, phi_out, phib_out, scan_i0o1_out, load_out, scan_out);

   input   phi;              // Latch positive phase
   input   phib;             // latch negative phase
   input   scan_i0o1;        // Select scan_in/chip_out 0:scan_in, 1:scan_out
   input   load;             // Load chip_in latch
   input   scan_in;          // Serial scan in
   input   chip_out;         // Data from chip to scan out

   output  phi_out;          // verification signal
   output  phib_out;         // verification signal
   output  scan_i0o1_out;    // verification signal
   output  load_out;         // verification signal
   output  scan_out;         // Serial scan out

   wire    latch_in;
   wire    latch_out;
   wire    scan_out_int;

   SVN_BUF_6  buf_phi  (.X(phi_out),       .A(phi));
   SVN_BUF_6  buf_phib (.X(phib_out),      .A(phib));
   SVN_BUF_6  buf_mode (.X(scan_i0o1_out), .A(scan_i0o1));
   SVN_BUF_6  buf_load (.X(load_out),      .A(load));
   SVN_MUX2_1   mx       (.X(latch_in),      .D0(scan_in),     .D1(chip_out),      .S(scan_i0o1));
   SVN_LDPQ_1    flip     (.Q(latch_out),     .D(latch_in),     .G(phi));
   SVN_LDPQ_1    flop     (.Q(scan_out_int),  .D(latch_out),    .G(phib));
   SVN_BUF_6  buf_sout (.X(scan_out),      .A(scan_out_int));

endmodule // scan_out_bit

// Scan in with output latch
module si_bit( phi, phib, scan_i0o1, load, scan_in, phi_out, phib_out, scan_i0o1_out, load_out, scan_out, chip_in);

   input   phi;              // Latch positive phase
   input   phib;             // latch negative phase
   input   scan_i0o1;        // Select scan in/out
   input   load;             // Load chip_in latch
   input   scan_in;          // Serial scan in

   output  phi_out;          // verification signal
   output  phib_out;         // verification signal
   output  scan_i0o1_out;    // verification signal
   output  load_out;         // verification signal
   output  scan_out;         // Serial scan out
   output  chip_in;          // Input to the chip

   wire    latch_in;
   wire    latch_out;
   wire    scan_out_int;
   wire    chip_in_int;

   SVN_BUF_6  buf_phi     (.X(phi_out),       .A(phi));
   SVN_BUF_6  buf_phib    (.X(phib_out),      .A(phib));
   SVN_BUF_6  buf_mode    (.X(scan_i0o1_out), .A(scan_i0o1));
   SVN_BUF_6  buf_load    (.X(load_out),      .A(load));
   SVN_MUX2_1   mx          (.X(latch_in),      .D0(scan_in),       .D1(chip_in_int), .S(scan_i0o1));
   SVN_LDPQ_1 flip        (.Q(latch_out),     .D(latch_in),       .G(phi));
   SVN_LDPQ_1    flop        (.Q(scan_out_int),  .D(latch_out),      .G(phib));
   SVN_BUF_6  buf_sout    (.X(scan_out),      .A(scan_out_int));
   SVN_LDPQ_1    latch_chip  (.Q(chip_in_int),   .D(scan_out_int),   .G(load));
   SVN_BUF_6  buf_chip_in (.X(chip_in),       .A(chip_in_int));

endmodule

//Scan chain module
module scan_chain_tt(scan_clk_sel, scan_clk_start, scan_tap_sel, scan_internal_div_sel, scan_i, bias_i, data_w, addr_w, sta, res_sel_1, res_sel_2, res_sel_3, conv1_res_test, conv2_res_test, conv3_res_test, data1_o, data2_o, circ_inter, phi, phib, scan_i0o1, load, scan_in, scan_out, phi_out, phib_out, scan_i0o1_out, load_out );
output scan_clk_sel;
output scan_clk_start;
output [2:0] scan_tap_sel;
output [1:0] scan_internal_div_sel;
output [39:0] scan_i;
output [23:0] bias_i;
output [71:0] data_w;
output [9:0] addr_w;
output sta;
output [11:0] res_sel_1;
output [10:0] res_sel_2;
output [10:0] res_sel_3;
input [7:0] conv1_res_test;
input [7:0] conv2_res_test;
input [7:0] conv3_res_test;
input [7:0] data1_o;
input [7:0] data2_o;
input [9:0] circ_inter;
wire [237:0] phi_int, phib_int, scan_i0o1_int, load_int, scan_int;
input phi, phib, scan_i0o1, load, scan_in;
output phi_out, phib_out, scan_i0o1_out, load_out;
output scan_out;

si_bit scan_cell_0_0(.phi(phi),.phib(phib),
.scan_i0o1(scan_i0o1),.load(load),.scan_in(scan_in),
.phi_out(phi_int[0]),.phib_out(phib_int[0]),.scan_i0o1_out(scan_i0o1_int[0]),
.load_out(load_int[0]),.scan_out(scan_int[0]),.chip_in(scan_clk_sel));


si_bit scan_cell_1_0(.phi(phi_int[0]),.phib(phib_int[0]),
.scan_i0o1(scan_i0o1_int[0]),.load(load_int[0]),.scan_in(scan_int[0]),
.phi_out(phi_int[1]),.phib_out(phib_int[1]),.scan_i0o1_out(scan_i0o1_int[1]),
.load_out(load_int[1]),.scan_out(scan_int[1]),.chip_in(scan_clk_start));


si_bit scan_cell_2_0(.phi(phi_int[1]),.phib(phib_int[1]),
.scan_i0o1(scan_i0o1_int[1]),.load(load_int[1]),.scan_in(scan_int[1]),
.phi_out(phi_int[2]),.phib_out(phib_int[2]),.scan_i0o1_out(scan_i0o1_int[2]),
.load_out(load_int[2]),.scan_out(scan_int[2]),.chip_in(scan_tap_sel[0]));


si_bit scan_cell_2_1(.phi(phi_int[2]),.phib(phib_int[2]),
.scan_i0o1(scan_i0o1_int[2]),.load(load_int[2]),.scan_in(scan_int[2]),
.phi_out(phi_int[3]),.phib_out(phib_int[3]),.scan_i0o1_out(scan_i0o1_int[3]),
.load_out(load_int[3]),.scan_out(scan_int[3]),.chip_in(scan_tap_sel[1]));


si_bit scan_cell_2_2(.phi(phi_int[3]),.phib(phib_int[3]),
.scan_i0o1(scan_i0o1_int[3]),.load(load_int[3]),.scan_in(scan_int[3]),
.phi_out(phi_int[4]),.phib_out(phib_int[4]),.scan_i0o1_out(scan_i0o1_int[4]),
.load_out(load_int[4]),.scan_out(scan_int[4]),.chip_in(scan_tap_sel[2]));


si_bit scan_cell_3_0(.phi(phi_int[4]),.phib(phib_int[4]),
.scan_i0o1(scan_i0o1_int[4]),.load(load_int[4]),.scan_in(scan_int[4]),
.phi_out(phi_int[5]),.phib_out(phib_int[5]),.scan_i0o1_out(scan_i0o1_int[5]),
.load_out(load_int[5]),.scan_out(scan_int[5]),.chip_in(scan_internal_div_sel[0]));


si_bit scan_cell_3_1(.phi(phi_int[5]),.phib(phib_int[5]),
.scan_i0o1(scan_i0o1_int[5]),.load(load_int[5]),.scan_in(scan_int[5]),
.phi_out(phi_int[6]),.phib_out(phib_int[6]),.scan_i0o1_out(scan_i0o1_int[6]),
.load_out(load_int[6]),.scan_out(scan_int[6]),.chip_in(scan_internal_div_sel[1]));


si_bit scan_cell_4_0(.phi(phi_int[6]),.phib(phib_int[6]),
.scan_i0o1(scan_i0o1_int[6]),.load(load_int[6]),.scan_in(scan_int[6]),
.phi_out(phi_int[7]),.phib_out(phib_int[7]),.scan_i0o1_out(scan_i0o1_int[7]),
.load_out(load_int[7]),.scan_out(scan_int[7]),.chip_in(scan_i[0]));


si_bit scan_cell_4_1(.phi(phi_int[7]),.phib(phib_int[7]),
.scan_i0o1(scan_i0o1_int[7]),.load(load_int[7]),.scan_in(scan_int[7]),
.phi_out(phi_int[8]),.phib_out(phib_int[8]),.scan_i0o1_out(scan_i0o1_int[8]),
.load_out(load_int[8]),.scan_out(scan_int[8]),.chip_in(scan_i[1]));


si_bit scan_cell_4_2(.phi(phi_int[8]),.phib(phib_int[8]),
.scan_i0o1(scan_i0o1_int[8]),.load(load_int[8]),.scan_in(scan_int[8]),
.phi_out(phi_int[9]),.phib_out(phib_int[9]),.scan_i0o1_out(scan_i0o1_int[9]),
.load_out(load_int[9]),.scan_out(scan_int[9]),.chip_in(scan_i[2]));


si_bit scan_cell_4_3(.phi(phi_int[9]),.phib(phib_int[9]),
.scan_i0o1(scan_i0o1_int[9]),.load(load_int[9]),.scan_in(scan_int[9]),
.phi_out(phi_int[10]),.phib_out(phib_int[10]),.scan_i0o1_out(scan_i0o1_int[10]),
.load_out(load_int[10]),.scan_out(scan_int[10]),.chip_in(scan_i[3]));


si_bit scan_cell_4_4(.phi(phi_int[10]),.phib(phib_int[10]),
.scan_i0o1(scan_i0o1_int[10]),.load(load_int[10]),.scan_in(scan_int[10]),
.phi_out(phi_int[11]),.phib_out(phib_int[11]),.scan_i0o1_out(scan_i0o1_int[11]),
.load_out(load_int[11]),.scan_out(scan_int[11]),.chip_in(scan_i[4]));


si_bit scan_cell_4_5(.phi(phi_int[11]),.phib(phib_int[11]),
.scan_i0o1(scan_i0o1_int[11]),.load(load_int[11]),.scan_in(scan_int[11]),
.phi_out(phi_int[12]),.phib_out(phib_int[12]),.scan_i0o1_out(scan_i0o1_int[12]),
.load_out(load_int[12]),.scan_out(scan_int[12]),.chip_in(scan_i[5]));


si_bit scan_cell_4_6(.phi(phi_int[12]),.phib(phib_int[12]),
.scan_i0o1(scan_i0o1_int[12]),.load(load_int[12]),.scan_in(scan_int[12]),
.phi_out(phi_int[13]),.phib_out(phib_int[13]),.scan_i0o1_out(scan_i0o1_int[13]),
.load_out(load_int[13]),.scan_out(scan_int[13]),.chip_in(scan_i[6]));


si_bit scan_cell_4_7(.phi(phi_int[13]),.phib(phib_int[13]),
.scan_i0o1(scan_i0o1_int[13]),.load(load_int[13]),.scan_in(scan_int[13]),
.phi_out(phi_int[14]),.phib_out(phib_int[14]),.scan_i0o1_out(scan_i0o1_int[14]),
.load_out(load_int[14]),.scan_out(scan_int[14]),.chip_in(scan_i[7]));


si_bit scan_cell_4_8(.phi(phi_int[14]),.phib(phib_int[14]),
.scan_i0o1(scan_i0o1_int[14]),.load(load_int[14]),.scan_in(scan_int[14]),
.phi_out(phi_int[15]),.phib_out(phib_int[15]),.scan_i0o1_out(scan_i0o1_int[15]),
.load_out(load_int[15]),.scan_out(scan_int[15]),.chip_in(scan_i[8]));


si_bit scan_cell_4_9(.phi(phi_int[15]),.phib(phib_int[15]),
.scan_i0o1(scan_i0o1_int[15]),.load(load_int[15]),.scan_in(scan_int[15]),
.phi_out(phi_int[16]),.phib_out(phib_int[16]),.scan_i0o1_out(scan_i0o1_int[16]),
.load_out(load_int[16]),.scan_out(scan_int[16]),.chip_in(scan_i[9]));


si_bit scan_cell_4_10(.phi(phi_int[16]),.phib(phib_int[16]),
.scan_i0o1(scan_i0o1_int[16]),.load(load_int[16]),.scan_in(scan_int[16]),
.phi_out(phi_int[17]),.phib_out(phib_int[17]),.scan_i0o1_out(scan_i0o1_int[17]),
.load_out(load_int[17]),.scan_out(scan_int[17]),.chip_in(scan_i[10]));


si_bit scan_cell_4_11(.phi(phi_int[17]),.phib(phib_int[17]),
.scan_i0o1(scan_i0o1_int[17]),.load(load_int[17]),.scan_in(scan_int[17]),
.phi_out(phi_int[18]),.phib_out(phib_int[18]),.scan_i0o1_out(scan_i0o1_int[18]),
.load_out(load_int[18]),.scan_out(scan_int[18]),.chip_in(scan_i[11]));


si_bit scan_cell_4_12(.phi(phi_int[18]),.phib(phib_int[18]),
.scan_i0o1(scan_i0o1_int[18]),.load(load_int[18]),.scan_in(scan_int[18]),
.phi_out(phi_int[19]),.phib_out(phib_int[19]),.scan_i0o1_out(scan_i0o1_int[19]),
.load_out(load_int[19]),.scan_out(scan_int[19]),.chip_in(scan_i[12]));


si_bit scan_cell_4_13(.phi(phi_int[19]),.phib(phib_int[19]),
.scan_i0o1(scan_i0o1_int[19]),.load(load_int[19]),.scan_in(scan_int[19]),
.phi_out(phi_int[20]),.phib_out(phib_int[20]),.scan_i0o1_out(scan_i0o1_int[20]),
.load_out(load_int[20]),.scan_out(scan_int[20]),.chip_in(scan_i[13]));


si_bit scan_cell_4_14(.phi(phi_int[20]),.phib(phib_int[20]),
.scan_i0o1(scan_i0o1_int[20]),.load(load_int[20]),.scan_in(scan_int[20]),
.phi_out(phi_int[21]),.phib_out(phib_int[21]),.scan_i0o1_out(scan_i0o1_int[21]),
.load_out(load_int[21]),.scan_out(scan_int[21]),.chip_in(scan_i[14]));


si_bit scan_cell_4_15(.phi(phi_int[21]),.phib(phib_int[21]),
.scan_i0o1(scan_i0o1_int[21]),.load(load_int[21]),.scan_in(scan_int[21]),
.phi_out(phi_int[22]),.phib_out(phib_int[22]),.scan_i0o1_out(scan_i0o1_int[22]),
.load_out(load_int[22]),.scan_out(scan_int[22]),.chip_in(scan_i[15]));


si_bit scan_cell_4_16(.phi(phi_int[22]),.phib(phib_int[22]),
.scan_i0o1(scan_i0o1_int[22]),.load(load_int[22]),.scan_in(scan_int[22]),
.phi_out(phi_int[23]),.phib_out(phib_int[23]),.scan_i0o1_out(scan_i0o1_int[23]),
.load_out(load_int[23]),.scan_out(scan_int[23]),.chip_in(scan_i[16]));


si_bit scan_cell_4_17(.phi(phi_int[23]),.phib(phib_int[23]),
.scan_i0o1(scan_i0o1_int[23]),.load(load_int[23]),.scan_in(scan_int[23]),
.phi_out(phi_int[24]),.phib_out(phib_int[24]),.scan_i0o1_out(scan_i0o1_int[24]),
.load_out(load_int[24]),.scan_out(scan_int[24]),.chip_in(scan_i[17]));


si_bit scan_cell_4_18(.phi(phi_int[24]),.phib(phib_int[24]),
.scan_i0o1(scan_i0o1_int[24]),.load(load_int[24]),.scan_in(scan_int[24]),
.phi_out(phi_int[25]),.phib_out(phib_int[25]),.scan_i0o1_out(scan_i0o1_int[25]),
.load_out(load_int[25]),.scan_out(scan_int[25]),.chip_in(scan_i[18]));


si_bit scan_cell_4_19(.phi(phi_int[25]),.phib(phib_int[25]),
.scan_i0o1(scan_i0o1_int[25]),.load(load_int[25]),.scan_in(scan_int[25]),
.phi_out(phi_int[26]),.phib_out(phib_int[26]),.scan_i0o1_out(scan_i0o1_int[26]),
.load_out(load_int[26]),.scan_out(scan_int[26]),.chip_in(scan_i[19]));


si_bit scan_cell_4_20(.phi(phi_int[26]),.phib(phib_int[26]),
.scan_i0o1(scan_i0o1_int[26]),.load(load_int[26]),.scan_in(scan_int[26]),
.phi_out(phi_int[27]),.phib_out(phib_int[27]),.scan_i0o1_out(scan_i0o1_int[27]),
.load_out(load_int[27]),.scan_out(scan_int[27]),.chip_in(scan_i[20]));


si_bit scan_cell_4_21(.phi(phi_int[27]),.phib(phib_int[27]),
.scan_i0o1(scan_i0o1_int[27]),.load(load_int[27]),.scan_in(scan_int[27]),
.phi_out(phi_int[28]),.phib_out(phib_int[28]),.scan_i0o1_out(scan_i0o1_int[28]),
.load_out(load_int[28]),.scan_out(scan_int[28]),.chip_in(scan_i[21]));


si_bit scan_cell_4_22(.phi(phi_int[28]),.phib(phib_int[28]),
.scan_i0o1(scan_i0o1_int[28]),.load(load_int[28]),.scan_in(scan_int[28]),
.phi_out(phi_int[29]),.phib_out(phib_int[29]),.scan_i0o1_out(scan_i0o1_int[29]),
.load_out(load_int[29]),.scan_out(scan_int[29]),.chip_in(scan_i[22]));


si_bit scan_cell_4_23(.phi(phi_int[29]),.phib(phib_int[29]),
.scan_i0o1(scan_i0o1_int[29]),.load(load_int[29]),.scan_in(scan_int[29]),
.phi_out(phi_int[30]),.phib_out(phib_int[30]),.scan_i0o1_out(scan_i0o1_int[30]),
.load_out(load_int[30]),.scan_out(scan_int[30]),.chip_in(scan_i[23]));


si_bit scan_cell_4_24(.phi(phi_int[30]),.phib(phib_int[30]),
.scan_i0o1(scan_i0o1_int[30]),.load(load_int[30]),.scan_in(scan_int[30]),
.phi_out(phi_int[31]),.phib_out(phib_int[31]),.scan_i0o1_out(scan_i0o1_int[31]),
.load_out(load_int[31]),.scan_out(scan_int[31]),.chip_in(scan_i[24]));


si_bit scan_cell_4_25(.phi(phi_int[31]),.phib(phib_int[31]),
.scan_i0o1(scan_i0o1_int[31]),.load(load_int[31]),.scan_in(scan_int[31]),
.phi_out(phi_int[32]),.phib_out(phib_int[32]),.scan_i0o1_out(scan_i0o1_int[32]),
.load_out(load_int[32]),.scan_out(scan_int[32]),.chip_in(scan_i[25]));


si_bit scan_cell_4_26(.phi(phi_int[32]),.phib(phib_int[32]),
.scan_i0o1(scan_i0o1_int[32]),.load(load_int[32]),.scan_in(scan_int[32]),
.phi_out(phi_int[33]),.phib_out(phib_int[33]),.scan_i0o1_out(scan_i0o1_int[33]),
.load_out(load_int[33]),.scan_out(scan_int[33]),.chip_in(scan_i[26]));


si_bit scan_cell_4_27(.phi(phi_int[33]),.phib(phib_int[33]),
.scan_i0o1(scan_i0o1_int[33]),.load(load_int[33]),.scan_in(scan_int[33]),
.phi_out(phi_int[34]),.phib_out(phib_int[34]),.scan_i0o1_out(scan_i0o1_int[34]),
.load_out(load_int[34]),.scan_out(scan_int[34]),.chip_in(scan_i[27]));


si_bit scan_cell_4_28(.phi(phi_int[34]),.phib(phib_int[34]),
.scan_i0o1(scan_i0o1_int[34]),.load(load_int[34]),.scan_in(scan_int[34]),
.phi_out(phi_int[35]),.phib_out(phib_int[35]),.scan_i0o1_out(scan_i0o1_int[35]),
.load_out(load_int[35]),.scan_out(scan_int[35]),.chip_in(scan_i[28]));


si_bit scan_cell_4_29(.phi(phi_int[35]),.phib(phib_int[35]),
.scan_i0o1(scan_i0o1_int[35]),.load(load_int[35]),.scan_in(scan_int[35]),
.phi_out(phi_int[36]),.phib_out(phib_int[36]),.scan_i0o1_out(scan_i0o1_int[36]),
.load_out(load_int[36]),.scan_out(scan_int[36]),.chip_in(scan_i[29]));


si_bit scan_cell_4_30(.phi(phi_int[36]),.phib(phib_int[36]),
.scan_i0o1(scan_i0o1_int[36]),.load(load_int[36]),.scan_in(scan_int[36]),
.phi_out(phi_int[37]),.phib_out(phib_int[37]),.scan_i0o1_out(scan_i0o1_int[37]),
.load_out(load_int[37]),.scan_out(scan_int[37]),.chip_in(scan_i[30]));


si_bit scan_cell_4_31(.phi(phi_int[37]),.phib(phib_int[37]),
.scan_i0o1(scan_i0o1_int[37]),.load(load_int[37]),.scan_in(scan_int[37]),
.phi_out(phi_int[38]),.phib_out(phib_int[38]),.scan_i0o1_out(scan_i0o1_int[38]),
.load_out(load_int[38]),.scan_out(scan_int[38]),.chip_in(scan_i[31]));


si_bit scan_cell_4_32(.phi(phi_int[38]),.phib(phib_int[38]),
.scan_i0o1(scan_i0o1_int[38]),.load(load_int[38]),.scan_in(scan_int[38]),
.phi_out(phi_int[39]),.phib_out(phib_int[39]),.scan_i0o1_out(scan_i0o1_int[39]),
.load_out(load_int[39]),.scan_out(scan_int[39]),.chip_in(scan_i[32]));


si_bit scan_cell_4_33(.phi(phi_int[39]),.phib(phib_int[39]),
.scan_i0o1(scan_i0o1_int[39]),.load(load_int[39]),.scan_in(scan_int[39]),
.phi_out(phi_int[40]),.phib_out(phib_int[40]),.scan_i0o1_out(scan_i0o1_int[40]),
.load_out(load_int[40]),.scan_out(scan_int[40]),.chip_in(scan_i[33]));


si_bit scan_cell_4_34(.phi(phi_int[40]),.phib(phib_int[40]),
.scan_i0o1(scan_i0o1_int[40]),.load(load_int[40]),.scan_in(scan_int[40]),
.phi_out(phi_int[41]),.phib_out(phib_int[41]),.scan_i0o1_out(scan_i0o1_int[41]),
.load_out(load_int[41]),.scan_out(scan_int[41]),.chip_in(scan_i[34]));


si_bit scan_cell_4_35(.phi(phi_int[41]),.phib(phib_int[41]),
.scan_i0o1(scan_i0o1_int[41]),.load(load_int[41]),.scan_in(scan_int[41]),
.phi_out(phi_int[42]),.phib_out(phib_int[42]),.scan_i0o1_out(scan_i0o1_int[42]),
.load_out(load_int[42]),.scan_out(scan_int[42]),.chip_in(scan_i[35]));


si_bit scan_cell_4_36(.phi(phi_int[42]),.phib(phib_int[42]),
.scan_i0o1(scan_i0o1_int[42]),.load(load_int[42]),.scan_in(scan_int[42]),
.phi_out(phi_int[43]),.phib_out(phib_int[43]),.scan_i0o1_out(scan_i0o1_int[43]),
.load_out(load_int[43]),.scan_out(scan_int[43]),.chip_in(scan_i[36]));


si_bit scan_cell_4_37(.phi(phi_int[43]),.phib(phib_int[43]),
.scan_i0o1(scan_i0o1_int[43]),.load(load_int[43]),.scan_in(scan_int[43]),
.phi_out(phi_int[44]),.phib_out(phib_int[44]),.scan_i0o1_out(scan_i0o1_int[44]),
.load_out(load_int[44]),.scan_out(scan_int[44]),.chip_in(scan_i[37]));


si_bit scan_cell_4_38(.phi(phi_int[44]),.phib(phib_int[44]),
.scan_i0o1(scan_i0o1_int[44]),.load(load_int[44]),.scan_in(scan_int[44]),
.phi_out(phi_int[45]),.phib_out(phib_int[45]),.scan_i0o1_out(scan_i0o1_int[45]),
.load_out(load_int[45]),.scan_out(scan_int[45]),.chip_in(scan_i[38]));


si_bit scan_cell_4_39(.phi(phi_int[45]),.phib(phib_int[45]),
.scan_i0o1(scan_i0o1_int[45]),.load(load_int[45]),.scan_in(scan_int[45]),
.phi_out(phi_int[46]),.phib_out(phib_int[46]),.scan_i0o1_out(scan_i0o1_int[46]),
.load_out(load_int[46]),.scan_out(scan_int[46]),.chip_in(scan_i[39]));


si_bit scan_cell_5_0(.phi(phi_int[46]),.phib(phib_int[46]),
.scan_i0o1(scan_i0o1_int[46]),.load(load_int[46]),.scan_in(scan_int[46]),
.phi_out(phi_int[47]),.phib_out(phib_int[47]),.scan_i0o1_out(scan_i0o1_int[47]),
.load_out(load_int[47]),.scan_out(scan_int[47]),.chip_in(bias_i[0]));


si_bit scan_cell_5_1(.phi(phi_int[47]),.phib(phib_int[47]),
.scan_i0o1(scan_i0o1_int[47]),.load(load_int[47]),.scan_in(scan_int[47]),
.phi_out(phi_int[48]),.phib_out(phib_int[48]),.scan_i0o1_out(scan_i0o1_int[48]),
.load_out(load_int[48]),.scan_out(scan_int[48]),.chip_in(bias_i[1]));


si_bit scan_cell_5_2(.phi(phi_int[48]),.phib(phib_int[48]),
.scan_i0o1(scan_i0o1_int[48]),.load(load_int[48]),.scan_in(scan_int[48]),
.phi_out(phi_int[49]),.phib_out(phib_int[49]),.scan_i0o1_out(scan_i0o1_int[49]),
.load_out(load_int[49]),.scan_out(scan_int[49]),.chip_in(bias_i[2]));


si_bit scan_cell_5_3(.phi(phi_int[49]),.phib(phib_int[49]),
.scan_i0o1(scan_i0o1_int[49]),.load(load_int[49]),.scan_in(scan_int[49]),
.phi_out(phi_int[50]),.phib_out(phib_int[50]),.scan_i0o1_out(scan_i0o1_int[50]),
.load_out(load_int[50]),.scan_out(scan_int[50]),.chip_in(bias_i[3]));


si_bit scan_cell_5_4(.phi(phi_int[50]),.phib(phib_int[50]),
.scan_i0o1(scan_i0o1_int[50]),.load(load_int[50]),.scan_in(scan_int[50]),
.phi_out(phi_int[51]),.phib_out(phib_int[51]),.scan_i0o1_out(scan_i0o1_int[51]),
.load_out(load_int[51]),.scan_out(scan_int[51]),.chip_in(bias_i[4]));


si_bit scan_cell_5_5(.phi(phi_int[51]),.phib(phib_int[51]),
.scan_i0o1(scan_i0o1_int[51]),.load(load_int[51]),.scan_in(scan_int[51]),
.phi_out(phi_int[52]),.phib_out(phib_int[52]),.scan_i0o1_out(scan_i0o1_int[52]),
.load_out(load_int[52]),.scan_out(scan_int[52]),.chip_in(bias_i[5]));


si_bit scan_cell_5_6(.phi(phi_int[52]),.phib(phib_int[52]),
.scan_i0o1(scan_i0o1_int[52]),.load(load_int[52]),.scan_in(scan_int[52]),
.phi_out(phi_int[53]),.phib_out(phib_int[53]),.scan_i0o1_out(scan_i0o1_int[53]),
.load_out(load_int[53]),.scan_out(scan_int[53]),.chip_in(bias_i[6]));


si_bit scan_cell_5_7(.phi(phi_int[53]),.phib(phib_int[53]),
.scan_i0o1(scan_i0o1_int[53]),.load(load_int[53]),.scan_in(scan_int[53]),
.phi_out(phi_int[54]),.phib_out(phib_int[54]),.scan_i0o1_out(scan_i0o1_int[54]),
.load_out(load_int[54]),.scan_out(scan_int[54]),.chip_in(bias_i[7]));


si_bit scan_cell_5_8(.phi(phi_int[54]),.phib(phib_int[54]),
.scan_i0o1(scan_i0o1_int[54]),.load(load_int[54]),.scan_in(scan_int[54]),
.phi_out(phi_int[55]),.phib_out(phib_int[55]),.scan_i0o1_out(scan_i0o1_int[55]),
.load_out(load_int[55]),.scan_out(scan_int[55]),.chip_in(bias_i[8]));


si_bit scan_cell_5_9(.phi(phi_int[55]),.phib(phib_int[55]),
.scan_i0o1(scan_i0o1_int[55]),.load(load_int[55]),.scan_in(scan_int[55]),
.phi_out(phi_int[56]),.phib_out(phib_int[56]),.scan_i0o1_out(scan_i0o1_int[56]),
.load_out(load_int[56]),.scan_out(scan_int[56]),.chip_in(bias_i[9]));


si_bit scan_cell_5_10(.phi(phi_int[56]),.phib(phib_int[56]),
.scan_i0o1(scan_i0o1_int[56]),.load(load_int[56]),.scan_in(scan_int[56]),
.phi_out(phi_int[57]),.phib_out(phib_int[57]),.scan_i0o1_out(scan_i0o1_int[57]),
.load_out(load_int[57]),.scan_out(scan_int[57]),.chip_in(bias_i[10]));


si_bit scan_cell_5_11(.phi(phi_int[57]),.phib(phib_int[57]),
.scan_i0o1(scan_i0o1_int[57]),.load(load_int[57]),.scan_in(scan_int[57]),
.phi_out(phi_int[58]),.phib_out(phib_int[58]),.scan_i0o1_out(scan_i0o1_int[58]),
.load_out(load_int[58]),.scan_out(scan_int[58]),.chip_in(bias_i[11]));


si_bit scan_cell_5_12(.phi(phi_int[58]),.phib(phib_int[58]),
.scan_i0o1(scan_i0o1_int[58]),.load(load_int[58]),.scan_in(scan_int[58]),
.phi_out(phi_int[59]),.phib_out(phib_int[59]),.scan_i0o1_out(scan_i0o1_int[59]),
.load_out(load_int[59]),.scan_out(scan_int[59]),.chip_in(bias_i[12]));


si_bit scan_cell_5_13(.phi(phi_int[59]),.phib(phib_int[59]),
.scan_i0o1(scan_i0o1_int[59]),.load(load_int[59]),.scan_in(scan_int[59]),
.phi_out(phi_int[60]),.phib_out(phib_int[60]),.scan_i0o1_out(scan_i0o1_int[60]),
.load_out(load_int[60]),.scan_out(scan_int[60]),.chip_in(bias_i[13]));


si_bit scan_cell_5_14(.phi(phi_int[60]),.phib(phib_int[60]),
.scan_i0o1(scan_i0o1_int[60]),.load(load_int[60]),.scan_in(scan_int[60]),
.phi_out(phi_int[61]),.phib_out(phib_int[61]),.scan_i0o1_out(scan_i0o1_int[61]),
.load_out(load_int[61]),.scan_out(scan_int[61]),.chip_in(bias_i[14]));


si_bit scan_cell_5_15(.phi(phi_int[61]),.phib(phib_int[61]),
.scan_i0o1(scan_i0o1_int[61]),.load(load_int[61]),.scan_in(scan_int[61]),
.phi_out(phi_int[62]),.phib_out(phib_int[62]),.scan_i0o1_out(scan_i0o1_int[62]),
.load_out(load_int[62]),.scan_out(scan_int[62]),.chip_in(bias_i[15]));


si_bit scan_cell_5_16(.phi(phi_int[62]),.phib(phib_int[62]),
.scan_i0o1(scan_i0o1_int[62]),.load(load_int[62]),.scan_in(scan_int[62]),
.phi_out(phi_int[63]),.phib_out(phib_int[63]),.scan_i0o1_out(scan_i0o1_int[63]),
.load_out(load_int[63]),.scan_out(scan_int[63]),.chip_in(bias_i[16]));


si_bit scan_cell_5_17(.phi(phi_int[63]),.phib(phib_int[63]),
.scan_i0o1(scan_i0o1_int[63]),.load(load_int[63]),.scan_in(scan_int[63]),
.phi_out(phi_int[64]),.phib_out(phib_int[64]),.scan_i0o1_out(scan_i0o1_int[64]),
.load_out(load_int[64]),.scan_out(scan_int[64]),.chip_in(bias_i[17]));


si_bit scan_cell_5_18(.phi(phi_int[64]),.phib(phib_int[64]),
.scan_i0o1(scan_i0o1_int[64]),.load(load_int[64]),.scan_in(scan_int[64]),
.phi_out(phi_int[65]),.phib_out(phib_int[65]),.scan_i0o1_out(scan_i0o1_int[65]),
.load_out(load_int[65]),.scan_out(scan_int[65]),.chip_in(bias_i[18]));


si_bit scan_cell_5_19(.phi(phi_int[65]),.phib(phib_int[65]),
.scan_i0o1(scan_i0o1_int[65]),.load(load_int[65]),.scan_in(scan_int[65]),
.phi_out(phi_int[66]),.phib_out(phib_int[66]),.scan_i0o1_out(scan_i0o1_int[66]),
.load_out(load_int[66]),.scan_out(scan_int[66]),.chip_in(bias_i[19]));


si_bit scan_cell_5_20(.phi(phi_int[66]),.phib(phib_int[66]),
.scan_i0o1(scan_i0o1_int[66]),.load(load_int[66]),.scan_in(scan_int[66]),
.phi_out(phi_int[67]),.phib_out(phib_int[67]),.scan_i0o1_out(scan_i0o1_int[67]),
.load_out(load_int[67]),.scan_out(scan_int[67]),.chip_in(bias_i[20]));


si_bit scan_cell_5_21(.phi(phi_int[67]),.phib(phib_int[67]),
.scan_i0o1(scan_i0o1_int[67]),.load(load_int[67]),.scan_in(scan_int[67]),
.phi_out(phi_int[68]),.phib_out(phib_int[68]),.scan_i0o1_out(scan_i0o1_int[68]),
.load_out(load_int[68]),.scan_out(scan_int[68]),.chip_in(bias_i[21]));


si_bit scan_cell_5_22(.phi(phi_int[68]),.phib(phib_int[68]),
.scan_i0o1(scan_i0o1_int[68]),.load(load_int[68]),.scan_in(scan_int[68]),
.phi_out(phi_int[69]),.phib_out(phib_int[69]),.scan_i0o1_out(scan_i0o1_int[69]),
.load_out(load_int[69]),.scan_out(scan_int[69]),.chip_in(bias_i[22]));


si_bit scan_cell_5_23(.phi(phi_int[69]),.phib(phib_int[69]),
.scan_i0o1(scan_i0o1_int[69]),.load(load_int[69]),.scan_in(scan_int[69]),
.phi_out(phi_int[70]),.phib_out(phib_int[70]),.scan_i0o1_out(scan_i0o1_int[70]),
.load_out(load_int[70]),.scan_out(scan_int[70]),.chip_in(bias_i[23]));


si_bit scan_cell_6_0(.phi(phi_int[70]),.phib(phib_int[70]),
.scan_i0o1(scan_i0o1_int[70]),.load(load_int[70]),.scan_in(scan_int[70]),
.phi_out(phi_int[71]),.phib_out(phib_int[71]),.scan_i0o1_out(scan_i0o1_int[71]),
.load_out(load_int[71]),.scan_out(scan_int[71]),.chip_in(data_w[0]));


si_bit scan_cell_6_1(.phi(phi_int[71]),.phib(phib_int[71]),
.scan_i0o1(scan_i0o1_int[71]),.load(load_int[71]),.scan_in(scan_int[71]),
.phi_out(phi_int[72]),.phib_out(phib_int[72]),.scan_i0o1_out(scan_i0o1_int[72]),
.load_out(load_int[72]),.scan_out(scan_int[72]),.chip_in(data_w[1]));


si_bit scan_cell_6_2(.phi(phi_int[72]),.phib(phib_int[72]),
.scan_i0o1(scan_i0o1_int[72]),.load(load_int[72]),.scan_in(scan_int[72]),
.phi_out(phi_int[73]),.phib_out(phib_int[73]),.scan_i0o1_out(scan_i0o1_int[73]),
.load_out(load_int[73]),.scan_out(scan_int[73]),.chip_in(data_w[2]));


si_bit scan_cell_6_3(.phi(phi_int[73]),.phib(phib_int[73]),
.scan_i0o1(scan_i0o1_int[73]),.load(load_int[73]),.scan_in(scan_int[73]),
.phi_out(phi_int[74]),.phib_out(phib_int[74]),.scan_i0o1_out(scan_i0o1_int[74]),
.load_out(load_int[74]),.scan_out(scan_int[74]),.chip_in(data_w[3]));


si_bit scan_cell_6_4(.phi(phi_int[74]),.phib(phib_int[74]),
.scan_i0o1(scan_i0o1_int[74]),.load(load_int[74]),.scan_in(scan_int[74]),
.phi_out(phi_int[75]),.phib_out(phib_int[75]),.scan_i0o1_out(scan_i0o1_int[75]),
.load_out(load_int[75]),.scan_out(scan_int[75]),.chip_in(data_w[4]));


si_bit scan_cell_6_5(.phi(phi_int[75]),.phib(phib_int[75]),
.scan_i0o1(scan_i0o1_int[75]),.load(load_int[75]),.scan_in(scan_int[75]),
.phi_out(phi_int[76]),.phib_out(phib_int[76]),.scan_i0o1_out(scan_i0o1_int[76]),
.load_out(load_int[76]),.scan_out(scan_int[76]),.chip_in(data_w[5]));


si_bit scan_cell_6_6(.phi(phi_int[76]),.phib(phib_int[76]),
.scan_i0o1(scan_i0o1_int[76]),.load(load_int[76]),.scan_in(scan_int[76]),
.phi_out(phi_int[77]),.phib_out(phib_int[77]),.scan_i0o1_out(scan_i0o1_int[77]),
.load_out(load_int[77]),.scan_out(scan_int[77]),.chip_in(data_w[6]));


si_bit scan_cell_6_7(.phi(phi_int[77]),.phib(phib_int[77]),
.scan_i0o1(scan_i0o1_int[77]),.load(load_int[77]),.scan_in(scan_int[77]),
.phi_out(phi_int[78]),.phib_out(phib_int[78]),.scan_i0o1_out(scan_i0o1_int[78]),
.load_out(load_int[78]),.scan_out(scan_int[78]),.chip_in(data_w[7]));


si_bit scan_cell_6_8(.phi(phi_int[78]),.phib(phib_int[78]),
.scan_i0o1(scan_i0o1_int[78]),.load(load_int[78]),.scan_in(scan_int[78]),
.phi_out(phi_int[79]),.phib_out(phib_int[79]),.scan_i0o1_out(scan_i0o1_int[79]),
.load_out(load_int[79]),.scan_out(scan_int[79]),.chip_in(data_w[8]));


si_bit scan_cell_6_9(.phi(phi_int[79]),.phib(phib_int[79]),
.scan_i0o1(scan_i0o1_int[79]),.load(load_int[79]),.scan_in(scan_int[79]),
.phi_out(phi_int[80]),.phib_out(phib_int[80]),.scan_i0o1_out(scan_i0o1_int[80]),
.load_out(load_int[80]),.scan_out(scan_int[80]),.chip_in(data_w[9]));


si_bit scan_cell_6_10(.phi(phi_int[80]),.phib(phib_int[80]),
.scan_i0o1(scan_i0o1_int[80]),.load(load_int[80]),.scan_in(scan_int[80]),
.phi_out(phi_int[81]),.phib_out(phib_int[81]),.scan_i0o1_out(scan_i0o1_int[81]),
.load_out(load_int[81]),.scan_out(scan_int[81]),.chip_in(data_w[10]));


si_bit scan_cell_6_11(.phi(phi_int[81]),.phib(phib_int[81]),
.scan_i0o1(scan_i0o1_int[81]),.load(load_int[81]),.scan_in(scan_int[81]),
.phi_out(phi_int[82]),.phib_out(phib_int[82]),.scan_i0o1_out(scan_i0o1_int[82]),
.load_out(load_int[82]),.scan_out(scan_int[82]),.chip_in(data_w[11]));


si_bit scan_cell_6_12(.phi(phi_int[82]),.phib(phib_int[82]),
.scan_i0o1(scan_i0o1_int[82]),.load(load_int[82]),.scan_in(scan_int[82]),
.phi_out(phi_int[83]),.phib_out(phib_int[83]),.scan_i0o1_out(scan_i0o1_int[83]),
.load_out(load_int[83]),.scan_out(scan_int[83]),.chip_in(data_w[12]));


si_bit scan_cell_6_13(.phi(phi_int[83]),.phib(phib_int[83]),
.scan_i0o1(scan_i0o1_int[83]),.load(load_int[83]),.scan_in(scan_int[83]),
.phi_out(phi_int[84]),.phib_out(phib_int[84]),.scan_i0o1_out(scan_i0o1_int[84]),
.load_out(load_int[84]),.scan_out(scan_int[84]),.chip_in(data_w[13]));


si_bit scan_cell_6_14(.phi(phi_int[84]),.phib(phib_int[84]),
.scan_i0o1(scan_i0o1_int[84]),.load(load_int[84]),.scan_in(scan_int[84]),
.phi_out(phi_int[85]),.phib_out(phib_int[85]),.scan_i0o1_out(scan_i0o1_int[85]),
.load_out(load_int[85]),.scan_out(scan_int[85]),.chip_in(data_w[14]));


si_bit scan_cell_6_15(.phi(phi_int[85]),.phib(phib_int[85]),
.scan_i0o1(scan_i0o1_int[85]),.load(load_int[85]),.scan_in(scan_int[85]),
.phi_out(phi_int[86]),.phib_out(phib_int[86]),.scan_i0o1_out(scan_i0o1_int[86]),
.load_out(load_int[86]),.scan_out(scan_int[86]),.chip_in(data_w[15]));


si_bit scan_cell_6_16(.phi(phi_int[86]),.phib(phib_int[86]),
.scan_i0o1(scan_i0o1_int[86]),.load(load_int[86]),.scan_in(scan_int[86]),
.phi_out(phi_int[87]),.phib_out(phib_int[87]),.scan_i0o1_out(scan_i0o1_int[87]),
.load_out(load_int[87]),.scan_out(scan_int[87]),.chip_in(data_w[16]));


si_bit scan_cell_6_17(.phi(phi_int[87]),.phib(phib_int[87]),
.scan_i0o1(scan_i0o1_int[87]),.load(load_int[87]),.scan_in(scan_int[87]),
.phi_out(phi_int[88]),.phib_out(phib_int[88]),.scan_i0o1_out(scan_i0o1_int[88]),
.load_out(load_int[88]),.scan_out(scan_int[88]),.chip_in(data_w[17]));


si_bit scan_cell_6_18(.phi(phi_int[88]),.phib(phib_int[88]),
.scan_i0o1(scan_i0o1_int[88]),.load(load_int[88]),.scan_in(scan_int[88]),
.phi_out(phi_int[89]),.phib_out(phib_int[89]),.scan_i0o1_out(scan_i0o1_int[89]),
.load_out(load_int[89]),.scan_out(scan_int[89]),.chip_in(data_w[18]));


si_bit scan_cell_6_19(.phi(phi_int[89]),.phib(phib_int[89]),
.scan_i0o1(scan_i0o1_int[89]),.load(load_int[89]),.scan_in(scan_int[89]),
.phi_out(phi_int[90]),.phib_out(phib_int[90]),.scan_i0o1_out(scan_i0o1_int[90]),
.load_out(load_int[90]),.scan_out(scan_int[90]),.chip_in(data_w[19]));


si_bit scan_cell_6_20(.phi(phi_int[90]),.phib(phib_int[90]),
.scan_i0o1(scan_i0o1_int[90]),.load(load_int[90]),.scan_in(scan_int[90]),
.phi_out(phi_int[91]),.phib_out(phib_int[91]),.scan_i0o1_out(scan_i0o1_int[91]),
.load_out(load_int[91]),.scan_out(scan_int[91]),.chip_in(data_w[20]));


si_bit scan_cell_6_21(.phi(phi_int[91]),.phib(phib_int[91]),
.scan_i0o1(scan_i0o1_int[91]),.load(load_int[91]),.scan_in(scan_int[91]),
.phi_out(phi_int[92]),.phib_out(phib_int[92]),.scan_i0o1_out(scan_i0o1_int[92]),
.load_out(load_int[92]),.scan_out(scan_int[92]),.chip_in(data_w[21]));


si_bit scan_cell_6_22(.phi(phi_int[92]),.phib(phib_int[92]),
.scan_i0o1(scan_i0o1_int[92]),.load(load_int[92]),.scan_in(scan_int[92]),
.phi_out(phi_int[93]),.phib_out(phib_int[93]),.scan_i0o1_out(scan_i0o1_int[93]),
.load_out(load_int[93]),.scan_out(scan_int[93]),.chip_in(data_w[22]));


si_bit scan_cell_6_23(.phi(phi_int[93]),.phib(phib_int[93]),
.scan_i0o1(scan_i0o1_int[93]),.load(load_int[93]),.scan_in(scan_int[93]),
.phi_out(phi_int[94]),.phib_out(phib_int[94]),.scan_i0o1_out(scan_i0o1_int[94]),
.load_out(load_int[94]),.scan_out(scan_int[94]),.chip_in(data_w[23]));


si_bit scan_cell_6_24(.phi(phi_int[94]),.phib(phib_int[94]),
.scan_i0o1(scan_i0o1_int[94]),.load(load_int[94]),.scan_in(scan_int[94]),
.phi_out(phi_int[95]),.phib_out(phib_int[95]),.scan_i0o1_out(scan_i0o1_int[95]),
.load_out(load_int[95]),.scan_out(scan_int[95]),.chip_in(data_w[24]));


si_bit scan_cell_6_25(.phi(phi_int[95]),.phib(phib_int[95]),
.scan_i0o1(scan_i0o1_int[95]),.load(load_int[95]),.scan_in(scan_int[95]),
.phi_out(phi_int[96]),.phib_out(phib_int[96]),.scan_i0o1_out(scan_i0o1_int[96]),
.load_out(load_int[96]),.scan_out(scan_int[96]),.chip_in(data_w[25]));


si_bit scan_cell_6_26(.phi(phi_int[96]),.phib(phib_int[96]),
.scan_i0o1(scan_i0o1_int[96]),.load(load_int[96]),.scan_in(scan_int[96]),
.phi_out(phi_int[97]),.phib_out(phib_int[97]),.scan_i0o1_out(scan_i0o1_int[97]),
.load_out(load_int[97]),.scan_out(scan_int[97]),.chip_in(data_w[26]));


si_bit scan_cell_6_27(.phi(phi_int[97]),.phib(phib_int[97]),
.scan_i0o1(scan_i0o1_int[97]),.load(load_int[97]),.scan_in(scan_int[97]),
.phi_out(phi_int[98]),.phib_out(phib_int[98]),.scan_i0o1_out(scan_i0o1_int[98]),
.load_out(load_int[98]),.scan_out(scan_int[98]),.chip_in(data_w[27]));


si_bit scan_cell_6_28(.phi(phi_int[98]),.phib(phib_int[98]),
.scan_i0o1(scan_i0o1_int[98]),.load(load_int[98]),.scan_in(scan_int[98]),
.phi_out(phi_int[99]),.phib_out(phib_int[99]),.scan_i0o1_out(scan_i0o1_int[99]),
.load_out(load_int[99]),.scan_out(scan_int[99]),.chip_in(data_w[28]));


si_bit scan_cell_6_29(.phi(phi_int[99]),.phib(phib_int[99]),
.scan_i0o1(scan_i0o1_int[99]),.load(load_int[99]),.scan_in(scan_int[99]),
.phi_out(phi_int[100]),.phib_out(phib_int[100]),.scan_i0o1_out(scan_i0o1_int[100]),
.load_out(load_int[100]),.scan_out(scan_int[100]),.chip_in(data_w[29]));


si_bit scan_cell_6_30(.phi(phi_int[100]),.phib(phib_int[100]),
.scan_i0o1(scan_i0o1_int[100]),.load(load_int[100]),.scan_in(scan_int[100]),
.phi_out(phi_int[101]),.phib_out(phib_int[101]),.scan_i0o1_out(scan_i0o1_int[101]),
.load_out(load_int[101]),.scan_out(scan_int[101]),.chip_in(data_w[30]));


si_bit scan_cell_6_31(.phi(phi_int[101]),.phib(phib_int[101]),
.scan_i0o1(scan_i0o1_int[101]),.load(load_int[101]),.scan_in(scan_int[101]),
.phi_out(phi_int[102]),.phib_out(phib_int[102]),.scan_i0o1_out(scan_i0o1_int[102]),
.load_out(load_int[102]),.scan_out(scan_int[102]),.chip_in(data_w[31]));


si_bit scan_cell_6_32(.phi(phi_int[102]),.phib(phib_int[102]),
.scan_i0o1(scan_i0o1_int[102]),.load(load_int[102]),.scan_in(scan_int[102]),
.phi_out(phi_int[103]),.phib_out(phib_int[103]),.scan_i0o1_out(scan_i0o1_int[103]),
.load_out(load_int[103]),.scan_out(scan_int[103]),.chip_in(data_w[32]));


si_bit scan_cell_6_33(.phi(phi_int[103]),.phib(phib_int[103]),
.scan_i0o1(scan_i0o1_int[103]),.load(load_int[103]),.scan_in(scan_int[103]),
.phi_out(phi_int[104]),.phib_out(phib_int[104]),.scan_i0o1_out(scan_i0o1_int[104]),
.load_out(load_int[104]),.scan_out(scan_int[104]),.chip_in(data_w[33]));


si_bit scan_cell_6_34(.phi(phi_int[104]),.phib(phib_int[104]),
.scan_i0o1(scan_i0o1_int[104]),.load(load_int[104]),.scan_in(scan_int[104]),
.phi_out(phi_int[105]),.phib_out(phib_int[105]),.scan_i0o1_out(scan_i0o1_int[105]),
.load_out(load_int[105]),.scan_out(scan_int[105]),.chip_in(data_w[34]));


si_bit scan_cell_6_35(.phi(phi_int[105]),.phib(phib_int[105]),
.scan_i0o1(scan_i0o1_int[105]),.load(load_int[105]),.scan_in(scan_int[105]),
.phi_out(phi_int[106]),.phib_out(phib_int[106]),.scan_i0o1_out(scan_i0o1_int[106]),
.load_out(load_int[106]),.scan_out(scan_int[106]),.chip_in(data_w[35]));


si_bit scan_cell_6_36(.phi(phi_int[106]),.phib(phib_int[106]),
.scan_i0o1(scan_i0o1_int[106]),.load(load_int[106]),.scan_in(scan_int[106]),
.phi_out(phi_int[107]),.phib_out(phib_int[107]),.scan_i0o1_out(scan_i0o1_int[107]),
.load_out(load_int[107]),.scan_out(scan_int[107]),.chip_in(data_w[36]));


si_bit scan_cell_6_37(.phi(phi_int[107]),.phib(phib_int[107]),
.scan_i0o1(scan_i0o1_int[107]),.load(load_int[107]),.scan_in(scan_int[107]),
.phi_out(phi_int[108]),.phib_out(phib_int[108]),.scan_i0o1_out(scan_i0o1_int[108]),
.load_out(load_int[108]),.scan_out(scan_int[108]),.chip_in(data_w[37]));


si_bit scan_cell_6_38(.phi(phi_int[108]),.phib(phib_int[108]),
.scan_i0o1(scan_i0o1_int[108]),.load(load_int[108]),.scan_in(scan_int[108]),
.phi_out(phi_int[109]),.phib_out(phib_int[109]),.scan_i0o1_out(scan_i0o1_int[109]),
.load_out(load_int[109]),.scan_out(scan_int[109]),.chip_in(data_w[38]));


si_bit scan_cell_6_39(.phi(phi_int[109]),.phib(phib_int[109]),
.scan_i0o1(scan_i0o1_int[109]),.load(load_int[109]),.scan_in(scan_int[109]),
.phi_out(phi_int[110]),.phib_out(phib_int[110]),.scan_i0o1_out(scan_i0o1_int[110]),
.load_out(load_int[110]),.scan_out(scan_int[110]),.chip_in(data_w[39]));


si_bit scan_cell_6_40(.phi(phi_int[110]),.phib(phib_int[110]),
.scan_i0o1(scan_i0o1_int[110]),.load(load_int[110]),.scan_in(scan_int[110]),
.phi_out(phi_int[111]),.phib_out(phib_int[111]),.scan_i0o1_out(scan_i0o1_int[111]),
.load_out(load_int[111]),.scan_out(scan_int[111]),.chip_in(data_w[40]));


si_bit scan_cell_6_41(.phi(phi_int[111]),.phib(phib_int[111]),
.scan_i0o1(scan_i0o1_int[111]),.load(load_int[111]),.scan_in(scan_int[111]),
.phi_out(phi_int[112]),.phib_out(phib_int[112]),.scan_i0o1_out(scan_i0o1_int[112]),
.load_out(load_int[112]),.scan_out(scan_int[112]),.chip_in(data_w[41]));


si_bit scan_cell_6_42(.phi(phi_int[112]),.phib(phib_int[112]),
.scan_i0o1(scan_i0o1_int[112]),.load(load_int[112]),.scan_in(scan_int[112]),
.phi_out(phi_int[113]),.phib_out(phib_int[113]),.scan_i0o1_out(scan_i0o1_int[113]),
.load_out(load_int[113]),.scan_out(scan_int[113]),.chip_in(data_w[42]));


si_bit scan_cell_6_43(.phi(phi_int[113]),.phib(phib_int[113]),
.scan_i0o1(scan_i0o1_int[113]),.load(load_int[113]),.scan_in(scan_int[113]),
.phi_out(phi_int[114]),.phib_out(phib_int[114]),.scan_i0o1_out(scan_i0o1_int[114]),
.load_out(load_int[114]),.scan_out(scan_int[114]),.chip_in(data_w[43]));


si_bit scan_cell_6_44(.phi(phi_int[114]),.phib(phib_int[114]),
.scan_i0o1(scan_i0o1_int[114]),.load(load_int[114]),.scan_in(scan_int[114]),
.phi_out(phi_int[115]),.phib_out(phib_int[115]),.scan_i0o1_out(scan_i0o1_int[115]),
.load_out(load_int[115]),.scan_out(scan_int[115]),.chip_in(data_w[44]));


si_bit scan_cell_6_45(.phi(phi_int[115]),.phib(phib_int[115]),
.scan_i0o1(scan_i0o1_int[115]),.load(load_int[115]),.scan_in(scan_int[115]),
.phi_out(phi_int[116]),.phib_out(phib_int[116]),.scan_i0o1_out(scan_i0o1_int[116]),
.load_out(load_int[116]),.scan_out(scan_int[116]),.chip_in(data_w[45]));


si_bit scan_cell_6_46(.phi(phi_int[116]),.phib(phib_int[116]),
.scan_i0o1(scan_i0o1_int[116]),.load(load_int[116]),.scan_in(scan_int[116]),
.phi_out(phi_int[117]),.phib_out(phib_int[117]),.scan_i0o1_out(scan_i0o1_int[117]),
.load_out(load_int[117]),.scan_out(scan_int[117]),.chip_in(data_w[46]));


si_bit scan_cell_6_47(.phi(phi_int[117]),.phib(phib_int[117]),
.scan_i0o1(scan_i0o1_int[117]),.load(load_int[117]),.scan_in(scan_int[117]),
.phi_out(phi_int[118]),.phib_out(phib_int[118]),.scan_i0o1_out(scan_i0o1_int[118]),
.load_out(load_int[118]),.scan_out(scan_int[118]),.chip_in(data_w[47]));


si_bit scan_cell_6_48(.phi(phi_int[118]),.phib(phib_int[118]),
.scan_i0o1(scan_i0o1_int[118]),.load(load_int[118]),.scan_in(scan_int[118]),
.phi_out(phi_int[119]),.phib_out(phib_int[119]),.scan_i0o1_out(scan_i0o1_int[119]),
.load_out(load_int[119]),.scan_out(scan_int[119]),.chip_in(data_w[48]));


si_bit scan_cell_6_49(.phi(phi_int[119]),.phib(phib_int[119]),
.scan_i0o1(scan_i0o1_int[119]),.load(load_int[119]),.scan_in(scan_int[119]),
.phi_out(phi_int[120]),.phib_out(phib_int[120]),.scan_i0o1_out(scan_i0o1_int[120]),
.load_out(load_int[120]),.scan_out(scan_int[120]),.chip_in(data_w[49]));


si_bit scan_cell_6_50(.phi(phi_int[120]),.phib(phib_int[120]),
.scan_i0o1(scan_i0o1_int[120]),.load(load_int[120]),.scan_in(scan_int[120]),
.phi_out(phi_int[121]),.phib_out(phib_int[121]),.scan_i0o1_out(scan_i0o1_int[121]),
.load_out(load_int[121]),.scan_out(scan_int[121]),.chip_in(data_w[50]));


si_bit scan_cell_6_51(.phi(phi_int[121]),.phib(phib_int[121]),
.scan_i0o1(scan_i0o1_int[121]),.load(load_int[121]),.scan_in(scan_int[121]),
.phi_out(phi_int[122]),.phib_out(phib_int[122]),.scan_i0o1_out(scan_i0o1_int[122]),
.load_out(load_int[122]),.scan_out(scan_int[122]),.chip_in(data_w[51]));


si_bit scan_cell_6_52(.phi(phi_int[122]),.phib(phib_int[122]),
.scan_i0o1(scan_i0o1_int[122]),.load(load_int[122]),.scan_in(scan_int[122]),
.phi_out(phi_int[123]),.phib_out(phib_int[123]),.scan_i0o1_out(scan_i0o1_int[123]),
.load_out(load_int[123]),.scan_out(scan_int[123]),.chip_in(data_w[52]));


si_bit scan_cell_6_53(.phi(phi_int[123]),.phib(phib_int[123]),
.scan_i0o1(scan_i0o1_int[123]),.load(load_int[123]),.scan_in(scan_int[123]),
.phi_out(phi_int[124]),.phib_out(phib_int[124]),.scan_i0o1_out(scan_i0o1_int[124]),
.load_out(load_int[124]),.scan_out(scan_int[124]),.chip_in(data_w[53]));


si_bit scan_cell_6_54(.phi(phi_int[124]),.phib(phib_int[124]),
.scan_i0o1(scan_i0o1_int[124]),.load(load_int[124]),.scan_in(scan_int[124]),
.phi_out(phi_int[125]),.phib_out(phib_int[125]),.scan_i0o1_out(scan_i0o1_int[125]),
.load_out(load_int[125]),.scan_out(scan_int[125]),.chip_in(data_w[54]));


si_bit scan_cell_6_55(.phi(phi_int[125]),.phib(phib_int[125]),
.scan_i0o1(scan_i0o1_int[125]),.load(load_int[125]),.scan_in(scan_int[125]),
.phi_out(phi_int[126]),.phib_out(phib_int[126]),.scan_i0o1_out(scan_i0o1_int[126]),
.load_out(load_int[126]),.scan_out(scan_int[126]),.chip_in(data_w[55]));


si_bit scan_cell_6_56(.phi(phi_int[126]),.phib(phib_int[126]),
.scan_i0o1(scan_i0o1_int[126]),.load(load_int[126]),.scan_in(scan_int[126]),
.phi_out(phi_int[127]),.phib_out(phib_int[127]),.scan_i0o1_out(scan_i0o1_int[127]),
.load_out(load_int[127]),.scan_out(scan_int[127]),.chip_in(data_w[56]));


si_bit scan_cell_6_57(.phi(phi_int[127]),.phib(phib_int[127]),
.scan_i0o1(scan_i0o1_int[127]),.load(load_int[127]),.scan_in(scan_int[127]),
.phi_out(phi_int[128]),.phib_out(phib_int[128]),.scan_i0o1_out(scan_i0o1_int[128]),
.load_out(load_int[128]),.scan_out(scan_int[128]),.chip_in(data_w[57]));


si_bit scan_cell_6_58(.phi(phi_int[128]),.phib(phib_int[128]),
.scan_i0o1(scan_i0o1_int[128]),.load(load_int[128]),.scan_in(scan_int[128]),
.phi_out(phi_int[129]),.phib_out(phib_int[129]),.scan_i0o1_out(scan_i0o1_int[129]),
.load_out(load_int[129]),.scan_out(scan_int[129]),.chip_in(data_w[58]));


si_bit scan_cell_6_59(.phi(phi_int[129]),.phib(phib_int[129]),
.scan_i0o1(scan_i0o1_int[129]),.load(load_int[129]),.scan_in(scan_int[129]),
.phi_out(phi_int[130]),.phib_out(phib_int[130]),.scan_i0o1_out(scan_i0o1_int[130]),
.load_out(load_int[130]),.scan_out(scan_int[130]),.chip_in(data_w[59]));


si_bit scan_cell_6_60(.phi(phi_int[130]),.phib(phib_int[130]),
.scan_i0o1(scan_i0o1_int[130]),.load(load_int[130]),.scan_in(scan_int[130]),
.phi_out(phi_int[131]),.phib_out(phib_int[131]),.scan_i0o1_out(scan_i0o1_int[131]),
.load_out(load_int[131]),.scan_out(scan_int[131]),.chip_in(data_w[60]));


si_bit scan_cell_6_61(.phi(phi_int[131]),.phib(phib_int[131]),
.scan_i0o1(scan_i0o1_int[131]),.load(load_int[131]),.scan_in(scan_int[131]),
.phi_out(phi_int[132]),.phib_out(phib_int[132]),.scan_i0o1_out(scan_i0o1_int[132]),
.load_out(load_int[132]),.scan_out(scan_int[132]),.chip_in(data_w[61]));


si_bit scan_cell_6_62(.phi(phi_int[132]),.phib(phib_int[132]),
.scan_i0o1(scan_i0o1_int[132]),.load(load_int[132]),.scan_in(scan_int[132]),
.phi_out(phi_int[133]),.phib_out(phib_int[133]),.scan_i0o1_out(scan_i0o1_int[133]),
.load_out(load_int[133]),.scan_out(scan_int[133]),.chip_in(data_w[62]));


si_bit scan_cell_6_63(.phi(phi_int[133]),.phib(phib_int[133]),
.scan_i0o1(scan_i0o1_int[133]),.load(load_int[133]),.scan_in(scan_int[133]),
.phi_out(phi_int[134]),.phib_out(phib_int[134]),.scan_i0o1_out(scan_i0o1_int[134]),
.load_out(load_int[134]),.scan_out(scan_int[134]),.chip_in(data_w[63]));


si_bit scan_cell_6_64(.phi(phi_int[134]),.phib(phib_int[134]),
.scan_i0o1(scan_i0o1_int[134]),.load(load_int[134]),.scan_in(scan_int[134]),
.phi_out(phi_int[135]),.phib_out(phib_int[135]),.scan_i0o1_out(scan_i0o1_int[135]),
.load_out(load_int[135]),.scan_out(scan_int[135]),.chip_in(data_w[64]));


si_bit scan_cell_6_65(.phi(phi_int[135]),.phib(phib_int[135]),
.scan_i0o1(scan_i0o1_int[135]),.load(load_int[135]),.scan_in(scan_int[135]),
.phi_out(phi_int[136]),.phib_out(phib_int[136]),.scan_i0o1_out(scan_i0o1_int[136]),
.load_out(load_int[136]),.scan_out(scan_int[136]),.chip_in(data_w[65]));


si_bit scan_cell_6_66(.phi(phi_int[136]),.phib(phib_int[136]),
.scan_i0o1(scan_i0o1_int[136]),.load(load_int[136]),.scan_in(scan_int[136]),
.phi_out(phi_int[137]),.phib_out(phib_int[137]),.scan_i0o1_out(scan_i0o1_int[137]),
.load_out(load_int[137]),.scan_out(scan_int[137]),.chip_in(data_w[66]));


si_bit scan_cell_6_67(.phi(phi_int[137]),.phib(phib_int[137]),
.scan_i0o1(scan_i0o1_int[137]),.load(load_int[137]),.scan_in(scan_int[137]),
.phi_out(phi_int[138]),.phib_out(phib_int[138]),.scan_i0o1_out(scan_i0o1_int[138]),
.load_out(load_int[138]),.scan_out(scan_int[138]),.chip_in(data_w[67]));


si_bit scan_cell_6_68(.phi(phi_int[138]),.phib(phib_int[138]),
.scan_i0o1(scan_i0o1_int[138]),.load(load_int[138]),.scan_in(scan_int[138]),
.phi_out(phi_int[139]),.phib_out(phib_int[139]),.scan_i0o1_out(scan_i0o1_int[139]),
.load_out(load_int[139]),.scan_out(scan_int[139]),.chip_in(data_w[68]));


si_bit scan_cell_6_69(.phi(phi_int[139]),.phib(phib_int[139]),
.scan_i0o1(scan_i0o1_int[139]),.load(load_int[139]),.scan_in(scan_int[139]),
.phi_out(phi_int[140]),.phib_out(phib_int[140]),.scan_i0o1_out(scan_i0o1_int[140]),
.load_out(load_int[140]),.scan_out(scan_int[140]),.chip_in(data_w[69]));


si_bit scan_cell_6_70(.phi(phi_int[140]),.phib(phib_int[140]),
.scan_i0o1(scan_i0o1_int[140]),.load(load_int[140]),.scan_in(scan_int[140]),
.phi_out(phi_int[141]),.phib_out(phib_int[141]),.scan_i0o1_out(scan_i0o1_int[141]),
.load_out(load_int[141]),.scan_out(scan_int[141]),.chip_in(data_w[70]));


si_bit scan_cell_6_71(.phi(phi_int[141]),.phib(phib_int[141]),
.scan_i0o1(scan_i0o1_int[141]),.load(load_int[141]),.scan_in(scan_int[141]),
.phi_out(phi_int[142]),.phib_out(phib_int[142]),.scan_i0o1_out(scan_i0o1_int[142]),
.load_out(load_int[142]),.scan_out(scan_int[142]),.chip_in(data_w[71]));


si_bit scan_cell_7_0(.phi(phi_int[142]),.phib(phib_int[142]),
.scan_i0o1(scan_i0o1_int[142]),.load(load_int[142]),.scan_in(scan_int[142]),
.phi_out(phi_int[143]),.phib_out(phib_int[143]),.scan_i0o1_out(scan_i0o1_int[143]),
.load_out(load_int[143]),.scan_out(scan_int[143]),.chip_in(addr_w[0]));


si_bit scan_cell_7_1(.phi(phi_int[143]),.phib(phib_int[143]),
.scan_i0o1(scan_i0o1_int[143]),.load(load_int[143]),.scan_in(scan_int[143]),
.phi_out(phi_int[144]),.phib_out(phib_int[144]),.scan_i0o1_out(scan_i0o1_int[144]),
.load_out(load_int[144]),.scan_out(scan_int[144]),.chip_in(addr_w[1]));


si_bit scan_cell_7_2(.phi(phi_int[144]),.phib(phib_int[144]),
.scan_i0o1(scan_i0o1_int[144]),.load(load_int[144]),.scan_in(scan_int[144]),
.phi_out(phi_int[145]),.phib_out(phib_int[145]),.scan_i0o1_out(scan_i0o1_int[145]),
.load_out(load_int[145]),.scan_out(scan_int[145]),.chip_in(addr_w[2]));


si_bit scan_cell_7_3(.phi(phi_int[145]),.phib(phib_int[145]),
.scan_i0o1(scan_i0o1_int[145]),.load(load_int[145]),.scan_in(scan_int[145]),
.phi_out(phi_int[146]),.phib_out(phib_int[146]),.scan_i0o1_out(scan_i0o1_int[146]),
.load_out(load_int[146]),.scan_out(scan_int[146]),.chip_in(addr_w[3]));


si_bit scan_cell_7_4(.phi(phi_int[146]),.phib(phib_int[146]),
.scan_i0o1(scan_i0o1_int[146]),.load(load_int[146]),.scan_in(scan_int[146]),
.phi_out(phi_int[147]),.phib_out(phib_int[147]),.scan_i0o1_out(scan_i0o1_int[147]),
.load_out(load_int[147]),.scan_out(scan_int[147]),.chip_in(addr_w[4]));


si_bit scan_cell_7_5(.phi(phi_int[147]),.phib(phib_int[147]),
.scan_i0o1(scan_i0o1_int[147]),.load(load_int[147]),.scan_in(scan_int[147]),
.phi_out(phi_int[148]),.phib_out(phib_int[148]),.scan_i0o1_out(scan_i0o1_int[148]),
.load_out(load_int[148]),.scan_out(scan_int[148]),.chip_in(addr_w[5]));


si_bit scan_cell_7_6(.phi(phi_int[148]),.phib(phib_int[148]),
.scan_i0o1(scan_i0o1_int[148]),.load(load_int[148]),.scan_in(scan_int[148]),
.phi_out(phi_int[149]),.phib_out(phib_int[149]),.scan_i0o1_out(scan_i0o1_int[149]),
.load_out(load_int[149]),.scan_out(scan_int[149]),.chip_in(addr_w[6]));


si_bit scan_cell_7_7(.phi(phi_int[149]),.phib(phib_int[149]),
.scan_i0o1(scan_i0o1_int[149]),.load(load_int[149]),.scan_in(scan_int[149]),
.phi_out(phi_int[150]),.phib_out(phib_int[150]),.scan_i0o1_out(scan_i0o1_int[150]),
.load_out(load_int[150]),.scan_out(scan_int[150]),.chip_in(addr_w[7]));


si_bit scan_cell_7_8(.phi(phi_int[150]),.phib(phib_int[150]),
.scan_i0o1(scan_i0o1_int[150]),.load(load_int[150]),.scan_in(scan_int[150]),
.phi_out(phi_int[151]),.phib_out(phib_int[151]),.scan_i0o1_out(scan_i0o1_int[151]),
.load_out(load_int[151]),.scan_out(scan_int[151]),.chip_in(addr_w[8]));


si_bit scan_cell_7_9(.phi(phi_int[151]),.phib(phib_int[151]),
.scan_i0o1(scan_i0o1_int[151]),.load(load_int[151]),.scan_in(scan_int[151]),
.phi_out(phi_int[152]),.phib_out(phib_int[152]),.scan_i0o1_out(scan_i0o1_int[152]),
.load_out(load_int[152]),.scan_out(scan_int[152]),.chip_in(addr_w[9]));


si_bit scan_cell_8_0(.phi(phi_int[152]),.phib(phib_int[152]),
.scan_i0o1(scan_i0o1_int[152]),.load(load_int[152]),.scan_in(scan_int[152]),
.phi_out(phi_int[153]),.phib_out(phib_int[153]),.scan_i0o1_out(scan_i0o1_int[153]),
.load_out(load_int[153]),.scan_out(scan_int[153]),.chip_in(sta));


si_bit scan_cell_9_0(.phi(phi_int[153]),.phib(phib_int[153]),
.scan_i0o1(scan_i0o1_int[153]),.load(load_int[153]),.scan_in(scan_int[153]),
.phi_out(phi_int[154]),.phib_out(phib_int[154]),.scan_i0o1_out(scan_i0o1_int[154]),
.load_out(load_int[154]),.scan_out(scan_int[154]),.chip_in(res_sel_1[0]));


si_bit scan_cell_9_1(.phi(phi_int[154]),.phib(phib_int[154]),
.scan_i0o1(scan_i0o1_int[154]),.load(load_int[154]),.scan_in(scan_int[154]),
.phi_out(phi_int[155]),.phib_out(phib_int[155]),.scan_i0o1_out(scan_i0o1_int[155]),
.load_out(load_int[155]),.scan_out(scan_int[155]),.chip_in(res_sel_1[1]));


si_bit scan_cell_9_2(.phi(phi_int[155]),.phib(phib_int[155]),
.scan_i0o1(scan_i0o1_int[155]),.load(load_int[155]),.scan_in(scan_int[155]),
.phi_out(phi_int[156]),.phib_out(phib_int[156]),.scan_i0o1_out(scan_i0o1_int[156]),
.load_out(load_int[156]),.scan_out(scan_int[156]),.chip_in(res_sel_1[2]));


si_bit scan_cell_9_3(.phi(phi_int[156]),.phib(phib_int[156]),
.scan_i0o1(scan_i0o1_int[156]),.load(load_int[156]),.scan_in(scan_int[156]),
.phi_out(phi_int[157]),.phib_out(phib_int[157]),.scan_i0o1_out(scan_i0o1_int[157]),
.load_out(load_int[157]),.scan_out(scan_int[157]),.chip_in(res_sel_1[3]));


si_bit scan_cell_9_4(.phi(phi_int[157]),.phib(phib_int[157]),
.scan_i0o1(scan_i0o1_int[157]),.load(load_int[157]),.scan_in(scan_int[157]),
.phi_out(phi_int[158]),.phib_out(phib_int[158]),.scan_i0o1_out(scan_i0o1_int[158]),
.load_out(load_int[158]),.scan_out(scan_int[158]),.chip_in(res_sel_1[4]));


si_bit scan_cell_9_5(.phi(phi_int[158]),.phib(phib_int[158]),
.scan_i0o1(scan_i0o1_int[158]),.load(load_int[158]),.scan_in(scan_int[158]),
.phi_out(phi_int[159]),.phib_out(phib_int[159]),.scan_i0o1_out(scan_i0o1_int[159]),
.load_out(load_int[159]),.scan_out(scan_int[159]),.chip_in(res_sel_1[5]));


si_bit scan_cell_9_6(.phi(phi_int[159]),.phib(phib_int[159]),
.scan_i0o1(scan_i0o1_int[159]),.load(load_int[159]),.scan_in(scan_int[159]),
.phi_out(phi_int[160]),.phib_out(phib_int[160]),.scan_i0o1_out(scan_i0o1_int[160]),
.load_out(load_int[160]),.scan_out(scan_int[160]),.chip_in(res_sel_1[6]));


si_bit scan_cell_9_7(.phi(phi_int[160]),.phib(phib_int[160]),
.scan_i0o1(scan_i0o1_int[160]),.load(load_int[160]),.scan_in(scan_int[160]),
.phi_out(phi_int[161]),.phib_out(phib_int[161]),.scan_i0o1_out(scan_i0o1_int[161]),
.load_out(load_int[161]),.scan_out(scan_int[161]),.chip_in(res_sel_1[7]));


si_bit scan_cell_9_8(.phi(phi_int[161]),.phib(phib_int[161]),
.scan_i0o1(scan_i0o1_int[161]),.load(load_int[161]),.scan_in(scan_int[161]),
.phi_out(phi_int[162]),.phib_out(phib_int[162]),.scan_i0o1_out(scan_i0o1_int[162]),
.load_out(load_int[162]),.scan_out(scan_int[162]),.chip_in(res_sel_1[8]));


si_bit scan_cell_9_9(.phi(phi_int[162]),.phib(phib_int[162]),
.scan_i0o1(scan_i0o1_int[162]),.load(load_int[162]),.scan_in(scan_int[162]),
.phi_out(phi_int[163]),.phib_out(phib_int[163]),.scan_i0o1_out(scan_i0o1_int[163]),
.load_out(load_int[163]),.scan_out(scan_int[163]),.chip_in(res_sel_1[9]));


si_bit scan_cell_9_10(.phi(phi_int[163]),.phib(phib_int[163]),
.scan_i0o1(scan_i0o1_int[163]),.load(load_int[163]),.scan_in(scan_int[163]),
.phi_out(phi_int[164]),.phib_out(phib_int[164]),.scan_i0o1_out(scan_i0o1_int[164]),
.load_out(load_int[164]),.scan_out(scan_int[164]),.chip_in(res_sel_1[10]));


si_bit scan_cell_9_11(.phi(phi_int[164]),.phib(phib_int[164]),
.scan_i0o1(scan_i0o1_int[164]),.load(load_int[164]),.scan_in(scan_int[164]),
.phi_out(phi_int[165]),.phib_out(phib_int[165]),.scan_i0o1_out(scan_i0o1_int[165]),
.load_out(load_int[165]),.scan_out(scan_int[165]),.chip_in(res_sel_1[11]));


si_bit scan_cell_10_0(.phi(phi_int[165]),.phib(phib_int[165]),
.scan_i0o1(scan_i0o1_int[165]),.load(load_int[165]),.scan_in(scan_int[165]),
.phi_out(phi_int[166]),.phib_out(phib_int[166]),.scan_i0o1_out(scan_i0o1_int[166]),
.load_out(load_int[166]),.scan_out(scan_int[166]),.chip_in(res_sel_2[0]));


si_bit scan_cell_10_1(.phi(phi_int[166]),.phib(phib_int[166]),
.scan_i0o1(scan_i0o1_int[166]),.load(load_int[166]),.scan_in(scan_int[166]),
.phi_out(phi_int[167]),.phib_out(phib_int[167]),.scan_i0o1_out(scan_i0o1_int[167]),
.load_out(load_int[167]),.scan_out(scan_int[167]),.chip_in(res_sel_2[1]));


si_bit scan_cell_10_2(.phi(phi_int[167]),.phib(phib_int[167]),
.scan_i0o1(scan_i0o1_int[167]),.load(load_int[167]),.scan_in(scan_int[167]),
.phi_out(phi_int[168]),.phib_out(phib_int[168]),.scan_i0o1_out(scan_i0o1_int[168]),
.load_out(load_int[168]),.scan_out(scan_int[168]),.chip_in(res_sel_2[2]));


si_bit scan_cell_10_3(.phi(phi_int[168]),.phib(phib_int[168]),
.scan_i0o1(scan_i0o1_int[168]),.load(load_int[168]),.scan_in(scan_int[168]),
.phi_out(phi_int[169]),.phib_out(phib_int[169]),.scan_i0o1_out(scan_i0o1_int[169]),
.load_out(load_int[169]),.scan_out(scan_int[169]),.chip_in(res_sel_2[3]));


si_bit scan_cell_10_4(.phi(phi_int[169]),.phib(phib_int[169]),
.scan_i0o1(scan_i0o1_int[169]),.load(load_int[169]),.scan_in(scan_int[169]),
.phi_out(phi_int[170]),.phib_out(phib_int[170]),.scan_i0o1_out(scan_i0o1_int[170]),
.load_out(load_int[170]),.scan_out(scan_int[170]),.chip_in(res_sel_2[4]));


si_bit scan_cell_10_5(.phi(phi_int[170]),.phib(phib_int[170]),
.scan_i0o1(scan_i0o1_int[170]),.load(load_int[170]),.scan_in(scan_int[170]),
.phi_out(phi_int[171]),.phib_out(phib_int[171]),.scan_i0o1_out(scan_i0o1_int[171]),
.load_out(load_int[171]),.scan_out(scan_int[171]),.chip_in(res_sel_2[5]));


si_bit scan_cell_10_6(.phi(phi_int[171]),.phib(phib_int[171]),
.scan_i0o1(scan_i0o1_int[171]),.load(load_int[171]),.scan_in(scan_int[171]),
.phi_out(phi_int[172]),.phib_out(phib_int[172]),.scan_i0o1_out(scan_i0o1_int[172]),
.load_out(load_int[172]),.scan_out(scan_int[172]),.chip_in(res_sel_2[6]));


si_bit scan_cell_10_7(.phi(phi_int[172]),.phib(phib_int[172]),
.scan_i0o1(scan_i0o1_int[172]),.load(load_int[172]),.scan_in(scan_int[172]),
.phi_out(phi_int[173]),.phib_out(phib_int[173]),.scan_i0o1_out(scan_i0o1_int[173]),
.load_out(load_int[173]),.scan_out(scan_int[173]),.chip_in(res_sel_2[7]));


si_bit scan_cell_10_8(.phi(phi_int[173]),.phib(phib_int[173]),
.scan_i0o1(scan_i0o1_int[173]),.load(load_int[173]),.scan_in(scan_int[173]),
.phi_out(phi_int[174]),.phib_out(phib_int[174]),.scan_i0o1_out(scan_i0o1_int[174]),
.load_out(load_int[174]),.scan_out(scan_int[174]),.chip_in(res_sel_2[8]));


si_bit scan_cell_10_9(.phi(phi_int[174]),.phib(phib_int[174]),
.scan_i0o1(scan_i0o1_int[174]),.load(load_int[174]),.scan_in(scan_int[174]),
.phi_out(phi_int[175]),.phib_out(phib_int[175]),.scan_i0o1_out(scan_i0o1_int[175]),
.load_out(load_int[175]),.scan_out(scan_int[175]),.chip_in(res_sel_2[9]));


si_bit scan_cell_10_10(.phi(phi_int[175]),.phib(phib_int[175]),
.scan_i0o1(scan_i0o1_int[175]),.load(load_int[175]),.scan_in(scan_int[175]),
.phi_out(phi_int[176]),.phib_out(phib_int[176]),.scan_i0o1_out(scan_i0o1_int[176]),
.load_out(load_int[176]),.scan_out(scan_int[176]),.chip_in(res_sel_2[10]));


si_bit scan_cell_11_0(.phi(phi_int[176]),.phib(phib_int[176]),
.scan_i0o1(scan_i0o1_int[176]),.load(load_int[176]),.scan_in(scan_int[176]),
.phi_out(phi_int[177]),.phib_out(phib_int[177]),.scan_i0o1_out(scan_i0o1_int[177]),
.load_out(load_int[177]),.scan_out(scan_int[177]),.chip_in(res_sel_3[0]));


si_bit scan_cell_11_1(.phi(phi_int[177]),.phib(phib_int[177]),
.scan_i0o1(scan_i0o1_int[177]),.load(load_int[177]),.scan_in(scan_int[177]),
.phi_out(phi_int[178]),.phib_out(phib_int[178]),.scan_i0o1_out(scan_i0o1_int[178]),
.load_out(load_int[178]),.scan_out(scan_int[178]),.chip_in(res_sel_3[1]));


si_bit scan_cell_11_2(.phi(phi_int[178]),.phib(phib_int[178]),
.scan_i0o1(scan_i0o1_int[178]),.load(load_int[178]),.scan_in(scan_int[178]),
.phi_out(phi_int[179]),.phib_out(phib_int[179]),.scan_i0o1_out(scan_i0o1_int[179]),
.load_out(load_int[179]),.scan_out(scan_int[179]),.chip_in(res_sel_3[2]));


si_bit scan_cell_11_3(.phi(phi_int[179]),.phib(phib_int[179]),
.scan_i0o1(scan_i0o1_int[179]),.load(load_int[179]),.scan_in(scan_int[179]),
.phi_out(phi_int[180]),.phib_out(phib_int[180]),.scan_i0o1_out(scan_i0o1_int[180]),
.load_out(load_int[180]),.scan_out(scan_int[180]),.chip_in(res_sel_3[3]));


si_bit scan_cell_11_4(.phi(phi_int[180]),.phib(phib_int[180]),
.scan_i0o1(scan_i0o1_int[180]),.load(load_int[180]),.scan_in(scan_int[180]),
.phi_out(phi_int[181]),.phib_out(phib_int[181]),.scan_i0o1_out(scan_i0o1_int[181]),
.load_out(load_int[181]),.scan_out(scan_int[181]),.chip_in(res_sel_3[4]));


si_bit scan_cell_11_5(.phi(phi_int[181]),.phib(phib_int[181]),
.scan_i0o1(scan_i0o1_int[181]),.load(load_int[181]),.scan_in(scan_int[181]),
.phi_out(phi_int[182]),.phib_out(phib_int[182]),.scan_i0o1_out(scan_i0o1_int[182]),
.load_out(load_int[182]),.scan_out(scan_int[182]),.chip_in(res_sel_3[5]));


si_bit scan_cell_11_6(.phi(phi_int[182]),.phib(phib_int[182]),
.scan_i0o1(scan_i0o1_int[182]),.load(load_int[182]),.scan_in(scan_int[182]),
.phi_out(phi_int[183]),.phib_out(phib_int[183]),.scan_i0o1_out(scan_i0o1_int[183]),
.load_out(load_int[183]),.scan_out(scan_int[183]),.chip_in(res_sel_3[6]));


si_bit scan_cell_11_7(.phi(phi_int[183]),.phib(phib_int[183]),
.scan_i0o1(scan_i0o1_int[183]),.load(load_int[183]),.scan_in(scan_int[183]),
.phi_out(phi_int[184]),.phib_out(phib_int[184]),.scan_i0o1_out(scan_i0o1_int[184]),
.load_out(load_int[184]),.scan_out(scan_int[184]),.chip_in(res_sel_3[7]));


si_bit scan_cell_11_8(.phi(phi_int[184]),.phib(phib_int[184]),
.scan_i0o1(scan_i0o1_int[184]),.load(load_int[184]),.scan_in(scan_int[184]),
.phi_out(phi_int[185]),.phib_out(phib_int[185]),.scan_i0o1_out(scan_i0o1_int[185]),
.load_out(load_int[185]),.scan_out(scan_int[185]),.chip_in(res_sel_3[8]));


si_bit scan_cell_11_9(.phi(phi_int[185]),.phib(phib_int[185]),
.scan_i0o1(scan_i0o1_int[185]),.load(load_int[185]),.scan_in(scan_int[185]),
.phi_out(phi_int[186]),.phib_out(phib_int[186]),.scan_i0o1_out(scan_i0o1_int[186]),
.load_out(load_int[186]),.scan_out(scan_int[186]),.chip_in(res_sel_3[9]));


si_bit scan_cell_11_10(.phi(phi_int[186]),.phib(phib_int[186]),
.scan_i0o1(scan_i0o1_int[186]),.load(load_int[186]),.scan_in(scan_int[186]),
.phi_out(phi_int[187]),.phib_out(phib_int[187]),.scan_i0o1_out(scan_i0o1_int[187]),
.load_out(load_int[187]),.scan_out(scan_int[187]),.chip_in(res_sel_3[10]));


so_bit scan_cell_12_0(.phi(phi_int[187]),.phib(phib_int[187]),
.scan_i0o1(scan_i0o1_int[187]),.load(load_int[187]),.scan_in(scan_int[187]),
.chip_out(conv1_res_test[0]),
.phi_out(phi_int[188]),.phib_out(phib_int[188]),.scan_i0o1_out(scan_i0o1_int[188]),
.load_out(load_int[188]),.scan_out(scan_int[188]));


so_bit scan_cell_12_1(.phi(phi_int[188]),.phib(phib_int[188]),
.scan_i0o1(scan_i0o1_int[188]),.load(load_int[188]),.scan_in(scan_int[188]),
.chip_out(conv1_res_test[1]),
.phi_out(phi_int[189]),.phib_out(phib_int[189]),.scan_i0o1_out(scan_i0o1_int[189]),
.load_out(load_int[189]),.scan_out(scan_int[189]));


so_bit scan_cell_12_2(.phi(phi_int[189]),.phib(phib_int[189]),
.scan_i0o1(scan_i0o1_int[189]),.load(load_int[189]),.scan_in(scan_int[189]),
.chip_out(conv1_res_test[2]),
.phi_out(phi_int[190]),.phib_out(phib_int[190]),.scan_i0o1_out(scan_i0o1_int[190]),
.load_out(load_int[190]),.scan_out(scan_int[190]));


so_bit scan_cell_12_3(.phi(phi_int[190]),.phib(phib_int[190]),
.scan_i0o1(scan_i0o1_int[190]),.load(load_int[190]),.scan_in(scan_int[190]),
.chip_out(conv1_res_test[3]),
.phi_out(phi_int[191]),.phib_out(phib_int[191]),.scan_i0o1_out(scan_i0o1_int[191]),
.load_out(load_int[191]),.scan_out(scan_int[191]));


so_bit scan_cell_12_4(.phi(phi_int[191]),.phib(phib_int[191]),
.scan_i0o1(scan_i0o1_int[191]),.load(load_int[191]),.scan_in(scan_int[191]),
.chip_out(conv1_res_test[4]),
.phi_out(phi_int[192]),.phib_out(phib_int[192]),.scan_i0o1_out(scan_i0o1_int[192]),
.load_out(load_int[192]),.scan_out(scan_int[192]));


so_bit scan_cell_12_5(.phi(phi_int[192]),.phib(phib_int[192]),
.scan_i0o1(scan_i0o1_int[192]),.load(load_int[192]),.scan_in(scan_int[192]),
.chip_out(conv1_res_test[5]),
.phi_out(phi_int[193]),.phib_out(phib_int[193]),.scan_i0o1_out(scan_i0o1_int[193]),
.load_out(load_int[193]),.scan_out(scan_int[193]));


so_bit scan_cell_12_6(.phi(phi_int[193]),.phib(phib_int[193]),
.scan_i0o1(scan_i0o1_int[193]),.load(load_int[193]),.scan_in(scan_int[193]),
.chip_out(conv1_res_test[6]),
.phi_out(phi_int[194]),.phib_out(phib_int[194]),.scan_i0o1_out(scan_i0o1_int[194]),
.load_out(load_int[194]),.scan_out(scan_int[194]));


so_bit scan_cell_12_7(.phi(phi_int[194]),.phib(phib_int[194]),
.scan_i0o1(scan_i0o1_int[194]),.load(load_int[194]),.scan_in(scan_int[194]),
.chip_out(conv1_res_test[7]),
.phi_out(phi_int[195]),.phib_out(phib_int[195]),.scan_i0o1_out(scan_i0o1_int[195]),
.load_out(load_int[195]),.scan_out(scan_int[195]));


so_bit scan_cell_13_0(.phi(phi_int[195]),.phib(phib_int[195]),
.scan_i0o1(scan_i0o1_int[195]),.load(load_int[195]),.scan_in(scan_int[195]),
.chip_out(conv2_res_test[0]),
.phi_out(phi_int[196]),.phib_out(phib_int[196]),.scan_i0o1_out(scan_i0o1_int[196]),
.load_out(load_int[196]),.scan_out(scan_int[196]));


so_bit scan_cell_13_1(.phi(phi_int[196]),.phib(phib_int[196]),
.scan_i0o1(scan_i0o1_int[196]),.load(load_int[196]),.scan_in(scan_int[196]),
.chip_out(conv2_res_test[1]),
.phi_out(phi_int[197]),.phib_out(phib_int[197]),.scan_i0o1_out(scan_i0o1_int[197]),
.load_out(load_int[197]),.scan_out(scan_int[197]));


so_bit scan_cell_13_2(.phi(phi_int[197]),.phib(phib_int[197]),
.scan_i0o1(scan_i0o1_int[197]),.load(load_int[197]),.scan_in(scan_int[197]),
.chip_out(conv2_res_test[2]),
.phi_out(phi_int[198]),.phib_out(phib_int[198]),.scan_i0o1_out(scan_i0o1_int[198]),
.load_out(load_int[198]),.scan_out(scan_int[198]));


so_bit scan_cell_13_3(.phi(phi_int[198]),.phib(phib_int[198]),
.scan_i0o1(scan_i0o1_int[198]),.load(load_int[198]),.scan_in(scan_int[198]),
.chip_out(conv2_res_test[3]),
.phi_out(phi_int[199]),.phib_out(phib_int[199]),.scan_i0o1_out(scan_i0o1_int[199]),
.load_out(load_int[199]),.scan_out(scan_int[199]));


so_bit scan_cell_13_4(.phi(phi_int[199]),.phib(phib_int[199]),
.scan_i0o1(scan_i0o1_int[199]),.load(load_int[199]),.scan_in(scan_int[199]),
.chip_out(conv2_res_test[4]),
.phi_out(phi_int[200]),.phib_out(phib_int[200]),.scan_i0o1_out(scan_i0o1_int[200]),
.load_out(load_int[200]),.scan_out(scan_int[200]));


so_bit scan_cell_13_5(.phi(phi_int[200]),.phib(phib_int[200]),
.scan_i0o1(scan_i0o1_int[200]),.load(load_int[200]),.scan_in(scan_int[200]),
.chip_out(conv2_res_test[5]),
.phi_out(phi_int[201]),.phib_out(phib_int[201]),.scan_i0o1_out(scan_i0o1_int[201]),
.load_out(load_int[201]),.scan_out(scan_int[201]));


so_bit scan_cell_13_6(.phi(phi_int[201]),.phib(phib_int[201]),
.scan_i0o1(scan_i0o1_int[201]),.load(load_int[201]),.scan_in(scan_int[201]),
.chip_out(conv2_res_test[6]),
.phi_out(phi_int[202]),.phib_out(phib_int[202]),.scan_i0o1_out(scan_i0o1_int[202]),
.load_out(load_int[202]),.scan_out(scan_int[202]));


so_bit scan_cell_13_7(.phi(phi_int[202]),.phib(phib_int[202]),
.scan_i0o1(scan_i0o1_int[202]),.load(load_int[202]),.scan_in(scan_int[202]),
.chip_out(conv2_res_test[7]),
.phi_out(phi_int[203]),.phib_out(phib_int[203]),.scan_i0o1_out(scan_i0o1_int[203]),
.load_out(load_int[203]),.scan_out(scan_int[203]));


so_bit scan_cell_14_0(.phi(phi_int[203]),.phib(phib_int[203]),
.scan_i0o1(scan_i0o1_int[203]),.load(load_int[203]),.scan_in(scan_int[203]),
.chip_out(conv3_res_test[0]),
.phi_out(phi_int[204]),.phib_out(phib_int[204]),.scan_i0o1_out(scan_i0o1_int[204]),
.load_out(load_int[204]),.scan_out(scan_int[204]));


so_bit scan_cell_14_1(.phi(phi_int[204]),.phib(phib_int[204]),
.scan_i0o1(scan_i0o1_int[204]),.load(load_int[204]),.scan_in(scan_int[204]),
.chip_out(conv3_res_test[1]),
.phi_out(phi_int[205]),.phib_out(phib_int[205]),.scan_i0o1_out(scan_i0o1_int[205]),
.load_out(load_int[205]),.scan_out(scan_int[205]));


so_bit scan_cell_14_2(.phi(phi_int[205]),.phib(phib_int[205]),
.scan_i0o1(scan_i0o1_int[205]),.load(load_int[205]),.scan_in(scan_int[205]),
.chip_out(conv3_res_test[2]),
.phi_out(phi_int[206]),.phib_out(phib_int[206]),.scan_i0o1_out(scan_i0o1_int[206]),
.load_out(load_int[206]),.scan_out(scan_int[206]));


so_bit scan_cell_14_3(.phi(phi_int[206]),.phib(phib_int[206]),
.scan_i0o1(scan_i0o1_int[206]),.load(load_int[206]),.scan_in(scan_int[206]),
.chip_out(conv3_res_test[3]),
.phi_out(phi_int[207]),.phib_out(phib_int[207]),.scan_i0o1_out(scan_i0o1_int[207]),
.load_out(load_int[207]),.scan_out(scan_int[207]));


so_bit scan_cell_14_4(.phi(phi_int[207]),.phib(phib_int[207]),
.scan_i0o1(scan_i0o1_int[207]),.load(load_int[207]),.scan_in(scan_int[207]),
.chip_out(conv3_res_test[4]),
.phi_out(phi_int[208]),.phib_out(phib_int[208]),.scan_i0o1_out(scan_i0o1_int[208]),
.load_out(load_int[208]),.scan_out(scan_int[208]));


so_bit scan_cell_14_5(.phi(phi_int[208]),.phib(phib_int[208]),
.scan_i0o1(scan_i0o1_int[208]),.load(load_int[208]),.scan_in(scan_int[208]),
.chip_out(conv3_res_test[5]),
.phi_out(phi_int[209]),.phib_out(phib_int[209]),.scan_i0o1_out(scan_i0o1_int[209]),
.load_out(load_int[209]),.scan_out(scan_int[209]));


so_bit scan_cell_14_6(.phi(phi_int[209]),.phib(phib_int[209]),
.scan_i0o1(scan_i0o1_int[209]),.load(load_int[209]),.scan_in(scan_int[209]),
.chip_out(conv3_res_test[6]),
.phi_out(phi_int[210]),.phib_out(phib_int[210]),.scan_i0o1_out(scan_i0o1_int[210]),
.load_out(load_int[210]),.scan_out(scan_int[210]));


so_bit scan_cell_14_7(.phi(phi_int[210]),.phib(phib_int[210]),
.scan_i0o1(scan_i0o1_int[210]),.load(load_int[210]),.scan_in(scan_int[210]),
.chip_out(conv3_res_test[7]),
.phi_out(phi_int[211]),.phib_out(phib_int[211]),.scan_i0o1_out(scan_i0o1_int[211]),
.load_out(load_int[211]),.scan_out(scan_int[211]));


so_bit scan_cell_15_0(.phi(phi_int[211]),.phib(phib_int[211]),
.scan_i0o1(scan_i0o1_int[211]),.load(load_int[211]),.scan_in(scan_int[211]),
.chip_out(data1_o[0]),
.phi_out(phi_int[212]),.phib_out(phib_int[212]),.scan_i0o1_out(scan_i0o1_int[212]),
.load_out(load_int[212]),.scan_out(scan_int[212]));


so_bit scan_cell_15_1(.phi(phi_int[212]),.phib(phib_int[212]),
.scan_i0o1(scan_i0o1_int[212]),.load(load_int[212]),.scan_in(scan_int[212]),
.chip_out(data1_o[1]),
.phi_out(phi_int[213]),.phib_out(phib_int[213]),.scan_i0o1_out(scan_i0o1_int[213]),
.load_out(load_int[213]),.scan_out(scan_int[213]));


so_bit scan_cell_15_2(.phi(phi_int[213]),.phib(phib_int[213]),
.scan_i0o1(scan_i0o1_int[213]),.load(load_int[213]),.scan_in(scan_int[213]),
.chip_out(data1_o[2]),
.phi_out(phi_int[214]),.phib_out(phib_int[214]),.scan_i0o1_out(scan_i0o1_int[214]),
.load_out(load_int[214]),.scan_out(scan_int[214]));


so_bit scan_cell_15_3(.phi(phi_int[214]),.phib(phib_int[214]),
.scan_i0o1(scan_i0o1_int[214]),.load(load_int[214]),.scan_in(scan_int[214]),
.chip_out(data1_o[3]),
.phi_out(phi_int[215]),.phib_out(phib_int[215]),.scan_i0o1_out(scan_i0o1_int[215]),
.load_out(load_int[215]),.scan_out(scan_int[215]));


so_bit scan_cell_15_4(.phi(phi_int[215]),.phib(phib_int[215]),
.scan_i0o1(scan_i0o1_int[215]),.load(load_int[215]),.scan_in(scan_int[215]),
.chip_out(data1_o[4]),
.phi_out(phi_int[216]),.phib_out(phib_int[216]),.scan_i0o1_out(scan_i0o1_int[216]),
.load_out(load_int[216]),.scan_out(scan_int[216]));


so_bit scan_cell_15_5(.phi(phi_int[216]),.phib(phib_int[216]),
.scan_i0o1(scan_i0o1_int[216]),.load(load_int[216]),.scan_in(scan_int[216]),
.chip_out(data1_o[5]),
.phi_out(phi_int[217]),.phib_out(phib_int[217]),.scan_i0o1_out(scan_i0o1_int[217]),
.load_out(load_int[217]),.scan_out(scan_int[217]));


so_bit scan_cell_15_6(.phi(phi_int[217]),.phib(phib_int[217]),
.scan_i0o1(scan_i0o1_int[217]),.load(load_int[217]),.scan_in(scan_int[217]),
.chip_out(data1_o[6]),
.phi_out(phi_int[218]),.phib_out(phib_int[218]),.scan_i0o1_out(scan_i0o1_int[218]),
.load_out(load_int[218]),.scan_out(scan_int[218]));


so_bit scan_cell_15_7(.phi(phi_int[218]),.phib(phib_int[218]),
.scan_i0o1(scan_i0o1_int[218]),.load(load_int[218]),.scan_in(scan_int[218]),
.chip_out(data1_o[7]),
.phi_out(phi_int[219]),.phib_out(phib_int[219]),.scan_i0o1_out(scan_i0o1_int[219]),
.load_out(load_int[219]),.scan_out(scan_int[219]));


so_bit scan_cell_16_0(.phi(phi_int[219]),.phib(phib_int[219]),
.scan_i0o1(scan_i0o1_int[219]),.load(load_int[219]),.scan_in(scan_int[219]),
.chip_out(data2_o[0]),
.phi_out(phi_int[220]),.phib_out(phib_int[220]),.scan_i0o1_out(scan_i0o1_int[220]),
.load_out(load_int[220]),.scan_out(scan_int[220]));


so_bit scan_cell_16_1(.phi(phi_int[220]),.phib(phib_int[220]),
.scan_i0o1(scan_i0o1_int[220]),.load(load_int[220]),.scan_in(scan_int[220]),
.chip_out(data2_o[1]),
.phi_out(phi_int[221]),.phib_out(phib_int[221]),.scan_i0o1_out(scan_i0o1_int[221]),
.load_out(load_int[221]),.scan_out(scan_int[221]));


so_bit scan_cell_16_2(.phi(phi_int[221]),.phib(phib_int[221]),
.scan_i0o1(scan_i0o1_int[221]),.load(load_int[221]),.scan_in(scan_int[221]),
.chip_out(data2_o[2]),
.phi_out(phi_int[222]),.phib_out(phib_int[222]),.scan_i0o1_out(scan_i0o1_int[222]),
.load_out(load_int[222]),.scan_out(scan_int[222]));


so_bit scan_cell_16_3(.phi(phi_int[222]),.phib(phib_int[222]),
.scan_i0o1(scan_i0o1_int[222]),.load(load_int[222]),.scan_in(scan_int[222]),
.chip_out(data2_o[3]),
.phi_out(phi_int[223]),.phib_out(phib_int[223]),.scan_i0o1_out(scan_i0o1_int[223]),
.load_out(load_int[223]),.scan_out(scan_int[223]));


so_bit scan_cell_16_4(.phi(phi_int[223]),.phib(phib_int[223]),
.scan_i0o1(scan_i0o1_int[223]),.load(load_int[223]),.scan_in(scan_int[223]),
.chip_out(data2_o[4]),
.phi_out(phi_int[224]),.phib_out(phib_int[224]),.scan_i0o1_out(scan_i0o1_int[224]),
.load_out(load_int[224]),.scan_out(scan_int[224]));


so_bit scan_cell_16_5(.phi(phi_int[224]),.phib(phib_int[224]),
.scan_i0o1(scan_i0o1_int[224]),.load(load_int[224]),.scan_in(scan_int[224]),
.chip_out(data2_o[5]),
.phi_out(phi_int[225]),.phib_out(phib_int[225]),.scan_i0o1_out(scan_i0o1_int[225]),
.load_out(load_int[225]),.scan_out(scan_int[225]));


so_bit scan_cell_16_6(.phi(phi_int[225]),.phib(phib_int[225]),
.scan_i0o1(scan_i0o1_int[225]),.load(load_int[225]),.scan_in(scan_int[225]),
.chip_out(data2_o[6]),
.phi_out(phi_int[226]),.phib_out(phib_int[226]),.scan_i0o1_out(scan_i0o1_int[226]),
.load_out(load_int[226]),.scan_out(scan_int[226]));


so_bit scan_cell_16_7(.phi(phi_int[226]),.phib(phib_int[226]),
.scan_i0o1(scan_i0o1_int[226]),.load(load_int[226]),.scan_in(scan_int[226]),
.chip_out(data2_o[7]),
.phi_out(phi_int[227]),.phib_out(phib_int[227]),.scan_i0o1_out(scan_i0o1_int[227]),
.load_out(load_int[227]),.scan_out(scan_int[227]));


so_bit scan_cell_17_0(.phi(phi_int[227]),.phib(phib_int[227]),
.scan_i0o1(scan_i0o1_int[227]),.load(load_int[227]),.scan_in(scan_int[227]),
.chip_out(circ_inter[0]),
.phi_out(phi_int[228]),.phib_out(phib_int[228]),.scan_i0o1_out(scan_i0o1_int[228]),
.load_out(load_int[228]),.scan_out(scan_int[228]));


so_bit scan_cell_17_1(.phi(phi_int[228]),.phib(phib_int[228]),
.scan_i0o1(scan_i0o1_int[228]),.load(load_int[228]),.scan_in(scan_int[228]),
.chip_out(circ_inter[1]),
.phi_out(phi_int[229]),.phib_out(phib_int[229]),.scan_i0o1_out(scan_i0o1_int[229]),
.load_out(load_int[229]),.scan_out(scan_int[229]));


so_bit scan_cell_17_2(.phi(phi_int[229]),.phib(phib_int[229]),
.scan_i0o1(scan_i0o1_int[229]),.load(load_int[229]),.scan_in(scan_int[229]),
.chip_out(circ_inter[2]),
.phi_out(phi_int[230]),.phib_out(phib_int[230]),.scan_i0o1_out(scan_i0o1_int[230]),
.load_out(load_int[230]),.scan_out(scan_int[230]));


so_bit scan_cell_17_3(.phi(phi_int[230]),.phib(phib_int[230]),
.scan_i0o1(scan_i0o1_int[230]),.load(load_int[230]),.scan_in(scan_int[230]),
.chip_out(circ_inter[3]),
.phi_out(phi_int[231]),.phib_out(phib_int[231]),.scan_i0o1_out(scan_i0o1_int[231]),
.load_out(load_int[231]),.scan_out(scan_int[231]));


so_bit scan_cell_17_4(.phi(phi_int[231]),.phib(phib_int[231]),
.scan_i0o1(scan_i0o1_int[231]),.load(load_int[231]),.scan_in(scan_int[231]),
.chip_out(circ_inter[4]),
.phi_out(phi_int[232]),.phib_out(phib_int[232]),.scan_i0o1_out(scan_i0o1_int[232]),
.load_out(load_int[232]),.scan_out(scan_int[232]));


so_bit scan_cell_17_5(.phi(phi_int[232]),.phib(phib_int[232]),
.scan_i0o1(scan_i0o1_int[232]),.load(load_int[232]),.scan_in(scan_int[232]),
.chip_out(circ_inter[5]),
.phi_out(phi_int[233]),.phib_out(phib_int[233]),.scan_i0o1_out(scan_i0o1_int[233]),
.load_out(load_int[233]),.scan_out(scan_int[233]));


so_bit scan_cell_17_6(.phi(phi_int[233]),.phib(phib_int[233]),
.scan_i0o1(scan_i0o1_int[233]),.load(load_int[233]),.scan_in(scan_int[233]),
.chip_out(circ_inter[6]),
.phi_out(phi_int[234]),.phib_out(phib_int[234]),.scan_i0o1_out(scan_i0o1_int[234]),
.load_out(load_int[234]),.scan_out(scan_int[234]));


so_bit scan_cell_17_7(.phi(phi_int[234]),.phib(phib_int[234]),
.scan_i0o1(scan_i0o1_int[234]),.load(load_int[234]),.scan_in(scan_int[234]),
.chip_out(circ_inter[7]),
.phi_out(phi_int[235]),.phib_out(phib_int[235]),.scan_i0o1_out(scan_i0o1_int[235]),
.load_out(load_int[235]),.scan_out(scan_int[235]));


so_bit scan_cell_17_8(.phi(phi_int[235]),.phib(phib_int[235]),
.scan_i0o1(scan_i0o1_int[235]),.load(load_int[235]),.scan_in(scan_int[235]),
.chip_out(circ_inter[8]),
.phi_out(phi_int[236]),.phib_out(phib_int[236]),.scan_i0o1_out(scan_i0o1_int[236]),
.load_out(load_int[236]),.scan_out(scan_int[236]));


so_bit scan_cell_17_9(.phi(phi_int[236]),.phib(phib_int[236]),
.scan_i0o1(scan_i0o1_int[236]),.load(load_int[236]),.scan_in(scan_int[236]),
.chip_out(circ_inter[9]),
.phi_out(phi_out),.phib_out(phib_out),.scan_i0o1_out(scan_i0o1_out),.load_out(load_out),.scan_out(scan_out));

endmodule
