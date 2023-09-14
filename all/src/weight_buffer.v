//////////////////////////////////////////////////////////////////////////////////
// School: Shanghai Jiao Tong University
// Author: Wenyao Chen
//
// Create Date: 2023/7/16
// Module Name: weight_buffer
// Project Name: CNN first-layer convolution Design
// Description: The weight matrix buffer for input allocation
//
// Revision: 
// 2023/8/12: 
// Change the data pattern of the buffer, making it can be updated in 9 cycles
// Additional Comments:
//
//////////////////////////////////////////////////////////////////////////////////

module weight_buffer
       (
           input  wire                         clk,
           input  wire                         rst_n,
           input  wire                         ud,
           input  wire                         en_DFF,
           input  wire                         en_cnt,
           input  wire [71:0]                  weight_i,

           output wire [11*8-1:0]              para_weight_o // Parallel weight output
       );

// Aux signal
wire  [7:0] weight_o [10:0];
wire [71:0] flip_conn [9:0]; // Interconnection of the DFF
reg  [7:0] cur_weight [10:0][6:0]; // Memory for storing the current weight
reg  [2:0] cnt; // Counter

// The next-weight buffer
genvar next_buf;

generate
    for (next_buf=0;next_buf<9;next_buf=next_buf+1)
    begin: NEXT_WEIGHT_BUF
        DFF_72bit u_DFF_72bit( // 72b=9*8b, 9 weights in one DFF
                      .clk(clk),
                      .rst_n(rst_n),
                      .en(en_DFF),
                      .d_i(flip_conn[next_buf]),

                      .q_o(flip_conn[next_buf+1])
                  );
    end
endgenerate

assign flip_conn[0] = weight_i;

// The current-weight buffer
genvar cur_buf_row,cur_buf_col;

generate
    for (cur_buf_row=0;cur_buf_row<11;cur_buf_row=cur_buf_row+1)
    begin: CURRENT_WEIGHT_BUF_ROW
        for (cur_buf_col=0;cur_buf_col<7;cur_buf_col=cur_buf_col+1)
        begin: CURRNET_WEIGHT_BUF_COL
            always @(posedge clk or negedge rst_n)
            begin
                if (!rst_n)
                    cur_weight[cur_buf_row][cur_buf_col] <= 8'b0;
                else if (ud)
                    cur_weight[cur_buf_row][cur_buf_col] <= flip_conn[((7*cur_buf_row+cur_buf_col)/9)+1][((7*cur_buf_row+cur_buf_col)%9+1)*8-1-:8];
                else
                    cur_weight[cur_buf_row][cur_buf_col] <= cur_weight[cur_buf_row][cur_buf_col];
            end
        end
    end
endgenerate

// Output allocation
genvar out_allo;

generate
    for (out_allo=0;out_allo<11;out_allo=out_allo+1)
    begin: OUT_ALLOCATION
        assign para_weight_o[(out_allo+1)*8-1-:8] = weight_o[out_allo];
    end
endgenerate

// Output generation
genvar out_gene;

generate
    for (out_gene=0;out_gene<11;out_gene=out_gene+1)
    begin: OUT_GENERATION
        assign weight_o[out_gene] = cur_weight[out_gene][cnt];
    end
endgenerate

always @(posedge clk or negedge rst_n)
begin
    if (!rst_n)
        cnt <= 3'b0;
    else if ((en_cnt)&&(cnt<3'b110))
        cnt <= cnt+3'b1;
    else if (en_cnt)
        cnt <= 3'b0;
    else
        cnt <= cnt;
end

endmodule