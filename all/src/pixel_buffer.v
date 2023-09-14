//////////////////////////////////////////////////////////////////////////////////
// School: Shanghai Jiao Tong University
// Author: Wenyao Chen
//
// Create Date: 2023/7/16
// Module Name: pixel_buffer
// Project Name: CNN first-layer convolution Design
// Description: The pixel matrix buffer for input allocation
//
// Revision:
// 2023/8/12:
// Change the data pattern of the buffer to adjust the parallel caculation
// 2023/9/2:
// Refine the behavior of the level-2 counter
// Additional Comments:
//
//////////////////////////////////////////////////////////////////////////////////

module pixel_buffer
       (
           input  wire                         clk,
           input  wire                         rst_n,
           input  wire                         ud,
           input  wire                         en_DFF,
           input  wire                         en_cnt,
           input  wire [7:0]                   pixel_i,

           output wire [60*8-1:0]              para_pixel_o // Parallel pixel output
       );

// Aux signal
wire  [7:0] pixel_o [59:0]; // Even/Odd systolic array pixel input
wire [7:0] flip_conn [29:0][10:0]; // Interconnection of the DFF
reg  [7:0] cur_fig [29:0][9:0]; // Memory for storing the current figure
reg  [3:0] l1_cnt; // Level-1 counter
reg l2_cnt; // Level-2 counter

// The next-figure buffer
genvar next_buf_row,next_buf_col;

generate
    for (next_buf_row=0;next_buf_row<30;next_buf_row=next_buf_row+1)
    begin: NEXT_FIGURE_BUF_ROW
        for (next_buf_col=0;next_buf_col<10;next_buf_col=next_buf_col+1)
        begin: NEXT_FIGURE_BUF_COL
            DFF_8bit u_DFF_8bit(
                         .clk(clk),
                         .rst_n(rst_n),
                         .en(en_DFF),
                         .d_i(flip_conn[next_buf_row][next_buf_col]),

                         .q_o(flip_conn[next_buf_row][next_buf_col+1])
                     );
        end
    end
endgenerate

// Row interconnection
genvar next_row_conn;

generate
    for (next_row_conn=0;next_row_conn<29;next_row_conn=next_row_conn+1)
    begin: ROW_INTERCONNECTION
        assign flip_conn[next_row_conn+1][0] = flip_conn[next_row_conn][10];
    end
endgenerate

assign flip_conn[0][0] = pixel_i;

// The current-figure buffer
genvar cur_buf_row,cur_buf_col;

generate
    for (cur_buf_row=0;cur_buf_row<30;cur_buf_row=cur_buf_row+1)
    begin: CURRENT_FIGURE_BUF_ROW
        for (cur_buf_col=0;cur_buf_col<10;cur_buf_col=cur_buf_col+1)
        begin: CURRNET_FIGURE_BUF_COL
            always @(posedge clk or negedge rst_n)
            begin
                if (!rst_n)
                    cur_fig[cur_buf_row][cur_buf_col] <= 8'b0;
                else if (ud)
                    cur_fig[cur_buf_row][cur_buf_col] <= flip_conn[cur_buf_row][cur_buf_col+1];
                else
                    cur_fig[cur_buf_row][cur_buf_col] <= cur_fig[cur_buf_row][cur_buf_col];
            end
        end
    end
endgenerate

// Output allocation
genvar out_allo_odd;

generate
    for (out_allo_odd=0;out_allo_odd<30;out_allo_odd=out_allo_odd+1)
    begin: OUT_ALLOCATION_ODD
        assign para_pixel_o[(out_allo_odd+1)*8-1-:8] = pixel_o[out_allo_odd];
    end
endgenerate

genvar out_allo_even;

generate
    for (out_allo_even=30;out_allo_even<60;out_allo_even=out_allo_even+1)
    begin: OUT_ALLOCATION_EVEN
        assign para_pixel_o[(out_allo_even+1)*8-1-:8] = pixel_o[out_allo_even];
    end
endgenerate

// Output generation
genvar out_gene_odd;

generate
    for (out_gene_odd=0;out_gene_odd<30;out_gene_odd=out_gene_odd+1)
    begin: OUT_GENERATION_ODD
        assign pixel_o[out_gene_odd] = cur_fig[out_gene_odd][l1_cnt+(l2_cnt<<1)];
    end
endgenerate

genvar out_gene_even;

generate
    for (out_gene_even=0;out_gene_even<30;out_gene_even=out_gene_even+1)
    begin: OUT_GENERATION_EVEN
        assign pixel_o[out_gene_even+30] = cur_fig[out_gene_even][l1_cnt+(l2_cnt<<1)+1];
    end
endgenerate

always @(posedge clk or negedge rst_n)
begin
    if (!rst_n)
        l1_cnt <= 4'b0;
    else if ((en_cnt)&&(l1_cnt<4'b0110))
        l1_cnt <= l1_cnt+4'b1;
    else if (en_cnt)
        l1_cnt <= 4'b0;
    else
        l1_cnt <= l1_cnt;
end

always @(posedge clk or negedge rst_n)
begin
    if (!rst_n)
        l2_cnt <= 1'b0;
    else if ((en_cnt)&&(l1_cnt==3'b110))
        l2_cnt <= l2_cnt+1'b1;
    else
        l2_cnt <= l2_cnt;
end

endmodule