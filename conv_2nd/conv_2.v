module conv_2(
		input clk,
		input rst_n,
		input [20*4*8-1:0] data_i,
		input [8*3*3-1:0] weight_i,
		input [15:0] bias_i,
		input valid_i,
		output reg valid_o_conv2,
		output reg valid_o,
		output reg [8*18*2-1:0] data_o);

parameter M0 = 7'b0111011; //M0 = 59
parameter n = 11; //n = 11

wire [8*9-1:0] data_in_1[17:0];
wire [8*9-1:0] data_in_2[17:0];

wire signed [19:0] data_out[17:0];

reg signed [19:0] data_out_unrescaled[17:0];
wire signed [26:0] data_big[17:0];

reg output_delay;
reg output_delay_1;
reg [4:0] cnt;

always@(posedge clk or negedge rst_n)begin //output_delay_1
	if(!rst_n)output_delay_1 <= 0;
	else if(output_delay)output_delay_1 <= 1;
	else output_delay_1 <= 0;
end

always@(posedge clk or negedge rst_n)begin //output_delay
	if(!rst_n)output_delay <= 0;
	else if(cnt == 5'b11000)output_delay <= 1;
	else output_delay <= 0;
end 

always@(posedge clk or negedge rst_n)begin //cnt
	if(!rst_n)cnt <= 0;
	else if(cnt == 5'b01000)cnt <= 5'b10000;
	else if(cnt == 5'b11000)cnt <= 5'b0;
	else if(valid_i)cnt <= cnt + 1;
	else cnt <= 0;
end

always@(posedge clk or negedge rst_n)begin //valid_o_conv2
	if(!rst_n)valid_o_conv2 <= 0;
	else if(cnt == 5'b10111)valid_o_conv2 <= 1;
	else valid_o_conv2 <= 0;
end

always@(posedge clk or negedge rst_n)begin //valid_o
	if(!rst_n)valid_o <= 0;
	else if(output_delay_1)valid_o <= 1;
	else valid_o <= 0;
end

genvar i;
generate
	for(i=0;i<18;i=i+1)begin
		assign data_in_1[i] = {data_i[(i+2)*4*8+:24],data_i[(i+1)*4*8+:24],data_i[i*4*8+:24]};
		assign data_in_2[i] = {data_i[(i+2)*4*8+8+:24],data_i[(i+1)*4*8+8+:24],data_i[i*4*8+8+:24]};
	
		assign data_big[i] = data_out_unrescaled[i][19]?0 : data_out_unrescaled[i]* M0;


		always@(posedge clk or negedge rst_n)begin
			if(!rst_n)data_out_unrescaled[i] <= 0;
			else if(cnt == 5'b10000)data_out_unrescaled[i] <= data_out[i];
			else if(output_delay)data_out_unrescaled[i] <= data_out[i];
			else data_out_unrescaled[i] <= data_out_unrescaled[i];
		end

		always@(posedge clk or negedge rst_n)begin
			if(!rst_n)data_o[i*16+:16] <= 0;
			else if(cnt == 5'b10001)data_o[i*2*8+:8] <= data_big[i][26:18]?8'h7f:data_big[i][18:11];
			else if(output_delay_1)data_o[i*2*8+8+:8] <= data_big[i][26:18]?8'h7f:data_big[i][18:11];
			else data_o[i*16+:16] <= data_o[i*16+:16];
		end
		
		pe_2 pe_2(
			.clk(clk),
			.rst_n(rst_n),
			.data_i_1(data_in_1[i]),
			.data_i_2(data_in_2[i]),
			.weight_i(weight_i),
			.bias_i(bias_i),
			.cnt(cnt),
			.data_o(data_out[i]));
	end

endgenerate
endmodule 