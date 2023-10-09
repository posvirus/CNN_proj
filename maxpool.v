//////////////////////////////////////////////////////////////////////////////////
// School: Shanghai Jiao Tong University
// Author: Shuoqi Fu
//
// Create Date: 
// Module Name: maxpool
// Project Name: CNN 
// Description: The maxpool layer 
//
// Revision:
//
//////////////////////////////////////////////////////////////////////////////////

module maxpool(
  input wire  clk,
  input wire  rst_n,
  input wire            maxpool_valid_i, 
  input wire [36*8-1:0] maxpool_input,  
  
  output reg            maxpool_valid_o,  
  output reg [9*8-1 :0] maxpool_output  
);
   
//------------------------------------------
// INTERNAL SIGNAL
//------------------------------------------
reg [4:0] cnt;
reg maxpool_en;

reg [7:0] data1;
reg [7:0] data2;
reg [7:0] data3;
reg [7:0] data4;
reg [7:0] data5;
reg [7:0] data6;

wire [7:0] input_div [36-1:0];
genvar input_allo;

generate for (input_allo=0; input_allo<36;input_allo=input_allo+1)
	begin: INPUT_ALLOCATION
		assign input_div[input_allo] = maxpool_input[(input_allo+1)*8 -1-:8];
	end
endgenerate

//-------------control---------------------//
always @(posedge clk or negedge rst_n) begin
	if (!rst_n)
		maxpool_en <= 1'b0;
	else if (cnt == 5'd16)
		maxpool_en <= 1'b0;
	else if (maxpool_valid_i)
		maxpool_en <= 1'b1;
end

always @(posedge clk or negedge rst_n) begin
	if (!rst_n) 
		cnt <= 0;
	else if (cnt == 5'd17)
		cnt <= 0;
	else if (maxpool_valid_i | maxpool_en)
		cnt <= cnt + 1'b1;
end

//----------------cmp----------------------//
always @(posedge clk or negedge rst_n) begin
	if (!rst_n)
		data1 <= 0;
	else if ((cnt>=5'd0) && (cnt<=5'd8))
		data1 <= input_div[cnt*4];
end

always @(posedge clk or negedge rst_n) begin
	if (!rst_n)
		data2 <= 0;
	else if ((cnt>=5'd0) && (cnt<=5'd8))
		data2 <= input_div[cnt*4+1];
end

always @(posedge clk or negedge rst_n) begin
	if (!rst_n)
		data3 <= 0;
	else if ((cnt>=5'd0) && (cnt<=5'd8))
		data3 <= input_div[cnt*4+2];
end

always @(posedge clk or negedge rst_n) begin
	if (!rst_n)
		data4 <= 0;
	else if ((cnt>=5'd0) && (cnt<=5'd8))
		data4 <= input_div[cnt*4+3];
end

//cmp1
always @(posedge clk or negedge rst_n) begin
	if (!rst_n)
		data5 <= 0;
	else if (maxpool_en) begin
		if (data1 < data2)
			data5 <= data2;
		else
			data5 <= data1;
	end
end

always @(posedge clk or negedge rst_n) begin
	if (!rst_n)
		data6 <= 0;
	else if (maxpool_en) begin
		if (data3 < data4)
			data6 <= data4;
		else
			data6 <= data3;
	end
end

//cmp2
always @(posedge clk or negedge rst_n) begin
	if (!rst_n)
		maxpool_output <= 0;
	else if ((cnt>=5'd2) && (cnt<=5'd10)) begin
		if (data5 < data6)
			maxpool_output[(cnt-1)*8 -1-:8] <= data6;
		else 
			maxpool_output[(cnt-1)*8 -1-:8] <= data5;
	end
end

always @(posedge clk or negedge rst_n) begin
	if (!rst_n)
		maxpool_valid_o <= 1'b0;
	else if (maxpool_valid_o)
		maxpool_valid_o <= 1'b0;
	else if (cnt == 5'd12)
		maxpool_valid_o <= 1'b1;
end
 
endmodule

