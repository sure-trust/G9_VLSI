`timescale 1ns / 1ps
module single_port_ram#(parameter addr_width = 6,parameter data_width = 8,parameter depth = 32)
                        (q,data,address,we,clk);//ctrl_sig
output [data_width-1:0] q;
input [data_width-1:0] data;  
input [addr_width-1:0] address;  
input we,clk;
reg [data_width-1:0] ram [depth-1:0];

reg [addr_width-1:0] addr_reg;

always @(posedge clk)
    begin
        if(we)
           ram[address] <=data; 
        else
           addr_reg <=address;
    end
    
assign q= ram[addr_reg];
endmodule
