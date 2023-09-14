module pe_2(
		input [8*9-1:0] data_i_1,
		input [8*9-1:0] data_i_2,
		input [8*9-1:0] weight_i,
		input signed [15:0] bias_i,
		input clk,
		input rst_n,
		input signed [4:0] cnt,
		output reg signed [19:0] data_o);

wire signed [19:0] add_1,add_2;
wire signed [7:0] mul_1,mul_2;

assign mul_1 = cnt[4]? data_i_2[cnt[3:0]*8+:8] : data_i_1[cnt[3:0]*8+:8];
assign mul_2 = weight_i[cnt[3:0]*8+:8];

assign add_1 = mul_1 * mul_2;
assign add_2 = (!cnt[3:0])?bias_i:data_o;

always@(posedge clk or negedge rst_n)begin //data_o
	if(!rst_n)data_o <= 0;
	else data_o <= add_1 + add_2;
end


endmodule
