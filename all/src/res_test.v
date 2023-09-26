//////////////////////////////////////////////////////////////////////////////////
// School: Shanghai Jiao Tong University
// Author: Shuoqi Fu
//
// Create Date: 
// Module Name: res test
// Project Name: CNN 
// Description: The test module, mainly testing the result of each layer.
//
// Revision:
//
//////////////////////////////////////////////////////////////////////////////////

module res_test(
	input clk,
	input rst_n,

    //select number
    input wire [11:0] res_sel_1,  //0-2559, 2560
	input wire [10:0] res_sel_2,  //0-1151, 1152
	input wire [10:0] res_sel_3,   //0-1151, 1152
	
	//valid
	input wire conv1_valid_o_rescaled,
	input wire conv2_valid_o_rescaled,
	input wire conv3_valid_o_rescaled,
	
	//data_i
	input wire [8*40-1:0]conv1_ofmap_rescaled,
	input wire [8*36*32-1:0]conv2_data_o_rescaled,
	input wire [8*36-1:0] conv3_data_o_rescaled,
	
	//data_o
	output reg [7:0] conv1_res_test,
	output reg [7:0] conv2_res_test,
	output reg [7:0] conv3_res_test
);


reg [5:0] conv1_num;  //0-63
reg [4:0] conv3_num;  //0-31

//conv1
always @(posedge clk or negedge rst_n) begin
	if (!rst_n)
		conv1_num <= 0;
	else if (conv1_valid_o_rescaled) begin
		if (conv1_num == 6'd63)
			conv1_num <= 0;
		else
			conv1_num <= conv1_num + 1'b1;
	end
end

always @(posedge clk or negedge rst_n) begin
	if (!rst_n)
		conv1_res_test <= 0;
	else if (conv1_valid_o_rescaled && ((res_sel_1/40) == conv1_num)) 
		conv1_res_test <= conv1_ofmap_rescaled[(res_sel_1%40+1)*8 -1-:8];
end

//conv2
always @(posedge clk or negedge rst_n) begin
	if (!rst_n)
		conv2_res_test <= 0;
	else if (conv2_valid_o_rescaled) 
		conv2_res_test <= conv2_data_o_rescaled[(res_sel_2+1)*8 -1-:8];
end

//conv3
always @(posedge clk or negedge rst_n) begin
	if (!rst_n)
		conv3_num <= 0;
	else if (conv3_valid_o_rescaled) begin
		if (conv3_num == 5'd31)
			conv3_num <= 0;
		else
			conv3_num <= conv3_num + 1'b1;
	end
end

always @(posedge clk or negedge rst_n) begin
	if (!rst_n)
		conv3_res_test <= 0;
	else if (conv3_valid_o_rescaled && ((res_sel_3/36) == conv3_num)) 
		conv3_res_test <= conv3_data_o_rescaled[(res_sel_3%36+1)*8 -1-:8];
end


endmodule 
