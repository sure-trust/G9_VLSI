`timescale 1ns / 1ps
module jkff(q,qn,jk,clk); 
output q,qn; 
reg q,qn;
input [1:0]jk;
input clk; 
    always @ (posedge clk)
    begin
    case({jk}) 
     2'b00:q = q;
         2'b01:q = 0;     
         2'b10:q = 1;
              2'b11:q = ~q;
    endcase
    qn = ~q;
    end
endmodule
