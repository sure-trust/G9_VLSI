`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/10/2023 06:26:07 PM
// Design Name: 
// Module Name: CLA_tb
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



    

    module tb_cla;
    
        // Inputs
        reg [3:0] A;
        reg [3:0] B;
        reg Cin;
    
        // Outputs
        wire [3:0] Sum;
        wire Cout;
    
        // Instantiate the Unit Under Test (UUT)
        CLA uut (
            .A(A), 
            .B(B), 
            .Cin(Cin), 
            .Sum(Sum), 
            .Cout(Cout)
        );
    
     initial begin
        $monitor("A=%b, B=%b, Cin=%b, Sum=%b, Cout=%b", A, B, Cin, Sum, Cout);
    
        A = 4'b0000;
        B = 4'b0000;
        Cin = 0;
        #10;
    
        A = 4'b1101;
        B = 4'b1011;
        Cin = 1;
        #10;
    
        $finish;
    end
    
    endmodule 