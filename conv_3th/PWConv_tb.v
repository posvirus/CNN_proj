`timescale 1ns/10ps
module PWConv_tb();

reg [8*36*32-1:0] data_i;
reg [32*1*1*8-1:0] weight_i;
reg [16-1:0] bias_i;
wire [8*36-1:0] data_o;
reg clk;
reg rst_n;
reg valid_i;
reg valid_i_pre;

reg [5:0] loop_cnt_3;  //0-32
reg [5:0] weight_num;  //0-33
wire valid_o;

reg [7:0] data_in;
reg [15:0] bias_in;
reg [15:0] weight_in;

integer data_in_r;
integer bias_r;
integer weight_r;
integer data_out_w;
integer i;
integer j;

integer flag1;
integer flag2;
integer flag3;

reg [4:0] cnt;      //0-17
reg WE;


//cnt
always @(posedge clk or negedge rst_n) begin
	if(!rst_n)
		cnt <= 5'd0;
	else if (cnt == 5'd17)
		cnt <= 5'd0;
	else if (WE)
		cnt <= cnt + 1'b1;
end

initial begin
	clk = 0;
	rst_n = 0;
	data_out_w = $fopen("Out_PWConv_v.txt", "w");
	data_in_r = $fopen("Out_DWConv.txt","r");
	bias_r = $fopen("Param_PWConv_Bias.txt","r");
	weight_r = $fopen("Param_PWConv_Weight.txt","r");

	for(i = 0; i < 32; i = i + 1)begin
		for(j = 0; j < 36; j = j + 1)begin
			flag1 = $fscanf(data_in_r, "%d", data_in);
			if(data_in[7] == 1) 
			    data_in = 0;
			data_i[(i*36+j)*8 +: 8] <= data_in;
		end
	end

	#12 rst_n = 1;
	#3 WE <= 1;
end

integer w_index;

always @(posedge clk or negedge rst_n) begin
	if(!rst_n) 
		weight_i <= 0;
	else if(cnt == 5'd15) 
		for(w_index = 0; w_index < 32; w_index = w_index + 1) begin
	        flag3 = $fscanf(weight_r, "%d", weight_in);
			weight_i[(w_index)*8 +: 8] <= weight_in;
		end
end

always @(posedge clk or negedge rst_n) begin
	if(!rst_n) 
		bias_i <= 0;
	else if(cnt == 5'd15) begin
		flag2 = $fscanf(bias_r, "%d", bias_in);
		bias_i <= bias_in;
	end
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

always @(posedge clk or negedge rst_n) begin
	if(!rst_n)
		valid_i_pre <= 1'b0;
	else if((cnt == 5'd17) && (weight_num == 5'd1))
	    valid_i_pre <= 1'b1;
	else
	    valid_i_pre <= 1'b0;
end

always @(posedge clk or negedge rst_n) begin
	if(!rst_n)
		valid_i <= 1'b0;
	else
	    valid_i <= valid_i_pre;
end

always @(posedge clk or negedge rst_n) begin
	if(!rst_n)
		loop_cnt_3 <= 6'd0;
	else if (loop_cnt_3 == 6'd32)
		loop_cnt_3 <= 6'd0;
	else if (valid_o)
		loop_cnt_3 <= loop_cnt_3 + 1'b1;
	else
	    loop_cnt_3 <= loop_cnt_3;
end


always@(negedge clk)begin
	if(valid_o)begin
		for(i = 0; i < 36; i = i + 1)begin
			$fwrite(data_out_w, "%d ", data_o[8*i+:8]);
		end
	    $fwrite(data_out_w, "\n");
	end
end
	

PWConv_top 
#(.DATA_W(8), .FILTER_W(8), .BIAS_W(16), .PIXEL_ROW(18), .PIXEL_COL(2), .INPUT_NUM(36), .OUTPUT_NUM(36))
	u_PWConv_top(
	.clk(clk),
	.rst_n(rst_n),
	
	.pwconv_valid_i(valid_i),
	.pwconv_pixel_i(data_i),
	.pwconv_weight_i(weight_i),
	.pwconv_bias_i(bias_i),
	
	.pwconv_pixel_o(data_o),
	.pwconv_valid_o(valid_o)
	);

always #5 clk = ~clk;

endmodule
