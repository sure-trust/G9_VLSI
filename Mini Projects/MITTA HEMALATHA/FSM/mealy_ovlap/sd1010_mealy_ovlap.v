module sd1010_mealy_ovlap(output reg q,input clk,reset,d);
parameter init=2'b00,got1=2'b01,got10=2'b10,got101=2'b11;
reg [1:0]c_s,n_s;

always @(posedge clk)
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
		begin
			n_s<=got10;
			q<=1;
		end
	else
		n_s<=got1;
	end
	
default:begin
n_s<=init;
q<=1;
end
endcase
end
endmodule
