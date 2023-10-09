//////////////////////////////////////////////////////////////////////////////////
// School: Shanghai Jiao Tong University
// Author: Wenyao Chen
//
// Create Date: 2023/7/15
// Module Name: adder_tree
// Project Name: CNN first-layer convolution Design
// Description: The unfolded adder tree
//
// Revision:
// Additional Comments:
//
//////////////////////////////////////////////////////////////////////////////////

module adder_tree
       (
           input  wire [11*32-1:0]     adder_i,
           output wire signed [31:0]   sum_o
       );

wire signed [31:0] d1_sum [5:0];
wire signed [31:0] d2_sum [2:0];
wire signed [31:0] d3_sum [1:0];

// Depth: 1
genvar d1;

generate
    for (d1=0;d1<5;d1=d1+1)
    begin: DEPTH_1
        assign d1_sum[d1] = adder_i[(2*d1+1)*32-1-:32]+adder_i[(2*d1+2)*32-1-:32];
    end
endgenerate
assign d1_sum[5] = adder_i[11*32-1-:32];

// Depth: 2
genvar d2;

generate
    for (d2=0;d2<3;d2=d2+1)
    begin: DEPTH_2
        assign d2_sum[d2] = d1_sum[2*d2]+d1_sum[2*d2+1];
    end
endgenerate

// Depth: 3
assign d3_sum[0] = d2_sum[0]+d2_sum[1];
assign d3_sum[1] = d2_sum[2];

// Output allocation
assign sum_o = d3_sum[0]+d3_sum[1];

endmodule