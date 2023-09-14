`timescale 1ns/10ps

module conv2_tb();

reg [8*10*4-1:0] data_i;
reg [9*8-1:0] weight_i;
wire [8*18*2*32-1:0] data_o;
reg clk,rst_n,valid_i;
reg mem_we_2,mem_me;
reg [15:0] din;
wire valid_o;

reg [7:0] data_in, weight_in;
reg [15:0] bias_in;

integer i,j,k,l,m;
integer data_out_w,data_in_r,weight_r,bias_r;
integer flag1,flag2,flag3,flag4;

initial begin
	clk = 1;
	rst_n = 0;
	valid_i = 0;
	mem_me = 0;
	mem_we_2 = 0;
	din = 0;
	data_out_w = $fopen("data_out_DW_v.txt", "w");
	data_in_r = $fopen("out_conv_9_3.txt","r");
	weight_r = $fopen("Param_DWConv_Weight.txt","r");
	bias_r = $fopen("Param_DWConv_Bias.txt","r");



	#10 rst_n = 1;

	#100 for(i=0;i<32;i=i+1)begin
		valid_i <= 1;

		for(j=0;j<40;j=j+1)begin
			flag3 = $fscanf(data_in_r, "%d", data_in);
			if(data_in[7])data_i[j*8+:8] <= 0;
			else data_i[j*8+:8] <= data_in;
		end
		#10 valid_i <= 0;
		
		#10 flag2 = $fscanf(bias_r, "%d", bias_in);
		for(j=0;j<9;j=j+1)begin
			flag1 = $fscanf(weight_r, "%d", weight_in);	
			weight_i[j*8+:8] <= weight_in;
		end
	
		#70 valid_i <= 1;
		for(j=0;j<40;j=j+1)begin
			flag3 = $fscanf(data_in_r, "%d", data_in);
			if(data_in[7])data_i[j*8+:8] <= 0;
			else data_i[j*8+:8] <= data_in;
		end
		
		

		#10 valid_i <= 0;
		#80 ;
		
	end
		

end

always #10 begin
	if(valid_o)begin
		
		for(k=0;k<18;k=k+1)begin
			$fwrite(data_out_w, "%d ", data_o[2*20*k+:20]);
			$fwrite(data_out_w, "%d ", data_o[2*20*k+20+:20]);
			$fwrite(data_out_w, "\n");
		end
		$fwrite(data_out_w, "\n");
		
	end
end

always #5 clk = ~clk;

conv2_top conv2_top(
		.clk(clk),
		.rst_n(rst_n),
		.valid_i(valid_i),
		.data_in(data_i),
		.weight(weight_i),
		.bias(bias_in),
		.valid_o(valid_o),
		.data_o(data_o));



endmodule 

