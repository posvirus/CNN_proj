//////////////////////////////////////////////////////////////////////////////////
// School: Shanghai Jiao Tong University
// Author: Wenyao Chen
//
// Create Date: 2023/9/26
// Module Name: CNN_tb
// Project Name: CNN Design
// Description: The top module test platform
//
// Revision:
// Additional Comments:
//
//////////////////////////////////////////////////////////////////////////////////

`timescale 1ns/1ps

module CNN_tb();

// Parameter definition
parameter PERIOD_EXT = 10; // External clock period

// Macro definition
`define SCAN_IN_DELAY #10
`define SCAN_OUT_DELAY #10
`define PIXEL_DEPTH 75
`define BIAS_DEPTH 34
`define WEIGTH_DEPTH 545
`define SCAN_CHAIN_INPUT_LENGTH 188 // 188 si_bit_cell
`define SCAN_CHAIN_OUTPUT_LENGTH 50 // 50 so_bit_cell

// Visual memory
wire [`SCAN_CHAIN_INPUT_LENGTH-1:0] scan_in_mem;
reg [`SCAN_CHAIN_OUTPUT_LENGTH-1:0] scan_out_mem;
reg [39:0] pixel_mem [`PIXEL_DEPTH-1:0]; // Pixel memory
reg [23:0] bias_mem [`BIAS_DEPTH-1:0]; // Bias memory
reg [71:0] weight_mem [`WEIGTH_DEPTH-1:0]; // Weight memory

// Memory field allocation
reg scan_clk_sel = 1'b1; // clock source select (0: R.O., 1: external)
reg scan_clk_start = 1'b0; // Enable the R.O.
reg [2:0] scan_tap_sel = 3'b111; // R.O. period controller
reg [1:0] scan_internal_div_sel = 2'b0; // R.O. output select
reg [39:0] scan_i; // Pixel scan input
reg [23:0] bias_i; // Bias scan input
reg [71:0] data_w; // SRAM data input
reg [9:0] addr_w; // SRAM address input
reg sta; // CNN module activated signal
reg [5:0] res_sel_1 = 6'd20;      // conv_1st test output, the scale is 0-39 (Set by yourself) 
reg [5:0] res_sel_1_num = 6'd30;  // conv_1st test output, the scale is 0-63 (Set by yourself)
reg [10:0] res_sel_2 = 11'd10;    // conv_2nd test output, the scale is 0-1151 (Set by yourself)
reg [5:0] res_sel_3 = 6'd13;      // conv_3rd test output, the scale is 0-35 (Set by yourself)
reg [4:0] res_sel_3_num = 5'd20; // conv_3rd test output, the scale is 0-31 (Set by yourself)

//3 times per scan; 
integer sram_times;

assign scan_in_mem = {
           res_sel_3_num,
           res_sel_3,
           res_sel_2,
           res_sel_1_num,
           res_sel_1,
           sta,
           addr_w,
           data_w,
           bias_i,
           scan_i,
           scan_internal_div_sel,
           scan_tap_sel,
           scan_clk_start,
           scan_clk_sel
       };

// Module Input
reg clk_signal_ext; // External clock
reg rst_n; // Reset singal (active low)

reg write_en; // SRAM write enable

reg phi; // scan chain clock (phase I)
reg phib; // scan chain clock (phase II)
reg scan_i0o1; // scan chain module (0:in, 1:out)
reg load; // Data load signal
reg scan_in; // Scan chain serial input

// Module Output
wire clk_div1024_out; // Divided clock

wire phi_out;
wire phib_out;
wire scan_i0o1_out;
wire load_out;
wire scan_out;

// Aux signal
reg [9:0] pixel_cnt,bias_cnt,weight_cnt;

// Task definition (scan chain)
task load_chip; // Load the data from scan chain
    begin
        `SCAN_IN_DELAY load = 1'b1;
        `SCAN_IN_DELAY load = 1'b0;
    end
endtask

/*
task load_sram; // SRAM data loading
    begin
        `SCAN_IN_DELAY write_en = 1'b1;
        `SCAN_IN_DELAY write_en = 1'b0;
    end
endtask
*/

task chip_out; // Load output data to the scan chain
    begin
        `SCAN_OUT_DELAY scan_i0o1 = 1'b1;
        `SCAN_OUT_DELAY phi = 1'b1;
        `SCAN_OUT_DELAY phi = 1'b0;
        `SCAN_OUT_DELAY phib = 1'b1;
        `SCAN_OUT_DELAY phib = 1'b0;
        `SCAN_OUT_DELAY scan_i0o1 = 1'b0;
    end
endtask

task serial_scan_in;
    input [9:0] pixel_ptr; // Pixel memory index
    input [9:0] bias_ptr; // Bias memory index
    input [9:0] weight_ptr; // Weight memory index
    input sta_flag; // start flag
    integer scan_cnt;
    reg [`SCAN_CHAIN_INPUT_LENGTH-1:0] data_in;
    begin
        scan_i = pixel_mem[pixel_ptr];
        bias_i = bias_mem[bias_ptr];
        data_w = weight_mem[weight_ptr];
        addr_w = weight_ptr;
        sta = (sta_flag)?1'b1:1'b0;
        `SCAN_IN_DELAY data_in = scan_in_mem;
        for (scan_cnt=0;scan_cnt<`SCAN_CHAIN_INPUT_LENGTH;scan_cnt=scan_cnt+1)
        begin
            scan_in = data_in[`SCAN_CHAIN_INPUT_LENGTH-1];
            `SCAN_IN_DELAY phi = 1'b1;
            `SCAN_IN_DELAY phi = 1'b0;
            `SCAN_IN_DELAY phib = 1'b1;
            `SCAN_IN_DELAY phib = 1'b0;
            `SCAN_IN_DELAY data_in = data_in<<1;
        end
    end
endtask

task serial_scan_out;
    integer scan_cnt;
    begin
        for (scan_cnt=0;scan_cnt<`SCAN_CHAIN_OUTPUT_LENGTH;scan_cnt=scan_cnt+1)
        begin
            scan_out_mem = {scan_out_mem[`SCAN_CHAIN_OUTPUT_LENGTH-2:0],scan_out};
            `SCAN_IN_DELAY phi = 1'b1;
            `SCAN_IN_DELAY phi = 1'b0;
            `SCAN_IN_DELAY phib = 1'b1;
            `SCAN_IN_DELAY phib = 1'b0;
        end
    end
endtask

// Task definition (module behavior)
task sys_init; // System initialize
    begin
        //$fsdbDumpfile("CNN_tb.fsdb");
        //$fsdbDumpvars(0, CNN_tb); // This is to support generate FSDB waveform
        clk_signal_ext = 1'b0;
        rst_n = 1'b0;
        write_en = 1'b0;
        phi = 1'b0;
        phib = 1'b0;
        scan_i0o1 = 1'b0;
        load = 1'b0;
        scan_in = 1'b0;
    end
endtask

task VM_load;
    begin
        $readmemh("E:/study/byyx/test_platform/data_scan_in/figure.txt",pixel_mem); // write data to VM
        $readmemh("E:/study/byyx/test_platform/data_scan_in/bias.txt",bias_mem);
        $readmemh("E:/study/byyx/test_platform/data_scan_in/weight.txt",weight_mem);
    end
endtask

task print_result;
    integer scan_result;
    begin
        scan_result = $fopen("E:/study/byyx/test_platform/data_scan_in/result.txt","w");
        $fwrite(scan_result,"raw result: %50b\n",scan_out_mem);
        $fwrite(scan_result,"conv1_res_test: %3d\n",scan_out_mem[7:0]);
        $fwrite(scan_result,"conv2_res_test: %3d\n",scan_out_mem[15:8]);
        $fwrite(scan_result,"conv3_res_test: %3d\n",scan_out_mem[23:16]);
        $fwrite(scan_result,"data1_o: %3d\n",scan_out_mem[31:24]);
        $fwrite(scan_result,"data2_o: %3d\n",scan_out_mem[39:32]);
        $fwrite(scan_result,"circ_inter: %5d\n",scan_out_mem[49:40]);
        $fclose(scan_result);
    end
endtask

// External clock generation
always #(PERIOD_EXT/2) clk_signal_ext = ~clk_signal_ext;

// Test flow
initial
begin: MAIN_TEST_FLOW
    // Stage I: Reset
    $display("System initializing...");
    sys_init;

    // Stage II: Load data to VM
    $display("Loading test data...");
    VM_load;

    // Stage III: Scan in the data (to SRAM)
    #100 rst_n = 1'b1; // Remove rst_n
    $display("rst_n removed");
    $display("Scan in the data...");


    for (weight_cnt=9'd0;weight_cnt<`WEIGTH_DEPTH;weight_cnt=weight_cnt+1)
    begin
        //first time
        if (weight_cnt<`BIAS_DEPTH) // Load pixel/bias/weight at the same time
            serial_scan_in(weight_cnt,weight_cnt,weight_cnt,1'b0);
        else if (weight_cnt<`PIXEL_DEPTH) // Load pixel/weight at the same time
            serial_scan_in(weight_cnt,9'd0,weight_cnt,1'b0);
        else // Only load the weight
            serial_scan_in(9'd0,9'd0,weight_cnt,1'b0);
        load_chip;
        //load_sram;

        //second time
        write_en = 1'b1;
        if (weight_cnt<`BIAS_DEPTH) // Load pixel/bias/weight at the same time
            serial_scan_in(weight_cnt,weight_cnt,weight_cnt,1'b0);
        else if (weight_cnt<`PIXEL_DEPTH) // Load pixel/weight at the same time
            serial_scan_in(weight_cnt,9'd0,weight_cnt,1'b0);
        else // Only load the weight
            serial_scan_in(9'd0,9'd0,weight_cnt,1'b0);  
        load_chip;     

        //third time
        write_en = 1'b0;
        if (weight_cnt<`BIAS_DEPTH) // Load pixel/bias/weight at the same time
            serial_scan_in(weight_cnt,weight_cnt,weight_cnt,1'b0);
        else if (weight_cnt<`PIXEL_DEPTH) // Load pixel/weight at the same time
            serial_scan_in(weight_cnt,9'd0,weight_cnt,1'b0);
        else // Only load the weight
            serial_scan_in(9'd0,9'd0,weight_cnt,1'b0);  
        load_chip;    

        $display("Scaning cycle: %d, total cycle: %d...",weight_cnt+1,`WEIGTH_DEPTH);
    end

    // Stage IV: Start testing
    #100
    $display("Start testing...");
    serial_scan_in(9'd0,9'd0,9'd0,1'b1);
    load_chip;
end

initial
begin
    // Stage V: Scan out data and save
    #55000000 // Here I need a signal to catch the test signal
    chip_out;
    #10 serial_scan_out;
    #10 print_result;
    #10 $display("Test done!");
    $stop;
end

// Top module caller
cnn_top u_cnn_top(
            .clk_signal_ext(clk_signal_ext),
            .rst_n(rst_n),
            .clk_div1024_out(clk_div1024_out),

            .write_en(write_en),

            .phi(phi),
            .phib(phib),
            .scan_i0o1(scan_i0o1),
            .load(load),
            .scan_in(scan_in),

            .phi_out(phi_out),
            .phib_out(phib_out),
            .scan_i0o1_out(scan_i0o1_out),
            .load_out(load_out),
            .scan_out(scan_out)
        );

endmodule