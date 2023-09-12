`timescale 1ns / 1ps

// 
//////////////////////////////////////////////////////////////////////////////////


 module sine_wave_gen_tb(); 
reg clk;           
wire [7:0]
data_out; 
sine_wave_gen s1 (clk,data_out); 
always #5 clk = ~clk; 
 initial          
  begin 
          clk= 0; 

 end 
endmodule 

