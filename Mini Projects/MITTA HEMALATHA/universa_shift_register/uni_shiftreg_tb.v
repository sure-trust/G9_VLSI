module uni_shiftreg_tb;
reg clk,reset;
reg [N-1:0] pin;
reg [1:0] s;
reg sin_left,sin_right;
wire [N-1:0] q;
wire sout_left,sout_right;
parameter N=4;

uni_shiftreg uni(q,sout_left,sout_right,clk,reset,pin,s,sin_left,sin_right);
initial 
begin
	$monitor("s = %0b,sin_left= %0 b,sin_right = %0b,pin = %0b    q = %b,sout_left=%0b,sout_right=%0b",s,sin_left,sin_right,pin,q,sout_left,sout_right);
	clk = 0;
	reset = 1;
	pin = 0;
	s = 0;
	sin_left = 0;
	sin_right = 0;
	#15 reset=0;
	s=2'b10;
	sin_left=1;
	#40 s=2'b01;
	#40 s=2'b11;
	pin=4'b1010;
	#10 s=0;
	#10 $finish();
end
always #5 clk=~clk;      
endmodule
