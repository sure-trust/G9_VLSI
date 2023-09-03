`timescale 1ns / 1ps
module carrylook_tb();
 reg [3:0]p,q; 
 reg r;
wire [3:0]sum;
wire carry;
carrylook a1(p,q,r,sum,carry);
initial 
 begin
 p = 4'b0111;q = 4'b0101;r=1'b0;#10;
 p = 4'b1111;q = 4'b1011;r=1'b1;#10;
 p = 4'b1110;q = 4'b1010;r=1'b0;#10;
 p = 4'b1011;q = 4'b0011;r=1'b1;#10;
 $finish;
end
endmodule
