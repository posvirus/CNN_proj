//////////////////////////////////////////////////////////////////////////////////
// School: Shanghai Jiao Tong University
// Author: Wenyao Chen
//
// Create Date: 2023/8/16
// Module Name: conv_1st_ctrl
// Project Name: CNN first-layer convolution Design
// Description: The control module of the first-layer design
//
// Revision:
// 2023/9/2:
// Extend the cycling period
// 2023/9/26:
// Delay the en_array, flush and valid_o signal
// Additional Comments:
//
//////////////////////////////////////////////////////////////////////////////////

module conv_1st_ctrl
       (
           input  wire                         clk,
           input  wire                         rst_n,
           input  wire                         sta, // start signal

           output reg [9:0]                    data_cnt, // the data counter
           output reg [8:0]                    init_cnt, // the initial counter
           output reg                          state, // state machine: 0: init; 1: cycle

           output wire                         en_array, // systolic array enable
           output reg                          en_DFF_pixel, // pixel buffer enable
           output reg                          en_DFF_weight, // weight buffer enable
           output reg                          en_cnt, // buffer counter enable
           output reg                          ud_pixel, // pixel buffer enable
           output reg                          ud_weight, // weight buffer enable
           output wire                         flush, // flush signal
           output reg [4:0]                    weight_num, // number of weight
           output wire                         valid_o // valid output
       );

// Delay signal
reg delay_en_array, delay_flush, delay_valid_o;

// Initialize (counter)
always @(posedge clk or negedge rst_n)
begin
    if (!rst_n)
        init_cnt <= 9'b0;
    else if ((sta)&&(init_cnt<301)) // 301=300(load)+1(update)
        init_cnt <= init_cnt+1;
    else
        init_cnt <= init_cnt;
end

// Output control
always @(posedge clk or negedge rst_n) // state machine
begin
    if (!rst_n)
        state <= 1'b0;
    else if (init_cnt==301) // initial pixel/weight load complete
        state <= 1'b1; // start cycling
    else
        state <= state;
end

always @(posedge clk or negedge rst_n) // data counter
begin
    if (!rst_n)
        data_cnt <= 10'b0;
    else if ((state==1'b1)&&(data_cnt<575)) // 575=32*18-1
        data_cnt <= data_cnt+1;
    else
        data_cnt <= 10'b0;
end

always @(posedge clk or negedge rst_n) // systolic array enable
begin
    if (!rst_n)
        delay_en_array <= 1'b0;
    else if ((state==1'b0)&&(init_cnt==301))
        delay_en_array <= 1'b1;
    else if ((state==1'b1)&&((data_cnt%9)<6)||((data_cnt%9)==8)) // cycling
        delay_en_array <= 1'b1;
    else
        delay_en_array <= 1'b0;
end

always @(posedge clk or negedge rst_n) // buffer counter enable
begin
    if (!rst_n)
        en_cnt <= 1'b0;
    else if ((state==1'b0)&&(init_cnt==301))
        en_cnt <= 1'b1;
    else if ((state==1'b1)&&((data_cnt%9)<6)||((data_cnt%9)==8)) // cycling
        en_cnt <= 1'b1;
    else
        en_cnt <= 1'b0;
end

always @(posedge clk or negedge rst_n) // pixel buffer enable
begin
    if (!rst_n)
        en_DFF_pixel <= 1'b0;
    else if ((sta)&&(state==1'b0)&&(init_cnt<300)) // initialize
        en_DFF_pixel <= 1'b1;
    else if ((state==1'b1)&&(data_cnt<300)) // cycling
        en_DFF_pixel <= 1'b1;
    else
        en_DFF_pixel <= 1'b0;
end

always @(posedge clk or negedge rst_n) // weight buffer enable
begin
    if (!rst_n)
        en_DFF_weight <= 1'b0;
    else if ((sta)&&(state==1'b0)&&(init_cnt<9)) // initialize
        en_DFF_weight <= 1'b1;
    else if ((state==1'b1)&&((data_cnt%18)<9)) // cycling
        en_DFF_weight <= 1'b1;
    else
        en_DFF_weight <= 1'b0;
end

always @(posedge clk or negedge rst_n) // pixel buffer update
begin
    if (!rst_n)
        ud_pixel <= 1'b0;
    else if ((state==1'b0)&&(init_cnt==300)) // initialize
        ud_pixel <= 1'b1;
    else if ((state==1'b0)&&(init_cnt==301)) // initialize
        ud_pixel <= 1'b0;
    else if ((state==1'b1)&&(data_cnt==574)) // cycling
        ud_pixel <= 1'b1;
    else
        ud_pixel <= 1'b0;
end

always @(posedge clk or negedge rst_n) // weight buffer update
begin
    if (!rst_n)
        ud_weight <= 1'b0;
    else if ((state==1'b0)&&(init_cnt==300)) // initialize
        ud_weight <= 1'b1;
    else if ((state==1'b0)&&(init_cnt==301)) // initialize
        ud_weight <= 1'b0;
    else if ((state==1'b1)&&((data_cnt%18)==16)) // cycling
        ud_weight <= 1'b1;
    else
        ud_weight <= 1'b0;
end

always @(posedge clk or negedge rst_n) // flush
begin
    if (!rst_n)
        delay_flush <= 1'b0;
    else if ((state==1'b1)&&((data_cnt%9)==8)) // cycling
        delay_flush <= 1'b1;
    else
        delay_flush <= 1'b0;
end

always @(posedge clk or negedge rst_n) // weight matrix number
begin
    if (!rst_n)
        weight_num <= 4'b0;
    else if (state==1'b0) // initialize
        weight_num <= 5'b11111;
    else if ((state==1'b1)&&((data_cnt%18)==0)) // cycling
        weight_num <= weight_num+1;
    else
        weight_num <= weight_num;
end

always @(posedge clk or negedge rst_n) // valid output
begin
    if (!rst_n)
        delay_valid_o <= 1'b0;
    else if ((state==1'b1)&&((data_cnt%9)==7)) // cycling
        delay_valid_o <= 1'b1;
    else
        delay_valid_o <= 1'b0;
end

// Delay signal
DFF_1bit u_DFF_1bit_array(
             .clk(clk),
             .rst_n(rst_n),
             .en(1'b1),
             .d_i(delay_en_array),

             .q_o(en_array)
         );

DFF_1bit u_DFF_1bit_flush(
             .clk(clk),
             .rst_n(rst_n),
             .en(1'b1),
             .d_i(delay_flush),

             .q_o(flush)
         );

DFF_1bit u_DFF_1bit_valid(
             .clk(clk),
             .rst_n(rst_n),
             .en(1'b1),
             .d_i(delay_valid_o),

             .q_o(valid_o)
         );

endmodule