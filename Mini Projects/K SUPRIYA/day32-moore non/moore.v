`timescale 1ns / 1ps
module moore(input din,clk,rst,
    output reg dout
    );
reg [2:0] cus,nst;
	 
parameter s0= 3'b000,
          s1= 3'b001,
			 s2= 3'b010,
			 s3= 3'b011,
			 s4= 3'b100;

always@(posedge clk)
begin
if(rst==1) begin
cus<= s0;end
else begin
cus<= nst; end
end

always@(din or cus)
begin
case(cus)
s0: if(din==1) begin
    nst = s1;
    dout = 1'b0; end
    else begin
    nst = cus;
    dout = 1'b0; end
s1: if(din==0) begin
    nst = s2;
    dout = 1'b0; end
    else begin
    nst = cus;
    dout = 1'b0; end	 
	 
s2: if(din==1) begin
    nst = s3;
    dout = 1'b0; end
    else begin
    nst = s0;
    dout = 1'b0; end
s3: if(din==0) begin
    nst = s4;
    dout = 1'b0; end
    else begin
    nst = s1;
    dout = 1'b0; end
	 
s4: if(din==1) begin
    nst = s1;
    dout = 1'b1; end
    else begin
    nst = s0;
    dout = 1'b1; end
	 default: nst =s0;
endcase
end


endmodule
