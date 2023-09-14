module conv2_top(
	input clk,
	input rst_n,
	input [8*40-1:0] data_in,
	input valid_i,
	input [8*3*3-1:0] weight,
	input [15:0] bias,
	output valid_o,
	output [8*18*2*32-1:0] data_o);

wire valid_i_conv2;
wire [8*80-1:0] data_in_conv2;

wire valid_o_conv2;
wire valid_o_conv2_1;
wire [8*18*2-1:0] data_o_conv2;

wire [8*9-1:0] weight_reg;
wire [15:0] bias_reg;

data_in_get data_in_get(
	.clk(clk),
	.rst_n(rst_n),
	.data_in_temp(data_in),
	.valid_i(valid_i),
	.weight(weight),
	.bias(bias),
	.weight_reg(weight_reg),
	.bias_reg(bias_reg),
	.valid_o_conv2(valid_o_conv2_1),
	.valid_o(valid_i_conv2),
	.data_out(data_in_conv2));

conv_2 conv_2(
	.clk(clk),
	.rst_n(rst_n),
	.data_i(data_in_conv2),
	.weight_i(weight_reg),
	.bias_i(bias_reg),
	.valid_i(valid_i_conv2),
	.valid_o_conv2(valid_o_conv2_1),
	.valid_o(valid_o_conv2),
	.data_o(data_o_conv2));

data_out_reg data_out_reg(
	.clk(clk),
	.rst_n(rst_n),
	.data_in(data_o_conv2),
	.valid_i(valid_o_conv2),
	.data_out(data_o),
	.valid_o(valid_o));



endmodule 