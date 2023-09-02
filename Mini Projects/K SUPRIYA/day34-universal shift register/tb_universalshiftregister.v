`timescale 1ns / 1ps
module tb_universalshiftregister;

	// Inputs
	reg clk;
	reg reset;
	reg shift_left;
	reg shift_right;
	reg parallel_load;
	reg [7:0] data_in;

	// Outputs
	wire [7:0] data_out;

	// Instantiate the Unit Under Test (UUT)
	UniversalShiftRegister uut (
		.clk(clk), 
		.reset(reset), 
		.shift_left(shift_left), 
		.shift_right(shift_right), 
		.parallel_load(parallel_load), 
		.data_in(data_in), 
		.data_out(data_out)
	);

 initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    // Test scenario
    initial begin
        // Initialize signals
        reset = 1;
        shift_left = 0;
        shift_right = 0;
        parallel_load = 0;
        data_in = 8'b10101010;
  // Release reset
        #10 reset = 0;

        // Parallel load
        #10 parallel_load = 1;
        #5 parallel_load = 0;

        // Shift left
        #10 shift_left = 1;
        #5 shift_left = 0;

        // Shift right
        #10 shift_right = 1;
        #5 shift_right = 0;

        // End simulation
        #10 $finish;
end

endmodule
    
