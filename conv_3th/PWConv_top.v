//////////////////////////////////////////////////////////////////////////////////
// School: SJTU
// Author: Zhihong Chen
//
// Create Date: 2023/9/5
// Module Name: conv3_top
// Project Name: DSCNN 3rd layer design
// Description: PWConv calculation and rescale to int8 
//
// Revision:
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////

module PWConv_top
#(
	parameter DATA_W = 8,
	parameter FILTER_W = 8,
	parameter BIAS_W = 16,
	parameter PIXEL_ROW = 18,
	parameter PIXEL_COL = 2,
	parameter INPUT_NUM = 36,
	parameter OUTPUT_NUM = 36
)
(
	input wire clk,
	input wire rst_n,
	
	input wire                                  pwconv_valid_i,  //connect to dwconv_valid_o
	input wire signed [32*INPUT_NUM*DATA_W-1:0] pwconv_pixel_i,
	input wire signed [32*1*1*DATA_W-1:0]       pwconv_weight_i,
	input wire signed [BIAS_W-1:0]              pwconv_bias_i,

	output wire signed [OUTPUT_NUM*DATA_W-1:0]  pwconv_pixel_o,
	output wire                                 pwconv_valid_o
);

reg [4:0] cnt;  //0-17 fine clk
reg [5:0] weight_num;    //0-32 coarse clk
reg pwconv_calc_en;

//------------------ control ----------------------//

reg signed [32*INPUT_NUM*DATA_W-1:0] pwconv_input_reg;
reg signed [32*1*1*DATA_W-1:0]       pwconv_weight_reg;
reg signed [BIAS_W-1:0]              pwconv_bias_reg;

wire signed [OUTPUT_NUM*(DATA_W+FILTER_W+6)-1:0] data_o_temp;
wire                                             valid_o_temp;


always @(posedge clk or negedge rst_n) begin
	if(!rst_n)
		cnt <= 5'd0;
	else if (weight_num == 6'd33)
	    cnt <= 5'd0;
	else if (pwconv_valid_i | cnt == 5'd18)
		cnt <= 5'd1;
	else if (cnt > 5'd0)
	    cnt <= cnt + 1'b1;
	else
	    cnt <= cnt;
end

always @(posedge clk or negedge rst_n) begin
    if (!rst_n)
	    pwconv_input_reg <= {(32*INPUT_NUM*DATA_W){1'b0}};
	else if (pwconv_valid_i)
	    pwconv_input_reg <= pwconv_pixel_i;
	else
	    pwconv_input_reg <= pwconv_input_reg;
end

always @(posedge clk or negedge rst_n) begin
    if (!rst_n)
	    pwconv_weight_reg <= {(32*1*1*DATA_W){1'b0}};
	else if (pwconv_valid_i | cnt == 5'd17)
	    pwconv_weight_reg <= pwconv_weight_i;
	else
	    pwconv_weight_reg <= pwconv_weight_reg;
end

always @(posedge clk or negedge rst_n) begin
    if (!rst_n)
	    pwconv_bias_reg <= {BIAS_W{1'b0}};
	else if (pwconv_valid_i | cnt == 5'd17)
	    pwconv_bias_reg <= pwconv_bias_i;
	else
	    pwconv_bias_reg <= pwconv_bias_reg;
end

always @(posedge clk or negedge rst_n) begin
	if (!rst_n)
		pwconv_calc_en <= 1'b0;
	else if (pwconv_calc_en)
		pwconv_calc_en <= 1'b0;
	else if (cnt == 5'd1) begin
		if (weight_num <= 6'd32)
			pwconv_calc_en <= 1'b1;
		else
			pwconv_calc_en <= 1'b0;
	end
	else
	    pwconv_calc_en <= pwconv_calc_en;
end

always @(posedge clk or negedge rst_n) begin
	if (!rst_n) 
	  weight_num <= 6'b0;
	else if (cnt == 5'd1) begin   //?
	  if (weight_num == 6'd33) 
		weight_num <= 6'b0;
	  else
		weight_num <= weight_num + 1'b1; 
	end
end


PWConv
#(.DATA_W(DATA_W), .FILTER_W(FILTER_W), .BIAS_W(BIAS_W), .PIXEL_ROW(PIXEL_ROW), .PIXEL_COL(PIXEL_COL), .INPUT_NUM(INPUT_NUM), .OUTPUT_NUM(OUTPUT_NUM))
u_PWConv(
	.clk(clk),
	.rst_n(rst_n),
	
    .pwconv_calc_en(pwconv_calc_en),
    .pwconv_pixel_i(pwconv_input_reg),
	.weight_i(pwconv_weight_reg),
	.bias_i(pwconv_bias_reg),
		   
	.pwconv_pixel_o(data_o_temp),
	.pwconv_valid_o(valid_o_temp)
);

rescale_3_top
#(.INPUT_WIDTH(DATA_W+FILTER_W+6), .OUTPUT_WIDTH(DATA_W), .RESCALE_NUM(OUTPUT_NUM))
u_rescale_3_top(
	.clk(clk),
	.rst_n(rst_n),
	
	.data_i(data_o_temp),
	.valid_i(valid_o_temp),
	
	.data_o(pwconv_pixel_o),
	.valid_o(pwconv_valid_o)
);

endmodule