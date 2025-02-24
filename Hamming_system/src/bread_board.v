`timescale 1ps / 1ps

module bread_board ();

    reg clk;
    reg reset;

    reg [2:0] Q;
    wire [7:0] T;
    reg [2:0] pos;

    // Instantiate control_logic
    control_logic clu (
        .clk(clk),
        .rst(reset), 
        .Q(Q),
        .T(T)
    ); 

    reg [3:0] data;
    reg [6:0] encoded_data;

    reg [2:0] parity_bits; 

    reg [6:0] data_out;
    reg [6:0] error_data;
	reg [6:0] correct_data;	   
	reg [3:0] final_data;
	
    // Instantiate data_generation
    data_generation dg(    
        .EN(T[1]), 
        .clk(clk), 
        .data(data)
    ); 	

    // Instantiate ALU
    ALU alu(
        .clk(clk),
        .EN(T[2]),
        .data_in(data),
        .data_out(data_out)
    );  

    // Instantiate error_module
    error_module error(
        .clk(clk),
        .EN(T[3]),
        .data_in(data_out),
        .data_out(error_data),
        .pos(pos)
    ); 
	error_correction  error_correct(
   .clk(clk),                    
    .data_in(error_data),          
    .EN(T[4]),                     
    .corrected_data_out(correct_data) 
);
	  assign final_data = {correct_data[6],correct_data[5],correct_data[4],correct_data[2]};
    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // Clock period of 10 units
    end
	
    // Reset and pos initialization
    initial begin
        reset = 1;       // Initialize reset
        //pos = 3'b000;    // Initialize pos
        #10 reset = 0;   // Release reset after 10 units
        #10 pos = 3'b101; 
		
		
		#200 $finish; // End simulation after 50 time units
    end
	 
    // Monitor Output
    always @(posedge clk) begin
        $monitor("Time: %t | Q: %b | State: %b | Data: %b |Encoded:%b| Error Pos: %b | Error data:%b | Correct Data:%b | Final Data:%b", $time, Q, T, data,data_out, pos,error_data,correct_data,final_data);
    end

endmodule
