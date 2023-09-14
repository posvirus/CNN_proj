//////////////////////////////////////////////////////////////////////////////////
// School: Shanghai Jiao Tong University
// Author: Wenyao Chen
//
// Create Date: 2023/6/9
// Module Name: accumulator
// Project Name: CNN first-layer convolution Design
// Description: The accumulator, with Synchronous enable and flush function
//
// Revision:
// Additional Comments:
//
//////////////////////////////////////////////////////////////////////////////////

module accumulator
       (
           input  wire                         clk,
           input  wire                         rst_n,
           input  wire                         en,
           input  wire                         flush,
           input  wire signed [31:0]           data_i, // Data input

           output reg signed [31:0]            result_o // Accumulator output
       );

always @(posedge clk or negedge rst_n) // result_o
begin
    if (!rst_n)
        result_o <= 32'b0;
    else if (flush)
        result_o <= data_i;
    else if (en)
        result_o <= result_o+data_i;
    else
        result_o <= result_o;
end

endmodule