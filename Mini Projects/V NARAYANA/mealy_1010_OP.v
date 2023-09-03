`timescale 1ns / 1ps
module mealy_1010_OP(x,clk,rst,out,cst);
output reg out;output reg[1:0]cst;
input clk,x,rst;
reg [1:0] nst;
parameter s0 = 2'b00,s1 = 2'b01,s2 = 2'b10,s3 = 2'b11;
always@(posedge clk)
begin
if(rst ==1)
cst =s0;
else 
cst =nst; 
end
always@(*) begin 
case(cst)
s0: if (x==1) begin nst = s1; out = 1'b0; end else  begin nst =s0; out=1'b0;end
s1: if (x==0) begin nst = s2; out = 1'b0; end else begin nst =s1; out=1'b0;end
s2: if (x==1) begin nst = s3; out = 1'b0; end else begin nst =s0; out=1'b0;end
s3: if (x==0) begin nst = s2; out = 1'b0; end else begin nst =s1; out=1'b0;end

default: nst = s0; endcase
end
endmodule
