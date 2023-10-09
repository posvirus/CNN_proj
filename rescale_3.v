//////////////////////////////////////////////////////////////////////////////////
// School: SJTU
// Author: 
//
// Create Date: 
// Module Name: rescale_3
// Project Name: DSCNN 3rd layer design
// Description: DSCNN 3rd layer rescale unit
//
// Revision:
// Additional Comments: Modified by Zhihong Chen, 2023/9/7.
//
//////////////////////////////////////////////////////////////////////////////////

module rescale_3
#(
	parameter INPUT_W = 22,
	parameter OUTPUT_W = 8
)
	(
		input  [INPUT_W-1:0]  data_i,
		output [OUTPUT_W-1:0] data_o
	);

parameter M0 = 7'b1000101; //M0 = 69
parameter n = 13; //n = 13

wire [INPUT_W+7-1:0] data_big;

assign data_big = data_i[INPUT_W-1]? {(INPUT_W+7){1'b0}} : data_i * M0; //ReLu
assign data_o = data_big[28:20]? 8'h7f : data_big[20:13]; //data_o = data_big[28:n+7]?8'h7f:data_big[n+7:n];

endmodule 