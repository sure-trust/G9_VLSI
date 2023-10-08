`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:46:35 08/27/2023 
// Design Name: 
// Module Name:    single_port_ram 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module single_port_ram(input [7:0] data, input [5:0] address, input en,write_enable,clk, output [7:0] q);

reg [7:0] ram [31:0];
reg [5:0] addr_reg;

always @(posedge clk)
    begin
	  if(en) begin
        if(write_enable)
           ram[address] <=data; 
        else
           addr_reg <=address;
		end
	  
	  else begin
	    ram[address] <= 32'bz; 
		addr_reg <= 32'bz;
	  end
	  end
    
assign q= ram[addr_reg];

endmodule 
