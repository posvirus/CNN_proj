module sram_top(
	input wire clk,
	input wire rst_n,
	input wire write_en,
	input wire [72-1:0] data_w, 
	input wire [9:0] addr_w,
	input wire sta,
	input wire conv2_valid_i,
	input wire conv3_valid_i,
	input wire fc_valid_i,
	
	output reg [8*9-1:0] weight_1,
	output reg [8*9-1:0] weight_2,
	output reg [8*32-1:0] weight_3,
	output reg [8*9-1:0] weight_fc1,
	output reg [8*9-1:0] weight_fc2,
	
	//output reg [16-1:0] bias_1,
	output reg [16-1:0] bias_2,
	output reg [16-1:0] bias_3,
	output reg [32-1:0] bias_fc
);

reg state; // conv1_1st_ctrl:  state machine: 0: init; 1: cycle  
reg [8:0] init_cnt; // conv1_1st_ctrl: the initial counter
reg [4:0] cnt; 

reg [4:0] num_cnt_1; //0-31
reg [4:0] num_cnt_2; //0-31
reg [4:0] num_cnt_3; //0-31
reg [4:0] num_cnt_fc; //0-31
reg num_cnt_en_2;
reg num_cnt_en_3;
reg num_cnt_en_fc;

reg me;
reg we;

reg [9:0] addr_r;
reg [9:0] addr;
wire [72-1:0] data_r;

//me,we
always @(*) begin
	if (write_en)
		me = 1'b1;
	else if (sta)
		me = 1'b1;
	else
		me = 1'b0;
end

always @(*) begin
	if (sta)
		we = 1'b0;
	else if (write_en)
		we = 1'b1;
	else
		we = 1'b0;
end

//read

always @(posedge clk or negedge rst_n) begin
    if (!rst_n)
        init_cnt <= 9'b0;
    else if ((sta)&&(init_cnt<301)) // 301=300(load)+1(update)
        init_cnt <= init_cnt+1;
end

// Output control
always @(posedge clk or negedge rst_n) begin
    if (!rst_n)
        state <= 1'b0;
    else if (init_cnt==301) // initial pixel/weight load complete
        state <= 1'b1; // start cycling
end


always @(posedge clk or negedge rst_n) begin
	if(!rst_n)
		cnt <= 5'd0;
	else if (cnt == 5'd17)
		cnt <= 5'd0;
	else if (state)
		cnt <= cnt + 1'b1;
end


//conv1_num
always @(posedge clk or negedge rst_n) begin
	if(!rst_n)
		num_cnt_1 <= 5'd0;
	else if (cnt == 5'd17 | init_cnt == 5'd17 ) begin
		if (num_cnt_1 == 5'd31)
			num_cnt_1 <= 5'd0;
		else 
			num_cnt_1 <= num_cnt_1 + 1'b1;
	end
end

//conv2_num
always @(posedge clk or negedge rst_n) begin
	if(!rst_n)
		num_cnt_en_2 <= 1'b0;
	else if (conv2_valid_i)
		num_cnt_en_2 <= 1'b1;
end

always @(posedge clk or negedge rst_n) begin
	if(!rst_n)
		num_cnt_2 <= 5'd0;
	else if ((cnt == 5'd17) && (num_cnt_en_2)) begin
		if (num_cnt_2 == 5'd31)
			num_cnt_2 <= 5'd0;
		else 
			num_cnt_2 <= num_cnt_2 + 1'b1;
	end
end

//conv3_num
always @(posedge clk or negedge rst_n) begin
	if(!rst_n)
		num_cnt_en_3 <= 1'b0;
	else if (conv3_valid_i)
		num_cnt_en_3 <= 1'b1;
end

always @(posedge clk or negedge rst_n) begin
	if(!rst_n)
		num_cnt_3 <= 5'd0;
	else if ((cnt == 5'd5) && num_cnt_en_3) begin
		if (num_cnt_3 == 5'd31)
			num_cnt_3 <= 5'd0;
		else
			num_cnt_3 <= num_cnt_3 + 1'b1;
	end
end

//fc_num
always @(posedge clk or negedge rst_n) begin
	if(!rst_n)
		num_cnt_en_fc <= 1'b0;
	else if (fc_valid_i)
		num_cnt_en_fc <= 1'b1;
end

always @(posedge clk or negedge rst_n) begin
	if(!rst_n)
		num_cnt_fc <= 5'd0;
	else if ((cnt == 5'd6) && num_cnt_en_fc) begin
		if (num_cnt_fc == 5'd31)
			num_cnt_fc <= 5'd0;
		else
			num_cnt_fc <= num_cnt_fc + 1'b1;
	end
end


//addr_r
/*
always @(*) begin
    if ((cnt >= 5'd0)&(cnt <= 5'd8))         //conv1
		addr_r = cnt + num_cnt_1*9;
	else if ((cnt >= 5'd9) & (cnt <= 5'd10))      //conv2
		addr_r = 288 + (cnt - 9) + num_cnt_2*2;
	else if ((cnt >= 5'd11) & (cnt <= 5'd14))     //conv3
		addr_r = 352 + (cnt - 11) + num_cnt_3*4;
	else if ((cnt >= 5'd15) & (cnt <= 5'd16))     //fc_weight
		addr_r = 480 + (cnt - 15) + num_cnt_fc*2;   
	else	                                      //fc_bias
		addr_r = 544;
end
*/
always @(*) begin
	if ((init_cnt >= 5'd0)&(init_cnt <= 5'd8))    //conv1_init
		addr_r = init_cnt + num_cnt_1*9;
	else if ((cnt >= 5'd0)&(cnt <= 5'd8))         //conv1
		addr_r = cnt + num_cnt_1*9;
	else if ((cnt >= 5'd9) & (cnt <= 5'd10))      //conv2
		addr_r = 288 + (cnt - 9) + num_cnt_2*2;
	else if ((cnt >= 5'd11) & (cnt <= 5'd14))     //conv3
		addr_r = 352 + (cnt - 11) + num_cnt_3*4;
	else if ((cnt >= 5'd15) & (cnt <= 5'd16))     //fc_weight
		addr_r = 480 + (cnt - 15) + num_cnt_fc*2;   
	else	                                      //fc_bias
		addr_r = 544;
end

//addr
always @(*) begin
	if (we)
		addr = addr_w;
	else
		addr = addr_r;
end

//conv1
always @(*) begin
	if (((cnt >= 5'd1) & (cnt <= 5'd9)) | ((init_cnt >= 5'd1) & (init_cnt <= 5'd9)))        
		weight_1 = data_r;
	else 
		weight_1 = 0;
end

/*
always @(*) begin
	if (cnt == 5'd9)            
		bias_1 = data_r[55:40];
	else 
		bias_1 = 0;
end
*/
//conv2
always @(posedge clk or negedge rst_n) begin
	if (!rst_n)
		weight_2 <= 0;
	else if (cnt == 5'd10)          
		weight_2 <= data_r;
end

always @(posedge clk or negedge rst_n) begin
	if (!rst_n)
		bias_2 <= 0;
	else if (cnt == 5'd11)            
		bias_2 <= data_r[15:0];
end

//conv3
always @(posedge clk or negedge rst_n) begin
	if (!rst_n)
		weight_3 <= 0;
	else if (cnt == 5'd12)       
		weight_3[71:0] <= data_r;
	else if (cnt == 5'd13)
		weight_3[143:72] <= data_r;
	else if (cnt == 5'd14)
		weight_3[215:144] <= data_r;
	else if (cnt == 5'd15)
		weight_3[255:216] <= data_r[39:0];
end

always @(posedge clk or negedge rst_n) begin
	if (!rst_n)
		bias_3 <= 0;
	else if (cnt == 5'd15)            
		bias_3 <= data_r[55:40];
end


//fc
always @(posedge clk or negedge rst_n) begin
	if (!rst_n)
		weight_fc1 <= 0;
	else if (cnt == 5'd16)            
		weight_fc1 <= data_r;
end

always @(posedge clk or negedge rst_n) begin
	if (!rst_n)
		weight_fc2 <= 0;
	else if (cnt == 5'd17)            
		weight_fc2 <= data_r;
end

always @(posedge clk or negedge rst_n) begin
	if (!rst_n)
		bias_fc <= 0;
	else if (!me)
		bias_fc <= 0;
	else if (me) begin
		if (we)
			bias_fc <= 0;
		else if (cnt == 5'd0)           
			bias_fc <= data_r[31:0];
	end
end


sadslspkb1p576x72m4b1w0cp0d0t0 u_sram(
    .Q(data_r), 
	.ADR(addr), 
	.D(data_w),  //data_w
	.WE(we), 
	.ME(me), 
	.CLK(clk) 
	//.TEST1, RME, RM
);
endmodule