`timescale 1ns / 1ps

module tb_moore;

	// Inputs
	reg clk;
	reg rst;
	reg x;

	// Outputs
	wire y;

	// Instantiate the Unit Under Test (UUT)
	moore_1010 uut (
		.clk(clk), 
		.rst(rst), 
		.x(x), 
		.y(y)
	);
	always #50 clk = ~clk; 
  
     initial begin 
         rst = 1; 
         x = 0; 
         clk = 0; 
         #100; rst = 0;  
         x = 1; 
         #100; x = 0; 
         #100; x = 1; 
         #100; x = 0;  
         #100; x = 1; 
         #100; x = 0; 
         #100; x = 1; 
         #100; x = 1;  
         #100; x = 0; 
         #100; x = 1; 
			 #100;x = 1;
			 
     end 
  
     initial begin 
         $monitor("clk=%b, rst=%b, x=%b, y=%b", clk, rst, x, y);
#3000 $finish;			
end

endmodule

