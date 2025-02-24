
`timescale 1ps / 1ps

//{{ Section below this comment is automatically maintained
//    and may be overwritten
//{module {control_logic_tb}}

module control_logic_tb ();

 // Inputs
    reg clk;
    reg rst;

    // Outputs
    wire [2:0] Q;
    wire [7:0] T;

    // Instantiate the control_logic module
    control_logic uut (
        .clk(clk),
        .rst(rst),
        .Q(Q),
        .T(T)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // Clock period of 10 units
    end

    // Test sequence
    initial begin
        // Initialize inputs
        rst = 1;         // Assert reset
        #20 rst = 0;     // De-assert reset after 20 time units

        // Let the clock run and observe state transitions
        #100;

        // End simulation
        $finish;
    end

    // Monitor Outputs
    always @(posedge clk) begin
        $display("Time: %t | Reset: %b | Q: %b | T: %b", $time, rst, Q, T);
    end

endmodule
