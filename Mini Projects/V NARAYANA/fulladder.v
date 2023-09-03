`timescale 1ns / 1ps
module fulladder(a,b,c,sum,carry);
input a,b,c;  
output sum ;
output carry;
assign sum = a^b^c;    
assign carry = (a&b)|(b&c)|(a&c);
endmodule
