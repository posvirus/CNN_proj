//---------------------------------------------------------------------
//               Copyright(c) Synopsys, Inc.                           
//     All Rights reserved - Unpublished -rights reserved under        
//     the Copyright laws of the United States of America.             
//                                                                     
//  U.S. Patents: 7,093,156 B1 and 7,406,620 B2 (and more pending).    
//                                                                     
//  This file includes the Confidential information of Synopsys, Inc.  
//  and Huali.                                                         
//  The receiver of this Confidential Information shall not disclose   
//  it to any third party and shall protect its confidentiality by     
//  using the same degree of care, but not less than a reasonable      
//  degree of care, as the receiver uses to protect receiver's own     
//  Confidential Information.                                          
//  Licensee acknowledges and agrees that all output generated for     
//  Licensee by Synopsys, Inc. as described in the pertinent Program   
//  Schedule(s), or generated by Licensee through use of any Compiler  
//  licensed hereunder contains information that complies with the     
//  Virtual Component Identification Physical Tagging Standard (VCID)  
//  as maintained by the Virtual Socket Interface Alliance (VSIA).     
//  Such information may be expressed in GDSII Layer 63 or other such  
//  layer designated by the VSIA, hardware definition languages, or    
//  other formats.  Licensee is not authorized to alter or change any  
//  such information.                                                  
//---------------------------------------------------------------------
//                                                                     
//  Built for linux64 and running on linux64.                          
//                                                                     
//  Software           : Rev: S-2021.12                                
//  Library Format     : Rev: 1.05.00                                  
//  Compiler Name      : hu55npkb1p11sadsl512sa05                      
//  Platform           : Linux3.10.0-1160.49.1.el7.x86_64              
//                     : #1 SMP Tue Nov 30 15:51:32 UTC 2021x86_64     
//  Date of Generation : Tue Aug 29 11:33:08 CST 2023                  
//                                                                     
//---------------------------------------------------------------------
//   --------------------------------------------------------------     
//                       Template Revision : 3.6.3                      
//   --------------------------------------------------------------     
//                      * Synchronous, 1-Port SRAM *                  
//                      * Verilog Behavioral Model *                  
//                THIS IS A SYNCHRONOUS 1-PORT MEMORY MODEL           
//                                                                    
//   Memory Name:sadslspkb1p576x72m4b1w0cp0d0t0                       
//   Memory Size:576 words x 72 bits                                  
//                                                                    
//                               PORT NAME                            
//                               ---------                            
//               Output Ports                                         
//                                   Q[71:0]                          
//               Input Ports:                                         
//                                   ADR[9:0]                         
//                                   D[71:0]                          
//                                   WE                               
//                                   ME                               
//                                   CLK                              
//                                   TEST1                            
//                                   RME                              
//                                   RM[3:0]                          
// -------------------------------------------------------------------- 

//////////////////////////////////////////////////////////////////////////////////
// School: SJTU
// Author: Zhihong Chen
//
// Create Date: 2023/8/29
// Module Name: 576*72 SRAM
// Project Name: CNN SRAM Design
// Description: 576 words x 72 bits, Synchronous, 1-Port SRAM
//
// version: v1.0
// Additional Comments:
//
//////////////////////////////////////////////////////////////////////////////////

// -------------------------------------------------------------------- 
//  Conv1: ceiling((77+2)/(72/8))*32 = 288 words [0,287]
//  Conv2: ceiling((9+2)/(72/8))*32  = 64  words [288,351]
//  Conv3: ceiling((32+2)/(72/8))*32 = 128 words [352,479]
//  FC:    ceiling((18+4)/(72/8))*32 = 96  words [480,575]
// -------------------------------------------------------------------- 
`resetall 
`timescale 1 ns / 1 ps 
`celldefine 
`ifdef verifault // for fault simulation purpose 
`suppress_faults 
`enable_portfaults 
`endif 

`define True    1'b1
`define False   1'b0

module sadslspkb1p576x72m4b1w0cp0d0t0 ( Q, ADR, D, WE, ME, CLK, TEST1, RME, RM);

// Input/Output Ports Declaration
output  [71:0] Q;
input  [9:0] ADR;
input  [71:0] D;
input WE;
input ME;
input CLK;
input TEST1;
input RME;
input  [3:0] RM;


// Local registers, wires, etc
parameter PreloadFilename = "init.file";
`ifdef MEM_CHECK_OFF
parameter MES_ALL = "OFF";
`else
parameter MES_ALL = "ON";
`endif


wire [71:0] Q_tmp;
reg  [71:0] Q_reg;

always @(Q_tmp)
begin
  Q_reg <= Q_tmp;
end

assign Q = Q_reg;

generic_behav_sadslspkb1p576x72m4b1w0cp0d0t0 #( PreloadFilename, MES_ALL) u0 ( .Q(Q_tmp), .ADR(ADR), .D(D), .WE(WE), .ME(ME), .CLK(CLK) );

endmodule

`endcelldefine 
`ifdef verifault 
`disable_portfaults 
`nosuppress_faults 
`endif 


module generic_behav_sadslspkb1p576x72m4b1w0cp0d0t0 (  Q, ADR, D, WE, ME, CLK );

parameter PreloadFilename = "init.file";
parameter MES_ALL = "ON";
parameter words = 576, bits = 72, addrbits = 10;

output [bits-1:0] Q;
input [addrbits-1:0] ADR;
input [bits-1:0] D;
input WE;
input ME;
input CLK;

reg [bits-1:0] Q;


reg flag_clk_valid;
reg mes_all_valid;

wire [1:0] ADR_valid;
reg [71:0] mem_core_array [0:575];

parameter DataX = { bits { 1'bx } };

// -------------------------------------------------------------------
// Common tasks
// -------------------------------------------------------------------

// Task to report unknown messages
task report_unknown;
input [8*5:1] signal;
begin
    if( MES_ALL=="ON" && $realtime != 0 && mes_all_valid )
    begin
      $display("<<%0s unknown>> at time=%t; instance=%m (RAMS1H)",signal,$realtime);
    end
end
endtask


task corrupt_all_loc;
 input flag_range_ok;
 integer addr_index;
 begin
  if( flag_range_ok == `True)
   begin
    for( addr_index = 0; addr_index < words; addr_index = addr_index + 1) begin
     mem_core_array[ addr_index] = DataX;
    end
   end
 end
endtask



initial 
begin
  flag_clk_valid = `False;
  mes_all_valid = 1'b0;
end 

assign ADR_valid = (( ^ADR === 1'bx ) ? 2'b01 : ( ( ADR > 10'b1000111111 ) ? 2'b10 : 2'b00 ));

always @ ( negedge CLK )
begin : blk_negedge_clk_0
  if ( CLK !== 1'bx )
  begin
    flag_clk_valid = `True;
  end // end if CLK != X
  else
  begin
    report_unknown("CLK");
    flag_clk_valid = `False;
    Q = DataX;
    corrupt_all_loc(`True);
  end // end of else of CLK != X
end // end of block blk_negedge_clk_0

always @ ( posedge CLK )
begin : blk_posedge_clk_0
  if ( flag_clk_valid )
  begin
    if ( CLK === 1'b1)
    begin
      if ( ME === 1'b1) 
      begin
        if ( WE === 1'b1) 
        begin
          WritePort;
        end // end of Write
        else if ( WE === 1'b0 )
        begin
          ReadPort;
        end // end of Read
        else
        begin
          report_unknown("WE");
          mem_core_array[ADR] = DataX;
          if ( ADR_valid === 2'b00 ) 
          begin
            Q = DataX;
          end // end of if ADR_valid = 2'b00
          else if ( ADR_valid === 2'b01 ) 
          begin
            Q = DataX;
            corrupt_all_loc(`True);
          end // end of else of ADR_valid = 2'b01
        end // end of else of WE = X
      end // end of ME = 1
      else
      begin
        if ( ME === 1'bx ) 
        begin
          report_unknown("ME");
          `ifdef virage_ignore_read_addrx
            if ( WE === 1'b1 )
            begin
              corrupt_all_loc(`True);
            end
            else
            begin
              Q = 72'bx;
            end
          `else
            begin
              corrupt_all_loc(`True);
              if ( WE === 1'b0 )
              begin
                Q = 72'bx;
              end
            end
          `endif
        end // end of if ME = X
      end // end of else of ME = 1
    end // end of if CLK = 1
    else 
    begin
      if ( CLK === 1'bx ) 
      begin
        report_unknown("CLK");
        Q = DataX;
        corrupt_all_loc(`True);
      end // end of if CLK = 1'bx
    end // end of else of CLK = 1
  end // end of if flag_clk_valid = 1
  else 
  begin
    Q = DataX;
    corrupt_all_loc(`True);
  end // end of else of flag_clk_valid = 1
end // end of block blk_posedge_clk_0

task WritePort;
begin : blk_WritePort
  if ( ADR_valid === 2'b00 )
  begin
    mem_core_array[ADR] = D;
    if ( !mes_all_valid )
       mes_all_valid = 1'b1;
    if ( ^D === 1'bx )
    begin
      report_unknown("D");
    end
  end // end of if ADR_valid = 2'b00
  else if (ADR_valid === 2'b10 )
  begin
    if ( MES_ALL == "ON" && $realtime != 0 && mes_all_valid )
    begin
      $display("<<WARNING:address is out of range\n RANGE:0 to 575>> at time=%t; instance=%m (RAMS1H)",$realtime);
    end // end of if mes_all_valid 
  end // end of else of ADR_valid = 2'b10
  else 
  begin
    report_unknown("ADR");
    corrupt_all_loc(`True);
  end // end of else of ADR_valid = 2'b01
end // end of block blk_WritePort
endtask

task ReadPort;
begin : blk_ReadPort
  if ( ADR_valid === 2'b00 )
  begin
    Q = mem_core_array[ADR];
  end // end of if ADR_valid = 2'b00
  else if ( ADR_valid === 2'b10 )
  begin
    Q = DataX;
    if ( MES_ALL == "ON" && $realtime != 0 && mes_all_valid )
    begin
      $display("<<WARNING:address is out of range\n RANGE:0 to 575>> at time=%t; instance=%m (RAMS1H)",$realtime);
    end // end of if mes_all_valid
  end // end of else of ADR_valid = 2'b10
  else 
  begin
    report_unknown("ADR");
    Q = DataX;
    `ifdef virage_ignore_read_addrx
      if ( WE === 1'b1 )
        corrupt_all_loc(`True);
    `else
        corrupt_all_loc(`True);
    `endif
  end // end of else of ADR_valid = 2'b01
end // end of block blk_ReadPort
endtask

endmodule
