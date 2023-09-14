//////////////////////////////////////////////////////////////////////////////////
// School: SJTU
// Author: Zhihong Chen
//
// Create Date: 2023/8/27
// Module Name: PWConv
// Project Name: DSCNN 3rd convolution Design
// Description:
//
// Revision: 
// Additional Comments:
//
//////////////////////////////////////////////////////////////////////////////////

module PWConv 
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
			input wire pwconv_calc_en,
			input wire signed [32*INPUT_NUM*DATA_W-1:0] pwconv_pixel_i,
			input wire signed [32*FILTER_W-1:0] weight_i,
			input wire signed [BIAS_W-1:0] bias_i,
			
			output reg signed [OUTPUT_NUM*(DATA_W+FILTER_W+6)-1:0] pwconv_pixel_o ,
			output reg                          pwconv_valid_o
);

reg en;
reg [4:0] cnt; 
wire flush;

wire signed [DATA_W-1:0] pixel_div [31:0][INPUT_NUM-1:0];
wire signed [FILTER_W-1:0] weight_div [31:0];

reg  signed [DATA_W-1:0] para_pixel_conn_1 [INPUT_NUM-1:0];
reg  signed [DATA_W-1:0] para_pixel_conn_2 [INPUT_NUM-1:0];
reg  signed [FILTER_W-1:0] para_weight_1;
reg  signed [FILTER_W-1:0] para_weight_2;

wire signed [(DATA_W+FILTER_W+6)-1:0] pixel_o [INPUT_NUM-1:0];

//----------------- control -------------------//
always @(posedge clk or negedge rst_n) begin
	if (!rst_n)
		en <= 1'b0;
	else if (pwconv_calc_en)
		en <= 1'b1;
	else if (cnt == 5'd16)
		en <= 1'b0;
	else 
	    en <= en;
end


always @(posedge clk or negedge rst_n) begin
	if (!rst_n)
		cnt <= 5'b0;
	else if (cnt == 5'd17)
		cnt <= 5'b0;
	else if (pwconv_calc_en | en)
		cnt <= cnt + 1'b1;
end

assign flush = (cnt == 5'd2)? 1'b1 : 1'b0;

//----------------- divide(pwconv_pixel_i and weight) -------------------//
genvar pixel_num, pixel_grain;
generate 
	for (pixel_num=0; pixel_num<32; pixel_num = pixel_num +1) 
	begin: PIXEL_NUM_ALLOCATION
		for (pixel_grain=0; pixel_grain<INPUT_NUM; pixel_grain=pixel_grain+1)
		begin: PIXEL_ALLOCATION
			assign pixel_div[pixel_num][pixel_grain] = pwconv_pixel_i[(pixel_num*INPUT_NUM+pixel_grain+1)*DATA_W -1-:DATA_W];
		end
	end
endgenerate

genvar weight_num;
generate 
	for (weight_num=0; weight_num<32; weight_num = weight_num +1) 
	begin: WEIGHT_ALLOCATION
		assign weight_div[weight_num] = weight_i[(weight_num+1)*FILTER_W -1-:FILTER_W];
	end
endgenerate

//----------------- input (pwconv_pixel_i and weight) -------------------//
genvar input_allo;
generate 
	for (input_allo=0; input_allo<INPUT_NUM; input_allo = input_allo +1) 
	begin: INPUT_ALLOCATION
		always @(posedge clk or negedge rst_n) begin
			if (!rst_n) begin
				para_pixel_conn_1[input_allo] <= 0;
				para_pixel_conn_2[input_allo] <= 0;
				
			end
			else if (cnt < 5'd16) begin
				para_pixel_conn_1[input_allo] <= pixel_div[2*cnt][input_allo];
				para_pixel_conn_2[input_allo] <= pixel_div[2*cnt+1][input_allo];
			end
		end
	end
endgenerate

always @(posedge clk or negedge rst_n) begin
	if (!rst_n) begin
		para_weight_1 <= 0;
		para_weight_2 <= 0;
	end
	else if (cnt < 5'd16) begin
		para_weight_1 <= weight_div[2*cnt];
		para_weight_2 <= weight_div[2*cnt+1];
	end
end		

//----------------------------- output ---------------------------//
always @(posedge clk or negedge rst_n) begin
	if (!rst_n)
		pwconv_valid_o <= 1'b0;
	else if (pwconv_valid_o)
		pwconv_valid_o <= 1'b0;
	else if (cnt == 5'd17)
		pwconv_valid_o <= 1'b1;
end		


genvar output_allo;
generate 
	for (output_allo = 0;output_allo<INPUT_NUM;output_allo= output_allo+1)
	begin: OUTPUT_ALLOCATION
		always @(posedge clk or negedge rst_n) begin
			if (!rst_n)
				pwconv_pixel_o[(output_allo+1)*(DATA_W+FILTER_W+6)-1-:(DATA_W+FILTER_W+6)] <= 0;
			else if (cnt == 5'd17)
				pwconv_pixel_o[(output_allo+1)*(DATA_W+FILTER_W+6)-1-:(DATA_W+FILTER_W+6)] <= pixel_o[output_allo];
			else
			    pwconv_pixel_o[(output_allo+1)*(DATA_W+FILTER_W+6)-1-:(DATA_W+FILTER_W+6)] <= 0;
		end			
	end
endgenerate


//----------------------------- pe ---------------------------//
genvar PE_num;
generate
    for (PE_num = 0; PE_num < INPUT_NUM; PE_num = PE_num + 1)
    begin: PE_ARRAY
		PWConv_pe 
			#(.DATA_W(DATA_W), .FILTER_W(FILTER_W), .BIAS_W(BIAS_W))
		u_PWConv_pe( // Call module PE_1st
				   .clk(clk),
				   .rst_n(rst_n),
				   
				   .flush(flush),
				   .en(en),
				   .weight_i_1(para_weight_1),
				   .weight_i_2(para_weight_2),
				   .bias_i(bias_i),
				   .pixel_i_1(para_pixel_conn_1[PE_num]),
				   .pixel_i_2(para_pixel_conn_2[PE_num]),
				   // For PE(i,j), the corresponding weight input is weight(i), pixel input is pixel(i+j)

				   .pixel_o(pixel_o[PE_num])
			   );

    end
endgenerate

endmodule 

