module data_in_get(
	input [8*40-1:0] data_in_temp,
	input valid_i,
	input clk,
	input rst_n,
	input [8*9-1:0] weight,
	input [15:0] bias,
	input valid_o_conv2,
	output reg [8*9-1:0] weight_reg,
	output reg [15:0] bias_reg,
	output reg valid_o,
	output reg [20*4*8-1:0] data_out);
	
//reg valid_o;
//reg [20*4*8-1:0] data_out_temp;

reg [20*2*8-1:0] data_out_temp;
reg cnt;

always@(posedge clk or negedge rst_n)begin
	if(!rst_n) cnt <= 0;
	else if (valid_i) cnt <= ~cnt;
	else cnt <= cnt;
end

always@(posedge clk or negedge rst_n)begin
	if(!rst_n) weight_reg <= 0;
	else if(valid_i && cnt)weight_reg <= weight;
	else weight_reg <= weight_reg;
end

always@(posedge clk or negedge rst_n)begin
	if(!rst_n) bias_reg <= 0;
	else if(valid_i && cnt)bias_reg <= bias;
	else bias_reg <= bias_reg;
end

genvar i;
generate
	for(i=0;i<20;i=i+1)begin
		always@(posedge clk or negedge rst_n)begin
			if(!rst_n) begin
				data_out_temp[8*2*i +: 8] <= 0;
				data_out_temp[8*2*i+8 +: 8] <= 0;		
			end
			else if(valid_i && ~cnt)begin
				data_out_temp[8*2*i +: 8] <= data_in_temp[8*i +: 8];
				data_out_temp[8*2*i+8 +: 8] <= data_in_temp[8*20+8*i +: 8];
			end
			else begin
				data_out_temp[8*2*i +: 8] <= data_out_temp[8*2*i +: 8];
				data_out_temp[8*2*i+8 +: 8] <= data_out_temp[8*2*i+8 +: 8];	
			end
		end

		always@(posedge clk or negedge rst_n)begin
			if(!rst_n) begin
				data_out[8*4*i +: 8] <= 0;
				data_out[8*4*i+8 +: 8] <= 0;
				data_out[8*4*i+16 +: 8] <= 0;
				data_out[8*4*i+24 +:8] <= 0;
			end
			else if(valid_i && cnt) begin
				data_out[8*4*i +: 16] <= data_out_temp[8*2*i +:16];
				data_out[8*4*i+16 +: 8] <= data_in_temp[8*i +: 8];
				data_out[8*4*i+24 +: 8] <= data_in_temp[8*20+8*i +: 8];
			end
			else begin
				data_out[8*4*i +: 8] <= data_out[8*4*i +: 8];
				data_out[8*4*i+8 +: 8] <= data_out[8*4*i+8 +: 8];
				data_out[8*4*i+16 +: 8] <= data_out[8*4*i+16 +: 8];
				data_out[8*4*i+24 +:8] <= data_out[8*4*i+24 +: 8];
			end
		end
	end
endgenerate

always@(posedge clk or negedge rst_n)begin
	if(!rst_n)valid_o <= 0;
	else if(valid_i && cnt)valid_o <= 1;
	else if(valid_o_conv2)valid_o <= 0;
	else valid_o <= valid_o;
end

endmodule 