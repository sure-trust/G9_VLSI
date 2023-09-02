`timescale 1ns / 1ps

module halfsub1(a,b,difference,borrow );
input a,b;    
output  difference,borrow;
  
assign  difference= a ^ b;
assign borrow= (~a) & b;
endmodule
