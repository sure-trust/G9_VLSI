module syn_fifo_tb;
reg clk;
reg reset;
reg wen;
reg ren;
reg [7:0] din;
wire full;
wire empty;
wire [7:0] dout;

syn_fifo uut (full,empty,clk,reset,wen,ren,din,dout);
initial 
begin
	clk = 0;
	reset = 1;
	wen = 0;
	ren = 0;
	din = 0;
	#15 reset=0;
	wen=1;
	din=4'ha;
	#10 din=8'h8;
	#10 din=8'h5;
	#10 din=8'h1;
	#10 din=8'h9;
	#10 din=8'h3;
	#10 din=8'h6;
	#10 din=8'h7;
	#10 din=8'he;
	#10 wen=0;ren=1;

	#200 $finish();
end
always #5 clk=~clk;

endmodule
