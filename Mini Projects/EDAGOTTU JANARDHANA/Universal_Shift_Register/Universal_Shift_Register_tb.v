`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   22:18:13 08/26/2023
// Design Name:   universal_sr
// Module Name:   /home/student/Desktop/Sure Trust/Universal_Shift_Register/Universal_sr_tb.v
// Project Name:  Universal_Shift_Register
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: universal_sr
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module universal_sr_tb;
reg [3:0]M;
reg clr,clk;
reg [0:1]sel;
wire [3:0]Q;
universal_sr dut(clr,clk,sel,M,Q);
initial  begin 
clk=0;
repeat(100)
#10 clk=~clk;
end

initial  begin

M=4'b1011;
sel=2'b01;
clr=1'b0;
#40;

M=4'b1011;
sel=2'b10;
clr=1'b0;
#40;

M=4'b1011;
sel=2'b11;
clr=1'b0;
#40;

M=4'b1011;
sel=2'b00;
clr=1'b0;
#40;

end
endmodule