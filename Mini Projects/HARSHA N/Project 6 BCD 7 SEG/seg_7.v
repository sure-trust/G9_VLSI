`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 27.08.2023 15:59:54
// Design Name: 
// Module Name: seg_7
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


module seg_7(input a,b,c,en,output [6:0] seg);
reg [6:0]seg;
always@(*)
begin 
if(en==0)
seg=0;
else 
begin
case({a,b,c})
3'b000:seg=7'b1111110;
3'b001:seg=7'b0110000;
3'b010:seg=7'b1101101;
3'b011:seg=7'b1111001;
3'b100:seg=7'b0110011;
3'b101:seg=7'b1011011;
3'b110:seg=7'b1011111;
3'b111:seg=7'b1110000;
endcase
end
end
endmodule
