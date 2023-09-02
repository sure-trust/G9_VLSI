`timescale 1ns / 1ps
///////////////////////////////////////////////////////////////////
// Module Name: univ_shift_reg_tb
/////////////////////////////////////////////////////////////////////

module univ_shift_reg_tb;
reg [7:0] ip;
reg [1:0] sh_ro_lt_rt;
reg load,rst_a,clk;
wire [7:0] op;
univ_shift_reg u1 (.op(op), .ip(ip), .sh_ro_lt_rt(sh_ro_lt_rt), .load(load) , .rst_a(rst_a) , .clk(clk));
initial
begin
clk=1'b1;
forever #10 clk=~clk;
end
initial
begin
ip = 8'b00001000;
rst_a = 1'b1;
load = 1'b1;
sh_ro_lt_rt = 2'b10;
#10;
ip = 8'b00000100;
rst_a = 1'b0;
load = 1'b1;
sh_ro_lt_rt = 2'b11;
#10;
ip = 8'b00000010;
load = 1'b0;
sh_ro_lt_rt = 2'b00;
#10;
ip = 8'b00000001;
load = 1'b1;
sh_ro_lt_rt = 2'b01;
#50;
$stop;
end 
endmodule
