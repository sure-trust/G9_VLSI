`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Module Name: I2C_Protocol_tb
//////////////////////////////////////////////////////////////////////////////////

module I2C_Protocol_tb;
reg clk;
reg rst;
reg [6:0] addr;
reg [7:0] data_in;
reg enable;
reg rw;
wire [7:0] data_out;
wire ready;
wire i2c_sda;
wire i2c_scl;
  I2C_Protocol uut(
		.clk(clk), 
		.rst(rst), 
		.addr(addr), 
		.data_in(data_in), 
		.enable(enable), 
		.rw(rw), 
		.data_out(data_out), 
		.ready(ready), 
		.i2c_sda(i2c_sda), 
		.i2c_scl(i2c_scl));
	i2c_slave_controller slave (
    .sda(i2c_sda), 
    .scl(i2c_scl));
	initial begin
		clk = 0;
		forever begin
			clk = #1 ~clk;
		end		
	end
	initial begin
		clk = 0;
		rst = 1;
		#10;
		rst = 0;		
		addr = 7'b0101010;
		data_in = 8'b10101010;
		rw = 0;	
		enable = 1;
		#10;
		enable = 0;		
		#50
		$finish;	
	end      
endmodule
