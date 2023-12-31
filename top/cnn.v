module cnn(
	input wire clk,
	input wire rst_n,
	input wire write_en,        //IO
	input wire [39:0] scan_i,   //scan_chain_i(input)
	input wire [71:0] data_w,   //scan_chain_i
	input wire [9:0] addr_w,    //scan_chain_i
	input wire [23:0] bias_i,   //sacn_chain_i(conv1)
	input wire sta,
	
	output wire valid_o,
	output wire [7:0] data1_o,
	output wire [7:0] data2_o,

	//test
    input wire [5:0] res_sel_1,  //0-39, 40
    input wire [5:0] res_sel_1_num,  //0-63, 64
	input wire [10:0] res_sel_2,  //0-1151, 1152
	input wire [5:0] res_sel_3,   //0-35, 36
 	input wire [4:0] res_sel_3_num, //0-31,32

	output wire [7:0] conv1_res_test,  //scan_chain_o
	output wire [7:0] conv2_res_test,  //scan_chain_o
	output wire [7:0] conv3_res_test,  //scan_chain_o
	output wire [9:0] circ_inter       //scan_chain_o
);

//
wire conv1_valid_o_rescaled;
wire [8*40-1:0] conv1_ofmap_rescaled;

wire conv2_valid_o_rescaled;
wire [8*36*32-1:0] conv2_data_o_rescaled;

wire conv3_valid_o_rescaled;
wire [36*8-1:0] conv3_data_o_rescaled;

wire maxpool_valid_o;
wire [9*8-1 :0] maxpool_output;


//sram
wire [72-1:0] data_r;
wire [9:0] addr;
wire we;
wire me;

wire [8*9-1:0] weight_1;
wire [8*9-1:0] weight_2;
wire [8*32-1:0] weight_3;
wire [8*9-1:0] weight_fc1;
wire [8*9-1:0] weight_fc2;
wire [16-1:0] bias_2;
wire [16-1:0] bias_3;
wire [32-1:0] bias_fc;


sadslspkb1p576x72m4b1w0cp0d0t0 u_sram(
    .Q(data_r), 
	.ADR(addr), 
	.D(data_w),  //data_w
	.WE(we), 
	.ME(me), 
	.CLK(clk) 
	//.TEST1, RME, RM
);

//test
test_top u_test_top(
	.clk(clk),
	.rst_n(rst_n),
	
    .res_sel_1(res_sel_1),  
	.res_sel_1_num(res_sel_1_num),	
	.res_sel_2(res_sel_2),  
	.res_sel_3(res_sel_3),
	.res_sel_3_num(res_sel_3_num),  
	
	.conv1_valid_o_rescaled(conv1_valid_o_rescaled),
	.conv2_valid_o_rescaled(conv2_valid_o_rescaled),
	.conv3_valid_o_rescaled(conv3_valid_o_rescaled),
	.conv1_ofmap_rescaled(conv1_ofmap_rescaled),
	.conv2_data_o_rescaled(conv2_data_o_rescaled),
	.conv3_data_o_rescaled(conv3_data_o_rescaled),
	.conv1_res_test(conv1_res_test),
	.conv2_res_test(conv2_res_test),
	.conv3_res_test(conv3_res_test),
	
	.valid_o(valid_o),
	.circ_inter(circ_inter)	
);


//sram
sram_top u_sram_top(
	.clk(clk),
	.rst_n(rst_n),
	.write_en(write_en),
	.data_w(data_w), 
	.addr_w(addr_w),
	
	.sta(sta),
	.conv2_valid_i(conv1_valid_o_rescaled),
	.conv3_valid_i(conv2_valid_o_rescaled),
	.fc_valid_i(maxpool_valid_o),
	.data_r(data_r),
	
	.weight_1(weight_1),
	.weight_2(weight_2),
	.weight_3(weight_3),
	.weight_fc1(weight_fc1),
	.weight_fc2(weight_fc2),
	.bias_2(bias_2),
	.bias_3(bias_3),
	.bias_fc(bias_fc),
	.addr(addr),
	.me(me),
	.we(we)
);


conv_1st_top u_conv_1st_top(
		.clk(clk),
		.rst_n(rst_n),
		.sta(sta),
		.scan_i(scan_i),
		.bias_i(bias_i),
		.weight_i(weight_1),
		
		.conv_o(conv1_ofmap_rescaled),
		.valid_o(conv1_valid_o_rescaled)
	);


conv2_top u_conv2_top(
		.clk(clk),
		.rst_n(rst_n),
		.data_in(conv1_ofmap_rescaled),
		.valid_i(conv1_valid_o_rescaled),
		.weight(weight_2),
		.bias(bias_2),
		
		.valid_o(conv2_valid_o_rescaled),
		.data_o(conv2_data_o_rescaled)
	);

PWConv_top 
#(.DATA_W(8), .FILTER_W(8), .BIAS_W(16), .PIXEL_ROW(18), .PIXEL_COL(2), .INPUT_NUM(36), .OUTPUT_NUM(36)
)u_conv3_top(
		.clk(clk),
		.rst_n(rst_n),
		.pwconv_valid_i(conv2_valid_o_rescaled),
		.pwconv_pixel_i(conv2_data_o_rescaled),
		.pwconv_weight_i(weight_3),
		.pwconv_bias_i(bias_3),
		
		.pwconv_pixel_o(conv3_data_o_rescaled),
		.pwconv_valid_o(conv3_valid_o_rescaled)
	);
	
maxpool u_maxpool(
		.clk(clk),
		.rst_n(rst_n),
		.maxpool_valid_i(conv3_valid_o_rescaled),
		.maxpool_input(conv3_data_o_rescaled),
		
		.maxpool_valid_o(maxpool_valid_o),
		.maxpool_output(maxpool_output)
	);

fc_top u_fc_top(
	.clk(clk),
	.rst_n(rst_n),
	.valid_i(maxpool_valid_o),
	.data_in(maxpool_output),
	.weight1(weight_fc1),
	.weight2(weight_fc2),
	.bias(bias_fc),
	
	.valid_o(valid_o),
	.data1_o(data1_o),
	.data2_o(data2_o)
);

endmodule 
