

`timescale 1ps / 1ps

//{{ Section below this comment is automatically maintained
//    and may be overwritten
//{module {ALU}}

module ALU ( clk ,EN ,data_in ,data_out );

input clk;
wire clk;
input EN;
wire EN;
input [3:0] data_in;
reg [3:0] data_in;
output [6:0] data_out;
reg [6:0] data_out;

reg p1, p2, p4;

   // Encoding logic	
   always @(posedge clk) begin
        if (EN) begin
            // Calculate parity bits
           assign p1 = data_in[0] ^ data_in[1] ^ data_in[3];
            assign p2 = data_in[0] ^ data_in[2] ^ data_in[3];
            assign p4 = data_in[1] ^ data_in[2] ^ data_in[3];

            // Construct output with parity bits
            //data_out <= {p1, p2, data_in[0], p4, data_in[1], data_in[2], data_in[3]}; 	 
			data_out <= {data_in[3], data_in[2],data_in[1],p4 , data_in[0],p2 , p1};
			
        end 
	  end
endmodule
