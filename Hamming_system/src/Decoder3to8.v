//-----------------------------------------------------------------------------
//
// Title       : Decoder3to8
// Design      : Hamming_system
// Author      : Asus
// Company     : KUET
//
//-----------------------------------------------------------------------------
//
// File        : D:/4.2/DSD_LAB/Hamming_code_19_13/Hamming_system/src/Decoder3to8.v
// Generated   : Thu Jan 16 23:44:36 2025
// From        : Interface description file
// By          : ItfToHdl ver. 1.0
//
//-----------------------------------------------------------------------------
//
// Description : 
//
//-----------------------------------------------------------------------------

`timescale 1ps / 1ps

//{{ Section below this comment is automatically maintained
//    and may be overwritten
//{module {Decoder3to8}}

module Decoder3to8 ( address ,row_select );

input [2:0] address;
wire [2:0] address;
output [7:0] row_select;
wire [7:0] row_select;

//}} End of automatically maintained section

// Enter your statements here // 
wire a0_not, a1_not, a2_not;
    
    not (a0_not, address[0]);
    not (a1_not, address[1]);
    not (a2_not, address[2]);

    
    and (row_select[0], a2_not, a1_not, a0_not);
    and (row_select[1], a2_not, a1_not, address[0]);
    and (row_select[2], a2_not, address[1], a0_not);
    and (row_select[3], a2_not, address[1], address[0]);
    and (row_select[4], address[2], a1_not, a0_not);
    and (row_select[5], address[2], a1_not, address[0]);
    and (row_select[6], address[2], address[1], a0_not);
    and (row_select[7], address[2], address[1], address[0]);

endmodule
