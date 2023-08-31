`timescale 1ns / 1ps
module alu_tb();
wire [7:0] result;
wire cout;
reg [7:0] operand_a;
reg [7:0] operand_b;
reg [3:0] operation;
alu dut(result, cout, operand_a, operand_b, operation);

initial begin
operand_a = 8'b01101001; 
operand_b = 8'b11111111;  
operation = 4'b0000;    
#1000 $finish;
$monitor("time=%t operand_a=%b operand_b=%b operation=%b result=%b cout=%b",$time, operand_a, operand_b, operation, result, cout);
end

always begin
operand_a =$random; 
operand_b =$random;  
operation =$random;  
#50;
end
endmodule
