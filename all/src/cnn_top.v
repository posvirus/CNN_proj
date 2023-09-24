module cnn_top(
	 //clkgen
	clk_signal_ext,rst_n,clk_div1024_out,
	
	//cnn
	write_en,
	
	
	//scan
	phi,phib,phi_out,scan_i0o1,load,scan_in,scan_out,phib_out,scan_i0o1_out,load_out
);

//clk
input clk_signal_ext,rst_n;
output clk_div1024_out;

//cnn
input write_en;

//scan
input phi,phib,scan_i0o1,load,scan_in;
output scan_out,phi_out,phib_out,scan_i0o1_out,load_out;

//module wire
wire clk_out;
wire scan_clk_sel;
wire scan_clk_start;
wire [2:0] scan_tap_sel;
wire [1:0] scan_internal_div_sel;

wire [39:0] scan_i; 
wire [71:0] data_w;
wire [9 :0] addr_w;
wire [23:0] bias_i;
wire sta;
wire valid_o;
wire [7:0] data1_out;
wire [7:0] data2_out;
wire [11:0] res_sel_1;
wire [10:0] res_sel_2;
wire [10:0] res_sel_3;
wire [7:0] conv1_res_test;
wire [7:0] conv2_res_test;
wire [7:0] conv3_res_test;
wire [9:0] circ_inter;


cnn inst_cnn(
	.clk(clk_out),
	.rst_n(rst_n),

	.write_en(write_en),
	.scan_i(scan_i),
	.data_w(data_w),
	.addr_w(addr_w),
	.bias_i(bias_i),
	.sta(sta),

	.valid_o(valid_o),
	.data1_o(data1_out),
	.data2_o(data2_out),

	.res_sel_1(res_sel_1), 
	.res_sel_2(res_sel_2), 
	.res_sel_3(res_sel_3), 
	.conv1_res_test(conv1_res_test), 
	.conv2_res_test(conv2_res_test), 
	.conv3_res_test(conv3_res_test), 
	.circ_inter(circ_inter)
	
);

scan_chain_tt inst_scan_top(
    .scan_clk_sel(scan_clk_sel),
    .scan_clk_start(scan_clk_start),
    .scan_tap_sel(scan_tap_sel),
    .scan_internal_div_sel(scan_internal_div_sel),
	
	.scan_i(scan_i), 
	.bias_i(bias_i), 
	.data_w(data_w), 
	.addr_w(addr_w), 
	.sta(sta), 
	.res_sel_1(res_sel_1), 
	.res_sel_2(res_sel_2), 
	.res_sel_3(res_sel_3), 
	.conv1_res_test(conv1_res_test), 
	.conv2_res_test(conv2_res_test), 
	.conv3_res_test(conv3_res_test), 
	.data1_o(data1_out), 
	.data2_o(data2_out), 
	.circ_inter(circ_inter),
	
    .phi(phi),
    .phib(phib),
    .scan_i0o1(scan_i0o1),
    .load(load),
    .scan_in(scan_in),
    .phi_out(phi_out),
    .phib_out(phib_out),
    .scan_i0o1_out(scan_i0o1_out),
    .load_out(load_out),
    .scan_out(scan_out)
);

Ring_Oscillator inst_Ring_Oscillator(
	.rst_n(rst_n),
	.clk_signal_ext(clk_signal_ext),
	.clk_out(clk_out),
	.scan_clk_sel(scan_clk_sel),
	.scan_clk_start(scan_clk_start),
	.scan_tap_sel(scan_tap_sel),
	.scan_internal_div_sel(scan_internal_div_sel),
	.clk_div10_out(clk_div1024_out)
	);


endmodule