`timescale 1ns / 1ps
module tb_i2c;

	// Inputs
	reg clk;
	reg rst;
	reg enable;

	// Outputs
	wire scl;
	wire [7:0] vtg;

	// Bidirs
	wire sda;

	// Instantiate the Unit Under Test (UUT)
	i2c uut (
		.clk(clk), 
		.rst(rst), 
		.enable(enable), 
		.scl(scl), 
		.vtg(vtg), 
		.sda(sda)
	);
	initial
clk=1'b1;

always
#5 clk=~clk;

initial 
begin
rst=1;
#15 rst=0;
#10 enable=1;

#500 $finish;
end

endmodule 
