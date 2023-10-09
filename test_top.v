//////////////////////////////////////////////////////////////////////////////////
// School: Shanghai Jiao Tong University
// Author: Shuoqi Fu
//
// Create Date: 
// Module Name: test_top
// Project Name: CNN 
// Description: The test module, mainly testing the function of CNN.
//
// Revision:
//
//////////////////////////////////////////////////////////////////////////////////

module test_top(
	input clk,
	input rst_n,
	
    //res_test
    input wire [5:0] res_sel_1,      //0-39, 40
    input wire [5:0] res_sel_1_num,  //0-63, 64
	input wire [10:0] res_sel_2,     //0-1151, 1152
	input wire [5:0] res_sel_3,      //0-35, 36
 	input wire [4:0] res_sel_3_num,  //0-31,32
	input wire conv1_valid_o_rescaled,
	input wire conv2_valid_o_rescaled,
	input wire conv3_valid_o_rescaled,
	input wire [8*40-1:0]conv1_ofmap_rescaled,
	input wire [8*36*32-1:0]conv2_data_o_rescaled,
	input wire [8*36-1:0] conv3_data_o_rescaled,
	output wire [7:0] conv1_res_test,
	output wire [7:0] conv2_res_test,
	output wire [7:0] conv3_res_test,
	
	//circ_test
	input wire valid_o,   
	output wire [9:0] circ_inter   
);

circ_test u_circ_test(
	.clk(clk),
	.rst_n(rst_n),
	
	.valid_o(valid_o),
	.circ_inter(circ_inter)
);

res_test u_res_test(
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
	.conv3_res_test(conv3_res_test)
);


endmodule 
