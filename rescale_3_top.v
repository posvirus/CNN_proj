//////////////////////////////////////////////////////////////////////////////////
// School: SJTU
// Author: Zhihong Chen
//
// Create Date: 2023/9/6
// Module Name: rescale_3_top
// Project Name: DSCNN 3rd layer design
// Description: rescale 36 numbers in one clk
//
// Revision:
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////

module rescale_3_top 
           #(
            parameter INPUT_WIDTH = 22,
		    parameter OUTPUT_WIDTH = 8,
			parameter RESCALE_NUM = 36
			)(
			input wire clk,
			input wire rst_n,
			
			input wire [INPUT_WIDTH * RESCALE_NUM - 1 : 0] data_i,
			input wire valid_i,
			
			output reg [OUTPUT_WIDTH * RESCALE_NUM - 1 : 0] data_o, //all output in one period
			output reg valid_o
			);

wire [OUTPUT_WIDTH * RESCALE_NUM - 1 : 0] data_o_temp;

always@(posedge clk or negedge rst_n) begin
	if (!rst_n)
		valid_o <= 1'b0;
	else if (valid_i)
	    valid_o <= 1'b1;
	else
		valid_o <= 1'b0;
end

always@(posedge clk or negedge rst_n) begin
	if (!rst_n)
		data_o <= {(OUTPUT_WIDTH * RESCALE_NUM - 1){1'b0}};
	else if (valid_i)
	    data_o <= data_o_temp;
	else
		data_o <= data_o;
end

			
genvar rescale_index;
generate
    for (rescale_index = 0; rescale_index < RESCALE_NUM; rescale_index = rescale_index + 1)
    begin: RESCALE_ARRAY
		rescale_3 
		#(.INPUT_W(INPUT_WIDTH), .OUTPUT_W(OUTPUT_WIDTH))
		u_rescale_3( // Call module PE_1st
            .data_i(data_i[INPUT_WIDTH * (rescale_index+1) - 1 -: INPUT_WIDTH]),
			.data_o(data_o_temp[OUTPUT_WIDTH * (rescale_index+1) - 1 -: OUTPUT_WIDTH])
			   );

    end
endgenerate

endmodule
