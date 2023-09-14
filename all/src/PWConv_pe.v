//////////////////////////////////////////////////////////////////////////////////
// School: SJTU
// Author: Shuoqi Fu
//
// Create Date: 2023/8/10
// Module Name: PWConv_pe
// Project Name: DSCNN 3rd convolution Design
// Description: 
//
// Revision: 
// Additional Comments: Modified by Zhihong Chen, 2023/9/5.
//
//////////////////////////////////////////////////////////////////////////////////

module PWConv_pe #
(
	parameter DATA_W = 8,
	parameter FILTER_W = 8,
	parameter BIAS_W = 16
)
(
		input clk,
		input rst_n,
		input wire flush,
		input wire en,
		input wire signed [FILTER_W-1:0] weight_i_1, //8 * 32 - 1 = 255
		input wire signed [FILTER_W-1:0] weight_i_2, //8 * 32 - 1 = 255
 		input wire signed [DATA_W-1:0] pixel_i_1, //8 * 32 - 1 = 255
 		input wire signed [DATA_W-1:0] pixel_i_2, //8 * 32 - 1 = 255
		input wire signed [BIAS_W-1:0] bias_i,
		
		output wire signed  [(DATA_W+FILTER_W+6)-1:0] pixel_o
		);


reg signed [DATA_W+FILTER_W-1:0] multi_o_1;
reg signed [DATA_W+FILTER_W-1:0] multi_o_2;

// MAC caculation
always @(posedge clk or negedge rst_n) begin
	if (!rst_n)
		multi_o_1 <= {(DATA_W+FILTER_W){1'b0}};
	else 
		multi_o_1 <= weight_i_1*pixel_i_1;
end

always @(posedge clk or negedge rst_n) begin
	if (!rst_n)
		multi_o_2 <= {(DATA_W+FILTER_W){1'b0}};
	else 
		multi_o_2 <= weight_i_2*pixel_i_2;
end


accumulator_pwconv 
			#(.DATA_W(DATA_W), .FILTER_W(FILTER_W), .BIAS_W(BIAS_W))
u_accumulator_pwconv( // Call module accumulator
                .clk(clk),
                .rst_n(rst_n),
                .flush(flush),
				.en(en),
                .data_i_1(multi_o_1),
                .data_i_2(multi_o_2),
				.bias_i(bias_i),

                .result_o(pixel_o) // Output allocation
            );

endmodule 
