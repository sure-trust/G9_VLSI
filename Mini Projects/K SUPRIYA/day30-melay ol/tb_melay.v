`timescale 1ns / 1ps 
module tb_melay;

	// Inputs
	reg din;
	reg clk;
	reg rst;

	// Outputs
	wire dout;

	// Instantiate the Unit Under Test (UUT)
	melay uut (
		.din(din), 
		.clk(clk), 
		.rst(rst), 
		.dout(dout)
	);

	initial begin
		rst = 1;din = 0;clk = 0;
		#100; rst=0; clk=1; din=1;
		#100; din=0;
		#100; din=1;
		#100; din=0;
		#100; din=1;
		#100; din=0;
		#100; din=0;
		#100; din=1;
		#100; din=0;

  end
always
#50 clk=~clk;

initial begin
$monitor("time=%g, clk=%b, rst=%b, din=%b, dout=%b",$time,clk,rst,din,dout);
#1000 $finish;
end

      
endmodule

