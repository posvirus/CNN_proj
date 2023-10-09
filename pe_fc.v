//////////////////////////////////////////////////////////////////////////////////
// School: Shanghai Jiao Tong University
// Author: Shuoqi Fu
//
// Create Date: 
// Module Name: pe_fc
// Project Name: CNN 
// Description: The pe of full connected layer
//
// Revision:
//
//////////////////////////////////////////////////////////////////////////////////

module pe_fc(
		input clk,
		input rst_n,
		input signed [7:0] data_i,
		input signed [7:0] weight_i,
		input signed [15:0] bias_i,
		input en,
		input bias_en,
		input flush,
		
		output reg signed [31:0] data_o
);

reg signed [15:0] mul;
reg signed [15:0] add;   //combination logic

always @(posedge clk or negedge rst_n) begin
	if (!rst_n)
		mul <= 0;
	else 
		mul <= data_i * weight_i;
end

always @(*) begin
	if (en)
		add = mul;
	else if (bias_en)
		add = bias_i;
	else
		add = 0;
end

always @(posedge clk or negedge rst_n) begin
	if (!rst_n)
		data_o <= 0;
	else if (flush)
		data_o <= mul;
	else 
		data_o <= data_o + add;
end




endmodule
