`timescale 1ns / 1ps
module moore1010(x,clk,rst,out,cst  );
output reg out;output reg [2:0]cst;
input clk,x,rst;
reg [2:0]nst;
parameter s0=3'b000, s1=3'b001, s2=3'b010, s3=3'b011, s4=3'b100;
always@(posedge clk)begin 
if(rst)begin  out =0;cst =s0;end 
else begin cst =nst; case(cst) 
s0:begin out =1'b0; if(x==1) begin nst =s1;end else begin nst =s0;end end  
s1:begin out =1'b0; if(x==0) begin nst =s2;end else begin nst =s1;end end  
s2:begin out =1'b0; if(x==1) begin nst =s3;end else begin nst =s0;end end 
s3:begin out =1'b0; if(x==0) begin nst =s4;end else begin nst =s1;end end  
s4:begin out =1'b1; if(x==1) begin nst =s1;end else begin nst =s0;end end   
default:nst =s0;
endcase end
end
endmodule
