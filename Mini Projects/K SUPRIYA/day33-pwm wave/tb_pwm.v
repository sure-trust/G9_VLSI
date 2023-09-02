`timescale 1ns / 1ps

module tb_pwm;

	// Inputs
	reg clk;
	reg rst;
	reg [7:0] duty_cycle;

	// Outputs
	wire pwm_out;

	// Instantiate the Unit Under Test (UUT)
	pwm uut (
		.clk(clk), 
		.rst(rst), 
		.duty_cycle(duty_cycle), 
		.pwm_out(pwm_out)
	);
	always #10 clk=~ clk;

	initial begin
		// Initialize Inputs
		clk = 0;
		rst = 0;
		duty_cycle = 0;

		// Wait 100 ns for global reset to finish
		#100;
       repeat (100) begin
            #10 duty_cycle = duty_cycle + 8'd1;
        end
        
        #100 $finish;
end

endmodule
	
      


