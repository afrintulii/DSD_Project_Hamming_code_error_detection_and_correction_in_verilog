`timescale 1ps / 1ps

module error_correction (
    input clk,                    // Clock signal
    input [6:0] data_in,          // 7-bit encoded data: D7 D6 D5 P4 D3 P2 P1
    input EN,                     // Enable signal
    output reg [6:0] corrected_data_out // 7-bit corrected output
);

    // Internal signals
    wire x1, x2, x4;              // Parity check results
    wire [2:0] error_pos;         // Error position
    wire error_detected;          // Indicates if an error is detected

    // Calculate parity bits using the provided equations
    assign x1 = data_in[6] ^ data_in[4] ^ data_in[2] ^ data_in[0]; // Parity bit for x1
    assign x2 = data_in[6] ^ data_in[5] ^ data_in[2] ^ data_in[1]; // Parity bit for x2
    assign x4 = data_in[6] ^ data_in[5] ^ data_in[4] ^ data_in[3]; // Parity bit for x4

    // Combine x4, x2, and x1 to calculate the error position
    assign error_pos = {x4, x2, x1}; // Concatenate x4, x2, and x1 to form error position

    // Check if there is any error
    assign error_detected = |error_pos; // Check if any parity bit is 1

    // Correct the error
    always @(posedge clk) begin
        if (EN) begin
            if (error_detected) begin
                // Flip the bit at the error position in data_in
                corrected_data_out <= data_in ^ (7'b1 << (error_pos-1));
            end else begin
                // No error, pass data_in directly to corrected_data_out
                corrected_data_out <= data_in;
            end
        end
    end

endmodule
