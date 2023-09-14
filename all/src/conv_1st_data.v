//////////////////////////////////////////////////////////////////////////////////
// School: Shanghai Jiao Tong University
// Author: Wenyao Chen
//
// Create Date: 2023/7/18
// Module Name: conv_1st_data
// Project Name: CNN first-layer convolution Design
// Description: The data path for the first-layer convolution
//
// Revision:
// Additional Comments:
//
//////////////////////////////////////////////////////////////////////////////////

module conv_1st_data
       (
           input  wire                         clk,
           input  wire                         rst_n,
           input  wire                         en_array,
           input  wire                         en_DFF_pixel,
           input  wire                         en_DFF_weight,
           input  wire                         en_cnt,
           input  wire                         flush,
           input  wire                         ud_pixel,
           input  wire                         ud_weight,
           input  wire [7:0]                   pixel_i, // Pixel input
           input  wire [71:0]                  weight_i, // Weight input

           output wire [40*32-1:0]             conv_o // Convolution output
       );

// Aux signal
wire [60*8-1:0] para_pixel_conn;
wire [11*8-1:0] para_weight_conn;

// The systolic array
sys_array_para u_sys_array_para(
                   .clk(clk),
                   .rst_n(rst_n),
                   .en(en_array),
                   .flush(flush),
                   .para_pixel_i(para_pixel_conn),
                   .para_weight_i(para_weight_conn),

                   .conv_o(conv_o)
               );

// The pixel buffer
pixel_buffer u_pixel_buffer(
                 .clk(clk),
                 .rst_n(rst_n),
                 .ud(ud_pixel),
                 .en_DFF(en_DFF_pixel),
                 .en_cnt(en_cnt),
                 .pixel_i(pixel_i),

                 .para_pixel_o(para_pixel_conn)
             );

// The weight buffer
weight_buffer u_weight_buffer(
                  .clk(clk),
                  .rst_n(rst_n),
                  .ud(ud_weight),
                  .en_DFF(en_DFF_weight),
                  .en_cnt(en_cnt),
                  .weight_i(weight_i),

                  .para_weight_o(para_weight_conn)
              );

endmodule