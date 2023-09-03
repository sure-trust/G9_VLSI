module ALU_tb;
reg [3:0] a;
reg [3:0] b;
reg en;
reg [3:0] op;
wire [7:0] out;
integer i=0;

ALU alu(out,a,b,en,op);
initial 
begin
		a = 0;
		b = 0;
		en = 0;
		op = 0;

	#15 en=1;
	a=4'b1010;b=0101;
	for(i=0;i<16;i=i+1)
	begin
		op=i;
		#10;
	end
#10 $finish();
end
endmodule  
