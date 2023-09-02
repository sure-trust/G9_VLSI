`timescale 1ns / 1ps
module moore_1010_OP(x,clk,rst,cst,out );
output reg out; output reg [2:0]cst;
input clk,x,rst; reg [2:0]nst;
parameter s0 =2'b00,s1 =2'b01,s2=2'b10,s3=2'b11,s4=3'b100;
always @(posedge clk)begin 
if(rst ==1)begin
out = 1'b0; cst= s0;nst =s0;
end 
else  begin cst =nst;
case(cst)
s0:begin out= 1'b0; if(x==1) begin nst =s1;  end else begin nst =s0; end end          
s1:begin out= 1'b0; if(x==0) begin nst =s2;  end else begin nst =s1; end end
s2:begin out= 1'b0; if(x==1) begin nst =s3;  end else begin nst =s0; end end
s3:begin out= 1'b0; if(x==0) begin nst =s4;  end else begin nst =s1; end end
s4:begin out= 1'b1; if(x==1) begin nst =s3;  end else begin nst =s0; end end 
default : nst=s0;
endcase
end
end
endmodule
