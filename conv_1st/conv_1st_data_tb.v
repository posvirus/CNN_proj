//////////////////////////////////////////////////////////////////////////////////
// School: Shanghai Jiao Tong University
// Author: Wenyao Chen
//
// Create Date: 2023/9/2
// Module Name: conv_1st_data_tb
// Project Name: CNN first-layer convolution Design
// Description: The testbench for the conv_1st_data module
//
// Revision:
// 2023/9/2:
// Add the control module into the existing module
// Additional Comments:
//
//////////////////////////////////////////////////////////////////////////////////

`timescale 1ns/10ps

module conv_1st_data_tb();

localparam FIG_SCALE = 30*10;
localparam FIG_NUM = 122;
localparam WEIGHT_SCALE = 9;
localparam BIAS_SCALE = 34; // bias parameters
localparam WEIGHT_NUM = 32;

/*Internal signal statement*/
reg clk,rst_n;
reg sta,sta_m;
reg [7:0] pixel_i;
reg [71:0] weight_i;
reg [15:0] bias_i;
wire [40*8-1:0] conv_o;
wire valid_o;

reg [7:0] fig_mem [FIG_SCALE*FIG_NUM-1:0];
reg [71:0] weight_mem [WEIGHT_SCALE*WEIGHT_NUM-1:0];
reg [15:0] bias_mem [BIAS_SCALE-1:0];

integer result,data_cnt,fig_cnt,weight_cnt;


/*Function definition*/
conv_1st_top u_conv_1st_top(
                  .clk(clk),
                  .rst_n(rst_n),
                  .sta(sta_m),
                  .pixel_i(pixel_i),
                  .weight_i(weight_i),
                  .bias_i(bias_i),

                  .conv_o(conv_o),
                  .valid_o(valid_o)
              ); // Call module conv_1st_data

/*Testing flow*/
always #2 clk = ~clk; // Generate the clock (T=4ns)

initial
begin
    /*Intialize*/
    clk = 1'b1;
    rst_n = 1'b0;
    sta_m = 1'b0;
    sta = 1'b0;
    fig_cnt = 0;
    weight_cnt = 0;
    $display("Creating result data file...");
    result = $fopen("C:/lscc/diamond/3.12/Mywork/conv_1st/result.txt","w");  //Please change the path if needed
    $fclose(result);
    $display("Writing raw data to memory...");
    $readmemh("C:/lscc/diamond/3.12/Mywork/conv_1st/figure.txt",fig_mem);  //Please change the path if needed
    $readmemh("C:/lscc/diamond/3.12/Mywork/conv_1st/weight.txt",weight_mem);  //Please change the path if needed
    $readmemh("C:/lscc/diamond/3.12/Mywork/conv_1st/bias.txt",bias_mem);  //Please change the path if needed
    #100;
    @(negedge clk);
    rst_n = 1'b1;
    sta_m = 1'b1;
    $display("Pre-allocating...\n");
    for(fig_cnt = 0;fig_cnt<FIG_SCALE;fig_cnt=fig_cnt+1)
    begin
        @(posedge clk);
        pixel_i <= fig_mem[fig_cnt];
        if (fig_cnt<BIAS_SCALE)
        begin
            bias_i <= bias_mem[fig_cnt];
        end
        if (fig_cnt<WEIGHT_SCALE)
        begin
            weight_i <= weight_mem[weight_cnt];
            weight_cnt <= weight_cnt+1;
        end
    end
    @(posedge clk);
    @(posedge clk);
    sta = 1'b1;
    data_cnt = 0;
    $display("Processing data...\n");
    result = $fopen("C:/lscc/diamond/3.12/Mywork/conv_1st/result.txt","at");  //Please change the path if needed
end

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
        if ((sta)&&(valid_o)&&(fig_cnt>FIG_SCALE))
            $fwrite(result,"%80x\n",conv_o);  //Write the conv output
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