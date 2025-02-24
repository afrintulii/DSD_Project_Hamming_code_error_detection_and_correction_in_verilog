`timescale 1ns / 1ps

module error_module_tb;

    // Inputs
    reg clk;
    reg EN;
    reg [6:0] data_in;
    reg [2:0] pos;

    // Output
    wire [6:0] data_out;

    // Instantiate the error_module
    error_module uut (
        .clk(clk),
        .EN(EN),
        .data_in(data_in),
        .data_out(data_out),
        .pos(pos)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // Clock period of 10 time units
    end

    // Test sequence
    initial begin
        // Initialize inputs
        EN = 0;
        data_in = 7'b1010101; // Initial input data
        pos = 3'b000;         // Flip bit 0
        #10;

        // Test Case 1: Enable error generation and flip bit 0
        EN = 1;
        #10;
        $display("Time: %t | data_in: %b | pos: %d | data_out: %b", $time, data_in, pos, data_out);

        // Test Case 2: Flip bit 3
        data_in = 7'b1110000;
        pos = 3'b011;         // Flip bit 3
        #10;
        $display("Time: %t | data_in: %b | pos: %d | data_out: %b", $time, data_in, pos, data_out);

        // Test Case 3: Flip bit 6
        data_in = 7'b0001111;
        pos = 3'b110;         // Flip bit 6
        #10;
        $display("Time: %t | data_in: %b | pos: %d | data_out: %b", $time, data_in, pos, data_out);

        // Test Case 4: Disable error generation
        EN = 0;
        data_in = 7'b1010101;
        pos = 3'b001;         // No flip should occur
        #10;
        $display("Time: %t | data_in: %b | pos: %d | data_out: %b", $time, data_in, pos, data_out);

        // End simulation
        $finish;
    end

    // Monitor Outputs
    always @(posedge clk) begin
        if (EN) begin
            $display("At time %t: data_in = %b, pos = %d, data_out = %b", $time, data_in, pos, data_out);
        end
    end

endmodule
