module data_out_reg(
	input clk,
	input rst_n,
	input [8*18*2-1:0] data_in,
	input valid_i,
	output reg [8*18*2*32-1:0] data_out,
	output reg valid_o);

reg [4:0] cnt;

always@(posedge clk or negedge rst_n)begin
	if(!rst_n)cnt <= 0;
	else if(valid_i)cnt <= cnt + 1;
	else cnt <= cnt;
end

always@(posedge clk or negedge rst_n)begin
	if(!rst_n)valid_o <= 0;
	else if(valid_i && cnt == 5'b11111) valid_o <= 1;
	else valid_o <= 0;
end

always@(posedge clk or negedge rst_n)begin
	if(!rst_n)data_out <= 0;
	else if(valid_i)begin
		data_out[8*18*2*cnt +: 8*18*2] <= data_in;
	end
	else data_out <= data_out;
end



endmodule 