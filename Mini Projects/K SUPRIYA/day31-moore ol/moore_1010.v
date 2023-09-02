`timescale 1ns / 1ps
module moore_1010(clk,rst,x,y);
input clk,rst,x;
output reg y;
parameter a=3'd0,b=3'd1,c=3'd2,d=3'd3,e=3'd4;
reg[2:0] presentstate,nextstate;

always@(posedge clk)
begin
	if(rst)
	presentstate<=a;
	else
	presentstate<=nextstate;
end

always@(*)
begin
	
	case(presentstate)
	a:begin
			if(x==1'b1)
			nextstate=b;
			else 
			nextstate=presentstate;
			end
	b:begin
			if(x==1'b0)
			nextstate=c;
			else
			nextstate=presentstate;
			end
	c:begin
			if(x==1'b1)
			nextstate=d;
			else
			nextstate=a;
			end
	d:begin
			if(x==1'b0)
			nextstate=e;
			else
			nextstate=c;
			end
	e:begin
			y=1'b1;
			if(x==1'b0)
			nextstate=a;
			else
			nextstate=c;
			end
			default:begin
			nextstate=a;
			y=1'b0;
			end
			endcase
			end
	

endmodule
