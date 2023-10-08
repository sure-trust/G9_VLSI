module RAM_tb;
reg [3:0] add1,add2;
reg [7:0] din;
reg wen,clk,en;
wire [7:0] do1,do2;
integer i=0;	
RAM ram1(do1,do2,add1,add2,din,wen,clk,en);
initial 
begin
	add1 = 0;add2=0;
	din = 0;
	wen = 0;
	clk = 0;
	en = 0;
	#15 en=1;
	wen=1;
	for(i=0;i<16;i=i+1)
	begin
		add1=i;
		din=$random();
		#10;
	end
end
initial 
begin
	add1 = 0;add2=0;
	din = 0;
	wen = 0;
	clk = 0;
	en = 0;
	#15 en=1;
	for(i=0;i<16;i=i+1)
	begin
	#20
		add2=i;
	end
	#10 $finish();
end
always #5 clk=~clk;     
endmodule
