//////////////////////////////////////////////////////////////////////////////////
// School: Shanghai Jiao Tong University
// Author: Wenyao Chen
//
// Create Date: 2023/9/2
// Module Name: conv_1st_top
// Project Name: CNN first-layer convolution Design
// Description: The top layer module of the first-layer convolution
//
// Revision:
// 2023/9/13:
// Add the scan chain input buffer
// Additional Comments:
//
//////////////////////////////////////////////////////////////////////////////////

module conv_1st_top
       (
           input  wire                         clk,
           input  wire                         rst_n,
           input  wire                         sta,
           input  wire [39:0]                  scan_i, // Scan chain input (pixel 4*8+8)
           input  wire [23:0]                  bias_i, // Bias input (16+8)
           input  wire [71:0]                  weight_i, // Weight input

           output wire [40*8-1:0]              conv_o, // Convolution output
           output wire                         valid_o
       );

// Aux signal
wire [7:0] pixel_i;
wire en_array;
wire en_DFF_pixel,en_DFF_weight;
wire en_cnt;
wire flush;
wire ud_pixel,ud_weight;
wire [4:0] weight_num;

wire [40*32-1:0] temp_conv_o;
wire signed [31:0] orig_conv_o [39:0]; // Original convolution output
wire signed [31:0] bias_conv_o [39:0]; // Bias convolution output
wire signed [31:0] quan_conv_o [39:0]; // Quantified convolution output

wire [9:0] data_cnt;
wire [8:0] init_cnt;
wire state;

wire [6:0] scan_ptr; // scan_mem input pointer
wire [5:0] bias_ptr; // bias_mem input pointer
reg [31:0] scan_mem [74:0]; // Scan chain input buffer
reg [15:0] bias_mem [33:0]; // Bias buffer
reg [8:0] scan_cnt; // Buffer input counter

// The data path
conv_1st_data u_conv_1st_data(
                  .clk(clk),
                  .rst_n(rst_n),
                  .en_array(en_array),
                  .en_DFF_pixel(en_DFF_pixel),
                  .en_DFF_weight(en_DFF_weight),
                  .en_cnt(en_cnt),
                  .flush(flush),
                  .ud_pixel(ud_pixel),
                  .ud_weight(ud_weight),
                  .pixel_i(pixel_i),
                  .weight_i(weight_i),

                  .conv_o(temp_conv_o)
              );

// The control path
conv_1st_ctrl u_conv_1st_ctrl(
                  .clk(clk),
                  .rst_n(rst_n),
                  .sta(sta),

                  .data_cnt(data_cnt),
                  .init_cnt(init_cnt),
                  .state(state),

                  .en_array(en_array),
                  .en_DFF_pixel(en_DFF_pixel),
                  .en_DFF_weight(en_DFF_weight),
                  .en_cnt(en_cnt),
                  .ud_pixel(ud_pixel),
                  .ud_weight(ud_weight),
                  .flush(flush),
                  .weight_num(weight_num),
                  .valid_o(valid_o)
              );

// Scan chain input
assign scan_ptr = scan_i[6:0];

genvar scan_allo;

generate
    for (scan_allo=0;scan_allo<100;scan_allo=scan_allo+1)
    begin: SCAN_ALLOCATION
        always @(posedge clk or negedge rst_n)
        begin
            if (!rst_n)
                scan_mem[scan_allo] <= 32'b0;
            else if (scan_allo==scan_ptr)
                scan_mem[scan_allo] <= scan_i[39:8];
            else
                scan_mem[scan_allo] <= scan_mem[scan_allo]; 
        end
    end
endgenerate

always @(posedge clk or negedge rst_n) // Pixel counter
begin
    if (!rst_n)
        scan_cnt <= {9{1'b1}};
    else if (((sta)&&(state==1'b0)&&(init_cnt<300))||((state==1'b1)&&(data_cnt<300)))
        scan_cnt <= scan_cnt+1;
    else
        scan_cnt <= {9{1'b1}};
end

assign pixel_i = scan_mem[scan_cnt>>2][(scan_cnt%4+1)*8-1-:8]; // Pixel input allocation

// Output allocation
genvar orig_allo;

generate
    for (orig_allo=0;orig_allo<40;orig_allo=orig_allo+1)
    begin: ORIGINAL_ALLOCATION
        assign orig_conv_o[orig_allo] = temp_conv_o[(orig_allo+1)*32-1-:32];
    end
endgenerate

// Bias
assign bias_ptr = bias_i[5:0];

genvar bias_buf;

generate
    for (bias_buf=0;bias_buf<34;bias_buf=bias_buf+1) // Bias buffer
    begin: BIAS_BUFFER
        always @(posedge clk or negedge rst_n)
        begin
            if (!rst_n)
                bias_mem[bias_buf] <= 16'b0;
            else if (bias_buf==bias_ptr)
                bias_mem[bias_buf] <= bias_i[23:8];
            else
                bias_mem[bias_buf] <= bias_mem[bias_buf];
        end
    end
endgenerate

genvar bias_allo;

generate
    for (bias_allo=0;bias_allo<40;bias_allo=bias_allo+1)
    begin: BIAS_ALLOCATION
        assign bias_conv_o[bias_allo] = orig_conv_o[bias_allo]+{{16{bias_mem[weight_num][15]}},bias_mem[weight_num]};
    end
endgenerate

// Activation
genvar act_allo;

generate
    for (act_allo=0;act_allo<40;act_allo=act_allo+1)
    begin: ACTIVATION_ALLOCATION
        assign quan_conv_o[act_allo] = (bias_conv_o[act_allo]>0)?(bias_conv_o[act_allo]):0;
    end
endgenerate

// Quantify
genvar quan_allo;

generate
    for (quan_allo=0;quan_allo<40;quan_allo=quan_allo+1)
    begin: QUANTIFY_ALLOCATION
        assign conv_o[(quan_allo+1)*8-1-:8] = (bias_mem[32]*quan_conv_o[quan_allo])>>(bias_mem[33]);
    end
endgenerate

endmodule