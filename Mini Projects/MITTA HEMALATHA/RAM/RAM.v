module RAM(
				output [7:0]do1,do2,
				input [3:0]add1,add2,
				input [7:0]din,
				input wen,clk,en
				);

reg [7:0] ram[15:0];
reg [3:0]radd1,radd2;
always @(posedge clk)
begin
	if(en)
	begin
		if(wen)
			ram[add1]<=din;
		radd1<=add1;
		radd2<=add2;
	end
end
assign do1= ram[radd1],
	do2=ram[radd2];
endmodule
