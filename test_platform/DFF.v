//////////////////////////////////////////////////////////////////////////////////
// School: Shanghai Jiao Tong University
// Author: Wenyao Chen
//
// Create Date: 2023/7/12
// Module Name: DFF
// Project Name: CNN first-layer convolution Design
// Description: The DFF, with Synchronous enable and flush function
//
// Revision:
// Additional Comments:
//
//////////////////////////////////////////////////////////////////////////////////

module DFF_1bit
       (
           input  wire                  clk,
           input  wire                  rst_n,
           input  wire                  en,
           input  wire                  d_i,

           output reg                   q_o
       );

always @(posedge clk or negedge rst_n)
begin
    if (!rst_n)
        q_o <= 1'b0;
    else if (en)
        q_o <= d_i;
    else
        q_o <= q_o;
end

endmodule

    module DFF_8bit
    (
        input  wire                  clk,
        input  wire                  rst_n,
        input  wire                  en,
        input  wire [7:0]            d_i,

        output reg  [7:0]            q_o
    );

always @(posedge clk or negedge rst_n)
begin
    if (!rst_n)
        q_o <= 8'b0;
    else if (en)
        q_o <= d_i;
    else
        q_o <= q_o;
end

endmodule

    module DFF_16bit
    (
        input  wire                  clk,
        input  wire                  rst_n,
        input  wire                  en,
        input  wire [15:0]           d_i,

        output reg  [15:0]           q_o
    );

always @(posedge clk or negedge rst_n)
begin
    if (!rst_n)
        q_o <= 15'b0;
    else if (en)
        q_o <= d_i;
    else
        q_o <= q_o;
end

endmodule

    module DFF_32bit
    (
        input  wire                  clk,
        input  wire                  rst_n,
        input  wire                  en,
        input  wire [31:0]           d_i,

        output reg  [31:0]           q_o
    );

always @(posedge clk or negedge rst_n)
begin
    if (!rst_n)
        q_o <= 32'b0;
    else if (en)
        q_o <= d_i;
    else
        q_o <= q_o;
end

endmodule

    module DFF_72bit
    (
        input  wire                  clk,
        input  wire                  rst_n,
        input  wire                  en,
        input  wire [71:0]           d_i,

        output reg  [71:0]           q_o
    );

always @(posedge clk or negedge rst_n)
begin
    if (!rst_n)
        q_o <= 72'b0;
    else if (en)
        q_o <= d_i;
    else
        q_o <= q_o;
end

endmodule