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
// Additional Comments:
//
//////////////////////////////////////////////////////////////////////////////////

module conv_1st_top
       (
           input  wire                         clk,
           input  wire                         rst_n,
           input  wire                         sta,
           input  wire [7:0]                   pixel_i, // Pixel input
           input  wire [71:0]                  weight_i, // Weight input
           input  wire [15:0]                  bias_i, // Bias input

           output wire [40*8-1:0]              conv_o, // Convolution output
           output wire                         valid_o
       );

// Aux signal
wire en_bias;
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

wire signed [15:0] bias_conn [34:0]; // Bias buffer connection (with 2 quantified parameters)

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
conv_1st_ctrl U_conv_1st_ctrl(
                  .clk(clk),
                  .rst_n(rst_n),
                  .sta(sta),

                  .en_bias(en_bias),
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

// Output allocation
genvar orig_allo;

generate
    for (orig_allo=0;orig_allo<40;orig_allo=orig_allo+1)
    begin
        assign orig_conv_o[orig_allo] = temp_conv_o[(orig_allo+1)*32-1-:32];
    end
endgenerate

// Bias
genvar bias_buf;

generate
    for (bias_buf=0;bias_buf<34;bias_buf=bias_buf+1) // Bias buffer
    begin
        DFF_16bit u_DFF_16bit(
                      .clk(clk),
                      .rst_n(rst_n),
                      .en(en_bias),
                      .d_i(bias_conn[bias_buf]),

                      .q_o(bias_conn[bias_buf+1])
                  );
    end
endgenerate

assign bias_conn[0] = bias_i;

genvar bias_allo;

generate
    for (bias_allo=0;bias_allo<40;bias_allo=bias_allo+1)
    begin
        assign bias_conv_o[bias_allo] = orig_conv_o[bias_allo]+{{16{bias_conn[weight_num+1][15]}},bias_conn[weight_num+1]};
    end
endgenerate

// Activation
genvar act_allo;

generate
    for (act_allo=0;act_allo<40;act_allo=act_allo+1)
    begin
        assign quan_conv_o[act_allo] = (bias_conv_o[act_allo]>0)?(bias_conv_o[act_allo]):0;
    end
endgenerate

// Quantify
genvar quan_allo;

generate
    for (quan_allo=0;quan_allo<40;quan_allo=quan_allo+1)
    begin
        assign conv_o[(quan_allo+1)*8-1-:8] = (bias_conn[33]*quan_conv_o[quan_allo])>>(bias_conn[34]);
    end
endgenerate

endmodule