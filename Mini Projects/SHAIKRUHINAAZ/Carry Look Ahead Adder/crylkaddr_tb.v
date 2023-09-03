`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 30.08.2023 01:07:25
// Design Name: 
// Module Name: crylkaddr_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module crylkadr_tb();
 reg [3:0] A;
reg [3:0] B;
reg Cin;
wire [4:0] Sum;
wire Cout;
// Instantiate the carry_lookahead_adder module
crylkadr uut (
    .A(A),
    .B(B),
    .Cin(Cin),
    .Sum(Sum),
    .Cout(Cout)
);
initial begin
    A = 4'b0000;
    B = 4'b0000;
    Cin = 0;
   
    // Test Case 1
    #10 A = 4'b0110;
    #10 B = 4'b1011;
    #10 Cin = 0;
    
    // Test Case 2
    #10 A = 4'b1100;
    #10 B = 4'b0101;
    #10 Cin = 1;
   
    // Test Case 3
    #10 A = 4'b1111;
    #10 B = 4'b1111;
    #10 Cin = 1;
    
    // Add more test cases here if needed
    
    // Finish simulation
    $finish;
end
endmodule


