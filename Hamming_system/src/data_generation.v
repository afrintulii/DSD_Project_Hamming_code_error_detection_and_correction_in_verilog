//-----------------------------------------------------------------------------
//
// Title       : data_generation
// Design      : Hamming_system
// Author      : Asus
// Company     : KUET
//
//-----------------------------------------------------------------------------
//
// File        : D:/4.2/DSD_LAB/Hamming_code_19_13/Hamming_system/src/data_generation.v
// Generated   : Fri Jan 17 00:07:00 2025
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
//{module {data_generation}}

module data_generation ( EN ,clk ,data );

input EN;
wire EN;
input clk;
wire clk;
output [3:0] data;
reg [3:0] data;

// Initialize data to a specific value
    initial begin
        data = 4'b0111; // Start with 0
    end

    // Increment `data` on every positive clock edge when `EN` is high
    always @(posedge clk) begin
        if (EN) begin
            data <= data+1; // Increment `data` by 1
        end
    end


endmodule
