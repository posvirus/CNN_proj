//////////////////////////////////////////////////////////////////////////////////
// School: Shanghai Jiao Tong University
// Author: Wenyao Chen
//
// Create Date: 2023/7/12
// Module Name: PE_1st
// Project Name: CNN first-layer convolution Design
// Description: The processing element, achieve the MAC function
//
// Revision:
// Additional Comments:
//
//////////////////////////////////////////////////////////////////////////////////

module PE_1st
       (
           input  wire                  clk,
           input  wire                  rst_n,
           input  wire                  en,
           input  wire                  flush,
           input  wire signed [7:0]     weight_i,
           input  wire signed [7:0]     pixel_i,

           output wire signed [31:0]    pixel_o
       );

// Aux signal definition
wire signed [31:0] weight_ext_i, pixel_ext_i;
wire signed [31:0] multi_o;

// Bit expansion
assign weight_ext_i = {{25{weight_i[7]}},weight_i[6:0]};
assign pixel_ext_i = {{25{pixel_i[7]}},pixel_i[6:0]};

// MAC caculation
assign multi_o = weight_ext_i*pixel_ext_i; // Multiplication

accumulator u_accumulator( // Call module accumulator
                .clk(clk),
                .rst_n(rst_n),
                .en(en),
                .flush(flush),
                .data_i(multi_o),

                .result_o(pixel_o) // Output allocation
            );

endmodule