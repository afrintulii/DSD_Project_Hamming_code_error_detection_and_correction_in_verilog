

`timescale 1ps / 1ps

//{{ Section below this comment is automatically maintained
//    and may be overwritten
//{module {control_logic}}

module control_logic ( clk ,rst ,Q ,T );

input clk;
wire clk;
input rst;
wire rst;
output [2:0] Q;
reg [2:0] Q;
output [7:0] T;
reg [7:0] T;

      // Q must be a wire since it is driven by flip-flops
reg [2:0] D;      // Inputs to the flip-flops
reg [2:0] Q_bar;  // Q_bar outputs from the flip-flops


assign  D[2] = ((~Q[2]) & Q[1] & Q[0])	 | (Q[2] & (~Q[1]) & (~Q[0])); 
assign D[1] = ((~Q[2]) & (Q[1] ^ Q[0]));  
assign D[0] = ((~Q[0]) & ((~Q[1] ) | (~Q[2])));

// Instantiate Flip-Flops
D_Flip_Flop D0 (
    .D(D[0]),
    .CLK(clk),
    .EN(1),
    .CLR(rst),
    .L(1),
    .Q(Q[0]),
    .Q_bar(Q_bar[0])
);

D_Flip_Flop D1 (
    .D(D[1]),
    .CLK(clk),
    .EN(1),
    .CLR(rst),
    .L(1),
    .Q(Q[1]),
    .Q_bar(Q_bar[1])
);

D_Flip_Flop D2 (
    .D(D[2]),
    .CLK(clk),
    .EN(1),
    .CLR(rst),
    .L(1),
    .Q(Q[2]),
    .Q_bar(Q_bar[2])
);



// Decoder Instantiation
Decoder3to8 decoder (
    .address(Q),
    .row_select(T)
);



endmodule
