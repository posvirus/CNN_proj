//////////////////////////////////////////////////////////////////////////////////
// School: Shanghai Jiao Tong University
// Author: Shuoqi Fu
//
// Create Date: 
// Module Name: circ_test
// Project Name: CNN 
// Description: The test module, mainly testing the result of each layer.
//
// Revision:
//
//////////////////////////////////////////////////////////////////////////////////

module circ_test(
	input clk,
	input rst_n,

	input wire valid_o,   //equal to fc_valid_o 
	output reg [9:0] circ_inter    //expect to be 576
);

reg cnt_en;
reg cnt_en_n;

always @(posedge clk or negedge rst_n) begin
	if (!rst_n)
		cnt_en <= 1'b0;
	else if (valid_o)
		cnt_en <= ~cnt_en;
end

always @(posedge clk or negedge rst_n) begin
	if (!rst_n)
		cnt_en_n <= 1'b0;
	else if (valid_o && cnt_en)
		cnt_en_n <= 1'b1;
end

always @(posedge clk or negedge rst_n) begin
	if (!rst_n)
		circ_inter <= 0;
	else if (cnt_en && !cnt_en_n)
		circ_inter <= circ_inter + 1'b1;
end

endmodule 
