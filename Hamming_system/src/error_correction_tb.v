//-----------------------------------------------------------------------------
//
// Title       : error_correction_tb
// Design      : Hamming_system
// Author      : Asus
// Company     : KUET
//
//-----------------------------------------------------------------------------
//
// File        : D:/4.2/DSD_LAB/Hamming_code_19_13/Hamming_system/src/error_correction_tb.v
// Generated   : Sun Jan 19 20:44:46 2025
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
//{module {error_correction_tb}}

module error_correction_tb ();

// Inputs
    reg clk;
    reg [6:0] data_in;
    reg EN;

    // Outputs
    wire [6:0] corrected_data_out;

    // Instantiate the error_correction module
    error_correction uut (
        .clk(clk),
        .data_in(data_in),
        .EN(EN),
        .corrected_data_out(corrected_data_out)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // Clock period of 10 time units
    end

    // Test sequence
    initial begin
        // Enable the module
        EN = 1;

        // Case 1: No error (x4x2x1 = 000)
        data_in = 7'b1110101; // D7 D6 D5 P4 D3 P2 P1 = 1 0 0 0 0 1 1
        #10;
        $display("Time: %t | Data In: %b | Corrected Data Out: %b", $time, data_in, corrected_data_out);

        // Case 2: Error in D3 (x4x2x1 = 011 ? flip bit 3)
        data_in = 7'b1010111; // D6 D5 D4 P4 D3 P2 P1 = 1 0 1 0 1 1 1
        #10;
        $display("Time: %t | Data In: %b | Corrected Data Out: %b", $time, data_in, corrected_data_out);

        // Case 3: Error in D4 (x4x2x1 = 100 ? flip bit 4)
        data_in = 7'b1011011; // D6 D5 D4 P4 D3 P2 P1 = 1110101
        #10;
        $display("Time: %t | Data In: %b | Corrected Data Out: %b", $time, data_in, corrected_data_out);

        // Case 4: Error in D5 (x4x2x1 = 101 ? flip bit 5)
        data_in = 7'b1110011; // D6 D5 D4 P4 D3 P2 P1 = 1 1 1 0 0 1 1
        #10;
        $display("Time: %t | Data In: %b | Corrected Data Out: %b", $time, data_in, corrected_data_out);

        // Case 5: Error in P4 (x4x2x1 = 100 ? flip bit 4)
        data_in = 7'b1011111; // D6 D5 D4 P4 D3 P2 P1 = 1 0 1 1 1 1 1
        #10;
        $display("Time: %t | Data In: %b | Corrected Data Out: %b", $time, data_in, corrected_data_out);

        // End simulation
        $finish;
    end


endmodule
