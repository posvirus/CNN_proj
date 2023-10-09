//////////////////////////////////////////////////////////////////////////////////
// School: Shanghai Jiao Tong University
// Author: Shuoqi Fu
//
// Create Date: 
// Module Name: fc_top
// Project Name: CNN 
// Description: The full connected layer 
//
// Revision:
//
//////////////////////////////////////////////////////////////////////////////////

module fc_top(
	input wire clk,
	input wire rst_n,
	input wire valid_i,
	input wire [9*8-1:0] data_in,
	input wire [9*8-1:0] weight1,
	input wire [9*8-1:0] weight2,
	input wire [31:0] bias,
	
	output reg valid_o,
	output reg [7:0] data1_o,
	output reg [7:0] data2_o
);

//---------------- internal signal--------------//
parameter M0 = 4'd11; //M0 = 11
parameter n = 15; //n = 15


reg [9*8-1:0] weight1_inst;
reg [9*8-1:0] weight2_inst;
reg [32-1:0]  bias_inst;

wire signed [7:0] input_div [8:0];
wire signed [7:0] weight1_div [8:0];
wire signed [7:0] weight2_div [8:0];
wire signed [15:0] bias1;
wire signed [15:0] bias2;

reg       fc_en;
reg [3:0] cnt;
reg [5:0] num_cnt;

reg pe_en;
reg bias_en;
reg flush;
reg signed [7:0] pe_data;
reg signed [7:0] pe_weight1;
reg signed [7:0] pe_weight2;

wire signed [31:0] data_o_1,data_o_2;
reg signed [35:0] data_big_1, data_big_2;

//---------------- data_prepare ------------------//
genvar input_allo;
generate for (input_allo=0; input_allo<9; input_allo=input_allo+1)
	begin: INPUT_ALLOCATION
		assign input_div[input_allo] = data_in[(input_allo+1)*8 -1-:8];	
	end
endgenerate

genvar weight_allo;
generate for (weight_allo=0; weight_allo<9; weight_allo=weight_allo+1)
	begin: WEIGHT_ALLOCATION
		assign weight1_div[weight_allo] = weight1_inst[(weight_allo+1)*8 -1-:8];	
		assign weight2_div[weight_allo] = weight2_inst[(weight_allo+1)*8 -1-:8];	
	end
endgenerate

assign bias1 = bias_inst[15:0];
assign bias2 = bias_inst[31:16];

//weight save
always @(posedge clk or negedge rst_n) begin
	if (!rst_n)
		weight1_inst <= 0;
	else if (valid_i)
		weight1_inst <= weight1;
end

always @(posedge clk or negedge rst_n) begin
	if (!rst_n)
		weight2_inst <= 0;
	else if (valid_i)
		weight2_inst <= weight2;
end

//bias save
always @(posedge clk or negedge rst_n) begin
	if (!rst_n)
		bias_inst <= 0;
	else if (valid_i)
		bias_inst <= bias;
end

//------------------ control ----------------------//
always @(posedge clk or negedge rst_n) begin
	if (!rst_n)
		fc_en <= 1'b0;
	else if (valid_i)
		fc_en <= 1'b1;
	else if (cnt == 4'd11)
		fc_en <= 1'b0;
end

always @(posedge clk or negedge rst_n) begin
	if (!rst_n)
		cnt <= 0;
	else if (cnt == 4'd12)
		cnt <= 0;
	else if (valid_i | fc_en)
		cnt <= cnt + 1'b1;
end

always @(posedge clk or negedge rst_n) begin
	if (!rst_n)
		num_cnt <= 0;
	else if (num_cnt == 6'd32 && valid_i)
		num_cnt <= 6'd1;
	else if (valid_i)
		num_cnt <= num_cnt + 1'b1;
end

always @(posedge clk or negedge rst_n) begin
	if (!rst_n)
		pe_en <= 1'b0;
	else if ((cnt>= 5'd1) && (cnt<= 5'd9))
		pe_en <= 1'b1;
	else 
		pe_en <= 1'b0;
end

always @(posedge clk or negedge rst_n) begin
	if (!rst_n)
		bias_en <= 1'b0;
	else if ((cnt== 5'd10) && (num_cnt == 6'd1))
		bias_en <= 1'b1;
	else 
		bias_en <= 1'b0;
end

always @(posedge clk or negedge rst_n) begin
	if (!rst_n)
		flush <= 1'b0;
	else if ((cnt== 5'd1) && (num_cnt == 6'd1))
		flush <= 1'b1;
	else 
		flush <= 1'b0;
end

always @(*) begin
	if ((cnt>= 5'd1) && (cnt<= 5'd9))
		pe_data = input_div[cnt-1];
	else
		pe_data = 0;
end

always @(*) begin
	if ((cnt>= 5'd1) && (cnt<= 5'd9))
		pe_weight1 = weight1_div[cnt-1];
	else
		pe_weight1 = 0;
end

always @(*) begin
	if ((cnt>= 5'd1) && (cnt<= 5'd9))
		pe_weight2 = weight2_div[cnt-1];
	else
		pe_weight2 = 0;
end

//
pe_fc u_pe_fc1(
	.clk(clk),
	.rst_n(rst_n),
	.data_i(pe_data),
	.weight_i(pe_weight1),
	.bias_i(bias1),
	.en(pe_en),
	.bias_en(bias_en),
	.flush(flush),
	
	.data_o(data_o_1)
);

pe_fc u_pe_fc2(
	.clk(clk),
	.rst_n(rst_n),
	.data_i(pe_data),
	.weight_i(pe_weight2),
	.bias_i(bias2),
	.en(pe_en),
	.bias_en(bias_en),
	.flush(flush),
	
	.data_o(data_o_2)
);

always @(posedge clk or negedge rst_n) begin
	if (!rst_n)
		data_big_1 <= 0;
	else
		data_big_1 <= data_o_1 * M0;
end

always @(posedge clk or negedge rst_n) begin
	if (!rst_n)
		data_big_2 <= 0;
	else
		data_big_2 <= data_o_2 * M0;
end

//assign data_big_1 = data_o_1 * M0;
//assign data_big_2 = data_o_2 * M0; 

always@(posedge clk or negedge rst_n) begin //data_o_rescale_1
	if(!rst_n)
		data1_o <= 0;
	//else if((cnt== 5'd11) && (num_cnt == 6'd32)) begin
	else if((cnt== 5'd12) && (num_cnt == 6'd32)) begin
		if (data_big_1[35])
			data1_o <= (data_big_1[35:22]==15'b111111111111111)?8'h80:data_big_1[22:15];
		else 
			data1_o <= data_big_1[35:22]?8'h7f:data_big_1[22:15];
	end
end

always@(posedge clk or negedge rst_n) begin //data_o_rescale_1
	if(!rst_n)
		data2_o <= 0;
	//else if((cnt== 5'd11) && (num_cnt == 6'd32)) begin
	else if((cnt== 5'd12) && (num_cnt == 6'd32)) begin
		if (data_big_2[35])
			data2_o <= (data_big_2[35:22]!=15'b111111111111111)?8'h80:data_big_2[22:15];
		else 
			data2_o <= data_big_2[35:22]?8'h7f:data_big_2[22:15];
	end
end

always@(posedge clk or negedge rst_n) begin
	if(!rst_n)
		valid_o <= 1'b0;
	else if (valid_o)
		valid_o <= 1'b0;
	else if ((cnt== 5'd11) && (num_cnt == 6'd32))
		valid_o <= 1'b1;
end



endmodule 