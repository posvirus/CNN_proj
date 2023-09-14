//////////////////////////////////////////////////////////////////////////////////
// School: Shanghai Jiao Tong University
// Author: Wenyao Chen
//
// Create Date: 2023/7/15
// Module Name: sys_array_conv_1st
// Project Name: CNN first-layer convolution Design
// Description: The systolic array for the first-layer convolution
//
// Revision:
// Additional Comments:
//
//////////////////////////////////////////////////////////////////////////////////

module sys_array_conv_1st
       (
           input  wire                         clk,
           input  wire                         rst_n,
           input  wire                         en,
           input  wire                         flush,
           input  wire [30*8-1:0]              para_pixel_i, // Parallel pixel input
           input  wire [11*8-1:0]              para_weight_i, // Parallel weight input

           output wire [20*32-1:0]             conv_o // Convolution output
       );

// Aux signal
wire signed [7:0] pixel_i [29:0];
wire signed [7:0] weight_i [10:0];
wire signed [31:0] pixel_o [10:0][19:0];
wire [11*32-1:0] adder_i [19:0];

// Input allocation
genvar in_allo_pixel,in_allo_weight;

generate // Allocate the pixel input
    for (in_allo_pixel=0;in_allo_pixel<30;in_allo_pixel=in_allo_pixel+1)
    begin: IN_PIXEL_ALLOCATION
        assign pixel_i[in_allo_pixel] = para_pixel_i[(in_allo_pixel+1)*8-1-:8];
    end
endgenerate

generate // Allocate the weight input
    for (in_allo_weight=0;in_allo_weight<11;in_allo_weight=in_allo_weight+1)
    begin: IN_WEIGHT_ALLOCATION
        assign weight_i[in_allo_weight] = para_weight_i[(in_allo_weight+1)*8-1-:8];
    end
endgenerate

// PE caller
genvar row_PE,col_PE;

generate
    for (row_PE=0;row_PE<11;row_PE=row_PE+1)
    begin: ROW_CALLER
        for (col_PE=0;col_PE<20;col_PE=col_PE+1)
        begin: COL_CALLER
            PE_1st u_PE_1st( // Call module PE_1st
                       .clk(clk),
                       .rst_n(rst_n),
                       .en(en),
                       .flush(flush),
                       .weight_i(weight_i[row_PE]),
                       .pixel_i(pixel_i[row_PE+col_PE]),
                       // For PE(i,j), the corresponding weight input is weight(i), pixel input is pixel(i+j)

                       .pixel_o(pixel_o[row_PE][col_PE])
                   );
        end
    end
endgenerate

// Adder tree
genvar adder_row,adder_col;

generate
    for (adder_row=0;adder_row<11;adder_row=adder_row+1)
    begin: ROW_ADDER
        for (adder_col=0;adder_col<20;adder_col=adder_col+1)
        begin: COL_ADDER
            assign adder_i[adder_col][(adder_row+1)*32-1-:32] = pixel_o[adder_row][adder_col];
        end
    end
endgenerate

genvar adder_caller;

generate
    for (adder_caller=0;adder_caller<20;adder_caller=adder_caller+1)
    begin: ADDER_TREE_CALLER
        adder_tree u_adder_tree(
                       .adder_i(adder_i[adder_caller]),

                       .sum_o(conv_o[(adder_caller+1)*32-1-:32]) // Output allocation
                   );
    end
endgenerate

endmodule