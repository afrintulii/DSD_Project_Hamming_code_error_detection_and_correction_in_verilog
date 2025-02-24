
`timescale 1ps / 1ps

//{{ Section below this comment is automatically maintained
//    and may be overwritten
//{module {D_Flip_Flop}}

module D_Flip_Flop ( D ,CLK ,EN ,CLR ,L ,Q ,Q_bar );

input D;
wire D;
input CLK;
wire CLK;
input EN;
wire EN;
input CLR;
wire CLR;
input L;
wire L;
output Q;
reg Q;
output Q_bar;
reg Q_bar;

 // Internal signal declaration
    reg temp;

    // Asynchronous Reset and Sequential Logic
    always @(posedge CLK or posedge CLR) begin
        if (CLR) begin
            temp <= 1'b0; // Reset to 0 on CLR
        end else if (EN) begin
            if (L) begin
                temp <= D; // Load D when L is high
            end
        end
    end

    // Assign output signals
    assign Q = temp;
    assign Q_bar = ~temp;
	

endmodule
