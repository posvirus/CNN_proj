//----------------------------------------------------------------------------
// Date		: $Date: 2015/07/31 10:42:07 $
// Copyright	: 1997-2015 by Synopsys, Inc., All Rights Reserved.
// Revision	: $Revision: 1.3 $
//----------------------------------------------------------------------------

//----------------------------------------------------------------------------
// Cell model definitions.
//----------------------------------------------------------------------------

`resetall


`timescale 100ps / 1ps

`define SNPS_SEQ_DELAY 1
`define SNPS_COMBO_DELAY 1
`define SNPS_CKGT_DELAY 0
`define SNPS_LAT_DELAY 1

`ifdef VIRL_functiononly
    `delay_mode_distributed
    `define _fv
`else
    `delay_mode_path
`endif
//%BEGIN SVN_ADDF42_1

`celldefine
module SVN_ADDF42_1 (S, CO, ICO, A, B, C, D, CI);
   output S, CO, ICO;
   input A, B, C, D, CI;

   wire int_res_0, int_res_1, int_res_2, 
      int_res_3, int_res_4, int_res_5, int_res_6, 
      int_res_7;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////

   xor (int_res_0, A, B, C);
   and (int_res_1, int_res_0, D);
   xor (int_res_2, A, B, C);
   and (int_res_3, int_res_2, CI);
   and (int_res_4, D, CI);
   and (int_res_5, A, B);
   and (int_res_6, A, C);
   and (int_res_7, B, C);

   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////

   `ifdef VIRL_functiononly
      xor #`SNPS_COMBO_DELAY (S, A, B, C, D, CI);
      or #`SNPS_COMBO_DELAY (CO, int_res_1, int_res_3, int_res_4);
      or #`SNPS_COMBO_DELAY (ICO, int_res_5, int_res_6, int_res_7);
   `else
      xor (S, A, B, C, D, CI);
      or (CO, int_res_1, int_res_3, int_res_4);
      or (ICO, int_res_5, int_res_6, int_res_7);

   `endif

   `ifdef VIRL_functiononly

   `else


specify
(CI +=> CO)=(0, 0);
if ((~(A) & ~(B) & ~(C) & CI)) (D +=> CO)=(0, 0);
if ((~(A) & ~(B) & C & ~(CI))) (D +=> CO)=(0, 0);
if ((~(A) & B & ~(C) & ~(CI))) (D +=> CO)=(0, 0);
if ((~(A) & B & C & CI)) (D +=> CO)=(0, 0);
if ((A & ~(B) & ~(C) & ~(CI))) (D +=> CO)=(0, 0);
if ((A & ~(B) & C & CI)) (D +=> CO)=(0, 0);
if ((A & B & ~(C) & CI)) (D +=> CO)=(0, 0);
if ((A & B & C & ~(CI))) (D +=> CO)=(0, 0);
if ((~(A) & ~(B) & ~(CI) & D)) (C +=> CO)=(0, 0);
if ((~(A) & ~(B) & CI & ~(D))) (C +=> CO)=(0, 0);
if ((~(A) & B & ~(CI) & D)) (C -=> CO)=(0, 0);
if ((~(A) & B & CI & ~(D))) (C -=> CO)=(0, 0);
if ((A & ~(B) & ~(CI) & D)) (C -=> CO)=(0, 0);
if ((A & ~(B) & CI & ~(D))) (C -=> CO)=(0, 0);
if ((A & B & ~(CI) & D)) (C +=> CO)=(0, 0);
if ((A & B & CI & ~(D))) (C +=> CO)=(0, 0);
if ((~(A) & ~(C) & ~(CI) & D)) (B +=> CO)=(0, 0);
if ((~(A) & ~(C) & CI & ~(D))) (B +=> CO)=(0, 0);
if ((~(A) & C & ~(CI) & D)) (B -=> CO)=(0, 0);
if ((~(A) & C & CI & ~(D))) (B -=> CO)=(0, 0);
if ((A & ~(C) & ~(CI) & D)) (B -=> CO)=(0, 0);
if ((A & ~(C) & CI & ~(D))) (B -=> CO)=(0, 0);
if ((A & C & ~(CI) & D)) (B +=> CO)=(0, 0);
if ((A & C & CI & ~(D))) (B +=> CO)=(0, 0);
if ((~(B) & ~(C) & ~(CI) & D)) (A +=> CO)=(0, 0);
if ((~(B) & ~(C) & CI & ~(D))) (A +=> CO)=(0, 0);
if ((~(B) & C & ~(CI) & D)) (A -=> CO)=(0, 0);
if ((~(B) & C & CI & ~(D))) (A -=> CO)=(0, 0);
if ((B & ~(C) & ~(CI) & D)) (A -=> CO)=(0, 0);
if ((B & ~(C) & CI & ~(D))) (A -=> CO)=(0, 0);
if ((B & C & ~(CI) & D)) (A +=> CO)=(0, 0);
if ((B & C & CI & ~(D))) (A +=> CO)=(0, 0);
if ((~(A) & B & ~(CI) & ~(D))) (C +=> ICO)=(0, 0);
if ((~(A) & B & ~(CI) & D)) (C +=> ICO)=(0, 0);
if ((~(A) & B & CI & ~(D))) (C +=> ICO)=(0, 0);
if ((~(A) & B & CI & D)) (C +=> ICO)=(0, 0);
if ((A & ~(B) & ~(CI) & ~(D))) (C +=> ICO)=(0, 0);
if ((A & ~(B) & ~(CI) & D)) (C +=> ICO)=(0, 0);
if ((A & ~(B) & CI & ~(D))) (C +=> ICO)=(0, 0);
if ((A & ~(B) & CI & D)) (C +=> ICO)=(0, 0);
if ((~(A) & C & ~(CI) & ~(D))) (B +=> ICO)=(0, 0);
if ((~(A) & C & ~(CI) & D)) (B +=> ICO)=(0, 0);
if ((~(A) & C & CI & ~(D))) (B +=> ICO)=(0, 0);
if ((~(A) & C & CI & D)) (B +=> ICO)=(0, 0);
if ((A & ~(C) & ~(CI) & ~(D))) (B +=> ICO)=(0, 0);
if ((A & ~(C) & ~(CI) & D)) (B +=> ICO)=(0, 0);
if ((A & ~(C) & CI & ~(D))) (B +=> ICO)=(0, 0);
if ((A & ~(C) & CI & D)) (B +=> ICO)=(0, 0);
if ((~(B) & C & ~(CI) & ~(D))) (A +=> ICO)=(0, 0);
if ((~(B) & C & ~(CI) & D)) (A +=> ICO)=(0, 0);
if ((~(B) & C & CI & ~(D))) (A +=> ICO)=(0, 0);
if ((~(B) & C & CI & D)) (A +=> ICO)=(0, 0);
if ((B & ~(C) & ~(CI) & ~(D))) (A +=> ICO)=(0, 0);
if ((B & ~(C) & ~(CI) & D)) (A +=> ICO)=(0, 0);
if ((B & ~(C) & CI & ~(D))) (A +=> ICO)=(0, 0);
if ((B & ~(C) & CI & D)) (A +=> ICO)=(0, 0);
if ((A & B & C & ~(D)) | (A & B & ~(C) & D) | (A & ~(B) & C & D) | (A & ~(B) & ~(C) & ~(D)) | (~(A) & B & C & D) | (~(A) & B & ~(C) & ~(D)) | (~(A) & ~(B) & C & ~(D)) | (~(A) & ~(B) & ~(C) & D)) (CI -=> S)=(0, 0);
if ((A & B & C & D) | (A & B & ~(C) & ~(D)) | (A & ~(B) & C & ~(D)) | (A & ~(B) & ~(C) & D) | (~(A) & B & C & ~(D)) | (~(A) & B & ~(C) & D) | (~(A) & ~(B) & C & D) | (~(A) & ~(B) & ~(C) & ~(D))) (CI +=> S)=(0, 0);
if ((~(A) & ~(B) & ~(C) & ~(CI))) (D +=> S)=(0, 0);
if ((~(A) & ~(B) & ~(C) & CI)) (D -=> S)=(0, 0);
if ((~(A) & ~(B) & C & ~(CI))) (D -=> S)=(0, 0);
if ((~(A) & ~(B) & C & CI)) (D +=> S)=(0, 0);
if ((~(A) & B & ~(C) & ~(CI))) (D -=> S)=(0, 0);
if ((~(A) & B & ~(C) & CI)) (D +=> S)=(0, 0);
if ((~(A) & B & C & ~(CI))) (D +=> S)=(0, 0);
if ((~(A) & B & C & CI)) (D -=> S)=(0, 0);
if ((A & ~(B) & ~(C) & ~(CI))) (D -=> S)=(0, 0);
if ((A & ~(B) & ~(C) & CI)) (D +=> S)=(0, 0);
if ((A & ~(B) & C & ~(CI))) (D +=> S)=(0, 0);
if ((A & ~(B) & C & CI)) (D -=> S)=(0, 0);
if ((A & B & ~(C) & ~(CI))) (D +=> S)=(0, 0);
if ((A & B & ~(C) & CI)) (D -=> S)=(0, 0);
if ((A & B & C & ~(CI))) (D -=> S)=(0, 0);
if ((A & B & C & CI)) (D +=> S)=(0, 0);
if ((~(A) & ~(B) & ~(CI) & ~(D))) (C +=> S)=(0, 0);
if ((~(A) & ~(B) & ~(CI) & D)) (C -=> S)=(0, 0);
if ((~(A) & ~(B) & CI & ~(D))) (C -=> S)=(0, 0);
if ((~(A) & ~(B) & CI & D)) (C +=> S)=(0, 0);
if ((~(A) & B & ~(CI) & ~(D))) (C -=> S)=(0, 0);
if ((~(A) & B & ~(CI) & D)) (C +=> S)=(0, 0);
if ((~(A) & B & CI & ~(D))) (C +=> S)=(0, 0);
if ((~(A) & B & CI & D)) (C -=> S)=(0, 0);
if ((A & ~(B) & ~(CI) & ~(D))) (C -=> S)=(0, 0);
if ((A & ~(B) & ~(CI) & D)) (C +=> S)=(0, 0);
if ((A & ~(B) & CI & ~(D))) (C +=> S)=(0, 0);
if ((A & ~(B) & CI & D)) (C -=> S)=(0, 0);
if ((A & B & ~(CI) & ~(D))) (C +=> S)=(0, 0);
if ((A & B & ~(CI) & D)) (C -=> S)=(0, 0);
if ((A & B & CI & ~(D))) (C -=> S)=(0, 0);
if ((A & B & CI & D)) (C +=> S)=(0, 0);
if ((~(A) & ~(C) & ~(CI) & ~(D))) (B +=> S)=(0, 0);
if ((~(A) & ~(C) & ~(CI) & D)) (B -=> S)=(0, 0);
if ((~(A) & ~(C) & CI & ~(D))) (B -=> S)=(0, 0);
if ((~(A) & ~(C) & CI & D)) (B +=> S)=(0, 0);
if ((~(A) & C & ~(CI) & ~(D))) (B -=> S)=(0, 0);
if ((~(A) & C & ~(CI) & D)) (B +=> S)=(0, 0);
if ((~(A) & C & CI & ~(D))) (B +=> S)=(0, 0);
if ((~(A) & C & CI & D)) (B -=> S)=(0, 0);
if ((A & ~(C) & ~(CI) & ~(D))) (B -=> S)=(0, 0);
if ((A & ~(C) & ~(CI) & D)) (B +=> S)=(0, 0);
if ((A & ~(C) & CI & ~(D))) (B +=> S)=(0, 0);
if ((A & ~(C) & CI & D)) (B -=> S)=(0, 0);
if ((A & C & ~(CI) & ~(D))) (B +=> S)=(0, 0);
if ((A & C & ~(CI) & D)) (B -=> S)=(0, 0);
if ((A & C & CI & ~(D))) (B -=> S)=(0, 0);
if ((A & C & CI & D)) (B +=> S)=(0, 0);
if ((~(B) & ~(C) & ~(CI) & ~(D))) (A +=> S)=(0, 0);
if ((~(B) & ~(C) & ~(CI) & D)) (A -=> S)=(0, 0);
if ((~(B) & ~(C) & CI & ~(D))) (A -=> S)=(0, 0);
if ((~(B) & ~(C) & CI & D)) (A +=> S)=(0, 0);
if ((~(B) & C & ~(CI) & ~(D))) (A -=> S)=(0, 0);
if ((~(B) & C & ~(CI) & D)) (A +=> S)=(0, 0);
if ((~(B) & C & CI & ~(D))) (A +=> S)=(0, 0);
if ((~(B) & C & CI & D)) (A -=> S)=(0, 0);
if ((B & ~(C) & ~(CI) & ~(D))) (A -=> S)=(0, 0);
if ((B & ~(C) & ~(CI) & D)) (A +=> S)=(0, 0);
if ((B & ~(C) & CI & ~(D))) (A +=> S)=(0, 0);
if ((B & ~(C) & CI & D)) (A -=> S)=(0, 0);
if ((B & C & ~(CI) & ~(D))) (A +=> S)=(0, 0);
if ((B & C & ~(CI) & D)) (A -=> S)=(0, 0);
if ((B & C & CI & ~(D))) (A -=> S)=(0, 0);
if ((B & C & CI & D)) (A +=> S)=(0, 0);
endspecify
   `endif

endmodule
`endcelldefine

//%END SVN_ADDF42_1

//%BEGIN SVN_ADDF_1

`celldefine
module SVN_ADDF_1 (S, CO, A, B, CI);
   output S, CO;
   input A, B, CI;

   wire int_res_0, int_res_1, int_res_2;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////

   and (int_res_0, A, B);
   and (int_res_1, A, CI);
   and (int_res_2, B, CI);
   `ifdef VIRL_functiononly
      xor #`SNPS_COMBO_DELAY (S, A, B, CI);
      or #`SNPS_COMBO_DELAY (CO, int_res_0, int_res_1, int_res_2);
   `else
      xor (S, A, B, CI);
      or (CO, int_res_0, int_res_1, int_res_2);
   `endif

   `ifdef VIRL_functiononly

   `else

   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////


specify
if ((~(A) & B)) (CI +=> CO)=(0, 0);
if ((A & ~(B))) (CI +=> CO)=(0, 0);
if ((~(A) & CI)) (B +=> CO)=(0, 0);
if ((A & ~(CI))) (B +=> CO)=(0, 0);
if ((~(B) & CI)) (A +=> CO)=(0, 0);
if ((B & ~(CI))) (A +=> CO)=(0, 0);
if ((~(A) & ~(B))) (CI +=> S)=(0, 0);
if ((~(A) & B)) (CI -=> S)=(0, 0);
if ((A & ~(B))) (CI -=> S)=(0, 0);
if ((A & B)) (CI +=> S)=(0, 0);
if ((~(A) & ~(CI))) (B +=> S)=(0, 0);
if ((~(A) & CI)) (B -=> S)=(0, 0);
if ((A & ~(CI))) (B -=> S)=(0, 0);
if ((A & CI)) (B +=> S)=(0, 0);
if ((~(B) & ~(CI))) (A +=> S)=(0, 0);
if ((~(B) & CI)) (A -=> S)=(0, 0);
if ((B & ~(CI))) (A -=> S)=(0, 0);
if ((B & CI)) (A +=> S)=(0, 0);
endspecify
   `endif

endmodule
`endcelldefine

//%END SVN_ADDF_1

//%BEGIN SVN_ADDF_2

`celldefine
module SVN_ADDF_2 (S, CO, A, B, CI);
   output S, CO;
   input A, B, CI;

   wire int_res_0, int_res_1, int_res_2;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////

   and (int_res_0, A, B);
   and (int_res_1, A, CI);
   and (int_res_2, B, CI);
   `ifdef VIRL_functiononly
      xor #`SNPS_COMBO_DELAY (S, A, B, CI);
      or #`SNPS_COMBO_DELAY (CO, int_res_0, int_res_1, int_res_2);
   `else
      xor (S, A, B, CI);
      or (CO, int_res_0, int_res_1, int_res_2);
   `endif

   `ifdef VIRL_functiononly

   `else

   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////


specify
if ((~(A) & B)) (CI +=> CO)=(0, 0);
if ((A & ~(B))) (CI +=> CO)=(0, 0);
if ((~(A) & CI)) (B +=> CO)=(0, 0);
if ((A & ~(CI))) (B +=> CO)=(0, 0);
if ((~(B) & CI)) (A +=> CO)=(0, 0);
if ((B & ~(CI))) (A +=> CO)=(0, 0);
if ((~(A) & ~(B))) (CI +=> S)=(0, 0);
if ((~(A) & B)) (CI -=> S)=(0, 0);
if ((A & ~(B))) (CI -=> S)=(0, 0);
if ((A & B)) (CI +=> S)=(0, 0);
if ((~(A) & ~(CI))) (B +=> S)=(0, 0);
if ((~(A) & CI)) (B -=> S)=(0, 0);
if ((A & ~(CI))) (B -=> S)=(0, 0);
if ((A & CI)) (B +=> S)=(0, 0);
if ((~(B) & ~(CI))) (A +=> S)=(0, 0);
if ((~(B) & CI)) (A -=> S)=(0, 0);
if ((B & ~(CI))) (A -=> S)=(0, 0);
if ((B & CI)) (A +=> S)=(0, 0);
endspecify
   `endif

endmodule
`endcelldefine

//%END SVN_ADDF_2

//%BEGIN SVN_ADDF_4

`celldefine
module SVN_ADDF_4 (S, CO, A, B, CI);
   output S, CO;
   input A, B, CI;

   wire int_res_0, int_res_1, int_res_2;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////

   and (int_res_0, A, B);
   and (int_res_1, A, CI);
   and (int_res_2, B, CI);
   `ifdef VIRL_functiononly
      xor #`SNPS_COMBO_DELAY (S, A, B, CI);
      or #`SNPS_COMBO_DELAY (CO, int_res_0, int_res_1, int_res_2);
   `else
      xor (S, A, B, CI);
      or (CO, int_res_0, int_res_1, int_res_2);
   `endif

   `ifdef VIRL_functiononly

   `else

   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////


specify
if ((~(A) & B)) (CI +=> CO)=(0, 0);
if ((A & ~(B))) (CI +=> CO)=(0, 0);
if ((~(A) & CI)) (B +=> CO)=(0, 0);
if ((A & ~(CI))) (B +=> CO)=(0, 0);
if ((~(B) & CI)) (A +=> CO)=(0, 0);
if ((B & ~(CI))) (A +=> CO)=(0, 0);
if ((~(A) & ~(B))) (CI +=> S)=(0, 0);
if ((~(A) & B)) (CI -=> S)=(0, 0);
if ((A & ~(B))) (CI -=> S)=(0, 0);
if ((A & B)) (CI +=> S)=(0, 0);
if ((~(A) & ~(CI))) (B +=> S)=(0, 0);
if ((~(A) & CI)) (B -=> S)=(0, 0);
if ((A & ~(CI))) (B -=> S)=(0, 0);
if ((A & CI)) (B +=> S)=(0, 0);
if ((~(B) & ~(CI))) (A +=> S)=(0, 0);
if ((~(B) & CI)) (A -=> S)=(0, 0);
if ((B & ~(CI))) (A -=> S)=(0, 0);
if ((B & CI)) (A +=> S)=(0, 0);
endspecify
   `endif

endmodule
`endcelldefine

//%END SVN_ADDF_4

//%BEGIN SVN_ADDF_P1_1

`celldefine
module SVN_ADDF_P1_1 (S, CO, A, B, CI);
   output S, CO;
   input A, B, CI;

   wire int_res_0, int_res_1, int_res_2;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////

   and (int_res_0, A, B);
   and (int_res_1, A, CI);
   and (int_res_2, B, CI);
   `ifdef VIRL_functiononly
      xor #`SNPS_COMBO_DELAY (S, A, B, CI);
      or #`SNPS_COMBO_DELAY (CO, int_res_0, int_res_1, int_res_2);
   `else
      xor (S, A, B, CI);
      or (CO, int_res_0, int_res_1, int_res_2);
   `endif

   `ifdef VIRL_functiononly

   `else

   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////


specify
if ((~(A) & B)) (CI +=> CO)=(0, 0);
if ((A & ~(B))) (CI +=> CO)=(0, 0);
if ((~(A) & CI)) (B +=> CO)=(0, 0);
if ((A & ~(CI))) (B +=> CO)=(0, 0);
if ((~(B) & CI)) (A +=> CO)=(0, 0);
if ((B & ~(CI))) (A +=> CO)=(0, 0);
if ((~(A) & ~(B))) (CI +=> S)=(0, 0);
if ((~(A) & B)) (CI -=> S)=(0, 0);
if ((A & ~(B))) (CI -=> S)=(0, 0);
if ((A & B)) (CI +=> S)=(0, 0);
if ((~(A) & ~(CI))) (B +=> S)=(0, 0);
if ((~(A) & CI)) (B -=> S)=(0, 0);
if ((A & ~(CI))) (B -=> S)=(0, 0);
if ((A & CI)) (B +=> S)=(0, 0);
if ((~(B) & ~(CI))) (A +=> S)=(0, 0);
if ((~(B) & CI)) (A -=> S)=(0, 0);
if ((B & ~(CI))) (A -=> S)=(0, 0);
if ((B & CI)) (A +=> S)=(0, 0);
endspecify
   `endif

endmodule
`endcelldefine

//%END SVN_ADDF_P1_1

//%BEGIN SVN_ADDF_P1_2

`celldefine
module SVN_ADDF_P1_2 (S, CO, A, B, CI);
   output S, CO;
   input A, B, CI;

   wire int_res_0, int_res_1, int_res_2;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////

   and (int_res_0, A, B);
   and (int_res_1, A, CI);
   and (int_res_2, B, CI);
   `ifdef VIRL_functiononly
      xor #`SNPS_COMBO_DELAY (S, A, B, CI);
      or #`SNPS_COMBO_DELAY (CO, int_res_0, int_res_1, int_res_2);
   `else
      xor (S, A, B, CI);
      or (CO, int_res_0, int_res_1, int_res_2);
   `endif

   `ifdef VIRL_functiononly

   `else

   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////


specify
if ((~(A) & B)) (CI +=> CO)=(0, 0);
if ((A & ~(B))) (CI +=> CO)=(0, 0);
if ((~(A) & CI)) (B +=> CO)=(0, 0);
if ((A & ~(CI))) (B +=> CO)=(0, 0);
if ((~(B) & CI)) (A +=> CO)=(0, 0);
if ((B & ~(CI))) (A +=> CO)=(0, 0);
if ((~(A) & ~(B))) (CI +=> S)=(0, 0);
if ((~(A) & B)) (CI -=> S)=(0, 0);
if ((A & ~(B))) (CI -=> S)=(0, 0);
if ((A & B)) (CI +=> S)=(0, 0);
if ((~(A) & ~(CI))) (B +=> S)=(0, 0);
if ((~(A) & CI)) (B -=> S)=(0, 0);
if ((A & ~(CI))) (B -=> S)=(0, 0);
if ((A & CI)) (B +=> S)=(0, 0);
if ((~(B) & ~(CI))) (A +=> S)=(0, 0);
if ((~(B) & CI)) (A -=> S)=(0, 0);
if ((B & ~(CI))) (A -=> S)=(0, 0);
if ((B & CI)) (A +=> S)=(0, 0);
endspecify
   `endif

endmodule
`endcelldefine

//%END SVN_ADDF_P1_2

//%BEGIN SVN_ADDF_P1_4

`celldefine
module SVN_ADDF_P1_4 (S, CO, A, B, CI);
   output S, CO;
   input A, B, CI;

   wire int_res_0, int_res_1, int_res_2;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////

   and (int_res_0, A, B);
   and (int_res_1, A, CI);
   and (int_res_2, B, CI);
   `ifdef VIRL_functiononly
      xor #`SNPS_COMBO_DELAY (S, A, B, CI);
      or #`SNPS_COMBO_DELAY (CO, int_res_0, int_res_1, int_res_2);
   `else
      xor (S, A, B, CI);
      or (CO, int_res_0, int_res_1, int_res_2);
   `endif

   `ifdef VIRL_functiononly

   `else

   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////


specify
if ((~(A) & B)) (CI +=> CO)=(0, 0);
if ((A & ~(B))) (CI +=> CO)=(0, 0);
if ((~(A) & CI)) (B +=> CO)=(0, 0);
if ((A & ~(CI))) (B +=> CO)=(0, 0);
if ((~(B) & CI)) (A +=> CO)=(0, 0);
if ((B & ~(CI))) (A +=> CO)=(0, 0);
if ((~(A) & ~(B))) (CI +=> S)=(0, 0);
if ((~(A) & B)) (CI -=> S)=(0, 0);
if ((A & ~(B))) (CI -=> S)=(0, 0);
if ((A & B)) (CI +=> S)=(0, 0);
if ((~(A) & ~(CI))) (B +=> S)=(0, 0);
if ((~(A) & CI)) (B -=> S)=(0, 0);
if ((A & ~(CI))) (B -=> S)=(0, 0);
if ((A & CI)) (B +=> S)=(0, 0);
if ((~(B) & ~(CI))) (A +=> S)=(0, 0);
if ((~(B) & CI)) (A -=> S)=(0, 0);
if ((B & ~(CI))) (A -=> S)=(0, 0);
if ((B & CI)) (A +=> S)=(0, 0);
endspecify
   `endif

endmodule
`endcelldefine

//%END SVN_ADDF_P1_4

//%BEGIN SVN_ADDFCIB_1

`celldefine
module SVN_ADDFCIB_1 (S, CO, A, B, CI);
   output S, CO;
   input A, B, CI;

   wire int_res_0, int_res_1, int_res_2, 
      int_res_3, int_res_4, int_res_5;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////

   not (int_res_0, CI);
   and (int_res_1, A, B);
   not (int_res_2, CI);
   and (int_res_3, A, int_res_2);
   not (int_res_4, CI);
   and (int_res_5, B, int_res_4);


   `ifdef VIRL_functiononly
       xor #`SNPS_COMBO_DELAY (S, A, B, int_res_0);
       or  #`SNPS_COMBO_DELAY (CO, int_res_1, int_res_3, int_res_5);
   `else
       xor (S, A, B, int_res_0);
       or (CO, int_res_1, int_res_3, int_res_5);
   `endif

   `ifdef VIRL_functiononly

   `else

   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////


specify
if ((~(A) & ~(CI))) (B +=> CO)=(0, 0);
if ((A & CI)) (B +=> CO)=(0, 0);
if ((~(A) & B)) (CI -=> CO)=(0, 0);
if ((A & ~(B))) (CI -=> CO)=(0, 0);
if ((~(B) & ~(CI))) (A +=> CO)=(0, 0);
if ((B & CI)) (A +=> CO)=(0, 0);
if ((~(A) & ~(CI))) (B -=> S)=(0, 0);
if ((~(A) & CI)) (B +=> S)=(0, 0);
if ((A & ~(CI))) (B +=> S)=(0, 0);
if ((A & CI)) (B -=> S)=(0, 0);
if ((~(A) & ~(B))) (CI -=> S)=(0, 0);
if ((~(A) & B)) (CI +=> S)=(0, 0);
if ((A & ~(B))) (CI +=> S)=(0, 0);
if ((A & B)) (CI -=> S)=(0, 0);
if ((~(B) & ~(CI))) (A -=> S)=(0, 0);
if ((~(B) & CI)) (A +=> S)=(0, 0);
if ((B & ~(CI))) (A +=> S)=(0, 0);
if ((B & CI)) (A -=> S)=(0, 0);
endspecify
   `endif
endmodule
`endcelldefine

//%END SVN_ADDFCIB_1

//%BEGIN SVN_ADDFCOB_1

`celldefine
module SVN_ADDFCOB_1 (S, CO, A, B, CI);
   output S, CO;
   input A, B, CI;

   wire int_res_0, int_res_1, int_res_2;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////


   and (int_res_0, A, B);
   and (int_res_1, A, CI);
   and (int_res_2, B, CI);

   `ifdef VIRL_functiononly
       xor #`SNPS_COMBO_DELAY (S, A, B, CI);
       nor #`SNPS_COMBO_DELAY (CO, int_res_0, int_res_1, int_res_2);
   `else
       xor (S, A, B, CI);
       nor (CO, int_res_0, int_res_1, int_res_2);
   `endif

   `ifdef VIRL_functiononly

   `else

   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////


specify
(CI -=> CO)=(0, 0);
if ((~(A) & CI)) (B -=> CO)=(0, 0);
if ((A & ~(CI))) (B -=> CO)=(0, 0);
if ((~(B) & CI)) (A -=> CO)=(0, 0);
if ((B & ~(CI))) (A -=> CO)=(0, 0);
if ((~(A) & ~(B))) (CI +=> S)=(0, 0);
if ((A & ~(B)) | (~(A) & B)) (CI -=> S)=(0, 0);
if ((A & B)) (CI +=> S)=(0, 0);
if ((~(A) & ~(CI))) (B +=> S)=(0, 0);
if ((~(A) & CI)) (B -=> S)=(0, 0);
if ((A & ~(CI))) (B -=> S)=(0, 0);
if ((A & CI)) (B +=> S)=(0, 0);
if ((~(B) & ~(CI))) (A +=> S)=(0, 0);
if ((~(B) & CI)) (A -=> S)=(0, 0);
if ((B & ~(CI))) (A -=> S)=(0, 0);
if ((B & CI)) (A +=> S)=(0, 0);
endspecify
   `endif
endmodule
`endcelldefine

//%END SVN_ADDFCOB_1

//%BEGIN SVN_ADDFCSCIB_1

`celldefine
module SVN_ADDFCSCIB_1 (S, CO0, CO1, A, B, CI0, CI1, CS);
   output S, CO0, CO1;
   input A, B, CI0, CI1, CS;

   wire int_res_0, int_res_1, int_res_2, 
      int_res_3, int_res_4, int_res_5, int_res_6, 
      int_res_7, int_res_8, int_res_9, int_res_10, 
      int_res_11, int_res_12, int_res_13, int_res_14, 
      int_res_15, int_res_16;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////

   not (int_res_0, CI0);
   xor (int_res_1, A, B, int_res_0);
   not (int_res_2, CS);
   and (int_res_3, int_res_1, int_res_2);
   not (int_res_4, CI1);
   xor (int_res_5, A, B, int_res_4);
   and (int_res_6, int_res_5, CS);
   and (int_res_7, A, B);
   not (int_res_8, CI0);
   and (int_res_9, A, int_res_8);
   not (int_res_10, CI0);
   and (int_res_11, B, int_res_10);
   and (int_res_12, A, B);
   not (int_res_13, CI1);
   and (int_res_14, A, int_res_13);
   not (int_res_15, CI1);
   and (int_res_16, B, int_res_15);

   `ifdef VIRL_functiononly
       or #`SNPS_COMBO_DELAY (S, int_res_3, int_res_6);
       or #`SNPS_COMBO_DELAY (CO0, int_res_7, int_res_9, int_res_11);
       or #`SNPS_COMBO_DELAY (CO1, int_res_12, int_res_14, int_res_16);
   `else
       or (S, int_res_3, int_res_6);
       or (CO0, int_res_7, int_res_9, int_res_11);
       or (CO1, int_res_12, int_res_14, int_res_16);
   `endif

   `ifdef VIRL_functiononly

   `else
   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////


specify
if ((~(A) & ~(CI0) & ~(CI1))) (B +=> CO0)=(0, 0);
if ((~(A) & ~(CI0) & CI1 & ~(CS))) (B +=> CO0)=(0, 0);
if ((~(A) & ~(CI0) & CI1 & CS)) (B +=> CO0)=(0, 0);
if ((A & CI0 & ~(CI1) & ~(CS))) (B +=> CO0)=(0, 0);
if ((A & CI0 & ~(CI1) & CS)) (B +=> CO0)=(0, 0);
if ((A & CI0 & CI1)) (B +=> CO0)=(0, 0);
if ((~(A) & B & ~(CI1) & ~(CS))) (CI0 -=> CO0)=(0, 0);
if ((~(A) & B & ~(CI1) & CS)) (CI0 -=> CO0)=(0, 0);
if ((~(A) & B & CI1 & ~(CS))) (CI0 -=> CO0)=(0, 0);
if ((~(A) & B & CI1 & CS)) (CI0 -=> CO0)=(0, 0);
if ((A & ~(B) & ~(CI1) & ~(CS))) (CI0 -=> CO0)=(0, 0);
if ((A & ~(B) & ~(CI1) & CS)) (CI0 -=> CO0)=(0, 0);
if ((A & ~(B) & CI1 & ~(CS))) (CI0 -=> CO0)=(0, 0);
if ((A & ~(B) & CI1 & CS)) (CI0 -=> CO0)=(0, 0);
if ((~(B) & ~(CI0) & ~(CI1))) (A +=> CO0)=(0, 0);
if ((~(B) & ~(CI0) & CI1 & ~(CS))) (A +=> CO0)=(0, 0);
if ((~(B) & ~(CI0) & CI1 & CS)) (A +=> CO0)=(0, 0);
if ((B & CI0 & ~(CI1) & ~(CS))) (A +=> CO0)=(0, 0);
if ((B & CI0 & ~(CI1) & CS)) (A +=> CO0)=(0, 0);
if ((B & CI0 & CI1)) (A +=> CO0)=(0, 0);
if ((~(A) & ~(CI0) & ~(CI1))) (B +=> CO1)=(0, 0);
if ((~(A) & CI0 & ~(CI1) & ~(CS))) (B +=> CO1)=(0, 0);
if ((~(A) & CI0 & ~(CI1) & CS)) (B +=> CO1)=(0, 0);
if ((A & ~(CI0) & CI1 & ~(CS))) (B +=> CO1)=(0, 0);
if ((A & ~(CI0) & CI1 & CS)) (B +=> CO1)=(0, 0);
if ((A & CI0 & CI1)) (B +=> CO1)=(0, 0);
if ((~(B) & ~(CI0) & ~(CI1))) (A +=> CO1)=(0, 0);
if ((~(B) & CI0 & ~(CI1) & ~(CS))) (A +=> CO1)=(0, 0);
if ((~(B) & CI0 & ~(CI1) & CS)) (A +=> CO1)=(0, 0);
if ((B & ~(CI0) & CI1 & ~(CS))) (A +=> CO1)=(0, 0);
if ((B & ~(CI0) & CI1 & CS)) (A +=> CO1)=(0, 0);
if ((B & CI0 & CI1)) (A +=> CO1)=(0, 0);
if ((~(A) & B & ~(CI0) & ~(CS))) (CI1 -=> CO1)=(0, 0);
if ((~(A) & B & ~(CI0) & CS)) (CI1 -=> CO1)=(0, 0);
if ((~(A) & B & CI0 & ~(CS))) (CI1 -=> CO1)=(0, 0);
if ((~(A) & B & CI0 & CS)) (CI1 -=> CO1)=(0, 0);
if ((A & ~(B) & ~(CI0) & ~(CS))) (CI1 -=> CO1)=(0, 0);
if ((A & ~(B) & ~(CI0) & CS)) (CI1 -=> CO1)=(0, 0);
if ((A & ~(B) & CI0 & ~(CS))) (CI1 -=> CO1)=(0, 0);
if ((A & ~(B) & CI0 & CS)) (CI1 -=> CO1)=(0, 0);
if ((~(A) & ~(CI0) & ~(CI1))) (B -=> S)=(0, 0);
if ((~(A) & ~(CI0) & CI1 & ~(CS))) (B -=> S)=(0, 0);
if ((~(A) & ~(CI0) & CI1 & CS)) (B +=> S)=(0, 0);
if ((~(A) & CI0 & ~(CI1) & ~(CS))) (B +=> S)=(0, 0);
if ((~(A) & CI0 & ~(CI1) & CS)) (B -=> S)=(0, 0);
if ((~(A) & CI0 & CI1)) (B +=> S)=(0, 0);
if ((A & ~(CI0) & ~(CI1))) (B +=> S)=(0, 0);
if ((A & ~(CI0) & CI1 & ~(CS))) (B +=> S)=(0, 0);
if ((A & ~(CI0) & CI1 & CS)) (B -=> S)=(0, 0);
if ((A & CI0 & ~(CI1) & ~(CS))) (B -=> S)=(0, 0);
if ((A & CI0 & ~(CI1) & CS)) (B +=> S)=(0, 0);
if ((A & CI0 & CI1)) (B -=> S)=(0, 0);
if ((~(A) & ~(B) & ~(CI1) & ~(CS))) (CI0 -=> S)=(0, 0);
if ((~(A) & ~(B) & CI1 & ~(CS))) (CI0 -=> S)=(0, 0);
if ((~(A) & B & ~(CI1) & ~(CS))) (CI0 +=> S)=(0, 0);
if ((~(A) & B & CI1 & ~(CS))) (CI0 +=> S)=(0, 0);
if ((A & ~(B) & ~(CI1) & ~(CS))) (CI0 +=> S)=(0, 0);
if ((A & ~(B) & CI1 & ~(CS))) (CI0 +=> S)=(0, 0);
if ((A & B & ~(CI1) & ~(CS))) (CI0 -=> S)=(0, 0);
if ((A & B & CI1 & ~(CS))) (CI0 -=> S)=(0, 0);
if ((~(B) & ~(CI0) & ~(CI1))) (A -=> S)=(0, 0);
if ((~(B) & ~(CI0) & CI1 & ~(CS))) (A -=> S)=(0, 0);
if ((~(B) & ~(CI0) & CI1 & CS)) (A +=> S)=(0, 0);
if ((~(B) & CI0 & ~(CI1) & ~(CS))) (A +=> S)=(0, 0);
if ((~(B) & CI0 & ~(CI1) & CS)) (A -=> S)=(0, 0);
if ((~(B) & CI0 & CI1)) (A +=> S)=(0, 0);
if ((B & ~(CI0) & ~(CI1))) (A +=> S)=(0, 0);
if ((B & ~(CI0) & CI1 & ~(CS))) (A +=> S)=(0, 0);
if ((B & ~(CI0) & CI1 & CS)) (A -=> S)=(0, 0);
if ((B & CI0 & ~(CI1) & ~(CS))) (A -=> S)=(0, 0);
if ((B & CI0 & ~(CI1) & CS)) (A +=> S)=(0, 0);
if ((B & CI0 & CI1)) (A -=> S)=(0, 0);
if ((~(A) & ~(B) & ~(CI0) & CS)) (CI1 -=> S)=(0, 0);
if ((~(A) & ~(B) & CI0 & CS)) (CI1 -=> S)=(0, 0);
if ((~(A) & B & ~(CI0) & CS)) (CI1 +=> S)=(0, 0);
if ((~(A) & B & CI0 & CS)) (CI1 +=> S)=(0, 0);
if ((A & ~(B) & ~(CI0) & CS)) (CI1 +=> S)=(0, 0);
if ((A & ~(B) & CI0 & CS)) (CI1 +=> S)=(0, 0);
if ((A & B & ~(CI0) & CS)) (CI1 -=> S)=(0, 0);
if ((A & B & CI0 & CS)) (CI1 -=> S)=(0, 0);
if ((A & ~(B) & ~(CI0) & CI1) | (~(A) & B & ~(CI0) & CI1)) (CS +=> S)=(0, 0);
if ((A & ~(B) & CI0 & ~(CI1)) | (~(A) & B & CI0 & ~(CI1))) (CS -=> S)=(0, 0);
if ((A & B & ~(CI0) & CI1) | (~(A) & ~(B) & ~(CI0) & CI1)) (CS -=> S)=(0, 0);
if ((A & B & CI0 & ~(CI1)) | (~(A) & ~(B) & CI0 & ~(CI1))) (CS +=> S)=(0, 0);
endspecify
   `endif

endmodule
`endcelldefine

//%END SVN_ADDFCSCIB_1

//%BEGIN SVN_ADDFCSCOB_1

`celldefine
module SVN_ADDFCSCOB_1 (S, CO0, CO1, A, B, CI0, CI1, CS);
   output S, CO0, CO1;
   input A, B, CI0, CI1, CS;

   wire int_res_0, int_res_1, int_res_2, 
      int_res_3, int_res_4, int_res_5, int_res_6, 
      int_res_7, int_res_8, int_res_9, int_res_10;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////

   xor (int_res_0, A, B, CI0);
   not (int_res_1, CS);
   and (int_res_2, int_res_0, int_res_1);
   xor (int_res_3, A, B, CI1);
   and (int_res_4, int_res_3, CS);
   and (int_res_5, A, B);
   and (int_res_6, A, CI0);
   and (int_res_7, B, CI0);
   and (int_res_8, A, B);
   and (int_res_9, A, CI1);
   and (int_res_10, B, CI1);

   `ifdef VIRL_functiononly
       or  #`SNPS_COMBO_DELAY (S, int_res_2, int_res_4);
       nor #`SNPS_COMBO_DELAY (CO0, int_res_5, int_res_6, int_res_7);
       nor #`SNPS_COMBO_DELAY (CO1, int_res_8, int_res_9, int_res_10);
   `else
       or (S, int_res_2, int_res_4);
       nor (CO0, int_res_5, int_res_6, int_res_7);
       nor (CO1, int_res_8, int_res_9, int_res_10);
   `endif

   `ifdef VIRL_functiononly

   `else

   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////


specify
if ((~(A) & CI0 & ~(CI1) & ~(CS))) (B -=> CO0)=(0, 0);
if ((~(A) & CI0 & ~(CI1) & CS)) (B -=> CO0)=(0, 0);
if ((~(A) & CI0 & CI1)) (B -=> CO0)=(0, 0);
if ((A & ~(CI0) & ~(CI1))) (B -=> CO0)=(0, 0);
if ((A & ~(CI0) & CI1 & ~(CS))) (B -=> CO0)=(0, 0);
if ((A & ~(CI0) & CI1 & CS)) (B -=> CO0)=(0, 0);
if ((~(B) & CI0 & ~(CI1) & ~(CS))) (A -=> CO0)=(0, 0);
if ((~(B) & CI0 & ~(CI1) & CS)) (A -=> CO0)=(0, 0);
if ((~(B) & CI0 & CI1)) (A -=> CO0)=(0, 0);
if ((B & ~(CI0) & ~(CI1))) (A -=> CO0)=(0, 0);
if ((B & ~(CI0) & CI1 & ~(CS))) (A -=> CO0)=(0, 0);
if ((B & ~(CI0) & CI1 & CS)) (A -=> CO0)=(0, 0);
if ((A & ~(B) & ~(CI1) & ~(CS)) | (~(A) & B & ~(CI1) & ~(CS))) (CI0 -=> CO0)=(0, 0);
if ((A & ~(B) & ~(CI1) & CS) | (~(A) & B & ~(CI1) & CS)) (CI0 -=> CO0)=(0, 0);
if ((A & ~(B) & CI1 & ~(CS)) | (~(A) & B & CI1 & ~(CS))) (CI0 -=> CO0)=(0, 0);
if ((A & ~(B) & CI1 & CS) | (~(A) & B & CI1 & CS)) (CI0 -=> CO0)=(0, 0);
if ((~(A) & ~(CI0) & CI1 & ~(CS))) (B -=> CO1)=(0, 0);
if ((~(A) & ~(CI0) & CI1 & CS)) (B -=> CO1)=(0, 0);
if ((~(A) & CI0 & CI1)) (B -=> CO1)=(0, 0);
if ((A & ~(CI0) & ~(CI1))) (B -=> CO1)=(0, 0);
if ((A & CI0 & ~(CI1) & ~(CS))) (B -=> CO1)=(0, 0);
if ((A & CI0 & ~(CI1) & CS)) (B -=> CO1)=(0, 0);
if ((~(B) & ~(CI0) & CI1 & ~(CS))) (A -=> CO1)=(0, 0);
if ((~(B) & ~(CI0) & CI1 & CS)) (A -=> CO1)=(0, 0);
if ((~(B) & CI0 & CI1)) (A -=> CO1)=(0, 0);
if ((B & ~(CI0) & ~(CI1))) (A -=> CO1)=(0, 0);
if ((B & CI0 & ~(CI1) & ~(CS))) (A -=> CO1)=(0, 0);
if ((B & CI0 & ~(CI1) & CS)) (A -=> CO1)=(0, 0);
if ((A & ~(B) & ~(CI0) & ~(CS)) | (~(A) & B & ~(CI0) & ~(CS))) (CI1 -=> CO1)=(0, 0);
if ((A & ~(B) & ~(CI0) & CS) | (~(A) & B & ~(CI0) & CS)) (CI1 -=> CO1)=(0, 0);
if ((A & ~(B) & CI0 & ~(CS)) | (~(A) & B & CI0 & ~(CS))) (CI1 -=> CO1)=(0, 0);
if ((A & ~(B) & CI0 & CS) | (~(A) & B & CI0 & CS)) (CI1 -=> CO1)=(0, 0);
if ((~(A) & ~(CI0) & ~(CI1))) (B +=> S)=(0, 0);
if ((~(A) & ~(CI0) & CI1 & ~(CS))) (B +=> S)=(0, 0);
if ((~(A) & ~(CI0) & CI1 & CS)) (B -=> S)=(0, 0);
if ((~(A) & CI0 & ~(CI1) & ~(CS))) (B -=> S)=(0, 0);
if ((~(A) & CI0 & ~(CI1) & CS)) (B +=> S)=(0, 0);
if ((~(A) & CI0 & CI1)) (B -=> S)=(0, 0);
if ((A & ~(CI0) & ~(CI1))) (B -=> S)=(0, 0);
if ((A & ~(CI0) & CI1 & ~(CS))) (B -=> S)=(0, 0);
if ((A & ~(CI0) & CI1 & CS)) (B +=> S)=(0, 0);
if ((A & CI0 & ~(CI1) & ~(CS))) (B +=> S)=(0, 0);
if ((A & CI0 & ~(CI1) & CS)) (B -=> S)=(0, 0);
if ((A & CI0 & CI1)) (B +=> S)=(0, 0);
if ((~(B) & ~(CI0) & ~(CI1))) (A +=> S)=(0, 0);
if ((~(B) & ~(CI0) & CI1 & ~(CS))) (A +=> S)=(0, 0);
if ((~(B) & ~(CI0) & CI1 & CS)) (A -=> S)=(0, 0);
if ((~(B) & CI0 & ~(CI1) & ~(CS))) (A -=> S)=(0, 0);
if ((~(B) & CI0 & ~(CI1) & CS)) (A +=> S)=(0, 0);
if ((~(B) & CI0 & CI1)) (A -=> S)=(0, 0);
if ((B & ~(CI0) & ~(CI1))) (A -=> S)=(0, 0);
if ((B & ~(CI0) & CI1 & ~(CS))) (A -=> S)=(0, 0);
if ((B & ~(CI0) & CI1 & CS)) (A +=> S)=(0, 0);
if ((B & CI0 & ~(CI1) & ~(CS))) (A +=> S)=(0, 0);
if ((B & CI0 & ~(CI1) & CS)) (A -=> S)=(0, 0);
if ((B & CI0 & CI1)) (A +=> S)=(0, 0);
if ((~(A) & ~(B) & ~(CI1) & ~(CS))) (CI0 +=> S)=(0, 0);
if ((~(A) & ~(B) & CI1 & ~(CS))) (CI0 +=> S)=(0, 0);
if ((A & ~(B) & ~(CI1) & ~(CS)) | (~(A) & B & ~(CI1) & ~(CS))) (CI0 -=> S)=(0, 0);
if ((A & ~(B) & CI1 & ~(CS)) | (~(A) & B & CI1 & ~(CS))) (CI0 -=> S)=(0, 0);
if ((A & B & ~(CI1) & ~(CS))) (CI0 +=> S)=(0, 0);
if ((A & B & CI1 & ~(CS))) (CI0 +=> S)=(0, 0);
if ((~(A) & ~(B) & ~(CI0) & CS)) (CI1 +=> S)=(0, 0);
if ((~(A) & ~(B) & CI0 & CS)) (CI1 +=> S)=(0, 0);
if ((A & ~(B) & ~(CI0) & CS) | (~(A) & B & ~(CI0) & CS)) (CI1 -=> S)=(0, 0);
if ((A & ~(B) & CI0 & CS) | (~(A) & B & CI0 & CS)) (CI1 -=> S)=(0, 0);
if ((A & B & ~(CI0) & CS)) (CI1 +=> S)=(0, 0);
if ((A & B & CI0 & CS)) (CI1 +=> S)=(0, 0);
if ((A & ~(B) & ~(CI0) & CI1) | (~(A) & B & ~(CI0) & CI1)) (CS -=> S)=(0, 0);
if ((A & ~(B) & CI0 & ~(CI1)) | (~(A) & B & CI0 & ~(CI1))) (CS +=> S)=(0, 0);
if ((A & B & ~(CI0) & CI1) | (~(A) & ~(B) & ~(CI0) & CI1)) (CS +=> S)=(0, 0);
if ((A & B & CI0 & ~(CI1)) | (~(A) & ~(B) & CI0 & ~(CI1))) (CS -=> S)=(0, 0);
endspecify
   `endif

endmodule
`endcelldefine

//%END SVN_ADDFCSCOB_1

//%BEGIN SVN_ADDH_1

`celldefine
module SVN_ADDH_1 (S, CO, A, B);
   output S, CO;
   input A, B;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////


   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////

   `ifdef VIRL_functiononly
     xor #`SNPS_COMBO_DELAY (S, A, B);
     and #`SNPS_COMBO_DELAY (CO, A, B);

   `else
     xor (S, A, B);
     and (CO, A, B);

   `endif

   `ifdef VIRL_functiononly

   `else

specify
(A +=> CO)=(0, 0);
(B +=> CO)=(0, 0);
if (~(B)) (A +=> S)=(0, 0);
if (B) (A -=> S)=(0, 0);
if (~(A)) (B +=> S)=(0, 0);
if (A) (B -=> S)=(0, 0);
endspecify
    `endif

endmodule
`endcelldefine

//%END SVN_ADDH_1

//%BEGIN SVN_ADDH_2

`celldefine
module SVN_ADDH_2 (S, CO, A, B);
   output S, CO;
   input A, B;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////


   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////

   `ifdef VIRL_functiononly
     xor #`SNPS_COMBO_DELAY (S, A, B);
     and #`SNPS_COMBO_DELAY (CO, A, B);

   `else
     xor (S, A, B);
     and (CO, A, B);

   `endif

   `ifdef VIRL_functiononly

   `else

specify
(A +=> CO)=(0, 0);
(B +=> CO)=(0, 0);
if (~(B)) (A +=> S)=(0, 0);
if (B) (A -=> S)=(0, 0);
if (~(A)) (B +=> S)=(0, 0);
if (A) (B -=> S)=(0, 0);
endspecify
    `endif

endmodule
`endcelldefine

//%END SVN_ADDH_2

//%BEGIN SVN_ADDH_4

`celldefine
module SVN_ADDH_4 (S, CO, A, B);
   output S, CO;
   input A, B;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////


   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////

   `ifdef VIRL_functiononly
     xor #`SNPS_COMBO_DELAY (S, A, B);
     and #`SNPS_COMBO_DELAY (CO, A, B);

   `else
     xor (S, A, B);
     and (CO, A, B);

   `endif

   `ifdef VIRL_functiononly

   `else

specify
(A +=> CO)=(0, 0);
(B +=> CO)=(0, 0);
if (~(B)) (A +=> S)=(0, 0);
if (B) (A -=> S)=(0, 0);
if (~(A)) (B +=> S)=(0, 0);
if (A) (B -=> S)=(0, 0);
endspecify
    `endif

endmodule
`endcelldefine

//%END SVN_ADDH_4

//%BEGIN SVN_ADDHBB_1

`celldefine
module SVN_ADDHBB_1 (S, CO, A, B);
   output S, CO;
   input A, B;

   wire int_res_0, int_res_1;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////

   not (int_res_0, B);
   not (int_res_1, B);

   `ifdef VIRL_functiononly
       xor #`SNPS_COMBO_DELAY (S, A, int_res_0); 
       and #`SNPS_COMBO_DELAY (CO, A, int_res_1);      
   `else
       xor (S, A, int_res_0); 
       and (CO, A, int_res_1);       
   `endif

   `ifdef VIRL_functiononly

   `else

   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////


specify
(A +=> CO)=(0, 0);
(B -=> CO)=(0, 0);
if (~(B)) (A -=> S)=(0, 0);
if (B) (A +=> S)=(0, 0);
if (~(A)) (B -=> S)=(0, 0);
if (A) (B +=> S)=(0, 0);
endspecify
   `endif
endmodule
`endcelldefine

//%END SVN_ADDHBB_1

//%BEGIN SVN_ADDHCOB_1

`celldefine
module SVN_ADDHCOB_1 (S, CO, A, B);
   output S, CO;
   input A, B;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////

   `ifdef VIRL_functiononly
       xor #`SNPS_COMBO_DELAY (S, A, B);
       nand #`SNPS_COMBO_DELAY (CO, A, B);
   `else
       xor (S, A, B);
       nand (CO, A, B);
   `endif

   `ifdef VIRL_functiononly

   `else

   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////


specify
(A -=> CO)=(0, 0);
(B -=> CO)=(0, 0);
if (~(B)) (A +=> S)=(0, 0);
if (B) (A -=> S)=(0, 0);
if (~(A)) (B +=> S)=(0, 0);
if (A) (B -=> S)=(0, 0);
endspecify
   `endif

endmodule
`endcelldefine

//%END SVN_ADDHCOB_1

//%BEGIN SVN_ADDHCSCOB_1

`celldefine
module SVN_ADDHCSCOB_1 (S, CO0, CO1, A, B, CI);
   output S, CO0, CO1;
   input A, B, CI;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////



   `ifdef VIRL_functiononly
       xor #`SNPS_COMBO_DELAY (S, A, B, CI);
       nand #`SNPS_COMBO_DELAY (CO0, A, B);
       nor #`SNPS_COMBO_DELAY (CO1, A, B);
   `else
       xor (S, A, B, CI);
       nand (CO0, A, B);
       nor (CO1, A, B);
   `endif

   `ifdef VIRL_functiononly

   `else
   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////


specify
if ((A & ~(CI))) (B -=> CO0)=(0, 0);
if ((A & CI)) (B -=> CO0)=(0, 0);
if ((B & ~(CI))) (A -=> CO0)=(0, 0);
if ((B & CI)) (A -=> CO0)=(0, 0);
if ((~(A) & ~(CI))) (B -=> CO1)=(0, 0);
if ((~(A) & CI)) (B -=> CO1)=(0, 0);
if ((~(B) & ~(CI))) (A -=> CO1)=(0, 0);
if ((~(B) & CI)) (A -=> CO1)=(0, 0);
if ((~(A) & ~(CI))) (B +=> S)=(0, 0);
if ((~(A) & CI)) (B -=> S)=(0, 0);
if ((A & ~(CI))) (B -=> S)=(0, 0);
if ((A & CI)) (B +=> S)=(0, 0);
if ((~(B) & ~(CI))) (A +=> S)=(0, 0);
if ((~(B) & CI)) (A -=> S)=(0, 0);
if ((B & ~(CI))) (A -=> S)=(0, 0);
if ((B & CI)) (A +=> S)=(0, 0);
if ((~(A) & ~(B))) (CI +=> S)=(0, 0);
if ((~(A) & B)) (CI -=> S)=(0, 0);
if ((A & ~(B))) (CI -=> S)=(0, 0);
if ((A & B)) (CI +=> S)=(0, 0);
endspecify
   `endif 
endmodule
`endcelldefine

//%END SVN_ADDHCSCOB_1

//%BEGIN SVN_AN2_0P5

`celldefine
module SVN_AN2_0P5 (X, A1, A2);
   output X;
   input A1, A2;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////


   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////

   `ifdef VIRL_functiononly
     and #`SNPS_COMBO_DELAY (X, A1, A2);
   `else
     and  (X, A1, A2);
   `endif

   `ifdef VIRL_functiononly

   `else

specify
(A1 +=> X)=(0, 0);
(A2 +=> X)=(0, 0);
endspecify
   `endif

endmodule
`endcelldefine

//%END SVN_AN2_0P5

//%BEGIN SVN_AN2_1

`celldefine
module SVN_AN2_1 (X, A1, A2);
   output X;
   input A1, A2;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////


   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////

   `ifdef VIRL_functiononly
     and #`SNPS_COMBO_DELAY (X, A1, A2);
   `else
     and  (X, A1, A2);
   `endif

   `ifdef VIRL_functiononly

   `else

specify
(A1 +=> X)=(0, 0);
(A2 +=> X)=(0, 0);
endspecify
   `endif

endmodule
`endcelldefine

//%END SVN_AN2_1

//%BEGIN SVN_AN2_12

`celldefine
module SVN_AN2_12 (X, A1, A2);
   output X;
   input A1, A2;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////


   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////

   `ifdef VIRL_functiononly
     and #`SNPS_COMBO_DELAY (X, A1, A2);
   `else
     and  (X, A1, A2);
   `endif

   `ifdef VIRL_functiononly

   `else

specify
(A1 +=> X)=(0, 0);
(A2 +=> X)=(0, 0);
endspecify
   `endif

endmodule
`endcelldefine

//%END SVN_AN2_12

//%BEGIN SVN_AN2_2

`celldefine
module SVN_AN2_2 (X, A1, A2);
   output X;
   input A1, A2;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////


   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////

   `ifdef VIRL_functiononly
     and #`SNPS_COMBO_DELAY (X, A1, A2);
   `else
     and  (X, A1, A2);
   `endif

   `ifdef VIRL_functiononly

   `else

specify
(A1 +=> X)=(0, 0);
(A2 +=> X)=(0, 0);
endspecify
   `endif

endmodule
`endcelldefine

//%END SVN_AN2_2

//%BEGIN SVN_AN2_3

`celldefine
module SVN_AN2_3 (X, A1, A2);
   output X;
   input A1, A2;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////


   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////

   `ifdef VIRL_functiononly
     and #`SNPS_COMBO_DELAY (X, A1, A2);
   `else
     and  (X, A1, A2);
   `endif

   `ifdef VIRL_functiononly

   `else

specify
(A1 +=> X)=(0, 0);
(A2 +=> X)=(0, 0);
endspecify
   `endif

endmodule
`endcelldefine

//%END SVN_AN2_3

//%BEGIN SVN_AN2_4

`celldefine
module SVN_AN2_4 (X, A1, A2);
   output X;
   input A1, A2;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////


   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////

   `ifdef VIRL_functiononly
     and #`SNPS_COMBO_DELAY (X, A1, A2);
   `else
     and  (X, A1, A2);
   `endif

   `ifdef VIRL_functiononly

   `else

specify
(A1 +=> X)=(0, 0);
(A2 +=> X)=(0, 0);
endspecify
   `endif

endmodule
`endcelldefine

//%END SVN_AN2_4

//%BEGIN SVN_AN2_6

`celldefine
module SVN_AN2_6 (X, A1, A2);
   output X;
   input A1, A2;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////


   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////

   `ifdef VIRL_functiononly
     and #`SNPS_COMBO_DELAY (X, A1, A2);
   `else
     and  (X, A1, A2);
   `endif

   `ifdef VIRL_functiononly

   `else

specify
(A1 +=> X)=(0, 0);
(A2 +=> X)=(0, 0);
endspecify
   `endif

endmodule
`endcelldefine

//%END SVN_AN2_6

//%BEGIN SVN_AN2_8

`celldefine
module SVN_AN2_8 (X, A1, A2);
   output X;
   input A1, A2;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////


   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////

   `ifdef VIRL_functiononly
     and #`SNPS_COMBO_DELAY (X, A1, A2);
   `else
     and  (X, A1, A2);
   `endif

   `ifdef VIRL_functiononly

   `else

specify
(A1 +=> X)=(0, 0);
(A2 +=> X)=(0, 0);
endspecify
   `endif

endmodule
`endcelldefine

//%END SVN_AN2_8

//%BEGIN SVN_AN2_S_12

`celldefine
module SVN_AN2_S_12 (X, A1, A2);
   output X;
   input A1, A2;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////


   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////

   `ifdef VIRL_functiononly
     and #`SNPS_COMBO_DELAY (X, A1, A2);
   `else
     and  (X, A1, A2);
   `endif

   `ifdef VIRL_functiononly

   `else

specify
(A1 +=> X)=(0, 0);
(A2 +=> X)=(0, 0);
endspecify
   `endif

endmodule
`endcelldefine

//%END SVN_AN2_S_12

//%BEGIN SVN_AN2_S_2

`celldefine
module SVN_AN2_S_2 (X, A1, A2);
   output X;
   input A1, A2;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////


   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////

   `ifdef VIRL_functiononly
     and #`SNPS_COMBO_DELAY (X, A1, A2);
   `else
     and  (X, A1, A2);
   `endif

   `ifdef VIRL_functiononly

   `else

specify
(A1 +=> X)=(0, 0);
(A2 +=> X)=(0, 0);
endspecify
   `endif

endmodule
`endcelldefine

//%END SVN_AN2_S_2

//%BEGIN SVN_AN2_S_4

`celldefine
module SVN_AN2_S_4 (X, A1, A2);
   output X;
   input A1, A2;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////


   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////

   `ifdef VIRL_functiononly
     and #`SNPS_COMBO_DELAY (X, A1, A2);
   `else
     and  (X, A1, A2);
   `endif

   `ifdef VIRL_functiononly

   `else

specify
(A1 +=> X)=(0, 0);
(A2 +=> X)=(0, 0);
endspecify
   `endif

endmodule
`endcelldefine

//%END SVN_AN2_S_4

//%BEGIN SVN_AN2_S_8

`celldefine
module SVN_AN2_S_8 (X, A1, A2);
   output X;
   input A1, A2;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////


   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////

   `ifdef VIRL_functiononly
     and #`SNPS_COMBO_DELAY (X, A1, A2);
   `else
     and  (X, A1, A2);
   `endif

   `ifdef VIRL_functiononly

   `else

specify
(A1 +=> X)=(0, 0);
(A2 +=> X)=(0, 0);
endspecify
   `endif

endmodule
`endcelldefine

//%END SVN_AN2_S_8

//%BEGIN SVN_AN3_1

`celldefine
module SVN_AN3_1 (X, A1, A2, A3);
   output X;
   input A1, A2, A3;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////


   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////

   `ifdef VIRL_functiononly
      and #`SNPS_COMBO_DELAY (X, A1, A2, A3);
   `else
      and (X, A1, A2, A3);
   `endif

   `ifdef VIRL_functiononly

   `else


specify
(A1 +=> X)=(0, 0);
(A2 +=> X)=(0, 0);
(A3 +=> X)=(0, 0);
endspecify
   `endif

endmodule
`endcelldefine

//%END SVN_AN3_1

//%BEGIN SVN_AN3_2

`celldefine
module SVN_AN3_2 (X, A1, A2, A3);
   output X;
   input A1, A2, A3;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////


   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////

   `ifdef VIRL_functiononly
      and #`SNPS_COMBO_DELAY (X, A1, A2, A3);
   `else
      and (X, A1, A2, A3);
   `endif

   `ifdef VIRL_functiononly

   `else


specify
(A1 +=> X)=(0, 0);
(A2 +=> X)=(0, 0);
(A3 +=> X)=(0, 0);
endspecify
   `endif

endmodule
`endcelldefine

//%END SVN_AN3_2

//%BEGIN SVN_AN3_4

`celldefine
module SVN_AN3_4 (X, A1, A2, A3);
   output X;
   input A1, A2, A3;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////


   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////

   `ifdef VIRL_functiononly
      and #`SNPS_COMBO_DELAY (X, A1, A2, A3);
   `else
      and (X, A1, A2, A3);
   `endif

   `ifdef VIRL_functiononly

   `else


specify
(A1 +=> X)=(0, 0);
(A2 +=> X)=(0, 0);
(A3 +=> X)=(0, 0);
endspecify
   `endif

endmodule
`endcelldefine

//%END SVN_AN3_4

//%BEGIN SVN_AN3_6

`celldefine
module SVN_AN3_6 (X, A1, A2, A3);
   output X;
   input A1, A2, A3;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////


   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////

   `ifdef VIRL_functiononly
      and #`SNPS_COMBO_DELAY (X, A1, A2, A3);
   `else
      and (X, A1, A2, A3);
   `endif

   `ifdef VIRL_functiononly

   `else


specify
(A1 +=> X)=(0, 0);
(A2 +=> X)=(0, 0);
(A3 +=> X)=(0, 0);
endspecify
   `endif

endmodule
`endcelldefine

//%END SVN_AN3_6

//%BEGIN SVN_AN3B_1

`celldefine
module SVN_AN3B_1 (X, A, B1, B2);
   output X;
   input A, B1, B2;

   wire int_res_0;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////

   not (int_res_0, A);

   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////

   `ifdef VIRL_functiononly
      and #`SNPS_COMBO_DELAY (X, int_res_0, B1, B2);
   `else
      and (X, int_res_0, B1, B2);
   `endif

  `ifdef VIRL_functiononly

  `else


specify
(A -=> X)=(0, 0);
(B1 +=> X)=(0, 0);
(B2 +=> X)=(0, 0);
endspecify
  `endif

endmodule
`endcelldefine

//%END SVN_AN3B_1

//%BEGIN SVN_AN3B_2

`celldefine
module SVN_AN3B_2 (X, A, B1, B2);
   output X;
   input A, B1, B2;

   wire int_res_0;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////

   not (int_res_0, A);

   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////

   `ifdef VIRL_functiononly
      and #`SNPS_COMBO_DELAY (X, int_res_0, B1, B2);
   `else
      and (X, int_res_0, B1, B2);
   `endif

  `ifdef VIRL_functiononly

  `else


specify
(A -=> X)=(0, 0);
(B1 +=> X)=(0, 0);
(B2 +=> X)=(0, 0);
endspecify
  `endif

endmodule
`endcelldefine

//%END SVN_AN3B_2

//%BEGIN SVN_AN3B_3

`celldefine
module SVN_AN3B_3 (X, A, B1, B2);
   output X;
   input A, B1, B2;

   wire int_res_0;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////

   not (int_res_0, A);

   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////

   `ifdef VIRL_functiononly
      and #`SNPS_COMBO_DELAY (X, int_res_0, B1, B2);
   `else
      and (X, int_res_0, B1, B2);
   `endif

  `ifdef VIRL_functiononly

  `else


specify
(A -=> X)=(0, 0);
(B1 +=> X)=(0, 0);
(B2 +=> X)=(0, 0);
endspecify
  `endif

endmodule
`endcelldefine

//%END SVN_AN3B_3

//%BEGIN SVN_AN3B_4

`celldefine
module SVN_AN3B_4 (X, A, B1, B2);
   output X;
   input A, B1, B2;

   wire int_res_0;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////

   not (int_res_0, A);

   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////

   `ifdef VIRL_functiononly
      and #`SNPS_COMBO_DELAY (X, int_res_0, B1, B2);
   `else
      and (X, int_res_0, B1, B2);
   `endif

  `ifdef VIRL_functiononly

  `else


specify
(A -=> X)=(0, 0);
(B1 +=> X)=(0, 0);
(B2 +=> X)=(0, 0);
endspecify
  `endif

endmodule
`endcelldefine

//%END SVN_AN3B_4

//%BEGIN SVN_AN4_1

`celldefine
module SVN_AN4_1 (X, A1, A2, A3, A4);
   output X;
   input A1, A2, A3, A4;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////


   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////

   `ifdef VIRL_functiononly
      and #`SNPS_COMBO_DELAY (X, A1, A2, A3, A4);
   `else
      and (X, A1, A2, A3, A4);
   `endif

   `ifdef VIRL_functiononly

   `else


specify
(A1 +=> X)=(0, 0);
(A2 +=> X)=(0, 0);
(A3 +=> X)=(0, 0);
(A4 +=> X)=(0, 0);
endspecify
   `endif

endmodule
`endcelldefine

//%END SVN_AN4_1

//%BEGIN SVN_AN4_2

`celldefine
module SVN_AN4_2 (X, A1, A2, A3, A4);
   output X;
   input A1, A2, A3, A4;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////


   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////

   `ifdef VIRL_functiononly
      and #`SNPS_COMBO_DELAY (X, A1, A2, A3, A4);
   `else
      and (X, A1, A2, A3, A4);
   `endif

   `ifdef VIRL_functiononly

   `else


specify
(A1 +=> X)=(0, 0);
(A2 +=> X)=(0, 0);
(A3 +=> X)=(0, 0);
(A4 +=> X)=(0, 0);
endspecify
   `endif

endmodule
`endcelldefine

//%END SVN_AN4_2

//%BEGIN SVN_AN4_4

`celldefine
module SVN_AN4_4 (X, A1, A2, A3, A4);
   output X;
   input A1, A2, A3, A4;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////


   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////

   `ifdef VIRL_functiononly
      and #`SNPS_COMBO_DELAY (X, A1, A2, A3, A4);
   `else
      and (X, A1, A2, A3, A4);
   `endif

   `ifdef VIRL_functiononly

   `else


specify
(A1 +=> X)=(0, 0);
(A2 +=> X)=(0, 0);
(A3 +=> X)=(0, 0);
(A4 +=> X)=(0, 0);
endspecify
   `endif

endmodule
`endcelldefine

//%END SVN_AN4_4

//%BEGIN SVN_AN4B_1

`celldefine
module SVN_AN4B_1 (X, A, B1, B2, B3);
   output X;
   input A, B1, B2, B3;

   wire int_res_0;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////

   not (int_res_0, A);

   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////

   `ifdef VIRL_functiononly
      and #`SNPS_COMBO_DELAY (X, int_res_0, B1, B2, B3);
   `else
      and (X, int_res_0, B1, B2, B3);
   `endif

   `ifdef VIRL_functiononly

   `else


specify
(A -=> X)=(0, 0);
(B1 +=> X)=(0, 0);
(B2 +=> X)=(0, 0);
(B3 +=> X)=(0, 0);
endspecify
   `endif

endmodule
`endcelldefine

//%END SVN_AN4B_1

//%BEGIN SVN_AN4B_2

`celldefine
module SVN_AN4B_2 (X, A, B1, B2, B3);
   output X;
   input A, B1, B2, B3;

   wire int_res_0;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////

   not (int_res_0, A);

   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////

   `ifdef VIRL_functiononly
      and #`SNPS_COMBO_DELAY (X, int_res_0, B1, B2, B3);
   `else
      and (X, int_res_0, B1, B2, B3);
   `endif

   `ifdef VIRL_functiononly

   `else


specify
(A -=> X)=(0, 0);
(B1 +=> X)=(0, 0);
(B2 +=> X)=(0, 0);
(B3 +=> X)=(0, 0);
endspecify
   `endif

endmodule
`endcelldefine

//%END SVN_AN4B_2

//%BEGIN SVN_AN4B_3

`celldefine
module SVN_AN4B_3 (X, A, B1, B2, B3);
   output X;
   input A, B1, B2, B3;

   wire int_res_0;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////

   not (int_res_0, A);

   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////

   `ifdef VIRL_functiononly
      and #`SNPS_COMBO_DELAY (X, int_res_0, B1, B2, B3);
   `else
      and (X, int_res_0, B1, B2, B3);
   `endif

   `ifdef VIRL_functiononly

   `else


specify
(A -=> X)=(0, 0);
(B1 +=> X)=(0, 0);
(B2 +=> X)=(0, 0);
(B3 +=> X)=(0, 0);
endspecify
   `endif

endmodule
`endcelldefine

//%END SVN_AN4B_3

//%BEGIN SVN_AN4B_4

`celldefine
module SVN_AN4B_4 (X, A, B1, B2, B3);
   output X;
   input A, B1, B2, B3;

   wire int_res_0;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////

   not (int_res_0, A);

   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////

   `ifdef VIRL_functiononly
      and #`SNPS_COMBO_DELAY (X, int_res_0, B1, B2, B3);
   `else
      and (X, int_res_0, B1, B2, B3);
   `endif

   `ifdef VIRL_functiononly

   `else


specify
(A -=> X)=(0, 0);
(B1 +=> X)=(0, 0);
(B2 +=> X)=(0, 0);
(B3 +=> X)=(0, 0);
endspecify
   `endif

endmodule
`endcelldefine

//%END SVN_AN4B_4

//%BEGIN SVN_AO2111_1

`celldefine
module SVN_AO2111_1 (X, A1, A2, B1, B2, B3);
   output X;
   input A1, A2, B1, B2, B3;

   wire int_res_0;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////

   and (int_res_0, A1, A2);


   `ifdef VIRL_functiononly
       or #`SNPS_COMBO_DELAY (X, int_res_0, B1, B2, B3);
   `else
       or (X, int_res_0, B1, B2, B3);
   `endif

   `ifdef VIRL_functiononly

   `else
   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////


specify
if (A1==1'b0&&A2==1'b0&&B1==1'b0&&B2==1'b0) (B3 +=> X)=(0, 0);
if (A1==1'b0&&A2==1'b1&&B1==1'b0&&B2==1'b0) (B3 +=> X)=(0, 0);
if (A1==1'b1&&A2==1'b0&&B1==1'b0&&B2==1'b0) (B3 +=> X)=(0, 0);
if (A1==1'b0&&A2==1'b0&&B1==1'b0&&B3==1'b0) (B2 +=> X)=(0, 0);
if (A1==1'b0&&A2==1'b1&&B1==1'b0&&B3==1'b0) (B2 +=> X)=(0, 0);
if (A1==1'b1&&A2==1'b0&&B1==1'b0&&B3==1'b0) (B2 +=> X)=(0, 0);
if (A1==1'b0&&A2==1'b0&&B2==1'b0&&B3==1'b0) (B1 +=> X)=(0, 0);
if (A1==1'b0&&A2==1'b1&&B2==1'b0&&B3==1'b0) (B1 +=> X)=(0, 0);
if (A1==1'b1&&A2==1'b0&&B2==1'b0&&B3==1'b0) (B1 +=> X)=(0, 0);
if (A1==1'b1&&B1==1'b0&&B2==1'b0&&B3==1'b0) (A2 +=> X)=(0, 0);
if (A2==1'b1&&B1==1'b0&&B2==1'b0&&B3==1'b0) (A1 +=> X)=(0, 0);
endspecify
   `endif
endmodule
`endcelldefine

//%END SVN_AO2111_1

//%BEGIN SVN_AO2111_2

`celldefine
module SVN_AO2111_2 (X, A1, A2, B1, B2, B3);
   output X;
   input A1, A2, B1, B2, B3;

   wire int_res_0;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////

   and (int_res_0, A1, A2);


   `ifdef VIRL_functiononly
       or #`SNPS_COMBO_DELAY (X, int_res_0, B1, B2, B3);
   `else
       or (X, int_res_0, B1, B2, B3);
   `endif

   `ifdef VIRL_functiononly

   `else
   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////


specify
if (A1==1'b0&&A2==1'b0&&B1==1'b0&&B2==1'b0) (B3 +=> X)=(0, 0);
if (A1==1'b0&&A2==1'b1&&B1==1'b0&&B2==1'b0) (B3 +=> X)=(0, 0);
if (A1==1'b1&&A2==1'b0&&B1==1'b0&&B2==1'b0) (B3 +=> X)=(0, 0);
if (A1==1'b0&&A2==1'b0&&B1==1'b0&&B3==1'b0) (B2 +=> X)=(0, 0);
if (A1==1'b0&&A2==1'b1&&B1==1'b0&&B3==1'b0) (B2 +=> X)=(0, 0);
if (A1==1'b1&&A2==1'b0&&B1==1'b0&&B3==1'b0) (B2 +=> X)=(0, 0);
if (A1==1'b0&&A2==1'b0&&B2==1'b0&&B3==1'b0) (B1 +=> X)=(0, 0);
if (A1==1'b0&&A2==1'b1&&B2==1'b0&&B3==1'b0) (B1 +=> X)=(0, 0);
if (A1==1'b1&&A2==1'b0&&B2==1'b0&&B3==1'b0) (B1 +=> X)=(0, 0);
if (A1==1'b1&&B1==1'b0&&B2==1'b0&&B3==1'b0) (A2 +=> X)=(0, 0);
if (A2==1'b1&&B1==1'b0&&B2==1'b0&&B3==1'b0) (A1 +=> X)=(0, 0);
endspecify
   `endif
endmodule
`endcelldefine

//%END SVN_AO2111_2

//%BEGIN SVN_AO2111_4

`celldefine
module SVN_AO2111_4 (X, A1, A2, B1, B2, B3);
   output X;
   input A1, A2, B1, B2, B3;

   wire int_res_0;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////

   and (int_res_0, A1, A2);


   `ifdef VIRL_functiononly
       or #`SNPS_COMBO_DELAY (X, int_res_0, B1, B2, B3);
   `else
       or (X, int_res_0, B1, B2, B3);
   `endif

   `ifdef VIRL_functiononly

   `else
   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////


specify
if (A1==1'b0&&A2==1'b0&&B1==1'b0&&B2==1'b0) (B3 +=> X)=(0, 0);
if (A1==1'b0&&A2==1'b1&&B1==1'b0&&B2==1'b0) (B3 +=> X)=(0, 0);
if (A1==1'b1&&A2==1'b0&&B1==1'b0&&B2==1'b0) (B3 +=> X)=(0, 0);
if (A1==1'b0&&A2==1'b0&&B1==1'b0&&B3==1'b0) (B2 +=> X)=(0, 0);
if (A1==1'b0&&A2==1'b1&&B1==1'b0&&B3==1'b0) (B2 +=> X)=(0, 0);
if (A1==1'b1&&A2==1'b0&&B1==1'b0&&B3==1'b0) (B2 +=> X)=(0, 0);
if (A1==1'b0&&A2==1'b0&&B2==1'b0&&B3==1'b0) (B1 +=> X)=(0, 0);
if (A1==1'b0&&A2==1'b1&&B2==1'b0&&B3==1'b0) (B1 +=> X)=(0, 0);
if (A1==1'b1&&A2==1'b0&&B2==1'b0&&B3==1'b0) (B1 +=> X)=(0, 0);
if (A1==1'b1&&B1==1'b0&&B2==1'b0&&B3==1'b0) (A2 +=> X)=(0, 0);
if (A2==1'b1&&B1==1'b0&&B2==1'b0&&B3==1'b0) (A1 +=> X)=(0, 0);
endspecify
   `endif
endmodule
`endcelldefine

//%END SVN_AO2111_4

//%BEGIN SVN_AO211_1

`celldefine
module SVN_AO211_1 (X, A1, A2, B1, B2);
   output X;
   input A1, A2, B1, B2;

   wire int_res_0;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////

   and (int_res_0, A1, A2);

   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////

   `ifdef VIRL_functiononly
      or #`SNPS_COMBO_DELAY (X, int_res_0, B1, B2);
   `else
      or (X, int_res_0, B1, B2);
   `endif

   `ifdef VIRL_functiononly

   `else

specify
(A1 +=> X)=(0, 0);
(A2 +=> X)=(0, 0);
if ((~(A1) & ~(A2) & ~(B1))) (B2 +=> X)=(0, 0);
if ((~(A1) & A2 & ~(B1))) (B2 +=> X)=(0, 0);
if ((A1 & ~(A2) & ~(B1))) (B2 +=> X)=(0, 0);
if ((~(A1) & ~(A2) & ~(B2))) (B1 +=> X)=(0, 0);
if ((~(A1) & A2 & ~(B2))) (B1 +=> X)=(0, 0);
if ((A1 & ~(A2) & ~(B2))) (B1 +=> X)=(0, 0);
endspecify
   `endif

endmodule
`endcelldefine

//%END SVN_AO211_1

//%BEGIN SVN_AO211_2

`celldefine
module SVN_AO211_2 (X, A1, A2, B1, B2);
   output X;
   input A1, A2, B1, B2;

   wire int_res_0;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////

   and (int_res_0, A1, A2);

   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////

   `ifdef VIRL_functiononly
      or #`SNPS_COMBO_DELAY (X, int_res_0, B1, B2);
   `else
      or (X, int_res_0, B1, B2);
   `endif

   `ifdef VIRL_functiononly

   `else

specify
(A1 +=> X)=(0, 0);
(A2 +=> X)=(0, 0);
if ((~(A1) & ~(A2) & ~(B1))) (B2 +=> X)=(0, 0);
if ((~(A1) & A2 & ~(B1))) (B2 +=> X)=(0, 0);
if ((A1 & ~(A2) & ~(B1))) (B2 +=> X)=(0, 0);
if ((~(A1) & ~(A2) & ~(B2))) (B1 +=> X)=(0, 0);
if ((~(A1) & A2 & ~(B2))) (B1 +=> X)=(0, 0);
if ((A1 & ~(A2) & ~(B2))) (B1 +=> X)=(0, 0);
endspecify
   `endif

endmodule
`endcelldefine

//%END SVN_AO211_2

//%BEGIN SVN_AO211_4

`celldefine
module SVN_AO211_4 (X, A1, A2, B1, B2);
   output X;
   input A1, A2, B1, B2;

   wire int_res_0;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////

   and (int_res_0, A1, A2);

   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////

   `ifdef VIRL_functiononly
      or #`SNPS_COMBO_DELAY (X, int_res_0, B1, B2);
   `else
      or (X, int_res_0, B1, B2);
   `endif

   `ifdef VIRL_functiononly

   `else

specify
(A1 +=> X)=(0, 0);
(A2 +=> X)=(0, 0);
if ((~(A1) & ~(A2) & ~(B1))) (B2 +=> X)=(0, 0);
if ((~(A1) & A2 & ~(B1))) (B2 +=> X)=(0, 0);
if ((A1 & ~(A2) & ~(B1))) (B2 +=> X)=(0, 0);
if ((~(A1) & ~(A2) & ~(B2))) (B1 +=> X)=(0, 0);
if ((~(A1) & A2 & ~(B2))) (B1 +=> X)=(0, 0);
if ((A1 & ~(A2) & ~(B2))) (B1 +=> X)=(0, 0);
endspecify
   `endif

endmodule
`endcelldefine

//%END SVN_AO211_4

//%BEGIN SVN_AO21_1

`celldefine
module SVN_AO21_1 (X, A1, A2, B);
   output X;
   input A1, A2, B;

   wire int_res_0;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////

   and (int_res_0, A1, A2);

   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////
   `ifdef VIRL_functiononly
      or #`SNPS_COMBO_DELAY (X, int_res_0, B);
   `else
      or (X, int_res_0, B);
   `endif

   `ifdef VIRL_functiononly

   `else

specify
(A1 +=> X)=(0, 0);
(A2 +=> X)=(0, 0);
if ((~(A1) & ~(A2))) (B +=> X)=(0, 0);
if ((~(A1) & A2)) (B +=> X)=(0, 0);
if ((A1 & ~(A2))) (B +=> X)=(0, 0);
endspecify
   `endif

endmodule
`endcelldefine

//%END SVN_AO21_1

//%BEGIN SVN_AO21_2

`celldefine
module SVN_AO21_2 (X, A1, A2, B);
   output X;
   input A1, A2, B;

   wire int_res_0;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////

   and (int_res_0, A1, A2);

   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////
   `ifdef VIRL_functiononly
      or #`SNPS_COMBO_DELAY (X, int_res_0, B);
   `else
      or (X, int_res_0, B);
   `endif

   `ifdef VIRL_functiononly

   `else

specify
(A1 +=> X)=(0, 0);
(A2 +=> X)=(0, 0);
if ((~(A1) & ~(A2))) (B +=> X)=(0, 0);
if ((~(A1) & A2)) (B +=> X)=(0, 0);
if ((A1 & ~(A2))) (B +=> X)=(0, 0);
endspecify
   `endif

endmodule
`endcelldefine

//%END SVN_AO21_2

//%BEGIN SVN_AO21_3

`celldefine
module SVN_AO21_3 (X, A1, A2, B);
   output X;
   input A1, A2, B;

   wire int_res_0;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////

   and (int_res_0, A1, A2);

   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////
   `ifdef VIRL_functiononly
      or #`SNPS_COMBO_DELAY (X, int_res_0, B);
   `else
      or (X, int_res_0, B);
   `endif

   `ifdef VIRL_functiononly

   `else

specify
(A1 +=> X)=(0, 0);
(A2 +=> X)=(0, 0);
if ((~(A1) & ~(A2))) (B +=> X)=(0, 0);
if ((~(A1) & A2)) (B +=> X)=(0, 0);
if ((A1 & ~(A2))) (B +=> X)=(0, 0);
endspecify
   `endif

endmodule
`endcelldefine

//%END SVN_AO21_3

//%BEGIN SVN_AO21_4

`celldefine
module SVN_AO21_4 (X, A1, A2, B);
   output X;
   input A1, A2, B;

   wire int_res_0;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////

   and (int_res_0, A1, A2);

   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////
   `ifdef VIRL_functiononly
      or #`SNPS_COMBO_DELAY (X, int_res_0, B);
   `else
      or (X, int_res_0, B);
   `endif

   `ifdef VIRL_functiononly

   `else

specify
(A1 +=> X)=(0, 0);
(A2 +=> X)=(0, 0);
if ((~(A1) & ~(A2))) (B +=> X)=(0, 0);
if ((~(A1) & A2)) (B +=> X)=(0, 0);
if ((A1 & ~(A2))) (B +=> X)=(0, 0);
endspecify
   `endif

endmodule
`endcelldefine

//%END SVN_AO21_4

//%BEGIN SVN_AO21_6

`celldefine
module SVN_AO21_6 (X, A1, A2, B);
   output X;
   input A1, A2, B;

   wire int_res_0;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////

   and (int_res_0, A1, A2);

   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////
   `ifdef VIRL_functiononly
      or #`SNPS_COMBO_DELAY (X, int_res_0, B);
   `else
      or (X, int_res_0, B);
   `endif

   `ifdef VIRL_functiononly

   `else

specify
(A1 +=> X)=(0, 0);
(A2 +=> X)=(0, 0);
if ((~(A1) & ~(A2))) (B +=> X)=(0, 0);
if ((~(A1) & A2)) (B +=> X)=(0, 0);
if ((A1 & ~(A2))) (B +=> X)=(0, 0);
endspecify
   `endif

endmodule
`endcelldefine

//%END SVN_AO21_6

//%BEGIN SVN_AO21B_1

`celldefine
module SVN_AO21B_1 (X, A1, A2, B);
   output X;
   input A1, A2, B;

   wire int_res_0, int_res_1;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////

   and (int_res_0, A1, A2);
   not (int_res_1, B);

   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////

   `ifdef VIRL_functiononly
     or #`SNPS_COMBO_DELAY (X, int_res_0, int_res_1);
   `else
     or (X, int_res_0, int_res_1);
   `endif

   `ifdef VIRL_functiononly

   `else

specify
(A1 +=> X)=(0, 0);
(A2 +=> X)=(0, 0);
(B -=> X)=(0, 0);
endspecify
   `endif

endmodule
`endcelldefine

//%END SVN_AO21B_1

//%BEGIN SVN_AO21B_2

`celldefine
module SVN_AO21B_2 (X, A1, A2, B);
   output X;
   input A1, A2, B;

   wire int_res_0, int_res_1;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////

   and (int_res_0, A1, A2);
   not (int_res_1, B);

   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////

   `ifdef VIRL_functiononly
     or #`SNPS_COMBO_DELAY (X, int_res_0, int_res_1);
   `else
     or (X, int_res_0, int_res_1);
   `endif

   `ifdef VIRL_functiononly

   `else

specify
(A1 +=> X)=(0, 0);
(A2 +=> X)=(0, 0);
(B -=> X)=(0, 0);
endspecify
   `endif

endmodule
`endcelldefine

//%END SVN_AO21B_2

//%BEGIN SVN_AO21B_3

`celldefine
module SVN_AO21B_3 (X, A1, A2, B);
   output X;
   input A1, A2, B;

   wire int_res_0, int_res_1;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////

   and (int_res_0, A1, A2);
   not (int_res_1, B);

   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////

   `ifdef VIRL_functiononly
     or #`SNPS_COMBO_DELAY (X, int_res_0, int_res_1);
   `else
     or (X, int_res_0, int_res_1);
   `endif

   `ifdef VIRL_functiononly

   `else

specify
(A1 +=> X)=(0, 0);
(A2 +=> X)=(0, 0);
(B -=> X)=(0, 0);
endspecify
   `endif

endmodule
`endcelldefine

//%END SVN_AO21B_3

//%BEGIN SVN_AO21B_4

`celldefine
module SVN_AO21B_4 (X, A1, A2, B);
   output X;
   input A1, A2, B;

   wire int_res_0, int_res_1;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////

   and (int_res_0, A1, A2);
   not (int_res_1, B);

   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////

   `ifdef VIRL_functiononly
     or #`SNPS_COMBO_DELAY (X, int_res_0, int_res_1);
   `else
     or (X, int_res_0, int_res_1);
   `endif

   `ifdef VIRL_functiononly

   `else

specify
(A1 +=> X)=(0, 0);
(A2 +=> X)=(0, 0);
(B -=> X)=(0, 0);
endspecify
   `endif

endmodule
`endcelldefine

//%END SVN_AO21B_4

//%BEGIN SVN_AO221_1

`celldefine
module SVN_AO221_1 (X, A1, A2, B1, B2, C);
   output X;
   input A1, A2, B1, B2, C;

   wire int_res_0, int_res_1;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////

   and (int_res_0, A1, A2);
   and (int_res_1, B1, B2);

   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////

   `ifdef VIRL_functiononly
      or #`SNPS_COMBO_DELAY (X, int_res_0, int_res_1, C);
   `else
      or (X, int_res_0, int_res_1, C);
   `endif

   `ifdef VIRL_functiononly

   `else

specify
if ((~(A1) & ~(A2) & ~(B1) & ~(B2))) (C +=> X)=(0, 0);
if ((~(A1) & ~(A2) & B1 & ~(B2))) (C +=> X)=(0, 0);
if ((~(A1) & A2 & ~(B1) & ~(B2)) | (~(A1) & ~(A2) & ~(B1) & B2)) (C +=> X)=(0, 0);
if ((~(A1) & A2 & ~(B1) & B2)) (C +=> X)=(0, 0);
if ((~(A1) & A2 & B1 & ~(B2))) (C +=> X)=(0, 0);
if ((A1 & ~(A2) & ~(B1) & ~(B2))) (C +=> X)=(0, 0);
if ((A1 & ~(A2) & ~(B1) & B2)) (C +=> X)=(0, 0);
if ((A1 & ~(A2) & B1 & ~(B2))) (C +=> X)=(0, 0);
if ((~(A1) & ~(A2) & B1 & ~(C))) (B2 +=> X)=(0, 0);
if ((~(A1) & A2 & B1 & ~(C))) (B2 +=> X)=(0, 0);
if ((A1 & ~(A2) & B1 & ~(C))) (B2 +=> X)=(0, 0);
if ((~(A1) & ~(A2) & B2 & ~(C))) (B1 +=> X)=(0, 0);
if ((~(A1) & A2 & B2 & ~(C))) (B1 +=> X)=(0, 0);
if ((A1 & ~(A2) & B2 & ~(C))) (B1 +=> X)=(0, 0);
if ((A1 & ~(B1) & ~(B2) & ~(C))) (A2 +=> X)=(0, 0);
if ((A1 & ~(B1) & B2 & ~(C))) (A2 +=> X)=(0, 0);
if ((A1 & B1 & ~(B2) & ~(C))) (A2 +=> X)=(0, 0);
if ((A2 & ~(B1) & ~(B2) & ~(C))) (A1 +=> X)=(0, 0);
if ((A2 & ~(B1) & B2 & ~(C))) (A1 +=> X)=(0, 0);
if ((A2 & B1 & ~(B2) & ~(C))) (A1 +=> X)=(0, 0);
endspecify
   `endif

endmodule
`endcelldefine

//%END SVN_AO221_1

//%BEGIN SVN_AO221_2

`celldefine
module SVN_AO221_2 (X, A1, A2, B1, B2, C);
   output X;
   input A1, A2, B1, B2, C;

   wire int_res_0, int_res_1;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////

   and (int_res_0, A1, A2);
   and (int_res_1, B1, B2);

   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////

   `ifdef VIRL_functiononly
      or #`SNPS_COMBO_DELAY (X, int_res_0, int_res_1, C);
   `else
      or (X, int_res_0, int_res_1, C);
   `endif

   `ifdef VIRL_functiononly

   `else

specify
if ((~(A1) & ~(A2) & ~(B1) & ~(B2))) (C +=> X)=(0, 0);
if ((~(A1) & ~(A2) & B1 & ~(B2))) (C +=> X)=(0, 0);
if ((~(A1) & A2 & ~(B1) & ~(B2)) | (~(A1) & ~(A2) & ~(B1) & B2)) (C +=> X)=(0, 0);
if ((~(A1) & A2 & ~(B1) & B2)) (C +=> X)=(0, 0);
if ((~(A1) & A2 & B1 & ~(B2))) (C +=> X)=(0, 0);
if ((A1 & ~(A2) & ~(B1) & ~(B2))) (C +=> X)=(0, 0);
if ((A1 & ~(A2) & ~(B1) & B2)) (C +=> X)=(0, 0);
if ((A1 & ~(A2) & B1 & ~(B2))) (C +=> X)=(0, 0);
if ((~(A1) & ~(A2) & B1 & ~(C))) (B2 +=> X)=(0, 0);
if ((~(A1) & A2 & B1 & ~(C))) (B2 +=> X)=(0, 0);
if ((A1 & ~(A2) & B1 & ~(C))) (B2 +=> X)=(0, 0);
if ((~(A1) & ~(A2) & B2 & ~(C))) (B1 +=> X)=(0, 0);
if ((~(A1) & A2 & B2 & ~(C))) (B1 +=> X)=(0, 0);
if ((A1 & ~(A2) & B2 & ~(C))) (B1 +=> X)=(0, 0);
if ((A1 & ~(B1) & ~(B2) & ~(C))) (A2 +=> X)=(0, 0);
if ((A1 & ~(B1) & B2 & ~(C))) (A2 +=> X)=(0, 0);
if ((A1 & B1 & ~(B2) & ~(C))) (A2 +=> X)=(0, 0);
if ((A2 & ~(B1) & ~(B2) & ~(C))) (A1 +=> X)=(0, 0);
if ((A2 & ~(B1) & B2 & ~(C))) (A1 +=> X)=(0, 0);
if ((A2 & B1 & ~(B2) & ~(C))) (A1 +=> X)=(0, 0);
endspecify
   `endif

endmodule
`endcelldefine

//%END SVN_AO221_2

//%BEGIN SVN_AO221_4

`celldefine
module SVN_AO221_4 (X, A1, A2, B1, B2, C);
   output X;
   input A1, A2, B1, B2, C;

   wire int_res_0, int_res_1;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////

   and (int_res_0, A1, A2);
   and (int_res_1, B1, B2);

   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////

   `ifdef VIRL_functiononly
      or #`SNPS_COMBO_DELAY (X, int_res_0, int_res_1, C);
   `else
      or (X, int_res_0, int_res_1, C);
   `endif

   `ifdef VIRL_functiononly

   `else

specify
if ((~(A1) & ~(A2) & ~(B1) & ~(B2))) (C +=> X)=(0, 0);
if ((~(A1) & ~(A2) & B1 & ~(B2))) (C +=> X)=(0, 0);
if ((~(A1) & A2 & ~(B1) & ~(B2)) | (~(A1) & ~(A2) & ~(B1) & B2)) (C +=> X)=(0, 0);
if ((~(A1) & A2 & ~(B1) & B2)) (C +=> X)=(0, 0);
if ((~(A1) & A2 & B1 & ~(B2))) (C +=> X)=(0, 0);
if ((A1 & ~(A2) & ~(B1) & ~(B2))) (C +=> X)=(0, 0);
if ((A1 & ~(A2) & ~(B1) & B2)) (C +=> X)=(0, 0);
if ((A1 & ~(A2) & B1 & ~(B2))) (C +=> X)=(0, 0);
if ((~(A1) & ~(A2) & B1 & ~(C))) (B2 +=> X)=(0, 0);
if ((~(A1) & A2 & B1 & ~(C))) (B2 +=> X)=(0, 0);
if ((A1 & ~(A2) & B1 & ~(C))) (B2 +=> X)=(0, 0);
if ((~(A1) & ~(A2) & B2 & ~(C))) (B1 +=> X)=(0, 0);
if ((~(A1) & A2 & B2 & ~(C))) (B1 +=> X)=(0, 0);
if ((A1 & ~(A2) & B2 & ~(C))) (B1 +=> X)=(0, 0);
if ((A1 & ~(B1) & ~(B2) & ~(C))) (A2 +=> X)=(0, 0);
if ((A1 & ~(B1) & B2 & ~(C))) (A2 +=> X)=(0, 0);
if ((A1 & B1 & ~(B2) & ~(C))) (A2 +=> X)=(0, 0);
if ((A2 & ~(B1) & ~(B2) & ~(C))) (A1 +=> X)=(0, 0);
if ((A2 & ~(B1) & B2 & ~(C))) (A1 +=> X)=(0, 0);
if ((A2 & B1 & ~(B2) & ~(C))) (A1 +=> X)=(0, 0);
endspecify
   `endif

endmodule
`endcelldefine

//%END SVN_AO221_4

//%BEGIN SVN_AO22_0P5

`celldefine
module SVN_AO22_0P5 (X, A1, A2, B1, B2);
   output X;
   input A1, A2, B1, B2;

   wire int_res_0, int_res_1;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////

   and (int_res_0, A1, A2);
   and (int_res_1, B1, B2);

   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////

   `ifdef VIRL_functiononly
      or #`SNPS_COMBO_DELAY (X, int_res_0, int_res_1);
   `else
      or  (X, int_res_0, int_res_1);
   `endif

   `ifdef VIRL_functiononly

   `else

specify
if ((~(A1) & ~(A2) & B1)) (B2 +=> X)=(0, 0);
if ((~(A1) & A2 & B1)) (B2 +=> X)=(0, 0);
if ((A1 & ~(A2) & B1)) (B2 +=> X)=(0, 0);
if ((~(A1) & ~(A2) & B2)) (B1 +=> X)=(0, 0);
if ((~(A1) & A2 & B2)) (B1 +=> X)=(0, 0);
if ((A1 & ~(A2) & B2)) (B1 +=> X)=(0, 0);
if ((A1 & ~(B1) & ~(B2))) (A2 +=> X)=(0, 0);
if ((A1 & ~(B1) & B2)) (A2 +=> X)=(0, 0);
if ((A1 & B1 & ~(B2))) (A2 +=> X)=(0, 0);
if ((A2 & ~(B1) & ~(B2))) (A1 +=> X)=(0, 0);
if ((A2 & ~(B1) & B2)) (A1 +=> X)=(0, 0);
if ((A2 & B1 & ~(B2))) (A1 +=> X)=(0, 0);
endspecify
   `endif

endmodule
`endcelldefine

//%END SVN_AO22_0P5

//%BEGIN SVN_AO22_1

`celldefine
module SVN_AO22_1 (X, A1, A2, B1, B2);
   output X;
   input A1, A2, B1, B2;

   wire int_res_0, int_res_1;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////

   and (int_res_0, A1, A2);
   and (int_res_1, B1, B2);

   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////

   `ifdef VIRL_functiononly
      or #`SNPS_COMBO_DELAY (X, int_res_0, int_res_1);
   `else
      or  (X, int_res_0, int_res_1);
   `endif

   `ifdef VIRL_functiononly

   `else

specify
if ((~(A1) & ~(A2) & B1)) (B2 +=> X)=(0, 0);
if ((~(A1) & A2 & B1)) (B2 +=> X)=(0, 0);
if ((A1 & ~(A2) & B1)) (B2 +=> X)=(0, 0);
if ((~(A1) & ~(A2) & B2)) (B1 +=> X)=(0, 0);
if ((~(A1) & A2 & B2)) (B1 +=> X)=(0, 0);
if ((A1 & ~(A2) & B2)) (B1 +=> X)=(0, 0);
if ((A1 & ~(B1) & ~(B2))) (A2 +=> X)=(0, 0);
if ((A1 & ~(B1) & B2)) (A2 +=> X)=(0, 0);
if ((A1 & B1 & ~(B2))) (A2 +=> X)=(0, 0);
if ((A2 & ~(B1) & ~(B2))) (A1 +=> X)=(0, 0);
if ((A2 & ~(B1) & B2)) (A1 +=> X)=(0, 0);
if ((A2 & B1 & ~(B2))) (A1 +=> X)=(0, 0);
endspecify
   `endif

endmodule
`endcelldefine

//%END SVN_AO22_1

//%BEGIN SVN_AO22_2

`celldefine
module SVN_AO22_2 (X, A1, A2, B1, B2);
   output X;
   input A1, A2, B1, B2;

   wire int_res_0, int_res_1;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////

   and (int_res_0, A1, A2);
   and (int_res_1, B1, B2);

   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////

   `ifdef VIRL_functiononly
      or #`SNPS_COMBO_DELAY (X, int_res_0, int_res_1);
   `else
      or  (X, int_res_0, int_res_1);
   `endif

   `ifdef VIRL_functiononly

   `else

specify
if ((~(A1) & ~(A2) & B1)) (B2 +=> X)=(0, 0);
if ((~(A1) & A2 & B1)) (B2 +=> X)=(0, 0);
if ((A1 & ~(A2) & B1)) (B2 +=> X)=(0, 0);
if ((~(A1) & ~(A2) & B2)) (B1 +=> X)=(0, 0);
if ((~(A1) & A2 & B2)) (B1 +=> X)=(0, 0);
if ((A1 & ~(A2) & B2)) (B1 +=> X)=(0, 0);
if ((A1 & ~(B1) & ~(B2))) (A2 +=> X)=(0, 0);
if ((A1 & ~(B1) & B2)) (A2 +=> X)=(0, 0);
if ((A1 & B1 & ~(B2))) (A2 +=> X)=(0, 0);
if ((A2 & ~(B1) & ~(B2))) (A1 +=> X)=(0, 0);
if ((A2 & ~(B1) & B2)) (A1 +=> X)=(0, 0);
if ((A2 & B1 & ~(B2))) (A1 +=> X)=(0, 0);
endspecify
   `endif

endmodule
`endcelldefine

//%END SVN_AO22_2

//%BEGIN SVN_AO22_3

`celldefine
module SVN_AO22_3 (X, A1, A2, B1, B2);
   output X;
   input A1, A2, B1, B2;

   wire int_res_0, int_res_1;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////

   and (int_res_0, A1, A2);
   and (int_res_1, B1, B2);

   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////

   `ifdef VIRL_functiononly
      or #`SNPS_COMBO_DELAY (X, int_res_0, int_res_1);
   `else
      or  (X, int_res_0, int_res_1);
   `endif

   `ifdef VIRL_functiononly

   `else

specify
if ((~(A1) & ~(A2) & B1)) (B2 +=> X)=(0, 0);
if ((~(A1) & A2 & B1)) (B2 +=> X)=(0, 0);
if ((A1 & ~(A2) & B1)) (B2 +=> X)=(0, 0);
if ((~(A1) & ~(A2) & B2)) (B1 +=> X)=(0, 0);
if ((~(A1) & A2 & B2)) (B1 +=> X)=(0, 0);
if ((A1 & ~(A2) & B2)) (B1 +=> X)=(0, 0);
if ((A1 & ~(B1) & ~(B2))) (A2 +=> X)=(0, 0);
if ((A1 & ~(B1) & B2)) (A2 +=> X)=(0, 0);
if ((A1 & B1 & ~(B2))) (A2 +=> X)=(0, 0);
if ((A2 & ~(B1) & ~(B2))) (A1 +=> X)=(0, 0);
if ((A2 & ~(B1) & B2)) (A1 +=> X)=(0, 0);
if ((A2 & B1 & ~(B2))) (A1 +=> X)=(0, 0);
endspecify
   `endif

endmodule
`endcelldefine

//%END SVN_AO22_3

//%BEGIN SVN_AO22_4

`celldefine
module SVN_AO22_4 (X, A1, A2, B1, B2);
   output X;
   input A1, A2, B1, B2;

   wire int_res_0, int_res_1;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////

   and (int_res_0, A1, A2);
   and (int_res_1, B1, B2);

   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////

   `ifdef VIRL_functiononly
      or #`SNPS_COMBO_DELAY (X, int_res_0, int_res_1);
   `else
      or  (X, int_res_0, int_res_1);
   `endif

   `ifdef VIRL_functiononly

   `else

specify
if ((~(A1) & ~(A2) & B1)) (B2 +=> X)=(0, 0);
if ((~(A1) & A2 & B1)) (B2 +=> X)=(0, 0);
if ((A1 & ~(A2) & B1)) (B2 +=> X)=(0, 0);
if ((~(A1) & ~(A2) & B2)) (B1 +=> X)=(0, 0);
if ((~(A1) & A2 & B2)) (B1 +=> X)=(0, 0);
if ((A1 & ~(A2) & B2)) (B1 +=> X)=(0, 0);
if ((A1 & ~(B1) & ~(B2))) (A2 +=> X)=(0, 0);
if ((A1 & ~(B1) & B2)) (A2 +=> X)=(0, 0);
if ((A1 & B1 & ~(B2))) (A2 +=> X)=(0, 0);
if ((A2 & ~(B1) & ~(B2))) (A1 +=> X)=(0, 0);
if ((A2 & ~(B1) & B2)) (A1 +=> X)=(0, 0);
if ((A2 & B1 & ~(B2))) (A1 +=> X)=(0, 0);
endspecify
   `endif

endmodule
`endcelldefine

//%END SVN_AO22_4

//%BEGIN SVN_AO22_6

`celldefine
module SVN_AO22_6 (X, A1, A2, B1, B2);
   output X;
   input A1, A2, B1, B2;

   wire int_res_0, int_res_1;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////

   and (int_res_0, A1, A2);
   and (int_res_1, B1, B2);

   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////

   `ifdef VIRL_functiononly
      or #`SNPS_COMBO_DELAY (X, int_res_0, int_res_1);
   `else
      or  (X, int_res_0, int_res_1);
   `endif

   `ifdef VIRL_functiononly

   `else

specify
if ((~(A1) & ~(A2) & B1)) (B2 +=> X)=(0, 0);
if ((~(A1) & A2 & B1)) (B2 +=> X)=(0, 0);
if ((A1 & ~(A2) & B1)) (B2 +=> X)=(0, 0);
if ((~(A1) & ~(A2) & B2)) (B1 +=> X)=(0, 0);
if ((~(A1) & A2 & B2)) (B1 +=> X)=(0, 0);
if ((A1 & ~(A2) & B2)) (B1 +=> X)=(0, 0);
if ((A1 & ~(B1) & ~(B2))) (A2 +=> X)=(0, 0);
if ((A1 & ~(B1) & B2)) (A2 +=> X)=(0, 0);
if ((A1 & B1 & ~(B2))) (A2 +=> X)=(0, 0);
if ((A2 & ~(B1) & ~(B2))) (A1 +=> X)=(0, 0);
if ((A2 & ~(B1) & B2)) (A1 +=> X)=(0, 0);
if ((A2 & B1 & ~(B2))) (A1 +=> X)=(0, 0);
endspecify
   `endif

endmodule
`endcelldefine

//%END SVN_AO22_6

//%BEGIN SVN_AO2BB2_1

`celldefine
module SVN_AO2BB2_1 (X, A1, A2, B1, B2);
   output X;
   input A1, A2, B1, B2;

   wire int_res_0, int_res_1, int_res_2, 
      int_res_3;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////

   not (int_res_0, A1);
   not (int_res_1, A2);
   and (int_res_2, int_res_0, int_res_1);
   and (int_res_3, B1, B2);

   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////

   `ifdef VIRL_functiononly
      or #`SNPS_COMBO_DELAY (X, int_res_2, int_res_3);
   `else
      or (X, int_res_2, int_res_3);
   `endif

   `ifdef VIRL_functiononly

   `else

specify
(A1 -=> X)=(0, 0);
(A2 -=> X)=(0, 0);
if ((~(A1) & A2 & B1)) (B2 +=> X)=(0, 0);
if ((A1 & ~(A2) & B1)) (B2 +=> X)=(0, 0);
if ((A1 & A2 & B1)) (B2 +=> X)=(0, 0);
if ((~(A1) & A2 & B2)) (B1 +=> X)=(0, 0);
if ((A1 & ~(A2) & B2)) (B1 +=> X)=(0, 0);
if ((A1 & A2 & B2)) (B1 +=> X)=(0, 0);
endspecify
   `endif
 
endmodule
`endcelldefine

//%END SVN_AO2BB2_1

//%BEGIN SVN_AO2BB2_2

`celldefine
module SVN_AO2BB2_2 (X, A1, A2, B1, B2);
   output X;
   input A1, A2, B1, B2;

   wire int_res_0, int_res_1, int_res_2, 
      int_res_3;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////

   not (int_res_0, A1);
   not (int_res_1, A2);
   and (int_res_2, int_res_0, int_res_1);
   and (int_res_3, B1, B2);

   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////

   `ifdef VIRL_functiononly
      or #`SNPS_COMBO_DELAY (X, int_res_2, int_res_3);
   `else
      or (X, int_res_2, int_res_3);
   `endif

   `ifdef VIRL_functiononly

   `else

specify
(A1 -=> X)=(0, 0);
(A2 -=> X)=(0, 0);
if ((~(A1) & A2 & B1)) (B2 +=> X)=(0, 0);
if ((A1 & ~(A2) & B1)) (B2 +=> X)=(0, 0);
if ((A1 & A2 & B1)) (B2 +=> X)=(0, 0);
if ((~(A1) & A2 & B2)) (B1 +=> X)=(0, 0);
if ((A1 & ~(A2) & B2)) (B1 +=> X)=(0, 0);
if ((A1 & A2 & B2)) (B1 +=> X)=(0, 0);
endspecify
   `endif
 
endmodule
`endcelldefine

//%END SVN_AO2BB2_2

//%BEGIN SVN_AO2BB2_4

`celldefine
module SVN_AO2BB2_4 (X, A1, A2, B1, B2);
   output X;
   input A1, A2, B1, B2;

   wire int_res_0, int_res_1, int_res_2, 
      int_res_3;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////

   not (int_res_0, A1);
   not (int_res_1, A2);
   and (int_res_2, int_res_0, int_res_1);
   and (int_res_3, B1, B2);

   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////

   `ifdef VIRL_functiononly
      or #`SNPS_COMBO_DELAY (X, int_res_2, int_res_3);
   `else
      or (X, int_res_2, int_res_3);
   `endif

   `ifdef VIRL_functiononly

   `else

specify
(A1 -=> X)=(0, 0);
(A2 -=> X)=(0, 0);
if ((~(A1) & A2 & B1)) (B2 +=> X)=(0, 0);
if ((A1 & ~(A2) & B1)) (B2 +=> X)=(0, 0);
if ((A1 & A2 & B1)) (B2 +=> X)=(0, 0);
if ((~(A1) & A2 & B2)) (B1 +=> X)=(0, 0);
if ((A1 & ~(A2) & B2)) (B1 +=> X)=(0, 0);
if ((A1 & A2 & B2)) (B1 +=> X)=(0, 0);
endspecify
   `endif
 
endmodule
`endcelldefine

//%END SVN_AO2BB2_4

//%BEGIN SVN_AO311_1

`celldefine
module SVN_AO311_1 (X, A1, A2, A3, B1, B2);
   output X;
   input A1, A2, A3, B1, B2;

   wire int_res_0;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////

   and (int_res_0, A1, A2, A3);


   `ifdef VIRL_functiononly
       or #`SNPS_COMBO_DELAY (X, int_res_0, B1, B2);
   `else
       or (X, int_res_0, B1, B2);
   `endif

   `ifdef VIRL_functiononly

   `else
   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////


specify
if (A1==1'b0&&A2==1'b0&&A3==1'b0&&B1==1'b0) (B2 +=> X)=(0, 0);
if (A1==1'b0&&A2==1'b0&&A3==1'b1&&B1==1'b0) (B2 +=> X)=(0, 0);
if (A1==1'b0&&A2==1'b1&&A3==1'b0&&B1==1'b0) (B2 +=> X)=(0, 0);
if (A1==1'b0&&A2==1'b1&&A3==1'b1&&B1==1'b0) (B2 +=> X)=(0, 0);
if (A1==1'b1&&A2==1'b0&&A3==1'b0&&B1==1'b0) (B2 +=> X)=(0, 0);
if (A1==1'b1&&A2==1'b0&&A3==1'b1&&B1==1'b0) (B2 +=> X)=(0, 0);
if (A1==1'b1&&A2==1'b1&&A3==1'b0&&B1==1'b0) (B2 +=> X)=(0, 0);
if (A1==1'b0&&A2==1'b0&&A3==1'b0&&B2==1'b0) (B1 +=> X)=(0, 0);
if (A1==1'b0&&A2==1'b0&&A3==1'b1&&B2==1'b0) (B1 +=> X)=(0, 0);
if (A1==1'b0&&A2==1'b1&&A3==1'b0&&B2==1'b0) (B1 +=> X)=(0, 0);
if (A1==1'b0&&A2==1'b1&&A3==1'b1&&B2==1'b0) (B1 +=> X)=(0, 0);
if (A1==1'b1&&A2==1'b0&&A3==1'b0&&B2==1'b0) (B1 +=> X)=(0, 0);
if (A1==1'b1&&A2==1'b0&&A3==1'b1&&B2==1'b0) (B1 +=> X)=(0, 0);
if (A1==1'b1&&A2==1'b1&&A3==1'b0&&B2==1'b0) (B1 +=> X)=(0, 0);
if (A1==1'b1&&A2==1'b1&&B1==1'b0&&B2==1'b0) (A3 +=> X)=(0, 0);
if (A1==1'b1&&A3==1'b1&&B1==1'b0&&B2==1'b0) (A2 +=> X)=(0, 0);
if (A2==1'b1&&A3==1'b1&&B1==1'b0&&B2==1'b0) (A1 +=> X)=(0, 0);
endspecify
   `endif

endmodule
`endcelldefine

//%END SVN_AO311_1

//%BEGIN SVN_AO311_2

`celldefine
module SVN_AO311_2 (X, A1, A2, A3, B1, B2);
   output X;
   input A1, A2, A3, B1, B2;

   wire int_res_0;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////

   and (int_res_0, A1, A2, A3);


   `ifdef VIRL_functiononly
       or #`SNPS_COMBO_DELAY (X, int_res_0, B1, B2);
   `else
       or (X, int_res_0, B1, B2);
   `endif

   `ifdef VIRL_functiononly

   `else
   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////


specify
if (A1==1'b0&&A2==1'b0&&A3==1'b0&&B1==1'b0) (B2 +=> X)=(0, 0);
if (A1==1'b0&&A2==1'b0&&A3==1'b1&&B1==1'b0) (B2 +=> X)=(0, 0);
if (A1==1'b0&&A2==1'b1&&A3==1'b0&&B1==1'b0) (B2 +=> X)=(0, 0);
if (A1==1'b0&&A2==1'b1&&A3==1'b1&&B1==1'b0) (B2 +=> X)=(0, 0);
if (A1==1'b1&&A2==1'b0&&A3==1'b0&&B1==1'b0) (B2 +=> X)=(0, 0);
if (A1==1'b1&&A2==1'b0&&A3==1'b1&&B1==1'b0) (B2 +=> X)=(0, 0);
if (A1==1'b1&&A2==1'b1&&A3==1'b0&&B1==1'b0) (B2 +=> X)=(0, 0);
if (A1==1'b0&&A2==1'b0&&A3==1'b0&&B2==1'b0) (B1 +=> X)=(0, 0);
if (A1==1'b0&&A2==1'b0&&A3==1'b1&&B2==1'b0) (B1 +=> X)=(0, 0);
if (A1==1'b0&&A2==1'b1&&A3==1'b0&&B2==1'b0) (B1 +=> X)=(0, 0);
if (A1==1'b0&&A2==1'b1&&A3==1'b1&&B2==1'b0) (B1 +=> X)=(0, 0);
if (A1==1'b1&&A2==1'b0&&A3==1'b0&&B2==1'b0) (B1 +=> X)=(0, 0);
if (A1==1'b1&&A2==1'b0&&A3==1'b1&&B2==1'b0) (B1 +=> X)=(0, 0);
if (A1==1'b1&&A2==1'b1&&A3==1'b0&&B2==1'b0) (B1 +=> X)=(0, 0);
if (A1==1'b1&&A2==1'b1&&B1==1'b0&&B2==1'b0) (A3 +=> X)=(0, 0);
if (A1==1'b1&&A3==1'b1&&B1==1'b0&&B2==1'b0) (A2 +=> X)=(0, 0);
if (A2==1'b1&&A3==1'b1&&B1==1'b0&&B2==1'b0) (A1 +=> X)=(0, 0);
endspecify
   `endif

endmodule
`endcelldefine

//%END SVN_AO311_2

//%BEGIN SVN_AO311_4

`celldefine
module SVN_AO311_4 (X, A1, A2, A3, B1, B2);
   output X;
   input A1, A2, A3, B1, B2;

   wire int_res_0;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////

   and (int_res_0, A1, A2, A3);


   `ifdef VIRL_functiononly
       or #`SNPS_COMBO_DELAY (X, int_res_0, B1, B2);
   `else
       or (X, int_res_0, B1, B2);
   `endif

   `ifdef VIRL_functiononly

   `else
   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////


specify
if (A1==1'b0&&A2==1'b0&&A3==1'b0&&B1==1'b0) (B2 +=> X)=(0, 0);
if (A1==1'b0&&A2==1'b0&&A3==1'b1&&B1==1'b0) (B2 +=> X)=(0, 0);
if (A1==1'b0&&A2==1'b1&&A3==1'b0&&B1==1'b0) (B2 +=> X)=(0, 0);
if (A1==1'b0&&A2==1'b1&&A3==1'b1&&B1==1'b0) (B2 +=> X)=(0, 0);
if (A1==1'b1&&A2==1'b0&&A3==1'b0&&B1==1'b0) (B2 +=> X)=(0, 0);
if (A1==1'b1&&A2==1'b0&&A3==1'b1&&B1==1'b0) (B2 +=> X)=(0, 0);
if (A1==1'b1&&A2==1'b1&&A3==1'b0&&B1==1'b0) (B2 +=> X)=(0, 0);
if (A1==1'b0&&A2==1'b0&&A3==1'b0&&B2==1'b0) (B1 +=> X)=(0, 0);
if (A1==1'b0&&A2==1'b0&&A3==1'b1&&B2==1'b0) (B1 +=> X)=(0, 0);
if (A1==1'b0&&A2==1'b1&&A3==1'b0&&B2==1'b0) (B1 +=> X)=(0, 0);
if (A1==1'b0&&A2==1'b1&&A3==1'b1&&B2==1'b0) (B1 +=> X)=(0, 0);
if (A1==1'b1&&A2==1'b0&&A3==1'b0&&B2==1'b0) (B1 +=> X)=(0, 0);
if (A1==1'b1&&A2==1'b0&&A3==1'b1&&B2==1'b0) (B1 +=> X)=(0, 0);
if (A1==1'b1&&A2==1'b1&&A3==1'b0&&B2==1'b0) (B1 +=> X)=(0, 0);
if (A1==1'b1&&A2==1'b1&&B1==1'b0&&B2==1'b0) (A3 +=> X)=(0, 0);
if (A1==1'b1&&A3==1'b1&&B1==1'b0&&B2==1'b0) (A2 +=> X)=(0, 0);
if (A2==1'b1&&A3==1'b1&&B1==1'b0&&B2==1'b0) (A1 +=> X)=(0, 0);
endspecify
   `endif

endmodule
`endcelldefine

//%END SVN_AO311_4

//%BEGIN SVN_AO31_1

`celldefine
module SVN_AO31_1 (X, A1, A2, A3, B);
   output X;
   input A1, A2, A3, B;

   wire int_res_0;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////

   and (int_res_0, A1, A2, A3);

   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////

   `ifdef VIRL_functiononly
      or #`SNPS_COMBO_DELAY (X, int_res_0, B);
   `else
      or (X, int_res_0, B);
   `endif

   `ifdef VIRL_functiononly

   `else

specify
(A1 +=> X)=(0, 0);
(A2 +=> X)=(0, 0);
(A3 +=> X)=(0, 0);
if ((~(A1) & ~(A2) & ~(A3))) (B +=> X)=(0, 0);
if ((~(A1) & A2 & ~(A3)) | (~(A1) & ~(A2) & A3)) (B +=> X)=(0, 0);
if ((~(A1) & A2 & A3)) (B +=> X)=(0, 0);
if ((A1 & ~(A2) & ~(A3))) (B +=> X)=(0, 0);
if ((A1 & ~(A2) & A3)) (B +=> X)=(0, 0);
if ((A1 & A2 & ~(A3))) (B +=> X)=(0, 0);
endspecify
   `endif
 
endmodule
`endcelldefine

//%END SVN_AO31_1

//%BEGIN SVN_AO31_2

`celldefine
module SVN_AO31_2 (X, A1, A2, A3, B);
   output X;
   input A1, A2, A3, B;

   wire int_res_0;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////

   and (int_res_0, A1, A2, A3);

   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////

   `ifdef VIRL_functiononly
      or #`SNPS_COMBO_DELAY (X, int_res_0, B);
   `else
      or (X, int_res_0, B);
   `endif

   `ifdef VIRL_functiononly

   `else

specify
(A1 +=> X)=(0, 0);
(A2 +=> X)=(0, 0);
(A3 +=> X)=(0, 0);
if ((~(A1) & ~(A2) & ~(A3))) (B +=> X)=(0, 0);
if ((~(A1) & A2 & ~(A3)) | (~(A1) & ~(A2) & A3)) (B +=> X)=(0, 0);
if ((~(A1) & A2 & A3)) (B +=> X)=(0, 0);
if ((A1 & ~(A2) & ~(A3))) (B +=> X)=(0, 0);
if ((A1 & ~(A2) & A3)) (B +=> X)=(0, 0);
if ((A1 & A2 & ~(A3))) (B +=> X)=(0, 0);
endspecify
   `endif
 
endmodule
`endcelldefine

//%END SVN_AO31_2

//%BEGIN SVN_AO31_4

`celldefine
module SVN_AO31_4 (X, A1, A2, A3, B);
   output X;
   input A1, A2, A3, B;

   wire int_res_0;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////

   and (int_res_0, A1, A2, A3);

   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////

   `ifdef VIRL_functiononly
      or #`SNPS_COMBO_DELAY (X, int_res_0, B);
   `else
      or (X, int_res_0, B);
   `endif

   `ifdef VIRL_functiononly

   `else

specify
(A1 +=> X)=(0, 0);
(A2 +=> X)=(0, 0);
(A3 +=> X)=(0, 0);
if ((~(A1) & ~(A2) & ~(A3))) (B +=> X)=(0, 0);
if ((~(A1) & A2 & ~(A3)) | (~(A1) & ~(A2) & A3)) (B +=> X)=(0, 0);
if ((~(A1) & A2 & A3)) (B +=> X)=(0, 0);
if ((A1 & ~(A2) & ~(A3))) (B +=> X)=(0, 0);
if ((A1 & ~(A2) & A3)) (B +=> X)=(0, 0);
if ((A1 & A2 & ~(A3))) (B +=> X)=(0, 0);
endspecify
   `endif
 
endmodule
`endcelldefine

//%END SVN_AO31_4

//%BEGIN SVN_AO32_1

`celldefine
module SVN_AO32_1 (X, A1, A2, A3, B1, B2);
   output X;
   input A1, A2, A3, B1, B2;

   wire int_res_0, int_res_1;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////

   and (int_res_0, A1, A2, A3);
   and (int_res_1, B1, B2);
   `ifdef VIRL_functiononly
      or #`SNPS_COMBO_DELAY (X, int_res_0, int_res_1);     
   `else
      or (X, int_res_0, int_res_1);
   `endif

   `ifdef VIRL_functiononly

   `else
   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////


specify
if ((~(A1) & ~(A2) & ~(A3) & B1)) (B2 +=> X)=(0, 0);
if ((~(A1) & A2 & ~(A3) & B1) | (~(A1) & ~(A2) & A3 & B1)) (B2 +=> X)=(0, 0);
if ((~(A1) & A2 & A3 & B1)) (B2 +=> X)=(0, 0);
if ((A1 & ~(A2) & ~(A3) & B1)) (B2 +=> X)=(0, 0);
if ((A1 & ~(A2) & A3 & B1)) (B2 +=> X)=(0, 0);
if ((A1 & A2 & ~(A3) & B1)) (B2 +=> X)=(0, 0);
if ((~(A1) & ~(A2) & ~(A3) & B2)) (B1 +=> X)=(0, 0);
if ((~(A1) & A2 & ~(A3) & B2) | (~(A1) & ~(A2) & A3 & B2)) (B1 +=> X)=(0, 0);
if ((~(A1) & A2 & A3 & B2)) (B1 +=> X)=(0, 0);
if ((A1 & ~(A2) & ~(A3) & B2)) (B1 +=> X)=(0, 0);
if ((A1 & ~(A2) & A3 & B2)) (B1 +=> X)=(0, 0);
if ((A1 & A2 & ~(A3) & B2)) (B1 +=> X)=(0, 0);
if ((A1 & A2 & ~(B1) & ~(B2))) (A3 +=> X)=(0, 0);
if ((A1 & A2 & ~(B1) & B2)) (A3 +=> X)=(0, 0);
if ((A1 & A2 & B1 & ~(B2))) (A3 +=> X)=(0, 0);
if ((A1 & A3 & ~(B1) & ~(B2))) (A2 +=> X)=(0, 0);
if ((A1 & A3 & ~(B1) & B2)) (A2 +=> X)=(0, 0);
if ((A1 & A3 & B1 & ~(B2))) (A2 +=> X)=(0, 0);
if ((A2 & A3 & ~(B1) & ~(B2))) (A1 +=> X)=(0, 0);
if ((A2 & A3 & ~(B1) & B2)) (A1 +=> X)=(0, 0);
if ((A2 & A3 & B1 & ~(B2))) (A1 +=> X)=(0, 0);
endspecify
   `endif 
endmodule
`endcelldefine

//%END SVN_AO32_1

//%BEGIN SVN_AO32_2

`celldefine
module SVN_AO32_2 (X, A1, A2, A3, B1, B2);
   output X;
   input A1, A2, A3, B1, B2;

   wire int_res_0, int_res_1;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////

   and (int_res_0, A1, A2, A3);
   and (int_res_1, B1, B2);
   `ifdef VIRL_functiononly
      or #`SNPS_COMBO_DELAY (X, int_res_0, int_res_1);     
   `else
      or (X, int_res_0, int_res_1);
   `endif

   `ifdef VIRL_functiononly

   `else
   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////


specify
if ((~(A1) & ~(A2) & ~(A3) & B1)) (B2 +=> X)=(0, 0);
if ((~(A1) & A2 & ~(A3) & B1) | (~(A1) & ~(A2) & A3 & B1)) (B2 +=> X)=(0, 0);
if ((~(A1) & A2 & A3 & B1)) (B2 +=> X)=(0, 0);
if ((A1 & ~(A2) & ~(A3) & B1)) (B2 +=> X)=(0, 0);
if ((A1 & ~(A2) & A3 & B1)) (B2 +=> X)=(0, 0);
if ((A1 & A2 & ~(A3) & B1)) (B2 +=> X)=(0, 0);
if ((~(A1) & ~(A2) & ~(A3) & B2)) (B1 +=> X)=(0, 0);
if ((~(A1) & A2 & ~(A3) & B2) | (~(A1) & ~(A2) & A3 & B2)) (B1 +=> X)=(0, 0);
if ((~(A1) & A2 & A3 & B2)) (B1 +=> X)=(0, 0);
if ((A1 & ~(A2) & ~(A3) & B2)) (B1 +=> X)=(0, 0);
if ((A1 & ~(A2) & A3 & B2)) (B1 +=> X)=(0, 0);
if ((A1 & A2 & ~(A3) & B2)) (B1 +=> X)=(0, 0);
if ((A1 & A2 & ~(B1) & ~(B2))) (A3 +=> X)=(0, 0);
if ((A1 & A2 & ~(B1) & B2)) (A3 +=> X)=(0, 0);
if ((A1 & A2 & B1 & ~(B2))) (A3 +=> X)=(0, 0);
if ((A1 & A3 & ~(B1) & ~(B2))) (A2 +=> X)=(0, 0);
if ((A1 & A3 & ~(B1) & B2)) (A2 +=> X)=(0, 0);
if ((A1 & A3 & B1 & ~(B2))) (A2 +=> X)=(0, 0);
if ((A2 & A3 & ~(B1) & ~(B2))) (A1 +=> X)=(0, 0);
if ((A2 & A3 & ~(B1) & B2)) (A1 +=> X)=(0, 0);
if ((A2 & A3 & B1 & ~(B2))) (A1 +=> X)=(0, 0);
endspecify
   `endif 
endmodule
`endcelldefine

//%END SVN_AO32_2

//%BEGIN SVN_AO32_4

`celldefine
module SVN_AO32_4 (X, A1, A2, A3, B1, B2);
   output X;
   input A1, A2, A3, B1, B2;

   wire int_res_0, int_res_1;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////

   and (int_res_0, A1, A2, A3);
   and (int_res_1, B1, B2);
   `ifdef VIRL_functiononly
      or #`SNPS_COMBO_DELAY (X, int_res_0, int_res_1);     
   `else
      or (X, int_res_0, int_res_1);
   `endif

   `ifdef VIRL_functiononly

   `else
   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////


specify
if ((~(A1) & ~(A2) & ~(A3) & B1)) (B2 +=> X)=(0, 0);
if ((~(A1) & A2 & ~(A3) & B1) | (~(A1) & ~(A2) & A3 & B1)) (B2 +=> X)=(0, 0);
if ((~(A1) & A2 & A3 & B1)) (B2 +=> X)=(0, 0);
if ((A1 & ~(A2) & ~(A3) & B1)) (B2 +=> X)=(0, 0);
if ((A1 & ~(A2) & A3 & B1)) (B2 +=> X)=(0, 0);
if ((A1 & A2 & ~(A3) & B1)) (B2 +=> X)=(0, 0);
if ((~(A1) & ~(A2) & ~(A3) & B2)) (B1 +=> X)=(0, 0);
if ((~(A1) & A2 & ~(A3) & B2) | (~(A1) & ~(A2) & A3 & B2)) (B1 +=> X)=(0, 0);
if ((~(A1) & A2 & A3 & B2)) (B1 +=> X)=(0, 0);
if ((A1 & ~(A2) & ~(A3) & B2)) (B1 +=> X)=(0, 0);
if ((A1 & ~(A2) & A3 & B2)) (B1 +=> X)=(0, 0);
if ((A1 & A2 & ~(A3) & B2)) (B1 +=> X)=(0, 0);
if ((A1 & A2 & ~(B1) & ~(B2))) (A3 +=> X)=(0, 0);
if ((A1 & A2 & ~(B1) & B2)) (A3 +=> X)=(0, 0);
if ((A1 & A2 & B1 & ~(B2))) (A3 +=> X)=(0, 0);
if ((A1 & A3 & ~(B1) & ~(B2))) (A2 +=> X)=(0, 0);
if ((A1 & A3 & ~(B1) & B2)) (A2 +=> X)=(0, 0);
if ((A1 & A3 & B1 & ~(B2))) (A2 +=> X)=(0, 0);
if ((A2 & A3 & ~(B1) & ~(B2))) (A1 +=> X)=(0, 0);
if ((A2 & A3 & ~(B1) & B2)) (A1 +=> X)=(0, 0);
if ((A2 & A3 & B1 & ~(B2))) (A1 +=> X)=(0, 0);
endspecify
   `endif 
endmodule
`endcelldefine

//%END SVN_AO32_4

//%BEGIN SVN_AO41_1

`celldefine
module SVN_AO41_1 (X, A1, A2, A3, A4, B);
   output X;
   input A1, A2, A3, A4, B;

   wire int_res_0;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////

   and (int_res_0, A1, A2, A3, A4);

   `ifdef VIRL_functiononly
       or #`SNPS_COMBO_DELAY (X, int_res_0, B);
   `else
       or (X, int_res_0, B);
   `endif

   `ifdef VIRL_functiononly

   `else

   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////


specify
if (A1==1'b0&&A2==1'b0&&A3==1'b0&&A4==1'b0) (B +=> X)=(0, 0);
if (A1==1'b0&&A2==1'b0&&A3==1'b0&&A4==1'b1) (B +=> X)=(0, 0);
if (A1==1'b0&&A2==1'b0&&A3==1'b1&&A4==1'b0) (B +=> X)=(0, 0);
if (A1==1'b0&&A2==1'b0&&A3==1'b1&&A4==1'b1) (B +=> X)=(0, 0);
if (A1==1'b0&&A2==1'b1&&A3==1'b0&&A4==1'b0) (B +=> X)=(0, 0);
if (A1==1'b0&&A2==1'b1&&A3==1'b0&&A4==1'b1) (B +=> X)=(0, 0);
if (A1==1'b0&&A2==1'b1&&A3==1'b1&&A4==1'b0) (B +=> X)=(0, 0);
if (A1==1'b0&&A2==1'b1&&A3==1'b1&&A4==1'b1) (B +=> X)=(0, 0);
if (A1==1'b1&&A2==1'b0&&A3==1'b0&&A4==1'b0) (B +=> X)=(0, 0);
if (A1==1'b1&&A2==1'b0&&A3==1'b0&&A4==1'b1) (B +=> X)=(0, 0);
if (A1==1'b1&&A2==1'b0&&A3==1'b1&&A4==1'b0) (B +=> X)=(0, 0);
if (A1==1'b1&&A2==1'b0&&A3==1'b1&&A4==1'b1) (B +=> X)=(0, 0);
if (A1==1'b1&&A2==1'b1&&A3==1'b0&&A4==1'b0) (B +=> X)=(0, 0);
if (A1==1'b1&&A2==1'b1&&A3==1'b0&&A4==1'b1) (B +=> X)=(0, 0);
if (A1==1'b1&&A2==1'b1&&A3==1'b1&&A4==1'b0) (B +=> X)=(0, 0);
if (A1==1'b1&&A2==1'b1&&A3==1'b1&&B==1'b0) (A4 +=> X)=(0, 0);
if (A1==1'b1&&A2==1'b1&&A4==1'b1&&B==1'b0) (A3 +=> X)=(0, 0);
if (A1==1'b1&&A3==1'b1&&A4==1'b1&&B==1'b0) (A2 +=> X)=(0, 0);
if (A2==1'b1&&A3==1'b1&&A4==1'b1&&B==1'b0) (A1 +=> X)=(0, 0);
endspecify
   `endif
endmodule
`endcelldefine

//%END SVN_AO41_1

//%BEGIN SVN_AO41_2

`celldefine
module SVN_AO41_2 (X, A1, A2, A3, A4, B);
   output X;
   input A1, A2, A3, A4, B;

   wire int_res_0;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////

   and (int_res_0, A1, A2, A3, A4);

   `ifdef VIRL_functiononly
       or #`SNPS_COMBO_DELAY (X, int_res_0, B);
   `else
       or (X, int_res_0, B);
   `endif

   `ifdef VIRL_functiononly

   `else

   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////


specify
if (A1==1'b0&&A2==1'b0&&A3==1'b0&&A4==1'b0) (B +=> X)=(0, 0);
if (A1==1'b0&&A2==1'b0&&A3==1'b0&&A4==1'b1) (B +=> X)=(0, 0);
if (A1==1'b0&&A2==1'b0&&A3==1'b1&&A4==1'b0) (B +=> X)=(0, 0);
if (A1==1'b0&&A2==1'b0&&A3==1'b1&&A4==1'b1) (B +=> X)=(0, 0);
if (A1==1'b0&&A2==1'b1&&A3==1'b0&&A4==1'b0) (B +=> X)=(0, 0);
if (A1==1'b0&&A2==1'b1&&A3==1'b0&&A4==1'b1) (B +=> X)=(0, 0);
if (A1==1'b0&&A2==1'b1&&A3==1'b1&&A4==1'b0) (B +=> X)=(0, 0);
if (A1==1'b0&&A2==1'b1&&A3==1'b1&&A4==1'b1) (B +=> X)=(0, 0);
if (A1==1'b1&&A2==1'b0&&A3==1'b0&&A4==1'b0) (B +=> X)=(0, 0);
if (A1==1'b1&&A2==1'b0&&A3==1'b0&&A4==1'b1) (B +=> X)=(0, 0);
if (A1==1'b1&&A2==1'b0&&A3==1'b1&&A4==1'b0) (B +=> X)=(0, 0);
if (A1==1'b1&&A2==1'b0&&A3==1'b1&&A4==1'b1) (B +=> X)=(0, 0);
if (A1==1'b1&&A2==1'b1&&A3==1'b0&&A4==1'b0) (B +=> X)=(0, 0);
if (A1==1'b1&&A2==1'b1&&A3==1'b0&&A4==1'b1) (B +=> X)=(0, 0);
if (A1==1'b1&&A2==1'b1&&A3==1'b1&&A4==1'b0) (B +=> X)=(0, 0);
if (A1==1'b1&&A2==1'b1&&A3==1'b1&&B==1'b0) (A4 +=> X)=(0, 0);
if (A1==1'b1&&A2==1'b1&&A4==1'b1&&B==1'b0) (A3 +=> X)=(0, 0);
if (A1==1'b1&&A3==1'b1&&A4==1'b1&&B==1'b0) (A2 +=> X)=(0, 0);
if (A2==1'b1&&A3==1'b1&&A4==1'b1&&B==1'b0) (A1 +=> X)=(0, 0);
endspecify
   `endif
endmodule
`endcelldefine

//%END SVN_AO41_2

//%BEGIN SVN_AO41_4

`celldefine
module SVN_AO41_4 (X, A1, A2, A3, A4, B);
   output X;
   input A1, A2, A3, A4, B;

   wire int_res_0;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////

   and (int_res_0, A1, A2, A3, A4);

   `ifdef VIRL_functiononly
       or #`SNPS_COMBO_DELAY (X, int_res_0, B);
   `else
       or (X, int_res_0, B);
   `endif

   `ifdef VIRL_functiononly

   `else

   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////


specify
if (A1==1'b0&&A2==1'b0&&A3==1'b0&&A4==1'b0) (B +=> X)=(0, 0);
if (A1==1'b0&&A2==1'b0&&A3==1'b0&&A4==1'b1) (B +=> X)=(0, 0);
if (A1==1'b0&&A2==1'b0&&A3==1'b1&&A4==1'b0) (B +=> X)=(0, 0);
if (A1==1'b0&&A2==1'b0&&A3==1'b1&&A4==1'b1) (B +=> X)=(0, 0);
if (A1==1'b0&&A2==1'b1&&A3==1'b0&&A4==1'b0) (B +=> X)=(0, 0);
if (A1==1'b0&&A2==1'b1&&A3==1'b0&&A4==1'b1) (B +=> X)=(0, 0);
if (A1==1'b0&&A2==1'b1&&A3==1'b1&&A4==1'b0) (B +=> X)=(0, 0);
if (A1==1'b0&&A2==1'b1&&A3==1'b1&&A4==1'b1) (B +=> X)=(0, 0);
if (A1==1'b1&&A2==1'b0&&A3==1'b0&&A4==1'b0) (B +=> X)=(0, 0);
if (A1==1'b1&&A2==1'b0&&A3==1'b0&&A4==1'b1) (B +=> X)=(0, 0);
if (A1==1'b1&&A2==1'b0&&A3==1'b1&&A4==1'b0) (B +=> X)=(0, 0);
if (A1==1'b1&&A2==1'b0&&A3==1'b1&&A4==1'b1) (B +=> X)=(0, 0);
if (A1==1'b1&&A2==1'b1&&A3==1'b0&&A4==1'b0) (B +=> X)=(0, 0);
if (A1==1'b1&&A2==1'b1&&A3==1'b0&&A4==1'b1) (B +=> X)=(0, 0);
if (A1==1'b1&&A2==1'b1&&A3==1'b1&&A4==1'b0) (B +=> X)=(0, 0);
if (A1==1'b1&&A2==1'b1&&A3==1'b1&&B==1'b0) (A4 +=> X)=(0, 0);
if (A1==1'b1&&A2==1'b1&&A4==1'b1&&B==1'b0) (A3 +=> X)=(0, 0);
if (A1==1'b1&&A3==1'b1&&A4==1'b1&&B==1'b0) (A2 +=> X)=(0, 0);
if (A2==1'b1&&A3==1'b1&&A4==1'b1&&B==1'b0) (A1 +=> X)=(0, 0);
endspecify
   `endif
endmodule
`endcelldefine

//%END SVN_AO41_4

//%BEGIN SVN_AOAI211_1

`celldefine
module SVN_AOAI211_1 (X, A1, A2, B, C);
   output X;
   input A1, A2, B, C;

   wire int_res_0, int_res_1;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////

   and (int_res_0, A1, A2);
   or (int_res_1, int_res_0, B);

   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////
   `ifdef VIRL_functiononly
      nand #`SNPS_COMBO_DELAY (X, int_res_1, C);
   `else
      nand (X, int_res_1, C);
   `endif

   `ifdef VIRL_functiononly

   `else

specify
(A1 -=> X)=(0, 0);
(A2 -=> X)=(0, 0);
if ((~(A1) & ~(A2) & C)) (B -=> X)=(0, 0);
if ((~(A1) & A2 & C)) (B -=> X)=(0, 0);
if ((A1 & ~(A2) & C)) (B -=> X)=(0, 0);
if ((~(A1) & B)) (C -=> X)=(0, 0);
if ((A1 & ~(A2) & B)) (C -=> X)=(0, 0);
if ((A1 & A2 & ~(B))) (C -=> X)=(0, 0);
if ((A1 & A2 & B)) (C -=> X)=(0, 0);
endspecify
   `endif

endmodule
`endcelldefine

//%END SVN_AOAI211_1

//%BEGIN SVN_AOAI211_2

`celldefine
module SVN_AOAI211_2 (X, A1, A2, B, C);
   output X;
   input A1, A2, B, C;

   wire int_res_0, int_res_1;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////

   and (int_res_0, A1, A2);
   or (int_res_1, int_res_0, B);

   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////
   `ifdef VIRL_functiononly
      nand #`SNPS_COMBO_DELAY (X, int_res_1, C);
   `else
      nand (X, int_res_1, C);
   `endif

   `ifdef VIRL_functiononly

   `else

specify
(A1 -=> X)=(0, 0);
(A2 -=> X)=(0, 0);
if ((~(A1) & ~(A2) & C)) (B -=> X)=(0, 0);
if ((~(A1) & A2 & C)) (B -=> X)=(0, 0);
if ((A1 & ~(A2) & C)) (B -=> X)=(0, 0);
if ((~(A1) & B)) (C -=> X)=(0, 0);
if ((A1 & ~(A2) & B)) (C -=> X)=(0, 0);
if ((A1 & A2 & ~(B))) (C -=> X)=(0, 0);
if ((A1 & A2 & B)) (C -=> X)=(0, 0);
endspecify
   `endif

endmodule
`endcelldefine

//%END SVN_AOAI211_2

//%BEGIN SVN_AOAI211_3

`celldefine
module SVN_AOAI211_3 (X, A1, A2, B, C);
   output X;
   input A1, A2, B, C;

   wire int_res_0, int_res_1;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////

   and (int_res_0, A1, A2);
   or (int_res_1, int_res_0, B);

   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////
   `ifdef VIRL_functiononly
      nand #`SNPS_COMBO_DELAY (X, int_res_1, C);
   `else
      nand (X, int_res_1, C);
   `endif

   `ifdef VIRL_functiononly

   `else

specify
(A1 -=> X)=(0, 0);
(A2 -=> X)=(0, 0);
if ((~(A1) & ~(A2) & C)) (B -=> X)=(0, 0);
if ((~(A1) & A2 & C)) (B -=> X)=(0, 0);
if ((A1 & ~(A2) & C)) (B -=> X)=(0, 0);
if ((~(A1) & B)) (C -=> X)=(0, 0);
if ((A1 & ~(A2) & B)) (C -=> X)=(0, 0);
if ((A1 & A2 & ~(B))) (C -=> X)=(0, 0);
if ((A1 & A2 & B)) (C -=> X)=(0, 0);
endspecify
   `endif

endmodule
`endcelldefine

//%END SVN_AOAI211_3

//%BEGIN SVN_AOAI211_4

`celldefine
module SVN_AOAI211_4 (X, A1, A2, B, C);
   output X;
   input A1, A2, B, C;

   wire int_res_0, int_res_1;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////

   and (int_res_0, A1, A2);
   or (int_res_1, int_res_0, B);

   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////
   `ifdef VIRL_functiononly
      nand #`SNPS_COMBO_DELAY (X, int_res_1, C);
   `else
      nand (X, int_res_1, C);
   `endif

   `ifdef VIRL_functiononly

   `else

specify
(A1 -=> X)=(0, 0);
(A2 -=> X)=(0, 0);
if ((~(A1) & ~(A2) & C)) (B -=> X)=(0, 0);
if ((~(A1) & A2 & C)) (B -=> X)=(0, 0);
if ((A1 & ~(A2) & C)) (B -=> X)=(0, 0);
if ((~(A1) & B)) (C -=> X)=(0, 0);
if ((A1 & ~(A2) & B)) (C -=> X)=(0, 0);
if ((A1 & A2 & ~(B))) (C -=> X)=(0, 0);
if ((A1 & A2 & B)) (C -=> X)=(0, 0);
endspecify
   `endif

endmodule
`endcelldefine

//%END SVN_AOAI211_4

//%BEGIN SVN_AOI211_0P5

`celldefine
module SVN_AOI211_0P5 (X, A1, A2, B1, B2);
   output X;
   input A1, A2, B1, B2;

   wire int_res_0;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////

   and (int_res_0, A1, A2);

   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////

  `ifdef VIRL_functiononly
     nor #`SNPS_COMBO_DELAY (X, int_res_0, B1, B2);
  `else
     nor (X, int_res_0, B1, B2);
  `endif

  `ifdef VIRL_functiononly

  `else

specify
(A1 -=> X)=(0, 0);
(A2 -=> X)=(0, 0);
if ((~(A1) & ~(A2) & ~(B1))) (B2 -=> X)=(0, 0);
if ((~(A1) & A2 & ~(B1))) (B2 -=> X)=(0, 0);
if ((A1 & ~(A2) & ~(B1))) (B2 -=> X)=(0, 0);
if ((~(A1) & ~(A2) & ~(B2))) (B1 -=> X)=(0, 0);
if ((~(A1) & A2 & ~(B2))) (B1 -=> X)=(0, 0);
if ((A1 & ~(A2) & ~(B2))) (B1 -=> X)=(0, 0);
endspecify
  `endif

endmodule
`endcelldefine

//%END SVN_AOI211_0P5

//%BEGIN SVN_AOI211_1

`celldefine
module SVN_AOI211_1 (X, A1, A2, B1, B2);
   output X;
   input A1, A2, B1, B2;

   wire int_res_0;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////

   and (int_res_0, A1, A2);

   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////

  `ifdef VIRL_functiononly
     nor #`SNPS_COMBO_DELAY (X, int_res_0, B1, B2);
  `else
     nor (X, int_res_0, B1, B2);
  `endif

  `ifdef VIRL_functiononly

  `else

specify
(A1 -=> X)=(0, 0);
(A2 -=> X)=(0, 0);
if ((~(A1) & ~(A2) & ~(B1))) (B2 -=> X)=(0, 0);
if ((~(A1) & A2 & ~(B1))) (B2 -=> X)=(0, 0);
if ((A1 & ~(A2) & ~(B1))) (B2 -=> X)=(0, 0);
if ((~(A1) & ~(A2) & ~(B2))) (B1 -=> X)=(0, 0);
if ((~(A1) & A2 & ~(B2))) (B1 -=> X)=(0, 0);
if ((A1 & ~(A2) & ~(B2))) (B1 -=> X)=(0, 0);
endspecify
  `endif

endmodule
`endcelldefine

//%END SVN_AOI211_1

//%BEGIN SVN_AOI211_2

`celldefine
module SVN_AOI211_2 (X, A1, A2, B1, B2);
   output X;
   input A1, A2, B1, B2;

   wire int_res_0;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////

   and (int_res_0, A1, A2);

   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////

  `ifdef VIRL_functiononly
     nor #`SNPS_COMBO_DELAY (X, int_res_0, B1, B2);
  `else
     nor (X, int_res_0, B1, B2);
  `endif

  `ifdef VIRL_functiononly

  `else

specify
(A1 -=> X)=(0, 0);
(A2 -=> X)=(0, 0);
if ((~(A1) & ~(A2) & ~(B1))) (B2 -=> X)=(0, 0);
if ((~(A1) & A2 & ~(B1))) (B2 -=> X)=(0, 0);
if ((A1 & ~(A2) & ~(B1))) (B2 -=> X)=(0, 0);
if ((~(A1) & ~(A2) & ~(B2))) (B1 -=> X)=(0, 0);
if ((~(A1) & A2 & ~(B2))) (B1 -=> X)=(0, 0);
if ((A1 & ~(A2) & ~(B2))) (B1 -=> X)=(0, 0);
endspecify
  `endif

endmodule
`endcelldefine

//%END SVN_AOI211_2

//%BEGIN SVN_AOI211_3

`celldefine
module SVN_AOI211_3 (X, A1, A2, B1, B2);
   output X;
   input A1, A2, B1, B2;

   wire int_res_0;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////

   and (int_res_0, A1, A2);

   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////

  `ifdef VIRL_functiononly
     nor #`SNPS_COMBO_DELAY (X, int_res_0, B1, B2);
  `else
     nor (X, int_res_0, B1, B2);
  `endif

  `ifdef VIRL_functiononly

  `else

specify
(A1 -=> X)=(0, 0);
(A2 -=> X)=(0, 0);
if ((~(A1) & ~(A2) & ~(B1))) (B2 -=> X)=(0, 0);
if ((~(A1) & A2 & ~(B1))) (B2 -=> X)=(0, 0);
if ((A1 & ~(A2) & ~(B1))) (B2 -=> X)=(0, 0);
if ((~(A1) & ~(A2) & ~(B2))) (B1 -=> X)=(0, 0);
if ((~(A1) & A2 & ~(B2))) (B1 -=> X)=(0, 0);
if ((A1 & ~(A2) & ~(B2))) (B1 -=> X)=(0, 0);
endspecify
  `endif

endmodule
`endcelldefine

//%END SVN_AOI211_3

//%BEGIN SVN_AOI211_4

`celldefine
module SVN_AOI211_4 (X, A1, A2, B1, B2);
   output X;
   input A1, A2, B1, B2;

   wire int_res_0;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////

   and (int_res_0, A1, A2);

   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////

  `ifdef VIRL_functiononly
     nor #`SNPS_COMBO_DELAY (X, int_res_0, B1, B2);
  `else
     nor (X, int_res_0, B1, B2);
  `endif

  `ifdef VIRL_functiononly

  `else

specify
(A1 -=> X)=(0, 0);
(A2 -=> X)=(0, 0);
if ((~(A1) & ~(A2) & ~(B1))) (B2 -=> X)=(0, 0);
if ((~(A1) & A2 & ~(B1))) (B2 -=> X)=(0, 0);
if ((A1 & ~(A2) & ~(B1))) (B2 -=> X)=(0, 0);
if ((~(A1) & ~(A2) & ~(B2))) (B1 -=> X)=(0, 0);
if ((~(A1) & A2 & ~(B2))) (B1 -=> X)=(0, 0);
if ((A1 & ~(A2) & ~(B2))) (B1 -=> X)=(0, 0);
endspecify
  `endif

endmodule
`endcelldefine

//%END SVN_AOI211_4

//%BEGIN SVN_AOI21_0P5

`celldefine
module SVN_AOI21_0P5 (X, A1, A2, B);
   output X;
   input A1, A2, B;

   wire int_res_0;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////

   and (int_res_0, A1, A2);

   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////

   `ifdef VIRL_functiononly
     nor #`SNPS_COMBO_DELAY  (X, int_res_0, B);
   `else
     nor (X, int_res_0, B);

   `endif

   `ifdef VIRL_functiononly

   `else

specify
(A1 -=> X)=(0, 0);
(A2 -=> X)=(0, 0);
if ((~(A1) & ~(A2))) (B -=> X)=(0, 0);
if ((~(A1) & A2)) (B -=> X)=(0, 0);
if ((A1 & ~(A2))) (B -=> X)=(0, 0);
endspecify
   `endif

endmodule
`endcelldefine

//%END SVN_AOI21_0P5

//%BEGIN SVN_AOI21_1

`celldefine
module SVN_AOI21_1 (X, A1, A2, B);
   output X;
   input A1, A2, B;

   wire int_res_0;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////

   and (int_res_0, A1, A2);

   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////

   `ifdef VIRL_functiononly
     nor #`SNPS_COMBO_DELAY  (X, int_res_0, B);
   `else
     nor (X, int_res_0, B);

   `endif

   `ifdef VIRL_functiononly

   `else

specify
(A1 -=> X)=(0, 0);
(A2 -=> X)=(0, 0);
if ((~(A1) & ~(A2))) (B -=> X)=(0, 0);
if ((~(A1) & A2)) (B -=> X)=(0, 0);
if ((A1 & ~(A2))) (B -=> X)=(0, 0);
endspecify
   `endif

endmodule
`endcelldefine

//%END SVN_AOI21_1

//%BEGIN SVN_AOI21_2

`celldefine
module SVN_AOI21_2 (X, A1, A2, B);
   output X;
   input A1, A2, B;

   wire int_res_0;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////

   and (int_res_0, A1, A2);

   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////

   `ifdef VIRL_functiononly
     nor #`SNPS_COMBO_DELAY  (X, int_res_0, B);
   `else
     nor (X, int_res_0, B);

   `endif

   `ifdef VIRL_functiononly

   `else

specify
(A1 -=> X)=(0, 0);
(A2 -=> X)=(0, 0);
if ((~(A1) & ~(A2))) (B -=> X)=(0, 0);
if ((~(A1) & A2)) (B -=> X)=(0, 0);
if ((A1 & ~(A2))) (B -=> X)=(0, 0);
endspecify
   `endif

endmodule
`endcelldefine

//%END SVN_AOI21_2

//%BEGIN SVN_AOI21_3

`celldefine
module SVN_AOI21_3 (X, A1, A2, B);
   output X;
   input A1, A2, B;

   wire int_res_0;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////

   and (int_res_0, A1, A2);

   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////

   `ifdef VIRL_functiononly
     nor #`SNPS_COMBO_DELAY  (X, int_res_0, B);
   `else
     nor (X, int_res_0, B);

   `endif

   `ifdef VIRL_functiononly

   `else

specify
(A1 -=> X)=(0, 0);
(A2 -=> X)=(0, 0);
if ((~(A1) & ~(A2))) (B -=> X)=(0, 0);
if ((~(A1) & A2)) (B -=> X)=(0, 0);
if ((A1 & ~(A2))) (B -=> X)=(0, 0);
endspecify
   `endif

endmodule
`endcelldefine

//%END SVN_AOI21_3

//%BEGIN SVN_AOI21_4

`celldefine
module SVN_AOI21_4 (X, A1, A2, B);
   output X;
   input A1, A2, B;

   wire int_res_0;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////

   and (int_res_0, A1, A2);

   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////

   `ifdef VIRL_functiononly
     nor #`SNPS_COMBO_DELAY  (X, int_res_0, B);
   `else
     nor (X, int_res_0, B);

   `endif

   `ifdef VIRL_functiononly

   `else

specify
(A1 -=> X)=(0, 0);
(A2 -=> X)=(0, 0);
if ((~(A1) & ~(A2))) (B -=> X)=(0, 0);
if ((~(A1) & A2)) (B -=> X)=(0, 0);
if ((A1 & ~(A2))) (B -=> X)=(0, 0);
endspecify
   `endif

endmodule
`endcelldefine

//%END SVN_AOI21_4

//%BEGIN SVN_AOI21B_1

`celldefine
module SVN_AOI21B_1 (X, A1, A2, B);
   output X;
   input A1, A2, B;

   wire int_res_0, int_res_1;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////

   and (int_res_0, A1, A2);
   not (int_res_1, B);

   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////

   `ifdef VIRL_functiononly
       nor #`SNPS_COMBO_DELAY (X, int_res_0, int_res_1);
   `else
       nor (X, int_res_0, int_res_1);
   `endif

   `ifdef VIRL_functiononly

   `else

specify
(A1 -=> X)=(0, 0);
(A2 -=> X)=(0, 0);
if ((~(A1) & ~(A2))) (B +=> X)=(0, 0);
if ((~(A1) & A2)) (B +=> X)=(0, 0);
if ((A1 & ~(A2))) (B +=> X)=(0, 0);
endspecify
   `endif
 
endmodule
`endcelldefine

//%END SVN_AOI21B_1

//%BEGIN SVN_AOI21B_2

`celldefine
module SVN_AOI21B_2 (X, A1, A2, B);
   output X;
   input A1, A2, B;

   wire int_res_0, int_res_1;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////

   and (int_res_0, A1, A2);
   not (int_res_1, B);

   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////

   `ifdef VIRL_functiononly
       nor #`SNPS_COMBO_DELAY (X, int_res_0, int_res_1);
   `else
       nor (X, int_res_0, int_res_1);
   `endif

   `ifdef VIRL_functiononly

   `else

specify
(A1 -=> X)=(0, 0);
(A2 -=> X)=(0, 0);
if ((~(A1) & ~(A2))) (B +=> X)=(0, 0);
if ((~(A1) & A2)) (B +=> X)=(0, 0);
if ((A1 & ~(A2))) (B +=> X)=(0, 0);
endspecify
   `endif
 
endmodule
`endcelldefine

//%END SVN_AOI21B_2

//%BEGIN SVN_AOI21B_3

`celldefine
module SVN_AOI21B_3 (X, A1, A2, B);
   output X;
   input A1, A2, B;

   wire int_res_0, int_res_1;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////

   and (int_res_0, A1, A2);
   not (int_res_1, B);

   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////

   `ifdef VIRL_functiononly
       nor #`SNPS_COMBO_DELAY (X, int_res_0, int_res_1);
   `else
       nor (X, int_res_0, int_res_1);
   `endif

   `ifdef VIRL_functiononly

   `else

specify
(A1 -=> X)=(0, 0);
(A2 -=> X)=(0, 0);
if ((~(A1) & ~(A2))) (B +=> X)=(0, 0);
if ((~(A1) & A2)) (B +=> X)=(0, 0);
if ((A1 & ~(A2))) (B +=> X)=(0, 0);
endspecify
   `endif
 
endmodule
`endcelldefine

//%END SVN_AOI21B_3

//%BEGIN SVN_AOI21B_4

`celldefine
module SVN_AOI21B_4 (X, A1, A2, B);
   output X;
   input A1, A2, B;

   wire int_res_0, int_res_1;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////

   and (int_res_0, A1, A2);
   not (int_res_1, B);

   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////

   `ifdef VIRL_functiononly
       nor #`SNPS_COMBO_DELAY (X, int_res_0, int_res_1);
   `else
       nor (X, int_res_0, int_res_1);
   `endif

   `ifdef VIRL_functiononly

   `else

specify
(A1 -=> X)=(0, 0);
(A2 -=> X)=(0, 0);
if ((~(A1) & ~(A2))) (B +=> X)=(0, 0);
if ((~(A1) & A2)) (B +=> X)=(0, 0);
if ((A1 & ~(A2))) (B +=> X)=(0, 0);
endspecify
   `endif
 
endmodule
`endcelldefine

//%END SVN_AOI21B_4

//%BEGIN SVN_AOI221_1

`celldefine
module SVN_AOI221_1 (X, A1, A2, B1, B2, C);
   output X;
   input A1, A2, B1, B2, C;

   wire int_res_0, int_res_1;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////

   and (int_res_0, A1, A2);
   and (int_res_1, B1, B2);

   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////
   `ifdef VIRL_functiononly
      nor #`SNPS_COMBO_DELAY (X, int_res_0, int_res_1, C);
  `else
      nor (X, int_res_0, int_res_1, C);
  `endif

  `ifdef VIRL_functiononly

  `else

specify
if ((~(A1) & ~(A2) & ~(B1) & ~(B2))) (C -=> X)=(0, 0);
if ((~(A1) & ~(A2) & B1 & ~(B2))) (C -=> X)=(0, 0);
if ((~(A1) & A2 & ~(B1) & ~(B2)) | (~(A1) & ~(A2) & ~(B1) & B2)) (C -=> X)=(0, 0);
if ((~(A1) & A2 & ~(B1) & B2)) (C -=> X)=(0, 0);
if ((~(A1) & A2 & B1 & ~(B2))) (C -=> X)=(0, 0);
if ((A1 & ~(A2) & ~(B1) & ~(B2))) (C -=> X)=(0, 0);
if ((A1 & ~(A2) & ~(B1) & B2)) (C -=> X)=(0, 0);
if ((A1 & ~(A2) & B1 & ~(B2))) (C -=> X)=(0, 0);
if ((~(A1) & ~(A2) & B1 & ~(C))) (B2 -=> X)=(0, 0);
if ((~(A1) & A2 & B1 & ~(C))) (B2 -=> X)=(0, 0);
if ((A1 & ~(A2) & B1 & ~(C))) (B2 -=> X)=(0, 0);
if ((~(A1) & ~(A2) & B2 & ~(C))) (B1 -=> X)=(0, 0);
if ((~(A1) & A2 & B2 & ~(C))) (B1 -=> X)=(0, 0);
if ((A1 & ~(A2) & B2 & ~(C))) (B1 -=> X)=(0, 0);
if ((A1 & ~(B1) & ~(B2) & ~(C))) (A2 -=> X)=(0, 0);
if ((A1 & ~(B1) & B2 & ~(C))) (A2 -=> X)=(0, 0);
if ((A1 & B1 & ~(B2) & ~(C))) (A2 -=> X)=(0, 0);
if ((A2 & ~(B1) & ~(B2) & ~(C))) (A1 -=> X)=(0, 0);
if ((A2 & ~(B1) & B2 & ~(C))) (A1 -=> X)=(0, 0);
if ((A2 & B1 & ~(B2) & ~(C))) (A1 -=> X)=(0, 0);
endspecify
  `endif

endmodule
`endcelldefine

//%END SVN_AOI221_1

//%BEGIN SVN_AOI221_2

`celldefine
module SVN_AOI221_2 (X, A1, A2, B1, B2, C);
   output X;
   input A1, A2, B1, B2, C;

   wire int_res_0, int_res_1;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////

   and (int_res_0, A1, A2);
   and (int_res_1, B1, B2);

   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////
   `ifdef VIRL_functiononly
      nor #`SNPS_COMBO_DELAY (X, int_res_0, int_res_1, C);
  `else
      nor (X, int_res_0, int_res_1, C);
  `endif

  `ifdef VIRL_functiononly

  `else

specify
if ((~(A1) & ~(A2) & ~(B1) & ~(B2))) (C -=> X)=(0, 0);
if ((~(A1) & ~(A2) & B1 & ~(B2))) (C -=> X)=(0, 0);
if ((~(A1) & A2 & ~(B1) & ~(B2)) | (~(A1) & ~(A2) & ~(B1) & B2)) (C -=> X)=(0, 0);
if ((~(A1) & A2 & ~(B1) & B2)) (C -=> X)=(0, 0);
if ((~(A1) & A2 & B1 & ~(B2))) (C -=> X)=(0, 0);
if ((A1 & ~(A2) & ~(B1) & ~(B2))) (C -=> X)=(0, 0);
if ((A1 & ~(A2) & ~(B1) & B2)) (C -=> X)=(0, 0);
if ((A1 & ~(A2) & B1 & ~(B2))) (C -=> X)=(0, 0);
if ((~(A1) & ~(A2) & B1 & ~(C))) (B2 -=> X)=(0, 0);
if ((~(A1) & A2 & B1 & ~(C))) (B2 -=> X)=(0, 0);
if ((A1 & ~(A2) & B1 & ~(C))) (B2 -=> X)=(0, 0);
if ((~(A1) & ~(A2) & B2 & ~(C))) (B1 -=> X)=(0, 0);
if ((~(A1) & A2 & B2 & ~(C))) (B1 -=> X)=(0, 0);
if ((A1 & ~(A2) & B2 & ~(C))) (B1 -=> X)=(0, 0);
if ((A1 & ~(B1) & ~(B2) & ~(C))) (A2 -=> X)=(0, 0);
if ((A1 & ~(B1) & B2 & ~(C))) (A2 -=> X)=(0, 0);
if ((A1 & B1 & ~(B2) & ~(C))) (A2 -=> X)=(0, 0);
if ((A2 & ~(B1) & ~(B2) & ~(C))) (A1 -=> X)=(0, 0);
if ((A2 & ~(B1) & B2 & ~(C))) (A1 -=> X)=(0, 0);
if ((A2 & B1 & ~(B2) & ~(C))) (A1 -=> X)=(0, 0);
endspecify
  `endif

endmodule
`endcelldefine

//%END SVN_AOI221_2

//%BEGIN SVN_AOI221_4

`celldefine
module SVN_AOI221_4 (X, A1, A2, B1, B2, C);
   output X;
   input A1, A2, B1, B2, C;

   wire int_res_0, int_res_1;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////

   and (int_res_0, A1, A2);
   and (int_res_1, B1, B2);

   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////
   `ifdef VIRL_functiononly
      nor #`SNPS_COMBO_DELAY (X, int_res_0, int_res_1, C);
  `else
      nor (X, int_res_0, int_res_1, C);
  `endif

  `ifdef VIRL_functiononly

  `else

specify
if ((~(A1) & ~(A2) & ~(B1) & ~(B2))) (C -=> X)=(0, 0);
if ((~(A1) & ~(A2) & B1 & ~(B2))) (C -=> X)=(0, 0);
if ((~(A1) & A2 & ~(B1) & ~(B2)) | (~(A1) & ~(A2) & ~(B1) & B2)) (C -=> X)=(0, 0);
if ((~(A1) & A2 & ~(B1) & B2)) (C -=> X)=(0, 0);
if ((~(A1) & A2 & B1 & ~(B2))) (C -=> X)=(0, 0);
if ((A1 & ~(A2) & ~(B1) & ~(B2))) (C -=> X)=(0, 0);
if ((A1 & ~(A2) & ~(B1) & B2)) (C -=> X)=(0, 0);
if ((A1 & ~(A2) & B1 & ~(B2))) (C -=> X)=(0, 0);
if ((~(A1) & ~(A2) & B1 & ~(C))) (B2 -=> X)=(0, 0);
if ((~(A1) & A2 & B1 & ~(C))) (B2 -=> X)=(0, 0);
if ((A1 & ~(A2) & B1 & ~(C))) (B2 -=> X)=(0, 0);
if ((~(A1) & ~(A2) & B2 & ~(C))) (B1 -=> X)=(0, 0);
if ((~(A1) & A2 & B2 & ~(C))) (B1 -=> X)=(0, 0);
if ((A1 & ~(A2) & B2 & ~(C))) (B1 -=> X)=(0, 0);
if ((A1 & ~(B1) & ~(B2) & ~(C))) (A2 -=> X)=(0, 0);
if ((A1 & ~(B1) & B2 & ~(C))) (A2 -=> X)=(0, 0);
if ((A1 & B1 & ~(B2) & ~(C))) (A2 -=> X)=(0, 0);
if ((A2 & ~(B1) & ~(B2) & ~(C))) (A1 -=> X)=(0, 0);
if ((A2 & ~(B1) & B2 & ~(C))) (A1 -=> X)=(0, 0);
if ((A2 & B1 & ~(B2) & ~(C))) (A1 -=> X)=(0, 0);
endspecify
  `endif

endmodule
`endcelldefine

//%END SVN_AOI221_4

//%BEGIN SVN_AOI222_1

`celldefine
module SVN_AOI222_1 (X, A1, A2, B1, B2, C1, C2);
   output X;
   input A1, A2, B1, B2, C1, C2;

   wire int_res_0, int_res_1, int_res_2;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////

   and (int_res_0, A1, A2);
   and (int_res_1, B1, B2);
   and (int_res_2, C1, C2);

   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////

   `ifdef VIRL_functiononly
       nor #`SNPS_COMBO_DELAY (X, int_res_0, int_res_1, int_res_2);
   `else
       nor (X, int_res_0, int_res_1, int_res_2);
   `endif

   `ifdef VIRL_functiononly

   `else


specify
if ((~(A1) & ~(A2) & ~(B1) & ~(B2) & C1)) (C2 -=> X)=(0, 0);
if ((~(A1) & ~(A2) & ~(B1) & B2 & C1)) (C2 -=> X)=(0, 0);
if ((~(A1) & ~(A2) & B1 & ~(B2) & C1)) (C2 -=> X)=(0, 0);
if ((~(A1) & A2 & ~(B1) & ~(B2) & C1)) (C2 -=> X)=(0, 0);
if ((~(A1) & A2 & ~(B1) & B2 & C1)) (C2 -=> X)=(0, 0);
if ((~(A1) & A2 & B1 & ~(B2) & C1)) (C2 -=> X)=(0, 0);
if ((A1 & ~(A2) & ~(B1) & ~(B2) & C1)) (C2 -=> X)=(0, 0);
if ((A1 & ~(A2) & ~(B1) & B2 & C1)) (C2 -=> X)=(0, 0);
if ((A1 & ~(A2) & B1 & ~(B2) & C1)) (C2 -=> X)=(0, 0);
if ((~(A1) & ~(A2) & ~(B1) & ~(B2) & C2)) (C1 -=> X)=(0, 0);
if ((~(A1) & ~(A2) & ~(B1) & B2 & C2)) (C1 -=> X)=(0, 0);
if ((~(A1) & ~(A2) & B1 & ~(B2) & C2)) (C1 -=> X)=(0, 0);
if ((~(A1) & A2 & ~(B1) & ~(B2) & C2)) (C1 -=> X)=(0, 0);
if ((~(A1) & A2 & ~(B1) & B2 & C2)) (C1 -=> X)=(0, 0);
if ((~(A1) & A2 & B1 & ~(B2) & C2)) (C1 -=> X)=(0, 0);
if ((A1 & ~(A2) & ~(B1) & ~(B2) & C2)) (C1 -=> X)=(0, 0);
if ((A1 & ~(A2) & ~(B1) & B2 & C2)) (C1 -=> X)=(0, 0);
if ((A1 & ~(A2) & B1 & ~(B2) & C2)) (C1 -=> X)=(0, 0);
if ((~(A1) & ~(A2) & B1 & ~(C1) & ~(C2))) (B2 -=> X)=(0, 0);
if ((~(A1) & ~(A2) & B1 & ~(C1) & C2)) (B2 -=> X)=(0, 0);
if ((~(A1) & ~(A2) & B1 & C1 & ~(C2))) (B2 -=> X)=(0, 0);
if ((~(A1) & A2 & B1 & ~(C1) & ~(C2))) (B2 -=> X)=(0, 0);
if ((~(A1) & A2 & B1 & ~(C1) & C2)) (B2 -=> X)=(0, 0);
if ((~(A1) & A2 & B1 & C1 & ~(C2))) (B2 -=> X)=(0, 0);
if ((A1 & ~(A2) & B1 & ~(C1) & ~(C2))) (B2 -=> X)=(0, 0);
if ((A1 & ~(A2) & B1 & ~(C1) & C2)) (B2 -=> X)=(0, 0);
if ((A1 & ~(A2) & B1 & C1 & ~(C2))) (B2 -=> X)=(0, 0);
if ((~(A1) & ~(A2) & B2 & ~(C1) & ~(C2))) (B1 -=> X)=(0, 0);
if ((~(A1) & ~(A2) & B2 & ~(C1) & C2)) (B1 -=> X)=(0, 0);
if ((~(A1) & ~(A2) & B2 & C1 & ~(C2))) (B1 -=> X)=(0, 0);
if ((~(A1) & A2 & B2 & ~(C1) & ~(C2))) (B1 -=> X)=(0, 0);
if ((~(A1) & A2 & B2 & ~(C1) & C2)) (B1 -=> X)=(0, 0);
if ((~(A1) & A2 & B2 & C1 & ~(C2))) (B1 -=> X)=(0, 0);
if ((A1 & ~(A2) & B2 & ~(C1) & ~(C2))) (B1 -=> X)=(0, 0);
if ((A1 & ~(A2) & B2 & ~(C1) & C2)) (B1 -=> X)=(0, 0);
if ((A1 & ~(A2) & B2 & C1 & ~(C2))) (B1 -=> X)=(0, 0);
if ((A1 & ~(B1) & ~(B2) & ~(C1) & ~(C2))) (A2 -=> X)=(0, 0);
if ((A1 & ~(B1) & ~(B2) & C1 & ~(C2))) (A2 -=> X)=(0, 0);
if ((A1 & ~(B1) & B2 & ~(C1) & ~(C2)) | (A1 & ~(B1) & ~(B2) & ~(C1) & C2)) (A2 -=> X)=(0, 0);
if ((A1 & ~(B1) & B2 & ~(C1) & C2)) (A2 -=> X)=(0, 0);
if ((A1 & ~(B1) & B2 & C1 & ~(C2))) (A2 -=> X)=(0, 0);
if ((A1 & B1 & ~(B2) & ~(C1) & ~(C2))) (A2 -=> X)=(0, 0);
if ((A1 & B1 & ~(B2) & ~(C1) & C2)) (A2 -=> X)=(0, 0);
if ((A1 & B1 & ~(B2) & C1 & ~(C2))) (A2 -=> X)=(0, 0);
if ((A2 & ~(B1) & ~(B2) & ~(C1) & ~(C2))) (A1 -=> X)=(0, 0);
if ((A2 & ~(B1) & ~(B2) & C1 & ~(C2))) (A1 -=> X)=(0, 0);
if ((A2 & ~(B1) & B2 & ~(C1) & ~(C2)) | (A2 & ~(B1) & ~(B2) & ~(C1) & C2)) (A1 -=> X)=(0, 0);
if ((A2 & ~(B1) & B2 & ~(C1) & C2)) (A1 -=> X)=(0, 0);
if ((A2 & ~(B1) & B2 & C1 & ~(C2))) (A1 -=> X)=(0, 0);
if ((A2 & B1 & ~(B2) & ~(C1) & ~(C2))) (A1 -=> X)=(0, 0);
if ((A2 & B1 & ~(B2) & ~(C1) & C2)) (A1 -=> X)=(0, 0);
if ((A2 & B1 & ~(B2) & C1 & ~(C2))) (A1 -=> X)=(0, 0);
endspecify
   `endif

endmodule
`endcelldefine

//%END SVN_AOI222_1

//%BEGIN SVN_AOI222_2

`celldefine
module SVN_AOI222_2 (X, A1, A2, B1, B2, C1, C2);
   output X;
   input A1, A2, B1, B2, C1, C2;

   wire int_res_0, int_res_1, int_res_2;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////

   and (int_res_0, A1, A2);
   and (int_res_1, B1, B2);
   and (int_res_2, C1, C2);

   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////

   `ifdef VIRL_functiononly
       nor #`SNPS_COMBO_DELAY (X, int_res_0, int_res_1, int_res_2);
   `else
       nor (X, int_res_0, int_res_1, int_res_2);
   `endif

   `ifdef VIRL_functiononly

   `else


specify
if ((~(A1) & ~(A2) & ~(B1) & ~(B2) & C1)) (C2 -=> X)=(0, 0);
if ((~(A1) & ~(A2) & ~(B1) & B2 & C1)) (C2 -=> X)=(0, 0);
if ((~(A1) & ~(A2) & B1 & ~(B2) & C1)) (C2 -=> X)=(0, 0);
if ((~(A1) & A2 & ~(B1) & ~(B2) & C1)) (C2 -=> X)=(0, 0);
if ((~(A1) & A2 & ~(B1) & B2 & C1)) (C2 -=> X)=(0, 0);
if ((~(A1) & A2 & B1 & ~(B2) & C1)) (C2 -=> X)=(0, 0);
if ((A1 & ~(A2) & ~(B1) & ~(B2) & C1)) (C2 -=> X)=(0, 0);
if ((A1 & ~(A2) & ~(B1) & B2 & C1)) (C2 -=> X)=(0, 0);
if ((A1 & ~(A2) & B1 & ~(B2) & C1)) (C2 -=> X)=(0, 0);
if ((~(A1) & ~(A2) & ~(B1) & ~(B2) & C2)) (C1 -=> X)=(0, 0);
if ((~(A1) & ~(A2) & ~(B1) & B2 & C2)) (C1 -=> X)=(0, 0);
if ((~(A1) & ~(A2) & B1 & ~(B2) & C2)) (C1 -=> X)=(0, 0);
if ((~(A1) & A2 & ~(B1) & ~(B2) & C2)) (C1 -=> X)=(0, 0);
if ((~(A1) & A2 & ~(B1) & B2 & C2)) (C1 -=> X)=(0, 0);
if ((~(A1) & A2 & B1 & ~(B2) & C2)) (C1 -=> X)=(0, 0);
if ((A1 & ~(A2) & ~(B1) & ~(B2) & C2)) (C1 -=> X)=(0, 0);
if ((A1 & ~(A2) & ~(B1) & B2 & C2)) (C1 -=> X)=(0, 0);
if ((A1 & ~(A2) & B1 & ~(B2) & C2)) (C1 -=> X)=(0, 0);
if ((~(A1) & ~(A2) & B1 & ~(C1) & ~(C2))) (B2 -=> X)=(0, 0);
if ((~(A1) & ~(A2) & B1 & ~(C1) & C2)) (B2 -=> X)=(0, 0);
if ((~(A1) & ~(A2) & B1 & C1 & ~(C2))) (B2 -=> X)=(0, 0);
if ((~(A1) & A2 & B1 & ~(C1) & ~(C2))) (B2 -=> X)=(0, 0);
if ((~(A1) & A2 & B1 & ~(C1) & C2)) (B2 -=> X)=(0, 0);
if ((~(A1) & A2 & B1 & C1 & ~(C2))) (B2 -=> X)=(0, 0);
if ((A1 & ~(A2) & B1 & ~(C1) & ~(C2))) (B2 -=> X)=(0, 0);
if ((A1 & ~(A2) & B1 & ~(C1) & C2)) (B2 -=> X)=(0, 0);
if ((A1 & ~(A2) & B1 & C1 & ~(C2))) (B2 -=> X)=(0, 0);
if ((~(A1) & ~(A2) & B2 & ~(C1) & ~(C2))) (B1 -=> X)=(0, 0);
if ((~(A1) & ~(A2) & B2 & ~(C1) & C2)) (B1 -=> X)=(0, 0);
if ((~(A1) & ~(A2) & B2 & C1 & ~(C2))) (B1 -=> X)=(0, 0);
if ((~(A1) & A2 & B2 & ~(C1) & ~(C2))) (B1 -=> X)=(0, 0);
if ((~(A1) & A2 & B2 & ~(C1) & C2)) (B1 -=> X)=(0, 0);
if ((~(A1) & A2 & B2 & C1 & ~(C2))) (B1 -=> X)=(0, 0);
if ((A1 & ~(A2) & B2 & ~(C1) & ~(C2))) (B1 -=> X)=(0, 0);
if ((A1 & ~(A2) & B2 & ~(C1) & C2)) (B1 -=> X)=(0, 0);
if ((A1 & ~(A2) & B2 & C1 & ~(C2))) (B1 -=> X)=(0, 0);
if ((A1 & ~(B1) & ~(B2) & ~(C1) & ~(C2))) (A2 -=> X)=(0, 0);
if ((A1 & ~(B1) & ~(B2) & C1 & ~(C2))) (A2 -=> X)=(0, 0);
if ((A1 & ~(B1) & B2 & ~(C1) & ~(C2)) | (A1 & ~(B1) & ~(B2) & ~(C1) & C2)) (A2 -=> X)=(0, 0);
if ((A1 & ~(B1) & B2 & ~(C1) & C2)) (A2 -=> X)=(0, 0);
if ((A1 & ~(B1) & B2 & C1 & ~(C2))) (A2 -=> X)=(0, 0);
if ((A1 & B1 & ~(B2) & ~(C1) & ~(C2))) (A2 -=> X)=(0, 0);
if ((A1 & B1 & ~(B2) & ~(C1) & C2)) (A2 -=> X)=(0, 0);
if ((A1 & B1 & ~(B2) & C1 & ~(C2))) (A2 -=> X)=(0, 0);
if ((A2 & ~(B1) & ~(B2) & ~(C1) & ~(C2))) (A1 -=> X)=(0, 0);
if ((A2 & ~(B1) & ~(B2) & C1 & ~(C2))) (A1 -=> X)=(0, 0);
if ((A2 & ~(B1) & B2 & ~(C1) & ~(C2)) | (A2 & ~(B1) & ~(B2) & ~(C1) & C2)) (A1 -=> X)=(0, 0);
if ((A2 & ~(B1) & B2 & ~(C1) & C2)) (A1 -=> X)=(0, 0);
if ((A2 & ~(B1) & B2 & C1 & ~(C2))) (A1 -=> X)=(0, 0);
if ((A2 & B1 & ~(B2) & ~(C1) & ~(C2))) (A1 -=> X)=(0, 0);
if ((A2 & B1 & ~(B2) & ~(C1) & C2)) (A1 -=> X)=(0, 0);
if ((A2 & B1 & ~(B2) & C1 & ~(C2))) (A1 -=> X)=(0, 0);
endspecify
   `endif

endmodule
`endcelldefine

//%END SVN_AOI222_2

//%BEGIN SVN_AOI222_4

`celldefine
module SVN_AOI222_4 (X, A1, A2, B1, B2, C1, C2);
   output X;
   input A1, A2, B1, B2, C1, C2;

   wire int_res_0, int_res_1, int_res_2;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////

   and (int_res_0, A1, A2);
   and (int_res_1, B1, B2);
   and (int_res_2, C1, C2);

   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////

   `ifdef VIRL_functiononly
       nor #`SNPS_COMBO_DELAY (X, int_res_0, int_res_1, int_res_2);
   `else
       nor (X, int_res_0, int_res_1, int_res_2);
   `endif

   `ifdef VIRL_functiononly

   `else


specify
if ((~(A1) & ~(A2) & ~(B1) & ~(B2) & C1)) (C2 -=> X)=(0, 0);
if ((~(A1) & ~(A2) & ~(B1) & B2 & C1)) (C2 -=> X)=(0, 0);
if ((~(A1) & ~(A2) & B1 & ~(B2) & C1)) (C2 -=> X)=(0, 0);
if ((~(A1) & A2 & ~(B1) & ~(B2) & C1)) (C2 -=> X)=(0, 0);
if ((~(A1) & A2 & ~(B1) & B2 & C1)) (C2 -=> X)=(0, 0);
if ((~(A1) & A2 & B1 & ~(B2) & C1)) (C2 -=> X)=(0, 0);
if ((A1 & ~(A2) & ~(B1) & ~(B2) & C1)) (C2 -=> X)=(0, 0);
if ((A1 & ~(A2) & ~(B1) & B2 & C1)) (C2 -=> X)=(0, 0);
if ((A1 & ~(A2) & B1 & ~(B2) & C1)) (C2 -=> X)=(0, 0);
if ((~(A1) & ~(A2) & ~(B1) & ~(B2) & C2)) (C1 -=> X)=(0, 0);
if ((~(A1) & ~(A2) & ~(B1) & B2 & C2)) (C1 -=> X)=(0, 0);
if ((~(A1) & ~(A2) & B1 & ~(B2) & C2)) (C1 -=> X)=(0, 0);
if ((~(A1) & A2 & ~(B1) & ~(B2) & C2)) (C1 -=> X)=(0, 0);
if ((~(A1) & A2 & ~(B1) & B2 & C2)) (C1 -=> X)=(0, 0);
if ((~(A1) & A2 & B1 & ~(B2) & C2)) (C1 -=> X)=(0, 0);
if ((A1 & ~(A2) & ~(B1) & ~(B2) & C2)) (C1 -=> X)=(0, 0);
if ((A1 & ~(A2) & ~(B1) & B2 & C2)) (C1 -=> X)=(0, 0);
if ((A1 & ~(A2) & B1 & ~(B2) & C2)) (C1 -=> X)=(0, 0);
if ((~(A1) & ~(A2) & B1 & ~(C1) & ~(C2))) (B2 -=> X)=(0, 0);
if ((~(A1) & ~(A2) & B1 & ~(C1) & C2)) (B2 -=> X)=(0, 0);
if ((~(A1) & ~(A2) & B1 & C1 & ~(C2))) (B2 -=> X)=(0, 0);
if ((~(A1) & A2 & B1 & ~(C1) & ~(C2))) (B2 -=> X)=(0, 0);
if ((~(A1) & A2 & B1 & ~(C1) & C2)) (B2 -=> X)=(0, 0);
if ((~(A1) & A2 & B1 & C1 & ~(C2))) (B2 -=> X)=(0, 0);
if ((A1 & ~(A2) & B1 & ~(C1) & ~(C2))) (B2 -=> X)=(0, 0);
if ((A1 & ~(A2) & B1 & ~(C1) & C2)) (B2 -=> X)=(0, 0);
if ((A1 & ~(A2) & B1 & C1 & ~(C2))) (B2 -=> X)=(0, 0);
if ((~(A1) & ~(A2) & B2 & ~(C1) & ~(C2))) (B1 -=> X)=(0, 0);
if ((~(A1) & ~(A2) & B2 & ~(C1) & C2)) (B1 -=> X)=(0, 0);
if ((~(A1) & ~(A2) & B2 & C1 & ~(C2))) (B1 -=> X)=(0, 0);
if ((~(A1) & A2 & B2 & ~(C1) & ~(C2))) (B1 -=> X)=(0, 0);
if ((~(A1) & A2 & B2 & ~(C1) & C2)) (B1 -=> X)=(0, 0);
if ((~(A1) & A2 & B2 & C1 & ~(C2))) (B1 -=> X)=(0, 0);
if ((A1 & ~(A2) & B2 & ~(C1) & ~(C2))) (B1 -=> X)=(0, 0);
if ((A1 & ~(A2) & B2 & ~(C1) & C2)) (B1 -=> X)=(0, 0);
if ((A1 & ~(A2) & B2 & C1 & ~(C2))) (B1 -=> X)=(0, 0);
if ((A1 & ~(B1) & ~(B2) & ~(C1) & ~(C2))) (A2 -=> X)=(0, 0);
if ((A1 & ~(B1) & ~(B2) & C1 & ~(C2))) (A2 -=> X)=(0, 0);
if ((A1 & ~(B1) & B2 & ~(C1) & ~(C2)) | (A1 & ~(B1) & ~(B2) & ~(C1) & C2)) (A2 -=> X)=(0, 0);
if ((A1 & ~(B1) & B2 & ~(C1) & C2)) (A2 -=> X)=(0, 0);
if ((A1 & ~(B1) & B2 & C1 & ~(C2))) (A2 -=> X)=(0, 0);
if ((A1 & B1 & ~(B2) & ~(C1) & ~(C2))) (A2 -=> X)=(0, 0);
if ((A1 & B1 & ~(B2) & ~(C1) & C2)) (A2 -=> X)=(0, 0);
if ((A1 & B1 & ~(B2) & C1 & ~(C2))) (A2 -=> X)=(0, 0);
if ((A2 & ~(B1) & ~(B2) & ~(C1) & ~(C2))) (A1 -=> X)=(0, 0);
if ((A2 & ~(B1) & ~(B2) & C1 & ~(C2))) (A1 -=> X)=(0, 0);
if ((A2 & ~(B1) & B2 & ~(C1) & ~(C2)) | (A2 & ~(B1) & ~(B2) & ~(C1) & C2)) (A1 -=> X)=(0, 0);
if ((A2 & ~(B1) & B2 & ~(C1) & C2)) (A1 -=> X)=(0, 0);
if ((A2 & ~(B1) & B2 & C1 & ~(C2))) (A1 -=> X)=(0, 0);
if ((A2 & B1 & ~(B2) & ~(C1) & ~(C2))) (A1 -=> X)=(0, 0);
if ((A2 & B1 & ~(B2) & ~(C1) & C2)) (A1 -=> X)=(0, 0);
if ((A2 & B1 & ~(B2) & C1 & ~(C2))) (A1 -=> X)=(0, 0);
endspecify
   `endif

endmodule
`endcelldefine

//%END SVN_AOI222_4

//%BEGIN SVN_AOI22_0P5

`celldefine
module SVN_AOI22_0P5 (X, A1, A2, B1, B2);
   output X;
   input A1, A2, B1, B2;

   wire int_res_0, int_res_1;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////

   and (int_res_0, A1, A2);
   and (int_res_1, B1, B2);

   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////

   `ifdef VIRL_functiononly
      nor #`SNPS_COMBO_DELAY (X, int_res_0, int_res_1);
   `else
      nor (X, int_res_0, int_res_1);
   `endif

   `ifdef VIRL_functiononly

   `else

specify
if ((~(A1) & ~(A2) & B1)) (B2 -=> X)=(0, 0);
if ((~(A1) & A2 & B1)) (B2 -=> X)=(0, 0);
if ((A1 & ~(A2) & B1)) (B2 -=> X)=(0, 0);
if ((~(A1) & ~(A2) & B2)) (B1 -=> X)=(0, 0);
if ((~(A1) & A2 & B2)) (B1 -=> X)=(0, 0);
if ((A1 & ~(A2) & B2)) (B1 -=> X)=(0, 0);
if ((A1 & ~(B1) & ~(B2))) (A2 -=> X)=(0, 0);
if ((A1 & ~(B1) & B2)) (A2 -=> X)=(0, 0);
if ((A1 & B1 & ~(B2))) (A2 -=> X)=(0, 0);
if ((A2 & ~(B1) & ~(B2))) (A1 -=> X)=(0, 0);
if ((A2 & ~(B1) & B2)) (A1 -=> X)=(0, 0);
if ((A2 & B1 & ~(B2))) (A1 -=> X)=(0, 0);
endspecify
   `endif

endmodule
`endcelldefine

//%END SVN_AOI22_0P5

//%BEGIN SVN_AOI22_1

`celldefine
module SVN_AOI22_1 (X, A1, A2, B1, B2);
   output X;
   input A1, A2, B1, B2;

   wire int_res_0, int_res_1;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////

   and (int_res_0, A1, A2);
   and (int_res_1, B1, B2);

   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////

   `ifdef VIRL_functiononly
      nor #`SNPS_COMBO_DELAY (X, int_res_0, int_res_1);
   `else
      nor (X, int_res_0, int_res_1);
   `endif

   `ifdef VIRL_functiononly

   `else

specify
if ((~(A1) & ~(A2) & B1)) (B2 -=> X)=(0, 0);
if ((~(A1) & A2 & B1)) (B2 -=> X)=(0, 0);
if ((A1 & ~(A2) & B1)) (B2 -=> X)=(0, 0);
if ((~(A1) & ~(A2) & B2)) (B1 -=> X)=(0, 0);
if ((~(A1) & A2 & B2)) (B1 -=> X)=(0, 0);
if ((A1 & ~(A2) & B2)) (B1 -=> X)=(0, 0);
if ((A1 & ~(B1) & ~(B2))) (A2 -=> X)=(0, 0);
if ((A1 & ~(B1) & B2)) (A2 -=> X)=(0, 0);
if ((A1 & B1 & ~(B2))) (A2 -=> X)=(0, 0);
if ((A2 & ~(B1) & ~(B2))) (A1 -=> X)=(0, 0);
if ((A2 & ~(B1) & B2)) (A1 -=> X)=(0, 0);
if ((A2 & B1 & ~(B2))) (A1 -=> X)=(0, 0);
endspecify
   `endif

endmodule
`endcelldefine

//%END SVN_AOI22_1

//%BEGIN SVN_AOI22_2

`celldefine
module SVN_AOI22_2 (X, A1, A2, B1, B2);
   output X;
   input A1, A2, B1, B2;

   wire int_res_0, int_res_1;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////

   and (int_res_0, A1, A2);
   and (int_res_1, B1, B2);

   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////

   `ifdef VIRL_functiononly
      nor #`SNPS_COMBO_DELAY (X, int_res_0, int_res_1);
   `else
      nor (X, int_res_0, int_res_1);
   `endif

   `ifdef VIRL_functiononly

   `else

specify
if ((~(A1) & ~(A2) & B1)) (B2 -=> X)=(0, 0);
if ((~(A1) & A2 & B1)) (B2 -=> X)=(0, 0);
if ((A1 & ~(A2) & B1)) (B2 -=> X)=(0, 0);
if ((~(A1) & ~(A2) & B2)) (B1 -=> X)=(0, 0);
if ((~(A1) & A2 & B2)) (B1 -=> X)=(0, 0);
if ((A1 & ~(A2) & B2)) (B1 -=> X)=(0, 0);
if ((A1 & ~(B1) & ~(B2))) (A2 -=> X)=(0, 0);
if ((A1 & ~(B1) & B2)) (A2 -=> X)=(0, 0);
if ((A1 & B1 & ~(B2))) (A2 -=> X)=(0, 0);
if ((A2 & ~(B1) & ~(B2))) (A1 -=> X)=(0, 0);
if ((A2 & ~(B1) & B2)) (A1 -=> X)=(0, 0);
if ((A2 & B1 & ~(B2))) (A1 -=> X)=(0, 0);
endspecify
   `endif

endmodule
`endcelldefine

//%END SVN_AOI22_2

//%BEGIN SVN_AOI22_3

`celldefine
module SVN_AOI22_3 (X, A1, A2, B1, B2);
   output X;
   input A1, A2, B1, B2;

   wire int_res_0, int_res_1;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////

   and (int_res_0, A1, A2);
   and (int_res_1, B1, B2);

   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////

   `ifdef VIRL_functiononly
      nor #`SNPS_COMBO_DELAY (X, int_res_0, int_res_1);
   `else
      nor (X, int_res_0, int_res_1);
   `endif

   `ifdef VIRL_functiononly

   `else

specify
if ((~(A1) & ~(A2) & B1)) (B2 -=> X)=(0, 0);
if ((~(A1) & A2 & B1)) (B2 -=> X)=(0, 0);
if ((A1 & ~(A2) & B1)) (B2 -=> X)=(0, 0);
if ((~(A1) & ~(A2) & B2)) (B1 -=> X)=(0, 0);
if ((~(A1) & A2 & B2)) (B1 -=> X)=(0, 0);
if ((A1 & ~(A2) & B2)) (B1 -=> X)=(0, 0);
if ((A1 & ~(B1) & ~(B2))) (A2 -=> X)=(0, 0);
if ((A1 & ~(B1) & B2)) (A2 -=> X)=(0, 0);
if ((A1 & B1 & ~(B2))) (A2 -=> X)=(0, 0);
if ((A2 & ~(B1) & ~(B2))) (A1 -=> X)=(0, 0);
if ((A2 & ~(B1) & B2)) (A1 -=> X)=(0, 0);
if ((A2 & B1 & ~(B2))) (A1 -=> X)=(0, 0);
endspecify
   `endif

endmodule
`endcelldefine

//%END SVN_AOI22_3

//%BEGIN SVN_AOI22_4

`celldefine
module SVN_AOI22_4 (X, A1, A2, B1, B2);
   output X;
   input A1, A2, B1, B2;

   wire int_res_0, int_res_1;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////

   and (int_res_0, A1, A2);
   and (int_res_1, B1, B2);

   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////

   `ifdef VIRL_functiononly
      nor #`SNPS_COMBO_DELAY (X, int_res_0, int_res_1);
   `else
      nor (X, int_res_0, int_res_1);
   `endif

   `ifdef VIRL_functiononly

   `else

specify
if ((~(A1) & ~(A2) & B1)) (B2 -=> X)=(0, 0);
if ((~(A1) & A2 & B1)) (B2 -=> X)=(0, 0);
if ((A1 & ~(A2) & B1)) (B2 -=> X)=(0, 0);
if ((~(A1) & ~(A2) & B2)) (B1 -=> X)=(0, 0);
if ((~(A1) & A2 & B2)) (B1 -=> X)=(0, 0);
if ((A1 & ~(A2) & B2)) (B1 -=> X)=(0, 0);
if ((A1 & ~(B1) & ~(B2))) (A2 -=> X)=(0, 0);
if ((A1 & ~(B1) & B2)) (A2 -=> X)=(0, 0);
if ((A1 & B1 & ~(B2))) (A2 -=> X)=(0, 0);
if ((A2 & ~(B1) & ~(B2))) (A1 -=> X)=(0, 0);
if ((A2 & ~(B1) & B2)) (A1 -=> X)=(0, 0);
if ((A2 & B1 & ~(B2))) (A1 -=> X)=(0, 0);
endspecify
   `endif

endmodule
`endcelldefine

//%END SVN_AOI22_4

//%BEGIN SVN_AOI311_1

`celldefine
module SVN_AOI311_1 (X, A1, A2, A3, B1, B2);
   output X;
   input A1, A2, A3, B1, B2;

   wire int_res_0;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////

   and (int_res_0, A1, A2, A3);


   `ifdef VIRL_functiononly
       nor #`SNPS_COMBO_DELAY (X, int_res_0, B1, B2);        
   `else
       nor (X, int_res_0, B1, B2);        
   `endif

   `ifdef VIRL_functiononly

   `else

   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////
  

specify
(A1 -=> X)=(0, 0);
(A2 -=> X)=(0, 0);
(A3 -=> X)=(0, 0);
if ((~(A1) & ~(A2) & ~(A3) & ~(B1))) (B2 -=> X)=(0, 0);
if ((~(A1) & A2 & ~(A3) & ~(B1)) | (~(A1) & ~(A2) & A3 & ~(B1))) (B2 -=> X)=(0, 0);
if ((~(A1) & A2 & A3 & ~(B1))) (B2 -=> X)=(0, 0);
if ((A1 & ~(A2) & ~(A3) & ~(B1))) (B2 -=> X)=(0, 0);
if ((A1 & ~(A2) & A3 & ~(B1))) (B2 -=> X)=(0, 0);
if ((A1 & A2 & ~(A3) & ~(B1))) (B2 -=> X)=(0, 0);
if ((~(A1) & ~(A2) & ~(A3) & ~(B2))) (B1 -=> X)=(0, 0);
if ((~(A1) & A2 & ~(A3) & ~(B2)) | (~(A1) & ~(A2) & A3 & ~(B2))) (B1 -=> X)=(0, 0);
if ((~(A1) & A2 & A3 & ~(B2))) (B1 -=> X)=(0, 0);
if ((A1 & ~(A2) & ~(A3) & ~(B2))) (B1 -=> X)=(0, 0);
if ((A1 & ~(A2) & A3 & ~(B2))) (B1 -=> X)=(0, 0);
if ((A1 & A2 & ~(A3) & ~(B2))) (B1 -=> X)=(0, 0);
endspecify
   `endif
endmodule
`endcelldefine

//%END SVN_AOI311_1

//%BEGIN SVN_AOI311_2

`celldefine
module SVN_AOI311_2 (X, A1, A2, A3, B1, B2);
   output X;
   input A1, A2, A3, B1, B2;

   wire int_res_0;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////

   and (int_res_0, A1, A2, A3);


   `ifdef VIRL_functiononly
       nor #`SNPS_COMBO_DELAY (X, int_res_0, B1, B2);        
   `else
       nor (X, int_res_0, B1, B2);        
   `endif

   `ifdef VIRL_functiononly

   `else

   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////
  

specify
(A1 -=> X)=(0, 0);
(A2 -=> X)=(0, 0);
(A3 -=> X)=(0, 0);
if ((~(A1) & ~(A2) & ~(A3) & ~(B1))) (B2 -=> X)=(0, 0);
if ((~(A1) & A2 & ~(A3) & ~(B1)) | (~(A1) & ~(A2) & A3 & ~(B1))) (B2 -=> X)=(0, 0);
if ((~(A1) & A2 & A3 & ~(B1))) (B2 -=> X)=(0, 0);
if ((A1 & ~(A2) & ~(A3) & ~(B1))) (B2 -=> X)=(0, 0);
if ((A1 & ~(A2) & A3 & ~(B1))) (B2 -=> X)=(0, 0);
if ((A1 & A2 & ~(A3) & ~(B1))) (B2 -=> X)=(0, 0);
if ((~(A1) & ~(A2) & ~(A3) & ~(B2))) (B1 -=> X)=(0, 0);
if ((~(A1) & A2 & ~(A3) & ~(B2)) | (~(A1) & ~(A2) & A3 & ~(B2))) (B1 -=> X)=(0, 0);
if ((~(A1) & A2 & A3 & ~(B2))) (B1 -=> X)=(0, 0);
if ((A1 & ~(A2) & ~(A3) & ~(B2))) (B1 -=> X)=(0, 0);
if ((A1 & ~(A2) & A3 & ~(B2))) (B1 -=> X)=(0, 0);
if ((A1 & A2 & ~(A3) & ~(B2))) (B1 -=> X)=(0, 0);
endspecify
   `endif
endmodule
`endcelldefine

//%END SVN_AOI311_2

//%BEGIN SVN_AOI311_4

`celldefine
module SVN_AOI311_4 (X, A1, A2, A3, B1, B2);
   output X;
   input A1, A2, A3, B1, B2;

   wire int_res_0;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////

   and (int_res_0, A1, A2, A3);


   `ifdef VIRL_functiononly
       nor #`SNPS_COMBO_DELAY (X, int_res_0, B1, B2);        
   `else
       nor (X, int_res_0, B1, B2);        
   `endif

   `ifdef VIRL_functiononly

   `else

   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////
  

specify
(A1 -=> X)=(0, 0);
(A2 -=> X)=(0, 0);
(A3 -=> X)=(0, 0);
if ((~(A1) & ~(A2) & ~(A3) & ~(B1))) (B2 -=> X)=(0, 0);
if ((~(A1) & A2 & ~(A3) & ~(B1)) | (~(A1) & ~(A2) & A3 & ~(B1))) (B2 -=> X)=(0, 0);
if ((~(A1) & A2 & A3 & ~(B1))) (B2 -=> X)=(0, 0);
if ((A1 & ~(A2) & ~(A3) & ~(B1))) (B2 -=> X)=(0, 0);
if ((A1 & ~(A2) & A3 & ~(B1))) (B2 -=> X)=(0, 0);
if ((A1 & A2 & ~(A3) & ~(B1))) (B2 -=> X)=(0, 0);
if ((~(A1) & ~(A2) & ~(A3) & ~(B2))) (B1 -=> X)=(0, 0);
if ((~(A1) & A2 & ~(A3) & ~(B2)) | (~(A1) & ~(A2) & A3 & ~(B2))) (B1 -=> X)=(0, 0);
if ((~(A1) & A2 & A3 & ~(B2))) (B1 -=> X)=(0, 0);
if ((A1 & ~(A2) & ~(A3) & ~(B2))) (B1 -=> X)=(0, 0);
if ((A1 & ~(A2) & A3 & ~(B2))) (B1 -=> X)=(0, 0);
if ((A1 & A2 & ~(A3) & ~(B2))) (B1 -=> X)=(0, 0);
endspecify
   `endif
endmodule
`endcelldefine

//%END SVN_AOI311_4

//%BEGIN SVN_AOI31_0P5

`celldefine
module SVN_AOI31_0P5 (X, A1, A2, A3, B);
   output X;
   input A1, A2, A3, B;

   wire int_res_0;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////

   and (int_res_0, A1, A2, A3);

   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////
   `ifdef VIRL_functiononly
        nor #`SNPS_COMBO_DELAY (X, int_res_0, B);
   `else
        nor (X, int_res_0, B);
   `endif

   `ifdef VIRL_functiononly

   `else

specify
(A1 -=> X)=(0, 0);
(A2 -=> X)=(0, 0);
(A3 -=> X)=(0, 0);
if ((~(A1) & ~(A2) & ~(A3))) (B -=> X)=(0, 0);
if ((~(A1) & A2 & ~(A3)) | (~(A1) & ~(A2) & A3)) (B -=> X)=(0, 0);
if ((~(A1) & A2 & A3)) (B -=> X)=(0, 0);
if ((A1 & ~(A2) & ~(A3))) (B -=> X)=(0, 0);
if ((A1 & ~(A2) & A3)) (B -=> X)=(0, 0);
if ((A1 & A2 & ~(A3))) (B -=> X)=(0, 0);
endspecify
   `endif

endmodule
`endcelldefine

//%END SVN_AOI31_0P5

//%BEGIN SVN_AOI31_1

`celldefine
module SVN_AOI31_1 (X, A1, A2, A3, B);
   output X;
   input A1, A2, A3, B;

   wire int_res_0;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////

   and (int_res_0, A1, A2, A3);

   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////
   `ifdef VIRL_functiononly
        nor #`SNPS_COMBO_DELAY (X, int_res_0, B);
   `else
        nor (X, int_res_0, B);
   `endif

   `ifdef VIRL_functiononly

   `else

specify
(A1 -=> X)=(0, 0);
(A2 -=> X)=(0, 0);
(A3 -=> X)=(0, 0);
if ((~(A1) & ~(A2) & ~(A3))) (B -=> X)=(0, 0);
if ((~(A1) & A2 & ~(A3)) | (~(A1) & ~(A2) & A3)) (B -=> X)=(0, 0);
if ((~(A1) & A2 & A3)) (B -=> X)=(0, 0);
if ((A1 & ~(A2) & ~(A3))) (B -=> X)=(0, 0);
if ((A1 & ~(A2) & A3)) (B -=> X)=(0, 0);
if ((A1 & A2 & ~(A3))) (B -=> X)=(0, 0);
endspecify
   `endif

endmodule
`endcelldefine

//%END SVN_AOI31_1

//%BEGIN SVN_AOI31_2

`celldefine
module SVN_AOI31_2 (X, A1, A2, A3, B);
   output X;
   input A1, A2, A3, B;

   wire int_res_0;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////

   and (int_res_0, A1, A2, A3);

   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////
   `ifdef VIRL_functiononly
        nor #`SNPS_COMBO_DELAY (X, int_res_0, B);
   `else
        nor (X, int_res_0, B);
   `endif

   `ifdef VIRL_functiononly

   `else

specify
(A1 -=> X)=(0, 0);
(A2 -=> X)=(0, 0);
(A3 -=> X)=(0, 0);
if ((~(A1) & ~(A2) & ~(A3))) (B -=> X)=(0, 0);
if ((~(A1) & A2 & ~(A3)) | (~(A1) & ~(A2) & A3)) (B -=> X)=(0, 0);
if ((~(A1) & A2 & A3)) (B -=> X)=(0, 0);
if ((A1 & ~(A2) & ~(A3))) (B -=> X)=(0, 0);
if ((A1 & ~(A2) & A3)) (B -=> X)=(0, 0);
if ((A1 & A2 & ~(A3))) (B -=> X)=(0, 0);
endspecify
   `endif

endmodule
`endcelldefine

//%END SVN_AOI31_2

//%BEGIN SVN_AOI31_3

`celldefine
module SVN_AOI31_3 (X, A1, A2, A3, B);
   output X;
   input A1, A2, A3, B;

   wire int_res_0;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////

   and (int_res_0, A1, A2, A3);

   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////
   `ifdef VIRL_functiononly
        nor #`SNPS_COMBO_DELAY (X, int_res_0, B);
   `else
        nor (X, int_res_0, B);
   `endif

   `ifdef VIRL_functiononly

   `else

specify
(A1 -=> X)=(0, 0);
(A2 -=> X)=(0, 0);
(A3 -=> X)=(0, 0);
if ((~(A1) & ~(A2) & ~(A3))) (B -=> X)=(0, 0);
if ((~(A1) & A2 & ~(A3)) | (~(A1) & ~(A2) & A3)) (B -=> X)=(0, 0);
if ((~(A1) & A2 & A3)) (B -=> X)=(0, 0);
if ((A1 & ~(A2) & ~(A3))) (B -=> X)=(0, 0);
if ((A1 & ~(A2) & A3)) (B -=> X)=(0, 0);
if ((A1 & A2 & ~(A3))) (B -=> X)=(0, 0);
endspecify
   `endif

endmodule
`endcelldefine

//%END SVN_AOI31_3

//%BEGIN SVN_AOI31_4

`celldefine
module SVN_AOI31_4 (X, A1, A2, A3, B);
   output X;
   input A1, A2, A3, B;

   wire int_res_0;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////

   and (int_res_0, A1, A2, A3);

   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////
   `ifdef VIRL_functiononly
        nor #`SNPS_COMBO_DELAY (X, int_res_0, B);
   `else
        nor (X, int_res_0, B);
   `endif

   `ifdef VIRL_functiononly

   `else

specify
(A1 -=> X)=(0, 0);
(A2 -=> X)=(0, 0);
(A3 -=> X)=(0, 0);
if ((~(A1) & ~(A2) & ~(A3))) (B -=> X)=(0, 0);
if ((~(A1) & A2 & ~(A3)) | (~(A1) & ~(A2) & A3)) (B -=> X)=(0, 0);
if ((~(A1) & A2 & A3)) (B -=> X)=(0, 0);
if ((A1 & ~(A2) & ~(A3))) (B -=> X)=(0, 0);
if ((A1 & ~(A2) & A3)) (B -=> X)=(0, 0);
if ((A1 & A2 & ~(A3))) (B -=> X)=(0, 0);
endspecify
   `endif

endmodule
`endcelldefine

//%END SVN_AOI31_4

//%BEGIN SVN_AOI32_1

`celldefine
module SVN_AOI32_1 (X, A1, A2, A3, B1, B2);
   output X;
   input A1, A2, A3, B1, B2;

   wire int_res_0, int_res_1;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////

   and (int_res_0, A1, A2, A3);
   and (int_res_1, B1, B2);
   `ifdef VIRL_functiononly
      nor #`SNPS_COMBO_DELAY (X, int_res_0, int_res_1);      
   `else
      nor (X, int_res_0, int_res_1);     
   `endif

   `ifdef VIRL_functiononly
   `else
   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////


specify
if ((~(A1) & ~(A2) & ~(A3) & B1)) (B2 -=> X)=(0, 0);
if ((~(A1) & A2 & ~(A3) & B1) | (~(A1) & ~(A2) & A3 & B1)) (B2 -=> X)=(0, 0);
if ((~(A1) & A2 & A3 & B1)) (B2 -=> X)=(0, 0);
if ((A1 & ~(A2) & ~(A3) & B1)) (B2 -=> X)=(0, 0);
if ((A1 & ~(A2) & A3 & B1)) (B2 -=> X)=(0, 0);
if ((A1 & A2 & ~(A3) & B1)) (B2 -=> X)=(0, 0);
if ((~(A1) & ~(A2) & ~(A3) & B2)) (B1 -=> X)=(0, 0);
if ((~(A1) & A2 & ~(A3) & B2) | (~(A1) & ~(A2) & A3 & B2)) (B1 -=> X)=(0, 0);
if ((~(A1) & A2 & A3 & B2)) (B1 -=> X)=(0, 0);
if ((A1 & ~(A2) & ~(A3) & B2)) (B1 -=> X)=(0, 0);
if ((A1 & ~(A2) & A3 & B2)) (B1 -=> X)=(0, 0);
if ((A1 & A2 & ~(A3) & B2)) (B1 -=> X)=(0, 0);
if ((A1 & A2 & ~(B1) & ~(B2))) (A3 -=> X)=(0, 0);
if ((A1 & A2 & ~(B1) & B2)) (A3 -=> X)=(0, 0);
if ((A1 & A2 & B1 & ~(B2))) (A3 -=> X)=(0, 0);
if ((A1 & A3 & ~(B1) & ~(B2))) (A2 -=> X)=(0, 0);
if ((A1 & A3 & ~(B1) & B2)) (A2 -=> X)=(0, 0);
if ((A1 & A3 & B1 & ~(B2))) (A2 -=> X)=(0, 0);
if ((A2 & A3 & ~(B1) & ~(B2))) (A1 -=> X)=(0, 0);
if ((A2 & A3 & ~(B1) & B2)) (A1 -=> X)=(0, 0);
if ((A2 & A3 & B1 & ~(B2))) (A1 -=> X)=(0, 0);
endspecify
   `endif
endmodule
`endcelldefine

//%END SVN_AOI32_1

//%BEGIN SVN_AOI32_2

`celldefine
module SVN_AOI32_2 (X, A1, A2, A3, B1, B2);
   output X;
   input A1, A2, A3, B1, B2;

   wire int_res_0, int_res_1;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////

   and (int_res_0, A1, A2, A3);
   and (int_res_1, B1, B2);
   `ifdef VIRL_functiononly
      nor #`SNPS_COMBO_DELAY (X, int_res_0, int_res_1);      
   `else
      nor (X, int_res_0, int_res_1);     
   `endif

   `ifdef VIRL_functiononly
   `else
   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////


specify
if ((~(A1) & ~(A2) & ~(A3) & B1)) (B2 -=> X)=(0, 0);
if ((~(A1) & A2 & ~(A3) & B1) | (~(A1) & ~(A2) & A3 & B1)) (B2 -=> X)=(0, 0);
if ((~(A1) & A2 & A3 & B1)) (B2 -=> X)=(0, 0);
if ((A1 & ~(A2) & ~(A3) & B1)) (B2 -=> X)=(0, 0);
if ((A1 & ~(A2) & A3 & B1)) (B2 -=> X)=(0, 0);
if ((A1 & A2 & ~(A3) & B1)) (B2 -=> X)=(0, 0);
if ((~(A1) & ~(A2) & ~(A3) & B2)) (B1 -=> X)=(0, 0);
if ((~(A1) & A2 & ~(A3) & B2) | (~(A1) & ~(A2) & A3 & B2)) (B1 -=> X)=(0, 0);
if ((~(A1) & A2 & A3 & B2)) (B1 -=> X)=(0, 0);
if ((A1 & ~(A2) & ~(A3) & B2)) (B1 -=> X)=(0, 0);
if ((A1 & ~(A2) & A3 & B2)) (B1 -=> X)=(0, 0);
if ((A1 & A2 & ~(A3) & B2)) (B1 -=> X)=(0, 0);
if ((A1 & A2 & ~(B1) & ~(B2))) (A3 -=> X)=(0, 0);
if ((A1 & A2 & ~(B1) & B2)) (A3 -=> X)=(0, 0);
if ((A1 & A2 & B1 & ~(B2))) (A3 -=> X)=(0, 0);
if ((A1 & A3 & ~(B1) & ~(B2))) (A2 -=> X)=(0, 0);
if ((A1 & A3 & ~(B1) & B2)) (A2 -=> X)=(0, 0);
if ((A1 & A3 & B1 & ~(B2))) (A2 -=> X)=(0, 0);
if ((A2 & A3 & ~(B1) & ~(B2))) (A1 -=> X)=(0, 0);
if ((A2 & A3 & ~(B1) & B2)) (A1 -=> X)=(0, 0);
if ((A2 & A3 & B1 & ~(B2))) (A1 -=> X)=(0, 0);
endspecify
   `endif
endmodule
`endcelldefine

//%END SVN_AOI32_2

//%BEGIN SVN_AOI32_4

`celldefine
module SVN_AOI32_4 (X, A1, A2, A3, B1, B2);
   output X;
   input A1, A2, A3, B1, B2;

   wire int_res_0, int_res_1;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////

   and (int_res_0, A1, A2, A3);
   and (int_res_1, B1, B2);
   `ifdef VIRL_functiononly
      nor #`SNPS_COMBO_DELAY (X, int_res_0, int_res_1);      
   `else
      nor (X, int_res_0, int_res_1);     
   `endif

   `ifdef VIRL_functiononly
   `else
   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////


specify
if ((~(A1) & ~(A2) & ~(A3) & B1)) (B2 -=> X)=(0, 0);
if ((~(A1) & A2 & ~(A3) & B1) | (~(A1) & ~(A2) & A3 & B1)) (B2 -=> X)=(0, 0);
if ((~(A1) & A2 & A3 & B1)) (B2 -=> X)=(0, 0);
if ((A1 & ~(A2) & ~(A3) & B1)) (B2 -=> X)=(0, 0);
if ((A1 & ~(A2) & A3 & B1)) (B2 -=> X)=(0, 0);
if ((A1 & A2 & ~(A3) & B1)) (B2 -=> X)=(0, 0);
if ((~(A1) & ~(A2) & ~(A3) & B2)) (B1 -=> X)=(0, 0);
if ((~(A1) & A2 & ~(A3) & B2) | (~(A1) & ~(A2) & A3 & B2)) (B1 -=> X)=(0, 0);
if ((~(A1) & A2 & A3 & B2)) (B1 -=> X)=(0, 0);
if ((A1 & ~(A2) & ~(A3) & B2)) (B1 -=> X)=(0, 0);
if ((A1 & ~(A2) & A3 & B2)) (B1 -=> X)=(0, 0);
if ((A1 & A2 & ~(A3) & B2)) (B1 -=> X)=(0, 0);
if ((A1 & A2 & ~(B1) & ~(B2))) (A3 -=> X)=(0, 0);
if ((A1 & A2 & ~(B1) & B2)) (A3 -=> X)=(0, 0);
if ((A1 & A2 & B1 & ~(B2))) (A3 -=> X)=(0, 0);
if ((A1 & A3 & ~(B1) & ~(B2))) (A2 -=> X)=(0, 0);
if ((A1 & A3 & ~(B1) & B2)) (A2 -=> X)=(0, 0);
if ((A1 & A3 & B1 & ~(B2))) (A2 -=> X)=(0, 0);
if ((A2 & A3 & ~(B1) & ~(B2))) (A1 -=> X)=(0, 0);
if ((A2 & A3 & ~(B1) & B2)) (A1 -=> X)=(0, 0);
if ((A2 & A3 & B1 & ~(B2))) (A1 -=> X)=(0, 0);
endspecify
   `endif
endmodule
`endcelldefine

//%END SVN_AOI32_4

//%BEGIN SVN_AOI41_1

`celldefine
module SVN_AOI41_1 (X, A1, A2, A3, A4, B);
   output X;
   input A1, A2, A3, A4, B;

   wire int_res_0;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////

   and (int_res_0, A1, A2, A3, A4);


   `ifdef VIRL_functiononly
       nor #`SNPS_COMBO_DELAY (X, int_res_0, B);       
   `else
       nor (X, int_res_0, B);        
   `endif

   `ifdef VIRL_functiononly

   `else
   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////


specify
if (A1==1'b0&&A2==1'b0&&A3==1'b0&&A4==1'b0) (B -=> X)=(0, 0);
if (A1==1'b0&&A2==1'b0&&A3==1'b0&&A4==1'b1) (B -=> X)=(0, 0);
if (A1==1'b0&&A2==1'b0&&A3==1'b1&&A4==1'b0) (B -=> X)=(0, 0);
if (A1==1'b0&&A2==1'b0&&A3==1'b1&&A4==1'b1) (B -=> X)=(0, 0);
if (A1==1'b0&&A2==1'b1&&A3==1'b0&&A4==1'b0) (B -=> X)=(0, 0);
if (A1==1'b0&&A2==1'b1&&A3==1'b0&&A4==1'b1) (B -=> X)=(0, 0);
if (A1==1'b0&&A2==1'b1&&A3==1'b1&&A4==1'b0) (B -=> X)=(0, 0);
if (A1==1'b0&&A2==1'b1&&A3==1'b1&&A4==1'b1) (B -=> X)=(0, 0);
if (A1==1'b1&&A2==1'b0&&A3==1'b0&&A4==1'b0) (B -=> X)=(0, 0);
if (A1==1'b1&&A2==1'b0&&A3==1'b0&&A4==1'b1) (B -=> X)=(0, 0);
if (A1==1'b1&&A2==1'b0&&A3==1'b1&&A4==1'b0) (B -=> X)=(0, 0);
if (A1==1'b1&&A2==1'b0&&A3==1'b1&&A4==1'b1) (B -=> X)=(0, 0);
if (A1==1'b1&&A2==1'b1&&A3==1'b0&&A4==1'b0) (B -=> X)=(0, 0);
if (A1==1'b1&&A2==1'b1&&A3==1'b0&&A4==1'b1) (B -=> X)=(0, 0);
if (A1==1'b1&&A2==1'b1&&A3==1'b1&&A4==1'b0) (B -=> X)=(0, 0);
if (A1==1'b1&&A2==1'b1&&A3==1'b1&&B==1'b0) (A4 -=> X)=(0, 0);
if (A1==1'b1&&A2==1'b1&&A4==1'b1&&B==1'b0) (A3 -=> X)=(0, 0);
if (A1==1'b1&&A3==1'b1&&A4==1'b1&&B==1'b0) (A2 -=> X)=(0, 0);
if (A2==1'b1&&A3==1'b1&&A4==1'b1&&B==1'b0) (A1 -=> X)=(0, 0);
endspecify
   `endif

endmodule
`endcelldefine

//%END SVN_AOI41_1

//%BEGIN SVN_AOI41_2

`celldefine
module SVN_AOI41_2 (X, A1, A2, A3, A4, B);
   output X;
   input A1, A2, A3, A4, B;

   wire int_res_0;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////

   and (int_res_0, A1, A2, A3, A4);


   `ifdef VIRL_functiononly
       nor #`SNPS_COMBO_DELAY (X, int_res_0, B);       
   `else
       nor (X, int_res_0, B);        
   `endif

   `ifdef VIRL_functiononly

   `else
   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////


specify
if (A1==1'b0&&A2==1'b0&&A3==1'b0&&A4==1'b0) (B -=> X)=(0, 0);
if (A1==1'b0&&A2==1'b0&&A3==1'b0&&A4==1'b1) (B -=> X)=(0, 0);
if (A1==1'b0&&A2==1'b0&&A3==1'b1&&A4==1'b0) (B -=> X)=(0, 0);
if (A1==1'b0&&A2==1'b0&&A3==1'b1&&A4==1'b1) (B -=> X)=(0, 0);
if (A1==1'b0&&A2==1'b1&&A3==1'b0&&A4==1'b0) (B -=> X)=(0, 0);
if (A1==1'b0&&A2==1'b1&&A3==1'b0&&A4==1'b1) (B -=> X)=(0, 0);
if (A1==1'b0&&A2==1'b1&&A3==1'b1&&A4==1'b0) (B -=> X)=(0, 0);
if (A1==1'b0&&A2==1'b1&&A3==1'b1&&A4==1'b1) (B -=> X)=(0, 0);
if (A1==1'b1&&A2==1'b0&&A3==1'b0&&A4==1'b0) (B -=> X)=(0, 0);
if (A1==1'b1&&A2==1'b0&&A3==1'b0&&A4==1'b1) (B -=> X)=(0, 0);
if (A1==1'b1&&A2==1'b0&&A3==1'b1&&A4==1'b0) (B -=> X)=(0, 0);
if (A1==1'b1&&A2==1'b0&&A3==1'b1&&A4==1'b1) (B -=> X)=(0, 0);
if (A1==1'b1&&A2==1'b1&&A3==1'b0&&A4==1'b0) (B -=> X)=(0, 0);
if (A1==1'b1&&A2==1'b1&&A3==1'b0&&A4==1'b1) (B -=> X)=(0, 0);
if (A1==1'b1&&A2==1'b1&&A3==1'b1&&A4==1'b0) (B -=> X)=(0, 0);
if (A1==1'b1&&A2==1'b1&&A3==1'b1&&B==1'b0) (A4 -=> X)=(0, 0);
if (A1==1'b1&&A2==1'b1&&A4==1'b1&&B==1'b0) (A3 -=> X)=(0, 0);
if (A1==1'b1&&A3==1'b1&&A4==1'b1&&B==1'b0) (A2 -=> X)=(0, 0);
if (A2==1'b1&&A3==1'b1&&A4==1'b1&&B==1'b0) (A1 -=> X)=(0, 0);
endspecify
   `endif

endmodule
`endcelldefine

//%END SVN_AOI41_2

//%BEGIN SVN_AOI41_4

`celldefine
module SVN_AOI41_4 (X, A1, A2, A3, A4, B);
   output X;
   input A1, A2, A3, A4, B;

   wire int_res_0;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////

   and (int_res_0, A1, A2, A3, A4);


   `ifdef VIRL_functiononly
       nor #`SNPS_COMBO_DELAY (X, int_res_0, B);       
   `else
       nor (X, int_res_0, B);        
   `endif

   `ifdef VIRL_functiononly

   `else
   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////


specify
if (A1==1'b0&&A2==1'b0&&A3==1'b0&&A4==1'b0) (B -=> X)=(0, 0);
if (A1==1'b0&&A2==1'b0&&A3==1'b0&&A4==1'b1) (B -=> X)=(0, 0);
if (A1==1'b0&&A2==1'b0&&A3==1'b1&&A4==1'b0) (B -=> X)=(0, 0);
if (A1==1'b0&&A2==1'b0&&A3==1'b1&&A4==1'b1) (B -=> X)=(0, 0);
if (A1==1'b0&&A2==1'b1&&A3==1'b0&&A4==1'b0) (B -=> X)=(0, 0);
if (A1==1'b0&&A2==1'b1&&A3==1'b0&&A4==1'b1) (B -=> X)=(0, 0);
if (A1==1'b0&&A2==1'b1&&A3==1'b1&&A4==1'b0) (B -=> X)=(0, 0);
if (A1==1'b0&&A2==1'b1&&A3==1'b1&&A4==1'b1) (B -=> X)=(0, 0);
if (A1==1'b1&&A2==1'b0&&A3==1'b0&&A4==1'b0) (B -=> X)=(0, 0);
if (A1==1'b1&&A2==1'b0&&A3==1'b0&&A4==1'b1) (B -=> X)=(0, 0);
if (A1==1'b1&&A2==1'b0&&A3==1'b1&&A4==1'b0) (B -=> X)=(0, 0);
if (A1==1'b1&&A2==1'b0&&A3==1'b1&&A4==1'b1) (B -=> X)=(0, 0);
if (A1==1'b1&&A2==1'b1&&A3==1'b0&&A4==1'b0) (B -=> X)=(0, 0);
if (A1==1'b1&&A2==1'b1&&A3==1'b0&&A4==1'b1) (B -=> X)=(0, 0);
if (A1==1'b1&&A2==1'b1&&A3==1'b1&&A4==1'b0) (B -=> X)=(0, 0);
if (A1==1'b1&&A2==1'b1&&A3==1'b1&&B==1'b0) (A4 -=> X)=(0, 0);
if (A1==1'b1&&A2==1'b1&&A4==1'b1&&B==1'b0) (A3 -=> X)=(0, 0);
if (A1==1'b1&&A3==1'b1&&A4==1'b1&&B==1'b0) (A2 -=> X)=(0, 0);
if (A2==1'b1&&A3==1'b1&&A4==1'b1&&B==1'b0) (A1 -=> X)=(0, 0);
endspecify
   `endif

endmodule
`endcelldefine

//%END SVN_AOI41_4

//%BEGIN SVN_BENC_2

`celldefine
module SVN_BENC_2 (S, A, X, M0, M1, M2);
   output S, A, X;
   input M0, M1, M2;

   wire int_res_0, int_res_1, int_res_2, 
      int_res_3, int_res_4;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////

   not (int_res_0, M2);
   or (int_res_1, M1, M0);
   not (int_res_2, M1);
   not (int_res_3, M0);
   or (int_res_4, int_res_2, int_res_3);

   `ifdef VIRL_functiononly
       and #`SNPS_COMBO_DELAY (S, int_res_0, int_res_1);
       and #`SNPS_COMBO_DELAY (A, M2, int_res_4);
       xnor #`SNPS_COMBO_DELAY (X, M1, M0);        
   `else
       and (S, int_res_0, int_res_1);
       and (A, M2, int_res_4);
       xnor (X, M1, M0);        
   `endif

   `ifdef VIRL_functiononly

   `else
   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////


specify
(M0 -=> A)=(0, 0);
(M1 -=> A)=(0, 0);
if ((~(M0) & ~(M1))) (M2 +=> A)=(0, 0);
if ((~(M0) & M1)) (M2 +=> A)=(0, 0);
if ((M0 & ~(M1))) (M2 +=> A)=(0, 0);
(M0 +=> S)=(0, 0);
(M1 +=> S)=(0, 0);
if ((~(M0) & M1)) (M2 -=> S)=(0, 0);
if ((M0 & ~(M1))) (M2 -=> S)=(0, 0);
if ((M0 & M1)) (M2 -=> S)=(0, 0);
if ((~(M1) & ~(M2))) (M0 -=> X)=(0, 0);
if ((~(M1) & M2)) (M0 -=> X)=(0, 0);
if ((M1 & ~(M2))) (M0 +=> X)=(0, 0);
if ((M1 & M2)) (M0 +=> X)=(0, 0);
if ((~(M0) & ~(M2))) (M1 -=> X)=(0, 0);
if ((~(M0) & M2)) (M1 -=> X)=(0, 0);
if ((M0 & ~(M2))) (M1 +=> X)=(0, 0);
if ((M0 & M2)) (M1 +=> X)=(0, 0);
endspecify
   `endif
endmodule
`endcelldefine

//%END SVN_BENC_2

//%BEGIN SVN_BENC_8

`celldefine
module SVN_BENC_8 (S, A, X, M0, M1, M2);
   output S, A, X;
   input M0, M1, M2;

   wire int_res_0, int_res_1, int_res_2, 
      int_res_3, int_res_4;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////

   not (int_res_0, M2);
   or (int_res_1, M1, M0);
   not (int_res_2, M1);
   not (int_res_3, M0);
   or (int_res_4, int_res_2, int_res_3);

   `ifdef VIRL_functiononly
       and #`SNPS_COMBO_DELAY (S, int_res_0, int_res_1);
       and #`SNPS_COMBO_DELAY (A, M2, int_res_4);
       xnor #`SNPS_COMBO_DELAY (X, M1, M0);        
   `else
       and (S, int_res_0, int_res_1);
       and (A, M2, int_res_4);
       xnor (X, M1, M0);        
   `endif

   `ifdef VIRL_functiononly

   `else
   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////


specify
(M0 -=> A)=(0, 0);
(M1 -=> A)=(0, 0);
if ((~(M0) & ~(M1))) (M2 +=> A)=(0, 0);
if ((~(M0) & M1)) (M2 +=> A)=(0, 0);
if ((M0 & ~(M1))) (M2 +=> A)=(0, 0);
(M0 +=> S)=(0, 0);
(M1 +=> S)=(0, 0);
if ((~(M0) & M1)) (M2 -=> S)=(0, 0);
if ((M0 & ~(M1))) (M2 -=> S)=(0, 0);
if ((M0 & M1)) (M2 -=> S)=(0, 0);
if ((~(M1) & ~(M2))) (M0 -=> X)=(0, 0);
if ((~(M1) & M2)) (M0 -=> X)=(0, 0);
if ((M1 & ~(M2))) (M0 +=> X)=(0, 0);
if ((M1 & M2)) (M0 +=> X)=(0, 0);
if ((~(M0) & ~(M2))) (M1 -=> X)=(0, 0);
if ((~(M0) & M2)) (M1 -=> X)=(0, 0);
if ((M0 & ~(M2))) (M1 +=> X)=(0, 0);
if ((M0 & M2)) (M1 +=> X)=(0, 0);
endspecify
   `endif
endmodule
`endcelldefine

//%END SVN_BENC_8

//%BEGIN SVN_BMUX_1

`celldefine
module SVN_BMUX_1 (PP, S, A, X, M0, M1);
   output PP;
   input S, A, X, M0, M1;

   wire int_res_0, int_res_1, int_res__M1,
	int_res_2, int_res_3, int_res__M0;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////

   not (int_res_0, S);
   not (int_res_1, A);
   mux2 (int_res__M1, int_res_1, int_res_0, M1);
   not (int_res_2, S);
   not (int_res_3, A);
   mux2 (int_res__M0, int_res_3, int_res_2, M0);

   `ifdef VIRL_functiononly
       mux2 #`SNPS_COMBO_DELAY (PP, int_res__M0, int_res__M1, X);
   `else
       mux2 (PP, int_res__M0, int_res__M1, X);
   `endif

   `ifdef VIRL_functiononly

   `else
   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////


specify
if ((~(A) & ~(M0) & M1 & S)) (X -=> PP)=(0, 0);
if ((~(A) & M0 & ~(M1) & S)) (X +=> PP)=(0, 0);
if ((A & ~(M0) & M1 & ~(S))) (X +=> PP)=(0, 0);
if ((A & M0 & ~(M1) & ~(S))) (X -=> PP)=(0, 0);
if ((~(A) & ~(M0) & S & ~(X))) (M1 +=> PP)=(0, 0);
if ((~(A) & M0 & S & ~(X))) (M1 +=> PP)=(0, 0);
if ((A & ~(M0) & ~(S) & ~(X))) (M1 -=> PP)=(0, 0);
if ((A & M0 & ~(S) & ~(X))) (M1 -=> PP)=(0, 0);
if ((~(A) & ~(M1) & S & X)) (M0 +=> PP)=(0, 0);
if ((~(A) & M1 & S & X)) (M0 +=> PP)=(0, 0);
if ((A & ~(M1) & ~(S) & X)) (M0 -=> PP)=(0, 0);
if ((A & M1 & ~(S) & X)) (M0 -=> PP)=(0, 0);
if ((~(M0) & ~(M1))) (S -=> PP)=(0, 0);
if ((~(M0) & M1 & X)) (S -=> PP)=(0, 0);
if ((M0 & ~(M1) & ~(X))) (S -=> PP)=(0, 0);
if ((~(M0) & M1 & ~(X))) (A -=> PP)=(0, 0);
if ((M0 & ~(M1) & X)) (A -=> PP)=(0, 0);
if ((M0 & M1)) (A -=> PP)=(0, 0);
endspecify
   `endif
endmodule
`endcelldefine

//%END SVN_BMUX_1

//%BEGIN SVN_BMUXI_1

`celldefine
module SVN_BMUXI_1 (PP, S, A, X, M0, M1);
   output PP;
   input S, A, X, M0, M1;

   wire int_res_0, int_res_1, int_res__M1,
      int_res_2, int_res_3, int_res__M0, int_res_mux1;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////

   not (int_res_0, S);
   not (int_res_1, A);
   mux2 (int_res__M1, int_res_1, int_res_0, M1);
   not (int_res_2, S);
   not (int_res_3, A);
   mux2 (int_res__M0, int_res_3, int_res_2, M0);
   mux2 (int_res_mux1, int_res__M0, int_res__M1, X);

   `ifdef VIRL_functiononly
       not #`SNPS_COMBO_DELAY (PP, int_res_mux1);        
   `else
       not (PP, int_res_mux1);        
   `endif

   `ifdef VIRL_functiononly

   `else
   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////


specify
if ((~(A) & ~(M0) & M1 & S)) (X +=> PP)=(0, 0);
if ((~(A) & M0 & ~(M1) & S)) (X -=> PP)=(0, 0);
if ((A & ~(M0) & M1 & ~(S))) (X -=> PP)=(0, 0);
if ((A & M0 & ~(M1) & ~(S))) (X +=> PP)=(0, 0);
if ((~(A) & ~(M0) & S & ~(X))) (M1 -=> PP)=(0, 0);
if ((~(A) & M0 & S & ~(X))) (M1 -=> PP)=(0, 0);
if ((A & ~(M0) & ~(S) & ~(X))) (M1 +=> PP)=(0, 0);
if ((A & M0 & ~(S) & ~(X))) (M1 +=> PP)=(0, 0);
if ((~(A) & ~(M1) & S & X)) (M0 -=> PP)=(0, 0);
if ((~(A) & M1 & S & X)) (M0 -=> PP)=(0, 0);
if ((A & ~(M1) & ~(S) & X)) (M0 +=> PP)=(0, 0);
if ((A & M1 & ~(S) & X)) (M0 +=> PP)=(0, 0);
if ((~(M0) & ~(M1))) (S +=> PP)=(0, 0);
if ((~(M0) & M1 & X)) (S +=> PP)=(0, 0);
if ((M0 & ~(M1) & ~(X))) (S +=> PP)=(0, 0);
if ((~(M0) & M1 & ~(X))) (A +=> PP)=(0, 0);
if ((M0 & ~(M1) & X)) (A +=> PP)=(0, 0);
if ((M0 & M1)) (A +=> PP)=(0, 0);
endspecify
   `endif
endmodule
`endcelldefine

//%END SVN_BMUXI_1

//%BEGIN SVN_BUF_1

`celldefine
module SVN_BUF_1 (X, A);
   output X;
   input A;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////


   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////

   `ifdef VIRL_functiononly
       buf #`SNPS_COMBO_DELAY (X, A);
   `else
       buf (X, A);
   `endif

   `ifdef VIRL_functiononly

   `else

specify
(A +=> X)=(0, 0);
endspecify
   `endif

endmodule
`endcelldefine

//%END SVN_BUF_1

//%BEGIN SVN_BUF_12

`celldefine
module SVN_BUF_12 (X, A);
   output X;
   input A;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////


   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////

   `ifdef VIRL_functiononly
       buf #`SNPS_COMBO_DELAY (X, A);
   `else
       buf (X, A);
   `endif

   `ifdef VIRL_functiononly

   `else

specify
(A +=> X)=(0, 0);
endspecify
   `endif

endmodule
`endcelldefine

//%END SVN_BUF_12

//%BEGIN SVN_BUF_16

`celldefine
module SVN_BUF_16 (X, A);
   output X;
   input A;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////


   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////

   `ifdef VIRL_functiononly
       buf #`SNPS_COMBO_DELAY (X, A);
   `else
       buf (X, A);
   `endif

   `ifdef VIRL_functiononly

   `else

specify
(A +=> X)=(0, 0);
endspecify
   `endif

endmodule
`endcelldefine

//%END SVN_BUF_16

//%BEGIN SVN_BUF_2

`celldefine
module SVN_BUF_2 (X, A);
   output X;
   input A;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////


   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////

   `ifdef VIRL_functiononly
       buf #`SNPS_COMBO_DELAY (X, A);
   `else
       buf (X, A);
   `endif

   `ifdef VIRL_functiononly

   `else

specify
(A +=> X)=(0, 0);
endspecify
   `endif

endmodule
`endcelldefine

//%END SVN_BUF_2

//%BEGIN SVN_BUF_24

`celldefine
module SVN_BUF_24 (X, A);
   output X;
   input A;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////


   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////

   `ifdef VIRL_functiononly
       buf #`SNPS_COMBO_DELAY (X, A);
   `else
       buf (X, A);
   `endif

   `ifdef VIRL_functiononly

   `else

specify
(A +=> X)=(0, 0);
endspecify
   `endif

endmodule
`endcelldefine

//%END SVN_BUF_24

//%BEGIN SVN_BUF_3

`celldefine
module SVN_BUF_3 (X, A);
   output X;
   input A;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////


   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////

   `ifdef VIRL_functiononly
       buf #`SNPS_COMBO_DELAY (X, A);
   `else
       buf (X, A);
   `endif

   `ifdef VIRL_functiononly

   `else

specify
(A +=> X)=(0, 0);
endspecify
   `endif

endmodule
`endcelldefine

//%END SVN_BUF_3

//%BEGIN SVN_BUF_4

`celldefine
module SVN_BUF_4 (X, A);
   output X;
   input A;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////


   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////

   `ifdef VIRL_functiononly
       buf #`SNPS_COMBO_DELAY (X, A);
   `else
       buf (X, A);
   `endif

   `ifdef VIRL_functiononly

   `else

specify
(A +=> X)=(0, 0);
endspecify
   `endif

endmodule
`endcelldefine

//%END SVN_BUF_4

//%BEGIN SVN_BUF_6

`celldefine
module SVN_BUF_6 (X, A);
   output X;
   input A;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////


   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////

   `ifdef VIRL_functiononly
       buf #`SNPS_COMBO_DELAY (X, A);
   `else
       buf (X, A);
   `endif

   `ifdef VIRL_functiononly

   `else

specify
(A +=> X)=(0, 0);
endspecify
   `endif

endmodule
`endcelldefine

//%END SVN_BUF_6

//%BEGIN SVN_BUF_8

`celldefine
module SVN_BUF_8 (X, A);
   output X;
   input A;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////


   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////

   `ifdef VIRL_functiononly
       buf #`SNPS_COMBO_DELAY (X, A);
   `else
       buf (X, A);
   `endif

   `ifdef VIRL_functiononly

   `else

specify
(A +=> X)=(0, 0);
endspecify
   `endif

endmodule
`endcelldefine

//%END SVN_BUF_8

//%BEGIN SVN_BUF_AS_1

`celldefine
module SVN_BUF_AS_1 (X, A);
   output X;
   input A;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////


   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////

   `ifdef VIRL_functiononly
       buf #`SNPS_COMBO_DELAY (X, A);
   `else
       buf (X, A);
   `endif

   `ifdef VIRL_functiononly

   `else

specify
(A +=> X)=(0, 0);
endspecify
   `endif

endmodule
`endcelldefine

//%END SVN_BUF_AS_1

//%BEGIN SVN_BUF_AS_12

`celldefine
module SVN_BUF_AS_12 (X, A);
   output X;
   input A;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////


   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////

   `ifdef VIRL_functiononly
       buf #`SNPS_COMBO_DELAY (X, A);
   `else
       buf (X, A);
   `endif

   `ifdef VIRL_functiononly

   `else

specify
(A +=> X)=(0, 0);
endspecify
   `endif

endmodule
`endcelldefine

//%END SVN_BUF_AS_12

//%BEGIN SVN_BUF_AS_16

`celldefine
module SVN_BUF_AS_16 (X, A);
   output X;
   input A;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////


   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////

   `ifdef VIRL_functiononly
       buf #`SNPS_COMBO_DELAY (X, A);
   `else
       buf (X, A);
   `endif

   `ifdef VIRL_functiononly

   `else

specify
(A +=> X)=(0, 0);
endspecify
   `endif

endmodule
`endcelldefine

//%END SVN_BUF_AS_16

//%BEGIN SVN_BUF_AS_2

`celldefine
module SVN_BUF_AS_2 (X, A);
   output X;
   input A;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////


   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////

   `ifdef VIRL_functiononly
       buf #`SNPS_COMBO_DELAY (X, A);
   `else
       buf (X, A);
   `endif

   `ifdef VIRL_functiononly

   `else

specify
(A +=> X)=(0, 0);
endspecify
   `endif

endmodule
`endcelldefine

//%END SVN_BUF_AS_2

//%BEGIN SVN_BUF_AS_3

`celldefine
module SVN_BUF_AS_3 (X, A);
   output X;
   input A;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////


   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////

   `ifdef VIRL_functiononly
       buf #`SNPS_COMBO_DELAY (X, A);
   `else
       buf (X, A);
   `endif

   `ifdef VIRL_functiononly

   `else

specify
(A +=> X)=(0, 0);
endspecify
   `endif

endmodule
`endcelldefine

//%END SVN_BUF_AS_3

//%BEGIN SVN_BUF_AS_4

`celldefine
module SVN_BUF_AS_4 (X, A);
   output X;
   input A;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////


   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////

   `ifdef VIRL_functiononly
       buf #`SNPS_COMBO_DELAY (X, A);
   `else
       buf (X, A);
   `endif

   `ifdef VIRL_functiononly

   `else

specify
(A +=> X)=(0, 0);
endspecify
   `endif

endmodule
`endcelldefine

//%END SVN_BUF_AS_4

//%BEGIN SVN_BUF_AS_6

`celldefine
module SVN_BUF_AS_6 (X, A);
   output X;
   input A;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////


   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////

   `ifdef VIRL_functiononly
       buf #`SNPS_COMBO_DELAY (X, A);
   `else
       buf (X, A);
   `endif

   `ifdef VIRL_functiononly

   `else

specify
(A +=> X)=(0, 0);
endspecify
   `endif

endmodule
`endcelldefine

//%END SVN_BUF_AS_6

//%BEGIN SVN_BUF_AS_8

`celldefine
module SVN_BUF_AS_8 (X, A);
   output X;
   input A;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////


   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////

   `ifdef VIRL_functiononly
       buf #`SNPS_COMBO_DELAY (X, A);
   `else
       buf (X, A);
   `endif

   `ifdef VIRL_functiononly

   `else

specify
(A +=> X)=(0, 0);
endspecify
   `endif

endmodule
`endcelldefine

//%END SVN_BUF_AS_8

//%BEGIN SVN_BUF_S_1

`celldefine
module SVN_BUF_S_1 (X, A);
   output X;
   input A;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////


   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////

   `ifdef VIRL_functiononly
       buf #`SNPS_COMBO_DELAY (X, A);
   `else
       buf (X, A);
   `endif

   `ifdef VIRL_functiononly

   `else

specify
(A +=> X)=(0, 0);
endspecify
   `endif

endmodule
`endcelldefine

//%END SVN_BUF_S_1

//%BEGIN SVN_BUF_S_12

`celldefine
module SVN_BUF_S_12 (X, A);
   output X;
   input A;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////


   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////

   `ifdef VIRL_functiononly
       buf #`SNPS_COMBO_DELAY (X, A);
   `else
       buf (X, A);
   `endif

   `ifdef VIRL_functiononly

   `else

specify
(A +=> X)=(0, 0);
endspecify
   `endif

endmodule
`endcelldefine

//%END SVN_BUF_S_12

//%BEGIN SVN_BUF_S_16

`celldefine
module SVN_BUF_S_16 (X, A);
   output X;
   input A;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////


   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////

   `ifdef VIRL_functiononly
       buf #`SNPS_COMBO_DELAY (X, A);
   `else
       buf (X, A);
   `endif

   `ifdef VIRL_functiononly

   `else

specify
(A +=> X)=(0, 0);
endspecify
   `endif

endmodule
`endcelldefine

//%END SVN_BUF_S_16

//%BEGIN SVN_BUF_S_2

`celldefine
module SVN_BUF_S_2 (X, A);
   output X;
   input A;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////


   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////

   `ifdef VIRL_functiononly
       buf #`SNPS_COMBO_DELAY (X, A);
   `else
       buf (X, A);
   `endif

   `ifdef VIRL_functiononly

   `else

specify
(A +=> X)=(0, 0);
endspecify
   `endif

endmodule
`endcelldefine

//%END SVN_BUF_S_2

//%BEGIN SVN_BUF_S_3

`celldefine
module SVN_BUF_S_3 (X, A);
   output X;
   input A;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////


   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////

   `ifdef VIRL_functiononly
       buf #`SNPS_COMBO_DELAY (X, A);
   `else
       buf (X, A);
   `endif

   `ifdef VIRL_functiononly

   `else

specify
(A +=> X)=(0, 0);
endspecify
   `endif

endmodule
`endcelldefine

//%END SVN_BUF_S_3

//%BEGIN SVN_BUF_S_4

`celldefine
module SVN_BUF_S_4 (X, A);
   output X;
   input A;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////


   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////

   `ifdef VIRL_functiononly
       buf #`SNPS_COMBO_DELAY (X, A);
   `else
       buf (X, A);
   `endif

   `ifdef VIRL_functiononly

   `else

specify
(A +=> X)=(0, 0);
endspecify
   `endif

endmodule
`endcelldefine

//%END SVN_BUF_S_4

//%BEGIN SVN_BUF_S_6

`celldefine
module SVN_BUF_S_6 (X, A);
   output X;
   input A;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////


   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////

   `ifdef VIRL_functiononly
       buf #`SNPS_COMBO_DELAY (X, A);
   `else
       buf (X, A);
   `endif

   `ifdef VIRL_functiononly

   `else

specify
(A +=> X)=(0, 0);
endspecify
   `endif

endmodule
`endcelldefine

//%END SVN_BUF_S_6

//%BEGIN SVN_BUF_S_8

`celldefine
module SVN_BUF_S_8 (X, A);
   output X;
   input A;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////


   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////

   `ifdef VIRL_functiononly
       buf #`SNPS_COMBO_DELAY (X, A);
   `else
       buf (X, A);
   `endif

   `ifdef VIRL_functiononly

   `else

specify
(A +=> X)=(0, 0);
endspecify
   `endif

endmodule
`endcelldefine

//%END SVN_BUF_S_8

//%BEGIN SVN_BUFTS_1

`celldefine
module SVN_BUFTS_1 (X, A, EN);
   output X;
   input A, EN;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////

`ifdef VIRL_functiononly
   bufif1  #`SNPS_COMBO_DELAY (X, A, EN);
`else
   bufif1 (X, A, EN);
`endif
`ifdef VIRL_functiononly
`else

   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////


specify
if (A==1'b0) (EN -=> X)=(0, 0);
if (A==1'b1) (EN -=> X)=(0, 0);
if (EN==1'b1) (A +=> X)=(0, 0);
endspecify
`endif
endmodule
`endcelldefine

//%END SVN_BUFTS_1

//%BEGIN SVN_BUFTS_12

`celldefine
module SVN_BUFTS_12 (X, A, EN);
   output X;
   input A, EN;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////

`ifdef VIRL_functiononly
   bufif1  #`SNPS_COMBO_DELAY (X, A, EN);
`else
   bufif1 (X, A, EN);
`endif
`ifdef VIRL_functiononly
`else

   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////


specify
if (A==1'b0) (EN -=> X)=(0, 0);
if (A==1'b1) (EN -=> X)=(0, 0);
if (EN==1'b1) (A +=> X)=(0, 0);
endspecify
`endif
endmodule
`endcelldefine

//%END SVN_BUFTS_12

//%BEGIN SVN_BUFTS_2

`celldefine
module SVN_BUFTS_2 (X, A, EN);
   output X;
   input A, EN;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////

`ifdef VIRL_functiononly
   bufif1  #`SNPS_COMBO_DELAY (X, A, EN);
`else
   bufif1 (X, A, EN);
`endif
`ifdef VIRL_functiononly
`else

   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////


specify
if (A==1'b0) (EN -=> X)=(0, 0);
if (A==1'b1) (EN -=> X)=(0, 0);
if (EN==1'b1) (A +=> X)=(0, 0);
endspecify
`endif
endmodule
`endcelldefine

//%END SVN_BUFTS_2

//%BEGIN SVN_BUFTS_3

`celldefine
module SVN_BUFTS_3 (X, A, EN);
   output X;
   input A, EN;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////

`ifdef VIRL_functiononly
   bufif1  #`SNPS_COMBO_DELAY (X, A, EN);
`else
   bufif1 (X, A, EN);
`endif
`ifdef VIRL_functiononly
`else

   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////


specify
if (A==1'b0) (EN -=> X)=(0, 0);
if (A==1'b1) (EN -=> X)=(0, 0);
if (EN==1'b1) (A +=> X)=(0, 0);
endspecify
`endif
endmodule
`endcelldefine

//%END SVN_BUFTS_3

//%BEGIN SVN_BUFTS_4

`celldefine
module SVN_BUFTS_4 (X, A, EN);
   output X;
   input A, EN;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////

`ifdef VIRL_functiononly
   bufif1  #`SNPS_COMBO_DELAY (X, A, EN);
`else
   bufif1 (X, A, EN);
`endif
`ifdef VIRL_functiononly
`else

   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////


specify
if (A==1'b0) (EN -=> X)=(0, 0);
if (A==1'b1) (EN -=> X)=(0, 0);
if (EN==1'b1) (A +=> X)=(0, 0);
endspecify
`endif
endmodule
`endcelldefine

//%END SVN_BUFTS_4

//%BEGIN SVN_BUFTS_6

`celldefine
module SVN_BUFTS_6 (X, A, EN);
   output X;
   input A, EN;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////

`ifdef VIRL_functiononly
   bufif1  #`SNPS_COMBO_DELAY (X, A, EN);
`else
   bufif1 (X, A, EN);
`endif
`ifdef VIRL_functiononly
`else

   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////


specify
if (A==1'b0) (EN -=> X)=(0, 0);
if (A==1'b1) (EN -=> X)=(0, 0);
if (EN==1'b1) (A +=> X)=(0, 0);
endspecify
`endif
endmodule
`endcelldefine

//%END SVN_BUFTS_6

//%BEGIN SVN_BUFTS_8

`celldefine
module SVN_BUFTS_8 (X, A, EN);
   output X;
   input A, EN;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////

`ifdef VIRL_functiononly
   bufif1  #`SNPS_COMBO_DELAY (X, A, EN);
`else
   bufif1 (X, A, EN);
`endif
`ifdef VIRL_functiononly
`else

   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////


specify
if (A==1'b0) (EN -=> X)=(0, 0);
if (A==1'b1) (EN -=> X)=(0, 0);
if (EN==1'b1) (A +=> X)=(0, 0);
endspecify
`endif
endmodule
`endcelldefine

//%END SVN_BUFTS_8

//%BEGIN SVN_CKGTPLS_1

`celldefine
module SVN_CKGTPLS_1 (Q, CK, EN, SE);
   output Q;
   input CK, EN, SE;

   reg viol_0;
   wire delayed_CK, delayed_EN, delayed_SE;

   wire int_res__CK, int_res_postctrl, int_res_iq;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////

`ifdef _fv
   buf (delayed_CK, CK);
   buf (delayed_EN, EN);
`endif
   buf (delayed_SE, SE);

   not (int_res__CK, delayed_CK);
   latch (int_res_iq, viol_0, int_res__CK, delayed_EN);
   or (int_res_postctrl, int_res_iq, delayed_SE);

   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////
   `ifdef VIRL_functiononly
      and #`SNPS_CKGT_DELAY (Q, int_res_postctrl, delayed_CK);
   `else
      and (Q, int_res_postctrl, delayed_CK);
   `endif

   `ifdef VIRL_functiononly

   `else

not U0 (_net_0, SE);
not U1 (_net_1, EN);
and U2 (cond3, _net_0, _net_1);
not U3 (_net_2, EN);
and U4 (cond2, SE, _net_2);
not U5 (_net_3, SE);
and U6 (cond0, _net_3, EN);
and U7 (cond1, SE, EN);

specify
if ((~(EN) & ~(SE))) (negedge CK => (Q +: 1'b0))=(0, 0);
if ((~(EN) & SE)) (CK +=> Q)=(0, 0);
if ((EN & ~(SE))) (CK +=> Q)=(0, 0);
if ((EN & SE)) (CK +=> Q)=(0, 0);
(SE +=> Q)=(0, 0);
$width(negedge CK &&& cond3 , 0 ,0, viol_0);
$width(negedge CK &&& cond2 , 0 ,0, viol_0);
$width(negedge CK &&& cond0 , 0 ,0, viol_0);
$width(negedge CK &&& cond1 , 0 ,0, viol_0);
$setuphold(posedge CK &&& ~SE , posedge EN &&& ~SE , 0 ,0, viol_0, , , delayed_CK, delayed_EN);
$setuphold(posedge CK &&& ~SE , negedge EN &&& ~SE , 0 ,0, viol_0, , , delayed_CK, delayed_EN);
$setuphold(posedge CK &&& SE , posedge EN &&& SE , 0 ,0, viol_0, , , delayed_CK, delayed_EN);
$setuphold(posedge CK &&& SE , negedge EN &&& SE , 0 ,0, viol_0, , , delayed_CK, delayed_EN);
$recovery(negedge SE &&& ~EN , posedge CK &&& ~EN , 0 , viol_0);
$hold(negedge CK &&& ~EN , posedge SE &&& ~EN , 0 , viol_0);
$hold(negedge CK &&& EN , posedge SE &&& EN , 0 , viol_0);
endspecify
    `endif

endmodule
`endcelldefine

//%END SVN_CKGTPLS_1

//%BEGIN SVN_CKGTPLS_2

`celldefine
module SVN_CKGTPLS_2 (Q, CK, EN, SE);
   output Q;
   input CK, EN, SE;

   reg viol_0;
   wire delayed_CK, delayed_EN, delayed_SE;

   wire int_res__CK, int_res_postctrl, int_res_iq;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////

`ifdef _fv
   buf (delayed_CK, CK);
   buf (delayed_EN, EN);
`endif
   buf (delayed_SE, SE);

   not (int_res__CK, delayed_CK);
   latch (int_res_iq, viol_0, int_res__CK, delayed_EN);
   or (int_res_postctrl, int_res_iq, delayed_SE);

   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////
   `ifdef VIRL_functiononly
      and #`SNPS_CKGT_DELAY (Q, int_res_postctrl, delayed_CK);
   `else
      and (Q, int_res_postctrl, delayed_CK);
   `endif

   `ifdef VIRL_functiononly

   `else

not U0 (_net_0, SE);
not U1 (_net_1, EN);
and U2 (cond3, _net_0, _net_1);
not U3 (_net_2, EN);
and U4 (cond2, SE, _net_2);
not U5 (_net_3, SE);
and U6 (cond0, _net_3, EN);
and U7 (cond1, SE, EN);

specify
if ((~(EN) & ~(SE))) (negedge CK => (Q +: 1'b0))=(0, 0);
if ((~(EN) & SE)) (CK +=> Q)=(0, 0);
if ((EN & ~(SE))) (CK +=> Q)=(0, 0);
if ((EN & SE)) (CK +=> Q)=(0, 0);
(SE +=> Q)=(0, 0);
$width(negedge CK &&& cond3 , 0 ,0, viol_0);
$width(negedge CK &&& cond2 , 0 ,0, viol_0);
$width(negedge CK &&& cond0 , 0 ,0, viol_0);
$width(negedge CK &&& cond1 , 0 ,0, viol_0);
$setuphold(posedge CK &&& ~SE , posedge EN &&& ~SE , 0 ,0, viol_0, , , delayed_CK, delayed_EN);
$setuphold(posedge CK &&& ~SE , negedge EN &&& ~SE , 0 ,0, viol_0, , , delayed_CK, delayed_EN);
$setuphold(posedge CK &&& SE , posedge EN &&& SE , 0 ,0, viol_0, , , delayed_CK, delayed_EN);
$setuphold(posedge CK &&& SE , negedge EN &&& SE , 0 ,0, viol_0, , , delayed_CK, delayed_EN);
$recovery(negedge SE &&& ~EN , posedge CK &&& ~EN , 0 , viol_0);
$hold(negedge CK &&& ~EN , posedge SE &&& ~EN , 0 , viol_0);
$hold(negedge CK &&& EN , posedge SE &&& EN , 0 , viol_0);
endspecify
    `endif

endmodule
`endcelldefine

//%END SVN_CKGTPLS_2

//%BEGIN SVN_CKGTPLS_3

`celldefine
module SVN_CKGTPLS_3 (Q, CK, EN, SE);
   output Q;
   input CK, EN, SE;

   reg viol_0;
   wire delayed_CK, delayed_EN, delayed_SE;

   wire int_res__CK, int_res_postctrl, int_res_iq;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////

`ifdef _fv
   buf (delayed_CK, CK);
   buf (delayed_EN, EN);
`endif
   buf (delayed_SE, SE);

   not (int_res__CK, delayed_CK);
   latch (int_res_iq, viol_0, int_res__CK, delayed_EN);
   or (int_res_postctrl, int_res_iq, delayed_SE);

   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////
   `ifdef VIRL_functiononly
      and #`SNPS_CKGT_DELAY (Q, int_res_postctrl, delayed_CK);
   `else
      and (Q, int_res_postctrl, delayed_CK);
   `endif

   `ifdef VIRL_functiononly

   `else

not U0 (_net_0, SE);
not U1 (_net_1, EN);
and U2 (cond3, _net_0, _net_1);
not U3 (_net_2, EN);
and U4 (cond2, SE, _net_2);
not U5 (_net_3, SE);
and U6 (cond0, _net_3, EN);
and U7 (cond1, SE, EN);

specify
if ((~(EN) & ~(SE))) (negedge CK => (Q +: 1'b0))=(0, 0);
if ((~(EN) & SE)) (CK +=> Q)=(0, 0);
if ((EN & ~(SE))) (CK +=> Q)=(0, 0);
if ((EN & SE)) (CK +=> Q)=(0, 0);
(SE +=> Q)=(0, 0);
$width(negedge CK &&& cond3 , 0 ,0, viol_0);
$width(negedge CK &&& cond2 , 0 ,0, viol_0);
$width(negedge CK &&& cond0 , 0 ,0, viol_0);
$width(negedge CK &&& cond1 , 0 ,0, viol_0);
$setuphold(posedge CK &&& ~SE , posedge EN &&& ~SE , 0 ,0, viol_0, , , delayed_CK, delayed_EN);
$setuphold(posedge CK &&& ~SE , negedge EN &&& ~SE , 0 ,0, viol_0, , , delayed_CK, delayed_EN);
$setuphold(posedge CK &&& SE , posedge EN &&& SE , 0 ,0, viol_0, , , delayed_CK, delayed_EN);
$setuphold(posedge CK &&& SE , negedge EN &&& SE , 0 ,0, viol_0, , , delayed_CK, delayed_EN);
$recovery(negedge SE &&& ~EN , posedge CK &&& ~EN , 0 , viol_0);
$hold(negedge CK &&& ~EN , posedge SE &&& ~EN , 0 , viol_0);
$hold(negedge CK &&& EN , posedge SE &&& EN , 0 , viol_0);
endspecify
    `endif

endmodule
`endcelldefine

//%END SVN_CKGTPLS_3

//%BEGIN SVN_CKGTPLS_4

`celldefine
module SVN_CKGTPLS_4 (Q, CK, EN, SE);
   output Q;
   input CK, EN, SE;

   reg viol_0;
   wire delayed_CK, delayed_EN, delayed_SE;

   wire int_res__CK, int_res_postctrl, int_res_iq;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////

`ifdef _fv
   buf (delayed_CK, CK);
   buf (delayed_EN, EN);
`endif
   buf (delayed_SE, SE);

   not (int_res__CK, delayed_CK);
   latch (int_res_iq, viol_0, int_res__CK, delayed_EN);
   or (int_res_postctrl, int_res_iq, delayed_SE);

   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////
   `ifdef VIRL_functiononly
      and #`SNPS_CKGT_DELAY (Q, int_res_postctrl, delayed_CK);
   `else
      and (Q, int_res_postctrl, delayed_CK);
   `endif

   `ifdef VIRL_functiononly

   `else

not U0 (_net_0, SE);
not U1 (_net_1, EN);
and U2 (cond3, _net_0, _net_1);
not U3 (_net_2, EN);
and U4 (cond2, SE, _net_2);
not U5 (_net_3, SE);
and U6 (cond0, _net_3, EN);
and U7 (cond1, SE, EN);

specify
if ((~(EN) & ~(SE))) (negedge CK => (Q +: 1'b0))=(0, 0);
if ((~(EN) & SE)) (CK +=> Q)=(0, 0);
if ((EN & ~(SE))) (CK +=> Q)=(0, 0);
if ((EN & SE)) (CK +=> Q)=(0, 0);
(SE +=> Q)=(0, 0);
$width(negedge CK &&& cond3 , 0 ,0, viol_0);
$width(negedge CK &&& cond2 , 0 ,0, viol_0);
$width(negedge CK &&& cond0 , 0 ,0, viol_0);
$width(negedge CK &&& cond1 , 0 ,0, viol_0);
$setuphold(posedge CK &&& ~SE , posedge EN &&& ~SE , 0 ,0, viol_0, , , delayed_CK, delayed_EN);
$setuphold(posedge CK &&& ~SE , negedge EN &&& ~SE , 0 ,0, viol_0, , , delayed_CK, delayed_EN);
$setuphold(posedge CK &&& SE , posedge EN &&& SE , 0 ,0, viol_0, , , delayed_CK, delayed_EN);
$setuphold(posedge CK &&& SE , negedge EN &&& SE , 0 ,0, viol_0, , , delayed_CK, delayed_EN);
$recovery(negedge SE &&& ~EN , posedge CK &&& ~EN , 0 , viol_0);
$hold(negedge CK &&& ~EN , posedge SE &&& ~EN , 0 , viol_0);
$hold(negedge CK &&& EN , posedge SE &&& EN , 0 , viol_0);
endspecify
    `endif

endmodule
`endcelldefine

//%END SVN_CKGTPLS_4

//%BEGIN SVN_CKGTPLS_6

`celldefine
module SVN_CKGTPLS_6 (Q, CK, EN, SE);
   output Q;
   input CK, EN, SE;

   reg viol_0;
   wire delayed_CK, delayed_EN, delayed_SE;

   wire int_res__CK, int_res_postctrl, int_res_iq;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////

`ifdef _fv
   buf (delayed_CK, CK);
   buf (delayed_EN, EN);
`endif
   buf (delayed_SE, SE);

   not (int_res__CK, delayed_CK);
   latch (int_res_iq, viol_0, int_res__CK, delayed_EN);
   or (int_res_postctrl, int_res_iq, delayed_SE);

   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////
   `ifdef VIRL_functiononly
      and #`SNPS_CKGT_DELAY (Q, int_res_postctrl, delayed_CK);
   `else
      and (Q, int_res_postctrl, delayed_CK);
   `endif

   `ifdef VIRL_functiononly

   `else

not U0 (_net_0, SE);
not U1 (_net_1, EN);
and U2 (cond3, _net_0, _net_1);
not U3 (_net_2, EN);
and U4 (cond2, SE, _net_2);
not U5 (_net_3, SE);
and U6 (cond0, _net_3, EN);
and U7 (cond1, SE, EN);

specify
if ((~(EN) & ~(SE))) (negedge CK => (Q +: 1'b0))=(0, 0);
if ((~(EN) & SE)) (CK +=> Q)=(0, 0);
if ((EN & ~(SE))) (CK +=> Q)=(0, 0);
if ((EN & SE)) (CK +=> Q)=(0, 0);
(SE +=> Q)=(0, 0);
$width(negedge CK &&& cond3 , 0 ,0, viol_0);
$width(negedge CK &&& cond2 , 0 ,0, viol_0);
$width(negedge CK &&& cond0 , 0 ,0, viol_0);
$width(negedge CK &&& cond1 , 0 ,0, viol_0);
$setuphold(posedge CK &&& ~SE , posedge EN &&& ~SE , 0 ,0, viol_0, , , delayed_CK, delayed_EN);
$setuphold(posedge CK &&& ~SE , negedge EN &&& ~SE , 0 ,0, viol_0, , , delayed_CK, delayed_EN);
$setuphold(posedge CK &&& SE , posedge EN &&& SE , 0 ,0, viol_0, , , delayed_CK, delayed_EN);
$setuphold(posedge CK &&& SE , negedge EN &&& SE , 0 ,0, viol_0, , , delayed_CK, delayed_EN);
$recovery(negedge SE &&& ~EN , posedge CK &&& ~EN , 0 , viol_0);
$hold(negedge CK &&& ~EN , posedge SE &&& ~EN , 0 , viol_0);
$hold(negedge CK &&& EN , posedge SE &&& EN , 0 , viol_0);
endspecify
    `endif

endmodule
`endcelldefine

//%END SVN_CKGTPLS_6

//%BEGIN SVN_CKGTPLS_8

`celldefine
module SVN_CKGTPLS_8 (Q, CK, EN, SE);
   output Q;
   input CK, EN, SE;

   reg viol_0;
   wire delayed_CK, delayed_EN, delayed_SE;

   wire int_res__CK, int_res_postctrl, int_res_iq;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////

`ifdef _fv
   buf (delayed_CK, CK);
   buf (delayed_EN, EN);
`endif
   buf (delayed_SE, SE);

   not (int_res__CK, delayed_CK);
   latch (int_res_iq, viol_0, int_res__CK, delayed_EN);
   or (int_res_postctrl, int_res_iq, delayed_SE);

   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////
   `ifdef VIRL_functiononly
      and #`SNPS_CKGT_DELAY (Q, int_res_postctrl, delayed_CK);
   `else
      and (Q, int_res_postctrl, delayed_CK);
   `endif

   `ifdef VIRL_functiononly

   `else

not U0 (_net_0, SE);
not U1 (_net_1, EN);
and U2 (cond3, _net_0, _net_1);
not U3 (_net_2, EN);
and U4 (cond2, SE, _net_2);
not U5 (_net_3, SE);
and U6 (cond0, _net_3, EN);
and U7 (cond1, SE, EN);

specify
if ((~(EN) & ~(SE))) (negedge CK => (Q +: 1'b0))=(0, 0);
if ((~(EN) & SE)) (CK +=> Q)=(0, 0);
if ((EN & ~(SE))) (CK +=> Q)=(0, 0);
if ((EN & SE)) (CK +=> Q)=(0, 0);
(SE +=> Q)=(0, 0);
$width(negedge CK &&& cond3 , 0 ,0, viol_0);
$width(negedge CK &&& cond2 , 0 ,0, viol_0);
$width(negedge CK &&& cond0 , 0 ,0, viol_0);
$width(negedge CK &&& cond1 , 0 ,0, viol_0);
$setuphold(posedge CK &&& ~SE , posedge EN &&& ~SE , 0 ,0, viol_0, , , delayed_CK, delayed_EN);
$setuphold(posedge CK &&& ~SE , negedge EN &&& ~SE , 0 ,0, viol_0, , , delayed_CK, delayed_EN);
$setuphold(posedge CK &&& SE , posedge EN &&& SE , 0 ,0, viol_0, , , delayed_CK, delayed_EN);
$setuphold(posedge CK &&& SE , negedge EN &&& SE , 0 ,0, viol_0, , , delayed_CK, delayed_EN);
$recovery(negedge SE &&& ~EN , posedge CK &&& ~EN , 0 , viol_0);
$hold(negedge CK &&& ~EN , posedge SE &&& ~EN , 0 , viol_0);
$hold(negedge CK &&& EN , posedge SE &&& EN , 0 , viol_0);
endspecify
    `endif

endmodule
`endcelldefine

//%END SVN_CKGTPLS_8

//%BEGIN SVN_CKGTPLT_1

`celldefine
module SVN_CKGTPLT_1 (Q, CK, EN, SE);
   output Q;
   input CK, EN, SE;

   reg viol_0;
   wire delayed_CK, delayed_EN, delayed_SE;

   wire int_res__CK, int_res__prectrl, int_res_iq;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////

`ifdef _fv
   buf (delayed_CK, CK);
   buf (delayed_EN, EN);
   buf (delayed_SE, SE);
`endif

   not (int_res__CK, delayed_CK);
   or (int_res__prectrl, delayed_EN, delayed_SE);
   latch (int_res_iq, viol_0, int_res__CK, int_res__prectrl);

   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////
   `ifdef VIRL_functiononly
       and #`SNPS_CKGT_DELAY (Q, int_res_iq, delayed_CK);
   `else
       and (Q, int_res_iq, delayed_CK);
   `endif

   `ifdef VIRL_functiononly

   `else

not U0 (_net_0, SE);
not U1 (_net_1, EN);
and U2 (cond1, _net_0, _net_1);
not U3 (_net_2, EN);
and U4 (_net_3, SE, _net_2);
or U5 (cond0, _net_3, EN);

specify
if ((~(EN) & ~(SE))) (negedge CK => (Q +: 1'b0))=(0, 0);
if ((EN) | (~(EN) & SE)) (CK +=> Q)=(0, 0);
$width(negedge CK &&& cond1 , 0 ,0, viol_0);
$width(negedge CK &&& cond0 , 0 ,0, viol_0);
$setuphold(posedge CK &&& ~SE , posedge EN &&& ~SE , 0 ,0, viol_0, , , delayed_CK, delayed_EN);
$setuphold(posedge CK &&& ~SE , negedge EN &&& ~SE , 0 ,0, viol_0, , , delayed_CK, delayed_EN);
$setuphold(posedge CK &&& ~EN , posedge SE &&& ~EN , 0 ,0, viol_0, , , delayed_CK, delayed_SE);
$setuphold(posedge CK &&& ~EN , negedge SE &&& ~EN , 0 ,0, viol_0, , , delayed_CK, delayed_SE);
endspecify
   `endif

endmodule
`endcelldefine

//%END SVN_CKGTPLT_1

//%BEGIN SVN_CKGTPLT_2

`celldefine
module SVN_CKGTPLT_2 (Q, CK, EN, SE);
   output Q;
   input CK, EN, SE;

   reg viol_0;
   wire delayed_CK, delayed_EN, delayed_SE;

   wire int_res__CK, int_res__prectrl, int_res_iq;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////

`ifdef _fv
   buf (delayed_CK, CK);
   buf (delayed_EN, EN);
   buf (delayed_SE, SE);
`endif

   not (int_res__CK, delayed_CK);
   or (int_res__prectrl, delayed_EN, delayed_SE);
   latch (int_res_iq, viol_0, int_res__CK, int_res__prectrl);

   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////
   `ifdef VIRL_functiononly
       and #`SNPS_CKGT_DELAY (Q, int_res_iq, delayed_CK);
   `else
       and (Q, int_res_iq, delayed_CK);
   `endif

   `ifdef VIRL_functiononly

   `else

not U0 (_net_0, SE);
not U1 (_net_1, EN);
and U2 (cond1, _net_0, _net_1);
not U3 (_net_2, EN);
and U4 (_net_3, SE, _net_2);
or U5 (cond0, _net_3, EN);

specify
if ((~(EN) & ~(SE))) (negedge CK => (Q +: 1'b0))=(0, 0);
if ((EN) | (~(EN) & SE)) (CK +=> Q)=(0, 0);
$width(negedge CK &&& cond1 , 0 ,0, viol_0);
$width(negedge CK &&& cond0 , 0 ,0, viol_0);
$setuphold(posedge CK &&& ~SE , posedge EN &&& ~SE , 0 ,0, viol_0, , , delayed_CK, delayed_EN);
$setuphold(posedge CK &&& ~SE , negedge EN &&& ~SE , 0 ,0, viol_0, , , delayed_CK, delayed_EN);
$setuphold(posedge CK &&& ~EN , posedge SE &&& ~EN , 0 ,0, viol_0, , , delayed_CK, delayed_SE);
$setuphold(posedge CK &&& ~EN , negedge SE &&& ~EN , 0 ,0, viol_0, , , delayed_CK, delayed_SE);
endspecify
   `endif

endmodule
`endcelldefine

//%END SVN_CKGTPLT_2

//%BEGIN SVN_CKGTPLT_3

`celldefine
module SVN_CKGTPLT_3 (Q, CK, EN, SE);
   output Q;
   input CK, EN, SE;

   reg viol_0;
   wire delayed_CK, delayed_EN, delayed_SE;

   wire int_res__CK, int_res__prectrl, int_res_iq;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////

`ifdef _fv
   buf (delayed_CK, CK);
   buf (delayed_EN, EN);
   buf (delayed_SE, SE);
`endif

   not (int_res__CK, delayed_CK);
   or (int_res__prectrl, delayed_EN, delayed_SE);
   latch (int_res_iq, viol_0, int_res__CK, int_res__prectrl);

   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////
   `ifdef VIRL_functiononly
       and #`SNPS_CKGT_DELAY (Q, int_res_iq, delayed_CK);
   `else
       and (Q, int_res_iq, delayed_CK);
   `endif

   `ifdef VIRL_functiononly

   `else

not U0 (_net_0, SE);
not U1 (_net_1, EN);
and U2 (cond1, _net_0, _net_1);
not U3 (_net_2, EN);
and U4 (_net_3, SE, _net_2);
or U5 (cond0, _net_3, EN);

specify
if ((~(EN) & ~(SE))) (negedge CK => (Q +: 1'b0))=(0, 0);
if ((EN) | (~(EN) & SE)) (CK +=> Q)=(0, 0);
$width(negedge CK &&& cond1 , 0 ,0, viol_0);
$width(negedge CK &&& cond0 , 0 ,0, viol_0);
$setuphold(posedge CK &&& ~SE , posedge EN &&& ~SE , 0 ,0, viol_0, , , delayed_CK, delayed_EN);
$setuphold(posedge CK &&& ~SE , negedge EN &&& ~SE , 0 ,0, viol_0, , , delayed_CK, delayed_EN);
$setuphold(posedge CK &&& ~EN , posedge SE &&& ~EN , 0 ,0, viol_0, , , delayed_CK, delayed_SE);
$setuphold(posedge CK &&& ~EN , negedge SE &&& ~EN , 0 ,0, viol_0, , , delayed_CK, delayed_SE);
endspecify
   `endif

endmodule
`endcelldefine

//%END SVN_CKGTPLT_3

//%BEGIN SVN_CKGTPLT_4

`celldefine
module SVN_CKGTPLT_4 (Q, CK, EN, SE);
   output Q;
   input CK, EN, SE;

   reg viol_0;
   wire delayed_CK, delayed_EN, delayed_SE;

   wire int_res__CK, int_res__prectrl, int_res_iq;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////

`ifdef _fv
   buf (delayed_CK, CK);
   buf (delayed_EN, EN);
   buf (delayed_SE, SE);
`endif

   not (int_res__CK, delayed_CK);
   or (int_res__prectrl, delayed_EN, delayed_SE);
   latch (int_res_iq, viol_0, int_res__CK, int_res__prectrl);

   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////
   `ifdef VIRL_functiononly
       and #`SNPS_CKGT_DELAY (Q, int_res_iq, delayed_CK);
   `else
       and (Q, int_res_iq, delayed_CK);
   `endif

   `ifdef VIRL_functiononly

   `else

not U0 (_net_0, SE);
not U1 (_net_1, EN);
and U2 (cond1, _net_0, _net_1);
not U3 (_net_2, EN);
and U4 (_net_3, SE, _net_2);
or U5 (cond0, _net_3, EN);

specify
if ((~(EN) & ~(SE))) (negedge CK => (Q +: 1'b0))=(0, 0);
if ((EN) | (~(EN) & SE)) (CK +=> Q)=(0, 0);
$width(negedge CK &&& cond1 , 0 ,0, viol_0);
$width(negedge CK &&& cond0 , 0 ,0, viol_0);
$setuphold(posedge CK &&& ~SE , posedge EN &&& ~SE , 0 ,0, viol_0, , , delayed_CK, delayed_EN);
$setuphold(posedge CK &&& ~SE , negedge EN &&& ~SE , 0 ,0, viol_0, , , delayed_CK, delayed_EN);
$setuphold(posedge CK &&& ~EN , posedge SE &&& ~EN , 0 ,0, viol_0, , , delayed_CK, delayed_SE);
$setuphold(posedge CK &&& ~EN , negedge SE &&& ~EN , 0 ,0, viol_0, , , delayed_CK, delayed_SE);
endspecify
   `endif

endmodule
`endcelldefine

//%END SVN_CKGTPLT_4

//%BEGIN SVN_CKGTPLT_6

`celldefine
module SVN_CKGTPLT_6 (Q, CK, EN, SE);
   output Q;
   input CK, EN, SE;

   reg viol_0;
   wire delayed_CK, delayed_EN, delayed_SE;

   wire int_res__CK, int_res__prectrl, int_res_iq;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////

`ifdef _fv
   buf (delayed_CK, CK);
   buf (delayed_EN, EN);
   buf (delayed_SE, SE);
`endif

   not (int_res__CK, delayed_CK);
   or (int_res__prectrl, delayed_EN, delayed_SE);
   latch (int_res_iq, viol_0, int_res__CK, int_res__prectrl);

   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////
   `ifdef VIRL_functiononly
       and #`SNPS_CKGT_DELAY (Q, int_res_iq, delayed_CK);
   `else
       and (Q, int_res_iq, delayed_CK);
   `endif

   `ifdef VIRL_functiononly

   `else

not U0 (_net_0, SE);
not U1 (_net_1, EN);
and U2 (cond1, _net_0, _net_1);
not U3 (_net_2, EN);
and U4 (_net_3, SE, _net_2);
or U5 (cond0, _net_3, EN);

specify
if ((~(EN) & ~(SE))) (negedge CK => (Q +: 1'b0))=(0, 0);
if ((EN) | (~(EN) & SE)) (CK +=> Q)=(0, 0);
$width(negedge CK &&& cond1 , 0 ,0, viol_0);
$width(negedge CK &&& cond0 , 0 ,0, viol_0);
$setuphold(posedge CK &&& ~SE , posedge EN &&& ~SE , 0 ,0, viol_0, , , delayed_CK, delayed_EN);
$setuphold(posedge CK &&& ~SE , negedge EN &&& ~SE , 0 ,0, viol_0, , , delayed_CK, delayed_EN);
$setuphold(posedge CK &&& ~EN , posedge SE &&& ~EN , 0 ,0, viol_0, , , delayed_CK, delayed_SE);
$setuphold(posedge CK &&& ~EN , negedge SE &&& ~EN , 0 ,0, viol_0, , , delayed_CK, delayed_SE);
endspecify
   `endif

endmodule
`endcelldefine

//%END SVN_CKGTPLT_6

//%BEGIN SVN_CKGTPLT_8

`celldefine
module SVN_CKGTPLT_8 (Q, CK, EN, SE);
   output Q;
   input CK, EN, SE;

   reg viol_0;
   wire delayed_CK, delayed_EN, delayed_SE;

   wire int_res__CK, int_res__prectrl, int_res_iq;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////

`ifdef _fv
   buf (delayed_CK, CK);
   buf (delayed_EN, EN);
   buf (delayed_SE, SE);
`endif

   not (int_res__CK, delayed_CK);
   or (int_res__prectrl, delayed_EN, delayed_SE);
   latch (int_res_iq, viol_0, int_res__CK, int_res__prectrl);

   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////
   `ifdef VIRL_functiononly
       and #`SNPS_CKGT_DELAY (Q, int_res_iq, delayed_CK);
   `else
       and (Q, int_res_iq, delayed_CK);
   `endif

   `ifdef VIRL_functiononly

   `else

not U0 (_net_0, SE);
not U1 (_net_1, EN);
and U2 (cond1, _net_0, _net_1);
not U3 (_net_2, EN);
and U4 (_net_3, SE, _net_2);
or U5 (cond0, _net_3, EN);

specify
if ((~(EN) & ~(SE))) (negedge CK => (Q +: 1'b0))=(0, 0);
if ((EN) | (~(EN) & SE)) (CK +=> Q)=(0, 0);
$width(negedge CK &&& cond1 , 0 ,0, viol_0);
$width(negedge CK &&& cond0 , 0 ,0, viol_0);
$setuphold(posedge CK &&& ~SE , posedge EN &&& ~SE , 0 ,0, viol_0, , , delayed_CK, delayed_EN);
$setuphold(posedge CK &&& ~SE , negedge EN &&& ~SE , 0 ,0, viol_0, , , delayed_CK, delayed_EN);
$setuphold(posedge CK &&& ~EN , posedge SE &&& ~EN , 0 ,0, viol_0, , , delayed_CK, delayed_SE);
$setuphold(posedge CK &&& ~EN , negedge SE &&& ~EN , 0 ,0, viol_0, , , delayed_CK, delayed_SE);
endspecify
   `endif

endmodule
`endcelldefine

//%END SVN_CKGTPLT_8

//%BEGIN SVN_DEL_R16_1

`celldefine
module SVN_DEL_R16_1 (X, A);
   output X;
   input A;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////

   `ifdef VIRL_functiononly
     buf #`SNPS_COMBO_DELAY (X, A);
   `else
     buf (X, A);
   `endif

   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////

   `ifdef VIRL_functiononly

   `else


specify
(A +=> X)=(0, 0);
endspecify
   `endif

endmodule
`endcelldefine

//%END SVN_DEL_R16_1

//%BEGIN SVN_DEL_R32_1

`celldefine
module SVN_DEL_R32_1 (X, A);
   output X;
   input A;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////

   `ifdef VIRL_functiononly
     buf #`SNPS_COMBO_DELAY (X, A);
   `else
     buf (X, A);
   `endif

   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////

   `ifdef VIRL_functiononly

   `else


specify
(A +=> X)=(0, 0);
endspecify
   `endif

endmodule
`endcelldefine

//%END SVN_DEL_R32_1

//%BEGIN SVN_DEL_R64_1

`celldefine
module SVN_DEL_R64_1 (X, A);
   output X;
   input A;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////

   `ifdef VIRL_functiononly
     buf #`SNPS_COMBO_DELAY (X, A);
   `else
     buf (X, A);
   `endif

   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////

   `ifdef VIRL_functiononly

   `else


specify
(A +=> X)=(0, 0);
endspecify
   `endif

endmodule
`endcelldefine

//%END SVN_DEL_R64_1

//%BEGIN SVN_DEL_R8_1

`celldefine
module SVN_DEL_R8_1 (X, A);
   output X;
   input A;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////

   `ifdef VIRL_functiononly
     buf #`SNPS_COMBO_DELAY (X, A);
   `else
     buf (X, A);
   `endif

   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////

   `ifdef VIRL_functiononly

   `else


specify
(A +=> X)=(0, 0);
endspecify
   `endif

endmodule
`endcelldefine

//%END SVN_DEL_R8_1

//%BEGIN SVN_DEL_R4_1

`celldefine
module SVN_DEL_R4_1 (X, A);
   output X;
   input A;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////

   `ifdef VIRL_functiononly
     buf #`SNPS_COMBO_DELAY (X, A);
   `else
     buf (X, A);
   `endif

   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////

   `ifdef VIRL_functiononly

   `else


specify
(A +=> X)=(0, 0);
endspecify
   `endif

endmodule
`endcelldefine

//%END SVN_DEL_R4_1

//%BEGIN SVN_EN2_0P5

`celldefine
module SVN_EN2_0P5 (X, A1, A2);
   output X;
   input A1, A2;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////


   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////
   `ifdef VIRL_functiononly
       xnor #`SNPS_COMBO_DELAY (X, A1, A2);
   `else
       xnor (X, A1, A2);
   `endif

   `ifdef VIRL_functiononly

   `else


specify
if (~(A1)) (A2 -=> X)=(0, 0);
if (A1) (A2 +=> X)=(0, 0);
if (~(A2)) (A1 -=> X)=(0, 0);
if (A2) (A1 +=> X)=(0, 0);
endspecify
    `endif

endmodule
`endcelldefine

//%END SVN_EN2_0P5

//%BEGIN SVN_EN2_1

`celldefine
module SVN_EN2_1 (X, A1, A2);
   output X;
   input A1, A2;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////


   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////
   `ifdef VIRL_functiononly
       xnor #`SNPS_COMBO_DELAY (X, A1, A2);
   `else
       xnor (X, A1, A2);
   `endif

   `ifdef VIRL_functiononly

   `else


specify
if (~(A1)) (A2 -=> X)=(0, 0);
if (A1) (A2 +=> X)=(0, 0);
if (~(A2)) (A1 -=> X)=(0, 0);
if (A2) (A1 +=> X)=(0, 0);
endspecify
    `endif

endmodule
`endcelldefine

//%END SVN_EN2_1

//%BEGIN SVN_EN2_2

`celldefine
module SVN_EN2_2 (X, A1, A2);
   output X;
   input A1, A2;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////


   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////
   `ifdef VIRL_functiononly
       xnor #`SNPS_COMBO_DELAY (X, A1, A2);
   `else
       xnor (X, A1, A2);
   `endif

   `ifdef VIRL_functiononly

   `else


specify
if (~(A1)) (A2 -=> X)=(0, 0);
if (A1) (A2 +=> X)=(0, 0);
if (~(A2)) (A1 -=> X)=(0, 0);
if (A2) (A1 +=> X)=(0, 0);
endspecify
    `endif

endmodule
`endcelldefine

//%END SVN_EN2_2

//%BEGIN SVN_EN2_3

`celldefine
module SVN_EN2_3 (X, A1, A2);
   output X;
   input A1, A2;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////


   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////
   `ifdef VIRL_functiononly
       xnor #`SNPS_COMBO_DELAY (X, A1, A2);
   `else
       xnor (X, A1, A2);
   `endif

   `ifdef VIRL_functiononly

   `else


specify
if (~(A1)) (A2 -=> X)=(0, 0);
if (A1) (A2 +=> X)=(0, 0);
if (~(A2)) (A1 -=> X)=(0, 0);
if (A2) (A1 +=> X)=(0, 0);
endspecify
    `endif

endmodule
`endcelldefine

//%END SVN_EN2_3

//%BEGIN SVN_EN2_4

`celldefine
module SVN_EN2_4 (X, A1, A2);
   output X;
   input A1, A2;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////


   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////
   `ifdef VIRL_functiononly
       xnor #`SNPS_COMBO_DELAY (X, A1, A2);
   `else
       xnor (X, A1, A2);
   `endif

   `ifdef VIRL_functiononly

   `else


specify
if (~(A1)) (A2 -=> X)=(0, 0);
if (A1) (A2 +=> X)=(0, 0);
if (~(A2)) (A1 -=> X)=(0, 0);
if (A2) (A1 +=> X)=(0, 0);
endspecify
    `endif

endmodule
`endcelldefine

//%END SVN_EN2_4

//%BEGIN SVN_EN3_1

`celldefine
module SVN_EN3_1 (X, A1, A2, A3);
   output X;
   input A1, A2, A3;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////


   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////


   `ifdef VIRL_functiononly
        xnor #`SNPS_COMBO_DELAY (X, A1, A2, A3);
   `else
        xnor (X, A1, A2, A3);
   `endif

   `ifdef VIRL_functiononly

   `else


specify
if ((~(A1) & ~(A2))) (A3 -=> X)=(0, 0);
if ((~(A1) & A2)) (A3 +=> X)=(0, 0);
if ((A1 & ~(A2))) (A3 +=> X)=(0, 0);
if ((A1 & A2)) (A3 -=> X)=(0, 0);
if ((~(A1) & ~(A3))) (A2 -=> X)=(0, 0);
if ((~(A1) & A3)) (A2 +=> X)=(0, 0);
if ((A1 & ~(A3))) (A2 +=> X)=(0, 0);
if ((A1 & A3)) (A2 -=> X)=(0, 0);
if ((~(A2) & ~(A3))) (A1 -=> X)=(0, 0);
if ((~(A2) & A3)) (A1 +=> X)=(0, 0);
if ((A2 & ~(A3))) (A1 +=> X)=(0, 0);
if ((A2 & A3)) (A1 -=> X)=(0, 0);
endspecify
   `endif

endmodule
`endcelldefine

//%END SVN_EN3_1

//%BEGIN SVN_EN3_2

`celldefine
module SVN_EN3_2 (X, A1, A2, A3);
   output X;
   input A1, A2, A3;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////


   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////


   `ifdef VIRL_functiononly
        xnor #`SNPS_COMBO_DELAY (X, A1, A2, A3);
   `else
        xnor (X, A1, A2, A3);
   `endif

   `ifdef VIRL_functiononly

   `else


specify
if ((~(A1) & ~(A2))) (A3 -=> X)=(0, 0);
if ((~(A1) & A2)) (A3 +=> X)=(0, 0);
if ((A1 & ~(A2))) (A3 +=> X)=(0, 0);
if ((A1 & A2)) (A3 -=> X)=(0, 0);
if ((~(A1) & ~(A3))) (A2 -=> X)=(0, 0);
if ((~(A1) & A3)) (A2 +=> X)=(0, 0);
if ((A1 & ~(A3))) (A2 +=> X)=(0, 0);
if ((A1 & A3)) (A2 -=> X)=(0, 0);
if ((~(A2) & ~(A3))) (A1 -=> X)=(0, 0);
if ((~(A2) & A3)) (A1 +=> X)=(0, 0);
if ((A2 & ~(A3))) (A1 +=> X)=(0, 0);
if ((A2 & A3)) (A1 -=> X)=(0, 0);
endspecify
   `endif

endmodule
`endcelldefine

//%END SVN_EN3_2

//%BEGIN SVN_EN3_4

`celldefine
module SVN_EN3_4 (X, A1, A2, A3);
   output X;
   input A1, A2, A3;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////


   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////


   `ifdef VIRL_functiononly
        xnor #`SNPS_COMBO_DELAY (X, A1, A2, A3);
   `else
        xnor (X, A1, A2, A3);
   `endif

   `ifdef VIRL_functiononly

   `else


specify
if ((~(A1) & ~(A2))) (A3 -=> X)=(0, 0);
if ((~(A1) & A2)) (A3 +=> X)=(0, 0);
if ((A1 & ~(A2))) (A3 +=> X)=(0, 0);
if ((A1 & A2)) (A3 -=> X)=(0, 0);
if ((~(A1) & ~(A3))) (A2 -=> X)=(0, 0);
if ((~(A1) & A3)) (A2 +=> X)=(0, 0);
if ((A1 & ~(A3))) (A2 +=> X)=(0, 0);
if ((A1 & A3)) (A2 -=> X)=(0, 0);
if ((~(A2) & ~(A3))) (A1 -=> X)=(0, 0);
if ((~(A2) & A3)) (A1 +=> X)=(0, 0);
if ((A2 & ~(A3))) (A1 +=> X)=(0, 0);
if ((A2 & A3)) (A1 -=> X)=(0, 0);
endspecify
   `endif

endmodule
`endcelldefine

//%END SVN_EN3_4

//%BEGIN SVN_EO2_0P5

`celldefine
module SVN_EO2_0P5 (X, A1, A2);
   output X;
   input A1, A2;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////


   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////

   `ifdef VIRL_functiononly
         xor #`SNPS_COMBO_DELAY (X, A1, A2);
   `else
         xor (X, A1, A2);
   `endif

   `ifdef VIRL_functiononly

   `else


specify
if (~(A1)) (A2 +=> X)=(0, 0);
if (A1) (A2 -=> X)=(0, 0);
if (~(A2)) (A1 +=> X)=(0, 0);
if (A2) (A1 -=> X)=(0, 0);
endspecify
   `endif

endmodule
`endcelldefine

//%END SVN_EO2_0P5

//%BEGIN SVN_EO2_1

`celldefine
module SVN_EO2_1 (X, A1, A2);
   output X;
   input A1, A2;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////


   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////

   `ifdef VIRL_functiononly
         xor #`SNPS_COMBO_DELAY (X, A1, A2);
   `else
         xor (X, A1, A2);
   `endif

   `ifdef VIRL_functiononly

   `else


specify
if (~(A1)) (A2 +=> X)=(0, 0);
if (A1) (A2 -=> X)=(0, 0);
if (~(A2)) (A1 +=> X)=(0, 0);
if (A2) (A1 -=> X)=(0, 0);
endspecify
   `endif

endmodule
`endcelldefine

//%END SVN_EO2_1

//%BEGIN SVN_EO2_2

`celldefine
module SVN_EO2_2 (X, A1, A2);
   output X;
   input A1, A2;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////


   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////

   `ifdef VIRL_functiononly
         xor #`SNPS_COMBO_DELAY (X, A1, A2);
   `else
         xor (X, A1, A2);
   `endif

   `ifdef VIRL_functiononly

   `else


specify
if (~(A1)) (A2 +=> X)=(0, 0);
if (A1) (A2 -=> X)=(0, 0);
if (~(A2)) (A1 +=> X)=(0, 0);
if (A2) (A1 -=> X)=(0, 0);
endspecify
   `endif

endmodule
`endcelldefine

//%END SVN_EO2_2

//%BEGIN SVN_EO2_3

`celldefine
module SVN_EO2_3 (X, A1, A2);
   output X;
   input A1, A2;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////


   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////

   `ifdef VIRL_functiononly
         xor #`SNPS_COMBO_DELAY (X, A1, A2);
   `else
         xor (X, A1, A2);
   `endif

   `ifdef VIRL_functiononly

   `else


specify
if (~(A1)) (A2 +=> X)=(0, 0);
if (A1) (A2 -=> X)=(0, 0);
if (~(A2)) (A1 +=> X)=(0, 0);
if (A2) (A1 -=> X)=(0, 0);
endspecify
   `endif

endmodule
`endcelldefine

//%END SVN_EO2_3

//%BEGIN SVN_EO2_4

`celldefine
module SVN_EO2_4 (X, A1, A2);
   output X;
   input A1, A2;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////


   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////

   `ifdef VIRL_functiononly
         xor #`SNPS_COMBO_DELAY (X, A1, A2);
   `else
         xor (X, A1, A2);
   `endif

   `ifdef VIRL_functiononly

   `else


specify
if (~(A1)) (A2 +=> X)=(0, 0);
if (A1) (A2 -=> X)=(0, 0);
if (~(A2)) (A1 +=> X)=(0, 0);
if (A2) (A1 -=> X)=(0, 0);
endspecify
   `endif

endmodule
`endcelldefine

//%END SVN_EO2_4

//%BEGIN SVN_EO2_S_12

`celldefine
module SVN_EO2_S_12 (X, A1, A2);
   output X;
   input A1, A2;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////


   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////

   `ifdef VIRL_functiononly
         xor #`SNPS_COMBO_DELAY (X, A1, A2);
   `else
         xor (X, A1, A2);
   `endif

   `ifdef VIRL_functiononly

   `else


specify
if (~(A1)) (A2 +=> X)=(0, 0);
if (A1) (A2 -=> X)=(0, 0);
if (~(A2)) (A1 +=> X)=(0, 0);
if (A2) (A1 -=> X)=(0, 0);
endspecify
   `endif

endmodule
`endcelldefine

//%END SVN_EO2_S_12

//%BEGIN SVN_EO2_S_2

`celldefine
module SVN_EO2_S_2 (X, A1, A2);
   output X;
   input A1, A2;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////


   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////

   `ifdef VIRL_functiononly
         xor #`SNPS_COMBO_DELAY (X, A1, A2);
   `else
         xor (X, A1, A2);
   `endif

   `ifdef VIRL_functiononly

   `else


specify
if (~(A1)) (A2 +=> X)=(0, 0);
if (A1) (A2 -=> X)=(0, 0);
if (~(A2)) (A1 +=> X)=(0, 0);
if (A2) (A1 -=> X)=(0, 0);
endspecify
   `endif

endmodule
`endcelldefine

//%END SVN_EO2_S_2

//%BEGIN SVN_EO2_S_4

`celldefine
module SVN_EO2_S_4 (X, A1, A2);
   output X;
   input A1, A2;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////


   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////

   `ifdef VIRL_functiononly
         xor #`SNPS_COMBO_DELAY (X, A1, A2);
   `else
         xor (X, A1, A2);
   `endif

   `ifdef VIRL_functiononly

   `else


specify
if (~(A1)) (A2 +=> X)=(0, 0);
if (A1) (A2 -=> X)=(0, 0);
if (~(A2)) (A1 +=> X)=(0, 0);
if (A2) (A1 -=> X)=(0, 0);
endspecify
   `endif

endmodule
`endcelldefine

//%END SVN_EO2_S_4

//%BEGIN SVN_EO2_S_8

`celldefine
module SVN_EO2_S_8 (X, A1, A2);
   output X;
   input A1, A2;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////


   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////

   `ifdef VIRL_functiononly
         xor #`SNPS_COMBO_DELAY (X, A1, A2);
   `else
         xor (X, A1, A2);
   `endif

   `ifdef VIRL_functiononly

   `else


specify
if (~(A1)) (A2 +=> X)=(0, 0);
if (A1) (A2 -=> X)=(0, 0);
if (~(A2)) (A1 +=> X)=(0, 0);
if (A2) (A1 -=> X)=(0, 0);
endspecify
   `endif

endmodule
`endcelldefine

//%END SVN_EO2_S_8

//%BEGIN SVN_EO3_1

`celldefine
module SVN_EO3_1 (X, A1, A2, A3);
   output X;
   input A1, A2, A3;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////


   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////

   `ifdef VIRL_functiononly
         xor #`SNPS_COMBO_DELAY (X, A1, A2, A3);
   `else
         xor (X, A1, A2, A3);
   `endif

   `ifdef VIRL_functiononly

   `else


specify
if ((~(A1) & ~(A2))) (A3 +=> X)=(0, 0);
if ((~(A1) & A2)) (A3 -=> X)=(0, 0);
if ((A1 & ~(A2))) (A3 -=> X)=(0, 0);
if ((A1 & A2)) (A3 +=> X)=(0, 0);
if ((~(A1) & ~(A3))) (A2 +=> X)=(0, 0);
if ((~(A1) & A3)) (A2 -=> X)=(0, 0);
if ((A1 & ~(A3))) (A2 -=> X)=(0, 0);
if ((A1 & A3)) (A2 +=> X)=(0, 0);
if ((~(A2) & ~(A3))) (A1 +=> X)=(0, 0);
if ((~(A2) & A3)) (A1 -=> X)=(0, 0);
if ((A2 & ~(A3))) (A1 -=> X)=(0, 0);
if ((A2 & A3)) (A1 +=> X)=(0, 0);
endspecify
   `endif

endmodule
`endcelldefine

//%END SVN_EO3_1

//%BEGIN SVN_EO3_2

`celldefine
module SVN_EO3_2 (X, A1, A2, A3);
   output X;
   input A1, A2, A3;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////


   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////

   `ifdef VIRL_functiononly
         xor #`SNPS_COMBO_DELAY (X, A1, A2, A3);
   `else
         xor (X, A1, A2, A3);
   `endif

   `ifdef VIRL_functiononly

   `else


specify
if ((~(A1) & ~(A2))) (A3 +=> X)=(0, 0);
if ((~(A1) & A2)) (A3 -=> X)=(0, 0);
if ((A1 & ~(A2))) (A3 -=> X)=(0, 0);
if ((A1 & A2)) (A3 +=> X)=(0, 0);
if ((~(A1) & ~(A3))) (A2 +=> X)=(0, 0);
if ((~(A1) & A3)) (A2 -=> X)=(0, 0);
if ((A1 & ~(A3))) (A2 -=> X)=(0, 0);
if ((A1 & A3)) (A2 +=> X)=(0, 0);
if ((~(A2) & ~(A3))) (A1 +=> X)=(0, 0);
if ((~(A2) & A3)) (A1 -=> X)=(0, 0);
if ((A2 & ~(A3))) (A1 -=> X)=(0, 0);
if ((A2 & A3)) (A1 +=> X)=(0, 0);
endspecify
   `endif

endmodule
`endcelldefine

//%END SVN_EO3_2

//%BEGIN SVN_EO3_4

`celldefine
module SVN_EO3_4 (X, A1, A2, A3);
   output X;
   input A1, A2, A3;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////


   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////

   `ifdef VIRL_functiononly
         xor #`SNPS_COMBO_DELAY (X, A1, A2, A3);
   `else
         xor (X, A1, A2, A3);
   `endif

   `ifdef VIRL_functiononly

   `else


specify
if ((~(A1) & ~(A2))) (A3 +=> X)=(0, 0);
if ((~(A1) & A2)) (A3 -=> X)=(0, 0);
if ((A1 & ~(A2))) (A3 -=> X)=(0, 0);
if ((A1 & A2)) (A3 +=> X)=(0, 0);
if ((~(A1) & ~(A3))) (A2 +=> X)=(0, 0);
if ((~(A1) & A3)) (A2 -=> X)=(0, 0);
if ((A1 & ~(A3))) (A2 -=> X)=(0, 0);
if ((A1 & A3)) (A2 +=> X)=(0, 0);
if ((~(A2) & ~(A3))) (A1 +=> X)=(0, 0);
if ((~(A2) & A3)) (A1 -=> X)=(0, 0);
if ((A2 & ~(A3))) (A1 -=> X)=(0, 0);
if ((A2 & A3)) (A1 +=> X)=(0, 0);
endspecify
   `endif

endmodule
`endcelldefine

//%END SVN_EO3_4

//%BEGIN SVN_FDNQ_1

`celldefine
module SVN_FDNQ_1 (Q, CK, D);
   output Q;
   input CK, D;

   reg viol_0;
   wire delayed_CK, delayed_D;

   wire int_res__CK, xcr_0;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////

`ifdef _fv
   buf (delayed_CK, CK);
   buf (delayed_D, D);
`endif

   not (int_res__CK, delayed_CK);
   dff_err (xcr_0, int_res__CK, delayed_D);

   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////

   `ifdef VIRL_functiononly
        dff #`SNPS_SEQ_DELAY (Q, viol_0, int_res__CK, delayed_D, xcr_0);
   `else
        dff (Q, viol_0, int_res__CK, delayed_D, xcr_0);
   `endif

   `ifdef VIRL_functiononly

   `else


specify
(negedge CK => (Q : 1'b1))=(0, 0);
$width(posedge CK &&& ~D , 0 ,0, viol_0);
$width(negedge CK &&& ~D , 0 ,0, viol_0);
$width(posedge CK &&& D , 0 ,0, viol_0);
$width(negedge CK &&& D , 0 ,0, viol_0);
$setuphold(negedge CK , posedge D , 0 ,0, viol_0, , , delayed_CK, delayed_D);
$setuphold(negedge CK , negedge D , 0 ,0, viol_0, , , delayed_CK, delayed_D);
endspecify
   `endif

endmodule
`endcelldefine

//%END SVN_FDNQ_1

//%BEGIN SVN_FDNQ_2

`celldefine
module SVN_FDNQ_2 (Q, CK, D);
   output Q;
   input CK, D;

   reg viol_0;
   wire delayed_CK, delayed_D;

   wire int_res__CK, xcr_0;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////

`ifdef _fv
   buf (delayed_CK, CK);
   buf (delayed_D, D);
`endif

   not (int_res__CK, delayed_CK);
   dff_err (xcr_0, int_res__CK, delayed_D);

   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////

   `ifdef VIRL_functiononly
        dff #`SNPS_SEQ_DELAY (Q, viol_0, int_res__CK, delayed_D, xcr_0);
   `else
        dff (Q, viol_0, int_res__CK, delayed_D, xcr_0);
   `endif

   `ifdef VIRL_functiononly

   `else


specify
(negedge CK => (Q : 1'b1))=(0, 0);
$width(posedge CK &&& ~D , 0 ,0, viol_0);
$width(negedge CK &&& ~D , 0 ,0, viol_0);
$width(posedge CK &&& D , 0 ,0, viol_0);
$width(negedge CK &&& D , 0 ,0, viol_0);
$setuphold(negedge CK , posedge D , 0 ,0, viol_0, , , delayed_CK, delayed_D);
$setuphold(negedge CK , negedge D , 0 ,0, viol_0, , , delayed_CK, delayed_D);
endspecify
   `endif

endmodule
`endcelldefine

//%END SVN_FDNQ_2

//%BEGIN SVN_FDNQ_4

`celldefine
module SVN_FDNQ_4 (Q, CK, D);
   output Q;
   input CK, D;

   reg viol_0;
   wire delayed_CK, delayed_D;

   wire int_res__CK, xcr_0;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////

`ifdef _fv
   buf (delayed_CK, CK);
   buf (delayed_D, D);
`endif

   not (int_res__CK, delayed_CK);
   dff_err (xcr_0, int_res__CK, delayed_D);

   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////

   `ifdef VIRL_functiononly
        dff #`SNPS_SEQ_DELAY (Q, viol_0, int_res__CK, delayed_D, xcr_0);
   `else
        dff (Q, viol_0, int_res__CK, delayed_D, xcr_0);
   `endif

   `ifdef VIRL_functiononly

   `else


specify
(negedge CK => (Q : 1'b1))=(0, 0);
$width(posedge CK &&& ~D , 0 ,0, viol_0);
$width(negedge CK &&& ~D , 0 ,0, viol_0);
$width(posedge CK &&& D , 0 ,0, viol_0);
$width(negedge CK &&& D , 0 ,0, viol_0);
$setuphold(negedge CK , posedge D , 0 ,0, viol_0, , , delayed_CK, delayed_D);
$setuphold(negedge CK , negedge D , 0 ,0, viol_0, , , delayed_CK, delayed_D);
endspecify
   `endif

endmodule
`endcelldefine

//%END SVN_FDNQ_4

//%BEGIN SVN_FDNRBQ_1

`celldefine
module SVN_FDNRBQ_1 (Q, CK, D, RD);
   output Q;
   input CK, D, RD;

   reg viol_0;
   wire delayed_CK, delayed_D, delayed_RD;

   wire int_res__CK, int_res__RD, xcr_0;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////

`ifdef _fv
   buf (delayed_CK, CK);
   buf (delayed_D, D);
`endif
   buf (delayed_RD, RD);

   not (int_res__CK, delayed_CK);
   not (int_res__RD, delayed_RD);
   dff_r_err (xcr_0, int_res__CK, delayed_D, int_res__RD);

   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////

   `ifdef VIRL_functiononly
        dff_r #`SNPS_SEQ_DELAY (Q, viol_0, int_res__CK, delayed_D, int_res__RD, xcr_0);
   `else
        dff_r (Q, viol_0, int_res__CK, delayed_D, int_res__RD, xcr_0);
   `endif

   `ifdef VIRL_functiononly

   `else

not U0 (_net_0, D);
and U1 (cond5, RD, _net_0);
and U2 (cond4, RD, D);
not U3 (_net_1, D);
not U4 (_net_2, CK);
and U5 (cond3, _net_1, _net_2);
not U6 (_net_3, CK);
and U7 (cond2, D, _net_3);
not U8 (_net_4, D);
and U9 (cond1, _net_4, CK);
and U10 (cond0, D, CK);

specify
if ((~(CK) & ~(D))) (negedge RD => (Q +: 1'b0))=(0, 0);
if ((~(CK) & D)) (negedge RD => (Q +: 1'b0))=(0, 0);
if ((CK & ~(D))) (negedge RD => (Q +: 1'b0))=(0, 0);
if ((CK & D)) (negedge RD => (Q +: 1'b0))=(0, 0);
(negedge RD => (Q:1'b0))=(0, 0);
(negedge CK => (Q : 1'b1))=(0, 0);
$width(posedge CK &&& cond5 , 0 ,0, viol_0);
$width(negedge CK &&& cond5 , 0 ,0, viol_0);
$width(posedge CK &&& cond4 , 0 ,0, viol_0);
$width(negedge CK &&& cond4 , 0 ,0, viol_0);
$setuphold(negedge CK &&& RD , posedge D &&& RD , 0 ,0, viol_0, , , delayed_CK, delayed_D);
$setuphold(negedge CK &&& RD , negedge D &&& RD , 0 ,0, viol_0, , , delayed_CK, delayed_D);
$width(negedge RD &&& cond3 , 0 ,0, viol_0);
$width(negedge RD &&& cond2 , 0 ,0, viol_0);
$width(negedge RD &&& cond1 , 0 ,0, viol_0);
$width(negedge RD &&& cond0 , 0 ,0, viol_0);
$recovery(posedge RD &&& D , negedge CK &&& D , 0 , viol_0);
$hold(negedge CK &&& D , posedge RD &&& D , 0 , viol_0);
endspecify
   `endif

endmodule
`endcelldefine

//%END SVN_FDNRBQ_1

//%BEGIN SVN_FDNRBQ_2

`celldefine
module SVN_FDNRBQ_2 (Q, CK, D, RD);
   output Q;
   input CK, D, RD;

   reg viol_0;
   wire delayed_CK, delayed_D, delayed_RD;

   wire int_res__CK, int_res__RD, xcr_0;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////

`ifdef _fv
   buf (delayed_CK, CK);
   buf (delayed_D, D);
`endif
   buf (delayed_RD, RD);

   not (int_res__CK, delayed_CK);
   not (int_res__RD, delayed_RD);
   dff_r_err (xcr_0, int_res__CK, delayed_D, int_res__RD);

   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////

   `ifdef VIRL_functiononly
        dff_r #`SNPS_SEQ_DELAY (Q, viol_0, int_res__CK, delayed_D, int_res__RD, xcr_0);
   `else
        dff_r (Q, viol_0, int_res__CK, delayed_D, int_res__RD, xcr_0);
   `endif

   `ifdef VIRL_functiononly

   `else

not U0 (_net_0, D);
and U1 (cond5, RD, _net_0);
and U2 (cond4, RD, D);
not U3 (_net_1, D);
not U4 (_net_2, CK);
and U5 (cond3, _net_1, _net_2);
not U6 (_net_3, CK);
and U7 (cond2, D, _net_3);
not U8 (_net_4, D);
and U9 (cond1, _net_4, CK);
and U10 (cond0, D, CK);

specify
if ((~(CK) & ~(D))) (negedge RD => (Q +: 1'b0))=(0, 0);
if ((~(CK) & D)) (negedge RD => (Q +: 1'b0))=(0, 0);
if ((CK & ~(D))) (negedge RD => (Q +: 1'b0))=(0, 0);
if ((CK & D)) (negedge RD => (Q +: 1'b0))=(0, 0);
(negedge RD => (Q:1'b0))=(0, 0);
(negedge CK => (Q : 1'b1))=(0, 0);
$width(posedge CK &&& cond5 , 0 ,0, viol_0);
$width(negedge CK &&& cond5 , 0 ,0, viol_0);
$width(posedge CK &&& cond4 , 0 ,0, viol_0);
$width(negedge CK &&& cond4 , 0 ,0, viol_0);
$setuphold(negedge CK &&& RD , posedge D &&& RD , 0 ,0, viol_0, , , delayed_CK, delayed_D);
$setuphold(negedge CK &&& RD , negedge D &&& RD , 0 ,0, viol_0, , , delayed_CK, delayed_D);
$width(negedge RD &&& cond3 , 0 ,0, viol_0);
$width(negedge RD &&& cond2 , 0 ,0, viol_0);
$width(negedge RD &&& cond1 , 0 ,0, viol_0);
$width(negedge RD &&& cond0 , 0 ,0, viol_0);
$recovery(posedge RD &&& D , negedge CK &&& D , 0 , viol_0);
$hold(negedge CK &&& D , posedge RD &&& D , 0 , viol_0);
endspecify
   `endif

endmodule
`endcelldefine

//%END SVN_FDNRBQ_2

//%BEGIN SVN_FDNRBQ_4

`celldefine
module SVN_FDNRBQ_4 (Q, CK, D, RD);
   output Q;
   input CK, D, RD;

   reg viol_0;
   wire delayed_CK, delayed_D, delayed_RD;

   wire int_res__CK, int_res__RD, xcr_0;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////

`ifdef _fv
   buf (delayed_CK, CK);
   buf (delayed_D, D);
`endif
   buf (delayed_RD, RD);

   not (int_res__CK, delayed_CK);
   not (int_res__RD, delayed_RD);
   dff_r_err (xcr_0, int_res__CK, delayed_D, int_res__RD);

   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////

   `ifdef VIRL_functiononly
        dff_r #`SNPS_SEQ_DELAY (Q, viol_0, int_res__CK, delayed_D, int_res__RD, xcr_0);
   `else
        dff_r (Q, viol_0, int_res__CK, delayed_D, int_res__RD, xcr_0);
   `endif

   `ifdef VIRL_functiononly

   `else

not U0 (_net_0, D);
and U1 (cond5, RD, _net_0);
and U2 (cond4, RD, D);
not U3 (_net_1, D);
not U4 (_net_2, CK);
and U5 (cond3, _net_1, _net_2);
not U6 (_net_3, CK);
and U7 (cond2, D, _net_3);
not U8 (_net_4, D);
and U9 (cond1, _net_4, CK);
and U10 (cond0, D, CK);

specify
if ((~(CK) & ~(D))) (negedge RD => (Q +: 1'b0))=(0, 0);
if ((~(CK) & D)) (negedge RD => (Q +: 1'b0))=(0, 0);
if ((CK & ~(D))) (negedge RD => (Q +: 1'b0))=(0, 0);
if ((CK & D)) (negedge RD => (Q +: 1'b0))=(0, 0);
(negedge RD => (Q:1'b0))=(0, 0);
(negedge CK => (Q : 1'b1))=(0, 0);
$width(posedge CK &&& cond5 , 0 ,0, viol_0);
$width(negedge CK &&& cond5 , 0 ,0, viol_0);
$width(posedge CK &&& cond4 , 0 ,0, viol_0);
$width(negedge CK &&& cond4 , 0 ,0, viol_0);
$setuphold(negedge CK &&& RD , posedge D &&& RD , 0 ,0, viol_0, , , delayed_CK, delayed_D);
$setuphold(negedge CK &&& RD , negedge D &&& RD , 0 ,0, viol_0, , , delayed_CK, delayed_D);
$width(negedge RD &&& cond3 , 0 ,0, viol_0);
$width(negedge RD &&& cond2 , 0 ,0, viol_0);
$width(negedge RD &&& cond1 , 0 ,0, viol_0);
$width(negedge RD &&& cond0 , 0 ,0, viol_0);
$recovery(posedge RD &&& D , negedge CK &&& D , 0 , viol_0);
$hold(negedge CK &&& D , posedge RD &&& D , 0 , viol_0);
endspecify
   `endif

endmodule
`endcelldefine

//%END SVN_FDNRBQ_4

//%BEGIN SVN_FDNSBQ_1

`celldefine
module SVN_FDNSBQ_1 (Q, CK, D, SD);
   output Q;
   input CK, D, SD;

   reg viol_0;
   wire delayed_CK, delayed_D, delayed_SD;

   wire int_res__CK, int_res__SD, xcr_0;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////

`ifdef _fv
   buf (delayed_CK, CK);
   buf (delayed_D, D);
`endif

   buf (delayed_SD, SD);

   not (int_res__CK, delayed_CK);
   not (int_res__SD, delayed_SD);
   dff_s_err (xcr_0, int_res__CK, delayed_D, int_res__SD);
  
 `ifdef VIRL_functiononly
    dff_s #`SNPS_SEQ_DELAY (Q, viol_0, int_res__CK, delayed_D, int_res__SD, xcr_0);
 `else
    dff_s (Q, viol_0, int_res__CK, delayed_D, int_res__SD, xcr_0);
 `endif

 `ifdef VIRL_functiononly

 `else

   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////

not U0 (_net_0, D);
and U1 (cond3, SD, _net_0);
and U2 (cond2, SD, D);
not U3 (_net_1, D);
and U4 (cond1, _net_1, CK);
and U5 (cond0, D, CK);

specify
if (~(CK)) (negedge SD => (Q -: 1'b1))=(0, 0);
if ((CK & ~(D))) (negedge SD => (Q -: 1'b1))=(0, 0);
if ((CK & D)) (negedge SD => (Q -: 1'b1))=(0, 0);
(negedge SD => (Q:1'b1))=(0, 0);
(negedge CK => (Q : 1'b1))=(0, 0);
$width(posedge CK &&& cond3 , 0 ,0, viol_0);
$width(negedge CK &&& cond3 , 0 ,0, viol_0);
$width(posedge CK &&& cond2 , 0 ,0, viol_0);
$width(negedge CK &&& cond2 , 0 ,0, viol_0);
$setuphold(negedge CK &&& SD , posedge D &&& SD , 0 ,0, viol_0, , , delayed_CK, delayed_D);
$setuphold(negedge CK &&& SD , negedge D &&& SD , 0 ,0, viol_0, , , delayed_CK, delayed_D);
$width(negedge SD &&& ~CK , 0 ,0, viol_0);
$recovery(posedge SD &&& ~D , negedge CK &&& ~D , 0 , viol_0);
$hold(negedge CK &&& ~D , posedge SD &&& ~D , 0 , viol_0);
$width(negedge SD &&& cond1 , 0 ,0, viol_0);
$width(negedge SD &&& cond0 , 0 ,0, viol_0);
endspecify
 `endif
endmodule
`endcelldefine

//%END SVN_FDNSBQ_1
 

//%BEGIN SVN_FDNSBQ_2

`celldefine
module SVN_FDNSBQ_2 (Q, CK, D, SD);
   output Q;
   input CK, D, SD;

   reg viol_0;
   wire delayed_CK, delayed_D, delayed_SD;

   wire int_res__CK, int_res__SD, xcr_0;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////

`ifdef _fv
   buf (delayed_CK, CK);
   buf (delayed_D, D);
`endif

   buf (delayed_SD, SD);

   not (int_res__CK, delayed_CK);
   not (int_res__SD, delayed_SD);
   dff_s_err (xcr_0, int_res__CK, delayed_D, int_res__SD);
  
 `ifdef VIRL_functiononly
    dff_s #`SNPS_SEQ_DELAY (Q, viol_0, int_res__CK, delayed_D, int_res__SD, xcr_0);
 `else
    dff_s (Q, viol_0, int_res__CK, delayed_D, int_res__SD, xcr_0);
 `endif

 `ifdef VIRL_functiononly

 `else

   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////

not U0 (_net_0, D);
and U1 (cond3, SD, _net_0);
and U2 (cond2, SD, D);
not U3 (_net_1, D);
and U4 (cond1, _net_1, CK);
and U5 (cond0, D, CK);

specify
if (~(CK)) (negedge SD => (Q -: 1'b1))=(0, 0);
if ((CK & ~(D))) (negedge SD => (Q -: 1'b1))=(0, 0);
if ((CK & D)) (negedge SD => (Q -: 1'b1))=(0, 0);
(negedge SD => (Q:1'b1))=(0, 0);
(negedge CK => (Q : 1'b1))=(0, 0);
$width(posedge CK &&& cond3 , 0 ,0, viol_0);
$width(negedge CK &&& cond3 , 0 ,0, viol_0);
$width(posedge CK &&& cond2 , 0 ,0, viol_0);
$width(negedge CK &&& cond2 , 0 ,0, viol_0);
$setuphold(negedge CK &&& SD , posedge D &&& SD , 0 ,0, viol_0, , , delayed_CK, delayed_D);
$setuphold(negedge CK &&& SD , negedge D &&& SD , 0 ,0, viol_0, , , delayed_CK, delayed_D);
$width(negedge SD &&& ~CK , 0 ,0, viol_0);
$recovery(posedge SD &&& ~D , negedge CK &&& ~D , 0 , viol_0);
$hold(negedge CK &&& ~D , posedge SD &&& ~D , 0 , viol_0);
$width(negedge SD &&& cond1 , 0 ,0, viol_0);
$width(negedge SD &&& cond0 , 0 ,0, viol_0);
endspecify
 `endif
endmodule
`endcelldefine

//%END SVN_FDNSBQ_2
 

//%BEGIN SVN_FDNSBQ_4

`celldefine
module SVN_FDNSBQ_4 (Q, CK, D, SD);
   output Q;
   input CK, D, SD;

   reg viol_0;
   wire delayed_CK, delayed_D, delayed_SD;

   wire int_res__CK, int_res__SD, xcr_0;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////

`ifdef _fv
   buf (delayed_CK, CK);
   buf (delayed_D, D);
`endif

   buf (delayed_SD, SD);

   not (int_res__CK, delayed_CK);
   not (int_res__SD, delayed_SD);
   dff_s_err (xcr_0, int_res__CK, delayed_D, int_res__SD);
  
 `ifdef VIRL_functiononly
    dff_s #`SNPS_SEQ_DELAY (Q, viol_0, int_res__CK, delayed_D, int_res__SD, xcr_0);
 `else
    dff_s (Q, viol_0, int_res__CK, delayed_D, int_res__SD, xcr_0);
 `endif

 `ifdef VIRL_functiononly

 `else

   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////

not U0 (_net_0, D);
and U1 (cond3, SD, _net_0);
and U2 (cond2, SD, D);
not U3 (_net_1, D);
and U4 (cond1, _net_1, CK);
and U5 (cond0, D, CK);

specify
if (~(CK)) (negedge SD => (Q -: 1'b1))=(0, 0);
if ((CK & ~(D))) (negedge SD => (Q -: 1'b1))=(0, 0);
if ((CK & D)) (negedge SD => (Q -: 1'b1))=(0, 0);
(negedge SD => (Q:1'b1))=(0, 0);
(negedge CK => (Q : 1'b1))=(0, 0);
$width(posedge CK &&& cond3 , 0 ,0, viol_0);
$width(negedge CK &&& cond3 , 0 ,0, viol_0);
$width(posedge CK &&& cond2 , 0 ,0, viol_0);
$width(negedge CK &&& cond2 , 0 ,0, viol_0);
$setuphold(negedge CK &&& SD , posedge D &&& SD , 0 ,0, viol_0, , , delayed_CK, delayed_D);
$setuphold(negedge CK &&& SD , negedge D &&& SD , 0 ,0, viol_0, , , delayed_CK, delayed_D);
$width(negedge SD &&& ~CK , 0 ,0, viol_0);
$recovery(posedge SD &&& ~D , negedge CK &&& ~D , 0 , viol_0);
$hold(negedge CK &&& ~D , posedge SD &&& ~D , 0 , viol_0);
$width(negedge SD &&& cond1 , 0 ,0, viol_0);
$width(negedge SD &&& cond0 , 0 ,0, viol_0);
endspecify
 `endif
endmodule
`endcelldefine

//%END SVN_FDNSBQ_4
 

//%BEGIN SVN_FDP_4

`celldefine
module SVN_FDP_4 (Q, QN, CK, D);
   output Q, QN;
   input CK, D;

   reg viol_0;
   wire delayed_D, delayed_CK;

   wire int_res_iq, xcr_0;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////

`ifdef _fv
   buf (delayed_CK, CK);
   buf (delayed_D, D);
`endif

   dff_err (xcr_0, delayed_CK, delayed_D);
   dff (int_res_iq, viol_0, delayed_CK, delayed_D, xcr_0);
  
`ifdef VIRL_functiononly
   buf #`SNPS_SEQ_DELAY (Q, int_res_iq);
   not #`SNPS_SEQ_DELAY (QN, int_res_iq);
`else
   buf (Q, int_res_iq);
   not (QN, int_res_iq);
`endif

`ifdef VIRL_functiononly

`else

   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////

not U0 (ENABLE_NOT_D, D);
buf U1 (ENABLE_D, D);

specify
if (D==1'b0) (posedge CK => (Q -: 1'b1))=(0, 0);
if (D==1'b1) (posedge CK => (Q +: 1'b1))=(0, 0);
(posedge CK => (Q:1'b1))=(0, 0);
if (D==1'b0) (posedge CK => (QN +: 1'b1))=(0, 0);
if (D==1'b1) (posedge CK => (QN -: 1'b1))=(0, 0);
(posedge CK => (QN:1'b0))=(0, 0);
$width(posedge CK &&& ENABLE_NOT_D , 0 ,0, viol_0);
$width(negedge CK &&& ENABLE_NOT_D , 0 ,0, viol_0);
$width(posedge CK &&& ENABLE_D , 0 ,0, viol_0);
$width(negedge CK &&& ENABLE_D , 0 ,0, viol_0);
$setuphold(posedge CK , posedge D , 0 ,0, viol_0, , , delayed_CK, delayed_D);
$setuphold(posedge CK , negedge D , 0 ,0, viol_0, , , delayed_CK, delayed_D);
endspecify
`endif
endmodule
`endcelldefine

//%END SVN_FDP_4


//%BEGIN SVN_FDP_1

`celldefine
module SVN_FDP_1 (Q, QN, CK, D);
   output Q, QN;
   input CK, D;

   reg viol_0;
   wire delayed_D, delayed_CK;

   wire int_res_iq, xcr_0;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////

`ifdef _fv
   buf (delayed_CK, CK);
   buf (delayed_D, D);
`endif

   dff_err (xcr_0, delayed_CK, delayed_D);
   dff (int_res_iq, viol_0, delayed_CK, delayed_D, xcr_0);
  
`ifdef VIRL_functiononly
   buf #`SNPS_SEQ_DELAY (Q, int_res_iq);
   not #`SNPS_SEQ_DELAY (QN, int_res_iq);
`else
   buf (Q, int_res_iq);
   not (QN, int_res_iq);
`endif

`ifdef VIRL_functiononly

`else

   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////

not U0 (ENABLE_NOT_D, D);
buf U1 (ENABLE_D, D);

specify
if (D==1'b0) (posedge CK => (Q -: 1'b1))=(0, 0);
if (D==1'b1) (posedge CK => (Q +: 1'b1))=(0, 0);
(posedge CK => (Q:1'b1))=(0, 0);
if (D==1'b0) (posedge CK => (QN +: 1'b1))=(0, 0);
if (D==1'b1) (posedge CK => (QN -: 1'b1))=(0, 0);
(posedge CK => (QN:1'b0))=(0, 0);
$width(posedge CK &&& ENABLE_NOT_D , 0 ,0, viol_0);
$width(negedge CK &&& ENABLE_NOT_D , 0 ,0, viol_0);
$width(posedge CK &&& ENABLE_D , 0 ,0, viol_0);
$width(negedge CK &&& ENABLE_D , 0 ,0, viol_0);
$setuphold(posedge CK , posedge D , 0 ,0, viol_0, , , delayed_CK, delayed_D);
$setuphold(posedge CK , negedge D , 0 ,0, viol_0, , , delayed_CK, delayed_D);
endspecify
`endif
endmodule
`endcelldefine

//%END SVN_FDP_1


//%BEGIN SVN_FDP_2

`celldefine
module SVN_FDP_2 (Q, QN, CK, D);
   output Q, QN;
   input CK, D;

   reg viol_0;
   wire delayed_D, delayed_CK;

   wire int_res_iq, xcr_0;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////

`ifdef _fv
   buf (delayed_CK, CK);
   buf (delayed_D, D);
`endif

   dff_err (xcr_0, delayed_CK, delayed_D);
   dff (int_res_iq, viol_0, delayed_CK, delayed_D, xcr_0);
  
`ifdef VIRL_functiononly
   buf #`SNPS_SEQ_DELAY (Q, int_res_iq);
   not #`SNPS_SEQ_DELAY (QN, int_res_iq);
`else
   buf (Q, int_res_iq);
   not (QN, int_res_iq);
`endif

`ifdef VIRL_functiononly

`else

   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////

not U0 (ENABLE_NOT_D, D);
buf U1 (ENABLE_D, D);

specify
if (D==1'b0) (posedge CK => (Q -: 1'b1))=(0, 0);
if (D==1'b1) (posedge CK => (Q +: 1'b1))=(0, 0);
(posedge CK => (Q:1'b1))=(0, 0);
if (D==1'b0) (posedge CK => (QN +: 1'b1))=(0, 0);
if (D==1'b1) (posedge CK => (QN -: 1'b1))=(0, 0);
(posedge CK => (QN:1'b0))=(0, 0);
$width(posedge CK &&& ENABLE_NOT_D , 0 ,0, viol_0);
$width(negedge CK &&& ENABLE_NOT_D , 0 ,0, viol_0);
$width(posedge CK &&& ENABLE_D , 0 ,0, viol_0);
$width(negedge CK &&& ENABLE_D , 0 ,0, viol_0);
$setuphold(posedge CK , posedge D , 0 ,0, viol_0, , , delayed_CK, delayed_D);
$setuphold(posedge CK , negedge D , 0 ,0, viol_0, , , delayed_CK, delayed_D);
endspecify
`endif
endmodule
`endcelldefine

//%END SVN_FDP_2


//%BEGIN SVN_FDPCBQ_1

`celldefine
module SVN_FDPCBQ_1 (Q, CK, D, RS);
   output Q;
   input CK, D, RS;

   reg viol_0;
   wire delayed_CK, delayed_D, delayed_RS;

   wire int_res__D, xcr_0;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////

`ifdef _fv
   buf (delayed_CK, CK);
   buf (delayed_D, D);
   buf (delayed_RS, RS);
`endif


   and (int_res__D, delayed_D, delayed_RS);
   dff_err (xcr_0, delayed_CK, int_res__D);

   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////

   `ifdef VIRL_functiononly
       dff #`SNPS_SEQ_DELAY (Q, viol_0, delayed_CK, int_res__D, xcr_0);
   `else
       dff (Q, viol_0, delayed_CK, int_res__D, xcr_0);
   `endif

   `ifdef VIRL_functiononly

   `else

not U0 (_net_0, D);
not U1 (_net_1, RS);
and U2 (_net_2, _net_1, D);
or U3 (cond1, _net_0, _net_2);
and U4 (cond0, RS, D);

specify
(posedge CK => (Q : 1'b1))=(0, 0);
$width(posedge CK &&& cond1 , 0 ,0, viol_0);
$width(negedge CK &&& cond1 , 0 ,0, viol_0);
$width(posedge CK &&& cond0 , 0 ,0, viol_0);
$width(negedge CK &&& cond0 , 0 ,0, viol_0);
$setuphold(posedge CK &&& RS , posedge D &&& RS , 0 ,0, viol_0, , , delayed_CK, delayed_D);
$setuphold(posedge CK &&& RS , negedge D &&& RS , 0 ,0, viol_0, , , delayed_CK, delayed_D);
$setuphold(posedge CK &&& D , posedge RS &&& D , 0 ,0, viol_0, , , delayed_CK, delayed_RS);
$setuphold(posedge CK &&& D , negedge RS &&& D , 0 ,0, viol_0, , , delayed_CK, delayed_RS);
endspecify
   `endif

endmodule
`endcelldefine

//%END SVN_FDPCBQ_1

//%BEGIN SVN_FDPCBQ_2

`celldefine
module SVN_FDPCBQ_2 (Q, CK, D, RS);
   output Q;
   input CK, D, RS;

   reg viol_0;
   wire delayed_CK, delayed_D, delayed_RS;

   wire int_res__D, xcr_0;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////

`ifdef _fv
   buf (delayed_CK, CK);
   buf (delayed_D, D);
   buf (delayed_RS, RS);
`endif


   and (int_res__D, delayed_D, delayed_RS);
   dff_err (xcr_0, delayed_CK, int_res__D);

   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////

   `ifdef VIRL_functiononly
       dff #`SNPS_SEQ_DELAY (Q, viol_0, delayed_CK, int_res__D, xcr_0);
   `else
       dff (Q, viol_0, delayed_CK, int_res__D, xcr_0);
   `endif

   `ifdef VIRL_functiononly

   `else

not U0 (_net_0, D);
not U1 (_net_1, RS);
and U2 (_net_2, _net_1, D);
or U3 (cond1, _net_0, _net_2);
and U4 (cond0, RS, D);

specify
(posedge CK => (Q : 1'b1))=(0, 0);
$width(posedge CK &&& cond1 , 0 ,0, viol_0);
$width(negedge CK &&& cond1 , 0 ,0, viol_0);
$width(posedge CK &&& cond0 , 0 ,0, viol_0);
$width(negedge CK &&& cond0 , 0 ,0, viol_0);
$setuphold(posedge CK &&& RS , posedge D &&& RS , 0 ,0, viol_0, , , delayed_CK, delayed_D);
$setuphold(posedge CK &&& RS , negedge D &&& RS , 0 ,0, viol_0, , , delayed_CK, delayed_D);
$setuphold(posedge CK &&& D , posedge RS &&& D , 0 ,0, viol_0, , , delayed_CK, delayed_RS);
$setuphold(posedge CK &&& D , negedge RS &&& D , 0 ,0, viol_0, , , delayed_CK, delayed_RS);
endspecify
   `endif

endmodule
`endcelldefine

//%END SVN_FDPCBQ_2

//%BEGIN SVN_FDPCBQ_4

`celldefine
module SVN_FDPCBQ_4 (Q, CK, D, RS);
   output Q;
   input CK, D, RS;

   reg viol_0;
   wire delayed_CK, delayed_D, delayed_RS;

   wire int_res__D, xcr_0;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////

`ifdef _fv
   buf (delayed_CK, CK);
   buf (delayed_D, D);
   buf (delayed_RS, RS);
`endif


   and (int_res__D, delayed_D, delayed_RS);
   dff_err (xcr_0, delayed_CK, int_res__D);

   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////

   `ifdef VIRL_functiononly
       dff #`SNPS_SEQ_DELAY (Q, viol_0, delayed_CK, int_res__D, xcr_0);
   `else
       dff (Q, viol_0, delayed_CK, int_res__D, xcr_0);
   `endif

   `ifdef VIRL_functiononly

   `else

not U0 (_net_0, D);
not U1 (_net_1, RS);
and U2 (_net_2, _net_1, D);
or U3 (cond1, _net_0, _net_2);
and U4 (cond0, RS, D);

specify
(posedge CK => (Q : 1'b1))=(0, 0);
$width(posedge CK &&& cond1 , 0 ,0, viol_0);
$width(negedge CK &&& cond1 , 0 ,0, viol_0);
$width(posedge CK &&& cond0 , 0 ,0, viol_0);
$width(negedge CK &&& cond0 , 0 ,0, viol_0);
$setuphold(posedge CK &&& RS , posedge D &&& RS , 0 ,0, viol_0, , , delayed_CK, delayed_D);
$setuphold(posedge CK &&& RS , negedge D &&& RS , 0 ,0, viol_0, , , delayed_CK, delayed_D);
$setuphold(posedge CK &&& D , posedge RS &&& D , 0 ,0, viol_0, , , delayed_CK, delayed_RS);
$setuphold(posedge CK &&& D , negedge RS &&& D , 0 ,0, viol_0, , , delayed_CK, delayed_RS);
endspecify
   `endif

endmodule
`endcelldefine

//%END SVN_FDPCBQ_4

//%BEGIN SVN_FDPHCBQ_1

`celldefine
module SVN_FDPHCBQ_1 (Q, CK, D, EN, RS);
   output Q;
   input CK, D, EN, RS;

   reg viol_0;
   wire delayed_CK, delayed_D,
	delayed_EN, delayed_RS;

   wire int_res__D, int_res__RS, int_res_iq, xcr_0;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////

`ifdef _fv
   buf (delayed_CK, CK);
   buf (delayed_D, D);
   buf (delayed_EN, EN);
   buf (delayed_RS, RS);
`endif

   mux2 (int_res__D, int_res_iq, delayed_D, delayed_EN);
   and (int_res__RS, int_res__D, delayed_RS);
   dff_err (xcr_0, delayed_CK, int_res__RS);
   dff (int_res_iq, viol_0, delayed_CK, int_res__RS, xcr_0);
   
  `ifdef VIRL_functiononly
      buf #`SNPS_SEQ_DELAY (Q, int_res_iq);
  `else
      buf (Q, int_res_iq);
  `endif

   `ifdef VIRL_functiononly

   `else

   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////

not U0 (_net_0, EN);
not U1 (_net_1, D);
and U2 (cond9, _net_0, _net_1);
not U3 (_net_2, D);
not U4 (_net_3, RS);
and U5 (cond8, EN, _net_2, _net_3);
not U6 (_net_4, EN);
and U7 (cond6, _net_4, D, RS);
not U8 (_net_5, RS);
and U9 (cond7, _net_5, D);
not U10 (_net_6, EN);
and U11 (cond0, RS, _net_6);
not U12 (_net_7, D);
and U13 (cond2, RS, _net_7);
and U14 (cond1, RS, D);
not U15 (_net_8, D);
and U16 (cond5, EN, _net_8);
not U17 (_net_9, EN);
and U18 (cond3, _net_9, D);
and U19 (cond4, EN, D);

specify
(posedge CK => (Q : 1'b1))=(0, 0);
$width(posedge CK &&& cond9 , 0 ,0, viol_0);
$width(negedge CK &&& cond9 , 0 ,0, viol_0);
$width(posedge CK &&& cond8 , 0 ,0, viol_0);
$width(negedge CK &&& cond8 , 0 ,0, viol_0);
$width(posedge CK &&& cond6 , 0 ,0, viol_0);
$width(negedge CK &&& cond6 , 0 ,0, viol_0);
$width(posedge CK &&& cond7 , 0 ,0, viol_0);
$width(negedge CK &&& cond7 , 0 ,0, viol_0);
$setuphold(posedge CK &&& cond0 , posedge D &&& cond0 , 0 ,0, viol_0, , , delayed_CK, delayed_D);
$setuphold(posedge CK &&& cond0 , negedge D &&& cond0 , 0 ,0, viol_0, , , delayed_CK, delayed_D);
$setuphold(posedge CK &&& cond2 , posedge EN &&& cond2 , 0 ,0, viol_0, , , delayed_CK, delayed_EN);
$setuphold(posedge CK &&& cond2 , negedge EN &&& cond2 , 0 ,0, viol_0, , , delayed_CK, delayed_EN);
$setuphold(posedge CK &&& cond1 , posedge EN &&& cond1 , 0 ,0, viol_0, , , delayed_CK, delayed_EN);
$setuphold(posedge CK &&& cond1 , negedge EN &&& cond1 , 0 ,0, viol_0, , , delayed_CK, delayed_EN);
$setuphold(posedge CK &&& cond5 , posedge RS &&& cond5 , 0 ,0, viol_0, , , delayed_CK, delayed_RS);
$setuphold(posedge CK &&& cond5 , negedge RS &&& cond5 , 0 ,0, viol_0, , , delayed_CK, delayed_RS);
$setuphold(posedge CK &&& cond3 , posedge RS &&& cond3 , 0 ,0, viol_0, , , delayed_CK, delayed_RS);
$setuphold(posedge CK &&& cond3 , negedge RS &&& cond3 , 0 ,0, viol_0, , , delayed_CK, delayed_RS);
$setuphold(posedge CK &&& cond4 , posedge RS &&& cond4 , 0 ,0, viol_0, , , delayed_CK, delayed_RS);
$setuphold(posedge CK &&& cond4 , negedge RS &&& cond4 , 0 ,0, viol_0, , , delayed_CK, delayed_RS);
endspecify
   `endif
endmodule
`endcelldefine

//%END SVN_FDPHCBQ_1

//%BEGIN SVN_FDPHCBQ_2

`celldefine
module SVN_FDPHCBQ_2 (Q, CK, D, EN, RS);
   output Q;
   input CK, D, EN, RS;

   reg viol_0;
   wire delayed_CK, delayed_D,
	delayed_EN, delayed_RS;

   wire int_res__D, int_res__RS, int_res_iq, xcr_0;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////

`ifdef _fv
   buf (delayed_CK, CK);
   buf (delayed_D, D);
   buf (delayed_EN, EN);
   buf (delayed_RS, RS);
`endif

   mux2 (int_res__D, int_res_iq, delayed_D, delayed_EN);
   and (int_res__RS, int_res__D, delayed_RS);
   dff_err (xcr_0, delayed_CK, int_res__RS);
   dff (int_res_iq, viol_0, delayed_CK, int_res__RS, xcr_0);
   
  `ifdef VIRL_functiononly
      buf #`SNPS_SEQ_DELAY (Q, int_res_iq);
  `else
      buf (Q, int_res_iq);
  `endif

   `ifdef VIRL_functiononly

   `else

   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////

not U0 (_net_0, EN);
not U1 (_net_1, D);
and U2 (cond9, _net_0, _net_1);
not U3 (_net_2, D);
not U4 (_net_3, RS);
and U5 (cond8, EN, _net_2, _net_3);
not U6 (_net_4, EN);
and U7 (cond6, _net_4, D, RS);
not U8 (_net_5, RS);
and U9 (cond7, _net_5, D);
not U10 (_net_6, EN);
and U11 (cond0, RS, _net_6);
not U12 (_net_7, D);
and U13 (cond2, RS, _net_7);
and U14 (cond1, RS, D);
not U15 (_net_8, D);
and U16 (cond5, EN, _net_8);
not U17 (_net_9, EN);
and U18 (cond3, _net_9, D);
and U19 (cond4, EN, D);

specify
(posedge CK => (Q : 1'b1))=(0, 0);
$width(posedge CK &&& cond9 , 0 ,0, viol_0);
$width(negedge CK &&& cond9 , 0 ,0, viol_0);
$width(posedge CK &&& cond8 , 0 ,0, viol_0);
$width(negedge CK &&& cond8 , 0 ,0, viol_0);
$width(posedge CK &&& cond6 , 0 ,0, viol_0);
$width(negedge CK &&& cond6 , 0 ,0, viol_0);
$width(posedge CK &&& cond7 , 0 ,0, viol_0);
$width(negedge CK &&& cond7 , 0 ,0, viol_0);
$setuphold(posedge CK &&& cond0 , posedge D &&& cond0 , 0 ,0, viol_0, , , delayed_CK, delayed_D);
$setuphold(posedge CK &&& cond0 , negedge D &&& cond0 , 0 ,0, viol_0, , , delayed_CK, delayed_D);
$setuphold(posedge CK &&& cond2 , posedge EN &&& cond2 , 0 ,0, viol_0, , , delayed_CK, delayed_EN);
$setuphold(posedge CK &&& cond2 , negedge EN &&& cond2 , 0 ,0, viol_0, , , delayed_CK, delayed_EN);
$setuphold(posedge CK &&& cond1 , posedge EN &&& cond1 , 0 ,0, viol_0, , , delayed_CK, delayed_EN);
$setuphold(posedge CK &&& cond1 , negedge EN &&& cond1 , 0 ,0, viol_0, , , delayed_CK, delayed_EN);
$setuphold(posedge CK &&& cond5 , posedge RS &&& cond5 , 0 ,0, viol_0, , , delayed_CK, delayed_RS);
$setuphold(posedge CK &&& cond5 , negedge RS &&& cond5 , 0 ,0, viol_0, , , delayed_CK, delayed_RS);
$setuphold(posedge CK &&& cond3 , posedge RS &&& cond3 , 0 ,0, viol_0, , , delayed_CK, delayed_RS);
$setuphold(posedge CK &&& cond3 , negedge RS &&& cond3 , 0 ,0, viol_0, , , delayed_CK, delayed_RS);
$setuphold(posedge CK &&& cond4 , posedge RS &&& cond4 , 0 ,0, viol_0, , , delayed_CK, delayed_RS);
$setuphold(posedge CK &&& cond4 , negedge RS &&& cond4 , 0 ,0, viol_0, , , delayed_CK, delayed_RS);
endspecify
   `endif
endmodule
`endcelldefine

//%END SVN_FDPHCBQ_2

//%BEGIN SVN_FDPHCBQ_4

`celldefine
module SVN_FDPHCBQ_4 (Q, CK, D, EN, RS);
   output Q;
   input CK, D, EN, RS;

   reg viol_0;
   wire delayed_CK, delayed_D,
	delayed_EN, delayed_RS;

   wire int_res__D, int_res__RS, int_res_iq, xcr_0;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////

`ifdef _fv
   buf (delayed_CK, CK);
   buf (delayed_D, D);
   buf (delayed_EN, EN);
   buf (delayed_RS, RS);
`endif

   mux2 (int_res__D, int_res_iq, delayed_D, delayed_EN);
   and (int_res__RS, int_res__D, delayed_RS);
   dff_err (xcr_0, delayed_CK, int_res__RS);
   dff (int_res_iq, viol_0, delayed_CK, int_res__RS, xcr_0);
   
  `ifdef VIRL_functiononly
      buf #`SNPS_SEQ_DELAY (Q, int_res_iq);
  `else
      buf (Q, int_res_iq);
  `endif

   `ifdef VIRL_functiononly

   `else

   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////

not U0 (_net_0, EN);
not U1 (_net_1, D);
and U2 (cond9, _net_0, _net_1);
not U3 (_net_2, D);
not U4 (_net_3, RS);
and U5 (cond8, EN, _net_2, _net_3);
not U6 (_net_4, EN);
and U7 (cond6, _net_4, D, RS);
not U8 (_net_5, RS);
and U9 (cond7, _net_5, D);
not U10 (_net_6, EN);
and U11 (cond0, RS, _net_6);
not U12 (_net_7, D);
and U13 (cond2, RS, _net_7);
and U14 (cond1, RS, D);
not U15 (_net_8, D);
and U16 (cond5, EN, _net_8);
not U17 (_net_9, EN);
and U18 (cond3, _net_9, D);
and U19 (cond4, EN, D);

specify
(posedge CK => (Q : 1'b1))=(0, 0);
$width(posedge CK &&& cond9 , 0 ,0, viol_0);
$width(negedge CK &&& cond9 , 0 ,0, viol_0);
$width(posedge CK &&& cond8 , 0 ,0, viol_0);
$width(negedge CK &&& cond8 , 0 ,0, viol_0);
$width(posedge CK &&& cond6 , 0 ,0, viol_0);
$width(negedge CK &&& cond6 , 0 ,0, viol_0);
$width(posedge CK &&& cond7 , 0 ,0, viol_0);
$width(negedge CK &&& cond7 , 0 ,0, viol_0);
$setuphold(posedge CK &&& cond0 , posedge D &&& cond0 , 0 ,0, viol_0, , , delayed_CK, delayed_D);
$setuphold(posedge CK &&& cond0 , negedge D &&& cond0 , 0 ,0, viol_0, , , delayed_CK, delayed_D);
$setuphold(posedge CK &&& cond2 , posedge EN &&& cond2 , 0 ,0, viol_0, , , delayed_CK, delayed_EN);
$setuphold(posedge CK &&& cond2 , negedge EN &&& cond2 , 0 ,0, viol_0, , , delayed_CK, delayed_EN);
$setuphold(posedge CK &&& cond1 , posedge EN &&& cond1 , 0 ,0, viol_0, , , delayed_CK, delayed_EN);
$setuphold(posedge CK &&& cond1 , negedge EN &&& cond1 , 0 ,0, viol_0, , , delayed_CK, delayed_EN);
$setuphold(posedge CK &&& cond5 , posedge RS &&& cond5 , 0 ,0, viol_0, , , delayed_CK, delayed_RS);
$setuphold(posedge CK &&& cond5 , negedge RS &&& cond5 , 0 ,0, viol_0, , , delayed_CK, delayed_RS);
$setuphold(posedge CK &&& cond3 , posedge RS &&& cond3 , 0 ,0, viol_0, , , delayed_CK, delayed_RS);
$setuphold(posedge CK &&& cond3 , negedge RS &&& cond3 , 0 ,0, viol_0, , , delayed_CK, delayed_RS);
$setuphold(posedge CK &&& cond4 , posedge RS &&& cond4 , 0 ,0, viol_0, , , delayed_CK, delayed_RS);
$setuphold(posedge CK &&& cond4 , negedge RS &&& cond4 , 0 ,0, viol_0, , , delayed_CK, delayed_RS);
endspecify
   `endif
endmodule
`endcelldefine

//%END SVN_FDPHCBQ_4

//%BEGIN SVN_FDPHQ_1

`celldefine
module SVN_FDPHQ_1 (Q, CK, D, EN);
   output Q;
   input CK, D, EN;

   reg viol_0;
   wire delayed_CK, delayed_D, delayed_EN;

   wire int_res__D, int_res_iq, xcr_0;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////

`ifdef _fv
   buf (delayed_CK, CK);
   buf (delayed_D, D);
   buf (delayed_EN, EN);
`endif


   mux2 (int_res__D, int_res_iq, delayed_D, delayed_EN);
   dff_err (xcr_0, delayed_CK, int_res__D);
   dff (int_res_iq, viol_0, delayed_CK, int_res__D, xcr_0);

   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////

   `ifdef VIRL_functiononly

       buf #`SNPS_SEQ_DELAY (Q, int_res_iq);

   `else
       buf (Q, int_res_iq);

   `endif

   `ifdef VIRL_functiononly

   `else

not U0 (_net_0, EN);
not U1 (_net_1, D);
and U2 (cond1, _net_0, _net_1);
not U3 (_net_2, EN);
and U4 (cond0, _net_2, D);

specify
(posedge CK => (Q : 1'b1))=(0, 0);
$width(posedge CK &&& cond1 , 0 ,0, viol_0);
$width(negedge CK &&& cond1 , 0 ,0, viol_0);
$width(posedge CK &&& cond0 , 0 ,0, viol_0);
$width(negedge CK &&& cond0 , 0 ,0, viol_0);
$setuphold(posedge CK &&& ~EN , posedge D &&& ~EN , 0 ,0, viol_0, , , delayed_CK, delayed_D);
$setuphold(posedge CK &&& ~EN , negedge D &&& ~EN , 0 ,0, viol_0, , , delayed_CK, delayed_D);
$setuphold(posedge CK &&& ~D , posedge EN &&& ~D , 0 ,0, viol_0, , , delayed_CK, delayed_EN);
$setuphold(posedge CK &&& ~D , negedge EN &&& ~D , 0 ,0, viol_0, , , delayed_CK, delayed_EN);
$setuphold(posedge CK &&& D , posedge EN &&& D , 0 ,0, viol_0, , , delayed_CK, delayed_EN);
$setuphold(posedge CK &&& D , negedge EN &&& D , 0 ,0, viol_0, , , delayed_CK, delayed_EN);
endspecify
   `endif

endmodule
`endcelldefine

//%END SVN_FDPHQ_1

//%BEGIN SVN_FDPHQ_2

`celldefine
module SVN_FDPHQ_2 (Q, CK, D, EN);
   output Q;
   input CK, D, EN;

   reg viol_0;
   wire delayed_CK, delayed_D, delayed_EN;

   wire int_res__D, int_res_iq, xcr_0;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////

`ifdef _fv
   buf (delayed_CK, CK);
   buf (delayed_D, D);
   buf (delayed_EN, EN);
`endif


   mux2 (int_res__D, int_res_iq, delayed_D, delayed_EN);
   dff_err (xcr_0, delayed_CK, int_res__D);
   dff (int_res_iq, viol_0, delayed_CK, int_res__D, xcr_0);

   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////

   `ifdef VIRL_functiononly

       buf #`SNPS_SEQ_DELAY (Q, int_res_iq);

   `else
       buf (Q, int_res_iq);

   `endif

   `ifdef VIRL_functiononly

   `else

not U0 (_net_0, EN);
not U1 (_net_1, D);
and U2 (cond1, _net_0, _net_1);
not U3 (_net_2, EN);
and U4 (cond0, _net_2, D);

specify
(posedge CK => (Q : 1'b1))=(0, 0);
$width(posedge CK &&& cond1 , 0 ,0, viol_0);
$width(negedge CK &&& cond1 , 0 ,0, viol_0);
$width(posedge CK &&& cond0 , 0 ,0, viol_0);
$width(negedge CK &&& cond0 , 0 ,0, viol_0);
$setuphold(posedge CK &&& ~EN , posedge D &&& ~EN , 0 ,0, viol_0, , , delayed_CK, delayed_D);
$setuphold(posedge CK &&& ~EN , negedge D &&& ~EN , 0 ,0, viol_0, , , delayed_CK, delayed_D);
$setuphold(posedge CK &&& ~D , posedge EN &&& ~D , 0 ,0, viol_0, , , delayed_CK, delayed_EN);
$setuphold(posedge CK &&& ~D , negedge EN &&& ~D , 0 ,0, viol_0, , , delayed_CK, delayed_EN);
$setuphold(posedge CK &&& D , posedge EN &&& D , 0 ,0, viol_0, , , delayed_CK, delayed_EN);
$setuphold(posedge CK &&& D , negedge EN &&& D , 0 ,0, viol_0, , , delayed_CK, delayed_EN);
endspecify
   `endif

endmodule
`endcelldefine

//%END SVN_FDPHQ_2

//%BEGIN SVN_FDPHQ_4

`celldefine
module SVN_FDPHQ_4 (Q, CK, D, EN);
   output Q;
   input CK, D, EN;

   reg viol_0;
   wire delayed_CK, delayed_D, delayed_EN;

   wire int_res__D, int_res_iq, xcr_0;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////

`ifdef _fv
   buf (delayed_CK, CK);
   buf (delayed_D, D);
   buf (delayed_EN, EN);
`endif


   mux2 (int_res__D, int_res_iq, delayed_D, delayed_EN);
   dff_err (xcr_0, delayed_CK, int_res__D);
   dff (int_res_iq, viol_0, delayed_CK, int_res__D, xcr_0);

   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////

   `ifdef VIRL_functiononly

       buf #`SNPS_SEQ_DELAY (Q, int_res_iq);

   `else
       buf (Q, int_res_iq);

   `endif

   `ifdef VIRL_functiononly

   `else

not U0 (_net_0, EN);
not U1 (_net_1, D);
and U2 (cond1, _net_0, _net_1);
not U3 (_net_2, EN);
and U4 (cond0, _net_2, D);

specify
(posedge CK => (Q : 1'b1))=(0, 0);
$width(posedge CK &&& cond1 , 0 ,0, viol_0);
$width(negedge CK &&& cond1 , 0 ,0, viol_0);
$width(posedge CK &&& cond0 , 0 ,0, viol_0);
$width(negedge CK &&& cond0 , 0 ,0, viol_0);
$setuphold(posedge CK &&& ~EN , posedge D &&& ~EN , 0 ,0, viol_0, , , delayed_CK, delayed_D);
$setuphold(posedge CK &&& ~EN , negedge D &&& ~EN , 0 ,0, viol_0, , , delayed_CK, delayed_D);
$setuphold(posedge CK &&& ~D , posedge EN &&& ~D , 0 ,0, viol_0, , , delayed_CK, delayed_EN);
$setuphold(posedge CK &&& ~D , negedge EN &&& ~D , 0 ,0, viol_0, , , delayed_CK, delayed_EN);
$setuphold(posedge CK &&& D , posedge EN &&& D , 0 ,0, viol_0, , , delayed_CK, delayed_EN);
$setuphold(posedge CK &&& D , negedge EN &&& D , 0 ,0, viol_0, , , delayed_CK, delayed_EN);
endspecify
   `endif

endmodule
`endcelldefine

//%END SVN_FDPHQ_4

//%BEGIN SVN_FDPHRBQ_0P5

`celldefine
module SVN_FDPHRBQ_0P5 (Q, CK, D, EN, RD);
   output Q;
   input CK, D, EN, RD;

   reg viol_0;
   wire delayed_CK, delayed_D,
	delayed_EN, delayed_RD;

   wire int_res__D, int_res__RD, int_res_iq, xcr_0;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////

`ifdef _fv
   buf (delayed_CK, CK);
   buf (delayed_D, D);
   buf (delayed_EN, EN);
`endif
 
   buf (delayed_RD, RD);

   mux2 (int_res__D, int_res_iq, delayed_D, delayed_EN);
   not (int_res__RD, delayed_RD);
   dff_r_err (xcr_0, delayed_CK, int_res__D, int_res__RD);
   dff_r (int_res_iq, viol_0, delayed_CK, int_res__D, int_res__RD, xcr_0);
   
  `ifdef VIRL_functiononly
     buf #`SNPS_SEQ_DELAY (Q, int_res_iq);
  `else
     buf (Q, int_res_iq);
  `endif

   `ifdef VIRL_functiononly

   `else

   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////

not U0 (_net_0, EN);
not U1 (_net_1, D);
and U2 (cond12, _net_0, _net_1, RD);
not U3 (_net_2, EN);
and U4 (cond11, _net_2, D, RD);
not U5 (_net_3, EN);
and U6 (cond0, RD, _net_3);
not U7 (_net_4, D);
and U8 (cond2, RD, _net_4);
and U9 (cond1, RD, D);
not U10 (_net_5, D);
not U11 (_net_6, CK);
not U12 (_net_7, EN);
and U13 (cond10, _net_5, _net_6, _net_7);
not U14 (_net_8, D);
not U15 (_net_9, CK);
and U16 (cond9, _net_8, _net_9, EN);
not U17 (_net_10, CK);
not U18 (_net_11, EN);
and U19 (cond8, D, _net_10, _net_11);
not U20 (_net_12, CK);
and U21 (cond7, D, _net_12, EN);
not U22 (_net_13, D);
and U23 (cond6, _net_13, CK, EN);
not U24 (_net_14, EN);
and U25 (cond5, _net_14, CK);
and U26 (cond4, D, CK, EN);
not U27 (_net_15, EN);
and U28 (cond3, _net_15, D);

specify
if ((~(CK) & ~(D) & ~(EN))) (negedge RD => (Q +: 1'b0))=(0, 0);
if ((~(CK) & ~(D) & EN)) (negedge RD => (Q +: 1'b0))=(0, 0);
if ((~(CK) & D & ~(EN))) (negedge RD => (Q +: 1'b0))=(0, 0);
if ((~(CK) & D & EN)) (negedge RD => (Q +: 1'b0))=(0, 0);
if ((CK & ~(D) & EN)) (negedge RD => (Q +: 1'b0))=(0, 0);
if ((CK & ~(EN))) (negedge RD => (Q +: 1'b0))=(0, 0);
if ((CK & D & EN)) (negedge RD => (Q +: 1'b0))=(0, 0);
(negedge RD => (Q:1'b0))=(0, 0);
(posedge CK => (Q : 1'b1))=(0, 0);
$width(posedge CK &&& cond12 , 0 ,0, viol_0);
$width(negedge CK &&& cond12 , 0 ,0, viol_0);
$width(posedge CK &&& cond11 , 0 ,0, viol_0);
$width(negedge CK &&& cond11 , 0 ,0, viol_0);
$setuphold(posedge CK &&& cond0 , posedge D &&& cond0 , 0 ,0, viol_0, , , delayed_CK, delayed_D);
$setuphold(posedge CK &&& cond0 , negedge D &&& cond0 , 0 ,0, viol_0, , , delayed_CK, delayed_D);
$setuphold(posedge CK &&& cond2 , posedge EN &&& cond2 , 0 ,0, viol_0, , , delayed_CK, delayed_EN);
$setuphold(posedge CK &&& cond2 , negedge EN &&& cond2 , 0 ,0, viol_0, , , delayed_CK, delayed_EN);
$setuphold(posedge CK &&& cond1 , posedge EN &&& cond1 , 0 ,0, viol_0, , , delayed_CK, delayed_EN);
$setuphold(posedge CK &&& cond1 , negedge EN &&& cond1 , 0 ,0, viol_0, , , delayed_CK, delayed_EN);
$width(negedge RD &&& cond10 , 0 ,0, viol_0);
$width(negedge RD &&& cond9 , 0 ,0, viol_0);
$width(negedge RD &&& cond8 , 0 ,0, viol_0);
$width(negedge RD &&& cond7 , 0 ,0, viol_0);
$width(negedge RD &&& cond6 , 0 ,0, viol_0);
$width(negedge RD &&& cond5 , 0 ,0, viol_0);
$width(negedge RD &&& cond4 , 0 ,0, viol_0);
$recovery(posedge RD &&& cond3 , posedge CK &&& cond3 , 0 , viol_0);
$hold(posedge CK &&& cond3 , posedge RD &&& cond3 , 0 , viol_0);
endspecify
   `endif
endmodule
`endcelldefine

//%END SVN_FDPHRBQ_0P5
  

//%BEGIN SVN_FDPHRBQ_1

`celldefine
module SVN_FDPHRBQ_1 (Q, CK, D, EN, RD);
   output Q;
   input CK, D, EN, RD;

   reg viol_0;
   wire delayed_CK, delayed_D,
	delayed_EN, delayed_RD;

   wire int_res__D, int_res__RD, int_res_iq, xcr_0;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////

`ifdef _fv
   buf (delayed_CK, CK);
   buf (delayed_D, D);
   buf (delayed_EN, EN);
`endif
 
   buf (delayed_RD, RD);

   mux2 (int_res__D, int_res_iq, delayed_D, delayed_EN);
   not (int_res__RD, delayed_RD);
   dff_r_err (xcr_0, delayed_CK, int_res__D, int_res__RD);
   dff_r (int_res_iq, viol_0, delayed_CK, int_res__D, int_res__RD, xcr_0);
   
  `ifdef VIRL_functiononly
     buf #`SNPS_SEQ_DELAY (Q, int_res_iq);
  `else
     buf (Q, int_res_iq);
  `endif

   `ifdef VIRL_functiononly

   `else

   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////

not U0 (_net_0, EN);
not U1 (_net_1, D);
and U2 (cond12, _net_0, _net_1, RD);
not U3 (_net_2, EN);
and U4 (cond11, _net_2, D, RD);
not U5 (_net_3, EN);
and U6 (cond0, RD, _net_3);
not U7 (_net_4, D);
and U8 (cond2, RD, _net_4);
and U9 (cond1, RD, D);
not U10 (_net_5, D);
not U11 (_net_6, CK);
not U12 (_net_7, EN);
and U13 (cond10, _net_5, _net_6, _net_7);
not U14 (_net_8, D);
not U15 (_net_9, CK);
and U16 (cond9, _net_8, _net_9, EN);
not U17 (_net_10, CK);
not U18 (_net_11, EN);
and U19 (cond8, D, _net_10, _net_11);
not U20 (_net_12, CK);
and U21 (cond7, D, _net_12, EN);
not U22 (_net_13, D);
and U23 (cond6, _net_13, CK, EN);
not U24 (_net_14, EN);
and U25 (cond5, _net_14, CK);
and U26 (cond4, D, CK, EN);
not U27 (_net_15, EN);
and U28 (cond3, _net_15, D);

specify
if ((~(CK) & ~(D) & ~(EN))) (negedge RD => (Q +: 1'b0))=(0, 0);
if ((~(CK) & ~(D) & EN)) (negedge RD => (Q +: 1'b0))=(0, 0);
if ((~(CK) & D & ~(EN))) (negedge RD => (Q +: 1'b0))=(0, 0);
if ((~(CK) & D & EN)) (negedge RD => (Q +: 1'b0))=(0, 0);
if ((CK & ~(D) & EN)) (negedge RD => (Q +: 1'b0))=(0, 0);
if ((CK & ~(EN))) (negedge RD => (Q +: 1'b0))=(0, 0);
if ((CK & D & EN)) (negedge RD => (Q +: 1'b0))=(0, 0);
(negedge RD => (Q:1'b0))=(0, 0);
(posedge CK => (Q : 1'b1))=(0, 0);
$width(posedge CK &&& cond12 , 0 ,0, viol_0);
$width(negedge CK &&& cond12 , 0 ,0, viol_0);
$width(posedge CK &&& cond11 , 0 ,0, viol_0);
$width(negedge CK &&& cond11 , 0 ,0, viol_0);
$setuphold(posedge CK &&& cond0 , posedge D &&& cond0 , 0 ,0, viol_0, , , delayed_CK, delayed_D);
$setuphold(posedge CK &&& cond0 , negedge D &&& cond0 , 0 ,0, viol_0, , , delayed_CK, delayed_D);
$setuphold(posedge CK &&& cond2 , posedge EN &&& cond2 , 0 ,0, viol_0, , , delayed_CK, delayed_EN);
$setuphold(posedge CK &&& cond2 , negedge EN &&& cond2 , 0 ,0, viol_0, , , delayed_CK, delayed_EN);
$setuphold(posedge CK &&& cond1 , posedge EN &&& cond1 , 0 ,0, viol_0, , , delayed_CK, delayed_EN);
$setuphold(posedge CK &&& cond1 , negedge EN &&& cond1 , 0 ,0, viol_0, , , delayed_CK, delayed_EN);
$width(negedge RD &&& cond10 , 0 ,0, viol_0);
$width(negedge RD &&& cond9 , 0 ,0, viol_0);
$width(negedge RD &&& cond8 , 0 ,0, viol_0);
$width(negedge RD &&& cond7 , 0 ,0, viol_0);
$width(negedge RD &&& cond6 , 0 ,0, viol_0);
$width(negedge RD &&& cond5 , 0 ,0, viol_0);
$width(negedge RD &&& cond4 , 0 ,0, viol_0);
$recovery(posedge RD &&& cond3 , posedge CK &&& cond3 , 0 , viol_0);
$hold(posedge CK &&& cond3 , posedge RD &&& cond3 , 0 , viol_0);
endspecify
   `endif
endmodule
`endcelldefine

//%END SVN_FDPHRBQ_1
  

//%BEGIN SVN_FDPHRBQ_2

`celldefine
module SVN_FDPHRBQ_2 (Q, CK, D, EN, RD);
   output Q;
   input CK, D, EN, RD;

   reg viol_0;
   wire delayed_CK, delayed_D,
	delayed_EN, delayed_RD;

   wire int_res__D, int_res__RD, int_res_iq, xcr_0;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////

`ifdef _fv
   buf (delayed_CK, CK);
   buf (delayed_D, D);
   buf (delayed_EN, EN);
`endif
 
   buf (delayed_RD, RD);

   mux2 (int_res__D, int_res_iq, delayed_D, delayed_EN);
   not (int_res__RD, delayed_RD);
   dff_r_err (xcr_0, delayed_CK, int_res__D, int_res__RD);
   dff_r (int_res_iq, viol_0, delayed_CK, int_res__D, int_res__RD, xcr_0);
   
  `ifdef VIRL_functiononly
     buf #`SNPS_SEQ_DELAY (Q, int_res_iq);
  `else
     buf (Q, int_res_iq);
  `endif

   `ifdef VIRL_functiononly

   `else

   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////

not U0 (_net_0, EN);
not U1 (_net_1, D);
and U2 (cond12, _net_0, _net_1, RD);
not U3 (_net_2, EN);
and U4 (cond11, _net_2, D, RD);
not U5 (_net_3, EN);
and U6 (cond0, RD, _net_3);
not U7 (_net_4, D);
and U8 (cond2, RD, _net_4);
and U9 (cond1, RD, D);
not U10 (_net_5, D);
not U11 (_net_6, CK);
not U12 (_net_7, EN);
and U13 (cond10, _net_5, _net_6, _net_7);
not U14 (_net_8, D);
not U15 (_net_9, CK);
and U16 (cond9, _net_8, _net_9, EN);
not U17 (_net_10, CK);
not U18 (_net_11, EN);
and U19 (cond8, D, _net_10, _net_11);
not U20 (_net_12, CK);
and U21 (cond7, D, _net_12, EN);
not U22 (_net_13, D);
and U23 (cond6, _net_13, CK, EN);
not U24 (_net_14, EN);
and U25 (cond5, _net_14, CK);
and U26 (cond4, D, CK, EN);
not U27 (_net_15, EN);
and U28 (cond3, _net_15, D);

specify
if ((~(CK) & ~(D) & ~(EN))) (negedge RD => (Q +: 1'b0))=(0, 0);
if ((~(CK) & ~(D) & EN)) (negedge RD => (Q +: 1'b0))=(0, 0);
if ((~(CK) & D & ~(EN))) (negedge RD => (Q +: 1'b0))=(0, 0);
if ((~(CK) & D & EN)) (negedge RD => (Q +: 1'b0))=(0, 0);
if ((CK & ~(D) & EN)) (negedge RD => (Q +: 1'b0))=(0, 0);
if ((CK & ~(EN))) (negedge RD => (Q +: 1'b0))=(0, 0);
if ((CK & D & EN)) (negedge RD => (Q +: 1'b0))=(0, 0);
(negedge RD => (Q:1'b0))=(0, 0);
(posedge CK => (Q : 1'b1))=(0, 0);
$width(posedge CK &&& cond12 , 0 ,0, viol_0);
$width(negedge CK &&& cond12 , 0 ,0, viol_0);
$width(posedge CK &&& cond11 , 0 ,0, viol_0);
$width(negedge CK &&& cond11 , 0 ,0, viol_0);
$setuphold(posedge CK &&& cond0 , posedge D &&& cond0 , 0 ,0, viol_0, , , delayed_CK, delayed_D);
$setuphold(posedge CK &&& cond0 , negedge D &&& cond0 , 0 ,0, viol_0, , , delayed_CK, delayed_D);
$setuphold(posedge CK &&& cond2 , posedge EN &&& cond2 , 0 ,0, viol_0, , , delayed_CK, delayed_EN);
$setuphold(posedge CK &&& cond2 , negedge EN &&& cond2 , 0 ,0, viol_0, , , delayed_CK, delayed_EN);
$setuphold(posedge CK &&& cond1 , posedge EN &&& cond1 , 0 ,0, viol_0, , , delayed_CK, delayed_EN);
$setuphold(posedge CK &&& cond1 , negedge EN &&& cond1 , 0 ,0, viol_0, , , delayed_CK, delayed_EN);
$width(negedge RD &&& cond10 , 0 ,0, viol_0);
$width(negedge RD &&& cond9 , 0 ,0, viol_0);
$width(negedge RD &&& cond8 , 0 ,0, viol_0);
$width(negedge RD &&& cond7 , 0 ,0, viol_0);
$width(negedge RD &&& cond6 , 0 ,0, viol_0);
$width(negedge RD &&& cond5 , 0 ,0, viol_0);
$width(negedge RD &&& cond4 , 0 ,0, viol_0);
$recovery(posedge RD &&& cond3 , posedge CK &&& cond3 , 0 , viol_0);
$hold(posedge CK &&& cond3 , posedge RD &&& cond3 , 0 , viol_0);
endspecify
   `endif
endmodule
`endcelldefine

//%END SVN_FDPHRBQ_2
  

//%BEGIN SVN_FDPHRBQ_4

`celldefine
module SVN_FDPHRBQ_4 (Q, CK, D, EN, RD);
   output Q;
   input CK, D, EN, RD;

   reg viol_0;
   wire delayed_CK, delayed_D,
	delayed_EN, delayed_RD;

   wire int_res__D, int_res__RD, int_res_iq, xcr_0;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////

`ifdef _fv
   buf (delayed_CK, CK);
   buf (delayed_D, D);
   buf (delayed_EN, EN);
`endif
 
   buf (delayed_RD, RD);

   mux2 (int_res__D, int_res_iq, delayed_D, delayed_EN);
   not (int_res__RD, delayed_RD);
   dff_r_err (xcr_0, delayed_CK, int_res__D, int_res__RD);
   dff_r (int_res_iq, viol_0, delayed_CK, int_res__D, int_res__RD, xcr_0);
   
  `ifdef VIRL_functiononly
     buf #`SNPS_SEQ_DELAY (Q, int_res_iq);
  `else
     buf (Q, int_res_iq);
  `endif

   `ifdef VIRL_functiononly

   `else

   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////

not U0 (_net_0, EN);
not U1 (_net_1, D);
and U2 (cond12, _net_0, _net_1, RD);
not U3 (_net_2, EN);
and U4 (cond11, _net_2, D, RD);
not U5 (_net_3, EN);
and U6 (cond0, RD, _net_3);
not U7 (_net_4, D);
and U8 (cond2, RD, _net_4);
and U9 (cond1, RD, D);
not U10 (_net_5, D);
not U11 (_net_6, CK);
not U12 (_net_7, EN);
and U13 (cond10, _net_5, _net_6, _net_7);
not U14 (_net_8, D);
not U15 (_net_9, CK);
and U16 (cond9, _net_8, _net_9, EN);
not U17 (_net_10, CK);
not U18 (_net_11, EN);
and U19 (cond8, D, _net_10, _net_11);
not U20 (_net_12, CK);
and U21 (cond7, D, _net_12, EN);
not U22 (_net_13, D);
and U23 (cond6, _net_13, CK, EN);
not U24 (_net_14, EN);
and U25 (cond5, _net_14, CK);
and U26 (cond4, D, CK, EN);
not U27 (_net_15, EN);
and U28 (cond3, _net_15, D);

specify
if ((~(CK) & ~(D) & ~(EN))) (negedge RD => (Q +: 1'b0))=(0, 0);
if ((~(CK) & ~(D) & EN)) (negedge RD => (Q +: 1'b0))=(0, 0);
if ((~(CK) & D & ~(EN))) (negedge RD => (Q +: 1'b0))=(0, 0);
if ((~(CK) & D & EN)) (negedge RD => (Q +: 1'b0))=(0, 0);
if ((CK & ~(D) & EN)) (negedge RD => (Q +: 1'b0))=(0, 0);
if ((CK & ~(EN))) (negedge RD => (Q +: 1'b0))=(0, 0);
if ((CK & D & EN)) (negedge RD => (Q +: 1'b0))=(0, 0);
(negedge RD => (Q:1'b0))=(0, 0);
(posedge CK => (Q : 1'b1))=(0, 0);
$width(posedge CK &&& cond12 , 0 ,0, viol_0);
$width(negedge CK &&& cond12 , 0 ,0, viol_0);
$width(posedge CK &&& cond11 , 0 ,0, viol_0);
$width(negedge CK &&& cond11 , 0 ,0, viol_0);
$setuphold(posedge CK &&& cond0 , posedge D &&& cond0 , 0 ,0, viol_0, , , delayed_CK, delayed_D);
$setuphold(posedge CK &&& cond0 , negedge D &&& cond0 , 0 ,0, viol_0, , , delayed_CK, delayed_D);
$setuphold(posedge CK &&& cond2 , posedge EN &&& cond2 , 0 ,0, viol_0, , , delayed_CK, delayed_EN);
$setuphold(posedge CK &&& cond2 , negedge EN &&& cond2 , 0 ,0, viol_0, , , delayed_CK, delayed_EN);
$setuphold(posedge CK &&& cond1 , posedge EN &&& cond1 , 0 ,0, viol_0, , , delayed_CK, delayed_EN);
$setuphold(posedge CK &&& cond1 , negedge EN &&& cond1 , 0 ,0, viol_0, , , delayed_CK, delayed_EN);
$width(negedge RD &&& cond10 , 0 ,0, viol_0);
$width(negedge RD &&& cond9 , 0 ,0, viol_0);
$width(negedge RD &&& cond8 , 0 ,0, viol_0);
$width(negedge RD &&& cond7 , 0 ,0, viol_0);
$width(negedge RD &&& cond6 , 0 ,0, viol_0);
$width(negedge RD &&& cond5 , 0 ,0, viol_0);
$width(negedge RD &&& cond4 , 0 ,0, viol_0);
$recovery(posedge RD &&& cond3 , posedge CK &&& cond3 , 0 , viol_0);
$hold(posedge CK &&& cond3 , posedge RD &&& cond3 , 0 , viol_0);
endspecify
   `endif
endmodule
`endcelldefine

//%END SVN_FDPHRBQ_4
  

//%BEGIN SVN_FDPMQ_1

`celldefine
module SVN_FDPMQ_1 (Q, CK, D0, D1, S);
   output Q;
   input CK, D0, D1, S;

   reg viol_0;
   wire delayed_CK, delayed_D0, delayed_D1, delayed_S;

   wire int_res__D, xcr_0;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////

`ifdef _fv
   buf (delayed_CK, CK);
   buf (delayed_D0, D0);
   buf (delayed_D1, D1);
   buf (delayed_S, S);
`endif


   mux2 (int_res__D, delayed_D1, delayed_D0, delayed_S);
   dff_err (xcr_0, delayed_CK, int_res__D);

   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////

   `ifdef VIRL_functiononly
         dff #`SNPS_SEQ_DELAY (Q, viol_0, delayed_CK, int_res__D, xcr_0);
   `else
         dff (Q, viol_0, delayed_CK, int_res__D, xcr_0);
   `endif

   `ifdef VIRL_functiononly

   `else

not U0 (_net_0, D0);
not U1 (_net_1, S);
and U2 (_net_2, D1, _net_0, _net_1);
not U3 (_net_3, D1);
and U4 (_net_4, _net_3, D0, S);
not U5 (_net_5, D1);
not U6 (_net_6, D0);
and U7 (_net_7, _net_5, _net_6);
or U8 (cond7, _net_2, _net_4, _net_7);
not U9 (_net_8, D1);
not U10 (_net_9, S);
and U11 (_net_10, _net_8, D0, _net_9);
and U12 (_net_11, D1, D0);
not U13 (_net_12, D0);
and U14 (_net_13, D1, _net_12, S);
or U15 (cond6, _net_10, _net_11, _net_13);
not U16 (_net_14, S);
not U17 (_net_15, D1);
and U18 (cond1, _net_14, _net_15);
not U19 (_net_16, S);
and U20 (cond0, _net_16, D1);
not U21 (_net_17, D0);
and U22 (cond3, S, _net_17);
and U23 (cond2, S, D0);
not U24 (_net_18, D0);
and U25 (cond4, D1, _net_18);
not U26 (_net_19, D1);
and U27 (cond5, _net_19, D0);

specify
(posedge CK => (Q : 1'b1))=(0, 0);
$width(posedge CK &&& cond7 , 0 ,0, viol_0);
$width(negedge CK &&& cond7 , 0 ,0, viol_0);
$width(posedge CK &&& cond6 , 0 ,0, viol_0);
$width(negedge CK &&& cond6 , 0 ,0, viol_0);
$setuphold(posedge CK &&& cond1 , posedge D0 &&& cond1 , 0 ,0, viol_0, , , delayed_CK, delayed_D0);
$setuphold(posedge CK &&& cond1 , negedge D0 &&& cond1 , 0 ,0, viol_0, , , delayed_CK, delayed_D0);
$setuphold(posedge CK &&& cond0 , posedge D0 &&& cond0 , 0 ,0, viol_0, , , delayed_CK, delayed_D0);
$setuphold(posedge CK &&& cond0 , negedge D0 &&& cond0 , 0 ,0, viol_0, , , delayed_CK, delayed_D0);
$setuphold(posedge CK &&& cond3 , posedge D1 &&& cond3 , 0 ,0, viol_0, , , delayed_CK, delayed_D1);
$setuphold(posedge CK &&& cond3 , negedge D1 &&& cond3 , 0 ,0, viol_0, , , delayed_CK, delayed_D1);
$setuphold(posedge CK &&& cond2 , posedge D1 &&& cond2 , 0 ,0, viol_0, , , delayed_CK, delayed_D1);
$setuphold(posedge CK &&& cond2 , negedge D1 &&& cond2 , 0 ,0, viol_0, , , delayed_CK, delayed_D1);
$setuphold(posedge CK &&& cond4 , posedge S &&& cond4 , 0 ,0, viol_0, , , delayed_CK, delayed_S);
$setuphold(posedge CK &&& cond4 , negedge S &&& cond4 , 0 ,0, viol_0, , , delayed_CK, delayed_S);
$setuphold(posedge CK &&& cond5 , posedge S &&& cond5 , 0 ,0, viol_0, , , delayed_CK, delayed_S);
$setuphold(posedge CK &&& cond5 , negedge S &&& cond5 , 0 ,0, viol_0, , , delayed_CK, delayed_S);
endspecify
   `endif

endmodule
`endcelldefine

//%END SVN_FDPMQ_1

//%BEGIN SVN_FDPMQ_2

`celldefine
module SVN_FDPMQ_2 (Q, CK, D0, D1, S);
   output Q;
   input CK, D0, D1, S;

   reg viol_0;
   wire delayed_CK, delayed_D0, delayed_D1, delayed_S;

   wire int_res__D, xcr_0;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////

`ifdef _fv
   buf (delayed_CK, CK);
   buf (delayed_D0, D0);
   buf (delayed_D1, D1);
   buf (delayed_S, S);
`endif


   mux2 (int_res__D, delayed_D1, delayed_D0, delayed_S);
   dff_err (xcr_0, delayed_CK, int_res__D);

   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////

   `ifdef VIRL_functiononly
         dff #`SNPS_SEQ_DELAY (Q, viol_0, delayed_CK, int_res__D, xcr_0);
   `else
         dff (Q, viol_0, delayed_CK, int_res__D, xcr_0);
   `endif

   `ifdef VIRL_functiononly

   `else

not U0 (_net_0, D0);
not U1 (_net_1, S);
and U2 (_net_2, D1, _net_0, _net_1);
not U3 (_net_3, D1);
and U4 (_net_4, _net_3, D0, S);
not U5 (_net_5, D1);
not U6 (_net_6, D0);
and U7 (_net_7, _net_5, _net_6);
or U8 (cond7, _net_2, _net_4, _net_7);
not U9 (_net_8, D1);
not U10 (_net_9, S);
and U11 (_net_10, _net_8, D0, _net_9);
and U12 (_net_11, D1, D0);
not U13 (_net_12, D0);
and U14 (_net_13, D1, _net_12, S);
or U15 (cond6, _net_10, _net_11, _net_13);
not U16 (_net_14, S);
not U17 (_net_15, D1);
and U18 (cond1, _net_14, _net_15);
not U19 (_net_16, S);
and U20 (cond0, _net_16, D1);
not U21 (_net_17, D0);
and U22 (cond3, S, _net_17);
and U23 (cond2, S, D0);
not U24 (_net_18, D0);
and U25 (cond4, D1, _net_18);
not U26 (_net_19, D1);
and U27 (cond5, _net_19, D0);

specify
(posedge CK => (Q : 1'b1))=(0, 0);
$width(posedge CK &&& cond7 , 0 ,0, viol_0);
$width(negedge CK &&& cond7 , 0 ,0, viol_0);
$width(posedge CK &&& cond6 , 0 ,0, viol_0);
$width(negedge CK &&& cond6 , 0 ,0, viol_0);
$setuphold(posedge CK &&& cond1 , posedge D0 &&& cond1 , 0 ,0, viol_0, , , delayed_CK, delayed_D0);
$setuphold(posedge CK &&& cond1 , negedge D0 &&& cond1 , 0 ,0, viol_0, , , delayed_CK, delayed_D0);
$setuphold(posedge CK &&& cond0 , posedge D0 &&& cond0 , 0 ,0, viol_0, , , delayed_CK, delayed_D0);
$setuphold(posedge CK &&& cond0 , negedge D0 &&& cond0 , 0 ,0, viol_0, , , delayed_CK, delayed_D0);
$setuphold(posedge CK &&& cond3 , posedge D1 &&& cond3 , 0 ,0, viol_0, , , delayed_CK, delayed_D1);
$setuphold(posedge CK &&& cond3 , negedge D1 &&& cond3 , 0 ,0, viol_0, , , delayed_CK, delayed_D1);
$setuphold(posedge CK &&& cond2 , posedge D1 &&& cond2 , 0 ,0, viol_0, , , delayed_CK, delayed_D1);
$setuphold(posedge CK &&& cond2 , negedge D1 &&& cond2 , 0 ,0, viol_0, , , delayed_CK, delayed_D1);
$setuphold(posedge CK &&& cond4 , posedge S &&& cond4 , 0 ,0, viol_0, , , delayed_CK, delayed_S);
$setuphold(posedge CK &&& cond4 , negedge S &&& cond4 , 0 ,0, viol_0, , , delayed_CK, delayed_S);
$setuphold(posedge CK &&& cond5 , posedge S &&& cond5 , 0 ,0, viol_0, , , delayed_CK, delayed_S);
$setuphold(posedge CK &&& cond5 , negedge S &&& cond5 , 0 ,0, viol_0, , , delayed_CK, delayed_S);
endspecify
   `endif

endmodule
`endcelldefine

//%END SVN_FDPMQ_2

//%BEGIN SVN_FDPMQ_4

`celldefine
module SVN_FDPMQ_4 (Q, CK, D0, D1, S);
   output Q;
   input CK, D0, D1, S;

   reg viol_0;
   wire delayed_CK, delayed_D0, delayed_D1, delayed_S;

   wire int_res__D, xcr_0;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////

`ifdef _fv
   buf (delayed_CK, CK);
   buf (delayed_D0, D0);
   buf (delayed_D1, D1);
   buf (delayed_S, S);
`endif


   mux2 (int_res__D, delayed_D1, delayed_D0, delayed_S);
   dff_err (xcr_0, delayed_CK, int_res__D);

   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////

   `ifdef VIRL_functiononly
         dff #`SNPS_SEQ_DELAY (Q, viol_0, delayed_CK, int_res__D, xcr_0);
   `else
         dff (Q, viol_0, delayed_CK, int_res__D, xcr_0);
   `endif

   `ifdef VIRL_functiononly

   `else

not U0 (_net_0, D0);
not U1 (_net_1, S);
and U2 (_net_2, D1, _net_0, _net_1);
not U3 (_net_3, D1);
and U4 (_net_4, _net_3, D0, S);
not U5 (_net_5, D1);
not U6 (_net_6, D0);
and U7 (_net_7, _net_5, _net_6);
or U8 (cond7, _net_2, _net_4, _net_7);
not U9 (_net_8, D1);
not U10 (_net_9, S);
and U11 (_net_10, _net_8, D0, _net_9);
and U12 (_net_11, D1, D0);
not U13 (_net_12, D0);
and U14 (_net_13, D1, _net_12, S);
or U15 (cond6, _net_10, _net_11, _net_13);
not U16 (_net_14, S);
not U17 (_net_15, D1);
and U18 (cond1, _net_14, _net_15);
not U19 (_net_16, S);
and U20 (cond0, _net_16, D1);
not U21 (_net_17, D0);
and U22 (cond3, S, _net_17);
and U23 (cond2, S, D0);
not U24 (_net_18, D0);
and U25 (cond4, D1, _net_18);
not U26 (_net_19, D1);
and U27 (cond5, _net_19, D0);

specify
(posedge CK => (Q : 1'b1))=(0, 0);
$width(posedge CK &&& cond7 , 0 ,0, viol_0);
$width(negedge CK &&& cond7 , 0 ,0, viol_0);
$width(posedge CK &&& cond6 , 0 ,0, viol_0);
$width(negedge CK &&& cond6 , 0 ,0, viol_0);
$setuphold(posedge CK &&& cond1 , posedge D0 &&& cond1 , 0 ,0, viol_0, , , delayed_CK, delayed_D0);
$setuphold(posedge CK &&& cond1 , negedge D0 &&& cond1 , 0 ,0, viol_0, , , delayed_CK, delayed_D0);
$setuphold(posedge CK &&& cond0 , posedge D0 &&& cond0 , 0 ,0, viol_0, , , delayed_CK, delayed_D0);
$setuphold(posedge CK &&& cond0 , negedge D0 &&& cond0 , 0 ,0, viol_0, , , delayed_CK, delayed_D0);
$setuphold(posedge CK &&& cond3 , posedge D1 &&& cond3 , 0 ,0, viol_0, , , delayed_CK, delayed_D1);
$setuphold(posedge CK &&& cond3 , negedge D1 &&& cond3 , 0 ,0, viol_0, , , delayed_CK, delayed_D1);
$setuphold(posedge CK &&& cond2 , posedge D1 &&& cond2 , 0 ,0, viol_0, , , delayed_CK, delayed_D1);
$setuphold(posedge CK &&& cond2 , negedge D1 &&& cond2 , 0 ,0, viol_0, , , delayed_CK, delayed_D1);
$setuphold(posedge CK &&& cond4 , posedge S &&& cond4 , 0 ,0, viol_0, , , delayed_CK, delayed_S);
$setuphold(posedge CK &&& cond4 , negedge S &&& cond4 , 0 ,0, viol_0, , , delayed_CK, delayed_S);
$setuphold(posedge CK &&& cond5 , posedge S &&& cond5 , 0 ,0, viol_0, , , delayed_CK, delayed_S);
$setuphold(posedge CK &&& cond5 , negedge S &&& cond5 , 0 ,0, viol_0, , , delayed_CK, delayed_S);
endspecify
   `endif

endmodule
`endcelldefine

//%END SVN_FDPMQ_4

//%BEGIN SVN_FDPQ_0P5

`celldefine
module SVN_FDPQ_0P5 (Q, CK, D);
   output Q;
   input CK, D;

   reg viol_0;
   wire delayed_CK, delayed_D;

   wire xcr_0;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////

`ifdef _fv
   buf (delayed_CK, CK);
   buf (delayed_D, D);
`endif


   dff_err (xcr_0, delayed_CK, delayed_D);

   `ifdef VIRL_functiononly
        dff #`SNPS_SEQ_DELAY (Q, viol_0, delayed_CK, delayed_D, xcr_0);
   `else
        dff (Q, viol_0, delayed_CK, delayed_D, xcr_0);
   `endif

   `ifdef VIRL_functiononly

   `else
   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////




specify
(posedge CK => (Q : 1'b1))=(0, 0);
$width(posedge CK &&& ~D , 0 ,0, viol_0);
$width(negedge CK &&& ~D , 0 ,0, viol_0);
$width(posedge CK &&& D , 0 ,0, viol_0);
$width(negedge CK &&& D , 0 ,0, viol_0);
$setuphold(posedge CK , posedge D , 0 ,0, viol_0, , , delayed_CK, delayed_D);
$setuphold(posedge CK , negedge D , 0 ,0, viol_0, , , delayed_CK, delayed_D);
endspecify
   `endif

endmodule
`endcelldefine

//%END SVN_FDPQ_0P5

//%BEGIN SVN_FDPQ_1

`celldefine
module SVN_FDPQ_1 (Q, CK, D);
   output Q;
   input CK, D;

   reg viol_0;
   wire delayed_CK, delayed_D;

   wire xcr_0;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////

`ifdef _fv
   buf (delayed_CK, CK);
   buf (delayed_D, D);
`endif


   dff_err (xcr_0, delayed_CK, delayed_D);

   `ifdef VIRL_functiononly
        dff #`SNPS_SEQ_DELAY (Q, viol_0, delayed_CK, delayed_D, xcr_0);
   `else
        dff (Q, viol_0, delayed_CK, delayed_D, xcr_0);
   `endif

   `ifdef VIRL_functiononly

   `else
   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////




specify
(posedge CK => (Q : 1'b1))=(0, 0);
$width(posedge CK &&& ~D , 0 ,0, viol_0);
$width(negedge CK &&& ~D , 0 ,0, viol_0);
$width(posedge CK &&& D , 0 ,0, viol_0);
$width(negedge CK &&& D , 0 ,0, viol_0);
$setuphold(posedge CK , posedge D , 0 ,0, viol_0, , , delayed_CK, delayed_D);
$setuphold(posedge CK , negedge D , 0 ,0, viol_0, , , delayed_CK, delayed_D);
endspecify
   `endif

endmodule
`endcelldefine

//%END SVN_FDPQ_1

//%BEGIN SVN_FDPQ_2

`celldefine
module SVN_FDPQ_2 (Q, CK, D);
   output Q;
   input CK, D;

   reg viol_0;
   wire delayed_CK, delayed_D;

   wire xcr_0;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////

`ifdef _fv
   buf (delayed_CK, CK);
   buf (delayed_D, D);
`endif


   dff_err (xcr_0, delayed_CK, delayed_D);

   `ifdef VIRL_functiononly
        dff #`SNPS_SEQ_DELAY (Q, viol_0, delayed_CK, delayed_D, xcr_0);
   `else
        dff (Q, viol_0, delayed_CK, delayed_D, xcr_0);
   `endif

   `ifdef VIRL_functiononly

   `else
   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////




specify
(posedge CK => (Q : 1'b1))=(0, 0);
$width(posedge CK &&& ~D , 0 ,0, viol_0);
$width(negedge CK &&& ~D , 0 ,0, viol_0);
$width(posedge CK &&& D , 0 ,0, viol_0);
$width(negedge CK &&& D , 0 ,0, viol_0);
$setuphold(posedge CK , posedge D , 0 ,0, viol_0, , , delayed_CK, delayed_D);
$setuphold(posedge CK , negedge D , 0 ,0, viol_0, , , delayed_CK, delayed_D);
endspecify
   `endif

endmodule
`endcelldefine

//%END SVN_FDPQ_2

//%BEGIN SVN_FDPQ_4

`celldefine
module SVN_FDPQ_4 (Q, CK, D);
   output Q;
   input CK, D;

   reg viol_0;
   wire delayed_CK, delayed_D;

   wire xcr_0;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////

`ifdef _fv
   buf (delayed_CK, CK);
   buf (delayed_D, D);
`endif


   dff_err (xcr_0, delayed_CK, delayed_D);

   `ifdef VIRL_functiononly
        dff #`SNPS_SEQ_DELAY (Q, viol_0, delayed_CK, delayed_D, xcr_0);
   `else
        dff (Q, viol_0, delayed_CK, delayed_D, xcr_0);
   `endif

   `ifdef VIRL_functiononly

   `else
   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////




specify
(posedge CK => (Q : 1'b1))=(0, 0);
$width(posedge CK &&& ~D , 0 ,0, viol_0);
$width(negedge CK &&& ~D , 0 ,0, viol_0);
$width(posedge CK &&& D , 0 ,0, viol_0);
$width(negedge CK &&& D , 0 ,0, viol_0);
$setuphold(posedge CK , posedge D , 0 ,0, viol_0, , , delayed_CK, delayed_D);
$setuphold(posedge CK , negedge D , 0 ,0, viol_0, , , delayed_CK, delayed_D);
endspecify
   `endif

endmodule
`endcelldefine

//%END SVN_FDPQ_4

//%BEGIN SVN_FDPRB_1

`celldefine
module SVN_FDPRB_1 (Q, QN, CK, D, RD);
   output Q, QN;
   input CK, D, RD;

   reg viol_0;
   wire delayed_CK, delayed_D, delayed_RD;

   wire int_res__RD, int_res_iq, xcr_0;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////

`ifdef _fv
   buf (delayed_CK, CK);
   buf (delayed_D, D);
`endif

   buf (delayed_RD, RD);

   not (int_res__RD, delayed_RD);
   dff_r_err (xcr_0, delayed_CK, delayed_D, int_res__RD);
   dff_r (int_res_iq, viol_0, delayed_CK, delayed_D, int_res__RD, xcr_0);
   
   `ifdef VIRL_functiononly
      buf #`SNPS_SEQ_DELAY (Q, int_res_iq);
      not #`SNPS_SEQ_DELAY (QN, int_res_iq);
   `else
      buf (Q, int_res_iq);
      not (QN, int_res_iq);
   `endif

   `ifdef VIRL_functiononly

   `else

   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////

not U0 (_net_0, D);
and U1 (ENABLE_NOT_D_AND_RD, RD, _net_0);
and U2 (ENABLE_D_AND_RD, RD, D);
buf U3 (ENABLE_RD, RD);
not U4 (_net_1, D);
not U5 (_net_2, CK);
and U6 (ENABLE_NOT_CK_AND_NOT_D, _net_1, _net_2);
not U7 (_net_3, CK);
and U8 (ENABLE_NOT_CK_AND_D, D, _net_3);
not U9 (_net_4, D);
and U10 (ENABLE_CK_AND_NOT_D, _net_4, CK);
and U11 (ENABLE_CK_AND_D, D, CK);
buf U12 (ENABLE_D, D);

specify
if (CK==1'b0&&D==1'b0) (negedge RD => (Q +: 1'b0))=(0, 0);
if (CK==1'b0&&D==1'b1) (negedge RD => (Q +: 1'b0))=(0, 0);
if (CK==1'b1&&D==1'b0) (negedge RD => (Q +: 1'b0))=(0, 0);
if (CK==1'b1&&D==1'b1) (negedge RD => (Q +: 1'b0))=(0, 0);
(negedge RD => (Q:1'b0))=(0, 0);
if (D==1'b0&&RD==1'b1) (posedge CK => (Q -: 1'b1))=(0, 0);
if (D==1'b1&&RD==1'b1) (posedge CK => (Q +: 1'b1))=(0, 0);
(posedge CK => (Q:1'b1))=(0, 0);
if (CK==1'b0&&D==1'b0) (negedge RD => (QN -: 1'b1))=(0, 0);
if (CK==1'b0&&D==1'b1) (negedge RD => (QN -: 1'b1))=(0, 0);
if (CK==1'b1&&D==1'b0) (negedge RD => (QN -: 1'b1))=(0, 0);
if (CK==1'b1&&D==1'b1) (negedge RD => (QN -: 1'b1))=(0, 0);
(negedge RD => (QN:1'b1))=(0, 0);
if (D==1'b0&&RD==1'b1) (posedge CK => (QN +: 1'b1))=(0, 0);
if (D==1'b1&&RD==1'b1) (posedge CK => (QN -: 1'b1))=(0, 0);
(posedge CK => (QN:1'b0))=(0, 0);
$width(posedge CK &&& ENABLE_NOT_D_AND_RD , 0 ,0, viol_0);
$width(negedge CK &&& ENABLE_NOT_D_AND_RD , 0 ,0, viol_0);
$width(posedge CK &&& ENABLE_D_AND_RD , 0 ,0, viol_0);
$width(negedge CK &&& ENABLE_D_AND_RD , 0 ,0, viol_0);
$setuphold(posedge CK &&& ENABLE_RD , posedge D &&& ENABLE_RD , 0 ,0, viol_0, , , delayed_CK, delayed_D);
$setuphold(posedge CK &&& ENABLE_RD , negedge D &&& ENABLE_RD , 0 ,0, viol_0, , , delayed_CK, delayed_D);
$width(negedge RD &&& ENABLE_NOT_CK_AND_NOT_D , 0 ,0, viol_0);
$width(negedge RD &&& ENABLE_NOT_CK_AND_D , 0 ,0, viol_0);
$width(negedge RD &&& ENABLE_CK_AND_NOT_D , 0 ,0, viol_0);
$width(negedge RD &&& ENABLE_CK_AND_D , 0 ,0, viol_0);
$recovery(posedge RD &&& ENABLE_D , posedge CK &&& ENABLE_D , 0 , viol_0);
$hold(posedge CK &&& ENABLE_D , posedge RD &&& ENABLE_D , 0 , viol_0);
endspecify
   `endif
endmodule
`endcelldefine

//%END SVN_FDPRB_1

  

//%BEGIN SVN_FDPRB_2

`celldefine
module SVN_FDPRB_2 (Q, QN, CK, D, RD);
   output Q, QN;
   input CK, D, RD;

   reg viol_0;
   wire delayed_CK, delayed_D, delayed_RD;

   wire int_res__RD, int_res_iq, xcr_0;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////

`ifdef _fv
   buf (delayed_CK, CK);
   buf (delayed_D, D);
`endif

   buf (delayed_RD, RD);

   not (int_res__RD, delayed_RD);
   dff_r_err (xcr_0, delayed_CK, delayed_D, int_res__RD);
   dff_r (int_res_iq, viol_0, delayed_CK, delayed_D, int_res__RD, xcr_0);
   
   `ifdef VIRL_functiononly
      buf #`SNPS_SEQ_DELAY (Q, int_res_iq);
      not #`SNPS_SEQ_DELAY (QN, int_res_iq);
   `else
      buf (Q, int_res_iq);
      not (QN, int_res_iq);
   `endif

   `ifdef VIRL_functiononly

   `else

   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////

not U0 (_net_0, D);
and U1 (ENABLE_NOT_D_AND_RD, RD, _net_0);
and U2 (ENABLE_D_AND_RD, RD, D);
buf U3 (ENABLE_RD, RD);
not U4 (_net_1, D);
not U5 (_net_2, CK);
and U6 (ENABLE_NOT_CK_AND_NOT_D, _net_1, _net_2);
not U7 (_net_3, CK);
and U8 (ENABLE_NOT_CK_AND_D, D, _net_3);
not U9 (_net_4, D);
and U10 (ENABLE_CK_AND_NOT_D, _net_4, CK);
and U11 (ENABLE_CK_AND_D, D, CK);
buf U12 (ENABLE_D, D);

specify
if (CK==1'b0&&D==1'b0) (negedge RD => (Q +: 1'b0))=(0, 0);
if (CK==1'b0&&D==1'b1) (negedge RD => (Q +: 1'b0))=(0, 0);
if (CK==1'b1&&D==1'b0) (negedge RD => (Q +: 1'b0))=(0, 0);
if (CK==1'b1&&D==1'b1) (negedge RD => (Q +: 1'b0))=(0, 0);
(negedge RD => (Q:1'b0))=(0, 0);
if (D==1'b0&&RD==1'b1) (posedge CK => (Q -: 1'b1))=(0, 0);
if (D==1'b1&&RD==1'b1) (posedge CK => (Q +: 1'b1))=(0, 0);
(posedge CK => (Q:1'b1))=(0, 0);
if (CK==1'b0&&D==1'b0) (negedge RD => (QN -: 1'b1))=(0, 0);
if (CK==1'b0&&D==1'b1) (negedge RD => (QN -: 1'b1))=(0, 0);
if (CK==1'b1&&D==1'b0) (negedge RD => (QN -: 1'b1))=(0, 0);
if (CK==1'b1&&D==1'b1) (negedge RD => (QN -: 1'b1))=(0, 0);
(negedge RD => (QN:1'b1))=(0, 0);
if (D==1'b0&&RD==1'b1) (posedge CK => (QN +: 1'b1))=(0, 0);
if (D==1'b1&&RD==1'b1) (posedge CK => (QN -: 1'b1))=(0, 0);
(posedge CK => (QN:1'b0))=(0, 0);
$width(posedge CK &&& ENABLE_NOT_D_AND_RD , 0 ,0, viol_0);
$width(negedge CK &&& ENABLE_NOT_D_AND_RD , 0 ,0, viol_0);
$width(posedge CK &&& ENABLE_D_AND_RD , 0 ,0, viol_0);
$width(negedge CK &&& ENABLE_D_AND_RD , 0 ,0, viol_0);
$setuphold(posedge CK &&& ENABLE_RD , posedge D &&& ENABLE_RD , 0 ,0, viol_0, , , delayed_CK, delayed_D);
$setuphold(posedge CK &&& ENABLE_RD , negedge D &&& ENABLE_RD , 0 ,0, viol_0, , , delayed_CK, delayed_D);
$width(negedge RD &&& ENABLE_NOT_CK_AND_NOT_D , 0 ,0, viol_0);
$width(negedge RD &&& ENABLE_NOT_CK_AND_D , 0 ,0, viol_0);
$width(negedge RD &&& ENABLE_CK_AND_NOT_D , 0 ,0, viol_0);
$width(negedge RD &&& ENABLE_CK_AND_D , 0 ,0, viol_0);
$recovery(posedge RD &&& ENABLE_D , posedge CK &&& ENABLE_D , 0 , viol_0);
$hold(posedge CK &&& ENABLE_D , posedge RD &&& ENABLE_D , 0 , viol_0);
endspecify
   `endif
endmodule
`endcelldefine

//%END SVN_FDPRB_2

  

//%BEGIN SVN_FDPRB_4

`celldefine
module SVN_FDPRB_4 (Q, QN, CK, D, RD);
   output Q, QN;
   input CK, D, RD;

   reg viol_0;
   wire delayed_CK, delayed_D, delayed_RD;

   wire int_res__RD, int_res_iq, xcr_0;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////

`ifdef _fv
   buf (delayed_CK, CK);
   buf (delayed_D, D);
`endif

   buf (delayed_RD, RD);

   not (int_res__RD, delayed_RD);
   dff_r_err (xcr_0, delayed_CK, delayed_D, int_res__RD);
   dff_r (int_res_iq, viol_0, delayed_CK, delayed_D, int_res__RD, xcr_0);
   
   `ifdef VIRL_functiononly
      buf #`SNPS_SEQ_DELAY (Q, int_res_iq);
      not #`SNPS_SEQ_DELAY (QN, int_res_iq);
   `else
      buf (Q, int_res_iq);
      not (QN, int_res_iq);
   `endif

   `ifdef VIRL_functiononly

   `else

   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////

not U0 (_net_0, D);
and U1 (ENABLE_NOT_D_AND_RD, RD, _net_0);
and U2 (ENABLE_D_AND_RD, RD, D);
buf U3 (ENABLE_RD, RD);
not U4 (_net_1, D);
not U5 (_net_2, CK);
and U6 (ENABLE_NOT_CK_AND_NOT_D, _net_1, _net_2);
not U7 (_net_3, CK);
and U8 (ENABLE_NOT_CK_AND_D, D, _net_3);
not U9 (_net_4, D);
and U10 (ENABLE_CK_AND_NOT_D, _net_4, CK);
and U11 (ENABLE_CK_AND_D, D, CK);
buf U12 (ENABLE_D, D);

specify
if (CK==1'b0&&D==1'b0) (negedge RD => (Q +: 1'b0))=(0, 0);
if (CK==1'b0&&D==1'b1) (negedge RD => (Q +: 1'b0))=(0, 0);
if (CK==1'b1&&D==1'b0) (negedge RD => (Q +: 1'b0))=(0, 0);
if (CK==1'b1&&D==1'b1) (negedge RD => (Q +: 1'b0))=(0, 0);
(negedge RD => (Q:1'b0))=(0, 0);
if (D==1'b0&&RD==1'b1) (posedge CK => (Q -: 1'b1))=(0, 0);
if (D==1'b1&&RD==1'b1) (posedge CK => (Q +: 1'b1))=(0, 0);
(posedge CK => (Q:1'b1))=(0, 0);
if (CK==1'b0&&D==1'b0) (negedge RD => (QN -: 1'b1))=(0, 0);
if (CK==1'b0&&D==1'b1) (negedge RD => (QN -: 1'b1))=(0, 0);
if (CK==1'b1&&D==1'b0) (negedge RD => (QN -: 1'b1))=(0, 0);
if (CK==1'b1&&D==1'b1) (negedge RD => (QN -: 1'b1))=(0, 0);
(negedge RD => (QN:1'b1))=(0, 0);
if (D==1'b0&&RD==1'b1) (posedge CK => (QN +: 1'b1))=(0, 0);
if (D==1'b1&&RD==1'b1) (posedge CK => (QN -: 1'b1))=(0, 0);
(posedge CK => (QN:1'b0))=(0, 0);
$width(posedge CK &&& ENABLE_NOT_D_AND_RD , 0 ,0, viol_0);
$width(negedge CK &&& ENABLE_NOT_D_AND_RD , 0 ,0, viol_0);
$width(posedge CK &&& ENABLE_D_AND_RD , 0 ,0, viol_0);
$width(negedge CK &&& ENABLE_D_AND_RD , 0 ,0, viol_0);
$setuphold(posedge CK &&& ENABLE_RD , posedge D &&& ENABLE_RD , 0 ,0, viol_0, , , delayed_CK, delayed_D);
$setuphold(posedge CK &&& ENABLE_RD , negedge D &&& ENABLE_RD , 0 ,0, viol_0, , , delayed_CK, delayed_D);
$width(negedge RD &&& ENABLE_NOT_CK_AND_NOT_D , 0 ,0, viol_0);
$width(negedge RD &&& ENABLE_NOT_CK_AND_D , 0 ,0, viol_0);
$width(negedge RD &&& ENABLE_CK_AND_NOT_D , 0 ,0, viol_0);
$width(negedge RD &&& ENABLE_CK_AND_D , 0 ,0, viol_0);
$recovery(posedge RD &&& ENABLE_D , posedge CK &&& ENABLE_D , 0 , viol_0);
$hold(posedge CK &&& ENABLE_D , posedge RD &&& ENABLE_D , 0 , viol_0);
endspecify
   `endif
endmodule
`endcelldefine

//%END SVN_FDPRB_4

  

//%BEGIN SVN_FDPRBQ_F_1

`celldefine
module SVN_FDPRBQ_F_1 (Q, CK, D, RD);
   output Q;
   input CK, D, RD;

   reg viol_0;
   wire delayed_CK, delayed_D, delayed_RD;

   wire int_res__RD, xcr_0;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////

`ifdef _fv
   buf (delayed_CK, CK);
   buf (delayed_D, D);
`endif
   buf (delayed_RD, RD);

  
   not (int_res__RD, delayed_RD);
   dff_r_err (xcr_0, delayed_CK, delayed_D, int_res__RD);

   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////

   `ifdef VIRL_functiononly
         dff_r #`SNPS_SEQ_DELAY (Q, viol_0, delayed_CK, delayed_D, int_res__RD, xcr_0);
   `else
         dff_r (Q, viol_0, delayed_CK, delayed_D, int_res__RD, xcr_0);
   `endif

   `ifdef VIRL_functiononly

   `else

not U0 (_net_0, D);
and U1 (cond5, RD, _net_0);
and U2 (cond4, RD, D);
not U3 (_net_1, D);
not U4 (_net_2, CK);
and U5 (cond3, _net_1, _net_2);
not U6 (_net_3, CK);
and U7 (cond2, D, _net_3);
not U8 (_net_4, D);
and U9 (cond1, _net_4, CK);
and U10 (cond0, D, CK);

specify
if ((~(CK) & ~(D))) (negedge RD => (Q +: 1'b0))=(0, 0);
if ((~(CK) & D)) (negedge RD => (Q +: 1'b0))=(0, 0);
if ((CK & ~(D))) (negedge RD => (Q +: 1'b0))=(0, 0);
if ((CK & D)) (negedge RD => (Q +: 1'b0))=(0, 0);
(negedge RD => (Q:1'b0))=(0, 0);
(posedge CK => (Q : 1'b1))=(0, 0);
$width(posedge CK &&& cond5 , 0 ,0, viol_0);
$width(negedge CK &&& cond5 , 0 ,0, viol_0);
$width(posedge CK &&& cond4 , 0 ,0, viol_0);
$width(negedge CK &&& cond4 , 0 ,0, viol_0);
$setuphold(posedge CK &&& RD , posedge D &&& RD , 0 ,0, viol_0, , , delayed_CK, delayed_D);
$setuphold(posedge CK &&& RD , negedge D &&& RD , 0 ,0, viol_0, , , delayed_CK, delayed_D);
$width(negedge RD &&& cond3 , 0 ,0, viol_0);
$width(negedge RD &&& cond2 , 0 ,0, viol_0);
$width(negedge RD &&& cond1 , 0 ,0, viol_0);
$width(negedge RD &&& cond0 , 0 ,0, viol_0);
$recovery(posedge RD &&& D , posedge CK &&& D , 0 , viol_0);
$hold(posedge CK &&& D , posedge RD &&& D , 0 , viol_0);
endspecify
   `endif

endmodule
`endcelldefine

//%END SVN_FDPRBQ_F_1

//%BEGIN SVN_FDPRBQ_F_2

`celldefine
module SVN_FDPRBQ_F_2 (Q, CK, D, RD);
   output Q;
   input CK, D, RD;

   reg viol_0;
   wire delayed_CK, delayed_D, delayed_RD;

   wire int_res__RD, xcr_0;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////

`ifdef _fv
   buf (delayed_CK, CK);
   buf (delayed_D, D);
`endif
   buf (delayed_RD, RD);

  
   not (int_res__RD, delayed_RD);
   dff_r_err (xcr_0, delayed_CK, delayed_D, int_res__RD);

   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////

   `ifdef VIRL_functiononly
         dff_r #`SNPS_SEQ_DELAY (Q, viol_0, delayed_CK, delayed_D, int_res__RD, xcr_0);
   `else
         dff_r (Q, viol_0, delayed_CK, delayed_D, int_res__RD, xcr_0);
   `endif

   `ifdef VIRL_functiononly

   `else

not U0 (_net_0, D);
and U1 (cond5, RD, _net_0);
and U2 (cond4, RD, D);
not U3 (_net_1, D);
not U4 (_net_2, CK);
and U5 (cond3, _net_1, _net_2);
not U6 (_net_3, CK);
and U7 (cond2, D, _net_3);
not U8 (_net_4, D);
and U9 (cond1, _net_4, CK);
and U10 (cond0, D, CK);

specify
if ((~(CK) & ~(D))) (negedge RD => (Q +: 1'b0))=(0, 0);
if ((~(CK) & D)) (negedge RD => (Q +: 1'b0))=(0, 0);
if ((CK & ~(D))) (negedge RD => (Q +: 1'b0))=(0, 0);
if ((CK & D)) (negedge RD => (Q +: 1'b0))=(0, 0);
(negedge RD => (Q:1'b0))=(0, 0);
(posedge CK => (Q : 1'b1))=(0, 0);
$width(posedge CK &&& cond5 , 0 ,0, viol_0);
$width(negedge CK &&& cond5 , 0 ,0, viol_0);
$width(posedge CK &&& cond4 , 0 ,0, viol_0);
$width(negedge CK &&& cond4 , 0 ,0, viol_0);
$setuphold(posedge CK &&& RD , posedge D &&& RD , 0 ,0, viol_0, , , delayed_CK, delayed_D);
$setuphold(posedge CK &&& RD , negedge D &&& RD , 0 ,0, viol_0, , , delayed_CK, delayed_D);
$width(negedge RD &&& cond3 , 0 ,0, viol_0);
$width(negedge RD &&& cond2 , 0 ,0, viol_0);
$width(negedge RD &&& cond1 , 0 ,0, viol_0);
$width(negedge RD &&& cond0 , 0 ,0, viol_0);
$recovery(posedge RD &&& D , posedge CK &&& D , 0 , viol_0);
$hold(posedge CK &&& D , posedge RD &&& D , 0 , viol_0);
endspecify
   `endif

endmodule
`endcelldefine

//%END SVN_FDPRBQ_F_2

//%BEGIN SVN_FDPRBQ_F_4

`celldefine
module SVN_FDPRBQ_F_4 (Q, CK, D, RD);
   output Q;
   input CK, D, RD;

   reg viol_0;
   wire delayed_CK, delayed_D, delayed_RD;

   wire int_res__RD, xcr_0;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////

`ifdef _fv
   buf (delayed_CK, CK);
   buf (delayed_D, D);
`endif
   buf (delayed_RD, RD);

  
   not (int_res__RD, delayed_RD);
   dff_r_err (xcr_0, delayed_CK, delayed_D, int_res__RD);

   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////

   `ifdef VIRL_functiononly
         dff_r #`SNPS_SEQ_DELAY (Q, viol_0, delayed_CK, delayed_D, int_res__RD, xcr_0);
   `else
         dff_r (Q, viol_0, delayed_CK, delayed_D, int_res__RD, xcr_0);
   `endif

   `ifdef VIRL_functiononly

   `else

not U0 (_net_0, D);
and U1 (cond5, RD, _net_0);
and U2 (cond4, RD, D);
not U3 (_net_1, D);
not U4 (_net_2, CK);
and U5 (cond3, _net_1, _net_2);
not U6 (_net_3, CK);
and U7 (cond2, D, _net_3);
not U8 (_net_4, D);
and U9 (cond1, _net_4, CK);
and U10 (cond0, D, CK);

specify
if ((~(CK) & ~(D))) (negedge RD => (Q +: 1'b0))=(0, 0);
if ((~(CK) & D)) (negedge RD => (Q +: 1'b0))=(0, 0);
if ((CK & ~(D))) (negedge RD => (Q +: 1'b0))=(0, 0);
if ((CK & D)) (negedge RD => (Q +: 1'b0))=(0, 0);
(negedge RD => (Q:1'b0))=(0, 0);
(posedge CK => (Q : 1'b1))=(0, 0);
$width(posedge CK &&& cond5 , 0 ,0, viol_0);
$width(negedge CK &&& cond5 , 0 ,0, viol_0);
$width(posedge CK &&& cond4 , 0 ,0, viol_0);
$width(negedge CK &&& cond4 , 0 ,0, viol_0);
$setuphold(posedge CK &&& RD , posedge D &&& RD , 0 ,0, viol_0, , , delayed_CK, delayed_D);
$setuphold(posedge CK &&& RD , negedge D &&& RD , 0 ,0, viol_0, , , delayed_CK, delayed_D);
$width(negedge RD &&& cond3 , 0 ,0, viol_0);
$width(negedge RD &&& cond2 , 0 ,0, viol_0);
$width(negedge RD &&& cond1 , 0 ,0, viol_0);
$width(negedge RD &&& cond0 , 0 ,0, viol_0);
$recovery(posedge RD &&& D , posedge CK &&& D , 0 , viol_0);
$hold(posedge CK &&& D , posedge RD &&& D , 0 , viol_0);
endspecify
   `endif

endmodule
`endcelldefine

//%END SVN_FDPRBQ_F_4

//%BEGIN SVN_FDPRBQ_0P5

`celldefine
module SVN_FDPRBQ_0P5 (Q, CK, D, RD);
   output Q;
   input CK, D, RD;

   reg viol_0;
   wire delayed_CK, delayed_D, delayed_RD;

   wire int_res__RD, xcr_0;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////

`ifdef _fv
   buf (delayed_CK, CK);
   buf (delayed_D, D);
`endif
   buf (delayed_RD, RD);

  
   not (int_res__RD, delayed_RD);
   dff_r_err (xcr_0, delayed_CK, delayed_D, int_res__RD);

   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////

   `ifdef VIRL_functiononly
         dff_r #`SNPS_SEQ_DELAY (Q, viol_0, delayed_CK, delayed_D, int_res__RD, xcr_0);
   `else
         dff_r (Q, viol_0, delayed_CK, delayed_D, int_res__RD, xcr_0);
   `endif

   `ifdef VIRL_functiononly

   `else

not U0 (_net_0, D);
and U1 (cond3, RD, _net_0);
and U2 (cond2, RD, D);
not U3 (_net_1, D);
not U4 (_net_2, CK);
and U5 (cond1, _net_1, _net_2);
not U6 (_net_3, CK);
and U7 (cond0, D, _net_3);

specify
if ((~(CK) & ~(D))) (negedge RD => (Q +: 1'b0))=(0, 0);
if ((~(CK) & D)) (negedge RD => (Q +: 1'b0))=(0, 0);
if (CK) (negedge RD => (Q +: 1'b0))=(0, 0);
(negedge RD => (Q:1'b0))=(0, 0);
(posedge CK => (Q : 1'b1))=(0, 0);
$width(posedge CK &&& cond3 , 0 ,0, viol_0);
$width(negedge CK &&& cond3 , 0 ,0, viol_0);
$width(posedge CK &&& cond2 , 0 ,0, viol_0);
$width(negedge CK &&& cond2 , 0 ,0, viol_0);
$setuphold(posedge CK &&& RD , posedge D &&& RD , 0 ,0, viol_0, , , delayed_CK, delayed_D);
$setuphold(posedge CK &&& RD , negedge D &&& RD , 0 ,0, viol_0, , , delayed_CK, delayed_D);
$width(negedge RD &&& cond1 , 0 ,0, viol_0);
$width(negedge RD &&& cond0 , 0 ,0, viol_0);
$width(negedge RD &&& CK , 0 ,0, viol_0);
$recovery(posedge RD &&& D , posedge CK &&& D , 0 , viol_0);
$hold(posedge CK &&& D , posedge RD &&& D , 0 , viol_0);
endspecify
   `endif

endmodule
`endcelldefine

//%END SVN_FDPRBQ_0P5

//%BEGIN SVN_FDPRBQ_1

`celldefine
module SVN_FDPRBQ_1 (Q, CK, D, RD);
   output Q;
   input CK, D, RD;

   reg viol_0;
   wire delayed_CK, delayed_D, delayed_RD;

   wire int_res__RD, xcr_0;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////

`ifdef _fv
   buf (delayed_CK, CK);
   buf (delayed_D, D);
`endif
   buf (delayed_RD, RD);

  
   not (int_res__RD, delayed_RD);
   dff_r_err (xcr_0, delayed_CK, delayed_D, int_res__RD);

   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////

   `ifdef VIRL_functiononly
         dff_r #`SNPS_SEQ_DELAY (Q, viol_0, delayed_CK, delayed_D, int_res__RD, xcr_0);
   `else
         dff_r (Q, viol_0, delayed_CK, delayed_D, int_res__RD, xcr_0);
   `endif

   `ifdef VIRL_functiononly

   `else

not U0 (_net_0, D);
and U1 (cond5, RD, _net_0);
and U2 (cond4, RD, D);
not U3 (_net_1, D);
not U4 (_net_2, CK);
and U5 (cond3, _net_1, _net_2);
not U6 (_net_3, CK);
and U7 (cond2, D, _net_3);
not U8 (_net_4, D);
and U9 (cond1, _net_4, CK);
and U10 (cond0, D, CK);

specify
if ((~(CK) & ~(D))) (negedge RD => (Q +: 1'b0))=(0, 0);
if ((~(CK) & D)) (negedge RD => (Q +: 1'b0))=(0, 0);
if ((CK & ~(D))) (negedge RD => (Q +: 1'b0))=(0, 0);
if ((CK & D)) (negedge RD => (Q +: 1'b0))=(0, 0);
(negedge RD => (Q:1'b0))=(0, 0);
(posedge CK => (Q : 1'b1))=(0, 0);
$width(posedge CK &&& cond5 , 0 ,0, viol_0);
$width(negedge CK &&& cond5 , 0 ,0, viol_0);
$width(posedge CK &&& cond4 , 0 ,0, viol_0);
$width(negedge CK &&& cond4 , 0 ,0, viol_0);
$setuphold(posedge CK &&& RD , posedge D &&& RD , 0 ,0, viol_0, , , delayed_CK, delayed_D);
$setuphold(posedge CK &&& RD , negedge D &&& RD , 0 ,0, viol_0, , , delayed_CK, delayed_D);
$width(negedge RD &&& cond3 , 0 ,0, viol_0);
$width(negedge RD &&& cond2 , 0 ,0, viol_0);
$width(negedge RD &&& cond1 , 0 ,0, viol_0);
$width(negedge RD &&& cond0 , 0 ,0, viol_0);
$recovery(posedge RD &&& D , posedge CK &&& D , 0 , viol_0);
$hold(posedge CK &&& D , posedge RD &&& D , 0 , viol_0);
endspecify
   `endif

endmodule
`endcelldefine

//%END SVN_FDPRBQ_1

//%BEGIN SVN_FDPRBQ_2

`celldefine
module SVN_FDPRBQ_2 (Q, CK, D, RD);
   output Q;
   input CK, D, RD;

   reg viol_0;
   wire delayed_CK, delayed_D, delayed_RD;

   wire int_res__RD, xcr_0;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////

`ifdef _fv
   buf (delayed_CK, CK);
   buf (delayed_D, D);
`endif
   buf (delayed_RD, RD);

  
   not (int_res__RD, delayed_RD);
   dff_r_err (xcr_0, delayed_CK, delayed_D, int_res__RD);

   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////

   `ifdef VIRL_functiononly
         dff_r #`SNPS_SEQ_DELAY (Q, viol_0, delayed_CK, delayed_D, int_res__RD, xcr_0);
   `else
         dff_r (Q, viol_0, delayed_CK, delayed_D, int_res__RD, xcr_0);
   `endif

   `ifdef VIRL_functiononly

   `else

not U0 (_net_0, D);
and U1 (cond5, RD, _net_0);
and U2 (cond4, RD, D);
not U3 (_net_1, D);
not U4 (_net_2, CK);
and U5 (cond3, _net_1, _net_2);
not U6 (_net_3, CK);
and U7 (cond2, D, _net_3);
not U8 (_net_4, D);
and U9 (cond1, _net_4, CK);
and U10 (cond0, D, CK);

specify
if ((~(CK) & ~(D))) (negedge RD => (Q +: 1'b0))=(0, 0);
if ((~(CK) & D)) (negedge RD => (Q +: 1'b0))=(0, 0);
if ((CK & ~(D))) (negedge RD => (Q +: 1'b0))=(0, 0);
if ((CK & D)) (negedge RD => (Q +: 1'b0))=(0, 0);
(negedge RD => (Q:1'b0))=(0, 0);
(posedge CK => (Q : 1'b1))=(0, 0);
$width(posedge CK &&& cond5 , 0 ,0, viol_0);
$width(negedge CK &&& cond5 , 0 ,0, viol_0);
$width(posedge CK &&& cond4 , 0 ,0, viol_0);
$width(negedge CK &&& cond4 , 0 ,0, viol_0);
$setuphold(posedge CK &&& RD , posedge D &&& RD , 0 ,0, viol_0, , , delayed_CK, delayed_D);
$setuphold(posedge CK &&& RD , negedge D &&& RD , 0 ,0, viol_0, , , delayed_CK, delayed_D);
$width(negedge RD &&& cond3 , 0 ,0, viol_0);
$width(negedge RD &&& cond2 , 0 ,0, viol_0);
$width(negedge RD &&& cond1 , 0 ,0, viol_0);
$width(negedge RD &&& cond0 , 0 ,0, viol_0);
$recovery(posedge RD &&& D , posedge CK &&& D , 0 , viol_0);
$hold(posedge CK &&& D , posedge RD &&& D , 0 , viol_0);
endspecify
   `endif

endmodule
`endcelldefine

//%END SVN_FDPRBQ_2

//%BEGIN SVN_FDPRBQ_4

`celldefine
module SVN_FDPRBQ_4 (Q, CK, D, RD);
   output Q;
   input CK, D, RD;

   reg viol_0;
   wire delayed_CK, delayed_D, delayed_RD;

   wire int_res__RD, xcr_0;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////

`ifdef _fv
   buf (delayed_CK, CK);
   buf (delayed_D, D);
`endif
   buf (delayed_RD, RD);

  
   not (int_res__RD, delayed_RD);
   dff_r_err (xcr_0, delayed_CK, delayed_D, int_res__RD);

   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////

   `ifdef VIRL_functiononly
         dff_r #`SNPS_SEQ_DELAY (Q, viol_0, delayed_CK, delayed_D, int_res__RD, xcr_0);
   `else
         dff_r (Q, viol_0, delayed_CK, delayed_D, int_res__RD, xcr_0);
   `endif

   `ifdef VIRL_functiononly

   `else

not U0 (_net_0, D);
and U1 (cond5, RD, _net_0);
and U2 (cond4, RD, D);
not U3 (_net_1, D);
not U4 (_net_2, CK);
and U5 (cond3, _net_1, _net_2);
not U6 (_net_3, CK);
and U7 (cond2, D, _net_3);
not U8 (_net_4, D);
and U9 (cond1, _net_4, CK);
and U10 (cond0, D, CK);

specify
if ((~(CK) & ~(D))) (negedge RD => (Q +: 1'b0))=(0, 0);
if ((~(CK) & D)) (negedge RD => (Q +: 1'b0))=(0, 0);
if ((CK & ~(D))) (negedge RD => (Q +: 1'b0))=(0, 0);
if ((CK & D)) (negedge RD => (Q +: 1'b0))=(0, 0);
(negedge RD => (Q:1'b0))=(0, 0);
(posedge CK => (Q : 1'b1))=(0, 0);
$width(posedge CK &&& cond5 , 0 ,0, viol_0);
$width(negedge CK &&& cond5 , 0 ,0, viol_0);
$width(posedge CK &&& cond4 , 0 ,0, viol_0);
$width(negedge CK &&& cond4 , 0 ,0, viol_0);
$setuphold(posedge CK &&& RD , posedge D &&& RD , 0 ,0, viol_0, , , delayed_CK, delayed_D);
$setuphold(posedge CK &&& RD , negedge D &&& RD , 0 ,0, viol_0, , , delayed_CK, delayed_D);
$width(negedge RD &&& cond3 , 0 ,0, viol_0);
$width(negedge RD &&& cond2 , 0 ,0, viol_0);
$width(negedge RD &&& cond1 , 0 ,0, viol_0);
$width(negedge RD &&& cond0 , 0 ,0, viol_0);
$recovery(posedge RD &&& D , posedge CK &&& D , 0 , viol_0);
$hold(posedge CK &&& D , posedge RD &&& D , 0 , viol_0);
endspecify
   `endif

endmodule
`endcelldefine

//%END SVN_FDPRBQ_4

//%BEGIN SVN_FDPRBSBQ_1

`celldefine
module SVN_FDPRBSBQ_1 (Q, CK, D, RD, SD);
   output Q;
   input CK, D, RD, SD;

   reg viol_0;
   wire delayed_CK, delayed_D,
	delayed_RD, delayed_SD;

   wire int_res__SD, int_res__RD, xcr_0;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////

`ifdef _fv
   buf (delayed_D, D);
   buf (delayed_CK, CK);
`endif
   buf (delayed_RD, RD);
   buf (delayed_SD, SD);


   not (int_res__SD, delayed_SD);
   not (int_res__RD, delayed_RD);
   dff_sr_err (xcr_0, delayed_CK, delayed_D, int_res__SD, int_res__RD);

   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////

   `ifdef VIRL_functiononly
        dff_sr_0 #`SNPS_SEQ_DELAY (Q, viol_0, delayed_CK, delayed_D, int_res__SD, int_res__RD, xcr_0);
   `else
        dff_sr_0 (Q, viol_0, delayed_CK, delayed_D, int_res__SD, int_res__RD, xcr_0); 

   `endif

   `ifdef VIRL_functiononly

   `else

not U0 (_net_0, D);
and U1 (cond12, RD, _net_0, SD);
and U2 (cond11, RD, D, SD);
and U3 (cond0, SD, RD);
not U4 (_net_1, D);
not U5 (_net_2, CK);
and U6 (cond6, _net_1, _net_2, SD);
not U7 (_net_3, D);
not U8 (_net_4, CK);
and U9 (cond3, _net_3, _net_4);
not U10 (_net_5, CK);
and U11 (cond5, D, _net_5, SD);
not U12 (_net_6, CK);
and U13 (cond2, D, _net_6);
and U14 (cond4, SD, CK);
and U15 (cond1, SD, D);
not U16 (_net_7, D);
not U17 (_net_8, CK);
and U18 (cond10, _net_7, _net_8, RD);
not U19 (_net_9, CK);
and U20 (cond9, D, _net_9, RD);
not U21 (_net_10, D);
and U22 (cond7, RD, _net_10);
and U23 (cond8, RD, CK);

specify
if ((~(CK) & ~(D) & SD)) (negedge RD => (Q +: 1'b0))=(0, 0);
if ((~(CK) & ~(SD))) (negedge RD => (Q +: 1'b0))=(0, 0);
if ((~(CK) & ~(SD))) (posedge RD => (Q +: 1'b1))=(0, 0);
if ((~(CK) & D & SD)) (negedge RD => (Q +: 1'b0))=(0, 0);
if ((CK & ~(SD))) (negedge RD => (Q +: 1'b0))=(0, 0);
if ((CK & ~(SD))) (posedge RD => (Q +: 1'b1))=(0, 0);
if ((CK & SD)) (negedge RD => (Q +: 1'b0))=(0, 0);
(negedge RD => (Q:1'b0))=(0, 0);
if ((~(CK) & ~(D) & RD)) (negedge SD => (Q -: 1'b1))=(0, 0);
if ((~(CK) & D & RD)) (negedge SD => (Q -: 1'b1))=(0, 0);
if ((CK & RD)) (negedge SD => (Q -: 1'b1))=(0, 0);
(negedge SD => (Q:1'b1))=(0, 0);
(posedge CK => (Q : 1'b1))=(0, 0);
$width(posedge CK &&& cond12 , 0 ,0, viol_0);
$width(negedge CK &&& cond12 , 0 ,0, viol_0);
$width(posedge CK &&& cond11 , 0 ,0, viol_0);
$width(negedge CK &&& cond11 , 0 ,0, viol_0);
$setuphold(posedge CK &&& cond0 , posedge D &&& cond0 , 0 ,0, viol_0, , , delayed_CK, delayed_D);
$setuphold(posedge CK &&& cond0 , negedge D &&& cond0 , 0 ,0, viol_0, , , delayed_CK, delayed_D);
$width(negedge RD &&& cond6 , 0 ,0, viol_0);
$setuphold(posedge SD &&& cond3 , posedge RD &&& cond3 , 0 ,0, viol_0, , , delayed_SD, delayed_RD);
$width(negedge RD &&& cond5 , 0 ,0, viol_0);
$setuphold(posedge SD &&& cond2 , posedge RD &&& cond2 , 0 ,0, viol_0, , , delayed_SD, delayed_RD);
$width(negedge RD &&& cond4 , 0 ,0, viol_0);
$recovery(posedge RD &&& cond1 , posedge CK &&& cond1 , 0 , viol_0);
$hold(posedge CK &&& cond1 , posedge RD &&& cond1 , 0 , viol_0);
$setuphold(posedge SD &&& CK , posedge RD &&& CK , 0 ,0, viol_0, , , delayed_SD, delayed_RD);
$width(negedge SD &&& cond10 , 0 ,0, viol_0);
$setuphold(posedge RD &&& cond3 , posedge SD &&& cond3 , 0 ,0, viol_0, , , delayed_RD, delayed_SD);
$width(negedge SD &&& cond9 , 0 ,0, viol_0);
$setuphold(posedge RD &&& cond2 , posedge SD &&& cond2 , 0 ,0, viol_0, , , delayed_RD, delayed_SD);
$recovery(posedge SD &&& cond7 , posedge CK &&& cond7 , 0 , viol_0);
$hold(posedge CK &&& cond7 , posedge SD &&& cond7 , 0 , viol_0);
$width(negedge SD &&& cond8 , 0 ,0, viol_0);
$setuphold(posedge RD &&& CK , posedge SD &&& CK , 0 ,0, viol_0, , , delayed_RD, delayed_SD);
endspecify
   `endif

endmodule
`endcelldefine

//%END SVN_FDPRBSBQ_1

//%BEGIN SVN_FDPRBSBQ_2

`celldefine
module SVN_FDPRBSBQ_2 (Q, CK, D, RD, SD);
   output Q;
   input CK, D, RD, SD;

   reg viol_0;
   wire delayed_CK, delayed_D,
	delayed_RD, delayed_SD;

   wire int_res__SD, int_res__RD, xcr_0;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////

`ifdef _fv
   buf (delayed_D, D);
   buf (delayed_CK, CK);
`endif
   buf (delayed_RD, RD);
   buf (delayed_SD, SD);


   not (int_res__SD, delayed_SD);
   not (int_res__RD, delayed_RD);
   dff_sr_err (xcr_0, delayed_CK, delayed_D, int_res__SD, int_res__RD);

   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////

   `ifdef VIRL_functiononly
        dff_sr_0 #`SNPS_SEQ_DELAY (Q, viol_0, delayed_CK, delayed_D, int_res__SD, int_res__RD, xcr_0);
   `else
        dff_sr_0 (Q, viol_0, delayed_CK, delayed_D, int_res__SD, int_res__RD, xcr_0); 

   `endif

   `ifdef VIRL_functiononly

   `else

not U0 (_net_0, D);
and U1 (cond12, RD, _net_0, SD);
and U2 (cond11, RD, D, SD);
and U3 (cond0, SD, RD);
not U4 (_net_1, D);
not U5 (_net_2, CK);
and U6 (cond6, _net_1, _net_2, SD);
not U7 (_net_3, D);
not U8 (_net_4, CK);
and U9 (cond3, _net_3, _net_4);
not U10 (_net_5, CK);
and U11 (cond5, D, _net_5, SD);
not U12 (_net_6, CK);
and U13 (cond2, D, _net_6);
and U14 (cond4, SD, CK);
and U15 (cond1, SD, D);
not U16 (_net_7, D);
not U17 (_net_8, CK);
and U18 (cond10, _net_7, _net_8, RD);
not U19 (_net_9, CK);
and U20 (cond9, D, _net_9, RD);
not U21 (_net_10, D);
and U22 (cond7, RD, _net_10);
and U23 (cond8, RD, CK);

specify
if ((~(CK) & ~(D) & SD)) (negedge RD => (Q +: 1'b0))=(0, 0);
if ((~(CK) & ~(SD))) (negedge RD => (Q +: 1'b0))=(0, 0);
if ((~(CK) & ~(SD))) (posedge RD => (Q +: 1'b1))=(0, 0);
if ((~(CK) & D & SD)) (negedge RD => (Q +: 1'b0))=(0, 0);
if ((CK & ~(SD))) (negedge RD => (Q +: 1'b0))=(0, 0);
if ((CK & ~(SD))) (posedge RD => (Q +: 1'b1))=(0, 0);
if ((CK & SD)) (negedge RD => (Q +: 1'b0))=(0, 0);
(negedge RD => (Q:1'b0))=(0, 0);
if ((~(CK) & ~(D) & RD)) (negedge SD => (Q -: 1'b1))=(0, 0);
if ((~(CK) & D & RD)) (negedge SD => (Q -: 1'b1))=(0, 0);
if ((CK & RD)) (negedge SD => (Q -: 1'b1))=(0, 0);
(negedge SD => (Q:1'b1))=(0, 0);
(posedge CK => (Q : 1'b1))=(0, 0);
$width(posedge CK &&& cond12 , 0 ,0, viol_0);
$width(negedge CK &&& cond12 , 0 ,0, viol_0);
$width(posedge CK &&& cond11 , 0 ,0, viol_0);
$width(negedge CK &&& cond11 , 0 ,0, viol_0);
$setuphold(posedge CK &&& cond0 , posedge D &&& cond0 , 0 ,0, viol_0, , , delayed_CK, delayed_D);
$setuphold(posedge CK &&& cond0 , negedge D &&& cond0 , 0 ,0, viol_0, , , delayed_CK, delayed_D);
$width(negedge RD &&& cond6 , 0 ,0, viol_0);
$setuphold(posedge SD &&& cond3 , posedge RD &&& cond3 , 0 ,0, viol_0, , , delayed_SD, delayed_RD);
$width(negedge RD &&& cond5 , 0 ,0, viol_0);
$setuphold(posedge SD &&& cond2 , posedge RD &&& cond2 , 0 ,0, viol_0, , , delayed_SD, delayed_RD);
$width(negedge RD &&& cond4 , 0 ,0, viol_0);
$recovery(posedge RD &&& cond1 , posedge CK &&& cond1 , 0 , viol_0);
$hold(posedge CK &&& cond1 , posedge RD &&& cond1 , 0 , viol_0);
$setuphold(posedge SD &&& CK , posedge RD &&& CK , 0 ,0, viol_0, , , delayed_SD, delayed_RD);
$width(negedge SD &&& cond10 , 0 ,0, viol_0);
$setuphold(posedge RD &&& cond3 , posedge SD &&& cond3 , 0 ,0, viol_0, , , delayed_RD, delayed_SD);
$width(negedge SD &&& cond9 , 0 ,0, viol_0);
$setuphold(posedge RD &&& cond2 , posedge SD &&& cond2 , 0 ,0, viol_0, , , delayed_RD, delayed_SD);
$recovery(posedge SD &&& cond7 , posedge CK &&& cond7 , 0 , viol_0);
$hold(posedge CK &&& cond7 , posedge SD &&& cond7 , 0 , viol_0);
$width(negedge SD &&& cond8 , 0 ,0, viol_0);
$setuphold(posedge RD &&& CK , posedge SD &&& CK , 0 ,0, viol_0, , , delayed_RD, delayed_SD);
endspecify
   `endif

endmodule
`endcelldefine

//%END SVN_FDPRBSBQ_2

//%BEGIN SVN_FDPRBSBQ_4

`celldefine
module SVN_FDPRBSBQ_4 (Q, CK, D, RD, SD);
   output Q;
   input CK, D, RD, SD;

   reg viol_0;
   wire delayed_CK, delayed_D,
	delayed_RD, delayed_SD;

   wire int_res__SD, int_res__RD, xcr_0;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////

`ifdef _fv
   buf (delayed_D, D);
   buf (delayed_CK, CK);
`endif
   buf (delayed_RD, RD);
   buf (delayed_SD, SD);


   not (int_res__SD, delayed_SD);
   not (int_res__RD, delayed_RD);
   dff_sr_err (xcr_0, delayed_CK, delayed_D, int_res__SD, int_res__RD);

   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////

   `ifdef VIRL_functiononly
        dff_sr_0 #`SNPS_SEQ_DELAY (Q, viol_0, delayed_CK, delayed_D, int_res__SD, int_res__RD, xcr_0);
   `else
        dff_sr_0 (Q, viol_0, delayed_CK, delayed_D, int_res__SD, int_res__RD, xcr_0); 

   `endif

   `ifdef VIRL_functiononly

   `else

not U0 (_net_0, D);
and U1 (cond12, RD, _net_0, SD);
and U2 (cond11, RD, D, SD);
and U3 (cond0, SD, RD);
not U4 (_net_1, D);
not U5 (_net_2, CK);
and U6 (cond6, _net_1, _net_2, SD);
not U7 (_net_3, D);
not U8 (_net_4, CK);
and U9 (cond3, _net_3, _net_4);
not U10 (_net_5, CK);
and U11 (cond5, D, _net_5, SD);
not U12 (_net_6, CK);
and U13 (cond2, D, _net_6);
and U14 (cond4, SD, CK);
and U15 (cond1, SD, D);
not U16 (_net_7, D);
not U17 (_net_8, CK);
and U18 (cond10, _net_7, _net_8, RD);
not U19 (_net_9, CK);
and U20 (cond9, D, _net_9, RD);
not U21 (_net_10, D);
and U22 (cond7, RD, _net_10);
and U23 (cond8, RD, CK);

specify
if ((~(CK) & ~(D) & SD)) (negedge RD => (Q +: 1'b0))=(0, 0);
if ((~(CK) & ~(SD))) (negedge RD => (Q +: 1'b0))=(0, 0);
if ((~(CK) & ~(SD))) (posedge RD => (Q +: 1'b1))=(0, 0);
if ((~(CK) & D & SD)) (negedge RD => (Q +: 1'b0))=(0, 0);
if ((CK & ~(SD))) (negedge RD => (Q +: 1'b0))=(0, 0);
if ((CK & ~(SD))) (posedge RD => (Q +: 1'b1))=(0, 0);
if ((CK & SD)) (negedge RD => (Q +: 1'b0))=(0, 0);
(negedge RD => (Q:1'b0))=(0, 0);
if ((~(CK) & ~(D) & RD)) (negedge SD => (Q -: 1'b1))=(0, 0);
if ((~(CK) & D & RD)) (negedge SD => (Q -: 1'b1))=(0, 0);
if ((CK & RD)) (negedge SD => (Q -: 1'b1))=(0, 0);
(negedge SD => (Q:1'b1))=(0, 0);
(posedge CK => (Q : 1'b1))=(0, 0);
$width(posedge CK &&& cond12 , 0 ,0, viol_0);
$width(negedge CK &&& cond12 , 0 ,0, viol_0);
$width(posedge CK &&& cond11 , 0 ,0, viol_0);
$width(negedge CK &&& cond11 , 0 ,0, viol_0);
$setuphold(posedge CK &&& cond0 , posedge D &&& cond0 , 0 ,0, viol_0, , , delayed_CK, delayed_D);
$setuphold(posedge CK &&& cond0 , negedge D &&& cond0 , 0 ,0, viol_0, , , delayed_CK, delayed_D);
$width(negedge RD &&& cond6 , 0 ,0, viol_0);
$setuphold(posedge SD &&& cond3 , posedge RD &&& cond3 , 0 ,0, viol_0, , , delayed_SD, delayed_RD);
$width(negedge RD &&& cond5 , 0 ,0, viol_0);
$setuphold(posedge SD &&& cond2 , posedge RD &&& cond2 , 0 ,0, viol_0, , , delayed_SD, delayed_RD);
$width(negedge RD &&& cond4 , 0 ,0, viol_0);
$recovery(posedge RD &&& cond1 , posedge CK &&& cond1 , 0 , viol_0);
$hold(posedge CK &&& cond1 , posedge RD &&& cond1 , 0 , viol_0);
$setuphold(posedge SD &&& CK , posedge RD &&& CK , 0 ,0, viol_0, , , delayed_SD, delayed_RD);
$width(negedge SD &&& cond10 , 0 ,0, viol_0);
$setuphold(posedge RD &&& cond3 , posedge SD &&& cond3 , 0 ,0, viol_0, , , delayed_RD, delayed_SD);
$width(negedge SD &&& cond9 , 0 ,0, viol_0);
$setuphold(posedge RD &&& cond2 , posedge SD &&& cond2 , 0 ,0, viol_0, , , delayed_RD, delayed_SD);
$recovery(posedge SD &&& cond7 , posedge CK &&& cond7 , 0 , viol_0);
$hold(posedge CK &&& cond7 , posedge SD &&& cond7 , 0 , viol_0);
$width(negedge SD &&& cond8 , 0 ,0, viol_0);
$setuphold(posedge RD &&& CK , posedge SD &&& CK , 0 ,0, viol_0, , , delayed_RD, delayed_SD);
endspecify
   `endif

endmodule
`endcelldefine

//%END SVN_FDPRBSBQ_4

//%BEGIN SVN_FDPSBQ_0P5

`celldefine
module SVN_FDPSBQ_0P5 (Q, CK, D, SD);
   output Q;
   input CK, D, SD;

   reg viol_0;
   wire delayed_CK, delayed_D, delayed_SD;

   wire int_res__SD, xcr_0;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////

`ifdef _fv
   buf (delayed_CK, CK);
   buf (delayed_D, D);
`endif
   buf (delayed_SD, SD);


   not (int_res__SD, delayed_SD);
   dff_s_err (xcr_0, delayed_CK, delayed_D, int_res__SD);

   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////

  `ifdef VIRL_functiononly
      dff_s #`SNPS_SEQ_DELAY (Q, viol_0, delayed_CK, delayed_D, int_res__SD, xcr_0);

  `else
      dff_s (Q, viol_0, delayed_CK, delayed_D, int_res__SD, xcr_0);

  `endif

  `ifdef VIRL_functiononly

  `else

not U0 (_net_0, D);
and U1 (cond3, SD, _net_0);
and U2 (cond2, SD, D);
not U3 (_net_1, D);
not U4 (_net_2, CK);
and U5 (cond1, _net_1, _net_2);
not U6 (_net_3, CK);
and U7 (cond0, D, _net_3);

specify
if ((~(CK) & ~(D))) (negedge SD => (Q -: 1'b1))=(0, 0);
if ((~(CK) & D)) (negedge SD => (Q -: 1'b1))=(0, 0);
if (CK) (negedge SD => (Q -: 1'b1))=(0, 0);
(negedge SD => (Q:1'b1))=(0, 0);
(posedge CK => (Q : 1'b1))=(0, 0);
$width(posedge CK &&& cond3 , 0 ,0, viol_0);
$width(negedge CK &&& cond3 , 0 ,0, viol_0);
$width(posedge CK &&& cond2 , 0 ,0, viol_0);
$width(negedge CK &&& cond2 , 0 ,0, viol_0);
$setuphold(posedge CK &&& SD , posedge D &&& SD , 0 ,0, viol_0, , , delayed_CK, delayed_D);
$setuphold(posedge CK &&& SD , negedge D &&& SD , 0 ,0, viol_0, , , delayed_CK, delayed_D);
$recovery(posedge SD &&& ~D , posedge CK &&& ~D , 0 , viol_0);
$hold(posedge CK &&& ~D , posedge SD &&& ~D , 0 , viol_0);
$width(negedge SD &&& cond1 , 0 ,0, viol_0);
$width(negedge SD &&& cond0 , 0 ,0, viol_0);
$width(negedge SD &&& CK , 0 ,0, viol_0);
endspecify
   `endif

endmodule
`endcelldefine

//%END SVN_FDPSBQ_0P5

//%BEGIN SVN_FDPSBQ_1

`celldefine
module SVN_FDPSBQ_1 (Q, CK, D, SD);
   output Q;
   input CK, D, SD;

   reg viol_0;
   wire delayed_CK, delayed_D, delayed_SD;

   wire int_res__SD, xcr_0;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////

`ifdef _fv
   buf (delayed_CK, CK);
   buf (delayed_D, D);
`endif
   buf (delayed_SD, SD);


   not (int_res__SD, delayed_SD);
   dff_s_err (xcr_0, delayed_CK, delayed_D, int_res__SD);

   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////

  `ifdef VIRL_functiononly
      dff_s #`SNPS_SEQ_DELAY (Q, viol_0, delayed_CK, delayed_D, int_res__SD, xcr_0);

  `else
      dff_s (Q, viol_0, delayed_CK, delayed_D, int_res__SD, xcr_0);

  `endif

  `ifdef VIRL_functiononly

  `else

not U0 (_net_0, D);
and U1 (cond3, SD, _net_0);
and U2 (cond2, SD, D);
not U3 (_net_1, D);
not U4 (_net_2, CK);
and U5 (cond1, _net_1, _net_2);
not U6 (_net_3, CK);
and U7 (cond0, D, _net_3);

specify
if ((~(CK) & ~(D))) (negedge SD => (Q -: 1'b1))=(0, 0);
if ((~(CK) & D)) (negedge SD => (Q -: 1'b1))=(0, 0);
if (CK) (negedge SD => (Q -: 1'b1))=(0, 0);
(negedge SD => (Q:1'b1))=(0, 0);
(posedge CK => (Q : 1'b1))=(0, 0);
$width(posedge CK &&& cond3 , 0 ,0, viol_0);
$width(negedge CK &&& cond3 , 0 ,0, viol_0);
$width(posedge CK &&& cond2 , 0 ,0, viol_0);
$width(negedge CK &&& cond2 , 0 ,0, viol_0);
$setuphold(posedge CK &&& SD , posedge D &&& SD , 0 ,0, viol_0, , , delayed_CK, delayed_D);
$setuphold(posedge CK &&& SD , negedge D &&& SD , 0 ,0, viol_0, , , delayed_CK, delayed_D);
$recovery(posedge SD &&& ~D , posedge CK &&& ~D , 0 , viol_0);
$hold(posedge CK &&& ~D , posedge SD &&& ~D , 0 , viol_0);
$width(negedge SD &&& cond1 , 0 ,0, viol_0);
$width(negedge SD &&& cond0 , 0 ,0, viol_0);
$width(negedge SD &&& CK , 0 ,0, viol_0);
endspecify
   `endif

endmodule
`endcelldefine

//%END SVN_FDPSBQ_1

//%BEGIN SVN_FDPSBQ_2

`celldefine
module SVN_FDPSBQ_2 (Q, CK, D, SD);
   output Q;
   input CK, D, SD;

   reg viol_0;
   wire delayed_CK, delayed_D, delayed_SD;

   wire int_res__SD, xcr_0;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////

`ifdef _fv
   buf (delayed_CK, CK);
   buf (delayed_D, D);
`endif
   buf (delayed_SD, SD);


   not (int_res__SD, delayed_SD);
   dff_s_err (xcr_0, delayed_CK, delayed_D, int_res__SD);

   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////

  `ifdef VIRL_functiononly
      dff_s #`SNPS_SEQ_DELAY (Q, viol_0, delayed_CK, delayed_D, int_res__SD, xcr_0);

  `else
      dff_s (Q, viol_0, delayed_CK, delayed_D, int_res__SD, xcr_0);

  `endif

  `ifdef VIRL_functiononly

  `else

not U0 (_net_0, D);
and U1 (cond3, SD, _net_0);
and U2 (cond2, SD, D);
not U3 (_net_1, D);
not U4 (_net_2, CK);
and U5 (cond1, _net_1, _net_2);
not U6 (_net_3, CK);
and U7 (cond0, D, _net_3);

specify
if ((~(CK) & ~(D))) (negedge SD => (Q -: 1'b1))=(0, 0);
if ((~(CK) & D)) (negedge SD => (Q -: 1'b1))=(0, 0);
if (CK) (negedge SD => (Q -: 1'b1))=(0, 0);
(negedge SD => (Q:1'b1))=(0, 0);
(posedge CK => (Q : 1'b1))=(0, 0);
$width(posedge CK &&& cond3 , 0 ,0, viol_0);
$width(negedge CK &&& cond3 , 0 ,0, viol_0);
$width(posedge CK &&& cond2 , 0 ,0, viol_0);
$width(negedge CK &&& cond2 , 0 ,0, viol_0);
$setuphold(posedge CK &&& SD , posedge D &&& SD , 0 ,0, viol_0, , , delayed_CK, delayed_D);
$setuphold(posedge CK &&& SD , negedge D &&& SD , 0 ,0, viol_0, , , delayed_CK, delayed_D);
$recovery(posedge SD &&& ~D , posedge CK &&& ~D , 0 , viol_0);
$hold(posedge CK &&& ~D , posedge SD &&& ~D , 0 , viol_0);
$width(negedge SD &&& cond1 , 0 ,0, viol_0);
$width(negedge SD &&& cond0 , 0 ,0, viol_0);
$width(negedge SD &&& CK , 0 ,0, viol_0);
endspecify
   `endif

endmodule
`endcelldefine

//%END SVN_FDPSBQ_2

//%BEGIN SVN_FDPSBQ_4

`celldefine
module SVN_FDPSBQ_4 (Q, CK, D, SD);
   output Q;
   input CK, D, SD;

   reg viol_0;
   wire delayed_CK, delayed_D, delayed_SD;

   wire int_res__SD, xcr_0;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////

`ifdef _fv
   buf (delayed_CK, CK);
   buf (delayed_D, D);
`endif
   buf (delayed_SD, SD);


   not (int_res__SD, delayed_SD);
   dff_s_err (xcr_0, delayed_CK, delayed_D, int_res__SD);

   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////

  `ifdef VIRL_functiononly
      dff_s #`SNPS_SEQ_DELAY (Q, viol_0, delayed_CK, delayed_D, int_res__SD, xcr_0);

  `else
      dff_s (Q, viol_0, delayed_CK, delayed_D, int_res__SD, xcr_0);

  `endif

  `ifdef VIRL_functiononly

  `else

not U0 (_net_0, D);
and U1 (cond3, SD, _net_0);
and U2 (cond2, SD, D);
not U3 (_net_1, D);
not U4 (_net_2, CK);
and U5 (cond1, _net_1, _net_2);
not U6 (_net_3, CK);
and U7 (cond0, D, _net_3);

specify
if ((~(CK) & ~(D))) (negedge SD => (Q -: 1'b1))=(0, 0);
if ((~(CK) & D)) (negedge SD => (Q -: 1'b1))=(0, 0);
if (CK) (negedge SD => (Q -: 1'b1))=(0, 0);
(negedge SD => (Q:1'b1))=(0, 0);
(posedge CK => (Q : 1'b1))=(0, 0);
$width(posedge CK &&& cond3 , 0 ,0, viol_0);
$width(negedge CK &&& cond3 , 0 ,0, viol_0);
$width(posedge CK &&& cond2 , 0 ,0, viol_0);
$width(negedge CK &&& cond2 , 0 ,0, viol_0);
$setuphold(posedge CK &&& SD , posedge D &&& SD , 0 ,0, viol_0, , , delayed_CK, delayed_D);
$setuphold(posedge CK &&& SD , negedge D &&& SD , 0 ,0, viol_0, , , delayed_CK, delayed_D);
$recovery(posedge SD &&& ~D , posedge CK &&& ~D , 0 , viol_0);
$hold(posedge CK &&& ~D , posedge SD &&& ~D , 0 , viol_0);
$width(negedge SD &&& cond1 , 0 ,0, viol_0);
$width(negedge SD &&& cond0 , 0 ,0, viol_0);
$width(negedge SD &&& CK , 0 ,0, viol_0);
endspecify
   `endif

endmodule
`endcelldefine

//%END SVN_FDPSBQ_4

//%BEGIN SVN_FSDNQ_1

`celldefine
module SVN_FSDNQ_1 (Q, CK, D, SI, SE);
   output Q;
   input CK, D, SI, SE;

   reg viol_0;
   wire delayed_CK, delayed_D,
	delayed_SI, delayed_SE;

   wire int_res__CK, int_res__D, xcr_0;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////

`ifdef _fv
   buf (delayed_CK, CK);
   buf (delayed_D, D);
   buf (delayed_SI, SI);
   buf (delayed_SE, SE);
`endif

   not (int_res__CK, delayed_CK);
   mux2 (int_res__D, delayed_SI, delayed_D, delayed_SE);
   dff_err (xcr_0, int_res__CK, int_res__D);

   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////

   `ifdef VIRL_functiononly
       dff #`SNPS_SEQ_DELAY (Q, viol_0, int_res__CK, int_res__D, xcr_0);
   `else
       dff (Q, viol_0, int_res__CK, int_res__D, xcr_0);
    `endif

   `ifdef VIRL_functiononly

   `else

not U0 (_net_0, D);
not U1 (_net_1, SI);
and U2 (_net_2, SE, _net_0, _net_1);
not U3 (_net_3, SI);
and U4 (_net_4, SE, D, _net_3);
not U5 (_net_5, SE);
not U6 (_net_6, D);
and U7 (_net_7, _net_5, _net_6);
or U8 (cond5, _net_2, _net_4, _net_7);
not U9 (_net_8, SE);
and U10 (_net_9, _net_8, D);
and U11 (_net_10, SE, D, SI);
not U12 (_net_11, D);
and U13 (_net_12, SE, _net_11, SI);
or U14 (cond4, _net_9, _net_10, _net_12);
not U15 (_net_13, D);
and U16 (cond0, SI, _net_13);
not U17 (_net_14, SI);
and U18 (cond1, _net_14, D);
not U19 (_net_15, D);
and U20 (cond3, SE, _net_15);
and U21 (cond2, SE, D);

specify
(negedge CK => (Q : 1'b1))=(0, 0);
$width(posedge CK &&& cond5 , 0 ,0, viol_0);
$width(negedge CK &&& cond5 , 0 ,0, viol_0);
$width(posedge CK &&& cond4 , 0 ,0, viol_0);
$width(negedge CK &&& cond4 , 0 ,0, viol_0);
$setuphold(negedge CK &&& ~SE , posedge D &&& ~SE , 0 ,0, viol_0, , , delayed_CK, delayed_D);
$setuphold(negedge CK &&& ~SE , negedge D &&& ~SE , 0 ,0, viol_0, , , delayed_CK, delayed_D);
$setuphold(negedge CK &&& cond0 , posedge SE &&& cond0 , 0 ,0, viol_0, , , delayed_CK, delayed_SE);
$setuphold(negedge CK &&& cond0 , negedge SE &&& cond0 , 0 ,0, viol_0, , , delayed_CK, delayed_SE);
$setuphold(negedge CK &&& cond1 , posedge SE &&& cond1 , 0 ,0, viol_0, , , delayed_CK, delayed_SE);
$setuphold(negedge CK &&& cond1 , negedge SE &&& cond1 , 0 ,0, viol_0, , , delayed_CK, delayed_SE);
$setuphold(negedge CK &&& cond3 , posedge SI &&& cond3 , 0 ,0, viol_0, , , delayed_CK, delayed_SI);
$setuphold(negedge CK &&& cond3 , negedge SI &&& cond3 , 0 ,0, viol_0, , , delayed_CK, delayed_SI);
$setuphold(negedge CK &&& cond2 , posedge SI &&& cond2 , 0 ,0, viol_0, , , delayed_CK, delayed_SI);
$setuphold(negedge CK &&& cond2 , negedge SI &&& cond2 , 0 ,0, viol_0, , , delayed_CK, delayed_SI);
endspecify
   `endif

endmodule
`endcelldefine

//%END SVN_FSDNQ_1

//%BEGIN SVN_FSDNQ_2

`celldefine
module SVN_FSDNQ_2 (Q, CK, D, SI, SE);
   output Q;
   input CK, D, SI, SE;

   reg viol_0;
   wire delayed_CK, delayed_D,
	delayed_SI, delayed_SE;

   wire int_res__CK, int_res__D, xcr_0;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////

`ifdef _fv
   buf (delayed_CK, CK);
   buf (delayed_D, D);
   buf (delayed_SI, SI);
   buf (delayed_SE, SE);
`endif

   not (int_res__CK, delayed_CK);
   mux2 (int_res__D, delayed_SI, delayed_D, delayed_SE);
   dff_err (xcr_0, int_res__CK, int_res__D);

   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////

   `ifdef VIRL_functiononly
       dff #`SNPS_SEQ_DELAY (Q, viol_0, int_res__CK, int_res__D, xcr_0);
   `else
       dff (Q, viol_0, int_res__CK, int_res__D, xcr_0);
    `endif

   `ifdef VIRL_functiononly

   `else

not U0 (_net_0, D);
not U1 (_net_1, SI);
and U2 (_net_2, SE, _net_0, _net_1);
not U3 (_net_3, SI);
and U4 (_net_4, SE, D, _net_3);
not U5 (_net_5, SE);
not U6 (_net_6, D);
and U7 (_net_7, _net_5, _net_6);
or U8 (cond5, _net_2, _net_4, _net_7);
not U9 (_net_8, SE);
and U10 (_net_9, _net_8, D);
and U11 (_net_10, SE, D, SI);
not U12 (_net_11, D);
and U13 (_net_12, SE, _net_11, SI);
or U14 (cond4, _net_9, _net_10, _net_12);
not U15 (_net_13, D);
and U16 (cond0, SI, _net_13);
not U17 (_net_14, SI);
and U18 (cond1, _net_14, D);
not U19 (_net_15, D);
and U20 (cond3, SE, _net_15);
and U21 (cond2, SE, D);

specify
(negedge CK => (Q : 1'b1))=(0, 0);
$width(posedge CK &&& cond5 , 0 ,0, viol_0);
$width(negedge CK &&& cond5 , 0 ,0, viol_0);
$width(posedge CK &&& cond4 , 0 ,0, viol_0);
$width(negedge CK &&& cond4 , 0 ,0, viol_0);
$setuphold(negedge CK &&& ~SE , posedge D &&& ~SE , 0 ,0, viol_0, , , delayed_CK, delayed_D);
$setuphold(negedge CK &&& ~SE , negedge D &&& ~SE , 0 ,0, viol_0, , , delayed_CK, delayed_D);
$setuphold(negedge CK &&& cond0 , posedge SE &&& cond0 , 0 ,0, viol_0, , , delayed_CK, delayed_SE);
$setuphold(negedge CK &&& cond0 , negedge SE &&& cond0 , 0 ,0, viol_0, , , delayed_CK, delayed_SE);
$setuphold(negedge CK &&& cond1 , posedge SE &&& cond1 , 0 ,0, viol_0, , , delayed_CK, delayed_SE);
$setuphold(negedge CK &&& cond1 , negedge SE &&& cond1 , 0 ,0, viol_0, , , delayed_CK, delayed_SE);
$setuphold(negedge CK &&& cond3 , posedge SI &&& cond3 , 0 ,0, viol_0, , , delayed_CK, delayed_SI);
$setuphold(negedge CK &&& cond3 , negedge SI &&& cond3 , 0 ,0, viol_0, , , delayed_CK, delayed_SI);
$setuphold(negedge CK &&& cond2 , posedge SI &&& cond2 , 0 ,0, viol_0, , , delayed_CK, delayed_SI);
$setuphold(negedge CK &&& cond2 , negedge SI &&& cond2 , 0 ,0, viol_0, , , delayed_CK, delayed_SI);
endspecify
   `endif

endmodule
`endcelldefine

//%END SVN_FSDNQ_2

//%BEGIN SVN_FSDNQ_4

`celldefine
module SVN_FSDNQ_4 (Q, CK, D, SI, SE);
   output Q;
   input CK, D, SI, SE;

   reg viol_0;
   wire delayed_CK, delayed_D,
	delayed_SI, delayed_SE;

   wire int_res__CK, int_res__D, xcr_0;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////

`ifdef _fv
   buf (delayed_CK, CK);
   buf (delayed_D, D);
   buf (delayed_SI, SI);
   buf (delayed_SE, SE);
`endif

   not (int_res__CK, delayed_CK);
   mux2 (int_res__D, delayed_SI, delayed_D, delayed_SE);
   dff_err (xcr_0, int_res__CK, int_res__D);

   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////

   `ifdef VIRL_functiononly
       dff #`SNPS_SEQ_DELAY (Q, viol_0, int_res__CK, int_res__D, xcr_0);
   `else
       dff (Q, viol_0, int_res__CK, int_res__D, xcr_0);
    `endif

   `ifdef VIRL_functiononly

   `else

not U0 (_net_0, D);
not U1 (_net_1, SI);
and U2 (_net_2, SE, _net_0, _net_1);
not U3 (_net_3, SI);
and U4 (_net_4, SE, D, _net_3);
not U5 (_net_5, SE);
not U6 (_net_6, D);
and U7 (_net_7, _net_5, _net_6);
or U8 (cond5, _net_2, _net_4, _net_7);
not U9 (_net_8, SE);
and U10 (_net_9, _net_8, D);
and U11 (_net_10, SE, D, SI);
not U12 (_net_11, D);
and U13 (_net_12, SE, _net_11, SI);
or U14 (cond4, _net_9, _net_10, _net_12);
not U15 (_net_13, D);
and U16 (cond0, SI, _net_13);
not U17 (_net_14, SI);
and U18 (cond1, _net_14, D);
not U19 (_net_15, D);
and U20 (cond3, SE, _net_15);
and U21 (cond2, SE, D);

specify
(negedge CK => (Q : 1'b1))=(0, 0);
$width(posedge CK &&& cond5 , 0 ,0, viol_0);
$width(negedge CK &&& cond5 , 0 ,0, viol_0);
$width(posedge CK &&& cond4 , 0 ,0, viol_0);
$width(negedge CK &&& cond4 , 0 ,0, viol_0);
$setuphold(negedge CK &&& ~SE , posedge D &&& ~SE , 0 ,0, viol_0, , , delayed_CK, delayed_D);
$setuphold(negedge CK &&& ~SE , negedge D &&& ~SE , 0 ,0, viol_0, , , delayed_CK, delayed_D);
$setuphold(negedge CK &&& cond0 , posedge SE &&& cond0 , 0 ,0, viol_0, , , delayed_CK, delayed_SE);
$setuphold(negedge CK &&& cond0 , negedge SE &&& cond0 , 0 ,0, viol_0, , , delayed_CK, delayed_SE);
$setuphold(negedge CK &&& cond1 , posedge SE &&& cond1 , 0 ,0, viol_0, , , delayed_CK, delayed_SE);
$setuphold(negedge CK &&& cond1 , negedge SE &&& cond1 , 0 ,0, viol_0, , , delayed_CK, delayed_SE);
$setuphold(negedge CK &&& cond3 , posedge SI &&& cond3 , 0 ,0, viol_0, , , delayed_CK, delayed_SI);
$setuphold(negedge CK &&& cond3 , negedge SI &&& cond3 , 0 ,0, viol_0, , , delayed_CK, delayed_SI);
$setuphold(negedge CK &&& cond2 , posedge SI &&& cond2 , 0 ,0, viol_0, , , delayed_CK, delayed_SI);
$setuphold(negedge CK &&& cond2 , negedge SI &&& cond2 , 0 ,0, viol_0, , , delayed_CK, delayed_SI);
endspecify
   `endif

endmodule
`endcelldefine

//%END SVN_FSDNQ_4

//%BEGIN SVN_FSDNRBQ_1

`celldefine
module SVN_FSDNRBQ_1 (Q, CK, D, SI, SE, RD);
   output Q;
   input CK, D, SI, SE, RD;

   reg viol_0;
   wire delayed_CK, delayed_D, delayed_SI,
	delayed_SE, delayed_RD;

   wire int_res__CK, int_res__RD, int_res__D, xcr_0;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////

`ifdef _fv
   buf (delayed_CK, CK);
   buf (delayed_D, D);
   buf (delayed_SI, SI);
   buf (delayed_SE, SE);
`endif
   buf (delayed_RD, RD);

   not (int_res__CK, delayed_CK);
   not (int_res__RD, delayed_RD);
   mux2 (int_res__D, delayed_SI, delayed_D, delayed_SE);
   dff_r_err (xcr_0, int_res__CK, int_res__D, int_res__RD);

   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////

   `ifdef VIRL_functiononly
       dff_r #`SNPS_SEQ_DELAY (Q, viol_0, int_res__CK, int_res__D, int_res__RD, xcr_0);
   `else
       dff_r (Q, viol_0, int_res__CK, int_res__D, int_res__RD, xcr_0);
   `endif

   `ifdef VIRL_functiononly

   `else

not U0 (_net_0, D);
not U1 (_net_1, SI);
and U2 (_net_2, RD, _net_0, SE, _net_1);
not U3 (_net_3, SI);
and U4 (_net_4, RD, D, SE, _net_3);
not U5 (_net_5, D);
not U6 (_net_6, SE);
and U7 (_net_7, RD, _net_5, _net_6);
or U8 (cond26, _net_2, _net_4, _net_7);
not U9 (_net_8, SE);
and U10 (_net_9, RD, D, _net_8);
and U11 (_net_10, RD, D, SE, SI);
not U12 (_net_11, D);
and U13 (_net_12, RD, _net_11, SE, SI);
or U14 (cond25, _net_9, _net_10, _net_12);
not U15 (_net_13, SE);
not U16 (_net_14, SI);
and U17 (cond1, _net_13, RD, _net_14);
not U18 (_net_15, SE);
and U19 (cond0, _net_15, RD, SI);
not U20 (_net_16, D);
not U21 (_net_17, CK);
not U22 (_net_18, SE);
not U23 (_net_19, SI);
and U24 (cond24, _net_16, _net_17, _net_18, _net_19);
not U25 (_net_20, D);
not U26 (_net_21, CK);
not U27 (_net_22, SE);
and U28 (cond23, _net_20, _net_21, _net_22, SI);
not U29 (_net_23, D);
not U30 (_net_24, CK);
and U31 (cond22, _net_23, _net_24, SE, SI);
not U32 (_net_25, CK);
not U33 (_net_26, SE);
not U34 (_net_27, SI);
and U35 (cond21, D, _net_25, _net_26, _net_27);
not U36 (_net_28, CK);
not U37 (_net_29, SE);
and U38 (cond20, D, _net_28, _net_29, SI);
not U39 (_net_30, CK);
and U40 (cond18, D, _net_30, SE, SI);
not U41 (_net_31, CK);
not U42 (_net_32, SI);
and U43 (cond19, SE, _net_31, _net_32);
not U44 (_net_33, D);
and U45 (cond9, SE, _net_33, SI);
not U46 (_net_34, D);
not U47 (_net_35, SE);
not U48 (_net_36, SI);
and U49 (cond17, _net_34, CK, _net_35, _net_36);
not U50 (_net_37, D);
not U51 (_net_38, SE);
and U52 (cond16, _net_37, CK, _net_38, SI);
not U53 (_net_39, D);
not U54 (_net_40, SI);
and U55 (cond15, _net_39, CK, SE, _net_40);
not U56 (_net_41, D);
and U57 (cond14, _net_41, CK, SE, SI);
not U58 (_net_42, SE);
not U59 (_net_43, SI);
and U60 (cond13, D, CK, _net_42, _net_43);
not U61 (_net_44, SE);
and U62 (cond12, D, CK, _net_44, SI);
not U63 (_net_45, SI);
and U64 (cond11, D, CK, SE, _net_45);
and U65 (cond10, D, CK, SE, SI);
not U66 (_net_46, SE);
not U67 (_net_47, SI);
and U68 (cond8, _net_46, D, _net_47);
not U69 (_net_48, SE);
and U70 (cond7, _net_48, D, SI);
and U71 (cond6, SE, D, SI);
not U72 (_net_49, D);
and U73 (cond2, RD, _net_49, SI);
not U74 (_net_50, SI);
and U75 (cond3, RD, D, _net_50);
not U76 (_net_51, D);
and U77 (cond5, RD, _net_51, SE);
and U78 (cond4, RD, D, SE);

specify
if ((~(CK) & ~(D) & ~(SE) & ~(SI))) (negedge RD => (Q +: 1'b0))=(0, 0);
if ((~(CK) & ~(D) & ~(SE) & SI)) (negedge RD => (Q +: 1'b0))=(0, 0);
if ((~(CK) & ~(D) & SE & SI)) (negedge RD => (Q +: 1'b0))=(0, 0);
if ((~(CK) & D & ~(SE) & ~(SI))) (negedge RD => (Q +: 1'b0))=(0, 0);
if ((~(CK) & D & ~(SE) & SI)) (negedge RD => (Q +: 1'b0))=(0, 0);
if ((~(CK) & D & SE & SI)) (negedge RD => (Q +: 1'b0))=(0, 0);
if ((~(CK) & SE & ~(SI))) (negedge RD => (Q +: 1'b0))=(0, 0);
if ((CK & ~(D) & ~(SE) & ~(SI))) (negedge RD => (Q +: 1'b0))=(0, 0);
if ((CK & ~(D) & ~(SE) & SI)) (negedge RD => (Q +: 1'b0))=(0, 0);
if ((CK & ~(D) & SE & ~(SI))) (negedge RD => (Q +: 1'b0))=(0, 0);
if ((CK & ~(D) & SE & SI)) (negedge RD => (Q +: 1'b0))=(0, 0);
if ((CK & D & ~(SE) & ~(SI))) (negedge RD => (Q +: 1'b0))=(0, 0);
if ((CK & D & ~(SE) & SI)) (negedge RD => (Q +: 1'b0))=(0, 0);
if ((CK & D & SE & ~(SI))) (negedge RD => (Q +: 1'b0))=(0, 0);
if ((CK & D & SE & SI)) (negedge RD => (Q +: 1'b0))=(0, 0);
(negedge RD => (Q:1'b0))=(0, 0);
(negedge CK => (Q : 1'b1))=(0, 0);
$width(posedge CK &&& cond26 , 0 ,0, viol_0);
$width(negedge CK &&& cond26 , 0 ,0, viol_0);
$width(posedge CK &&& cond25 , 0 ,0, viol_0);
$width(negedge CK &&& cond25 , 0 ,0, viol_0);
$setuphold(negedge CK &&& cond1 , posedge D &&& cond1 , 0 ,0, viol_0, , , delayed_CK, delayed_D);
$setuphold(negedge CK &&& cond1 , negedge D &&& cond1 , 0 ,0, viol_0, , , delayed_CK, delayed_D);
$setuphold(negedge CK &&& cond0 , posedge D &&& cond0 , 0 ,0, viol_0, , , delayed_CK, delayed_D);
$setuphold(negedge CK &&& cond0 , negedge D &&& cond0 , 0 ,0, viol_0, , , delayed_CK, delayed_D);
$width(negedge RD &&& cond24 , 0 ,0, viol_0);
$width(negedge RD &&& cond23 , 0 ,0, viol_0);
$width(negedge RD &&& cond22 , 0 ,0, viol_0);
$width(negedge RD &&& cond21 , 0 ,0, viol_0);
$width(negedge RD &&& cond20 , 0 ,0, viol_0);
$width(negedge RD &&& cond18 , 0 ,0, viol_0);
$width(negedge RD &&& cond19 , 0 ,0, viol_0);
$recovery(posedge RD &&& cond9 , negedge CK &&& cond9 , 0 , viol_0);
$hold(negedge CK &&& cond9 , posedge RD &&& cond9 , 0 , viol_0);
$width(negedge RD &&& cond17 , 0 ,0, viol_0);
$width(negedge RD &&& cond16 , 0 ,0, viol_0);
$width(negedge RD &&& cond15 , 0 ,0, viol_0);
$width(negedge RD &&& cond14 , 0 ,0, viol_0);
$width(negedge RD &&& cond13 , 0 ,0, viol_0);
$width(negedge RD &&& cond12 , 0 ,0, viol_0);
$width(negedge RD &&& cond11 , 0 ,0, viol_0);
$width(negedge RD &&& cond10 , 0 ,0, viol_0);
$recovery(posedge RD &&& cond8 , negedge CK &&& cond8 , 0 , viol_0);
$hold(negedge CK &&& cond8 , posedge RD &&& cond8 , 0 , viol_0);
$recovery(posedge RD &&& cond7 , negedge CK &&& cond7 , 0 , viol_0);
$hold(negedge CK &&& cond7 , posedge RD &&& cond7 , 0 , viol_0);
$recovery(posedge RD &&& cond6 , negedge CK &&& cond6 , 0 , viol_0);
$hold(negedge CK &&& cond6 , posedge RD &&& cond6 , 0 , viol_0);
$setuphold(negedge CK &&& cond2 , posedge SE &&& cond2 , 0 ,0, viol_0, , , delayed_CK, delayed_SE);
$setuphold(negedge CK &&& cond2 , negedge SE &&& cond2 , 0 ,0, viol_0, , , delayed_CK, delayed_SE);
$setuphold(negedge CK &&& cond3 , posedge SE &&& cond3 , 0 ,0, viol_0, , , delayed_CK, delayed_SE);
$setuphold(negedge CK &&& cond3 , negedge SE &&& cond3 , 0 ,0, viol_0, , , delayed_CK, delayed_SE);
$setuphold(negedge CK &&& cond5 , posedge SI &&& cond5 , 0 ,0, viol_0, , , delayed_CK, delayed_SI);
$setuphold(negedge CK &&& cond5 , negedge SI &&& cond5 , 0 ,0, viol_0, , , delayed_CK, delayed_SI);
$setuphold(negedge CK &&& cond4 , posedge SI &&& cond4 , 0 ,0, viol_0, , , delayed_CK, delayed_SI);
$setuphold(negedge CK &&& cond4 , negedge SI &&& cond4 , 0 ,0, viol_0, , , delayed_CK, delayed_SI);
endspecify
   `endif

endmodule
`endcelldefine

//%END SVN_FSDNRBQ_1

//%BEGIN SVN_FSDNRBQ_2

`celldefine
module SVN_FSDNRBQ_2 (Q, CK, D, SI, SE, RD);
   output Q;
   input CK, D, SI, SE, RD;

   reg viol_0;
   wire delayed_CK, delayed_D, delayed_SI,
	delayed_SE, delayed_RD;

   wire int_res__CK, int_res__RD, int_res__D, xcr_0;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////

`ifdef _fv
   buf (delayed_CK, CK);
   buf (delayed_D, D);
   buf (delayed_SI, SI);
   buf (delayed_SE, SE);
`endif
   buf (delayed_RD, RD);

   not (int_res__CK, delayed_CK);
   not (int_res__RD, delayed_RD);
   mux2 (int_res__D, delayed_SI, delayed_D, delayed_SE);
   dff_r_err (xcr_0, int_res__CK, int_res__D, int_res__RD);

   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////

   `ifdef VIRL_functiononly
       dff_r #`SNPS_SEQ_DELAY (Q, viol_0, int_res__CK, int_res__D, int_res__RD, xcr_0);
   `else
       dff_r (Q, viol_0, int_res__CK, int_res__D, int_res__RD, xcr_0);
   `endif

   `ifdef VIRL_functiononly

   `else

not U0 (_net_0, D);
not U1 (_net_1, SI);
and U2 (_net_2, RD, _net_0, SE, _net_1);
not U3 (_net_3, SI);
and U4 (_net_4, RD, D, SE, _net_3);
not U5 (_net_5, D);
not U6 (_net_6, SE);
and U7 (_net_7, RD, _net_5, _net_6);
or U8 (cond26, _net_2, _net_4, _net_7);
not U9 (_net_8, SE);
and U10 (_net_9, RD, D, _net_8);
and U11 (_net_10, RD, D, SE, SI);
not U12 (_net_11, D);
and U13 (_net_12, RD, _net_11, SE, SI);
or U14 (cond25, _net_9, _net_10, _net_12);
not U15 (_net_13, SE);
not U16 (_net_14, SI);
and U17 (cond1, _net_13, RD, _net_14);
not U18 (_net_15, SE);
and U19 (cond0, _net_15, RD, SI);
not U20 (_net_16, D);
not U21 (_net_17, CK);
not U22 (_net_18, SE);
not U23 (_net_19, SI);
and U24 (cond24, _net_16, _net_17, _net_18, _net_19);
not U25 (_net_20, D);
not U26 (_net_21, CK);
not U27 (_net_22, SE);
and U28 (cond23, _net_20, _net_21, _net_22, SI);
not U29 (_net_23, D);
not U30 (_net_24, CK);
and U31 (cond22, _net_23, _net_24, SE, SI);
not U32 (_net_25, CK);
not U33 (_net_26, SE);
not U34 (_net_27, SI);
and U35 (cond21, D, _net_25, _net_26, _net_27);
not U36 (_net_28, CK);
not U37 (_net_29, SE);
and U38 (cond20, D, _net_28, _net_29, SI);
not U39 (_net_30, CK);
and U40 (cond18, D, _net_30, SE, SI);
not U41 (_net_31, CK);
not U42 (_net_32, SI);
and U43 (cond19, SE, _net_31, _net_32);
not U44 (_net_33, D);
and U45 (cond9, SE, _net_33, SI);
not U46 (_net_34, D);
not U47 (_net_35, SE);
not U48 (_net_36, SI);
and U49 (cond17, _net_34, CK, _net_35, _net_36);
not U50 (_net_37, D);
not U51 (_net_38, SE);
and U52 (cond16, _net_37, CK, _net_38, SI);
not U53 (_net_39, D);
not U54 (_net_40, SI);
and U55 (cond15, _net_39, CK, SE, _net_40);
not U56 (_net_41, D);
and U57 (cond14, _net_41, CK, SE, SI);
not U58 (_net_42, SE);
not U59 (_net_43, SI);
and U60 (cond13, D, CK, _net_42, _net_43);
not U61 (_net_44, SE);
and U62 (cond12, D, CK, _net_44, SI);
not U63 (_net_45, SI);
and U64 (cond11, D, CK, SE, _net_45);
and U65 (cond10, D, CK, SE, SI);
not U66 (_net_46, SE);
not U67 (_net_47, SI);
and U68 (cond8, _net_46, D, _net_47);
not U69 (_net_48, SE);
and U70 (cond7, _net_48, D, SI);
and U71 (cond6, SE, D, SI);
not U72 (_net_49, D);
and U73 (cond2, RD, _net_49, SI);
not U74 (_net_50, SI);
and U75 (cond3, RD, D, _net_50);
not U76 (_net_51, D);
and U77 (cond5, RD, _net_51, SE);
and U78 (cond4, RD, D, SE);

specify
if ((~(CK) & ~(D) & ~(SE) & ~(SI))) (negedge RD => (Q +: 1'b0))=(0, 0);
if ((~(CK) & ~(D) & ~(SE) & SI)) (negedge RD => (Q +: 1'b0))=(0, 0);
if ((~(CK) & ~(D) & SE & SI)) (negedge RD => (Q +: 1'b0))=(0, 0);
if ((~(CK) & D & ~(SE) & ~(SI))) (negedge RD => (Q +: 1'b0))=(0, 0);
if ((~(CK) & D & ~(SE) & SI)) (negedge RD => (Q +: 1'b0))=(0, 0);
if ((~(CK) & D & SE & SI)) (negedge RD => (Q +: 1'b0))=(0, 0);
if ((~(CK) & SE & ~(SI))) (negedge RD => (Q +: 1'b0))=(0, 0);
if ((CK & ~(D) & ~(SE) & ~(SI))) (negedge RD => (Q +: 1'b0))=(0, 0);
if ((CK & ~(D) & ~(SE) & SI)) (negedge RD => (Q +: 1'b0))=(0, 0);
if ((CK & ~(D) & SE & ~(SI))) (negedge RD => (Q +: 1'b0))=(0, 0);
if ((CK & ~(D) & SE & SI)) (negedge RD => (Q +: 1'b0))=(0, 0);
if ((CK & D & ~(SE) & ~(SI))) (negedge RD => (Q +: 1'b0))=(0, 0);
if ((CK & D & ~(SE) & SI)) (negedge RD => (Q +: 1'b0))=(0, 0);
if ((CK & D & SE & ~(SI))) (negedge RD => (Q +: 1'b0))=(0, 0);
if ((CK & D & SE & SI)) (negedge RD => (Q +: 1'b0))=(0, 0);
(negedge RD => (Q:1'b0))=(0, 0);
(negedge CK => (Q : 1'b1))=(0, 0);
$width(posedge CK &&& cond26 , 0 ,0, viol_0);
$width(negedge CK &&& cond26 , 0 ,0, viol_0);
$width(posedge CK &&& cond25 , 0 ,0, viol_0);
$width(negedge CK &&& cond25 , 0 ,0, viol_0);
$setuphold(negedge CK &&& cond1 , posedge D &&& cond1 , 0 ,0, viol_0, , , delayed_CK, delayed_D);
$setuphold(negedge CK &&& cond1 , negedge D &&& cond1 , 0 ,0, viol_0, , , delayed_CK, delayed_D);
$setuphold(negedge CK &&& cond0 , posedge D &&& cond0 , 0 ,0, viol_0, , , delayed_CK, delayed_D);
$setuphold(negedge CK &&& cond0 , negedge D &&& cond0 , 0 ,0, viol_0, , , delayed_CK, delayed_D);
$width(negedge RD &&& cond24 , 0 ,0, viol_0);
$width(negedge RD &&& cond23 , 0 ,0, viol_0);
$width(negedge RD &&& cond22 , 0 ,0, viol_0);
$width(negedge RD &&& cond21 , 0 ,0, viol_0);
$width(negedge RD &&& cond20 , 0 ,0, viol_0);
$width(negedge RD &&& cond18 , 0 ,0, viol_0);
$width(negedge RD &&& cond19 , 0 ,0, viol_0);
$recovery(posedge RD &&& cond9 , negedge CK &&& cond9 , 0 , viol_0);
$hold(negedge CK &&& cond9 , posedge RD &&& cond9 , 0 , viol_0);
$width(negedge RD &&& cond17 , 0 ,0, viol_0);
$width(negedge RD &&& cond16 , 0 ,0, viol_0);
$width(negedge RD &&& cond15 , 0 ,0, viol_0);
$width(negedge RD &&& cond14 , 0 ,0, viol_0);
$width(negedge RD &&& cond13 , 0 ,0, viol_0);
$width(negedge RD &&& cond12 , 0 ,0, viol_0);
$width(negedge RD &&& cond11 , 0 ,0, viol_0);
$width(negedge RD &&& cond10 , 0 ,0, viol_0);
$recovery(posedge RD &&& cond8 , negedge CK &&& cond8 , 0 , viol_0);
$hold(negedge CK &&& cond8 , posedge RD &&& cond8 , 0 , viol_0);
$recovery(posedge RD &&& cond7 , negedge CK &&& cond7 , 0 , viol_0);
$hold(negedge CK &&& cond7 , posedge RD &&& cond7 , 0 , viol_0);
$recovery(posedge RD &&& cond6 , negedge CK &&& cond6 , 0 , viol_0);
$hold(negedge CK &&& cond6 , posedge RD &&& cond6 , 0 , viol_0);
$setuphold(negedge CK &&& cond2 , posedge SE &&& cond2 , 0 ,0, viol_0, , , delayed_CK, delayed_SE);
$setuphold(negedge CK &&& cond2 , negedge SE &&& cond2 , 0 ,0, viol_0, , , delayed_CK, delayed_SE);
$setuphold(negedge CK &&& cond3 , posedge SE &&& cond3 , 0 ,0, viol_0, , , delayed_CK, delayed_SE);
$setuphold(negedge CK &&& cond3 , negedge SE &&& cond3 , 0 ,0, viol_0, , , delayed_CK, delayed_SE);
$setuphold(negedge CK &&& cond5 , posedge SI &&& cond5 , 0 ,0, viol_0, , , delayed_CK, delayed_SI);
$setuphold(negedge CK &&& cond5 , negedge SI &&& cond5 , 0 ,0, viol_0, , , delayed_CK, delayed_SI);
$setuphold(negedge CK &&& cond4 , posedge SI &&& cond4 , 0 ,0, viol_0, , , delayed_CK, delayed_SI);
$setuphold(negedge CK &&& cond4 , negedge SI &&& cond4 , 0 ,0, viol_0, , , delayed_CK, delayed_SI);
endspecify
   `endif

endmodule
`endcelldefine

//%END SVN_FSDNRBQ_2

//%BEGIN SVN_FSDNRBQ_4

`celldefine
module SVN_FSDNRBQ_4 (Q, CK, D, SI, SE, RD);
   output Q;
   input CK, D, SI, SE, RD;

   reg viol_0;
   wire delayed_CK, delayed_D, delayed_SI,
	delayed_SE, delayed_RD;

   wire int_res__CK, int_res__RD, int_res__D, xcr_0;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////

`ifdef _fv
   buf (delayed_CK, CK);
   buf (delayed_D, D);
   buf (delayed_SI, SI);
   buf (delayed_SE, SE);
`endif
   buf (delayed_RD, RD);

   not (int_res__CK, delayed_CK);
   not (int_res__RD, delayed_RD);
   mux2 (int_res__D, delayed_SI, delayed_D, delayed_SE);
   dff_r_err (xcr_0, int_res__CK, int_res__D, int_res__RD);

   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////

   `ifdef VIRL_functiononly
       dff_r #`SNPS_SEQ_DELAY (Q, viol_0, int_res__CK, int_res__D, int_res__RD, xcr_0);
   `else
       dff_r (Q, viol_0, int_res__CK, int_res__D, int_res__RD, xcr_0);
   `endif

   `ifdef VIRL_functiononly

   `else

not U0 (_net_0, D);
not U1 (_net_1, SI);
and U2 (_net_2, RD, _net_0, SE, _net_1);
not U3 (_net_3, SI);
and U4 (_net_4, RD, D, SE, _net_3);
not U5 (_net_5, D);
not U6 (_net_6, SE);
and U7 (_net_7, RD, _net_5, _net_6);
or U8 (cond26, _net_2, _net_4, _net_7);
not U9 (_net_8, SE);
and U10 (_net_9, RD, D, _net_8);
and U11 (_net_10, RD, D, SE, SI);
not U12 (_net_11, D);
and U13 (_net_12, RD, _net_11, SE, SI);
or U14 (cond25, _net_9, _net_10, _net_12);
not U15 (_net_13, SE);
not U16 (_net_14, SI);
and U17 (cond1, _net_13, RD, _net_14);
not U18 (_net_15, SE);
and U19 (cond0, _net_15, RD, SI);
not U20 (_net_16, D);
not U21 (_net_17, CK);
not U22 (_net_18, SE);
not U23 (_net_19, SI);
and U24 (cond24, _net_16, _net_17, _net_18, _net_19);
not U25 (_net_20, D);
not U26 (_net_21, CK);
not U27 (_net_22, SE);
and U28 (cond23, _net_20, _net_21, _net_22, SI);
not U29 (_net_23, D);
not U30 (_net_24, CK);
and U31 (cond22, _net_23, _net_24, SE, SI);
not U32 (_net_25, CK);
not U33 (_net_26, SE);
not U34 (_net_27, SI);
and U35 (cond21, D, _net_25, _net_26, _net_27);
not U36 (_net_28, CK);
not U37 (_net_29, SE);
and U38 (cond20, D, _net_28, _net_29, SI);
not U39 (_net_30, CK);
and U40 (cond18, D, _net_30, SE, SI);
not U41 (_net_31, CK);
not U42 (_net_32, SI);
and U43 (cond19, SE, _net_31, _net_32);
not U44 (_net_33, D);
and U45 (cond9, SE, _net_33, SI);
not U46 (_net_34, D);
not U47 (_net_35, SE);
not U48 (_net_36, SI);
and U49 (cond17, _net_34, CK, _net_35, _net_36);
not U50 (_net_37, D);
not U51 (_net_38, SE);
and U52 (cond16, _net_37, CK, _net_38, SI);
not U53 (_net_39, D);
not U54 (_net_40, SI);
and U55 (cond15, _net_39, CK, SE, _net_40);
not U56 (_net_41, D);
and U57 (cond14, _net_41, CK, SE, SI);
not U58 (_net_42, SE);
not U59 (_net_43, SI);
and U60 (cond13, D, CK, _net_42, _net_43);
not U61 (_net_44, SE);
and U62 (cond12, D, CK, _net_44, SI);
not U63 (_net_45, SI);
and U64 (cond11, D, CK, SE, _net_45);
and U65 (cond10, D, CK, SE, SI);
not U66 (_net_46, SE);
not U67 (_net_47, SI);
and U68 (cond8, _net_46, D, _net_47);
not U69 (_net_48, SE);
and U70 (cond7, _net_48, D, SI);
and U71 (cond6, SE, D, SI);
not U72 (_net_49, D);
and U73 (cond2, RD, _net_49, SI);
not U74 (_net_50, SI);
and U75 (cond3, RD, D, _net_50);
not U76 (_net_51, D);
and U77 (cond5, RD, _net_51, SE);
and U78 (cond4, RD, D, SE);

specify
if ((~(CK) & ~(D) & ~(SE) & ~(SI))) (negedge RD => (Q +: 1'b0))=(0, 0);
if ((~(CK) & ~(D) & ~(SE) & SI)) (negedge RD => (Q +: 1'b0))=(0, 0);
if ((~(CK) & ~(D) & SE & SI)) (negedge RD => (Q +: 1'b0))=(0, 0);
if ((~(CK) & D & ~(SE) & ~(SI))) (negedge RD => (Q +: 1'b0))=(0, 0);
if ((~(CK) & D & ~(SE) & SI)) (negedge RD => (Q +: 1'b0))=(0, 0);
if ((~(CK) & D & SE & SI)) (negedge RD => (Q +: 1'b0))=(0, 0);
if ((~(CK) & SE & ~(SI))) (negedge RD => (Q +: 1'b0))=(0, 0);
if ((CK & ~(D) & ~(SE) & ~(SI))) (negedge RD => (Q +: 1'b0))=(0, 0);
if ((CK & ~(D) & ~(SE) & SI)) (negedge RD => (Q +: 1'b0))=(0, 0);
if ((CK & ~(D) & SE & ~(SI))) (negedge RD => (Q +: 1'b0))=(0, 0);
if ((CK & ~(D) & SE & SI)) (negedge RD => (Q +: 1'b0))=(0, 0);
if ((CK & D & ~(SE) & ~(SI))) (negedge RD => (Q +: 1'b0))=(0, 0);
if ((CK & D & ~(SE) & SI)) (negedge RD => (Q +: 1'b0))=(0, 0);
if ((CK & D & SE & ~(SI))) (negedge RD => (Q +: 1'b0))=(0, 0);
if ((CK & D & SE & SI)) (negedge RD => (Q +: 1'b0))=(0, 0);
(negedge RD => (Q:1'b0))=(0, 0);
(negedge CK => (Q : 1'b1))=(0, 0);
$width(posedge CK &&& cond26 , 0 ,0, viol_0);
$width(negedge CK &&& cond26 , 0 ,0, viol_0);
$width(posedge CK &&& cond25 , 0 ,0, viol_0);
$width(negedge CK &&& cond25 , 0 ,0, viol_0);
$setuphold(negedge CK &&& cond1 , posedge D &&& cond1 , 0 ,0, viol_0, , , delayed_CK, delayed_D);
$setuphold(negedge CK &&& cond1 , negedge D &&& cond1 , 0 ,0, viol_0, , , delayed_CK, delayed_D);
$setuphold(negedge CK &&& cond0 , posedge D &&& cond0 , 0 ,0, viol_0, , , delayed_CK, delayed_D);
$setuphold(negedge CK &&& cond0 , negedge D &&& cond0 , 0 ,0, viol_0, , , delayed_CK, delayed_D);
$width(negedge RD &&& cond24 , 0 ,0, viol_0);
$width(negedge RD &&& cond23 , 0 ,0, viol_0);
$width(negedge RD &&& cond22 , 0 ,0, viol_0);
$width(negedge RD &&& cond21 , 0 ,0, viol_0);
$width(negedge RD &&& cond20 , 0 ,0, viol_0);
$width(negedge RD &&& cond18 , 0 ,0, viol_0);
$width(negedge RD &&& cond19 , 0 ,0, viol_0);
$recovery(posedge RD &&& cond9 , negedge CK &&& cond9 , 0 , viol_0);
$hold(negedge CK &&& cond9 , posedge RD &&& cond9 , 0 , viol_0);
$width(negedge RD &&& cond17 , 0 ,0, viol_0);
$width(negedge RD &&& cond16 , 0 ,0, viol_0);
$width(negedge RD &&& cond15 , 0 ,0, viol_0);
$width(negedge RD &&& cond14 , 0 ,0, viol_0);
$width(negedge RD &&& cond13 , 0 ,0, viol_0);
$width(negedge RD &&& cond12 , 0 ,0, viol_0);
$width(negedge RD &&& cond11 , 0 ,0, viol_0);
$width(negedge RD &&& cond10 , 0 ,0, viol_0);
$recovery(posedge RD &&& cond8 , negedge CK &&& cond8 , 0 , viol_0);
$hold(negedge CK &&& cond8 , posedge RD &&& cond8 , 0 , viol_0);
$recovery(posedge RD &&& cond7 , negedge CK &&& cond7 , 0 , viol_0);
$hold(negedge CK &&& cond7 , posedge RD &&& cond7 , 0 , viol_0);
$recovery(posedge RD &&& cond6 , negedge CK &&& cond6 , 0 , viol_0);
$hold(negedge CK &&& cond6 , posedge RD &&& cond6 , 0 , viol_0);
$setuphold(negedge CK &&& cond2 , posedge SE &&& cond2 , 0 ,0, viol_0, , , delayed_CK, delayed_SE);
$setuphold(negedge CK &&& cond2 , negedge SE &&& cond2 , 0 ,0, viol_0, , , delayed_CK, delayed_SE);
$setuphold(negedge CK &&& cond3 , posedge SE &&& cond3 , 0 ,0, viol_0, , , delayed_CK, delayed_SE);
$setuphold(negedge CK &&& cond3 , negedge SE &&& cond3 , 0 ,0, viol_0, , , delayed_CK, delayed_SE);
$setuphold(negedge CK &&& cond5 , posedge SI &&& cond5 , 0 ,0, viol_0, , , delayed_CK, delayed_SI);
$setuphold(negedge CK &&& cond5 , negedge SI &&& cond5 , 0 ,0, viol_0, , , delayed_CK, delayed_SI);
$setuphold(negedge CK &&& cond4 , posedge SI &&& cond4 , 0 ,0, viol_0, , , delayed_CK, delayed_SI);
$setuphold(negedge CK &&& cond4 , negedge SI &&& cond4 , 0 ,0, viol_0, , , delayed_CK, delayed_SI);
endspecify
   `endif

endmodule
`endcelldefine

//%END SVN_FSDNRBQ_4

//%BEGIN SVN_FSDNSBQ_1

`celldefine
module SVN_FSDNSBQ_1 (Q, CK, D, SI, SE, SD);
   output Q;
   input CK, D, SI, SE, SD;

   reg viol_0;
   wire delayed_CK, delayed_D, delayed_SI,
	delayed_SE, delayed_SD;

   wire int_res__CK, int_res__D, int_res__SD, xcr_0;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////

`ifdef _fv
   buf (delayed_CK, CK);
   buf (delayed_D, D);
   buf (delayed_SI, SI);
   buf (delayed_SE, SE);
`endif
   buf (delayed_SD, SD);


   not (int_res__CK, delayed_CK);
   mux2 (int_res__D, delayed_SI, delayed_D, delayed_SE);
   not (int_res__SD, delayed_SD);
   dff_s_err (xcr_0, int_res__CK, int_res__D, int_res__SD);

`ifdef VIRL_functiononly
   dff_s #`SNPS_SEQ_DELAY (Q, viol_0, int_res__CK, int_res__D, int_res__SD, xcr_0);
`else
   dff_s (Q, viol_0, int_res__CK, int_res__D, int_res__SD, xcr_0);
`endif

   `ifdef VIRL_functiononly

   `else

   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////

not U0 (_net_0, D);
not U1 (_net_1, SI);
and U2 (_net_2, SD, _net_0, SE, _net_1);
not U3 (_net_3, SI);
and U4 (_net_4, SD, D, SE, _net_3);
not U5 (_net_5, D);
not U6 (_net_6, SE);
and U7 (_net_7, SD, _net_5, _net_6);
or U8 (cond11, _net_2, _net_4, _net_7);
not U9 (_net_8, SE);
and U10 (_net_9, SD, D, _net_8);
and U11 (_net_10, SD, D, SE, SI);
not U12 (_net_11, D);
and U13 (_net_12, SD, _net_11, SE, SI);
or U14 (cond10, _net_9, _net_10, _net_12);
not U15 (_net_13, SE);
and U16 (cond0, _net_13, SD);
not U17 (_net_14, SE);
not U18 (_net_15, D);
and U19 (cond7, _net_14, _net_15);
not U20 (_net_16, D);
not U21 (_net_17, SI);
and U22 (cond6, SE, _net_16, _net_17);
not U23 (_net_18, D);
not U24 (_net_19, SI);
and U25 (_net_20, _net_18, CK, SE, _net_19);
not U26 (_net_21, SI);
and U27 (_net_22, D, CK, SE, _net_21);
not U28 (_net_23, D);
not U29 (_net_24, SE);
and U30 (_net_25, _net_23, CK, _net_24);
or U31 (cond9, _net_20, _net_22, _net_25);
not U32 (_net_26, SE);
and U33 (_net_27, D, CK, _net_26);
and U34 (_net_28, D, CK, SE, SI);
not U35 (_net_29, D);
and U36 (_net_30, _net_29, CK, SE, SI);
or U37 (cond8, _net_27, _net_28, _net_30);
not U38 (_net_31, SI);
and U39 (cond5, SE, D, _net_31);
not U40 (_net_32, D);
and U41 (cond1, SD, _net_32, SI);
not U42 (_net_33, SI);
and U43 (cond2, SD, D, _net_33);
not U44 (_net_34, D);
and U45 (cond4, SD, _net_34, SE);
and U46 (cond3, SD, D, SE);

specify
if (~(CK)) (negedge SD => (Q -: 1'b1))=(0, 0);
if ((CK & D & SE & ~(SI)) | (CK & ~(D) & SE & ~(SI)) | (CK & ~(D) & ~(SE))) (negedge SD => (Q -: 1'b1))=(0, 0);
if ((CK & D & SE & SI) | (CK & D & ~(SE)) | (CK & ~(D) & SE & SI)) (negedge SD => (Q -: 1'b1))=(0, 0);
(negedge SD => (Q:1'b1))=(0, 0);
(negedge CK => (Q : 1'b1))=(0, 0);
$width(posedge CK &&& cond11 , 0 ,0, viol_0);
$width(negedge CK &&& cond11 , 0 ,0, viol_0);
$width(posedge CK &&& cond10 , 0 ,0, viol_0);
$width(negedge CK &&& cond10 , 0 ,0, viol_0);
$setuphold(negedge CK &&& cond0 , posedge D &&& cond0 , 0 ,0, viol_0, , , delayed_CK, delayed_D);
$setuphold(negedge CK &&& cond0 , negedge D &&& cond0 , 0 ,0, viol_0, , , delayed_CK, delayed_D);
$width(negedge SD &&& ~CK , 0 ,0, viol_0);
$recovery(posedge SD &&& cond7 , negedge CK &&& cond7 , 0 , viol_0);
$hold(negedge CK &&& cond7 , posedge SD &&& cond7 , 0 , viol_0);
$recovery(posedge SD &&& cond6 , negedge CK &&& cond6 , 0 , viol_0);
$hold(negedge CK &&& cond6 , posedge SD &&& cond6 , 0 , viol_0);
$width(negedge SD &&& cond9 , 0 ,0, viol_0);
$width(negedge SD &&& cond8 , 0 ,0, viol_0);
$recovery(posedge SD &&& cond5 , negedge CK &&& cond5 , 0 , viol_0);
$hold(negedge CK &&& cond5 , posedge SD &&& cond5 , 0 , viol_0);
$setuphold(negedge CK &&& cond1 , posedge SE &&& cond1 , 0 ,0, viol_0, , , delayed_CK, delayed_SE);
$setuphold(negedge CK &&& cond1 , negedge SE &&& cond1 , 0 ,0, viol_0, , , delayed_CK, delayed_SE);
$setuphold(negedge CK &&& cond2 , posedge SE &&& cond2 , 0 ,0, viol_0, , , delayed_CK, delayed_SE);
$setuphold(negedge CK &&& cond2 , negedge SE &&& cond2 , 0 ,0, viol_0, , , delayed_CK, delayed_SE);
$setuphold(negedge CK &&& cond4 , posedge SI &&& cond4 , 0 ,0, viol_0, , , delayed_CK, delayed_SI);
$setuphold(negedge CK &&& cond4 , negedge SI &&& cond4 , 0 ,0, viol_0, , , delayed_CK, delayed_SI);
$setuphold(negedge CK &&& cond3 , posedge SI &&& cond3 , 0 ,0, viol_0, , , delayed_CK, delayed_SI);
$setuphold(negedge CK &&& cond3 , negedge SI &&& cond3 , 0 ,0, viol_0, , , delayed_CK, delayed_SI);
endspecify
   `endif
endmodule
`endcelldefine

//%END SVN_FSDNSBQ_1

//%BEGIN SVN_FSDNSBQ_2

`celldefine
module SVN_FSDNSBQ_2 (Q, CK, D, SI, SE, SD);
   output Q;
   input CK, D, SI, SE, SD;

   reg viol_0;
   wire delayed_CK, delayed_D, delayed_SI,
	delayed_SE, delayed_SD;

   wire int_res__CK, int_res__D, int_res__SD, xcr_0;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////

`ifdef _fv
   buf (delayed_CK, CK);
   buf (delayed_D, D);
   buf (delayed_SI, SI);
   buf (delayed_SE, SE);
`endif
   buf (delayed_SD, SD);


   not (int_res__CK, delayed_CK);
   mux2 (int_res__D, delayed_SI, delayed_D, delayed_SE);
   not (int_res__SD, delayed_SD);
   dff_s_err (xcr_0, int_res__CK, int_res__D, int_res__SD);

`ifdef VIRL_functiononly
   dff_s #`SNPS_SEQ_DELAY (Q, viol_0, int_res__CK, int_res__D, int_res__SD, xcr_0);
`else
   dff_s (Q, viol_0, int_res__CK, int_res__D, int_res__SD, xcr_0);
`endif

   `ifdef VIRL_functiononly

   `else

   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////

not U0 (_net_0, D);
not U1 (_net_1, SI);
and U2 (_net_2, SD, _net_0, SE, _net_1);
not U3 (_net_3, SI);
and U4 (_net_4, SD, D, SE, _net_3);
not U5 (_net_5, D);
not U6 (_net_6, SE);
and U7 (_net_7, SD, _net_5, _net_6);
or U8 (cond11, _net_2, _net_4, _net_7);
not U9 (_net_8, SE);
and U10 (_net_9, SD, D, _net_8);
and U11 (_net_10, SD, D, SE, SI);
not U12 (_net_11, D);
and U13 (_net_12, SD, _net_11, SE, SI);
or U14 (cond10, _net_9, _net_10, _net_12);
not U15 (_net_13, SE);
and U16 (cond0, _net_13, SD);
not U17 (_net_14, SE);
not U18 (_net_15, D);
and U19 (cond7, _net_14, _net_15);
not U20 (_net_16, D);
not U21 (_net_17, SI);
and U22 (cond6, SE, _net_16, _net_17);
not U23 (_net_18, D);
not U24 (_net_19, SI);
and U25 (_net_20, _net_18, CK, SE, _net_19);
not U26 (_net_21, SI);
and U27 (_net_22, D, CK, SE, _net_21);
not U28 (_net_23, D);
not U29 (_net_24, SE);
and U30 (_net_25, _net_23, CK, _net_24);
or U31 (cond9, _net_20, _net_22, _net_25);
not U32 (_net_26, SE);
and U33 (_net_27, D, CK, _net_26);
and U34 (_net_28, D, CK, SE, SI);
not U35 (_net_29, D);
and U36 (_net_30, _net_29, CK, SE, SI);
or U37 (cond8, _net_27, _net_28, _net_30);
not U38 (_net_31, SI);
and U39 (cond5, SE, D, _net_31);
not U40 (_net_32, D);
and U41 (cond1, SD, _net_32, SI);
not U42 (_net_33, SI);
and U43 (cond2, SD, D, _net_33);
not U44 (_net_34, D);
and U45 (cond4, SD, _net_34, SE);
and U46 (cond3, SD, D, SE);

specify
if (~(CK)) (negedge SD => (Q -: 1'b1))=(0, 0);
if ((CK & D & SE & ~(SI)) | (CK & ~(D) & SE & ~(SI)) | (CK & ~(D) & ~(SE))) (negedge SD => (Q -: 1'b1))=(0, 0);
if ((CK & D & SE & SI) | (CK & D & ~(SE)) | (CK & ~(D) & SE & SI)) (negedge SD => (Q -: 1'b1))=(0, 0);
(negedge SD => (Q:1'b1))=(0, 0);
(negedge CK => (Q : 1'b1))=(0, 0);
$width(posedge CK &&& cond11 , 0 ,0, viol_0);
$width(negedge CK &&& cond11 , 0 ,0, viol_0);
$width(posedge CK &&& cond10 , 0 ,0, viol_0);
$width(negedge CK &&& cond10 , 0 ,0, viol_0);
$setuphold(negedge CK &&& cond0 , posedge D &&& cond0 , 0 ,0, viol_0, , , delayed_CK, delayed_D);
$setuphold(negedge CK &&& cond0 , negedge D &&& cond0 , 0 ,0, viol_0, , , delayed_CK, delayed_D);
$width(negedge SD &&& ~CK , 0 ,0, viol_0);
$recovery(posedge SD &&& cond7 , negedge CK &&& cond7 , 0 , viol_0);
$hold(negedge CK &&& cond7 , posedge SD &&& cond7 , 0 , viol_0);
$recovery(posedge SD &&& cond6 , negedge CK &&& cond6 , 0 , viol_0);
$hold(negedge CK &&& cond6 , posedge SD &&& cond6 , 0 , viol_0);
$width(negedge SD &&& cond9 , 0 ,0, viol_0);
$width(negedge SD &&& cond8 , 0 ,0, viol_0);
$recovery(posedge SD &&& cond5 , negedge CK &&& cond5 , 0 , viol_0);
$hold(negedge CK &&& cond5 , posedge SD &&& cond5 , 0 , viol_0);
$setuphold(negedge CK &&& cond1 , posedge SE &&& cond1 , 0 ,0, viol_0, , , delayed_CK, delayed_SE);
$setuphold(negedge CK &&& cond1 , negedge SE &&& cond1 , 0 ,0, viol_0, , , delayed_CK, delayed_SE);
$setuphold(negedge CK &&& cond2 , posedge SE &&& cond2 , 0 ,0, viol_0, , , delayed_CK, delayed_SE);
$setuphold(negedge CK &&& cond2 , negedge SE &&& cond2 , 0 ,0, viol_0, , , delayed_CK, delayed_SE);
$setuphold(negedge CK &&& cond4 , posedge SI &&& cond4 , 0 ,0, viol_0, , , delayed_CK, delayed_SI);
$setuphold(negedge CK &&& cond4 , negedge SI &&& cond4 , 0 ,0, viol_0, , , delayed_CK, delayed_SI);
$setuphold(negedge CK &&& cond3 , posedge SI &&& cond3 , 0 ,0, viol_0, , , delayed_CK, delayed_SI);
$setuphold(negedge CK &&& cond3 , negedge SI &&& cond3 , 0 ,0, viol_0, , , delayed_CK, delayed_SI);
endspecify
   `endif
endmodule
`endcelldefine

//%END SVN_FSDNSBQ_2

//%BEGIN SVN_FSDNSBQ_4

`celldefine
module SVN_FSDNSBQ_4 (Q, CK, D, SI, SE, SD);
   output Q;
   input CK, D, SI, SE, SD;

   reg viol_0;
   wire delayed_CK, delayed_D, delayed_SI,
	delayed_SE, delayed_SD;

   wire int_res__CK, int_res__D, int_res__SD, xcr_0;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////

`ifdef _fv
   buf (delayed_CK, CK);
   buf (delayed_D, D);
   buf (delayed_SI, SI);
   buf (delayed_SE, SE);
`endif
   buf (delayed_SD, SD);


   not (int_res__CK, delayed_CK);
   mux2 (int_res__D, delayed_SI, delayed_D, delayed_SE);
   not (int_res__SD, delayed_SD);
   dff_s_err (xcr_0, int_res__CK, int_res__D, int_res__SD);

`ifdef VIRL_functiononly
   dff_s #`SNPS_SEQ_DELAY (Q, viol_0, int_res__CK, int_res__D, int_res__SD, xcr_0);
`else
   dff_s (Q, viol_0, int_res__CK, int_res__D, int_res__SD, xcr_0);
`endif

   `ifdef VIRL_functiononly

   `else

   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////

not U0 (_net_0, D);
not U1 (_net_1, SI);
and U2 (_net_2, SD, _net_0, SE, _net_1);
not U3 (_net_3, SI);
and U4 (_net_4, SD, D, SE, _net_3);
not U5 (_net_5, D);
not U6 (_net_6, SE);
and U7 (_net_7, SD, _net_5, _net_6);
or U8 (cond11, _net_2, _net_4, _net_7);
not U9 (_net_8, SE);
and U10 (_net_9, SD, D, _net_8);
and U11 (_net_10, SD, D, SE, SI);
not U12 (_net_11, D);
and U13 (_net_12, SD, _net_11, SE, SI);
or U14 (cond10, _net_9, _net_10, _net_12);
not U15 (_net_13, SE);
and U16 (cond0, _net_13, SD);
not U17 (_net_14, SE);
not U18 (_net_15, D);
and U19 (cond7, _net_14, _net_15);
not U20 (_net_16, D);
not U21 (_net_17, SI);
and U22 (cond6, SE, _net_16, _net_17);
not U23 (_net_18, D);
not U24 (_net_19, SI);
and U25 (_net_20, _net_18, CK, SE, _net_19);
not U26 (_net_21, SI);
and U27 (_net_22, D, CK, SE, _net_21);
not U28 (_net_23, D);
not U29 (_net_24, SE);
and U30 (_net_25, _net_23, CK, _net_24);
or U31 (cond9, _net_20, _net_22, _net_25);
not U32 (_net_26, SE);
and U33 (_net_27, D, CK, _net_26);
and U34 (_net_28, D, CK, SE, SI);
not U35 (_net_29, D);
and U36 (_net_30, _net_29, CK, SE, SI);
or U37 (cond8, _net_27, _net_28, _net_30);
not U38 (_net_31, SI);
and U39 (cond5, SE, D, _net_31);
not U40 (_net_32, D);
and U41 (cond1, SD, _net_32, SI);
not U42 (_net_33, SI);
and U43 (cond2, SD, D, _net_33);
not U44 (_net_34, D);
and U45 (cond4, SD, _net_34, SE);
and U46 (cond3, SD, D, SE);

specify
if (~(CK)) (negedge SD => (Q -: 1'b1))=(0, 0);
if ((CK & D & SE & ~(SI)) | (CK & ~(D) & SE & ~(SI)) | (CK & ~(D) & ~(SE))) (negedge SD => (Q -: 1'b1))=(0, 0);
if ((CK & D & SE & SI) | (CK & D & ~(SE)) | (CK & ~(D) & SE & SI)) (negedge SD => (Q -: 1'b1))=(0, 0);
(negedge SD => (Q:1'b1))=(0, 0);
(negedge CK => (Q : 1'b1))=(0, 0);
$width(posedge CK &&& cond11 , 0 ,0, viol_0);
$width(negedge CK &&& cond11 , 0 ,0, viol_0);
$width(posedge CK &&& cond10 , 0 ,0, viol_0);
$width(negedge CK &&& cond10 , 0 ,0, viol_0);
$setuphold(negedge CK &&& cond0 , posedge D &&& cond0 , 0 ,0, viol_0, , , delayed_CK, delayed_D);
$setuphold(negedge CK &&& cond0 , negedge D &&& cond0 , 0 ,0, viol_0, , , delayed_CK, delayed_D);
$width(negedge SD &&& ~CK , 0 ,0, viol_0);
$recovery(posedge SD &&& cond7 , negedge CK &&& cond7 , 0 , viol_0);
$hold(negedge CK &&& cond7 , posedge SD &&& cond7 , 0 , viol_0);
$recovery(posedge SD &&& cond6 , negedge CK &&& cond6 , 0 , viol_0);
$hold(negedge CK &&& cond6 , posedge SD &&& cond6 , 0 , viol_0);
$width(negedge SD &&& cond9 , 0 ,0, viol_0);
$width(negedge SD &&& cond8 , 0 ,0, viol_0);
$recovery(posedge SD &&& cond5 , negedge CK &&& cond5 , 0 , viol_0);
$hold(negedge CK &&& cond5 , posedge SD &&& cond5 , 0 , viol_0);
$setuphold(negedge CK &&& cond1 , posedge SE &&& cond1 , 0 ,0, viol_0, , , delayed_CK, delayed_SE);
$setuphold(negedge CK &&& cond1 , negedge SE &&& cond1 , 0 ,0, viol_0, , , delayed_CK, delayed_SE);
$setuphold(negedge CK &&& cond2 , posedge SE &&& cond2 , 0 ,0, viol_0, , , delayed_CK, delayed_SE);
$setuphold(negedge CK &&& cond2 , negedge SE &&& cond2 , 0 ,0, viol_0, , , delayed_CK, delayed_SE);
$setuphold(negedge CK &&& cond4 , posedge SI &&& cond4 , 0 ,0, viol_0, , , delayed_CK, delayed_SI);
$setuphold(negedge CK &&& cond4 , negedge SI &&& cond4 , 0 ,0, viol_0, , , delayed_CK, delayed_SI);
$setuphold(negedge CK &&& cond3 , posedge SI &&& cond3 , 0 ,0, viol_0, , , delayed_CK, delayed_SI);
$setuphold(negedge CK &&& cond3 , negedge SI &&& cond3 , 0 ,0, viol_0, , , delayed_CK, delayed_SI);
endspecify
   `endif
endmodule
`endcelldefine

//%END SVN_FSDNSBQ_4

//%BEGIN SVN_FSDP_4

`celldefine
module SVN_FSDP_4 (Q, QN, CK, D, SI, SE);
   output Q, QN;
   input CK, D, SI, SE;

   reg viol_0;
   wire delayed_CK, delayed_D,
	delayed_SI, delayed_SE;

   wire int_res__D, int_res_iq, xcr_0;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////

`ifdef _fv
   buf (delayed_CK, CK);
   buf (delayed_D, D);
   buf (delayed_SI, SI);
   buf (delayed_SE, SE);
`endif

   mux2 (int_res__D, delayed_SI, delayed_D, delayed_SE);
   dff_err (xcr_0, delayed_CK, int_res__D);
   dff (int_res_iq, viol_0, delayed_CK, int_res__D, xcr_0);
`ifdef VIRL_functiononly
   buf  #`SNPS_SEQ_DELAY (Q, int_res_iq);
   not  #`SNPS_SEQ_DELAY (QN, int_res_iq);
`else
   buf (Q, int_res_iq);
   not (QN, int_res_iq);
`endif
`ifdef VIRL_functiononly
`else

   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////
not U0 (_net_0, SE);
not U1 (_net_1, D);
not U2 (_net_2, SI);
and U3 (ENABLE_NOT_D_AND_NOT_SE_AND_NOT_SI, _net_0, _net_1, _net_2);
not U4 (_net_3, SE);
not U5 (_net_4, D);
and U6 (ENABLE_NOT_D_AND_NOT_SE_AND_SI, _net_3, _net_4, SI);
not U7 (_net_5, D);
not U8 (_net_6, SI);
and U9 (ENABLE_NOT_D_AND_SE_AND_NOT_SI, SE, _net_5, _net_6);
not U10 (_net_7, D);
and U11 (ENABLE_NOT_D_AND_SE_AND_SI, SE, _net_7, SI);
not U12 (_net_8, SE);
not U13 (_net_9, SI);
and U14 (ENABLE_D_AND_NOT_SE_AND_NOT_SI, _net_8, D, _net_9);
not U15 (_net_10, SE);
and U16 (ENABLE_D_AND_NOT_SE_AND_SI, _net_10, D, SI);
not U17 (_net_11, SI);
and U18 (ENABLE_D_AND_SE_AND_NOT_SI, SE, D, _net_11);
and U19 (ENABLE_D_AND_SE_AND_SI, SE, D, SI);
not U20 (_net_12, SI);
not U21 (_net_13, SE);
and U22 (ENABLE_NOT_SE_AND_NOT_SI, _net_12, _net_13);
not U23 (_net_14, SE);
and U24 (ENABLE_NOT_SE_AND_SI, SI, _net_14);
not U25 (_net_15, D);
and U26 (ENABLE_NOT_D_AND_SI, SI, _net_15);
not U27 (_net_16, SI);
and U28 (ENABLE_D_AND_NOT_SI, _net_16, D);
not U29 (_net_17, D);
and U30 (ENABLE_NOT_D_AND_SE, SE, _net_17);
and U31 (ENABLE_D_AND_SE, SE, D);

specify
if (D==1'b0&&SE==1'b0&&SI==1'b0) (posedge CK => (Q -: 1'b1))=(0, 0);
if (D==1'b0&&SE==1'b0&&SI==1'b1) (posedge CK => (Q -: 1'b1))=(0, 0);
if (D==1'b0&&SE==1'b1&&SI==1'b0) (posedge CK => (Q -: 1'b1))=(0, 0);
if (D==1'b0&&SE==1'b1&&SI==1'b1) (posedge CK => (Q +: 1'b1))=(0, 0);
if (D==1'b1&&SE==1'b0&&SI==1'b0) (posedge CK => (Q +: 1'b1))=(0, 0);
if (D==1'b1&&SE==1'b0&&SI==1'b1) (posedge CK => (Q +: 1'b1))=(0, 0);
if (D==1'b1&&SE==1'b1&&SI==1'b0) (posedge CK => (Q -: 1'b1))=(0, 0);
if (D==1'b1&&SE==1'b1&&SI==1'b1) (posedge CK => (Q +: 1'b1))=(0, 0);
(posedge CK => (Q:1'b1))=(0, 0);
if (D==1'b0&&SE==1'b0&&SI==1'b0) (posedge CK => (QN +: 1'b1))=(0, 0);
if (D==1'b0&&SE==1'b0&&SI==1'b1) (posedge CK => (QN +: 1'b1))=(0, 0);
if (D==1'b0&&SE==1'b1&&SI==1'b0) (posedge CK => (QN +: 1'b1))=(0, 0);
if (D==1'b0&&SE==1'b1&&SI==1'b1) (posedge CK => (QN -: 1'b1))=(0, 0);
if (D==1'b1&&SE==1'b0&&SI==1'b0) (posedge CK => (QN -: 1'b1))=(0, 0);
if (D==1'b1&&SE==1'b0&&SI==1'b1) (posedge CK => (QN -: 1'b1))=(0, 0);
if (D==1'b1&&SE==1'b1&&SI==1'b0) (posedge CK => (QN +: 1'b1))=(0, 0);
if (D==1'b1&&SE==1'b1&&SI==1'b1) (posedge CK => (QN -: 1'b1))=(0, 0);
(posedge CK => (QN:1'b0))=(0, 0);
$width(posedge CK &&& ENABLE_NOT_D_AND_NOT_SE_AND_NOT_SI , 0 ,0, viol_0);
$width(negedge CK &&& ENABLE_NOT_D_AND_NOT_SE_AND_NOT_SI , 0 ,0, viol_0);
$width(posedge CK &&& ENABLE_NOT_D_AND_NOT_SE_AND_SI , 0 ,0, viol_0);
$width(negedge CK &&& ENABLE_NOT_D_AND_NOT_SE_AND_SI , 0 ,0, viol_0);
$width(posedge CK &&& ENABLE_NOT_D_AND_SE_AND_NOT_SI , 0 ,0, viol_0);
$width(negedge CK &&& ENABLE_NOT_D_AND_SE_AND_NOT_SI , 0 ,0, viol_0);
$width(posedge CK &&& ENABLE_NOT_D_AND_SE_AND_SI , 0 ,0, viol_0);
$width(negedge CK &&& ENABLE_NOT_D_AND_SE_AND_SI , 0 ,0, viol_0);
$width(posedge CK &&& ENABLE_D_AND_NOT_SE_AND_NOT_SI , 0 ,0, viol_0);
$width(negedge CK &&& ENABLE_D_AND_NOT_SE_AND_NOT_SI , 0 ,0, viol_0);
$width(posedge CK &&& ENABLE_D_AND_NOT_SE_AND_SI , 0 ,0, viol_0);
$width(negedge CK &&& ENABLE_D_AND_NOT_SE_AND_SI , 0 ,0, viol_0);
$width(posedge CK &&& ENABLE_D_AND_SE_AND_NOT_SI , 0 ,0, viol_0);
$width(negedge CK &&& ENABLE_D_AND_SE_AND_NOT_SI , 0 ,0, viol_0);
$width(posedge CK &&& ENABLE_D_AND_SE_AND_SI , 0 ,0, viol_0);
$width(negedge CK &&& ENABLE_D_AND_SE_AND_SI , 0 ,0, viol_0);
$setuphold(posedge CK &&& ENABLE_NOT_SE_AND_NOT_SI , posedge D &&& ENABLE_NOT_SE_AND_NOT_SI , 0 ,0, viol_0, , , delayed_CK, delayed_D);
$setuphold(posedge CK &&& ENABLE_NOT_SE_AND_NOT_SI , negedge D &&& ENABLE_NOT_SE_AND_NOT_SI , 0 ,0, viol_0, , , delayed_CK, delayed_D);
$setuphold(posedge CK &&& ENABLE_NOT_SE_AND_SI , posedge D &&& ENABLE_NOT_SE_AND_SI , 0 ,0, viol_0, , , delayed_CK, delayed_D);
$setuphold(posedge CK &&& ENABLE_NOT_SE_AND_SI , negedge D &&& ENABLE_NOT_SE_AND_SI , 0 ,0, viol_0, , , delayed_CK, delayed_D);
$setuphold(posedge CK &&& ENABLE_NOT_D_AND_SI , posedge SE &&& ENABLE_NOT_D_AND_SI , 0 ,0, viol_0, , , delayed_CK, delayed_SE);
$setuphold(posedge CK &&& ENABLE_NOT_D_AND_SI , negedge SE &&& ENABLE_NOT_D_AND_SI , 0 ,0, viol_0, , , delayed_CK, delayed_SE);
$setuphold(posedge CK &&& ENABLE_D_AND_NOT_SI , posedge SE &&& ENABLE_D_AND_NOT_SI , 0 ,0, viol_0, , , delayed_CK, delayed_SE);
$setuphold(posedge CK &&& ENABLE_D_AND_NOT_SI , negedge SE &&& ENABLE_D_AND_NOT_SI , 0 ,0, viol_0, , , delayed_CK, delayed_SE);
$setuphold(posedge CK &&& ENABLE_NOT_D_AND_SE , posedge SI &&& ENABLE_NOT_D_AND_SE , 0 ,0, viol_0, , , delayed_CK, delayed_SI);
$setuphold(posedge CK &&& ENABLE_NOT_D_AND_SE , negedge SI &&& ENABLE_NOT_D_AND_SE , 0 ,0, viol_0, , , delayed_CK, delayed_SI);
$setuphold(posedge CK &&& ENABLE_D_AND_SE , posedge SI &&& ENABLE_D_AND_SE , 0 ,0, viol_0, , , delayed_CK, delayed_SI);
$setuphold(posedge CK &&& ENABLE_D_AND_SE , negedge SI &&& ENABLE_D_AND_SE , 0 ,0, viol_0, , , delayed_CK, delayed_SI);
endspecify
`endif
endmodule
`endcelldefine

//%END SVN_FSDP_4

//%BEGIN SVN_FSDP_1

`celldefine
module SVN_FSDP_1 (Q, QN, CK, D, SI, SE);
   output Q, QN;
   input CK, D, SI, SE;

   reg viol_0;
   wire delayed_CK, delayed_D,
	delayed_SI, delayed_SE;

   wire int_res__D, int_res_iq, xcr_0;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////

`ifdef _fv
   buf (delayed_CK, CK);
   buf (delayed_D, D);
   buf (delayed_SI, SI);
   buf (delayed_SE, SE);
`endif

   mux2 (int_res__D, delayed_SI, delayed_D, delayed_SE);
   dff_err (xcr_0, delayed_CK, int_res__D);
   dff (int_res_iq, viol_0, delayed_CK, int_res__D, xcr_0);
`ifdef VIRL_functiononly
   buf  #`SNPS_SEQ_DELAY (Q, int_res_iq);
   not  #`SNPS_SEQ_DELAY (QN, int_res_iq);
`else
   buf (Q, int_res_iq);
   not (QN, int_res_iq);
`endif
`ifdef VIRL_functiononly
`else

   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////
not U0 (_net_0, SE);
not U1 (_net_1, D);
not U2 (_net_2, SI);
and U3 (ENABLE_NOT_D_AND_NOT_SE_AND_NOT_SI, _net_0, _net_1, _net_2);
not U4 (_net_3, SE);
not U5 (_net_4, D);
and U6 (ENABLE_NOT_D_AND_NOT_SE_AND_SI, _net_3, _net_4, SI);
not U7 (_net_5, D);
not U8 (_net_6, SI);
and U9 (ENABLE_NOT_D_AND_SE_AND_NOT_SI, SE, _net_5, _net_6);
not U10 (_net_7, D);
and U11 (ENABLE_NOT_D_AND_SE_AND_SI, SE, _net_7, SI);
not U12 (_net_8, SE);
not U13 (_net_9, SI);
and U14 (ENABLE_D_AND_NOT_SE_AND_NOT_SI, _net_8, D, _net_9);
not U15 (_net_10, SE);
and U16 (ENABLE_D_AND_NOT_SE_AND_SI, _net_10, D, SI);
not U17 (_net_11, SI);
and U18 (ENABLE_D_AND_SE_AND_NOT_SI, SE, D, _net_11);
and U19 (ENABLE_D_AND_SE_AND_SI, SE, D, SI);
not U20 (_net_12, SI);
not U21 (_net_13, SE);
and U22 (ENABLE_NOT_SE_AND_NOT_SI, _net_12, _net_13);
not U23 (_net_14, SE);
and U24 (ENABLE_NOT_SE_AND_SI, SI, _net_14);
not U25 (_net_15, D);
and U26 (ENABLE_NOT_D_AND_SI, SI, _net_15);
not U27 (_net_16, SI);
and U28 (ENABLE_D_AND_NOT_SI, _net_16, D);
not U29 (_net_17, D);
and U30 (ENABLE_NOT_D_AND_SE, SE, _net_17);
and U31 (ENABLE_D_AND_SE, SE, D);

specify
if (D==1'b0&&SE==1'b0&&SI==1'b0) (posedge CK => (Q -: 1'b1))=(0, 0);
if (D==1'b0&&SE==1'b0&&SI==1'b1) (posedge CK => (Q -: 1'b1))=(0, 0);
if (D==1'b0&&SE==1'b1&&SI==1'b0) (posedge CK => (Q -: 1'b1))=(0, 0);
if (D==1'b0&&SE==1'b1&&SI==1'b1) (posedge CK => (Q +: 1'b1))=(0, 0);
if (D==1'b1&&SE==1'b0&&SI==1'b0) (posedge CK => (Q +: 1'b1))=(0, 0);
if (D==1'b1&&SE==1'b0&&SI==1'b1) (posedge CK => (Q +: 1'b1))=(0, 0);
if (D==1'b1&&SE==1'b1&&SI==1'b0) (posedge CK => (Q -: 1'b1))=(0, 0);
if (D==1'b1&&SE==1'b1&&SI==1'b1) (posedge CK => (Q +: 1'b1))=(0, 0);
(posedge CK => (Q:1'b1))=(0, 0);
if (D==1'b0&&SE==1'b0&&SI==1'b0) (posedge CK => (QN +: 1'b1))=(0, 0);
if (D==1'b0&&SE==1'b0&&SI==1'b1) (posedge CK => (QN +: 1'b1))=(0, 0);
if (D==1'b0&&SE==1'b1&&SI==1'b0) (posedge CK => (QN +: 1'b1))=(0, 0);
if (D==1'b0&&SE==1'b1&&SI==1'b1) (posedge CK => (QN -: 1'b1))=(0, 0);
if (D==1'b1&&SE==1'b0&&SI==1'b0) (posedge CK => (QN -: 1'b1))=(0, 0);
if (D==1'b1&&SE==1'b0&&SI==1'b1) (posedge CK => (QN -: 1'b1))=(0, 0);
if (D==1'b1&&SE==1'b1&&SI==1'b0) (posedge CK => (QN +: 1'b1))=(0, 0);
if (D==1'b1&&SE==1'b1&&SI==1'b1) (posedge CK => (QN -: 1'b1))=(0, 0);
(posedge CK => (QN:1'b0))=(0, 0);
$width(posedge CK &&& ENABLE_NOT_D_AND_NOT_SE_AND_NOT_SI , 0 ,0, viol_0);
$width(negedge CK &&& ENABLE_NOT_D_AND_NOT_SE_AND_NOT_SI , 0 ,0, viol_0);
$width(posedge CK &&& ENABLE_NOT_D_AND_NOT_SE_AND_SI , 0 ,0, viol_0);
$width(negedge CK &&& ENABLE_NOT_D_AND_NOT_SE_AND_SI , 0 ,0, viol_0);
$width(posedge CK &&& ENABLE_NOT_D_AND_SE_AND_NOT_SI , 0 ,0, viol_0);
$width(negedge CK &&& ENABLE_NOT_D_AND_SE_AND_NOT_SI , 0 ,0, viol_0);
$width(posedge CK &&& ENABLE_NOT_D_AND_SE_AND_SI , 0 ,0, viol_0);
$width(negedge CK &&& ENABLE_NOT_D_AND_SE_AND_SI , 0 ,0, viol_0);
$width(posedge CK &&& ENABLE_D_AND_NOT_SE_AND_NOT_SI , 0 ,0, viol_0);
$width(negedge CK &&& ENABLE_D_AND_NOT_SE_AND_NOT_SI , 0 ,0, viol_0);
$width(posedge CK &&& ENABLE_D_AND_NOT_SE_AND_SI , 0 ,0, viol_0);
$width(negedge CK &&& ENABLE_D_AND_NOT_SE_AND_SI , 0 ,0, viol_0);
$width(posedge CK &&& ENABLE_D_AND_SE_AND_NOT_SI , 0 ,0, viol_0);
$width(negedge CK &&& ENABLE_D_AND_SE_AND_NOT_SI , 0 ,0, viol_0);
$width(posedge CK &&& ENABLE_D_AND_SE_AND_SI , 0 ,0, viol_0);
$width(negedge CK &&& ENABLE_D_AND_SE_AND_SI , 0 ,0, viol_0);
$setuphold(posedge CK &&& ENABLE_NOT_SE_AND_NOT_SI , posedge D &&& ENABLE_NOT_SE_AND_NOT_SI , 0 ,0, viol_0, , , delayed_CK, delayed_D);
$setuphold(posedge CK &&& ENABLE_NOT_SE_AND_NOT_SI , negedge D &&& ENABLE_NOT_SE_AND_NOT_SI , 0 ,0, viol_0, , , delayed_CK, delayed_D);
$setuphold(posedge CK &&& ENABLE_NOT_SE_AND_SI , posedge D &&& ENABLE_NOT_SE_AND_SI , 0 ,0, viol_0, , , delayed_CK, delayed_D);
$setuphold(posedge CK &&& ENABLE_NOT_SE_AND_SI , negedge D &&& ENABLE_NOT_SE_AND_SI , 0 ,0, viol_0, , , delayed_CK, delayed_D);
$setuphold(posedge CK &&& ENABLE_NOT_D_AND_SI , posedge SE &&& ENABLE_NOT_D_AND_SI , 0 ,0, viol_0, , , delayed_CK, delayed_SE);
$setuphold(posedge CK &&& ENABLE_NOT_D_AND_SI , negedge SE &&& ENABLE_NOT_D_AND_SI , 0 ,0, viol_0, , , delayed_CK, delayed_SE);
$setuphold(posedge CK &&& ENABLE_D_AND_NOT_SI , posedge SE &&& ENABLE_D_AND_NOT_SI , 0 ,0, viol_0, , , delayed_CK, delayed_SE);
$setuphold(posedge CK &&& ENABLE_D_AND_NOT_SI , negedge SE &&& ENABLE_D_AND_NOT_SI , 0 ,0, viol_0, , , delayed_CK, delayed_SE);
$setuphold(posedge CK &&& ENABLE_NOT_D_AND_SE , posedge SI &&& ENABLE_NOT_D_AND_SE , 0 ,0, viol_0, , , delayed_CK, delayed_SI);
$setuphold(posedge CK &&& ENABLE_NOT_D_AND_SE , negedge SI &&& ENABLE_NOT_D_AND_SE , 0 ,0, viol_0, , , delayed_CK, delayed_SI);
$setuphold(posedge CK &&& ENABLE_D_AND_SE , posedge SI &&& ENABLE_D_AND_SE , 0 ,0, viol_0, , , delayed_CK, delayed_SI);
$setuphold(posedge CK &&& ENABLE_D_AND_SE , negedge SI &&& ENABLE_D_AND_SE , 0 ,0, viol_0, , , delayed_CK, delayed_SI);
endspecify
`endif
endmodule
`endcelldefine

//%END SVN_FSDP_1

//%BEGIN SVN_FSDP_2

`celldefine
module SVN_FSDP_2 (Q, QN, CK, D, SI, SE);
   output Q, QN;
   input CK, D, SI, SE;

   reg viol_0;
   wire delayed_CK, delayed_D,
	delayed_SI, delayed_SE;

   wire int_res__D, int_res_iq, xcr_0;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////

`ifdef _fv
   buf (delayed_CK, CK);
   buf (delayed_D, D);
   buf (delayed_SI, SI);
   buf (delayed_SE, SE);
`endif

   mux2 (int_res__D, delayed_SI, delayed_D, delayed_SE);
   dff_err (xcr_0, delayed_CK, int_res__D);
   dff (int_res_iq, viol_0, delayed_CK, int_res__D, xcr_0);
`ifdef VIRL_functiononly
   buf  #`SNPS_SEQ_DELAY (Q, int_res_iq);
   not  #`SNPS_SEQ_DELAY (QN, int_res_iq);
`else
   buf (Q, int_res_iq);
   not (QN, int_res_iq);
`endif
`ifdef VIRL_functiononly
`else

   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////
not U0 (_net_0, SE);
not U1 (_net_1, D);
not U2 (_net_2, SI);
and U3 (ENABLE_NOT_D_AND_NOT_SE_AND_NOT_SI, _net_0, _net_1, _net_2);
not U4 (_net_3, SE);
not U5 (_net_4, D);
and U6 (ENABLE_NOT_D_AND_NOT_SE_AND_SI, _net_3, _net_4, SI);
not U7 (_net_5, D);
not U8 (_net_6, SI);
and U9 (ENABLE_NOT_D_AND_SE_AND_NOT_SI, SE, _net_5, _net_6);
not U10 (_net_7, D);
and U11 (ENABLE_NOT_D_AND_SE_AND_SI, SE, _net_7, SI);
not U12 (_net_8, SE);
not U13 (_net_9, SI);
and U14 (ENABLE_D_AND_NOT_SE_AND_NOT_SI, _net_8, D, _net_9);
not U15 (_net_10, SE);
and U16 (ENABLE_D_AND_NOT_SE_AND_SI, _net_10, D, SI);
not U17 (_net_11, SI);
and U18 (ENABLE_D_AND_SE_AND_NOT_SI, SE, D, _net_11);
and U19 (ENABLE_D_AND_SE_AND_SI, SE, D, SI);
not U20 (_net_12, SI);
not U21 (_net_13, SE);
and U22 (ENABLE_NOT_SE_AND_NOT_SI, _net_12, _net_13);
not U23 (_net_14, SE);
and U24 (ENABLE_NOT_SE_AND_SI, SI, _net_14);
not U25 (_net_15, D);
and U26 (ENABLE_NOT_D_AND_SI, SI, _net_15);
not U27 (_net_16, SI);
and U28 (ENABLE_D_AND_NOT_SI, _net_16, D);
not U29 (_net_17, D);
and U30 (ENABLE_NOT_D_AND_SE, SE, _net_17);
and U31 (ENABLE_D_AND_SE, SE, D);

specify
if (D==1'b0&&SE==1'b0&&SI==1'b0) (posedge CK => (Q -: 1'b1))=(0, 0);
if (D==1'b0&&SE==1'b0&&SI==1'b1) (posedge CK => (Q -: 1'b1))=(0, 0);
if (D==1'b0&&SE==1'b1&&SI==1'b0) (posedge CK => (Q -: 1'b1))=(0, 0);
if (D==1'b0&&SE==1'b1&&SI==1'b1) (posedge CK => (Q +: 1'b1))=(0, 0);
if (D==1'b1&&SE==1'b0&&SI==1'b0) (posedge CK => (Q +: 1'b1))=(0, 0);
if (D==1'b1&&SE==1'b0&&SI==1'b1) (posedge CK => (Q +: 1'b1))=(0, 0);
if (D==1'b1&&SE==1'b1&&SI==1'b0) (posedge CK => (Q -: 1'b1))=(0, 0);
if (D==1'b1&&SE==1'b1&&SI==1'b1) (posedge CK => (Q +: 1'b1))=(0, 0);
(posedge CK => (Q:1'b1))=(0, 0);
if (D==1'b0&&SE==1'b0&&SI==1'b0) (posedge CK => (QN +: 1'b1))=(0, 0);
if (D==1'b0&&SE==1'b0&&SI==1'b1) (posedge CK => (QN +: 1'b1))=(0, 0);
if (D==1'b0&&SE==1'b1&&SI==1'b0) (posedge CK => (QN +: 1'b1))=(0, 0);
if (D==1'b0&&SE==1'b1&&SI==1'b1) (posedge CK => (QN -: 1'b1))=(0, 0);
if (D==1'b1&&SE==1'b0&&SI==1'b0) (posedge CK => (QN -: 1'b1))=(0, 0);
if (D==1'b1&&SE==1'b0&&SI==1'b1) (posedge CK => (QN -: 1'b1))=(0, 0);
if (D==1'b1&&SE==1'b1&&SI==1'b0) (posedge CK => (QN +: 1'b1))=(0, 0);
if (D==1'b1&&SE==1'b1&&SI==1'b1) (posedge CK => (QN -: 1'b1))=(0, 0);
(posedge CK => (QN:1'b0))=(0, 0);
$width(posedge CK &&& ENABLE_NOT_D_AND_NOT_SE_AND_NOT_SI , 0 ,0, viol_0);
$width(negedge CK &&& ENABLE_NOT_D_AND_NOT_SE_AND_NOT_SI , 0 ,0, viol_0);
$width(posedge CK &&& ENABLE_NOT_D_AND_NOT_SE_AND_SI , 0 ,0, viol_0);
$width(negedge CK &&& ENABLE_NOT_D_AND_NOT_SE_AND_SI , 0 ,0, viol_0);
$width(posedge CK &&& ENABLE_NOT_D_AND_SE_AND_NOT_SI , 0 ,0, viol_0);
$width(negedge CK &&& ENABLE_NOT_D_AND_SE_AND_NOT_SI , 0 ,0, viol_0);
$width(posedge CK &&& ENABLE_NOT_D_AND_SE_AND_SI , 0 ,0, viol_0);
$width(negedge CK &&& ENABLE_NOT_D_AND_SE_AND_SI , 0 ,0, viol_0);
$width(posedge CK &&& ENABLE_D_AND_NOT_SE_AND_NOT_SI , 0 ,0, viol_0);
$width(negedge CK &&& ENABLE_D_AND_NOT_SE_AND_NOT_SI , 0 ,0, viol_0);
$width(posedge CK &&& ENABLE_D_AND_NOT_SE_AND_SI , 0 ,0, viol_0);
$width(negedge CK &&& ENABLE_D_AND_NOT_SE_AND_SI , 0 ,0, viol_0);
$width(posedge CK &&& ENABLE_D_AND_SE_AND_NOT_SI , 0 ,0, viol_0);
$width(negedge CK &&& ENABLE_D_AND_SE_AND_NOT_SI , 0 ,0, viol_0);
$width(posedge CK &&& ENABLE_D_AND_SE_AND_SI , 0 ,0, viol_0);
$width(negedge CK &&& ENABLE_D_AND_SE_AND_SI , 0 ,0, viol_0);
$setuphold(posedge CK &&& ENABLE_NOT_SE_AND_NOT_SI , posedge D &&& ENABLE_NOT_SE_AND_NOT_SI , 0 ,0, viol_0, , , delayed_CK, delayed_D);
$setuphold(posedge CK &&& ENABLE_NOT_SE_AND_NOT_SI , negedge D &&& ENABLE_NOT_SE_AND_NOT_SI , 0 ,0, viol_0, , , delayed_CK, delayed_D);
$setuphold(posedge CK &&& ENABLE_NOT_SE_AND_SI , posedge D &&& ENABLE_NOT_SE_AND_SI , 0 ,0, viol_0, , , delayed_CK, delayed_D);
$setuphold(posedge CK &&& ENABLE_NOT_SE_AND_SI , negedge D &&& ENABLE_NOT_SE_AND_SI , 0 ,0, viol_0, , , delayed_CK, delayed_D);
$setuphold(posedge CK &&& ENABLE_NOT_D_AND_SI , posedge SE &&& ENABLE_NOT_D_AND_SI , 0 ,0, viol_0, , , delayed_CK, delayed_SE);
$setuphold(posedge CK &&& ENABLE_NOT_D_AND_SI , negedge SE &&& ENABLE_NOT_D_AND_SI , 0 ,0, viol_0, , , delayed_CK, delayed_SE);
$setuphold(posedge CK &&& ENABLE_D_AND_NOT_SI , posedge SE &&& ENABLE_D_AND_NOT_SI , 0 ,0, viol_0, , , delayed_CK, delayed_SE);
$setuphold(posedge CK &&& ENABLE_D_AND_NOT_SI , negedge SE &&& ENABLE_D_AND_NOT_SI , 0 ,0, viol_0, , , delayed_CK, delayed_SE);
$setuphold(posedge CK &&& ENABLE_NOT_D_AND_SE , posedge SI &&& ENABLE_NOT_D_AND_SE , 0 ,0, viol_0, , , delayed_CK, delayed_SI);
$setuphold(posedge CK &&& ENABLE_NOT_D_AND_SE , negedge SI &&& ENABLE_NOT_D_AND_SE , 0 ,0, viol_0, , , delayed_CK, delayed_SI);
$setuphold(posedge CK &&& ENABLE_D_AND_SE , posedge SI &&& ENABLE_D_AND_SE , 0 ,0, viol_0, , , delayed_CK, delayed_SI);
$setuphold(posedge CK &&& ENABLE_D_AND_SE , negedge SI &&& ENABLE_D_AND_SE , 0 ,0, viol_0, , , delayed_CK, delayed_SI);
endspecify
`endif
endmodule
`endcelldefine

//%END SVN_FSDP_2

//%BEGIN SVN_FSDPCBQ_1

`celldefine
module SVN_FSDPCBQ_1 (Q, CK, D, SI, SE, RS);
   output Q;
   input CK, D, SI, SE, RS;

   reg viol_0;
   wire delayed_CK, delayed_D, delayed_SI,
	delayed_SE, delayed_RS;

   wire int_res__D, int_res__RS, xcr_0;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////

`ifdef _fv
   buf (delayed_CK, CK);
   buf (delayed_D, D);
   buf (delayed_SI, SI);
   buf (delayed_SE, SE);
   buf (delayed_RS, RS);
`endif

   mux2 (int_res__D, delayed_SI, delayed_D, delayed_SE);
   and (int_res__RS, int_res__D, delayed_RS);
   dff_err (xcr_0, delayed_CK, int_res__RS);

   `ifdef VIRL_functiononly
      dff #`SNPS_SEQ_DELAY (Q, viol_0, delayed_CK, int_res__RS, xcr_0);
   `else
      dff (Q, viol_0, delayed_CK, int_res__RS, xcr_0);
   `endif

   `ifdef VIRL_functiononly

   `else

   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////

not U0 (_net_0, RS);
and U1 (_net_1, _net_0, D);
not U2 (_net_2, SI);
and U3 (_net_3, RS, D, SE, _net_2);
not U4 (_net_4, D);
not U5 (_net_5, SI);
and U6 (_net_6, RS, _net_4, SE, _net_5);
not U7 (_net_7, D);
not U8 (_net_8, SE);
and U9 (_net_9, RS, _net_7, _net_8);
not U10 (_net_10, RS);
not U11 (_net_11, D);
and U12 (_net_12, _net_10, _net_11);
or U13 (cond11, _net_1, _net_3, _net_6, _net_9, _net_12);
not U14 (_net_13, SE);
and U15 (_net_14, RS, D, _net_13);
and U16 (_net_15, RS, D, SE, SI);
not U17 (_net_16, D);
and U18 (_net_17, RS, _net_16, SE, SI);
or U19 (cond10, _net_14, _net_15, _net_17);
not U20 (_net_18, SE);
not U21 (_net_19, SI);
and U22 (cond1, _net_18, RS, _net_19);
not U23 (_net_20, SE);
and U24 (cond0, _net_20, RS, SI);
not U25 (_net_21, D);
and U26 (cond5, SE, _net_21, SI);
not U27 (_net_22, SE);
not U28 (_net_23, SI);
and U29 (cond4, _net_22, D, _net_23);
not U30 (_net_24, SE);
and U31 (cond3, _net_24, D, SI);
and U32 (cond2, SE, D, SI);
not U33 (_net_25, D);
and U34 (cond6, RS, _net_25, SI);
not U35 (_net_26, SI);
and U36 (cond7, RS, D, _net_26);
not U37 (_net_27, D);
and U38 (cond9, RS, _net_27, SE);
and U39 (cond8, RS, D, SE);

specify
(posedge CK => (Q : 1'b1))=(0, 0);
$width(posedge CK &&& cond11 , 0 ,0, viol_0);
$width(negedge CK &&& cond11 , 0 ,0, viol_0);
$width(posedge CK &&& cond10 , 0 ,0, viol_0);
$width(negedge CK &&& cond10 , 0 ,0, viol_0);
$setuphold(posedge CK &&& cond1 , posedge D &&& cond1 , 0 ,0, viol_0, , , delayed_CK, delayed_D);
$setuphold(posedge CK &&& cond1 , negedge D &&& cond1 , 0 ,0, viol_0, , , delayed_CK, delayed_D);
$setuphold(posedge CK &&& cond0 , posedge D &&& cond0 , 0 ,0, viol_0, , , delayed_CK, delayed_D);
$setuphold(posedge CK &&& cond0 , negedge D &&& cond0 , 0 ,0, viol_0, , , delayed_CK, delayed_D);
$setuphold(posedge CK &&& cond5 , posedge RS &&& cond5 , 0 ,0, viol_0, , , delayed_CK, delayed_RS);
$setuphold(posedge CK &&& cond5 , negedge RS &&& cond5 , 0 ,0, viol_0, , , delayed_CK, delayed_RS);
$setuphold(posedge CK &&& cond4 , posedge RS &&& cond4 , 0 ,0, viol_0, , , delayed_CK, delayed_RS);
$setuphold(posedge CK &&& cond4 , negedge RS &&& cond4 , 0 ,0, viol_0, , , delayed_CK, delayed_RS);
$setuphold(posedge CK &&& cond3 , posedge RS &&& cond3 , 0 ,0, viol_0, , , delayed_CK, delayed_RS);
$setuphold(posedge CK &&& cond3 , negedge RS &&& cond3 , 0 ,0, viol_0, , , delayed_CK, delayed_RS);
$setuphold(posedge CK &&& cond2 , posedge RS &&& cond2 , 0 ,0, viol_0, , , delayed_CK, delayed_RS);
$setuphold(posedge CK &&& cond2 , negedge RS &&& cond2 , 0 ,0, viol_0, , , delayed_CK, delayed_RS);
$setuphold(posedge CK &&& cond6 , posedge SE &&& cond6 , 0 ,0, viol_0, , , delayed_CK, delayed_SE);
$setuphold(posedge CK &&& cond6 , negedge SE &&& cond6 , 0 ,0, viol_0, , , delayed_CK, delayed_SE);
$setuphold(posedge CK &&& cond7 , posedge SE &&& cond7 , 0 ,0, viol_0, , , delayed_CK, delayed_SE);
$setuphold(posedge CK &&& cond7 , negedge SE &&& cond7 , 0 ,0, viol_0, , , delayed_CK, delayed_SE);
$setuphold(posedge CK &&& cond9 , posedge SI &&& cond9 , 0 ,0, viol_0, , , delayed_CK, delayed_SI);
$setuphold(posedge CK &&& cond9 , negedge SI &&& cond9 , 0 ,0, viol_0, , , delayed_CK, delayed_SI);
$setuphold(posedge CK &&& cond8 , posedge SI &&& cond8 , 0 ,0, viol_0, , , delayed_CK, delayed_SI);
$setuphold(posedge CK &&& cond8 , negedge SI &&& cond8 , 0 ,0, viol_0, , , delayed_CK, delayed_SI);
endspecify
   `endif
endmodule
`endcelldefine

//%END SVN_FSDPCBQ_1

//%BEGIN SVN_FSDPCBQ_2

`celldefine
module SVN_FSDPCBQ_2 (Q, CK, D, SI, SE, RS);
   output Q;
   input CK, D, SI, SE, RS;

   reg viol_0;
   wire delayed_CK, delayed_D, delayed_SI,
	delayed_SE, delayed_RS;

   wire int_res__D, int_res__RS, xcr_0;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////

`ifdef _fv
   buf (delayed_CK, CK);
   buf (delayed_D, D);
   buf (delayed_SI, SI);
   buf (delayed_SE, SE);
   buf (delayed_RS, RS);
`endif

   mux2 (int_res__D, delayed_SI, delayed_D, delayed_SE);
   and (int_res__RS, int_res__D, delayed_RS);
   dff_err (xcr_0, delayed_CK, int_res__RS);

   `ifdef VIRL_functiononly
      dff #`SNPS_SEQ_DELAY (Q, viol_0, delayed_CK, int_res__RS, xcr_0);
   `else
      dff (Q, viol_0, delayed_CK, int_res__RS, xcr_0);
   `endif

   `ifdef VIRL_functiononly

   `else

   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////

not U0 (_net_0, RS);
and U1 (_net_1, _net_0, D);
not U2 (_net_2, SI);
and U3 (_net_3, RS, D, SE, _net_2);
not U4 (_net_4, D);
not U5 (_net_5, SI);
and U6 (_net_6, RS, _net_4, SE, _net_5);
not U7 (_net_7, D);
not U8 (_net_8, SE);
and U9 (_net_9, RS, _net_7, _net_8);
not U10 (_net_10, RS);
not U11 (_net_11, D);
and U12 (_net_12, _net_10, _net_11);
or U13 (cond11, _net_1, _net_3, _net_6, _net_9, _net_12);
not U14 (_net_13, SE);
and U15 (_net_14, RS, D, _net_13);
and U16 (_net_15, RS, D, SE, SI);
not U17 (_net_16, D);
and U18 (_net_17, RS, _net_16, SE, SI);
or U19 (cond10, _net_14, _net_15, _net_17);
not U20 (_net_18, SE);
not U21 (_net_19, SI);
and U22 (cond1, _net_18, RS, _net_19);
not U23 (_net_20, SE);
and U24 (cond0, _net_20, RS, SI);
not U25 (_net_21, D);
and U26 (cond5, SE, _net_21, SI);
not U27 (_net_22, SE);
not U28 (_net_23, SI);
and U29 (cond4, _net_22, D, _net_23);
not U30 (_net_24, SE);
and U31 (cond3, _net_24, D, SI);
and U32 (cond2, SE, D, SI);
not U33 (_net_25, D);
and U34 (cond6, RS, _net_25, SI);
not U35 (_net_26, SI);
and U36 (cond7, RS, D, _net_26);
not U37 (_net_27, D);
and U38 (cond9, RS, _net_27, SE);
and U39 (cond8, RS, D, SE);

specify
(posedge CK => (Q : 1'b1))=(0, 0);
$width(posedge CK &&& cond11 , 0 ,0, viol_0);
$width(negedge CK &&& cond11 , 0 ,0, viol_0);
$width(posedge CK &&& cond10 , 0 ,0, viol_0);
$width(negedge CK &&& cond10 , 0 ,0, viol_0);
$setuphold(posedge CK &&& cond1 , posedge D &&& cond1 , 0 ,0, viol_0, , , delayed_CK, delayed_D);
$setuphold(posedge CK &&& cond1 , negedge D &&& cond1 , 0 ,0, viol_0, , , delayed_CK, delayed_D);
$setuphold(posedge CK &&& cond0 , posedge D &&& cond0 , 0 ,0, viol_0, , , delayed_CK, delayed_D);
$setuphold(posedge CK &&& cond0 , negedge D &&& cond0 , 0 ,0, viol_0, , , delayed_CK, delayed_D);
$setuphold(posedge CK &&& cond5 , posedge RS &&& cond5 , 0 ,0, viol_0, , , delayed_CK, delayed_RS);
$setuphold(posedge CK &&& cond5 , negedge RS &&& cond5 , 0 ,0, viol_0, , , delayed_CK, delayed_RS);
$setuphold(posedge CK &&& cond4 , posedge RS &&& cond4 , 0 ,0, viol_0, , , delayed_CK, delayed_RS);
$setuphold(posedge CK &&& cond4 , negedge RS &&& cond4 , 0 ,0, viol_0, , , delayed_CK, delayed_RS);
$setuphold(posedge CK &&& cond3 , posedge RS &&& cond3 , 0 ,0, viol_0, , , delayed_CK, delayed_RS);
$setuphold(posedge CK &&& cond3 , negedge RS &&& cond3 , 0 ,0, viol_0, , , delayed_CK, delayed_RS);
$setuphold(posedge CK &&& cond2 , posedge RS &&& cond2 , 0 ,0, viol_0, , , delayed_CK, delayed_RS);
$setuphold(posedge CK &&& cond2 , negedge RS &&& cond2 , 0 ,0, viol_0, , , delayed_CK, delayed_RS);
$setuphold(posedge CK &&& cond6 , posedge SE &&& cond6 , 0 ,0, viol_0, , , delayed_CK, delayed_SE);
$setuphold(posedge CK &&& cond6 , negedge SE &&& cond6 , 0 ,0, viol_0, , , delayed_CK, delayed_SE);
$setuphold(posedge CK &&& cond7 , posedge SE &&& cond7 , 0 ,0, viol_0, , , delayed_CK, delayed_SE);
$setuphold(posedge CK &&& cond7 , negedge SE &&& cond7 , 0 ,0, viol_0, , , delayed_CK, delayed_SE);
$setuphold(posedge CK &&& cond9 , posedge SI &&& cond9 , 0 ,0, viol_0, , , delayed_CK, delayed_SI);
$setuphold(posedge CK &&& cond9 , negedge SI &&& cond9 , 0 ,0, viol_0, , , delayed_CK, delayed_SI);
$setuphold(posedge CK &&& cond8 , posedge SI &&& cond8 , 0 ,0, viol_0, , , delayed_CK, delayed_SI);
$setuphold(posedge CK &&& cond8 , negedge SI &&& cond8 , 0 ,0, viol_0, , , delayed_CK, delayed_SI);
endspecify
   `endif
endmodule
`endcelldefine

//%END SVN_FSDPCBQ_2

//%BEGIN SVN_FSDPCBQ_4

`celldefine
module SVN_FSDPCBQ_4 (Q, CK, D, SI, SE, RS);
   output Q;
   input CK, D, SI, SE, RS;

   reg viol_0;
   wire delayed_CK, delayed_D, delayed_SI,
	delayed_SE, delayed_RS;

   wire int_res__D, int_res__RS, xcr_0;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////

`ifdef _fv
   buf (delayed_CK, CK);
   buf (delayed_D, D);
   buf (delayed_SI, SI);
   buf (delayed_SE, SE);
   buf (delayed_RS, RS);
`endif

   mux2 (int_res__D, delayed_SI, delayed_D, delayed_SE);
   and (int_res__RS, int_res__D, delayed_RS);
   dff_err (xcr_0, delayed_CK, int_res__RS);

   `ifdef VIRL_functiononly
      dff #`SNPS_SEQ_DELAY (Q, viol_0, delayed_CK, int_res__RS, xcr_0);
   `else
      dff (Q, viol_0, delayed_CK, int_res__RS, xcr_0);
   `endif

   `ifdef VIRL_functiononly

   `else

   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////

not U0 (_net_0, RS);
and U1 (_net_1, _net_0, D);
not U2 (_net_2, SI);
and U3 (_net_3, RS, D, SE, _net_2);
not U4 (_net_4, D);
not U5 (_net_5, SI);
and U6 (_net_6, RS, _net_4, SE, _net_5);
not U7 (_net_7, D);
not U8 (_net_8, SE);
and U9 (_net_9, RS, _net_7, _net_8);
not U10 (_net_10, RS);
not U11 (_net_11, D);
and U12 (_net_12, _net_10, _net_11);
or U13 (cond11, _net_1, _net_3, _net_6, _net_9, _net_12);
not U14 (_net_13, SE);
and U15 (_net_14, RS, D, _net_13);
and U16 (_net_15, RS, D, SE, SI);
not U17 (_net_16, D);
and U18 (_net_17, RS, _net_16, SE, SI);
or U19 (cond10, _net_14, _net_15, _net_17);
not U20 (_net_18, SE);
not U21 (_net_19, SI);
and U22 (cond1, _net_18, RS, _net_19);
not U23 (_net_20, SE);
and U24 (cond0, _net_20, RS, SI);
not U25 (_net_21, D);
and U26 (cond5, SE, _net_21, SI);
not U27 (_net_22, SE);
not U28 (_net_23, SI);
and U29 (cond4, _net_22, D, _net_23);
not U30 (_net_24, SE);
and U31 (cond3, _net_24, D, SI);
and U32 (cond2, SE, D, SI);
not U33 (_net_25, D);
and U34 (cond6, RS, _net_25, SI);
not U35 (_net_26, SI);
and U36 (cond7, RS, D, _net_26);
not U37 (_net_27, D);
and U38 (cond9, RS, _net_27, SE);
and U39 (cond8, RS, D, SE);

specify
(posedge CK => (Q : 1'b1))=(0, 0);
$width(posedge CK &&& cond11 , 0 ,0, viol_0);
$width(negedge CK &&& cond11 , 0 ,0, viol_0);
$width(posedge CK &&& cond10 , 0 ,0, viol_0);
$width(negedge CK &&& cond10 , 0 ,0, viol_0);
$setuphold(posedge CK &&& cond1 , posedge D &&& cond1 , 0 ,0, viol_0, , , delayed_CK, delayed_D);
$setuphold(posedge CK &&& cond1 , negedge D &&& cond1 , 0 ,0, viol_0, , , delayed_CK, delayed_D);
$setuphold(posedge CK &&& cond0 , posedge D &&& cond0 , 0 ,0, viol_0, , , delayed_CK, delayed_D);
$setuphold(posedge CK &&& cond0 , negedge D &&& cond0 , 0 ,0, viol_0, , , delayed_CK, delayed_D);
$setuphold(posedge CK &&& cond5 , posedge RS &&& cond5 , 0 ,0, viol_0, , , delayed_CK, delayed_RS);
$setuphold(posedge CK &&& cond5 , negedge RS &&& cond5 , 0 ,0, viol_0, , , delayed_CK, delayed_RS);
$setuphold(posedge CK &&& cond4 , posedge RS &&& cond4 , 0 ,0, viol_0, , , delayed_CK, delayed_RS);
$setuphold(posedge CK &&& cond4 , negedge RS &&& cond4 , 0 ,0, viol_0, , , delayed_CK, delayed_RS);
$setuphold(posedge CK &&& cond3 , posedge RS &&& cond3 , 0 ,0, viol_0, , , delayed_CK, delayed_RS);
$setuphold(posedge CK &&& cond3 , negedge RS &&& cond3 , 0 ,0, viol_0, , , delayed_CK, delayed_RS);
$setuphold(posedge CK &&& cond2 , posedge RS &&& cond2 , 0 ,0, viol_0, , , delayed_CK, delayed_RS);
$setuphold(posedge CK &&& cond2 , negedge RS &&& cond2 , 0 ,0, viol_0, , , delayed_CK, delayed_RS);
$setuphold(posedge CK &&& cond6 , posedge SE &&& cond6 , 0 ,0, viol_0, , , delayed_CK, delayed_SE);
$setuphold(posedge CK &&& cond6 , negedge SE &&& cond6 , 0 ,0, viol_0, , , delayed_CK, delayed_SE);
$setuphold(posedge CK &&& cond7 , posedge SE &&& cond7 , 0 ,0, viol_0, , , delayed_CK, delayed_SE);
$setuphold(posedge CK &&& cond7 , negedge SE &&& cond7 , 0 ,0, viol_0, , , delayed_CK, delayed_SE);
$setuphold(posedge CK &&& cond9 , posedge SI &&& cond9 , 0 ,0, viol_0, , , delayed_CK, delayed_SI);
$setuphold(posedge CK &&& cond9 , negedge SI &&& cond9 , 0 ,0, viol_0, , , delayed_CK, delayed_SI);
$setuphold(posedge CK &&& cond8 , posedge SI &&& cond8 , 0 ,0, viol_0, , , delayed_CK, delayed_SI);
$setuphold(posedge CK &&& cond8 , negedge SI &&& cond8 , 0 ,0, viol_0, , , delayed_CK, delayed_SI);
endspecify
   `endif
endmodule
`endcelldefine

//%END SVN_FSDPCBQ_4

//%BEGIN SVN_FSDPHCBQ_1

`celldefine
module SVN_FSDPHCBQ_1 (Q, CK, D, SI, SE, EN, RS);
   output Q;
   input CK, D, SI, SE, EN, RS;

   reg viol_0;
   wire delayed_CK, delayed_D, delayed_SI,
	delayed_SE, delayed_EN, delayed_RS;

   wire int_res__D, int_res__S, int_res__RS, int_res_iq, xcr_0;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////

`ifdef _fv
   buf (delayed_CK, CK);
   buf (delayed_D, D);
   buf (delayed_SI, SI);
   buf (delayed_SE, SE);
   buf (delayed_EN, EN);
   buf (delayed_RS, RS);
`endif

   mux2 (int_res__D, int_res_iq, delayed_D, delayed_EN);
   mux2 (int_res__S, delayed_SI, int_res__D, delayed_SE);
   and (int_res__RS, int_res__S, delayed_RS);
   dff_err (xcr_0, delayed_CK, int_res__RS);
   dff (int_res_iq, viol_0, delayed_CK, int_res__RS, xcr_0);

   `ifdef VIRL_functiononly
      buf #`SNPS_SEQ_DELAY(Q, int_res_iq);
   `else
      buf (Q, int_res_iq);
   `endif

   `ifdef VIRL_functiononly

   `else

   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////

not U0 (_net_0, EN);
not U1 (_net_1, D);
not U2 (_net_2, SE);
and U3 (cond36, _net_0, _net_1, RS, _net_2);
not U4 (_net_3, D);
not U5 (_net_4, RS);
not U6 (_net_5, SE);
and U7 (cond35, EN, _net_3, _net_4, _net_5);
not U8 (_net_6, D);
not U9 (_net_7, RS);
and U10 (cond34, EN, _net_6, _net_7, SE, SI);
not U11 (_net_8, D);
and U12 (cond26, EN, _net_8, RS, SE, SI);
not U13 (_net_9, D);
not U14 (_net_10, SI);
and U15 (cond33, EN, _net_9, SE, _net_10);
not U16 (_net_11, RS);
not U17 (_net_12, EN);
not U18 (_net_13, SE);
and U19 (cond32, _net_11, _net_12, _net_13);
not U20 (_net_14, RS);
not U21 (_net_15, EN);
and U22 (cond31, _net_14, _net_15, SE, SI);
not U23 (_net_16, EN);
and U24 (cond24, RS, _net_16, SE, SI);
not U25 (_net_17, EN);
not U26 (_net_18, SI);
and U27 (cond30, SE, _net_17, _net_18);
not U28 (_net_19, EN);
not U29 (_net_20, SE);
and U30 (cond25, _net_19, D, RS, _net_20);
not U31 (_net_21, RS);
not U32 (_net_22, SE);
and U33 (cond29, EN, D, _net_21, _net_22);
not U34 (_net_23, RS);
and U35 (cond28, EN, D, _net_23, SE, SI);
and U36 (cond23, EN, D, RS, SE, SI);
not U37 (_net_24, SI);
and U38 (cond27, EN, D, SE, _net_24);
not U39 (_net_25, EN);
not U40 (_net_26, SE);
and U41 (cond0, RS, _net_25, _net_26);
not U42 (_net_27, D);
not U43 (_net_28, SE);
and U44 (cond2, RS, _net_27, _net_28);
not U45 (_net_29, SE);
and U46 (cond1, RS, D, _net_29);
not U47 (_net_30, EN);
not U48 (_net_31, D);
and U49 (cond8, _net_30, _net_31, SE, SI);
not U50 (_net_32, D);
not U51 (_net_33, SE);
not U52 (_net_34, SI);
and U53 (cond12, EN, _net_32, _net_33, _net_34);
not U54 (_net_35, D);
not U55 (_net_36, SE);
and U56 (cond11, EN, _net_35, _net_36, SI);
not U57 (_net_37, D);
and U58 (cond7, EN, _net_37, SE, SI);
not U59 (_net_38, EN);
not U60 (_net_39, SE);
not U61 (_net_40, SI);
and U62 (cond6, _net_38, D, _net_39, _net_40);
not U63 (_net_41, EN);
not U64 (_net_42, SE);
and U65 (cond5, _net_41, D, _net_42, SI);
not U66 (_net_43, EN);
and U67 (cond4, _net_43, D, SE, SI);
not U68 (_net_44, SE);
not U69 (_net_45, SI);
and U70 (cond10, EN, D, _net_44, _net_45);
not U71 (_net_46, SE);
and U72 (cond9, EN, D, _net_46, SI);
and U73 (cond3, EN, D, SE, SI);
not U74 (_net_47, EN);
not U75 (_net_48, D);
and U76 (cond15, _net_47, _net_48, RS, SI);
not U77 (_net_49, D);
not U78 (_net_50, SI);
and U79 (cond18, EN, _net_49, RS, _net_50);
not U80 (_net_51, D);
and U81 (cond14, EN, _net_51, RS, SI);
not U82 (_net_52, EN);
not U83 (_net_53, SI);
and U84 (cond17, _net_52, D, RS, _net_53);
not U85 (_net_54, SI);
and U86 (cond16, EN, D, RS, _net_54);
and U87 (cond13, EN, D, RS, SI);
not U88 (_net_55, EN);
not U89 (_net_56, D);
and U90 (cond22, _net_55, _net_56, RS, SE);
not U91 (_net_57, D);
and U92 (cond21, EN, _net_57, RS, SE);
not U93 (_net_58, EN);
and U94 (cond20, _net_58, D, RS, SE);
and U95 (cond19, EN, D, RS, SE);

specify
(posedge CK => (Q : 1'b1))=(0, 0);
$width(posedge CK &&& cond36 , 0 ,0, viol_0);
$width(negedge CK &&& cond36 , 0 ,0, viol_0);
$width(posedge CK &&& cond35 , 0 ,0, viol_0);
$width(negedge CK &&& cond35 , 0 ,0, viol_0);
$width(posedge CK &&& cond34 , 0 ,0, viol_0);
$width(negedge CK &&& cond34 , 0 ,0, viol_0);
$width(posedge CK &&& cond26 , 0 ,0, viol_0);
$width(negedge CK &&& cond26 , 0 ,0, viol_0);
$width(posedge CK &&& cond33 , 0 ,0, viol_0);
$width(negedge CK &&& cond33 , 0 ,0, viol_0);
$width(posedge CK &&& cond32 , 0 ,0, viol_0);
$width(negedge CK &&& cond32 , 0 ,0, viol_0);
$width(posedge CK &&& cond31 , 0 ,0, viol_0);
$width(negedge CK &&& cond31 , 0 ,0, viol_0);
$width(posedge CK &&& cond24 , 0 ,0, viol_0);
$width(negedge CK &&& cond24 , 0 ,0, viol_0);
$width(posedge CK &&& cond30 , 0 ,0, viol_0);
$width(negedge CK &&& cond30 , 0 ,0, viol_0);
$width(posedge CK &&& cond25 , 0 ,0, viol_0);
$width(negedge CK &&& cond25 , 0 ,0, viol_0);
$width(posedge CK &&& cond29 , 0 ,0, viol_0);
$width(negedge CK &&& cond29 , 0 ,0, viol_0);
$width(posedge CK &&& cond28 , 0 ,0, viol_0);
$width(negedge CK &&& cond28 , 0 ,0, viol_0);
$width(posedge CK &&& cond23 , 0 ,0, viol_0);
$width(negedge CK &&& cond23 , 0 ,0, viol_0);
$width(posedge CK &&& cond27 , 0 ,0, viol_0);
$width(negedge CK &&& cond27 , 0 ,0, viol_0);
$setuphold(posedge CK &&& cond0 , posedge D &&& cond0 , 0 ,0, viol_0, , , delayed_CK, delayed_D);
$setuphold(posedge CK &&& cond0 , negedge D &&& cond0 , 0 ,0, viol_0, , , delayed_CK, delayed_D);
$setuphold(posedge CK &&& cond2 , posedge EN &&& cond2 , 0 ,0, viol_0, , , delayed_CK, delayed_EN);
$setuphold(posedge CK &&& cond2 , negedge EN &&& cond2 , 0 ,0, viol_0, , , delayed_CK, delayed_EN);
$setuphold(posedge CK &&& cond1 , posedge EN &&& cond1 , 0 ,0, viol_0, , , delayed_CK, delayed_EN);
$setuphold(posedge CK &&& cond1 , negedge EN &&& cond1 , 0 ,0, viol_0, , , delayed_CK, delayed_EN);
$setuphold(posedge CK &&& cond8 , posedge RS &&& cond8 , 0 ,0, viol_0, , , delayed_CK, delayed_RS);
$setuphold(posedge CK &&& cond8 , negedge RS &&& cond8 , 0 ,0, viol_0, , , delayed_CK, delayed_RS);
$setuphold(posedge CK &&& cond12 , posedge RS &&& cond12 , 0 ,0, viol_0, , , delayed_CK, delayed_RS);
$setuphold(posedge CK &&& cond12 , negedge RS &&& cond12 , 0 ,0, viol_0, , , delayed_CK, delayed_RS);
$setuphold(posedge CK &&& cond11 , posedge RS &&& cond11 , 0 ,0, viol_0, , , delayed_CK, delayed_RS);
$setuphold(posedge CK &&& cond11 , negedge RS &&& cond11 , 0 ,0, viol_0, , , delayed_CK, delayed_RS);
$setuphold(posedge CK &&& cond7 , posedge RS &&& cond7 , 0 ,0, viol_0, , , delayed_CK, delayed_RS);
$setuphold(posedge CK &&& cond7 , negedge RS &&& cond7 , 0 ,0, viol_0, , , delayed_CK, delayed_RS);
$setuphold(posedge CK &&& cond6 , posedge RS &&& cond6 , 0 ,0, viol_0, , , delayed_CK, delayed_RS);
$setuphold(posedge CK &&& cond6 , negedge RS &&& cond6 , 0 ,0, viol_0, , , delayed_CK, delayed_RS);
$setuphold(posedge CK &&& cond5 , posedge RS &&& cond5 , 0 ,0, viol_0, , , delayed_CK, delayed_RS);
$setuphold(posedge CK &&& cond5 , negedge RS &&& cond5 , 0 ,0, viol_0, , , delayed_CK, delayed_RS);
$setuphold(posedge CK &&& cond4 , posedge RS &&& cond4 , 0 ,0, viol_0, , , delayed_CK, delayed_RS);
$setuphold(posedge CK &&& cond4 , negedge RS &&& cond4 , 0 ,0, viol_0, , , delayed_CK, delayed_RS);
$setuphold(posedge CK &&& cond10 , posedge RS &&& cond10 , 0 ,0, viol_0, , , delayed_CK, delayed_RS);
$setuphold(posedge CK &&& cond10 , negedge RS &&& cond10 , 0 ,0, viol_0, , , delayed_CK, delayed_RS);
$setuphold(posedge CK &&& cond9 , posedge RS &&& cond9 , 0 ,0, viol_0, , , delayed_CK, delayed_RS);
$setuphold(posedge CK &&& cond9 , negedge RS &&& cond9 , 0 ,0, viol_0, , , delayed_CK, delayed_RS);
$setuphold(posedge CK &&& cond3 , posedge RS &&& cond3 , 0 ,0, viol_0, , , delayed_CK, delayed_RS);
$setuphold(posedge CK &&& cond3 , negedge RS &&& cond3 , 0 ,0, viol_0, , , delayed_CK, delayed_RS);
$setuphold(posedge CK &&& cond15 , posedge SE &&& cond15 , 0 ,0, viol_0, , , delayed_CK, delayed_SE);
$setuphold(posedge CK &&& cond15 , negedge SE &&& cond15 , 0 ,0, viol_0, , , delayed_CK, delayed_SE);
$setuphold(posedge CK &&& cond18 , posedge SE &&& cond18 , 0 ,0, viol_0, , , delayed_CK, delayed_SE);
$setuphold(posedge CK &&& cond18 , negedge SE &&& cond18 , 0 ,0, viol_0, , , delayed_CK, delayed_SE);
$setuphold(posedge CK &&& cond14 , posedge SE &&& cond14 , 0 ,0, viol_0, , , delayed_CK, delayed_SE);
$setuphold(posedge CK &&& cond14 , negedge SE &&& cond14 , 0 ,0, viol_0, , , delayed_CK, delayed_SE);
$setuphold(posedge CK &&& cond17 , posedge SE &&& cond17 , 0 ,0, viol_0, , , delayed_CK, delayed_SE);
$setuphold(posedge CK &&& cond17 , negedge SE &&& cond17 , 0 ,0, viol_0, , , delayed_CK, delayed_SE);
$setuphold(posedge CK &&& cond16 , posedge SE &&& cond16 , 0 ,0, viol_0, , , delayed_CK, delayed_SE);
$setuphold(posedge CK &&& cond16 , negedge SE &&& cond16 , 0 ,0, viol_0, , , delayed_CK, delayed_SE);
$setuphold(posedge CK &&& cond13 , posedge SE &&& cond13 , 0 ,0, viol_0, , , delayed_CK, delayed_SE);
$setuphold(posedge CK &&& cond13 , negedge SE &&& cond13 , 0 ,0, viol_0, , , delayed_CK, delayed_SE);
$setuphold(posedge CK &&& cond22 , posedge SI &&& cond22 , 0 ,0, viol_0, , , delayed_CK, delayed_SI);
$setuphold(posedge CK &&& cond22 , negedge SI &&& cond22 , 0 ,0, viol_0, , , delayed_CK, delayed_SI);
$setuphold(posedge CK &&& cond21 , posedge SI &&& cond21 , 0 ,0, viol_0, , , delayed_CK, delayed_SI);
$setuphold(posedge CK &&& cond21 , negedge SI &&& cond21 , 0 ,0, viol_0, , , delayed_CK, delayed_SI);
$setuphold(posedge CK &&& cond20 , posedge SI &&& cond20 , 0 ,0, viol_0, , , delayed_CK, delayed_SI);
$setuphold(posedge CK &&& cond20 , negedge SI &&& cond20 , 0 ,0, viol_0, , , delayed_CK, delayed_SI);
$setuphold(posedge CK &&& cond19 , posedge SI &&& cond19 , 0 ,0, viol_0, , , delayed_CK, delayed_SI);
$setuphold(posedge CK &&& cond19 , negedge SI &&& cond19 , 0 ,0, viol_0, , , delayed_CK, delayed_SI);
endspecify
   `endif
endmodule
`endcelldefine

//%END SVN_FSDPHCBQ_1

//%BEGIN SVN_FSDPHCBQ_2

`celldefine
module SVN_FSDPHCBQ_2 (Q, CK, D, SI, SE, EN, RS);
   output Q;
   input CK, D, SI, SE, EN, RS;

   reg viol_0;
   wire delayed_CK, delayed_D, delayed_SI,
	delayed_SE, delayed_EN, delayed_RS;

   wire int_res__D, int_res__S, int_res__RS, int_res_iq, xcr_0;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////

`ifdef _fv
   buf (delayed_CK, CK);
   buf (delayed_D, D);
   buf (delayed_SI, SI);
   buf (delayed_SE, SE);
   buf (delayed_EN, EN);
   buf (delayed_RS, RS);
`endif

   mux2 (int_res__D, int_res_iq, delayed_D, delayed_EN);
   mux2 (int_res__S, delayed_SI, int_res__D, delayed_SE);
   and (int_res__RS, int_res__S, delayed_RS);
   dff_err (xcr_0, delayed_CK, int_res__RS);
   dff (int_res_iq, viol_0, delayed_CK, int_res__RS, xcr_0);

   `ifdef VIRL_functiononly
      buf #`SNPS_SEQ_DELAY(Q, int_res_iq);
   `else
      buf (Q, int_res_iq);
   `endif

   `ifdef VIRL_functiononly

   `else

   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////

not U0 (_net_0, EN);
not U1 (_net_1, D);
not U2 (_net_2, SE);
and U3 (cond36, _net_0, _net_1, RS, _net_2);
not U4 (_net_3, D);
not U5 (_net_4, RS);
not U6 (_net_5, SE);
and U7 (cond35, EN, _net_3, _net_4, _net_5);
not U8 (_net_6, D);
not U9 (_net_7, RS);
and U10 (cond34, EN, _net_6, _net_7, SE, SI);
not U11 (_net_8, D);
and U12 (cond26, EN, _net_8, RS, SE, SI);
not U13 (_net_9, D);
not U14 (_net_10, SI);
and U15 (cond33, EN, _net_9, SE, _net_10);
not U16 (_net_11, RS);
not U17 (_net_12, EN);
not U18 (_net_13, SE);
and U19 (cond32, _net_11, _net_12, _net_13);
not U20 (_net_14, RS);
not U21 (_net_15, EN);
and U22 (cond31, _net_14, _net_15, SE, SI);
not U23 (_net_16, EN);
and U24 (cond24, RS, _net_16, SE, SI);
not U25 (_net_17, EN);
not U26 (_net_18, SI);
and U27 (cond30, SE, _net_17, _net_18);
not U28 (_net_19, EN);
not U29 (_net_20, SE);
and U30 (cond25, _net_19, D, RS, _net_20);
not U31 (_net_21, RS);
not U32 (_net_22, SE);
and U33 (cond29, EN, D, _net_21, _net_22);
not U34 (_net_23, RS);
and U35 (cond28, EN, D, _net_23, SE, SI);
and U36 (cond23, EN, D, RS, SE, SI);
not U37 (_net_24, SI);
and U38 (cond27, EN, D, SE, _net_24);
not U39 (_net_25, EN);
not U40 (_net_26, SE);
and U41 (cond0, RS, _net_25, _net_26);
not U42 (_net_27, D);
not U43 (_net_28, SE);
and U44 (cond2, RS, _net_27, _net_28);
not U45 (_net_29, SE);
and U46 (cond1, RS, D, _net_29);
not U47 (_net_30, EN);
not U48 (_net_31, D);
and U49 (cond8, _net_30, _net_31, SE, SI);
not U50 (_net_32, D);
not U51 (_net_33, SE);
not U52 (_net_34, SI);
and U53 (cond12, EN, _net_32, _net_33, _net_34);
not U54 (_net_35, D);
not U55 (_net_36, SE);
and U56 (cond11, EN, _net_35, _net_36, SI);
not U57 (_net_37, D);
and U58 (cond7, EN, _net_37, SE, SI);
not U59 (_net_38, EN);
not U60 (_net_39, SE);
not U61 (_net_40, SI);
and U62 (cond6, _net_38, D, _net_39, _net_40);
not U63 (_net_41, EN);
not U64 (_net_42, SE);
and U65 (cond5, _net_41, D, _net_42, SI);
not U66 (_net_43, EN);
and U67 (cond4, _net_43, D, SE, SI);
not U68 (_net_44, SE);
not U69 (_net_45, SI);
and U70 (cond10, EN, D, _net_44, _net_45);
not U71 (_net_46, SE);
and U72 (cond9, EN, D, _net_46, SI);
and U73 (cond3, EN, D, SE, SI);
not U74 (_net_47, EN);
not U75 (_net_48, D);
and U76 (cond15, _net_47, _net_48, RS, SI);
not U77 (_net_49, D);
not U78 (_net_50, SI);
and U79 (cond18, EN, _net_49, RS, _net_50);
not U80 (_net_51, D);
and U81 (cond14, EN, _net_51, RS, SI);
not U82 (_net_52, EN);
not U83 (_net_53, SI);
and U84 (cond17, _net_52, D, RS, _net_53);
not U85 (_net_54, SI);
and U86 (cond16, EN, D, RS, _net_54);
and U87 (cond13, EN, D, RS, SI);
not U88 (_net_55, EN);
not U89 (_net_56, D);
and U90 (cond22, _net_55, _net_56, RS, SE);
not U91 (_net_57, D);
and U92 (cond21, EN, _net_57, RS, SE);
not U93 (_net_58, EN);
and U94 (cond20, _net_58, D, RS, SE);
and U95 (cond19, EN, D, RS, SE);

specify
(posedge CK => (Q : 1'b1))=(0, 0);
$width(posedge CK &&& cond36 , 0 ,0, viol_0);
$width(negedge CK &&& cond36 , 0 ,0, viol_0);
$width(posedge CK &&& cond35 , 0 ,0, viol_0);
$width(negedge CK &&& cond35 , 0 ,0, viol_0);
$width(posedge CK &&& cond34 , 0 ,0, viol_0);
$width(negedge CK &&& cond34 , 0 ,0, viol_0);
$width(posedge CK &&& cond26 , 0 ,0, viol_0);
$width(negedge CK &&& cond26 , 0 ,0, viol_0);
$width(posedge CK &&& cond33 , 0 ,0, viol_0);
$width(negedge CK &&& cond33 , 0 ,0, viol_0);
$width(posedge CK &&& cond32 , 0 ,0, viol_0);
$width(negedge CK &&& cond32 , 0 ,0, viol_0);
$width(posedge CK &&& cond31 , 0 ,0, viol_0);
$width(negedge CK &&& cond31 , 0 ,0, viol_0);
$width(posedge CK &&& cond24 , 0 ,0, viol_0);
$width(negedge CK &&& cond24 , 0 ,0, viol_0);
$width(posedge CK &&& cond30 , 0 ,0, viol_0);
$width(negedge CK &&& cond30 , 0 ,0, viol_0);
$width(posedge CK &&& cond25 , 0 ,0, viol_0);
$width(negedge CK &&& cond25 , 0 ,0, viol_0);
$width(posedge CK &&& cond29 , 0 ,0, viol_0);
$width(negedge CK &&& cond29 , 0 ,0, viol_0);
$width(posedge CK &&& cond28 , 0 ,0, viol_0);
$width(negedge CK &&& cond28 , 0 ,0, viol_0);
$width(posedge CK &&& cond23 , 0 ,0, viol_0);
$width(negedge CK &&& cond23 , 0 ,0, viol_0);
$width(posedge CK &&& cond27 , 0 ,0, viol_0);
$width(negedge CK &&& cond27 , 0 ,0, viol_0);
$setuphold(posedge CK &&& cond0 , posedge D &&& cond0 , 0 ,0, viol_0, , , delayed_CK, delayed_D);
$setuphold(posedge CK &&& cond0 , negedge D &&& cond0 , 0 ,0, viol_0, , , delayed_CK, delayed_D);
$setuphold(posedge CK &&& cond2 , posedge EN &&& cond2 , 0 ,0, viol_0, , , delayed_CK, delayed_EN);
$setuphold(posedge CK &&& cond2 , negedge EN &&& cond2 , 0 ,0, viol_0, , , delayed_CK, delayed_EN);
$setuphold(posedge CK &&& cond1 , posedge EN &&& cond1 , 0 ,0, viol_0, , , delayed_CK, delayed_EN);
$setuphold(posedge CK &&& cond1 , negedge EN &&& cond1 , 0 ,0, viol_0, , , delayed_CK, delayed_EN);
$setuphold(posedge CK &&& cond8 , posedge RS &&& cond8 , 0 ,0, viol_0, , , delayed_CK, delayed_RS);
$setuphold(posedge CK &&& cond8 , negedge RS &&& cond8 , 0 ,0, viol_0, , , delayed_CK, delayed_RS);
$setuphold(posedge CK &&& cond12 , posedge RS &&& cond12 , 0 ,0, viol_0, , , delayed_CK, delayed_RS);
$setuphold(posedge CK &&& cond12 , negedge RS &&& cond12 , 0 ,0, viol_0, , , delayed_CK, delayed_RS);
$setuphold(posedge CK &&& cond11 , posedge RS &&& cond11 , 0 ,0, viol_0, , , delayed_CK, delayed_RS);
$setuphold(posedge CK &&& cond11 , negedge RS &&& cond11 , 0 ,0, viol_0, , , delayed_CK, delayed_RS);
$setuphold(posedge CK &&& cond7 , posedge RS &&& cond7 , 0 ,0, viol_0, , , delayed_CK, delayed_RS);
$setuphold(posedge CK &&& cond7 , negedge RS &&& cond7 , 0 ,0, viol_0, , , delayed_CK, delayed_RS);
$setuphold(posedge CK &&& cond6 , posedge RS &&& cond6 , 0 ,0, viol_0, , , delayed_CK, delayed_RS);
$setuphold(posedge CK &&& cond6 , negedge RS &&& cond6 , 0 ,0, viol_0, , , delayed_CK, delayed_RS);
$setuphold(posedge CK &&& cond5 , posedge RS &&& cond5 , 0 ,0, viol_0, , , delayed_CK, delayed_RS);
$setuphold(posedge CK &&& cond5 , negedge RS &&& cond5 , 0 ,0, viol_0, , , delayed_CK, delayed_RS);
$setuphold(posedge CK &&& cond4 , posedge RS &&& cond4 , 0 ,0, viol_0, , , delayed_CK, delayed_RS);
$setuphold(posedge CK &&& cond4 , negedge RS &&& cond4 , 0 ,0, viol_0, , , delayed_CK, delayed_RS);
$setuphold(posedge CK &&& cond10 , posedge RS &&& cond10 , 0 ,0, viol_0, , , delayed_CK, delayed_RS);
$setuphold(posedge CK &&& cond10 , negedge RS &&& cond10 , 0 ,0, viol_0, , , delayed_CK, delayed_RS);
$setuphold(posedge CK &&& cond9 , posedge RS &&& cond9 , 0 ,0, viol_0, , , delayed_CK, delayed_RS);
$setuphold(posedge CK &&& cond9 , negedge RS &&& cond9 , 0 ,0, viol_0, , , delayed_CK, delayed_RS);
$setuphold(posedge CK &&& cond3 , posedge RS &&& cond3 , 0 ,0, viol_0, , , delayed_CK, delayed_RS);
$setuphold(posedge CK &&& cond3 , negedge RS &&& cond3 , 0 ,0, viol_0, , , delayed_CK, delayed_RS);
$setuphold(posedge CK &&& cond15 , posedge SE &&& cond15 , 0 ,0, viol_0, , , delayed_CK, delayed_SE);
$setuphold(posedge CK &&& cond15 , negedge SE &&& cond15 , 0 ,0, viol_0, , , delayed_CK, delayed_SE);
$setuphold(posedge CK &&& cond18 , posedge SE &&& cond18 , 0 ,0, viol_0, , , delayed_CK, delayed_SE);
$setuphold(posedge CK &&& cond18 , negedge SE &&& cond18 , 0 ,0, viol_0, , , delayed_CK, delayed_SE);
$setuphold(posedge CK &&& cond14 , posedge SE &&& cond14 , 0 ,0, viol_0, , , delayed_CK, delayed_SE);
$setuphold(posedge CK &&& cond14 , negedge SE &&& cond14 , 0 ,0, viol_0, , , delayed_CK, delayed_SE);
$setuphold(posedge CK &&& cond17 , posedge SE &&& cond17 , 0 ,0, viol_0, , , delayed_CK, delayed_SE);
$setuphold(posedge CK &&& cond17 , negedge SE &&& cond17 , 0 ,0, viol_0, , , delayed_CK, delayed_SE);
$setuphold(posedge CK &&& cond16 , posedge SE &&& cond16 , 0 ,0, viol_0, , , delayed_CK, delayed_SE);
$setuphold(posedge CK &&& cond16 , negedge SE &&& cond16 , 0 ,0, viol_0, , , delayed_CK, delayed_SE);
$setuphold(posedge CK &&& cond13 , posedge SE &&& cond13 , 0 ,0, viol_0, , , delayed_CK, delayed_SE);
$setuphold(posedge CK &&& cond13 , negedge SE &&& cond13 , 0 ,0, viol_0, , , delayed_CK, delayed_SE);
$setuphold(posedge CK &&& cond22 , posedge SI &&& cond22 , 0 ,0, viol_0, , , delayed_CK, delayed_SI);
$setuphold(posedge CK &&& cond22 , negedge SI &&& cond22 , 0 ,0, viol_0, , , delayed_CK, delayed_SI);
$setuphold(posedge CK &&& cond21 , posedge SI &&& cond21 , 0 ,0, viol_0, , , delayed_CK, delayed_SI);
$setuphold(posedge CK &&& cond21 , negedge SI &&& cond21 , 0 ,0, viol_0, , , delayed_CK, delayed_SI);
$setuphold(posedge CK &&& cond20 , posedge SI &&& cond20 , 0 ,0, viol_0, , , delayed_CK, delayed_SI);
$setuphold(posedge CK &&& cond20 , negedge SI &&& cond20 , 0 ,0, viol_0, , , delayed_CK, delayed_SI);
$setuphold(posedge CK &&& cond19 , posedge SI &&& cond19 , 0 ,0, viol_0, , , delayed_CK, delayed_SI);
$setuphold(posedge CK &&& cond19 , negedge SI &&& cond19 , 0 ,0, viol_0, , , delayed_CK, delayed_SI);
endspecify
   `endif
endmodule
`endcelldefine

//%END SVN_FSDPHCBQ_2

//%BEGIN SVN_FSDPHCBQ_4

`celldefine
module SVN_FSDPHCBQ_4 (Q, CK, D, SI, SE, EN, RS);
   output Q;
   input CK, D, SI, SE, EN, RS;

   reg viol_0;
   wire delayed_CK, delayed_D, delayed_SI,
	delayed_SE, delayed_EN, delayed_RS;

   wire int_res__D, int_res__S, int_res__RS, int_res_iq, xcr_0;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////

`ifdef _fv
   buf (delayed_CK, CK);
   buf (delayed_D, D);
   buf (delayed_SI, SI);
   buf (delayed_SE, SE);
   buf (delayed_EN, EN);
   buf (delayed_RS, RS);
`endif

   mux2 (int_res__D, int_res_iq, delayed_D, delayed_EN);
   mux2 (int_res__S, delayed_SI, int_res__D, delayed_SE);
   and (int_res__RS, int_res__S, delayed_RS);
   dff_err (xcr_0, delayed_CK, int_res__RS);
   dff (int_res_iq, viol_0, delayed_CK, int_res__RS, xcr_0);

   `ifdef VIRL_functiononly
      buf #`SNPS_SEQ_DELAY(Q, int_res_iq);
   `else
      buf (Q, int_res_iq);
   `endif

   `ifdef VIRL_functiononly

   `else

   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////

not U0 (_net_0, EN);
not U1 (_net_1, D);
not U2 (_net_2, SE);
and U3 (cond36, _net_0, _net_1, RS, _net_2);
not U4 (_net_3, D);
not U5 (_net_4, RS);
not U6 (_net_5, SE);
and U7 (cond35, EN, _net_3, _net_4, _net_5);
not U8 (_net_6, D);
not U9 (_net_7, RS);
and U10 (cond34, EN, _net_6, _net_7, SE, SI);
not U11 (_net_8, D);
and U12 (cond26, EN, _net_8, RS, SE, SI);
not U13 (_net_9, D);
not U14 (_net_10, SI);
and U15 (cond33, EN, _net_9, SE, _net_10);
not U16 (_net_11, RS);
not U17 (_net_12, EN);
not U18 (_net_13, SE);
and U19 (cond32, _net_11, _net_12, _net_13);
not U20 (_net_14, RS);
not U21 (_net_15, EN);
and U22 (cond31, _net_14, _net_15, SE, SI);
not U23 (_net_16, EN);
and U24 (cond24, RS, _net_16, SE, SI);
not U25 (_net_17, EN);
not U26 (_net_18, SI);
and U27 (cond30, SE, _net_17, _net_18);
not U28 (_net_19, EN);
not U29 (_net_20, SE);
and U30 (cond25, _net_19, D, RS, _net_20);
not U31 (_net_21, RS);
not U32 (_net_22, SE);
and U33 (cond29, EN, D, _net_21, _net_22);
not U34 (_net_23, RS);
and U35 (cond28, EN, D, _net_23, SE, SI);
and U36 (cond23, EN, D, RS, SE, SI);
not U37 (_net_24, SI);
and U38 (cond27, EN, D, SE, _net_24);
not U39 (_net_25, EN);
not U40 (_net_26, SE);
and U41 (cond0, RS, _net_25, _net_26);
not U42 (_net_27, D);
not U43 (_net_28, SE);
and U44 (cond2, RS, _net_27, _net_28);
not U45 (_net_29, SE);
and U46 (cond1, RS, D, _net_29);
not U47 (_net_30, EN);
not U48 (_net_31, D);
and U49 (cond8, _net_30, _net_31, SE, SI);
not U50 (_net_32, D);
not U51 (_net_33, SE);
not U52 (_net_34, SI);
and U53 (cond12, EN, _net_32, _net_33, _net_34);
not U54 (_net_35, D);
not U55 (_net_36, SE);
and U56 (cond11, EN, _net_35, _net_36, SI);
not U57 (_net_37, D);
and U58 (cond7, EN, _net_37, SE, SI);
not U59 (_net_38, EN);
not U60 (_net_39, SE);
not U61 (_net_40, SI);
and U62 (cond6, _net_38, D, _net_39, _net_40);
not U63 (_net_41, EN);
not U64 (_net_42, SE);
and U65 (cond5, _net_41, D, _net_42, SI);
not U66 (_net_43, EN);
and U67 (cond4, _net_43, D, SE, SI);
not U68 (_net_44, SE);
not U69 (_net_45, SI);
and U70 (cond10, EN, D, _net_44, _net_45);
not U71 (_net_46, SE);
and U72 (cond9, EN, D, _net_46, SI);
and U73 (cond3, EN, D, SE, SI);
not U74 (_net_47, EN);
not U75 (_net_48, D);
and U76 (cond15, _net_47, _net_48, RS, SI);
not U77 (_net_49, D);
not U78 (_net_50, SI);
and U79 (cond18, EN, _net_49, RS, _net_50);
not U80 (_net_51, D);
and U81 (cond14, EN, _net_51, RS, SI);
not U82 (_net_52, EN);
not U83 (_net_53, SI);
and U84 (cond17, _net_52, D, RS, _net_53);
not U85 (_net_54, SI);
and U86 (cond16, EN, D, RS, _net_54);
and U87 (cond13, EN, D, RS, SI);
not U88 (_net_55, EN);
not U89 (_net_56, D);
and U90 (cond22, _net_55, _net_56, RS, SE);
not U91 (_net_57, D);
and U92 (cond21, EN, _net_57, RS, SE);
not U93 (_net_58, EN);
and U94 (cond20, _net_58, D, RS, SE);
and U95 (cond19, EN, D, RS, SE);

specify
(posedge CK => (Q : 1'b1))=(0, 0);
$width(posedge CK &&& cond36 , 0 ,0, viol_0);
$width(negedge CK &&& cond36 , 0 ,0, viol_0);
$width(posedge CK &&& cond35 , 0 ,0, viol_0);
$width(negedge CK &&& cond35 , 0 ,0, viol_0);
$width(posedge CK &&& cond34 , 0 ,0, viol_0);
$width(negedge CK &&& cond34 , 0 ,0, viol_0);
$width(posedge CK &&& cond26 , 0 ,0, viol_0);
$width(negedge CK &&& cond26 , 0 ,0, viol_0);
$width(posedge CK &&& cond33 , 0 ,0, viol_0);
$width(negedge CK &&& cond33 , 0 ,0, viol_0);
$width(posedge CK &&& cond32 , 0 ,0, viol_0);
$width(negedge CK &&& cond32 , 0 ,0, viol_0);
$width(posedge CK &&& cond31 , 0 ,0, viol_0);
$width(negedge CK &&& cond31 , 0 ,0, viol_0);
$width(posedge CK &&& cond24 , 0 ,0, viol_0);
$width(negedge CK &&& cond24 , 0 ,0, viol_0);
$width(posedge CK &&& cond30 , 0 ,0, viol_0);
$width(negedge CK &&& cond30 , 0 ,0, viol_0);
$width(posedge CK &&& cond25 , 0 ,0, viol_0);
$width(negedge CK &&& cond25 , 0 ,0, viol_0);
$width(posedge CK &&& cond29 , 0 ,0, viol_0);
$width(negedge CK &&& cond29 , 0 ,0, viol_0);
$width(posedge CK &&& cond28 , 0 ,0, viol_0);
$width(negedge CK &&& cond28 , 0 ,0, viol_0);
$width(posedge CK &&& cond23 , 0 ,0, viol_0);
$width(negedge CK &&& cond23 , 0 ,0, viol_0);
$width(posedge CK &&& cond27 , 0 ,0, viol_0);
$width(negedge CK &&& cond27 , 0 ,0, viol_0);
$setuphold(posedge CK &&& cond0 , posedge D &&& cond0 , 0 ,0, viol_0, , , delayed_CK, delayed_D);
$setuphold(posedge CK &&& cond0 , negedge D &&& cond0 , 0 ,0, viol_0, , , delayed_CK, delayed_D);
$setuphold(posedge CK &&& cond2 , posedge EN &&& cond2 , 0 ,0, viol_0, , , delayed_CK, delayed_EN);
$setuphold(posedge CK &&& cond2 , negedge EN &&& cond2 , 0 ,0, viol_0, , , delayed_CK, delayed_EN);
$setuphold(posedge CK &&& cond1 , posedge EN &&& cond1 , 0 ,0, viol_0, , , delayed_CK, delayed_EN);
$setuphold(posedge CK &&& cond1 , negedge EN &&& cond1 , 0 ,0, viol_0, , , delayed_CK, delayed_EN);
$setuphold(posedge CK &&& cond8 , posedge RS &&& cond8 , 0 ,0, viol_0, , , delayed_CK, delayed_RS);
$setuphold(posedge CK &&& cond8 , negedge RS &&& cond8 , 0 ,0, viol_0, , , delayed_CK, delayed_RS);
$setuphold(posedge CK &&& cond12 , posedge RS &&& cond12 , 0 ,0, viol_0, , , delayed_CK, delayed_RS);
$setuphold(posedge CK &&& cond12 , negedge RS &&& cond12 , 0 ,0, viol_0, , , delayed_CK, delayed_RS);
$setuphold(posedge CK &&& cond11 , posedge RS &&& cond11 , 0 ,0, viol_0, , , delayed_CK, delayed_RS);
$setuphold(posedge CK &&& cond11 , negedge RS &&& cond11 , 0 ,0, viol_0, , , delayed_CK, delayed_RS);
$setuphold(posedge CK &&& cond7 , posedge RS &&& cond7 , 0 ,0, viol_0, , , delayed_CK, delayed_RS);
$setuphold(posedge CK &&& cond7 , negedge RS &&& cond7 , 0 ,0, viol_0, , , delayed_CK, delayed_RS);
$setuphold(posedge CK &&& cond6 , posedge RS &&& cond6 , 0 ,0, viol_0, , , delayed_CK, delayed_RS);
$setuphold(posedge CK &&& cond6 , negedge RS &&& cond6 , 0 ,0, viol_0, , , delayed_CK, delayed_RS);
$setuphold(posedge CK &&& cond5 , posedge RS &&& cond5 , 0 ,0, viol_0, , , delayed_CK, delayed_RS);
$setuphold(posedge CK &&& cond5 , negedge RS &&& cond5 , 0 ,0, viol_0, , , delayed_CK, delayed_RS);
$setuphold(posedge CK &&& cond4 , posedge RS &&& cond4 , 0 ,0, viol_0, , , delayed_CK, delayed_RS);
$setuphold(posedge CK &&& cond4 , negedge RS &&& cond4 , 0 ,0, viol_0, , , delayed_CK, delayed_RS);
$setuphold(posedge CK &&& cond10 , posedge RS &&& cond10 , 0 ,0, viol_0, , , delayed_CK, delayed_RS);
$setuphold(posedge CK &&& cond10 , negedge RS &&& cond10 , 0 ,0, viol_0, , , delayed_CK, delayed_RS);
$setuphold(posedge CK &&& cond9 , posedge RS &&& cond9 , 0 ,0, viol_0, , , delayed_CK, delayed_RS);
$setuphold(posedge CK &&& cond9 , negedge RS &&& cond9 , 0 ,0, viol_0, , , delayed_CK, delayed_RS);
$setuphold(posedge CK &&& cond3 , posedge RS &&& cond3 , 0 ,0, viol_0, , , delayed_CK, delayed_RS);
$setuphold(posedge CK &&& cond3 , negedge RS &&& cond3 , 0 ,0, viol_0, , , delayed_CK, delayed_RS);
$setuphold(posedge CK &&& cond15 , posedge SE &&& cond15 , 0 ,0, viol_0, , , delayed_CK, delayed_SE);
$setuphold(posedge CK &&& cond15 , negedge SE &&& cond15 , 0 ,0, viol_0, , , delayed_CK, delayed_SE);
$setuphold(posedge CK &&& cond18 , posedge SE &&& cond18 , 0 ,0, viol_0, , , delayed_CK, delayed_SE);
$setuphold(posedge CK &&& cond18 , negedge SE &&& cond18 , 0 ,0, viol_0, , , delayed_CK, delayed_SE);
$setuphold(posedge CK &&& cond14 , posedge SE &&& cond14 , 0 ,0, viol_0, , , delayed_CK, delayed_SE);
$setuphold(posedge CK &&& cond14 , negedge SE &&& cond14 , 0 ,0, viol_0, , , delayed_CK, delayed_SE);
$setuphold(posedge CK &&& cond17 , posedge SE &&& cond17 , 0 ,0, viol_0, , , delayed_CK, delayed_SE);
$setuphold(posedge CK &&& cond17 , negedge SE &&& cond17 , 0 ,0, viol_0, , , delayed_CK, delayed_SE);
$setuphold(posedge CK &&& cond16 , posedge SE &&& cond16 , 0 ,0, viol_0, , , delayed_CK, delayed_SE);
$setuphold(posedge CK &&& cond16 , negedge SE &&& cond16 , 0 ,0, viol_0, , , delayed_CK, delayed_SE);
$setuphold(posedge CK &&& cond13 , posedge SE &&& cond13 , 0 ,0, viol_0, , , delayed_CK, delayed_SE);
$setuphold(posedge CK &&& cond13 , negedge SE &&& cond13 , 0 ,0, viol_0, , , delayed_CK, delayed_SE);
$setuphold(posedge CK &&& cond22 , posedge SI &&& cond22 , 0 ,0, viol_0, , , delayed_CK, delayed_SI);
$setuphold(posedge CK &&& cond22 , negedge SI &&& cond22 , 0 ,0, viol_0, , , delayed_CK, delayed_SI);
$setuphold(posedge CK &&& cond21 , posedge SI &&& cond21 , 0 ,0, viol_0, , , delayed_CK, delayed_SI);
$setuphold(posedge CK &&& cond21 , negedge SI &&& cond21 , 0 ,0, viol_0, , , delayed_CK, delayed_SI);
$setuphold(posedge CK &&& cond20 , posedge SI &&& cond20 , 0 ,0, viol_0, , , delayed_CK, delayed_SI);
$setuphold(posedge CK &&& cond20 , negedge SI &&& cond20 , 0 ,0, viol_0, , , delayed_CK, delayed_SI);
$setuphold(posedge CK &&& cond19 , posedge SI &&& cond19 , 0 ,0, viol_0, , , delayed_CK, delayed_SI);
$setuphold(posedge CK &&& cond19 , negedge SI &&& cond19 , 0 ,0, viol_0, , , delayed_CK, delayed_SI);
endspecify
   `endif
endmodule
`endcelldefine

//%END SVN_FSDPHCBQ_4

//%BEGIN SVN_FSDPHQ_FFS_1

`celldefine
module SVN_FSDPHQ_FFS_1 (Q, CK, D, SI, SE, EN);
   output Q;
   input CK, D, SI, SE, EN;

   reg viol_0;
   wire delayed_CK, delayed_D, delayed_SI,
	delayed_SE, delayed_EN;

   wire int_res__D, int_res__S, int_res_iq, xcr_0;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////

`ifdef _fv
   buf (delayed_CK, CK);
   buf (delayed_D, D);
   buf (delayed_SI, SI);
   buf (delayed_SE, SE);
   buf (delayed_EN, EN);
`endif

   mux2 (int_res__D, int_res_iq, delayed_D, delayed_EN);
   mux2 (int_res__S, delayed_SI, int_res__D, delayed_SE);
   dff_err (xcr_0, delayed_CK, int_res__S);
   dff (int_res_iq, viol_0, delayed_CK, int_res__S, xcr_0);
   

   `ifdef VIRL_functiononly
       buf #`SNPS_SEQ_DELAY (Q, int_res_iq);
   `else
       buf (Q, int_res_iq);
   `endif

   `ifdef VIRL_functiononly

   `else
   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////
not U0 (_net_0, EN);
not U1 (_net_1, D);
not U2 (_net_2, SE);
and U3 (cond20, _net_0, _net_1, _net_2);
not U4 (_net_3, D);
not U5 (_net_4, SI);
and U6 (cond19, EN, _net_3, SE, _net_4);
not U7 (_net_5, D);
and U8 (cond16, EN, _net_5, SE, SI);
not U9 (_net_6, EN);
not U10 (_net_7, SI);
and U11 (cond18, SE, _net_6, _net_7);
not U12 (_net_8, EN);
and U13 (cond14, SE, _net_8, SI);
not U14 (_net_9, EN);
not U15 (_net_10, SE);
and U16 (cond15, _net_9, D, _net_10);
not U17 (_net_11, SI);
and U18 (cond17, EN, D, SE, _net_11);
and U19 (cond13, EN, D, SE, SI);
not U20 (_net_12, SE);
not U21 (_net_13, EN);
and U22 (cond0, _net_12, _net_13);
not U23 (_net_14, SE);
not U24 (_net_15, D);
and U25 (cond2, _net_14, _net_15);
not U26 (_net_16, SE);
and U27 (cond1, _net_16, D);
not U28 (_net_17, EN);
not U29 (_net_18, D);
and U30 (cond5, _net_17, _net_18, SI);
not U31 (_net_19, D);
not U32 (_net_20, SI);
and U33 (cond8, EN, _net_19, _net_20);
not U34 (_net_21, D);
and U35 (cond4, EN, _net_21, SI);
not U36 (_net_22, EN);
not U37 (_net_23, SI);
and U38 (cond7, _net_22, D, _net_23);
not U39 (_net_24, SI);
and U40 (cond6, EN, D, _net_24);
and U41 (cond3, EN, D, SI);
not U42 (_net_25, EN);
not U43 (_net_26, D);
and U44 (cond12, _net_25, _net_26, SE);
not U45 (_net_27, D);
and U46 (cond11, EN, _net_27, SE);
not U47 (_net_28, EN);
and U48 (cond10, _net_28, D, SE);
and U49 (cond9, EN, D, SE);

specify
(posedge CK => (Q : 1'b1))=(0, 0);
$width(posedge CK &&& cond20 , 0 ,0, viol_0);
$width(negedge CK &&& cond20 , 0 ,0, viol_0);
$width(posedge CK &&& cond19 , 0 ,0, viol_0);
$width(negedge CK &&& cond19 , 0 ,0, viol_0);
$width(posedge CK &&& cond16 , 0 ,0, viol_0);
$width(negedge CK &&& cond16 , 0 ,0, viol_0);
$width(posedge CK &&& cond18 , 0 ,0, viol_0);
$width(negedge CK &&& cond18 , 0 ,0, viol_0);
$width(posedge CK &&& cond14 , 0 ,0, viol_0);
$width(negedge CK &&& cond14 , 0 ,0, viol_0);
$width(posedge CK &&& cond15 , 0 ,0, viol_0);
$width(negedge CK &&& cond15 , 0 ,0, viol_0);
$width(posedge CK &&& cond17 , 0 ,0, viol_0);
$width(negedge CK &&& cond17 , 0 ,0, viol_0);
$width(posedge CK &&& cond13 , 0 ,0, viol_0);
$width(negedge CK &&& cond13 , 0 ,0, viol_0);
$setuphold(posedge CK &&& cond0 , posedge D &&& cond0 , 0 ,0, viol_0, , , delayed_CK, delayed_D);
$setuphold(posedge CK &&& cond0 , negedge D &&& cond0 , 0 ,0, viol_0, , , delayed_CK, delayed_D);
$setuphold(posedge CK &&& cond2 , posedge EN &&& cond2 , 0 ,0, viol_0, , , delayed_CK, delayed_EN);
$setuphold(posedge CK &&& cond2 , negedge EN &&& cond2 , 0 ,0, viol_0, , , delayed_CK, delayed_EN);
$setuphold(posedge CK &&& cond1 , posedge EN &&& cond1 , 0 ,0, viol_0, , , delayed_CK, delayed_EN);
$setuphold(posedge CK &&& cond1 , negedge EN &&& cond1 , 0 ,0, viol_0, , , delayed_CK, delayed_EN);
$setuphold(posedge CK &&& cond5 , posedge SE &&& cond5 , 0 ,0, viol_0, , , delayed_CK, delayed_SE);
$setuphold(posedge CK &&& cond5 , negedge SE &&& cond5 , 0 ,0, viol_0, , , delayed_CK, delayed_SE);
$setuphold(posedge CK &&& cond8 , posedge SE &&& cond8 , 0 ,0, viol_0, , , delayed_CK, delayed_SE);
$setuphold(posedge CK &&& cond8 , negedge SE &&& cond8 , 0 ,0, viol_0, , , delayed_CK, delayed_SE);
$setuphold(posedge CK &&& cond4 , posedge SE &&& cond4 , 0 ,0, viol_0, , , delayed_CK, delayed_SE);
$setuphold(posedge CK &&& cond4 , negedge SE &&& cond4 , 0 ,0, viol_0, , , delayed_CK, delayed_SE);
$setuphold(posedge CK &&& cond7 , posedge SE &&& cond7 , 0 ,0, viol_0, , , delayed_CK, delayed_SE);
$setuphold(posedge CK &&& cond7 , negedge SE &&& cond7 , 0 ,0, viol_0, , , delayed_CK, delayed_SE);
$setuphold(posedge CK &&& cond6 , posedge SE &&& cond6 , 0 ,0, viol_0, , , delayed_CK, delayed_SE);
$setuphold(posedge CK &&& cond6 , negedge SE &&& cond6 , 0 ,0, viol_0, , , delayed_CK, delayed_SE);
$setuphold(posedge CK &&& cond3 , posedge SE &&& cond3 , 0 ,0, viol_0, , , delayed_CK, delayed_SE);
$setuphold(posedge CK &&& cond3 , negedge SE &&& cond3 , 0 ,0, viol_0, , , delayed_CK, delayed_SE);
$setuphold(posedge CK &&& cond12 , posedge SI &&& cond12 , 0 ,0, viol_0, , , delayed_CK, delayed_SI);
$setuphold(posedge CK &&& cond12 , negedge SI &&& cond12 , 0 ,0, viol_0, , , delayed_CK, delayed_SI);
$setuphold(posedge CK &&& cond11 , posedge SI &&& cond11 , 0 ,0, viol_0, , , delayed_CK, delayed_SI);
$setuphold(posedge CK &&& cond11 , negedge SI &&& cond11 , 0 ,0, viol_0, , , delayed_CK, delayed_SI);
$setuphold(posedge CK &&& cond10 , posedge SI &&& cond10 , 0 ,0, viol_0, , , delayed_CK, delayed_SI);
$setuphold(posedge CK &&& cond10 , negedge SI &&& cond10 , 0 ,0, viol_0, , , delayed_CK, delayed_SI);
$setuphold(posedge CK &&& cond9 , posedge SI &&& cond9 , 0 ,0, viol_0, , , delayed_CK, delayed_SI);
$setuphold(posedge CK &&& cond9 , negedge SI &&& cond9 , 0 ,0, viol_0, , , delayed_CK, delayed_SI);
endspecify
   `endif
endmodule
`endcelldefine

//%END SVN_FSDPHQ_FFS_1

//%BEGIN SVN_FSDPHQ_FFS_2

`celldefine
module SVN_FSDPHQ_FFS_2 (Q, CK, D, SI, SE, EN);
   output Q;
   input CK, D, SI, SE, EN;

   reg viol_0;
   wire delayed_CK, delayed_D, delayed_SI,
	delayed_SE, delayed_EN;

   wire int_res__D, int_res__S, int_res_iq, xcr_0;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////

`ifdef _fv
   buf (delayed_CK, CK);
   buf (delayed_D, D);
   buf (delayed_SI, SI);
   buf (delayed_SE, SE);
   buf (delayed_EN, EN);
`endif

   mux2 (int_res__D, int_res_iq, delayed_D, delayed_EN);
   mux2 (int_res__S, delayed_SI, int_res__D, delayed_SE);
   dff_err (xcr_0, delayed_CK, int_res__S);
   dff (int_res_iq, viol_0, delayed_CK, int_res__S, xcr_0);
   

   `ifdef VIRL_functiononly
       buf #`SNPS_SEQ_DELAY (Q, int_res_iq);
   `else
       buf (Q, int_res_iq);
   `endif

   `ifdef VIRL_functiononly

   `else
   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////
not U0 (_net_0, EN);
not U1 (_net_1, D);
not U2 (_net_2, SE);
and U3 (cond20, _net_0, _net_1, _net_2);
not U4 (_net_3, D);
not U5 (_net_4, SI);
and U6 (cond19, EN, _net_3, SE, _net_4);
not U7 (_net_5, D);
and U8 (cond16, EN, _net_5, SE, SI);
not U9 (_net_6, EN);
not U10 (_net_7, SI);
and U11 (cond18, SE, _net_6, _net_7);
not U12 (_net_8, EN);
and U13 (cond14, SE, _net_8, SI);
not U14 (_net_9, EN);
not U15 (_net_10, SE);
and U16 (cond15, _net_9, D, _net_10);
not U17 (_net_11, SI);
and U18 (cond17, EN, D, SE, _net_11);
and U19 (cond13, EN, D, SE, SI);
not U20 (_net_12, SE);
not U21 (_net_13, EN);
and U22 (cond0, _net_12, _net_13);
not U23 (_net_14, SE);
not U24 (_net_15, D);
and U25 (cond2, _net_14, _net_15);
not U26 (_net_16, SE);
and U27 (cond1, _net_16, D);
not U28 (_net_17, EN);
not U29 (_net_18, D);
and U30 (cond5, _net_17, _net_18, SI);
not U31 (_net_19, D);
not U32 (_net_20, SI);
and U33 (cond8, EN, _net_19, _net_20);
not U34 (_net_21, D);
and U35 (cond4, EN, _net_21, SI);
not U36 (_net_22, EN);
not U37 (_net_23, SI);
and U38 (cond7, _net_22, D, _net_23);
not U39 (_net_24, SI);
and U40 (cond6, EN, D, _net_24);
and U41 (cond3, EN, D, SI);
not U42 (_net_25, EN);
not U43 (_net_26, D);
and U44 (cond12, _net_25, _net_26, SE);
not U45 (_net_27, D);
and U46 (cond11, EN, _net_27, SE);
not U47 (_net_28, EN);
and U48 (cond10, _net_28, D, SE);
and U49 (cond9, EN, D, SE);

specify
(posedge CK => (Q : 1'b1))=(0, 0);
$width(posedge CK &&& cond20 , 0 ,0, viol_0);
$width(negedge CK &&& cond20 , 0 ,0, viol_0);
$width(posedge CK &&& cond19 , 0 ,0, viol_0);
$width(negedge CK &&& cond19 , 0 ,0, viol_0);
$width(posedge CK &&& cond16 , 0 ,0, viol_0);
$width(negedge CK &&& cond16 , 0 ,0, viol_0);
$width(posedge CK &&& cond18 , 0 ,0, viol_0);
$width(negedge CK &&& cond18 , 0 ,0, viol_0);
$width(posedge CK &&& cond14 , 0 ,0, viol_0);
$width(negedge CK &&& cond14 , 0 ,0, viol_0);
$width(posedge CK &&& cond15 , 0 ,0, viol_0);
$width(negedge CK &&& cond15 , 0 ,0, viol_0);
$width(posedge CK &&& cond17 , 0 ,0, viol_0);
$width(negedge CK &&& cond17 , 0 ,0, viol_0);
$width(posedge CK &&& cond13 , 0 ,0, viol_0);
$width(negedge CK &&& cond13 , 0 ,0, viol_0);
$setuphold(posedge CK &&& cond0 , posedge D &&& cond0 , 0 ,0, viol_0, , , delayed_CK, delayed_D);
$setuphold(posedge CK &&& cond0 , negedge D &&& cond0 , 0 ,0, viol_0, , , delayed_CK, delayed_D);
$setuphold(posedge CK &&& cond2 , posedge EN &&& cond2 , 0 ,0, viol_0, , , delayed_CK, delayed_EN);
$setuphold(posedge CK &&& cond2 , negedge EN &&& cond2 , 0 ,0, viol_0, , , delayed_CK, delayed_EN);
$setuphold(posedge CK &&& cond1 , posedge EN &&& cond1 , 0 ,0, viol_0, , , delayed_CK, delayed_EN);
$setuphold(posedge CK &&& cond1 , negedge EN &&& cond1 , 0 ,0, viol_0, , , delayed_CK, delayed_EN);
$setuphold(posedge CK &&& cond5 , posedge SE &&& cond5 , 0 ,0, viol_0, , , delayed_CK, delayed_SE);
$setuphold(posedge CK &&& cond5 , negedge SE &&& cond5 , 0 ,0, viol_0, , , delayed_CK, delayed_SE);
$setuphold(posedge CK &&& cond8 , posedge SE &&& cond8 , 0 ,0, viol_0, , , delayed_CK, delayed_SE);
$setuphold(posedge CK &&& cond8 , negedge SE &&& cond8 , 0 ,0, viol_0, , , delayed_CK, delayed_SE);
$setuphold(posedge CK &&& cond4 , posedge SE &&& cond4 , 0 ,0, viol_0, , , delayed_CK, delayed_SE);
$setuphold(posedge CK &&& cond4 , negedge SE &&& cond4 , 0 ,0, viol_0, , , delayed_CK, delayed_SE);
$setuphold(posedge CK &&& cond7 , posedge SE &&& cond7 , 0 ,0, viol_0, , , delayed_CK, delayed_SE);
$setuphold(posedge CK &&& cond7 , negedge SE &&& cond7 , 0 ,0, viol_0, , , delayed_CK, delayed_SE);
$setuphold(posedge CK &&& cond6 , posedge SE &&& cond6 , 0 ,0, viol_0, , , delayed_CK, delayed_SE);
$setuphold(posedge CK &&& cond6 , negedge SE &&& cond6 , 0 ,0, viol_0, , , delayed_CK, delayed_SE);
$setuphold(posedge CK &&& cond3 , posedge SE &&& cond3 , 0 ,0, viol_0, , , delayed_CK, delayed_SE);
$setuphold(posedge CK &&& cond3 , negedge SE &&& cond3 , 0 ,0, viol_0, , , delayed_CK, delayed_SE);
$setuphold(posedge CK &&& cond12 , posedge SI &&& cond12 , 0 ,0, viol_0, , , delayed_CK, delayed_SI);
$setuphold(posedge CK &&& cond12 , negedge SI &&& cond12 , 0 ,0, viol_0, , , delayed_CK, delayed_SI);
$setuphold(posedge CK &&& cond11 , posedge SI &&& cond11 , 0 ,0, viol_0, , , delayed_CK, delayed_SI);
$setuphold(posedge CK &&& cond11 , negedge SI &&& cond11 , 0 ,0, viol_0, , , delayed_CK, delayed_SI);
$setuphold(posedge CK &&& cond10 , posedge SI &&& cond10 , 0 ,0, viol_0, , , delayed_CK, delayed_SI);
$setuphold(posedge CK &&& cond10 , negedge SI &&& cond10 , 0 ,0, viol_0, , , delayed_CK, delayed_SI);
$setuphold(posedge CK &&& cond9 , posedge SI &&& cond9 , 0 ,0, viol_0, , , delayed_CK, delayed_SI);
$setuphold(posedge CK &&& cond9 , negedge SI &&& cond9 , 0 ,0, viol_0, , , delayed_CK, delayed_SI);
endspecify
   `endif
endmodule
`endcelldefine

//%END SVN_FSDPHQ_FFS_2

//%BEGIN SVN_FSDPHQ_FFS_4

`celldefine
module SVN_FSDPHQ_FFS_4 (Q, CK, D, SI, SE, EN);
   output Q;
   input CK, D, SI, SE, EN;

   reg viol_0;
   wire delayed_CK, delayed_D, delayed_SI,
	delayed_SE, delayed_EN;

   wire int_res__D, int_res__S, int_res_iq, xcr_0;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////

`ifdef _fv
   buf (delayed_CK, CK);
   buf (delayed_D, D);
   buf (delayed_SI, SI);
   buf (delayed_SE, SE);
   buf (delayed_EN, EN);
`endif

   mux2 (int_res__D, int_res_iq, delayed_D, delayed_EN);
   mux2 (int_res__S, delayed_SI, int_res__D, delayed_SE);
   dff_err (xcr_0, delayed_CK, int_res__S);
   dff (int_res_iq, viol_0, delayed_CK, int_res__S, xcr_0);
   

   `ifdef VIRL_functiononly
       buf #`SNPS_SEQ_DELAY (Q, int_res_iq);
   `else
       buf (Q, int_res_iq);
   `endif

   `ifdef VIRL_functiononly

   `else
   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////
not U0 (_net_0, EN);
not U1 (_net_1, D);
not U2 (_net_2, SE);
and U3 (cond20, _net_0, _net_1, _net_2);
not U4 (_net_3, D);
not U5 (_net_4, SI);
and U6 (cond19, EN, _net_3, SE, _net_4);
not U7 (_net_5, D);
and U8 (cond16, EN, _net_5, SE, SI);
not U9 (_net_6, EN);
not U10 (_net_7, SI);
and U11 (cond18, SE, _net_6, _net_7);
not U12 (_net_8, EN);
and U13 (cond14, SE, _net_8, SI);
not U14 (_net_9, EN);
not U15 (_net_10, SE);
and U16 (cond15, _net_9, D, _net_10);
not U17 (_net_11, SI);
and U18 (cond17, EN, D, SE, _net_11);
and U19 (cond13, EN, D, SE, SI);
not U20 (_net_12, SE);
not U21 (_net_13, EN);
and U22 (cond0, _net_12, _net_13);
not U23 (_net_14, SE);
not U24 (_net_15, D);
and U25 (cond2, _net_14, _net_15);
not U26 (_net_16, SE);
and U27 (cond1, _net_16, D);
not U28 (_net_17, EN);
not U29 (_net_18, D);
and U30 (cond5, _net_17, _net_18, SI);
not U31 (_net_19, D);
not U32 (_net_20, SI);
and U33 (cond8, EN, _net_19, _net_20);
not U34 (_net_21, D);
and U35 (cond4, EN, _net_21, SI);
not U36 (_net_22, EN);
not U37 (_net_23, SI);
and U38 (cond7, _net_22, D, _net_23);
not U39 (_net_24, SI);
and U40 (cond6, EN, D, _net_24);
and U41 (cond3, EN, D, SI);
not U42 (_net_25, EN);
not U43 (_net_26, D);
and U44 (cond12, _net_25, _net_26, SE);
not U45 (_net_27, D);
and U46 (cond11, EN, _net_27, SE);
not U47 (_net_28, EN);
and U48 (cond10, _net_28, D, SE);
and U49 (cond9, EN, D, SE);

specify
(posedge CK => (Q : 1'b1))=(0, 0);
$width(posedge CK &&& cond20 , 0 ,0, viol_0);
$width(negedge CK &&& cond20 , 0 ,0, viol_0);
$width(posedge CK &&& cond19 , 0 ,0, viol_0);
$width(negedge CK &&& cond19 , 0 ,0, viol_0);
$width(posedge CK &&& cond16 , 0 ,0, viol_0);
$width(negedge CK &&& cond16 , 0 ,0, viol_0);
$width(posedge CK &&& cond18 , 0 ,0, viol_0);
$width(negedge CK &&& cond18 , 0 ,0, viol_0);
$width(posedge CK &&& cond14 , 0 ,0, viol_0);
$width(negedge CK &&& cond14 , 0 ,0, viol_0);
$width(posedge CK &&& cond15 , 0 ,0, viol_0);
$width(negedge CK &&& cond15 , 0 ,0, viol_0);
$width(posedge CK &&& cond17 , 0 ,0, viol_0);
$width(negedge CK &&& cond17 , 0 ,0, viol_0);
$width(posedge CK &&& cond13 , 0 ,0, viol_0);
$width(negedge CK &&& cond13 , 0 ,0, viol_0);
$setuphold(posedge CK &&& cond0 , posedge D &&& cond0 , 0 ,0, viol_0, , , delayed_CK, delayed_D);
$setuphold(posedge CK &&& cond0 , negedge D &&& cond0 , 0 ,0, viol_0, , , delayed_CK, delayed_D);
$setuphold(posedge CK &&& cond2 , posedge EN &&& cond2 , 0 ,0, viol_0, , , delayed_CK, delayed_EN);
$setuphold(posedge CK &&& cond2 , negedge EN &&& cond2 , 0 ,0, viol_0, , , delayed_CK, delayed_EN);
$setuphold(posedge CK &&& cond1 , posedge EN &&& cond1 , 0 ,0, viol_0, , , delayed_CK, delayed_EN);
$setuphold(posedge CK &&& cond1 , negedge EN &&& cond1 , 0 ,0, viol_0, , , delayed_CK, delayed_EN);
$setuphold(posedge CK &&& cond5 , posedge SE &&& cond5 , 0 ,0, viol_0, , , delayed_CK, delayed_SE);
$setuphold(posedge CK &&& cond5 , negedge SE &&& cond5 , 0 ,0, viol_0, , , delayed_CK, delayed_SE);
$setuphold(posedge CK &&& cond8 , posedge SE &&& cond8 , 0 ,0, viol_0, , , delayed_CK, delayed_SE);
$setuphold(posedge CK &&& cond8 , negedge SE &&& cond8 , 0 ,0, viol_0, , , delayed_CK, delayed_SE);
$setuphold(posedge CK &&& cond4 , posedge SE &&& cond4 , 0 ,0, viol_0, , , delayed_CK, delayed_SE);
$setuphold(posedge CK &&& cond4 , negedge SE &&& cond4 , 0 ,0, viol_0, , , delayed_CK, delayed_SE);
$setuphold(posedge CK &&& cond7 , posedge SE &&& cond7 , 0 ,0, viol_0, , , delayed_CK, delayed_SE);
$setuphold(posedge CK &&& cond7 , negedge SE &&& cond7 , 0 ,0, viol_0, , , delayed_CK, delayed_SE);
$setuphold(posedge CK &&& cond6 , posedge SE &&& cond6 , 0 ,0, viol_0, , , delayed_CK, delayed_SE);
$setuphold(posedge CK &&& cond6 , negedge SE &&& cond6 , 0 ,0, viol_0, , , delayed_CK, delayed_SE);
$setuphold(posedge CK &&& cond3 , posedge SE &&& cond3 , 0 ,0, viol_0, , , delayed_CK, delayed_SE);
$setuphold(posedge CK &&& cond3 , negedge SE &&& cond3 , 0 ,0, viol_0, , , delayed_CK, delayed_SE);
$setuphold(posedge CK &&& cond12 , posedge SI &&& cond12 , 0 ,0, viol_0, , , delayed_CK, delayed_SI);
$setuphold(posedge CK &&& cond12 , negedge SI &&& cond12 , 0 ,0, viol_0, , , delayed_CK, delayed_SI);
$setuphold(posedge CK &&& cond11 , posedge SI &&& cond11 , 0 ,0, viol_0, , , delayed_CK, delayed_SI);
$setuphold(posedge CK &&& cond11 , negedge SI &&& cond11 , 0 ,0, viol_0, , , delayed_CK, delayed_SI);
$setuphold(posedge CK &&& cond10 , posedge SI &&& cond10 , 0 ,0, viol_0, , , delayed_CK, delayed_SI);
$setuphold(posedge CK &&& cond10 , negedge SI &&& cond10 , 0 ,0, viol_0, , , delayed_CK, delayed_SI);
$setuphold(posedge CK &&& cond9 , posedge SI &&& cond9 , 0 ,0, viol_0, , , delayed_CK, delayed_SI);
$setuphold(posedge CK &&& cond9 , negedge SI &&& cond9 , 0 ,0, viol_0, , , delayed_CK, delayed_SI);
endspecify
   `endif
endmodule
`endcelldefine

//%END SVN_FSDPHQ_FFS_4

//%BEGIN SVN_FSDPHQ_1

`celldefine
module SVN_FSDPHQ_1 (Q, CK, D, SI, SE, EN);
   output Q;
   input CK, D, SI, SE, EN;

   reg viol_0;
   wire delayed_CK, delayed_D, delayed_SI,
	delayed_SE, delayed_EN;

   wire int_res__D, int_res__S, int_res_iq, xcr_0;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////

`ifdef _fv
   buf (delayed_CK, CK);
   buf (delayed_D, D);
   buf (delayed_SI, SI);
   buf (delayed_SE, SE);
   buf (delayed_EN, EN);
`endif

   mux2 (int_res__D, int_res_iq, delayed_D, delayed_EN);
   mux2 (int_res__S, delayed_SI, int_res__D, delayed_SE);
   dff_err (xcr_0, delayed_CK, int_res__S);
   dff (int_res_iq, viol_0, delayed_CK, int_res__S, xcr_0);
   

   `ifdef VIRL_functiononly
       buf #`SNPS_SEQ_DELAY (Q, int_res_iq);
   `else
       buf (Q, int_res_iq);
   `endif

   `ifdef VIRL_functiononly

   `else
   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////
not U0 (_net_0, EN);
not U1 (_net_1, D);
not U2 (_net_2, SE);
and U3 (cond20, _net_0, _net_1, _net_2);
not U4 (_net_3, D);
not U5 (_net_4, SI);
and U6 (cond19, EN, _net_3, SE, _net_4);
not U7 (_net_5, D);
and U8 (cond16, EN, _net_5, SE, SI);
not U9 (_net_6, EN);
not U10 (_net_7, SI);
and U11 (cond18, SE, _net_6, _net_7);
not U12 (_net_8, EN);
and U13 (cond14, SE, _net_8, SI);
not U14 (_net_9, EN);
not U15 (_net_10, SE);
and U16 (cond15, _net_9, D, _net_10);
not U17 (_net_11, SI);
and U18 (cond17, EN, D, SE, _net_11);
and U19 (cond13, EN, D, SE, SI);
not U20 (_net_12, SE);
not U21 (_net_13, EN);
and U22 (cond0, _net_12, _net_13);
not U23 (_net_14, SE);
not U24 (_net_15, D);
and U25 (cond2, _net_14, _net_15);
not U26 (_net_16, SE);
and U27 (cond1, _net_16, D);
not U28 (_net_17, EN);
not U29 (_net_18, D);
and U30 (cond5, _net_17, _net_18, SI);
not U31 (_net_19, D);
not U32 (_net_20, SI);
and U33 (cond8, EN, _net_19, _net_20);
not U34 (_net_21, D);
and U35 (cond4, EN, _net_21, SI);
not U36 (_net_22, EN);
not U37 (_net_23, SI);
and U38 (cond7, _net_22, D, _net_23);
not U39 (_net_24, SI);
and U40 (cond6, EN, D, _net_24);
and U41 (cond3, EN, D, SI);
not U42 (_net_25, EN);
not U43 (_net_26, D);
and U44 (cond12, _net_25, _net_26, SE);
not U45 (_net_27, D);
and U46 (cond11, EN, _net_27, SE);
not U47 (_net_28, EN);
and U48 (cond10, _net_28, D, SE);
and U49 (cond9, EN, D, SE);

specify
(posedge CK => (Q : 1'b1))=(0, 0);
$width(posedge CK &&& cond20 , 0 ,0, viol_0);
$width(negedge CK &&& cond20 , 0 ,0, viol_0);
$width(posedge CK &&& cond19 , 0 ,0, viol_0);
$width(negedge CK &&& cond19 , 0 ,0, viol_0);
$width(posedge CK &&& cond16 , 0 ,0, viol_0);
$width(negedge CK &&& cond16 , 0 ,0, viol_0);
$width(posedge CK &&& cond18 , 0 ,0, viol_0);
$width(negedge CK &&& cond18 , 0 ,0, viol_0);
$width(posedge CK &&& cond14 , 0 ,0, viol_0);
$width(negedge CK &&& cond14 , 0 ,0, viol_0);
$width(posedge CK &&& cond15 , 0 ,0, viol_0);
$width(negedge CK &&& cond15 , 0 ,0, viol_0);
$width(posedge CK &&& cond17 , 0 ,0, viol_0);
$width(negedge CK &&& cond17 , 0 ,0, viol_0);
$width(posedge CK &&& cond13 , 0 ,0, viol_0);
$width(negedge CK &&& cond13 , 0 ,0, viol_0);
$setuphold(posedge CK &&& cond0 , posedge D &&& cond0 , 0 ,0, viol_0, , , delayed_CK, delayed_D);
$setuphold(posedge CK &&& cond0 , negedge D &&& cond0 , 0 ,0, viol_0, , , delayed_CK, delayed_D);
$setuphold(posedge CK &&& cond2 , posedge EN &&& cond2 , 0 ,0, viol_0, , , delayed_CK, delayed_EN);
$setuphold(posedge CK &&& cond2 , negedge EN &&& cond2 , 0 ,0, viol_0, , , delayed_CK, delayed_EN);
$setuphold(posedge CK &&& cond1 , posedge EN &&& cond1 , 0 ,0, viol_0, , , delayed_CK, delayed_EN);
$setuphold(posedge CK &&& cond1 , negedge EN &&& cond1 , 0 ,0, viol_0, , , delayed_CK, delayed_EN);
$setuphold(posedge CK &&& cond5 , posedge SE &&& cond5 , 0 ,0, viol_0, , , delayed_CK, delayed_SE);
$setuphold(posedge CK &&& cond5 , negedge SE &&& cond5 , 0 ,0, viol_0, , , delayed_CK, delayed_SE);
$setuphold(posedge CK &&& cond8 , posedge SE &&& cond8 , 0 ,0, viol_0, , , delayed_CK, delayed_SE);
$setuphold(posedge CK &&& cond8 , negedge SE &&& cond8 , 0 ,0, viol_0, , , delayed_CK, delayed_SE);
$setuphold(posedge CK &&& cond4 , posedge SE &&& cond4 , 0 ,0, viol_0, , , delayed_CK, delayed_SE);
$setuphold(posedge CK &&& cond4 , negedge SE &&& cond4 , 0 ,0, viol_0, , , delayed_CK, delayed_SE);
$setuphold(posedge CK &&& cond7 , posedge SE &&& cond7 , 0 ,0, viol_0, , , delayed_CK, delayed_SE);
$setuphold(posedge CK &&& cond7 , negedge SE &&& cond7 , 0 ,0, viol_0, , , delayed_CK, delayed_SE);
$setuphold(posedge CK &&& cond6 , posedge SE &&& cond6 , 0 ,0, viol_0, , , delayed_CK, delayed_SE);
$setuphold(posedge CK &&& cond6 , negedge SE &&& cond6 , 0 ,0, viol_0, , , delayed_CK, delayed_SE);
$setuphold(posedge CK &&& cond3 , posedge SE &&& cond3 , 0 ,0, viol_0, , , delayed_CK, delayed_SE);
$setuphold(posedge CK &&& cond3 , negedge SE &&& cond3 , 0 ,0, viol_0, , , delayed_CK, delayed_SE);
$setuphold(posedge CK &&& cond12 , posedge SI &&& cond12 , 0 ,0, viol_0, , , delayed_CK, delayed_SI);
$setuphold(posedge CK &&& cond12 , negedge SI &&& cond12 , 0 ,0, viol_0, , , delayed_CK, delayed_SI);
$setuphold(posedge CK &&& cond11 , posedge SI &&& cond11 , 0 ,0, viol_0, , , delayed_CK, delayed_SI);
$setuphold(posedge CK &&& cond11 , negedge SI &&& cond11 , 0 ,0, viol_0, , , delayed_CK, delayed_SI);
$setuphold(posedge CK &&& cond10 , posedge SI &&& cond10 , 0 ,0, viol_0, , , delayed_CK, delayed_SI);
$setuphold(posedge CK &&& cond10 , negedge SI &&& cond10 , 0 ,0, viol_0, , , delayed_CK, delayed_SI);
$setuphold(posedge CK &&& cond9 , posedge SI &&& cond9 , 0 ,0, viol_0, , , delayed_CK, delayed_SI);
$setuphold(posedge CK &&& cond9 , negedge SI &&& cond9 , 0 ,0, viol_0, , , delayed_CK, delayed_SI);
endspecify
   `endif
endmodule
`endcelldefine

//%END SVN_FSDPHQ_1

//%BEGIN SVN_FSDPHQ_2

`celldefine
module SVN_FSDPHQ_2 (Q, CK, D, SI, SE, EN);
   output Q;
   input CK, D, SI, SE, EN;

   reg viol_0;
   wire delayed_CK, delayed_D, delayed_SI,
	delayed_SE, delayed_EN;

   wire int_res__D, int_res__S, int_res_iq, xcr_0;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////

`ifdef _fv
   buf (delayed_CK, CK);
   buf (delayed_D, D);
   buf (delayed_SI, SI);
   buf (delayed_SE, SE);
   buf (delayed_EN, EN);
`endif

   mux2 (int_res__D, int_res_iq, delayed_D, delayed_EN);
   mux2 (int_res__S, delayed_SI, int_res__D, delayed_SE);
   dff_err (xcr_0, delayed_CK, int_res__S);
   dff (int_res_iq, viol_0, delayed_CK, int_res__S, xcr_0);
   

   `ifdef VIRL_functiononly
       buf #`SNPS_SEQ_DELAY (Q, int_res_iq);
   `else
       buf (Q, int_res_iq);
   `endif

   `ifdef VIRL_functiononly

   `else
   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////
not U0 (_net_0, EN);
not U1 (_net_1, D);
not U2 (_net_2, SE);
and U3 (cond20, _net_0, _net_1, _net_2);
not U4 (_net_3, D);
not U5 (_net_4, SI);
and U6 (cond19, EN, _net_3, SE, _net_4);
not U7 (_net_5, D);
and U8 (cond16, EN, _net_5, SE, SI);
not U9 (_net_6, EN);
not U10 (_net_7, SI);
and U11 (cond18, SE, _net_6, _net_7);
not U12 (_net_8, EN);
and U13 (cond14, SE, _net_8, SI);
not U14 (_net_9, EN);
not U15 (_net_10, SE);
and U16 (cond15, _net_9, D, _net_10);
not U17 (_net_11, SI);
and U18 (cond17, EN, D, SE, _net_11);
and U19 (cond13, EN, D, SE, SI);
not U20 (_net_12, SE);
not U21 (_net_13, EN);
and U22 (cond0, _net_12, _net_13);
not U23 (_net_14, SE);
not U24 (_net_15, D);
and U25 (cond2, _net_14, _net_15);
not U26 (_net_16, SE);
and U27 (cond1, _net_16, D);
not U28 (_net_17, EN);
not U29 (_net_18, D);
and U30 (cond5, _net_17, _net_18, SI);
not U31 (_net_19, D);
not U32 (_net_20, SI);
and U33 (cond8, EN, _net_19, _net_20);
not U34 (_net_21, D);
and U35 (cond4, EN, _net_21, SI);
not U36 (_net_22, EN);
not U37 (_net_23, SI);
and U38 (cond7, _net_22, D, _net_23);
not U39 (_net_24, SI);
and U40 (cond6, EN, D, _net_24);
and U41 (cond3, EN, D, SI);
not U42 (_net_25, EN);
not U43 (_net_26, D);
and U44 (cond12, _net_25, _net_26, SE);
not U45 (_net_27, D);
and U46 (cond11, EN, _net_27, SE);
not U47 (_net_28, EN);
and U48 (cond10, _net_28, D, SE);
and U49 (cond9, EN, D, SE);

specify
(posedge CK => (Q : 1'b1))=(0, 0);
$width(posedge CK &&& cond20 , 0 ,0, viol_0);
$width(negedge CK &&& cond20 , 0 ,0, viol_0);
$width(posedge CK &&& cond19 , 0 ,0, viol_0);
$width(negedge CK &&& cond19 , 0 ,0, viol_0);
$width(posedge CK &&& cond16 , 0 ,0, viol_0);
$width(negedge CK &&& cond16 , 0 ,0, viol_0);
$width(posedge CK &&& cond18 , 0 ,0, viol_0);
$width(negedge CK &&& cond18 , 0 ,0, viol_0);
$width(posedge CK &&& cond14 , 0 ,0, viol_0);
$width(negedge CK &&& cond14 , 0 ,0, viol_0);
$width(posedge CK &&& cond15 , 0 ,0, viol_0);
$width(negedge CK &&& cond15 , 0 ,0, viol_0);
$width(posedge CK &&& cond17 , 0 ,0, viol_0);
$width(negedge CK &&& cond17 , 0 ,0, viol_0);
$width(posedge CK &&& cond13 , 0 ,0, viol_0);
$width(negedge CK &&& cond13 , 0 ,0, viol_0);
$setuphold(posedge CK &&& cond0 , posedge D &&& cond0 , 0 ,0, viol_0, , , delayed_CK, delayed_D);
$setuphold(posedge CK &&& cond0 , negedge D &&& cond0 , 0 ,0, viol_0, , , delayed_CK, delayed_D);
$setuphold(posedge CK &&& cond2 , posedge EN &&& cond2 , 0 ,0, viol_0, , , delayed_CK, delayed_EN);
$setuphold(posedge CK &&& cond2 , negedge EN &&& cond2 , 0 ,0, viol_0, , , delayed_CK, delayed_EN);
$setuphold(posedge CK &&& cond1 , posedge EN &&& cond1 , 0 ,0, viol_0, , , delayed_CK, delayed_EN);
$setuphold(posedge CK &&& cond1 , negedge EN &&& cond1 , 0 ,0, viol_0, , , delayed_CK, delayed_EN);
$setuphold(posedge CK &&& cond5 , posedge SE &&& cond5 , 0 ,0, viol_0, , , delayed_CK, delayed_SE);
$setuphold(posedge CK &&& cond5 , negedge SE &&& cond5 , 0 ,0, viol_0, , , delayed_CK, delayed_SE);
$setuphold(posedge CK &&& cond8 , posedge SE &&& cond8 , 0 ,0, viol_0, , , delayed_CK, delayed_SE);
$setuphold(posedge CK &&& cond8 , negedge SE &&& cond8 , 0 ,0, viol_0, , , delayed_CK, delayed_SE);
$setuphold(posedge CK &&& cond4 , posedge SE &&& cond4 , 0 ,0, viol_0, , , delayed_CK, delayed_SE);
$setuphold(posedge CK &&& cond4 , negedge SE &&& cond4 , 0 ,0, viol_0, , , delayed_CK, delayed_SE);
$setuphold(posedge CK &&& cond7 , posedge SE &&& cond7 , 0 ,0, viol_0, , , delayed_CK, delayed_SE);
$setuphold(posedge CK &&& cond7 , negedge SE &&& cond7 , 0 ,0, viol_0, , , delayed_CK, delayed_SE);
$setuphold(posedge CK &&& cond6 , posedge SE &&& cond6 , 0 ,0, viol_0, , , delayed_CK, delayed_SE);
$setuphold(posedge CK &&& cond6 , negedge SE &&& cond6 , 0 ,0, viol_0, , , delayed_CK, delayed_SE);
$setuphold(posedge CK &&& cond3 , posedge SE &&& cond3 , 0 ,0, viol_0, , , delayed_CK, delayed_SE);
$setuphold(posedge CK &&& cond3 , negedge SE &&& cond3 , 0 ,0, viol_0, , , delayed_CK, delayed_SE);
$setuphold(posedge CK &&& cond12 , posedge SI &&& cond12 , 0 ,0, viol_0, , , delayed_CK, delayed_SI);
$setuphold(posedge CK &&& cond12 , negedge SI &&& cond12 , 0 ,0, viol_0, , , delayed_CK, delayed_SI);
$setuphold(posedge CK &&& cond11 , posedge SI &&& cond11 , 0 ,0, viol_0, , , delayed_CK, delayed_SI);
$setuphold(posedge CK &&& cond11 , negedge SI &&& cond11 , 0 ,0, viol_0, , , delayed_CK, delayed_SI);
$setuphold(posedge CK &&& cond10 , posedge SI &&& cond10 , 0 ,0, viol_0, , , delayed_CK, delayed_SI);
$setuphold(posedge CK &&& cond10 , negedge SI &&& cond10 , 0 ,0, viol_0, , , delayed_CK, delayed_SI);
$setuphold(posedge CK &&& cond9 , posedge SI &&& cond9 , 0 ,0, viol_0, , , delayed_CK, delayed_SI);
$setuphold(posedge CK &&& cond9 , negedge SI &&& cond9 , 0 ,0, viol_0, , , delayed_CK, delayed_SI);
endspecify
   `endif
endmodule
`endcelldefine

//%END SVN_FSDPHQ_2

//%BEGIN SVN_FSDPHQ_4

`celldefine
module SVN_FSDPHQ_4 (Q, CK, D, SI, SE, EN);
   output Q;
   input CK, D, SI, SE, EN;

   reg viol_0;
   wire delayed_CK, delayed_D, delayed_SI,
	delayed_SE, delayed_EN;

   wire int_res__D, int_res__S, int_res_iq, xcr_0;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////

`ifdef _fv
   buf (delayed_CK, CK);
   buf (delayed_D, D);
   buf (delayed_SI, SI);
   buf (delayed_SE, SE);
   buf (delayed_EN, EN);
`endif

   mux2 (int_res__D, int_res_iq, delayed_D, delayed_EN);
   mux2 (int_res__S, delayed_SI, int_res__D, delayed_SE);
   dff_err (xcr_0, delayed_CK, int_res__S);
   dff (int_res_iq, viol_0, delayed_CK, int_res__S, xcr_0);
   

   `ifdef VIRL_functiononly
       buf #`SNPS_SEQ_DELAY (Q, int_res_iq);
   `else
       buf (Q, int_res_iq);
   `endif

   `ifdef VIRL_functiononly

   `else
   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////
not U0 (_net_0, EN);
not U1 (_net_1, D);
not U2 (_net_2, SE);
and U3 (cond20, _net_0, _net_1, _net_2);
not U4 (_net_3, D);
not U5 (_net_4, SI);
and U6 (cond19, EN, _net_3, SE, _net_4);
not U7 (_net_5, D);
and U8 (cond16, EN, _net_5, SE, SI);
not U9 (_net_6, EN);
not U10 (_net_7, SI);
and U11 (cond18, SE, _net_6, _net_7);
not U12 (_net_8, EN);
and U13 (cond14, SE, _net_8, SI);
not U14 (_net_9, EN);
not U15 (_net_10, SE);
and U16 (cond15, _net_9, D, _net_10);
not U17 (_net_11, SI);
and U18 (cond17, EN, D, SE, _net_11);
and U19 (cond13, EN, D, SE, SI);
not U20 (_net_12, SE);
not U21 (_net_13, EN);
and U22 (cond0, _net_12, _net_13);
not U23 (_net_14, SE);
not U24 (_net_15, D);
and U25 (cond2, _net_14, _net_15);
not U26 (_net_16, SE);
and U27 (cond1, _net_16, D);
not U28 (_net_17, EN);
not U29 (_net_18, D);
and U30 (cond5, _net_17, _net_18, SI);
not U31 (_net_19, D);
not U32 (_net_20, SI);
and U33 (cond8, EN, _net_19, _net_20);
not U34 (_net_21, D);
and U35 (cond4, EN, _net_21, SI);
not U36 (_net_22, EN);
not U37 (_net_23, SI);
and U38 (cond7, _net_22, D, _net_23);
not U39 (_net_24, SI);
and U40 (cond6, EN, D, _net_24);
and U41 (cond3, EN, D, SI);
not U42 (_net_25, EN);
not U43 (_net_26, D);
and U44 (cond12, _net_25, _net_26, SE);
not U45 (_net_27, D);
and U46 (cond11, EN, _net_27, SE);
not U47 (_net_28, EN);
and U48 (cond10, _net_28, D, SE);
and U49 (cond9, EN, D, SE);

specify
(posedge CK => (Q : 1'b1))=(0, 0);
$width(posedge CK &&& cond20 , 0 ,0, viol_0);
$width(negedge CK &&& cond20 , 0 ,0, viol_0);
$width(posedge CK &&& cond19 , 0 ,0, viol_0);
$width(negedge CK &&& cond19 , 0 ,0, viol_0);
$width(posedge CK &&& cond16 , 0 ,0, viol_0);
$width(negedge CK &&& cond16 , 0 ,0, viol_0);
$width(posedge CK &&& cond18 , 0 ,0, viol_0);
$width(negedge CK &&& cond18 , 0 ,0, viol_0);
$width(posedge CK &&& cond14 , 0 ,0, viol_0);
$width(negedge CK &&& cond14 , 0 ,0, viol_0);
$width(posedge CK &&& cond15 , 0 ,0, viol_0);
$width(negedge CK &&& cond15 , 0 ,0, viol_0);
$width(posedge CK &&& cond17 , 0 ,0, viol_0);
$width(negedge CK &&& cond17 , 0 ,0, viol_0);
$width(posedge CK &&& cond13 , 0 ,0, viol_0);
$width(negedge CK &&& cond13 , 0 ,0, viol_0);
$setuphold(posedge CK &&& cond0 , posedge D &&& cond0 , 0 ,0, viol_0, , , delayed_CK, delayed_D);
$setuphold(posedge CK &&& cond0 , negedge D &&& cond0 , 0 ,0, viol_0, , , delayed_CK, delayed_D);
$setuphold(posedge CK &&& cond2 , posedge EN &&& cond2 , 0 ,0, viol_0, , , delayed_CK, delayed_EN);
$setuphold(posedge CK &&& cond2 , negedge EN &&& cond2 , 0 ,0, viol_0, , , delayed_CK, delayed_EN);
$setuphold(posedge CK &&& cond1 , posedge EN &&& cond1 , 0 ,0, viol_0, , , delayed_CK, delayed_EN);
$setuphold(posedge CK &&& cond1 , negedge EN &&& cond1 , 0 ,0, viol_0, , , delayed_CK, delayed_EN);
$setuphold(posedge CK &&& cond5 , posedge SE &&& cond5 , 0 ,0, viol_0, , , delayed_CK, delayed_SE);
$setuphold(posedge CK &&& cond5 , negedge SE &&& cond5 , 0 ,0, viol_0, , , delayed_CK, delayed_SE);
$setuphold(posedge CK &&& cond8 , posedge SE &&& cond8 , 0 ,0, viol_0, , , delayed_CK, delayed_SE);
$setuphold(posedge CK &&& cond8 , negedge SE &&& cond8 , 0 ,0, viol_0, , , delayed_CK, delayed_SE);
$setuphold(posedge CK &&& cond4 , posedge SE &&& cond4 , 0 ,0, viol_0, , , delayed_CK, delayed_SE);
$setuphold(posedge CK &&& cond4 , negedge SE &&& cond4 , 0 ,0, viol_0, , , delayed_CK, delayed_SE);
$setuphold(posedge CK &&& cond7 , posedge SE &&& cond7 , 0 ,0, viol_0, , , delayed_CK, delayed_SE);
$setuphold(posedge CK &&& cond7 , negedge SE &&& cond7 , 0 ,0, viol_0, , , delayed_CK, delayed_SE);
$setuphold(posedge CK &&& cond6 , posedge SE &&& cond6 , 0 ,0, viol_0, , , delayed_CK, delayed_SE);
$setuphold(posedge CK &&& cond6 , negedge SE &&& cond6 , 0 ,0, viol_0, , , delayed_CK, delayed_SE);
$setuphold(posedge CK &&& cond3 , posedge SE &&& cond3 , 0 ,0, viol_0, , , delayed_CK, delayed_SE);
$setuphold(posedge CK &&& cond3 , negedge SE &&& cond3 , 0 ,0, viol_0, , , delayed_CK, delayed_SE);
$setuphold(posedge CK &&& cond12 , posedge SI &&& cond12 , 0 ,0, viol_0, , , delayed_CK, delayed_SI);
$setuphold(posedge CK &&& cond12 , negedge SI &&& cond12 , 0 ,0, viol_0, , , delayed_CK, delayed_SI);
$setuphold(posedge CK &&& cond11 , posedge SI &&& cond11 , 0 ,0, viol_0, , , delayed_CK, delayed_SI);
$setuphold(posedge CK &&& cond11 , negedge SI &&& cond11 , 0 ,0, viol_0, , , delayed_CK, delayed_SI);
$setuphold(posedge CK &&& cond10 , posedge SI &&& cond10 , 0 ,0, viol_0, , , delayed_CK, delayed_SI);
$setuphold(posedge CK &&& cond10 , negedge SI &&& cond10 , 0 ,0, viol_0, , , delayed_CK, delayed_SI);
$setuphold(posedge CK &&& cond9 , posedge SI &&& cond9 , 0 ,0, viol_0, , , delayed_CK, delayed_SI);
$setuphold(posedge CK &&& cond9 , negedge SI &&& cond9 , 0 ,0, viol_0, , , delayed_CK, delayed_SI);
endspecify
   `endif
endmodule
`endcelldefine

//%END SVN_FSDPHQ_4

//%BEGIN SVN_FSDPHRBQ_0P5

`celldefine
module SVN_FSDPHRBQ_0P5 (Q, CK, D, SI, SE, EN, RD);
   output Q;
   input CK, D, SI, SE, EN, RD;

   reg viol_0;
   wire delayed_CK, delayed_D, delayed_SI,
	delayed_SE, delayed_EN, delayed_RD;

   wire int_res__D, int_res__S, int_res__RD, int_res_iq, xcr_0;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////

`ifdef _fv
   buf (delayed_CK, CK);
   buf (delayed_D, D);
   buf (delayed_SI, SI);
   buf (delayed_SE, SE);
   buf (delayed_EN, EN);
`endif
   buf (delayed_RD, RD);

   mux2 (int_res__D, int_res_iq, delayed_D, delayed_EN);
   mux2 (int_res__S, delayed_SI, int_res__D, delayed_SE);
   not (int_res__RD, delayed_RD);
   dff_r_err (xcr_0, delayed_CK, int_res__S, int_res__RD);
   dff_r (int_res_iq, viol_0, delayed_CK, int_res__S, int_res__RD, xcr_0);

   `ifdef VIRL_functiononly
      buf #`SNPS_SEQ_DELAY (Q, int_res_iq);
   `else
      buf (Q, int_res_iq);
   `endif

   `ifdef VIRL_functiononly

   `else

   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////

not U0 (_net_0, EN);
not U1 (_net_1, D);
not U2 (_net_2, SE);
and U3 (cond40, _net_0, _net_1, RD, _net_2);
not U4 (_net_3, D);
not U5 (_net_4, SI);
and U6 (cond39, EN, _net_3, RD, SE, _net_4);
not U7 (_net_5, D);
and U8 (cond36, EN, _net_5, RD, SE, SI);
not U9 (_net_6, EN);
not U10 (_net_7, SI);
and U11 (cond38, RD, _net_6, SE, _net_7);
not U12 (_net_8, EN);
and U13 (cond34, RD, _net_8, SE, SI);
not U14 (_net_9, EN);
not U15 (_net_10, SE);
and U16 (cond35, _net_9, D, RD, _net_10);
not U17 (_net_11, SI);
and U18 (cond37, EN, D, RD, SE, _net_11);
and U19 (cond33, EN, D, RD, SE, SI);
not U20 (_net_12, EN);
not U21 (_net_13, SE);
and U22 (cond0, RD, _net_12, _net_13);
not U23 (_net_14, D);
not U24 (_net_15, SE);
and U25 (cond2, RD, _net_14, _net_15);
not U26 (_net_16, SE);
and U27 (cond1, RD, D, _net_16);
not U28 (_net_17, D);
not U29 (_net_18, CK);
not U30 (_net_19, EN);
not U31 (_net_20, SE);
and U32 (cond32, _net_17, _net_18, _net_19, _net_20);
not U33 (_net_21, D);
not U34 (_net_22, CK);
not U35 (_net_23, SE);
and U36 (cond31, _net_21, _net_22, EN, _net_23);
not U37 (_net_24, D);
not U38 (_net_25, CK);
not U39 (_net_26, SI);
and U40 (cond30, _net_24, _net_25, EN, SE, _net_26);
not U41 (_net_27, D);
not U42 (_net_28, CK);
and U43 (cond29, _net_27, _net_28, EN, SE, SI);
not U44 (_net_29, EN);
not U45 (_net_30, CK);
not U46 (_net_31, SI);
and U47 (cond27, _net_29, _net_30, SE, _net_31);
not U48 (_net_32, EN);
not U49 (_net_33, CK);
and U50 (cond26, _net_32, _net_33, SE, SI);
not U51 (_net_34, CK);
not U52 (_net_35, EN);
not U53 (_net_36, SE);
and U54 (cond28, D, _net_34, _net_35, _net_36);
not U55 (_net_37, CK);
not U56 (_net_38, SE);
and U57 (cond25, D, _net_37, EN, _net_38);
not U58 (_net_39, CK);
not U59 (_net_40, SI);
and U60 (cond24, D, _net_39, EN, SE, _net_40);
not U61 (_net_41, CK);
and U62 (cond23, D, _net_41, EN, SE, SI);
not U63 (_net_42, D);
and U64 (cond16, EN, _net_42, SE, SI);
not U65 (_net_43, EN);
and U66 (cond14, SE, _net_43, SI);
not U67 (_net_44, D);
not U68 (_net_45, SE);
and U69 (cond22, _net_44, CK, EN, _net_45);
not U70 (_net_46, D);
and U71 (cond21, _net_46, CK, EN, SE);
not U72 (_net_47, EN);
not U73 (_net_48, SE);
and U74 (cond20, _net_47, CK, _net_48);
not U75 (_net_49, EN);
and U76 (cond19, _net_49, CK, SE);
not U77 (_net_50, SE);
and U78 (cond18, D, CK, EN, _net_50);
and U79 (cond17, D, CK, EN, SE);
not U80 (_net_51, EN);
not U81 (_net_52, SE);
and U82 (cond15, _net_51, D, _net_52);
and U83 (cond13, EN, D, SE, SI);
not U84 (_net_53, EN);
not U85 (_net_54, D);
and U86 (cond5, _net_53, _net_54, RD, SI);
not U87 (_net_55, D);
not U88 (_net_56, SI);
and U89 (cond8, EN, _net_55, RD, _net_56);
not U90 (_net_57, D);
and U91 (cond4, EN, _net_57, RD, SI);
not U92 (_net_58, EN);
not U93 (_net_59, SI);
and U94 (cond7, _net_58, D, RD, _net_59);
not U95 (_net_60, SI);
and U96 (cond6, EN, D, RD, _net_60);
and U97 (cond3, EN, D, RD, SI);
not U98 (_net_61, EN);
not U99 (_net_62, D);
and U100 (cond12, _net_61, _net_62, RD, SE);
not U101 (_net_63, D);
and U102 (cond11, EN, _net_63, RD, SE);
not U103 (_net_64, EN);
and U104 (cond10, _net_64, D, RD, SE);
and U105 (cond9, EN, D, RD, SE);

specify
if ((~(CK) & ~(D) & ~(EN) & ~(SE))) (negedge RD => (Q +: 1'b0))=(0, 0);
if ((~(CK) & ~(D) & EN & ~(SE))) (negedge RD => (Q +: 1'b0))=(0, 0);
if ((~(CK) & ~(D) & EN & SE & ~(SI))) (negedge RD => (Q +: 1'b0))=(0, 0);
if ((~(CK) & ~(D) & EN & SE & SI)) (negedge RD => (Q +: 1'b0))=(0, 0);
if ((~(CK) & ~(EN) & SE & ~(SI))) (negedge RD => (Q +: 1'b0))=(0, 0);
if ((~(CK) & ~(EN) & SE & SI)) (negedge RD => (Q +: 1'b0))=(0, 0);
if ((~(CK) & D & ~(EN) & ~(SE))) (negedge RD => (Q +: 1'b0))=(0, 0);
if ((~(CK) & D & EN & ~(SE))) (negedge RD => (Q +: 1'b0))=(0, 0);
if ((~(CK) & D & EN & SE & ~(SI))) (negedge RD => (Q +: 1'b0))=(0, 0);
if ((~(CK) & D & EN & SE & SI)) (negedge RD => (Q +: 1'b0))=(0, 0);
if ((CK & ~(D) & EN & ~(SE))) (negedge RD => (Q +: 1'b0))=(0, 0);
if ((CK & ~(D) & EN & SE)) (negedge RD => (Q +: 1'b0))=(0, 0);
if ((CK & ~(EN) & ~(SE))) (negedge RD => (Q +: 1'b0))=(0, 0);
if ((CK & ~(EN) & SE)) (negedge RD => (Q +: 1'b0))=(0, 0);
if ((CK & D & EN & ~(SE))) (negedge RD => (Q +: 1'b0))=(0, 0);
if ((CK & D & EN & SE)) (negedge RD => (Q +: 1'b0))=(0, 0);
(negedge RD => (Q:1'b0))=(0, 0);
(posedge CK => (Q : 1'b1))=(0, 0);
$width(posedge CK &&& cond40 , 0 ,0, viol_0);
$width(negedge CK &&& cond40 , 0 ,0, viol_0);
$width(posedge CK &&& cond39 , 0 ,0, viol_0);
$width(negedge CK &&& cond39 , 0 ,0, viol_0);
$width(posedge CK &&& cond36 , 0 ,0, viol_0);
$width(negedge CK &&& cond36 , 0 ,0, viol_0);
$width(posedge CK &&& cond38 , 0 ,0, viol_0);
$width(negedge CK &&& cond38 , 0 ,0, viol_0);
$width(posedge CK &&& cond34 , 0 ,0, viol_0);
$width(negedge CK &&& cond34 , 0 ,0, viol_0);
$width(posedge CK &&& cond35 , 0 ,0, viol_0);
$width(negedge CK &&& cond35 , 0 ,0, viol_0);
$width(posedge CK &&& cond37 , 0 ,0, viol_0);
$width(negedge CK &&& cond37 , 0 ,0, viol_0);
$width(posedge CK &&& cond33 , 0 ,0, viol_0);
$width(negedge CK &&& cond33 , 0 ,0, viol_0);
$setuphold(posedge CK &&& cond0 , posedge D &&& cond0 , 0 ,0, viol_0, , , delayed_CK, delayed_D);
$setuphold(posedge CK &&& cond0 , negedge D &&& cond0 , 0 ,0, viol_0, , , delayed_CK, delayed_D);
$setuphold(posedge CK &&& cond2 , posedge EN &&& cond2 , 0 ,0, viol_0, , , delayed_CK, delayed_EN);
$setuphold(posedge CK &&& cond2 , negedge EN &&& cond2 , 0 ,0, viol_0, , , delayed_CK, delayed_EN);
$setuphold(posedge CK &&& cond1 , posedge EN &&& cond1 , 0 ,0, viol_0, , , delayed_CK, delayed_EN);
$setuphold(posedge CK &&& cond1 , negedge EN &&& cond1 , 0 ,0, viol_0, , , delayed_CK, delayed_EN);
$width(negedge RD &&& cond32 , 0 ,0, viol_0);
$width(negedge RD &&& cond31 , 0 ,0, viol_0);
$width(negedge RD &&& cond30 , 0 ,0, viol_0);
$width(negedge RD &&& cond29 , 0 ,0, viol_0);
$width(negedge RD &&& cond27 , 0 ,0, viol_0);
$width(negedge RD &&& cond26 , 0 ,0, viol_0);
$width(negedge RD &&& cond28 , 0 ,0, viol_0);
$width(negedge RD &&& cond25 , 0 ,0, viol_0);
$width(negedge RD &&& cond24 , 0 ,0, viol_0);
$width(negedge RD &&& cond23 , 0 ,0, viol_0);
$recovery(posedge RD &&& cond16 , posedge CK &&& cond16 , 0 , viol_0);
$hold(posedge CK &&& cond16 , posedge RD &&& cond16 , 0 , viol_0);
$recovery(posedge RD &&& cond14 , posedge CK &&& cond14 , 0 , viol_0);
$hold(posedge CK &&& cond14 , posedge RD &&& cond14 , 0 , viol_0);
$width(negedge RD &&& cond22 , 0 ,0, viol_0);
$width(negedge RD &&& cond21 , 0 ,0, viol_0);
$width(negedge RD &&& cond20 , 0 ,0, viol_0);
$width(negedge RD &&& cond19 , 0 ,0, viol_0);
$width(negedge RD &&& cond18 , 0 ,0, viol_0);
$width(negedge RD &&& cond17 , 0 ,0, viol_0);
$recovery(posedge RD &&& cond15 , posedge CK &&& cond15 , 0 , viol_0);
$hold(posedge CK &&& cond15 , posedge RD &&& cond15 , 0 , viol_0);
$recovery(posedge RD &&& cond13 , posedge CK &&& cond13 , 0 , viol_0);
$hold(posedge CK &&& cond13 , posedge RD &&& cond13 , 0 , viol_0);
$setuphold(posedge CK &&& cond5 , posedge SE &&& cond5 , 0 ,0, viol_0, , , delayed_CK, delayed_SE);
$setuphold(posedge CK &&& cond5 , negedge SE &&& cond5 , 0 ,0, viol_0, , , delayed_CK, delayed_SE);
$setuphold(posedge CK &&& cond8 , posedge SE &&& cond8 , 0 ,0, viol_0, , , delayed_CK, delayed_SE);
$setuphold(posedge CK &&& cond8 , negedge SE &&& cond8 , 0 ,0, viol_0, , , delayed_CK, delayed_SE);
$setuphold(posedge CK &&& cond4 , posedge SE &&& cond4 , 0 ,0, viol_0, , , delayed_CK, delayed_SE);
$setuphold(posedge CK &&& cond4 , negedge SE &&& cond4 , 0 ,0, viol_0, , , delayed_CK, delayed_SE);
$setuphold(posedge CK &&& cond7 , posedge SE &&& cond7 , 0 ,0, viol_0, , , delayed_CK, delayed_SE);
$setuphold(posedge CK &&& cond7 , negedge SE &&& cond7 , 0 ,0, viol_0, , , delayed_CK, delayed_SE);
$setuphold(posedge CK &&& cond6 , posedge SE &&& cond6 , 0 ,0, viol_0, , , delayed_CK, delayed_SE);
$setuphold(posedge CK &&& cond6 , negedge SE &&& cond6 , 0 ,0, viol_0, , , delayed_CK, delayed_SE);
$setuphold(posedge CK &&& cond3 , posedge SE &&& cond3 , 0 ,0, viol_0, , , delayed_CK, delayed_SE);
$setuphold(posedge CK &&& cond3 , negedge SE &&& cond3 , 0 ,0, viol_0, , , delayed_CK, delayed_SE);
$setuphold(posedge CK &&& cond12 , posedge SI &&& cond12 , 0 ,0, viol_0, , , delayed_CK, delayed_SI);
$setuphold(posedge CK &&& cond12 , negedge SI &&& cond12 , 0 ,0, viol_0, , , delayed_CK, delayed_SI);
$setuphold(posedge CK &&& cond11 , posedge SI &&& cond11 , 0 ,0, viol_0, , , delayed_CK, delayed_SI);
$setuphold(posedge CK &&& cond11 , negedge SI &&& cond11 , 0 ,0, viol_0, , , delayed_CK, delayed_SI);
$setuphold(posedge CK &&& cond10 , posedge SI &&& cond10 , 0 ,0, viol_0, , , delayed_CK, delayed_SI);
$setuphold(posedge CK &&& cond10 , negedge SI &&& cond10 , 0 ,0, viol_0, , , delayed_CK, delayed_SI);
$setuphold(posedge CK &&& cond9 , posedge SI &&& cond9 , 0 ,0, viol_0, , , delayed_CK, delayed_SI);
$setuphold(posedge CK &&& cond9 , negedge SI &&& cond9 , 0 ,0, viol_0, , , delayed_CK, delayed_SI);
endspecify
   `endif
endmodule
`endcelldefine

//%END SVN_FSDPHRBQ_0P5

//%BEGIN SVN_FSDPHRBQ_1

`celldefine
module SVN_FSDPHRBQ_1 (Q, CK, D, SI, SE, EN, RD);
   output Q;
   input CK, D, SI, SE, EN, RD;

   reg viol_0;
   wire delayed_CK, delayed_D, delayed_SI,
	delayed_SE, delayed_EN, delayed_RD;

   wire int_res__D, int_res__S, int_res__RD, int_res_iq, xcr_0;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////

`ifdef _fv
   buf (delayed_CK, CK);
   buf (delayed_D, D);
   buf (delayed_SI, SI);
   buf (delayed_SE, SE);
   buf (delayed_EN, EN);
`endif
   buf (delayed_RD, RD);

   mux2 (int_res__D, int_res_iq, delayed_D, delayed_EN);
   mux2 (int_res__S, delayed_SI, int_res__D, delayed_SE);
   not (int_res__RD, delayed_RD);
   dff_r_err (xcr_0, delayed_CK, int_res__S, int_res__RD);
   dff_r (int_res_iq, viol_0, delayed_CK, int_res__S, int_res__RD, xcr_0);

   `ifdef VIRL_functiononly
      buf #`SNPS_SEQ_DELAY (Q, int_res_iq);
   `else
      buf (Q, int_res_iq);
   `endif

   `ifdef VIRL_functiononly

   `else

   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////

not U0 (_net_0, EN);
not U1 (_net_1, D);
not U2 (_net_2, SE);
and U3 (cond40, _net_0, _net_1, RD, _net_2);
not U4 (_net_3, D);
not U5 (_net_4, SI);
and U6 (cond39, EN, _net_3, RD, SE, _net_4);
not U7 (_net_5, D);
and U8 (cond36, EN, _net_5, RD, SE, SI);
not U9 (_net_6, EN);
not U10 (_net_7, SI);
and U11 (cond38, RD, _net_6, SE, _net_7);
not U12 (_net_8, EN);
and U13 (cond34, RD, _net_8, SE, SI);
not U14 (_net_9, EN);
not U15 (_net_10, SE);
and U16 (cond35, _net_9, D, RD, _net_10);
not U17 (_net_11, SI);
and U18 (cond37, EN, D, RD, SE, _net_11);
and U19 (cond33, EN, D, RD, SE, SI);
not U20 (_net_12, EN);
not U21 (_net_13, SE);
and U22 (cond0, RD, _net_12, _net_13);
not U23 (_net_14, D);
not U24 (_net_15, SE);
and U25 (cond2, RD, _net_14, _net_15);
not U26 (_net_16, SE);
and U27 (cond1, RD, D, _net_16);
not U28 (_net_17, D);
not U29 (_net_18, CK);
not U30 (_net_19, EN);
not U31 (_net_20, SE);
and U32 (cond32, _net_17, _net_18, _net_19, _net_20);
not U33 (_net_21, D);
not U34 (_net_22, CK);
not U35 (_net_23, SE);
and U36 (cond31, _net_21, _net_22, EN, _net_23);
not U37 (_net_24, D);
not U38 (_net_25, CK);
not U39 (_net_26, SI);
and U40 (cond30, _net_24, _net_25, EN, SE, _net_26);
not U41 (_net_27, D);
not U42 (_net_28, CK);
and U43 (cond29, _net_27, _net_28, EN, SE, SI);
not U44 (_net_29, EN);
not U45 (_net_30, CK);
not U46 (_net_31, SI);
and U47 (cond27, _net_29, _net_30, SE, _net_31);
not U48 (_net_32, EN);
not U49 (_net_33, CK);
and U50 (cond26, _net_32, _net_33, SE, SI);
not U51 (_net_34, CK);
not U52 (_net_35, EN);
not U53 (_net_36, SE);
and U54 (cond28, D, _net_34, _net_35, _net_36);
not U55 (_net_37, CK);
not U56 (_net_38, SE);
and U57 (cond25, D, _net_37, EN, _net_38);
not U58 (_net_39, CK);
not U59 (_net_40, SI);
and U60 (cond24, D, _net_39, EN, SE, _net_40);
not U61 (_net_41, CK);
and U62 (cond23, D, _net_41, EN, SE, SI);
not U63 (_net_42, D);
and U64 (cond16, EN, _net_42, SE, SI);
not U65 (_net_43, EN);
and U66 (cond14, SE, _net_43, SI);
not U67 (_net_44, D);
not U68 (_net_45, SE);
and U69 (cond22, _net_44, CK, EN, _net_45);
not U70 (_net_46, D);
and U71 (cond21, _net_46, CK, EN, SE);
not U72 (_net_47, EN);
not U73 (_net_48, SE);
and U74 (cond20, _net_47, CK, _net_48);
not U75 (_net_49, EN);
and U76 (cond19, _net_49, CK, SE);
not U77 (_net_50, SE);
and U78 (cond18, D, CK, EN, _net_50);
and U79 (cond17, D, CK, EN, SE);
not U80 (_net_51, EN);
not U81 (_net_52, SE);
and U82 (cond15, _net_51, D, _net_52);
and U83 (cond13, EN, D, SE, SI);
not U84 (_net_53, EN);
not U85 (_net_54, D);
and U86 (cond5, _net_53, _net_54, RD, SI);
not U87 (_net_55, D);
not U88 (_net_56, SI);
and U89 (cond8, EN, _net_55, RD, _net_56);
not U90 (_net_57, D);
and U91 (cond4, EN, _net_57, RD, SI);
not U92 (_net_58, EN);
not U93 (_net_59, SI);
and U94 (cond7, _net_58, D, RD, _net_59);
not U95 (_net_60, SI);
and U96 (cond6, EN, D, RD, _net_60);
and U97 (cond3, EN, D, RD, SI);
not U98 (_net_61, EN);
not U99 (_net_62, D);
and U100 (cond12, _net_61, _net_62, RD, SE);
not U101 (_net_63, D);
and U102 (cond11, EN, _net_63, RD, SE);
not U103 (_net_64, EN);
and U104 (cond10, _net_64, D, RD, SE);
and U105 (cond9, EN, D, RD, SE);

specify
if ((~(CK) & ~(D) & ~(EN) & ~(SE))) (negedge RD => (Q +: 1'b0))=(0, 0);
if ((~(CK) & ~(D) & EN & ~(SE))) (negedge RD => (Q +: 1'b0))=(0, 0);
if ((~(CK) & ~(D) & EN & SE & ~(SI))) (negedge RD => (Q +: 1'b0))=(0, 0);
if ((~(CK) & ~(D) & EN & SE & SI)) (negedge RD => (Q +: 1'b0))=(0, 0);
if ((~(CK) & ~(EN) & SE & ~(SI))) (negedge RD => (Q +: 1'b0))=(0, 0);
if ((~(CK) & ~(EN) & SE & SI)) (negedge RD => (Q +: 1'b0))=(0, 0);
if ((~(CK) & D & ~(EN) & ~(SE))) (negedge RD => (Q +: 1'b0))=(0, 0);
if ((~(CK) & D & EN & ~(SE))) (negedge RD => (Q +: 1'b0))=(0, 0);
if ((~(CK) & D & EN & SE & ~(SI))) (negedge RD => (Q +: 1'b0))=(0, 0);
if ((~(CK) & D & EN & SE & SI)) (negedge RD => (Q +: 1'b0))=(0, 0);
if ((CK & ~(D) & EN & ~(SE))) (negedge RD => (Q +: 1'b0))=(0, 0);
if ((CK & ~(D) & EN & SE)) (negedge RD => (Q +: 1'b0))=(0, 0);
if ((CK & ~(EN) & ~(SE))) (negedge RD => (Q +: 1'b0))=(0, 0);
if ((CK & ~(EN) & SE)) (negedge RD => (Q +: 1'b0))=(0, 0);
if ((CK & D & EN & ~(SE))) (negedge RD => (Q +: 1'b0))=(0, 0);
if ((CK & D & EN & SE)) (negedge RD => (Q +: 1'b0))=(0, 0);
(negedge RD => (Q:1'b0))=(0, 0);
(posedge CK => (Q : 1'b1))=(0, 0);
$width(posedge CK &&& cond40 , 0 ,0, viol_0);
$width(negedge CK &&& cond40 , 0 ,0, viol_0);
$width(posedge CK &&& cond39 , 0 ,0, viol_0);
$width(negedge CK &&& cond39 , 0 ,0, viol_0);
$width(posedge CK &&& cond36 , 0 ,0, viol_0);
$width(negedge CK &&& cond36 , 0 ,0, viol_0);
$width(posedge CK &&& cond38 , 0 ,0, viol_0);
$width(negedge CK &&& cond38 , 0 ,0, viol_0);
$width(posedge CK &&& cond34 , 0 ,0, viol_0);
$width(negedge CK &&& cond34 , 0 ,0, viol_0);
$width(posedge CK &&& cond35 , 0 ,0, viol_0);
$width(negedge CK &&& cond35 , 0 ,0, viol_0);
$width(posedge CK &&& cond37 , 0 ,0, viol_0);
$width(negedge CK &&& cond37 , 0 ,0, viol_0);
$width(posedge CK &&& cond33 , 0 ,0, viol_0);
$width(negedge CK &&& cond33 , 0 ,0, viol_0);
$setuphold(posedge CK &&& cond0 , posedge D &&& cond0 , 0 ,0, viol_0, , , delayed_CK, delayed_D);
$setuphold(posedge CK &&& cond0 , negedge D &&& cond0 , 0 ,0, viol_0, , , delayed_CK, delayed_D);
$setuphold(posedge CK &&& cond2 , posedge EN &&& cond2 , 0 ,0, viol_0, , , delayed_CK, delayed_EN);
$setuphold(posedge CK &&& cond2 , negedge EN &&& cond2 , 0 ,0, viol_0, , , delayed_CK, delayed_EN);
$setuphold(posedge CK &&& cond1 , posedge EN &&& cond1 , 0 ,0, viol_0, , , delayed_CK, delayed_EN);
$setuphold(posedge CK &&& cond1 , negedge EN &&& cond1 , 0 ,0, viol_0, , , delayed_CK, delayed_EN);
$width(negedge RD &&& cond32 , 0 ,0, viol_0);
$width(negedge RD &&& cond31 , 0 ,0, viol_0);
$width(negedge RD &&& cond30 , 0 ,0, viol_0);
$width(negedge RD &&& cond29 , 0 ,0, viol_0);
$width(negedge RD &&& cond27 , 0 ,0, viol_0);
$width(negedge RD &&& cond26 , 0 ,0, viol_0);
$width(negedge RD &&& cond28 , 0 ,0, viol_0);
$width(negedge RD &&& cond25 , 0 ,0, viol_0);
$width(negedge RD &&& cond24 , 0 ,0, viol_0);
$width(negedge RD &&& cond23 , 0 ,0, viol_0);
$recovery(posedge RD &&& cond16 , posedge CK &&& cond16 , 0 , viol_0);
$hold(posedge CK &&& cond16 , posedge RD &&& cond16 , 0 , viol_0);
$recovery(posedge RD &&& cond14 , posedge CK &&& cond14 , 0 , viol_0);
$hold(posedge CK &&& cond14 , posedge RD &&& cond14 , 0 , viol_0);
$width(negedge RD &&& cond22 , 0 ,0, viol_0);
$width(negedge RD &&& cond21 , 0 ,0, viol_0);
$width(negedge RD &&& cond20 , 0 ,0, viol_0);
$width(negedge RD &&& cond19 , 0 ,0, viol_0);
$width(negedge RD &&& cond18 , 0 ,0, viol_0);
$width(negedge RD &&& cond17 , 0 ,0, viol_0);
$recovery(posedge RD &&& cond15 , posedge CK &&& cond15 , 0 , viol_0);
$hold(posedge CK &&& cond15 , posedge RD &&& cond15 , 0 , viol_0);
$recovery(posedge RD &&& cond13 , posedge CK &&& cond13 , 0 , viol_0);
$hold(posedge CK &&& cond13 , posedge RD &&& cond13 , 0 , viol_0);
$setuphold(posedge CK &&& cond5 , posedge SE &&& cond5 , 0 ,0, viol_0, , , delayed_CK, delayed_SE);
$setuphold(posedge CK &&& cond5 , negedge SE &&& cond5 , 0 ,0, viol_0, , , delayed_CK, delayed_SE);
$setuphold(posedge CK &&& cond8 , posedge SE &&& cond8 , 0 ,0, viol_0, , , delayed_CK, delayed_SE);
$setuphold(posedge CK &&& cond8 , negedge SE &&& cond8 , 0 ,0, viol_0, , , delayed_CK, delayed_SE);
$setuphold(posedge CK &&& cond4 , posedge SE &&& cond4 , 0 ,0, viol_0, , , delayed_CK, delayed_SE);
$setuphold(posedge CK &&& cond4 , negedge SE &&& cond4 , 0 ,0, viol_0, , , delayed_CK, delayed_SE);
$setuphold(posedge CK &&& cond7 , posedge SE &&& cond7 , 0 ,0, viol_0, , , delayed_CK, delayed_SE);
$setuphold(posedge CK &&& cond7 , negedge SE &&& cond7 , 0 ,0, viol_0, , , delayed_CK, delayed_SE);
$setuphold(posedge CK &&& cond6 , posedge SE &&& cond6 , 0 ,0, viol_0, , , delayed_CK, delayed_SE);
$setuphold(posedge CK &&& cond6 , negedge SE &&& cond6 , 0 ,0, viol_0, , , delayed_CK, delayed_SE);
$setuphold(posedge CK &&& cond3 , posedge SE &&& cond3 , 0 ,0, viol_0, , , delayed_CK, delayed_SE);
$setuphold(posedge CK &&& cond3 , negedge SE &&& cond3 , 0 ,0, viol_0, , , delayed_CK, delayed_SE);
$setuphold(posedge CK &&& cond12 , posedge SI &&& cond12 , 0 ,0, viol_0, , , delayed_CK, delayed_SI);
$setuphold(posedge CK &&& cond12 , negedge SI &&& cond12 , 0 ,0, viol_0, , , delayed_CK, delayed_SI);
$setuphold(posedge CK &&& cond11 , posedge SI &&& cond11 , 0 ,0, viol_0, , , delayed_CK, delayed_SI);
$setuphold(posedge CK &&& cond11 , negedge SI &&& cond11 , 0 ,0, viol_0, , , delayed_CK, delayed_SI);
$setuphold(posedge CK &&& cond10 , posedge SI &&& cond10 , 0 ,0, viol_0, , , delayed_CK, delayed_SI);
$setuphold(posedge CK &&& cond10 , negedge SI &&& cond10 , 0 ,0, viol_0, , , delayed_CK, delayed_SI);
$setuphold(posedge CK &&& cond9 , posedge SI &&& cond9 , 0 ,0, viol_0, , , delayed_CK, delayed_SI);
$setuphold(posedge CK &&& cond9 , negedge SI &&& cond9 , 0 ,0, viol_0, , , delayed_CK, delayed_SI);
endspecify
   `endif
endmodule
`endcelldefine

//%END SVN_FSDPHRBQ_1

//%BEGIN SVN_FSDPHRBQ_2

`celldefine
module SVN_FSDPHRBQ_2 (Q, CK, D, SI, SE, EN, RD);
   output Q;
   input CK, D, SI, SE, EN, RD;

   reg viol_0;
   wire delayed_CK, delayed_D, delayed_SI,
	delayed_SE, delayed_EN, delayed_RD;

   wire int_res__D, int_res__S, int_res__RD, int_res_iq, xcr_0;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////

`ifdef _fv
   buf (delayed_CK, CK);
   buf (delayed_D, D);
   buf (delayed_SI, SI);
   buf (delayed_SE, SE);
   buf (delayed_EN, EN);
`endif
   buf (delayed_RD, RD);

   mux2 (int_res__D, int_res_iq, delayed_D, delayed_EN);
   mux2 (int_res__S, delayed_SI, int_res__D, delayed_SE);
   not (int_res__RD, delayed_RD);
   dff_r_err (xcr_0, delayed_CK, int_res__S, int_res__RD);
   dff_r (int_res_iq, viol_0, delayed_CK, int_res__S, int_res__RD, xcr_0);

   `ifdef VIRL_functiononly
      buf #`SNPS_SEQ_DELAY (Q, int_res_iq);
   `else
      buf (Q, int_res_iq);
   `endif

   `ifdef VIRL_functiononly

   `else

   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////

not U0 (_net_0, EN);
not U1 (_net_1, D);
not U2 (_net_2, SE);
and U3 (cond40, _net_0, _net_1, RD, _net_2);
not U4 (_net_3, D);
not U5 (_net_4, SI);
and U6 (cond39, EN, _net_3, RD, SE, _net_4);
not U7 (_net_5, D);
and U8 (cond36, EN, _net_5, RD, SE, SI);
not U9 (_net_6, EN);
not U10 (_net_7, SI);
and U11 (cond38, RD, _net_6, SE, _net_7);
not U12 (_net_8, EN);
and U13 (cond34, RD, _net_8, SE, SI);
not U14 (_net_9, EN);
not U15 (_net_10, SE);
and U16 (cond35, _net_9, D, RD, _net_10);
not U17 (_net_11, SI);
and U18 (cond37, EN, D, RD, SE, _net_11);
and U19 (cond33, EN, D, RD, SE, SI);
not U20 (_net_12, EN);
not U21 (_net_13, SE);
and U22 (cond0, RD, _net_12, _net_13);
not U23 (_net_14, D);
not U24 (_net_15, SE);
and U25 (cond2, RD, _net_14, _net_15);
not U26 (_net_16, SE);
and U27 (cond1, RD, D, _net_16);
not U28 (_net_17, D);
not U29 (_net_18, CK);
not U30 (_net_19, EN);
not U31 (_net_20, SE);
and U32 (cond32, _net_17, _net_18, _net_19, _net_20);
not U33 (_net_21, D);
not U34 (_net_22, CK);
not U35 (_net_23, SE);
and U36 (cond31, _net_21, _net_22, EN, _net_23);
not U37 (_net_24, D);
not U38 (_net_25, CK);
not U39 (_net_26, SI);
and U40 (cond30, _net_24, _net_25, EN, SE, _net_26);
not U41 (_net_27, D);
not U42 (_net_28, CK);
and U43 (cond29, _net_27, _net_28, EN, SE, SI);
not U44 (_net_29, EN);
not U45 (_net_30, CK);
not U46 (_net_31, SI);
and U47 (cond27, _net_29, _net_30, SE, _net_31);
not U48 (_net_32, EN);
not U49 (_net_33, CK);
and U50 (cond26, _net_32, _net_33, SE, SI);
not U51 (_net_34, CK);
not U52 (_net_35, EN);
not U53 (_net_36, SE);
and U54 (cond28, D, _net_34, _net_35, _net_36);
not U55 (_net_37, CK);
not U56 (_net_38, SE);
and U57 (cond25, D, _net_37, EN, _net_38);
not U58 (_net_39, CK);
not U59 (_net_40, SI);
and U60 (cond24, D, _net_39, EN, SE, _net_40);
not U61 (_net_41, CK);
and U62 (cond23, D, _net_41, EN, SE, SI);
not U63 (_net_42, D);
and U64 (cond16, EN, _net_42, SE, SI);
not U65 (_net_43, EN);
and U66 (cond14, SE, _net_43, SI);
not U67 (_net_44, D);
not U68 (_net_45, SE);
and U69 (cond22, _net_44, CK, EN, _net_45);
not U70 (_net_46, D);
and U71 (cond21, _net_46, CK, EN, SE);
not U72 (_net_47, EN);
not U73 (_net_48, SE);
and U74 (cond20, _net_47, CK, _net_48);
not U75 (_net_49, EN);
and U76 (cond19, _net_49, CK, SE);
not U77 (_net_50, SE);
and U78 (cond18, D, CK, EN, _net_50);
and U79 (cond17, D, CK, EN, SE);
not U80 (_net_51, EN);
not U81 (_net_52, SE);
and U82 (cond15, _net_51, D, _net_52);
and U83 (cond13, EN, D, SE, SI);
not U84 (_net_53, EN);
not U85 (_net_54, D);
and U86 (cond5, _net_53, _net_54, RD, SI);
not U87 (_net_55, D);
not U88 (_net_56, SI);
and U89 (cond8, EN, _net_55, RD, _net_56);
not U90 (_net_57, D);
and U91 (cond4, EN, _net_57, RD, SI);
not U92 (_net_58, EN);
not U93 (_net_59, SI);
and U94 (cond7, _net_58, D, RD, _net_59);
not U95 (_net_60, SI);
and U96 (cond6, EN, D, RD, _net_60);
and U97 (cond3, EN, D, RD, SI);
not U98 (_net_61, EN);
not U99 (_net_62, D);
and U100 (cond12, _net_61, _net_62, RD, SE);
not U101 (_net_63, D);
and U102 (cond11, EN, _net_63, RD, SE);
not U103 (_net_64, EN);
and U104 (cond10, _net_64, D, RD, SE);
and U105 (cond9, EN, D, RD, SE);

specify
if ((~(CK) & ~(D) & ~(EN) & ~(SE))) (negedge RD => (Q +: 1'b0))=(0, 0);
if ((~(CK) & ~(D) & EN & ~(SE))) (negedge RD => (Q +: 1'b0))=(0, 0);
if ((~(CK) & ~(D) & EN & SE & ~(SI))) (negedge RD => (Q +: 1'b0))=(0, 0);
if ((~(CK) & ~(D) & EN & SE & SI)) (negedge RD => (Q +: 1'b0))=(0, 0);
if ((~(CK) & ~(EN) & SE & ~(SI))) (negedge RD => (Q +: 1'b0))=(0, 0);
if ((~(CK) & ~(EN) & SE & SI)) (negedge RD => (Q +: 1'b0))=(0, 0);
if ((~(CK) & D & ~(EN) & ~(SE))) (negedge RD => (Q +: 1'b0))=(0, 0);
if ((~(CK) & D & EN & ~(SE))) (negedge RD => (Q +: 1'b0))=(0, 0);
if ((~(CK) & D & EN & SE & ~(SI))) (negedge RD => (Q +: 1'b0))=(0, 0);
if ((~(CK) & D & EN & SE & SI)) (negedge RD => (Q +: 1'b0))=(0, 0);
if ((CK & ~(D) & EN & ~(SE))) (negedge RD => (Q +: 1'b0))=(0, 0);
if ((CK & ~(D) & EN & SE)) (negedge RD => (Q +: 1'b0))=(0, 0);
if ((CK & ~(EN) & ~(SE))) (negedge RD => (Q +: 1'b0))=(0, 0);
if ((CK & ~(EN) & SE)) (negedge RD => (Q +: 1'b0))=(0, 0);
if ((CK & D & EN & ~(SE))) (negedge RD => (Q +: 1'b0))=(0, 0);
if ((CK & D & EN & SE)) (negedge RD => (Q +: 1'b0))=(0, 0);
(negedge RD => (Q:1'b0))=(0, 0);
(posedge CK => (Q : 1'b1))=(0, 0);
$width(posedge CK &&& cond40 , 0 ,0, viol_0);
$width(negedge CK &&& cond40 , 0 ,0, viol_0);
$width(posedge CK &&& cond39 , 0 ,0, viol_0);
$width(negedge CK &&& cond39 , 0 ,0, viol_0);
$width(posedge CK &&& cond36 , 0 ,0, viol_0);
$width(negedge CK &&& cond36 , 0 ,0, viol_0);
$width(posedge CK &&& cond38 , 0 ,0, viol_0);
$width(negedge CK &&& cond38 , 0 ,0, viol_0);
$width(posedge CK &&& cond34 , 0 ,0, viol_0);
$width(negedge CK &&& cond34 , 0 ,0, viol_0);
$width(posedge CK &&& cond35 , 0 ,0, viol_0);
$width(negedge CK &&& cond35 , 0 ,0, viol_0);
$width(posedge CK &&& cond37 , 0 ,0, viol_0);
$width(negedge CK &&& cond37 , 0 ,0, viol_0);
$width(posedge CK &&& cond33 , 0 ,0, viol_0);
$width(negedge CK &&& cond33 , 0 ,0, viol_0);
$setuphold(posedge CK &&& cond0 , posedge D &&& cond0 , 0 ,0, viol_0, , , delayed_CK, delayed_D);
$setuphold(posedge CK &&& cond0 , negedge D &&& cond0 , 0 ,0, viol_0, , , delayed_CK, delayed_D);
$setuphold(posedge CK &&& cond2 , posedge EN &&& cond2 , 0 ,0, viol_0, , , delayed_CK, delayed_EN);
$setuphold(posedge CK &&& cond2 , negedge EN &&& cond2 , 0 ,0, viol_0, , , delayed_CK, delayed_EN);
$setuphold(posedge CK &&& cond1 , posedge EN &&& cond1 , 0 ,0, viol_0, , , delayed_CK, delayed_EN);
$setuphold(posedge CK &&& cond1 , negedge EN &&& cond1 , 0 ,0, viol_0, , , delayed_CK, delayed_EN);
$width(negedge RD &&& cond32 , 0 ,0, viol_0);
$width(negedge RD &&& cond31 , 0 ,0, viol_0);
$width(negedge RD &&& cond30 , 0 ,0, viol_0);
$width(negedge RD &&& cond29 , 0 ,0, viol_0);
$width(negedge RD &&& cond27 , 0 ,0, viol_0);
$width(negedge RD &&& cond26 , 0 ,0, viol_0);
$width(negedge RD &&& cond28 , 0 ,0, viol_0);
$width(negedge RD &&& cond25 , 0 ,0, viol_0);
$width(negedge RD &&& cond24 , 0 ,0, viol_0);
$width(negedge RD &&& cond23 , 0 ,0, viol_0);
$recovery(posedge RD &&& cond16 , posedge CK &&& cond16 , 0 , viol_0);
$hold(posedge CK &&& cond16 , posedge RD &&& cond16 , 0 , viol_0);
$recovery(posedge RD &&& cond14 , posedge CK &&& cond14 , 0 , viol_0);
$hold(posedge CK &&& cond14 , posedge RD &&& cond14 , 0 , viol_0);
$width(negedge RD &&& cond22 , 0 ,0, viol_0);
$width(negedge RD &&& cond21 , 0 ,0, viol_0);
$width(negedge RD &&& cond20 , 0 ,0, viol_0);
$width(negedge RD &&& cond19 , 0 ,0, viol_0);
$width(negedge RD &&& cond18 , 0 ,0, viol_0);
$width(negedge RD &&& cond17 , 0 ,0, viol_0);
$recovery(posedge RD &&& cond15 , posedge CK &&& cond15 , 0 , viol_0);
$hold(posedge CK &&& cond15 , posedge RD &&& cond15 , 0 , viol_0);
$recovery(posedge RD &&& cond13 , posedge CK &&& cond13 , 0 , viol_0);
$hold(posedge CK &&& cond13 , posedge RD &&& cond13 , 0 , viol_0);
$setuphold(posedge CK &&& cond5 , posedge SE &&& cond5 , 0 ,0, viol_0, , , delayed_CK, delayed_SE);
$setuphold(posedge CK &&& cond5 , negedge SE &&& cond5 , 0 ,0, viol_0, , , delayed_CK, delayed_SE);
$setuphold(posedge CK &&& cond8 , posedge SE &&& cond8 , 0 ,0, viol_0, , , delayed_CK, delayed_SE);
$setuphold(posedge CK &&& cond8 , negedge SE &&& cond8 , 0 ,0, viol_0, , , delayed_CK, delayed_SE);
$setuphold(posedge CK &&& cond4 , posedge SE &&& cond4 , 0 ,0, viol_0, , , delayed_CK, delayed_SE);
$setuphold(posedge CK &&& cond4 , negedge SE &&& cond4 , 0 ,0, viol_0, , , delayed_CK, delayed_SE);
$setuphold(posedge CK &&& cond7 , posedge SE &&& cond7 , 0 ,0, viol_0, , , delayed_CK, delayed_SE);
$setuphold(posedge CK &&& cond7 , negedge SE &&& cond7 , 0 ,0, viol_0, , , delayed_CK, delayed_SE);
$setuphold(posedge CK &&& cond6 , posedge SE &&& cond6 , 0 ,0, viol_0, , , delayed_CK, delayed_SE);
$setuphold(posedge CK &&& cond6 , negedge SE &&& cond6 , 0 ,0, viol_0, , , delayed_CK, delayed_SE);
$setuphold(posedge CK &&& cond3 , posedge SE &&& cond3 , 0 ,0, viol_0, , , delayed_CK, delayed_SE);
$setuphold(posedge CK &&& cond3 , negedge SE &&& cond3 , 0 ,0, viol_0, , , delayed_CK, delayed_SE);
$setuphold(posedge CK &&& cond12 , posedge SI &&& cond12 , 0 ,0, viol_0, , , delayed_CK, delayed_SI);
$setuphold(posedge CK &&& cond12 , negedge SI &&& cond12 , 0 ,0, viol_0, , , delayed_CK, delayed_SI);
$setuphold(posedge CK &&& cond11 , posedge SI &&& cond11 , 0 ,0, viol_0, , , delayed_CK, delayed_SI);
$setuphold(posedge CK &&& cond11 , negedge SI &&& cond11 , 0 ,0, viol_0, , , delayed_CK, delayed_SI);
$setuphold(posedge CK &&& cond10 , posedge SI &&& cond10 , 0 ,0, viol_0, , , delayed_CK, delayed_SI);
$setuphold(posedge CK &&& cond10 , negedge SI &&& cond10 , 0 ,0, viol_0, , , delayed_CK, delayed_SI);
$setuphold(posedge CK &&& cond9 , posedge SI &&& cond9 , 0 ,0, viol_0, , , delayed_CK, delayed_SI);
$setuphold(posedge CK &&& cond9 , negedge SI &&& cond9 , 0 ,0, viol_0, , , delayed_CK, delayed_SI);
endspecify
   `endif
endmodule
`endcelldefine

//%END SVN_FSDPHRBQ_2

//%BEGIN SVN_FSDPHRBQ_4

`celldefine
module SVN_FSDPHRBQ_4 (Q, CK, D, SI, SE, EN, RD);
   output Q;
   input CK, D, SI, SE, EN, RD;

   reg viol_0;
   wire delayed_CK, delayed_D, delayed_SI,
	delayed_SE, delayed_EN, delayed_RD;

   wire int_res__D, int_res__S, int_res__RD, int_res_iq, xcr_0;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////

`ifdef _fv
   buf (delayed_CK, CK);
   buf (delayed_D, D);
   buf (delayed_SI, SI);
   buf (delayed_SE, SE);
   buf (delayed_EN, EN);
`endif
   buf (delayed_RD, RD);

   mux2 (int_res__D, int_res_iq, delayed_D, delayed_EN);
   mux2 (int_res__S, delayed_SI, int_res__D, delayed_SE);
   not (int_res__RD, delayed_RD);
   dff_r_err (xcr_0, delayed_CK, int_res__S, int_res__RD);
   dff_r (int_res_iq, viol_0, delayed_CK, int_res__S, int_res__RD, xcr_0);

   `ifdef VIRL_functiononly
      buf #`SNPS_SEQ_DELAY (Q, int_res_iq);
   `else
      buf (Q, int_res_iq);
   `endif

   `ifdef VIRL_functiononly

   `else

   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////

not U0 (_net_0, EN);
not U1 (_net_1, D);
not U2 (_net_2, SE);
and U3 (cond40, _net_0, _net_1, RD, _net_2);
not U4 (_net_3, D);
not U5 (_net_4, SI);
and U6 (cond39, EN, _net_3, RD, SE, _net_4);
not U7 (_net_5, D);
and U8 (cond36, EN, _net_5, RD, SE, SI);
not U9 (_net_6, EN);
not U10 (_net_7, SI);
and U11 (cond38, RD, _net_6, SE, _net_7);
not U12 (_net_8, EN);
and U13 (cond34, RD, _net_8, SE, SI);
not U14 (_net_9, EN);
not U15 (_net_10, SE);
and U16 (cond35, _net_9, D, RD, _net_10);
not U17 (_net_11, SI);
and U18 (cond37, EN, D, RD, SE, _net_11);
and U19 (cond33, EN, D, RD, SE, SI);
not U20 (_net_12, EN);
not U21 (_net_13, SE);
and U22 (cond0, RD, _net_12, _net_13);
not U23 (_net_14, D);
not U24 (_net_15, SE);
and U25 (cond2, RD, _net_14, _net_15);
not U26 (_net_16, SE);
and U27 (cond1, RD, D, _net_16);
not U28 (_net_17, D);
not U29 (_net_18, CK);
not U30 (_net_19, EN);
not U31 (_net_20, SE);
and U32 (cond32, _net_17, _net_18, _net_19, _net_20);
not U33 (_net_21, D);
not U34 (_net_22, CK);
not U35 (_net_23, SE);
and U36 (cond31, _net_21, _net_22, EN, _net_23);
not U37 (_net_24, D);
not U38 (_net_25, CK);
not U39 (_net_26, SI);
and U40 (cond30, _net_24, _net_25, EN, SE, _net_26);
not U41 (_net_27, D);
not U42 (_net_28, CK);
and U43 (cond29, _net_27, _net_28, EN, SE, SI);
not U44 (_net_29, EN);
not U45 (_net_30, CK);
not U46 (_net_31, SI);
and U47 (cond27, _net_29, _net_30, SE, _net_31);
not U48 (_net_32, EN);
not U49 (_net_33, CK);
and U50 (cond26, _net_32, _net_33, SE, SI);
not U51 (_net_34, CK);
not U52 (_net_35, EN);
not U53 (_net_36, SE);
and U54 (cond28, D, _net_34, _net_35, _net_36);
not U55 (_net_37, CK);
not U56 (_net_38, SE);
and U57 (cond25, D, _net_37, EN, _net_38);
not U58 (_net_39, CK);
not U59 (_net_40, SI);
and U60 (cond24, D, _net_39, EN, SE, _net_40);
not U61 (_net_41, CK);
and U62 (cond23, D, _net_41, EN, SE, SI);
not U63 (_net_42, D);
and U64 (cond16, EN, _net_42, SE, SI);
not U65 (_net_43, EN);
and U66 (cond14, SE, _net_43, SI);
not U67 (_net_44, D);
not U68 (_net_45, SE);
and U69 (cond22, _net_44, CK, EN, _net_45);
not U70 (_net_46, D);
and U71 (cond21, _net_46, CK, EN, SE);
not U72 (_net_47, EN);
not U73 (_net_48, SE);
and U74 (cond20, _net_47, CK, _net_48);
not U75 (_net_49, EN);
and U76 (cond19, _net_49, CK, SE);
not U77 (_net_50, SE);
and U78 (cond18, D, CK, EN, _net_50);
and U79 (cond17, D, CK, EN, SE);
not U80 (_net_51, EN);
not U81 (_net_52, SE);
and U82 (cond15, _net_51, D, _net_52);
and U83 (cond13, EN, D, SE, SI);
not U84 (_net_53, EN);
not U85 (_net_54, D);
and U86 (cond5, _net_53, _net_54, RD, SI);
not U87 (_net_55, D);
not U88 (_net_56, SI);
and U89 (cond8, EN, _net_55, RD, _net_56);
not U90 (_net_57, D);
and U91 (cond4, EN, _net_57, RD, SI);
not U92 (_net_58, EN);
not U93 (_net_59, SI);
and U94 (cond7, _net_58, D, RD, _net_59);
not U95 (_net_60, SI);
and U96 (cond6, EN, D, RD, _net_60);
and U97 (cond3, EN, D, RD, SI);
not U98 (_net_61, EN);
not U99 (_net_62, D);
and U100 (cond12, _net_61, _net_62, RD, SE);
not U101 (_net_63, D);
and U102 (cond11, EN, _net_63, RD, SE);
not U103 (_net_64, EN);
and U104 (cond10, _net_64, D, RD, SE);
and U105 (cond9, EN, D, RD, SE);

specify
if ((~(CK) & ~(D) & ~(EN) & ~(SE))) (negedge RD => (Q +: 1'b0))=(0, 0);
if ((~(CK) & ~(D) & EN & ~(SE))) (negedge RD => (Q +: 1'b0))=(0, 0);
if ((~(CK) & ~(D) & EN & SE & ~(SI))) (negedge RD => (Q +: 1'b0))=(0, 0);
if ((~(CK) & ~(D) & EN & SE & SI)) (negedge RD => (Q +: 1'b0))=(0, 0);
if ((~(CK) & ~(EN) & SE & ~(SI))) (negedge RD => (Q +: 1'b0))=(0, 0);
if ((~(CK) & ~(EN) & SE & SI)) (negedge RD => (Q +: 1'b0))=(0, 0);
if ((~(CK) & D & ~(EN) & ~(SE))) (negedge RD => (Q +: 1'b0))=(0, 0);
if ((~(CK) & D & EN & ~(SE))) (negedge RD => (Q +: 1'b0))=(0, 0);
if ((~(CK) & D & EN & SE & ~(SI))) (negedge RD => (Q +: 1'b0))=(0, 0);
if ((~(CK) & D & EN & SE & SI)) (negedge RD => (Q +: 1'b0))=(0, 0);
if ((CK & ~(D) & EN & ~(SE))) (negedge RD => (Q +: 1'b0))=(0, 0);
if ((CK & ~(D) & EN & SE)) (negedge RD => (Q +: 1'b0))=(0, 0);
if ((CK & ~(EN) & ~(SE))) (negedge RD => (Q +: 1'b0))=(0, 0);
if ((CK & ~(EN) & SE)) (negedge RD => (Q +: 1'b0))=(0, 0);
if ((CK & D & EN & ~(SE))) (negedge RD => (Q +: 1'b0))=(0, 0);
if ((CK & D & EN & SE)) (negedge RD => (Q +: 1'b0))=(0, 0);
(negedge RD => (Q:1'b0))=(0, 0);
(posedge CK => (Q : 1'b1))=(0, 0);
$width(posedge CK &&& cond40 , 0 ,0, viol_0);
$width(negedge CK &&& cond40 , 0 ,0, viol_0);
$width(posedge CK &&& cond39 , 0 ,0, viol_0);
$width(negedge CK &&& cond39 , 0 ,0, viol_0);
$width(posedge CK &&& cond36 , 0 ,0, viol_0);
$width(negedge CK &&& cond36 , 0 ,0, viol_0);
$width(posedge CK &&& cond38 , 0 ,0, viol_0);
$width(negedge CK &&& cond38 , 0 ,0, viol_0);
$width(posedge CK &&& cond34 , 0 ,0, viol_0);
$width(negedge CK &&& cond34 , 0 ,0, viol_0);
$width(posedge CK &&& cond35 , 0 ,0, viol_0);
$width(negedge CK &&& cond35 , 0 ,0, viol_0);
$width(posedge CK &&& cond37 , 0 ,0, viol_0);
$width(negedge CK &&& cond37 , 0 ,0, viol_0);
$width(posedge CK &&& cond33 , 0 ,0, viol_0);
$width(negedge CK &&& cond33 , 0 ,0, viol_0);
$setuphold(posedge CK &&& cond0 , posedge D &&& cond0 , 0 ,0, viol_0, , , delayed_CK, delayed_D);
$setuphold(posedge CK &&& cond0 , negedge D &&& cond0 , 0 ,0, viol_0, , , delayed_CK, delayed_D);
$setuphold(posedge CK &&& cond2 , posedge EN &&& cond2 , 0 ,0, viol_0, , , delayed_CK, delayed_EN);
$setuphold(posedge CK &&& cond2 , negedge EN &&& cond2 , 0 ,0, viol_0, , , delayed_CK, delayed_EN);
$setuphold(posedge CK &&& cond1 , posedge EN &&& cond1 , 0 ,0, viol_0, , , delayed_CK, delayed_EN);
$setuphold(posedge CK &&& cond1 , negedge EN &&& cond1 , 0 ,0, viol_0, , , delayed_CK, delayed_EN);
$width(negedge RD &&& cond32 , 0 ,0, viol_0);
$width(negedge RD &&& cond31 , 0 ,0, viol_0);
$width(negedge RD &&& cond30 , 0 ,0, viol_0);
$width(negedge RD &&& cond29 , 0 ,0, viol_0);
$width(negedge RD &&& cond27 , 0 ,0, viol_0);
$width(negedge RD &&& cond26 , 0 ,0, viol_0);
$width(negedge RD &&& cond28 , 0 ,0, viol_0);
$width(negedge RD &&& cond25 , 0 ,0, viol_0);
$width(negedge RD &&& cond24 , 0 ,0, viol_0);
$width(negedge RD &&& cond23 , 0 ,0, viol_0);
$recovery(posedge RD &&& cond16 , posedge CK &&& cond16 , 0 , viol_0);
$hold(posedge CK &&& cond16 , posedge RD &&& cond16 , 0 , viol_0);
$recovery(posedge RD &&& cond14 , posedge CK &&& cond14 , 0 , viol_0);
$hold(posedge CK &&& cond14 , posedge RD &&& cond14 , 0 , viol_0);
$width(negedge RD &&& cond22 , 0 ,0, viol_0);
$width(negedge RD &&& cond21 , 0 ,0, viol_0);
$width(negedge RD &&& cond20 , 0 ,0, viol_0);
$width(negedge RD &&& cond19 , 0 ,0, viol_0);
$width(negedge RD &&& cond18 , 0 ,0, viol_0);
$width(negedge RD &&& cond17 , 0 ,0, viol_0);
$recovery(posedge RD &&& cond15 , posedge CK &&& cond15 , 0 , viol_0);
$hold(posedge CK &&& cond15 , posedge RD &&& cond15 , 0 , viol_0);
$recovery(posedge RD &&& cond13 , posedge CK &&& cond13 , 0 , viol_0);
$hold(posedge CK &&& cond13 , posedge RD &&& cond13 , 0 , viol_0);
$setuphold(posedge CK &&& cond5 , posedge SE &&& cond5 , 0 ,0, viol_0, , , delayed_CK, delayed_SE);
$setuphold(posedge CK &&& cond5 , negedge SE &&& cond5 , 0 ,0, viol_0, , , delayed_CK, delayed_SE);
$setuphold(posedge CK &&& cond8 , posedge SE &&& cond8 , 0 ,0, viol_0, , , delayed_CK, delayed_SE);
$setuphold(posedge CK &&& cond8 , negedge SE &&& cond8 , 0 ,0, viol_0, , , delayed_CK, delayed_SE);
$setuphold(posedge CK &&& cond4 , posedge SE &&& cond4 , 0 ,0, viol_0, , , delayed_CK, delayed_SE);
$setuphold(posedge CK &&& cond4 , negedge SE &&& cond4 , 0 ,0, viol_0, , , delayed_CK, delayed_SE);
$setuphold(posedge CK &&& cond7 , posedge SE &&& cond7 , 0 ,0, viol_0, , , delayed_CK, delayed_SE);
$setuphold(posedge CK &&& cond7 , negedge SE &&& cond7 , 0 ,0, viol_0, , , delayed_CK, delayed_SE);
$setuphold(posedge CK &&& cond6 , posedge SE &&& cond6 , 0 ,0, viol_0, , , delayed_CK, delayed_SE);
$setuphold(posedge CK &&& cond6 , negedge SE &&& cond6 , 0 ,0, viol_0, , , delayed_CK, delayed_SE);
$setuphold(posedge CK &&& cond3 , posedge SE &&& cond3 , 0 ,0, viol_0, , , delayed_CK, delayed_SE);
$setuphold(posedge CK &&& cond3 , negedge SE &&& cond3 , 0 ,0, viol_0, , , delayed_CK, delayed_SE);
$setuphold(posedge CK &&& cond12 , posedge SI &&& cond12 , 0 ,0, viol_0, , , delayed_CK, delayed_SI);
$setuphold(posedge CK &&& cond12 , negedge SI &&& cond12 , 0 ,0, viol_0, , , delayed_CK, delayed_SI);
$setuphold(posedge CK &&& cond11 , posedge SI &&& cond11 , 0 ,0, viol_0, , , delayed_CK, delayed_SI);
$setuphold(posedge CK &&& cond11 , negedge SI &&& cond11 , 0 ,0, viol_0, , , delayed_CK, delayed_SI);
$setuphold(posedge CK &&& cond10 , posedge SI &&& cond10 , 0 ,0, viol_0, , , delayed_CK, delayed_SI);
$setuphold(posedge CK &&& cond10 , negedge SI &&& cond10 , 0 ,0, viol_0, , , delayed_CK, delayed_SI);
$setuphold(posedge CK &&& cond9 , posedge SI &&& cond9 , 0 ,0, viol_0, , , delayed_CK, delayed_SI);
$setuphold(posedge CK &&& cond9 , negedge SI &&& cond9 , 0 ,0, viol_0, , , delayed_CK, delayed_SI);
endspecify
   `endif
endmodule
`endcelldefine

//%END SVN_FSDPHRBQ_4

//%BEGIN SVN_FSDPMQ_1

`celldefine
module SVN_FSDPMQ_1 (Q, CK, D0, D1, S, SI, SE);
   output Q;
   input CK, D0, D1, S, SI, SE;

   reg viol_0;
   wire delayed_CK, delayed_D0, delayed_D1,
	delayed_S, delayed_SI, delayed_SE;

   wire int_res__D, int_res__S, xcr_0;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////

`ifdef _fv
   buf (delayed_CK, CK);
   buf (delayed_D0, D0);
   buf (delayed_D1, D1);
   buf (delayed_S, S);
   buf (delayed_SI, SI);
   buf (delayed_SE, SE);
`endif

   mux2 (int_res__D, delayed_D1, delayed_D0, delayed_S);
   mux2 (int_res__S, delayed_SI, int_res__D, delayed_SE);
   dff_err (xcr_0, delayed_CK, int_res__S);

   `ifdef VIRL_functiononly
      dff #`SNPS_SEQ_DELAY (Q, viol_0, delayed_CK, int_res__S, xcr_0);
   `else
      dff (Q, viol_0, delayed_CK, int_res__S, xcr_0);
   `endif

   `ifdef VIRL_functiononly

   `else

   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////
not U0 (_net_0, D1);
not U1 (_net_1, SI);
and U2 (_net_2, _net_0, D0, S, SE, _net_1);
not U3 (_net_3, SI);
and U4 (_net_4, D1, D0, SE, _net_3);
not U5 (_net_5, D1);
not U6 (_net_6, SE);
and U7 (_net_7, _net_5, D0, S, _net_6);
not U8 (_net_8, D1);
not U9 (_net_9, S);
not U10 (_net_10, SI);
and U11 (_net_11, _net_8, D0, _net_9, SE, _net_10);
not U12 (_net_12, D0);
not U13 (_net_13, SI);
and U14 (_net_14, D1, _net_12, S, SE, _net_13);
not U15 (_net_15, D0);
not U16 (_net_16, S);
not U17 (_net_17, SI);
and U18 (_net_18, D1, _net_15, _net_16, SE, _net_17);
not U19 (_net_19, D0);
not U20 (_net_20, S);
not U21 (_net_21, SE);
and U22 (_net_22, D1, _net_19, _net_20, _net_21);
not U23 (_net_23, D1);
not U24 (_net_24, D0);
not U25 (_net_25, SI);
and U26 (_net_26, _net_23, _net_24, SE, _net_25);
not U27 (_net_27, D1);
not U28 (_net_28, D0);
not U29 (_net_29, SE);
and U30 (_net_30, _net_27, _net_28, _net_29);
or U31 (cond21, _net_2, _net_4, _net_7, _net_11, _net_14, _net_18, _net_22, _net_26, _net_30);
not U32 (_net_31, SE);
and U33 (_net_32, D1, D0, _net_31);
and U34 (_net_33, D1, D0, SE, SI);
not U35 (_net_34, D1);
and U36 (_net_35, _net_34, D0, S, SE, SI);
not U37 (_net_36, D1);
not U38 (_net_37, S);
and U39 (_net_38, _net_36, D0, _net_37, SE, SI);
not U40 (_net_39, D1);
not U41 (_net_40, S);
not U42 (_net_41, SE);
and U43 (_net_42, _net_39, D0, _net_40, _net_41);
not U44 (_net_43, D0);
and U45 (_net_44, D1, _net_43, S, SE, SI);
not U46 (_net_45, D0);
not U47 (_net_46, SE);
and U48 (_net_47, D1, _net_45, S, _net_46);
not U49 (_net_48, D0);
not U50 (_net_49, S);
and U51 (_net_50, D1, _net_48, _net_49, SE, SI);
not U52 (_net_51, D1);
not U53 (_net_52, D0);
and U54 (_net_53, _net_51, _net_52, SE, SI);
or U55 (cond20, _net_32, _net_33, _net_35, _net_38, _net_42, _net_44, _net_47, _net_50, _net_53);
not U56 (_net_54, S);
not U57 (_net_55, D1);
not U58 (_net_56, SE);
and U59 (cond1, _net_54, _net_55, _net_56);
not U60 (_net_57, S);
not U61 (_net_58, SE);
and U62 (cond0, _net_57, D1, _net_58);
not U63 (_net_59, D0);
not U64 (_net_60, SE);
and U65 (cond3, S, _net_59, _net_60);
not U66 (_net_61, SE);
and U67 (cond2, S, D0, _net_61);
not U68 (_net_62, D0);
not U69 (_net_63, SE);
and U70 (cond4, D1, _net_62, _net_63);
not U71 (_net_64, D1);
not U72 (_net_65, SE);
and U73 (cond5, _net_64, D0, _net_65);
not U74 (_net_66, D1);
not U75 (_net_67, D0);
not U76 (_net_68, S);
and U77 (cond9, _net_66, _net_67, _net_68, SI);
not U78 (_net_69, D1);
not U79 (_net_70, D0);
and U80 (cond8, _net_69, _net_70, S, SI);
not U81 (_net_71, D0);
not U82 (_net_72, S);
and U83 (cond7, D1, _net_71, _net_72, SI);
not U84 (_net_73, D0);
not U85 (_net_74, SI);
and U86 (cond13, D1, _net_73, S, _net_74);
not U87 (_net_75, D1);
not U88 (_net_76, S);
not U89 (_net_77, SI);
and U90 (cond12, _net_75, D0, _net_76, _net_77);
not U91 (_net_78, D1);
and U92 (cond6, _net_78, D0, S, SI);
not U93 (_net_79, S);
not U94 (_net_80, SI);
and U95 (cond11, D1, D0, _net_79, _net_80);
not U96 (_net_81, SI);
and U97 (cond10, D1, D0, S, _net_81);
not U98 (_net_82, D1);
not U99 (_net_83, D0);
and U100 (cond19, _net_82, _net_83, SE);
not U101 (_net_84, D0);
not U102 (_net_85, S);
and U103 (cond18, D1, _net_84, _net_85, SE);
not U104 (_net_86, D0);
and U105 (cond17, D1, _net_86, S, SE);
not U106 (_net_87, D1);
not U107 (_net_88, S);
and U108 (cond16, _net_87, D0, _net_88, SE);
not U109 (_net_89, D1);
and U110 (cond15, _net_89, D0, S, SE);
and U111 (cond14, D1, D0, SE);

specify
(posedge CK => (Q : 1'b1))=(0, 0);
$width(posedge CK &&& cond21 , 0 ,0, viol_0);
$width(negedge CK &&& cond21 , 0 ,0, viol_0);
$width(posedge CK &&& cond20 , 0 ,0, viol_0);
$width(negedge CK &&& cond20 , 0 ,0, viol_0);
$setuphold(posedge CK &&& cond1 , posedge D0 &&& cond1 , 0 ,0, viol_0, , , delayed_CK, delayed_D0);
$setuphold(posedge CK &&& cond1 , negedge D0 &&& cond1 , 0 ,0, viol_0, , , delayed_CK, delayed_D0);
$setuphold(posedge CK &&& cond0 , posedge D0 &&& cond0 , 0 ,0, viol_0, , , delayed_CK, delayed_D0);
$setuphold(posedge CK &&& cond0 , negedge D0 &&& cond0 , 0 ,0, viol_0, , , delayed_CK, delayed_D0);
$setuphold(posedge CK &&& cond3 , posedge D1 &&& cond3 , 0 ,0, viol_0, , , delayed_CK, delayed_D1);
$setuphold(posedge CK &&& cond3 , negedge D1 &&& cond3 , 0 ,0, viol_0, , , delayed_CK, delayed_D1);
$setuphold(posedge CK &&& cond2 , posedge D1 &&& cond2 , 0 ,0, viol_0, , , delayed_CK, delayed_D1);
$setuphold(posedge CK &&& cond2 , negedge D1 &&& cond2 , 0 ,0, viol_0, , , delayed_CK, delayed_D1);
$setuphold(posedge CK &&& cond4 , posedge S &&& cond4 , 0 ,0, viol_0, , , delayed_CK, delayed_S);
$setuphold(posedge CK &&& cond4 , negedge S &&& cond4 , 0 ,0, viol_0, , , delayed_CK, delayed_S);
$setuphold(posedge CK &&& cond5 , posedge S &&& cond5 , 0 ,0, viol_0, , , delayed_CK, delayed_S);
$setuphold(posedge CK &&& cond5 , negedge S &&& cond5 , 0 ,0, viol_0, , , delayed_CK, delayed_S);
$setuphold(posedge CK &&& cond9 , posedge SE &&& cond9 , 0 ,0, viol_0, , , delayed_CK, delayed_SE);
$setuphold(posedge CK &&& cond9 , negedge SE &&& cond9 , 0 ,0, viol_0, , , delayed_CK, delayed_SE);
$setuphold(posedge CK &&& cond8 , posedge SE &&& cond8 , 0 ,0, viol_0, , , delayed_CK, delayed_SE);
$setuphold(posedge CK &&& cond8 , negedge SE &&& cond8 , 0 ,0, viol_0, , , delayed_CK, delayed_SE);
$setuphold(posedge CK &&& cond7 , posedge SE &&& cond7 , 0 ,0, viol_0, , , delayed_CK, delayed_SE);
$setuphold(posedge CK &&& cond7 , negedge SE &&& cond7 , 0 ,0, viol_0, , , delayed_CK, delayed_SE);
$setuphold(posedge CK &&& cond13 , posedge SE &&& cond13 , 0 ,0, viol_0, , , delayed_CK, delayed_SE);
$setuphold(posedge CK &&& cond13 , negedge SE &&& cond13 , 0 ,0, viol_0, , , delayed_CK, delayed_SE);
$setuphold(posedge CK &&& cond12 , posedge SE &&& cond12 , 0 ,0, viol_0, , , delayed_CK, delayed_SE);
$setuphold(posedge CK &&& cond12 , negedge SE &&& cond12 , 0 ,0, viol_0, , , delayed_CK, delayed_SE);
$setuphold(posedge CK &&& cond6 , posedge SE &&& cond6 , 0 ,0, viol_0, , , delayed_CK, delayed_SE);
$setuphold(posedge CK &&& cond6 , negedge SE &&& cond6 , 0 ,0, viol_0, , , delayed_CK, delayed_SE);
$setuphold(posedge CK &&& cond11 , posedge SE &&& cond11 , 0 ,0, viol_0, , , delayed_CK, delayed_SE);
$setuphold(posedge CK &&& cond11 , negedge SE &&& cond11 , 0 ,0, viol_0, , , delayed_CK, delayed_SE);
$setuphold(posedge CK &&& cond10 , posedge SE &&& cond10 , 0 ,0, viol_0, , , delayed_CK, delayed_SE);
$setuphold(posedge CK &&& cond10 , negedge SE &&& cond10 , 0 ,0, viol_0, , , delayed_CK, delayed_SE);
$setuphold(posedge CK &&& cond19 , posedge SI &&& cond19 , 0 ,0, viol_0, , , delayed_CK, delayed_SI);
$setuphold(posedge CK &&& cond19 , negedge SI &&& cond19 , 0 ,0, viol_0, , , delayed_CK, delayed_SI);
$setuphold(posedge CK &&& cond18 , posedge SI &&& cond18 , 0 ,0, viol_0, , , delayed_CK, delayed_SI);
$setuphold(posedge CK &&& cond18 , negedge SI &&& cond18 , 0 ,0, viol_0, , , delayed_CK, delayed_SI);
$setuphold(posedge CK &&& cond17 , posedge SI &&& cond17 , 0 ,0, viol_0, , , delayed_CK, delayed_SI);
$setuphold(posedge CK &&& cond17 , negedge SI &&& cond17 , 0 ,0, viol_0, , , delayed_CK, delayed_SI);
$setuphold(posedge CK &&& cond16 , posedge SI &&& cond16 , 0 ,0, viol_0, , , delayed_CK, delayed_SI);
$setuphold(posedge CK &&& cond16 , negedge SI &&& cond16 , 0 ,0, viol_0, , , delayed_CK, delayed_SI);
$setuphold(posedge CK &&& cond15 , posedge SI &&& cond15 , 0 ,0, viol_0, , , delayed_CK, delayed_SI);
$setuphold(posedge CK &&& cond15 , negedge SI &&& cond15 , 0 ,0, viol_0, , , delayed_CK, delayed_SI);
$setuphold(posedge CK &&& cond14 , posedge SI &&& cond14 , 0 ,0, viol_0, , , delayed_CK, delayed_SI);
$setuphold(posedge CK &&& cond14 , negedge SI &&& cond14 , 0 ,0, viol_0, , , delayed_CK, delayed_SI);
endspecify
   `endif
endmodule
`endcelldefine

//%END SVN_FSDPMQ_1

//%BEGIN SVN_FSDPMQ_2

`celldefine
module SVN_FSDPMQ_2 (Q, CK, D0, D1, S, SI, SE);
   output Q;
   input CK, D0, D1, S, SI, SE;

   reg viol_0;
   wire delayed_CK, delayed_D0, delayed_D1,
	delayed_S, delayed_SI, delayed_SE;

   wire int_res__D, int_res__S, xcr_0;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////

`ifdef _fv
   buf (delayed_CK, CK);
   buf (delayed_D0, D0);
   buf (delayed_D1, D1);
   buf (delayed_S, S);
   buf (delayed_SI, SI);
   buf (delayed_SE, SE);
`endif

   mux2 (int_res__D, delayed_D1, delayed_D0, delayed_S);
   mux2 (int_res__S, delayed_SI, int_res__D, delayed_SE);
   dff_err (xcr_0, delayed_CK, int_res__S);

   `ifdef VIRL_functiononly
      dff #`SNPS_SEQ_DELAY (Q, viol_0, delayed_CK, int_res__S, xcr_0);
   `else
      dff (Q, viol_0, delayed_CK, int_res__S, xcr_0);
   `endif

   `ifdef VIRL_functiononly

   `else

   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////
not U0 (_net_0, D1);
not U1 (_net_1, SI);
and U2 (_net_2, _net_0, D0, S, SE, _net_1);
not U3 (_net_3, SI);
and U4 (_net_4, D1, D0, SE, _net_3);
not U5 (_net_5, D1);
not U6 (_net_6, SE);
and U7 (_net_7, _net_5, D0, S, _net_6);
not U8 (_net_8, D1);
not U9 (_net_9, S);
not U10 (_net_10, SI);
and U11 (_net_11, _net_8, D0, _net_9, SE, _net_10);
not U12 (_net_12, D0);
not U13 (_net_13, SI);
and U14 (_net_14, D1, _net_12, S, SE, _net_13);
not U15 (_net_15, D0);
not U16 (_net_16, S);
not U17 (_net_17, SI);
and U18 (_net_18, D1, _net_15, _net_16, SE, _net_17);
not U19 (_net_19, D0);
not U20 (_net_20, S);
not U21 (_net_21, SE);
and U22 (_net_22, D1, _net_19, _net_20, _net_21);
not U23 (_net_23, D1);
not U24 (_net_24, D0);
not U25 (_net_25, SI);
and U26 (_net_26, _net_23, _net_24, SE, _net_25);
not U27 (_net_27, D1);
not U28 (_net_28, D0);
not U29 (_net_29, SE);
and U30 (_net_30, _net_27, _net_28, _net_29);
or U31 (cond21, _net_2, _net_4, _net_7, _net_11, _net_14, _net_18, _net_22, _net_26, _net_30);
not U32 (_net_31, SE);
and U33 (_net_32, D1, D0, _net_31);
and U34 (_net_33, D1, D0, SE, SI);
not U35 (_net_34, D1);
and U36 (_net_35, _net_34, D0, S, SE, SI);
not U37 (_net_36, D1);
not U38 (_net_37, S);
and U39 (_net_38, _net_36, D0, _net_37, SE, SI);
not U40 (_net_39, D1);
not U41 (_net_40, S);
not U42 (_net_41, SE);
and U43 (_net_42, _net_39, D0, _net_40, _net_41);
not U44 (_net_43, D0);
and U45 (_net_44, D1, _net_43, S, SE, SI);
not U46 (_net_45, D0);
not U47 (_net_46, SE);
and U48 (_net_47, D1, _net_45, S, _net_46);
not U49 (_net_48, D0);
not U50 (_net_49, S);
and U51 (_net_50, D1, _net_48, _net_49, SE, SI);
not U52 (_net_51, D1);
not U53 (_net_52, D0);
and U54 (_net_53, _net_51, _net_52, SE, SI);
or U55 (cond20, _net_32, _net_33, _net_35, _net_38, _net_42, _net_44, _net_47, _net_50, _net_53);
not U56 (_net_54, S);
not U57 (_net_55, D1);
not U58 (_net_56, SE);
and U59 (cond1, _net_54, _net_55, _net_56);
not U60 (_net_57, S);
not U61 (_net_58, SE);
and U62 (cond0, _net_57, D1, _net_58);
not U63 (_net_59, D0);
not U64 (_net_60, SE);
and U65 (cond3, S, _net_59, _net_60);
not U66 (_net_61, SE);
and U67 (cond2, S, D0, _net_61);
not U68 (_net_62, D0);
not U69 (_net_63, SE);
and U70 (cond4, D1, _net_62, _net_63);
not U71 (_net_64, D1);
not U72 (_net_65, SE);
and U73 (cond5, _net_64, D0, _net_65);
not U74 (_net_66, D1);
not U75 (_net_67, D0);
not U76 (_net_68, S);
and U77 (cond9, _net_66, _net_67, _net_68, SI);
not U78 (_net_69, D1);
not U79 (_net_70, D0);
and U80 (cond8, _net_69, _net_70, S, SI);
not U81 (_net_71, D0);
not U82 (_net_72, S);
and U83 (cond7, D1, _net_71, _net_72, SI);
not U84 (_net_73, D0);
not U85 (_net_74, SI);
and U86 (cond13, D1, _net_73, S, _net_74);
not U87 (_net_75, D1);
not U88 (_net_76, S);
not U89 (_net_77, SI);
and U90 (cond12, _net_75, D0, _net_76, _net_77);
not U91 (_net_78, D1);
and U92 (cond6, _net_78, D0, S, SI);
not U93 (_net_79, S);
not U94 (_net_80, SI);
and U95 (cond11, D1, D0, _net_79, _net_80);
not U96 (_net_81, SI);
and U97 (cond10, D1, D0, S, _net_81);
not U98 (_net_82, D1);
not U99 (_net_83, D0);
and U100 (cond19, _net_82, _net_83, SE);
not U101 (_net_84, D0);
not U102 (_net_85, S);
and U103 (cond18, D1, _net_84, _net_85, SE);
not U104 (_net_86, D0);
and U105 (cond17, D1, _net_86, S, SE);
not U106 (_net_87, D1);
not U107 (_net_88, S);
and U108 (cond16, _net_87, D0, _net_88, SE);
not U109 (_net_89, D1);
and U110 (cond15, _net_89, D0, S, SE);
and U111 (cond14, D1, D0, SE);

specify
(posedge CK => (Q : 1'b1))=(0, 0);
$width(posedge CK &&& cond21 , 0 ,0, viol_0);
$width(negedge CK &&& cond21 , 0 ,0, viol_0);
$width(posedge CK &&& cond20 , 0 ,0, viol_0);
$width(negedge CK &&& cond20 , 0 ,0, viol_0);
$setuphold(posedge CK &&& cond1 , posedge D0 &&& cond1 , 0 ,0, viol_0, , , delayed_CK, delayed_D0);
$setuphold(posedge CK &&& cond1 , negedge D0 &&& cond1 , 0 ,0, viol_0, , , delayed_CK, delayed_D0);
$setuphold(posedge CK &&& cond0 , posedge D0 &&& cond0 , 0 ,0, viol_0, , , delayed_CK, delayed_D0);
$setuphold(posedge CK &&& cond0 , negedge D0 &&& cond0 , 0 ,0, viol_0, , , delayed_CK, delayed_D0);
$setuphold(posedge CK &&& cond3 , posedge D1 &&& cond3 , 0 ,0, viol_0, , , delayed_CK, delayed_D1);
$setuphold(posedge CK &&& cond3 , negedge D1 &&& cond3 , 0 ,0, viol_0, , , delayed_CK, delayed_D1);
$setuphold(posedge CK &&& cond2 , posedge D1 &&& cond2 , 0 ,0, viol_0, , , delayed_CK, delayed_D1);
$setuphold(posedge CK &&& cond2 , negedge D1 &&& cond2 , 0 ,0, viol_0, , , delayed_CK, delayed_D1);
$setuphold(posedge CK &&& cond4 , posedge S &&& cond4 , 0 ,0, viol_0, , , delayed_CK, delayed_S);
$setuphold(posedge CK &&& cond4 , negedge S &&& cond4 , 0 ,0, viol_0, , , delayed_CK, delayed_S);
$setuphold(posedge CK &&& cond5 , posedge S &&& cond5 , 0 ,0, viol_0, , , delayed_CK, delayed_S);
$setuphold(posedge CK &&& cond5 , negedge S &&& cond5 , 0 ,0, viol_0, , , delayed_CK, delayed_S);
$setuphold(posedge CK &&& cond9 , posedge SE &&& cond9 , 0 ,0, viol_0, , , delayed_CK, delayed_SE);
$setuphold(posedge CK &&& cond9 , negedge SE &&& cond9 , 0 ,0, viol_0, , , delayed_CK, delayed_SE);
$setuphold(posedge CK &&& cond8 , posedge SE &&& cond8 , 0 ,0, viol_0, , , delayed_CK, delayed_SE);
$setuphold(posedge CK &&& cond8 , negedge SE &&& cond8 , 0 ,0, viol_0, , , delayed_CK, delayed_SE);
$setuphold(posedge CK &&& cond7 , posedge SE &&& cond7 , 0 ,0, viol_0, , , delayed_CK, delayed_SE);
$setuphold(posedge CK &&& cond7 , negedge SE &&& cond7 , 0 ,0, viol_0, , , delayed_CK, delayed_SE);
$setuphold(posedge CK &&& cond13 , posedge SE &&& cond13 , 0 ,0, viol_0, , , delayed_CK, delayed_SE);
$setuphold(posedge CK &&& cond13 , negedge SE &&& cond13 , 0 ,0, viol_0, , , delayed_CK, delayed_SE);
$setuphold(posedge CK &&& cond12 , posedge SE &&& cond12 , 0 ,0, viol_0, , , delayed_CK, delayed_SE);
$setuphold(posedge CK &&& cond12 , negedge SE &&& cond12 , 0 ,0, viol_0, , , delayed_CK, delayed_SE);
$setuphold(posedge CK &&& cond6 , posedge SE &&& cond6 , 0 ,0, viol_0, , , delayed_CK, delayed_SE);
$setuphold(posedge CK &&& cond6 , negedge SE &&& cond6 , 0 ,0, viol_0, , , delayed_CK, delayed_SE);
$setuphold(posedge CK &&& cond11 , posedge SE &&& cond11 , 0 ,0, viol_0, , , delayed_CK, delayed_SE);
$setuphold(posedge CK &&& cond11 , negedge SE &&& cond11 , 0 ,0, viol_0, , , delayed_CK, delayed_SE);
$setuphold(posedge CK &&& cond10 , posedge SE &&& cond10 , 0 ,0, viol_0, , , delayed_CK, delayed_SE);
$setuphold(posedge CK &&& cond10 , negedge SE &&& cond10 , 0 ,0, viol_0, , , delayed_CK, delayed_SE);
$setuphold(posedge CK &&& cond19 , posedge SI &&& cond19 , 0 ,0, viol_0, , , delayed_CK, delayed_SI);
$setuphold(posedge CK &&& cond19 , negedge SI &&& cond19 , 0 ,0, viol_0, , , delayed_CK, delayed_SI);
$setuphold(posedge CK &&& cond18 , posedge SI &&& cond18 , 0 ,0, viol_0, , , delayed_CK, delayed_SI);
$setuphold(posedge CK &&& cond18 , negedge SI &&& cond18 , 0 ,0, viol_0, , , delayed_CK, delayed_SI);
$setuphold(posedge CK &&& cond17 , posedge SI &&& cond17 , 0 ,0, viol_0, , , delayed_CK, delayed_SI);
$setuphold(posedge CK &&& cond17 , negedge SI &&& cond17 , 0 ,0, viol_0, , , delayed_CK, delayed_SI);
$setuphold(posedge CK &&& cond16 , posedge SI &&& cond16 , 0 ,0, viol_0, , , delayed_CK, delayed_SI);
$setuphold(posedge CK &&& cond16 , negedge SI &&& cond16 , 0 ,0, viol_0, , , delayed_CK, delayed_SI);
$setuphold(posedge CK &&& cond15 , posedge SI &&& cond15 , 0 ,0, viol_0, , , delayed_CK, delayed_SI);
$setuphold(posedge CK &&& cond15 , negedge SI &&& cond15 , 0 ,0, viol_0, , , delayed_CK, delayed_SI);
$setuphold(posedge CK &&& cond14 , posedge SI &&& cond14 , 0 ,0, viol_0, , , delayed_CK, delayed_SI);
$setuphold(posedge CK &&& cond14 , negedge SI &&& cond14 , 0 ,0, viol_0, , , delayed_CK, delayed_SI);
endspecify
   `endif
endmodule
`endcelldefine

//%END SVN_FSDPMQ_2

//%BEGIN SVN_FSDPMQ_4

`celldefine
module SVN_FSDPMQ_4 (Q, CK, D0, D1, S, SI, SE);
   output Q;
   input CK, D0, D1, S, SI, SE;

   reg viol_0;
   wire delayed_CK, delayed_D0, delayed_D1,
	delayed_S, delayed_SI, delayed_SE;

   wire int_res__D, int_res__S, xcr_0;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////

`ifdef _fv
   buf (delayed_CK, CK);
   buf (delayed_D0, D0);
   buf (delayed_D1, D1);
   buf (delayed_S, S);
   buf (delayed_SI, SI);
   buf (delayed_SE, SE);
`endif

   mux2 (int_res__D, delayed_D1, delayed_D0, delayed_S);
   mux2 (int_res__S, delayed_SI, int_res__D, delayed_SE);
   dff_err (xcr_0, delayed_CK, int_res__S);

   `ifdef VIRL_functiononly
      dff #`SNPS_SEQ_DELAY (Q, viol_0, delayed_CK, int_res__S, xcr_0);
   `else
      dff (Q, viol_0, delayed_CK, int_res__S, xcr_0);
   `endif

   `ifdef VIRL_functiononly

   `else

   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////
not U0 (_net_0, D1);
not U1 (_net_1, SI);
and U2 (_net_2, _net_0, D0, S, SE, _net_1);
not U3 (_net_3, SI);
and U4 (_net_4, D1, D0, SE, _net_3);
not U5 (_net_5, D1);
not U6 (_net_6, SE);
and U7 (_net_7, _net_5, D0, S, _net_6);
not U8 (_net_8, D1);
not U9 (_net_9, S);
not U10 (_net_10, SI);
and U11 (_net_11, _net_8, D0, _net_9, SE, _net_10);
not U12 (_net_12, D0);
not U13 (_net_13, SI);
and U14 (_net_14, D1, _net_12, S, SE, _net_13);
not U15 (_net_15, D0);
not U16 (_net_16, S);
not U17 (_net_17, SI);
and U18 (_net_18, D1, _net_15, _net_16, SE, _net_17);
not U19 (_net_19, D0);
not U20 (_net_20, S);
not U21 (_net_21, SE);
and U22 (_net_22, D1, _net_19, _net_20, _net_21);
not U23 (_net_23, D1);
not U24 (_net_24, D0);
not U25 (_net_25, SI);
and U26 (_net_26, _net_23, _net_24, SE, _net_25);
not U27 (_net_27, D1);
not U28 (_net_28, D0);
not U29 (_net_29, SE);
and U30 (_net_30, _net_27, _net_28, _net_29);
or U31 (cond21, _net_2, _net_4, _net_7, _net_11, _net_14, _net_18, _net_22, _net_26, _net_30);
not U32 (_net_31, SE);
and U33 (_net_32, D1, D0, _net_31);
and U34 (_net_33, D1, D0, SE, SI);
not U35 (_net_34, D1);
and U36 (_net_35, _net_34, D0, S, SE, SI);
not U37 (_net_36, D1);
not U38 (_net_37, S);
and U39 (_net_38, _net_36, D0, _net_37, SE, SI);
not U40 (_net_39, D1);
not U41 (_net_40, S);
not U42 (_net_41, SE);
and U43 (_net_42, _net_39, D0, _net_40, _net_41);
not U44 (_net_43, D0);
and U45 (_net_44, D1, _net_43, S, SE, SI);
not U46 (_net_45, D0);
not U47 (_net_46, SE);
and U48 (_net_47, D1, _net_45, S, _net_46);
not U49 (_net_48, D0);
not U50 (_net_49, S);
and U51 (_net_50, D1, _net_48, _net_49, SE, SI);
not U52 (_net_51, D1);
not U53 (_net_52, D0);
and U54 (_net_53, _net_51, _net_52, SE, SI);
or U55 (cond20, _net_32, _net_33, _net_35, _net_38, _net_42, _net_44, _net_47, _net_50, _net_53);
not U56 (_net_54, S);
not U57 (_net_55, D1);
not U58 (_net_56, SE);
and U59 (cond1, _net_54, _net_55, _net_56);
not U60 (_net_57, S);
not U61 (_net_58, SE);
and U62 (cond0, _net_57, D1, _net_58);
not U63 (_net_59, D0);
not U64 (_net_60, SE);
and U65 (cond3, S, _net_59, _net_60);
not U66 (_net_61, SE);
and U67 (cond2, S, D0, _net_61);
not U68 (_net_62, D0);
not U69 (_net_63, SE);
and U70 (cond4, D1, _net_62, _net_63);
not U71 (_net_64, D1);
not U72 (_net_65, SE);
and U73 (cond5, _net_64, D0, _net_65);
not U74 (_net_66, D1);
not U75 (_net_67, D0);
not U76 (_net_68, S);
and U77 (cond9, _net_66, _net_67, _net_68, SI);
not U78 (_net_69, D1);
not U79 (_net_70, D0);
and U80 (cond8, _net_69, _net_70, S, SI);
not U81 (_net_71, D0);
not U82 (_net_72, S);
and U83 (cond7, D1, _net_71, _net_72, SI);
not U84 (_net_73, D0);
not U85 (_net_74, SI);
and U86 (cond13, D1, _net_73, S, _net_74);
not U87 (_net_75, D1);
not U88 (_net_76, S);
not U89 (_net_77, SI);
and U90 (cond12, _net_75, D0, _net_76, _net_77);
not U91 (_net_78, D1);
and U92 (cond6, _net_78, D0, S, SI);
not U93 (_net_79, S);
not U94 (_net_80, SI);
and U95 (cond11, D1, D0, _net_79, _net_80);
not U96 (_net_81, SI);
and U97 (cond10, D1, D0, S, _net_81);
not U98 (_net_82, D1);
not U99 (_net_83, D0);
and U100 (cond19, _net_82, _net_83, SE);
not U101 (_net_84, D0);
not U102 (_net_85, S);
and U103 (cond18, D1, _net_84, _net_85, SE);
not U104 (_net_86, D0);
and U105 (cond17, D1, _net_86, S, SE);
not U106 (_net_87, D1);
not U107 (_net_88, S);
and U108 (cond16, _net_87, D0, _net_88, SE);
not U109 (_net_89, D1);
and U110 (cond15, _net_89, D0, S, SE);
and U111 (cond14, D1, D0, SE);

specify
(posedge CK => (Q : 1'b1))=(0, 0);
$width(posedge CK &&& cond21 , 0 ,0, viol_0);
$width(negedge CK &&& cond21 , 0 ,0, viol_0);
$width(posedge CK &&& cond20 , 0 ,0, viol_0);
$width(negedge CK &&& cond20 , 0 ,0, viol_0);
$setuphold(posedge CK &&& cond1 , posedge D0 &&& cond1 , 0 ,0, viol_0, , , delayed_CK, delayed_D0);
$setuphold(posedge CK &&& cond1 , negedge D0 &&& cond1 , 0 ,0, viol_0, , , delayed_CK, delayed_D0);
$setuphold(posedge CK &&& cond0 , posedge D0 &&& cond0 , 0 ,0, viol_0, , , delayed_CK, delayed_D0);
$setuphold(posedge CK &&& cond0 , negedge D0 &&& cond0 , 0 ,0, viol_0, , , delayed_CK, delayed_D0);
$setuphold(posedge CK &&& cond3 , posedge D1 &&& cond3 , 0 ,0, viol_0, , , delayed_CK, delayed_D1);
$setuphold(posedge CK &&& cond3 , negedge D1 &&& cond3 , 0 ,0, viol_0, , , delayed_CK, delayed_D1);
$setuphold(posedge CK &&& cond2 , posedge D1 &&& cond2 , 0 ,0, viol_0, , , delayed_CK, delayed_D1);
$setuphold(posedge CK &&& cond2 , negedge D1 &&& cond2 , 0 ,0, viol_0, , , delayed_CK, delayed_D1);
$setuphold(posedge CK &&& cond4 , posedge S &&& cond4 , 0 ,0, viol_0, , , delayed_CK, delayed_S);
$setuphold(posedge CK &&& cond4 , negedge S &&& cond4 , 0 ,0, viol_0, , , delayed_CK, delayed_S);
$setuphold(posedge CK &&& cond5 , posedge S &&& cond5 , 0 ,0, viol_0, , , delayed_CK, delayed_S);
$setuphold(posedge CK &&& cond5 , negedge S &&& cond5 , 0 ,0, viol_0, , , delayed_CK, delayed_S);
$setuphold(posedge CK &&& cond9 , posedge SE &&& cond9 , 0 ,0, viol_0, , , delayed_CK, delayed_SE);
$setuphold(posedge CK &&& cond9 , negedge SE &&& cond9 , 0 ,0, viol_0, , , delayed_CK, delayed_SE);
$setuphold(posedge CK &&& cond8 , posedge SE &&& cond8 , 0 ,0, viol_0, , , delayed_CK, delayed_SE);
$setuphold(posedge CK &&& cond8 , negedge SE &&& cond8 , 0 ,0, viol_0, , , delayed_CK, delayed_SE);
$setuphold(posedge CK &&& cond7 , posedge SE &&& cond7 , 0 ,0, viol_0, , , delayed_CK, delayed_SE);
$setuphold(posedge CK &&& cond7 , negedge SE &&& cond7 , 0 ,0, viol_0, , , delayed_CK, delayed_SE);
$setuphold(posedge CK &&& cond13 , posedge SE &&& cond13 , 0 ,0, viol_0, , , delayed_CK, delayed_SE);
$setuphold(posedge CK &&& cond13 , negedge SE &&& cond13 , 0 ,0, viol_0, , , delayed_CK, delayed_SE);
$setuphold(posedge CK &&& cond12 , posedge SE &&& cond12 , 0 ,0, viol_0, , , delayed_CK, delayed_SE);
$setuphold(posedge CK &&& cond12 , negedge SE &&& cond12 , 0 ,0, viol_0, , , delayed_CK, delayed_SE);
$setuphold(posedge CK &&& cond6 , posedge SE &&& cond6 , 0 ,0, viol_0, , , delayed_CK, delayed_SE);
$setuphold(posedge CK &&& cond6 , negedge SE &&& cond6 , 0 ,0, viol_0, , , delayed_CK, delayed_SE);
$setuphold(posedge CK &&& cond11 , posedge SE &&& cond11 , 0 ,0, viol_0, , , delayed_CK, delayed_SE);
$setuphold(posedge CK &&& cond11 , negedge SE &&& cond11 , 0 ,0, viol_0, , , delayed_CK, delayed_SE);
$setuphold(posedge CK &&& cond10 , posedge SE &&& cond10 , 0 ,0, viol_0, , , delayed_CK, delayed_SE);
$setuphold(posedge CK &&& cond10 , negedge SE &&& cond10 , 0 ,0, viol_0, , , delayed_CK, delayed_SE);
$setuphold(posedge CK &&& cond19 , posedge SI &&& cond19 , 0 ,0, viol_0, , , delayed_CK, delayed_SI);
$setuphold(posedge CK &&& cond19 , negedge SI &&& cond19 , 0 ,0, viol_0, , , delayed_CK, delayed_SI);
$setuphold(posedge CK &&& cond18 , posedge SI &&& cond18 , 0 ,0, viol_0, , , delayed_CK, delayed_SI);
$setuphold(posedge CK &&& cond18 , negedge SI &&& cond18 , 0 ,0, viol_0, , , delayed_CK, delayed_SI);
$setuphold(posedge CK &&& cond17 , posedge SI &&& cond17 , 0 ,0, viol_0, , , delayed_CK, delayed_SI);
$setuphold(posedge CK &&& cond17 , negedge SI &&& cond17 , 0 ,0, viol_0, , , delayed_CK, delayed_SI);
$setuphold(posedge CK &&& cond16 , posedge SI &&& cond16 , 0 ,0, viol_0, , , delayed_CK, delayed_SI);
$setuphold(posedge CK &&& cond16 , negedge SI &&& cond16 , 0 ,0, viol_0, , , delayed_CK, delayed_SI);
$setuphold(posedge CK &&& cond15 , posedge SI &&& cond15 , 0 ,0, viol_0, , , delayed_CK, delayed_SI);
$setuphold(posedge CK &&& cond15 , negedge SI &&& cond15 , 0 ,0, viol_0, , , delayed_CK, delayed_SI);
$setuphold(posedge CK &&& cond14 , posedge SI &&& cond14 , 0 ,0, viol_0, , , delayed_CK, delayed_SI);
$setuphold(posedge CK &&& cond14 , negedge SI &&& cond14 , 0 ,0, viol_0, , , delayed_CK, delayed_SI);
endspecify
   `endif
endmodule
`endcelldefine

//%END SVN_FSDPMQ_4

//%BEGIN SVN_FSDPQ_F_1

`celldefine
module SVN_FSDPQ_F_1 (Q, CK, D, SI, SE);
   output Q;
   input CK, D, SI, SE;

   reg viol_0;
   wire delayed_CK, delayed_D,
	delayed_SI, delayed_SE;

   wire int_res__D, xcr_0;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////

`ifdef _fv
   buf (delayed_CK, CK);
   buf (delayed_D, D);
   buf (delayed_SI, SI);
   buf (delayed_SE, SE);
`endif

   mux2 (int_res__D, delayed_SI, delayed_D, delayed_SE);
   dff_err (xcr_0, delayed_CK, int_res__D);

   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////

   `ifdef VIRL_functiononly
        dff #`SNPS_SEQ_DELAY (Q, viol_0, delayed_CK, int_res__D, xcr_0);
   `else
        dff (Q, viol_0, delayed_CK, int_res__D, xcr_0);
   `endif

   `ifdef VIRL_functiononly

   `else

not U0 (_net_0, D);
not U1 (_net_1, SI);
and U2 (_net_2, SE, _net_0, _net_1);
not U3 (_net_3, SI);
and U4 (_net_4, SE, D, _net_3);
not U5 (_net_5, SE);
not U6 (_net_6, D);
and U7 (_net_7, _net_5, _net_6);
or U8 (cond5, _net_2, _net_4, _net_7);
not U9 (_net_8, SE);
and U10 (_net_9, _net_8, D);
and U11 (_net_10, SE, D, SI);
not U12 (_net_11, D);
and U13 (_net_12, SE, _net_11, SI);
or U14 (cond4, _net_9, _net_10, _net_12);
not U15 (_net_13, D);
and U16 (cond0, SI, _net_13);
not U17 (_net_14, SI);
and U18 (cond1, _net_14, D);
not U19 (_net_15, D);
and U20 (cond3, SE, _net_15);
and U21 (cond2, SE, D);

specify
(posedge CK => (Q : 1'b1))=(0, 0);
$width(posedge CK &&& cond5 , 0 ,0, viol_0);
$width(negedge CK &&& cond5 , 0 ,0, viol_0);
$width(posedge CK &&& cond4 , 0 ,0, viol_0);
$width(negedge CK &&& cond4 , 0 ,0, viol_0);
$setuphold(posedge CK &&& ~SE , posedge D &&& ~SE , 0 ,0, viol_0, , , delayed_CK, delayed_D);
$setuphold(posedge CK &&& ~SE , negedge D &&& ~SE , 0 ,0, viol_0, , , delayed_CK, delayed_D);
$setuphold(posedge CK &&& cond0 , posedge SE &&& cond0 , 0 ,0, viol_0, , , delayed_CK, delayed_SE);
$setuphold(posedge CK &&& cond0 , negedge SE &&& cond0 , 0 ,0, viol_0, , , delayed_CK, delayed_SE);
$setuphold(posedge CK &&& cond1 , posedge SE &&& cond1 , 0 ,0, viol_0, , , delayed_CK, delayed_SE);
$setuphold(posedge CK &&& cond1 , negedge SE &&& cond1 , 0 ,0, viol_0, , , delayed_CK, delayed_SE);
$setuphold(posedge CK &&& cond3 , posedge SI &&& cond3 , 0 ,0, viol_0, , , delayed_CK, delayed_SI);
$setuphold(posedge CK &&& cond3 , negedge SI &&& cond3 , 0 ,0, viol_0, , , delayed_CK, delayed_SI);
$setuphold(posedge CK &&& cond2 , posedge SI &&& cond2 , 0 ,0, viol_0, , , delayed_CK, delayed_SI);
$setuphold(posedge CK &&& cond2 , negedge SI &&& cond2 , 0 ,0, viol_0, , , delayed_CK, delayed_SI);
endspecify
   `endif

endmodule
`endcelldefine

//%END SVN_FSDPQ_F_1

//%BEGIN SVN_FSDPQ_F_2

`celldefine
module SVN_FSDPQ_F_2 (Q, CK, D, SI, SE);
   output Q;
   input CK, D, SI, SE;

   reg viol_0;
   wire delayed_CK, delayed_D,
	delayed_SI, delayed_SE;

   wire int_res__D, xcr_0;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////

`ifdef _fv
   buf (delayed_CK, CK);
   buf (delayed_D, D);
   buf (delayed_SI, SI);
   buf (delayed_SE, SE);
`endif

   mux2 (int_res__D, delayed_SI, delayed_D, delayed_SE);
   dff_err (xcr_0, delayed_CK, int_res__D);

   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////

   `ifdef VIRL_functiononly
        dff #`SNPS_SEQ_DELAY (Q, viol_0, delayed_CK, int_res__D, xcr_0);
   `else
        dff (Q, viol_0, delayed_CK, int_res__D, xcr_0);
   `endif

   `ifdef VIRL_functiononly

   `else

not U0 (_net_0, D);
not U1 (_net_1, SI);
and U2 (_net_2, SE, _net_0, _net_1);
not U3 (_net_3, SI);
and U4 (_net_4, SE, D, _net_3);
not U5 (_net_5, SE);
not U6 (_net_6, D);
and U7 (_net_7, _net_5, _net_6);
or U8 (cond5, _net_2, _net_4, _net_7);
not U9 (_net_8, SE);
and U10 (_net_9, _net_8, D);
and U11 (_net_10, SE, D, SI);
not U12 (_net_11, D);
and U13 (_net_12, SE, _net_11, SI);
or U14 (cond4, _net_9, _net_10, _net_12);
not U15 (_net_13, D);
and U16 (cond0, SI, _net_13);
not U17 (_net_14, SI);
and U18 (cond1, _net_14, D);
not U19 (_net_15, D);
and U20 (cond3, SE, _net_15);
and U21 (cond2, SE, D);

specify
(posedge CK => (Q : 1'b1))=(0, 0);
$width(posedge CK &&& cond5 , 0 ,0, viol_0);
$width(negedge CK &&& cond5 , 0 ,0, viol_0);
$width(posedge CK &&& cond4 , 0 ,0, viol_0);
$width(negedge CK &&& cond4 , 0 ,0, viol_0);
$setuphold(posedge CK &&& ~SE , posedge D &&& ~SE , 0 ,0, viol_0, , , delayed_CK, delayed_D);
$setuphold(posedge CK &&& ~SE , negedge D &&& ~SE , 0 ,0, viol_0, , , delayed_CK, delayed_D);
$setuphold(posedge CK &&& cond0 , posedge SE &&& cond0 , 0 ,0, viol_0, , , delayed_CK, delayed_SE);
$setuphold(posedge CK &&& cond0 , negedge SE &&& cond0 , 0 ,0, viol_0, , , delayed_CK, delayed_SE);
$setuphold(posedge CK &&& cond1 , posedge SE &&& cond1 , 0 ,0, viol_0, , , delayed_CK, delayed_SE);
$setuphold(posedge CK &&& cond1 , negedge SE &&& cond1 , 0 ,0, viol_0, , , delayed_CK, delayed_SE);
$setuphold(posedge CK &&& cond3 , posedge SI &&& cond3 , 0 ,0, viol_0, , , delayed_CK, delayed_SI);
$setuphold(posedge CK &&& cond3 , negedge SI &&& cond3 , 0 ,0, viol_0, , , delayed_CK, delayed_SI);
$setuphold(posedge CK &&& cond2 , posedge SI &&& cond2 , 0 ,0, viol_0, , , delayed_CK, delayed_SI);
$setuphold(posedge CK &&& cond2 , negedge SI &&& cond2 , 0 ,0, viol_0, , , delayed_CK, delayed_SI);
endspecify
   `endif

endmodule
`endcelldefine

//%END SVN_FSDPQ_F_2

//%BEGIN SVN_FSDPQ_F_4

`celldefine
module SVN_FSDPQ_F_4 (Q, CK, D, SI, SE);
   output Q;
   input CK, D, SI, SE;

   reg viol_0;
   wire delayed_CK, delayed_D,
	delayed_SI, delayed_SE;

   wire int_res__D, xcr_0;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////

`ifdef _fv
   buf (delayed_CK, CK);
   buf (delayed_D, D);
   buf (delayed_SI, SI);
   buf (delayed_SE, SE);
`endif

   mux2 (int_res__D, delayed_SI, delayed_D, delayed_SE);
   dff_err (xcr_0, delayed_CK, int_res__D);

   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////

   `ifdef VIRL_functiononly
        dff #`SNPS_SEQ_DELAY (Q, viol_0, delayed_CK, int_res__D, xcr_0);
   `else
        dff (Q, viol_0, delayed_CK, int_res__D, xcr_0);
   `endif

   `ifdef VIRL_functiononly

   `else

not U0 (_net_0, D);
not U1 (_net_1, SI);
and U2 (_net_2, SE, _net_0, _net_1);
not U3 (_net_3, SI);
and U4 (_net_4, SE, D, _net_3);
not U5 (_net_5, SE);
not U6 (_net_6, D);
and U7 (_net_7, _net_5, _net_6);
or U8 (cond5, _net_2, _net_4, _net_7);
not U9 (_net_8, SE);
and U10 (_net_9, _net_8, D);
and U11 (_net_10, SE, D, SI);
not U12 (_net_11, D);
and U13 (_net_12, SE, _net_11, SI);
or U14 (cond4, _net_9, _net_10, _net_12);
not U15 (_net_13, D);
and U16 (cond0, SI, _net_13);
not U17 (_net_14, SI);
and U18 (cond1, _net_14, D);
not U19 (_net_15, D);
and U20 (cond3, SE, _net_15);
and U21 (cond2, SE, D);

specify
(posedge CK => (Q : 1'b1))=(0, 0);
$width(posedge CK &&& cond5 , 0 ,0, viol_0);
$width(negedge CK &&& cond5 , 0 ,0, viol_0);
$width(posedge CK &&& cond4 , 0 ,0, viol_0);
$width(negedge CK &&& cond4 , 0 ,0, viol_0);
$setuphold(posedge CK &&& ~SE , posedge D &&& ~SE , 0 ,0, viol_0, , , delayed_CK, delayed_D);
$setuphold(posedge CK &&& ~SE , negedge D &&& ~SE , 0 ,0, viol_0, , , delayed_CK, delayed_D);
$setuphold(posedge CK &&& cond0 , posedge SE &&& cond0 , 0 ,0, viol_0, , , delayed_CK, delayed_SE);
$setuphold(posedge CK &&& cond0 , negedge SE &&& cond0 , 0 ,0, viol_0, , , delayed_CK, delayed_SE);
$setuphold(posedge CK &&& cond1 , posedge SE &&& cond1 , 0 ,0, viol_0, , , delayed_CK, delayed_SE);
$setuphold(posedge CK &&& cond1 , negedge SE &&& cond1 , 0 ,0, viol_0, , , delayed_CK, delayed_SE);
$setuphold(posedge CK &&& cond3 , posedge SI &&& cond3 , 0 ,0, viol_0, , , delayed_CK, delayed_SI);
$setuphold(posedge CK &&& cond3 , negedge SI &&& cond3 , 0 ,0, viol_0, , , delayed_CK, delayed_SI);
$setuphold(posedge CK &&& cond2 , posedge SI &&& cond2 , 0 ,0, viol_0, , , delayed_CK, delayed_SI);
$setuphold(posedge CK &&& cond2 , negedge SI &&& cond2 , 0 ,0, viol_0, , , delayed_CK, delayed_SI);
endspecify
   `endif

endmodule
`endcelldefine

//%END SVN_FSDPQ_F_4

//%BEGIN SVN_FSDPQ_0P5

`celldefine
module SVN_FSDPQ_0P5 (Q, CK, D, SI, SE);
   output Q;
   input CK, D, SI, SE;

   reg viol_0;
   wire delayed_CK, delayed_D,
	delayed_SI, delayed_SE;

   wire int_res__D, xcr_0;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////

`ifdef _fv
   buf (delayed_CK, CK);
   buf (delayed_D, D);
   buf (delayed_SI, SI);
   buf (delayed_SE, SE);
`endif

   mux2 (int_res__D, delayed_SI, delayed_D, delayed_SE);
   dff_err (xcr_0, delayed_CK, int_res__D);

   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////

   `ifdef VIRL_functiononly
        dff #`SNPS_SEQ_DELAY (Q, viol_0, delayed_CK, int_res__D, xcr_0);
   `else
        dff (Q, viol_0, delayed_CK, int_res__D, xcr_0);
   `endif

   `ifdef VIRL_functiononly

   `else

not U0 (_net_0, D);
not U1 (_net_1, SI);
and U2 (_net_2, SE, _net_0, _net_1);
not U3 (_net_3, SI);
and U4 (_net_4, SE, D, _net_3);
not U5 (_net_5, SE);
not U6 (_net_6, D);
and U7 (_net_7, _net_5, _net_6);
or U8 (cond5, _net_2, _net_4, _net_7);
not U9 (_net_8, SE);
and U10 (_net_9, _net_8, D);
and U11 (_net_10, SE, D, SI);
not U12 (_net_11, D);
and U13 (_net_12, SE, _net_11, SI);
or U14 (cond4, _net_9, _net_10, _net_12);
not U15 (_net_13, D);
and U16 (cond0, SI, _net_13);
not U17 (_net_14, SI);
and U18 (cond1, _net_14, D);
not U19 (_net_15, D);
and U20 (cond3, SE, _net_15);
and U21 (cond2, SE, D);

specify
(posedge CK => (Q : 1'b1))=(0, 0);
$width(posedge CK &&& cond5 , 0 ,0, viol_0);
$width(negedge CK &&& cond5 , 0 ,0, viol_0);
$width(posedge CK &&& cond4 , 0 ,0, viol_0);
$width(negedge CK &&& cond4 , 0 ,0, viol_0);
$setuphold(posedge CK &&& ~SE , posedge D &&& ~SE , 0 ,0, viol_0, , , delayed_CK, delayed_D);
$setuphold(posedge CK &&& ~SE , negedge D &&& ~SE , 0 ,0, viol_0, , , delayed_CK, delayed_D);
$setuphold(posedge CK &&& cond0 , posedge SE &&& cond0 , 0 ,0, viol_0, , , delayed_CK, delayed_SE);
$setuphold(posedge CK &&& cond0 , negedge SE &&& cond0 , 0 ,0, viol_0, , , delayed_CK, delayed_SE);
$setuphold(posedge CK &&& cond1 , posedge SE &&& cond1 , 0 ,0, viol_0, , , delayed_CK, delayed_SE);
$setuphold(posedge CK &&& cond1 , negedge SE &&& cond1 , 0 ,0, viol_0, , , delayed_CK, delayed_SE);
$setuphold(posedge CK &&& cond3 , posedge SI &&& cond3 , 0 ,0, viol_0, , , delayed_CK, delayed_SI);
$setuphold(posedge CK &&& cond3 , negedge SI &&& cond3 , 0 ,0, viol_0, , , delayed_CK, delayed_SI);
$setuphold(posedge CK &&& cond2 , posedge SI &&& cond2 , 0 ,0, viol_0, , , delayed_CK, delayed_SI);
$setuphold(posedge CK &&& cond2 , negedge SI &&& cond2 , 0 ,0, viol_0, , , delayed_CK, delayed_SI);
endspecify
   `endif

endmodule
`endcelldefine

//%END SVN_FSDPQ_0P5

//%BEGIN SVN_FSDPQ_1

`celldefine
module SVN_FSDPQ_1 (Q, CK, D, SI, SE);
   output Q;
   input CK, D, SI, SE;

   reg viol_0;
   wire delayed_CK, delayed_D,
	delayed_SI, delayed_SE;

   wire int_res__D, xcr_0;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////

`ifdef _fv
   buf (delayed_CK, CK);
   buf (delayed_D, D);
   buf (delayed_SI, SI);
   buf (delayed_SE, SE);
`endif

   mux2 (int_res__D, delayed_SI, delayed_D, delayed_SE);
   dff_err (xcr_0, delayed_CK, int_res__D);

   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////

   `ifdef VIRL_functiononly
        dff #`SNPS_SEQ_DELAY (Q, viol_0, delayed_CK, int_res__D, xcr_0);
   `else
        dff (Q, viol_0, delayed_CK, int_res__D, xcr_0);
   `endif

   `ifdef VIRL_functiononly

   `else

not U0 (_net_0, D);
not U1 (_net_1, SI);
and U2 (_net_2, SE, _net_0, _net_1);
not U3 (_net_3, SI);
and U4 (_net_4, SE, D, _net_3);
not U5 (_net_5, SE);
not U6 (_net_6, D);
and U7 (_net_7, _net_5, _net_6);
or U8 (cond5, _net_2, _net_4, _net_7);
not U9 (_net_8, SE);
and U10 (_net_9, _net_8, D);
and U11 (_net_10, SE, D, SI);
not U12 (_net_11, D);
and U13 (_net_12, SE, _net_11, SI);
or U14 (cond4, _net_9, _net_10, _net_12);
not U15 (_net_13, D);
and U16 (cond0, SI, _net_13);
not U17 (_net_14, SI);
and U18 (cond1, _net_14, D);
not U19 (_net_15, D);
and U20 (cond3, SE, _net_15);
and U21 (cond2, SE, D);

specify
(posedge CK => (Q : 1'b1))=(0, 0);
$width(posedge CK &&& cond5 , 0 ,0, viol_0);
$width(negedge CK &&& cond5 , 0 ,0, viol_0);
$width(posedge CK &&& cond4 , 0 ,0, viol_0);
$width(negedge CK &&& cond4 , 0 ,0, viol_0);
$setuphold(posedge CK &&& ~SE , posedge D &&& ~SE , 0 ,0, viol_0, , , delayed_CK, delayed_D);
$setuphold(posedge CK &&& ~SE , negedge D &&& ~SE , 0 ,0, viol_0, , , delayed_CK, delayed_D);
$setuphold(posedge CK &&& cond0 , posedge SE &&& cond0 , 0 ,0, viol_0, , , delayed_CK, delayed_SE);
$setuphold(posedge CK &&& cond0 , negedge SE &&& cond0 , 0 ,0, viol_0, , , delayed_CK, delayed_SE);
$setuphold(posedge CK &&& cond1 , posedge SE &&& cond1 , 0 ,0, viol_0, , , delayed_CK, delayed_SE);
$setuphold(posedge CK &&& cond1 , negedge SE &&& cond1 , 0 ,0, viol_0, , , delayed_CK, delayed_SE);
$setuphold(posedge CK &&& cond3 , posedge SI &&& cond3 , 0 ,0, viol_0, , , delayed_CK, delayed_SI);
$setuphold(posedge CK &&& cond3 , negedge SI &&& cond3 , 0 ,0, viol_0, , , delayed_CK, delayed_SI);
$setuphold(posedge CK &&& cond2 , posedge SI &&& cond2 , 0 ,0, viol_0, , , delayed_CK, delayed_SI);
$setuphold(posedge CK &&& cond2 , negedge SI &&& cond2 , 0 ,0, viol_0, , , delayed_CK, delayed_SI);
endspecify
   `endif

endmodule
`endcelldefine

//%END SVN_FSDPQ_1

//%BEGIN SVN_FSDPQ_2

`celldefine
module SVN_FSDPQ_2 (Q, CK, D, SI, SE);
   output Q;
   input CK, D, SI, SE;

   reg viol_0;
   wire delayed_CK, delayed_D,
	delayed_SI, delayed_SE;

   wire int_res__D, xcr_0;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////

`ifdef _fv
   buf (delayed_CK, CK);
   buf (delayed_D, D);
   buf (delayed_SI, SI);
   buf (delayed_SE, SE);
`endif

   mux2 (int_res__D, delayed_SI, delayed_D, delayed_SE);
   dff_err (xcr_0, delayed_CK, int_res__D);

   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////

   `ifdef VIRL_functiononly
        dff #`SNPS_SEQ_DELAY (Q, viol_0, delayed_CK, int_res__D, xcr_0);
   `else
        dff (Q, viol_0, delayed_CK, int_res__D, xcr_0);
   `endif

   `ifdef VIRL_functiononly

   `else

not U0 (_net_0, D);
not U1 (_net_1, SI);
and U2 (_net_2, SE, _net_0, _net_1);
not U3 (_net_3, SI);
and U4 (_net_4, SE, D, _net_3);
not U5 (_net_5, SE);
not U6 (_net_6, D);
and U7 (_net_7, _net_5, _net_6);
or U8 (cond5, _net_2, _net_4, _net_7);
not U9 (_net_8, SE);
and U10 (_net_9, _net_8, D);
and U11 (_net_10, SE, D, SI);
not U12 (_net_11, D);
and U13 (_net_12, SE, _net_11, SI);
or U14 (cond4, _net_9, _net_10, _net_12);
not U15 (_net_13, D);
and U16 (cond0, SI, _net_13);
not U17 (_net_14, SI);
and U18 (cond1, _net_14, D);
not U19 (_net_15, D);
and U20 (cond3, SE, _net_15);
and U21 (cond2, SE, D);

specify
(posedge CK => (Q : 1'b1))=(0, 0);
$width(posedge CK &&& cond5 , 0 ,0, viol_0);
$width(negedge CK &&& cond5 , 0 ,0, viol_0);
$width(posedge CK &&& cond4 , 0 ,0, viol_0);
$width(negedge CK &&& cond4 , 0 ,0, viol_0);
$setuphold(posedge CK &&& ~SE , posedge D &&& ~SE , 0 ,0, viol_0, , , delayed_CK, delayed_D);
$setuphold(posedge CK &&& ~SE , negedge D &&& ~SE , 0 ,0, viol_0, , , delayed_CK, delayed_D);
$setuphold(posedge CK &&& cond0 , posedge SE &&& cond0 , 0 ,0, viol_0, , , delayed_CK, delayed_SE);
$setuphold(posedge CK &&& cond0 , negedge SE &&& cond0 , 0 ,0, viol_0, , , delayed_CK, delayed_SE);
$setuphold(posedge CK &&& cond1 , posedge SE &&& cond1 , 0 ,0, viol_0, , , delayed_CK, delayed_SE);
$setuphold(posedge CK &&& cond1 , negedge SE &&& cond1 , 0 ,0, viol_0, , , delayed_CK, delayed_SE);
$setuphold(posedge CK &&& cond3 , posedge SI &&& cond3 , 0 ,0, viol_0, , , delayed_CK, delayed_SI);
$setuphold(posedge CK &&& cond3 , negedge SI &&& cond3 , 0 ,0, viol_0, , , delayed_CK, delayed_SI);
$setuphold(posedge CK &&& cond2 , posedge SI &&& cond2 , 0 ,0, viol_0, , , delayed_CK, delayed_SI);
$setuphold(posedge CK &&& cond2 , negedge SI &&& cond2 , 0 ,0, viol_0, , , delayed_CK, delayed_SI);
endspecify
   `endif

endmodule
`endcelldefine

//%END SVN_FSDPQ_2

//%BEGIN SVN_FSDPQ_4

`celldefine
module SVN_FSDPQ_4 (Q, CK, D, SI, SE);
   output Q;
   input CK, D, SI, SE;

   reg viol_0;
   wire delayed_CK, delayed_D,
	delayed_SI, delayed_SE;

   wire int_res__D, xcr_0;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////

`ifdef _fv
   buf (delayed_CK, CK);
   buf (delayed_D, D);
   buf (delayed_SI, SI);
   buf (delayed_SE, SE);
`endif

   mux2 (int_res__D, delayed_SI, delayed_D, delayed_SE);
   dff_err (xcr_0, delayed_CK, int_res__D);

   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////

   `ifdef VIRL_functiononly
        dff #`SNPS_SEQ_DELAY (Q, viol_0, delayed_CK, int_res__D, xcr_0);
   `else
        dff (Q, viol_0, delayed_CK, int_res__D, xcr_0);
   `endif

   `ifdef VIRL_functiononly

   `else

not U0 (_net_0, D);
not U1 (_net_1, SI);
and U2 (_net_2, SE, _net_0, _net_1);
not U3 (_net_3, SI);
and U4 (_net_4, SE, D, _net_3);
not U5 (_net_5, SE);
not U6 (_net_6, D);
and U7 (_net_7, _net_5, _net_6);
or U8 (cond5, _net_2, _net_4, _net_7);
not U9 (_net_8, SE);
and U10 (_net_9, _net_8, D);
and U11 (_net_10, SE, D, SI);
not U12 (_net_11, D);
and U13 (_net_12, SE, _net_11, SI);
or U14 (cond4, _net_9, _net_10, _net_12);
not U15 (_net_13, D);
and U16 (cond0, SI, _net_13);
not U17 (_net_14, SI);
and U18 (cond1, _net_14, D);
not U19 (_net_15, D);
and U20 (cond3, SE, _net_15);
and U21 (cond2, SE, D);

specify
(posedge CK => (Q : 1'b1))=(0, 0);
$width(posedge CK &&& cond5 , 0 ,0, viol_0);
$width(negedge CK &&& cond5 , 0 ,0, viol_0);
$width(posedge CK &&& cond4 , 0 ,0, viol_0);
$width(negedge CK &&& cond4 , 0 ,0, viol_0);
$setuphold(posedge CK &&& ~SE , posedge D &&& ~SE , 0 ,0, viol_0, , , delayed_CK, delayed_D);
$setuphold(posedge CK &&& ~SE , negedge D &&& ~SE , 0 ,0, viol_0, , , delayed_CK, delayed_D);
$setuphold(posedge CK &&& cond0 , posedge SE &&& cond0 , 0 ,0, viol_0, , , delayed_CK, delayed_SE);
$setuphold(posedge CK &&& cond0 , negedge SE &&& cond0 , 0 ,0, viol_0, , , delayed_CK, delayed_SE);
$setuphold(posedge CK &&& cond1 , posedge SE &&& cond1 , 0 ,0, viol_0, , , delayed_CK, delayed_SE);
$setuphold(posedge CK &&& cond1 , negedge SE &&& cond1 , 0 ,0, viol_0, , , delayed_CK, delayed_SE);
$setuphold(posedge CK &&& cond3 , posedge SI &&& cond3 , 0 ,0, viol_0, , , delayed_CK, delayed_SI);
$setuphold(posedge CK &&& cond3 , negedge SI &&& cond3 , 0 ,0, viol_0, , , delayed_CK, delayed_SI);
$setuphold(posedge CK &&& cond2 , posedge SI &&& cond2 , 0 ,0, viol_0, , , delayed_CK, delayed_SI);
$setuphold(posedge CK &&& cond2 , negedge SI &&& cond2 , 0 ,0, viol_0, , , delayed_CK, delayed_SI);
endspecify
   `endif

endmodule
`endcelldefine

//%END SVN_FSDPQ_4

//%BEGIN SVN_FSDPQB_F_1

`celldefine
module SVN_FSDPQB_F_1 (QN, CK, D, SI, SE);
   output QN;
   input CK, D, SI, SE;

   reg viol_0;
   wire delayed_CK, delayed_D, 
	delayed_SI, delayed_SE;

   wire int_res__D, int_res_iq, xcr_0;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////

`ifdef _fv
   buf (delayed_CK, CK);
   buf (delayed_D, D);
   buf (delayed_SI, SI);
   buf (delayed_SE, SE);
`endif

   mux2 (int_res__D, delayed_SI, delayed_D, delayed_SE);
   dff_err (xcr_0, delayed_CK, int_res__D);
   dff (int_res_iq, viol_0, delayed_CK, int_res__D, xcr_0);

   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////

   `ifdef VIRL_functiononly
        not #`SNPS_SEQ_DELAY (QN, int_res_iq);
   `else
        not (QN, int_res_iq);
   `endif

   `ifdef VIRL_functiononly

   `else

not U0 (_net_0, D);
not U1 (_net_1, SI);
and U2 (_net_2, SE, _net_0, _net_1);
not U3 (_net_3, SI);
and U4 (_net_4, SE, D, _net_3);
not U5 (_net_5, SE);
not U6 (_net_6, D);
and U7 (_net_7, _net_5, _net_6);
or U8 (cond4, _net_2, _net_4, _net_7);
not U9 (_net_8, SE);
and U10 (_net_9, _net_8, D);
and U11 (_net_10, SE, D, SI);
not U12 (_net_11, D);
and U13 (_net_12, SE, _net_11, SI);
or U14 (cond5, _net_9, _net_10, _net_12);
not U15 (_net_13, D);
and U16 (cond1, SI, _net_13);
not U17 (_net_14, SI);
and U18 (cond0, _net_14, D);
not U19 (_net_15, D);
and U20 (cond3, SE, _net_15);
and U21 (cond2, SE, D);

specify
(posedge CK => (QN : 1'b1))=(0, 0);
$width(posedge CK &&& cond4 , 0 ,0, viol_0);
$width(negedge CK &&& cond4 , 0 ,0, viol_0);
$width(posedge CK &&& cond5 , 0 ,0, viol_0);
$width(negedge CK &&& cond5 , 0 ,0, viol_0);
$setuphold(posedge CK &&& ~SE , posedge D &&& ~SE , 0 ,0, viol_0, , , delayed_CK, delayed_D);
$setuphold(posedge CK &&& ~SE , negedge D &&& ~SE , 0 ,0, viol_0, , , delayed_CK, delayed_D);
$setuphold(posedge CK &&& cond1 , posedge SE &&& cond1 , 0 ,0, viol_0, , , delayed_CK, delayed_SE);
$setuphold(posedge CK &&& cond1 , negedge SE &&& cond1 , 0 ,0, viol_0, , , delayed_CK, delayed_SE);
$setuphold(posedge CK &&& cond0 , posedge SE &&& cond0 , 0 ,0, viol_0, , , delayed_CK, delayed_SE);
$setuphold(posedge CK &&& cond0 , negedge SE &&& cond0 , 0 ,0, viol_0, , , delayed_CK, delayed_SE);
$setuphold(posedge CK &&& cond3 , posedge SI &&& cond3 , 0 ,0, viol_0, , , delayed_CK, delayed_SI);
$setuphold(posedge CK &&& cond3 , negedge SI &&& cond3 , 0 ,0, viol_0, , , delayed_CK, delayed_SI);
$setuphold(posedge CK &&& cond2 , posedge SI &&& cond2 , 0 ,0, viol_0, , , delayed_CK, delayed_SI);
$setuphold(posedge CK &&& cond2 , negedge SI &&& cond2 , 0 ,0, viol_0, , , delayed_CK, delayed_SI);
endspecify
   `endif

endmodule
`endcelldefine

//%END SVN_FSDPQB_F_1

//%BEGIN SVN_FSDPQB_F_2

`celldefine
module SVN_FSDPQB_F_2 (QN, CK, D, SI, SE);
   output QN;
   input CK, D, SI, SE;

   reg viol_0;
   wire delayed_CK, delayed_D, 
	delayed_SI, delayed_SE;

   wire int_res__D, int_res_iq, xcr_0;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////

`ifdef _fv
   buf (delayed_CK, CK);
   buf (delayed_D, D);
   buf (delayed_SI, SI);
   buf (delayed_SE, SE);
`endif

   mux2 (int_res__D, delayed_SI, delayed_D, delayed_SE);
   dff_err (xcr_0, delayed_CK, int_res__D);
   dff (int_res_iq, viol_0, delayed_CK, int_res__D, xcr_0);

   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////

   `ifdef VIRL_functiononly
        not #`SNPS_SEQ_DELAY (QN, int_res_iq);
   `else
        not (QN, int_res_iq);
   `endif

   `ifdef VIRL_functiononly

   `else

not U0 (_net_0, D);
not U1 (_net_1, SI);
and U2 (_net_2, SE, _net_0, _net_1);
not U3 (_net_3, SI);
and U4 (_net_4, SE, D, _net_3);
not U5 (_net_5, SE);
not U6 (_net_6, D);
and U7 (_net_7, _net_5, _net_6);
or U8 (cond4, _net_2, _net_4, _net_7);
not U9 (_net_8, SE);
and U10 (_net_9, _net_8, D);
and U11 (_net_10, SE, D, SI);
not U12 (_net_11, D);
and U13 (_net_12, SE, _net_11, SI);
or U14 (cond5, _net_9, _net_10, _net_12);
not U15 (_net_13, D);
and U16 (cond1, SI, _net_13);
not U17 (_net_14, SI);
and U18 (cond0, _net_14, D);
not U19 (_net_15, D);
and U20 (cond3, SE, _net_15);
and U21 (cond2, SE, D);

specify
(posedge CK => (QN : 1'b1))=(0, 0);
$width(posedge CK &&& cond4 , 0 ,0, viol_0);
$width(negedge CK &&& cond4 , 0 ,0, viol_0);
$width(posedge CK &&& cond5 , 0 ,0, viol_0);
$width(negedge CK &&& cond5 , 0 ,0, viol_0);
$setuphold(posedge CK &&& ~SE , posedge D &&& ~SE , 0 ,0, viol_0, , , delayed_CK, delayed_D);
$setuphold(posedge CK &&& ~SE , negedge D &&& ~SE , 0 ,0, viol_0, , , delayed_CK, delayed_D);
$setuphold(posedge CK &&& cond1 , posedge SE &&& cond1 , 0 ,0, viol_0, , , delayed_CK, delayed_SE);
$setuphold(posedge CK &&& cond1 , negedge SE &&& cond1 , 0 ,0, viol_0, , , delayed_CK, delayed_SE);
$setuphold(posedge CK &&& cond0 , posedge SE &&& cond0 , 0 ,0, viol_0, , , delayed_CK, delayed_SE);
$setuphold(posedge CK &&& cond0 , negedge SE &&& cond0 , 0 ,0, viol_0, , , delayed_CK, delayed_SE);
$setuphold(posedge CK &&& cond3 , posedge SI &&& cond3 , 0 ,0, viol_0, , , delayed_CK, delayed_SI);
$setuphold(posedge CK &&& cond3 , negedge SI &&& cond3 , 0 ,0, viol_0, , , delayed_CK, delayed_SI);
$setuphold(posedge CK &&& cond2 , posedge SI &&& cond2 , 0 ,0, viol_0, , , delayed_CK, delayed_SI);
$setuphold(posedge CK &&& cond2 , negedge SI &&& cond2 , 0 ,0, viol_0, , , delayed_CK, delayed_SI);
endspecify
   `endif

endmodule
`endcelldefine

//%END SVN_FSDPQB_F_2

//%BEGIN SVN_FSDPQB_F_4

`celldefine
module SVN_FSDPQB_F_4 (QN, CK, D, SI, SE);
   output QN;
   input CK, D, SI, SE;

   reg viol_0;
   wire delayed_CK, delayed_D, 
	delayed_SI, delayed_SE;

   wire int_res__D, int_res_iq, xcr_0;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////

`ifdef _fv
   buf (delayed_CK, CK);
   buf (delayed_D, D);
   buf (delayed_SI, SI);
   buf (delayed_SE, SE);
`endif

   mux2 (int_res__D, delayed_SI, delayed_D, delayed_SE);
   dff_err (xcr_0, delayed_CK, int_res__D);
   dff (int_res_iq, viol_0, delayed_CK, int_res__D, xcr_0);

   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////

   `ifdef VIRL_functiononly
        not #`SNPS_SEQ_DELAY (QN, int_res_iq);
   `else
        not (QN, int_res_iq);
   `endif

   `ifdef VIRL_functiononly

   `else

not U0 (_net_0, D);
not U1 (_net_1, SI);
and U2 (_net_2, SE, _net_0, _net_1);
not U3 (_net_3, SI);
and U4 (_net_4, SE, D, _net_3);
not U5 (_net_5, SE);
not U6 (_net_6, D);
and U7 (_net_7, _net_5, _net_6);
or U8 (cond4, _net_2, _net_4, _net_7);
not U9 (_net_8, SE);
and U10 (_net_9, _net_8, D);
and U11 (_net_10, SE, D, SI);
not U12 (_net_11, D);
and U13 (_net_12, SE, _net_11, SI);
or U14 (cond5, _net_9, _net_10, _net_12);
not U15 (_net_13, D);
and U16 (cond1, SI, _net_13);
not U17 (_net_14, SI);
and U18 (cond0, _net_14, D);
not U19 (_net_15, D);
and U20 (cond3, SE, _net_15);
and U21 (cond2, SE, D);

specify
(posedge CK => (QN : 1'b1))=(0, 0);
$width(posedge CK &&& cond4 , 0 ,0, viol_0);
$width(negedge CK &&& cond4 , 0 ,0, viol_0);
$width(posedge CK &&& cond5 , 0 ,0, viol_0);
$width(negedge CK &&& cond5 , 0 ,0, viol_0);
$setuphold(posedge CK &&& ~SE , posedge D &&& ~SE , 0 ,0, viol_0, , , delayed_CK, delayed_D);
$setuphold(posedge CK &&& ~SE , negedge D &&& ~SE , 0 ,0, viol_0, , , delayed_CK, delayed_D);
$setuphold(posedge CK &&& cond1 , posedge SE &&& cond1 , 0 ,0, viol_0, , , delayed_CK, delayed_SE);
$setuphold(posedge CK &&& cond1 , negedge SE &&& cond1 , 0 ,0, viol_0, , , delayed_CK, delayed_SE);
$setuphold(posedge CK &&& cond0 , posedge SE &&& cond0 , 0 ,0, viol_0, , , delayed_CK, delayed_SE);
$setuphold(posedge CK &&& cond0 , negedge SE &&& cond0 , 0 ,0, viol_0, , , delayed_CK, delayed_SE);
$setuphold(posedge CK &&& cond3 , posedge SI &&& cond3 , 0 ,0, viol_0, , , delayed_CK, delayed_SI);
$setuphold(posedge CK &&& cond3 , negedge SI &&& cond3 , 0 ,0, viol_0, , , delayed_CK, delayed_SI);
$setuphold(posedge CK &&& cond2 , posedge SI &&& cond2 , 0 ,0, viol_0, , , delayed_CK, delayed_SI);
$setuphold(posedge CK &&& cond2 , negedge SI &&& cond2 , 0 ,0, viol_0, , , delayed_CK, delayed_SI);
endspecify
   `endif

endmodule
`endcelldefine

//%END SVN_FSDPQB_F_4

//%BEGIN SVN_FSDPRB_1

`celldefine
module SVN_FSDPRB_1 (Q, QN, CK, D, SI, SE, RD);
   output Q, QN;
   input CK, D, SI, SE, RD;

   reg viol_0;
   wire delayed_CK, delayed_D, delayed_SI,
	delayed_SE, delayed_RD;

   wire int_res__D, int_res__RD, int_res_iq, xcr_0;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////

`ifdef _fv
   buf (delayed_CK, CK);
   buf (delayed_D, D);
   buf (delayed_SI, SI);
   buf (delayed_SE, SE);
`endif
   buf (delayed_RD, RD);

   mux2 (int_res__D, delayed_SI, delayed_D, delayed_SE);
   not (int_res__RD, delayed_RD);
   dff_r_err (xcr_0, delayed_CK, int_res__D, int_res__RD);
   dff_r (int_res_iq, viol_0, delayed_CK, int_res__D, int_res__RD, xcr_0);

   `ifdef VIRL_functiononly 
   buf #`SNPS_SEQ_DELAY (Q, int_res_iq);
   not #`SNPS_SEQ_DELAY (QN, int_res_iq);
   `else
   buf (Q, int_res_iq);
   not (QN, int_res_iq);
   `endif

   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////
   `ifdef VIRL_functiononly

   `else

not U0 (_net_0, D);
not U1 (_net_1, SE);
not U2 (_net_2, SI);
and U3 (ENABLE_NOT_D_AND_RD_AND_NOT_SE_AND_NOT_SI, RD, _net_0, _net_1, _net_2);
not U4 (_net_3, D);
not U5 (_net_4, SE);
and U6 (ENABLE_NOT_D_AND_RD_AND_NOT_SE_AND_SI, RD, _net_3, _net_4, SI);
not U7 (_net_5, D);
not U8 (_net_6, SI);
and U9 (ENABLE_NOT_D_AND_RD_AND_SE_AND_NOT_SI, RD, _net_5, SE, _net_6);
not U10 (_net_7, D);
and U11 (ENABLE_NOT_D_AND_RD_AND_SE_AND_SI, RD, _net_7, SE, SI);
not U12 (_net_8, SE);
not U13 (_net_9, SI);
and U14 (ENABLE_D_AND_RD_AND_NOT_SE_AND_NOT_SI, RD, D, _net_8, _net_9);
not U15 (_net_10, SE);
and U16 (ENABLE_D_AND_RD_AND_NOT_SE_AND_SI, RD, D, _net_10, SI);
not U17 (_net_11, SI);
and U18 (ENABLE_D_AND_RD_AND_SE_AND_NOT_SI, RD, D, SE, _net_11);
and U19 (ENABLE_D_AND_RD_AND_SE_AND_SI, RD, D, SE, SI);
not U20 (_net_12, SE);
not U21 (_net_13, SI);
and U22 (ENABLE_RD_AND_NOT_SE_AND_NOT_SI, _net_12, RD, _net_13);
not U23 (_net_14, SE);
and U24 (ENABLE_RD_AND_NOT_SE_AND_SI, _net_14, RD, SI);
not U25 (_net_15, D);
not U26 (_net_16, CK);
not U27 (_net_17, SE);
not U28 (_net_18, SI);
and U29 (ENABLE_NOT_CK_AND_NOT_D_AND_NOT_SE_AND_NOT_SI, _net_15, _net_16, _net_17, _net_18);
not U30 (_net_19, D);
not U31 (_net_20, CK);
not U32 (_net_21, SE);
and U33 (ENABLE_NOT_CK_AND_NOT_D_AND_NOT_SE_AND_SI, _net_19, _net_20, _net_21, SI);
not U34 (_net_22, D);
not U35 (_net_23, CK);
not U36 (_net_24, SI);
and U37 (ENABLE_NOT_CK_AND_NOT_D_AND_SE_AND_NOT_SI, _net_22, _net_23, SE, _net_24);
not U38 (_net_25, D);
not U39 (_net_26, CK);
and U40 (ENABLE_NOT_CK_AND_NOT_D_AND_SE_AND_SI, _net_25, _net_26, SE, SI);
not U41 (_net_27, CK);
not U42 (_net_28, SE);
not U43 (_net_29, SI);
and U44 (ENABLE_NOT_CK_AND_D_AND_NOT_SE_AND_NOT_SI, D, _net_27, _net_28, _net_29);
not U45 (_net_30, CK);
not U46 (_net_31, SE);
and U47 (ENABLE_NOT_CK_AND_D_AND_NOT_SE_AND_SI, D, _net_30, _net_31, SI);
not U48 (_net_32, CK);
not U49 (_net_33, SI);
and U50 (ENABLE_NOT_CK_AND_D_AND_SE_AND_NOT_SI, D, _net_32, SE, _net_33);
not U51 (_net_34, CK);
and U52 (ENABLE_NOT_CK_AND_D_AND_SE_AND_SI, D, _net_34, SE, SI);
not U53 (_net_35, D);
and U54 (ENABLE_NOT_D_AND_SE_AND_SI, SE, _net_35, SI);
not U55 (_net_36, D);
not U56 (_net_37, SE);
not U57 (_net_38, SI);
and U58 (ENABLE_CK_AND_NOT_D_AND_NOT_SE_AND_NOT_SI, _net_36, CK, _net_37, _net_38);
not U59 (_net_39, D);
not U60 (_net_40, SE);
and U61 (ENABLE_CK_AND_NOT_D_AND_NOT_SE_AND_SI, _net_39, CK, _net_40, SI);
not U62 (_net_41, D);
not U63 (_net_42, SI);
and U64 (ENABLE_CK_AND_NOT_D_AND_SE_AND_NOT_SI, _net_41, CK, SE, _net_42);
not U65 (_net_43, D);
and U66 (ENABLE_CK_AND_NOT_D_AND_SE_AND_SI, _net_43, CK, SE, SI);
not U67 (_net_44, SE);
not U68 (_net_45, SI);
and U69 (ENABLE_CK_AND_D_AND_NOT_SE_AND_NOT_SI, D, CK, _net_44, _net_45);
not U70 (_net_46, SE);
and U71 (ENABLE_CK_AND_D_AND_NOT_SE_AND_SI, D, CK, _net_46, SI);
not U72 (_net_47, SI);
and U73 (ENABLE_CK_AND_D_AND_SE_AND_NOT_SI, D, CK, SE, _net_47);
and U74 (ENABLE_CK_AND_D_AND_SE_AND_SI, D, CK, SE, SI);
not U75 (_net_48, SE);
not U76 (_net_49, SI);
and U77 (ENABLE_D_AND_NOT_SE_AND_NOT_SI, _net_48, D, _net_49);
not U78 (_net_50, SE);
and U79 (ENABLE_D_AND_NOT_SE_AND_SI, _net_50, D, SI);
and U80 (ENABLE_D_AND_SE_AND_SI, SE, D, SI);
not U81 (_net_51, D);
and U82 (ENABLE_NOT_D_AND_RD_AND_SI, RD, _net_51, SI);
not U83 (_net_52, SI);
and U84 (ENABLE_D_AND_RD_AND_NOT_SI, RD, D, _net_52);
not U85 (_net_53, D);
and U86 (ENABLE_NOT_D_AND_RD_AND_SE, RD, _net_53, SE);
and U87 (ENABLE_D_AND_RD_AND_SE, RD, D, SE);

specify
if (CK==1'b0&&D==1'b0&&SE==1'b0&&SI==1'b0) (negedge RD => (Q +: 1'b0))=(0, 0);
if (CK==1'b0&&D==1'b0&&SE==1'b0&&SI==1'b1) (negedge RD => (Q +: 1'b0))=(0, 0);
if (CK==1'b0&&D==1'b0&&SE==1'b1&&SI==1'b0) (negedge RD => (Q +: 1'b0))=(0, 0);
if (CK==1'b0&&D==1'b0&&SE==1'b1&&SI==1'b1) (negedge RD => (Q +: 1'b0))=(0, 0);
if (CK==1'b0&&D==1'b1&&SE==1'b0&&SI==1'b0) (negedge RD => (Q +: 1'b0))=(0, 0);
if (CK==1'b0&&D==1'b1&&SE==1'b0&&SI==1'b1) (negedge RD => (Q +: 1'b0))=(0, 0);
if (CK==1'b0&&D==1'b1&&SE==1'b1&&SI==1'b0) (negedge RD => (Q +: 1'b0))=(0, 0);
if (CK==1'b0&&D==1'b1&&SE==1'b1&&SI==1'b1) (negedge RD => (Q +: 1'b0))=(0, 0);
if (CK==1'b1&&D==1'b0&&SE==1'b0&&SI==1'b0) (negedge RD => (Q +: 1'b0))=(0, 0);
if (CK==1'b1&&D==1'b0&&SE==1'b0&&SI==1'b1) (negedge RD => (Q +: 1'b0))=(0, 0);
if (CK==1'b1&&D==1'b0&&SE==1'b1&&SI==1'b0) (negedge RD => (Q +: 1'b0))=(0, 0);
if (CK==1'b1&&D==1'b0&&SE==1'b1&&SI==1'b1) (negedge RD => (Q +: 1'b0))=(0, 0);
if (CK==1'b1&&D==1'b1&&SE==1'b0&&SI==1'b0) (negedge RD => (Q +: 1'b0))=(0, 0);
if (CK==1'b1&&D==1'b1&&SE==1'b0&&SI==1'b1) (negedge RD => (Q +: 1'b0))=(0, 0);
if (CK==1'b1&&D==1'b1&&SE==1'b1&&SI==1'b0) (negedge RD => (Q +: 1'b0))=(0, 0);
if (CK==1'b1&&D==1'b1&&SE==1'b1&&SI==1'b1) (negedge RD => (Q +: 1'b0))=(0, 0);
(negedge RD => (Q:1'b0))=(0, 0);
if (D==1'b0&&RD==1'b1&&SE==1'b0&&SI==1'b0) (posedge CK => (Q -: 1'b1))=(0, 0);
if (D==1'b0&&RD==1'b1&&SE==1'b0&&SI==1'b1) (posedge CK => (Q -: 1'b1))=(0, 0);
if (D==1'b0&&RD==1'b1&&SE==1'b1&&SI==1'b0) (posedge CK => (Q -: 1'b1))=(0, 0);
if (D==1'b0&&RD==1'b1&&SE==1'b1&&SI==1'b1) (posedge CK => (Q +: 1'b1))=(0, 0);
if (D==1'b1&&RD==1'b1&&SE==1'b0&&SI==1'b0) (posedge CK => (Q +: 1'b1))=(0, 0);
if (D==1'b1&&RD==1'b1&&SE==1'b0&&SI==1'b1) (posedge CK => (Q +: 1'b1))=(0, 0);
if (D==1'b1&&RD==1'b1&&SE==1'b1&&SI==1'b0) (posedge CK => (Q -: 1'b1))=(0, 0);
if (D==1'b1&&RD==1'b1&&SE==1'b1&&SI==1'b1) (posedge CK => (Q +: 1'b1))=(0, 0);
(posedge CK => (Q:1'b1))=(0, 0);
if (CK==1'b0&&D==1'b0&&SE==1'b0&&SI==1'b0) (negedge RD => (QN -: 1'b1))=(0, 0);
if (CK==1'b0&&D==1'b0&&SE==1'b0&&SI==1'b1) (negedge RD => (QN -: 1'b1))=(0, 0);
if (CK==1'b0&&D==1'b0&&SE==1'b1&&SI==1'b0) (negedge RD => (QN -: 1'b1))=(0, 0);
if (CK==1'b0&&D==1'b0&&SE==1'b1&&SI==1'b1) (negedge RD => (QN -: 1'b1))=(0, 0);
if (CK==1'b0&&D==1'b1&&SE==1'b0&&SI==1'b0) (negedge RD => (QN -: 1'b1))=(0, 0);
if (CK==1'b0&&D==1'b1&&SE==1'b0&&SI==1'b1) (negedge RD => (QN -: 1'b1))=(0, 0);
if (CK==1'b0&&D==1'b1&&SE==1'b1&&SI==1'b0) (negedge RD => (QN -: 1'b1))=(0, 0);
if (CK==1'b0&&D==1'b1&&SE==1'b1&&SI==1'b1) (negedge RD => (QN -: 1'b1))=(0, 0);
if (CK==1'b1&&D==1'b0&&SE==1'b0&&SI==1'b0) (negedge RD => (QN -: 1'b1))=(0, 0);
if (CK==1'b1&&D==1'b0&&SE==1'b0&&SI==1'b1) (negedge RD => (QN -: 1'b1))=(0, 0);
if (CK==1'b1&&D==1'b0&&SE==1'b1&&SI==1'b0) (negedge RD => (QN -: 1'b1))=(0, 0);
if (CK==1'b1&&D==1'b0&&SE==1'b1&&SI==1'b1) (negedge RD => (QN -: 1'b1))=(0, 0);
if (CK==1'b1&&D==1'b1&&SE==1'b0&&SI==1'b0) (negedge RD => (QN -: 1'b1))=(0, 0);
if (CK==1'b1&&D==1'b1&&SE==1'b0&&SI==1'b1) (negedge RD => (QN -: 1'b1))=(0, 0);
if (CK==1'b1&&D==1'b1&&SE==1'b1&&SI==1'b0) (negedge RD => (QN -: 1'b1))=(0, 0);
if (CK==1'b1&&D==1'b1&&SE==1'b1&&SI==1'b1) (negedge RD => (QN -: 1'b1))=(0, 0);
(negedge RD => (QN:1'b1))=(0, 0);
if (D==1'b0&&RD==1'b1&&SE==1'b0&&SI==1'b0) (posedge CK => (QN +: 1'b1))=(0, 0);
if (D==1'b0&&RD==1'b1&&SE==1'b0&&SI==1'b1) (posedge CK => (QN +: 1'b1))=(0, 0);
if (D==1'b0&&RD==1'b1&&SE==1'b1&&SI==1'b0) (posedge CK => (QN +: 1'b1))=(0, 0);
if (D==1'b0&&RD==1'b1&&SE==1'b1&&SI==1'b1) (posedge CK => (QN -: 1'b1))=(0, 0);
if (D==1'b1&&RD==1'b1&&SE==1'b0&&SI==1'b0) (posedge CK => (QN -: 1'b1))=(0, 0);
if (D==1'b1&&RD==1'b1&&SE==1'b0&&SI==1'b1) (posedge CK => (QN -: 1'b1))=(0, 0);
if (D==1'b1&&RD==1'b1&&SE==1'b1&&SI==1'b0) (posedge CK => (QN +: 1'b1))=(0, 0);
if (D==1'b1&&RD==1'b1&&SE==1'b1&&SI==1'b1) (posedge CK => (QN -: 1'b1))=(0, 0);
(posedge CK => (QN:1'b0))=(0, 0);
$width(posedge CK &&& ENABLE_NOT_D_AND_RD_AND_NOT_SE_AND_NOT_SI , 0 ,0, viol_0);
$width(negedge CK &&& ENABLE_NOT_D_AND_RD_AND_NOT_SE_AND_NOT_SI , 0 ,0, viol_0);
$width(posedge CK &&& ENABLE_NOT_D_AND_RD_AND_NOT_SE_AND_SI , 0 ,0, viol_0);
$width(negedge CK &&& ENABLE_NOT_D_AND_RD_AND_NOT_SE_AND_SI , 0 ,0, viol_0);
$width(posedge CK &&& ENABLE_NOT_D_AND_RD_AND_SE_AND_NOT_SI , 0 ,0, viol_0);
$width(negedge CK &&& ENABLE_NOT_D_AND_RD_AND_SE_AND_NOT_SI , 0 ,0, viol_0);
$width(posedge CK &&& ENABLE_NOT_D_AND_RD_AND_SE_AND_SI , 0 ,0, viol_0);
$width(negedge CK &&& ENABLE_NOT_D_AND_RD_AND_SE_AND_SI , 0 ,0, viol_0);
$width(posedge CK &&& ENABLE_D_AND_RD_AND_NOT_SE_AND_NOT_SI , 0 ,0, viol_0);
$width(negedge CK &&& ENABLE_D_AND_RD_AND_NOT_SE_AND_NOT_SI , 0 ,0, viol_0);
$width(posedge CK &&& ENABLE_D_AND_RD_AND_NOT_SE_AND_SI , 0 ,0, viol_0);
$width(negedge CK &&& ENABLE_D_AND_RD_AND_NOT_SE_AND_SI , 0 ,0, viol_0);
$width(posedge CK &&& ENABLE_D_AND_RD_AND_SE_AND_NOT_SI , 0 ,0, viol_0);
$width(negedge CK &&& ENABLE_D_AND_RD_AND_SE_AND_NOT_SI , 0 ,0, viol_0);
$width(posedge CK &&& ENABLE_D_AND_RD_AND_SE_AND_SI , 0 ,0, viol_0);
$width(negedge CK &&& ENABLE_D_AND_RD_AND_SE_AND_SI , 0 ,0, viol_0);
$setuphold(posedge CK &&& ENABLE_RD_AND_NOT_SE_AND_NOT_SI , posedge D &&& ENABLE_RD_AND_NOT_SE_AND_NOT_SI , 0 ,0, viol_0, , , delayed_CK, delayed_D);
$setuphold(posedge CK &&& ENABLE_RD_AND_NOT_SE_AND_NOT_SI , negedge D &&& ENABLE_RD_AND_NOT_SE_AND_NOT_SI , 0 ,0, viol_0, , , delayed_CK, delayed_D);
$setuphold(posedge CK &&& ENABLE_RD_AND_NOT_SE_AND_SI , posedge D &&& ENABLE_RD_AND_NOT_SE_AND_SI , 0 ,0, viol_0, , , delayed_CK, delayed_D);
$setuphold(posedge CK &&& ENABLE_RD_AND_NOT_SE_AND_SI , negedge D &&& ENABLE_RD_AND_NOT_SE_AND_SI , 0 ,0, viol_0, , , delayed_CK, delayed_D);
$width(negedge RD &&& ENABLE_NOT_CK_AND_NOT_D_AND_NOT_SE_AND_NOT_SI , 0 ,0, viol_0);
$width(negedge RD &&& ENABLE_NOT_CK_AND_NOT_D_AND_NOT_SE_AND_SI , 0 ,0, viol_0);
$width(negedge RD &&& ENABLE_NOT_CK_AND_NOT_D_AND_SE_AND_NOT_SI , 0 ,0, viol_0);
$width(negedge RD &&& ENABLE_NOT_CK_AND_NOT_D_AND_SE_AND_SI , 0 ,0, viol_0);
$width(negedge RD &&& ENABLE_NOT_CK_AND_D_AND_NOT_SE_AND_NOT_SI , 0 ,0, viol_0);
$width(negedge RD &&& ENABLE_NOT_CK_AND_D_AND_NOT_SE_AND_SI , 0 ,0, viol_0);
$width(negedge RD &&& ENABLE_NOT_CK_AND_D_AND_SE_AND_NOT_SI , 0 ,0, viol_0);
$width(negedge RD &&& ENABLE_NOT_CK_AND_D_AND_SE_AND_SI , 0 ,0, viol_0);
$recovery(posedge RD &&& ENABLE_NOT_D_AND_SE_AND_SI , posedge CK &&& ENABLE_NOT_D_AND_SE_AND_SI , 0 , viol_0);
$hold(posedge CK &&& ENABLE_NOT_D_AND_SE_AND_SI , posedge RD &&& ENABLE_NOT_D_AND_SE_AND_SI , 0 , viol_0);
$width(negedge RD &&& ENABLE_CK_AND_NOT_D_AND_NOT_SE_AND_NOT_SI , 0 ,0, viol_0);
$width(negedge RD &&& ENABLE_CK_AND_NOT_D_AND_NOT_SE_AND_SI , 0 ,0, viol_0);
$width(negedge RD &&& ENABLE_CK_AND_NOT_D_AND_SE_AND_NOT_SI , 0 ,0, viol_0);
$width(negedge RD &&& ENABLE_CK_AND_NOT_D_AND_SE_AND_SI , 0 ,0, viol_0);
$width(negedge RD &&& ENABLE_CK_AND_D_AND_NOT_SE_AND_NOT_SI , 0 ,0, viol_0);
$width(negedge RD &&& ENABLE_CK_AND_D_AND_NOT_SE_AND_SI , 0 ,0, viol_0);
$width(negedge RD &&& ENABLE_CK_AND_D_AND_SE_AND_NOT_SI , 0 ,0, viol_0);
$width(negedge RD &&& ENABLE_CK_AND_D_AND_SE_AND_SI , 0 ,0, viol_0);
$recovery(posedge RD &&& ENABLE_D_AND_NOT_SE_AND_NOT_SI , posedge CK &&& ENABLE_D_AND_NOT_SE_AND_NOT_SI , 0 , viol_0);
$hold(posedge CK &&& ENABLE_D_AND_NOT_SE_AND_NOT_SI , posedge RD &&& ENABLE_D_AND_NOT_SE_AND_NOT_SI , 0 , viol_0);
$recovery(posedge RD &&& ENABLE_D_AND_NOT_SE_AND_SI , posedge CK &&& ENABLE_D_AND_NOT_SE_AND_SI , 0 , viol_0);
$hold(posedge CK &&& ENABLE_D_AND_NOT_SE_AND_SI , posedge RD &&& ENABLE_D_AND_NOT_SE_AND_SI , 0 , viol_0);
$recovery(posedge RD &&& ENABLE_D_AND_SE_AND_SI , posedge CK &&& ENABLE_D_AND_SE_AND_SI , 0 , viol_0);
$hold(posedge CK &&& ENABLE_D_AND_SE_AND_SI , posedge RD &&& ENABLE_D_AND_SE_AND_SI , 0 , viol_0);
$setuphold(posedge CK &&& ENABLE_NOT_D_AND_RD_AND_SI , posedge SE &&& ENABLE_NOT_D_AND_RD_AND_SI , 0 ,0, viol_0, , , delayed_CK, delayed_SE);
$setuphold(posedge CK &&& ENABLE_NOT_D_AND_RD_AND_SI , negedge SE &&& ENABLE_NOT_D_AND_RD_AND_SI , 0 ,0, viol_0, , , delayed_CK, delayed_SE);
$setuphold(posedge CK &&& ENABLE_D_AND_RD_AND_NOT_SI , posedge SE &&& ENABLE_D_AND_RD_AND_NOT_SI , 0 ,0, viol_0, , , delayed_CK, delayed_SE);
$setuphold(posedge CK &&& ENABLE_D_AND_RD_AND_NOT_SI , negedge SE &&& ENABLE_D_AND_RD_AND_NOT_SI , 0 ,0, viol_0, , , delayed_CK, delayed_SE);
$setuphold(posedge CK &&& ENABLE_NOT_D_AND_RD_AND_SE , posedge SI &&& ENABLE_NOT_D_AND_RD_AND_SE , 0 ,0, viol_0, , , delayed_CK, delayed_SI);
$setuphold(posedge CK &&& ENABLE_NOT_D_AND_RD_AND_SE , negedge SI &&& ENABLE_NOT_D_AND_RD_AND_SE , 0 ,0, viol_0, , , delayed_CK, delayed_SI);
$setuphold(posedge CK &&& ENABLE_D_AND_RD_AND_SE , posedge SI &&& ENABLE_D_AND_RD_AND_SE , 0 ,0, viol_0, , , delayed_CK, delayed_SI);
$setuphold(posedge CK &&& ENABLE_D_AND_RD_AND_SE , negedge SI &&& ENABLE_D_AND_RD_AND_SE , 0 ,0, viol_0, , , delayed_CK, delayed_SI);
endspecify
   `endif

endmodule
`endcelldefine

//%END SVN_FSDPRB_1

//%BEGIN SVN_FSDPRB_2

`celldefine
module SVN_FSDPRB_2 (Q, QN, CK, D, SI, SE, RD);
   output Q, QN;
   input CK, D, SI, SE, RD;

   reg viol_0;
   wire delayed_CK, delayed_D, delayed_SI,
	delayed_SE, delayed_RD;

   wire int_res__D, int_res__RD, int_res_iq, xcr_0;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////

`ifdef _fv
   buf (delayed_CK, CK);
   buf (delayed_D, D);
   buf (delayed_SI, SI);
   buf (delayed_SE, SE);
`endif
   buf (delayed_RD, RD);

   mux2 (int_res__D, delayed_SI, delayed_D, delayed_SE);
   not (int_res__RD, delayed_RD);
   dff_r_err (xcr_0, delayed_CK, int_res__D, int_res__RD);
   dff_r (int_res_iq, viol_0, delayed_CK, int_res__D, int_res__RD, xcr_0);

   `ifdef VIRL_functiononly 
   buf #`SNPS_SEQ_DELAY (Q, int_res_iq);
   not #`SNPS_SEQ_DELAY (QN, int_res_iq);
   `else
   buf (Q, int_res_iq);
   not (QN, int_res_iq);
   `endif

   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////
   `ifdef VIRL_functiononly

   `else

not U0 (_net_0, D);
not U1 (_net_1, SE);
not U2 (_net_2, SI);
and U3 (ENABLE_NOT_D_AND_RD_AND_NOT_SE_AND_NOT_SI, RD, _net_0, _net_1, _net_2);
not U4 (_net_3, D);
not U5 (_net_4, SE);
and U6 (ENABLE_NOT_D_AND_RD_AND_NOT_SE_AND_SI, RD, _net_3, _net_4, SI);
not U7 (_net_5, D);
not U8 (_net_6, SI);
and U9 (ENABLE_NOT_D_AND_RD_AND_SE_AND_NOT_SI, RD, _net_5, SE, _net_6);
not U10 (_net_7, D);
and U11 (ENABLE_NOT_D_AND_RD_AND_SE_AND_SI, RD, _net_7, SE, SI);
not U12 (_net_8, SE);
not U13 (_net_9, SI);
and U14 (ENABLE_D_AND_RD_AND_NOT_SE_AND_NOT_SI, RD, D, _net_8, _net_9);
not U15 (_net_10, SE);
and U16 (ENABLE_D_AND_RD_AND_NOT_SE_AND_SI, RD, D, _net_10, SI);
not U17 (_net_11, SI);
and U18 (ENABLE_D_AND_RD_AND_SE_AND_NOT_SI, RD, D, SE, _net_11);
and U19 (ENABLE_D_AND_RD_AND_SE_AND_SI, RD, D, SE, SI);
not U20 (_net_12, SE);
not U21 (_net_13, SI);
and U22 (ENABLE_RD_AND_NOT_SE_AND_NOT_SI, _net_12, RD, _net_13);
not U23 (_net_14, SE);
and U24 (ENABLE_RD_AND_NOT_SE_AND_SI, _net_14, RD, SI);
not U25 (_net_15, D);
not U26 (_net_16, CK);
not U27 (_net_17, SE);
not U28 (_net_18, SI);
and U29 (ENABLE_NOT_CK_AND_NOT_D_AND_NOT_SE_AND_NOT_SI, _net_15, _net_16, _net_17, _net_18);
not U30 (_net_19, D);
not U31 (_net_20, CK);
not U32 (_net_21, SE);
and U33 (ENABLE_NOT_CK_AND_NOT_D_AND_NOT_SE_AND_SI, _net_19, _net_20, _net_21, SI);
not U34 (_net_22, D);
not U35 (_net_23, CK);
not U36 (_net_24, SI);
and U37 (ENABLE_NOT_CK_AND_NOT_D_AND_SE_AND_NOT_SI, _net_22, _net_23, SE, _net_24);
not U38 (_net_25, D);
not U39 (_net_26, CK);
and U40 (ENABLE_NOT_CK_AND_NOT_D_AND_SE_AND_SI, _net_25, _net_26, SE, SI);
not U41 (_net_27, CK);
not U42 (_net_28, SE);
not U43 (_net_29, SI);
and U44 (ENABLE_NOT_CK_AND_D_AND_NOT_SE_AND_NOT_SI, D, _net_27, _net_28, _net_29);
not U45 (_net_30, CK);
not U46 (_net_31, SE);
and U47 (ENABLE_NOT_CK_AND_D_AND_NOT_SE_AND_SI, D, _net_30, _net_31, SI);
not U48 (_net_32, CK);
not U49 (_net_33, SI);
and U50 (ENABLE_NOT_CK_AND_D_AND_SE_AND_NOT_SI, D, _net_32, SE, _net_33);
not U51 (_net_34, CK);
and U52 (ENABLE_NOT_CK_AND_D_AND_SE_AND_SI, D, _net_34, SE, SI);
not U53 (_net_35, D);
and U54 (ENABLE_NOT_D_AND_SE_AND_SI, SE, _net_35, SI);
not U55 (_net_36, D);
not U56 (_net_37, SE);
not U57 (_net_38, SI);
and U58 (ENABLE_CK_AND_NOT_D_AND_NOT_SE_AND_NOT_SI, _net_36, CK, _net_37, _net_38);
not U59 (_net_39, D);
not U60 (_net_40, SE);
and U61 (ENABLE_CK_AND_NOT_D_AND_NOT_SE_AND_SI, _net_39, CK, _net_40, SI);
not U62 (_net_41, D);
not U63 (_net_42, SI);
and U64 (ENABLE_CK_AND_NOT_D_AND_SE_AND_NOT_SI, _net_41, CK, SE, _net_42);
not U65 (_net_43, D);
and U66 (ENABLE_CK_AND_NOT_D_AND_SE_AND_SI, _net_43, CK, SE, SI);
not U67 (_net_44, SE);
not U68 (_net_45, SI);
and U69 (ENABLE_CK_AND_D_AND_NOT_SE_AND_NOT_SI, D, CK, _net_44, _net_45);
not U70 (_net_46, SE);
and U71 (ENABLE_CK_AND_D_AND_NOT_SE_AND_SI, D, CK, _net_46, SI);
not U72 (_net_47, SI);
and U73 (ENABLE_CK_AND_D_AND_SE_AND_NOT_SI, D, CK, SE, _net_47);
and U74 (ENABLE_CK_AND_D_AND_SE_AND_SI, D, CK, SE, SI);
not U75 (_net_48, SE);
not U76 (_net_49, SI);
and U77 (ENABLE_D_AND_NOT_SE_AND_NOT_SI, _net_48, D, _net_49);
not U78 (_net_50, SE);
and U79 (ENABLE_D_AND_NOT_SE_AND_SI, _net_50, D, SI);
and U80 (ENABLE_D_AND_SE_AND_SI, SE, D, SI);
not U81 (_net_51, D);
and U82 (ENABLE_NOT_D_AND_RD_AND_SI, RD, _net_51, SI);
not U83 (_net_52, SI);
and U84 (ENABLE_D_AND_RD_AND_NOT_SI, RD, D, _net_52);
not U85 (_net_53, D);
and U86 (ENABLE_NOT_D_AND_RD_AND_SE, RD, _net_53, SE);
and U87 (ENABLE_D_AND_RD_AND_SE, RD, D, SE);

specify
if (CK==1'b0&&D==1'b0&&SE==1'b0&&SI==1'b0) (negedge RD => (Q +: 1'b0))=(0, 0);
if (CK==1'b0&&D==1'b0&&SE==1'b0&&SI==1'b1) (negedge RD => (Q +: 1'b0))=(0, 0);
if (CK==1'b0&&D==1'b0&&SE==1'b1&&SI==1'b0) (negedge RD => (Q +: 1'b0))=(0, 0);
if (CK==1'b0&&D==1'b0&&SE==1'b1&&SI==1'b1) (negedge RD => (Q +: 1'b0))=(0, 0);
if (CK==1'b0&&D==1'b1&&SE==1'b0&&SI==1'b0) (negedge RD => (Q +: 1'b0))=(0, 0);
if (CK==1'b0&&D==1'b1&&SE==1'b0&&SI==1'b1) (negedge RD => (Q +: 1'b0))=(0, 0);
if (CK==1'b0&&D==1'b1&&SE==1'b1&&SI==1'b0) (negedge RD => (Q +: 1'b0))=(0, 0);
if (CK==1'b0&&D==1'b1&&SE==1'b1&&SI==1'b1) (negedge RD => (Q +: 1'b0))=(0, 0);
if (CK==1'b1&&D==1'b0&&SE==1'b0&&SI==1'b0) (negedge RD => (Q +: 1'b0))=(0, 0);
if (CK==1'b1&&D==1'b0&&SE==1'b0&&SI==1'b1) (negedge RD => (Q +: 1'b0))=(0, 0);
if (CK==1'b1&&D==1'b0&&SE==1'b1&&SI==1'b0) (negedge RD => (Q +: 1'b0))=(0, 0);
if (CK==1'b1&&D==1'b0&&SE==1'b1&&SI==1'b1) (negedge RD => (Q +: 1'b0))=(0, 0);
if (CK==1'b1&&D==1'b1&&SE==1'b0&&SI==1'b0) (negedge RD => (Q +: 1'b0))=(0, 0);
if (CK==1'b1&&D==1'b1&&SE==1'b0&&SI==1'b1) (negedge RD => (Q +: 1'b0))=(0, 0);
if (CK==1'b1&&D==1'b1&&SE==1'b1&&SI==1'b0) (negedge RD => (Q +: 1'b0))=(0, 0);
if (CK==1'b1&&D==1'b1&&SE==1'b1&&SI==1'b1) (negedge RD => (Q +: 1'b0))=(0, 0);
(negedge RD => (Q:1'b0))=(0, 0);
if (D==1'b0&&RD==1'b1&&SE==1'b0&&SI==1'b0) (posedge CK => (Q -: 1'b1))=(0, 0);
if (D==1'b0&&RD==1'b1&&SE==1'b0&&SI==1'b1) (posedge CK => (Q -: 1'b1))=(0, 0);
if (D==1'b0&&RD==1'b1&&SE==1'b1&&SI==1'b0) (posedge CK => (Q -: 1'b1))=(0, 0);
if (D==1'b0&&RD==1'b1&&SE==1'b1&&SI==1'b1) (posedge CK => (Q +: 1'b1))=(0, 0);
if (D==1'b1&&RD==1'b1&&SE==1'b0&&SI==1'b0) (posedge CK => (Q +: 1'b1))=(0, 0);
if (D==1'b1&&RD==1'b1&&SE==1'b0&&SI==1'b1) (posedge CK => (Q +: 1'b1))=(0, 0);
if (D==1'b1&&RD==1'b1&&SE==1'b1&&SI==1'b0) (posedge CK => (Q -: 1'b1))=(0, 0);
if (D==1'b1&&RD==1'b1&&SE==1'b1&&SI==1'b1) (posedge CK => (Q +: 1'b1))=(0, 0);
(posedge CK => (Q:1'b1))=(0, 0);
if (CK==1'b0&&D==1'b0&&SE==1'b0&&SI==1'b0) (negedge RD => (QN -: 1'b1))=(0, 0);
if (CK==1'b0&&D==1'b0&&SE==1'b0&&SI==1'b1) (negedge RD => (QN -: 1'b1))=(0, 0);
if (CK==1'b0&&D==1'b0&&SE==1'b1&&SI==1'b0) (negedge RD => (QN -: 1'b1))=(0, 0);
if (CK==1'b0&&D==1'b0&&SE==1'b1&&SI==1'b1) (negedge RD => (QN -: 1'b1))=(0, 0);
if (CK==1'b0&&D==1'b1&&SE==1'b0&&SI==1'b0) (negedge RD => (QN -: 1'b1))=(0, 0);
if (CK==1'b0&&D==1'b1&&SE==1'b0&&SI==1'b1) (negedge RD => (QN -: 1'b1))=(0, 0);
if (CK==1'b0&&D==1'b1&&SE==1'b1&&SI==1'b0) (negedge RD => (QN -: 1'b1))=(0, 0);
if (CK==1'b0&&D==1'b1&&SE==1'b1&&SI==1'b1) (negedge RD => (QN -: 1'b1))=(0, 0);
if (CK==1'b1&&D==1'b0&&SE==1'b0&&SI==1'b0) (negedge RD => (QN -: 1'b1))=(0, 0);
if (CK==1'b1&&D==1'b0&&SE==1'b0&&SI==1'b1) (negedge RD => (QN -: 1'b1))=(0, 0);
if (CK==1'b1&&D==1'b0&&SE==1'b1&&SI==1'b0) (negedge RD => (QN -: 1'b1))=(0, 0);
if (CK==1'b1&&D==1'b0&&SE==1'b1&&SI==1'b1) (negedge RD => (QN -: 1'b1))=(0, 0);
if (CK==1'b1&&D==1'b1&&SE==1'b0&&SI==1'b0) (negedge RD => (QN -: 1'b1))=(0, 0);
if (CK==1'b1&&D==1'b1&&SE==1'b0&&SI==1'b1) (negedge RD => (QN -: 1'b1))=(0, 0);
if (CK==1'b1&&D==1'b1&&SE==1'b1&&SI==1'b0) (negedge RD => (QN -: 1'b1))=(0, 0);
if (CK==1'b1&&D==1'b1&&SE==1'b1&&SI==1'b1) (negedge RD => (QN -: 1'b1))=(0, 0);
(negedge RD => (QN:1'b1))=(0, 0);
if (D==1'b0&&RD==1'b1&&SE==1'b0&&SI==1'b0) (posedge CK => (QN +: 1'b1))=(0, 0);
if (D==1'b0&&RD==1'b1&&SE==1'b0&&SI==1'b1) (posedge CK => (QN +: 1'b1))=(0, 0);
if (D==1'b0&&RD==1'b1&&SE==1'b1&&SI==1'b0) (posedge CK => (QN +: 1'b1))=(0, 0);
if (D==1'b0&&RD==1'b1&&SE==1'b1&&SI==1'b1) (posedge CK => (QN -: 1'b1))=(0, 0);
if (D==1'b1&&RD==1'b1&&SE==1'b0&&SI==1'b0) (posedge CK => (QN -: 1'b1))=(0, 0);
if (D==1'b1&&RD==1'b1&&SE==1'b0&&SI==1'b1) (posedge CK => (QN -: 1'b1))=(0, 0);
if (D==1'b1&&RD==1'b1&&SE==1'b1&&SI==1'b0) (posedge CK => (QN +: 1'b1))=(0, 0);
if (D==1'b1&&RD==1'b1&&SE==1'b1&&SI==1'b1) (posedge CK => (QN -: 1'b1))=(0, 0);
(posedge CK => (QN:1'b0))=(0, 0);
$width(posedge CK &&& ENABLE_NOT_D_AND_RD_AND_NOT_SE_AND_NOT_SI , 0 ,0, viol_0);
$width(negedge CK &&& ENABLE_NOT_D_AND_RD_AND_NOT_SE_AND_NOT_SI , 0 ,0, viol_0);
$width(posedge CK &&& ENABLE_NOT_D_AND_RD_AND_NOT_SE_AND_SI , 0 ,0, viol_0);
$width(negedge CK &&& ENABLE_NOT_D_AND_RD_AND_NOT_SE_AND_SI , 0 ,0, viol_0);
$width(posedge CK &&& ENABLE_NOT_D_AND_RD_AND_SE_AND_NOT_SI , 0 ,0, viol_0);
$width(negedge CK &&& ENABLE_NOT_D_AND_RD_AND_SE_AND_NOT_SI , 0 ,0, viol_0);
$width(posedge CK &&& ENABLE_NOT_D_AND_RD_AND_SE_AND_SI , 0 ,0, viol_0);
$width(negedge CK &&& ENABLE_NOT_D_AND_RD_AND_SE_AND_SI , 0 ,0, viol_0);
$width(posedge CK &&& ENABLE_D_AND_RD_AND_NOT_SE_AND_NOT_SI , 0 ,0, viol_0);
$width(negedge CK &&& ENABLE_D_AND_RD_AND_NOT_SE_AND_NOT_SI , 0 ,0, viol_0);
$width(posedge CK &&& ENABLE_D_AND_RD_AND_NOT_SE_AND_SI , 0 ,0, viol_0);
$width(negedge CK &&& ENABLE_D_AND_RD_AND_NOT_SE_AND_SI , 0 ,0, viol_0);
$width(posedge CK &&& ENABLE_D_AND_RD_AND_SE_AND_NOT_SI , 0 ,0, viol_0);
$width(negedge CK &&& ENABLE_D_AND_RD_AND_SE_AND_NOT_SI , 0 ,0, viol_0);
$width(posedge CK &&& ENABLE_D_AND_RD_AND_SE_AND_SI , 0 ,0, viol_0);
$width(negedge CK &&& ENABLE_D_AND_RD_AND_SE_AND_SI , 0 ,0, viol_0);
$setuphold(posedge CK &&& ENABLE_RD_AND_NOT_SE_AND_NOT_SI , posedge D &&& ENABLE_RD_AND_NOT_SE_AND_NOT_SI , 0 ,0, viol_0, , , delayed_CK, delayed_D);
$setuphold(posedge CK &&& ENABLE_RD_AND_NOT_SE_AND_NOT_SI , negedge D &&& ENABLE_RD_AND_NOT_SE_AND_NOT_SI , 0 ,0, viol_0, , , delayed_CK, delayed_D);
$setuphold(posedge CK &&& ENABLE_RD_AND_NOT_SE_AND_SI , posedge D &&& ENABLE_RD_AND_NOT_SE_AND_SI , 0 ,0, viol_0, , , delayed_CK, delayed_D);
$setuphold(posedge CK &&& ENABLE_RD_AND_NOT_SE_AND_SI , negedge D &&& ENABLE_RD_AND_NOT_SE_AND_SI , 0 ,0, viol_0, , , delayed_CK, delayed_D);
$width(negedge RD &&& ENABLE_NOT_CK_AND_NOT_D_AND_NOT_SE_AND_NOT_SI , 0 ,0, viol_0);
$width(negedge RD &&& ENABLE_NOT_CK_AND_NOT_D_AND_NOT_SE_AND_SI , 0 ,0, viol_0);
$width(negedge RD &&& ENABLE_NOT_CK_AND_NOT_D_AND_SE_AND_NOT_SI , 0 ,0, viol_0);
$width(negedge RD &&& ENABLE_NOT_CK_AND_NOT_D_AND_SE_AND_SI , 0 ,0, viol_0);
$width(negedge RD &&& ENABLE_NOT_CK_AND_D_AND_NOT_SE_AND_NOT_SI , 0 ,0, viol_0);
$width(negedge RD &&& ENABLE_NOT_CK_AND_D_AND_NOT_SE_AND_SI , 0 ,0, viol_0);
$width(negedge RD &&& ENABLE_NOT_CK_AND_D_AND_SE_AND_NOT_SI , 0 ,0, viol_0);
$width(negedge RD &&& ENABLE_NOT_CK_AND_D_AND_SE_AND_SI , 0 ,0, viol_0);
$recovery(posedge RD &&& ENABLE_NOT_D_AND_SE_AND_SI , posedge CK &&& ENABLE_NOT_D_AND_SE_AND_SI , 0 , viol_0);
$hold(posedge CK &&& ENABLE_NOT_D_AND_SE_AND_SI , posedge RD &&& ENABLE_NOT_D_AND_SE_AND_SI , 0 , viol_0);
$width(negedge RD &&& ENABLE_CK_AND_NOT_D_AND_NOT_SE_AND_NOT_SI , 0 ,0, viol_0);
$width(negedge RD &&& ENABLE_CK_AND_NOT_D_AND_NOT_SE_AND_SI , 0 ,0, viol_0);
$width(negedge RD &&& ENABLE_CK_AND_NOT_D_AND_SE_AND_NOT_SI , 0 ,0, viol_0);
$width(negedge RD &&& ENABLE_CK_AND_NOT_D_AND_SE_AND_SI , 0 ,0, viol_0);
$width(negedge RD &&& ENABLE_CK_AND_D_AND_NOT_SE_AND_NOT_SI , 0 ,0, viol_0);
$width(negedge RD &&& ENABLE_CK_AND_D_AND_NOT_SE_AND_SI , 0 ,0, viol_0);
$width(negedge RD &&& ENABLE_CK_AND_D_AND_SE_AND_NOT_SI , 0 ,0, viol_0);
$width(negedge RD &&& ENABLE_CK_AND_D_AND_SE_AND_SI , 0 ,0, viol_0);
$recovery(posedge RD &&& ENABLE_D_AND_NOT_SE_AND_NOT_SI , posedge CK &&& ENABLE_D_AND_NOT_SE_AND_NOT_SI , 0 , viol_0);
$hold(posedge CK &&& ENABLE_D_AND_NOT_SE_AND_NOT_SI , posedge RD &&& ENABLE_D_AND_NOT_SE_AND_NOT_SI , 0 , viol_0);
$recovery(posedge RD &&& ENABLE_D_AND_NOT_SE_AND_SI , posedge CK &&& ENABLE_D_AND_NOT_SE_AND_SI , 0 , viol_0);
$hold(posedge CK &&& ENABLE_D_AND_NOT_SE_AND_SI , posedge RD &&& ENABLE_D_AND_NOT_SE_AND_SI , 0 , viol_0);
$recovery(posedge RD &&& ENABLE_D_AND_SE_AND_SI , posedge CK &&& ENABLE_D_AND_SE_AND_SI , 0 , viol_0);
$hold(posedge CK &&& ENABLE_D_AND_SE_AND_SI , posedge RD &&& ENABLE_D_AND_SE_AND_SI , 0 , viol_0);
$setuphold(posedge CK &&& ENABLE_NOT_D_AND_RD_AND_SI , posedge SE &&& ENABLE_NOT_D_AND_RD_AND_SI , 0 ,0, viol_0, , , delayed_CK, delayed_SE);
$setuphold(posedge CK &&& ENABLE_NOT_D_AND_RD_AND_SI , negedge SE &&& ENABLE_NOT_D_AND_RD_AND_SI , 0 ,0, viol_0, , , delayed_CK, delayed_SE);
$setuphold(posedge CK &&& ENABLE_D_AND_RD_AND_NOT_SI , posedge SE &&& ENABLE_D_AND_RD_AND_NOT_SI , 0 ,0, viol_0, , , delayed_CK, delayed_SE);
$setuphold(posedge CK &&& ENABLE_D_AND_RD_AND_NOT_SI , negedge SE &&& ENABLE_D_AND_RD_AND_NOT_SI , 0 ,0, viol_0, , , delayed_CK, delayed_SE);
$setuphold(posedge CK &&& ENABLE_NOT_D_AND_RD_AND_SE , posedge SI &&& ENABLE_NOT_D_AND_RD_AND_SE , 0 ,0, viol_0, , , delayed_CK, delayed_SI);
$setuphold(posedge CK &&& ENABLE_NOT_D_AND_RD_AND_SE , negedge SI &&& ENABLE_NOT_D_AND_RD_AND_SE , 0 ,0, viol_0, , , delayed_CK, delayed_SI);
$setuphold(posedge CK &&& ENABLE_D_AND_RD_AND_SE , posedge SI &&& ENABLE_D_AND_RD_AND_SE , 0 ,0, viol_0, , , delayed_CK, delayed_SI);
$setuphold(posedge CK &&& ENABLE_D_AND_RD_AND_SE , negedge SI &&& ENABLE_D_AND_RD_AND_SE , 0 ,0, viol_0, , , delayed_CK, delayed_SI);
endspecify
   `endif

endmodule
`endcelldefine

//%END SVN_FSDPRB_2

//%BEGIN SVN_FSDPRB_4

`celldefine
module SVN_FSDPRB_4 (Q, QN, CK, D, SI, SE, RD);
   output Q, QN;
   input CK, D, SI, SE, RD;

   reg viol_0;
   wire delayed_CK, delayed_D, delayed_SI,
	delayed_SE, delayed_RD;

   wire int_res__D, int_res__RD, int_res_iq, xcr_0;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////

`ifdef _fv
   buf (delayed_CK, CK);
   buf (delayed_D, D);
   buf (delayed_SI, SI);
   buf (delayed_SE, SE);
`endif
   buf (delayed_RD, RD);

   mux2 (int_res__D, delayed_SI, delayed_D, delayed_SE);
   not (int_res__RD, delayed_RD);
   dff_r_err (xcr_0, delayed_CK, int_res__D, int_res__RD);
   dff_r (int_res_iq, viol_0, delayed_CK, int_res__D, int_res__RD, xcr_0);

   `ifdef VIRL_functiononly 
   buf #`SNPS_SEQ_DELAY (Q, int_res_iq);
   not #`SNPS_SEQ_DELAY (QN, int_res_iq);
   `else
   buf (Q, int_res_iq);
   not (QN, int_res_iq);
   `endif

   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////
   `ifdef VIRL_functiononly

   `else

not U0 (_net_0, D);
not U1 (_net_1, SE);
not U2 (_net_2, SI);
and U3 (ENABLE_NOT_D_AND_RD_AND_NOT_SE_AND_NOT_SI, RD, _net_0, _net_1, _net_2);
not U4 (_net_3, D);
not U5 (_net_4, SE);
and U6 (ENABLE_NOT_D_AND_RD_AND_NOT_SE_AND_SI, RD, _net_3, _net_4, SI);
not U7 (_net_5, D);
not U8 (_net_6, SI);
and U9 (ENABLE_NOT_D_AND_RD_AND_SE_AND_NOT_SI, RD, _net_5, SE, _net_6);
not U10 (_net_7, D);
and U11 (ENABLE_NOT_D_AND_RD_AND_SE_AND_SI, RD, _net_7, SE, SI);
not U12 (_net_8, SE);
not U13 (_net_9, SI);
and U14 (ENABLE_D_AND_RD_AND_NOT_SE_AND_NOT_SI, RD, D, _net_8, _net_9);
not U15 (_net_10, SE);
and U16 (ENABLE_D_AND_RD_AND_NOT_SE_AND_SI, RD, D, _net_10, SI);
not U17 (_net_11, SI);
and U18 (ENABLE_D_AND_RD_AND_SE_AND_NOT_SI, RD, D, SE, _net_11);
and U19 (ENABLE_D_AND_RD_AND_SE_AND_SI, RD, D, SE, SI);
not U20 (_net_12, SE);
not U21 (_net_13, SI);
and U22 (ENABLE_RD_AND_NOT_SE_AND_NOT_SI, _net_12, RD, _net_13);
not U23 (_net_14, SE);
and U24 (ENABLE_RD_AND_NOT_SE_AND_SI, _net_14, RD, SI);
not U25 (_net_15, D);
not U26 (_net_16, CK);
not U27 (_net_17, SE);
not U28 (_net_18, SI);
and U29 (ENABLE_NOT_CK_AND_NOT_D_AND_NOT_SE_AND_NOT_SI, _net_15, _net_16, _net_17, _net_18);
not U30 (_net_19, D);
not U31 (_net_20, CK);
not U32 (_net_21, SE);
and U33 (ENABLE_NOT_CK_AND_NOT_D_AND_NOT_SE_AND_SI, _net_19, _net_20, _net_21, SI);
not U34 (_net_22, D);
not U35 (_net_23, CK);
not U36 (_net_24, SI);
and U37 (ENABLE_NOT_CK_AND_NOT_D_AND_SE_AND_NOT_SI, _net_22, _net_23, SE, _net_24);
not U38 (_net_25, D);
not U39 (_net_26, CK);
and U40 (ENABLE_NOT_CK_AND_NOT_D_AND_SE_AND_SI, _net_25, _net_26, SE, SI);
not U41 (_net_27, CK);
not U42 (_net_28, SE);
not U43 (_net_29, SI);
and U44 (ENABLE_NOT_CK_AND_D_AND_NOT_SE_AND_NOT_SI, D, _net_27, _net_28, _net_29);
not U45 (_net_30, CK);
not U46 (_net_31, SE);
and U47 (ENABLE_NOT_CK_AND_D_AND_NOT_SE_AND_SI, D, _net_30, _net_31, SI);
not U48 (_net_32, CK);
not U49 (_net_33, SI);
and U50 (ENABLE_NOT_CK_AND_D_AND_SE_AND_NOT_SI, D, _net_32, SE, _net_33);
not U51 (_net_34, CK);
and U52 (ENABLE_NOT_CK_AND_D_AND_SE_AND_SI, D, _net_34, SE, SI);
not U53 (_net_35, D);
and U54 (ENABLE_NOT_D_AND_SE_AND_SI, SE, _net_35, SI);
not U55 (_net_36, D);
not U56 (_net_37, SE);
not U57 (_net_38, SI);
and U58 (ENABLE_CK_AND_NOT_D_AND_NOT_SE_AND_NOT_SI, _net_36, CK, _net_37, _net_38);
not U59 (_net_39, D);
not U60 (_net_40, SE);
and U61 (ENABLE_CK_AND_NOT_D_AND_NOT_SE_AND_SI, _net_39, CK, _net_40, SI);
not U62 (_net_41, D);
not U63 (_net_42, SI);
and U64 (ENABLE_CK_AND_NOT_D_AND_SE_AND_NOT_SI, _net_41, CK, SE, _net_42);
not U65 (_net_43, D);
and U66 (ENABLE_CK_AND_NOT_D_AND_SE_AND_SI, _net_43, CK, SE, SI);
not U67 (_net_44, SE);
not U68 (_net_45, SI);
and U69 (ENABLE_CK_AND_D_AND_NOT_SE_AND_NOT_SI, D, CK, _net_44, _net_45);
not U70 (_net_46, SE);
and U71 (ENABLE_CK_AND_D_AND_NOT_SE_AND_SI, D, CK, _net_46, SI);
not U72 (_net_47, SI);
and U73 (ENABLE_CK_AND_D_AND_SE_AND_NOT_SI, D, CK, SE, _net_47);
and U74 (ENABLE_CK_AND_D_AND_SE_AND_SI, D, CK, SE, SI);
not U75 (_net_48, SE);
not U76 (_net_49, SI);
and U77 (ENABLE_D_AND_NOT_SE_AND_NOT_SI, _net_48, D, _net_49);
not U78 (_net_50, SE);
and U79 (ENABLE_D_AND_NOT_SE_AND_SI, _net_50, D, SI);
and U80 (ENABLE_D_AND_SE_AND_SI, SE, D, SI);
not U81 (_net_51, D);
and U82 (ENABLE_NOT_D_AND_RD_AND_SI, RD, _net_51, SI);
not U83 (_net_52, SI);
and U84 (ENABLE_D_AND_RD_AND_NOT_SI, RD, D, _net_52);
not U85 (_net_53, D);
and U86 (ENABLE_NOT_D_AND_RD_AND_SE, RD, _net_53, SE);
and U87 (ENABLE_D_AND_RD_AND_SE, RD, D, SE);

specify
if (CK==1'b0&&D==1'b0&&SE==1'b0&&SI==1'b0) (negedge RD => (Q +: 1'b0))=(0, 0);
if (CK==1'b0&&D==1'b0&&SE==1'b0&&SI==1'b1) (negedge RD => (Q +: 1'b0))=(0, 0);
if (CK==1'b0&&D==1'b0&&SE==1'b1&&SI==1'b0) (negedge RD => (Q +: 1'b0))=(0, 0);
if (CK==1'b0&&D==1'b0&&SE==1'b1&&SI==1'b1) (negedge RD => (Q +: 1'b0))=(0, 0);
if (CK==1'b0&&D==1'b1&&SE==1'b0&&SI==1'b0) (negedge RD => (Q +: 1'b0))=(0, 0);
if (CK==1'b0&&D==1'b1&&SE==1'b0&&SI==1'b1) (negedge RD => (Q +: 1'b0))=(0, 0);
if (CK==1'b0&&D==1'b1&&SE==1'b1&&SI==1'b0) (negedge RD => (Q +: 1'b0))=(0, 0);
if (CK==1'b0&&D==1'b1&&SE==1'b1&&SI==1'b1) (negedge RD => (Q +: 1'b0))=(0, 0);
if (CK==1'b1&&D==1'b0&&SE==1'b0&&SI==1'b0) (negedge RD => (Q +: 1'b0))=(0, 0);
if (CK==1'b1&&D==1'b0&&SE==1'b0&&SI==1'b1) (negedge RD => (Q +: 1'b0))=(0, 0);
if (CK==1'b1&&D==1'b0&&SE==1'b1&&SI==1'b0) (negedge RD => (Q +: 1'b0))=(0, 0);
if (CK==1'b1&&D==1'b0&&SE==1'b1&&SI==1'b1) (negedge RD => (Q +: 1'b0))=(0, 0);
if (CK==1'b1&&D==1'b1&&SE==1'b0&&SI==1'b0) (negedge RD => (Q +: 1'b0))=(0, 0);
if (CK==1'b1&&D==1'b1&&SE==1'b0&&SI==1'b1) (negedge RD => (Q +: 1'b0))=(0, 0);
if (CK==1'b1&&D==1'b1&&SE==1'b1&&SI==1'b0) (negedge RD => (Q +: 1'b0))=(0, 0);
if (CK==1'b1&&D==1'b1&&SE==1'b1&&SI==1'b1) (negedge RD => (Q +: 1'b0))=(0, 0);
(negedge RD => (Q:1'b0))=(0, 0);
if (D==1'b0&&RD==1'b1&&SE==1'b0&&SI==1'b0) (posedge CK => (Q -: 1'b1))=(0, 0);
if (D==1'b0&&RD==1'b1&&SE==1'b0&&SI==1'b1) (posedge CK => (Q -: 1'b1))=(0, 0);
if (D==1'b0&&RD==1'b1&&SE==1'b1&&SI==1'b0) (posedge CK => (Q -: 1'b1))=(0, 0);
if (D==1'b0&&RD==1'b1&&SE==1'b1&&SI==1'b1) (posedge CK => (Q +: 1'b1))=(0, 0);
if (D==1'b1&&RD==1'b1&&SE==1'b0&&SI==1'b0) (posedge CK => (Q +: 1'b1))=(0, 0);
if (D==1'b1&&RD==1'b1&&SE==1'b0&&SI==1'b1) (posedge CK => (Q +: 1'b1))=(0, 0);
if (D==1'b1&&RD==1'b1&&SE==1'b1&&SI==1'b0) (posedge CK => (Q -: 1'b1))=(0, 0);
if (D==1'b1&&RD==1'b1&&SE==1'b1&&SI==1'b1) (posedge CK => (Q +: 1'b1))=(0, 0);
(posedge CK => (Q:1'b1))=(0, 0);
if (CK==1'b0&&D==1'b0&&SE==1'b0&&SI==1'b0) (negedge RD => (QN -: 1'b1))=(0, 0);
if (CK==1'b0&&D==1'b0&&SE==1'b0&&SI==1'b1) (negedge RD => (QN -: 1'b1))=(0, 0);
if (CK==1'b0&&D==1'b0&&SE==1'b1&&SI==1'b0) (negedge RD => (QN -: 1'b1))=(0, 0);
if (CK==1'b0&&D==1'b0&&SE==1'b1&&SI==1'b1) (negedge RD => (QN -: 1'b1))=(0, 0);
if (CK==1'b0&&D==1'b1&&SE==1'b0&&SI==1'b0) (negedge RD => (QN -: 1'b1))=(0, 0);
if (CK==1'b0&&D==1'b1&&SE==1'b0&&SI==1'b1) (negedge RD => (QN -: 1'b1))=(0, 0);
if (CK==1'b0&&D==1'b1&&SE==1'b1&&SI==1'b0) (negedge RD => (QN -: 1'b1))=(0, 0);
if (CK==1'b0&&D==1'b1&&SE==1'b1&&SI==1'b1) (negedge RD => (QN -: 1'b1))=(0, 0);
if (CK==1'b1&&D==1'b0&&SE==1'b0&&SI==1'b0) (negedge RD => (QN -: 1'b1))=(0, 0);
if (CK==1'b1&&D==1'b0&&SE==1'b0&&SI==1'b1) (negedge RD => (QN -: 1'b1))=(0, 0);
if (CK==1'b1&&D==1'b0&&SE==1'b1&&SI==1'b0) (negedge RD => (QN -: 1'b1))=(0, 0);
if (CK==1'b1&&D==1'b0&&SE==1'b1&&SI==1'b1) (negedge RD => (QN -: 1'b1))=(0, 0);
if (CK==1'b1&&D==1'b1&&SE==1'b0&&SI==1'b0) (negedge RD => (QN -: 1'b1))=(0, 0);
if (CK==1'b1&&D==1'b1&&SE==1'b0&&SI==1'b1) (negedge RD => (QN -: 1'b1))=(0, 0);
if (CK==1'b1&&D==1'b1&&SE==1'b1&&SI==1'b0) (negedge RD => (QN -: 1'b1))=(0, 0);
if (CK==1'b1&&D==1'b1&&SE==1'b1&&SI==1'b1) (negedge RD => (QN -: 1'b1))=(0, 0);
(negedge RD => (QN:1'b1))=(0, 0);
if (D==1'b0&&RD==1'b1&&SE==1'b0&&SI==1'b0) (posedge CK => (QN +: 1'b1))=(0, 0);
if (D==1'b0&&RD==1'b1&&SE==1'b0&&SI==1'b1) (posedge CK => (QN +: 1'b1))=(0, 0);
if (D==1'b0&&RD==1'b1&&SE==1'b1&&SI==1'b0) (posedge CK => (QN +: 1'b1))=(0, 0);
if (D==1'b0&&RD==1'b1&&SE==1'b1&&SI==1'b1) (posedge CK => (QN -: 1'b1))=(0, 0);
if (D==1'b1&&RD==1'b1&&SE==1'b0&&SI==1'b0) (posedge CK => (QN -: 1'b1))=(0, 0);
if (D==1'b1&&RD==1'b1&&SE==1'b0&&SI==1'b1) (posedge CK => (QN -: 1'b1))=(0, 0);
if (D==1'b1&&RD==1'b1&&SE==1'b1&&SI==1'b0) (posedge CK => (QN +: 1'b1))=(0, 0);
if (D==1'b1&&RD==1'b1&&SE==1'b1&&SI==1'b1) (posedge CK => (QN -: 1'b1))=(0, 0);
(posedge CK => (QN:1'b0))=(0, 0);
$width(posedge CK &&& ENABLE_NOT_D_AND_RD_AND_NOT_SE_AND_NOT_SI , 0 ,0, viol_0);
$width(negedge CK &&& ENABLE_NOT_D_AND_RD_AND_NOT_SE_AND_NOT_SI , 0 ,0, viol_0);
$width(posedge CK &&& ENABLE_NOT_D_AND_RD_AND_NOT_SE_AND_SI , 0 ,0, viol_0);
$width(negedge CK &&& ENABLE_NOT_D_AND_RD_AND_NOT_SE_AND_SI , 0 ,0, viol_0);
$width(posedge CK &&& ENABLE_NOT_D_AND_RD_AND_SE_AND_NOT_SI , 0 ,0, viol_0);
$width(negedge CK &&& ENABLE_NOT_D_AND_RD_AND_SE_AND_NOT_SI , 0 ,0, viol_0);
$width(posedge CK &&& ENABLE_NOT_D_AND_RD_AND_SE_AND_SI , 0 ,0, viol_0);
$width(negedge CK &&& ENABLE_NOT_D_AND_RD_AND_SE_AND_SI , 0 ,0, viol_0);
$width(posedge CK &&& ENABLE_D_AND_RD_AND_NOT_SE_AND_NOT_SI , 0 ,0, viol_0);
$width(negedge CK &&& ENABLE_D_AND_RD_AND_NOT_SE_AND_NOT_SI , 0 ,0, viol_0);
$width(posedge CK &&& ENABLE_D_AND_RD_AND_NOT_SE_AND_SI , 0 ,0, viol_0);
$width(negedge CK &&& ENABLE_D_AND_RD_AND_NOT_SE_AND_SI , 0 ,0, viol_0);
$width(posedge CK &&& ENABLE_D_AND_RD_AND_SE_AND_NOT_SI , 0 ,0, viol_0);
$width(negedge CK &&& ENABLE_D_AND_RD_AND_SE_AND_NOT_SI , 0 ,0, viol_0);
$width(posedge CK &&& ENABLE_D_AND_RD_AND_SE_AND_SI , 0 ,0, viol_0);
$width(negedge CK &&& ENABLE_D_AND_RD_AND_SE_AND_SI , 0 ,0, viol_0);
$setuphold(posedge CK &&& ENABLE_RD_AND_NOT_SE_AND_NOT_SI , posedge D &&& ENABLE_RD_AND_NOT_SE_AND_NOT_SI , 0 ,0, viol_0, , , delayed_CK, delayed_D);
$setuphold(posedge CK &&& ENABLE_RD_AND_NOT_SE_AND_NOT_SI , negedge D &&& ENABLE_RD_AND_NOT_SE_AND_NOT_SI , 0 ,0, viol_0, , , delayed_CK, delayed_D);
$setuphold(posedge CK &&& ENABLE_RD_AND_NOT_SE_AND_SI , posedge D &&& ENABLE_RD_AND_NOT_SE_AND_SI , 0 ,0, viol_0, , , delayed_CK, delayed_D);
$setuphold(posedge CK &&& ENABLE_RD_AND_NOT_SE_AND_SI , negedge D &&& ENABLE_RD_AND_NOT_SE_AND_SI , 0 ,0, viol_0, , , delayed_CK, delayed_D);
$width(negedge RD &&& ENABLE_NOT_CK_AND_NOT_D_AND_NOT_SE_AND_NOT_SI , 0 ,0, viol_0);
$width(negedge RD &&& ENABLE_NOT_CK_AND_NOT_D_AND_NOT_SE_AND_SI , 0 ,0, viol_0);
$width(negedge RD &&& ENABLE_NOT_CK_AND_NOT_D_AND_SE_AND_NOT_SI , 0 ,0, viol_0);
$width(negedge RD &&& ENABLE_NOT_CK_AND_NOT_D_AND_SE_AND_SI , 0 ,0, viol_0);
$width(negedge RD &&& ENABLE_NOT_CK_AND_D_AND_NOT_SE_AND_NOT_SI , 0 ,0, viol_0);
$width(negedge RD &&& ENABLE_NOT_CK_AND_D_AND_NOT_SE_AND_SI , 0 ,0, viol_0);
$width(negedge RD &&& ENABLE_NOT_CK_AND_D_AND_SE_AND_NOT_SI , 0 ,0, viol_0);
$width(negedge RD &&& ENABLE_NOT_CK_AND_D_AND_SE_AND_SI , 0 ,0, viol_0);
$recovery(posedge RD &&& ENABLE_NOT_D_AND_SE_AND_SI , posedge CK &&& ENABLE_NOT_D_AND_SE_AND_SI , 0 , viol_0);
$hold(posedge CK &&& ENABLE_NOT_D_AND_SE_AND_SI , posedge RD &&& ENABLE_NOT_D_AND_SE_AND_SI , 0 , viol_0);
$width(negedge RD &&& ENABLE_CK_AND_NOT_D_AND_NOT_SE_AND_NOT_SI , 0 ,0, viol_0);
$width(negedge RD &&& ENABLE_CK_AND_NOT_D_AND_NOT_SE_AND_SI , 0 ,0, viol_0);
$width(negedge RD &&& ENABLE_CK_AND_NOT_D_AND_SE_AND_NOT_SI , 0 ,0, viol_0);
$width(negedge RD &&& ENABLE_CK_AND_NOT_D_AND_SE_AND_SI , 0 ,0, viol_0);
$width(negedge RD &&& ENABLE_CK_AND_D_AND_NOT_SE_AND_NOT_SI , 0 ,0, viol_0);
$width(negedge RD &&& ENABLE_CK_AND_D_AND_NOT_SE_AND_SI , 0 ,0, viol_0);
$width(negedge RD &&& ENABLE_CK_AND_D_AND_SE_AND_NOT_SI , 0 ,0, viol_0);
$width(negedge RD &&& ENABLE_CK_AND_D_AND_SE_AND_SI , 0 ,0, viol_0);
$recovery(posedge RD &&& ENABLE_D_AND_NOT_SE_AND_NOT_SI , posedge CK &&& ENABLE_D_AND_NOT_SE_AND_NOT_SI , 0 , viol_0);
$hold(posedge CK &&& ENABLE_D_AND_NOT_SE_AND_NOT_SI , posedge RD &&& ENABLE_D_AND_NOT_SE_AND_NOT_SI , 0 , viol_0);
$recovery(posedge RD &&& ENABLE_D_AND_NOT_SE_AND_SI , posedge CK &&& ENABLE_D_AND_NOT_SE_AND_SI , 0 , viol_0);
$hold(posedge CK &&& ENABLE_D_AND_NOT_SE_AND_SI , posedge RD &&& ENABLE_D_AND_NOT_SE_AND_SI , 0 , viol_0);
$recovery(posedge RD &&& ENABLE_D_AND_SE_AND_SI , posedge CK &&& ENABLE_D_AND_SE_AND_SI , 0 , viol_0);
$hold(posedge CK &&& ENABLE_D_AND_SE_AND_SI , posedge RD &&& ENABLE_D_AND_SE_AND_SI , 0 , viol_0);
$setuphold(posedge CK &&& ENABLE_NOT_D_AND_RD_AND_SI , posedge SE &&& ENABLE_NOT_D_AND_RD_AND_SI , 0 ,0, viol_0, , , delayed_CK, delayed_SE);
$setuphold(posedge CK &&& ENABLE_NOT_D_AND_RD_AND_SI , negedge SE &&& ENABLE_NOT_D_AND_RD_AND_SI , 0 ,0, viol_0, , , delayed_CK, delayed_SE);
$setuphold(posedge CK &&& ENABLE_D_AND_RD_AND_NOT_SI , posedge SE &&& ENABLE_D_AND_RD_AND_NOT_SI , 0 ,0, viol_0, , , delayed_CK, delayed_SE);
$setuphold(posedge CK &&& ENABLE_D_AND_RD_AND_NOT_SI , negedge SE &&& ENABLE_D_AND_RD_AND_NOT_SI , 0 ,0, viol_0, , , delayed_CK, delayed_SE);
$setuphold(posedge CK &&& ENABLE_NOT_D_AND_RD_AND_SE , posedge SI &&& ENABLE_NOT_D_AND_RD_AND_SE , 0 ,0, viol_0, , , delayed_CK, delayed_SI);
$setuphold(posedge CK &&& ENABLE_NOT_D_AND_RD_AND_SE , negedge SI &&& ENABLE_NOT_D_AND_RD_AND_SE , 0 ,0, viol_0, , , delayed_CK, delayed_SI);
$setuphold(posedge CK &&& ENABLE_D_AND_RD_AND_SE , posedge SI &&& ENABLE_D_AND_RD_AND_SE , 0 ,0, viol_0, , , delayed_CK, delayed_SI);
$setuphold(posedge CK &&& ENABLE_D_AND_RD_AND_SE , negedge SI &&& ENABLE_D_AND_RD_AND_SE , 0 ,0, viol_0, , , delayed_CK, delayed_SI);
endspecify
   `endif

endmodule
`endcelldefine

//%END SVN_FSDPRB_4

//%BEGIN SVN_FSDPRBQ_F_1

`celldefine
module SVN_FSDPRBQ_F_1 (Q, CK, D, SI, SE, RD);
   output Q;
   input CK, D, SI, SE, RD;

   reg viol_0;
   wire delayed_CK, delayed_D, delayed_SI,
	delayed_SE, delayed_RD;

   wire int_res__D, int_res__RD, xcr_0;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////

`ifdef _fv
   buf (delayed_CK, CK);
   buf (delayed_D, D);
   buf (delayed_SI, SI);
   buf (delayed_SE, SE);
`endif
   buf (delayed_RD, RD);

   mux2 (int_res__D, delayed_SI, delayed_D, delayed_SE);
   not (int_res__RD, delayed_RD);
   dff_r_err (xcr_0, delayed_CK, int_res__D, int_res__RD);

   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////

   `ifdef VIRL_functiononly
        dff_r #`SNPS_SEQ_DELAY (Q, viol_0, delayed_CK, int_res__D, int_res__RD, xcr_0);

   `else
        dff_r (Q, viol_0, delayed_CK, int_res__D, int_res__RD, xcr_0);

   `endif

   `ifdef VIRL_functiononly

   `else

not U0 (_net_0, D);
not U1 (_net_1, SI);
and U2 (_net_2, RD, _net_0, SE, _net_1);
not U3 (_net_3, SI);
and U4 (_net_4, RD, D, SE, _net_3);
not U5 (_net_5, D);
not U6 (_net_6, SE);
and U7 (_net_7, RD, _net_5, _net_6);
or U8 (cond11, _net_2, _net_4, _net_7);
not U9 (_net_8, SE);
and U10 (_net_9, RD, D, _net_8);
and U11 (_net_10, RD, D, SE, SI);
not U12 (_net_11, D);
and U13 (_net_12, RD, _net_11, SE, SI);
or U14 (cond10, _net_9, _net_10, _net_12);
not U15 (_net_13, SE);
and U16 (cond0, _net_13, RD);
not U17 (_net_14, D);
not U18 (_net_15, CK);
not U19 (_net_16, SI);
and U20 (_net_17, _net_14, _net_15, SE, _net_16);
not U21 (_net_18, CK);
not U22 (_net_19, SI);
and U23 (_net_20, D, _net_18, SE, _net_19);
not U24 (_net_21, D);
not U25 (_net_22, CK);
not U26 (_net_23, SE);
and U27 (_net_24, _net_21, _net_22, _net_23);
or U28 (cond9, _net_17, _net_20, _net_24);
not U29 (_net_25, CK);
not U30 (_net_26, SE);
and U31 (_net_27, D, _net_25, _net_26);
not U32 (_net_28, CK);
and U33 (_net_29, D, _net_28, SE, SI);
not U34 (_net_30, D);
not U35 (_net_31, CK);
and U36 (_net_32, _net_30, _net_31, SE, SI);
or U37 (cond8, _net_27, _net_29, _net_32);
not U38 (_net_33, D);
and U39 (cond7, SE, _net_33, SI);
not U40 (_net_34, SE);
and U41 (cond6, _net_34, D);
and U42 (cond5, SE, D, SI);
not U43 (_net_35, D);
and U44 (cond1, RD, _net_35, SI);
not U45 (_net_36, SI);
and U46 (cond2, RD, D, _net_36);
not U47 (_net_37, D);
and U48 (cond4, RD, _net_37, SE);
and U49 (cond3, RD, D, SE);

specify
if ((~(CK) & D & SE & ~(SI)) | (~(CK) & ~(D) & SE & ~(SI)) | (~(CK) & ~(D) & ~(SE))) (negedge RD => (Q +: 1'b0))=(0, 0);
if ((~(CK) & D & SE & SI) | (~(CK) & D & ~(SE)) | (~(CK) & ~(D) & SE & SI)) (negedge RD => (Q +: 1'b0))=(0, 0);
if (CK) (negedge RD => (Q +: 1'b0))=(0, 0);
(negedge RD => (Q:1'b0))=(0, 0);
(posedge CK => (Q : 1'b1))=(0, 0);
$width(posedge CK &&& cond11 , 0 ,0, viol_0);
$width(negedge CK &&& cond11 , 0 ,0, viol_0);
$width(posedge CK &&& cond10 , 0 ,0, viol_0);
$width(negedge CK &&& cond10 , 0 ,0, viol_0);
$setuphold(posedge CK &&& cond0 , posedge D &&& cond0 , 0 ,0, viol_0, , , delayed_CK, delayed_D);
$setuphold(posedge CK &&& cond0 , negedge D &&& cond0 , 0 ,0, viol_0, , , delayed_CK, delayed_D);
$width(negedge RD &&& cond9 , 0 ,0, viol_0);
$width(negedge RD &&& cond8 , 0 ,0, viol_0);
$recovery(posedge RD &&& cond7 , posedge CK &&& cond7 , 0 , viol_0);
$hold(posedge CK &&& cond7 , posedge RD &&& cond7 , 0 , viol_0);
$recovery(posedge RD &&& cond6 , posedge CK &&& cond6 , 0 , viol_0);
$hold(posedge CK &&& cond6 , posedge RD &&& cond6 , 0 , viol_0);
$recovery(posedge RD &&& cond5 , posedge CK &&& cond5 , 0 , viol_0);
$hold(posedge CK &&& cond5 , posedge RD &&& cond5 , 0 , viol_0);
$width(negedge RD &&& CK , 0 ,0, viol_0);
$setuphold(posedge CK &&& cond1 , posedge SE &&& cond1 , 0 ,0, viol_0, , , delayed_CK, delayed_SE);
$setuphold(posedge CK &&& cond1 , negedge SE &&& cond1 , 0 ,0, viol_0, , , delayed_CK, delayed_SE);
$setuphold(posedge CK &&& cond2 , posedge SE &&& cond2 , 0 ,0, viol_0, , , delayed_CK, delayed_SE);
$setuphold(posedge CK &&& cond2 , negedge SE &&& cond2 , 0 ,0, viol_0, , , delayed_CK, delayed_SE);
$setuphold(posedge CK &&& cond4 , posedge SI &&& cond4 , 0 ,0, viol_0, , , delayed_CK, delayed_SI);
$setuphold(posedge CK &&& cond4 , negedge SI &&& cond4 , 0 ,0, viol_0, , , delayed_CK, delayed_SI);
$setuphold(posedge CK &&& cond3 , posedge SI &&& cond3 , 0 ,0, viol_0, , , delayed_CK, delayed_SI);
$setuphold(posedge CK &&& cond3 , negedge SI &&& cond3 , 0 ,0, viol_0, , , delayed_CK, delayed_SI);
endspecify
   `endif

endmodule
`endcelldefine

//%END SVN_FSDPRBQ_F_1

//%BEGIN SVN_FSDPRBQ_F_2

`celldefine
module SVN_FSDPRBQ_F_2 (Q, CK, D, SI, SE, RD);
   output Q;
   input CK, D, SI, SE, RD;

   reg viol_0;
   wire delayed_CK, delayed_D, delayed_SI,
	delayed_SE, delayed_RD;

   wire int_res__D, int_res__RD, xcr_0;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////

`ifdef _fv
   buf (delayed_CK, CK);
   buf (delayed_D, D);
   buf (delayed_SI, SI);
   buf (delayed_SE, SE);
`endif
   buf (delayed_RD, RD);

   mux2 (int_res__D, delayed_SI, delayed_D, delayed_SE);
   not (int_res__RD, delayed_RD);
   dff_r_err (xcr_0, delayed_CK, int_res__D, int_res__RD);

   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////

   `ifdef VIRL_functiononly
        dff_r #`SNPS_SEQ_DELAY (Q, viol_0, delayed_CK, int_res__D, int_res__RD, xcr_0);

   `else
        dff_r (Q, viol_0, delayed_CK, int_res__D, int_res__RD, xcr_0);

   `endif

   `ifdef VIRL_functiononly

   `else

not U0 (_net_0, D);
not U1 (_net_1, SI);
and U2 (_net_2, RD, _net_0, SE, _net_1);
not U3 (_net_3, SI);
and U4 (_net_4, RD, D, SE, _net_3);
not U5 (_net_5, D);
not U6 (_net_6, SE);
and U7 (_net_7, RD, _net_5, _net_6);
or U8 (cond11, _net_2, _net_4, _net_7);
not U9 (_net_8, SE);
and U10 (_net_9, RD, D, _net_8);
and U11 (_net_10, RD, D, SE, SI);
not U12 (_net_11, D);
and U13 (_net_12, RD, _net_11, SE, SI);
or U14 (cond10, _net_9, _net_10, _net_12);
not U15 (_net_13, SE);
and U16 (cond0, _net_13, RD);
not U17 (_net_14, D);
not U18 (_net_15, CK);
not U19 (_net_16, SI);
and U20 (_net_17, _net_14, _net_15, SE, _net_16);
not U21 (_net_18, CK);
not U22 (_net_19, SI);
and U23 (_net_20, D, _net_18, SE, _net_19);
not U24 (_net_21, D);
not U25 (_net_22, CK);
not U26 (_net_23, SE);
and U27 (_net_24, _net_21, _net_22, _net_23);
or U28 (cond9, _net_17, _net_20, _net_24);
not U29 (_net_25, CK);
not U30 (_net_26, SE);
and U31 (_net_27, D, _net_25, _net_26);
not U32 (_net_28, CK);
and U33 (_net_29, D, _net_28, SE, SI);
not U34 (_net_30, D);
not U35 (_net_31, CK);
and U36 (_net_32, _net_30, _net_31, SE, SI);
or U37 (cond8, _net_27, _net_29, _net_32);
not U38 (_net_33, D);
and U39 (cond7, SE, _net_33, SI);
not U40 (_net_34, SE);
and U41 (cond6, _net_34, D);
and U42 (cond5, SE, D, SI);
not U43 (_net_35, D);
and U44 (cond1, RD, _net_35, SI);
not U45 (_net_36, SI);
and U46 (cond2, RD, D, _net_36);
not U47 (_net_37, D);
and U48 (cond4, RD, _net_37, SE);
and U49 (cond3, RD, D, SE);

specify
if ((~(CK) & D & SE & ~(SI)) | (~(CK) & ~(D) & SE & ~(SI)) | (~(CK) & ~(D) & ~(SE))) (negedge RD => (Q +: 1'b0))=(0, 0);
if ((~(CK) & D & SE & SI) | (~(CK) & D & ~(SE)) | (~(CK) & ~(D) & SE & SI)) (negedge RD => (Q +: 1'b0))=(0, 0);
if (CK) (negedge RD => (Q +: 1'b0))=(0, 0);
(negedge RD => (Q:1'b0))=(0, 0);
(posedge CK => (Q : 1'b1))=(0, 0);
$width(posedge CK &&& cond11 , 0 ,0, viol_0);
$width(negedge CK &&& cond11 , 0 ,0, viol_0);
$width(posedge CK &&& cond10 , 0 ,0, viol_0);
$width(negedge CK &&& cond10 , 0 ,0, viol_0);
$setuphold(posedge CK &&& cond0 , posedge D &&& cond0 , 0 ,0, viol_0, , , delayed_CK, delayed_D);
$setuphold(posedge CK &&& cond0 , negedge D &&& cond0 , 0 ,0, viol_0, , , delayed_CK, delayed_D);
$width(negedge RD &&& cond9 , 0 ,0, viol_0);
$width(negedge RD &&& cond8 , 0 ,0, viol_0);
$recovery(posedge RD &&& cond7 , posedge CK &&& cond7 , 0 , viol_0);
$hold(posedge CK &&& cond7 , posedge RD &&& cond7 , 0 , viol_0);
$recovery(posedge RD &&& cond6 , posedge CK &&& cond6 , 0 , viol_0);
$hold(posedge CK &&& cond6 , posedge RD &&& cond6 , 0 , viol_0);
$recovery(posedge RD &&& cond5 , posedge CK &&& cond5 , 0 , viol_0);
$hold(posedge CK &&& cond5 , posedge RD &&& cond5 , 0 , viol_0);
$width(negedge RD &&& CK , 0 ,0, viol_0);
$setuphold(posedge CK &&& cond1 , posedge SE &&& cond1 , 0 ,0, viol_0, , , delayed_CK, delayed_SE);
$setuphold(posedge CK &&& cond1 , negedge SE &&& cond1 , 0 ,0, viol_0, , , delayed_CK, delayed_SE);
$setuphold(posedge CK &&& cond2 , posedge SE &&& cond2 , 0 ,0, viol_0, , , delayed_CK, delayed_SE);
$setuphold(posedge CK &&& cond2 , negedge SE &&& cond2 , 0 ,0, viol_0, , , delayed_CK, delayed_SE);
$setuphold(posedge CK &&& cond4 , posedge SI &&& cond4 , 0 ,0, viol_0, , , delayed_CK, delayed_SI);
$setuphold(posedge CK &&& cond4 , negedge SI &&& cond4 , 0 ,0, viol_0, , , delayed_CK, delayed_SI);
$setuphold(posedge CK &&& cond3 , posedge SI &&& cond3 , 0 ,0, viol_0, , , delayed_CK, delayed_SI);
$setuphold(posedge CK &&& cond3 , negedge SI &&& cond3 , 0 ,0, viol_0, , , delayed_CK, delayed_SI);
endspecify
   `endif

endmodule
`endcelldefine

//%END SVN_FSDPRBQ_F_2

//%BEGIN SVN_FSDPRBQ_F_4

`celldefine
module SVN_FSDPRBQ_F_4 (Q, CK, D, SI, SE, RD);
   output Q;
   input CK, D, SI, SE, RD;

   reg viol_0;
   wire delayed_CK, delayed_D, delayed_SI,
	delayed_SE, delayed_RD;

   wire int_res__D, int_res__RD, xcr_0;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////

`ifdef _fv
   buf (delayed_CK, CK);
   buf (delayed_D, D);
   buf (delayed_SI, SI);
   buf (delayed_SE, SE);
`endif
   buf (delayed_RD, RD);

   mux2 (int_res__D, delayed_SI, delayed_D, delayed_SE);
   not (int_res__RD, delayed_RD);
   dff_r_err (xcr_0, delayed_CK, int_res__D, int_res__RD);

   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////

   `ifdef VIRL_functiononly
        dff_r #`SNPS_SEQ_DELAY (Q, viol_0, delayed_CK, int_res__D, int_res__RD, xcr_0);

   `else
        dff_r (Q, viol_0, delayed_CK, int_res__D, int_res__RD, xcr_0);

   `endif

   `ifdef VIRL_functiononly

   `else

not U0 (_net_0, D);
not U1 (_net_1, SI);
and U2 (_net_2, RD, _net_0, SE, _net_1);
not U3 (_net_3, SI);
and U4 (_net_4, RD, D, SE, _net_3);
not U5 (_net_5, D);
not U6 (_net_6, SE);
and U7 (_net_7, RD, _net_5, _net_6);
or U8 (cond11, _net_2, _net_4, _net_7);
not U9 (_net_8, SE);
and U10 (_net_9, RD, D, _net_8);
and U11 (_net_10, RD, D, SE, SI);
not U12 (_net_11, D);
and U13 (_net_12, RD, _net_11, SE, SI);
or U14 (cond10, _net_9, _net_10, _net_12);
not U15 (_net_13, SE);
and U16 (cond0, _net_13, RD);
not U17 (_net_14, D);
not U18 (_net_15, CK);
not U19 (_net_16, SI);
and U20 (_net_17, _net_14, _net_15, SE, _net_16);
not U21 (_net_18, CK);
not U22 (_net_19, SI);
and U23 (_net_20, D, _net_18, SE, _net_19);
not U24 (_net_21, D);
not U25 (_net_22, CK);
not U26 (_net_23, SE);
and U27 (_net_24, _net_21, _net_22, _net_23);
or U28 (cond9, _net_17, _net_20, _net_24);
not U29 (_net_25, CK);
not U30 (_net_26, SE);
and U31 (_net_27, D, _net_25, _net_26);
not U32 (_net_28, CK);
and U33 (_net_29, D, _net_28, SE, SI);
not U34 (_net_30, D);
not U35 (_net_31, CK);
and U36 (_net_32, _net_30, _net_31, SE, SI);
or U37 (cond8, _net_27, _net_29, _net_32);
not U38 (_net_33, D);
and U39 (cond7, SE, _net_33, SI);
not U40 (_net_34, SE);
and U41 (cond6, _net_34, D);
and U42 (cond5, SE, D, SI);
not U43 (_net_35, D);
and U44 (cond1, RD, _net_35, SI);
not U45 (_net_36, SI);
and U46 (cond2, RD, D, _net_36);
not U47 (_net_37, D);
and U48 (cond4, RD, _net_37, SE);
and U49 (cond3, RD, D, SE);

specify
if ((~(CK) & D & SE & ~(SI)) | (~(CK) & ~(D) & SE & ~(SI)) | (~(CK) & ~(D) & ~(SE))) (negedge RD => (Q +: 1'b0))=(0, 0);
if ((~(CK) & D & SE & SI) | (~(CK) & D & ~(SE)) | (~(CK) & ~(D) & SE & SI)) (negedge RD => (Q +: 1'b0))=(0, 0);
if (CK) (negedge RD => (Q +: 1'b0))=(0, 0);
(negedge RD => (Q:1'b0))=(0, 0);
(posedge CK => (Q : 1'b1))=(0, 0);
$width(posedge CK &&& cond11 , 0 ,0, viol_0);
$width(negedge CK &&& cond11 , 0 ,0, viol_0);
$width(posedge CK &&& cond10 , 0 ,0, viol_0);
$width(negedge CK &&& cond10 , 0 ,0, viol_0);
$setuphold(posedge CK &&& cond0 , posedge D &&& cond0 , 0 ,0, viol_0, , , delayed_CK, delayed_D);
$setuphold(posedge CK &&& cond0 , negedge D &&& cond0 , 0 ,0, viol_0, , , delayed_CK, delayed_D);
$width(negedge RD &&& cond9 , 0 ,0, viol_0);
$width(negedge RD &&& cond8 , 0 ,0, viol_0);
$recovery(posedge RD &&& cond7 , posedge CK &&& cond7 , 0 , viol_0);
$hold(posedge CK &&& cond7 , posedge RD &&& cond7 , 0 , viol_0);
$recovery(posedge RD &&& cond6 , posedge CK &&& cond6 , 0 , viol_0);
$hold(posedge CK &&& cond6 , posedge RD &&& cond6 , 0 , viol_0);
$recovery(posedge RD &&& cond5 , posedge CK &&& cond5 , 0 , viol_0);
$hold(posedge CK &&& cond5 , posedge RD &&& cond5 , 0 , viol_0);
$width(negedge RD &&& CK , 0 ,0, viol_0);
$setuphold(posedge CK &&& cond1 , posedge SE &&& cond1 , 0 ,0, viol_0, , , delayed_CK, delayed_SE);
$setuphold(posedge CK &&& cond1 , negedge SE &&& cond1 , 0 ,0, viol_0, , , delayed_CK, delayed_SE);
$setuphold(posedge CK &&& cond2 , posedge SE &&& cond2 , 0 ,0, viol_0, , , delayed_CK, delayed_SE);
$setuphold(posedge CK &&& cond2 , negedge SE &&& cond2 , 0 ,0, viol_0, , , delayed_CK, delayed_SE);
$setuphold(posedge CK &&& cond4 , posedge SI &&& cond4 , 0 ,0, viol_0, , , delayed_CK, delayed_SI);
$setuphold(posedge CK &&& cond4 , negedge SI &&& cond4 , 0 ,0, viol_0, , , delayed_CK, delayed_SI);
$setuphold(posedge CK &&& cond3 , posedge SI &&& cond3 , 0 ,0, viol_0, , , delayed_CK, delayed_SI);
$setuphold(posedge CK &&& cond3 , negedge SI &&& cond3 , 0 ,0, viol_0, , , delayed_CK, delayed_SI);
endspecify
   `endif

endmodule
`endcelldefine

//%END SVN_FSDPRBQ_F_4

//%BEGIN SVN_FSDPRBQ_FV1_1

`celldefine
module SVN_FSDPRBQ_FV1_1 (Q, CK, D, SI, SE, RD);
   output Q;
   input CK, D, SI, SE, RD;

   reg viol_0;
   wire delayed_CK, delayed_D, delayed_SI,
	delayed_SE, delayed_RD;

   wire int_res__D, int_res__RD, xcr_0;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////

`ifdef _fv
   buf (delayed_CK, CK);
   buf (delayed_D, D);
   buf (delayed_SI, SI);
   buf (delayed_SE, SE);
`endif
   buf (delayed_RD, RD);

   mux2 (int_res__D, delayed_SI, delayed_D, delayed_SE);
   not (int_res__RD, delayed_RD);
   dff_r_err (xcr_0, delayed_CK, int_res__D, int_res__RD);

   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////

   `ifdef VIRL_functiononly
        dff_r #`SNPS_SEQ_DELAY (Q, viol_0, delayed_CK, int_res__D, int_res__RD, xcr_0);

   `else
        dff_r (Q, viol_0, delayed_CK, int_res__D, int_res__RD, xcr_0);

   `endif

   `ifdef VIRL_functiononly

   `else

not U0 (_net_0, D);
not U1 (_net_1, SI);
and U2 (_net_2, RD, _net_0, SE, _net_1);
not U3 (_net_3, SI);
and U4 (_net_4, RD, D, SE, _net_3);
not U5 (_net_5, D);
not U6 (_net_6, SE);
and U7 (_net_7, RD, _net_5, _net_6);
or U8 (cond11, _net_2, _net_4, _net_7);
not U9 (_net_8, SE);
and U10 (_net_9, RD, D, _net_8);
and U11 (_net_10, RD, D, SE, SI);
not U12 (_net_11, D);
and U13 (_net_12, RD, _net_11, SE, SI);
or U14 (cond10, _net_9, _net_10, _net_12);
not U15 (_net_13, SE);
and U16 (cond0, _net_13, RD);
not U17 (_net_14, D);
not U18 (_net_15, CK);
not U19 (_net_16, SI);
and U20 (_net_17, _net_14, _net_15, SE, _net_16);
not U21 (_net_18, CK);
not U22 (_net_19, SI);
and U23 (_net_20, D, _net_18, SE, _net_19);
not U24 (_net_21, D);
not U25 (_net_22, CK);
not U26 (_net_23, SE);
and U27 (_net_24, _net_21, _net_22, _net_23);
or U28 (cond9, _net_17, _net_20, _net_24);
not U29 (_net_25, CK);
not U30 (_net_26, SE);
and U31 (_net_27, D, _net_25, _net_26);
not U32 (_net_28, CK);
and U33 (_net_29, D, _net_28, SE, SI);
not U34 (_net_30, D);
not U35 (_net_31, CK);
and U36 (_net_32, _net_30, _net_31, SE, SI);
or U37 (cond8, _net_27, _net_29, _net_32);
not U38 (_net_33, D);
and U39 (cond7, SE, _net_33, SI);
not U40 (_net_34, SE);
and U41 (cond6, _net_34, D);
and U42 (cond5, SE, D, SI);
not U43 (_net_35, D);
and U44 (cond1, RD, _net_35, SI);
not U45 (_net_36, SI);
and U46 (cond2, RD, D, _net_36);
not U47 (_net_37, D);
and U48 (cond4, RD, _net_37, SE);
and U49 (cond3, RD, D, SE);

specify
if ((~(CK) & D & SE & ~(SI)) | (~(CK) & ~(D) & SE & ~(SI)) | (~(CK) & ~(D) & ~(SE))) (negedge RD => (Q +: 1'b0))=(0, 0);
if ((~(CK) & D & SE & SI) | (~(CK) & D & ~(SE)) | (~(CK) & ~(D) & SE & SI)) (negedge RD => (Q +: 1'b0))=(0, 0);
if (CK) (negedge RD => (Q +: 1'b0))=(0, 0);
(negedge RD => (Q:1'b0))=(0, 0);
(posedge CK => (Q : 1'b1))=(0, 0);
$width(posedge CK &&& cond11 , 0 ,0, viol_0);
$width(negedge CK &&& cond11 , 0 ,0, viol_0);
$width(posedge CK &&& cond10 , 0 ,0, viol_0);
$width(negedge CK &&& cond10 , 0 ,0, viol_0);
$setuphold(posedge CK &&& cond0 , posedge D &&& cond0 , 0 ,0, viol_0, , , delayed_CK, delayed_D);
$setuphold(posedge CK &&& cond0 , negedge D &&& cond0 , 0 ,0, viol_0, , , delayed_CK, delayed_D);
$width(negedge RD &&& cond9 , 0 ,0, viol_0);
$width(negedge RD &&& cond8 , 0 ,0, viol_0);
$recovery(posedge RD &&& cond7 , posedge CK &&& cond7 , 0 , viol_0);
$hold(posedge CK &&& cond7 , posedge RD &&& cond7 , 0 , viol_0);
$recovery(posedge RD &&& cond6 , posedge CK &&& cond6 , 0 , viol_0);
$hold(posedge CK &&& cond6 , posedge RD &&& cond6 , 0 , viol_0);
$recovery(posedge RD &&& cond5 , posedge CK &&& cond5 , 0 , viol_0);
$hold(posedge CK &&& cond5 , posedge RD &&& cond5 , 0 , viol_0);
$width(negedge RD &&& CK , 0 ,0, viol_0);
$setuphold(posedge CK &&& cond1 , posedge SE &&& cond1 , 0 ,0, viol_0, , , delayed_CK, delayed_SE);
$setuphold(posedge CK &&& cond1 , negedge SE &&& cond1 , 0 ,0, viol_0, , , delayed_CK, delayed_SE);
$setuphold(posedge CK &&& cond2 , posedge SE &&& cond2 , 0 ,0, viol_0, , , delayed_CK, delayed_SE);
$setuphold(posedge CK &&& cond2 , negedge SE &&& cond2 , 0 ,0, viol_0, , , delayed_CK, delayed_SE);
$setuphold(posedge CK &&& cond4 , posedge SI &&& cond4 , 0 ,0, viol_0, , , delayed_CK, delayed_SI);
$setuphold(posedge CK &&& cond4 , negedge SI &&& cond4 , 0 ,0, viol_0, , , delayed_CK, delayed_SI);
$setuphold(posedge CK &&& cond3 , posedge SI &&& cond3 , 0 ,0, viol_0, , , delayed_CK, delayed_SI);
$setuphold(posedge CK &&& cond3 , negedge SI &&& cond3 , 0 ,0, viol_0, , , delayed_CK, delayed_SI);
endspecify
   `endif

endmodule
`endcelldefine

//%END SVN_FSDPRBQ_FV1_1

//%BEGIN SVN_FSDPRBQ_FV1_2

`celldefine
module SVN_FSDPRBQ_FV1_2 (Q, CK, D, SI, SE, RD);
   output Q;
   input CK, D, SI, SE, RD;

   reg viol_0;
   wire delayed_CK, delayed_D, delayed_SI,
	delayed_SE, delayed_RD;

   wire int_res__D, int_res__RD, xcr_0;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////

`ifdef _fv
   buf (delayed_CK, CK);
   buf (delayed_D, D);
   buf (delayed_SI, SI);
   buf (delayed_SE, SE);
`endif
   buf (delayed_RD, RD);

   mux2 (int_res__D, delayed_SI, delayed_D, delayed_SE);
   not (int_res__RD, delayed_RD);
   dff_r_err (xcr_0, delayed_CK, int_res__D, int_res__RD);

   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////

   `ifdef VIRL_functiononly
        dff_r #`SNPS_SEQ_DELAY (Q, viol_0, delayed_CK, int_res__D, int_res__RD, xcr_0);

   `else
        dff_r (Q, viol_0, delayed_CK, int_res__D, int_res__RD, xcr_0);

   `endif

   `ifdef VIRL_functiononly

   `else

not U0 (_net_0, D);
not U1 (_net_1, SI);
and U2 (_net_2, RD, _net_0, SE, _net_1);
not U3 (_net_3, SI);
and U4 (_net_4, RD, D, SE, _net_3);
not U5 (_net_5, D);
not U6 (_net_6, SE);
and U7 (_net_7, RD, _net_5, _net_6);
or U8 (cond11, _net_2, _net_4, _net_7);
not U9 (_net_8, SE);
and U10 (_net_9, RD, D, _net_8);
and U11 (_net_10, RD, D, SE, SI);
not U12 (_net_11, D);
and U13 (_net_12, RD, _net_11, SE, SI);
or U14 (cond10, _net_9, _net_10, _net_12);
not U15 (_net_13, SE);
and U16 (cond0, _net_13, RD);
not U17 (_net_14, D);
not U18 (_net_15, CK);
not U19 (_net_16, SI);
and U20 (_net_17, _net_14, _net_15, SE, _net_16);
not U21 (_net_18, CK);
not U22 (_net_19, SI);
and U23 (_net_20, D, _net_18, SE, _net_19);
not U24 (_net_21, D);
not U25 (_net_22, CK);
not U26 (_net_23, SE);
and U27 (_net_24, _net_21, _net_22, _net_23);
or U28 (cond9, _net_17, _net_20, _net_24);
not U29 (_net_25, CK);
not U30 (_net_26, SE);
and U31 (_net_27, D, _net_25, _net_26);
not U32 (_net_28, CK);
and U33 (_net_29, D, _net_28, SE, SI);
not U34 (_net_30, D);
not U35 (_net_31, CK);
and U36 (_net_32, _net_30, _net_31, SE, SI);
or U37 (cond8, _net_27, _net_29, _net_32);
not U38 (_net_33, D);
and U39 (cond7, SE, _net_33, SI);
not U40 (_net_34, SE);
and U41 (cond6, _net_34, D);
and U42 (cond5, SE, D, SI);
not U43 (_net_35, D);
and U44 (cond1, RD, _net_35, SI);
not U45 (_net_36, SI);
and U46 (cond2, RD, D, _net_36);
not U47 (_net_37, D);
and U48 (cond4, RD, _net_37, SE);
and U49 (cond3, RD, D, SE);

specify
if ((~(CK) & D & SE & ~(SI)) | (~(CK) & ~(D) & SE & ~(SI)) | (~(CK) & ~(D) & ~(SE))) (negedge RD => (Q +: 1'b0))=(0, 0);
if ((~(CK) & D & SE & SI) | (~(CK) & D & ~(SE)) | (~(CK) & ~(D) & SE & SI)) (negedge RD => (Q +: 1'b0))=(0, 0);
if (CK) (negedge RD => (Q +: 1'b0))=(0, 0);
(negedge RD => (Q:1'b0))=(0, 0);
(posedge CK => (Q : 1'b1))=(0, 0);
$width(posedge CK &&& cond11 , 0 ,0, viol_0);
$width(negedge CK &&& cond11 , 0 ,0, viol_0);
$width(posedge CK &&& cond10 , 0 ,0, viol_0);
$width(negedge CK &&& cond10 , 0 ,0, viol_0);
$setuphold(posedge CK &&& cond0 , posedge D &&& cond0 , 0 ,0, viol_0, , , delayed_CK, delayed_D);
$setuphold(posedge CK &&& cond0 , negedge D &&& cond0 , 0 ,0, viol_0, , , delayed_CK, delayed_D);
$width(negedge RD &&& cond9 , 0 ,0, viol_0);
$width(negedge RD &&& cond8 , 0 ,0, viol_0);
$recovery(posedge RD &&& cond7 , posedge CK &&& cond7 , 0 , viol_0);
$hold(posedge CK &&& cond7 , posedge RD &&& cond7 , 0 , viol_0);
$recovery(posedge RD &&& cond6 , posedge CK &&& cond6 , 0 , viol_0);
$hold(posedge CK &&& cond6 , posedge RD &&& cond6 , 0 , viol_0);
$recovery(posedge RD &&& cond5 , posedge CK &&& cond5 , 0 , viol_0);
$hold(posedge CK &&& cond5 , posedge RD &&& cond5 , 0 , viol_0);
$width(negedge RD &&& CK , 0 ,0, viol_0);
$setuphold(posedge CK &&& cond1 , posedge SE &&& cond1 , 0 ,0, viol_0, , , delayed_CK, delayed_SE);
$setuphold(posedge CK &&& cond1 , negedge SE &&& cond1 , 0 ,0, viol_0, , , delayed_CK, delayed_SE);
$setuphold(posedge CK &&& cond2 , posedge SE &&& cond2 , 0 ,0, viol_0, , , delayed_CK, delayed_SE);
$setuphold(posedge CK &&& cond2 , negedge SE &&& cond2 , 0 ,0, viol_0, , , delayed_CK, delayed_SE);
$setuphold(posedge CK &&& cond4 , posedge SI &&& cond4 , 0 ,0, viol_0, , , delayed_CK, delayed_SI);
$setuphold(posedge CK &&& cond4 , negedge SI &&& cond4 , 0 ,0, viol_0, , , delayed_CK, delayed_SI);
$setuphold(posedge CK &&& cond3 , posedge SI &&& cond3 , 0 ,0, viol_0, , , delayed_CK, delayed_SI);
$setuphold(posedge CK &&& cond3 , negedge SI &&& cond3 , 0 ,0, viol_0, , , delayed_CK, delayed_SI);
endspecify
   `endif

endmodule
`endcelldefine

//%END SVN_FSDPRBQ_FV1_2

//%BEGIN SVN_FSDPRBQ_FV1_4

`celldefine
module SVN_FSDPRBQ_FV1_4 (Q, CK, D, SI, SE, RD);
   output Q;
   input CK, D, SI, SE, RD;

   reg viol_0;
   wire delayed_CK, delayed_D, delayed_SI,
	delayed_SE, delayed_RD;

   wire int_res__D, int_res__RD, xcr_0;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////

`ifdef _fv
   buf (delayed_CK, CK);
   buf (delayed_D, D);
   buf (delayed_SI, SI);
   buf (delayed_SE, SE);
`endif
   buf (delayed_RD, RD);

   mux2 (int_res__D, delayed_SI, delayed_D, delayed_SE);
   not (int_res__RD, delayed_RD);
   dff_r_err (xcr_0, delayed_CK, int_res__D, int_res__RD);

   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////

   `ifdef VIRL_functiononly
        dff_r #`SNPS_SEQ_DELAY (Q, viol_0, delayed_CK, int_res__D, int_res__RD, xcr_0);

   `else
        dff_r (Q, viol_0, delayed_CK, int_res__D, int_res__RD, xcr_0);

   `endif

   `ifdef VIRL_functiononly

   `else

not U0 (_net_0, D);
not U1 (_net_1, SI);
and U2 (_net_2, RD, _net_0, SE, _net_1);
not U3 (_net_3, SI);
and U4 (_net_4, RD, D, SE, _net_3);
not U5 (_net_5, D);
not U6 (_net_6, SE);
and U7 (_net_7, RD, _net_5, _net_6);
or U8 (cond11, _net_2, _net_4, _net_7);
not U9 (_net_8, SE);
and U10 (_net_9, RD, D, _net_8);
and U11 (_net_10, RD, D, SE, SI);
not U12 (_net_11, D);
and U13 (_net_12, RD, _net_11, SE, SI);
or U14 (cond10, _net_9, _net_10, _net_12);
not U15 (_net_13, SE);
and U16 (cond0, _net_13, RD);
not U17 (_net_14, D);
not U18 (_net_15, CK);
not U19 (_net_16, SI);
and U20 (_net_17, _net_14, _net_15, SE, _net_16);
not U21 (_net_18, CK);
not U22 (_net_19, SI);
and U23 (_net_20, D, _net_18, SE, _net_19);
not U24 (_net_21, D);
not U25 (_net_22, CK);
not U26 (_net_23, SE);
and U27 (_net_24, _net_21, _net_22, _net_23);
or U28 (cond9, _net_17, _net_20, _net_24);
not U29 (_net_25, CK);
not U30 (_net_26, SE);
and U31 (_net_27, D, _net_25, _net_26);
not U32 (_net_28, CK);
and U33 (_net_29, D, _net_28, SE, SI);
not U34 (_net_30, D);
not U35 (_net_31, CK);
and U36 (_net_32, _net_30, _net_31, SE, SI);
or U37 (cond8, _net_27, _net_29, _net_32);
not U38 (_net_33, D);
and U39 (cond7, SE, _net_33, SI);
not U40 (_net_34, SE);
and U41 (cond6, _net_34, D);
and U42 (cond5, SE, D, SI);
not U43 (_net_35, D);
and U44 (cond1, RD, _net_35, SI);
not U45 (_net_36, SI);
and U46 (cond2, RD, D, _net_36);
not U47 (_net_37, D);
and U48 (cond4, RD, _net_37, SE);
and U49 (cond3, RD, D, SE);

specify
if ((~(CK) & D & SE & ~(SI)) | (~(CK) & ~(D) & SE & ~(SI)) | (~(CK) & ~(D) & ~(SE))) (negedge RD => (Q +: 1'b0))=(0, 0);
if ((~(CK) & D & SE & SI) | (~(CK) & D & ~(SE)) | (~(CK) & ~(D) & SE & SI)) (negedge RD => (Q +: 1'b0))=(0, 0);
if (CK) (negedge RD => (Q +: 1'b0))=(0, 0);
(negedge RD => (Q:1'b0))=(0, 0);
(posedge CK => (Q : 1'b1))=(0, 0);
$width(posedge CK &&& cond11 , 0 ,0, viol_0);
$width(negedge CK &&& cond11 , 0 ,0, viol_0);
$width(posedge CK &&& cond10 , 0 ,0, viol_0);
$width(negedge CK &&& cond10 , 0 ,0, viol_0);
$setuphold(posedge CK &&& cond0 , posedge D &&& cond0 , 0 ,0, viol_0, , , delayed_CK, delayed_D);
$setuphold(posedge CK &&& cond0 , negedge D &&& cond0 , 0 ,0, viol_0, , , delayed_CK, delayed_D);
$width(negedge RD &&& cond9 , 0 ,0, viol_0);
$width(negedge RD &&& cond8 , 0 ,0, viol_0);
$recovery(posedge RD &&& cond7 , posedge CK &&& cond7 , 0 , viol_0);
$hold(posedge CK &&& cond7 , posedge RD &&& cond7 , 0 , viol_0);
$recovery(posedge RD &&& cond6 , posedge CK &&& cond6 , 0 , viol_0);
$hold(posedge CK &&& cond6 , posedge RD &&& cond6 , 0 , viol_0);
$recovery(posedge RD &&& cond5 , posedge CK &&& cond5 , 0 , viol_0);
$hold(posedge CK &&& cond5 , posedge RD &&& cond5 , 0 , viol_0);
$width(negedge RD &&& CK , 0 ,0, viol_0);
$setuphold(posedge CK &&& cond1 , posedge SE &&& cond1 , 0 ,0, viol_0, , , delayed_CK, delayed_SE);
$setuphold(posedge CK &&& cond1 , negedge SE &&& cond1 , 0 ,0, viol_0, , , delayed_CK, delayed_SE);
$setuphold(posedge CK &&& cond2 , posedge SE &&& cond2 , 0 ,0, viol_0, , , delayed_CK, delayed_SE);
$setuphold(posedge CK &&& cond2 , negedge SE &&& cond2 , 0 ,0, viol_0, , , delayed_CK, delayed_SE);
$setuphold(posedge CK &&& cond4 , posedge SI &&& cond4 , 0 ,0, viol_0, , , delayed_CK, delayed_SI);
$setuphold(posedge CK &&& cond4 , negedge SI &&& cond4 , 0 ,0, viol_0, , , delayed_CK, delayed_SI);
$setuphold(posedge CK &&& cond3 , posedge SI &&& cond3 , 0 ,0, viol_0, , , delayed_CK, delayed_SI);
$setuphold(posedge CK &&& cond3 , negedge SI &&& cond3 , 0 ,0, viol_0, , , delayed_CK, delayed_SI);
endspecify
   `endif

endmodule
`endcelldefine

//%END SVN_FSDPRBQ_FV1_4

//%BEGIN SVN_FSDPRBQ_0P5

`celldefine
module SVN_FSDPRBQ_0P5 (Q, CK, D, SI, SE, RD);
   output Q;
   input CK, D, SI, SE, RD;

   reg viol_0;
   wire delayed_CK, delayed_D, delayed_SI,
	delayed_SE, delayed_RD;

   wire int_res__D, int_res__RD, xcr_0;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////

`ifdef _fv
   buf (delayed_CK, CK);
   buf (delayed_D, D);
   buf (delayed_SI, SI);
   buf (delayed_SE, SE);
`endif
   buf (delayed_RD, RD);

   mux2 (int_res__D, delayed_SI, delayed_D, delayed_SE);
   not (int_res__RD, delayed_RD);
   dff_r_err (xcr_0, delayed_CK, int_res__D, int_res__RD);

   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////

   `ifdef VIRL_functiononly
        dff_r #`SNPS_SEQ_DELAY (Q, viol_0, delayed_CK, int_res__D, int_res__RD, xcr_0);

   `else
        dff_r (Q, viol_0, delayed_CK, int_res__D, int_res__RD, xcr_0);

   `endif

   `ifdef VIRL_functiononly

   `else

not U0 (_net_0, D);
not U1 (_net_1, SI);
and U2 (_net_2, RD, _net_0, SE, _net_1);
not U3 (_net_3, SI);
and U4 (_net_4, RD, D, SE, _net_3);
not U5 (_net_5, D);
not U6 (_net_6, SE);
and U7 (_net_7, RD, _net_5, _net_6);
or U8 (cond11, _net_2, _net_4, _net_7);
not U9 (_net_8, SE);
and U10 (_net_9, RD, D, _net_8);
and U11 (_net_10, RD, D, SE, SI);
not U12 (_net_11, D);
and U13 (_net_12, RD, _net_11, SE, SI);
or U14 (cond10, _net_9, _net_10, _net_12);
not U15 (_net_13, SE);
and U16 (cond0, _net_13, RD);
not U17 (_net_14, D);
not U18 (_net_15, CK);
not U19 (_net_16, SI);
and U20 (_net_17, _net_14, _net_15, SE, _net_16);
not U21 (_net_18, CK);
not U22 (_net_19, SI);
and U23 (_net_20, D, _net_18, SE, _net_19);
not U24 (_net_21, D);
not U25 (_net_22, CK);
not U26 (_net_23, SE);
and U27 (_net_24, _net_21, _net_22, _net_23);
or U28 (cond9, _net_17, _net_20, _net_24);
not U29 (_net_25, CK);
not U30 (_net_26, SE);
and U31 (_net_27, D, _net_25, _net_26);
not U32 (_net_28, CK);
and U33 (_net_29, D, _net_28, SE, SI);
not U34 (_net_30, D);
not U35 (_net_31, CK);
and U36 (_net_32, _net_30, _net_31, SE, SI);
or U37 (cond8, _net_27, _net_29, _net_32);
not U38 (_net_33, D);
and U39 (cond7, SE, _net_33, SI);
not U40 (_net_34, SE);
and U41 (cond6, _net_34, D);
and U42 (cond5, SE, D, SI);
not U43 (_net_35, D);
and U44 (cond1, RD, _net_35, SI);
not U45 (_net_36, SI);
and U46 (cond2, RD, D, _net_36);
not U47 (_net_37, D);
and U48 (cond4, RD, _net_37, SE);
and U49 (cond3, RD, D, SE);

specify
if ((~(CK) & D & SE & ~(SI)) | (~(CK) & ~(D) & SE & ~(SI)) | (~(CK) & ~(D) & ~(SE))) (negedge RD => (Q +: 1'b0))=(0, 0);
if ((~(CK) & D & SE & SI) | (~(CK) & D & ~(SE)) | (~(CK) & ~(D) & SE & SI)) (negedge RD => (Q +: 1'b0))=(0, 0);
if (CK) (negedge RD => (Q +: 1'b0))=(0, 0);
(negedge RD => (Q:1'b0))=(0, 0);
(posedge CK => (Q : 1'b1))=(0, 0);
$width(posedge CK &&& cond11 , 0 ,0, viol_0);
$width(negedge CK &&& cond11 , 0 ,0, viol_0);
$width(posedge CK &&& cond10 , 0 ,0, viol_0);
$width(negedge CK &&& cond10 , 0 ,0, viol_0);
$setuphold(posedge CK &&& cond0 , posedge D &&& cond0 , 0 ,0, viol_0, , , delayed_CK, delayed_D);
$setuphold(posedge CK &&& cond0 , negedge D &&& cond0 , 0 ,0, viol_0, , , delayed_CK, delayed_D);
$width(negedge RD &&& cond9 , 0 ,0, viol_0);
$width(negedge RD &&& cond8 , 0 ,0, viol_0);
$recovery(posedge RD &&& cond7 , posedge CK &&& cond7 , 0 , viol_0);
$hold(posedge CK &&& cond7 , posedge RD &&& cond7 , 0 , viol_0);
$recovery(posedge RD &&& cond6 , posedge CK &&& cond6 , 0 , viol_0);
$hold(posedge CK &&& cond6 , posedge RD &&& cond6 , 0 , viol_0);
$recovery(posedge RD &&& cond5 , posedge CK &&& cond5 , 0 , viol_0);
$hold(posedge CK &&& cond5 , posedge RD &&& cond5 , 0 , viol_0);
$width(negedge RD &&& CK , 0 ,0, viol_0);
$setuphold(posedge CK &&& cond1 , posedge SE &&& cond1 , 0 ,0, viol_0, , , delayed_CK, delayed_SE);
$setuphold(posedge CK &&& cond1 , negedge SE &&& cond1 , 0 ,0, viol_0, , , delayed_CK, delayed_SE);
$setuphold(posedge CK &&& cond2 , posedge SE &&& cond2 , 0 ,0, viol_0, , , delayed_CK, delayed_SE);
$setuphold(posedge CK &&& cond2 , negedge SE &&& cond2 , 0 ,0, viol_0, , , delayed_CK, delayed_SE);
$setuphold(posedge CK &&& cond4 , posedge SI &&& cond4 , 0 ,0, viol_0, , , delayed_CK, delayed_SI);
$setuphold(posedge CK &&& cond4 , negedge SI &&& cond4 , 0 ,0, viol_0, , , delayed_CK, delayed_SI);
$setuphold(posedge CK &&& cond3 , posedge SI &&& cond3 , 0 ,0, viol_0, , , delayed_CK, delayed_SI);
$setuphold(posedge CK &&& cond3 , negedge SI &&& cond3 , 0 ,0, viol_0, , , delayed_CK, delayed_SI);
endspecify
   `endif

endmodule
`endcelldefine

//%END SVN_FSDPRBQ_0P5

//%BEGIN SVN_FSDPRBQ_1

`celldefine
module SVN_FSDPRBQ_1 (Q, CK, D, SI, SE, RD);
   output Q;
   input CK, D, SI, SE, RD;

   reg viol_0;
   wire delayed_CK, delayed_D, delayed_SI,
	delayed_SE, delayed_RD;

   wire int_res__D, int_res__RD, xcr_0;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////

`ifdef _fv
   buf (delayed_CK, CK);
   buf (delayed_D, D);
   buf (delayed_SI, SI);
   buf (delayed_SE, SE);
`endif
   buf (delayed_RD, RD);

   mux2 (int_res__D, delayed_SI, delayed_D, delayed_SE);
   not (int_res__RD, delayed_RD);
   dff_r_err (xcr_0, delayed_CK, int_res__D, int_res__RD);

   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////

   `ifdef VIRL_functiononly
        dff_r #`SNPS_SEQ_DELAY (Q, viol_0, delayed_CK, int_res__D, int_res__RD, xcr_0);

   `else
        dff_r (Q, viol_0, delayed_CK, int_res__D, int_res__RD, xcr_0);

   `endif

   `ifdef VIRL_functiononly

   `else

not U0 (_net_0, D);
not U1 (_net_1, SI);
and U2 (_net_2, RD, _net_0, SE, _net_1);
not U3 (_net_3, SI);
and U4 (_net_4, RD, D, SE, _net_3);
not U5 (_net_5, D);
not U6 (_net_6, SE);
and U7 (_net_7, RD, _net_5, _net_6);
or U8 (cond11, _net_2, _net_4, _net_7);
not U9 (_net_8, SE);
and U10 (_net_9, RD, D, _net_8);
and U11 (_net_10, RD, D, SE, SI);
not U12 (_net_11, D);
and U13 (_net_12, RD, _net_11, SE, SI);
or U14 (cond10, _net_9, _net_10, _net_12);
not U15 (_net_13, SE);
and U16 (cond0, _net_13, RD);
not U17 (_net_14, D);
not U18 (_net_15, CK);
not U19 (_net_16, SI);
and U20 (_net_17, _net_14, _net_15, SE, _net_16);
not U21 (_net_18, CK);
not U22 (_net_19, SI);
and U23 (_net_20, D, _net_18, SE, _net_19);
not U24 (_net_21, D);
not U25 (_net_22, CK);
not U26 (_net_23, SE);
and U27 (_net_24, _net_21, _net_22, _net_23);
or U28 (cond9, _net_17, _net_20, _net_24);
not U29 (_net_25, CK);
not U30 (_net_26, SE);
and U31 (_net_27, D, _net_25, _net_26);
not U32 (_net_28, CK);
and U33 (_net_29, D, _net_28, SE, SI);
not U34 (_net_30, D);
not U35 (_net_31, CK);
and U36 (_net_32, _net_30, _net_31, SE, SI);
or U37 (cond8, _net_27, _net_29, _net_32);
not U38 (_net_33, D);
and U39 (cond7, SE, _net_33, SI);
not U40 (_net_34, SE);
and U41 (cond6, _net_34, D);
and U42 (cond5, SE, D, SI);
not U43 (_net_35, D);
and U44 (cond1, RD, _net_35, SI);
not U45 (_net_36, SI);
and U46 (cond2, RD, D, _net_36);
not U47 (_net_37, D);
and U48 (cond4, RD, _net_37, SE);
and U49 (cond3, RD, D, SE);

specify
if ((~(CK) & D & SE & ~(SI)) | (~(CK) & ~(D) & SE & ~(SI)) | (~(CK) & ~(D) & ~(SE))) (negedge RD => (Q +: 1'b0))=(0, 0);
if ((~(CK) & D & SE & SI) | (~(CK) & D & ~(SE)) | (~(CK) & ~(D) & SE & SI)) (negedge RD => (Q +: 1'b0))=(0, 0);
if (CK) (negedge RD => (Q +: 1'b0))=(0, 0);
(negedge RD => (Q:1'b0))=(0, 0);
(posedge CK => (Q : 1'b1))=(0, 0);
$width(posedge CK &&& cond11 , 0 ,0, viol_0);
$width(negedge CK &&& cond11 , 0 ,0, viol_0);
$width(posedge CK &&& cond10 , 0 ,0, viol_0);
$width(negedge CK &&& cond10 , 0 ,0, viol_0);
$setuphold(posedge CK &&& cond0 , posedge D &&& cond0 , 0 ,0, viol_0, , , delayed_CK, delayed_D);
$setuphold(posedge CK &&& cond0 , negedge D &&& cond0 , 0 ,0, viol_0, , , delayed_CK, delayed_D);
$width(negedge RD &&& cond9 , 0 ,0, viol_0);
$width(negedge RD &&& cond8 , 0 ,0, viol_0);
$recovery(posedge RD &&& cond7 , posedge CK &&& cond7 , 0 , viol_0);
$hold(posedge CK &&& cond7 , posedge RD &&& cond7 , 0 , viol_0);
$recovery(posedge RD &&& cond6 , posedge CK &&& cond6 , 0 , viol_0);
$hold(posedge CK &&& cond6 , posedge RD &&& cond6 , 0 , viol_0);
$recovery(posedge RD &&& cond5 , posedge CK &&& cond5 , 0 , viol_0);
$hold(posedge CK &&& cond5 , posedge RD &&& cond5 , 0 , viol_0);
$width(negedge RD &&& CK , 0 ,0, viol_0);
$setuphold(posedge CK &&& cond1 , posedge SE &&& cond1 , 0 ,0, viol_0, , , delayed_CK, delayed_SE);
$setuphold(posedge CK &&& cond1 , negedge SE &&& cond1 , 0 ,0, viol_0, , , delayed_CK, delayed_SE);
$setuphold(posedge CK &&& cond2 , posedge SE &&& cond2 , 0 ,0, viol_0, , , delayed_CK, delayed_SE);
$setuphold(posedge CK &&& cond2 , negedge SE &&& cond2 , 0 ,0, viol_0, , , delayed_CK, delayed_SE);
$setuphold(posedge CK &&& cond4 , posedge SI &&& cond4 , 0 ,0, viol_0, , , delayed_CK, delayed_SI);
$setuphold(posedge CK &&& cond4 , negedge SI &&& cond4 , 0 ,0, viol_0, , , delayed_CK, delayed_SI);
$setuphold(posedge CK &&& cond3 , posedge SI &&& cond3 , 0 ,0, viol_0, , , delayed_CK, delayed_SI);
$setuphold(posedge CK &&& cond3 , negedge SI &&& cond3 , 0 ,0, viol_0, , , delayed_CK, delayed_SI);
endspecify
   `endif

endmodule
`endcelldefine

//%END SVN_FSDPRBQ_1

//%BEGIN SVN_FSDPRBQ_2

`celldefine
module SVN_FSDPRBQ_2 (Q, CK, D, SI, SE, RD);
   output Q;
   input CK, D, SI, SE, RD;

   reg viol_0;
   wire delayed_CK, delayed_D, delayed_SI,
	delayed_SE, delayed_RD;

   wire int_res__D, int_res__RD, xcr_0;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////

`ifdef _fv
   buf (delayed_CK, CK);
   buf (delayed_D, D);
   buf (delayed_SI, SI);
   buf (delayed_SE, SE);
`endif
   buf (delayed_RD, RD);

   mux2 (int_res__D, delayed_SI, delayed_D, delayed_SE);
   not (int_res__RD, delayed_RD);
   dff_r_err (xcr_0, delayed_CK, int_res__D, int_res__RD);

   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////

   `ifdef VIRL_functiononly
        dff_r #`SNPS_SEQ_DELAY (Q, viol_0, delayed_CK, int_res__D, int_res__RD, xcr_0);

   `else
        dff_r (Q, viol_0, delayed_CK, int_res__D, int_res__RD, xcr_0);

   `endif

   `ifdef VIRL_functiononly

   `else

not U0 (_net_0, D);
not U1 (_net_1, SI);
and U2 (_net_2, RD, _net_0, SE, _net_1);
not U3 (_net_3, SI);
and U4 (_net_4, RD, D, SE, _net_3);
not U5 (_net_5, D);
not U6 (_net_6, SE);
and U7 (_net_7, RD, _net_5, _net_6);
or U8 (cond11, _net_2, _net_4, _net_7);
not U9 (_net_8, SE);
and U10 (_net_9, RD, D, _net_8);
and U11 (_net_10, RD, D, SE, SI);
not U12 (_net_11, D);
and U13 (_net_12, RD, _net_11, SE, SI);
or U14 (cond10, _net_9, _net_10, _net_12);
not U15 (_net_13, SE);
and U16 (cond0, _net_13, RD);
not U17 (_net_14, D);
not U18 (_net_15, CK);
not U19 (_net_16, SI);
and U20 (_net_17, _net_14, _net_15, SE, _net_16);
not U21 (_net_18, CK);
not U22 (_net_19, SI);
and U23 (_net_20, D, _net_18, SE, _net_19);
not U24 (_net_21, D);
not U25 (_net_22, CK);
not U26 (_net_23, SE);
and U27 (_net_24, _net_21, _net_22, _net_23);
or U28 (cond9, _net_17, _net_20, _net_24);
not U29 (_net_25, CK);
not U30 (_net_26, SE);
and U31 (_net_27, D, _net_25, _net_26);
not U32 (_net_28, CK);
and U33 (_net_29, D, _net_28, SE, SI);
not U34 (_net_30, D);
not U35 (_net_31, CK);
and U36 (_net_32, _net_30, _net_31, SE, SI);
or U37 (cond8, _net_27, _net_29, _net_32);
not U38 (_net_33, D);
and U39 (cond7, SE, _net_33, SI);
not U40 (_net_34, SE);
and U41 (cond6, _net_34, D);
and U42 (cond5, SE, D, SI);
not U43 (_net_35, D);
and U44 (cond1, RD, _net_35, SI);
not U45 (_net_36, SI);
and U46 (cond2, RD, D, _net_36);
not U47 (_net_37, D);
and U48 (cond4, RD, _net_37, SE);
and U49 (cond3, RD, D, SE);

specify
if ((~(CK) & D & SE & ~(SI)) | (~(CK) & ~(D) & SE & ~(SI)) | (~(CK) & ~(D) & ~(SE))) (negedge RD => (Q +: 1'b0))=(0, 0);
if ((~(CK) & D & SE & SI) | (~(CK) & D & ~(SE)) | (~(CK) & ~(D) & SE & SI)) (negedge RD => (Q +: 1'b0))=(0, 0);
if (CK) (negedge RD => (Q +: 1'b0))=(0, 0);
(negedge RD => (Q:1'b0))=(0, 0);
(posedge CK => (Q : 1'b1))=(0, 0);
$width(posedge CK &&& cond11 , 0 ,0, viol_0);
$width(negedge CK &&& cond11 , 0 ,0, viol_0);
$width(posedge CK &&& cond10 , 0 ,0, viol_0);
$width(negedge CK &&& cond10 , 0 ,0, viol_0);
$setuphold(posedge CK &&& cond0 , posedge D &&& cond0 , 0 ,0, viol_0, , , delayed_CK, delayed_D);
$setuphold(posedge CK &&& cond0 , negedge D &&& cond0 , 0 ,0, viol_0, , , delayed_CK, delayed_D);
$width(negedge RD &&& cond9 , 0 ,0, viol_0);
$width(negedge RD &&& cond8 , 0 ,0, viol_0);
$recovery(posedge RD &&& cond7 , posedge CK &&& cond7 , 0 , viol_0);
$hold(posedge CK &&& cond7 , posedge RD &&& cond7 , 0 , viol_0);
$recovery(posedge RD &&& cond6 , posedge CK &&& cond6 , 0 , viol_0);
$hold(posedge CK &&& cond6 , posedge RD &&& cond6 , 0 , viol_0);
$recovery(posedge RD &&& cond5 , posedge CK &&& cond5 , 0 , viol_0);
$hold(posedge CK &&& cond5 , posedge RD &&& cond5 , 0 , viol_0);
$width(negedge RD &&& CK , 0 ,0, viol_0);
$setuphold(posedge CK &&& cond1 , posedge SE &&& cond1 , 0 ,0, viol_0, , , delayed_CK, delayed_SE);
$setuphold(posedge CK &&& cond1 , negedge SE &&& cond1 , 0 ,0, viol_0, , , delayed_CK, delayed_SE);
$setuphold(posedge CK &&& cond2 , posedge SE &&& cond2 , 0 ,0, viol_0, , , delayed_CK, delayed_SE);
$setuphold(posedge CK &&& cond2 , negedge SE &&& cond2 , 0 ,0, viol_0, , , delayed_CK, delayed_SE);
$setuphold(posedge CK &&& cond4 , posedge SI &&& cond4 , 0 ,0, viol_0, , , delayed_CK, delayed_SI);
$setuphold(posedge CK &&& cond4 , negedge SI &&& cond4 , 0 ,0, viol_0, , , delayed_CK, delayed_SI);
$setuphold(posedge CK &&& cond3 , posedge SI &&& cond3 , 0 ,0, viol_0, , , delayed_CK, delayed_SI);
$setuphold(posedge CK &&& cond3 , negedge SI &&& cond3 , 0 ,0, viol_0, , , delayed_CK, delayed_SI);
endspecify
   `endif

endmodule
`endcelldefine

//%END SVN_FSDPRBQ_2

//%BEGIN SVN_FSDPRBQ_4

`celldefine
module SVN_FSDPRBQ_4 (Q, CK, D, SI, SE, RD);
   output Q;
   input CK, D, SI, SE, RD;

   reg viol_0;
   wire delayed_CK, delayed_D, delayed_SI,
	delayed_SE, delayed_RD;

   wire int_res__D, int_res__RD, xcr_0;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////

`ifdef _fv
   buf (delayed_CK, CK);
   buf (delayed_D, D);
   buf (delayed_SI, SI);
   buf (delayed_SE, SE);
`endif
   buf (delayed_RD, RD);

   mux2 (int_res__D, delayed_SI, delayed_D, delayed_SE);
   not (int_res__RD, delayed_RD);
   dff_r_err (xcr_0, delayed_CK, int_res__D, int_res__RD);

   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////

   `ifdef VIRL_functiononly
        dff_r #`SNPS_SEQ_DELAY (Q, viol_0, delayed_CK, int_res__D, int_res__RD, xcr_0);

   `else
        dff_r (Q, viol_0, delayed_CK, int_res__D, int_res__RD, xcr_0);

   `endif

   `ifdef VIRL_functiononly

   `else

not U0 (_net_0, D);
not U1 (_net_1, SI);
and U2 (_net_2, RD, _net_0, SE, _net_1);
not U3 (_net_3, SI);
and U4 (_net_4, RD, D, SE, _net_3);
not U5 (_net_5, D);
not U6 (_net_6, SE);
and U7 (_net_7, RD, _net_5, _net_6);
or U8 (cond11, _net_2, _net_4, _net_7);
not U9 (_net_8, SE);
and U10 (_net_9, RD, D, _net_8);
and U11 (_net_10, RD, D, SE, SI);
not U12 (_net_11, D);
and U13 (_net_12, RD, _net_11, SE, SI);
or U14 (cond10, _net_9, _net_10, _net_12);
not U15 (_net_13, SE);
and U16 (cond0, _net_13, RD);
not U17 (_net_14, D);
not U18 (_net_15, CK);
not U19 (_net_16, SI);
and U20 (_net_17, _net_14, _net_15, SE, _net_16);
not U21 (_net_18, CK);
not U22 (_net_19, SI);
and U23 (_net_20, D, _net_18, SE, _net_19);
not U24 (_net_21, D);
not U25 (_net_22, CK);
not U26 (_net_23, SE);
and U27 (_net_24, _net_21, _net_22, _net_23);
or U28 (cond9, _net_17, _net_20, _net_24);
not U29 (_net_25, CK);
not U30 (_net_26, SE);
and U31 (_net_27, D, _net_25, _net_26);
not U32 (_net_28, CK);
and U33 (_net_29, D, _net_28, SE, SI);
not U34 (_net_30, D);
not U35 (_net_31, CK);
and U36 (_net_32, _net_30, _net_31, SE, SI);
or U37 (cond8, _net_27, _net_29, _net_32);
not U38 (_net_33, D);
and U39 (cond7, SE, _net_33, SI);
not U40 (_net_34, SE);
and U41 (cond6, _net_34, D);
and U42 (cond5, SE, D, SI);
not U43 (_net_35, D);
and U44 (cond1, RD, _net_35, SI);
not U45 (_net_36, SI);
and U46 (cond2, RD, D, _net_36);
not U47 (_net_37, D);
and U48 (cond4, RD, _net_37, SE);
and U49 (cond3, RD, D, SE);

specify
if ((~(CK) & D & SE & ~(SI)) | (~(CK) & ~(D) & SE & ~(SI)) | (~(CK) & ~(D) & ~(SE))) (negedge RD => (Q +: 1'b0))=(0, 0);
if ((~(CK) & D & SE & SI) | (~(CK) & D & ~(SE)) | (~(CK) & ~(D) & SE & SI)) (negedge RD => (Q +: 1'b0))=(0, 0);
if (CK) (negedge RD => (Q +: 1'b0))=(0, 0);
(negedge RD => (Q:1'b0))=(0, 0);
(posedge CK => (Q : 1'b1))=(0, 0);
$width(posedge CK &&& cond11 , 0 ,0, viol_0);
$width(negedge CK &&& cond11 , 0 ,0, viol_0);
$width(posedge CK &&& cond10 , 0 ,0, viol_0);
$width(negedge CK &&& cond10 , 0 ,0, viol_0);
$setuphold(posedge CK &&& cond0 , posedge D &&& cond0 , 0 ,0, viol_0, , , delayed_CK, delayed_D);
$setuphold(posedge CK &&& cond0 , negedge D &&& cond0 , 0 ,0, viol_0, , , delayed_CK, delayed_D);
$width(negedge RD &&& cond9 , 0 ,0, viol_0);
$width(negedge RD &&& cond8 , 0 ,0, viol_0);
$recovery(posedge RD &&& cond7 , posedge CK &&& cond7 , 0 , viol_0);
$hold(posedge CK &&& cond7 , posedge RD &&& cond7 , 0 , viol_0);
$recovery(posedge RD &&& cond6 , posedge CK &&& cond6 , 0 , viol_0);
$hold(posedge CK &&& cond6 , posedge RD &&& cond6 , 0 , viol_0);
$recovery(posedge RD &&& cond5 , posedge CK &&& cond5 , 0 , viol_0);
$hold(posedge CK &&& cond5 , posedge RD &&& cond5 , 0 , viol_0);
$width(negedge RD &&& CK , 0 ,0, viol_0);
$setuphold(posedge CK &&& cond1 , posedge SE &&& cond1 , 0 ,0, viol_0, , , delayed_CK, delayed_SE);
$setuphold(posedge CK &&& cond1 , negedge SE &&& cond1 , 0 ,0, viol_0, , , delayed_CK, delayed_SE);
$setuphold(posedge CK &&& cond2 , posedge SE &&& cond2 , 0 ,0, viol_0, , , delayed_CK, delayed_SE);
$setuphold(posedge CK &&& cond2 , negedge SE &&& cond2 , 0 ,0, viol_0, , , delayed_CK, delayed_SE);
$setuphold(posedge CK &&& cond4 , posedge SI &&& cond4 , 0 ,0, viol_0, , , delayed_CK, delayed_SI);
$setuphold(posedge CK &&& cond4 , negedge SI &&& cond4 , 0 ,0, viol_0, , , delayed_CK, delayed_SI);
$setuphold(posedge CK &&& cond3 , posedge SI &&& cond3 , 0 ,0, viol_0, , , delayed_CK, delayed_SI);
$setuphold(posedge CK &&& cond3 , negedge SI &&& cond3 , 0 ,0, viol_0, , , delayed_CK, delayed_SI);
endspecify
   `endif

endmodule
`endcelldefine

//%END SVN_FSDPRBQ_4

//%BEGIN SVN_FSDPRBSBQ_1

`celldefine
module SVN_FSDPRBSBQ_1 (Q, CK, D, SI, SE, RD, SD);
   output Q;
   input CK, D, SI, SE, RD, SD;

   reg viol_0;
   wire delayed_CK, delayed_D, delayed_SI,
	delayed_SE, delayed_RD, delayed_SD;

   wire int_res__D, int_res__SD, int_res__RD, xcr_0;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////

`ifdef _fv
   buf (delayed_CK, CK);
   buf (delayed_D, D);
   buf (delayed_SI, SI);
   buf (delayed_SE, SE);
`endif
   buf (delayed_RD, RD);
   buf (delayed_SD, SD);

   mux2 (int_res__D, delayed_SI, delayed_D, delayed_SE);
   not (int_res__SD, delayed_SD);
   not (int_res__RD, delayed_RD);
   dff_sr_err (xcr_0, delayed_CK, int_res__D, int_res__SD, int_res__RD);

   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////

   `ifdef VIRL_functiononly
        dff_sr_0 #`SNPS_SEQ_DELAY (Q, viol_0, delayed_CK, int_res__D, int_res__SD, int_res__RD, xcr_0);
   `else
        dff_sr_0 (Q, viol_0, delayed_CK, int_res__D, int_res__SD, int_res__RD, xcr_0);
    `endif

    `ifdef VIRL_functiononly

    `else

not U0 (_net_0, D);
not U1 (_net_1, SI);
and U2 (_net_2, RD, _net_0, SD, SE, _net_1);
not U3 (_net_3, SI);
and U4 (_net_4, RD, D, SD, SE, _net_3);
not U5 (_net_5, D);
not U6 (_net_6, SE);
and U7 (_net_7, RD, _net_5, SD, _net_6);
or U8 (cond20, _net_2, _net_4, _net_7);
not U9 (_net_8, SE);
and U10 (_net_9, RD, D, SD, _net_8);
and U11 (_net_10, RD, D, SD, SE, SI);
not U12 (_net_11, D);
and U13 (_net_12, RD, _net_11, SD, SE, SI);
or U14 (cond19, _net_9, _net_10, _net_12);
not U15 (_net_13, SE);
and U16 (cond0, SD, RD, _net_13);
not U17 (_net_14, D);
not U18 (_net_15, CK);
not U19 (_net_16, SI);
and U20 (_net_17, _net_14, _net_15, SD, SE, _net_16);
not U21 (_net_18, CK);
not U22 (_net_19, SI);
and U23 (_net_20, D, _net_18, SD, SE, _net_19);
not U24 (_net_21, D);
not U25 (_net_22, CK);
not U26 (_net_23, SE);
and U27 (_net_24, _net_21, _net_22, SD, _net_23);
or U28 (cond12, _net_17, _net_20, _net_24);
not U29 (_net_25, CK);
not U30 (_net_26, SE);
and U31 (_net_27, D, _net_25, SD, _net_26);
not U32 (_net_28, CK);
and U33 (_net_29, D, _net_28, SD, SE, SI);
not U34 (_net_30, D);
not U35 (_net_31, CK);
and U36 (_net_32, _net_30, _net_31, SD, SE, SI);
or U37 (cond11, _net_27, _net_29, _net_32);
not U38 (_net_33, D);
not U39 (_net_34, CK);
not U40 (_net_35, SI);
and U41 (_net_36, _net_33, _net_34, SE, _net_35);
not U42 (_net_37, CK);
not U43 (_net_38, SI);
and U44 (_net_39, D, _net_37, SE, _net_38);
not U45 (_net_40, D);
not U46 (_net_41, CK);
not U47 (_net_42, SE);
and U48 (_net_43, _net_40, _net_41, _net_42);
or U49 (cond9, _net_36, _net_39, _net_43);
not U50 (_net_44, CK);
not U51 (_net_45, SE);
and U52 (_net_46, D, _net_44, _net_45);
not U53 (_net_47, CK);
and U54 (_net_48, D, _net_47, SE, SI);
not U55 (_net_49, D);
not U56 (_net_50, CK);
and U57 (_net_51, _net_49, _net_50, SE, SI);
or U58 (cond8, _net_46, _net_48, _net_51);
not U59 (_net_52, D);
and U60 (cond7, SD, _net_52, SE, SI);
and U61 (cond10, SD, CK);
not U62 (_net_53, SE);
and U63 (cond6, SD, D, _net_53);
and U64 (cond5, SD, D, SE, SI);
not U65 (_net_54, D);
not U66 (_net_55, CK);
not U67 (_net_56, SI);
and U68 (_net_57, _net_54, _net_55, RD, SE, _net_56);
not U69 (_net_58, CK);
not U70 (_net_59, SI);
and U71 (_net_60, D, _net_58, RD, SE, _net_59);
not U72 (_net_61, D);
not U73 (_net_62, CK);
not U74 (_net_63, SE);
and U75 (_net_64, _net_61, _net_62, RD, _net_63);
or U76 (cond18, _net_57, _net_60, _net_64);
not U77 (_net_65, CK);
not U78 (_net_66, SE);
and U79 (_net_67, D, _net_65, RD, _net_66);
not U80 (_net_68, CK);
and U81 (_net_69, D, _net_68, RD, SE, SI);
not U82 (_net_70, D);
not U83 (_net_71, CK);
and U84 (_net_72, _net_70, _net_71, RD, SE, SI);
or U85 (cond17, _net_67, _net_69, _net_72);
not U86 (_net_73, D);
not U87 (_net_74, SE);
and U88 (cond15, RD, _net_73, _net_74);
not U89 (_net_75, D);
not U90 (_net_76, SI);
and U91 (cond14, RD, _net_75, SE, _net_76);
and U92 (cond16, RD, CK);
not U93 (_net_77, SI);
and U94 (cond13, RD, D, SE, _net_77);
not U95 (_net_78, D);
and U96 (cond1, RD, _net_78, SD, SI);
not U97 (_net_79, SI);
and U98 (cond2, RD, D, SD, _net_79);
not U99 (_net_80, D);
and U100 (cond4, RD, _net_80, SD, SE);
and U101 (cond3, RD, D, SD, SE);

specify
if ((~(CK) & ~(SD))) (negedge RD => (Q +: 1'b0))=(0, 0);
if ((~(CK) & ~(SD))) (posedge RD => (Q +: 1'b1))=(0, 0);
if ((~(CK) & D & SD & SE & ~(SI)) | (~(CK) & ~(D) & SD & SE & ~(SI)) | (~(CK) & ~(D) & SD & ~(SE))) (negedge RD => (Q +: 1'b0))=(0, 0);
if ((~(CK) & D & SD & SE & SI) | (~(CK) & D & SD & ~(SE)) | (~(CK) & ~(D) & SD & SE & SI)) (negedge RD => (Q +: 1'b0))=(0, 0);
if ((CK & ~(SD))) (negedge RD => (Q +: 1'b0))=(0, 0);
if ((CK & ~(SD))) (posedge RD => (Q +: 1'b1))=(0, 0);
if ((CK & SD)) (negedge RD => (Q +: 1'b0))=(0, 0);
(negedge RD => (Q:1'b0))=(0, 0);
if ((~(CK) & D & RD & SE & ~(SI)) | (~(CK) & ~(D) & RD & SE & ~(SI)) | (~(CK) & ~(D) & RD & ~(SE))) (negedge SD => (Q -: 1'b1))=(0, 0);
if ((~(CK) & D & RD & SE & SI) | (~(CK) & D & RD & ~(SE)) | (~(CK) & ~(D) & RD & SE & SI)) (negedge SD => (Q -: 1'b1))=(0, 0);
if ((CK & RD)) (negedge SD => (Q -: 1'b1))=(0, 0);
(negedge SD => (Q:1'b1))=(0, 0);
(posedge CK => (Q : 1'b1))=(0, 0);
$width(posedge CK &&& cond20 , 0 ,0, viol_0);
$width(negedge CK &&& cond20 , 0 ,0, viol_0);
$width(posedge CK &&& cond19 , 0 ,0, viol_0);
$width(negedge CK &&& cond19 , 0 ,0, viol_0);
$setuphold(posedge CK &&& cond0 , posedge D &&& cond0 , 0 ,0, viol_0, , , delayed_CK, delayed_D);
$setuphold(posedge CK &&& cond0 , negedge D &&& cond0 , 0 ,0, viol_0, , , delayed_CK, delayed_D);
$width(negedge RD &&& cond12 , 0 ,0, viol_0);
$width(negedge RD &&& cond11 , 0 ,0, viol_0);
$setuphold(posedge SD &&& cond9 , posedge RD &&& cond9 , 0 ,0, viol_0, , , delayed_SD, delayed_RD);
$setuphold(posedge SD &&& cond8 , posedge RD &&& cond8 , 0 ,0, viol_0, , , delayed_SD, delayed_RD);
$recovery(posedge RD &&& cond7 , posedge CK &&& cond7 , 0 , viol_0);
$hold(posedge CK &&& cond7 , posedge RD &&& cond7 , 0 , viol_0);
$width(negedge RD &&& cond10 , 0 ,0, viol_0);
$recovery(posedge RD &&& cond6 , posedge CK &&& cond6 , 0 , viol_0);
$hold(posedge CK &&& cond6 , posedge RD &&& cond6 , 0 , viol_0);
$recovery(posedge RD &&& cond5 , posedge CK &&& cond5 , 0 , viol_0);
$hold(posedge CK &&& cond5 , posedge RD &&& cond5 , 0 , viol_0);
$setuphold(posedge SD &&& CK , posedge RD &&& CK , 0 ,0, viol_0, , , delayed_SD, delayed_RD);
$width(negedge SD &&& cond18 , 0 ,0, viol_0);
$width(negedge SD &&& cond17 , 0 ,0, viol_0);
$setuphold(posedge RD &&& cond9 , posedge SD &&& cond9 , 0 ,0, viol_0, , , delayed_RD, delayed_SD);
$setuphold(posedge RD &&& cond8 , posedge SD &&& cond8 , 0 ,0, viol_0, , , delayed_RD, delayed_SD);
$recovery(posedge SD &&& cond15 , posedge CK &&& cond15 , 0 , viol_0);
$hold(posedge CK &&& cond15 , posedge SD &&& cond15 , 0 , viol_0);
$recovery(posedge SD &&& cond14 , posedge CK &&& cond14 , 0 , viol_0);
$hold(posedge CK &&& cond14 , posedge SD &&& cond14 , 0 , viol_0);
$width(negedge SD &&& cond16 , 0 ,0, viol_0);
$recovery(posedge SD &&& cond13 , posedge CK &&& cond13 , 0 , viol_0);
$hold(posedge CK &&& cond13 , posedge SD &&& cond13 , 0 , viol_0);
$setuphold(posedge RD &&& CK , posedge SD &&& CK , 0 ,0, viol_0, , , delayed_RD, delayed_SD);
$setuphold(posedge CK &&& cond1 , posedge SE &&& cond1 , 0 ,0, viol_0, , , delayed_CK, delayed_SE);
$setuphold(posedge CK &&& cond1 , negedge SE &&& cond1 , 0 ,0, viol_0, , , delayed_CK, delayed_SE);
$setuphold(posedge CK &&& cond2 , posedge SE &&& cond2 , 0 ,0, viol_0, , , delayed_CK, delayed_SE);
$setuphold(posedge CK &&& cond2 , negedge SE &&& cond2 , 0 ,0, viol_0, , , delayed_CK, delayed_SE);
$setuphold(posedge CK &&& cond4 , posedge SI &&& cond4 , 0 ,0, viol_0, , , delayed_CK, delayed_SI);
$setuphold(posedge CK &&& cond4 , negedge SI &&& cond4 , 0 ,0, viol_0, , , delayed_CK, delayed_SI);
$setuphold(posedge CK &&& cond3 , posedge SI &&& cond3 , 0 ,0, viol_0, , , delayed_CK, delayed_SI);
$setuphold(posedge CK &&& cond3 , negedge SI &&& cond3 , 0 ,0, viol_0, , , delayed_CK, delayed_SI);
endspecify
    `endif

endmodule
`endcelldefine

//%END SVN_FSDPRBSBQ_1

//%BEGIN SVN_FSDPRBSBQ_2

`celldefine
module SVN_FSDPRBSBQ_2 (Q, CK, D, SI, SE, RD, SD);
   output Q;
   input CK, D, SI, SE, RD, SD;

   reg viol_0;
   wire delayed_CK, delayed_D, delayed_SI,
	delayed_SE, delayed_RD, delayed_SD;

   wire int_res__D, int_res__SD, int_res__RD, xcr_0;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////

`ifdef _fv
   buf (delayed_CK, CK);
   buf (delayed_D, D);
   buf (delayed_SI, SI);
   buf (delayed_SE, SE);
`endif
   buf (delayed_RD, RD);
   buf (delayed_SD, SD);

   mux2 (int_res__D, delayed_SI, delayed_D, delayed_SE);
   not (int_res__SD, delayed_SD);
   not (int_res__RD, delayed_RD);
   dff_sr_err (xcr_0, delayed_CK, int_res__D, int_res__SD, int_res__RD);

   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////

   `ifdef VIRL_functiononly
        dff_sr_0 #`SNPS_SEQ_DELAY (Q, viol_0, delayed_CK, int_res__D, int_res__SD, int_res__RD, xcr_0);
   `else
        dff_sr_0 (Q, viol_0, delayed_CK, int_res__D, int_res__SD, int_res__RD, xcr_0);
    `endif

    `ifdef VIRL_functiononly

    `else

not U0 (_net_0, D);
not U1 (_net_1, SI);
and U2 (_net_2, RD, _net_0, SD, SE, _net_1);
not U3 (_net_3, SI);
and U4 (_net_4, RD, D, SD, SE, _net_3);
not U5 (_net_5, D);
not U6 (_net_6, SE);
and U7 (_net_7, RD, _net_5, SD, _net_6);
or U8 (cond20, _net_2, _net_4, _net_7);
not U9 (_net_8, SE);
and U10 (_net_9, RD, D, SD, _net_8);
and U11 (_net_10, RD, D, SD, SE, SI);
not U12 (_net_11, D);
and U13 (_net_12, RD, _net_11, SD, SE, SI);
or U14 (cond19, _net_9, _net_10, _net_12);
not U15 (_net_13, SE);
and U16 (cond0, SD, RD, _net_13);
not U17 (_net_14, D);
not U18 (_net_15, CK);
not U19 (_net_16, SI);
and U20 (_net_17, _net_14, _net_15, SD, SE, _net_16);
not U21 (_net_18, CK);
not U22 (_net_19, SI);
and U23 (_net_20, D, _net_18, SD, SE, _net_19);
not U24 (_net_21, D);
not U25 (_net_22, CK);
not U26 (_net_23, SE);
and U27 (_net_24, _net_21, _net_22, SD, _net_23);
or U28 (cond12, _net_17, _net_20, _net_24);
not U29 (_net_25, CK);
not U30 (_net_26, SE);
and U31 (_net_27, D, _net_25, SD, _net_26);
not U32 (_net_28, CK);
and U33 (_net_29, D, _net_28, SD, SE, SI);
not U34 (_net_30, D);
not U35 (_net_31, CK);
and U36 (_net_32, _net_30, _net_31, SD, SE, SI);
or U37 (cond11, _net_27, _net_29, _net_32);
not U38 (_net_33, D);
not U39 (_net_34, CK);
not U40 (_net_35, SI);
and U41 (_net_36, _net_33, _net_34, SE, _net_35);
not U42 (_net_37, CK);
not U43 (_net_38, SI);
and U44 (_net_39, D, _net_37, SE, _net_38);
not U45 (_net_40, D);
not U46 (_net_41, CK);
not U47 (_net_42, SE);
and U48 (_net_43, _net_40, _net_41, _net_42);
or U49 (cond9, _net_36, _net_39, _net_43);
not U50 (_net_44, CK);
not U51 (_net_45, SE);
and U52 (_net_46, D, _net_44, _net_45);
not U53 (_net_47, CK);
and U54 (_net_48, D, _net_47, SE, SI);
not U55 (_net_49, D);
not U56 (_net_50, CK);
and U57 (_net_51, _net_49, _net_50, SE, SI);
or U58 (cond8, _net_46, _net_48, _net_51);
not U59 (_net_52, D);
and U60 (cond7, SD, _net_52, SE, SI);
and U61 (cond10, SD, CK);
not U62 (_net_53, SE);
and U63 (cond6, SD, D, _net_53);
and U64 (cond5, SD, D, SE, SI);
not U65 (_net_54, D);
not U66 (_net_55, CK);
not U67 (_net_56, SI);
and U68 (_net_57, _net_54, _net_55, RD, SE, _net_56);
not U69 (_net_58, CK);
not U70 (_net_59, SI);
and U71 (_net_60, D, _net_58, RD, SE, _net_59);
not U72 (_net_61, D);
not U73 (_net_62, CK);
not U74 (_net_63, SE);
and U75 (_net_64, _net_61, _net_62, RD, _net_63);
or U76 (cond18, _net_57, _net_60, _net_64);
not U77 (_net_65, CK);
not U78 (_net_66, SE);
and U79 (_net_67, D, _net_65, RD, _net_66);
not U80 (_net_68, CK);
and U81 (_net_69, D, _net_68, RD, SE, SI);
not U82 (_net_70, D);
not U83 (_net_71, CK);
and U84 (_net_72, _net_70, _net_71, RD, SE, SI);
or U85 (cond17, _net_67, _net_69, _net_72);
not U86 (_net_73, D);
not U87 (_net_74, SE);
and U88 (cond15, RD, _net_73, _net_74);
not U89 (_net_75, D);
not U90 (_net_76, SI);
and U91 (cond14, RD, _net_75, SE, _net_76);
and U92 (cond16, RD, CK);
not U93 (_net_77, SI);
and U94 (cond13, RD, D, SE, _net_77);
not U95 (_net_78, D);
and U96 (cond1, RD, _net_78, SD, SI);
not U97 (_net_79, SI);
and U98 (cond2, RD, D, SD, _net_79);
not U99 (_net_80, D);
and U100 (cond4, RD, _net_80, SD, SE);
and U101 (cond3, RD, D, SD, SE);

specify
if ((~(CK) & ~(SD))) (negedge RD => (Q +: 1'b0))=(0, 0);
if ((~(CK) & ~(SD))) (posedge RD => (Q +: 1'b1))=(0, 0);
if ((~(CK) & D & SD & SE & ~(SI)) | (~(CK) & ~(D) & SD & SE & ~(SI)) | (~(CK) & ~(D) & SD & ~(SE))) (negedge RD => (Q +: 1'b0))=(0, 0);
if ((~(CK) & D & SD & SE & SI) | (~(CK) & D & SD & ~(SE)) | (~(CK) & ~(D) & SD & SE & SI)) (negedge RD => (Q +: 1'b0))=(0, 0);
if ((CK & ~(SD))) (negedge RD => (Q +: 1'b0))=(0, 0);
if ((CK & ~(SD))) (posedge RD => (Q +: 1'b1))=(0, 0);
if ((CK & SD)) (negedge RD => (Q +: 1'b0))=(0, 0);
(negedge RD => (Q:1'b0))=(0, 0);
if ((~(CK) & D & RD & SE & ~(SI)) | (~(CK) & ~(D) & RD & SE & ~(SI)) | (~(CK) & ~(D) & RD & ~(SE))) (negedge SD => (Q -: 1'b1))=(0, 0);
if ((~(CK) & D & RD & SE & SI) | (~(CK) & D & RD & ~(SE)) | (~(CK) & ~(D) & RD & SE & SI)) (negedge SD => (Q -: 1'b1))=(0, 0);
if ((CK & RD)) (negedge SD => (Q -: 1'b1))=(0, 0);
(negedge SD => (Q:1'b1))=(0, 0);
(posedge CK => (Q : 1'b1))=(0, 0);
$width(posedge CK &&& cond20 , 0 ,0, viol_0);
$width(negedge CK &&& cond20 , 0 ,0, viol_0);
$width(posedge CK &&& cond19 , 0 ,0, viol_0);
$width(negedge CK &&& cond19 , 0 ,0, viol_0);
$setuphold(posedge CK &&& cond0 , posedge D &&& cond0 , 0 ,0, viol_0, , , delayed_CK, delayed_D);
$setuphold(posedge CK &&& cond0 , negedge D &&& cond0 , 0 ,0, viol_0, , , delayed_CK, delayed_D);
$width(negedge RD &&& cond12 , 0 ,0, viol_0);
$width(negedge RD &&& cond11 , 0 ,0, viol_0);
$setuphold(posedge SD &&& cond9 , posedge RD &&& cond9 , 0 ,0, viol_0, , , delayed_SD, delayed_RD);
$setuphold(posedge SD &&& cond8 , posedge RD &&& cond8 , 0 ,0, viol_0, , , delayed_SD, delayed_RD);
$recovery(posedge RD &&& cond7 , posedge CK &&& cond7 , 0 , viol_0);
$hold(posedge CK &&& cond7 , posedge RD &&& cond7 , 0 , viol_0);
$width(negedge RD &&& cond10 , 0 ,0, viol_0);
$recovery(posedge RD &&& cond6 , posedge CK &&& cond6 , 0 , viol_0);
$hold(posedge CK &&& cond6 , posedge RD &&& cond6 , 0 , viol_0);
$recovery(posedge RD &&& cond5 , posedge CK &&& cond5 , 0 , viol_0);
$hold(posedge CK &&& cond5 , posedge RD &&& cond5 , 0 , viol_0);
$setuphold(posedge SD &&& CK , posedge RD &&& CK , 0 ,0, viol_0, , , delayed_SD, delayed_RD);
$width(negedge SD &&& cond18 , 0 ,0, viol_0);
$width(negedge SD &&& cond17 , 0 ,0, viol_0);
$setuphold(posedge RD &&& cond9 , posedge SD &&& cond9 , 0 ,0, viol_0, , , delayed_RD, delayed_SD);
$setuphold(posedge RD &&& cond8 , posedge SD &&& cond8 , 0 ,0, viol_0, , , delayed_RD, delayed_SD);
$recovery(posedge SD &&& cond15 , posedge CK &&& cond15 , 0 , viol_0);
$hold(posedge CK &&& cond15 , posedge SD &&& cond15 , 0 , viol_0);
$recovery(posedge SD &&& cond14 , posedge CK &&& cond14 , 0 , viol_0);
$hold(posedge CK &&& cond14 , posedge SD &&& cond14 , 0 , viol_0);
$width(negedge SD &&& cond16 , 0 ,0, viol_0);
$recovery(posedge SD &&& cond13 , posedge CK &&& cond13 , 0 , viol_0);
$hold(posedge CK &&& cond13 , posedge SD &&& cond13 , 0 , viol_0);
$setuphold(posedge RD &&& CK , posedge SD &&& CK , 0 ,0, viol_0, , , delayed_RD, delayed_SD);
$setuphold(posedge CK &&& cond1 , posedge SE &&& cond1 , 0 ,0, viol_0, , , delayed_CK, delayed_SE);
$setuphold(posedge CK &&& cond1 , negedge SE &&& cond1 , 0 ,0, viol_0, , , delayed_CK, delayed_SE);
$setuphold(posedge CK &&& cond2 , posedge SE &&& cond2 , 0 ,0, viol_0, , , delayed_CK, delayed_SE);
$setuphold(posedge CK &&& cond2 , negedge SE &&& cond2 , 0 ,0, viol_0, , , delayed_CK, delayed_SE);
$setuphold(posedge CK &&& cond4 , posedge SI &&& cond4 , 0 ,0, viol_0, , , delayed_CK, delayed_SI);
$setuphold(posedge CK &&& cond4 , negedge SI &&& cond4 , 0 ,0, viol_0, , , delayed_CK, delayed_SI);
$setuphold(posedge CK &&& cond3 , posedge SI &&& cond3 , 0 ,0, viol_0, , , delayed_CK, delayed_SI);
$setuphold(posedge CK &&& cond3 , negedge SI &&& cond3 , 0 ,0, viol_0, , , delayed_CK, delayed_SI);
endspecify
    `endif

endmodule
`endcelldefine

//%END SVN_FSDPRBSBQ_2

//%BEGIN SVN_FSDPRBSBQ_4

`celldefine
module SVN_FSDPRBSBQ_4 (Q, CK, D, SI, SE, RD, SD);
   output Q;
   input CK, D, SI, SE, RD, SD;

   reg viol_0;
   wire delayed_CK, delayed_D, delayed_SI,
	delayed_SE, delayed_RD, delayed_SD;

   wire int_res__D, int_res__SD, int_res__RD, xcr_0;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////

`ifdef _fv
   buf (delayed_CK, CK);
   buf (delayed_D, D);
   buf (delayed_SI, SI);
   buf (delayed_SE, SE);
`endif
   buf (delayed_RD, RD);
   buf (delayed_SD, SD);

   mux2 (int_res__D, delayed_SI, delayed_D, delayed_SE);
   not (int_res__SD, delayed_SD);
   not (int_res__RD, delayed_RD);
   dff_sr_err (xcr_0, delayed_CK, int_res__D, int_res__SD, int_res__RD);

   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////

   `ifdef VIRL_functiononly
        dff_sr_0 #`SNPS_SEQ_DELAY (Q, viol_0, delayed_CK, int_res__D, int_res__SD, int_res__RD, xcr_0);
   `else
        dff_sr_0 (Q, viol_0, delayed_CK, int_res__D, int_res__SD, int_res__RD, xcr_0);
    `endif

    `ifdef VIRL_functiononly

    `else

not U0 (_net_0, D);
not U1 (_net_1, SI);
and U2 (_net_2, RD, _net_0, SD, SE, _net_1);
not U3 (_net_3, SI);
and U4 (_net_4, RD, D, SD, SE, _net_3);
not U5 (_net_5, D);
not U6 (_net_6, SE);
and U7 (_net_7, RD, _net_5, SD, _net_6);
or U8 (cond20, _net_2, _net_4, _net_7);
not U9 (_net_8, SE);
and U10 (_net_9, RD, D, SD, _net_8);
and U11 (_net_10, RD, D, SD, SE, SI);
not U12 (_net_11, D);
and U13 (_net_12, RD, _net_11, SD, SE, SI);
or U14 (cond19, _net_9, _net_10, _net_12);
not U15 (_net_13, SE);
and U16 (cond0, SD, RD, _net_13);
not U17 (_net_14, D);
not U18 (_net_15, CK);
not U19 (_net_16, SI);
and U20 (_net_17, _net_14, _net_15, SD, SE, _net_16);
not U21 (_net_18, CK);
not U22 (_net_19, SI);
and U23 (_net_20, D, _net_18, SD, SE, _net_19);
not U24 (_net_21, D);
not U25 (_net_22, CK);
not U26 (_net_23, SE);
and U27 (_net_24, _net_21, _net_22, SD, _net_23);
or U28 (cond12, _net_17, _net_20, _net_24);
not U29 (_net_25, CK);
not U30 (_net_26, SE);
and U31 (_net_27, D, _net_25, SD, _net_26);
not U32 (_net_28, CK);
and U33 (_net_29, D, _net_28, SD, SE, SI);
not U34 (_net_30, D);
not U35 (_net_31, CK);
and U36 (_net_32, _net_30, _net_31, SD, SE, SI);
or U37 (cond11, _net_27, _net_29, _net_32);
not U38 (_net_33, D);
not U39 (_net_34, CK);
not U40 (_net_35, SI);
and U41 (_net_36, _net_33, _net_34, SE, _net_35);
not U42 (_net_37, CK);
not U43 (_net_38, SI);
and U44 (_net_39, D, _net_37, SE, _net_38);
not U45 (_net_40, D);
not U46 (_net_41, CK);
not U47 (_net_42, SE);
and U48 (_net_43, _net_40, _net_41, _net_42);
or U49 (cond9, _net_36, _net_39, _net_43);
not U50 (_net_44, CK);
not U51 (_net_45, SE);
and U52 (_net_46, D, _net_44, _net_45);
not U53 (_net_47, CK);
and U54 (_net_48, D, _net_47, SE, SI);
not U55 (_net_49, D);
not U56 (_net_50, CK);
and U57 (_net_51, _net_49, _net_50, SE, SI);
or U58 (cond8, _net_46, _net_48, _net_51);
not U59 (_net_52, D);
and U60 (cond7, SD, _net_52, SE, SI);
and U61 (cond10, SD, CK);
not U62 (_net_53, SE);
and U63 (cond6, SD, D, _net_53);
and U64 (cond5, SD, D, SE, SI);
not U65 (_net_54, D);
not U66 (_net_55, CK);
not U67 (_net_56, SI);
and U68 (_net_57, _net_54, _net_55, RD, SE, _net_56);
not U69 (_net_58, CK);
not U70 (_net_59, SI);
and U71 (_net_60, D, _net_58, RD, SE, _net_59);
not U72 (_net_61, D);
not U73 (_net_62, CK);
not U74 (_net_63, SE);
and U75 (_net_64, _net_61, _net_62, RD, _net_63);
or U76 (cond18, _net_57, _net_60, _net_64);
not U77 (_net_65, CK);
not U78 (_net_66, SE);
and U79 (_net_67, D, _net_65, RD, _net_66);
not U80 (_net_68, CK);
and U81 (_net_69, D, _net_68, RD, SE, SI);
not U82 (_net_70, D);
not U83 (_net_71, CK);
and U84 (_net_72, _net_70, _net_71, RD, SE, SI);
or U85 (cond17, _net_67, _net_69, _net_72);
not U86 (_net_73, D);
not U87 (_net_74, SE);
and U88 (cond15, RD, _net_73, _net_74);
not U89 (_net_75, D);
not U90 (_net_76, SI);
and U91 (cond14, RD, _net_75, SE, _net_76);
and U92 (cond16, RD, CK);
not U93 (_net_77, SI);
and U94 (cond13, RD, D, SE, _net_77);
not U95 (_net_78, D);
and U96 (cond1, RD, _net_78, SD, SI);
not U97 (_net_79, SI);
and U98 (cond2, RD, D, SD, _net_79);
not U99 (_net_80, D);
and U100 (cond4, RD, _net_80, SD, SE);
and U101 (cond3, RD, D, SD, SE);

specify
if ((~(CK) & ~(SD))) (negedge RD => (Q +: 1'b0))=(0, 0);
if ((~(CK) & ~(SD))) (posedge RD => (Q +: 1'b1))=(0, 0);
if ((~(CK) & D & SD & SE & ~(SI)) | (~(CK) & ~(D) & SD & SE & ~(SI)) | (~(CK) & ~(D) & SD & ~(SE))) (negedge RD => (Q +: 1'b0))=(0, 0);
if ((~(CK) & D & SD & SE & SI) | (~(CK) & D & SD & ~(SE)) | (~(CK) & ~(D) & SD & SE & SI)) (negedge RD => (Q +: 1'b0))=(0, 0);
if ((CK & ~(SD))) (negedge RD => (Q +: 1'b0))=(0, 0);
if ((CK & ~(SD))) (posedge RD => (Q +: 1'b1))=(0, 0);
if ((CK & SD)) (negedge RD => (Q +: 1'b0))=(0, 0);
(negedge RD => (Q:1'b0))=(0, 0);
if ((~(CK) & D & RD & SE & ~(SI)) | (~(CK) & ~(D) & RD & SE & ~(SI)) | (~(CK) & ~(D) & RD & ~(SE))) (negedge SD => (Q -: 1'b1))=(0, 0);
if ((~(CK) & D & RD & SE & SI) | (~(CK) & D & RD & ~(SE)) | (~(CK) & ~(D) & RD & SE & SI)) (negedge SD => (Q -: 1'b1))=(0, 0);
if ((CK & RD)) (negedge SD => (Q -: 1'b1))=(0, 0);
(negedge SD => (Q:1'b1))=(0, 0);
(posedge CK => (Q : 1'b1))=(0, 0);
$width(posedge CK &&& cond20 , 0 ,0, viol_0);
$width(negedge CK &&& cond20 , 0 ,0, viol_0);
$width(posedge CK &&& cond19 , 0 ,0, viol_0);
$width(negedge CK &&& cond19 , 0 ,0, viol_0);
$setuphold(posedge CK &&& cond0 , posedge D &&& cond0 , 0 ,0, viol_0, , , delayed_CK, delayed_D);
$setuphold(posedge CK &&& cond0 , negedge D &&& cond0 , 0 ,0, viol_0, , , delayed_CK, delayed_D);
$width(negedge RD &&& cond12 , 0 ,0, viol_0);
$width(negedge RD &&& cond11 , 0 ,0, viol_0);
$setuphold(posedge SD &&& cond9 , posedge RD &&& cond9 , 0 ,0, viol_0, , , delayed_SD, delayed_RD);
$setuphold(posedge SD &&& cond8 , posedge RD &&& cond8 , 0 ,0, viol_0, , , delayed_SD, delayed_RD);
$recovery(posedge RD &&& cond7 , posedge CK &&& cond7 , 0 , viol_0);
$hold(posedge CK &&& cond7 , posedge RD &&& cond7 , 0 , viol_0);
$width(negedge RD &&& cond10 , 0 ,0, viol_0);
$recovery(posedge RD &&& cond6 , posedge CK &&& cond6 , 0 , viol_0);
$hold(posedge CK &&& cond6 , posedge RD &&& cond6 , 0 , viol_0);
$recovery(posedge RD &&& cond5 , posedge CK &&& cond5 , 0 , viol_0);
$hold(posedge CK &&& cond5 , posedge RD &&& cond5 , 0 , viol_0);
$setuphold(posedge SD &&& CK , posedge RD &&& CK , 0 ,0, viol_0, , , delayed_SD, delayed_RD);
$width(negedge SD &&& cond18 , 0 ,0, viol_0);
$width(negedge SD &&& cond17 , 0 ,0, viol_0);
$setuphold(posedge RD &&& cond9 , posedge SD &&& cond9 , 0 ,0, viol_0, , , delayed_RD, delayed_SD);
$setuphold(posedge RD &&& cond8 , posedge SD &&& cond8 , 0 ,0, viol_0, , , delayed_RD, delayed_SD);
$recovery(posedge SD &&& cond15 , posedge CK &&& cond15 , 0 , viol_0);
$hold(posedge CK &&& cond15 , posedge SD &&& cond15 , 0 , viol_0);
$recovery(posedge SD &&& cond14 , posedge CK &&& cond14 , 0 , viol_0);
$hold(posedge CK &&& cond14 , posedge SD &&& cond14 , 0 , viol_0);
$width(negedge SD &&& cond16 , 0 ,0, viol_0);
$recovery(posedge SD &&& cond13 , posedge CK &&& cond13 , 0 , viol_0);
$hold(posedge CK &&& cond13 , posedge SD &&& cond13 , 0 , viol_0);
$setuphold(posedge RD &&& CK , posedge SD &&& CK , 0 ,0, viol_0, , , delayed_RD, delayed_SD);
$setuphold(posedge CK &&& cond1 , posedge SE &&& cond1 , 0 ,0, viol_0, , , delayed_CK, delayed_SE);
$setuphold(posedge CK &&& cond1 , negedge SE &&& cond1 , 0 ,0, viol_0, , , delayed_CK, delayed_SE);
$setuphold(posedge CK &&& cond2 , posedge SE &&& cond2 , 0 ,0, viol_0, , , delayed_CK, delayed_SE);
$setuphold(posedge CK &&& cond2 , negedge SE &&& cond2 , 0 ,0, viol_0, , , delayed_CK, delayed_SE);
$setuphold(posedge CK &&& cond4 , posedge SI &&& cond4 , 0 ,0, viol_0, , , delayed_CK, delayed_SI);
$setuphold(posedge CK &&& cond4 , negedge SI &&& cond4 , 0 ,0, viol_0, , , delayed_CK, delayed_SI);
$setuphold(posedge CK &&& cond3 , posedge SI &&& cond3 , 0 ,0, viol_0, , , delayed_CK, delayed_SI);
$setuphold(posedge CK &&& cond3 , negedge SI &&& cond3 , 0 ,0, viol_0, , , delayed_CK, delayed_SI);
endspecify
    `endif

endmodule
`endcelldefine

//%END SVN_FSDPRBSBQ_4

//%BEGIN SVN_FSDPSBQ_0P5

`celldefine
module SVN_FSDPSBQ_0P5 (Q, CK, D, SI, SE, SD);
   output Q;
   input CK, D, SI, SE, SD;

   reg viol_0;
   wire delayed_CK, delayed_D, delayed_SI,
	delayed_SE, delayed_SD;

   wire int_res__D, int_res__SD, xcr_0;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////

`ifdef _fv
   buf (delayed_CK, CK);
   buf (delayed_D, D);
   buf (delayed_SI, SI);
   buf (delayed_SE, SE);
`endif
   buf (delayed_SD, SD);

   mux2 (int_res__D, delayed_SI, delayed_D, delayed_SE);
   not (int_res__SD, delayed_SD);
   dff_s_err (xcr_0, delayed_CK, int_res__D, int_res__SD);

   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////

   `ifdef VIRL_functiononly
        dff_s #`SNPS_SEQ_DELAY (Q, viol_0, delayed_CK, int_res__D, int_res__SD, xcr_0);

    `else
        dff_s (Q, viol_0, delayed_CK, int_res__D, int_res__SD, xcr_0);

    `endif

    `ifdef VIRL_functiononly

    `else

not U0 (_net_0, D);
not U1 (_net_1, SI);
and U2 (_net_2, SD, _net_0, SE, _net_1);
not U3 (_net_3, SI);
and U4 (_net_4, SD, D, SE, _net_3);
not U5 (_net_5, D);
not U6 (_net_6, SE);
and U7 (_net_7, SD, _net_5, _net_6);
or U8 (cond11, _net_2, _net_4, _net_7);
not U9 (_net_8, SE);
and U10 (_net_9, SD, D, _net_8);
and U11 (_net_10, SD, D, SE, SI);
not U12 (_net_11, D);
and U13 (_net_12, SD, _net_11, SE, SI);
or U14 (cond10, _net_9, _net_10, _net_12);
not U15 (_net_13, SE);
and U16 (cond0, _net_13, SD);
not U17 (_net_14, D);
not U18 (_net_15, CK);
not U19 (_net_16, SI);
and U20 (_net_17, _net_14, _net_15, SE, _net_16);
not U21 (_net_18, CK);
not U22 (_net_19, SI);
and U23 (_net_20, D, _net_18, SE, _net_19);
not U24 (_net_21, D);
not U25 (_net_22, CK);
not U26 (_net_23, SE);
and U27 (_net_24, _net_21, _net_22, _net_23);
or U28 (cond9, _net_17, _net_20, _net_24);
not U29 (_net_25, CK);
not U30 (_net_26, SE);
and U31 (_net_27, D, _net_25, _net_26);
not U32 (_net_28, CK);
and U33 (_net_29, D, _net_28, SE, SI);
not U34 (_net_30, D);
not U35 (_net_31, CK);
and U36 (_net_32, _net_30, _net_31, SE, SI);
or U37 (cond8, _net_27, _net_29, _net_32);
not U38 (_net_33, SE);
not U39 (_net_34, D);
and U40 (cond7, _net_33, _net_34);
not U41 (_net_35, D);
not U42 (_net_36, SI);
and U43 (cond6, SE, _net_35, _net_36);
not U44 (_net_37, SI);
and U45 (cond5, SE, D, _net_37);
not U46 (_net_38, D);
and U47 (cond1, SD, _net_38, SI);
not U48 (_net_39, SI);
and U49 (cond2, SD, D, _net_39);
not U50 (_net_40, D);
and U51 (cond4, SD, _net_40, SE);
and U52 (cond3, SD, D, SE);

specify
if ((~(CK) & D & SE & ~(SI)) | (~(CK) & ~(D) & SE & ~(SI)) | (~(CK) & ~(D) & ~(SE))) (negedge SD => (Q -: 1'b1))=(0, 0);
if ((~(CK) & D & SE & SI) | (~(CK) & D & ~(SE)) | (~(CK) & ~(D) & SE & SI)) (negedge SD => (Q -: 1'b1))=(0, 0);
if (CK) (negedge SD => (Q -: 1'b1))=(0, 0);
(negedge SD => (Q:1'b1))=(0, 0);
(posedge CK => (Q : 1'b1))=(0, 0);
$width(posedge CK &&& cond11 , 0 ,0, viol_0);
$width(negedge CK &&& cond11 , 0 ,0, viol_0);
$width(posedge CK &&& cond10 , 0 ,0, viol_0);
$width(negedge CK &&& cond10 , 0 ,0, viol_0);
$setuphold(posedge CK &&& cond0 , posedge D &&& cond0 , 0 ,0, viol_0, , , delayed_CK, delayed_D);
$setuphold(posedge CK &&& cond0 , negedge D &&& cond0 , 0 ,0, viol_0, , , delayed_CK, delayed_D);
$width(negedge SD &&& cond9 , 0 ,0, viol_0);
$width(negedge SD &&& cond8 , 0 ,0, viol_0);
$recovery(posedge SD &&& cond7 , posedge CK &&& cond7 , 0 , viol_0);
$hold(posedge CK &&& cond7 , posedge SD &&& cond7 , 0 , viol_0);
$recovery(posedge SD &&& cond6 , posedge CK &&& cond6 , 0 , viol_0);
$hold(posedge CK &&& cond6 , posedge SD &&& cond6 , 0 , viol_0);
$recovery(posedge SD &&& cond5 , posedge CK &&& cond5 , 0 , viol_0);
$hold(posedge CK &&& cond5 , posedge SD &&& cond5 , 0 , viol_0);
$width(negedge SD &&& CK , 0 ,0, viol_0);
$setuphold(posedge CK &&& cond1 , posedge SE &&& cond1 , 0 ,0, viol_0, , , delayed_CK, delayed_SE);
$setuphold(posedge CK &&& cond1 , negedge SE &&& cond1 , 0 ,0, viol_0, , , delayed_CK, delayed_SE);
$setuphold(posedge CK &&& cond2 , posedge SE &&& cond2 , 0 ,0, viol_0, , , delayed_CK, delayed_SE);
$setuphold(posedge CK &&& cond2 , negedge SE &&& cond2 , 0 ,0, viol_0, , , delayed_CK, delayed_SE);
$setuphold(posedge CK &&& cond4 , posedge SI &&& cond4 , 0 ,0, viol_0, , , delayed_CK, delayed_SI);
$setuphold(posedge CK &&& cond4 , negedge SI &&& cond4 , 0 ,0, viol_0, , , delayed_CK, delayed_SI);
$setuphold(posedge CK &&& cond3 , posedge SI &&& cond3 , 0 ,0, viol_0, , , delayed_CK, delayed_SI);
$setuphold(posedge CK &&& cond3 , negedge SI &&& cond3 , 0 ,0, viol_0, , , delayed_CK, delayed_SI);
endspecify
    `endif

endmodule
`endcelldefine

//%END SVN_FSDPSBQ_0P5

//%BEGIN SVN_FSDPSBQ_1

`celldefine
module SVN_FSDPSBQ_1 (Q, CK, D, SI, SE, SD);
   output Q;
   input CK, D, SI, SE, SD;

   reg viol_0;
   wire delayed_CK, delayed_D, delayed_SI,
	delayed_SE, delayed_SD;

   wire int_res__D, int_res__SD, xcr_0;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////

`ifdef _fv
   buf (delayed_CK, CK);
   buf (delayed_D, D);
   buf (delayed_SI, SI);
   buf (delayed_SE, SE);
`endif
   buf (delayed_SD, SD);

   mux2 (int_res__D, delayed_SI, delayed_D, delayed_SE);
   not (int_res__SD, delayed_SD);
   dff_s_err (xcr_0, delayed_CK, int_res__D, int_res__SD);

   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////

   `ifdef VIRL_functiononly
        dff_s #`SNPS_SEQ_DELAY (Q, viol_0, delayed_CK, int_res__D, int_res__SD, xcr_0);

    `else
        dff_s (Q, viol_0, delayed_CK, int_res__D, int_res__SD, xcr_0);

    `endif

    `ifdef VIRL_functiononly

    `else

not U0 (_net_0, D);
not U1 (_net_1, SI);
and U2 (_net_2, SD, _net_0, SE, _net_1);
not U3 (_net_3, SI);
and U4 (_net_4, SD, D, SE, _net_3);
not U5 (_net_5, D);
not U6 (_net_6, SE);
and U7 (_net_7, SD, _net_5, _net_6);
or U8 (cond11, _net_2, _net_4, _net_7);
not U9 (_net_8, SE);
and U10 (_net_9, SD, D, _net_8);
and U11 (_net_10, SD, D, SE, SI);
not U12 (_net_11, D);
and U13 (_net_12, SD, _net_11, SE, SI);
or U14 (cond10, _net_9, _net_10, _net_12);
not U15 (_net_13, SE);
and U16 (cond0, _net_13, SD);
not U17 (_net_14, D);
not U18 (_net_15, CK);
not U19 (_net_16, SI);
and U20 (_net_17, _net_14, _net_15, SE, _net_16);
not U21 (_net_18, CK);
not U22 (_net_19, SI);
and U23 (_net_20, D, _net_18, SE, _net_19);
not U24 (_net_21, D);
not U25 (_net_22, CK);
not U26 (_net_23, SE);
and U27 (_net_24, _net_21, _net_22, _net_23);
or U28 (cond9, _net_17, _net_20, _net_24);
not U29 (_net_25, CK);
not U30 (_net_26, SE);
and U31 (_net_27, D, _net_25, _net_26);
not U32 (_net_28, CK);
and U33 (_net_29, D, _net_28, SE, SI);
not U34 (_net_30, D);
not U35 (_net_31, CK);
and U36 (_net_32, _net_30, _net_31, SE, SI);
or U37 (cond8, _net_27, _net_29, _net_32);
not U38 (_net_33, SE);
not U39 (_net_34, D);
and U40 (cond7, _net_33, _net_34);
not U41 (_net_35, D);
not U42 (_net_36, SI);
and U43 (cond6, SE, _net_35, _net_36);
not U44 (_net_37, SI);
and U45 (cond5, SE, D, _net_37);
not U46 (_net_38, D);
and U47 (cond1, SD, _net_38, SI);
not U48 (_net_39, SI);
and U49 (cond2, SD, D, _net_39);
not U50 (_net_40, D);
and U51 (cond4, SD, _net_40, SE);
and U52 (cond3, SD, D, SE);

specify
if ((~(CK) & D & SE & ~(SI)) | (~(CK) & ~(D) & SE & ~(SI)) | (~(CK) & ~(D) & ~(SE))) (negedge SD => (Q -: 1'b1))=(0, 0);
if ((~(CK) & D & SE & SI) | (~(CK) & D & ~(SE)) | (~(CK) & ~(D) & SE & SI)) (negedge SD => (Q -: 1'b1))=(0, 0);
if (CK) (negedge SD => (Q -: 1'b1))=(0, 0);
(negedge SD => (Q:1'b1))=(0, 0);
(posedge CK => (Q : 1'b1))=(0, 0);
$width(posedge CK &&& cond11 , 0 ,0, viol_0);
$width(negedge CK &&& cond11 , 0 ,0, viol_0);
$width(posedge CK &&& cond10 , 0 ,0, viol_0);
$width(negedge CK &&& cond10 , 0 ,0, viol_0);
$setuphold(posedge CK &&& cond0 , posedge D &&& cond0 , 0 ,0, viol_0, , , delayed_CK, delayed_D);
$setuphold(posedge CK &&& cond0 , negedge D &&& cond0 , 0 ,0, viol_0, , , delayed_CK, delayed_D);
$width(negedge SD &&& cond9 , 0 ,0, viol_0);
$width(negedge SD &&& cond8 , 0 ,0, viol_0);
$recovery(posedge SD &&& cond7 , posedge CK &&& cond7 , 0 , viol_0);
$hold(posedge CK &&& cond7 , posedge SD &&& cond7 , 0 , viol_0);
$recovery(posedge SD &&& cond6 , posedge CK &&& cond6 , 0 , viol_0);
$hold(posedge CK &&& cond6 , posedge SD &&& cond6 , 0 , viol_0);
$recovery(posedge SD &&& cond5 , posedge CK &&& cond5 , 0 , viol_0);
$hold(posedge CK &&& cond5 , posedge SD &&& cond5 , 0 , viol_0);
$width(negedge SD &&& CK , 0 ,0, viol_0);
$setuphold(posedge CK &&& cond1 , posedge SE &&& cond1 , 0 ,0, viol_0, , , delayed_CK, delayed_SE);
$setuphold(posedge CK &&& cond1 , negedge SE &&& cond1 , 0 ,0, viol_0, , , delayed_CK, delayed_SE);
$setuphold(posedge CK &&& cond2 , posedge SE &&& cond2 , 0 ,0, viol_0, , , delayed_CK, delayed_SE);
$setuphold(posedge CK &&& cond2 , negedge SE &&& cond2 , 0 ,0, viol_0, , , delayed_CK, delayed_SE);
$setuphold(posedge CK &&& cond4 , posedge SI &&& cond4 , 0 ,0, viol_0, , , delayed_CK, delayed_SI);
$setuphold(posedge CK &&& cond4 , negedge SI &&& cond4 , 0 ,0, viol_0, , , delayed_CK, delayed_SI);
$setuphold(posedge CK &&& cond3 , posedge SI &&& cond3 , 0 ,0, viol_0, , , delayed_CK, delayed_SI);
$setuphold(posedge CK &&& cond3 , negedge SI &&& cond3 , 0 ,0, viol_0, , , delayed_CK, delayed_SI);
endspecify
    `endif

endmodule
`endcelldefine

//%END SVN_FSDPSBQ_1

//%BEGIN SVN_FSDPSBQ_2

`celldefine
module SVN_FSDPSBQ_2 (Q, CK, D, SI, SE, SD);
   output Q;
   input CK, D, SI, SE, SD;

   reg viol_0;
   wire delayed_CK, delayed_D, delayed_SI,
	delayed_SE, delayed_SD;

   wire int_res__D, int_res__SD, xcr_0;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////

`ifdef _fv
   buf (delayed_CK, CK);
   buf (delayed_D, D);
   buf (delayed_SI, SI);
   buf (delayed_SE, SE);
`endif
   buf (delayed_SD, SD);

   mux2 (int_res__D, delayed_SI, delayed_D, delayed_SE);
   not (int_res__SD, delayed_SD);
   dff_s_err (xcr_0, delayed_CK, int_res__D, int_res__SD);

   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////

   `ifdef VIRL_functiononly
        dff_s #`SNPS_SEQ_DELAY (Q, viol_0, delayed_CK, int_res__D, int_res__SD, xcr_0);

    `else
        dff_s (Q, viol_0, delayed_CK, int_res__D, int_res__SD, xcr_0);

    `endif

    `ifdef VIRL_functiononly

    `else

not U0 (_net_0, D);
not U1 (_net_1, SI);
and U2 (_net_2, SD, _net_0, SE, _net_1);
not U3 (_net_3, SI);
and U4 (_net_4, SD, D, SE, _net_3);
not U5 (_net_5, D);
not U6 (_net_6, SE);
and U7 (_net_7, SD, _net_5, _net_6);
or U8 (cond11, _net_2, _net_4, _net_7);
not U9 (_net_8, SE);
and U10 (_net_9, SD, D, _net_8);
and U11 (_net_10, SD, D, SE, SI);
not U12 (_net_11, D);
and U13 (_net_12, SD, _net_11, SE, SI);
or U14 (cond10, _net_9, _net_10, _net_12);
not U15 (_net_13, SE);
and U16 (cond0, _net_13, SD);
not U17 (_net_14, D);
not U18 (_net_15, CK);
not U19 (_net_16, SI);
and U20 (_net_17, _net_14, _net_15, SE, _net_16);
not U21 (_net_18, CK);
not U22 (_net_19, SI);
and U23 (_net_20, D, _net_18, SE, _net_19);
not U24 (_net_21, D);
not U25 (_net_22, CK);
not U26 (_net_23, SE);
and U27 (_net_24, _net_21, _net_22, _net_23);
or U28 (cond9, _net_17, _net_20, _net_24);
not U29 (_net_25, CK);
not U30 (_net_26, SE);
and U31 (_net_27, D, _net_25, _net_26);
not U32 (_net_28, CK);
and U33 (_net_29, D, _net_28, SE, SI);
not U34 (_net_30, D);
not U35 (_net_31, CK);
and U36 (_net_32, _net_30, _net_31, SE, SI);
or U37 (cond8, _net_27, _net_29, _net_32);
not U38 (_net_33, SE);
not U39 (_net_34, D);
and U40 (cond7, _net_33, _net_34);
not U41 (_net_35, D);
not U42 (_net_36, SI);
and U43 (cond6, SE, _net_35, _net_36);
not U44 (_net_37, SI);
and U45 (cond5, SE, D, _net_37);
not U46 (_net_38, D);
and U47 (cond1, SD, _net_38, SI);
not U48 (_net_39, SI);
and U49 (cond2, SD, D, _net_39);
not U50 (_net_40, D);
and U51 (cond4, SD, _net_40, SE);
and U52 (cond3, SD, D, SE);

specify
if ((~(CK) & D & SE & ~(SI)) | (~(CK) & ~(D) & SE & ~(SI)) | (~(CK) & ~(D) & ~(SE))) (negedge SD => (Q -: 1'b1))=(0, 0);
if ((~(CK) & D & SE & SI) | (~(CK) & D & ~(SE)) | (~(CK) & ~(D) & SE & SI)) (negedge SD => (Q -: 1'b1))=(0, 0);
if (CK) (negedge SD => (Q -: 1'b1))=(0, 0);
(negedge SD => (Q:1'b1))=(0, 0);
(posedge CK => (Q : 1'b1))=(0, 0);
$width(posedge CK &&& cond11 , 0 ,0, viol_0);
$width(negedge CK &&& cond11 , 0 ,0, viol_0);
$width(posedge CK &&& cond10 , 0 ,0, viol_0);
$width(negedge CK &&& cond10 , 0 ,0, viol_0);
$setuphold(posedge CK &&& cond0 , posedge D &&& cond0 , 0 ,0, viol_0, , , delayed_CK, delayed_D);
$setuphold(posedge CK &&& cond0 , negedge D &&& cond0 , 0 ,0, viol_0, , , delayed_CK, delayed_D);
$width(negedge SD &&& cond9 , 0 ,0, viol_0);
$width(negedge SD &&& cond8 , 0 ,0, viol_0);
$recovery(posedge SD &&& cond7 , posedge CK &&& cond7 , 0 , viol_0);
$hold(posedge CK &&& cond7 , posedge SD &&& cond7 , 0 , viol_0);
$recovery(posedge SD &&& cond6 , posedge CK &&& cond6 , 0 , viol_0);
$hold(posedge CK &&& cond6 , posedge SD &&& cond6 , 0 , viol_0);
$recovery(posedge SD &&& cond5 , posedge CK &&& cond5 , 0 , viol_0);
$hold(posedge CK &&& cond5 , posedge SD &&& cond5 , 0 , viol_0);
$width(negedge SD &&& CK , 0 ,0, viol_0);
$setuphold(posedge CK &&& cond1 , posedge SE &&& cond1 , 0 ,0, viol_0, , , delayed_CK, delayed_SE);
$setuphold(posedge CK &&& cond1 , negedge SE &&& cond1 , 0 ,0, viol_0, , , delayed_CK, delayed_SE);
$setuphold(posedge CK &&& cond2 , posedge SE &&& cond2 , 0 ,0, viol_0, , , delayed_CK, delayed_SE);
$setuphold(posedge CK &&& cond2 , negedge SE &&& cond2 , 0 ,0, viol_0, , , delayed_CK, delayed_SE);
$setuphold(posedge CK &&& cond4 , posedge SI &&& cond4 , 0 ,0, viol_0, , , delayed_CK, delayed_SI);
$setuphold(posedge CK &&& cond4 , negedge SI &&& cond4 , 0 ,0, viol_0, , , delayed_CK, delayed_SI);
$setuphold(posedge CK &&& cond3 , posedge SI &&& cond3 , 0 ,0, viol_0, , , delayed_CK, delayed_SI);
$setuphold(posedge CK &&& cond3 , negedge SI &&& cond3 , 0 ,0, viol_0, , , delayed_CK, delayed_SI);
endspecify
    `endif

endmodule
`endcelldefine

//%END SVN_FSDPSBQ_2

//%BEGIN SVN_FSDPSBQ_4

`celldefine
module SVN_FSDPSBQ_4 (Q, CK, D, SI, SE, SD);
   output Q;
   input CK, D, SI, SE, SD;

   reg viol_0;
   wire delayed_CK, delayed_D, delayed_SI,
	delayed_SE, delayed_SD;

   wire int_res__D, int_res__SD, xcr_0;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////

`ifdef _fv
   buf (delayed_CK, CK);
   buf (delayed_D, D);
   buf (delayed_SI, SI);
   buf (delayed_SE, SE);
`endif
   buf (delayed_SD, SD);

   mux2 (int_res__D, delayed_SI, delayed_D, delayed_SE);
   not (int_res__SD, delayed_SD);
   dff_s_err (xcr_0, delayed_CK, int_res__D, int_res__SD);

   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////

   `ifdef VIRL_functiononly
        dff_s #`SNPS_SEQ_DELAY (Q, viol_0, delayed_CK, int_res__D, int_res__SD, xcr_0);

    `else
        dff_s (Q, viol_0, delayed_CK, int_res__D, int_res__SD, xcr_0);

    `endif

    `ifdef VIRL_functiononly

    `else

not U0 (_net_0, D);
not U1 (_net_1, SI);
and U2 (_net_2, SD, _net_0, SE, _net_1);
not U3 (_net_3, SI);
and U4 (_net_4, SD, D, SE, _net_3);
not U5 (_net_5, D);
not U6 (_net_6, SE);
and U7 (_net_7, SD, _net_5, _net_6);
or U8 (cond11, _net_2, _net_4, _net_7);
not U9 (_net_8, SE);
and U10 (_net_9, SD, D, _net_8);
and U11 (_net_10, SD, D, SE, SI);
not U12 (_net_11, D);
and U13 (_net_12, SD, _net_11, SE, SI);
or U14 (cond10, _net_9, _net_10, _net_12);
not U15 (_net_13, SE);
and U16 (cond0, _net_13, SD);
not U17 (_net_14, D);
not U18 (_net_15, CK);
not U19 (_net_16, SI);
and U20 (_net_17, _net_14, _net_15, SE, _net_16);
not U21 (_net_18, CK);
not U22 (_net_19, SI);
and U23 (_net_20, D, _net_18, SE, _net_19);
not U24 (_net_21, D);
not U25 (_net_22, CK);
not U26 (_net_23, SE);
and U27 (_net_24, _net_21, _net_22, _net_23);
or U28 (cond9, _net_17, _net_20, _net_24);
not U29 (_net_25, CK);
not U30 (_net_26, SE);
and U31 (_net_27, D, _net_25, _net_26);
not U32 (_net_28, CK);
and U33 (_net_29, D, _net_28, SE, SI);
not U34 (_net_30, D);
not U35 (_net_31, CK);
and U36 (_net_32, _net_30, _net_31, SE, SI);
or U37 (cond8, _net_27, _net_29, _net_32);
not U38 (_net_33, SE);
not U39 (_net_34, D);
and U40 (cond7, _net_33, _net_34);
not U41 (_net_35, D);
not U42 (_net_36, SI);
and U43 (cond6, SE, _net_35, _net_36);
not U44 (_net_37, SI);
and U45 (cond5, SE, D, _net_37);
not U46 (_net_38, D);
and U47 (cond1, SD, _net_38, SI);
not U48 (_net_39, SI);
and U49 (cond2, SD, D, _net_39);
not U50 (_net_40, D);
and U51 (cond4, SD, _net_40, SE);
and U52 (cond3, SD, D, SE);

specify
if ((~(CK) & D & SE & ~(SI)) | (~(CK) & ~(D) & SE & ~(SI)) | (~(CK) & ~(D) & ~(SE))) (negedge SD => (Q -: 1'b1))=(0, 0);
if ((~(CK) & D & SE & SI) | (~(CK) & D & ~(SE)) | (~(CK) & ~(D) & SE & SI)) (negedge SD => (Q -: 1'b1))=(0, 0);
if (CK) (negedge SD => (Q -: 1'b1))=(0, 0);
(negedge SD => (Q:1'b1))=(0, 0);
(posedge CK => (Q : 1'b1))=(0, 0);
$width(posedge CK &&& cond11 , 0 ,0, viol_0);
$width(negedge CK &&& cond11 , 0 ,0, viol_0);
$width(posedge CK &&& cond10 , 0 ,0, viol_0);
$width(negedge CK &&& cond10 , 0 ,0, viol_0);
$setuphold(posedge CK &&& cond0 , posedge D &&& cond0 , 0 ,0, viol_0, , , delayed_CK, delayed_D);
$setuphold(posedge CK &&& cond0 , negedge D &&& cond0 , 0 ,0, viol_0, , , delayed_CK, delayed_D);
$width(negedge SD &&& cond9 , 0 ,0, viol_0);
$width(negedge SD &&& cond8 , 0 ,0, viol_0);
$recovery(posedge SD &&& cond7 , posedge CK &&& cond7 , 0 , viol_0);
$hold(posedge CK &&& cond7 , posedge SD &&& cond7 , 0 , viol_0);
$recovery(posedge SD &&& cond6 , posedge CK &&& cond6 , 0 , viol_0);
$hold(posedge CK &&& cond6 , posedge SD &&& cond6 , 0 , viol_0);
$recovery(posedge SD &&& cond5 , posedge CK &&& cond5 , 0 , viol_0);
$hold(posedge CK &&& cond5 , posedge SD &&& cond5 , 0 , viol_0);
$width(negedge SD &&& CK , 0 ,0, viol_0);
$setuphold(posedge CK &&& cond1 , posedge SE &&& cond1 , 0 ,0, viol_0, , , delayed_CK, delayed_SE);
$setuphold(posedge CK &&& cond1 , negedge SE &&& cond1 , 0 ,0, viol_0, , , delayed_CK, delayed_SE);
$setuphold(posedge CK &&& cond2 , posedge SE &&& cond2 , 0 ,0, viol_0, , , delayed_CK, delayed_SE);
$setuphold(posedge CK &&& cond2 , negedge SE &&& cond2 , 0 ,0, viol_0, , , delayed_CK, delayed_SE);
$setuphold(posedge CK &&& cond4 , posedge SI &&& cond4 , 0 ,0, viol_0, , , delayed_CK, delayed_SI);
$setuphold(posedge CK &&& cond4 , negedge SI &&& cond4 , 0 ,0, viol_0, , , delayed_CK, delayed_SI);
$setuphold(posedge CK &&& cond3 , posedge SI &&& cond3 , 0 ,0, viol_0, , , delayed_CK, delayed_SI);
$setuphold(posedge CK &&& cond3 , negedge SI &&& cond3 , 0 ,0, viol_0, , , delayed_CK, delayed_SI);
endspecify
    `endif

endmodule
`endcelldefine

//%END SVN_FSDPSBQ_4

//%BEGIN SVN_INV_0P5

`celldefine
module SVN_INV_0P5 (X, A);
   output X;
   input A;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////


   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////
   `ifdef VIRL_functiononly
        not #`SNPS_COMBO_DELAY (X, A);
    `else
        not (X, A);
   `endif

   `ifdef VIRL_functiononly

   `else

specify
(A -=> X)=(0, 0);
endspecify
   `endif

endmodule
`endcelldefine

//%END SVN_INV_0P5

//%BEGIN SVN_INV_1

`celldefine
module SVN_INV_1 (X, A);
   output X;
   input A;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////


   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////
   `ifdef VIRL_functiononly
        not #`SNPS_COMBO_DELAY (X, A);
    `else
        not (X, A);
   `endif

   `ifdef VIRL_functiononly

   `else

specify
(A -=> X)=(0, 0);
endspecify
   `endif

endmodule
`endcelldefine

//%END SVN_INV_1

//%BEGIN SVN_INV_12

`celldefine
module SVN_INV_12 (X, A);
   output X;
   input A;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////


   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////
   `ifdef VIRL_functiononly
        not #`SNPS_COMBO_DELAY (X, A);
    `else
        not (X, A);
   `endif

   `ifdef VIRL_functiononly

   `else

specify
(A -=> X)=(0, 0);
endspecify
   `endif

endmodule
`endcelldefine

//%END SVN_INV_12

//%BEGIN SVN_INV_16

`celldefine
module SVN_INV_16 (X, A);
   output X;
   input A;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////


   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////
   `ifdef VIRL_functiononly
        not #`SNPS_COMBO_DELAY (X, A);
    `else
        not (X, A);
   `endif

   `ifdef VIRL_functiononly

   `else

specify
(A -=> X)=(0, 0);
endspecify
   `endif

endmodule
`endcelldefine

//%END SVN_INV_16

//%BEGIN SVN_INV_2

`celldefine
module SVN_INV_2 (X, A);
   output X;
   input A;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////


   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////
   `ifdef VIRL_functiononly
        not #`SNPS_COMBO_DELAY (X, A);
    `else
        not (X, A);
   `endif

   `ifdef VIRL_functiononly

   `else

specify
(A -=> X)=(0, 0);
endspecify
   `endif

endmodule
`endcelldefine

//%END SVN_INV_2

//%BEGIN SVN_INV_3

`celldefine
module SVN_INV_3 (X, A);
   output X;
   input A;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////


   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////
   `ifdef VIRL_functiononly
        not #`SNPS_COMBO_DELAY (X, A);
    `else
        not (X, A);
   `endif

   `ifdef VIRL_functiononly

   `else

specify
(A -=> X)=(0, 0);
endspecify
   `endif

endmodule
`endcelldefine

//%END SVN_INV_3

//%BEGIN SVN_INV_4

`celldefine
module SVN_INV_4 (X, A);
   output X;
   input A;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////


   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////
   `ifdef VIRL_functiononly
        not #`SNPS_COMBO_DELAY (X, A);
    `else
        not (X, A);
   `endif

   `ifdef VIRL_functiononly

   `else

specify
(A -=> X)=(0, 0);
endspecify
   `endif

endmodule
`endcelldefine

//%END SVN_INV_4

//%BEGIN SVN_INV_6

`celldefine
module SVN_INV_6 (X, A);
   output X;
   input A;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////


   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////
   `ifdef VIRL_functiononly
        not #`SNPS_COMBO_DELAY (X, A);
    `else
        not (X, A);
   `endif

   `ifdef VIRL_functiononly

   `else

specify
(A -=> X)=(0, 0);
endspecify
   `endif

endmodule
`endcelldefine

//%END SVN_INV_6

//%BEGIN SVN_INV_8

`celldefine
module SVN_INV_8 (X, A);
   output X;
   input A;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////


   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////
   `ifdef VIRL_functiononly
        not #`SNPS_COMBO_DELAY (X, A);
    `else
        not (X, A);
   `endif

   `ifdef VIRL_functiononly

   `else

specify
(A -=> X)=(0, 0);
endspecify
   `endif

endmodule
`endcelldefine

//%END SVN_INV_8

//%BEGIN SVN_INV_AS_1

`celldefine
module SVN_INV_AS_1 (X, A);
   output X;
   input A;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////


   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////
   `ifdef VIRL_functiononly
        not #`SNPS_COMBO_DELAY (X, A);
    `else
        not (X, A);
   `endif

   `ifdef VIRL_functiononly

   `else

specify
(A -=> X)=(0, 0);
endspecify
   `endif

endmodule
`endcelldefine

//%END SVN_INV_AS_1

//%BEGIN SVN_INV_AS_12

`celldefine
module SVN_INV_AS_12 (X, A);
   output X;
   input A;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////


   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////
   `ifdef VIRL_functiononly
        not #`SNPS_COMBO_DELAY (X, A);
    `else
        not (X, A);
   `endif

   `ifdef VIRL_functiononly

   `else

specify
(A -=> X)=(0, 0);
endspecify
   `endif

endmodule
`endcelldefine

//%END SVN_INV_AS_12

//%BEGIN SVN_INV_AS_16

`celldefine
module SVN_INV_AS_16 (X, A);
   output X;
   input A;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////


   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////
   `ifdef VIRL_functiononly
        not #`SNPS_COMBO_DELAY (X, A);
    `else
        not (X, A);
   `endif

   `ifdef VIRL_functiononly

   `else

specify
(A -=> X)=(0, 0);
endspecify
   `endif

endmodule
`endcelldefine

//%END SVN_INV_AS_16

//%BEGIN SVN_INV_AS_2

`celldefine
module SVN_INV_AS_2 (X, A);
   output X;
   input A;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////


   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////
   `ifdef VIRL_functiononly
        not #`SNPS_COMBO_DELAY (X, A);
    `else
        not (X, A);
   `endif

   `ifdef VIRL_functiononly

   `else

specify
(A -=> X)=(0, 0);
endspecify
   `endif

endmodule
`endcelldefine

//%END SVN_INV_AS_2

//%BEGIN SVN_INV_AS_24

`celldefine
module SVN_INV_AS_24 (X, A);
   output X;
   input A;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////


   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////
   `ifdef VIRL_functiononly
        not #`SNPS_COMBO_DELAY (X, A);
    `else
        not (X, A);
   `endif

   `ifdef VIRL_functiononly

   `else

specify
(A -=> X)=(0, 0);
endspecify
   `endif

endmodule
`endcelldefine

//%END SVN_INV_AS_24

//%BEGIN SVN_INV_AS_3

`celldefine
module SVN_INV_AS_3 (X, A);
   output X;
   input A;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////


   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////
   `ifdef VIRL_functiononly
        not #`SNPS_COMBO_DELAY (X, A);
    `else
        not (X, A);
   `endif

   `ifdef VIRL_functiononly

   `else

specify
(A -=> X)=(0, 0);
endspecify
   `endif

endmodule
`endcelldefine

//%END SVN_INV_AS_3

//%BEGIN SVN_INV_AS_4

`celldefine
module SVN_INV_AS_4 (X, A);
   output X;
   input A;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////


   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////
   `ifdef VIRL_functiononly
        not #`SNPS_COMBO_DELAY (X, A);
    `else
        not (X, A);
   `endif

   `ifdef VIRL_functiononly

   `else

specify
(A -=> X)=(0, 0);
endspecify
   `endif

endmodule
`endcelldefine

//%END SVN_INV_AS_4

//%BEGIN SVN_INV_AS_6

`celldefine
module SVN_INV_AS_6 (X, A);
   output X;
   input A;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////


   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////
   `ifdef VIRL_functiononly
        not #`SNPS_COMBO_DELAY (X, A);
    `else
        not (X, A);
   `endif

   `ifdef VIRL_functiononly

   `else

specify
(A -=> X)=(0, 0);
endspecify
   `endif

endmodule
`endcelldefine

//%END SVN_INV_AS_6

//%BEGIN SVN_INV_AS_8

`celldefine
module SVN_INV_AS_8 (X, A);
   output X;
   input A;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////


   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////
   `ifdef VIRL_functiononly
        not #`SNPS_COMBO_DELAY (X, A);
    `else
        not (X, A);
   `endif

   `ifdef VIRL_functiononly

   `else

specify
(A -=> X)=(0, 0);
endspecify
   `endif

endmodule
`endcelldefine

//%END SVN_INV_AS_8

//%BEGIN SVN_INV_S_1

`celldefine
module SVN_INV_S_1 (X, A);
   output X;
   input A;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////


   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////
   `ifdef VIRL_functiononly
        not #`SNPS_COMBO_DELAY (X, A);
    `else
        not (X, A);
   `endif

   `ifdef VIRL_functiononly

   `else

specify
(A -=> X)=(0, 0);
endspecify
   `endif

endmodule
`endcelldefine

//%END SVN_INV_S_1

//%BEGIN SVN_INV_S_12

`celldefine
module SVN_INV_S_12 (X, A);
   output X;
   input A;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////


   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////
   `ifdef VIRL_functiononly
        not #`SNPS_COMBO_DELAY (X, A);
    `else
        not (X, A);
   `endif

   `ifdef VIRL_functiononly

   `else

specify
(A -=> X)=(0, 0);
endspecify
   `endif

endmodule
`endcelldefine

//%END SVN_INV_S_12

//%BEGIN SVN_INV_S_16

`celldefine
module SVN_INV_S_16 (X, A);
   output X;
   input A;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////


   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////
   `ifdef VIRL_functiononly
        not #`SNPS_COMBO_DELAY (X, A);
    `else
        not (X, A);
   `endif

   `ifdef VIRL_functiononly

   `else

specify
(A -=> X)=(0, 0);
endspecify
   `endif

endmodule
`endcelldefine

//%END SVN_INV_S_16

//%BEGIN SVN_INV_S_2

`celldefine
module SVN_INV_S_2 (X, A);
   output X;
   input A;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////


   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////
   `ifdef VIRL_functiononly
        not #`SNPS_COMBO_DELAY (X, A);
    `else
        not (X, A);
   `endif

   `ifdef VIRL_functiononly

   `else

specify
(A -=> X)=(0, 0);
endspecify
   `endif

endmodule
`endcelldefine

//%END SVN_INV_S_2

//%BEGIN SVN_INV_S_24

`celldefine
module SVN_INV_S_24 (X, A);
   output X;
   input A;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////


   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////
   `ifdef VIRL_functiononly
        not #`SNPS_COMBO_DELAY (X, A);
    `else
        not (X, A);
   `endif

   `ifdef VIRL_functiononly

   `else

specify
(A -=> X)=(0, 0);
endspecify
   `endif

endmodule
`endcelldefine

//%END SVN_INV_S_24

//%BEGIN SVN_INV_S_3

`celldefine
module SVN_INV_S_3 (X, A);
   output X;
   input A;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////


   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////
   `ifdef VIRL_functiononly
        not #`SNPS_COMBO_DELAY (X, A);
    `else
        not (X, A);
   `endif

   `ifdef VIRL_functiononly

   `else

specify
(A -=> X)=(0, 0);
endspecify
   `endif

endmodule
`endcelldefine

//%END SVN_INV_S_3

//%BEGIN SVN_INV_S_4

`celldefine
module SVN_INV_S_4 (X, A);
   output X;
   input A;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////


   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////
   `ifdef VIRL_functiononly
        not #`SNPS_COMBO_DELAY (X, A);
    `else
        not (X, A);
   `endif

   `ifdef VIRL_functiononly

   `else

specify
(A -=> X)=(0, 0);
endspecify
   `endif

endmodule
`endcelldefine

//%END SVN_INV_S_4

//%BEGIN SVN_INV_S_6

`celldefine
module SVN_INV_S_6 (X, A);
   output X;
   input A;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////


   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////
   `ifdef VIRL_functiononly
        not #`SNPS_COMBO_DELAY (X, A);
    `else
        not (X, A);
   `endif

   `ifdef VIRL_functiononly

   `else

specify
(A -=> X)=(0, 0);
endspecify
   `endif

endmodule
`endcelldefine

//%END SVN_INV_S_6

//%BEGIN SVN_INV_S_8

`celldefine
module SVN_INV_S_8 (X, A);
   output X;
   input A;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////


   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////
   `ifdef VIRL_functiononly
        not #`SNPS_COMBO_DELAY (X, A);
    `else
        not (X, A);
   `endif

   `ifdef VIRL_functiononly

   `else

specify
(A -=> X)=(0, 0);
endspecify
   `endif

endmodule
`endcelldefine

//%END SVN_INV_S_8

//%BEGIN SVN_LDNQ_1

`celldefine
module SVN_LDNQ_1 (Q, G, D);
   output Q;
   input G, D;

   reg viol_0;
   wire delayed_G, delayed_D;

   wire int_res__G;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////

`ifdef _fv
   buf (delayed_G, G);
   buf (delayed_D, D);
`endif

   not (int_res__G, delayed_G);

   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////

   `ifdef VIRL_functiononly
        latch #`SNPS_LAT_DELAY (Q, viol_0, int_res__G, delayed_D);

   `else

        latch (Q, viol_0, int_res__G, delayed_D);
   `endif

   `ifdef VIRL_functiononly

   `else


specify
(D +=> Q)=(0, 0);
(negedge G => (Q : 1'b1))=(0, 0);
$setuphold(posedge G , posedge D , 0 ,0, viol_0, , , delayed_G, delayed_D);
$setuphold(posedge G , negedge D , 0 ,0, viol_0, , , delayed_G, delayed_D);
$width(negedge G &&& ~D , 0 ,0, viol_0);
$width(negedge G &&& D , 0 ,0, viol_0);
endspecify
   `endif

endmodule
`endcelldefine

//%END SVN_LDNQ_1

//%BEGIN SVN_LDNQ_2

`celldefine
module SVN_LDNQ_2 (Q, G, D);
   output Q;
   input G, D;

   reg viol_0;
   wire delayed_G, delayed_D;

   wire int_res__G;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////

`ifdef _fv
   buf (delayed_G, G);
   buf (delayed_D, D);
`endif

   not (int_res__G, delayed_G);

   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////

   `ifdef VIRL_functiononly
        latch #`SNPS_LAT_DELAY (Q, viol_0, int_res__G, delayed_D);

   `else

        latch (Q, viol_0, int_res__G, delayed_D);
   `endif

   `ifdef VIRL_functiononly

   `else


specify
(D +=> Q)=(0, 0);
(negedge G => (Q : 1'b1))=(0, 0);
$setuphold(posedge G , posedge D , 0 ,0, viol_0, , , delayed_G, delayed_D);
$setuphold(posedge G , negedge D , 0 ,0, viol_0, , , delayed_G, delayed_D);
$width(negedge G &&& ~D , 0 ,0, viol_0);
$width(negedge G &&& D , 0 ,0, viol_0);
endspecify
   `endif

endmodule
`endcelldefine

//%END SVN_LDNQ_2

//%BEGIN SVN_LDNQ_4

`celldefine
module SVN_LDNQ_4 (Q, G, D);
   output Q;
   input G, D;

   reg viol_0;
   wire delayed_G, delayed_D;

   wire int_res__G;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////

`ifdef _fv
   buf (delayed_G, G);
   buf (delayed_D, D);
`endif

   not (int_res__G, delayed_G);

   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////

   `ifdef VIRL_functiononly
        latch #`SNPS_LAT_DELAY (Q, viol_0, int_res__G, delayed_D);

   `else

        latch (Q, viol_0, int_res__G, delayed_D);
   `endif

   `ifdef VIRL_functiononly

   `else


specify
(D +=> Q)=(0, 0);
(negedge G => (Q : 1'b1))=(0, 0);
$setuphold(posedge G , posedge D , 0 ,0, viol_0, , , delayed_G, delayed_D);
$setuphold(posedge G , negedge D , 0 ,0, viol_0, , , delayed_G, delayed_D);
$width(negedge G &&& ~D , 0 ,0, viol_0);
$width(negedge G &&& D , 0 ,0, viol_0);
endspecify
   `endif

endmodule
`endcelldefine

//%END SVN_LDNQ_4

//%BEGIN SVN_LDNRBQ_1

`celldefine
module SVN_LDNRBQ_1 (Q, G, D, RD);
   output Q;
   input G, D, RD;

   reg viol_0;
   wire delayed_G, delayed_D, delayed_RD;

   wire int_res__G, int_res__RD;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////

`ifdef _fv
   buf (delayed_G, G);
   buf (delayed_D, D);
`endif
   buf (delayed_RD, RD);

   not (int_res__G, delayed_G);
   not (int_res__RD, delayed_RD);

   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////

   `ifdef VIRL_functiononly
        latch_r #`SNPS_LAT_DELAY (Q, viol_0, int_res__G, delayed_D, int_res__RD);
    `else
        latch_r (Q, viol_0, int_res__G, delayed_D, int_res__RD);
    `endif

    `ifdef VIRL_functiononly

    `else

not U0 (_net_0, D);
and U1 (cond3, RD, _net_0);
and U2 (cond2, RD, D);
not U3 (_net_1, D);
and U4 (cond1, G, _net_1);
and U5 (cond0, G, D);

specify
(D +=> Q)=(0, 0);
(negedge G => (Q : 1'b1))=(0, 0);
if ((~(D) & G)) (negedge RD => (Q +: 1'b0))=(0, 0);
if ((D & ~(G))) (negedge RD => (Q +: 1'b0))=(0, 0);
if ((D & G)) (negedge RD => (Q +: 1'b0))=(0, 0);
(posedge RD => (Q:1'b0))=(0, 0);
$setuphold(posedge G &&& RD , posedge D &&& RD , 0 ,0, viol_0, , , delayed_G, delayed_D);
$setuphold(posedge G &&& RD , negedge D &&& RD , 0 ,0, viol_0, , , delayed_G, delayed_D);
$width(negedge G &&& cond3 , 0 ,0, viol_0);
$width(negedge G &&& cond2 , 0 ,0, viol_0);
$width(negedge RD &&& cond1 , 0 ,0, viol_0);
$width(negedge RD &&& cond0 , 0 ,0, viol_0);
$recovery(posedge RD &&& D , posedge G &&& D , 0 , viol_0);
$hold(posedge G &&& D , posedge RD &&& D , 0 , viol_0);
endspecify
    `endif

endmodule
`endcelldefine

//%END SVN_LDNRBQ_1

//%BEGIN SVN_LDNRBQ_2

`celldefine
module SVN_LDNRBQ_2 (Q, G, D, RD);
   output Q;
   input G, D, RD;

   reg viol_0;
   wire delayed_G, delayed_D, delayed_RD;

   wire int_res__G, int_res__RD;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////

`ifdef _fv
   buf (delayed_G, G);
   buf (delayed_D, D);
`endif
   buf (delayed_RD, RD);

   not (int_res__G, delayed_G);
   not (int_res__RD, delayed_RD);

   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////

   `ifdef VIRL_functiononly
        latch_r #`SNPS_LAT_DELAY (Q, viol_0, int_res__G, delayed_D, int_res__RD);
    `else
        latch_r (Q, viol_0, int_res__G, delayed_D, int_res__RD);
    `endif

    `ifdef VIRL_functiononly

    `else

not U0 (_net_0, D);
and U1 (cond3, RD, _net_0);
and U2 (cond2, RD, D);
not U3 (_net_1, D);
and U4 (cond1, G, _net_1);
and U5 (cond0, G, D);

specify
(D +=> Q)=(0, 0);
(negedge G => (Q : 1'b1))=(0, 0);
if ((~(D) & G)) (negedge RD => (Q +: 1'b0))=(0, 0);
if ((D & ~(G))) (negedge RD => (Q +: 1'b0))=(0, 0);
if ((D & G)) (negedge RD => (Q +: 1'b0))=(0, 0);
(posedge RD => (Q:1'b0))=(0, 0);
$setuphold(posedge G &&& RD , posedge D &&& RD , 0 ,0, viol_0, , , delayed_G, delayed_D);
$setuphold(posedge G &&& RD , negedge D &&& RD , 0 ,0, viol_0, , , delayed_G, delayed_D);
$width(negedge G &&& cond3 , 0 ,0, viol_0);
$width(negedge G &&& cond2 , 0 ,0, viol_0);
$width(negedge RD &&& cond1 , 0 ,0, viol_0);
$width(negedge RD &&& cond0 , 0 ,0, viol_0);
$recovery(posedge RD &&& D , posedge G &&& D , 0 , viol_0);
$hold(posedge G &&& D , posedge RD &&& D , 0 , viol_0);
endspecify
    `endif

endmodule
`endcelldefine

//%END SVN_LDNRBQ_2

//%BEGIN SVN_LDNRBQ_4

`celldefine
module SVN_LDNRBQ_4 (Q, G, D, RD);
   output Q;
   input G, D, RD;

   reg viol_0;
   wire delayed_G, delayed_D, delayed_RD;

   wire int_res__G, int_res__RD;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////

`ifdef _fv
   buf (delayed_G, G);
   buf (delayed_D, D);
`endif
   buf (delayed_RD, RD);

   not (int_res__G, delayed_G);
   not (int_res__RD, delayed_RD);

   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////

   `ifdef VIRL_functiononly
        latch_r #`SNPS_LAT_DELAY (Q, viol_0, int_res__G, delayed_D, int_res__RD);
    `else
        latch_r (Q, viol_0, int_res__G, delayed_D, int_res__RD);
    `endif

    `ifdef VIRL_functiononly

    `else

not U0 (_net_0, D);
and U1 (cond3, RD, _net_0);
and U2 (cond2, RD, D);
not U3 (_net_1, D);
and U4 (cond1, G, _net_1);
and U5 (cond0, G, D);

specify
(D +=> Q)=(0, 0);
(negedge G => (Q : 1'b1))=(0, 0);
if ((~(D) & G)) (negedge RD => (Q +: 1'b0))=(0, 0);
if ((D & ~(G))) (negedge RD => (Q +: 1'b0))=(0, 0);
if ((D & G)) (negedge RD => (Q +: 1'b0))=(0, 0);
(posedge RD => (Q:1'b0))=(0, 0);
$setuphold(posedge G &&& RD , posedge D &&& RD , 0 ,0, viol_0, , , delayed_G, delayed_D);
$setuphold(posedge G &&& RD , negedge D &&& RD , 0 ,0, viol_0, , , delayed_G, delayed_D);
$width(negedge G &&& cond3 , 0 ,0, viol_0);
$width(negedge G &&& cond2 , 0 ,0, viol_0);
$width(negedge RD &&& cond1 , 0 ,0, viol_0);
$width(negedge RD &&& cond0 , 0 ,0, viol_0);
$recovery(posedge RD &&& D , posedge G &&& D , 0 , viol_0);
$hold(posedge G &&& D , posedge RD &&& D , 0 , viol_0);
endspecify
    `endif

endmodule
`endcelldefine

//%END SVN_LDNRBQ_4

//%BEGIN SVN_LDNSBQ_1

`celldefine
module SVN_LDNSBQ_1 (Q, G, D, SD);
   output Q;
   input G, D, SD;

   reg viol_0;
   wire delayed_G, delayed_D, delayed_SD;

   wire int_res__G, int_res__SD;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////

`ifdef _fv
   buf (delayed_G, G);
   buf (delayed_D, D);
`endif
   buf (delayed_SD, SD);

   not (int_res__G, delayed_G);
   not (int_res__SD, delayed_SD);

   `ifdef VIRL_functiononly
      latch_s #`SNPS_LAT_DELAY(Q, viol_0, int_res__G, delayed_D, int_res__SD);
   `else
      latch_s (Q, viol_0, int_res__G, delayed_D, int_res__SD);
   `endif

   `ifdef VIRL_functiononly

   `else

   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////

not U0 (_net_0, D);
and U1 (cond1, SD, _net_0);
and U2 (cond0, SD, D);

specify
(D +=> Q)=(0, 0);
(negedge G => (Q : 1'b1))=(0, 0);
if ((~(D) & ~(G))) (negedge SD => (Q -: 1'b1))=(0, 0);
if (G) (negedge SD => (Q -: 1'b1))=(0, 0);
(posedge SD => (Q:1'b1))=(0, 0);
$setuphold(posedge G &&& SD , posedge D &&& SD , 0 ,0, viol_0, , , delayed_G, delayed_D);
$setuphold(posedge G &&& SD , negedge D &&& SD , 0 ,0, viol_0, , , delayed_G, delayed_D);
$width(negedge G &&& cond1 , 0 ,0, viol_0);
$width(negedge G &&& cond0 , 0 ,0, viol_0);
$recovery(posedge SD &&& ~D , posedge G &&& ~D , 0 , viol_0);
$hold(posedge G &&& ~D , posedge SD &&& ~D , 0 , viol_0);
$width(negedge SD &&& G , 0 ,0, viol_0);
endspecify
   `endif
endmodule
`endcelldefine

//%END SVN_LDNSBQ_1

//%BEGIN SVN_LDNSBQ_2

`celldefine
module SVN_LDNSBQ_2 (Q, G, D, SD);
   output Q;
   input G, D, SD;

   reg viol_0;
   wire delayed_G, delayed_D, delayed_SD;

   wire int_res__G, int_res__SD;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////

`ifdef _fv
   buf (delayed_G, G);
   buf (delayed_D, D);
`endif
   buf (delayed_SD, SD);

   not (int_res__G, delayed_G);
   not (int_res__SD, delayed_SD);

   `ifdef VIRL_functiononly
      latch_s #`SNPS_LAT_DELAY(Q, viol_0, int_res__G, delayed_D, int_res__SD);
   `else
      latch_s (Q, viol_0, int_res__G, delayed_D, int_res__SD);
   `endif

   `ifdef VIRL_functiononly

   `else

   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////

not U0 (_net_0, D);
and U1 (cond1, SD, _net_0);
and U2 (cond0, SD, D);

specify
(D +=> Q)=(0, 0);
(negedge G => (Q : 1'b1))=(0, 0);
if ((~(D) & ~(G))) (negedge SD => (Q -: 1'b1))=(0, 0);
if (G) (negedge SD => (Q -: 1'b1))=(0, 0);
(posedge SD => (Q:1'b1))=(0, 0);
$setuphold(posedge G &&& SD , posedge D &&& SD , 0 ,0, viol_0, , , delayed_G, delayed_D);
$setuphold(posedge G &&& SD , negedge D &&& SD , 0 ,0, viol_0, , , delayed_G, delayed_D);
$width(negedge G &&& cond1 , 0 ,0, viol_0);
$width(negedge G &&& cond0 , 0 ,0, viol_0);
$recovery(posedge SD &&& ~D , posedge G &&& ~D , 0 , viol_0);
$hold(posedge G &&& ~D , posedge SD &&& ~D , 0 , viol_0);
$width(negedge SD &&& G , 0 ,0, viol_0);
endspecify
   `endif
endmodule
`endcelldefine

//%END SVN_LDNSBQ_2

//%BEGIN SVN_LDNSBQ_4

`celldefine
module SVN_LDNSBQ_4 (Q, G, D, SD);
   output Q;
   input G, D, SD;

   reg viol_0;
   wire delayed_G, delayed_D, delayed_SD;

   wire int_res__G, int_res__SD;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////

`ifdef _fv
   buf (delayed_G, G);
   buf (delayed_D, D);
`endif
   buf (delayed_SD, SD);

   not (int_res__G, delayed_G);
   not (int_res__SD, delayed_SD);

   `ifdef VIRL_functiononly
      latch_s #`SNPS_LAT_DELAY(Q, viol_0, int_res__G, delayed_D, int_res__SD);
   `else
      latch_s (Q, viol_0, int_res__G, delayed_D, int_res__SD);
   `endif

   `ifdef VIRL_functiononly

   `else

   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////

not U0 (_net_0, D);
and U1 (cond1, SD, _net_0);
and U2 (cond0, SD, D);

specify
(D +=> Q)=(0, 0);
(negedge G => (Q : 1'b1))=(0, 0);
if ((~(D) & ~(G))) (negedge SD => (Q -: 1'b1))=(0, 0);
if (G) (negedge SD => (Q -: 1'b1))=(0, 0);
(posedge SD => (Q:1'b1))=(0, 0);
$setuphold(posedge G &&& SD , posedge D &&& SD , 0 ,0, viol_0, , , delayed_G, delayed_D);
$setuphold(posedge G &&& SD , negedge D &&& SD , 0 ,0, viol_0, , , delayed_G, delayed_D);
$width(negedge G &&& cond1 , 0 ,0, viol_0);
$width(negedge G &&& cond0 , 0 ,0, viol_0);
$recovery(posedge SD &&& ~D , posedge G &&& ~D , 0 , viol_0);
$hold(posedge G &&& ~D , posedge SD &&& ~D , 0 , viol_0);
$width(negedge SD &&& G , 0 ,0, viol_0);
endspecify
   `endif
endmodule
`endcelldefine

//%END SVN_LDNSBQ_4

//%BEGIN SVN_LDPQ_1

`celldefine
module SVN_LDPQ_1 (Q, G, D);
   output Q;
   input G, D;

   reg viol_0;
   wire delayed_G, delayed_D;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////

`ifdef _fv
   buf (delayed_G, G);
   buf (delayed_D, D);
`endif


   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////

   `ifdef VIRL_functiononly
        latch #`SNPS_LAT_DELAY (Q, viol_0, delayed_G, delayed_D);

    `else

        latch (Q, viol_0, delayed_G, delayed_D);
   `endif

   `ifdef VIRL_functiononly

   `else


specify
(D +=> Q)=(0, 0);
(posedge G => (Q : 1'b1))=(0, 0);
$setuphold(negedge G , posedge D , 0 ,0, viol_0, , , delayed_G, delayed_D);
$setuphold(negedge G , negedge D , 0 ,0, viol_0, , , delayed_G, delayed_D);
$width(posedge G &&& ~D , 0 ,0, viol_0);
$width(posedge G &&& D , 0 ,0, viol_0);
endspecify
   `endif

endmodule
`endcelldefine

//%END SVN_LDPQ_1

//%BEGIN SVN_LDPQ_2

`celldefine
module SVN_LDPQ_2 (Q, G, D);
   output Q;
   input G, D;

   reg viol_0;
   wire delayed_G, delayed_D;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////

`ifdef _fv
   buf (delayed_G, G);
   buf (delayed_D, D);
`endif


   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////

   `ifdef VIRL_functiononly
        latch #`SNPS_LAT_DELAY (Q, viol_0, delayed_G, delayed_D);

    `else

        latch (Q, viol_0, delayed_G, delayed_D);
   `endif

   `ifdef VIRL_functiononly

   `else


specify
(D +=> Q)=(0, 0);
(posedge G => (Q : 1'b1))=(0, 0);
$setuphold(negedge G , posedge D , 0 ,0, viol_0, , , delayed_G, delayed_D);
$setuphold(negedge G , negedge D , 0 ,0, viol_0, , , delayed_G, delayed_D);
$width(posedge G &&& ~D , 0 ,0, viol_0);
$width(posedge G &&& D , 0 ,0, viol_0);
endspecify
   `endif

endmodule
`endcelldefine

//%END SVN_LDPQ_2

//%BEGIN SVN_LDPQ_4

`celldefine
module SVN_LDPQ_4 (Q, G, D);
   output Q;
   input G, D;

   reg viol_0;
   wire delayed_G, delayed_D;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////

`ifdef _fv
   buf (delayed_G, G);
   buf (delayed_D, D);
`endif


   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////

   `ifdef VIRL_functiononly
        latch #`SNPS_LAT_DELAY (Q, viol_0, delayed_G, delayed_D);

    `else

        latch (Q, viol_0, delayed_G, delayed_D);
   `endif

   `ifdef VIRL_functiononly

   `else


specify
(D +=> Q)=(0, 0);
(posedge G => (Q : 1'b1))=(0, 0);
$setuphold(negedge G , posedge D , 0 ,0, viol_0, , , delayed_G, delayed_D);
$setuphold(negedge G , negedge D , 0 ,0, viol_0, , , delayed_G, delayed_D);
$width(posedge G &&& ~D , 0 ,0, viol_0);
$width(posedge G &&& D , 0 ,0, viol_0);
endspecify
   `endif

endmodule
`endcelldefine

//%END SVN_LDPQ_4

//%BEGIN SVN_LDPRBQ_1

`celldefine
module SVN_LDPRBQ_1 (Q, G, D, RD);
   output Q;
   input G, D, RD;

   reg viol_0;
   wire delayed_G, delayed_D, delayed_RD;

   wire int_res__RD;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////

`ifdef _fv
   buf (delayed_G, G);
   buf (delayed_D, D);
`endif
   buf (delayed_RD, RD);

   not (int_res__RD, delayed_RD);

   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////

   `ifdef VIRL_functiononly
        latch_r #`SNPS_LAT_DELAY (Q, viol_0, delayed_G, delayed_D, int_res__RD);

   `else
        latch_r (Q, viol_0, delayed_G, delayed_D, int_res__RD);

   `endif

   `ifdef VIRL_functiononly

   `else

not U0 (_net_0, D);
and U1 (cond3, RD, _net_0);
and U2 (cond2, RD, D);
not U3 (_net_1, G);
not U4 (_net_2, D);
and U5 (cond1, _net_1, _net_2);
not U6 (_net_3, G);
and U7 (cond0, _net_3, D);

specify
(D +=> Q)=(0, 0);
(posedge G => (Q : 1'b1))=(0, 0);
if ((~(D) & ~(G))) (negedge RD => (Q +: 1'b0))=(0, 0);
if ((D & ~(G))) (negedge RD => (Q +: 1'b0))=(0, 0);
if ((D & G)) (negedge RD => (Q +: 1'b0))=(0, 0);
(posedge RD => (Q:1'b0))=(0, 0);
$setuphold(negedge G &&& RD , posedge D &&& RD , 0 ,0, viol_0, , , delayed_G, delayed_D);
$setuphold(negedge G &&& RD , negedge D &&& RD , 0 ,0, viol_0, , , delayed_G, delayed_D);
$width(posedge G &&& cond3 , 0 ,0, viol_0);
$width(posedge G &&& cond2 , 0 ,0, viol_0);
$width(negedge RD &&& cond1 , 0 ,0, viol_0);
$width(negedge RD &&& cond0 , 0 ,0, viol_0);
$recovery(posedge RD &&& D , negedge G &&& D , 0 , viol_0);
$hold(negedge G &&& D , posedge RD &&& D , 0 , viol_0);
endspecify
   `endif

endmodule
`endcelldefine

//%END SVN_LDPRBQ_1

//%BEGIN SVN_LDPRBQ_2

`celldefine
module SVN_LDPRBQ_2 (Q, G, D, RD);
   output Q;
   input G, D, RD;

   reg viol_0;
   wire delayed_G, delayed_D, delayed_RD;

   wire int_res__RD;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////

`ifdef _fv
   buf (delayed_G, G);
   buf (delayed_D, D);
`endif
   buf (delayed_RD, RD);

   not (int_res__RD, delayed_RD);

   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////

   `ifdef VIRL_functiononly
        latch_r #`SNPS_LAT_DELAY (Q, viol_0, delayed_G, delayed_D, int_res__RD);

   `else
        latch_r (Q, viol_0, delayed_G, delayed_D, int_res__RD);

   `endif

   `ifdef VIRL_functiononly

   `else

not U0 (_net_0, D);
and U1 (cond3, RD, _net_0);
and U2 (cond2, RD, D);
not U3 (_net_1, G);
not U4 (_net_2, D);
and U5 (cond1, _net_1, _net_2);
not U6 (_net_3, G);
and U7 (cond0, _net_3, D);

specify
(D +=> Q)=(0, 0);
(posedge G => (Q : 1'b1))=(0, 0);
if ((~(D) & ~(G))) (negedge RD => (Q +: 1'b0))=(0, 0);
if ((D & ~(G))) (negedge RD => (Q +: 1'b0))=(0, 0);
if ((D & G)) (negedge RD => (Q +: 1'b0))=(0, 0);
(posedge RD => (Q:1'b0))=(0, 0);
$setuphold(negedge G &&& RD , posedge D &&& RD , 0 ,0, viol_0, , , delayed_G, delayed_D);
$setuphold(negedge G &&& RD , negedge D &&& RD , 0 ,0, viol_0, , , delayed_G, delayed_D);
$width(posedge G &&& cond3 , 0 ,0, viol_0);
$width(posedge G &&& cond2 , 0 ,0, viol_0);
$width(negedge RD &&& cond1 , 0 ,0, viol_0);
$width(negedge RD &&& cond0 , 0 ,0, viol_0);
$recovery(posedge RD &&& D , negedge G &&& D , 0 , viol_0);
$hold(negedge G &&& D , posedge RD &&& D , 0 , viol_0);
endspecify
   `endif

endmodule
`endcelldefine

//%END SVN_LDPRBQ_2

//%BEGIN SVN_LDPRBQ_4

`celldefine
module SVN_LDPRBQ_4 (Q, G, D, RD);
   output Q;
   input G, D, RD;

   reg viol_0;
   wire delayed_G, delayed_D, delayed_RD;

   wire int_res__RD;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////

`ifdef _fv
   buf (delayed_G, G);
   buf (delayed_D, D);
`endif
   buf (delayed_RD, RD);

   not (int_res__RD, delayed_RD);

   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////

   `ifdef VIRL_functiononly
        latch_r #`SNPS_LAT_DELAY (Q, viol_0, delayed_G, delayed_D, int_res__RD);

   `else
        latch_r (Q, viol_0, delayed_G, delayed_D, int_res__RD);

   `endif

   `ifdef VIRL_functiononly

   `else

not U0 (_net_0, D);
and U1 (cond3, RD, _net_0);
and U2 (cond2, RD, D);
not U3 (_net_1, G);
not U4 (_net_2, D);
and U5 (cond1, _net_1, _net_2);
not U6 (_net_3, G);
and U7 (cond0, _net_3, D);

specify
(D +=> Q)=(0, 0);
(posedge G => (Q : 1'b1))=(0, 0);
if ((~(D) & ~(G))) (negedge RD => (Q +: 1'b0))=(0, 0);
if ((D & ~(G))) (negedge RD => (Q +: 1'b0))=(0, 0);
if ((D & G)) (negedge RD => (Q +: 1'b0))=(0, 0);
(posedge RD => (Q:1'b0))=(0, 0);
$setuphold(negedge G &&& RD , posedge D &&& RD , 0 ,0, viol_0, , , delayed_G, delayed_D);
$setuphold(negedge G &&& RD , negedge D &&& RD , 0 ,0, viol_0, , , delayed_G, delayed_D);
$width(posedge G &&& cond3 , 0 ,0, viol_0);
$width(posedge G &&& cond2 , 0 ,0, viol_0);
$width(negedge RD &&& cond1 , 0 ,0, viol_0);
$width(negedge RD &&& cond0 , 0 ,0, viol_0);
$recovery(posedge RD &&& D , negedge G &&& D , 0 , viol_0);
$hold(negedge G &&& D , posedge RD &&& D , 0 , viol_0);
endspecify
   `endif

endmodule
`endcelldefine

//%END SVN_LDPRBQ_4

//%BEGIN SVN_LDPSBQ_1

`celldefine
module SVN_LDPSBQ_1 (Q, G, D, SD);
   output Q;
   input G, D, SD;

   reg viol_0;
   wire delayed_G, delayed_D, delayed_SD;

   wire int_res__SD;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////

`ifdef _fv
   buf (delayed_G, G);
   buf (delayed_D, D);
`endif
   buf (delayed_SD, SD);

   not (int_res__SD, delayed_SD);

   `ifdef VIRL_functiononly
      latch_s #`SNPS_LAT_DELAY (Q, viol_0, delayed_G, delayed_D, int_res__SD);
   `else
      latch_s (Q, viol_0, delayed_G, delayed_D, int_res__SD);
   `endif

   `ifdef VIRL_functiononly

   `else

   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////

not U0 (_net_0, D);
and U1 (cond1, SD, _net_0);
and U2 (cond0, SD, D);

specify
(D +=> Q)=(0, 0);
(posedge G => (Q : 1'b1))=(0, 0);
if (~(G)) (negedge SD => (Q -: 1'b1))=(0, 0);
if ((~(D) & G)) (negedge SD => (Q -: 1'b1))=(0, 0);
(posedge SD => (Q:1'b1))=(0, 0);
$setuphold(negedge G &&& SD , posedge D &&& SD , 0 ,0, viol_0, , , delayed_G, delayed_D);
$setuphold(negedge G &&& SD , negedge D &&& SD , 0 ,0, viol_0, , , delayed_G, delayed_D);
$width(posedge G &&& cond1 , 0 ,0, viol_0);
$width(posedge G &&& cond0 , 0 ,0, viol_0);
$recovery(posedge SD &&& ~D , negedge G &&& ~D , 0 , viol_0);
$hold(negedge G &&& ~D , posedge SD &&& ~D , 0 , viol_0);
$width(negedge SD &&& ~G , 0 ,0, viol_0);
endspecify
   `endif
endmodule
`endcelldefine

//%END SVN_LDPSBQ_1

//%BEGIN SVN_LDPSBQ_2

`celldefine
module SVN_LDPSBQ_2 (Q, G, D, SD);
   output Q;
   input G, D, SD;

   reg viol_0;
   wire delayed_G, delayed_D, delayed_SD;

   wire int_res__SD;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////

`ifdef _fv
   buf (delayed_G, G);
   buf (delayed_D, D);
`endif
   buf (delayed_SD, SD);

   not (int_res__SD, delayed_SD);

   `ifdef VIRL_functiononly
      latch_s #`SNPS_LAT_DELAY (Q, viol_0, delayed_G, delayed_D, int_res__SD);
   `else
      latch_s (Q, viol_0, delayed_G, delayed_D, int_res__SD);
   `endif

   `ifdef VIRL_functiononly

   `else

   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////

not U0 (_net_0, D);
and U1 (cond1, SD, _net_0);
and U2 (cond0, SD, D);

specify
(D +=> Q)=(0, 0);
(posedge G => (Q : 1'b1))=(0, 0);
if (~(G)) (negedge SD => (Q -: 1'b1))=(0, 0);
if ((~(D) & G)) (negedge SD => (Q -: 1'b1))=(0, 0);
(posedge SD => (Q:1'b1))=(0, 0);
$setuphold(negedge G &&& SD , posedge D &&& SD , 0 ,0, viol_0, , , delayed_G, delayed_D);
$setuphold(negedge G &&& SD , negedge D &&& SD , 0 ,0, viol_0, , , delayed_G, delayed_D);
$width(posedge G &&& cond1 , 0 ,0, viol_0);
$width(posedge G &&& cond0 , 0 ,0, viol_0);
$recovery(posedge SD &&& ~D , negedge G &&& ~D , 0 , viol_0);
$hold(negedge G &&& ~D , posedge SD &&& ~D , 0 , viol_0);
$width(negedge SD &&& ~G , 0 ,0, viol_0);
endspecify
   `endif
endmodule
`endcelldefine

//%END SVN_LDPSBQ_2

//%BEGIN SVN_LDPSBQ_4

`celldefine
module SVN_LDPSBQ_4 (Q, G, D, SD);
   output Q;
   input G, D, SD;

   reg viol_0;
   wire delayed_G, delayed_D, delayed_SD;

   wire int_res__SD;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////

`ifdef _fv
   buf (delayed_G, G);
   buf (delayed_D, D);
`endif
   buf (delayed_SD, SD);

   not (int_res__SD, delayed_SD);

   `ifdef VIRL_functiononly
      latch_s #`SNPS_LAT_DELAY (Q, viol_0, delayed_G, delayed_D, int_res__SD);
   `else
      latch_s (Q, viol_0, delayed_G, delayed_D, int_res__SD);
   `endif

   `ifdef VIRL_functiononly

   `else

   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////

not U0 (_net_0, D);
and U1 (cond1, SD, _net_0);
and U2 (cond0, SD, D);

specify
(D +=> Q)=(0, 0);
(posedge G => (Q : 1'b1))=(0, 0);
if (~(G)) (negedge SD => (Q -: 1'b1))=(0, 0);
if ((~(D) & G)) (negedge SD => (Q -: 1'b1))=(0, 0);
(posedge SD => (Q:1'b1))=(0, 0);
$setuphold(negedge G &&& SD , posedge D &&& SD , 0 ,0, viol_0, , , delayed_G, delayed_D);
$setuphold(negedge G &&& SD , negedge D &&& SD , 0 ,0, viol_0, , , delayed_G, delayed_D);
$width(posedge G &&& cond1 , 0 ,0, viol_0);
$width(posedge G &&& cond0 , 0 ,0, viol_0);
$recovery(posedge SD &&& ~D , negedge G &&& ~D , 0 , viol_0);
$hold(negedge G &&& ~D , posedge SD &&& ~D , 0 , viol_0);
$width(negedge SD &&& ~G , 0 ,0, viol_0);
endspecify
   `endif
endmodule
`endcelldefine

//%END SVN_LDPSBQ_4

//%BEGIN SVN_MAJ3_1

`celldefine
module SVN_MAJ3_1 (X, A1, A2, A3);
   output X;
   input A1, A2, A3;

   wire int_res_0, int_res_1, int_res_2;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////

   and (int_res_0, A1, A2);
   and (int_res_1, A1, A3);
   and (int_res_2, A2, A3);

   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////

   `ifdef VIRL_functiononly
        or #`SNPS_COMBO_DELAY (X, int_res_0, int_res_1, int_res_2);
   `else
        or (X, int_res_0, int_res_1, int_res_2);
   `endif

   `ifdef VIRL_functiononly

   `else


specify
if ((~(A1) & A2)) (A3 +=> X)=(0, 0);
if ((A1 & ~(A2))) (A3 +=> X)=(0, 0);
if ((~(A1) & A3)) (A2 +=> X)=(0, 0);
if ((A1 & ~(A3))) (A2 +=> X)=(0, 0);
if ((~(A2) & A3)) (A1 +=> X)=(0, 0);
if ((A2 & ~(A3))) (A1 +=> X)=(0, 0);
endspecify
   `endif

endmodule
`endcelldefine

//%END SVN_MAJ3_1

//%BEGIN SVN_MAJ3_2

`celldefine
module SVN_MAJ3_2 (X, A1, A2, A3);
   output X;
   input A1, A2, A3;

   wire int_res_0, int_res_1, int_res_2;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////

   and (int_res_0, A1, A2);
   and (int_res_1, A1, A3);
   and (int_res_2, A2, A3);

   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////

   `ifdef VIRL_functiononly
        or #`SNPS_COMBO_DELAY (X, int_res_0, int_res_1, int_res_2);
   `else
        or (X, int_res_0, int_res_1, int_res_2);
   `endif

   `ifdef VIRL_functiononly

   `else


specify
if ((~(A1) & A2)) (A3 +=> X)=(0, 0);
if ((A1 & ~(A2))) (A3 +=> X)=(0, 0);
if ((~(A1) & A3)) (A2 +=> X)=(0, 0);
if ((A1 & ~(A3))) (A2 +=> X)=(0, 0);
if ((~(A2) & A3)) (A1 +=> X)=(0, 0);
if ((A2 & ~(A3))) (A1 +=> X)=(0, 0);
endspecify
   `endif

endmodule
`endcelldefine

//%END SVN_MAJ3_2

//%BEGIN SVN_MAJ3_4

`celldefine
module SVN_MAJ3_4 (X, A1, A2, A3);
   output X;
   input A1, A2, A3;

   wire int_res_0, int_res_1, int_res_2;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////

   and (int_res_0, A1, A2);
   and (int_res_1, A1, A3);
   and (int_res_2, A2, A3);

   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////

   `ifdef VIRL_functiononly
        or #`SNPS_COMBO_DELAY (X, int_res_0, int_res_1, int_res_2);
   `else
        or (X, int_res_0, int_res_1, int_res_2);
   `endif

   `ifdef VIRL_functiononly

   `else


specify
if ((~(A1) & A2)) (A3 +=> X)=(0, 0);
if ((A1 & ~(A2))) (A3 +=> X)=(0, 0);
if ((~(A1) & A3)) (A2 +=> X)=(0, 0);
if ((A1 & ~(A3))) (A2 +=> X)=(0, 0);
if ((~(A2) & A3)) (A1 +=> X)=(0, 0);
if ((A2 & ~(A3))) (A1 +=> X)=(0, 0);
endspecify
   `endif

endmodule
`endcelldefine

//%END SVN_MAJ3_4

//%BEGIN SVN_MAJI3_1

`celldefine
module SVN_MAJI3_1 (X, A1, A2, A3);
   output X;
   input A1, A2, A3;

   wire int_res_0, int_res_1, int_res_2;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////

   and (int_res_0, A1, A2);
   and (int_res_1, A1, A3);
   and (int_res_2, A2, A3);

   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////

   `ifdef VIRL_functiononly
        nor #`SNPS_COMBO_DELAY (X, int_res_0, int_res_1, int_res_2);
   `else
        nor (X, int_res_0, int_res_1, int_res_2);
    `endif

   `ifdef VIRL_functiononly

   `else


specify
if ((~(A1) & A2)) (A3 -=> X)=(0, 0);
if ((A1 & ~(A2))) (A3 -=> X)=(0, 0);
if ((~(A1) & A3)) (A2 -=> X)=(0, 0);
if ((A1 & ~(A3))) (A2 -=> X)=(0, 0);
if ((~(A2) & A3)) (A1 -=> X)=(0, 0);
if ((A2 & ~(A3))) (A1 -=> X)=(0, 0);
endspecify
   `endif

endmodule
`endcelldefine

//%END SVN_MAJI3_1

//%BEGIN SVN_MAJI3_2

`celldefine
module SVN_MAJI3_2 (X, A1, A2, A3);
   output X;
   input A1, A2, A3;

   wire int_res_0, int_res_1, int_res_2;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////

   and (int_res_0, A1, A2);
   and (int_res_1, A1, A3);
   and (int_res_2, A2, A3);

   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////

   `ifdef VIRL_functiononly
        nor #`SNPS_COMBO_DELAY (X, int_res_0, int_res_1, int_res_2);
   `else
        nor (X, int_res_0, int_res_1, int_res_2);
    `endif

   `ifdef VIRL_functiononly

   `else


specify
if ((~(A1) & A2)) (A3 -=> X)=(0, 0);
if ((A1 & ~(A2))) (A3 -=> X)=(0, 0);
if ((~(A1) & A3)) (A2 -=> X)=(0, 0);
if ((A1 & ~(A3))) (A2 -=> X)=(0, 0);
if ((~(A2) & A3)) (A1 -=> X)=(0, 0);
if ((A2 & ~(A3))) (A1 -=> X)=(0, 0);
endspecify
   `endif

endmodule
`endcelldefine

//%END SVN_MAJI3_2

//%BEGIN SVN_MAJI3_4

`celldefine
module SVN_MAJI3_4 (X, A1, A2, A3);
   output X;
   input A1, A2, A3;

   wire int_res_0, int_res_1, int_res_2;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////

   and (int_res_0, A1, A2);
   and (int_res_1, A1, A3);
   and (int_res_2, A2, A3);

   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////

   `ifdef VIRL_functiononly
        nor #`SNPS_COMBO_DELAY (X, int_res_0, int_res_1, int_res_2);
   `else
        nor (X, int_res_0, int_res_1, int_res_2);
    `endif

   `ifdef VIRL_functiononly

   `else


specify
if ((~(A1) & A2)) (A3 -=> X)=(0, 0);
if ((A1 & ~(A2))) (A3 -=> X)=(0, 0);
if ((~(A1) & A3)) (A2 -=> X)=(0, 0);
if ((A1 & ~(A3))) (A2 -=> X)=(0, 0);
if ((~(A2) & A3)) (A1 -=> X)=(0, 0);
if ((A2 & ~(A3))) (A1 -=> X)=(0, 0);
endspecify
   `endif

endmodule
`endcelldefine

//%END SVN_MAJI3_4

//%BEGIN SVN_MUX2_1

`celldefine
module SVN_MUX2_1 (X, D0, D1, S);
   output X;
   input D0, D1, S;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////


   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////

   `ifdef VIRL_functiononly
        mux2 #`SNPS_COMBO_DELAY (X, D1, D0, S);
   `else
        mux2 (X, D1, D0, S);
    `endif

   `ifdef VIRL_functiononly

   `else


specify
(D0 +=> X)=(0, 0);
(D1 +=> X)=(0, 0);
if ((~(D0) & D1)) (S +=> X)=(0, 0);
if ((D0 & ~(D1))) (S -=> X)=(0, 0);
endspecify
   `endif

endmodule
`endcelldefine

//%END SVN_MUX2_1

//%BEGIN SVN_MUX2_2

`celldefine
module SVN_MUX2_2 (X, D0, D1, S);
   output X;
   input D0, D1, S;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////


   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////

   `ifdef VIRL_functiononly
        mux2 #`SNPS_COMBO_DELAY (X, D1, D0, S);
   `else
        mux2 (X, D1, D0, S);
    `endif

   `ifdef VIRL_functiononly

   `else


specify
(D0 +=> X)=(0, 0);
(D1 +=> X)=(0, 0);
if ((~(D0) & D1)) (S +=> X)=(0, 0);
if ((D0 & ~(D1))) (S -=> X)=(0, 0);
endspecify
   `endif

endmodule
`endcelldefine

//%END SVN_MUX2_2

//%BEGIN SVN_MUX2_3

`celldefine
module SVN_MUX2_3 (X, D0, D1, S);
   output X;
   input D0, D1, S;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////


   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////

   `ifdef VIRL_functiononly
        mux2 #`SNPS_COMBO_DELAY (X, D1, D0, S);
   `else
        mux2 (X, D1, D0, S);
    `endif

   `ifdef VIRL_functiononly

   `else


specify
(D0 +=> X)=(0, 0);
(D1 +=> X)=(0, 0);
if ((~(D0) & D1)) (S +=> X)=(0, 0);
if ((D0 & ~(D1))) (S -=> X)=(0, 0);
endspecify
   `endif

endmodule
`endcelldefine

//%END SVN_MUX2_3

//%BEGIN SVN_MUX2_4

`celldefine
module SVN_MUX2_4 (X, D0, D1, S);
   output X;
   input D0, D1, S;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////


   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////

   `ifdef VIRL_functiononly
        mux2 #`SNPS_COMBO_DELAY (X, D1, D0, S);
   `else
        mux2 (X, D1, D0, S);
    `endif

   `ifdef VIRL_functiononly

   `else


specify
(D0 +=> X)=(0, 0);
(D1 +=> X)=(0, 0);
if ((~(D0) & D1)) (S +=> X)=(0, 0);
if ((D0 & ~(D1))) (S -=> X)=(0, 0);
endspecify
   `endif

endmodule
`endcelldefine

//%END SVN_MUX2_4

//%BEGIN SVN_MUX2_S_12

`celldefine
module SVN_MUX2_S_12 (X, D0, D1, S);
   output X;
   input D0, D1, S;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////


   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////

   `ifdef VIRL_functiononly
        mux2 #`SNPS_COMBO_DELAY (X, D1, D0, S);
   `else
        mux2 (X, D1, D0, S);
    `endif

   `ifdef VIRL_functiononly

   `else


specify
(D0 +=> X)=(0, 0);
(D1 +=> X)=(0, 0);
if ((~(D0) & D1)) (S +=> X)=(0, 0);
if ((D0 & ~(D1))) (S -=> X)=(0, 0);
endspecify
   `endif

endmodule
`endcelldefine

//%END SVN_MUX2_S_12

//%BEGIN SVN_MUX2_S_2

`celldefine
module SVN_MUX2_S_2 (X, D0, D1, S);
   output X;
   input D0, D1, S;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////


   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////

   `ifdef VIRL_functiononly
        mux2 #`SNPS_COMBO_DELAY (X, D1, D0, S);
   `else
        mux2 (X, D1, D0, S);
    `endif

   `ifdef VIRL_functiononly

   `else


specify
(D0 +=> X)=(0, 0);
(D1 +=> X)=(0, 0);
if ((~(D0) & D1)) (S +=> X)=(0, 0);
if ((D0 & ~(D1))) (S -=> X)=(0, 0);
endspecify
   `endif

endmodule
`endcelldefine

//%END SVN_MUX2_S_2

//%BEGIN SVN_MUX2_S_4

`celldefine
module SVN_MUX2_S_4 (X, D0, D1, S);
   output X;
   input D0, D1, S;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////


   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////

   `ifdef VIRL_functiononly
        mux2 #`SNPS_COMBO_DELAY (X, D1, D0, S);
   `else
        mux2 (X, D1, D0, S);
    `endif

   `ifdef VIRL_functiononly

   `else


specify
(D0 +=> X)=(0, 0);
(D1 +=> X)=(0, 0);
if ((~(D0) & D1)) (S +=> X)=(0, 0);
if ((D0 & ~(D1))) (S -=> X)=(0, 0);
endspecify
   `endif

endmodule
`endcelldefine

//%END SVN_MUX2_S_4

//%BEGIN SVN_MUX2_S_8

`celldefine
module SVN_MUX2_S_8 (X, D0, D1, S);
   output X;
   input D0, D1, S;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////


   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////

   `ifdef VIRL_functiononly
        mux2 #`SNPS_COMBO_DELAY (X, D1, D0, S);
   `else
        mux2 (X, D1, D0, S);
    `endif

   `ifdef VIRL_functiononly

   `else


specify
(D0 +=> X)=(0, 0);
(D1 +=> X)=(0, 0);
if ((~(D0) & D1)) (S +=> X)=(0, 0);
if ((D0 & ~(D1))) (S -=> X)=(0, 0);
endspecify
   `endif

endmodule
`endcelldefine

//%END SVN_MUX2_S_8

//%BEGIN SVN_MUX2B_1

`celldefine
module SVN_MUX2B_1 (X, D0, D1, S);
   output X;
   input D0, D1, S;

   wire int_res_0;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////

   not (int_res_0, D0);

   `ifdef VIRL_functiononly
      mux2 #`SNPS_COMBO_DELAY (X, D1, int_res_0, S);
   `else
      mux2 (X, D1, int_res_0, S);
   `endif

   `ifdef VIRL_functiononly

   `else

   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////


specify
if (D0==1'b0&&D1==1'b0) (S -=> X)=(0, 0);
if (D0==1'b1&&D1==1'b1) (S +=> X)=(0, 0);
if (D0==1'b0&&S==1'b1) (D1 +=> X)=(0, 0);
if (D0==1'b1&&S==1'b1) (D1 +=> X)=(0, 0);
if (D1==1'b0&&S==1'b0) (D0 -=> X)=(0, 0);
if (D1==1'b1&&S==1'b0) (D0 -=> X)=(0, 0);
endspecify
   `endif
endmodule
`endcelldefine

//%END SVN_MUX2B_1

//%BEGIN SVN_MUX2B_2

`celldefine
module SVN_MUX2B_2 (X, D0, D1, S);
   output X;
   input D0, D1, S;

   wire int_res_0;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////

   not (int_res_0, D0);

   `ifdef VIRL_functiononly
      mux2 #`SNPS_COMBO_DELAY (X, D1, int_res_0, S);
   `else
      mux2 (X, D1, int_res_0, S);
   `endif

   `ifdef VIRL_functiononly

   `else

   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////


specify
if (D0==1'b0&&D1==1'b0) (S -=> X)=(0, 0);
if (D0==1'b1&&D1==1'b1) (S +=> X)=(0, 0);
if (D0==1'b0&&S==1'b1) (D1 +=> X)=(0, 0);
if (D0==1'b1&&S==1'b1) (D1 +=> X)=(0, 0);
if (D1==1'b0&&S==1'b0) (D0 -=> X)=(0, 0);
if (D1==1'b1&&S==1'b0) (D0 -=> X)=(0, 0);
endspecify
   `endif
endmodule
`endcelldefine

//%END SVN_MUX2B_2

//%BEGIN SVN_MUX2B_3

`celldefine
module SVN_MUX2B_3 (X, D0, D1, S);
   output X;
   input D0, D1, S;

   wire int_res_0;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////

   not (int_res_0, D0);

   `ifdef VIRL_functiononly
      mux2 #`SNPS_COMBO_DELAY (X, D1, int_res_0, S);
   `else
      mux2 (X, D1, int_res_0, S);
   `endif

   `ifdef VIRL_functiononly

   `else

   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////


specify
if (D0==1'b0&&D1==1'b0) (S -=> X)=(0, 0);
if (D0==1'b1&&D1==1'b1) (S +=> X)=(0, 0);
if (D0==1'b0&&S==1'b1) (D1 +=> X)=(0, 0);
if (D0==1'b1&&S==1'b1) (D1 +=> X)=(0, 0);
if (D1==1'b0&&S==1'b0) (D0 -=> X)=(0, 0);
if (D1==1'b1&&S==1'b0) (D0 -=> X)=(0, 0);
endspecify
   `endif
endmodule
`endcelldefine

//%END SVN_MUX2B_3

//%BEGIN SVN_MUX2B_4

`celldefine
module SVN_MUX2B_4 (X, D0, D1, S);
   output X;
   input D0, D1, S;

   wire int_res_0;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////

   not (int_res_0, D0);

   `ifdef VIRL_functiononly
      mux2 #`SNPS_COMBO_DELAY (X, D1, int_res_0, S);
   `else
      mux2 (X, D1, int_res_0, S);
   `endif

   `ifdef VIRL_functiononly

   `else

   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////


specify
if (D0==1'b0&&D1==1'b0) (S -=> X)=(0, 0);
if (D0==1'b1&&D1==1'b1) (S +=> X)=(0, 0);
if (D0==1'b0&&S==1'b1) (D1 +=> X)=(0, 0);
if (D0==1'b1&&S==1'b1) (D1 +=> X)=(0, 0);
if (D1==1'b0&&S==1'b0) (D0 -=> X)=(0, 0);
if (D1==1'b1&&S==1'b0) (D0 -=> X)=(0, 0);
endspecify
   `endif
endmodule
`endcelldefine

//%END SVN_MUX2B_4

//%BEGIN SVN_MUX3_1

`celldefine
module SVN_MUX3_1 (X, D0, D1, D2, S0, S1);
   output X;
   input D0, D1, D2, S0, S1;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////


   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////

   `ifdef VIRL_functiononly
        mux4 #`SNPS_COMBO_DELAY (X, D2, D2, D1, D0, S1, S0);
   `else
        mux4 (X, D2, D2, D1, D0, S1, S0);
    `endif

   `ifdef VIRL_functiononly

   `else


specify
(D0 +=> X)=(0, 0);
(D1 +=> X)=(0, 0);
(D2 +=> X)=(0, 0);
if ((~(D0) & D1 & ~(S1))) (S0 +=> X)=(0, 0);
if ((D0 & ~(D1) & ~(S1))) (S0 -=> X)=(0, 0);
if ((~(D0) & D2 & ~(S0))) (S1 +=> X)=(0, 0);
if ((~(D1) & D2 & S0)) (S1 +=> X)=(0, 0);
if ((D0 & ~(D2) & ~(S0))) (S1 -=> X)=(0, 0);
if ((D1 & ~(D2) & S0)) (S1 -=> X)=(0, 0);
endspecify
   `endif 

endmodule
`endcelldefine

//%END SVN_MUX3_1

//%BEGIN SVN_MUX3_2

`celldefine
module SVN_MUX3_2 (X, D0, D1, D2, S0, S1);
   output X;
   input D0, D1, D2, S0, S1;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////


   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////

   `ifdef VIRL_functiononly
        mux4 #`SNPS_COMBO_DELAY (X, D2, D2, D1, D0, S1, S0);
   `else
        mux4 (X, D2, D2, D1, D0, S1, S0);
    `endif

   `ifdef VIRL_functiononly

   `else


specify
(D0 +=> X)=(0, 0);
(D1 +=> X)=(0, 0);
(D2 +=> X)=(0, 0);
if ((~(D0) & D1 & ~(S1))) (S0 +=> X)=(0, 0);
if ((D0 & ~(D1) & ~(S1))) (S0 -=> X)=(0, 0);
if ((~(D0) & D2 & ~(S0))) (S1 +=> X)=(0, 0);
if ((~(D1) & D2 & S0)) (S1 +=> X)=(0, 0);
if ((D0 & ~(D2) & ~(S0))) (S1 -=> X)=(0, 0);
if ((D1 & ~(D2) & S0)) (S1 -=> X)=(0, 0);
endspecify
   `endif 

endmodule
`endcelldefine

//%END SVN_MUX3_2

//%BEGIN SVN_MUX3_4

`celldefine
module SVN_MUX3_4 (X, D0, D1, D2, S0, S1);
   output X;
   input D0, D1, D2, S0, S1;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////


   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////

   `ifdef VIRL_functiononly
        mux4 #`SNPS_COMBO_DELAY (X, D2, D2, D1, D0, S1, S0);
   `else
        mux4 (X, D2, D2, D1, D0, S1, S0);
    `endif

   `ifdef VIRL_functiononly

   `else


specify
(D0 +=> X)=(0, 0);
(D1 +=> X)=(0, 0);
(D2 +=> X)=(0, 0);
if ((~(D0) & D1 & ~(S1))) (S0 +=> X)=(0, 0);
if ((D0 & ~(D1) & ~(S1))) (S0 -=> X)=(0, 0);
if ((~(D0) & D2 & ~(S0))) (S1 +=> X)=(0, 0);
if ((~(D1) & D2 & S0)) (S1 +=> X)=(0, 0);
if ((D0 & ~(D2) & ~(S0))) (S1 -=> X)=(0, 0);
if ((D1 & ~(D2) & S0)) (S1 -=> X)=(0, 0);
endspecify
   `endif 

endmodule
`endcelldefine

//%END SVN_MUX3_4

//%BEGIN SVN_MUX4_S_12

`celldefine
module SVN_MUX4_S_12 (X, D0, D1, D2, D3, S0, S1);
   output X;
   input D0, D1, D2, D3, S0, S1;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////


   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////

   `ifdef VIRL_functiononly
         mux4 #`SNPS_COMBO_DELAY (X, D3, D2, D1, D0, S1, S0);
   `else
         mux4 (X, D3, D2, D1, D0, S1, S0);
   `endif

   `ifdef VIRL_functiononly

    `else


specify
(D0 +=> X)=(0, 0);
(D1 +=> X)=(0, 0);
(D2 +=> X)=(0, 0);
(D3 +=> X)=(0, 0);
if ((~(D0) & D1 & ~(D2) & D3 & ~(S1))) (S0 +=> X)=(0, 0);
if ((~(D0) & D1 & ~(D2) & D3 & S1)) (S0 +=> X)=(0, 0);
if ((~(D0) & D1 & D2 & ~(D3) & ~(S1))) (S0 +=> X)=(0, 0);
if ((~(D0) & D1 & D2 & ~(D3) & S1)) (S0 -=> X)=(0, 0);
if ((~(D0) & D1 & D2 & D3 & ~(S1)) | (~(D0) & D1 & ~(D2) & ~(D3) & ~(S1))) (S0 +=> X)=(0, 0);
if ((D0 & ~(D1) & ~(D2) & D3 & ~(S1))) (S0 -=> X)=(0, 0);
if ((D0 & ~(D1) & ~(D2) & D3 & S1)) (S0 +=> X)=(0, 0);
if ((D0 & ~(D1) & D2 & ~(D3) & ~(S1))) (S0 -=> X)=(0, 0);
if ((D0 & ~(D1) & D2 & ~(D3) & S1)) (S0 -=> X)=(0, 0);
if ((D0 & ~(D1) & D2 & D3 & ~(S1)) | (D0 & ~(D1) & ~(D2) & ~(D3) & ~(S1))) (S0 -=> X)=(0, 0);
if ((D0 & D1 & ~(D2) & D3 & S1) | (~(D0) & ~(D1) & ~(D2) & D3 & S1)) (S0 +=> X)=(0, 0);
if ((D0 & D1 & D2 & ~(D3) & S1) | (~(D0) & ~(D1) & D2 & ~(D3) & S1)) (S0 -=> X)=(0, 0);
if ((~(D0) & D2 & ~(S0))) (S1 +=> X)=(0, 0);
if ((~(D1) & D3 & S0)) (S1 +=> X)=(0, 0);
if ((D0 & ~(D2) & ~(S0))) (S1 -=> X)=(0, 0);
if ((D1 & ~(D3) & S0)) (S1 -=> X)=(0, 0);
endspecify
   `endif

endmodule
`endcelldefine

//%END SVN_MUX4_S_12

//%BEGIN SVN_MUX4_S_8

`celldefine
module SVN_MUX4_S_8 (X, D0, D1, D2, D3, S0, S1);
   output X;
   input D0, D1, D2, D3, S0, S1;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////


   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////

   `ifdef VIRL_functiononly
         mux4 #`SNPS_COMBO_DELAY (X, D3, D2, D1, D0, S1, S0);
   `else
         mux4 (X, D3, D2, D1, D0, S1, S0);
   `endif

   `ifdef VIRL_functiononly

    `else


specify
(D0 +=> X)=(0, 0);
(D1 +=> X)=(0, 0);
(D2 +=> X)=(0, 0);
(D3 +=> X)=(0, 0);
if ((~(D0) & D1 & ~(D2) & D3 & ~(S1))) (S0 +=> X)=(0, 0);
if ((~(D0) & D1 & ~(D2) & D3 & S1)) (S0 +=> X)=(0, 0);
if ((~(D0) & D1 & D2 & ~(D3) & ~(S1))) (S0 +=> X)=(0, 0);
if ((~(D0) & D1 & D2 & ~(D3) & S1)) (S0 -=> X)=(0, 0);
if ((~(D0) & D1 & D2 & D3 & ~(S1)) | (~(D0) & D1 & ~(D2) & ~(D3) & ~(S1))) (S0 +=> X)=(0, 0);
if ((D0 & ~(D1) & ~(D2) & D3 & ~(S1))) (S0 -=> X)=(0, 0);
if ((D0 & ~(D1) & ~(D2) & D3 & S1)) (S0 +=> X)=(0, 0);
if ((D0 & ~(D1) & D2 & ~(D3) & ~(S1))) (S0 -=> X)=(0, 0);
if ((D0 & ~(D1) & D2 & ~(D3) & S1)) (S0 -=> X)=(0, 0);
if ((D0 & ~(D1) & D2 & D3 & ~(S1)) | (D0 & ~(D1) & ~(D2) & ~(D3) & ~(S1))) (S0 -=> X)=(0, 0);
if ((D0 & D1 & ~(D2) & D3 & S1) | (~(D0) & ~(D1) & ~(D2) & D3 & S1)) (S0 +=> X)=(0, 0);
if ((D0 & D1 & D2 & ~(D3) & S1) | (~(D0) & ~(D1) & D2 & ~(D3) & S1)) (S0 -=> X)=(0, 0);
if ((~(D0) & D2 & ~(S0))) (S1 +=> X)=(0, 0);
if ((~(D1) & D3 & S0)) (S1 +=> X)=(0, 0);
if ((D0 & ~(D2) & ~(S0))) (S1 -=> X)=(0, 0);
if ((D1 & ~(D3) & S0)) (S1 -=> X)=(0, 0);
endspecify
   `endif

endmodule
`endcelldefine

//%END SVN_MUX4_S_8

//%BEGIN SVN_MUX4_S_2

`celldefine
module SVN_MUX4_S_2 (X, D0, D1, D2, D3, S0, S1);
   output X;
   input D0, D1, D2, D3, S0, S1;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////


   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////

   `ifdef VIRL_functiononly
         mux4 #`SNPS_COMBO_DELAY (X, D3, D2, D1, D0, S1, S0);
   `else
         mux4 (X, D3, D2, D1, D0, S1, S0);
   `endif

   `ifdef VIRL_functiononly

    `else


specify
(D0 +=> X)=(0, 0);
(D1 +=> X)=(0, 0);
(D2 +=> X)=(0, 0);
(D3 +=> X)=(0, 0);
if ((~(D0) & D1 & ~(D2) & D3 & ~(S1))) (S0 +=> X)=(0, 0);
if ((~(D0) & D1 & ~(D2) & D3 & S1)) (S0 +=> X)=(0, 0);
if ((~(D0) & D1 & D2 & ~(D3) & ~(S1))) (S0 +=> X)=(0, 0);
if ((~(D0) & D1 & D2 & ~(D3) & S1)) (S0 -=> X)=(0, 0);
if ((~(D0) & D1 & D2 & D3 & ~(S1)) | (~(D0) & D1 & ~(D2) & ~(D3) & ~(S1))) (S0 +=> X)=(0, 0);
if ((D0 & ~(D1) & ~(D2) & D3 & ~(S1))) (S0 -=> X)=(0, 0);
if ((D0 & ~(D1) & ~(D2) & D3 & S1)) (S0 +=> X)=(0, 0);
if ((D0 & ~(D1) & D2 & ~(D3) & ~(S1))) (S0 -=> X)=(0, 0);
if ((D0 & ~(D1) & D2 & ~(D3) & S1)) (S0 -=> X)=(0, 0);
if ((D0 & ~(D1) & D2 & D3 & ~(S1)) | (D0 & ~(D1) & ~(D2) & ~(D3) & ~(S1))) (S0 -=> X)=(0, 0);
if ((D0 & D1 & ~(D2) & D3 & S1) | (~(D0) & ~(D1) & ~(D2) & D3 & S1)) (S0 +=> X)=(0, 0);
if ((D0 & D1 & D2 & ~(D3) & S1) | (~(D0) & ~(D1) & D2 & ~(D3) & S1)) (S0 -=> X)=(0, 0);
if ((~(D0) & D2 & ~(S0))) (S1 +=> X)=(0, 0);
if ((~(D1) & D3 & S0)) (S1 +=> X)=(0, 0);
if ((D0 & ~(D2) & ~(S0))) (S1 -=> X)=(0, 0);
if ((D1 & ~(D3) & S0)) (S1 -=> X)=(0, 0);
endspecify
   `endif

endmodule
`endcelldefine

//%END SVN_MUX4_S_2

//%BEGIN SVN_MUX4_S_4

`celldefine
module SVN_MUX4_S_4 (X, D0, D1, D2, D3, S0, S1);
   output X;
   input D0, D1, D2, D3, S0, S1;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////


   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////

   `ifdef VIRL_functiononly
         mux4 #`SNPS_COMBO_DELAY (X, D3, D2, D1, D0, S1, S0);
   `else
         mux4 (X, D3, D2, D1, D0, S1, S0);
   `endif

   `ifdef VIRL_functiononly

    `else


specify
(D0 +=> X)=(0, 0);
(D1 +=> X)=(0, 0);
(D2 +=> X)=(0, 0);
(D3 +=> X)=(0, 0);
if ((~(D0) & D1 & ~(D2) & D3 & ~(S1))) (S0 +=> X)=(0, 0);
if ((~(D0) & D1 & ~(D2) & D3 & S1)) (S0 +=> X)=(0, 0);
if ((~(D0) & D1 & D2 & ~(D3) & ~(S1))) (S0 +=> X)=(0, 0);
if ((~(D0) & D1 & D2 & ~(D3) & S1)) (S0 -=> X)=(0, 0);
if ((~(D0) & D1 & D2 & D3 & ~(S1)) | (~(D0) & D1 & ~(D2) & ~(D3) & ~(S1))) (S0 +=> X)=(0, 0);
if ((D0 & ~(D1) & ~(D2) & D3 & ~(S1))) (S0 -=> X)=(0, 0);
if ((D0 & ~(D1) & ~(D2) & D3 & S1)) (S0 +=> X)=(0, 0);
if ((D0 & ~(D1) & D2 & ~(D3) & ~(S1))) (S0 -=> X)=(0, 0);
if ((D0 & ~(D1) & D2 & ~(D3) & S1)) (S0 -=> X)=(0, 0);
if ((D0 & ~(D1) & D2 & D3 & ~(S1)) | (D0 & ~(D1) & ~(D2) & ~(D3) & ~(S1))) (S0 -=> X)=(0, 0);
if ((D0 & D1 & ~(D2) & D3 & S1) | (~(D0) & ~(D1) & ~(D2) & D3 & S1)) (S0 +=> X)=(0, 0);
if ((D0 & D1 & D2 & ~(D3) & S1) | (~(D0) & ~(D1) & D2 & ~(D3) & S1)) (S0 -=> X)=(0, 0);
if ((~(D0) & D2 & ~(S0))) (S1 +=> X)=(0, 0);
if ((~(D1) & D3 & S0)) (S1 +=> X)=(0, 0);
if ((D0 & ~(D2) & ~(S0))) (S1 -=> X)=(0, 0);
if ((D1 & ~(D3) & S0)) (S1 -=> X)=(0, 0);
endspecify
   `endif

endmodule
`endcelldefine

//%END SVN_MUX4_S_4

//%BEGIN SVN_MUX4_1

`celldefine
module SVN_MUX4_1 (X, D0, D1, D2, D3, S0, S1);
   output X;
   input D0, D1, D2, D3, S0, S1;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////


   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////

   `ifdef VIRL_functiononly
         mux4 #`SNPS_COMBO_DELAY (X, D3, D2, D1, D0, S1, S0);
   `else
         mux4 (X, D3, D2, D1, D0, S1, S0);
   `endif

   `ifdef VIRL_functiononly

    `else


specify
(D0 +=> X)=(0, 0);
(D1 +=> X)=(0, 0);
(D2 +=> X)=(0, 0);
(D3 +=> X)=(0, 0);
if ((~(D0) & D1 & ~(D2) & D3 & ~(S1))) (S0 +=> X)=(0, 0);
if ((~(D0) & D1 & ~(D2) & D3 & S1)) (S0 +=> X)=(0, 0);
if ((~(D0) & D1 & D2 & ~(D3) & ~(S1))) (S0 +=> X)=(0, 0);
if ((~(D0) & D1 & D2 & ~(D3) & S1)) (S0 -=> X)=(0, 0);
if ((~(D0) & D1 & D2 & D3 & ~(S1)) | (~(D0) & D1 & ~(D2) & ~(D3) & ~(S1))) (S0 +=> X)=(0, 0);
if ((D0 & ~(D1) & ~(D2) & D3 & ~(S1))) (S0 -=> X)=(0, 0);
if ((D0 & ~(D1) & ~(D2) & D3 & S1)) (S0 +=> X)=(0, 0);
if ((D0 & ~(D1) & D2 & ~(D3) & ~(S1))) (S0 -=> X)=(0, 0);
if ((D0 & ~(D1) & D2 & ~(D3) & S1)) (S0 -=> X)=(0, 0);
if ((D0 & ~(D1) & D2 & D3 & ~(S1)) | (D0 & ~(D1) & ~(D2) & ~(D3) & ~(S1))) (S0 -=> X)=(0, 0);
if ((D0 & D1 & ~(D2) & D3 & S1) | (~(D0) & ~(D1) & ~(D2) & D3 & S1)) (S0 +=> X)=(0, 0);
if ((D0 & D1 & D2 & ~(D3) & S1) | (~(D0) & ~(D1) & D2 & ~(D3) & S1)) (S0 -=> X)=(0, 0);
if ((~(D0) & D2 & ~(S0))) (S1 +=> X)=(0, 0);
if ((~(D1) & D3 & S0)) (S1 +=> X)=(0, 0);
if ((D0 & ~(D2) & ~(S0))) (S1 -=> X)=(0, 0);
if ((D1 & ~(D3) & S0)) (S1 -=> X)=(0, 0);
endspecify
   `endif

endmodule
`endcelldefine

//%END SVN_MUX4_1

//%BEGIN SVN_MUX4_2

`celldefine
module SVN_MUX4_2 (X, D0, D1, D2, D3, S0, S1);
   output X;
   input D0, D1, D2, D3, S0, S1;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////


   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////

   `ifdef VIRL_functiononly
         mux4 #`SNPS_COMBO_DELAY (X, D3, D2, D1, D0, S1, S0);
   `else
         mux4 (X, D3, D2, D1, D0, S1, S0);
   `endif

   `ifdef VIRL_functiononly

    `else


specify
(D0 +=> X)=(0, 0);
(D1 +=> X)=(0, 0);
(D2 +=> X)=(0, 0);
(D3 +=> X)=(0, 0);
if ((~(D0) & D1 & ~(D2) & D3 & ~(S1))) (S0 +=> X)=(0, 0);
if ((~(D0) & D1 & ~(D2) & D3 & S1)) (S0 +=> X)=(0, 0);
if ((~(D0) & D1 & D2 & ~(D3) & ~(S1))) (S0 +=> X)=(0, 0);
if ((~(D0) & D1 & D2 & ~(D3) & S1)) (S0 -=> X)=(0, 0);
if ((~(D0) & D1 & D2 & D3 & ~(S1)) | (~(D0) & D1 & ~(D2) & ~(D3) & ~(S1))) (S0 +=> X)=(0, 0);
if ((D0 & ~(D1) & ~(D2) & D3 & ~(S1))) (S0 -=> X)=(0, 0);
if ((D0 & ~(D1) & ~(D2) & D3 & S1)) (S0 +=> X)=(0, 0);
if ((D0 & ~(D1) & D2 & ~(D3) & ~(S1))) (S0 -=> X)=(0, 0);
if ((D0 & ~(D1) & D2 & ~(D3) & S1)) (S0 -=> X)=(0, 0);
if ((D0 & ~(D1) & D2 & D3 & ~(S1)) | (D0 & ~(D1) & ~(D2) & ~(D3) & ~(S1))) (S0 -=> X)=(0, 0);
if ((D0 & D1 & ~(D2) & D3 & S1) | (~(D0) & ~(D1) & ~(D2) & D3 & S1)) (S0 +=> X)=(0, 0);
if ((D0 & D1 & D2 & ~(D3) & S1) | (~(D0) & ~(D1) & D2 & ~(D3) & S1)) (S0 -=> X)=(0, 0);
if ((~(D0) & D2 & ~(S0))) (S1 +=> X)=(0, 0);
if ((~(D1) & D3 & S0)) (S1 +=> X)=(0, 0);
if ((D0 & ~(D2) & ~(S0))) (S1 -=> X)=(0, 0);
if ((D1 & ~(D3) & S0)) (S1 -=> X)=(0, 0);
endspecify
   `endif

endmodule
`endcelldefine

//%END SVN_MUX4_2

//%BEGIN SVN_MUX4_4

`celldefine
module SVN_MUX4_4 (X, D0, D1, D2, D3, S0, S1);
   output X;
   input D0, D1, D2, D3, S0, S1;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////


   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////

   `ifdef VIRL_functiononly
         mux4 #`SNPS_COMBO_DELAY (X, D3, D2, D1, D0, S1, S0);
   `else
         mux4 (X, D3, D2, D1, D0, S1, S0);
   `endif

   `ifdef VIRL_functiononly

    `else


specify
(D0 +=> X)=(0, 0);
(D1 +=> X)=(0, 0);
(D2 +=> X)=(0, 0);
(D3 +=> X)=(0, 0);
if ((~(D0) & D1 & ~(D2) & D3 & ~(S1))) (S0 +=> X)=(0, 0);
if ((~(D0) & D1 & ~(D2) & D3 & S1)) (S0 +=> X)=(0, 0);
if ((~(D0) & D1 & D2 & ~(D3) & ~(S1))) (S0 +=> X)=(0, 0);
if ((~(D0) & D1 & D2 & ~(D3) & S1)) (S0 -=> X)=(0, 0);
if ((~(D0) & D1 & D2 & D3 & ~(S1)) | (~(D0) & D1 & ~(D2) & ~(D3) & ~(S1))) (S0 +=> X)=(0, 0);
if ((D0 & ~(D1) & ~(D2) & D3 & ~(S1))) (S0 -=> X)=(0, 0);
if ((D0 & ~(D1) & ~(D2) & D3 & S1)) (S0 +=> X)=(0, 0);
if ((D0 & ~(D1) & D2 & ~(D3) & ~(S1))) (S0 -=> X)=(0, 0);
if ((D0 & ~(D1) & D2 & ~(D3) & S1)) (S0 -=> X)=(0, 0);
if ((D0 & ~(D1) & D2 & D3 & ~(S1)) | (D0 & ~(D1) & ~(D2) & ~(D3) & ~(S1))) (S0 -=> X)=(0, 0);
if ((D0 & D1 & ~(D2) & D3 & S1) | (~(D0) & ~(D1) & ~(D2) & D3 & S1)) (S0 +=> X)=(0, 0);
if ((D0 & D1 & D2 & ~(D3) & S1) | (~(D0) & ~(D1) & D2 & ~(D3) & S1)) (S0 -=> X)=(0, 0);
if ((~(D0) & D2 & ~(S0))) (S1 +=> X)=(0, 0);
if ((~(D1) & D3 & S0)) (S1 +=> X)=(0, 0);
if ((D0 & ~(D2) & ~(S0))) (S1 -=> X)=(0, 0);
if ((D1 & ~(D3) & S0)) (S1 -=> X)=(0, 0);
endspecify
   `endif

endmodule
`endcelldefine

//%END SVN_MUX4_4

//%BEGIN SVN_MUXI2_0P5

`celldefine
module SVN_MUXI2_0P5 (X, D0, D1, S);
   output X;
   input D0, D1, S;

   wire int_res_mux1;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////

   mux2 (int_res_mux1, D1, D0, S);

   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////

    `ifdef VIRL_functiononly
        not #`SNPS_COMBO_DELAY (X, int_res_mux1);
    `else
        not (X, int_res_mux1);
    `endif

    `ifdef VIRL_functiononly

    `else


specify
if ((~(D0) & D1)) (S -=> X)=(0, 0);
if ((D0 & ~(D1))) (S +=> X)=(0, 0);
if ((~(D0) & S)) (D1 -=> X)=(0, 0);
if ((D0 & S)) (D1 -=> X)=(0, 0);
if ((~(D1) & ~(S))) (D0 -=> X)=(0, 0);
if ((D1 & ~(S))) (D0 -=> X)=(0, 0);
endspecify
    `endif

endmodule
`endcelldefine

//%END SVN_MUXI2_0P5

//%BEGIN SVN_MUXI2_1

`celldefine
module SVN_MUXI2_1 (X, D0, D1, S);
   output X;
   input D0, D1, S;

   wire int_res_mux1;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////

   mux2 (int_res_mux1, D1, D0, S);

   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////

    `ifdef VIRL_functiononly
        not #`SNPS_COMBO_DELAY (X, int_res_mux1);
    `else
        not (X, int_res_mux1);
    `endif

    `ifdef VIRL_functiononly

    `else


specify
if ((~(D0) & D1)) (S -=> X)=(0, 0);
if ((D0 & ~(D1))) (S +=> X)=(0, 0);
if ((~(D0) & S)) (D1 -=> X)=(0, 0);
if ((D0 & S)) (D1 -=> X)=(0, 0);
if ((~(D1) & ~(S))) (D0 -=> X)=(0, 0);
if ((D1 & ~(S))) (D0 -=> X)=(0, 0);
endspecify
    `endif

endmodule
`endcelldefine

//%END SVN_MUXI2_1

//%BEGIN SVN_MUXI2_2

`celldefine
module SVN_MUXI2_2 (X, D0, D1, S);
   output X;
   input D0, D1, S;

   wire int_res_mux1;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////

   mux2 (int_res_mux1, D1, D0, S);

   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////

    `ifdef VIRL_functiononly
        not #`SNPS_COMBO_DELAY (X, int_res_mux1);
    `else
        not (X, int_res_mux1);
    `endif

    `ifdef VIRL_functiononly

    `else


specify
if ((~(D0) & D1)) (S -=> X)=(0, 0);
if ((D0 & ~(D1))) (S +=> X)=(0, 0);
if ((~(D0) & S)) (D1 -=> X)=(0, 0);
if ((D0 & S)) (D1 -=> X)=(0, 0);
if ((~(D1) & ~(S))) (D0 -=> X)=(0, 0);
if ((D1 & ~(S))) (D0 -=> X)=(0, 0);
endspecify
    `endif

endmodule
`endcelldefine

//%END SVN_MUXI2_2

//%BEGIN SVN_MUXI2_3

`celldefine
module SVN_MUXI2_3 (X, D0, D1, S);
   output X;
   input D0, D1, S;

   wire int_res_mux1;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////

   mux2 (int_res_mux1, D1, D0, S);

   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////

    `ifdef VIRL_functiononly
        not #`SNPS_COMBO_DELAY (X, int_res_mux1);
    `else
        not (X, int_res_mux1);
    `endif

    `ifdef VIRL_functiononly

    `else


specify
if ((~(D0) & D1)) (S -=> X)=(0, 0);
if ((D0 & ~(D1))) (S +=> X)=(0, 0);
if ((~(D0) & S)) (D1 -=> X)=(0, 0);
if ((D0 & S)) (D1 -=> X)=(0, 0);
if ((~(D1) & ~(S))) (D0 -=> X)=(0, 0);
if ((D1 & ~(S))) (D0 -=> X)=(0, 0);
endspecify
    `endif

endmodule
`endcelldefine

//%END SVN_MUXI2_3

//%BEGIN SVN_MUXI2_4

`celldefine
module SVN_MUXI2_4 (X, D0, D1, S);
   output X;
   input D0, D1, S;

   wire int_res_mux1;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////

   mux2 (int_res_mux1, D1, D0, S);

   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////

    `ifdef VIRL_functiononly
        not #`SNPS_COMBO_DELAY (X, int_res_mux1);
    `else
        not (X, int_res_mux1);
    `endif

    `ifdef VIRL_functiononly

    `else


specify
if ((~(D0) & D1)) (S -=> X)=(0, 0);
if ((D0 & ~(D1))) (S +=> X)=(0, 0);
if ((~(D0) & S)) (D1 -=> X)=(0, 0);
if ((D0 & S)) (D1 -=> X)=(0, 0);
if ((~(D1) & ~(S))) (D0 -=> X)=(0, 0);
if ((D1 & ~(S))) (D0 -=> X)=(0, 0);
endspecify
    `endif

endmodule
`endcelldefine

//%END SVN_MUXI2_4

//%BEGIN SVN_MUXI4_1

`celldefine
module SVN_MUXI4_1 (X, D0, D1, D2, D3, S0, S1);
   output X;
   input D0, D1, D2, D3, S0, S1;

   wire int_res_mux1;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////

   mux4 (int_res_mux1, D3, D2, D1, D0, S1, S0);

   `ifdef VIRL_functiononly
      not #`SNPS_COMBO_DELAY (X, int_res_mux1);
   `else
      not (X, int_res_mux1);
   `endif

   `ifdef VIRL_functiononly

   `else

   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////


specify
if (D0==1'b0&&D1==1'b0&&D2==1'b0&&D3==1'b1&&S0==1'b1) (S1 -=> X)=(0, 0);
if (D0==1'b0&&D1==1'b0&&D2==1'b1&&D3==1'b0&&S0==1'b0) (S1 -=> X)=(0, 0);
if (D0==1'b0&&D1==1'b0&&D2==1'b1&&D3==1'b1&&S0==1'b0) (S1 -=> X)=(0, 0);
if (D0==1'b0&&D1==1'b0&&D2==1'b1&&D3==1'b1&&S0==1'b1) (S1 -=> X)=(0, 0);
if (D0==1'b0&&D1==1'b1&&D2==1'b0&&D3==1'b0&&S0==1'b1) (S1 +=> X)=(0, 0);
if (D0==1'b0&&D1==1'b1&&D2==1'b1&&D3==1'b0&&S0==1'b0) (S1 -=> X)=(0, 0);
if (D0==1'b0&&D1==1'b1&&D2==1'b1&&D3==1'b0&&S0==1'b1) (S1 +=> X)=(0, 0);
if (D0==1'b0&&D1==1'b1&&D2==1'b1&&D3==1'b1&&S0==1'b0) (S1 -=> X)=(0, 0);
if (D0==1'b1&&D1==1'b0&&D2==1'b0&&D3==1'b0&&S0==1'b0) (S1 +=> X)=(0, 0);
if (D0==1'b1&&D1==1'b0&&D2==1'b0&&D3==1'b1&&S0==1'b0) (S1 +=> X)=(0, 0);
if (D0==1'b1&&D1==1'b0&&D2==1'b0&&D3==1'b1&&S0==1'b1) (S1 -=> X)=(0, 0);
if (D0==1'b1&&D1==1'b0&&D2==1'b1&&D3==1'b1&&S0==1'b1) (S1 -=> X)=(0, 0);
if (D0==1'b1&&D1==1'b1&&D2==1'b0&&D3==1'b0&&S0==1'b0) (S1 +=> X)=(0, 0);
if (D0==1'b1&&D1==1'b1&&D2==1'b0&&D3==1'b0&&S0==1'b1) (S1 +=> X)=(0, 0);
if (D0==1'b1&&D1==1'b1&&D2==1'b0&&D3==1'b1&&S0==1'b0) (S1 +=> X)=(0, 0);
if (D0==1'b1&&D1==1'b1&&D2==1'b1&&D3==1'b0&&S0==1'b1) (S1 +=> X)=(0, 0);
if (D0==1'b0&&D1==1'b0&&D2==1'b0&&D3==1'b1&&S1==1'b1) (S0 -=> X)=(0, 0);
if (D0==1'b0&&D1==1'b0&&D2==1'b1&&D3==1'b0&&S1==1'b1) (S0 +=> X)=(0, 0);
if (D0==1'b0&&D1==1'b1&&D2==1'b0&&D3==1'b0&&S1==1'b0) (S0 -=> X)=(0, 0);
if (D0==1'b0&&D1==1'b1&&D2==1'b0&&D3==1'b1&&S1==1'b0) (S0 -=> X)=(0, 0);
if (D0==1'b0&&D1==1'b1&&D2==1'b0&&D3==1'b1&&S1==1'b1) (S0 -=> X)=(0, 0);
if (D0==1'b0&&D1==1'b1&&D2==1'b1&&D3==1'b0&&S1==1'b0) (S0 -=> X)=(0, 0);
if (D0==1'b0&&D1==1'b1&&D2==1'b1&&D3==1'b0&&S1==1'b1) (S0 +=> X)=(0, 0);
if (D0==1'b0&&D1==1'b1&&D2==1'b1&&D3==1'b1&&S1==1'b0) (S0 -=> X)=(0, 0);
if (D0==1'b1&&D1==1'b0&&D2==1'b0&&D3==1'b0&&S1==1'b0) (S0 +=> X)=(0, 0);
if (D0==1'b1&&D1==1'b0&&D2==1'b0&&D3==1'b1&&S1==1'b0) (S0 +=> X)=(0, 0);
if (D0==1'b1&&D1==1'b0&&D2==1'b0&&D3==1'b1&&S1==1'b1) (S0 -=> X)=(0, 0);
if (D0==1'b1&&D1==1'b0&&D2==1'b1&&D3==1'b0&&S1==1'b0) (S0 +=> X)=(0, 0);
if (D0==1'b1&&D1==1'b0&&D2==1'b1&&D3==1'b0&&S1==1'b1) (S0 +=> X)=(0, 0);
if (D0==1'b1&&D1==1'b0&&D2==1'b1&&D3==1'b1&&S1==1'b0) (S0 +=> X)=(0, 0);
if (D0==1'b1&&D1==1'b1&&D2==1'b0&&D3==1'b1&&S1==1'b1) (S0 -=> X)=(0, 0);
if (D0==1'b1&&D1==1'b1&&D2==1'b1&&D3==1'b0&&S1==1'b1) (S0 +=> X)=(0, 0);
if (D0==1'b0&&D1==1'b0&&D2==1'b0&&S0==1'b1&&S1==1'b1) (D3 -=> X)=(0, 0);
if (D0==1'b0&&D1==1'b0&&D2==1'b1&&S0==1'b1&&S1==1'b1) (D3 -=> X)=(0, 0);
if (D0==1'b0&&D1==1'b1&&D2==1'b0&&S0==1'b1&&S1==1'b1) (D3 -=> X)=(0, 0);
if (D0==1'b0&&D1==1'b1&&D2==1'b1&&S0==1'b1&&S1==1'b1) (D3 -=> X)=(0, 0);
if (D0==1'b1&&D1==1'b0&&D2==1'b0&&S0==1'b1&&S1==1'b1) (D3 -=> X)=(0, 0);
if (D0==1'b1&&D1==1'b0&&D2==1'b1&&S0==1'b1&&S1==1'b1) (D3 -=> X)=(0, 0);
if (D0==1'b1&&D1==1'b1&&D2==1'b0&&S0==1'b1&&S1==1'b1) (D3 -=> X)=(0, 0);
if (D0==1'b1&&D1==1'b1&&D2==1'b1&&S0==1'b1&&S1==1'b1) (D3 -=> X)=(0, 0);
if (D0==1'b0&&D1==1'b0&&D3==1'b0&&S0==1'b0&&S1==1'b1) (D2 -=> X)=(0, 0);
if (D0==1'b0&&D1==1'b0&&D3==1'b1&&S0==1'b0&&S1==1'b1) (D2 -=> X)=(0, 0);
if (D0==1'b0&&D1==1'b1&&D3==1'b0&&S0==1'b0&&S1==1'b1) (D2 -=> X)=(0, 0);
if (D0==1'b0&&D1==1'b1&&D3==1'b1&&S0==1'b0&&S1==1'b1) (D2 -=> X)=(0, 0);
if (D0==1'b1&&D1==1'b0&&D3==1'b0&&S0==1'b0&&S1==1'b1) (D2 -=> X)=(0, 0);
if (D0==1'b1&&D1==1'b0&&D3==1'b1&&S0==1'b0&&S1==1'b1) (D2 -=> X)=(0, 0);
if (D0==1'b1&&D1==1'b1&&D3==1'b0&&S0==1'b0&&S1==1'b1) (D2 -=> X)=(0, 0);
if (D0==1'b1&&D1==1'b1&&D3==1'b1&&S0==1'b0&&S1==1'b1) (D2 -=> X)=(0, 0);
if (D0==1'b0&&D2==1'b0&&D3==1'b0&&S0==1'b1&&S1==1'b0) (D1 -=> X)=(0, 0);
if (D0==1'b0&&D2==1'b0&&D3==1'b1&&S0==1'b1&&S1==1'b0) (D1 -=> X)=(0, 0);
if (D0==1'b0&&D2==1'b1&&D3==1'b0&&S0==1'b1&&S1==1'b0) (D1 -=> X)=(0, 0);
if (D0==1'b0&&D2==1'b1&&D3==1'b1&&S0==1'b1&&S1==1'b0) (D1 -=> X)=(0, 0);
if (D0==1'b1&&D2==1'b0&&D3==1'b0&&S0==1'b1&&S1==1'b0) (D1 -=> X)=(0, 0);
if (D0==1'b1&&D2==1'b0&&D3==1'b1&&S0==1'b1&&S1==1'b0) (D1 -=> X)=(0, 0);
if (D0==1'b1&&D2==1'b1&&D3==1'b0&&S0==1'b1&&S1==1'b0) (D1 -=> X)=(0, 0);
if (D0==1'b1&&D2==1'b1&&D3==1'b1&&S0==1'b1&&S1==1'b0) (D1 -=> X)=(0, 0);
if (D1==1'b0&&D2==1'b0&&D3==1'b0&&S0==1'b0&&S1==1'b0) (D0 -=> X)=(0, 0);
if (D1==1'b0&&D2==1'b0&&D3==1'b1&&S0==1'b0&&S1==1'b0) (D0 -=> X)=(0, 0);
if (D1==1'b0&&D2==1'b1&&D3==1'b0&&S0==1'b0&&S1==1'b0) (D0 -=> X)=(0, 0);
if (D1==1'b0&&D2==1'b1&&D3==1'b1&&S0==1'b0&&S1==1'b0) (D0 -=> X)=(0, 0);
if (D1==1'b1&&D2==1'b0&&D3==1'b0&&S0==1'b0&&S1==1'b0) (D0 -=> X)=(0, 0);
if (D1==1'b1&&D2==1'b0&&D3==1'b1&&S0==1'b0&&S1==1'b0) (D0 -=> X)=(0, 0);
if (D1==1'b1&&D2==1'b1&&D3==1'b0&&S0==1'b0&&S1==1'b0) (D0 -=> X)=(0, 0);
if (D1==1'b1&&D2==1'b1&&D3==1'b1&&S0==1'b0&&S1==1'b0) (D0 -=> X)=(0, 0);
endspecify
   `endif
endmodule
`endcelldefine

//%END SVN_MUXI4_1

//%BEGIN SVN_MUXI4_2

`celldefine
module SVN_MUXI4_2 (X, D0, D1, D2, D3, S0, S1);
   output X;
   input D0, D1, D2, D3, S0, S1;

   wire int_res_mux1;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////

   mux4 (int_res_mux1, D3, D2, D1, D0, S1, S0);

   `ifdef VIRL_functiononly
      not #`SNPS_COMBO_DELAY (X, int_res_mux1);
   `else
      not (X, int_res_mux1);
   `endif

   `ifdef VIRL_functiononly

   `else

   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////


specify
if (D0==1'b0&&D1==1'b0&&D2==1'b0&&D3==1'b1&&S0==1'b1) (S1 -=> X)=(0, 0);
if (D0==1'b0&&D1==1'b0&&D2==1'b1&&D3==1'b0&&S0==1'b0) (S1 -=> X)=(0, 0);
if (D0==1'b0&&D1==1'b0&&D2==1'b1&&D3==1'b1&&S0==1'b0) (S1 -=> X)=(0, 0);
if (D0==1'b0&&D1==1'b0&&D2==1'b1&&D3==1'b1&&S0==1'b1) (S1 -=> X)=(0, 0);
if (D0==1'b0&&D1==1'b1&&D2==1'b0&&D3==1'b0&&S0==1'b1) (S1 +=> X)=(0, 0);
if (D0==1'b0&&D1==1'b1&&D2==1'b1&&D3==1'b0&&S0==1'b0) (S1 -=> X)=(0, 0);
if (D0==1'b0&&D1==1'b1&&D2==1'b1&&D3==1'b0&&S0==1'b1) (S1 +=> X)=(0, 0);
if (D0==1'b0&&D1==1'b1&&D2==1'b1&&D3==1'b1&&S0==1'b0) (S1 -=> X)=(0, 0);
if (D0==1'b1&&D1==1'b0&&D2==1'b0&&D3==1'b0&&S0==1'b0) (S1 +=> X)=(0, 0);
if (D0==1'b1&&D1==1'b0&&D2==1'b0&&D3==1'b1&&S0==1'b0) (S1 +=> X)=(0, 0);
if (D0==1'b1&&D1==1'b0&&D2==1'b0&&D3==1'b1&&S0==1'b1) (S1 -=> X)=(0, 0);
if (D0==1'b1&&D1==1'b0&&D2==1'b1&&D3==1'b1&&S0==1'b1) (S1 -=> X)=(0, 0);
if (D0==1'b1&&D1==1'b1&&D2==1'b0&&D3==1'b0&&S0==1'b0) (S1 +=> X)=(0, 0);
if (D0==1'b1&&D1==1'b1&&D2==1'b0&&D3==1'b0&&S0==1'b1) (S1 +=> X)=(0, 0);
if (D0==1'b1&&D1==1'b1&&D2==1'b0&&D3==1'b1&&S0==1'b0) (S1 +=> X)=(0, 0);
if (D0==1'b1&&D1==1'b1&&D2==1'b1&&D3==1'b0&&S0==1'b1) (S1 +=> X)=(0, 0);
if (D0==1'b0&&D1==1'b0&&D2==1'b0&&D3==1'b1&&S1==1'b1) (S0 -=> X)=(0, 0);
if (D0==1'b0&&D1==1'b0&&D2==1'b1&&D3==1'b0&&S1==1'b1) (S0 +=> X)=(0, 0);
if (D0==1'b0&&D1==1'b1&&D2==1'b0&&D3==1'b0&&S1==1'b0) (S0 -=> X)=(0, 0);
if (D0==1'b0&&D1==1'b1&&D2==1'b0&&D3==1'b1&&S1==1'b0) (S0 -=> X)=(0, 0);
if (D0==1'b0&&D1==1'b1&&D2==1'b0&&D3==1'b1&&S1==1'b1) (S0 -=> X)=(0, 0);
if (D0==1'b0&&D1==1'b1&&D2==1'b1&&D3==1'b0&&S1==1'b0) (S0 -=> X)=(0, 0);
if (D0==1'b0&&D1==1'b1&&D2==1'b1&&D3==1'b0&&S1==1'b1) (S0 +=> X)=(0, 0);
if (D0==1'b0&&D1==1'b1&&D2==1'b1&&D3==1'b1&&S1==1'b0) (S0 -=> X)=(0, 0);
if (D0==1'b1&&D1==1'b0&&D2==1'b0&&D3==1'b0&&S1==1'b0) (S0 +=> X)=(0, 0);
if (D0==1'b1&&D1==1'b0&&D2==1'b0&&D3==1'b1&&S1==1'b0) (S0 +=> X)=(0, 0);
if (D0==1'b1&&D1==1'b0&&D2==1'b0&&D3==1'b1&&S1==1'b1) (S0 -=> X)=(0, 0);
if (D0==1'b1&&D1==1'b0&&D2==1'b1&&D3==1'b0&&S1==1'b0) (S0 +=> X)=(0, 0);
if (D0==1'b1&&D1==1'b0&&D2==1'b1&&D3==1'b0&&S1==1'b1) (S0 +=> X)=(0, 0);
if (D0==1'b1&&D1==1'b0&&D2==1'b1&&D3==1'b1&&S1==1'b0) (S0 +=> X)=(0, 0);
if (D0==1'b1&&D1==1'b1&&D2==1'b0&&D3==1'b1&&S1==1'b1) (S0 -=> X)=(0, 0);
if (D0==1'b1&&D1==1'b1&&D2==1'b1&&D3==1'b0&&S1==1'b1) (S0 +=> X)=(0, 0);
if (D0==1'b0&&D1==1'b0&&D2==1'b0&&S0==1'b1&&S1==1'b1) (D3 -=> X)=(0, 0);
if (D0==1'b0&&D1==1'b0&&D2==1'b1&&S0==1'b1&&S1==1'b1) (D3 -=> X)=(0, 0);
if (D0==1'b0&&D1==1'b1&&D2==1'b0&&S0==1'b1&&S1==1'b1) (D3 -=> X)=(0, 0);
if (D0==1'b0&&D1==1'b1&&D2==1'b1&&S0==1'b1&&S1==1'b1) (D3 -=> X)=(0, 0);
if (D0==1'b1&&D1==1'b0&&D2==1'b0&&S0==1'b1&&S1==1'b1) (D3 -=> X)=(0, 0);
if (D0==1'b1&&D1==1'b0&&D2==1'b1&&S0==1'b1&&S1==1'b1) (D3 -=> X)=(0, 0);
if (D0==1'b1&&D1==1'b1&&D2==1'b0&&S0==1'b1&&S1==1'b1) (D3 -=> X)=(0, 0);
if (D0==1'b1&&D1==1'b1&&D2==1'b1&&S0==1'b1&&S1==1'b1) (D3 -=> X)=(0, 0);
if (D0==1'b0&&D1==1'b0&&D3==1'b0&&S0==1'b0&&S1==1'b1) (D2 -=> X)=(0, 0);
if (D0==1'b0&&D1==1'b0&&D3==1'b1&&S0==1'b0&&S1==1'b1) (D2 -=> X)=(0, 0);
if (D0==1'b0&&D1==1'b1&&D3==1'b0&&S0==1'b0&&S1==1'b1) (D2 -=> X)=(0, 0);
if (D0==1'b0&&D1==1'b1&&D3==1'b1&&S0==1'b0&&S1==1'b1) (D2 -=> X)=(0, 0);
if (D0==1'b1&&D1==1'b0&&D3==1'b0&&S0==1'b0&&S1==1'b1) (D2 -=> X)=(0, 0);
if (D0==1'b1&&D1==1'b0&&D3==1'b1&&S0==1'b0&&S1==1'b1) (D2 -=> X)=(0, 0);
if (D0==1'b1&&D1==1'b1&&D3==1'b0&&S0==1'b0&&S1==1'b1) (D2 -=> X)=(0, 0);
if (D0==1'b1&&D1==1'b1&&D3==1'b1&&S0==1'b0&&S1==1'b1) (D2 -=> X)=(0, 0);
if (D0==1'b0&&D2==1'b0&&D3==1'b0&&S0==1'b1&&S1==1'b0) (D1 -=> X)=(0, 0);
if (D0==1'b0&&D2==1'b0&&D3==1'b1&&S0==1'b1&&S1==1'b0) (D1 -=> X)=(0, 0);
if (D0==1'b0&&D2==1'b1&&D3==1'b0&&S0==1'b1&&S1==1'b0) (D1 -=> X)=(0, 0);
if (D0==1'b0&&D2==1'b1&&D3==1'b1&&S0==1'b1&&S1==1'b0) (D1 -=> X)=(0, 0);
if (D0==1'b1&&D2==1'b0&&D3==1'b0&&S0==1'b1&&S1==1'b0) (D1 -=> X)=(0, 0);
if (D0==1'b1&&D2==1'b0&&D3==1'b1&&S0==1'b1&&S1==1'b0) (D1 -=> X)=(0, 0);
if (D0==1'b1&&D2==1'b1&&D3==1'b0&&S0==1'b1&&S1==1'b0) (D1 -=> X)=(0, 0);
if (D0==1'b1&&D2==1'b1&&D3==1'b1&&S0==1'b1&&S1==1'b0) (D1 -=> X)=(0, 0);
if (D1==1'b0&&D2==1'b0&&D3==1'b0&&S0==1'b0&&S1==1'b0) (D0 -=> X)=(0, 0);
if (D1==1'b0&&D2==1'b0&&D3==1'b1&&S0==1'b0&&S1==1'b0) (D0 -=> X)=(0, 0);
if (D1==1'b0&&D2==1'b1&&D3==1'b0&&S0==1'b0&&S1==1'b0) (D0 -=> X)=(0, 0);
if (D1==1'b0&&D2==1'b1&&D3==1'b1&&S0==1'b0&&S1==1'b0) (D0 -=> X)=(0, 0);
if (D1==1'b1&&D2==1'b0&&D3==1'b0&&S0==1'b0&&S1==1'b0) (D0 -=> X)=(0, 0);
if (D1==1'b1&&D2==1'b0&&D3==1'b1&&S0==1'b0&&S1==1'b0) (D0 -=> X)=(0, 0);
if (D1==1'b1&&D2==1'b1&&D3==1'b0&&S0==1'b0&&S1==1'b0) (D0 -=> X)=(0, 0);
if (D1==1'b1&&D2==1'b1&&D3==1'b1&&S0==1'b0&&S1==1'b0) (D0 -=> X)=(0, 0);
endspecify
   `endif
endmodule
`endcelldefine

//%END SVN_MUXI4_2

//%BEGIN SVN_MUXI4_4

`celldefine
module SVN_MUXI4_4 (X, D0, D1, D2, D3, S0, S1);
   output X;
   input D0, D1, D2, D3, S0, S1;

   wire int_res_mux1;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////

   mux4 (int_res_mux1, D3, D2, D1, D0, S1, S0);

   `ifdef VIRL_functiononly
      not #`SNPS_COMBO_DELAY (X, int_res_mux1);
   `else
      not (X, int_res_mux1);
   `endif

   `ifdef VIRL_functiononly

   `else

   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////


specify
if (D0==1'b0&&D1==1'b0&&D2==1'b0&&D3==1'b1&&S0==1'b1) (S1 -=> X)=(0, 0);
if (D0==1'b0&&D1==1'b0&&D2==1'b1&&D3==1'b0&&S0==1'b0) (S1 -=> X)=(0, 0);
if (D0==1'b0&&D1==1'b0&&D2==1'b1&&D3==1'b1&&S0==1'b0) (S1 -=> X)=(0, 0);
if (D0==1'b0&&D1==1'b0&&D2==1'b1&&D3==1'b1&&S0==1'b1) (S1 -=> X)=(0, 0);
if (D0==1'b0&&D1==1'b1&&D2==1'b0&&D3==1'b0&&S0==1'b1) (S1 +=> X)=(0, 0);
if (D0==1'b0&&D1==1'b1&&D2==1'b1&&D3==1'b0&&S0==1'b0) (S1 -=> X)=(0, 0);
if (D0==1'b0&&D1==1'b1&&D2==1'b1&&D3==1'b0&&S0==1'b1) (S1 +=> X)=(0, 0);
if (D0==1'b0&&D1==1'b1&&D2==1'b1&&D3==1'b1&&S0==1'b0) (S1 -=> X)=(0, 0);
if (D0==1'b1&&D1==1'b0&&D2==1'b0&&D3==1'b0&&S0==1'b0) (S1 +=> X)=(0, 0);
if (D0==1'b1&&D1==1'b0&&D2==1'b0&&D3==1'b1&&S0==1'b0) (S1 +=> X)=(0, 0);
if (D0==1'b1&&D1==1'b0&&D2==1'b0&&D3==1'b1&&S0==1'b1) (S1 -=> X)=(0, 0);
if (D0==1'b1&&D1==1'b0&&D2==1'b1&&D3==1'b1&&S0==1'b1) (S1 -=> X)=(0, 0);
if (D0==1'b1&&D1==1'b1&&D2==1'b0&&D3==1'b0&&S0==1'b0) (S1 +=> X)=(0, 0);
if (D0==1'b1&&D1==1'b1&&D2==1'b0&&D3==1'b0&&S0==1'b1) (S1 +=> X)=(0, 0);
if (D0==1'b1&&D1==1'b1&&D2==1'b0&&D3==1'b1&&S0==1'b0) (S1 +=> X)=(0, 0);
if (D0==1'b1&&D1==1'b1&&D2==1'b1&&D3==1'b0&&S0==1'b1) (S1 +=> X)=(0, 0);
if (D0==1'b0&&D1==1'b0&&D2==1'b0&&D3==1'b1&&S1==1'b1) (S0 -=> X)=(0, 0);
if (D0==1'b0&&D1==1'b0&&D2==1'b1&&D3==1'b0&&S1==1'b1) (S0 +=> X)=(0, 0);
if (D0==1'b0&&D1==1'b1&&D2==1'b0&&D3==1'b0&&S1==1'b0) (S0 -=> X)=(0, 0);
if (D0==1'b0&&D1==1'b1&&D2==1'b0&&D3==1'b1&&S1==1'b0) (S0 -=> X)=(0, 0);
if (D0==1'b0&&D1==1'b1&&D2==1'b0&&D3==1'b1&&S1==1'b1) (S0 -=> X)=(0, 0);
if (D0==1'b0&&D1==1'b1&&D2==1'b1&&D3==1'b0&&S1==1'b0) (S0 -=> X)=(0, 0);
if (D0==1'b0&&D1==1'b1&&D2==1'b1&&D3==1'b0&&S1==1'b1) (S0 +=> X)=(0, 0);
if (D0==1'b0&&D1==1'b1&&D2==1'b1&&D3==1'b1&&S1==1'b0) (S0 -=> X)=(0, 0);
if (D0==1'b1&&D1==1'b0&&D2==1'b0&&D3==1'b0&&S1==1'b0) (S0 +=> X)=(0, 0);
if (D0==1'b1&&D1==1'b0&&D2==1'b0&&D3==1'b1&&S1==1'b0) (S0 +=> X)=(0, 0);
if (D0==1'b1&&D1==1'b0&&D2==1'b0&&D3==1'b1&&S1==1'b1) (S0 -=> X)=(0, 0);
if (D0==1'b1&&D1==1'b0&&D2==1'b1&&D3==1'b0&&S1==1'b0) (S0 +=> X)=(0, 0);
if (D0==1'b1&&D1==1'b0&&D2==1'b1&&D3==1'b0&&S1==1'b1) (S0 +=> X)=(0, 0);
if (D0==1'b1&&D1==1'b0&&D2==1'b1&&D3==1'b1&&S1==1'b0) (S0 +=> X)=(0, 0);
if (D0==1'b1&&D1==1'b1&&D2==1'b0&&D3==1'b1&&S1==1'b1) (S0 -=> X)=(0, 0);
if (D0==1'b1&&D1==1'b1&&D2==1'b1&&D3==1'b0&&S1==1'b1) (S0 +=> X)=(0, 0);
if (D0==1'b0&&D1==1'b0&&D2==1'b0&&S0==1'b1&&S1==1'b1) (D3 -=> X)=(0, 0);
if (D0==1'b0&&D1==1'b0&&D2==1'b1&&S0==1'b1&&S1==1'b1) (D3 -=> X)=(0, 0);
if (D0==1'b0&&D1==1'b1&&D2==1'b0&&S0==1'b1&&S1==1'b1) (D3 -=> X)=(0, 0);
if (D0==1'b0&&D1==1'b1&&D2==1'b1&&S0==1'b1&&S1==1'b1) (D3 -=> X)=(0, 0);
if (D0==1'b1&&D1==1'b0&&D2==1'b0&&S0==1'b1&&S1==1'b1) (D3 -=> X)=(0, 0);
if (D0==1'b1&&D1==1'b0&&D2==1'b1&&S0==1'b1&&S1==1'b1) (D3 -=> X)=(0, 0);
if (D0==1'b1&&D1==1'b1&&D2==1'b0&&S0==1'b1&&S1==1'b1) (D3 -=> X)=(0, 0);
if (D0==1'b1&&D1==1'b1&&D2==1'b1&&S0==1'b1&&S1==1'b1) (D3 -=> X)=(0, 0);
if (D0==1'b0&&D1==1'b0&&D3==1'b0&&S0==1'b0&&S1==1'b1) (D2 -=> X)=(0, 0);
if (D0==1'b0&&D1==1'b0&&D3==1'b1&&S0==1'b0&&S1==1'b1) (D2 -=> X)=(0, 0);
if (D0==1'b0&&D1==1'b1&&D3==1'b0&&S0==1'b0&&S1==1'b1) (D2 -=> X)=(0, 0);
if (D0==1'b0&&D1==1'b1&&D3==1'b1&&S0==1'b0&&S1==1'b1) (D2 -=> X)=(0, 0);
if (D0==1'b1&&D1==1'b0&&D3==1'b0&&S0==1'b0&&S1==1'b1) (D2 -=> X)=(0, 0);
if (D0==1'b1&&D1==1'b0&&D3==1'b1&&S0==1'b0&&S1==1'b1) (D2 -=> X)=(0, 0);
if (D0==1'b1&&D1==1'b1&&D3==1'b0&&S0==1'b0&&S1==1'b1) (D2 -=> X)=(0, 0);
if (D0==1'b1&&D1==1'b1&&D3==1'b1&&S0==1'b0&&S1==1'b1) (D2 -=> X)=(0, 0);
if (D0==1'b0&&D2==1'b0&&D3==1'b0&&S0==1'b1&&S1==1'b0) (D1 -=> X)=(0, 0);
if (D0==1'b0&&D2==1'b0&&D3==1'b1&&S0==1'b1&&S1==1'b0) (D1 -=> X)=(0, 0);
if (D0==1'b0&&D2==1'b1&&D3==1'b0&&S0==1'b1&&S1==1'b0) (D1 -=> X)=(0, 0);
if (D0==1'b0&&D2==1'b1&&D3==1'b1&&S0==1'b1&&S1==1'b0) (D1 -=> X)=(0, 0);
if (D0==1'b1&&D2==1'b0&&D3==1'b0&&S0==1'b1&&S1==1'b0) (D1 -=> X)=(0, 0);
if (D0==1'b1&&D2==1'b0&&D3==1'b1&&S0==1'b1&&S1==1'b0) (D1 -=> X)=(0, 0);
if (D0==1'b1&&D2==1'b1&&D3==1'b0&&S0==1'b1&&S1==1'b0) (D1 -=> X)=(0, 0);
if (D0==1'b1&&D2==1'b1&&D3==1'b1&&S0==1'b1&&S1==1'b0) (D1 -=> X)=(0, 0);
if (D1==1'b0&&D2==1'b0&&D3==1'b0&&S0==1'b0&&S1==1'b0) (D0 -=> X)=(0, 0);
if (D1==1'b0&&D2==1'b0&&D3==1'b1&&S0==1'b0&&S1==1'b0) (D0 -=> X)=(0, 0);
if (D1==1'b0&&D2==1'b1&&D3==1'b0&&S0==1'b0&&S1==1'b0) (D0 -=> X)=(0, 0);
if (D1==1'b0&&D2==1'b1&&D3==1'b1&&S0==1'b0&&S1==1'b0) (D0 -=> X)=(0, 0);
if (D1==1'b1&&D2==1'b0&&D3==1'b0&&S0==1'b0&&S1==1'b0) (D0 -=> X)=(0, 0);
if (D1==1'b1&&D2==1'b0&&D3==1'b1&&S0==1'b0&&S1==1'b0) (D0 -=> X)=(0, 0);
if (D1==1'b1&&D2==1'b1&&D3==1'b0&&S0==1'b0&&S1==1'b0) (D0 -=> X)=(0, 0);
if (D1==1'b1&&D2==1'b1&&D3==1'b1&&S0==1'b0&&S1==1'b0) (D0 -=> X)=(0, 0);
endspecify
   `endif
endmodule
`endcelldefine

//%END SVN_MUXI4_4

//%BEGIN SVN_ND2_0P5

`celldefine
module SVN_ND2_0P5 (X, A1, A2);
   output X;
   input A1, A2;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////


   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////

   `ifdef VIRL_functiononly
        nand #`SNPS_COMBO_DELAY (X, A1, A2);
   `else
        nand (X, A1, A2);
   `endif

   `ifdef VIRL_functiononly

   `else


specify
(A1 -=> X)=(0, 0);
(A2 -=> X)=(0, 0);
endspecify
   `endif

endmodule
`endcelldefine

//%END SVN_ND2_0P5

//%BEGIN SVN_ND2_1

`celldefine
module SVN_ND2_1 (X, A1, A2);
   output X;
   input A1, A2;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////


   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////

   `ifdef VIRL_functiononly
        nand #`SNPS_COMBO_DELAY (X, A1, A2);
   `else
        nand (X, A1, A2);
   `endif

   `ifdef VIRL_functiononly

   `else


specify
(A1 -=> X)=(0, 0);
(A2 -=> X)=(0, 0);
endspecify
   `endif

endmodule
`endcelldefine

//%END SVN_ND2_1

//%BEGIN SVN_ND2_12

`celldefine
module SVN_ND2_12 (X, A1, A2);
   output X;
   input A1, A2;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////


   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////

   `ifdef VIRL_functiononly
        nand #`SNPS_COMBO_DELAY (X, A1, A2);
   `else
        nand (X, A1, A2);
   `endif

   `ifdef VIRL_functiononly

   `else


specify
(A1 -=> X)=(0, 0);
(A2 -=> X)=(0, 0);
endspecify
   `endif

endmodule
`endcelldefine

//%END SVN_ND2_12

//%BEGIN SVN_ND2_16

`celldefine
module SVN_ND2_16 (X, A1, A2);
   output X;
   input A1, A2;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////


   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////

   `ifdef VIRL_functiononly
        nand #`SNPS_COMBO_DELAY (X, A1, A2);
   `else
        nand (X, A1, A2);
   `endif

   `ifdef VIRL_functiononly

   `else


specify
(A1 -=> X)=(0, 0);
(A2 -=> X)=(0, 0);
endspecify
   `endif

endmodule
`endcelldefine

//%END SVN_ND2_16

//%BEGIN SVN_ND2_2

`celldefine
module SVN_ND2_2 (X, A1, A2);
   output X;
   input A1, A2;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////


   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////

   `ifdef VIRL_functiononly
        nand #`SNPS_COMBO_DELAY (X, A1, A2);
   `else
        nand (X, A1, A2);
   `endif

   `ifdef VIRL_functiononly

   `else


specify
(A1 -=> X)=(0, 0);
(A2 -=> X)=(0, 0);
endspecify
   `endif

endmodule
`endcelldefine

//%END SVN_ND2_2

//%BEGIN SVN_ND2_3

`celldefine
module SVN_ND2_3 (X, A1, A2);
   output X;
   input A1, A2;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////


   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////

   `ifdef VIRL_functiononly
        nand #`SNPS_COMBO_DELAY (X, A1, A2);
   `else
        nand (X, A1, A2);
   `endif

   `ifdef VIRL_functiononly

   `else


specify
(A1 -=> X)=(0, 0);
(A2 -=> X)=(0, 0);
endspecify
   `endif

endmodule
`endcelldefine

//%END SVN_ND2_3

//%BEGIN SVN_ND2_4

`celldefine
module SVN_ND2_4 (X, A1, A2);
   output X;
   input A1, A2;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////


   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////

   `ifdef VIRL_functiononly
        nand #`SNPS_COMBO_DELAY (X, A1, A2);
   `else
        nand (X, A1, A2);
   `endif

   `ifdef VIRL_functiononly

   `else


specify
(A1 -=> X)=(0, 0);
(A2 -=> X)=(0, 0);
endspecify
   `endif

endmodule
`endcelldefine

//%END SVN_ND2_4

//%BEGIN SVN_ND2_6

`celldefine
module SVN_ND2_6 (X, A1, A2);
   output X;
   input A1, A2;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////


   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////

   `ifdef VIRL_functiononly
        nand #`SNPS_COMBO_DELAY (X, A1, A2);
   `else
        nand (X, A1, A2);
   `endif

   `ifdef VIRL_functiononly

   `else


specify
(A1 -=> X)=(0, 0);
(A2 -=> X)=(0, 0);
endspecify
   `endif

endmodule
`endcelldefine

//%END SVN_ND2_6

//%BEGIN SVN_ND2_8

`celldefine
module SVN_ND2_8 (X, A1, A2);
   output X;
   input A1, A2;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////


   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////

   `ifdef VIRL_functiononly
        nand #`SNPS_COMBO_DELAY (X, A1, A2);
   `else
        nand (X, A1, A2);
   `endif

   `ifdef VIRL_functiononly

   `else


specify
(A1 -=> X)=(0, 0);
(A2 -=> X)=(0, 0);
endspecify
   `endif

endmodule
`endcelldefine

//%END SVN_ND2_8

//%BEGIN SVN_ND2B_0P5

`celldefine
module SVN_ND2B_0P5 (X, A, B);
   output X;
   input A, B;

   wire int_res_0;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////

   not (int_res_0, A);

   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////

   `ifdef VIRL_functiononly
        nand #`SNPS_COMBO_DELAY (X, int_res_0, B);
   `else
        nand (X, int_res_0, B);
   `endif

   `ifdef VIRL_functiononly

   `else


specify
(A +=> X)=(0, 0);
(B -=> X)=(0, 0);
endspecify
   `endif

endmodule
`endcelldefine

//%END SVN_ND2B_0P5

//%BEGIN SVN_ND2B_1

`celldefine
module SVN_ND2B_1 (X, A, B);
   output X;
   input A, B;

   wire int_res_0;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////

   not (int_res_0, A);

   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////

   `ifdef VIRL_functiononly
        nand #`SNPS_COMBO_DELAY (X, int_res_0, B);
   `else
        nand (X, int_res_0, B);
   `endif

   `ifdef VIRL_functiononly

   `else


specify
(A +=> X)=(0, 0);
(B -=> X)=(0, 0);
endspecify
   `endif

endmodule
`endcelldefine

//%END SVN_ND2B_1

//%BEGIN SVN_ND2B_2

`celldefine
module SVN_ND2B_2 (X, A, B);
   output X;
   input A, B;

   wire int_res_0;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////

   not (int_res_0, A);

   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////

   `ifdef VIRL_functiononly
        nand #`SNPS_COMBO_DELAY (X, int_res_0, B);
   `else
        nand (X, int_res_0, B);
   `endif

   `ifdef VIRL_functiononly

   `else


specify
(A +=> X)=(0, 0);
(B -=> X)=(0, 0);
endspecify
   `endif

endmodule
`endcelldefine

//%END SVN_ND2B_2

//%BEGIN SVN_ND2B_3

`celldefine
module SVN_ND2B_3 (X, A, B);
   output X;
   input A, B;

   wire int_res_0;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////

   not (int_res_0, A);

   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////

   `ifdef VIRL_functiononly
        nand #`SNPS_COMBO_DELAY (X, int_res_0, B);
   `else
        nand (X, int_res_0, B);
   `endif

   `ifdef VIRL_functiononly

   `else


specify
(A +=> X)=(0, 0);
(B -=> X)=(0, 0);
endspecify
   `endif

endmodule
`endcelldefine

//%END SVN_ND2B_3

//%BEGIN SVN_ND2B_4

`celldefine
module SVN_ND2B_4 (X, A, B);
   output X;
   input A, B;

   wire int_res_0;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////

   not (int_res_0, A);

   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////

   `ifdef VIRL_functiononly
        nand #`SNPS_COMBO_DELAY (X, int_res_0, B);
   `else
        nand (X, int_res_0, B);
   `endif

   `ifdef VIRL_functiononly

   `else


specify
(A +=> X)=(0, 0);
(B -=> X)=(0, 0);
endspecify
   `endif

endmodule
`endcelldefine

//%END SVN_ND2B_4

//%BEGIN SVN_ND2B_6

`celldefine
module SVN_ND2B_6 (X, A, B);
   output X;
   input A, B;

   wire int_res_0;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////

   not (int_res_0, A);

   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////

   `ifdef VIRL_functiononly
        nand #`SNPS_COMBO_DELAY (X, int_res_0, B);
   `else
        nand (X, int_res_0, B);
   `endif

   `ifdef VIRL_functiononly

   `else


specify
(A +=> X)=(0, 0);
(B -=> X)=(0, 0);
endspecify
   `endif

endmodule
`endcelldefine

//%END SVN_ND2B_6

//%BEGIN SVN_ND3_0P5

`celldefine
module SVN_ND3_0P5 (X, A1, A2, A3);
   output X;
   input A1, A2, A3;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////


   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////

   `ifdef VIRL_functiononly
        nand #`SNPS_COMBO_DELAY (X, A1, A2, A3);
   `else
        nand (X, A1, A2, A3);
   `endif

   `ifdef VIRL_functiononly

   `else


specify
(A1 -=> X)=(0, 0);
(A2 -=> X)=(0, 0);
(A3 -=> X)=(0, 0);
endspecify
   `endif

endmodule
`endcelldefine

//%END SVN_ND3_0P5

//%BEGIN SVN_ND3_1

`celldefine
module SVN_ND3_1 (X, A1, A2, A3);
   output X;
   input A1, A2, A3;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////


   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////

   `ifdef VIRL_functiononly
        nand #`SNPS_COMBO_DELAY (X, A1, A2, A3);
   `else
        nand (X, A1, A2, A3);
   `endif

   `ifdef VIRL_functiononly

   `else


specify
(A1 -=> X)=(0, 0);
(A2 -=> X)=(0, 0);
(A3 -=> X)=(0, 0);
endspecify
   `endif

endmodule
`endcelldefine

//%END SVN_ND3_1

//%BEGIN SVN_ND3_2

`celldefine
module SVN_ND3_2 (X, A1, A2, A3);
   output X;
   input A1, A2, A3;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////


   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////

   `ifdef VIRL_functiononly
        nand #`SNPS_COMBO_DELAY (X, A1, A2, A3);
   `else
        nand (X, A1, A2, A3);
   `endif

   `ifdef VIRL_functiononly

   `else


specify
(A1 -=> X)=(0, 0);
(A2 -=> X)=(0, 0);
(A3 -=> X)=(0, 0);
endspecify
   `endif

endmodule
`endcelldefine

//%END SVN_ND3_2

//%BEGIN SVN_ND3_3

`celldefine
module SVN_ND3_3 (X, A1, A2, A3);
   output X;
   input A1, A2, A3;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////


   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////

   `ifdef VIRL_functiononly
        nand #`SNPS_COMBO_DELAY (X, A1, A2, A3);
   `else
        nand (X, A1, A2, A3);
   `endif

   `ifdef VIRL_functiononly

   `else


specify
(A1 -=> X)=(0, 0);
(A2 -=> X)=(0, 0);
(A3 -=> X)=(0, 0);
endspecify
   `endif

endmodule
`endcelldefine

//%END SVN_ND3_3

//%BEGIN SVN_ND3_4

`celldefine
module SVN_ND3_4 (X, A1, A2, A3);
   output X;
   input A1, A2, A3;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////


   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////

   `ifdef VIRL_functiononly
        nand #`SNPS_COMBO_DELAY (X, A1, A2, A3);
   `else
        nand (X, A1, A2, A3);
   `endif

   `ifdef VIRL_functiononly

   `else


specify
(A1 -=> X)=(0, 0);
(A2 -=> X)=(0, 0);
(A3 -=> X)=(0, 0);
endspecify
   `endif

endmodule
`endcelldefine

//%END SVN_ND3_4

//%BEGIN SVN_ND3_6

`celldefine
module SVN_ND3_6 (X, A1, A2, A3);
   output X;
   input A1, A2, A3;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////


   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////

   `ifdef VIRL_functiononly
        nand #`SNPS_COMBO_DELAY (X, A1, A2, A3);
   `else
        nand (X, A1, A2, A3);
   `endif

   `ifdef VIRL_functiononly

   `else


specify
(A1 -=> X)=(0, 0);
(A2 -=> X)=(0, 0);
(A3 -=> X)=(0, 0);
endspecify
   `endif

endmodule
`endcelldefine

//%END SVN_ND3_6

//%BEGIN SVN_ND3_8

`celldefine
module SVN_ND3_8 (X, A1, A2, A3);
   output X;
   input A1, A2, A3;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////


   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////

   `ifdef VIRL_functiononly
        nand #`SNPS_COMBO_DELAY (X, A1, A2, A3);
   `else
        nand (X, A1, A2, A3);
   `endif

   `ifdef VIRL_functiononly

   `else


specify
(A1 -=> X)=(0, 0);
(A2 -=> X)=(0, 0);
(A3 -=> X)=(0, 0);
endspecify
   `endif

endmodule
`endcelldefine

//%END SVN_ND3_8

//%BEGIN SVN_ND3B_1

`celldefine
module SVN_ND3B_1 (X, A, B1, B2);
   output X;
   input A, B1, B2;

   wire int_res_0;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////

   not (int_res_0, A);

   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////

    `ifdef VIRL_functiononly
          nand #`SNPS_COMBO_DELAY (X, int_res_0, B1, B2);

    `else
          nand (X, int_res_0, B1, B2);

    `endif

    `ifdef VIRL_functiononly

    `else


specify
(A +=> X)=(0, 0);
(B1 -=> X)=(0, 0);
(B2 -=> X)=(0, 0);
endspecify
    `endif

endmodule
`endcelldefine

//%END SVN_ND3B_1

//%BEGIN SVN_ND3B_2

`celldefine
module SVN_ND3B_2 (X, A, B1, B2);
   output X;
   input A, B1, B2;

   wire int_res_0;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////

   not (int_res_0, A);

   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////

    `ifdef VIRL_functiononly
          nand #`SNPS_COMBO_DELAY (X, int_res_0, B1, B2);

    `else
          nand (X, int_res_0, B1, B2);

    `endif

    `ifdef VIRL_functiononly

    `else


specify
(A +=> X)=(0, 0);
(B1 -=> X)=(0, 0);
(B2 -=> X)=(0, 0);
endspecify
    `endif

endmodule
`endcelldefine

//%END SVN_ND3B_2

//%BEGIN SVN_ND3B_3

`celldefine
module SVN_ND3B_3 (X, A, B1, B2);
   output X;
   input A, B1, B2;

   wire int_res_0;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////

   not (int_res_0, A);

   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////

    `ifdef VIRL_functiononly
          nand #`SNPS_COMBO_DELAY (X, int_res_0, B1, B2);

    `else
          nand (X, int_res_0, B1, B2);

    `endif

    `ifdef VIRL_functiononly

    `else


specify
(A +=> X)=(0, 0);
(B1 -=> X)=(0, 0);
(B2 -=> X)=(0, 0);
endspecify
    `endif

endmodule
`endcelldefine

//%END SVN_ND3B_3

//%BEGIN SVN_ND3B_4

`celldefine
module SVN_ND3B_4 (X, A, B1, B2);
   output X;
   input A, B1, B2;

   wire int_res_0;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////

   not (int_res_0, A);

   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////

    `ifdef VIRL_functiononly
          nand #`SNPS_COMBO_DELAY (X, int_res_0, B1, B2);

    `else
          nand (X, int_res_0, B1, B2);

    `endif

    `ifdef VIRL_functiononly

    `else


specify
(A +=> X)=(0, 0);
(B1 -=> X)=(0, 0);
(B2 -=> X)=(0, 0);
endspecify
    `endif

endmodule
`endcelldefine

//%END SVN_ND3B_4

//%BEGIN SVN_ND4_0P5

`celldefine
module SVN_ND4_0P5 (X, A1, A2, A3, A4);
   output X;
   input A1, A2, A3, A4;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////


   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////

   `ifdef VIRL_functiononly
       nand #`SNPS_COMBO_DELAY (X, A1, A2, A3, A4);
   `else
       nand (X, A1, A2, A3, A4);

    `endif

   `ifdef VIRL_functiononly

   `else


specify
(A1 -=> X)=(0, 0);
(A2 -=> X)=(0, 0);
(A3 -=> X)=(0, 0);
(A4 -=> X)=(0, 0);
endspecify
   `endif

endmodule
`endcelldefine

//%END SVN_ND4_0P5

//%BEGIN SVN_ND4_1

`celldefine
module SVN_ND4_1 (X, A1, A2, A3, A4);
   output X;
   input A1, A2, A3, A4;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////


   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////

   `ifdef VIRL_functiononly
       nand #`SNPS_COMBO_DELAY (X, A1, A2, A3, A4);
   `else
       nand (X, A1, A2, A3, A4);

    `endif

   `ifdef VIRL_functiononly

   `else


specify
(A1 -=> X)=(0, 0);
(A2 -=> X)=(0, 0);
(A3 -=> X)=(0, 0);
(A4 -=> X)=(0, 0);
endspecify
   `endif

endmodule
`endcelldefine

//%END SVN_ND4_1

//%BEGIN SVN_ND4_2

`celldefine
module SVN_ND4_2 (X, A1, A2, A3, A4);
   output X;
   input A1, A2, A3, A4;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////


   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////

   `ifdef VIRL_functiononly
       nand #`SNPS_COMBO_DELAY (X, A1, A2, A3, A4);
   `else
       nand (X, A1, A2, A3, A4);

    `endif

   `ifdef VIRL_functiononly

   `else


specify
(A1 -=> X)=(0, 0);
(A2 -=> X)=(0, 0);
(A3 -=> X)=(0, 0);
(A4 -=> X)=(0, 0);
endspecify
   `endif

endmodule
`endcelldefine

//%END SVN_ND4_2

//%BEGIN SVN_ND4_3

`celldefine
module SVN_ND4_3 (X, A1, A2, A3, A4);
   output X;
   input A1, A2, A3, A4;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////


   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////

   `ifdef VIRL_functiononly
       nand #`SNPS_COMBO_DELAY (X, A1, A2, A3, A4);
   `else
       nand (X, A1, A2, A3, A4);

    `endif

   `ifdef VIRL_functiononly

   `else


specify
(A1 -=> X)=(0, 0);
(A2 -=> X)=(0, 0);
(A3 -=> X)=(0, 0);
(A4 -=> X)=(0, 0);
endspecify
   `endif

endmodule
`endcelldefine

//%END SVN_ND4_3

//%BEGIN SVN_ND4_4

`celldefine
module SVN_ND4_4 (X, A1, A2, A3, A4);
   output X;
   input A1, A2, A3, A4;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////


   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////

   `ifdef VIRL_functiononly
       nand #`SNPS_COMBO_DELAY (X, A1, A2, A3, A4);
   `else
       nand (X, A1, A2, A3, A4);

    `endif

   `ifdef VIRL_functiononly

   `else


specify
(A1 -=> X)=(0, 0);
(A2 -=> X)=(0, 0);
(A3 -=> X)=(0, 0);
(A4 -=> X)=(0, 0);
endspecify
   `endif

endmodule
`endcelldefine

//%END SVN_ND4_4

//%BEGIN SVN_ND4_6

`celldefine
module SVN_ND4_6 (X, A1, A2, A3, A4);
   output X;
   input A1, A2, A3, A4;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////


   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////

   `ifdef VIRL_functiononly
       nand #`SNPS_COMBO_DELAY (X, A1, A2, A3, A4);
   `else
       nand (X, A1, A2, A3, A4);

    `endif

   `ifdef VIRL_functiononly

   `else


specify
(A1 -=> X)=(0, 0);
(A2 -=> X)=(0, 0);
(A3 -=> X)=(0, 0);
(A4 -=> X)=(0, 0);
endspecify
   `endif

endmodule
`endcelldefine

//%END SVN_ND4_6

//%BEGIN SVN_ND4_8

`celldefine
module SVN_ND4_8 (X, A1, A2, A3, A4);
   output X;
   input A1, A2, A3, A4;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////


   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////

   `ifdef VIRL_functiononly
       nand #`SNPS_COMBO_DELAY (X, A1, A2, A3, A4);
   `else
       nand (X, A1, A2, A3, A4);

    `endif

   `ifdef VIRL_functiononly

   `else


specify
(A1 -=> X)=(0, 0);
(A2 -=> X)=(0, 0);
(A3 -=> X)=(0, 0);
(A4 -=> X)=(0, 0);
endspecify
   `endif

endmodule
`endcelldefine

//%END SVN_ND4_8

//%BEGIN SVN_ND4B_1

`celldefine
module SVN_ND4B_1 (X, A, B1, B2, B3);
   output X;
   input A, B1, B2, B3;

   wire int_res_0;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////

   not (int_res_0, A);

   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////

   `ifdef VIRL_functiononly
         nand #`SNPS_COMBO_DELAY (X, int_res_0, B1, B2, B3);
   `else
         nand (X, int_res_0, B1, B2, B3);
   `endif

   `ifdef VIRL_functiononly

   `else


specify
(A +=> X)=(0, 0);
(B1 -=> X)=(0, 0);
(B2 -=> X)=(0, 0);
(B3 -=> X)=(0, 0);
endspecify
   `endif

endmodule
`endcelldefine

//%END SVN_ND4B_1

//%BEGIN SVN_ND4B_2

`celldefine
module SVN_ND4B_2 (X, A, B1, B2, B3);
   output X;
   input A, B1, B2, B3;

   wire int_res_0;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////

   not (int_res_0, A);

   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////

   `ifdef VIRL_functiononly
         nand #`SNPS_COMBO_DELAY (X, int_res_0, B1, B2, B3);
   `else
         nand (X, int_res_0, B1, B2, B3);
   `endif

   `ifdef VIRL_functiononly

   `else


specify
(A +=> X)=(0, 0);
(B1 -=> X)=(0, 0);
(B2 -=> X)=(0, 0);
(B3 -=> X)=(0, 0);
endspecify
   `endif

endmodule
`endcelldefine

//%END SVN_ND4B_2

//%BEGIN SVN_ND4B_3

`celldefine
module SVN_ND4B_3 (X, A, B1, B2, B3);
   output X;
   input A, B1, B2, B3;

   wire int_res_0;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////

   not (int_res_0, A);

   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////

   `ifdef VIRL_functiononly
         nand #`SNPS_COMBO_DELAY (X, int_res_0, B1, B2, B3);
   `else
         nand (X, int_res_0, B1, B2, B3);
   `endif

   `ifdef VIRL_functiononly

   `else


specify
(A +=> X)=(0, 0);
(B1 -=> X)=(0, 0);
(B2 -=> X)=(0, 0);
(B3 -=> X)=(0, 0);
endspecify
   `endif

endmodule
`endcelldefine

//%END SVN_ND4B_3

//%BEGIN SVN_ND4B_4

`celldefine
module SVN_ND4B_4 (X, A, B1, B2, B3);
   output X;
   input A, B1, B2, B3;

   wire int_res_0;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////

   not (int_res_0, A);

   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////

   `ifdef VIRL_functiononly
         nand #`SNPS_COMBO_DELAY (X, int_res_0, B1, B2, B3);
   `else
         nand (X, int_res_0, B1, B2, B3);
   `endif

   `ifdef VIRL_functiononly

   `else


specify
(A +=> X)=(0, 0);
(B1 -=> X)=(0, 0);
(B2 -=> X)=(0, 0);
(B3 -=> X)=(0, 0);
endspecify
   `endif

endmodule
`endcelldefine

//%END SVN_ND4B_4

//%BEGIN SVN_NR2_0P5

`celldefine
module SVN_NR2_0P5 (X, A1, A2);
   output X;
   input A1, A2;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////


   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////

   `ifdef VIRL_functiononly
        nor #`SNPS_COMBO_DELAY (X, A1, A2);
   `else
        nor (X, A1, A2);
   `endif

   `ifdef VIRL_functiononly

   `else


specify
(A1 -=> X)=(0, 0);
(A2 -=> X)=(0, 0);
endspecify
   `endif

endmodule
`endcelldefine

//%END SVN_NR2_0P5

//%BEGIN SVN_NR2_1

`celldefine
module SVN_NR2_1 (X, A1, A2);
   output X;
   input A1, A2;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////


   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////

   `ifdef VIRL_functiononly
        nor #`SNPS_COMBO_DELAY (X, A1, A2);
   `else
        nor (X, A1, A2);
   `endif

   `ifdef VIRL_functiononly

   `else


specify
(A1 -=> X)=(0, 0);
(A2 -=> X)=(0, 0);
endspecify
   `endif

endmodule
`endcelldefine

//%END SVN_NR2_1

//%BEGIN SVN_NR2_12

`celldefine
module SVN_NR2_12 (X, A1, A2);
   output X;
   input A1, A2;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////


   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////

   `ifdef VIRL_functiononly
        nor #`SNPS_COMBO_DELAY (X, A1, A2);
   `else
        nor (X, A1, A2);
   `endif

   `ifdef VIRL_functiononly

   `else


specify
(A1 -=> X)=(0, 0);
(A2 -=> X)=(0, 0);
endspecify
   `endif

endmodule
`endcelldefine

//%END SVN_NR2_12

//%BEGIN SVN_NR2_16

`celldefine
module SVN_NR2_16 (X, A1, A2);
   output X;
   input A1, A2;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////


   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////

   `ifdef VIRL_functiononly
        nor #`SNPS_COMBO_DELAY (X, A1, A2);
   `else
        nor (X, A1, A2);
   `endif

   `ifdef VIRL_functiononly

   `else


specify
(A1 -=> X)=(0, 0);
(A2 -=> X)=(0, 0);
endspecify
   `endif

endmodule
`endcelldefine

//%END SVN_NR2_16

//%BEGIN SVN_NR2_2

`celldefine
module SVN_NR2_2 (X, A1, A2);
   output X;
   input A1, A2;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////


   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////

   `ifdef VIRL_functiononly
        nor #`SNPS_COMBO_DELAY (X, A1, A2);
   `else
        nor (X, A1, A2);
   `endif

   `ifdef VIRL_functiononly

   `else


specify
(A1 -=> X)=(0, 0);
(A2 -=> X)=(0, 0);
endspecify
   `endif

endmodule
`endcelldefine

//%END SVN_NR2_2

//%BEGIN SVN_NR2_3

`celldefine
module SVN_NR2_3 (X, A1, A2);
   output X;
   input A1, A2;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////


   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////

   `ifdef VIRL_functiononly
        nor #`SNPS_COMBO_DELAY (X, A1, A2);
   `else
        nor (X, A1, A2);
   `endif

   `ifdef VIRL_functiononly

   `else


specify
(A1 -=> X)=(0, 0);
(A2 -=> X)=(0, 0);
endspecify
   `endif

endmodule
`endcelldefine

//%END SVN_NR2_3

//%BEGIN SVN_NR2_4

`celldefine
module SVN_NR2_4 (X, A1, A2);
   output X;
   input A1, A2;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////


   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////

   `ifdef VIRL_functiononly
        nor #`SNPS_COMBO_DELAY (X, A1, A2);
   `else
        nor (X, A1, A2);
   `endif

   `ifdef VIRL_functiononly

   `else


specify
(A1 -=> X)=(0, 0);
(A2 -=> X)=(0, 0);
endspecify
   `endif

endmodule
`endcelldefine

//%END SVN_NR2_4

//%BEGIN SVN_NR2_6

`celldefine
module SVN_NR2_6 (X, A1, A2);
   output X;
   input A1, A2;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////


   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////

   `ifdef VIRL_functiononly
        nor #`SNPS_COMBO_DELAY (X, A1, A2);
   `else
        nor (X, A1, A2);
   `endif

   `ifdef VIRL_functiononly

   `else


specify
(A1 -=> X)=(0, 0);
(A2 -=> X)=(0, 0);
endspecify
   `endif

endmodule
`endcelldefine

//%END SVN_NR2_6

//%BEGIN SVN_NR2_8

`celldefine
module SVN_NR2_8 (X, A1, A2);
   output X;
   input A1, A2;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////


   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////

   `ifdef VIRL_functiononly
        nor #`SNPS_COMBO_DELAY (X, A1, A2);
   `else
        nor (X, A1, A2);
   `endif

   `ifdef VIRL_functiononly

   `else


specify
(A1 -=> X)=(0, 0);
(A2 -=> X)=(0, 0);
endspecify
   `endif

endmodule
`endcelldefine

//%END SVN_NR2_8

//%BEGIN SVN_NR2B_0P5

`celldefine
module SVN_NR2B_0P5 (X, A, B);
   output X;
   input A, B;

   wire int_res_0;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////

   not (int_res_0, A);

   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////

   `ifdef VIRL_functiononly
        nor #`SNPS_COMBO_DELAY (X, int_res_0, B);

   `else
        nor (X, int_res_0, B);
    `endif

    `ifdef VIRL_functiononly

    `else


specify
(A +=> X)=(0, 0);
(B -=> X)=(0, 0);
endspecify
    `endif

endmodule
`endcelldefine

//%END SVN_NR2B_0P5

//%BEGIN SVN_NR2B_1

`celldefine
module SVN_NR2B_1 (X, A, B);
   output X;
   input A, B;

   wire int_res_0;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////

   not (int_res_0, A);

   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////

   `ifdef VIRL_functiononly
        nor #`SNPS_COMBO_DELAY (X, int_res_0, B);

   `else
        nor (X, int_res_0, B);
    `endif

    `ifdef VIRL_functiononly

    `else


specify
(A +=> X)=(0, 0);
(B -=> X)=(0, 0);
endspecify
    `endif

endmodule
`endcelldefine

//%END SVN_NR2B_1

//%BEGIN SVN_NR2B_2

`celldefine
module SVN_NR2B_2 (X, A, B);
   output X;
   input A, B;

   wire int_res_0;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////

   not (int_res_0, A);

   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////

   `ifdef VIRL_functiononly
        nor #`SNPS_COMBO_DELAY (X, int_res_0, B);

   `else
        nor (X, int_res_0, B);
    `endif

    `ifdef VIRL_functiononly

    `else


specify
(A +=> X)=(0, 0);
(B -=> X)=(0, 0);
endspecify
    `endif

endmodule
`endcelldefine

//%END SVN_NR2B_2

//%BEGIN SVN_NR2B_3

`celldefine
module SVN_NR2B_3 (X, A, B);
   output X;
   input A, B;

   wire int_res_0;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////

   not (int_res_0, A);

   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////

   `ifdef VIRL_functiononly
        nor #`SNPS_COMBO_DELAY (X, int_res_0, B);

   `else
        nor (X, int_res_0, B);
    `endif

    `ifdef VIRL_functiononly

    `else


specify
(A +=> X)=(0, 0);
(B -=> X)=(0, 0);
endspecify
    `endif

endmodule
`endcelldefine

//%END SVN_NR2B_3

//%BEGIN SVN_NR2B_4

`celldefine
module SVN_NR2B_4 (X, A, B);
   output X;
   input A, B;

   wire int_res_0;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////

   not (int_res_0, A);

   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////

   `ifdef VIRL_functiononly
        nor #`SNPS_COMBO_DELAY (X, int_res_0, B);

   `else
        nor (X, int_res_0, B);
    `endif

    `ifdef VIRL_functiononly

    `else


specify
(A +=> X)=(0, 0);
(B -=> X)=(0, 0);
endspecify
    `endif

endmodule
`endcelldefine

//%END SVN_NR2B_4

//%BEGIN SVN_NR3_0P5

`celldefine
module SVN_NR3_0P5 (X, A1, A2, A3);
   output X;
   input A1, A2, A3;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////


   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////

   `ifdef VIRL_functiononly
        nor #`SNPS_COMBO_DELAY (X, A1, A2, A3);
   `else
        nor (X, A1, A2, A3);
   `endif

   `ifdef VIRL_functiononly

   `else


specify
(A1 -=> X)=(0, 0);
(A2 -=> X)=(0, 0);
(A3 -=> X)=(0, 0);
endspecify
   `endif

endmodule
`endcelldefine

//%END SVN_NR3_0P5

//%BEGIN SVN_NR3_1

`celldefine
module SVN_NR3_1 (X, A1, A2, A3);
   output X;
   input A1, A2, A3;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////


   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////

   `ifdef VIRL_functiononly
        nor #`SNPS_COMBO_DELAY (X, A1, A2, A3);
   `else
        nor (X, A1, A2, A3);
   `endif

   `ifdef VIRL_functiononly

   `else


specify
(A1 -=> X)=(0, 0);
(A2 -=> X)=(0, 0);
(A3 -=> X)=(0, 0);
endspecify
   `endif

endmodule
`endcelldefine

//%END SVN_NR3_1

//%BEGIN SVN_NR3_2

`celldefine
module SVN_NR3_2 (X, A1, A2, A3);
   output X;
   input A1, A2, A3;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////


   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////

   `ifdef VIRL_functiononly
        nor #`SNPS_COMBO_DELAY (X, A1, A2, A3);
   `else
        nor (X, A1, A2, A3);
   `endif

   `ifdef VIRL_functiononly

   `else


specify
(A1 -=> X)=(0, 0);
(A2 -=> X)=(0, 0);
(A3 -=> X)=(0, 0);
endspecify
   `endif

endmodule
`endcelldefine

//%END SVN_NR3_2

//%BEGIN SVN_NR3_3

`celldefine
module SVN_NR3_3 (X, A1, A2, A3);
   output X;
   input A1, A2, A3;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////


   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////

   `ifdef VIRL_functiononly
        nor #`SNPS_COMBO_DELAY (X, A1, A2, A3);
   `else
        nor (X, A1, A2, A3);
   `endif

   `ifdef VIRL_functiononly

   `else


specify
(A1 -=> X)=(0, 0);
(A2 -=> X)=(0, 0);
(A3 -=> X)=(0, 0);
endspecify
   `endif

endmodule
`endcelldefine

//%END SVN_NR3_3

//%BEGIN SVN_NR3_4

`celldefine
module SVN_NR3_4 (X, A1, A2, A3);
   output X;
   input A1, A2, A3;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////


   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////

   `ifdef VIRL_functiononly
        nor #`SNPS_COMBO_DELAY (X, A1, A2, A3);
   `else
        nor (X, A1, A2, A3);
   `endif

   `ifdef VIRL_functiononly

   `else


specify
(A1 -=> X)=(0, 0);
(A2 -=> X)=(0, 0);
(A3 -=> X)=(0, 0);
endspecify
   `endif

endmodule
`endcelldefine

//%END SVN_NR3_4

//%BEGIN SVN_NR3_6

`celldefine
module SVN_NR3_6 (X, A1, A2, A3);
   output X;
   input A1, A2, A3;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////


   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////

   `ifdef VIRL_functiononly
        nor #`SNPS_COMBO_DELAY (X, A1, A2, A3);
   `else
        nor (X, A1, A2, A3);
   `endif

   `ifdef VIRL_functiononly

   `else


specify
(A1 -=> X)=(0, 0);
(A2 -=> X)=(0, 0);
(A3 -=> X)=(0, 0);
endspecify
   `endif

endmodule
`endcelldefine

//%END SVN_NR3_6

//%BEGIN SVN_NR3B_1

`celldefine
module SVN_NR3B_1 (X, A, B1, B2);
   output X;
   input A, B1, B2;

   wire int_res_0;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////

   not (int_res_0, A);

   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////

   `ifdef VIRL_functiononly
        nor #`SNPS_COMBO_DELAY (X, int_res_0, B1, B2);
   `else
        nor (X, int_res_0, B1, B2);
   `endif

   `ifdef VIRL_functiononly

    `else


specify
(A +=> X)=(0, 0);
(B1 -=> X)=(0, 0);
(B2 -=> X)=(0, 0);
endspecify
    `endif

endmodule
`endcelldefine

//%END SVN_NR3B_1

//%BEGIN SVN_NR3B_2

`celldefine
module SVN_NR3B_2 (X, A, B1, B2);
   output X;
   input A, B1, B2;

   wire int_res_0;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////

   not (int_res_0, A);

   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////

   `ifdef VIRL_functiononly
        nor #`SNPS_COMBO_DELAY (X, int_res_0, B1, B2);
   `else
        nor (X, int_res_0, B1, B2);
   `endif

   `ifdef VIRL_functiononly

    `else


specify
(A +=> X)=(0, 0);
(B1 -=> X)=(0, 0);
(B2 -=> X)=(0, 0);
endspecify
    `endif

endmodule
`endcelldefine

//%END SVN_NR3B_2

//%BEGIN SVN_NR3B_3

`celldefine
module SVN_NR3B_3 (X, A, B1, B2);
   output X;
   input A, B1, B2;

   wire int_res_0;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////

   not (int_res_0, A);

   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////

   `ifdef VIRL_functiononly
        nor #`SNPS_COMBO_DELAY (X, int_res_0, B1, B2);
   `else
        nor (X, int_res_0, B1, B2);
   `endif

   `ifdef VIRL_functiononly

    `else


specify
(A +=> X)=(0, 0);
(B1 -=> X)=(0, 0);
(B2 -=> X)=(0, 0);
endspecify
    `endif

endmodule
`endcelldefine

//%END SVN_NR3B_3

//%BEGIN SVN_NR3B_4

`celldefine
module SVN_NR3B_4 (X, A, B1, B2);
   output X;
   input A, B1, B2;

   wire int_res_0;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////

   not (int_res_0, A);

   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////

   `ifdef VIRL_functiononly
        nor #`SNPS_COMBO_DELAY (X, int_res_0, B1, B2);
   `else
        nor (X, int_res_0, B1, B2);
   `endif

   `ifdef VIRL_functiononly

    `else


specify
(A +=> X)=(0, 0);
(B1 -=> X)=(0, 0);
(B2 -=> X)=(0, 0);
endspecify
    `endif

endmodule
`endcelldefine

//%END SVN_NR3B_4

//%BEGIN SVN_OA2111_1

`celldefine
module SVN_OA2111_1 (X, A1, A2, B1, B2, B3);
   output X;
   input A1, A2, B1, B2, B3;

   wire int_res_0;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////

   or (int_res_0, A1, A2);

   `ifdef VIRL_functiononly
      and #`SNPS_COMBO_DELAY (X, int_res_0, B1, B2, B3);
   `else
      and (X, int_res_0, B1, B2, B3);
   `endif

   `ifdef VIRL_functiononly

   `else

   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////


specify
if (A1==1'b0&&A2==1'b1&&B1==1'b1&&B2==1'b1) (B3 +=> X)=(0, 0);
if (A1==1'b1&&A2==1'b0&&B1==1'b1&&B2==1'b1) (B3 +=> X)=(0, 0);
if (A1==1'b1&&A2==1'b1&&B1==1'b1&&B2==1'b1) (B3 +=> X)=(0, 0);
if (A1==1'b0&&A2==1'b1&&B1==1'b1&&B3==1'b1) (B2 +=> X)=(0, 0);
if (A1==1'b1&&A2==1'b0&&B1==1'b1&&B3==1'b1) (B2 +=> X)=(0, 0);
if (A1==1'b1&&A2==1'b1&&B1==1'b1&&B3==1'b1) (B2 +=> X)=(0, 0);
if (A1==1'b0&&A2==1'b1&&B2==1'b1&&B3==1'b1) (B1 +=> X)=(0, 0);
if (A1==1'b1&&A2==1'b0&&B2==1'b1&&B3==1'b1) (B1 +=> X)=(0, 0);
if (A1==1'b1&&A2==1'b1&&B2==1'b1&&B3==1'b1) (B1 +=> X)=(0, 0);
if (A1==1'b0&&B1==1'b1&&B2==1'b1&&B3==1'b1) (A2 +=> X)=(0, 0);
if (A2==1'b0&&B1==1'b1&&B2==1'b1&&B3==1'b1) (A1 +=> X)=(0, 0);
endspecify
   `endif
endmodule
`endcelldefine

//%END SVN_OA2111_1

//%BEGIN SVN_OA2111_2

`celldefine
module SVN_OA2111_2 (X, A1, A2, B1, B2, B3);
   output X;
   input A1, A2, B1, B2, B3;

   wire int_res_0;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////

   or (int_res_0, A1, A2);

   `ifdef VIRL_functiononly
      and #`SNPS_COMBO_DELAY (X, int_res_0, B1, B2, B3);
   `else
      and (X, int_res_0, B1, B2, B3);
   `endif

   `ifdef VIRL_functiononly

   `else

   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////


specify
if (A1==1'b0&&A2==1'b1&&B1==1'b1&&B2==1'b1) (B3 +=> X)=(0, 0);
if (A1==1'b1&&A2==1'b0&&B1==1'b1&&B2==1'b1) (B3 +=> X)=(0, 0);
if (A1==1'b1&&A2==1'b1&&B1==1'b1&&B2==1'b1) (B3 +=> X)=(0, 0);
if (A1==1'b0&&A2==1'b1&&B1==1'b1&&B3==1'b1) (B2 +=> X)=(0, 0);
if (A1==1'b1&&A2==1'b0&&B1==1'b1&&B3==1'b1) (B2 +=> X)=(0, 0);
if (A1==1'b1&&A2==1'b1&&B1==1'b1&&B3==1'b1) (B2 +=> X)=(0, 0);
if (A1==1'b0&&A2==1'b1&&B2==1'b1&&B3==1'b1) (B1 +=> X)=(0, 0);
if (A1==1'b1&&A2==1'b0&&B2==1'b1&&B3==1'b1) (B1 +=> X)=(0, 0);
if (A1==1'b1&&A2==1'b1&&B2==1'b1&&B3==1'b1) (B1 +=> X)=(0, 0);
if (A1==1'b0&&B1==1'b1&&B2==1'b1&&B3==1'b1) (A2 +=> X)=(0, 0);
if (A2==1'b0&&B1==1'b1&&B2==1'b1&&B3==1'b1) (A1 +=> X)=(0, 0);
endspecify
   `endif
endmodule
`endcelldefine

//%END SVN_OA2111_2

//%BEGIN SVN_OA2111_4

`celldefine
module SVN_OA2111_4 (X, A1, A2, B1, B2, B3);
   output X;
   input A1, A2, B1, B2, B3;

   wire int_res_0;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////

   or (int_res_0, A1, A2);

   `ifdef VIRL_functiononly
      and #`SNPS_COMBO_DELAY (X, int_res_0, B1, B2, B3);
   `else
      and (X, int_res_0, B1, B2, B3);
   `endif

   `ifdef VIRL_functiononly

   `else

   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////


specify
if (A1==1'b0&&A2==1'b1&&B1==1'b1&&B2==1'b1) (B3 +=> X)=(0, 0);
if (A1==1'b1&&A2==1'b0&&B1==1'b1&&B2==1'b1) (B3 +=> X)=(0, 0);
if (A1==1'b1&&A2==1'b1&&B1==1'b1&&B2==1'b1) (B3 +=> X)=(0, 0);
if (A1==1'b0&&A2==1'b1&&B1==1'b1&&B3==1'b1) (B2 +=> X)=(0, 0);
if (A1==1'b1&&A2==1'b0&&B1==1'b1&&B3==1'b1) (B2 +=> X)=(0, 0);
if (A1==1'b1&&A2==1'b1&&B1==1'b1&&B3==1'b1) (B2 +=> X)=(0, 0);
if (A1==1'b0&&A2==1'b1&&B2==1'b1&&B3==1'b1) (B1 +=> X)=(0, 0);
if (A1==1'b1&&A2==1'b0&&B2==1'b1&&B3==1'b1) (B1 +=> X)=(0, 0);
if (A1==1'b1&&A2==1'b1&&B2==1'b1&&B3==1'b1) (B1 +=> X)=(0, 0);
if (A1==1'b0&&B1==1'b1&&B2==1'b1&&B3==1'b1) (A2 +=> X)=(0, 0);
if (A2==1'b0&&B1==1'b1&&B2==1'b1&&B3==1'b1) (A1 +=> X)=(0, 0);
endspecify
   `endif
endmodule
`endcelldefine

//%END SVN_OA2111_4

//%BEGIN SVN_OA211_1

`celldefine
module SVN_OA211_1 (X, A1, A2, B1, B2);
   output X;
   input A1, A2, B1, B2;

   wire int_res_0;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////

   or (int_res_0, A1, A2);

   `ifdef VIRL_functiononly
   and #`SNPS_COMBO_DELAY (X, int_res_0, B1, B2);
   `else
   and (X, int_res_0, B1, B2);
   `endif

   `ifdef VIRL_functiononly

   `else

   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////


specify
if (A1==1'b0&&A2==1'b1&&B1==1'b1) (B2 +=> X)=(0, 0);
if (A1==1'b1&&A2==1'b0&&B1==1'b1) (B2 +=> X)=(0, 0);
if (A1==1'b1&&A2==1'b1&&B1==1'b1) (B2 +=> X)=(0, 0);
if (A1==1'b0&&A2==1'b1&&B2==1'b1) (B1 +=> X)=(0, 0);
if (A1==1'b1&&A2==1'b0&&B2==1'b1) (B1 +=> X)=(0, 0);
if (A1==1'b1&&A2==1'b1&&B2==1'b1) (B1 +=> X)=(0, 0);
if (A1==1'b0&&B1==1'b1&&B2==1'b1) (A2 +=> X)=(0, 0);
if (A2==1'b0&&B1==1'b1&&B2==1'b1) (A1 +=> X)=(0, 0);
endspecify
   `endif
endmodule
`endcelldefine

//%END SVN_OA211_1

//%BEGIN SVN_OA211_2

`celldefine
module SVN_OA211_2 (X, A1, A2, B1, B2);
   output X;
   input A1, A2, B1, B2;

   wire int_res_0;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////

   or (int_res_0, A1, A2);

   `ifdef VIRL_functiononly
   and #`SNPS_COMBO_DELAY (X, int_res_0, B1, B2);
   `else
   and (X, int_res_0, B1, B2);
   `endif

   `ifdef VIRL_functiononly

   `else

   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////


specify
if (A1==1'b0&&A2==1'b1&&B1==1'b1) (B2 +=> X)=(0, 0);
if (A1==1'b1&&A2==1'b0&&B1==1'b1) (B2 +=> X)=(0, 0);
if (A1==1'b1&&A2==1'b1&&B1==1'b1) (B2 +=> X)=(0, 0);
if (A1==1'b0&&A2==1'b1&&B2==1'b1) (B1 +=> X)=(0, 0);
if (A1==1'b1&&A2==1'b0&&B2==1'b1) (B1 +=> X)=(0, 0);
if (A1==1'b1&&A2==1'b1&&B2==1'b1) (B1 +=> X)=(0, 0);
if (A1==1'b0&&B1==1'b1&&B2==1'b1) (A2 +=> X)=(0, 0);
if (A2==1'b0&&B1==1'b1&&B2==1'b1) (A1 +=> X)=(0, 0);
endspecify
   `endif
endmodule
`endcelldefine

//%END SVN_OA211_2

//%BEGIN SVN_OA211_4

`celldefine
module SVN_OA211_4 (X, A1, A2, B1, B2);
   output X;
   input A1, A2, B1, B2;

   wire int_res_0;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////

   or (int_res_0, A1, A2);

   `ifdef VIRL_functiononly
   and #`SNPS_COMBO_DELAY (X, int_res_0, B1, B2);
   `else
   and (X, int_res_0, B1, B2);
   `endif

   `ifdef VIRL_functiononly

   `else

   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////


specify
if (A1==1'b0&&A2==1'b1&&B1==1'b1) (B2 +=> X)=(0, 0);
if (A1==1'b1&&A2==1'b0&&B1==1'b1) (B2 +=> X)=(0, 0);
if (A1==1'b1&&A2==1'b1&&B1==1'b1) (B2 +=> X)=(0, 0);
if (A1==1'b0&&A2==1'b1&&B2==1'b1) (B1 +=> X)=(0, 0);
if (A1==1'b1&&A2==1'b0&&B2==1'b1) (B1 +=> X)=(0, 0);
if (A1==1'b1&&A2==1'b1&&B2==1'b1) (B1 +=> X)=(0, 0);
if (A1==1'b0&&B1==1'b1&&B2==1'b1) (A2 +=> X)=(0, 0);
if (A2==1'b0&&B1==1'b1&&B2==1'b1) (A1 +=> X)=(0, 0);
endspecify
   `endif
endmodule
`endcelldefine

//%END SVN_OA211_4

//%BEGIN SVN_OA21_1

`celldefine
module SVN_OA21_1 (X, A1, A2, B);
   output X;
   input A1, A2, B;

   wire int_res_0;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////

   or (int_res_0, A1, A2);

   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////

   `ifdef VIRL_functiononly
        and #`SNPS_COMBO_DELAY (X, int_res_0, B);
   `else
        and (X, int_res_0, B);
   `endif

   `ifdef VIRL_functiononly

   `else


specify
(A1 +=> X)=(0, 0);
(A2 +=> X)=(0, 0);
if ((~(A1) & A2)) (B +=> X)=(0, 0);
if ((A1 & ~(A2))) (B +=> X)=(0, 0);
if ((A1 & A2)) (B +=> X)=(0, 0);
endspecify
   `endif

endmodule
`endcelldefine

//%END SVN_OA21_1

//%BEGIN SVN_OA21_2

`celldefine
module SVN_OA21_2 (X, A1, A2, B);
   output X;
   input A1, A2, B;

   wire int_res_0;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////

   or (int_res_0, A1, A2);

   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////

   `ifdef VIRL_functiononly
        and #`SNPS_COMBO_DELAY (X, int_res_0, B);
   `else
        and (X, int_res_0, B);
   `endif

   `ifdef VIRL_functiononly

   `else


specify
(A1 +=> X)=(0, 0);
(A2 +=> X)=(0, 0);
if ((~(A1) & A2)) (B +=> X)=(0, 0);
if ((A1 & ~(A2))) (B +=> X)=(0, 0);
if ((A1 & A2)) (B +=> X)=(0, 0);
endspecify
   `endif

endmodule
`endcelldefine

//%END SVN_OA21_2

//%BEGIN SVN_OA21_3

`celldefine
module SVN_OA21_3 (X, A1, A2, B);
   output X;
   input A1, A2, B;

   wire int_res_0;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////

   or (int_res_0, A1, A2);

   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////

   `ifdef VIRL_functiononly
        and #`SNPS_COMBO_DELAY (X, int_res_0, B);
   `else
        and (X, int_res_0, B);
   `endif

   `ifdef VIRL_functiononly

   `else


specify
(A1 +=> X)=(0, 0);
(A2 +=> X)=(0, 0);
if ((~(A1) & A2)) (B +=> X)=(0, 0);
if ((A1 & ~(A2))) (B +=> X)=(0, 0);
if ((A1 & A2)) (B +=> X)=(0, 0);
endspecify
   `endif

endmodule
`endcelldefine

//%END SVN_OA21_3

//%BEGIN SVN_OA21_4

`celldefine
module SVN_OA21_4 (X, A1, A2, B);
   output X;
   input A1, A2, B;

   wire int_res_0;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////

   or (int_res_0, A1, A2);

   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////

   `ifdef VIRL_functiononly
        and #`SNPS_COMBO_DELAY (X, int_res_0, B);
   `else
        and (X, int_res_0, B);
   `endif

   `ifdef VIRL_functiononly

   `else


specify
(A1 +=> X)=(0, 0);
(A2 +=> X)=(0, 0);
if ((~(A1) & A2)) (B +=> X)=(0, 0);
if ((A1 & ~(A2))) (B +=> X)=(0, 0);
if ((A1 & A2)) (B +=> X)=(0, 0);
endspecify
   `endif

endmodule
`endcelldefine

//%END SVN_OA21_4

//%BEGIN SVN_OA21_6

`celldefine
module SVN_OA21_6 (X, A1, A2, B);
   output X;
   input A1, A2, B;

   wire int_res_0;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////

   or (int_res_0, A1, A2);

   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////

   `ifdef VIRL_functiononly
        and #`SNPS_COMBO_DELAY (X, int_res_0, B);
   `else
        and (X, int_res_0, B);
   `endif

   `ifdef VIRL_functiononly

   `else


specify
(A1 +=> X)=(0, 0);
(A2 +=> X)=(0, 0);
if ((~(A1) & A2)) (B +=> X)=(0, 0);
if ((A1 & ~(A2))) (B +=> X)=(0, 0);
if ((A1 & A2)) (B +=> X)=(0, 0);
endspecify
   `endif

endmodule
`endcelldefine

//%END SVN_OA21_6

//%BEGIN SVN_OA21B_1

`celldefine
module SVN_OA21B_1 (X, A1, A2, B);
   output X;
   input A1, A2, B;

   wire int_res_0, int_res_1;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////

   or (int_res_0, A1, A2);
   not (int_res_1, B);

   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////

   `ifdef VIRL_functiononly
       and #`SNPS_COMBO_DELAY (X, int_res_0, int_res_1);
   `else
       and (X, int_res_0, int_res_1);
   `endif

   `ifdef VIRL_functiononly

   `else


specify
(A1 +=> X)=(0, 0);
(A2 +=> X)=(0, 0);
(B -=> X)=(0, 0);
endspecify
   `endif

endmodule
`endcelldefine

//%END SVN_OA21B_1

//%BEGIN SVN_OA21B_2

`celldefine
module SVN_OA21B_2 (X, A1, A2, B);
   output X;
   input A1, A2, B;

   wire int_res_0, int_res_1;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////

   or (int_res_0, A1, A2);
   not (int_res_1, B);

   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////

   `ifdef VIRL_functiononly
       and #`SNPS_COMBO_DELAY (X, int_res_0, int_res_1);
   `else
       and (X, int_res_0, int_res_1);
   `endif

   `ifdef VIRL_functiononly

   `else


specify
(A1 +=> X)=(0, 0);
(A2 +=> X)=(0, 0);
(B -=> X)=(0, 0);
endspecify
   `endif

endmodule
`endcelldefine

//%END SVN_OA21B_2

//%BEGIN SVN_OA21B_3

`celldefine
module SVN_OA21B_3 (X, A1, A2, B);
   output X;
   input A1, A2, B;

   wire int_res_0, int_res_1;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////

   or (int_res_0, A1, A2);
   not (int_res_1, B);

   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////

   `ifdef VIRL_functiononly
       and #`SNPS_COMBO_DELAY (X, int_res_0, int_res_1);
   `else
       and (X, int_res_0, int_res_1);
   `endif

   `ifdef VIRL_functiononly

   `else


specify
(A1 +=> X)=(0, 0);
(A2 +=> X)=(0, 0);
(B -=> X)=(0, 0);
endspecify
   `endif

endmodule
`endcelldefine

//%END SVN_OA21B_3

//%BEGIN SVN_OA21B_4

`celldefine
module SVN_OA21B_4 (X, A1, A2, B);
   output X;
   input A1, A2, B;

   wire int_res_0, int_res_1;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////

   or (int_res_0, A1, A2);
   not (int_res_1, B);

   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////

   `ifdef VIRL_functiononly
       and #`SNPS_COMBO_DELAY (X, int_res_0, int_res_1);
   `else
       and (X, int_res_0, int_res_1);
   `endif

   `ifdef VIRL_functiononly

   `else


specify
(A1 +=> X)=(0, 0);
(A2 +=> X)=(0, 0);
(B -=> X)=(0, 0);
endspecify
   `endif

endmodule
`endcelldefine

//%END SVN_OA21B_4

//%BEGIN SVN_OA221_1

`celldefine
module SVN_OA221_1 (X, A1, A2, B1, B2, C);
   output X;
   input A1, A2, B1, B2, C;

   wire int_res_0, int_res_1;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////

   or (int_res_0, A1, A2);
   or (int_res_1, B1, B2);

   `ifdef VIRL_functiononly
      and #`SNPS_COMBO_DELAY (X, int_res_0, int_res_1, C);
   `else
      and (X, int_res_0, int_res_1, C);
   `endif

   `ifdef VIRL_functiononly

   `else

   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////


specify
if (A1==1'b0&&B1==1'b0&&B2==1'b1&&C==1'b1) (A2 +=> X)=(0, 0);
if (A1==1'b0&&B1==1'b1&&B2==1'b0&&C==1'b1) (A2 +=> X)=(0, 0);
if (A1==1'b0&&B1==1'b1&&B2==1'b1&&C==1'b1) (A2 +=> X)=(0, 0);
if (A1==1'b0&&A2==1'b1&&B1==1'b0&&B2==1'b1) (C +=> X)=(0, 0);
if (A1==1'b0&&A2==1'b1&&B1==1'b1&&B2==1'b0) (C +=> X)=(0, 0);
if (A1==1'b0&&A2==1'b1&&B1==1'b1&&B2==1'b1) (C +=> X)=(0, 0);
if (A1==1'b1&&A2==1'b0&&B1==1'b0&&B2==1'b1) (C +=> X)=(0, 0);
if (A1==1'b1&&A2==1'b0&&B1==1'b1&&B2==1'b0) (C +=> X)=(0, 0);
if (A1==1'b1&&A2==1'b0&&B1==1'b1&&B2==1'b1) (C +=> X)=(0, 0);
if (A1==1'b1&&A2==1'b1&&B1==1'b0&&B2==1'b1) (C +=> X)=(0, 0);
if (A1==1'b1&&A2==1'b1&&B1==1'b1&&B2==1'b0) (C +=> X)=(0, 0);
if (A1==1'b1&&A2==1'b1&&B1==1'b1&&B2==1'b1) (C +=> X)=(0, 0);
if (A1==1'b0&&A2==1'b1&&B1==1'b0&&C==1'b1) (B2 +=> X)=(0, 0);
if (A1==1'b1&&A2==1'b0&&B1==1'b0&&C==1'b1) (B2 +=> X)=(0, 0);
if (A1==1'b1&&A2==1'b1&&B1==1'b0&&C==1'b1) (B2 +=> X)=(0, 0);
if (A1==1'b0&&A2==1'b1&&B2==1'b0&&C==1'b1) (B1 +=> X)=(0, 0);
if (A1==1'b1&&A2==1'b0&&B2==1'b0&&C==1'b1) (B1 +=> X)=(0, 0);
if (A1==1'b1&&A2==1'b1&&B2==1'b0&&C==1'b1) (B1 +=> X)=(0, 0);
if (A2==1'b0&&B1==1'b0&&B2==1'b1&&C==1'b1) (A1 +=> X)=(0, 0);
if (A2==1'b0&&B1==1'b1&&B2==1'b0&&C==1'b1) (A1 +=> X)=(0, 0);
if (A2==1'b0&&B1==1'b1&&B2==1'b1&&C==1'b1) (A1 +=> X)=(0, 0);
endspecify
   `endif
endmodule
`endcelldefine

//%END SVN_OA221_1

//%BEGIN SVN_OA221_2

`celldefine
module SVN_OA221_2 (X, A1, A2, B1, B2, C);
   output X;
   input A1, A2, B1, B2, C;

   wire int_res_0, int_res_1;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////

   or (int_res_0, A1, A2);
   or (int_res_1, B1, B2);

   `ifdef VIRL_functiononly
      and #`SNPS_COMBO_DELAY (X, int_res_0, int_res_1, C);
   `else
      and (X, int_res_0, int_res_1, C);
   `endif

   `ifdef VIRL_functiononly

   `else

   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////


specify
if (A1==1'b0&&B1==1'b0&&B2==1'b1&&C==1'b1) (A2 +=> X)=(0, 0);
if (A1==1'b0&&B1==1'b1&&B2==1'b0&&C==1'b1) (A2 +=> X)=(0, 0);
if (A1==1'b0&&B1==1'b1&&B2==1'b1&&C==1'b1) (A2 +=> X)=(0, 0);
if (A1==1'b0&&A2==1'b1&&B1==1'b0&&B2==1'b1) (C +=> X)=(0, 0);
if (A1==1'b0&&A2==1'b1&&B1==1'b1&&B2==1'b0) (C +=> X)=(0, 0);
if (A1==1'b0&&A2==1'b1&&B1==1'b1&&B2==1'b1) (C +=> X)=(0, 0);
if (A1==1'b1&&A2==1'b0&&B1==1'b0&&B2==1'b1) (C +=> X)=(0, 0);
if (A1==1'b1&&A2==1'b0&&B1==1'b1&&B2==1'b0) (C +=> X)=(0, 0);
if (A1==1'b1&&A2==1'b0&&B1==1'b1&&B2==1'b1) (C +=> X)=(0, 0);
if (A1==1'b1&&A2==1'b1&&B1==1'b0&&B2==1'b1) (C +=> X)=(0, 0);
if (A1==1'b1&&A2==1'b1&&B1==1'b1&&B2==1'b0) (C +=> X)=(0, 0);
if (A1==1'b1&&A2==1'b1&&B1==1'b1&&B2==1'b1) (C +=> X)=(0, 0);
if (A1==1'b0&&A2==1'b1&&B1==1'b0&&C==1'b1) (B2 +=> X)=(0, 0);
if (A1==1'b1&&A2==1'b0&&B1==1'b0&&C==1'b1) (B2 +=> X)=(0, 0);
if (A1==1'b1&&A2==1'b1&&B1==1'b0&&C==1'b1) (B2 +=> X)=(0, 0);
if (A1==1'b0&&A2==1'b1&&B2==1'b0&&C==1'b1) (B1 +=> X)=(0, 0);
if (A1==1'b1&&A2==1'b0&&B2==1'b0&&C==1'b1) (B1 +=> X)=(0, 0);
if (A1==1'b1&&A2==1'b1&&B2==1'b0&&C==1'b1) (B1 +=> X)=(0, 0);
if (A2==1'b0&&B1==1'b0&&B2==1'b1&&C==1'b1) (A1 +=> X)=(0, 0);
if (A2==1'b0&&B1==1'b1&&B2==1'b0&&C==1'b1) (A1 +=> X)=(0, 0);
if (A2==1'b0&&B1==1'b1&&B2==1'b1&&C==1'b1) (A1 +=> X)=(0, 0);
endspecify
   `endif
endmodule
`endcelldefine

//%END SVN_OA221_2

//%BEGIN SVN_OA221_4

`celldefine
module SVN_OA221_4 (X, A1, A2, B1, B2, C);
   output X;
   input A1, A2, B1, B2, C;

   wire int_res_0, int_res_1;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////

   or (int_res_0, A1, A2);
   or (int_res_1, B1, B2);

   `ifdef VIRL_functiononly
      and #`SNPS_COMBO_DELAY (X, int_res_0, int_res_1, C);
   `else
      and (X, int_res_0, int_res_1, C);
   `endif

   `ifdef VIRL_functiononly

   `else

   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////


specify
if (A1==1'b0&&B1==1'b0&&B2==1'b1&&C==1'b1) (A2 +=> X)=(0, 0);
if (A1==1'b0&&B1==1'b1&&B2==1'b0&&C==1'b1) (A2 +=> X)=(0, 0);
if (A1==1'b0&&B1==1'b1&&B2==1'b1&&C==1'b1) (A2 +=> X)=(0, 0);
if (A1==1'b0&&A2==1'b1&&B1==1'b0&&B2==1'b1) (C +=> X)=(0, 0);
if (A1==1'b0&&A2==1'b1&&B1==1'b1&&B2==1'b0) (C +=> X)=(0, 0);
if (A1==1'b0&&A2==1'b1&&B1==1'b1&&B2==1'b1) (C +=> X)=(0, 0);
if (A1==1'b1&&A2==1'b0&&B1==1'b0&&B2==1'b1) (C +=> X)=(0, 0);
if (A1==1'b1&&A2==1'b0&&B1==1'b1&&B2==1'b0) (C +=> X)=(0, 0);
if (A1==1'b1&&A2==1'b0&&B1==1'b1&&B2==1'b1) (C +=> X)=(0, 0);
if (A1==1'b1&&A2==1'b1&&B1==1'b0&&B2==1'b1) (C +=> X)=(0, 0);
if (A1==1'b1&&A2==1'b1&&B1==1'b1&&B2==1'b0) (C +=> X)=(0, 0);
if (A1==1'b1&&A2==1'b1&&B1==1'b1&&B2==1'b1) (C +=> X)=(0, 0);
if (A1==1'b0&&A2==1'b1&&B1==1'b0&&C==1'b1) (B2 +=> X)=(0, 0);
if (A1==1'b1&&A2==1'b0&&B1==1'b0&&C==1'b1) (B2 +=> X)=(0, 0);
if (A1==1'b1&&A2==1'b1&&B1==1'b0&&C==1'b1) (B2 +=> X)=(0, 0);
if (A1==1'b0&&A2==1'b1&&B2==1'b0&&C==1'b1) (B1 +=> X)=(0, 0);
if (A1==1'b1&&A2==1'b0&&B2==1'b0&&C==1'b1) (B1 +=> X)=(0, 0);
if (A1==1'b1&&A2==1'b1&&B2==1'b0&&C==1'b1) (B1 +=> X)=(0, 0);
if (A2==1'b0&&B1==1'b0&&B2==1'b1&&C==1'b1) (A1 +=> X)=(0, 0);
if (A2==1'b0&&B1==1'b1&&B2==1'b0&&C==1'b1) (A1 +=> X)=(0, 0);
if (A2==1'b0&&B1==1'b1&&B2==1'b1&&C==1'b1) (A1 +=> X)=(0, 0);
endspecify
   `endif
endmodule
`endcelldefine

//%END SVN_OA221_4

//%BEGIN SVN_OA22_1

`celldefine
module SVN_OA22_1 (X, A1, A2, B1, B2);
   output X;
   input A1, A2, B1, B2;

   wire int_res_0, int_res_1;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////

   or (int_res_0, A1, A2);
   or (int_res_1, B1, B2);

   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////

   `ifdef VIRL_functiononly
        and #`SNPS_COMBO_DELAY (X, int_res_0, int_res_1);
   `else
        and (X, int_res_0, int_res_1);
   `endif

   `ifdef VIRL_functiononly

   `else


specify
if ((~(A1) & ~(B1) & B2)) (A2 +=> X)=(0, 0);
if ((~(A1) & B1 & ~(B2))) (A2 +=> X)=(0, 0);
if ((~(A1) & B1 & B2)) (A2 +=> X)=(0, 0);
if ((~(A1) & A2 & ~(B1))) (B2 +=> X)=(0, 0);
if ((A1 & ~(A2) & ~(B1))) (B2 +=> X)=(0, 0);
if ((A1 & A2 & ~(B1))) (B2 +=> X)=(0, 0);
if ((~(A1) & A2 & ~(B2))) (B1 +=> X)=(0, 0);
if ((A1 & ~(A2) & ~(B2))) (B1 +=> X)=(0, 0);
if ((A1 & A2 & ~(B2))) (B1 +=> X)=(0, 0);
if ((~(A2) & ~(B1) & B2)) (A1 +=> X)=(0, 0);
if ((~(A2) & B1 & ~(B2))) (A1 +=> X)=(0, 0);
if ((~(A2) & B1 & B2)) (A1 +=> X)=(0, 0);
endspecify
   `endif

endmodule
`endcelldefine

//%END SVN_OA22_1

//%BEGIN SVN_OA22_2

`celldefine
module SVN_OA22_2 (X, A1, A2, B1, B2);
   output X;
   input A1, A2, B1, B2;

   wire int_res_0, int_res_1;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////

   or (int_res_0, A1, A2);
   or (int_res_1, B1, B2);

   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////

   `ifdef VIRL_functiononly
        and #`SNPS_COMBO_DELAY (X, int_res_0, int_res_1);
   `else
        and (X, int_res_0, int_res_1);
   `endif

   `ifdef VIRL_functiononly

   `else


specify
if ((~(A1) & ~(B1) & B2)) (A2 +=> X)=(0, 0);
if ((~(A1) & B1 & ~(B2))) (A2 +=> X)=(0, 0);
if ((~(A1) & B1 & B2)) (A2 +=> X)=(0, 0);
if ((~(A1) & A2 & ~(B1))) (B2 +=> X)=(0, 0);
if ((A1 & ~(A2) & ~(B1))) (B2 +=> X)=(0, 0);
if ((A1 & A2 & ~(B1))) (B2 +=> X)=(0, 0);
if ((~(A1) & A2 & ~(B2))) (B1 +=> X)=(0, 0);
if ((A1 & ~(A2) & ~(B2))) (B1 +=> X)=(0, 0);
if ((A1 & A2 & ~(B2))) (B1 +=> X)=(0, 0);
if ((~(A2) & ~(B1) & B2)) (A1 +=> X)=(0, 0);
if ((~(A2) & B1 & ~(B2))) (A1 +=> X)=(0, 0);
if ((~(A2) & B1 & B2)) (A1 +=> X)=(0, 0);
endspecify
   `endif

endmodule
`endcelldefine

//%END SVN_OA22_2

//%BEGIN SVN_OA22_3

`celldefine
module SVN_OA22_3 (X, A1, A2, B1, B2);
   output X;
   input A1, A2, B1, B2;

   wire int_res_0, int_res_1;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////

   or (int_res_0, A1, A2);
   or (int_res_1, B1, B2);

   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////

   `ifdef VIRL_functiononly
        and #`SNPS_COMBO_DELAY (X, int_res_0, int_res_1);
   `else
        and (X, int_res_0, int_res_1);
   `endif

   `ifdef VIRL_functiononly

   `else


specify
if ((~(A1) & ~(B1) & B2)) (A2 +=> X)=(0, 0);
if ((~(A1) & B1 & ~(B2))) (A2 +=> X)=(0, 0);
if ((~(A1) & B1 & B2)) (A2 +=> X)=(0, 0);
if ((~(A1) & A2 & ~(B1))) (B2 +=> X)=(0, 0);
if ((A1 & ~(A2) & ~(B1))) (B2 +=> X)=(0, 0);
if ((A1 & A2 & ~(B1))) (B2 +=> X)=(0, 0);
if ((~(A1) & A2 & ~(B2))) (B1 +=> X)=(0, 0);
if ((A1 & ~(A2) & ~(B2))) (B1 +=> X)=(0, 0);
if ((A1 & A2 & ~(B2))) (B1 +=> X)=(0, 0);
if ((~(A2) & ~(B1) & B2)) (A1 +=> X)=(0, 0);
if ((~(A2) & B1 & ~(B2))) (A1 +=> X)=(0, 0);
if ((~(A2) & B1 & B2)) (A1 +=> X)=(0, 0);
endspecify
   `endif

endmodule
`endcelldefine

//%END SVN_OA22_3

//%BEGIN SVN_OA22_4

`celldefine
module SVN_OA22_4 (X, A1, A2, B1, B2);
   output X;
   input A1, A2, B1, B2;

   wire int_res_0, int_res_1;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////

   or (int_res_0, A1, A2);
   or (int_res_1, B1, B2);

   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////

   `ifdef VIRL_functiononly
        and #`SNPS_COMBO_DELAY (X, int_res_0, int_res_1);
   `else
        and (X, int_res_0, int_res_1);
   `endif

   `ifdef VIRL_functiononly

   `else


specify
if ((~(A1) & ~(B1) & B2)) (A2 +=> X)=(0, 0);
if ((~(A1) & B1 & ~(B2))) (A2 +=> X)=(0, 0);
if ((~(A1) & B1 & B2)) (A2 +=> X)=(0, 0);
if ((~(A1) & A2 & ~(B1))) (B2 +=> X)=(0, 0);
if ((A1 & ~(A2) & ~(B1))) (B2 +=> X)=(0, 0);
if ((A1 & A2 & ~(B1))) (B2 +=> X)=(0, 0);
if ((~(A1) & A2 & ~(B2))) (B1 +=> X)=(0, 0);
if ((A1 & ~(A2) & ~(B2))) (B1 +=> X)=(0, 0);
if ((A1 & A2 & ~(B2))) (B1 +=> X)=(0, 0);
if ((~(A2) & ~(B1) & B2)) (A1 +=> X)=(0, 0);
if ((~(A2) & B1 & ~(B2))) (A1 +=> X)=(0, 0);
if ((~(A2) & B1 & B2)) (A1 +=> X)=(0, 0);
endspecify
   `endif

endmodule
`endcelldefine

//%END SVN_OA22_4

//%BEGIN SVN_OA22_6

`celldefine
module SVN_OA22_6 (X, A1, A2, B1, B2);
   output X;
   input A1, A2, B1, B2;

   wire int_res_0, int_res_1;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////

   or (int_res_0, A1, A2);
   or (int_res_1, B1, B2);

   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////

   `ifdef VIRL_functiononly
        and #`SNPS_COMBO_DELAY (X, int_res_0, int_res_1);
   `else
        and (X, int_res_0, int_res_1);
   `endif

   `ifdef VIRL_functiononly

   `else


specify
if ((~(A1) & ~(B1) & B2)) (A2 +=> X)=(0, 0);
if ((~(A1) & B1 & ~(B2))) (A2 +=> X)=(0, 0);
if ((~(A1) & B1 & B2)) (A2 +=> X)=(0, 0);
if ((~(A1) & A2 & ~(B1))) (B2 +=> X)=(0, 0);
if ((A1 & ~(A2) & ~(B1))) (B2 +=> X)=(0, 0);
if ((A1 & A2 & ~(B1))) (B2 +=> X)=(0, 0);
if ((~(A1) & A2 & ~(B2))) (B1 +=> X)=(0, 0);
if ((A1 & ~(A2) & ~(B2))) (B1 +=> X)=(0, 0);
if ((A1 & A2 & ~(B2))) (B1 +=> X)=(0, 0);
if ((~(A2) & ~(B1) & B2)) (A1 +=> X)=(0, 0);
if ((~(A2) & B1 & ~(B2))) (A1 +=> X)=(0, 0);
if ((~(A2) & B1 & B2)) (A1 +=> X)=(0, 0);
endspecify
   `endif

endmodule
`endcelldefine

//%END SVN_OA22_6

//%BEGIN SVN_OA2BB2_1

`celldefine
module SVN_OA2BB2_1 (X, A1, A2, B1, B2);
   output X;
   input A1, A2, B1, B2;

   wire int_res_0, int_res_1, int_res_2, 
      int_res_3;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////

   not (int_res_0, A1);
   not (int_res_1, A2);
   or (int_res_2, int_res_0, int_res_1);
   or (int_res_3, B1, B2);

   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////

   `ifdef VIRL_functiononly
        and #`SNPS_COMBO_DELAY (X, int_res_2, int_res_3);
   `else
        and (X, int_res_2, int_res_3);
   `endif

   `ifdef VIRL_functiononly

   `else


specify
(A1 -=> X)=(0, 0);
(A2 -=> X)=(0, 0);
if ((~(A1) & ~(A2) & ~(B1))) (B2 +=> X)=(0, 0);
if ((~(A1) & A2 & ~(B1))) (B2 +=> X)=(0, 0);
if ((A1 & ~(A2) & ~(B1))) (B2 +=> X)=(0, 0);
if ((~(A1) & ~(A2) & ~(B2))) (B1 +=> X)=(0, 0);
if ((~(A1) & A2 & ~(B2))) (B1 +=> X)=(0, 0);
if ((A1 & ~(A2) & ~(B2))) (B1 +=> X)=(0, 0);
endspecify
   `endif

endmodule
`endcelldefine

//%END SVN_OA2BB2_1

//%BEGIN SVN_OA2BB2_2

`celldefine
module SVN_OA2BB2_2 (X, A1, A2, B1, B2);
   output X;
   input A1, A2, B1, B2;

   wire int_res_0, int_res_1, int_res_2, 
      int_res_3;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////

   not (int_res_0, A1);
   not (int_res_1, A2);
   or (int_res_2, int_res_0, int_res_1);
   or (int_res_3, B1, B2);

   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////

   `ifdef VIRL_functiononly
        and #`SNPS_COMBO_DELAY (X, int_res_2, int_res_3);
   `else
        and (X, int_res_2, int_res_3);
   `endif

   `ifdef VIRL_functiononly

   `else


specify
(A1 -=> X)=(0, 0);
(A2 -=> X)=(0, 0);
if ((~(A1) & ~(A2) & ~(B1))) (B2 +=> X)=(0, 0);
if ((~(A1) & A2 & ~(B1))) (B2 +=> X)=(0, 0);
if ((A1 & ~(A2) & ~(B1))) (B2 +=> X)=(0, 0);
if ((~(A1) & ~(A2) & ~(B2))) (B1 +=> X)=(0, 0);
if ((~(A1) & A2 & ~(B2))) (B1 +=> X)=(0, 0);
if ((A1 & ~(A2) & ~(B2))) (B1 +=> X)=(0, 0);
endspecify
   `endif

endmodule
`endcelldefine

//%END SVN_OA2BB2_2

//%BEGIN SVN_OA2BB2_4

`celldefine
module SVN_OA2BB2_4 (X, A1, A2, B1, B2);
   output X;
   input A1, A2, B1, B2;

   wire int_res_0, int_res_1, int_res_2, 
      int_res_3;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////

   not (int_res_0, A1);
   not (int_res_1, A2);
   or (int_res_2, int_res_0, int_res_1);
   or (int_res_3, B1, B2);

   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////

   `ifdef VIRL_functiononly
        and #`SNPS_COMBO_DELAY (X, int_res_2, int_res_3);
   `else
        and (X, int_res_2, int_res_3);
   `endif

   `ifdef VIRL_functiononly

   `else


specify
(A1 -=> X)=(0, 0);
(A2 -=> X)=(0, 0);
if ((~(A1) & ~(A2) & ~(B1))) (B2 +=> X)=(0, 0);
if ((~(A1) & A2 & ~(B1))) (B2 +=> X)=(0, 0);
if ((A1 & ~(A2) & ~(B1))) (B2 +=> X)=(0, 0);
if ((~(A1) & ~(A2) & ~(B2))) (B1 +=> X)=(0, 0);
if ((~(A1) & A2 & ~(B2))) (B1 +=> X)=(0, 0);
if ((A1 & ~(A2) & ~(B2))) (B1 +=> X)=(0, 0);
endspecify
   `endif

endmodule
`endcelldefine

//%END SVN_OA2BB2_4

//%BEGIN SVN_OA311_1

`celldefine
module SVN_OA311_1 (X, A1, A2, A3, B1, B2);
   output X;
   input A1, A2, A3, B1, B2;

   wire int_res_0;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////

   or (int_res_0, A1, A2, A3);

   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////

   `ifdef VIRL_functiononly
        and #`SNPS_COMBO_DELAY (X, int_res_0, B1, B2);
   `else
        and (X, int_res_0, B1, B2);
   `endif

   `ifdef VIRL_functiononly

   `else


specify
if (A1==1'b0&&A2==1'b0&&A3==1'b1&&B1==1'b1) (B2 +=> X)=(0, 0);
if (A1==1'b0&&A2==1'b1&&A3==1'b0&&B1==1'b1) (B2 +=> X)=(0, 0);
if (A1==1'b0&&A2==1'b1&&A3==1'b1&&B1==1'b1) (B2 +=> X)=(0, 0);
if (A1==1'b1&&A2==1'b0&&A3==1'b0&&B1==1'b1) (B2 +=> X)=(0, 0);
if (A1==1'b1&&A2==1'b0&&A3==1'b1&&B1==1'b1) (B2 +=> X)=(0, 0);
if (A1==1'b1&&A2==1'b1&&A3==1'b0&&B1==1'b1) (B2 +=> X)=(0, 0);
if (A1==1'b1&&A2==1'b1&&A3==1'b1&&B1==1'b1) (B2 +=> X)=(0, 0);
if (A1==1'b0&&A2==1'b0&&A3==1'b1&&B2==1'b1) (B1 +=> X)=(0, 0);
if (A1==1'b0&&A2==1'b1&&A3==1'b0&&B2==1'b1) (B1 +=> X)=(0, 0);
if (A1==1'b0&&A2==1'b1&&A3==1'b1&&B2==1'b1) (B1 +=> X)=(0, 0);
if (A1==1'b1&&A2==1'b0&&A3==1'b0&&B2==1'b1) (B1 +=> X)=(0, 0);
if (A1==1'b1&&A2==1'b0&&A3==1'b1&&B2==1'b1) (B1 +=> X)=(0, 0);
if (A1==1'b1&&A2==1'b1&&A3==1'b0&&B2==1'b1) (B1 +=> X)=(0, 0);
if (A1==1'b1&&A2==1'b1&&A3==1'b1&&B2==1'b1) (B1 +=> X)=(0, 0);
if (A1==1'b0&&A2==1'b0&&B1==1'b1&&B2==1'b1) (A3 +=> X)=(0, 0);
if (A1==1'b0&&A3==1'b0&&B1==1'b1&&B2==1'b1) (A2 +=> X)=(0, 0);
if (A2==1'b0&&A3==1'b0&&B1==1'b1&&B2==1'b1) (A1 +=> X)=(0, 0);
endspecify
   `endif

endmodule
`endcelldefine

//%END SVN_OA311_1

//%BEGIN SVN_OA311_2

`celldefine
module SVN_OA311_2 (X, A1, A2, A3, B1, B2);
   output X;
   input A1, A2, A3, B1, B2;

   wire int_res_0;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////

   or (int_res_0, A1, A2, A3);

   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////

   `ifdef VIRL_functiononly
        and #`SNPS_COMBO_DELAY (X, int_res_0, B1, B2);
   `else
        and (X, int_res_0, B1, B2);
   `endif

   `ifdef VIRL_functiononly

   `else


specify
if (A1==1'b0&&A2==1'b0&&A3==1'b1&&B1==1'b1) (B2 +=> X)=(0, 0);
if (A1==1'b0&&A2==1'b1&&A3==1'b0&&B1==1'b1) (B2 +=> X)=(0, 0);
if (A1==1'b0&&A2==1'b1&&A3==1'b1&&B1==1'b1) (B2 +=> X)=(0, 0);
if (A1==1'b1&&A2==1'b0&&A3==1'b0&&B1==1'b1) (B2 +=> X)=(0, 0);
if (A1==1'b1&&A2==1'b0&&A3==1'b1&&B1==1'b1) (B2 +=> X)=(0, 0);
if (A1==1'b1&&A2==1'b1&&A3==1'b0&&B1==1'b1) (B2 +=> X)=(0, 0);
if (A1==1'b1&&A2==1'b1&&A3==1'b1&&B1==1'b1) (B2 +=> X)=(0, 0);
if (A1==1'b0&&A2==1'b0&&A3==1'b1&&B2==1'b1) (B1 +=> X)=(0, 0);
if (A1==1'b0&&A2==1'b1&&A3==1'b0&&B2==1'b1) (B1 +=> X)=(0, 0);
if (A1==1'b0&&A2==1'b1&&A3==1'b1&&B2==1'b1) (B1 +=> X)=(0, 0);
if (A1==1'b1&&A2==1'b0&&A3==1'b0&&B2==1'b1) (B1 +=> X)=(0, 0);
if (A1==1'b1&&A2==1'b0&&A3==1'b1&&B2==1'b1) (B1 +=> X)=(0, 0);
if (A1==1'b1&&A2==1'b1&&A3==1'b0&&B2==1'b1) (B1 +=> X)=(0, 0);
if (A1==1'b1&&A2==1'b1&&A3==1'b1&&B2==1'b1) (B1 +=> X)=(0, 0);
if (A1==1'b0&&A2==1'b0&&B1==1'b1&&B2==1'b1) (A3 +=> X)=(0, 0);
if (A1==1'b0&&A3==1'b0&&B1==1'b1&&B2==1'b1) (A2 +=> X)=(0, 0);
if (A2==1'b0&&A3==1'b0&&B1==1'b1&&B2==1'b1) (A1 +=> X)=(0, 0);
endspecify
   `endif

endmodule
`endcelldefine

//%END SVN_OA311_2

//%BEGIN SVN_OA311_4

`celldefine
module SVN_OA311_4 (X, A1, A2, A3, B1, B2);
   output X;
   input A1, A2, A3, B1, B2;

   wire int_res_0;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////

   or (int_res_0, A1, A2, A3);

   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////

   `ifdef VIRL_functiononly
        and #`SNPS_COMBO_DELAY (X, int_res_0, B1, B2);
   `else
        and (X, int_res_0, B1, B2);
   `endif

   `ifdef VIRL_functiononly

   `else


specify
if (A1==1'b0&&A2==1'b0&&A3==1'b1&&B1==1'b1) (B2 +=> X)=(0, 0);
if (A1==1'b0&&A2==1'b1&&A3==1'b0&&B1==1'b1) (B2 +=> X)=(0, 0);
if (A1==1'b0&&A2==1'b1&&A3==1'b1&&B1==1'b1) (B2 +=> X)=(0, 0);
if (A1==1'b1&&A2==1'b0&&A3==1'b0&&B1==1'b1) (B2 +=> X)=(0, 0);
if (A1==1'b1&&A2==1'b0&&A3==1'b1&&B1==1'b1) (B2 +=> X)=(0, 0);
if (A1==1'b1&&A2==1'b1&&A3==1'b0&&B1==1'b1) (B2 +=> X)=(0, 0);
if (A1==1'b1&&A2==1'b1&&A3==1'b1&&B1==1'b1) (B2 +=> X)=(0, 0);
if (A1==1'b0&&A2==1'b0&&A3==1'b1&&B2==1'b1) (B1 +=> X)=(0, 0);
if (A1==1'b0&&A2==1'b1&&A3==1'b0&&B2==1'b1) (B1 +=> X)=(0, 0);
if (A1==1'b0&&A2==1'b1&&A3==1'b1&&B2==1'b1) (B1 +=> X)=(0, 0);
if (A1==1'b1&&A2==1'b0&&A3==1'b0&&B2==1'b1) (B1 +=> X)=(0, 0);
if (A1==1'b1&&A2==1'b0&&A3==1'b1&&B2==1'b1) (B1 +=> X)=(0, 0);
if (A1==1'b1&&A2==1'b1&&A3==1'b0&&B2==1'b1) (B1 +=> X)=(0, 0);
if (A1==1'b1&&A2==1'b1&&A3==1'b1&&B2==1'b1) (B1 +=> X)=(0, 0);
if (A1==1'b0&&A2==1'b0&&B1==1'b1&&B2==1'b1) (A3 +=> X)=(0, 0);
if (A1==1'b0&&A3==1'b0&&B1==1'b1&&B2==1'b1) (A2 +=> X)=(0, 0);
if (A2==1'b0&&A3==1'b0&&B1==1'b1&&B2==1'b1) (A1 +=> X)=(0, 0);
endspecify
   `endif

endmodule
`endcelldefine

//%END SVN_OA311_4

//%BEGIN SVN_OA31_1

`celldefine
module SVN_OA31_1 (X, A1, A2, A3, B);
   output X;
   input A1, A2, A3, B;

   wire int_res_0;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////

   or (int_res_0, A1, A2, A3);

   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////

   `ifdef VIRL_functiononly
        and #`SNPS_COMBO_DELAY (X, int_res_0, B);
   `else
        and (X, int_res_0, B);
   `endif

   `ifdef VIRL_functiononly

   `else


specify
(A1 +=> X)=(0, 0);
(A2 +=> X)=(0, 0);
(A3 +=> X)=(0, 0);
if ((~(A1) & ~(A2) & A3)) (B +=> X)=(0, 0);
if ((~(A1) & A2 & ~(A3))) (B +=> X)=(0, 0);
if ((~(A1) & A2 & A3)) (B +=> X)=(0, 0);
if ((A1 & ~(A2) & ~(A3))) (B +=> X)=(0, 0);
if ((A1 & A2 & ~(A3)) | (A1 & ~(A2) & A3)) (B +=> X)=(0, 0);
if ((A1 & A2 & A3)) (B +=> X)=(0, 0);
endspecify
   `endif

endmodule
`endcelldefine

//%END SVN_OA31_1

//%BEGIN SVN_OA31_2

`celldefine
module SVN_OA31_2 (X, A1, A2, A3, B);
   output X;
   input A1, A2, A3, B;

   wire int_res_0;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////

   or (int_res_0, A1, A2, A3);

   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////

   `ifdef VIRL_functiononly
        and #`SNPS_COMBO_DELAY (X, int_res_0, B);
   `else
        and (X, int_res_0, B);
   `endif

   `ifdef VIRL_functiononly

   `else


specify
(A1 +=> X)=(0, 0);
(A2 +=> X)=(0, 0);
(A3 +=> X)=(0, 0);
if ((~(A1) & ~(A2) & A3)) (B +=> X)=(0, 0);
if ((~(A1) & A2 & ~(A3))) (B +=> X)=(0, 0);
if ((~(A1) & A2 & A3)) (B +=> X)=(0, 0);
if ((A1 & ~(A2) & ~(A3))) (B +=> X)=(0, 0);
if ((A1 & A2 & ~(A3)) | (A1 & ~(A2) & A3)) (B +=> X)=(0, 0);
if ((A1 & A2 & A3)) (B +=> X)=(0, 0);
endspecify
   `endif

endmodule
`endcelldefine

//%END SVN_OA31_2

//%BEGIN SVN_OA31_4

`celldefine
module SVN_OA31_4 (X, A1, A2, A3, B);
   output X;
   input A1, A2, A3, B;

   wire int_res_0;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////

   or (int_res_0, A1, A2, A3);

   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////

   `ifdef VIRL_functiononly
        and #`SNPS_COMBO_DELAY (X, int_res_0, B);
   `else
        and (X, int_res_0, B);
   `endif

   `ifdef VIRL_functiononly

   `else


specify
(A1 +=> X)=(0, 0);
(A2 +=> X)=(0, 0);
(A3 +=> X)=(0, 0);
if ((~(A1) & ~(A2) & A3)) (B +=> X)=(0, 0);
if ((~(A1) & A2 & ~(A3))) (B +=> X)=(0, 0);
if ((~(A1) & A2 & A3)) (B +=> X)=(0, 0);
if ((A1 & ~(A2) & ~(A3))) (B +=> X)=(0, 0);
if ((A1 & A2 & ~(A3)) | (A1 & ~(A2) & A3)) (B +=> X)=(0, 0);
if ((A1 & A2 & A3)) (B +=> X)=(0, 0);
endspecify
   `endif

endmodule
`endcelldefine

//%END SVN_OA31_4

//%BEGIN SVN_OA32_1

`celldefine
module SVN_OA32_1 (X, A1, A2, A3, B1, B2);
   output X;
   input A1, A2, A3, B1, B2;

   wire int_res_0, int_res_1;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////

   or (int_res_0, A1, A2, A3);
   or (int_res_1, B1, B2);

   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////

   `ifdef VIRL_functiononly
       and #`SNPS_COMBO_DELAY (X, int_res_0, int_res_1);
   `else
       and (X, int_res_0, int_res_1);
   `endif

   `ifdef VIRL_functiononly

   `else


specify
if ((~(A1) & ~(A2) & ~(B1) & B2)) (A3 +=> X)=(0, 0);
if ((~(A1) & ~(A2) & B1 & ~(B2))) (A3 +=> X)=(0, 0);
if ((~(A1) & ~(A2) & B1 & B2)) (A3 +=> X)=(0, 0);
if ((~(A1) & ~(A2) & A3 & ~(B1))) (B2 +=> X)=(0, 0);
if ((~(A1) & A2 & ~(A3) & ~(B1))) (B2 +=> X)=(0, 0);
if ((~(A1) & A2 & A3 & ~(B1))) (B2 +=> X)=(0, 0);
if ((A1 & ~(A2) & ~(A3) & ~(B1))) (B2 +=> X)=(0, 0);
if ((A1 & A2 & ~(A3) & ~(B1)) | (A1 & ~(A2) & A3 & ~(B1))) (B2 +=> X)=(0, 0);
if ((A1 & A2 & A3 & ~(B1))) (B2 +=> X)=(0, 0);
if ((~(A1) & ~(A2) & A3 & ~(B2))) (B1 +=> X)=(0, 0);
if ((~(A1) & A2 & ~(A3) & ~(B2))) (B1 +=> X)=(0, 0);
if ((~(A1) & A2 & A3 & ~(B2))) (B1 +=> X)=(0, 0);
if ((A1 & ~(A2) & ~(A3) & ~(B2))) (B1 +=> X)=(0, 0);
if ((A1 & A2 & ~(A3) & ~(B2)) | (A1 & ~(A2) & A3 & ~(B2))) (B1 +=> X)=(0, 0);
if ((A1 & A2 & A3 & ~(B2))) (B1 +=> X)=(0, 0);
if ((~(A1) & ~(A3) & ~(B1) & B2)) (A2 +=> X)=(0, 0);
if ((~(A1) & ~(A3) & B1 & ~(B2))) (A2 +=> X)=(0, 0);
if ((~(A1) & ~(A3) & B1 & B2)) (A2 +=> X)=(0, 0);
if ((~(A2) & ~(A3) & ~(B1) & B2)) (A1 +=> X)=(0, 0);
if ((~(A2) & ~(A3) & B1 & ~(B2))) (A1 +=> X)=(0, 0);
if ((~(A2) & ~(A3) & B1 & B2)) (A1 +=> X)=(0, 0);
endspecify
   `endif

endmodule
`endcelldefine

//%END SVN_OA32_1

//%BEGIN SVN_OA32_2

`celldefine
module SVN_OA32_2 (X, A1, A2, A3, B1, B2);
   output X;
   input A1, A2, A3, B1, B2;

   wire int_res_0, int_res_1;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////

   or (int_res_0, A1, A2, A3);
   or (int_res_1, B1, B2);

   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////

   `ifdef VIRL_functiononly
       and #`SNPS_COMBO_DELAY (X, int_res_0, int_res_1);
   `else
       and (X, int_res_0, int_res_1);
   `endif

   `ifdef VIRL_functiononly

   `else


specify
if ((~(A1) & ~(A2) & ~(B1) & B2)) (A3 +=> X)=(0, 0);
if ((~(A1) & ~(A2) & B1 & ~(B2))) (A3 +=> X)=(0, 0);
if ((~(A1) & ~(A2) & B1 & B2)) (A3 +=> X)=(0, 0);
if ((~(A1) & ~(A2) & A3 & ~(B1))) (B2 +=> X)=(0, 0);
if ((~(A1) & A2 & ~(A3) & ~(B1))) (B2 +=> X)=(0, 0);
if ((~(A1) & A2 & A3 & ~(B1))) (B2 +=> X)=(0, 0);
if ((A1 & ~(A2) & ~(A3) & ~(B1))) (B2 +=> X)=(0, 0);
if ((A1 & A2 & ~(A3) & ~(B1)) | (A1 & ~(A2) & A3 & ~(B1))) (B2 +=> X)=(0, 0);
if ((A1 & A2 & A3 & ~(B1))) (B2 +=> X)=(0, 0);
if ((~(A1) & ~(A2) & A3 & ~(B2))) (B1 +=> X)=(0, 0);
if ((~(A1) & A2 & ~(A3) & ~(B2))) (B1 +=> X)=(0, 0);
if ((~(A1) & A2 & A3 & ~(B2))) (B1 +=> X)=(0, 0);
if ((A1 & ~(A2) & ~(A3) & ~(B2))) (B1 +=> X)=(0, 0);
if ((A1 & A2 & ~(A3) & ~(B2)) | (A1 & ~(A2) & A3 & ~(B2))) (B1 +=> X)=(0, 0);
if ((A1 & A2 & A3 & ~(B2))) (B1 +=> X)=(0, 0);
if ((~(A1) & ~(A3) & ~(B1) & B2)) (A2 +=> X)=(0, 0);
if ((~(A1) & ~(A3) & B1 & ~(B2))) (A2 +=> X)=(0, 0);
if ((~(A1) & ~(A3) & B1 & B2)) (A2 +=> X)=(0, 0);
if ((~(A2) & ~(A3) & ~(B1) & B2)) (A1 +=> X)=(0, 0);
if ((~(A2) & ~(A3) & B1 & ~(B2))) (A1 +=> X)=(0, 0);
if ((~(A2) & ~(A3) & B1 & B2)) (A1 +=> X)=(0, 0);
endspecify
   `endif

endmodule
`endcelldefine

//%END SVN_OA32_2

//%BEGIN SVN_OA32_4

`celldefine
module SVN_OA32_4 (X, A1, A2, A3, B1, B2);
   output X;
   input A1, A2, A3, B1, B2;

   wire int_res_0, int_res_1;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////

   or (int_res_0, A1, A2, A3);
   or (int_res_1, B1, B2);

   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////

   `ifdef VIRL_functiononly
       and #`SNPS_COMBO_DELAY (X, int_res_0, int_res_1);
   `else
       and (X, int_res_0, int_res_1);
   `endif

   `ifdef VIRL_functiononly

   `else


specify
if ((~(A1) & ~(A2) & ~(B1) & B2)) (A3 +=> X)=(0, 0);
if ((~(A1) & ~(A2) & B1 & ~(B2))) (A3 +=> X)=(0, 0);
if ((~(A1) & ~(A2) & B1 & B2)) (A3 +=> X)=(0, 0);
if ((~(A1) & ~(A2) & A3 & ~(B1))) (B2 +=> X)=(0, 0);
if ((~(A1) & A2 & ~(A3) & ~(B1))) (B2 +=> X)=(0, 0);
if ((~(A1) & A2 & A3 & ~(B1))) (B2 +=> X)=(0, 0);
if ((A1 & ~(A2) & ~(A3) & ~(B1))) (B2 +=> X)=(0, 0);
if ((A1 & A2 & ~(A3) & ~(B1)) | (A1 & ~(A2) & A3 & ~(B1))) (B2 +=> X)=(0, 0);
if ((A1 & A2 & A3 & ~(B1))) (B2 +=> X)=(0, 0);
if ((~(A1) & ~(A2) & A3 & ~(B2))) (B1 +=> X)=(0, 0);
if ((~(A1) & A2 & ~(A3) & ~(B2))) (B1 +=> X)=(0, 0);
if ((~(A1) & A2 & A3 & ~(B2))) (B1 +=> X)=(0, 0);
if ((A1 & ~(A2) & ~(A3) & ~(B2))) (B1 +=> X)=(0, 0);
if ((A1 & A2 & ~(A3) & ~(B2)) | (A1 & ~(A2) & A3 & ~(B2))) (B1 +=> X)=(0, 0);
if ((A1 & A2 & A3 & ~(B2))) (B1 +=> X)=(0, 0);
if ((~(A1) & ~(A3) & ~(B1) & B2)) (A2 +=> X)=(0, 0);
if ((~(A1) & ~(A3) & B1 & ~(B2))) (A2 +=> X)=(0, 0);
if ((~(A1) & ~(A3) & B1 & B2)) (A2 +=> X)=(0, 0);
if ((~(A2) & ~(A3) & ~(B1) & B2)) (A1 +=> X)=(0, 0);
if ((~(A2) & ~(A3) & B1 & ~(B2))) (A1 +=> X)=(0, 0);
if ((~(A2) & ~(A3) & B1 & B2)) (A1 +=> X)=(0, 0);
endspecify
   `endif

endmodule
`endcelldefine

//%END SVN_OA32_4

//%BEGIN SVN_OAI2111_1

`celldefine
module SVN_OAI2111_1 (X, A1, A2, B1, B2, B3);
   output X;
   input A1, A2, B1, B2, B3;

   wire int_res_0;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////

   or (int_res_0, A1, A2);

   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////

   `ifdef VIRL_functiononly
        nand #`SNPS_COMBO_DELAY (X, int_res_0, B1, B2, B3);
   `else
        nand (X, int_res_0, B1, B2, B3);
   `endif

   `ifdef VIRL_functiononly

   `else


specify
(A1 -=> X)=(0, 0);
(A2 -=> X)=(0, 0);
if ((~(A1) & A2 & B1 & B2)) (B3 -=> X)=(0, 0);
if ((A1 & ~(A2) & B1 & B2)) (B3 -=> X)=(0, 0);
if ((A1 & A2 & B1 & B2)) (B3 -=> X)=(0, 0);
if ((~(A1) & A2 & B1 & B3)) (B2 -=> X)=(0, 0);
if ((A1 & ~(A2) & B1 & B3)) (B2 -=> X)=(0, 0);
if ((A1 & A2 & B1 & B3)) (B2 -=> X)=(0, 0);
if ((~(A1) & A2 & B2 & B3)) (B1 -=> X)=(0, 0);
if ((A1 & ~(A2) & B2 & B3)) (B1 -=> X)=(0, 0);
if ((A1 & A2 & B2 & B3)) (B1 -=> X)=(0, 0);
endspecify
   `endif

endmodule
`endcelldefine

//%END SVN_OAI2111_1

//%BEGIN SVN_OAI2111_2

`celldefine
module SVN_OAI2111_2 (X, A1, A2, B1, B2, B3);
   output X;
   input A1, A2, B1, B2, B3;

   wire int_res_0;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////

   or (int_res_0, A1, A2);

   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////

   `ifdef VIRL_functiononly
        nand #`SNPS_COMBO_DELAY (X, int_res_0, B1, B2, B3);
   `else
        nand (X, int_res_0, B1, B2, B3);
   `endif

   `ifdef VIRL_functiononly

   `else


specify
(A1 -=> X)=(0, 0);
(A2 -=> X)=(0, 0);
if ((~(A1) & A2 & B1 & B2)) (B3 -=> X)=(0, 0);
if ((A1 & ~(A2) & B1 & B2)) (B3 -=> X)=(0, 0);
if ((A1 & A2 & B1 & B2)) (B3 -=> X)=(0, 0);
if ((~(A1) & A2 & B1 & B3)) (B2 -=> X)=(0, 0);
if ((A1 & ~(A2) & B1 & B3)) (B2 -=> X)=(0, 0);
if ((A1 & A2 & B1 & B3)) (B2 -=> X)=(0, 0);
if ((~(A1) & A2 & B2 & B3)) (B1 -=> X)=(0, 0);
if ((A1 & ~(A2) & B2 & B3)) (B1 -=> X)=(0, 0);
if ((A1 & A2 & B2 & B3)) (B1 -=> X)=(0, 0);
endspecify
   `endif

endmodule
`endcelldefine

//%END SVN_OAI2111_2

//%BEGIN SVN_OAI2111_4

`celldefine
module SVN_OAI2111_4 (X, A1, A2, B1, B2, B3);
   output X;
   input A1, A2, B1, B2, B3;

   wire int_res_0;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////

   or (int_res_0, A1, A2);

   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////

   `ifdef VIRL_functiononly
        nand #`SNPS_COMBO_DELAY (X, int_res_0, B1, B2, B3);
   `else
        nand (X, int_res_0, B1, B2, B3);
   `endif

   `ifdef VIRL_functiononly

   `else


specify
(A1 -=> X)=(0, 0);
(A2 -=> X)=(0, 0);
if ((~(A1) & A2 & B1 & B2)) (B3 -=> X)=(0, 0);
if ((A1 & ~(A2) & B1 & B2)) (B3 -=> X)=(0, 0);
if ((A1 & A2 & B1 & B2)) (B3 -=> X)=(0, 0);
if ((~(A1) & A2 & B1 & B3)) (B2 -=> X)=(0, 0);
if ((A1 & ~(A2) & B1 & B3)) (B2 -=> X)=(0, 0);
if ((A1 & A2 & B1 & B3)) (B2 -=> X)=(0, 0);
if ((~(A1) & A2 & B2 & B3)) (B1 -=> X)=(0, 0);
if ((A1 & ~(A2) & B2 & B3)) (B1 -=> X)=(0, 0);
if ((A1 & A2 & B2 & B3)) (B1 -=> X)=(0, 0);
endspecify
   `endif

endmodule
`endcelldefine

//%END SVN_OAI2111_4

//%BEGIN SVN_OAI211_0P5

`celldefine
module SVN_OAI211_0P5 (X, A1, A2, B1, B2);
   output X;
   input A1, A2, B1, B2;

   wire int_res_0;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////

   or (int_res_0, A1, A2);

   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////

   `ifdef VIRL_functiononly
        nand #`SNPS_COMBO_DELAY (X, int_res_0, B1, B2);
   `else
        nand (X, int_res_0, B1, B2);
   `endif

   `ifdef VIRL_functiononly

   `else


specify
(A1 -=> X)=(0, 0);
(A2 -=> X)=(0, 0);
if ((~(A1) & A2 & B1)) (B2 -=> X)=(0, 0);
if ((A1 & ~(A2) & B1)) (B2 -=> X)=(0, 0);
if ((A1 & A2 & B1)) (B2 -=> X)=(0, 0);
if ((~(A1) & A2 & B2)) (B1 -=> X)=(0, 0);
if ((A1 & ~(A2) & B2)) (B1 -=> X)=(0, 0);
if ((A1 & A2 & B2)) (B1 -=> X)=(0, 0);
endspecify
   `endif

endmodule
`endcelldefine

//%END SVN_OAI211_0P5

//%BEGIN SVN_OAI211_1

`celldefine
module SVN_OAI211_1 (X, A1, A2, B1, B2);
   output X;
   input A1, A2, B1, B2;

   wire int_res_0;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////

   or (int_res_0, A1, A2);

   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////

   `ifdef VIRL_functiononly
        nand #`SNPS_COMBO_DELAY (X, int_res_0, B1, B2);
   `else
        nand (X, int_res_0, B1, B2);
   `endif

   `ifdef VIRL_functiononly

   `else


specify
(A1 -=> X)=(0, 0);
(A2 -=> X)=(0, 0);
if ((~(A1) & A2 & B1)) (B2 -=> X)=(0, 0);
if ((A1 & ~(A2) & B1)) (B2 -=> X)=(0, 0);
if ((A1 & A2 & B1)) (B2 -=> X)=(0, 0);
if ((~(A1) & A2 & B2)) (B1 -=> X)=(0, 0);
if ((A1 & ~(A2) & B2)) (B1 -=> X)=(0, 0);
if ((A1 & A2 & B2)) (B1 -=> X)=(0, 0);
endspecify
   `endif

endmodule
`endcelldefine

//%END SVN_OAI211_1

//%BEGIN SVN_OAI211_2

`celldefine
module SVN_OAI211_2 (X, A1, A2, B1, B2);
   output X;
   input A1, A2, B1, B2;

   wire int_res_0;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////

   or (int_res_0, A1, A2);

   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////

   `ifdef VIRL_functiononly
        nand #`SNPS_COMBO_DELAY (X, int_res_0, B1, B2);
   `else
        nand (X, int_res_0, B1, B2);
   `endif

   `ifdef VIRL_functiononly

   `else


specify
(A1 -=> X)=(0, 0);
(A2 -=> X)=(0, 0);
if ((~(A1) & A2 & B1)) (B2 -=> X)=(0, 0);
if ((A1 & ~(A2) & B1)) (B2 -=> X)=(0, 0);
if ((A1 & A2 & B1)) (B2 -=> X)=(0, 0);
if ((~(A1) & A2 & B2)) (B1 -=> X)=(0, 0);
if ((A1 & ~(A2) & B2)) (B1 -=> X)=(0, 0);
if ((A1 & A2 & B2)) (B1 -=> X)=(0, 0);
endspecify
   `endif

endmodule
`endcelldefine

//%END SVN_OAI211_2

//%BEGIN SVN_OAI211_3

`celldefine
module SVN_OAI211_3 (X, A1, A2, B1, B2);
   output X;
   input A1, A2, B1, B2;

   wire int_res_0;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////

   or (int_res_0, A1, A2);

   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////

   `ifdef VIRL_functiononly
        nand #`SNPS_COMBO_DELAY (X, int_res_0, B1, B2);
   `else
        nand (X, int_res_0, B1, B2);
   `endif

   `ifdef VIRL_functiononly

   `else


specify
(A1 -=> X)=(0, 0);
(A2 -=> X)=(0, 0);
if ((~(A1) & A2 & B1)) (B2 -=> X)=(0, 0);
if ((A1 & ~(A2) & B1)) (B2 -=> X)=(0, 0);
if ((A1 & A2 & B1)) (B2 -=> X)=(0, 0);
if ((~(A1) & A2 & B2)) (B1 -=> X)=(0, 0);
if ((A1 & ~(A2) & B2)) (B1 -=> X)=(0, 0);
if ((A1 & A2 & B2)) (B1 -=> X)=(0, 0);
endspecify
   `endif

endmodule
`endcelldefine

//%END SVN_OAI211_3

//%BEGIN SVN_OAI211_4

`celldefine
module SVN_OAI211_4 (X, A1, A2, B1, B2);
   output X;
   input A1, A2, B1, B2;

   wire int_res_0;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////

   or (int_res_0, A1, A2);

   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////

   `ifdef VIRL_functiononly
        nand #`SNPS_COMBO_DELAY (X, int_res_0, B1, B2);
   `else
        nand (X, int_res_0, B1, B2);
   `endif

   `ifdef VIRL_functiononly

   `else


specify
(A1 -=> X)=(0, 0);
(A2 -=> X)=(0, 0);
if ((~(A1) & A2 & B1)) (B2 -=> X)=(0, 0);
if ((A1 & ~(A2) & B1)) (B2 -=> X)=(0, 0);
if ((A1 & A2 & B1)) (B2 -=> X)=(0, 0);
if ((~(A1) & A2 & B2)) (B1 -=> X)=(0, 0);
if ((A1 & ~(A2) & B2)) (B1 -=> X)=(0, 0);
if ((A1 & A2 & B2)) (B1 -=> X)=(0, 0);
endspecify
   `endif

endmodule
`endcelldefine

//%END SVN_OAI211_4

//%BEGIN SVN_OAI21_0P5

`celldefine
module SVN_OAI21_0P5 (X, A1, A2, B);
   output X;
   input A1, A2, B;

   wire int_res_0;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////

   or (int_res_0, A1, A2);

   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////

   `ifdef VIRL_functiononly
        nand #`SNPS_COMBO_DELAY (X, int_res_0, B);
   `else
        nand (X, int_res_0, B); 
   `endif
 
   `ifdef VIRL_functiononly

   `else


specify
(A1 -=> X)=(0, 0);
(A2 -=> X)=(0, 0);
if ((~(A1) & A2)) (B -=> X)=(0, 0);
if ((A1 & ~(A2))) (B -=> X)=(0, 0);
if ((A1 & A2)) (B -=> X)=(0, 0);
endspecify
   `endif

endmodule
`endcelldefine

//%END SVN_OAI21_0P5

//%BEGIN SVN_OAI21_1

`celldefine
module SVN_OAI21_1 (X, A1, A2, B);
   output X;
   input A1, A2, B;

   wire int_res_0;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////

   or (int_res_0, A1, A2);

   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////

   `ifdef VIRL_functiononly
        nand #`SNPS_COMBO_DELAY (X, int_res_0, B);
   `else
        nand (X, int_res_0, B); 
   `endif
 
   `ifdef VIRL_functiononly

   `else


specify
(A1 -=> X)=(0, 0);
(A2 -=> X)=(0, 0);
if ((~(A1) & A2)) (B -=> X)=(0, 0);
if ((A1 & ~(A2))) (B -=> X)=(0, 0);
if ((A1 & A2)) (B -=> X)=(0, 0);
endspecify
   `endif

endmodule
`endcelldefine

//%END SVN_OAI21_1

//%BEGIN SVN_OAI21_2

`celldefine
module SVN_OAI21_2 (X, A1, A2, B);
   output X;
   input A1, A2, B;

   wire int_res_0;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////

   or (int_res_0, A1, A2);

   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////

   `ifdef VIRL_functiononly
        nand #`SNPS_COMBO_DELAY (X, int_res_0, B);
   `else
        nand (X, int_res_0, B); 
   `endif
 
   `ifdef VIRL_functiononly

   `else


specify
(A1 -=> X)=(0, 0);
(A2 -=> X)=(0, 0);
if ((~(A1) & A2)) (B -=> X)=(0, 0);
if ((A1 & ~(A2))) (B -=> X)=(0, 0);
if ((A1 & A2)) (B -=> X)=(0, 0);
endspecify
   `endif

endmodule
`endcelldefine

//%END SVN_OAI21_2

//%BEGIN SVN_OAI21_3

`celldefine
module SVN_OAI21_3 (X, A1, A2, B);
   output X;
   input A1, A2, B;

   wire int_res_0;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////

   or (int_res_0, A1, A2);

   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////

   `ifdef VIRL_functiononly
        nand #`SNPS_COMBO_DELAY (X, int_res_0, B);
   `else
        nand (X, int_res_0, B); 
   `endif
 
   `ifdef VIRL_functiononly

   `else


specify
(A1 -=> X)=(0, 0);
(A2 -=> X)=(0, 0);
if ((~(A1) & A2)) (B -=> X)=(0, 0);
if ((A1 & ~(A2))) (B -=> X)=(0, 0);
if ((A1 & A2)) (B -=> X)=(0, 0);
endspecify
   `endif

endmodule
`endcelldefine

//%END SVN_OAI21_3

//%BEGIN SVN_OAI21_4

`celldefine
module SVN_OAI21_4 (X, A1, A2, B);
   output X;
   input A1, A2, B;

   wire int_res_0;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////

   or (int_res_0, A1, A2);

   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////

   `ifdef VIRL_functiononly
        nand #`SNPS_COMBO_DELAY (X, int_res_0, B);
   `else
        nand (X, int_res_0, B); 
   `endif
 
   `ifdef VIRL_functiononly

   `else


specify
(A1 -=> X)=(0, 0);
(A2 -=> X)=(0, 0);
if ((~(A1) & A2)) (B -=> X)=(0, 0);
if ((A1 & ~(A2))) (B -=> X)=(0, 0);
if ((A1 & A2)) (B -=> X)=(0, 0);
endspecify
   `endif

endmodule
`endcelldefine

//%END SVN_OAI21_4

//%BEGIN SVN_OAI21B_1

`celldefine
module SVN_OAI21B_1 (X, A1, A2, B);
   output X;
   input A1, A2, B;

   wire int_res_0, int_res_1;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////

   or (int_res_0, A1, A2);
   not (int_res_1, B);

   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////

   `ifdef VIRL_functiononly
        nand #`SNPS_COMBO_DELAY (X, int_res_0, int_res_1);
   `else
        nand (X, int_res_0, int_res_1);
   `endif

   `ifdef VIRL_functiononly

   `else


specify
(A1 -=> X)=(0, 0);
(A2 -=> X)=(0, 0);
if ((~(A1) & A2)) (B +=> X)=(0, 0);
if ((A1 & ~(A2))) (B +=> X)=(0, 0);
if ((A1 & A2)) (B +=> X)=(0, 0);
endspecify
   `endif

endmodule
`endcelldefine

//%END SVN_OAI21B_1

//%BEGIN SVN_OAI21B_2

`celldefine
module SVN_OAI21B_2 (X, A1, A2, B);
   output X;
   input A1, A2, B;

   wire int_res_0, int_res_1;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////

   or (int_res_0, A1, A2);
   not (int_res_1, B);

   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////

   `ifdef VIRL_functiononly
        nand #`SNPS_COMBO_DELAY (X, int_res_0, int_res_1);
   `else
        nand (X, int_res_0, int_res_1);
   `endif

   `ifdef VIRL_functiononly

   `else


specify
(A1 -=> X)=(0, 0);
(A2 -=> X)=(0, 0);
if ((~(A1) & A2)) (B +=> X)=(0, 0);
if ((A1 & ~(A2))) (B +=> X)=(0, 0);
if ((A1 & A2)) (B +=> X)=(0, 0);
endspecify
   `endif

endmodule
`endcelldefine

//%END SVN_OAI21B_2

//%BEGIN SVN_OAI21B_3

`celldefine
module SVN_OAI21B_3 (X, A1, A2, B);
   output X;
   input A1, A2, B;

   wire int_res_0, int_res_1;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////

   or (int_res_0, A1, A2);
   not (int_res_1, B);

   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////

   `ifdef VIRL_functiononly
        nand #`SNPS_COMBO_DELAY (X, int_res_0, int_res_1);
   `else
        nand (X, int_res_0, int_res_1);
   `endif

   `ifdef VIRL_functiononly

   `else


specify
(A1 -=> X)=(0, 0);
(A2 -=> X)=(0, 0);
if ((~(A1) & A2)) (B +=> X)=(0, 0);
if ((A1 & ~(A2))) (B +=> X)=(0, 0);
if ((A1 & A2)) (B +=> X)=(0, 0);
endspecify
   `endif

endmodule
`endcelldefine

//%END SVN_OAI21B_3

//%BEGIN SVN_OAI21B_4

`celldefine
module SVN_OAI21B_4 (X, A1, A2, B);
   output X;
   input A1, A2, B;

   wire int_res_0, int_res_1;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////

   or (int_res_0, A1, A2);
   not (int_res_1, B);

   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////

   `ifdef VIRL_functiononly
        nand #`SNPS_COMBO_DELAY (X, int_res_0, int_res_1);
   `else
        nand (X, int_res_0, int_res_1);
   `endif

   `ifdef VIRL_functiononly

   `else


specify
(A1 -=> X)=(0, 0);
(A2 -=> X)=(0, 0);
if ((~(A1) & A2)) (B +=> X)=(0, 0);
if ((A1 & ~(A2))) (B +=> X)=(0, 0);
if ((A1 & A2)) (B +=> X)=(0, 0);
endspecify
   `endif

endmodule
`endcelldefine

//%END SVN_OAI21B_4

//%BEGIN SVN_OAI221_1

`celldefine
module SVN_OAI221_1 (X, A1, A2, B1, B2, C);
   output X;
   input A1, A2, B1, B2, C;

   wire int_res_0, int_res_1;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////

   or (int_res_0, A1, A2);
   or (int_res_1, B1, B2);

   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////

   `ifdef VIRL_functiononly
      nand #`SNPS_COMBO_DELAY (X, int_res_0, int_res_1, C);
   `else
      nand (X, int_res_0, int_res_1, C);
   `endif
   
   `ifdef VIRL_functiononly

   `else


specify
if ((~(A1) & ~(B1) & B2 & C)) (A2 -=> X)=(0, 0);
if ((~(A1) & B1 & ~(B2) & C)) (A2 -=> X)=(0, 0);
if ((~(A1) & B1 & B2 & C)) (A2 -=> X)=(0, 0);
if ((~(A1) & A2 & ~(B1) & B2)) (C -=> X)=(0, 0);
if ((~(A1) & A2 & B1 & ~(B2))) (C -=> X)=(0, 0);
if ((~(A1) & A2 & B1 & B2)) (C -=> X)=(0, 0);
if ((A1 & ~(A2) & ~(B1) & B2)) (C -=> X)=(0, 0);
if ((A1 & ~(A2) & B1 & ~(B2))) (C -=> X)=(0, 0);
if ((A1 & A2 & ~(B1) & B2)) (C -=> X)=(0, 0);
if ((A1 & A2 & B1 & ~(B2)) | (A1 & ~(A2) & B1 & B2)) (C -=> X)=(0, 0);
if ((A1 & A2 & B1 & B2)) (C -=> X)=(0, 0);
if ((~(A1) & A2 & ~(B1) & C)) (B2 -=> X)=(0, 0);
if ((A1 & ~(A2) & ~(B1) & C)) (B2 -=> X)=(0, 0);
if ((A1 & A2 & ~(B1) & C)) (B2 -=> X)=(0, 0);
if ((~(A1) & A2 & ~(B2) & C)) (B1 -=> X)=(0, 0);
if ((A1 & ~(A2) & ~(B2) & C)) (B1 -=> X)=(0, 0);
if ((A1 & A2 & ~(B2) & C)) (B1 -=> X)=(0, 0);
if ((~(A2) & ~(B1) & B2 & C)) (A1 -=> X)=(0, 0);
if ((~(A2) & B1 & ~(B2) & C)) (A1 -=> X)=(0, 0);
if ((~(A2) & B1 & B2 & C)) (A1 -=> X)=(0, 0);
endspecify
   `endif

endmodule
`endcelldefine

//%END SVN_OAI221_1

//%BEGIN SVN_OAI221_2

`celldefine
module SVN_OAI221_2 (X, A1, A2, B1, B2, C);
   output X;
   input A1, A2, B1, B2, C;

   wire int_res_0, int_res_1;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////

   or (int_res_0, A1, A2);
   or (int_res_1, B1, B2);

   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////

   `ifdef VIRL_functiononly
      nand #`SNPS_COMBO_DELAY (X, int_res_0, int_res_1, C);
   `else
      nand (X, int_res_0, int_res_1, C);
   `endif
   
   `ifdef VIRL_functiononly

   `else


specify
if ((~(A1) & ~(B1) & B2 & C)) (A2 -=> X)=(0, 0);
if ((~(A1) & B1 & ~(B2) & C)) (A2 -=> X)=(0, 0);
if ((~(A1) & B1 & B2 & C)) (A2 -=> X)=(0, 0);
if ((~(A1) & A2 & ~(B1) & B2)) (C -=> X)=(0, 0);
if ((~(A1) & A2 & B1 & ~(B2))) (C -=> X)=(0, 0);
if ((~(A1) & A2 & B1 & B2)) (C -=> X)=(0, 0);
if ((A1 & ~(A2) & ~(B1) & B2)) (C -=> X)=(0, 0);
if ((A1 & ~(A2) & B1 & ~(B2))) (C -=> X)=(0, 0);
if ((A1 & A2 & ~(B1) & B2)) (C -=> X)=(0, 0);
if ((A1 & A2 & B1 & ~(B2)) | (A1 & ~(A2) & B1 & B2)) (C -=> X)=(0, 0);
if ((A1 & A2 & B1 & B2)) (C -=> X)=(0, 0);
if ((~(A1) & A2 & ~(B1) & C)) (B2 -=> X)=(0, 0);
if ((A1 & ~(A2) & ~(B1) & C)) (B2 -=> X)=(0, 0);
if ((A1 & A2 & ~(B1) & C)) (B2 -=> X)=(0, 0);
if ((~(A1) & A2 & ~(B2) & C)) (B1 -=> X)=(0, 0);
if ((A1 & ~(A2) & ~(B2) & C)) (B1 -=> X)=(0, 0);
if ((A1 & A2 & ~(B2) & C)) (B1 -=> X)=(0, 0);
if ((~(A2) & ~(B1) & B2 & C)) (A1 -=> X)=(0, 0);
if ((~(A2) & B1 & ~(B2) & C)) (A1 -=> X)=(0, 0);
if ((~(A2) & B1 & B2 & C)) (A1 -=> X)=(0, 0);
endspecify
   `endif

endmodule
`endcelldefine

//%END SVN_OAI221_2

//%BEGIN SVN_OAI221_4

`celldefine
module SVN_OAI221_4 (X, A1, A2, B1, B2, C);
   output X;
   input A1, A2, B1, B2, C;

   wire int_res_0, int_res_1;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////

   or (int_res_0, A1, A2);
   or (int_res_1, B1, B2);

   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////

   `ifdef VIRL_functiononly
      nand #`SNPS_COMBO_DELAY (X, int_res_0, int_res_1, C);
   `else
      nand (X, int_res_0, int_res_1, C);
   `endif
   
   `ifdef VIRL_functiononly

   `else


specify
if ((~(A1) & ~(B1) & B2 & C)) (A2 -=> X)=(0, 0);
if ((~(A1) & B1 & ~(B2) & C)) (A2 -=> X)=(0, 0);
if ((~(A1) & B1 & B2 & C)) (A2 -=> X)=(0, 0);
if ((~(A1) & A2 & ~(B1) & B2)) (C -=> X)=(0, 0);
if ((~(A1) & A2 & B1 & ~(B2))) (C -=> X)=(0, 0);
if ((~(A1) & A2 & B1 & B2)) (C -=> X)=(0, 0);
if ((A1 & ~(A2) & ~(B1) & B2)) (C -=> X)=(0, 0);
if ((A1 & ~(A2) & B1 & ~(B2))) (C -=> X)=(0, 0);
if ((A1 & A2 & ~(B1) & B2)) (C -=> X)=(0, 0);
if ((A1 & A2 & B1 & ~(B2)) | (A1 & ~(A2) & B1 & B2)) (C -=> X)=(0, 0);
if ((A1 & A2 & B1 & B2)) (C -=> X)=(0, 0);
if ((~(A1) & A2 & ~(B1) & C)) (B2 -=> X)=(0, 0);
if ((A1 & ~(A2) & ~(B1) & C)) (B2 -=> X)=(0, 0);
if ((A1 & A2 & ~(B1) & C)) (B2 -=> X)=(0, 0);
if ((~(A1) & A2 & ~(B2) & C)) (B1 -=> X)=(0, 0);
if ((A1 & ~(A2) & ~(B2) & C)) (B1 -=> X)=(0, 0);
if ((A1 & A2 & ~(B2) & C)) (B1 -=> X)=(0, 0);
if ((~(A2) & ~(B1) & B2 & C)) (A1 -=> X)=(0, 0);
if ((~(A2) & B1 & ~(B2) & C)) (A1 -=> X)=(0, 0);
if ((~(A2) & B1 & B2 & C)) (A1 -=> X)=(0, 0);
endspecify
   `endif

endmodule
`endcelldefine

//%END SVN_OAI221_4

//%BEGIN SVN_OAI222_1

`celldefine
module SVN_OAI222_1 (X, A1, A2, B1, B2, C1, C2);
   output X;
   input A1, A2, B1, B2, C1, C2;

   wire int_res_0, int_res_1, int_res_2;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////

   or (int_res_0, A1, A2);
   or (int_res_1, B1, B2);
   or (int_res_2, C1, C2);

   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////

   `ifdef VIRL_functiononly
      nand #`SNPS_COMBO_DELAY (X, int_res_0, int_res_1, int_res_2);
   `else
      nand (X, int_res_0, int_res_1, int_res_2);
   `endif

   `ifdef VIRL_functiononly

   `else


specify
if ((~(A1) & ~(B1) & B2 & ~(C1) & C2)) (A2 -=> X)=(0, 0);
if ((~(A1) & ~(B1) & B2 & C1 & ~(C2))) (A2 -=> X)=(0, 0);
if ((~(A1) & ~(B1) & B2 & C1 & C2)) (A2 -=> X)=(0, 0);
if ((~(A1) & B1 & ~(B2) & ~(C1) & C2)) (A2 -=> X)=(0, 0);
if ((~(A1) & B1 & ~(B2) & C1 & ~(C2))) (A2 -=> X)=(0, 0);
if ((~(A1) & B1 & ~(B2) & C1 & C2)) (A2 -=> X)=(0, 0);
if ((~(A1) & B1 & B2 & ~(C1) & C2)) (A2 -=> X)=(0, 0);
if ((~(A1) & B1 & B2 & C1 & ~(C2))) (A2 -=> X)=(0, 0);
if ((~(A1) & B1 & B2 & C1 & C2)) (A2 -=> X)=(0, 0);
if ((~(A1) & A2 & ~(B1) & ~(C1) & C2)) (B2 -=> X)=(0, 0);
if ((~(A1) & A2 & ~(B1) & C1 & ~(C2))) (B2 -=> X)=(0, 0);
if ((~(A1) & A2 & ~(B1) & C1 & C2)) (B2 -=> X)=(0, 0);
if ((A1 & ~(A2) & ~(B1) & ~(C1) & C2)) (B2 -=> X)=(0, 0);
if ((A1 & ~(A2) & ~(B1) & C1 & ~(C2))) (B2 -=> X)=(0, 0);
if ((A1 & ~(A2) & ~(B1) & C1 & C2)) (B2 -=> X)=(0, 0);
if ((A1 & A2 & ~(B1) & ~(C1) & C2)) (B2 -=> X)=(0, 0);
if ((A1 & A2 & ~(B1) & C1 & ~(C2))) (B2 -=> X)=(0, 0);
if ((A1 & A2 & ~(B1) & C1 & C2)) (B2 -=> X)=(0, 0);
if ((~(A1) & A2 & ~(B1) & B2 & ~(C1))) (C2 -=> X)=(0, 0);
if ((~(A1) & A2 & B1 & ~(B2) & ~(C1))) (C2 -=> X)=(0, 0);
if ((~(A1) & A2 & B1 & B2 & ~(C1))) (C2 -=> X)=(0, 0);
if ((A1 & ~(A2) & ~(B1) & B2 & ~(C1))) (C2 -=> X)=(0, 0);
if ((A1 & ~(A2) & B1 & ~(B2) & ~(C1))) (C2 -=> X)=(0, 0);
if ((A1 & A2 & ~(B1) & B2 & ~(C1))) (C2 -=> X)=(0, 0);
if ((A1 & A2 & B1 & ~(B2) & ~(C1)) | (A1 & ~(A2) & B1 & B2 & ~(C1))) (C2 -=> X)=(0, 0);
if ((A1 & A2 & B1 & B2 & ~(C1))) (C2 -=> X)=(0, 0);
if ((~(A1) & A2 & ~(B1) & B2 & ~(C2))) (C1 -=> X)=(0, 0);
if ((~(A1) & A2 & B1 & ~(B2) & ~(C2))) (C1 -=> X)=(0, 0);
if ((~(A1) & A2 & B1 & B2 & ~(C2))) (C1 -=> X)=(0, 0);
if ((A1 & ~(A2) & ~(B1) & B2 & ~(C2))) (C1 -=> X)=(0, 0);
if ((A1 & ~(A2) & B1 & ~(B2) & ~(C2))) (C1 -=> X)=(0, 0);
if ((A1 & A2 & ~(B1) & B2 & ~(C2))) (C1 -=> X)=(0, 0);
if ((A1 & A2 & B1 & ~(B2) & ~(C2)) | (A1 & ~(A2) & B1 & B2 & ~(C2))) (C1 -=> X)=(0, 0);
if ((A1 & A2 & B1 & B2 & ~(C2))) (C1 -=> X)=(0, 0);
if ((~(A1) & A2 & ~(B2) & ~(C1) & C2)) (B1 -=> X)=(0, 0);
if ((~(A1) & A2 & ~(B2) & C1 & ~(C2))) (B1 -=> X)=(0, 0);
if ((~(A1) & A2 & ~(B2) & C1 & C2)) (B1 -=> X)=(0, 0);
if ((A1 & ~(A2) & ~(B2) & ~(C1) & C2)) (B1 -=> X)=(0, 0);
if ((A1 & ~(A2) & ~(B2) & C1 & ~(C2))) (B1 -=> X)=(0, 0);
if ((A1 & ~(A2) & ~(B2) & C1 & C2)) (B1 -=> X)=(0, 0);
if ((A1 & A2 & ~(B2) & ~(C1) & C2)) (B1 -=> X)=(0, 0);
if ((A1 & A2 & ~(B2) & C1 & ~(C2))) (B1 -=> X)=(0, 0);
if ((A1 & A2 & ~(B2) & C1 & C2)) (B1 -=> X)=(0, 0);
if ((~(A2) & ~(B1) & B2 & ~(C1) & C2)) (A1 -=> X)=(0, 0);
if ((~(A2) & ~(B1) & B2 & C1 & ~(C2))) (A1 -=> X)=(0, 0);
if ((~(A2) & ~(B1) & B2 & C1 & C2)) (A1 -=> X)=(0, 0);
if ((~(A2) & B1 & ~(B2) & ~(C1) & C2)) (A1 -=> X)=(0, 0);
if ((~(A2) & B1 & ~(B2) & C1 & ~(C2))) (A1 -=> X)=(0, 0);
if ((~(A2) & B1 & ~(B2) & C1 & C2)) (A1 -=> X)=(0, 0);
if ((~(A2) & B1 & B2 & ~(C1) & C2)) (A1 -=> X)=(0, 0);
if ((~(A2) & B1 & B2 & C1 & ~(C2))) (A1 -=> X)=(0, 0);
if ((~(A2) & B1 & B2 & C1 & C2)) (A1 -=> X)=(0, 0);
endspecify
   `endif

endmodule
`endcelldefine

//%END SVN_OAI222_1

//%BEGIN SVN_OAI222_2

`celldefine
module SVN_OAI222_2 (X, A1, A2, B1, B2, C1, C2);
   output X;
   input A1, A2, B1, B2, C1, C2;

   wire int_res_0, int_res_1, int_res_2;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////

   or (int_res_0, A1, A2);
   or (int_res_1, B1, B2);
   or (int_res_2, C1, C2);

   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////

   `ifdef VIRL_functiononly
      nand #`SNPS_COMBO_DELAY (X, int_res_0, int_res_1, int_res_2);
   `else
      nand (X, int_res_0, int_res_1, int_res_2);
   `endif

   `ifdef VIRL_functiononly

   `else


specify
if ((~(A1) & ~(B1) & B2 & ~(C1) & C2)) (A2 -=> X)=(0, 0);
if ((~(A1) & ~(B1) & B2 & C1 & ~(C2))) (A2 -=> X)=(0, 0);
if ((~(A1) & ~(B1) & B2 & C1 & C2)) (A2 -=> X)=(0, 0);
if ((~(A1) & B1 & ~(B2) & ~(C1) & C2)) (A2 -=> X)=(0, 0);
if ((~(A1) & B1 & ~(B2) & C1 & ~(C2))) (A2 -=> X)=(0, 0);
if ((~(A1) & B1 & ~(B2) & C1 & C2)) (A2 -=> X)=(0, 0);
if ((~(A1) & B1 & B2 & ~(C1) & C2)) (A2 -=> X)=(0, 0);
if ((~(A1) & B1 & B2 & C1 & ~(C2))) (A2 -=> X)=(0, 0);
if ((~(A1) & B1 & B2 & C1 & C2)) (A2 -=> X)=(0, 0);
if ((~(A1) & A2 & ~(B1) & ~(C1) & C2)) (B2 -=> X)=(0, 0);
if ((~(A1) & A2 & ~(B1) & C1 & ~(C2))) (B2 -=> X)=(0, 0);
if ((~(A1) & A2 & ~(B1) & C1 & C2)) (B2 -=> X)=(0, 0);
if ((A1 & ~(A2) & ~(B1) & ~(C1) & C2)) (B2 -=> X)=(0, 0);
if ((A1 & ~(A2) & ~(B1) & C1 & ~(C2))) (B2 -=> X)=(0, 0);
if ((A1 & ~(A2) & ~(B1) & C1 & C2)) (B2 -=> X)=(0, 0);
if ((A1 & A2 & ~(B1) & ~(C1) & C2)) (B2 -=> X)=(0, 0);
if ((A1 & A2 & ~(B1) & C1 & ~(C2))) (B2 -=> X)=(0, 0);
if ((A1 & A2 & ~(B1) & C1 & C2)) (B2 -=> X)=(0, 0);
if ((~(A1) & A2 & ~(B1) & B2 & ~(C1))) (C2 -=> X)=(0, 0);
if ((~(A1) & A2 & B1 & ~(B2) & ~(C1))) (C2 -=> X)=(0, 0);
if ((~(A1) & A2 & B1 & B2 & ~(C1))) (C2 -=> X)=(0, 0);
if ((A1 & ~(A2) & ~(B1) & B2 & ~(C1))) (C2 -=> X)=(0, 0);
if ((A1 & ~(A2) & B1 & ~(B2) & ~(C1))) (C2 -=> X)=(0, 0);
if ((A1 & A2 & ~(B1) & B2 & ~(C1))) (C2 -=> X)=(0, 0);
if ((A1 & A2 & B1 & ~(B2) & ~(C1)) | (A1 & ~(A2) & B1 & B2 & ~(C1))) (C2 -=> X)=(0, 0);
if ((A1 & A2 & B1 & B2 & ~(C1))) (C2 -=> X)=(0, 0);
if ((~(A1) & A2 & ~(B1) & B2 & ~(C2))) (C1 -=> X)=(0, 0);
if ((~(A1) & A2 & B1 & ~(B2) & ~(C2))) (C1 -=> X)=(0, 0);
if ((~(A1) & A2 & B1 & B2 & ~(C2))) (C1 -=> X)=(0, 0);
if ((A1 & ~(A2) & ~(B1) & B2 & ~(C2))) (C1 -=> X)=(0, 0);
if ((A1 & ~(A2) & B1 & ~(B2) & ~(C2))) (C1 -=> X)=(0, 0);
if ((A1 & A2 & ~(B1) & B2 & ~(C2))) (C1 -=> X)=(0, 0);
if ((A1 & A2 & B1 & ~(B2) & ~(C2)) | (A1 & ~(A2) & B1 & B2 & ~(C2))) (C1 -=> X)=(0, 0);
if ((A1 & A2 & B1 & B2 & ~(C2))) (C1 -=> X)=(0, 0);
if ((~(A1) & A2 & ~(B2) & ~(C1) & C2)) (B1 -=> X)=(0, 0);
if ((~(A1) & A2 & ~(B2) & C1 & ~(C2))) (B1 -=> X)=(0, 0);
if ((~(A1) & A2 & ~(B2) & C1 & C2)) (B1 -=> X)=(0, 0);
if ((A1 & ~(A2) & ~(B2) & ~(C1) & C2)) (B1 -=> X)=(0, 0);
if ((A1 & ~(A2) & ~(B2) & C1 & ~(C2))) (B1 -=> X)=(0, 0);
if ((A1 & ~(A2) & ~(B2) & C1 & C2)) (B1 -=> X)=(0, 0);
if ((A1 & A2 & ~(B2) & ~(C1) & C2)) (B1 -=> X)=(0, 0);
if ((A1 & A2 & ~(B2) & C1 & ~(C2))) (B1 -=> X)=(0, 0);
if ((A1 & A2 & ~(B2) & C1 & C2)) (B1 -=> X)=(0, 0);
if ((~(A2) & ~(B1) & B2 & ~(C1) & C2)) (A1 -=> X)=(0, 0);
if ((~(A2) & ~(B1) & B2 & C1 & ~(C2))) (A1 -=> X)=(0, 0);
if ((~(A2) & ~(B1) & B2 & C1 & C2)) (A1 -=> X)=(0, 0);
if ((~(A2) & B1 & ~(B2) & ~(C1) & C2)) (A1 -=> X)=(0, 0);
if ((~(A2) & B1 & ~(B2) & C1 & ~(C2))) (A1 -=> X)=(0, 0);
if ((~(A2) & B1 & ~(B2) & C1 & C2)) (A1 -=> X)=(0, 0);
if ((~(A2) & B1 & B2 & ~(C1) & C2)) (A1 -=> X)=(0, 0);
if ((~(A2) & B1 & B2 & C1 & ~(C2))) (A1 -=> X)=(0, 0);
if ((~(A2) & B1 & B2 & C1 & C2)) (A1 -=> X)=(0, 0);
endspecify
   `endif

endmodule
`endcelldefine

//%END SVN_OAI222_2

//%BEGIN SVN_OAI222_4

`celldefine
module SVN_OAI222_4 (X, A1, A2, B1, B2, C1, C2);
   output X;
   input A1, A2, B1, B2, C1, C2;

   wire int_res_0, int_res_1, int_res_2;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////

   or (int_res_0, A1, A2);
   or (int_res_1, B1, B2);
   or (int_res_2, C1, C2);

   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////

   `ifdef VIRL_functiononly
      nand #`SNPS_COMBO_DELAY (X, int_res_0, int_res_1, int_res_2);
   `else
      nand (X, int_res_0, int_res_1, int_res_2);
   `endif

   `ifdef VIRL_functiononly

   `else


specify
if ((~(A1) & ~(B1) & B2 & ~(C1) & C2)) (A2 -=> X)=(0, 0);
if ((~(A1) & ~(B1) & B2 & C1 & ~(C2))) (A2 -=> X)=(0, 0);
if ((~(A1) & ~(B1) & B2 & C1 & C2)) (A2 -=> X)=(0, 0);
if ((~(A1) & B1 & ~(B2) & ~(C1) & C2)) (A2 -=> X)=(0, 0);
if ((~(A1) & B1 & ~(B2) & C1 & ~(C2))) (A2 -=> X)=(0, 0);
if ((~(A1) & B1 & ~(B2) & C1 & C2)) (A2 -=> X)=(0, 0);
if ((~(A1) & B1 & B2 & ~(C1) & C2)) (A2 -=> X)=(0, 0);
if ((~(A1) & B1 & B2 & C1 & ~(C2))) (A2 -=> X)=(0, 0);
if ((~(A1) & B1 & B2 & C1 & C2)) (A2 -=> X)=(0, 0);
if ((~(A1) & A2 & ~(B1) & ~(C1) & C2)) (B2 -=> X)=(0, 0);
if ((~(A1) & A2 & ~(B1) & C1 & ~(C2))) (B2 -=> X)=(0, 0);
if ((~(A1) & A2 & ~(B1) & C1 & C2)) (B2 -=> X)=(0, 0);
if ((A1 & ~(A2) & ~(B1) & ~(C1) & C2)) (B2 -=> X)=(0, 0);
if ((A1 & ~(A2) & ~(B1) & C1 & ~(C2))) (B2 -=> X)=(0, 0);
if ((A1 & ~(A2) & ~(B1) & C1 & C2)) (B2 -=> X)=(0, 0);
if ((A1 & A2 & ~(B1) & ~(C1) & C2)) (B2 -=> X)=(0, 0);
if ((A1 & A2 & ~(B1) & C1 & ~(C2))) (B2 -=> X)=(0, 0);
if ((A1 & A2 & ~(B1) & C1 & C2)) (B2 -=> X)=(0, 0);
if ((~(A1) & A2 & ~(B1) & B2 & ~(C1))) (C2 -=> X)=(0, 0);
if ((~(A1) & A2 & B1 & ~(B2) & ~(C1))) (C2 -=> X)=(0, 0);
if ((~(A1) & A2 & B1 & B2 & ~(C1))) (C2 -=> X)=(0, 0);
if ((A1 & ~(A2) & ~(B1) & B2 & ~(C1))) (C2 -=> X)=(0, 0);
if ((A1 & ~(A2) & B1 & ~(B2) & ~(C1))) (C2 -=> X)=(0, 0);
if ((A1 & A2 & ~(B1) & B2 & ~(C1))) (C2 -=> X)=(0, 0);
if ((A1 & A2 & B1 & ~(B2) & ~(C1)) | (A1 & ~(A2) & B1 & B2 & ~(C1))) (C2 -=> X)=(0, 0);
if ((A1 & A2 & B1 & B2 & ~(C1))) (C2 -=> X)=(0, 0);
if ((~(A1) & A2 & ~(B1) & B2 & ~(C2))) (C1 -=> X)=(0, 0);
if ((~(A1) & A2 & B1 & ~(B2) & ~(C2))) (C1 -=> X)=(0, 0);
if ((~(A1) & A2 & B1 & B2 & ~(C2))) (C1 -=> X)=(0, 0);
if ((A1 & ~(A2) & ~(B1) & B2 & ~(C2))) (C1 -=> X)=(0, 0);
if ((A1 & ~(A2) & B1 & ~(B2) & ~(C2))) (C1 -=> X)=(0, 0);
if ((A1 & A2 & ~(B1) & B2 & ~(C2))) (C1 -=> X)=(0, 0);
if ((A1 & A2 & B1 & ~(B2) & ~(C2)) | (A1 & ~(A2) & B1 & B2 & ~(C2))) (C1 -=> X)=(0, 0);
if ((A1 & A2 & B1 & B2 & ~(C2))) (C1 -=> X)=(0, 0);
if ((~(A1) & A2 & ~(B2) & ~(C1) & C2)) (B1 -=> X)=(0, 0);
if ((~(A1) & A2 & ~(B2) & C1 & ~(C2))) (B1 -=> X)=(0, 0);
if ((~(A1) & A2 & ~(B2) & C1 & C2)) (B1 -=> X)=(0, 0);
if ((A1 & ~(A2) & ~(B2) & ~(C1) & C2)) (B1 -=> X)=(0, 0);
if ((A1 & ~(A2) & ~(B2) & C1 & ~(C2))) (B1 -=> X)=(0, 0);
if ((A1 & ~(A2) & ~(B2) & C1 & C2)) (B1 -=> X)=(0, 0);
if ((A1 & A2 & ~(B2) & ~(C1) & C2)) (B1 -=> X)=(0, 0);
if ((A1 & A2 & ~(B2) & C1 & ~(C2))) (B1 -=> X)=(0, 0);
if ((A1 & A2 & ~(B2) & C1 & C2)) (B1 -=> X)=(0, 0);
if ((~(A2) & ~(B1) & B2 & ~(C1) & C2)) (A1 -=> X)=(0, 0);
if ((~(A2) & ~(B1) & B2 & C1 & ~(C2))) (A1 -=> X)=(0, 0);
if ((~(A2) & ~(B1) & B2 & C1 & C2)) (A1 -=> X)=(0, 0);
if ((~(A2) & B1 & ~(B2) & ~(C1) & C2)) (A1 -=> X)=(0, 0);
if ((~(A2) & B1 & ~(B2) & C1 & ~(C2))) (A1 -=> X)=(0, 0);
if ((~(A2) & B1 & ~(B2) & C1 & C2)) (A1 -=> X)=(0, 0);
if ((~(A2) & B1 & B2 & ~(C1) & C2)) (A1 -=> X)=(0, 0);
if ((~(A2) & B1 & B2 & C1 & ~(C2))) (A1 -=> X)=(0, 0);
if ((~(A2) & B1 & B2 & C1 & C2)) (A1 -=> X)=(0, 0);
endspecify
   `endif

endmodule
`endcelldefine

//%END SVN_OAI222_4

//%BEGIN SVN_OAI22_0P5

`celldefine
module SVN_OAI22_0P5 (X, A1, A2, B1, B2);
   output X;
   input A1, A2, B1, B2;

   wire int_res_0, int_res_1;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////

   or (int_res_0, A1, A2);
   or (int_res_1, B1, B2);

   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////

   `ifdef VIRL_functiononly
         nand #`SNPS_COMBO_DELAY (X, int_res_0, int_res_1);
   `else
         nand (X, int_res_0, int_res_1);
   `endif

   `ifdef VIRL_functiononly

   `else


specify
if ((~(A1) & ~(B1) & B2)) (A2 -=> X)=(0, 0);
if ((~(A1) & B1 & ~(B2))) (A2 -=> X)=(0, 0);
if ((~(A1) & B1 & B2)) (A2 -=> X)=(0, 0);
if ((~(A1) & A2 & ~(B1))) (B2 -=> X)=(0, 0);
if ((A1 & ~(A2) & ~(B1))) (B2 -=> X)=(0, 0);
if ((A1 & A2 & ~(B1))) (B2 -=> X)=(0, 0);
if ((~(A1) & A2 & ~(B2))) (B1 -=> X)=(0, 0);
if ((A1 & ~(A2) & ~(B2))) (B1 -=> X)=(0, 0);
if ((A1 & A2 & ~(B2))) (B1 -=> X)=(0, 0);
if ((~(A2) & ~(B1) & B2)) (A1 -=> X)=(0, 0);
if ((~(A2) & B1 & ~(B2))) (A1 -=> X)=(0, 0);
if ((~(A2) & B1 & B2)) (A1 -=> X)=(0, 0);
endspecify
  `endif

endmodule
`endcelldefine

//%END SVN_OAI22_0P5

//%BEGIN SVN_OAI22_1

`celldefine
module SVN_OAI22_1 (X, A1, A2, B1, B2);
   output X;
   input A1, A2, B1, B2;

   wire int_res_0, int_res_1;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////

   or (int_res_0, A1, A2);
   or (int_res_1, B1, B2);

   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////

   `ifdef VIRL_functiononly
         nand #`SNPS_COMBO_DELAY (X, int_res_0, int_res_1);
   `else
         nand (X, int_res_0, int_res_1);
   `endif

   `ifdef VIRL_functiononly

   `else


specify
if ((~(A1) & ~(B1) & B2)) (A2 -=> X)=(0, 0);
if ((~(A1) & B1 & ~(B2))) (A2 -=> X)=(0, 0);
if ((~(A1) & B1 & B2)) (A2 -=> X)=(0, 0);
if ((~(A1) & A2 & ~(B1))) (B2 -=> X)=(0, 0);
if ((A1 & ~(A2) & ~(B1))) (B2 -=> X)=(0, 0);
if ((A1 & A2 & ~(B1))) (B2 -=> X)=(0, 0);
if ((~(A1) & A2 & ~(B2))) (B1 -=> X)=(0, 0);
if ((A1 & ~(A2) & ~(B2))) (B1 -=> X)=(0, 0);
if ((A1 & A2 & ~(B2))) (B1 -=> X)=(0, 0);
if ((~(A2) & ~(B1) & B2)) (A1 -=> X)=(0, 0);
if ((~(A2) & B1 & ~(B2))) (A1 -=> X)=(0, 0);
if ((~(A2) & B1 & B2)) (A1 -=> X)=(0, 0);
endspecify
  `endif

endmodule
`endcelldefine

//%END SVN_OAI22_1

//%BEGIN SVN_OAI22_2

`celldefine
module SVN_OAI22_2 (X, A1, A2, B1, B2);
   output X;
   input A1, A2, B1, B2;

   wire int_res_0, int_res_1;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////

   or (int_res_0, A1, A2);
   or (int_res_1, B1, B2);

   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////

   `ifdef VIRL_functiononly
         nand #`SNPS_COMBO_DELAY (X, int_res_0, int_res_1);
   `else
         nand (X, int_res_0, int_res_1);
   `endif

   `ifdef VIRL_functiononly

   `else


specify
if ((~(A1) & ~(B1) & B2)) (A2 -=> X)=(0, 0);
if ((~(A1) & B1 & ~(B2))) (A2 -=> X)=(0, 0);
if ((~(A1) & B1 & B2)) (A2 -=> X)=(0, 0);
if ((~(A1) & A2 & ~(B1))) (B2 -=> X)=(0, 0);
if ((A1 & ~(A2) & ~(B1))) (B2 -=> X)=(0, 0);
if ((A1 & A2 & ~(B1))) (B2 -=> X)=(0, 0);
if ((~(A1) & A2 & ~(B2))) (B1 -=> X)=(0, 0);
if ((A1 & ~(A2) & ~(B2))) (B1 -=> X)=(0, 0);
if ((A1 & A2 & ~(B2))) (B1 -=> X)=(0, 0);
if ((~(A2) & ~(B1) & B2)) (A1 -=> X)=(0, 0);
if ((~(A2) & B1 & ~(B2))) (A1 -=> X)=(0, 0);
if ((~(A2) & B1 & B2)) (A1 -=> X)=(0, 0);
endspecify
  `endif

endmodule
`endcelldefine

//%END SVN_OAI22_2

//%BEGIN SVN_OAI22_3

`celldefine
module SVN_OAI22_3 (X, A1, A2, B1, B2);
   output X;
   input A1, A2, B1, B2;

   wire int_res_0, int_res_1;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////

   or (int_res_0, A1, A2);
   or (int_res_1, B1, B2);

   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////

   `ifdef VIRL_functiononly
         nand #`SNPS_COMBO_DELAY (X, int_res_0, int_res_1);
   `else
         nand (X, int_res_0, int_res_1);
   `endif

   `ifdef VIRL_functiononly

   `else


specify
if ((~(A1) & ~(B1) & B2)) (A2 -=> X)=(0, 0);
if ((~(A1) & B1 & ~(B2))) (A2 -=> X)=(0, 0);
if ((~(A1) & B1 & B2)) (A2 -=> X)=(0, 0);
if ((~(A1) & A2 & ~(B1))) (B2 -=> X)=(0, 0);
if ((A1 & ~(A2) & ~(B1))) (B2 -=> X)=(0, 0);
if ((A1 & A2 & ~(B1))) (B2 -=> X)=(0, 0);
if ((~(A1) & A2 & ~(B2))) (B1 -=> X)=(0, 0);
if ((A1 & ~(A2) & ~(B2))) (B1 -=> X)=(0, 0);
if ((A1 & A2 & ~(B2))) (B1 -=> X)=(0, 0);
if ((~(A2) & ~(B1) & B2)) (A1 -=> X)=(0, 0);
if ((~(A2) & B1 & ~(B2))) (A1 -=> X)=(0, 0);
if ((~(A2) & B1 & B2)) (A1 -=> X)=(0, 0);
endspecify
  `endif

endmodule
`endcelldefine

//%END SVN_OAI22_3

//%BEGIN SVN_OAI22_4

`celldefine
module SVN_OAI22_4 (X, A1, A2, B1, B2);
   output X;
   input A1, A2, B1, B2;

   wire int_res_0, int_res_1;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////

   or (int_res_0, A1, A2);
   or (int_res_1, B1, B2);

   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////

   `ifdef VIRL_functiononly
         nand #`SNPS_COMBO_DELAY (X, int_res_0, int_res_1);
   `else
         nand (X, int_res_0, int_res_1);
   `endif

   `ifdef VIRL_functiononly

   `else


specify
if ((~(A1) & ~(B1) & B2)) (A2 -=> X)=(0, 0);
if ((~(A1) & B1 & ~(B2))) (A2 -=> X)=(0, 0);
if ((~(A1) & B1 & B2)) (A2 -=> X)=(0, 0);
if ((~(A1) & A2 & ~(B1))) (B2 -=> X)=(0, 0);
if ((A1 & ~(A2) & ~(B1))) (B2 -=> X)=(0, 0);
if ((A1 & A2 & ~(B1))) (B2 -=> X)=(0, 0);
if ((~(A1) & A2 & ~(B2))) (B1 -=> X)=(0, 0);
if ((A1 & ~(A2) & ~(B2))) (B1 -=> X)=(0, 0);
if ((A1 & A2 & ~(B2))) (B1 -=> X)=(0, 0);
if ((~(A2) & ~(B1) & B2)) (A1 -=> X)=(0, 0);
if ((~(A2) & B1 & ~(B2))) (A1 -=> X)=(0, 0);
if ((~(A2) & B1 & B2)) (A1 -=> X)=(0, 0);
endspecify
  `endif

endmodule
`endcelldefine

//%END SVN_OAI22_4

//%BEGIN SVN_OAI311_1

`celldefine
module SVN_OAI311_1 (X, A1, A2, A3, B1, B2);
   output X;
   input A1, A2, A3, B1, B2;

   wire int_res_0;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////

   or (int_res_0, A1, A2, A3);

   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////

   `ifdef VIRL_functiononly
       nand #`SNPS_COMBO_DELAY (X, int_res_0, B1, B2);
   `else
       nand (X, int_res_0, B1, B2);
   `endif

   `ifdef VIRL_functiononly

   `else


specify
(A1 -=> X)=(0, 0);
(A2 -=> X)=(0, 0);
(A3 -=> X)=(0, 0);
if ((~(A1) & ~(A2) & A3 & B1)) (B2 -=> X)=(0, 0);
if ((~(A1) & A2 & ~(A3) & B1)) (B2 -=> X)=(0, 0);
if ((~(A1) & A2 & A3 & B1)) (B2 -=> X)=(0, 0);
if ((A1 & ~(A2) & ~(A3) & B1)) (B2 -=> X)=(0, 0);
if ((A1 & A2 & ~(A3) & B1) | (A1 & ~(A2) & A3 & B1)) (B2 -=> X)=(0, 0);
if ((A1 & A2 & A3 & B1)) (B2 -=> X)=(0, 0);
if ((~(A1) & ~(A2) & A3 & B2)) (B1 -=> X)=(0, 0);
if ((~(A1) & A2 & ~(A3) & B2)) (B1 -=> X)=(0, 0);
if ((~(A1) & A2 & A3 & B2)) (B1 -=> X)=(0, 0);
if ((A1 & ~(A2) & ~(A3) & B2)) (B1 -=> X)=(0, 0);
if ((A1 & A2 & ~(A3) & B2) | (A1 & ~(A2) & A3 & B2)) (B1 -=> X)=(0, 0);
if ((A1 & A2 & A3 & B2)) (B1 -=> X)=(0, 0);
endspecify
   `endif

endmodule
`endcelldefine

//%END SVN_OAI311_1

//%BEGIN SVN_OAI311_2

`celldefine
module SVN_OAI311_2 (X, A1, A2, A3, B1, B2);
   output X;
   input A1, A2, A3, B1, B2;

   wire int_res_0;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////

   or (int_res_0, A1, A2, A3);

   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////

   `ifdef VIRL_functiononly
       nand #`SNPS_COMBO_DELAY (X, int_res_0, B1, B2);
   `else
       nand (X, int_res_0, B1, B2);
   `endif

   `ifdef VIRL_functiononly

   `else


specify
(A1 -=> X)=(0, 0);
(A2 -=> X)=(0, 0);
(A3 -=> X)=(0, 0);
if ((~(A1) & ~(A2) & A3 & B1)) (B2 -=> X)=(0, 0);
if ((~(A1) & A2 & ~(A3) & B1)) (B2 -=> X)=(0, 0);
if ((~(A1) & A2 & A3 & B1)) (B2 -=> X)=(0, 0);
if ((A1 & ~(A2) & ~(A3) & B1)) (B2 -=> X)=(0, 0);
if ((A1 & A2 & ~(A3) & B1) | (A1 & ~(A2) & A3 & B1)) (B2 -=> X)=(0, 0);
if ((A1 & A2 & A3 & B1)) (B2 -=> X)=(0, 0);
if ((~(A1) & ~(A2) & A3 & B2)) (B1 -=> X)=(0, 0);
if ((~(A1) & A2 & ~(A3) & B2)) (B1 -=> X)=(0, 0);
if ((~(A1) & A2 & A3 & B2)) (B1 -=> X)=(0, 0);
if ((A1 & ~(A2) & ~(A3) & B2)) (B1 -=> X)=(0, 0);
if ((A1 & A2 & ~(A3) & B2) | (A1 & ~(A2) & A3 & B2)) (B1 -=> X)=(0, 0);
if ((A1 & A2 & A3 & B2)) (B1 -=> X)=(0, 0);
endspecify
   `endif

endmodule
`endcelldefine

//%END SVN_OAI311_2

//%BEGIN SVN_OAI311_4

`celldefine
module SVN_OAI311_4 (X, A1, A2, A3, B1, B2);
   output X;
   input A1, A2, A3, B1, B2;

   wire int_res_0;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////

   or (int_res_0, A1, A2, A3);

   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////

   `ifdef VIRL_functiononly
       nand #`SNPS_COMBO_DELAY (X, int_res_0, B1, B2);
   `else
       nand (X, int_res_0, B1, B2);
   `endif

   `ifdef VIRL_functiononly

   `else


specify
(A1 -=> X)=(0, 0);
(A2 -=> X)=(0, 0);
(A3 -=> X)=(0, 0);
if ((~(A1) & ~(A2) & A3 & B1)) (B2 -=> X)=(0, 0);
if ((~(A1) & A2 & ~(A3) & B1)) (B2 -=> X)=(0, 0);
if ((~(A1) & A2 & A3 & B1)) (B2 -=> X)=(0, 0);
if ((A1 & ~(A2) & ~(A3) & B1)) (B2 -=> X)=(0, 0);
if ((A1 & A2 & ~(A3) & B1) | (A1 & ~(A2) & A3 & B1)) (B2 -=> X)=(0, 0);
if ((A1 & A2 & A3 & B1)) (B2 -=> X)=(0, 0);
if ((~(A1) & ~(A2) & A3 & B2)) (B1 -=> X)=(0, 0);
if ((~(A1) & A2 & ~(A3) & B2)) (B1 -=> X)=(0, 0);
if ((~(A1) & A2 & A3 & B2)) (B1 -=> X)=(0, 0);
if ((A1 & ~(A2) & ~(A3) & B2)) (B1 -=> X)=(0, 0);
if ((A1 & A2 & ~(A3) & B2) | (A1 & ~(A2) & A3 & B2)) (B1 -=> X)=(0, 0);
if ((A1 & A2 & A3 & B2)) (B1 -=> X)=(0, 0);
endspecify
   `endif

endmodule
`endcelldefine

//%END SVN_OAI311_4

//%BEGIN SVN_OAI31_0P5

`celldefine
module SVN_OAI31_0P5 (X, A1, A2, A3, B);
   output X;
   input A1, A2, A3, B;

   wire int_res_0;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////

   or (int_res_0, A1, A2, A3);

   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////

   `ifdef VIRL_functiononly
      nand #`SNPS_COMBO_DELAY (X, int_res_0, B);
   `else
      nand (X, int_res_0, B);
   `endif

   `ifdef VIRL_functiononly

   `else


specify
(A1 -=> X)=(0, 0);
(A2 -=> X)=(0, 0);
(A3 -=> X)=(0, 0);
if ((~(A1) & ~(A2) & A3)) (B -=> X)=(0, 0);
if ((~(A1) & A2 & ~(A3))) (B -=> X)=(0, 0);
if ((~(A1) & A2 & A3)) (B -=> X)=(0, 0);
if ((A1 & ~(A2) & ~(A3))) (B -=> X)=(0, 0);
if ((A1 & A2 & ~(A3)) | (A1 & ~(A2) & A3)) (B -=> X)=(0, 0);
if ((A1 & A2 & A3)) (B -=> X)=(0, 0);
endspecify
   `endif

endmodule
`endcelldefine

//%END SVN_OAI31_0P5

//%BEGIN SVN_OAI31_1

`celldefine
module SVN_OAI31_1 (X, A1, A2, A3, B);
   output X;
   input A1, A2, A3, B;

   wire int_res_0;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////

   or (int_res_0, A1, A2, A3);

   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////

   `ifdef VIRL_functiononly
      nand #`SNPS_COMBO_DELAY (X, int_res_0, B);
   `else
      nand (X, int_res_0, B);
   `endif

   `ifdef VIRL_functiononly

   `else


specify
(A1 -=> X)=(0, 0);
(A2 -=> X)=(0, 0);
(A3 -=> X)=(0, 0);
if ((~(A1) & ~(A2) & A3)) (B -=> X)=(0, 0);
if ((~(A1) & A2 & ~(A3))) (B -=> X)=(0, 0);
if ((~(A1) & A2 & A3)) (B -=> X)=(0, 0);
if ((A1 & ~(A2) & ~(A3))) (B -=> X)=(0, 0);
if ((A1 & A2 & ~(A3)) | (A1 & ~(A2) & A3)) (B -=> X)=(0, 0);
if ((A1 & A2 & A3)) (B -=> X)=(0, 0);
endspecify
   `endif

endmodule
`endcelldefine

//%END SVN_OAI31_1

//%BEGIN SVN_OAI31_2

`celldefine
module SVN_OAI31_2 (X, A1, A2, A3, B);
   output X;
   input A1, A2, A3, B;

   wire int_res_0;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////

   or (int_res_0, A1, A2, A3);

   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////

   `ifdef VIRL_functiononly
      nand #`SNPS_COMBO_DELAY (X, int_res_0, B);
   `else
      nand (X, int_res_0, B);
   `endif

   `ifdef VIRL_functiononly

   `else


specify
(A1 -=> X)=(0, 0);
(A2 -=> X)=(0, 0);
(A3 -=> X)=(0, 0);
if ((~(A1) & ~(A2) & A3)) (B -=> X)=(0, 0);
if ((~(A1) & A2 & ~(A3))) (B -=> X)=(0, 0);
if ((~(A1) & A2 & A3)) (B -=> X)=(0, 0);
if ((A1 & ~(A2) & ~(A3))) (B -=> X)=(0, 0);
if ((A1 & A2 & ~(A3)) | (A1 & ~(A2) & A3)) (B -=> X)=(0, 0);
if ((A1 & A2 & A3)) (B -=> X)=(0, 0);
endspecify
   `endif

endmodule
`endcelldefine

//%END SVN_OAI31_2

//%BEGIN SVN_OAI31_3

`celldefine
module SVN_OAI31_3 (X, A1, A2, A3, B);
   output X;
   input A1, A2, A3, B;

   wire int_res_0;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////

   or (int_res_0, A1, A2, A3);

   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////

   `ifdef VIRL_functiononly
      nand #`SNPS_COMBO_DELAY (X, int_res_0, B);
   `else
      nand (X, int_res_0, B);
   `endif

   `ifdef VIRL_functiononly

   `else


specify
(A1 -=> X)=(0, 0);
(A2 -=> X)=(0, 0);
(A3 -=> X)=(0, 0);
if ((~(A1) & ~(A2) & A3)) (B -=> X)=(0, 0);
if ((~(A1) & A2 & ~(A3))) (B -=> X)=(0, 0);
if ((~(A1) & A2 & A3)) (B -=> X)=(0, 0);
if ((A1 & ~(A2) & ~(A3))) (B -=> X)=(0, 0);
if ((A1 & A2 & ~(A3)) | (A1 & ~(A2) & A3)) (B -=> X)=(0, 0);
if ((A1 & A2 & A3)) (B -=> X)=(0, 0);
endspecify
   `endif

endmodule
`endcelldefine

//%END SVN_OAI31_3

//%BEGIN SVN_OAI31_4

`celldefine
module SVN_OAI31_4 (X, A1, A2, A3, B);
   output X;
   input A1, A2, A3, B;

   wire int_res_0;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////

   or (int_res_0, A1, A2, A3);

   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////

   `ifdef VIRL_functiononly
      nand #`SNPS_COMBO_DELAY (X, int_res_0, B);
   `else
      nand (X, int_res_0, B);
   `endif

   `ifdef VIRL_functiononly

   `else


specify
(A1 -=> X)=(0, 0);
(A2 -=> X)=(0, 0);
(A3 -=> X)=(0, 0);
if ((~(A1) & ~(A2) & A3)) (B -=> X)=(0, 0);
if ((~(A1) & A2 & ~(A3))) (B -=> X)=(0, 0);
if ((~(A1) & A2 & A3)) (B -=> X)=(0, 0);
if ((A1 & ~(A2) & ~(A3))) (B -=> X)=(0, 0);
if ((A1 & A2 & ~(A3)) | (A1 & ~(A2) & A3)) (B -=> X)=(0, 0);
if ((A1 & A2 & A3)) (B -=> X)=(0, 0);
endspecify
   `endif

endmodule
`endcelldefine

//%END SVN_OAI31_4

//%BEGIN SVN_OAI32_1

`celldefine
module SVN_OAI32_1 (X, A1, A2, A3, B1, B2);
   output X;
   input A1, A2, A3, B1, B2;

   wire int_res_0, int_res_1;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////

   or (int_res_0, A1, A2, A3);
   or (int_res_1, B1, B2);

   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////

   `ifdef VIRL_functiononly
      nand #`SNPS_COMBO_DELAY (X, int_res_0, int_res_1);
   `else
      nand (X, int_res_0, int_res_1);
   `endif

   `ifdef VIRL_functiononly

   `else


specify
if ((~(A1) & ~(A2) & ~(B1) & B2)) (A3 -=> X)=(0, 0);
if ((~(A1) & ~(A2) & B1 & ~(B2))) (A3 -=> X)=(0, 0);
if ((~(A1) & ~(A2) & B1 & B2)) (A3 -=> X)=(0, 0);
if ((~(A1) & ~(A2) & A3 & ~(B1))) (B2 -=> X)=(0, 0);
if ((~(A1) & A2 & ~(A3) & ~(B1))) (B2 -=> X)=(0, 0);
if ((~(A1) & A2 & A3 & ~(B1))) (B2 -=> X)=(0, 0);
if ((A1 & ~(A2) & ~(A3) & ~(B1))) (B2 -=> X)=(0, 0);
if ((A1 & A2 & ~(A3) & ~(B1)) | (A1 & ~(A2) & A3 & ~(B1))) (B2 -=> X)=(0, 0);
if ((A1 & A2 & A3 & ~(B1))) (B2 -=> X)=(0, 0);
if ((~(A1) & ~(A2) & A3 & ~(B2))) (B1 -=> X)=(0, 0);
if ((~(A1) & A2 & ~(A3) & ~(B2))) (B1 -=> X)=(0, 0);
if ((~(A1) & A2 & A3 & ~(B2))) (B1 -=> X)=(0, 0);
if ((A1 & ~(A2) & ~(A3) & ~(B2))) (B1 -=> X)=(0, 0);
if ((A1 & A2 & ~(A3) & ~(B2)) | (A1 & ~(A2) & A3 & ~(B2))) (B1 -=> X)=(0, 0);
if ((A1 & A2 & A3 & ~(B2))) (B1 -=> X)=(0, 0);
if ((~(A1) & ~(A3) & ~(B1) & B2)) (A2 -=> X)=(0, 0);
if ((~(A1) & ~(A3) & B1 & ~(B2))) (A2 -=> X)=(0, 0);
if ((~(A1) & ~(A3) & B1 & B2)) (A2 -=> X)=(0, 0);
if ((~(A2) & ~(A3) & ~(B1) & B2)) (A1 -=> X)=(0, 0);
if ((~(A2) & ~(A3) & B1 & ~(B2))) (A1 -=> X)=(0, 0);
if ((~(A2) & ~(A3) & B1 & B2)) (A1 -=> X)=(0, 0);
endspecify
   `endif

endmodule
`endcelldefine

//%END SVN_OAI32_1

//%BEGIN SVN_OAI32_2

`celldefine
module SVN_OAI32_2 (X, A1, A2, A3, B1, B2);
   output X;
   input A1, A2, A3, B1, B2;

   wire int_res_0, int_res_1;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////

   or (int_res_0, A1, A2, A3);
   or (int_res_1, B1, B2);

   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////

   `ifdef VIRL_functiononly
      nand #`SNPS_COMBO_DELAY (X, int_res_0, int_res_1);
   `else
      nand (X, int_res_0, int_res_1);
   `endif

   `ifdef VIRL_functiononly

   `else


specify
if ((~(A1) & ~(A2) & ~(B1) & B2)) (A3 -=> X)=(0, 0);
if ((~(A1) & ~(A2) & B1 & ~(B2))) (A3 -=> X)=(0, 0);
if ((~(A1) & ~(A2) & B1 & B2)) (A3 -=> X)=(0, 0);
if ((~(A1) & ~(A2) & A3 & ~(B1))) (B2 -=> X)=(0, 0);
if ((~(A1) & A2 & ~(A3) & ~(B1))) (B2 -=> X)=(0, 0);
if ((~(A1) & A2 & A3 & ~(B1))) (B2 -=> X)=(0, 0);
if ((A1 & ~(A2) & ~(A3) & ~(B1))) (B2 -=> X)=(0, 0);
if ((A1 & A2 & ~(A3) & ~(B1)) | (A1 & ~(A2) & A3 & ~(B1))) (B2 -=> X)=(0, 0);
if ((A1 & A2 & A3 & ~(B1))) (B2 -=> X)=(0, 0);
if ((~(A1) & ~(A2) & A3 & ~(B2))) (B1 -=> X)=(0, 0);
if ((~(A1) & A2 & ~(A3) & ~(B2))) (B1 -=> X)=(0, 0);
if ((~(A1) & A2 & A3 & ~(B2))) (B1 -=> X)=(0, 0);
if ((A1 & ~(A2) & ~(A3) & ~(B2))) (B1 -=> X)=(0, 0);
if ((A1 & A2 & ~(A3) & ~(B2)) | (A1 & ~(A2) & A3 & ~(B2))) (B1 -=> X)=(0, 0);
if ((A1 & A2 & A3 & ~(B2))) (B1 -=> X)=(0, 0);
if ((~(A1) & ~(A3) & ~(B1) & B2)) (A2 -=> X)=(0, 0);
if ((~(A1) & ~(A3) & B1 & ~(B2))) (A2 -=> X)=(0, 0);
if ((~(A1) & ~(A3) & B1 & B2)) (A2 -=> X)=(0, 0);
if ((~(A2) & ~(A3) & ~(B1) & B2)) (A1 -=> X)=(0, 0);
if ((~(A2) & ~(A3) & B1 & ~(B2))) (A1 -=> X)=(0, 0);
if ((~(A2) & ~(A3) & B1 & B2)) (A1 -=> X)=(0, 0);
endspecify
   `endif

endmodule
`endcelldefine

//%END SVN_OAI32_2

//%BEGIN SVN_OAI32_4

`celldefine
module SVN_OAI32_4 (X, A1, A2, A3, B1, B2);
   output X;
   input A1, A2, A3, B1, B2;

   wire int_res_0, int_res_1;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////

   or (int_res_0, A1, A2, A3);
   or (int_res_1, B1, B2);

   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////

   `ifdef VIRL_functiononly
      nand #`SNPS_COMBO_DELAY (X, int_res_0, int_res_1);
   `else
      nand (X, int_res_0, int_res_1);
   `endif

   `ifdef VIRL_functiononly

   `else


specify
if ((~(A1) & ~(A2) & ~(B1) & B2)) (A3 -=> X)=(0, 0);
if ((~(A1) & ~(A2) & B1 & ~(B2))) (A3 -=> X)=(0, 0);
if ((~(A1) & ~(A2) & B1 & B2)) (A3 -=> X)=(0, 0);
if ((~(A1) & ~(A2) & A3 & ~(B1))) (B2 -=> X)=(0, 0);
if ((~(A1) & A2 & ~(A3) & ~(B1))) (B2 -=> X)=(0, 0);
if ((~(A1) & A2 & A3 & ~(B1))) (B2 -=> X)=(0, 0);
if ((A1 & ~(A2) & ~(A3) & ~(B1))) (B2 -=> X)=(0, 0);
if ((A1 & A2 & ~(A3) & ~(B1)) | (A1 & ~(A2) & A3 & ~(B1))) (B2 -=> X)=(0, 0);
if ((A1 & A2 & A3 & ~(B1))) (B2 -=> X)=(0, 0);
if ((~(A1) & ~(A2) & A3 & ~(B2))) (B1 -=> X)=(0, 0);
if ((~(A1) & A2 & ~(A3) & ~(B2))) (B1 -=> X)=(0, 0);
if ((~(A1) & A2 & A3 & ~(B2))) (B1 -=> X)=(0, 0);
if ((A1 & ~(A2) & ~(A3) & ~(B2))) (B1 -=> X)=(0, 0);
if ((A1 & A2 & ~(A3) & ~(B2)) | (A1 & ~(A2) & A3 & ~(B2))) (B1 -=> X)=(0, 0);
if ((A1 & A2 & A3 & ~(B2))) (B1 -=> X)=(0, 0);
if ((~(A1) & ~(A3) & ~(B1) & B2)) (A2 -=> X)=(0, 0);
if ((~(A1) & ~(A3) & B1 & ~(B2))) (A2 -=> X)=(0, 0);
if ((~(A1) & ~(A3) & B1 & B2)) (A2 -=> X)=(0, 0);
if ((~(A2) & ~(A3) & ~(B1) & B2)) (A1 -=> X)=(0, 0);
if ((~(A2) & ~(A3) & B1 & ~(B2))) (A1 -=> X)=(0, 0);
if ((~(A2) & ~(A3) & B1 & B2)) (A1 -=> X)=(0, 0);
endspecify
   `endif

endmodule
`endcelldefine

//%END SVN_OAI32_4

//%BEGIN SVN_OAOI211_1

`celldefine
module SVN_OAOI211_1 (X, A1, A2, B, C);
   output X;
   input A1, A2, B, C;

   wire int_res_0, int_res_1;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////

   or (int_res_0, A1, A2);
   and (int_res_1, int_res_0, B);

   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////

   `ifdef VIRL_functiononly
      nor #`SNPS_COMBO_DELAY (X, int_res_1, C);
   `else
      nor (X, int_res_1, C);
   `endif

   `ifdef VIRL_functiononly

   `else

specify
(A1 -=> X)=(0, 0);
(A2 -=> X)=(0, 0);
if ((~(A1) & ~(A2) & ~(B))) (C -=> X)=(0, 0);
if ((~(A1) & ~(A2) & B)) (C -=> X)=(0, 0);
if ((~(A1) & A2 & ~(B))) (C -=> X)=(0, 0);
if ((A1 & ~(B))) (C -=> X)=(0, 0);
if ((~(A1) & A2 & ~(C))) (B -=> X)=(0, 0);
if ((A1 & ~(A2) & ~(C))) (B -=> X)=(0, 0);
if ((A1 & A2 & ~(C))) (B -=> X)=(0, 0);
endspecify
   `endif

endmodule
`endcelldefine

//%END SVN_OAOI211_1

//%BEGIN SVN_OAOI211_2

`celldefine
module SVN_OAOI211_2 (X, A1, A2, B, C);
   output X;
   input A1, A2, B, C;

   wire int_res_0, int_res_1;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////

   or (int_res_0, A1, A2);
   and (int_res_1, int_res_0, B);

   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////

   `ifdef VIRL_functiononly
      nor #`SNPS_COMBO_DELAY (X, int_res_1, C);
   `else
      nor (X, int_res_1, C);
   `endif

   `ifdef VIRL_functiononly

   `else

specify
(A1 -=> X)=(0, 0);
(A2 -=> X)=(0, 0);
if ((~(A1) & ~(A2) & ~(B))) (C -=> X)=(0, 0);
if ((~(A1) & ~(A2) & B)) (C -=> X)=(0, 0);
if ((~(A1) & A2 & ~(B))) (C -=> X)=(0, 0);
if ((A1 & ~(B))) (C -=> X)=(0, 0);
if ((~(A1) & A2 & ~(C))) (B -=> X)=(0, 0);
if ((A1 & ~(A2) & ~(C))) (B -=> X)=(0, 0);
if ((A1 & A2 & ~(C))) (B -=> X)=(0, 0);
endspecify
   `endif

endmodule
`endcelldefine

//%END SVN_OAOI211_2

//%BEGIN SVN_OAOI211_3

`celldefine
module SVN_OAOI211_3 (X, A1, A2, B, C);
   output X;
   input A1, A2, B, C;

   wire int_res_0, int_res_1;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////

   or (int_res_0, A1, A2);
   and (int_res_1, int_res_0, B);

   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////

   `ifdef VIRL_functiononly
      nor #`SNPS_COMBO_DELAY (X, int_res_1, C);
   `else
      nor (X, int_res_1, C);
   `endif

   `ifdef VIRL_functiononly

   `else

specify
(A1 -=> X)=(0, 0);
(A2 -=> X)=(0, 0);
if ((~(A1) & ~(A2) & ~(B))) (C -=> X)=(0, 0);
if ((~(A1) & ~(A2) & B)) (C -=> X)=(0, 0);
if ((~(A1) & A2 & ~(B))) (C -=> X)=(0, 0);
if ((A1 & ~(B))) (C -=> X)=(0, 0);
if ((~(A1) & A2 & ~(C))) (B -=> X)=(0, 0);
if ((A1 & ~(A2) & ~(C))) (B -=> X)=(0, 0);
if ((A1 & A2 & ~(C))) (B -=> X)=(0, 0);
endspecify
   `endif

endmodule
`endcelldefine

//%END SVN_OAOI211_3

//%BEGIN SVN_OAOI211_4

`celldefine
module SVN_OAOI211_4 (X, A1, A2, B, C);
   output X;
   input A1, A2, B, C;

   wire int_res_0, int_res_1;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////

   or (int_res_0, A1, A2);
   and (int_res_1, int_res_0, B);

   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////

   `ifdef VIRL_functiononly
      nor #`SNPS_COMBO_DELAY (X, int_res_1, C);
   `else
      nor (X, int_res_1, C);
   `endif

   `ifdef VIRL_functiononly

   `else

specify
(A1 -=> X)=(0, 0);
(A2 -=> X)=(0, 0);
if ((~(A1) & ~(A2) & ~(B))) (C -=> X)=(0, 0);
if ((~(A1) & ~(A2) & B)) (C -=> X)=(0, 0);
if ((~(A1) & A2 & ~(B))) (C -=> X)=(0, 0);
if ((A1 & ~(B))) (C -=> X)=(0, 0);
if ((~(A1) & A2 & ~(C))) (B -=> X)=(0, 0);
if ((A1 & ~(A2) & ~(C))) (B -=> X)=(0, 0);
if ((A1 & A2 & ~(C))) (B -=> X)=(0, 0);
endspecify
   `endif

endmodule
`endcelldefine

//%END SVN_OAOI211_4

//%BEGIN SVN_OR2_0P5

`celldefine
module SVN_OR2_0P5 (X, A1, A2);
   output X;
   input A1, A2;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////


   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////
   `ifdef VIRL_functiononly
       or #`SNPS_COMBO_DELAY (X, A1, A2);
   `else
       or (X, A1, A2);
   `endif

   `ifdef VIRL_functiononly

   `else

specify
(A1 +=> X)=(0, 0);
(A2 +=> X)=(0, 0);
endspecify
   `endif

endmodule
`endcelldefine

//%END SVN_OR2_0P5

//%BEGIN SVN_OR2_1

`celldefine
module SVN_OR2_1 (X, A1, A2);
   output X;
   input A1, A2;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////


   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////
   `ifdef VIRL_functiononly
       or #`SNPS_COMBO_DELAY (X, A1, A2);
   `else
       or (X, A1, A2);
   `endif

   `ifdef VIRL_functiononly

   `else

specify
(A1 +=> X)=(0, 0);
(A2 +=> X)=(0, 0);
endspecify
   `endif

endmodule
`endcelldefine

//%END SVN_OR2_1

//%BEGIN SVN_OR2_12

`celldefine
module SVN_OR2_12 (X, A1, A2);
   output X;
   input A1, A2;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////


   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////
   `ifdef VIRL_functiononly
       or #`SNPS_COMBO_DELAY (X, A1, A2);
   `else
       or (X, A1, A2);
   `endif

   `ifdef VIRL_functiononly

   `else

specify
(A1 +=> X)=(0, 0);
(A2 +=> X)=(0, 0);
endspecify
   `endif

endmodule
`endcelldefine

//%END SVN_OR2_12

//%BEGIN SVN_OR2_2

`celldefine
module SVN_OR2_2 (X, A1, A2);
   output X;
   input A1, A2;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////


   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////
   `ifdef VIRL_functiononly
       or #`SNPS_COMBO_DELAY (X, A1, A2);
   `else
       or (X, A1, A2);
   `endif

   `ifdef VIRL_functiononly

   `else

specify
(A1 +=> X)=(0, 0);
(A2 +=> X)=(0, 0);
endspecify
   `endif

endmodule
`endcelldefine

//%END SVN_OR2_2

//%BEGIN SVN_OR2_3

`celldefine
module SVN_OR2_3 (X, A1, A2);
   output X;
   input A1, A2;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////


   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////
   `ifdef VIRL_functiononly
       or #`SNPS_COMBO_DELAY (X, A1, A2);
   `else
       or (X, A1, A2);
   `endif

   `ifdef VIRL_functiononly

   `else

specify
(A1 +=> X)=(0, 0);
(A2 +=> X)=(0, 0);
endspecify
   `endif

endmodule
`endcelldefine

//%END SVN_OR2_3

//%BEGIN SVN_OR2_4

`celldefine
module SVN_OR2_4 (X, A1, A2);
   output X;
   input A1, A2;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////


   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////
   `ifdef VIRL_functiononly
       or #`SNPS_COMBO_DELAY (X, A1, A2);
   `else
       or (X, A1, A2);
   `endif

   `ifdef VIRL_functiononly

   `else

specify
(A1 +=> X)=(0, 0);
(A2 +=> X)=(0, 0);
endspecify
   `endif

endmodule
`endcelldefine

//%END SVN_OR2_4

//%BEGIN SVN_OR2_6

`celldefine
module SVN_OR2_6 (X, A1, A2);
   output X;
   input A1, A2;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////


   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////
   `ifdef VIRL_functiononly
       or #`SNPS_COMBO_DELAY (X, A1, A2);
   `else
       or (X, A1, A2);
   `endif

   `ifdef VIRL_functiononly

   `else

specify
(A1 +=> X)=(0, 0);
(A2 +=> X)=(0, 0);
endspecify
   `endif

endmodule
`endcelldefine

//%END SVN_OR2_6

//%BEGIN SVN_OR2_8

`celldefine
module SVN_OR2_8 (X, A1, A2);
   output X;
   input A1, A2;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////


   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////
   `ifdef VIRL_functiononly
       or #`SNPS_COMBO_DELAY (X, A1, A2);
   `else
       or (X, A1, A2);
   `endif

   `ifdef VIRL_functiononly

   `else

specify
(A1 +=> X)=(0, 0);
(A2 +=> X)=(0, 0);
endspecify
   `endif

endmodule
`endcelldefine

//%END SVN_OR2_8

//%BEGIN SVN_OR3_1

`celldefine
module SVN_OR3_1 (X, A1, A2, A3);
   output X;
   input A1, A2, A3;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////


   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////

   `ifdef VIRL_functiononly
      or #`SNPS_COMBO_DELAY (X, A1, A2, A3);
   `else
      or (X, A1, A2, A3);
   `endif

   `ifdef VIRL_functiononly

   `else

specify
(A1 +=> X)=(0, 0);
(A2 +=> X)=(0, 0);
(A3 +=> X)=(0, 0);
endspecify
   `endif

endmodule
`endcelldefine

//%END SVN_OR3_1

//%BEGIN SVN_OR3_2

`celldefine
module SVN_OR3_2 (X, A1, A2, A3);
   output X;
   input A1, A2, A3;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////


   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////

   `ifdef VIRL_functiononly
      or #`SNPS_COMBO_DELAY (X, A1, A2, A3);
   `else
      or (X, A1, A2, A3);
   `endif

   `ifdef VIRL_functiononly

   `else

specify
(A1 +=> X)=(0, 0);
(A2 +=> X)=(0, 0);
(A3 +=> X)=(0, 0);
endspecify
   `endif

endmodule
`endcelldefine

//%END SVN_OR3_2

//%BEGIN SVN_OR3_4

`celldefine
module SVN_OR3_4 (X, A1, A2, A3);
   output X;
   input A1, A2, A3;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////


   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////

   `ifdef VIRL_functiononly
      or #`SNPS_COMBO_DELAY (X, A1, A2, A3);
   `else
      or (X, A1, A2, A3);
   `endif

   `ifdef VIRL_functiononly

   `else

specify
(A1 +=> X)=(0, 0);
(A2 +=> X)=(0, 0);
(A3 +=> X)=(0, 0);
endspecify
   `endif

endmodule
`endcelldefine

//%END SVN_OR3_4

//%BEGIN SVN_OR3_6

`celldefine
module SVN_OR3_6 (X, A1, A2, A3);
   output X;
   input A1, A2, A3;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////


   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////

   `ifdef VIRL_functiononly
      or #`SNPS_COMBO_DELAY (X, A1, A2, A3);
   `else
      or (X, A1, A2, A3);
   `endif

   `ifdef VIRL_functiononly

   `else

specify
(A1 +=> X)=(0, 0);
(A2 +=> X)=(0, 0);
(A3 +=> X)=(0, 0);
endspecify
   `endif

endmodule
`endcelldefine

//%END SVN_OR3_6

//%BEGIN SVN_OR3B_1

`celldefine
module SVN_OR3B_1 (X, A, B1, B2);
   output X;
   input A, B1, B2;

   wire int_res_0;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////

   not (int_res_0, A);

   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////

   `ifdef VIRL_functiononly
      or #`SNPS_COMBO_DELAY (X, int_res_0, B1, B2);
   `else
      or (X, int_res_0, B1, B2);
   `endif

   `ifdef VIRL_functiononly

   `else


specify
(A -=> X)=(0, 0);
(B1 +=> X)=(0, 0);
(B2 +=> X)=(0, 0);
endspecify
   `endif

endmodule
`endcelldefine

//%END SVN_OR3B_1

//%BEGIN SVN_OR3B_2

`celldefine
module SVN_OR3B_2 (X, A, B1, B2);
   output X;
   input A, B1, B2;

   wire int_res_0;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////

   not (int_res_0, A);

   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////

   `ifdef VIRL_functiononly
      or #`SNPS_COMBO_DELAY (X, int_res_0, B1, B2);
   `else
      or (X, int_res_0, B1, B2);
   `endif

   `ifdef VIRL_functiononly

   `else


specify
(A -=> X)=(0, 0);
(B1 +=> X)=(0, 0);
(B2 +=> X)=(0, 0);
endspecify
   `endif

endmodule
`endcelldefine

//%END SVN_OR3B_2

//%BEGIN SVN_OR3B_3

`celldefine
module SVN_OR3B_3 (X, A, B1, B2);
   output X;
   input A, B1, B2;

   wire int_res_0;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////

   not (int_res_0, A);

   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////

   `ifdef VIRL_functiononly
      or #`SNPS_COMBO_DELAY (X, int_res_0, B1, B2);
   `else
      or (X, int_res_0, B1, B2);
   `endif

   `ifdef VIRL_functiononly

   `else


specify
(A -=> X)=(0, 0);
(B1 +=> X)=(0, 0);
(B2 +=> X)=(0, 0);
endspecify
   `endif

endmodule
`endcelldefine

//%END SVN_OR3B_3

//%BEGIN SVN_OR3B_4

`celldefine
module SVN_OR3B_4 (X, A, B1, B2);
   output X;
   input A, B1, B2;

   wire int_res_0;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////

   not (int_res_0, A);

   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////

   `ifdef VIRL_functiononly
      or #`SNPS_COMBO_DELAY (X, int_res_0, B1, B2);
   `else
      or (X, int_res_0, B1, B2);
   `endif

   `ifdef VIRL_functiononly

   `else


specify
(A -=> X)=(0, 0);
(B1 +=> X)=(0, 0);
(B2 +=> X)=(0, 0);
endspecify
   `endif

endmodule
`endcelldefine

//%END SVN_OR3B_4

//%BEGIN SVN_OR4_1

`celldefine
module SVN_OR4_1 (X, A1, A2, A3, A4);
   output X;
   input A1, A2, A3, A4;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////


   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////
   `ifdef VIRL_functiononly
      or #`SNPS_COMBO_DELAY (X, A1, A2, A3, A4);
   `else
      or (X, A1, A2, A3, A4);
   `endif

   `ifdef VIRL_functiononly

   `else


specify
(A1 +=> X)=(0, 0);
(A2 +=> X)=(0, 0);
(A3 +=> X)=(0, 0);
(A4 +=> X)=(0, 0);
endspecify
   `endif

endmodule
`endcelldefine

//%END SVN_OR4_1

//%BEGIN SVN_OR4_2

`celldefine
module SVN_OR4_2 (X, A1, A2, A3, A4);
   output X;
   input A1, A2, A3, A4;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////


   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////
   `ifdef VIRL_functiononly
      or #`SNPS_COMBO_DELAY (X, A1, A2, A3, A4);
   `else
      or (X, A1, A2, A3, A4);
   `endif

   `ifdef VIRL_functiononly

   `else


specify
(A1 +=> X)=(0, 0);
(A2 +=> X)=(0, 0);
(A3 +=> X)=(0, 0);
(A4 +=> X)=(0, 0);
endspecify
   `endif

endmodule
`endcelldefine

//%END SVN_OR4_2

//%BEGIN SVN_OR4_4

`celldefine
module SVN_OR4_4 (X, A1, A2, A3, A4);
   output X;
   input A1, A2, A3, A4;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////


   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////
   `ifdef VIRL_functiononly
      or #`SNPS_COMBO_DELAY (X, A1, A2, A3, A4);
   `else
      or (X, A1, A2, A3, A4);
   `endif

   `ifdef VIRL_functiononly

   `else


specify
(A1 +=> X)=(0, 0);
(A2 +=> X)=(0, 0);
(A3 +=> X)=(0, 0);
(A4 +=> X)=(0, 0);
endspecify
   `endif

endmodule
`endcelldefine

//%END SVN_OR4_4

//%BEGIN SVN_OR4B_1

`celldefine
module SVN_OR4B_1 (X, A, B1, B2, B3);
   output X;
   input A, B1, B2, B3;

   wire int_res_0;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////

   not (int_res_0, A);

   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////

   `ifdef VIRL_functiononly
       or #`SNPS_COMBO_DELAY (X, int_res_0, B1, B2, B3);
   `else
       or (X, int_res_0, B1, B2, B3);
   `endif

   `ifdef VIRL_functiononly

   `else


specify
(A -=> X)=(0, 0);
(B1 +=> X)=(0, 0);
(B2 +=> X)=(0, 0);
(B3 +=> X)=(0, 0);
endspecify
   `endif

endmodule
`endcelldefine

//%END SVN_OR4B_1

//%BEGIN SVN_OR4B_2

`celldefine
module SVN_OR4B_2 (X, A, B1, B2, B3);
   output X;
   input A, B1, B2, B3;

   wire int_res_0;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////

   not (int_res_0, A);

   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////

   `ifdef VIRL_functiononly
       or #`SNPS_COMBO_DELAY (X, int_res_0, B1, B2, B3);
   `else
       or (X, int_res_0, B1, B2, B3);
   `endif

   `ifdef VIRL_functiononly

   `else


specify
(A -=> X)=(0, 0);
(B1 +=> X)=(0, 0);
(B2 +=> X)=(0, 0);
(B3 +=> X)=(0, 0);
endspecify
   `endif

endmodule
`endcelldefine

//%END SVN_OR4B_2

//%BEGIN SVN_OR4B_3

`celldefine
module SVN_OR4B_3 (X, A, B1, B2, B3);
   output X;
   input A, B1, B2, B3;

   wire int_res_0;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////

   not (int_res_0, A);

   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////

   `ifdef VIRL_functiononly
       or #`SNPS_COMBO_DELAY (X, int_res_0, B1, B2, B3);
   `else
       or (X, int_res_0, B1, B2, B3);
   `endif

   `ifdef VIRL_functiononly

   `else


specify
(A -=> X)=(0, 0);
(B1 +=> X)=(0, 0);
(B2 +=> X)=(0, 0);
(B3 +=> X)=(0, 0);
endspecify
   `endif

endmodule
`endcelldefine

//%END SVN_OR4B_3

//%BEGIN SVN_OR4B_4

`celldefine
module SVN_OR4B_4 (X, A, B1, B2, B3);
   output X;
   input A, B1, B2, B3;

   wire int_res_0;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////

   not (int_res_0, A);

   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////

   `ifdef VIRL_functiononly
       or #`SNPS_COMBO_DELAY (X, int_res_0, B1, B2, B3);
   `else
       or (X, int_res_0, B1, B2, B3);
   `endif

   `ifdef VIRL_functiononly

   `else


specify
(A -=> X)=(0, 0);
(B1 +=> X)=(0, 0);
(B2 +=> X)=(0, 0);
(B3 +=> X)=(0, 0);
endspecify
   `endif

endmodule
`endcelldefine

//%END SVN_OR4B_4

//%BEGIN SVN_SUBH_1

`celldefine
module SVN_SUBH_1 (S, CO, A, B);
   output S, CO;
   input A, B;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////

   `ifdef VIRL_functiononly
      xnor #`SNPS_COMBO_DELAY (S, A, B);
      or #`SNPS_COMBO_DELAY (CO, A, B);
   `else
      xnor (S, A, B);
      or (CO, A, B);
   `endif

   `ifdef VIRL_functiononly

   `else

   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////


specify
(A +=> CO)=(0, 0);
(B +=> CO)=(0, 0);
if (~(B)) (A -=> S)=(0, 0);
if (B) (A +=> S)=(0, 0);
if (~(A)) (B -=> S)=(0, 0);
if (A) (B +=> S)=(0, 0);
endspecify
   `endif
endmodule
`endcelldefine

//%END SVN_SUBH_1

//%BEGIN SVN_SUBH_2

`celldefine
module SVN_SUBH_2 (S, CO, A, B);
   output S, CO;
   input A, B;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////

   `ifdef VIRL_functiononly
      xnor #`SNPS_COMBO_DELAY (S, A, B);
      or #`SNPS_COMBO_DELAY (CO, A, B);
   `else
      xnor (S, A, B);
      or (CO, A, B);
   `endif

   `ifdef VIRL_functiononly

   `else

   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////


specify
(A +=> CO)=(0, 0);
(B +=> CO)=(0, 0);
if (~(B)) (A -=> S)=(0, 0);
if (B) (A +=> S)=(0, 0);
if (~(A)) (B -=> S)=(0, 0);
if (A) (B +=> S)=(0, 0);
endspecify
   `endif
endmodule
`endcelldefine

//%END SVN_SUBH_2

//%BEGIN SVN_SUBH_4

`celldefine
module SVN_SUBH_4 (S, CO, A, B);
   output S, CO;
   input A, B;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////

   `ifdef VIRL_functiononly
      xnor #`SNPS_COMBO_DELAY (S, A, B);
      or #`SNPS_COMBO_DELAY (CO, A, B);
   `else
      xnor (S, A, B);
      or (CO, A, B);
   `endif

   `ifdef VIRL_functiononly

   `else

   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////


specify
(A +=> CO)=(0, 0);
(B +=> CO)=(0, 0);
if (~(B)) (A -=> S)=(0, 0);
if (B) (A +=> S)=(0, 0);
if (~(A)) (B -=> S)=(0, 0);
if (A) (B +=> S)=(0, 0);
endspecify
   `endif
endmodule
`endcelldefine

//%END SVN_SUBH_4

//%BEGIN SVN_TIE0_1

`celldefine
module SVN_TIE0_1 (X);
   output X;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////

   `ifdef VIRL_functiononly
      buf #`SNPS_COMBO_DELAY (X, 1'b0);
   `else
      buf (X, 1'b0);
   `endif
   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////

   `ifdef VIRL_functiononly

   `else
specify
endspecify
   `endif

endmodule
`endcelldefine

//%END SVN_TIE0_1

//%BEGIN SVN_TIE1_1

`celldefine
module SVN_TIE1_1 (X);
   output X;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////


   `ifdef VIRL_functiononly
     buf #`SNPS_COMBO_DELAY (X, 1'b1);
   `else
     buf (X, 1'b1);
   `endif
   /////////////////////////////////////
   //             TIMING              //
   /////////////////////////////////////

   `ifdef VIRL_functiononly

   `else
specify
endspecify
   `endif

endmodule
`endcelldefine

//%END SVN_TIE1_1

//%BEGIN SVN_TIEDIN_1

`celldefine
module SVN_TIEDIN_1 (X);
   input X;

   /////////////////////////////////////
   //          FUNCTIONALITY          //
   /////////////////////////////////////


endmodule
`endcelldefine

//%END SVN_TIEDIN_1

//%BEGIN SVN_DCAP8

`celldefine
module SVN_DCAP8 ();
endmodule
`endcelldefine

//%END SVN_DCAP8

//%BEGIN SVN_FILL4

`celldefine
module SVN_FILL4 ();
endmodule
`endcelldefine

//%END SVN_FILL4

//%BEGIN SVN_FILL16

`celldefine
module SVN_FILL16 ();
endmodule
`endcelldefine

//%END SVN_FILL16

//%BEGIN SVN_FILL32

`celldefine
module SVN_FILL32 ();
endmodule
`endcelldefine

//%END SVN_FILL32

//%BEGIN SVN_FILL_ECO1

`celldefine
module SVN_FILL_ECO1 ();
endmodule
`endcelldefine

//%END SVN_FILL_ECO1

//%BEGIN SVN_DCAP4

`celldefine
module SVN_DCAP4 ();
endmodule
`endcelldefine

//%END SVN_DCAP4

//%BEGIN SVN_TAP_DS

`celldefine
module SVN_TAP_DS ();
endmodule
`endcelldefine

//%END SVN_TAP_DS

//%BEGIN SVN_DCAP64

`celldefine
module SVN_DCAP64 ();
endmodule
`endcelldefine

//%END SVN_DCAP64

//%BEGIN SVN_FILL2

`celldefine
module SVN_FILL2 ();
endmodule
`endcelldefine

//%END SVN_FILL2

//%BEGIN SVN_FILL64

`celldefine
module SVN_FILL64 ();
endmodule
`endcelldefine

//%END SVN_FILL64

//%BEGIN SVN_FILL1

`celldefine
module SVN_FILL1 ();
endmodule
`endcelldefine

//%END SVN_FILL1

//%BEGIN SVN_DCAP32

`celldefine
module SVN_DCAP32 ();
endmodule
`endcelldefine

//%END SVN_DCAP32

//%BEGIN SVN_FILL8

`celldefine
module SVN_FILL8 ();
endmodule
`endcelldefine

//%END SVN_FILL8

//%BEGIN SVN_DCAP16

`celldefine
module SVN_DCAP16 ();
endmodule
`endcelldefine

//%END SVN_DCAP16

primitive mux2 (q, i1, i0, s0);
   input i1, i0, s0;
   output q;

   table
        ?  0  0 : 0;
        ?  1  0 : 1;
        0  ?  1 : 0;
        1  ?  1 : 1;
        0  0  ? : 0;
        1  1  ? : 1;
   endtable
endprimitive

primitive mux4 (q, i3, i2, i1, i0, s1, s0);
   input i3, i2, i1, i0, s1, s0;
   output q;

   table
        ?  ?  ?  0  0  0 : 0;
        ?  ?  ?  1  0  0 : 1;
        ?  ?  0  ?  0  1 : 0;
        ?  ?  1  ?  0  1 : 1;
        ?  0  ?  ?  1  0 : 0;
        ?  1  ?  ?  1  0 : 1;
        0  ?  ?  ?  1  1 : 0;
        1  ?  ?  ?  1  1 : 1;
        ?  ?  0  0  0  ? : 0;
        ?  ?  1  1  0  ? : 1;
        0  0  ?  ?  1  ? : 0;
        1  1  ?  ?  1  ? : 1;
        ?  0  ?  0  ?  0 : 0;
        ?  1  ?  1  ?  0 : 1;
        0  ?  0  ?  ?  1 : 0;
        1  ?  1  ?  ?  1 : 1;
        0  0  0  0  ?  ? : 0;
        1  1  1  1  ?  ? : 1;
   endtable
endprimitive


primitive sr_latch (q, v, s, r);
   //set dominant architecture 
   output q;
   reg q;
   input v, s, r;

   table
      *  ?  ? : ? : x ;
      ?  1  ? : ? : 1 ;
      ?  0  1 : ? : 0 ;
      ?  0  0 : ? : - ;
      ?  0  x : 0 : 0 ;
   endtable
endprimitive // sr_latch



primitive sr_latch_x (q, v, s, r);
   //x out if both set and reset are active together
   output q;
   reg q;
   input v, s, r;

   table
      *  ?  ? : ? : x ;
      ?  1  0 : ? : 1 ;
      ?  0  1 : ? : 0 ;
      ?  0  0 : ? : - ;
      ?  0  x : 0 : 0 ;
      ?  x  0 : 1 : 1 ;
   endtable
endprimitive // sr_latch

primitive latch (q, v, clk, d);
   output q;
   reg q;
   input v, clk, d;

   table
      * ? ? : ? : x;
      ? 1 0 : ? : 0;
      ? 1 1 : ? : 1;
      ? x 0 : 0 : -;
      ? x 1 : 1 : -;
      ? 0 ? : ? : -;
   endtable
endprimitive

primitive latch_r (q, v, clk, d, r);
   output q;
   reg q;
   input v, clk, d, r;

   table
      * ? ? ? : ? : x;
      ? ? ? 1 : ? : 0;
      ? 0 ? 0 : ? : -;
      ? 0 ? x : 0 : -;
      ? 1 0 0 : ? : 0;
      ? 1 0 x : ? : 0;
      ? 1 1 0 : ? : 1;
      ? x 0 0 : 0 : -;
      ? x 0 x : 0 : -;
      ? x 1 0 : 1 : -;
   endtable
endprimitive

primitive latch_s (q, v, clk, d, s);
   output q;
   reg q;
   input v, clk, d, s;

   table
      * ? ? ? : ? : x;
      ? ? ? 1 : ? : 1;
      ? 0 ? 0 : ? : -;
      ? 0 ? x : 1 : -;
      ? 1 1 0 : ? : 1;
      ? 1 1 x : ? : 1;
      ? 1 0 0 : ? : 0;
      ? x 1 0 : 1 : -;
      ? x 1 x : 1 : -;
      ? x 0 0 : 0 : -;
   endtable
endprimitive

primitive latch_lssd_master(q, v, clk, clka, d, si);
   output q;
   reg q;
   input v, clk, clka, d, si;
   table
     * ? ? ? ? : ? : x;
     ? 1 0 0 ? : ? : 0;
     ? 1 0 1 ? : ? : 1;
     ? 0 1 ? 0 : ? : 0;
     ? 0 1 ? 1 : ? : 1;
     ? 0 0 ? ? : ? : -;
     ? ? 1 1 1 : ? : 1; // start reducing pessimism
     ? 1 ? 1 1 : ? : 1;
     ? ? 1 0 0 : ? : 0;
     ? 1 ? 0 0 : ? : 0;
     ? ? ? 0 0 : 0 : 0;
     ? ? ? 1 1 : 1 : 1;
   endtable
endprimitive

primitive latch_sr_0 (q, v, clk, d, s, r);
     output q;
   reg q;
   input v, clk, d, s, r;

   table
      * ? ? ? ? : ? : x;
      ? ? ? ? 1 : ? : 0;
      ? ? ? 1 0 : ? : 1;
      ? 0 ? 0 0 : ? : -;
      ? 0 ? x 0 : 1 : -;
      ? 0 ? 0 x : 0 : -;
      ? 1 0 0 0 : ? : 0;
      ? 1 0 0 x : ? : 0;
      ? 1 1 x 0 : ? : 1;
      ? 1 1 0 0 : ? : 1;
      ? x 0 0 0 : 0 : -;
      ? x 0 0 x : 0 : -;
      ? x 1 0 0 : 1 : -;
      ? x 1 x 0 : 1 : -;
   endtable
endprimitive

primitive latch_sr_1 (q, v, clk, d, s, r);
     output q;
   reg q;
   input v, clk, d, s, r;

   table
      * ? ? ? ? : ? : x;
      ? ? ? 1 ? : ? : 1;
      ? ? ? 0 1 : ? : 0;
      ? 0 ? 0 0 : ? : -;
      ? 0 ? x 0 : 1 : -;
      ? 0 ? 0 x : 0 : -;
      ? 1 0 0 0 : ? : 0;
      ? 1 0 0 x : ? : 0;
      ? 1 1 x 0 : ? : 1;
      ? 1 1 0 0 : ? : 1;
      ? x 0 0 0 : 0 : -;
      ? x 0 0 x : 0 : -;
      ? x 1 0 0 : 1 : -;
      ? x 1 x 0 : 1 : -;
   endtable
endprimitive
primitive dff_err (q, clk, d);
   output q;
   reg q;
   input clk, d;

   table
      (0x) ? : ? : 0;
      (1x) ? : ? : 1;
      (01) 0 : ? : 0;
      (01) 1 : ? : 1;
      (10) ? : ? : -;

   endtable
endprimitive

primitive dff (q, v, clk, d, xcr);
   output q;
   reg q;
   input v, clk, d, xcr;

   table
      *  ?   ? ? : ? : x;
      ? (x1) 0 0 : ? : 0;
      ? (x1) 1 0 : ? : 1;
      ? (x1) 0 1 : 0 : 0;
      ? (x1) 1 1 : 1 : 1;
      ? (x1) ? x : ? : -;
      ? (bx) 0 ? : 0 : -;
      ? (bx) 1 ? : 1 : -;
      ? (x0) b ? : ? : -;
      ? (x0) ? x : ? : -;
      ? (01) 0 ? : ? : 0;
      ? (01) 1 ? : ? : 1;
      ? (10) ? ? : ? : -;
      ?  b   * ? : ? : -;
      ?  ?   ? * : ? : -;
   endtable
endprimitive

primitive dff_r_err (q, clk, d, r);
   output q;
   reg q;
   input clk, d, r;

   table
       ?   0 (0x) : ? : -;
       ?   0 (x0) : ? : -;
      (0x) ?  0   : ? : 0;
      (0x) 0  x   : ? : 0;
      (1x) ?  0   : ? : 1;
      (1x) 0  x   : ? : 1;
      (10) ?  ?   : ? : -;
      (01) 0  0   : ? : 0;
      (01) 1  0   : ? : 1;
   endtable
endprimitive

primitive dff_r (q, v, clk, d, r, xcr);
   output q;
   reg q;
   input v, clk, d, r, xcr;

   table
      *  ?   ?  ?   ? : ? : x;
      ?  ?   ?  1   ? : ? : 0;
      ?  b   ? (1?) ? : 0 : -;
      ?  x   0 (1?) ? : 0 : -;
      ?  ?   ? (10) ? : ? : -;
      ?  ?   ? (x0) ? : ? : -;
      ?  ?   ? (0x) ? : 0 : -;
      ? (x1) 0  ?   0 : ? : 0;
      ? (x1) 1  0   0 : ? : 1;
      ? (x1) 0  ?   1 : 0 : 0;
      ? (x1) 1  0   1 : 1 : 1;
      ? (x1) ?  ?   x : ? : -;
      ? (bx) 0  ?   ? : 0 : -;
      ? (bx) 1  0   ? : 1 : -;
      ? (x0) 0  ?   ? : ? : -;
      ? (x0) 1  0   ? : ? : -;
      ? (x0) ?  0   x : ? : -;
      ? (01) 0  ?   ? : ? : 0;
      ? (01) 1  0   ? : ? : 1;
      ? (10) ?  ?   ? : ? : -;
      ?  b   *  ?   ? : ? : -;
      ?  ?   ?  ?   * : ? : -;
   endtable
endprimitive

primitive dff_s_err (q, clk, d, s);
   output q;
   reg q;
   input clk, d, s;

   table
       ?   1 (0x) : ? : -;
       ?   1 (x0) : ? : -;
      (0x) ?  0   : ? : 0;
      (0x) 1  x   : ? : 0;
      (1x) ?  0   : ? : 1;
      (1x) 1  x   : ? : 1;
      (10) ?  ?   : ? : -;
      (01) 0  0   : ? : 0;
      (01) 1  0   : ? : 1;

   endtable
endprimitive

primitive dff_s (q, v, clk, d, s, xcr);
   output q;
   reg q;
   input v, clk, d, s, xcr;

   table
      *  ?   ?  ?   ? : ? : x;
      ?  ?   ?  1   ? : ? : 1;
      ?  b   ? (1?) ? : 1 : -;
      ?  x   1 (1?) ? : 1 : -;
      ?  ?   ? (10) ? : ? : -;
      ?  ?   ? (x0) ? : ? : -;
      ?  ?   ? (0x) ? : 1 : -;
      ? (x1) 0  0   0 : ? : 0;
      ? (x1) 1  ?   0 : ? : 1;
      ? (x1) 1  ?   1 : 1 : 1;
      ? (x1) 0  0   1 : 0 : 0;
      ? (x1) ?  ?   x : ? : -;
      ? (bx) 1  ?   ? : 1 : -;
      ? (bx) 0  0   ? : 0 : -;
      ? (x0) 1  ?   ? : ? : -;
      ? (x0) 0  0   ? : ? : -;
      ? (x0) ?  0   x : ? : -;
      ? (01) 1  ?   ? : ? : 1;
      ? (01) 0  0   ? : ? : 0;
      ? (10) ?  ?   ? : ? : -;
      ?  b   *  ?   ? : ? : -;
      ?  ?   ?  ?   * : ? : -;
   endtable
endprimitive

`ifdef TETRAMAX

primitive dff_sr_err (q, clk, d, s, r);
   output q;
   reg q;
   input clk, d, s, r;

   table
       ?   1 (0x)  ?   : ? : -;
       ?   1 (x0)  ?   : ? : -;
       ?   0  ?   (0x) : ? : -;
       ?   0  ?   (x0) : ? : -;
      (0x) ?  0    0   : ? : 0;
      (0x) 1  x    0   : ? : 0;
      (0x) 0  0    x   : ? : 0;
      (1x) ?  0    0   : ? : 1;
      (1x) 1  x    0   : ? : 1;
      (1x) 0  0    x   : ? : 1;
   endtable
endprimitive

`else

primitive dff_sr_err (q, clk, d, s, r);
   output q;
   reg q;
   input clk, d, s, r;

   table
       ?   1 (0x)  ?   : ? : -;
       ?   1 (x0)  ?   : ? : -;
       ?   0  ?   (0x) : ? : -;
       ?   0  ?   (x0) : ? : -;
      (0x) ?  0    0   : ? : 0;
      (0x) 1  x    0   : ? : 0;
      (0x) 0  0    x   : ? : 0;
      (1x) ?  0    0   : ? : 1;
      (1x) 1  x    0   : ? : 1;
      (1x) 0  0    x   : ? : 1;
      (01) 0  0    ?   : ? : 0;
      (01) 1  ?    0   : ? : 1;
      (10) ?  0    ?   : ? : -;
      (10) ?  ?    0   : ? : -;


   endtable
endprimitive

`endif

primitive dff_sr_0 (q, v, clk, d, s, r, xcr);
   output q;
   reg q;
   input v, clk, d, s, r, xcr;

   table
   //   v,  clk, d, s, r : q' : q;

      *  ?   ?   ?   ?   ? : ? : x;
      ?  ?   ?   ?   1   ? : ? : 0;
      ?  ?   ?   1   0   ? : ? : 1;
      ?  b   ? (1?)  0   ? : 1 : -;
      ?  x   1 (1?)  0   ? : 1 : -;
      ?  ?   ? (10)  0   ? : ? : -;
      ?  ?   ? (x0)  0   ? : ? : -;
      ?  ?   ? (0x)  0   ? : 1 : -;
      ?  b   ?  0   (1?) ? : 0 : -;
      ?  x   0  0   (1?) ? : 0 : -;
      ?  ?   ?  0   (10) ? : ? : -;
      ?  ?   ?  0   (x0) ? : ? : -;
      ?  ?   ?  0   (0x) ? : 0 : -;
      ? (x1) 0  0    ?   0 : ? : 0;
      ? (x1) 1  ?    0   0 : ? : 1;
      ? (x1) 0  0    ?   1 : 0 : 0;
      ? (x1) 1  ?    0   1 : 1 : 1;
      ? (x1) ?  ?    0   x : ? : -;
      ? (x1) ?  0    ?   x : ? : -;
      ? (1x) 0  0    ?   ? : 0 : -;
      ? (1x) 1  ?    0   ? : 1 : -;
      ? (x0) 0  0    ?   ? : ? : -;
      ? (x0) 1  ?    0   ? : ? : -;
      ? (x0) ?  0    0   x : ? : -;
      ? (0x) 0  0    ?   ? : 0 : -;
      ? (0x) 1  ?    0   ? : 1 : -;
      ? (01) 0  0    ?   ? : ? : 0;
      ? (01) 1  ?    0   ? : ? : 1;
      ? (10) ?  0    ?   ? : ? : -;
      ? (10) ?  ?    0   ? : ? : -;
      ?  b   *  0    ?   ? : ? : -;
      ?  b   *  ?    0   ? : ? : -;
      ?  ?   ?  ?    ?   * : ? : -;
   endtable
endprimitive

primitive dff_ret2 (q, v, clk, d, b2, lq, xcr);
	output q;
	reg q;
	input v, clk, d, b2, lq, xcr;
// Since this is not a Physical Verilog model, , the present 
// Verilog functionality does not assume the power supply to be shut off. 
// Therefore the output will be retain its last known state during sleep mode.


        table // v clk  d  b2   lq xcr
                 *  ?   ?  ?    ?   ? : ? : x;
           	 ?  1   ?  1    0   ? : 0 : 0; // b2 and ck high is ok if lq and prev data are the same
           	 ?  1   ?  1    1   ? : 1 : 1; // 
                 ?  0   ?  1    0   ? : ? : 0; // Restore state-0 from lq input
                 ?  0   ?  1    1   ? : ? : 1; // Restore state-1 from lq input
                 ?  0   ?  1    x   ? : ? : x; // Restore state-1 from lq input
        	 ?  ?   ?  0    *   ? : ? : -; // No change for any edge on lq and b2 is low
                               
                 ?  ?   ? (10)  ?   ? : ? : -; // No change for neg-edge on b2, no other pins change
                 ?  ?   ? (x0)  ?   ? : ? : -; // No change for neg-edge on b2, no other pins change
                 ?  ?   ? (?x)  ?   ? : ? : x; // OP X if b2 = X
                               
                 ? (x1) 0  0    ?   0 : ? : 0;
        	 ? (x1) 1  0    ?   0 : ? : 1;
        	 ? (x1) 0  0    ?   1 : 0 : 0;
        	 ? (x1) 1  0    ?   1 : 1 : 1;
//        	 ? (x1) ?  ?    ?   x : ? : -;
        	 ? (x1) 0  0    ?   x : ? : 0;
        	 ? (x1) 1  0    ?   x : ? : 1;
                               
        	 ? (bx) 0  0    ?   ? : 0 : -;
                 ? (bx) 1  0    ?   ? : 1 : -;
        	 ? (x0) b  0    ?   ? : ? : -;
        	 ? (x0) ?  0    ?   x : ? : -;
                               
        	 ? (01) 0  0    ?   ? : ? : 0;
        	 ? (01) 1  0    ?   ? : ? : 1;
        	 ? (10) ?  0    ?   ? : ? : -;
        	 ?  b   *  0    ?   ? : ? : -;
        	 ?  ?   ?  0    ?   * : ? : -;


	endtable

endprimitive // dff_ret2

primitive dff_r_ret2 (q, v, clk, d, r, b2, lq, xcr);
	output q;
	reg q;
	input v, clk, d, r, b2, lq, xcr;
// Since this is not a Physical Verilog model, , the present 
// Verilog functionality does not assume the power supply to be shut off. 
// Therefore the output will be retain its last known state during sleep mode.
   
	table // v clk  d  r   b2  lq xcr
                 *  ?   ?  ?   ?   ?   ? : ? : x;
	   	 ?  1   ?  ?   1   0   ? : 0 : 0; // b1 and ck high is ok if lq and prev data are the same
	   	 ?  1   ?  0   1   1   ? : 1 : 1; // 
	         ?  0   ?  ?   1   0   ? : ? : 0; // Restore state-0 from lq input
	         ?  0   ?  0   1   1   ? : ? : 1; // Restore state-1 from lq input
		 ?  ?   ?  0   0   *   ? : ? : -; // No change for any edge on lq and b2 is low
                 ?  b   ?  ?  (1?) 0   ? : 0 : -; // No change for neg-edge on b2, prev and lq are 0, clock 1 or 0
                 ?  b   ?  0  (1?) 1   ? : 1 : -; // No change for neg-edge on b2, prev and lq are 1, clock 1 or 0
                 ?  x   0  ?  (1?) 0   ? : 0 : -; // No change for neg-edge on b2, prev and lq are 0, D is 0
                 ?  x   1  0  (1?) 1   ? : 1 : -; // No change for neg-edge on b2, prev and lq are 1, D is 1
                 ?  ?   ?  ?  (10) ?   ? : ? : -; // No change for neg-edge on b2, no other pins change
                 ?  ?   ?  ?  (x0) ?   ? : ? : -; // No change for neg-edge on b2, no other pins change
                 ?  ?   ?  ?  (0x) 0   ? : 0 : x; // 
                 ?  ?   ?  0  (0x) ?   ? : 1 : x; //
                 ?  ?   ?  1   0   ?   ? : ? : 0;
                 ?  b   ? (1?) ?   ?   ? : 0 : -;
                 ?  x   0 (1?) ?   ?   ? : 0 : -;
                 ?  ?   ? (10) ?   ?   ? : ? : -;
                 ?  ?   ? (x0) ?   ?   ? : ? : -;
                 ?  ?   ? (0x) ?   ?   ? : 0 : -;
                 ? (x1) 0  ?   0   ?   0 : ? : 0;
                 ? (x1) 1  0   0   ?   0 : ? : 1;
                 ? (x1) 0  ?   0   ?   1 : 0 : 0;
                 ? (x1) 1  0   0   ?   1 : 1 : 1;
//                 ? (x1) ?  ?   0   ?   x : ? : -;
                 ? (x1) 0  ?   0   ?   x : ? : 0;
                 ? (x1) 1  0   0   ?   x : ? : 1;
                 ? (bx) 0  ?   0   ?   ? : 0 : -;
                 ? (bx) 1  0   0   ?   ? : 1 : -;
                 ? (x0) 0  ?   0   ?   ? : ? : -;
                 ? (x0) 1  0   0   ?   ? : ? : -;
                 ? (x0) ?  0   0   ?   x : ? : -;
                 ? (01) 0  ?   0   ?   ? : ? : 0;
                 ? (01) 1  0   0   ?   ? : ? : 1;
                 ? (10) ?  ?   0   ?   ? : ? : -;
                 ?  b   *  ?   0   ?   ? : ? : -;
                 ?  ?   ?  ?   0   ?   * : ? : -;
	endtable
endprimitive // dff_r_ret2

primitive dff_s_ret2 (q, v, clk, d, s, b2, lq, xcr);
	output q;
	reg q;
	input v, clk, d, s, b2, lq, xcr;
// Since this is not a Physical Verilog model, , the present 
// Verilog functionality does not assume the power supply to be shut off. 
// Therefore the output will be retain its last known state during sleep mode.
   
	table // v clk  d  s   b2  lq xcr
                 *  ?   ?  ?   ?   ?   ? : ? : x;
                 ? (x1) ?  0   1   0   ? : 0 : 0; // b1 and ck high is ok if lq and prev data are the same
                 ? (x1) ?  ?   1   1   ? : 1 : 1; // 
                 ?  0   ?  0   1   0   ? : ? : 0; // Restore state-0 from lq input
                 ?  0   ?  0   1   1   ? : ? : 1; // Restore state-1 from lq input
                 ?  ?   ?  0   0   *   ? : ? : -; // No change for any edge on lq and b2 is low
                 ?  b   ?  0  (1?) 0   ? : 0 : -; // No change for neg-edge on b2, prev and lq are 0, clock 1 or 0
                 ?  b   ?  ?  (1?) 1   ? : 1 : -; // No change for neg-edge on b2, prev and lq are 1, clock 1 or 0
                 ?  x   0  0  (1?) 0   ? : 0 : -; // No change for neg-edge on b2, prev and lq are 0, D is 0
                 ?  x   1  ?  (1?) 1   ? : 1 : -; // No change for neg-edge on b2, prev and lq are 1, D is 1
                 ?  ?   ?  ?  (10) ?   ? : ? : -; // No change for neg-edge on b2, no other pins change
                 ?  ?   ?  ?  (x0) ?   ? : ? : -; // No change for neg-edge on b2, no other pins change
                 ?  ?   ?  0  (0x) 0   ? : 0 : -; // No change for pos-edge on b2, prev and lq are 0
                 ?  ?   ?  ?  (0x) 1   ? : 1 : x; // No change for pos-edge on b2, prev and lq are 1
                 ?  ?   ?  1   0   ?   ? : ? : 1;
                 ?  b   ? (1?) ?   ?   ? : 1 : -;
                 ?  x   1 (1?) ?   ?   ? : 1 : -;
                 ?  ?   ? (10) ?   ?   ? : ? : -;
                 ?  ?   ? (x0) ?   ?   ? : ? : -;
                 ?  ?   ? (0x) ?   ?   ? : 1 : x;  
                 ? (x1) 0  0   0   ?   0 : ? : 0;
                 ? (x1) 1  ?   0   ?   0 : ? : 1;
                 ? (x1) 1  ?   0   ?   1 : 1 : 1;
                 ? (x1) 0  0   0   ?   1 : 0 : 0;
                 // ? (x1) ?  ?   0   ?   x : ? : -;
                 ? (x1) 1  ?   0   ?   x : ? : 1;
                 ? (x1) 0  0   0   ?   x : ? : 0;
                 ? (bx) 1  ?   0   ?   ? : 1 : -;
                 ? (bx) 0  0   0   ?   ? : 0 : -;
                 ? (x0) 1  ?   0   ?   ? : ? : -;
                 ? (x0) 0  0   0   ?   ? : ? : -;
                 ? (x0) ?  0   0   ?   x : ? : -;
                 ? (01) 1  b   0   ?   ? : ? : 1;
                 ? (01) 0  0   0   ?   ? : ? : 0;
                 ? (01) ?  x   ?   ?   ? : ? : x;  
                 ? (10) ?  ?   0   ?   ? : ? : -;
                 ?  b   *  ?   0   ?   ? : ? : -;
                 ?  ?   ?  ?   0   ?   * : ? : -;
	endtable
endprimitive // dff_s_ret2

primitive dff_sr_1 (q, v, clk, d, s, r, xcr);
   output q;
   reg q;
   input v, clk, d, s, r, xcr;

   table
   // v,clk, d,  s,  r ,xcr: q' : q;

      *  ?   ?   ?   ?   ? : ? : x;
      ?  ?   ?   1   ?   ? : ? : 1;
      ?  ?   ?   0   1   ? : ? : 0;
      ?  b   ? (1?)  0   ? : 1 : -;
      ?  x   1 (1?)  0   ? : 1 : -;
      ?  ?   ? (10)  0   ? : ? : -;
      ?  ?   ? (x0)  0   ? : ? : -;
      ?  ?   ? (0x)  0   ? : 1 : -;
      ?  b   ?  0   (1?) ? : 0 : -;
      ?  x   0  0   (1?) ? : 0 : -;
      ?  ?   ?  0   (10) ? : ? : -;
      ?  ?   ?  0   (x0) ? : ? : -;
      ?  ?   ?  0   (0x) ? : 0 : -;
      ? (x1) 0  0    ?   0 : ? : 0;
      ? (x1) 1  ?    0   0 : ? : 1;
      ? (x1) 0  0    ?   1 : 0 : 0;
      ? (x1) 1  ?    0   1 : 1 : 1;
      ? (x1) ?  ?    0   x : ? : -;
      ? (x1) ?  0    ?   x : ? : -;
      ? (1x) 0  0    ?   ? : 0 : -;
      ? (1x) 1  ?    0   ? : 1 : -;
      ? (x0) 0  0    ?   ? : ? : -;
      ? (x0) 1  ?    0   ? : ? : -;
      ? (x0) ?  0    0   x : ? : -;
      ? (0x) 0  0    ?   ? : 0 : -;
      ? (0x) 1  ?    0   ? : 1 : -;
      ? (01) 0  0    ?   ? : ? : 0;
      ? (01) 1  ?    0   ? : ? : 1;
      ? (10) ?  0    ?   ? : ? : -;
      ? (10) ?  ?    0   ? : ? : -;
      ?  b   *  0    ?   ? : ? : -;
      ?  b   *  ?    0   ? : ? : -;
      ?  ?   ?  ?    ?   * : ? : -;
   endtable
endprimitive

`ifdef TETRAMAX

primitive dff_sr_ret (q, v, clk, d, s, r, xcr); // Added by Anil
   output q;
   reg q;
   input v, clk, d, s, r, xcr;
   table
 //   v,clk, d, s, r : q' : q;
      *  ?   ?   ?   ?   ? : ? : x;
      ?  ?   ?   ?   1   ? : ? : 0;
      ?  ?   ?   1   0   ? : ? : 1;
      ?  b   ? (1?)  0   ? : 1 : -;
      ?  x   1 (1?)  0   ? : 1 : -;
      ?  ?   ? (10)  0   ? : ? : -;
      ?  ?   ? (x0)  0   ? : ? : -;
      ?  ?   ? (0x)  0   ? : 1 : -;
      ?  ?   ?  x    0   ? : 1 : x; //added by Anil
      ?  b   ?  0   (1?) ? : 0 : -;
      ?  x   0  0   (1?) ? : 0 : -;
      ?  ?   ?  0   (10) ? : ? : -;
      ?  ?   ?  0   (x0) ? : ? : -;
      ?  ?   ?  0   (0x) ? : 0 : 0;
      ?  ?   ?  0    x   ? : 0 : x; //Added by Anil
      ? (x1) 0  0    ?   0 : ? : 0;
      ? (x1) 1  ?    0   0 : ? : 1;
      ? (x1) 0  0    ?   1 : 0 : 0;
      ? (x1) 1  ?    0   1 : 1 : 1;
      ? (x1) 1  0    0   x : ? : 1; // added by Anil
      ? (1x) 0  0    ?   ? : 0 : -;
      ? (1x) 1  ?    0   ? : 1 : -;
      ? (x0) 0  0    ?   ? : ? : -;
      ? (x0) 1  ?    0   ? : ? : -;
      ? (x0) ?  0    0   x : ? : -;
      ? (0x) 0  0    ?   ? : 0 : -;
      ? (0x) 1  ?    0   ? : 1 : -;
      ? (01) 0  0    ?   ? : ? : 0;
      ? (01) 1  1    0   ? : ? : 1;
      ? (01) 1  0    0   ? : ? : 1;
      ? (01) 1  x    0   ? : ? : x;
      ? (10) ?  0    ?   ? : ? : -;
      ? (10) ?  ?    0   ? : ? : -;
      ?  b   *  0    ?   ? : ? : -;
      ?  b   *  ?    0   ? : ? : -;
      ?  ?   ?  ?    ?   * : ? : -;
   endtable
endprimitive


`endif

primitive balmux4 (q, i3, i2, i1, i0, s3, s2, s1, s0, sb3, sb2, sb1, sb0);
   input i3, i2, i1, i0, s3, s2, s1, s0, sb3, sb2, sb1, sb0;
   output q;

   table
  // i3 i2 i1 i0 s3 s2 s1 s0 sb3 sb2 sb1 sb0: q
      //one 1
      1  ?  ?  ?  1  ?  ?  ?  ?   1   1   1 : 1;
      ?  1  ?  ?  ?  1  ?  ?  1   ?   1   1 : 1;
      ?  ?  1  ?  ?  ?  1  ?  1   1   ?   1 : 1;
      ?  ?  ?  1  ?  ?  ?  1  1   1   1   ? : 1;
      //four 1's
      1  1  1  1  1  1  1  1  ?   ?   ?   ? : 1;
      1  1  1  1  1  ?  ?  ?  ?   ?   ?   ? : 1;
      1  1  1  1  ?  1  ?  ?  ?   ?   ?   ? : 1;
      1  1  1  1  ?  ?  1  ?  ?   ?   ?   ? : 1;
      1  1  1  1  ?  ?  ?  1  ?   ?   ?   ? : 1;
      //three 1's
      1  1  1  ?  1  1  1  ?  ?   ?   ?   1 : 1;
      1  1  1  ?  1  ?  ?  ?  ?   ?   ?   1 : 1;
      1  1  1  ?  ?  ?  1  ?  ?   ?   ?   1 : 1;
      1  1  1  ?  ?  1  ?  ?  ?   ?   ?   1 : 1;
      
      1  1  ?  1  1  1  ?  1  ?   ?   1   ? : 1;
      1  1  ?  1  ?  ?  ?  1  ?   ?   1   ? : 1;
      1  1  ?  1  1  ?  ?  ?  ?   ?   1   ? : 1;
      1  1  ?  1  ?  1  ?  ?  ?   ?   1   ? : 1;
      
      1  ?  1  1  1  ?  1  1  ?   1   ?   ? : 1;
      1  ?  1  1  1  ?  ?  ?  ?   1   ?   ? : 1;
      1  ?  1  1  ?  ?  ?  1  ?   1   ?   ? : 1;
      1  ?  1  1  ?  ?  1  ?  ?   1   ?   ? : 1;
      
      ?  1  1  1  ?  1  1  1  1   ?   ?   ? : 1;
      ?  1  1  1  ?  ?  ?  1  1   ?   ?   ? : 1;
      ?  1  1  1  ?  1  ?  ?  1   ?   ?   ? : 1;
      ?  1  1  1  ?  ?  1  ?  1   ?   ?   ? : 1;
      //two 1's
      1  1  ?  ?  1  1  ?  ?  ?   ?   1   1 : 1;
      1  1  ?  ?  1  ?  ?  ?  ?   ?   1   1 : 1;
      1  1  ?  ?  ?  1  ?  ?  ?   ?   1   1 : 1;

      ?  1  1  ?  ?  1  1  ?  1   ?   ?   1 : 1;
      ?  1  1  ?  ?  ?  1  ?  1   ?   ?   1 : 1;
      ?  1  1  ?  ?  1  ?  ?  1   ?   ?   1 : 1;
      
      ?  ?  1  1  ?  ?  1  1  1   1   ?   ? : 1;
      ?  ?  1  1  ?  ?  ?  1  1   1   ?   ? : 1;
      ?  ?  1  1  ?  ?  1  ?  1   1   ?   ? : 1;
      
      1  ?  1  ?  1  ?  1  ?  ?   1   ?   1 : 1;
      1  ?  1  ?  ?  ?  1  ?  ?   1   ?   1 : 1;
      1  ?  1  ?  1  ?  ?  ?  ?   1   ?   1 : 1;
      
      ?  1  ?  1  ?  1  ?  1  1   ?   1   ? : 1;
      ?  1  ?  1  ?  ?  ?  1  1   ?   1   ? : 1;
      ?  1  ?  1  ?  1  ?  ?  1   ?   1   ? : 1;
      
      1  ?  ?  1  1  ?  ?  1  ?   1   1   ? : 1;
      1  ?  ?  1  ?  ?  ?  1  ?   1   1   ? : 1;
      1  ?  ?  1  1  ?  ?  ?  ?   1   1   ? : 1;
      //one 0
      0  ?  ?  ?  ?  0  0  0  0   ?   ?   ? : 0;
      ?  0  ?  ?  0  ?  0  0  ?   0   ?   ? : 0;
      ?  ?  0  ?  0  0  ?  0  ?   ?   0   ? : 0;
      ?  ?  ?  0  0  0  0  ?  ?   ?   ?   0 : 0;
      //four 0's
      0  0  0  0  ?  ?  ?  ?  0   ?   ?   ? : 0;
      0  0  0  0  ?  ?  ?  ?  ?   0   ?   ? : 0;
      0  0  0  0  ?  ?  ?  ?  ?   ?   0   ? : 0;
      0  0  0  0  ?  ?  ?  ?  ?   ?   ?   0 : 0;
      0  0  0  0  ?  ?  ?  ?  0   0   0   0 : 0;
      //three 0's
      0  0  0  ?  ?  ?  ?  0  0   0   0   ? : 0;
      0  0  0  ?  ?  ?  ?  0  ?   ?   0   ? : 0;
      0  0  0  ?  ?  ?  ?  0  0   ?   ?   ? : 0;
      0  0  0  ?  ?  ?  ?  0  ?   0   ?   ? : 0;
      
      0  0  ?  0  ?  ?  0  ?  0   0   ?   0 : 0;
      0  0  ?  0  ?  ?  0  ?  ?   ?   ?   0 : 0;
      0  0  ?  0  ?  ?  0  ?  ?   0   ?   ? : 0;
      0  0  ?  0  ?  ?  0  ?  0   ?   ?   ? : 0;
      
      0  ?  0  0  ?  0  ?  ?  0   ?   0   0 : 0;
      0  ?  0  0  ?  0  ?  ?  0   ?   ?   ? : 0;
      0  ?  0  0  ?  0  ?  ?  ?   ?   ?   0 : 0;
      0  ?  0  0  ?  0  ?  ?  ?   ?   0   ? : 0;
      
      ?  0  0  0  0  ?  ?  ?  ?   0   0   0 : 0;
      ?  0  0  0  0  ?  ?  ?  ?   ?   ?   0 : 0;
      ?  0  0  0  0  ?  ?  ?  ?   ?   0   ? : 0;
      ?  0  0  0  0  ?  ?  ?  ?   0   ?   ? : 0;
      //two 0's
      0  0  ?  ?  ?  ?  0  0  0   0   ?   ? : 0;
      0  0  ?  ?  ?  ?  0  0  ?   0   ?   ? : 0;
      0  0  ?  ?  ?  ?  0  0  0   ?   ?   ? : 0;

      ?  0  0  ?  0  ?  ?  0  ?   0   0   ? : 0;
      ?  0  0  ?  0  ?  ?  0  ?   ?   0   ? : 0;
      ?  0  0  ?  0  ?  ?  0  ?   0   ?   ? : 0;
      
      ?  ?  0  0  0  0  ?  ?  ?   ?   0   0 : 0;
      ?  ?  0  0  0  0  ?  ?  ?   ?   ?   0 : 0;
      ?  ?  0  0  0  0  ?  ?  ?   ?   0   ? : 0;
      
      0  ?  0  ?  ?  0  ?  0  0   ?   0   ? : 0;
      0  ?  0  ?  ?  0  ?  0  ?   ?   0   ? : 0;
      0  ?  0  ?  ?  0  ?  0  0   ?   ?   ? : 0;
      
      ?  0  ?  0  0  ?  0  ?  ?   0   ?   0 : 0;
      ?  0  ?  0  0  ?  0  ?  ?   ?   ?   0 : 0;
      ?  0  ?  0  0  ?  0  ?  ?   0   ?   ? : 0;
      
      0  ?  ?  0  ?  0  0  ?  0   ?   ?   0 : 0;
      0  ?  ?  0  ?  0  0  ?  ?   ?   ?   0 : 0;
      0  ?  ?  0  ?  0  0  ?  0   ?   ?   ? : 0;
   endtable
endprimitive // balmux4

