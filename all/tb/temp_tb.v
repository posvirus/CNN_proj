`timescale 1ns/1ns

module temp_tb();

localparam FIG_SCALE = 30*10;
localparam FIG_NUM = 122;
localparam WEIGHT_SCALE = 9;
localparam BIAS_SCALE = 34; // bias parameters
localparam WEIGHT_NUM = 32;

/*Internal signal statement*/
reg clk,rst_n;
reg sta,sta_m;
reg write_en;
reg [7:0] pixel_i;
reg [71:0] data_w;
reg [9:0] addr_w;
wire [7:0] data1_out;
wire [7:0] data2_out;
wire valid_o;

reg [7 :0] fig_mem    [FIG_SCALE-1:0];
reg [71:0] weight_mem [575:0];

integer result,data_cnt,fig_cnt,weight_cnt;


/*Function definition*/
cnn u_cnn(
                  .clk(clk),
                  .rst_n(rst_n),
				  .write_en(write_en),
				  .pixel_i(pixel_i),
				  .data_w(data_w),
				  .addr_w(addr_w),
                  .sta(sta_m),
				  
                  .valid_o(valid_o),
				  .data1_o(data1_out),
				  .data2_o(data2_out)
              ); 

/*Testing flow*/
always #2 clk = ~clk; // Generate the clock (T=4ns)

initial
begin
    /*Intialize*/
    clk = 1'b1;
    rst_n = 1'b0;
    sta_m = 1'b0;
    sta = 1'b0;
	write_en = 1'b0;
    fig_cnt = 0;
    weight_cnt = 0;
	addr_w = 0;
	data_w = 0;
	pixel_i = 0;
    $display("Creating result data file...");
    result = $fopen("E:/study/byyx/rtl/all_v1.0/data/result.txt","w");  //Please change the path if needed
    $fclose(result);
    $display("Writing raw data to memory...");
    $readmemh("E:/study/byyx/rtl/all_v1.0/data/Input.txt",fig_mem);  //Please change the path if needed
    $readmemh("E:/study/byyx/rtl/all_v1.0/data/weight.txt",weight_mem);  //Please change the path if needed
	
    #10;
    @(negedge clk);
    rst_n = 1'b1;
	
	#10;
	write_en = 1'b1;

	for (weight_cnt=0; weight_cnt<545; weight_cnt = weight_cnt + 1) begin
		@(posedge clk);
		addr_w <= weight_cnt;
		data_w <= weight_mem[weight_cnt];
	end
	
	@(posedge clk);
    sta_m = 1'b1;
    $display("Pre-allocating...\n");
    for(fig_cnt = 0;fig_cnt<FIG_SCALE;fig_cnt=fig_cnt+1) begin
        @(posedge clk);
        pixel_i <= fig_mem[fig_cnt];
		
		/*
        if (fig_cnt<BIAS_SCALE) begin
            bias_i <= bias_mem[fig_cnt];
        end
        if (fig_cnt<WEIGHT_SCALE)
        begin
            weight_i <= weight_mem[weight_cnt];
            weight_cnt <= weight_cnt+1;
        end
		*/
    end
	
    @(posedge clk);
    @(posedge clk);
	pixel_i = 0; 
    sta = 1'b1;
    data_cnt = 0;
    $display("Processing data...\n");
    result = $fopen("E:/study/byyx/rtl/all_v1.0/result.txt","at");  //Please change the path if needed
end
/*
always @(posedge clk) // cycle counter
begin
    if ((sta)&&(data_cnt<575)) // 575=32*18-1
        data_cnt <= data_cnt+1;
    else
        data_cnt <= 0;
end


always @(posedge clk) // Weight input allocation
begin
    if ((sta)&&((data_cnt%18)<WEIGHT_SCALE)&&(weight_cnt<287))
    begin
        weight_i <= weight_mem[weight_cnt];
        weight_cnt <= weight_cnt+1;
    end
    else if ((sta)&&(weight_cnt==287))
    begin
        weight_i <= weight_mem[weight_cnt];
        weight_cnt <= 0;
    end
end
*/
always @(posedge clk) // Figure input allocation
begin
    if ((sta)&&(data_cnt<FIG_SCALE))
    begin
        pixel_i <= fig_mem[fig_cnt];
        fig_cnt <= fig_cnt+1;
    end
end


always @(negedge clk) // Store the result
begin
    if (sta)
    begin
        //if ((sta)&&(valid_o)&&(fig_cnt>FIG_SCALE))
		if ((sta)&&(valid_o))
            $fwrite(result,"%d %d\n",data1_out, data2_out);  //Write the conv output
    end
end

always @(posedge clk) // Stop
begin
    if (fig_cnt==FIG_SCALE*(FIG_NUM+1)+2)
    begin
        $fclose(result);
        $display("Simulation done!");
        $stop;
    end 
end

endmodule