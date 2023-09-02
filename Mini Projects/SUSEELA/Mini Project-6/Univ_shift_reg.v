`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Module Name: univ_shift_reg
//////////////////////////////////////////////////////////////////////////////////

module univ_shift_reg(op,clk,rst_a, load,sh_ro_lt_rt,ip);
output reg [7:0] op;
input load;
input [1:0] sh_ro_lt_rt;
input [7:0] ip;
input clk, rst_a;
reg [7:0]temp;
always @(posedge clk or posedge rst_a)
begin
if (rst_a)
op = 0;
else
case(load)
1'b1:
begin
temp = ip;
end
1'b0:
case (sh_ro_lt_rt)
2'b00: op = temp<<1; //Left Shift
2'b01: op = temp>>1; //Right Shift
2'b10: op = {temp[6:0],temp[7]}; //Rotate Left
2'b11: op = {temp[0], temp[7:1]}; //Rotate Right
default: $display("Invalid Shift Control Input");
endcase
default: $display("Invalid Load Control Input");
endcase
end
endmodule