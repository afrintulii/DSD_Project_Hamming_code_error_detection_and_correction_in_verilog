module error_module ( clk, EN, data_in, data_out, pos );

input clk;
input EN;
input [6:0] data_in;
output reg [6:0] data_out;
input [2:0] pos;

 // Flip the bit at the specified position
 always @(posedge clk) begin
    if (EN) begin
        data_out <= data_in ^ (7'b1 << pos); // Flip the bit at pos
    end
 end

endmodule
