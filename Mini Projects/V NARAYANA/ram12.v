`timescale 1ns / 1ps
module ram12(din , address,write_enable,clk,dout);
input [7:0]din;
input [5:0] address;
input write_enable;
input clk;
output [7:0]dout;

reg [7:0] ram[31:0]; // a 32 byte each one 8 bit 
reg [5:0] register;

always @(posedge clk)
begin
if (write_enable)  // write operation
  ram[address] <= din;
else 
  register <= address;
end

assign dout = ram[register];

endmodule
