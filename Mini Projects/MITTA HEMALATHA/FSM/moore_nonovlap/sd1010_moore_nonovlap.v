module sd1010_moore_nonovlap(input clk,reset,d,output reg q);
parameter init=3'd0,got1=3'd1,got10=3'd2,got101=3'd3,got1010=3'd4;
reg [2:0] c_s,n_s;

always@(posedge clk)
begin
if(reset)
	c_s<=init;
else
	c_s<=n_s;
end

always@(*)
begin
n_s<=c_s;
q<=0;

case(c_s)
init:begin
	if(d)
		n_s<=got1;
	end
got1:begin
	if(!d)
		n_s<=got10;
	end
got10:begin
	if(d)
		n_s<=got101;
	else
		n_s<=init;
	end
got101:begin
	if(!d)
		n_s<=got1010;
	else
		n_s<=got1;
	end
got1010:begin
	q<=1;
	if(d)
		n_s<=got1;
	else
		n_s<=init;
	end	
default:begin
n_s<=init;
q<=0;
end
endcase
end

endmodule
