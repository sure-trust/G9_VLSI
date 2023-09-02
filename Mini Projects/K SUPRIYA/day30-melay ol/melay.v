`timescale 1ns / 1ps
module melay( input din,clk,rst,
    output reg dout
    );
reg [1:0] cus,nst;
parameter s0= 2'b00,
          s1= 2'b01,
			 s2= 2'b10,
			 s3= 2'b11;

always@(posedge clk)
begin
if(rst==1) begin
cus<= s0; end
else begin
cus<= nst; end
end

always@(cus or din)
begin
case(cus)
s0: if(din==1) begin
    nst= s1; 
	 dout= 1'b0; end
	 else begin
	 nst= cus; 
	 dout= 1'b0; end
s1: if(din==0) begin
    nst= s2; 
	 dout= 1'b0; end
	 else begin
	 nst= cus; 
	 dout= 1'b0; end

s2: if(din==1) begin
    nst= s3; 
	 dout= 1'b0; end
	 else begin
	 nst= s0; 
	 dout= 1'b0; end
s3: if(din==0) begin
    nst= s2; 
	 dout= 1'b1; end
	 else begin
	 nst= s1; 
	 dout= 1'b0; end

default: nst= s0; 	 
	 
endcase
end


endmodule
