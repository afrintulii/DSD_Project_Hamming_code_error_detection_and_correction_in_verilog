

`timescale 1ps / 1ps

//{{ Section below this comment is automatically maintained
//    and may be overwritten
//{module {ALU_tb}}

module ALU_tb ();

// Inputs
    reg clk;
    reg EN;
    reg [3:0] data_in;

    // Outputs
    wire [6:0] data_out;

    // Instantiate the ALU module
    ALU uut (
        .clk(clk),
        .EN(EN),
        .data_in(data_in),
        .data_out(data_out)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // Clock period of 10 time units
    end

    // Test sequence
    initial begin
        // Enable the ALU
        EN = 1;

        // Case 1: Input data = 4'b0001
        data_in = 4'b1011;
        #10;
        $display("Time: %t | Data In: %b | Data Out: %b", $time, data_in, data_out);

        // Case 2: Input data = 4'b1010
        data_in = 4'b1010;
        #10;
        $display("Time: %t | Data In: %b | Data Out: %b", $time, data_in, data_out);

        // Case 3: Input data = 4'b0110
        data_in = 4'b0110;
        #10;
        $display("Time: %t | Data In: %b | Data Out: %b", $time, data_in, data_out);

        // Case 4: Input data = 4'b1111
        data_in = 4'b1111;
        #10;
        $display("Time: %t | Data In: %b | Data Out: %b", $time, data_in, data_out);

        // Disable the ALU
        EN = 0;
        data_in = 4'b0101; // Should not update data_out when EN = 0
        #10;
        $display("Time: %t | Data In: %b | Data Out: %b", $time, data_in, data_out);

        // End simulation
        $finish;
    end

endmodule
