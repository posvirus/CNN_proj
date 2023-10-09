//////////////////////////////////////////////////////////////////////////////////
// School: Shanghai Jiao Tong University
// Author: Wenyao Chen
//
// Create Date: 2023/8/10
// Module Name: sys_array_para
// Project Name: CNN first-layer convolution Design
// Description: The systolic array for the first-layer convolution (Paralized)
//
// Revision:
// Additional Comments:
//
//////////////////////////////////////////////////////////////////////////////////

module sys_array_para
       (
           input  wire                         clk,
           input  wire                         rst_n,
           input  wire                         en,
           input  wire                         flush,
           input  wire [60*8-1:0]              para_pixel_i, // Parallel pixel input
           input  wire [11*8-1:0]              para_weight_i, // Parallel weight input

           output wire [40*32-1:0]             conv_o // Convolution output
       );

sys_array_conv_1st u_sys_array_conv_1st_odd(
                       .clk(clk),
                       .rst_n(rst_n),
                       .en(en),
                       .flush(flush),
                       .para_pixel_i(para_pixel_i[30*8-1:0]),
                       .para_weight_i(para_weight_i),

                       .conv_o(conv_o[20*32-1:0])
                   );

sys_array_conv_1st u_sys_array_conv_1st_even(
                       .clk(clk),
                       .rst_n(rst_n),
                       .en(en),
                       .flush(flush),
                       .para_pixel_i(para_pixel_i[60*8-1:30*8]),
                       .para_weight_i(para_weight_i),

                       .conv_o(conv_o[40*32-1:20*32])
                   );


endmodule