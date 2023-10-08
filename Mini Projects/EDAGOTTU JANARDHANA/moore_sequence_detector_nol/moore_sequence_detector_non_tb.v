`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   20:52:15 08/26/2023
// Design Name:   moore_sequence_detector_nol
// Module Name:   /home/student/Desktop/New Folder/moore_sequence_detector/moore_sequence_detector_non_tb.v
// Project Name:  moore_sequence_detector
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: moore_sequence_detector_nol
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module moore_sequence_detector_nol_tb;
  reg clk, rst, x;
  wire y;
  
  moore_sequence_detector_nol dut(clk, rst, x, y);
  initial clk = 0;   
  always #2 clk = ~clk;
    
  initial begin
    $monitor("%0t: x = %0b, z = %0b", $time, x, y);
    x = 0;
    rst = 0;#1;
    rst = 1;#2;
    #4 x = 1;
    #4 x = 0;
    #4 x = 0;
    #4 x = 1;
    #4 x = 0;
    #4 x = 1;
    #4 x = 1;
    #4 x = 0;
    #4 x = 0;
    #4 x = 1;
    #4 x = 0;
    #4 x = 0;
    #4 x = 1;
    #4 x = 0;
    #4 x = 1;
    #4 x = 0;
    #4 x = 0;
    #4 x = 1;
    #20;
  end

endmodule

