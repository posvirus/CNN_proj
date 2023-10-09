//////////////////////////////////////////////////////////////////////////////////
// School: SJTU
// Author: Shuoqi Fu
//
// Create Date: 2023/8/10
// Module Name: accumulator
// Project Name: DSCNN 3rd convolution Design
// Description: The accumulator, with Synchronous enable and flush function
//
// Revision: 
// Additional Comments: Modified by Zhihong Chen, 2023/9/7.
//
//////////////////////////////////////////////////////////////////////////////////

module accumulator_pwconv
#(
	parameter DATA_W = 8,
	parameter FILTER_W = 8,
	parameter BIAS_W = 16
)
       (
           input  wire                         clk,
           input  wire                         rst_n,
           input  wire                         flush,
		   input  wire                         en,
           input  wire signed [DATA_W+FILTER_W-1:0]   data_i_1, // Data input
           input  wire signed [DATA_W+FILTER_W-1:0]   data_i_2, // Data input
		   input  wire signed [BIAS_W-1:0]            bias_i,

           output reg signed [(DATA_W+FILTER_W+6)-1:0]    result_o // Accumulator output
       );

always @(posedge clk or negedge rst_n) // result_o
begin
    if (!rst_n)
        result_o <= {((DATA_W+FILTER_W+6)-1){1'b0}};
    else if (flush)
        result_o <= bias_i + data_i_1 + data_i_2;
    else if (en)
        result_o <= result_o + data_i_1 + data_i_2;
end

endmodule