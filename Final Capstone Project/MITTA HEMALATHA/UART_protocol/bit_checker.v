module bit_checker(
i_data,i_clk,i_baudclk,o_zerodetected,o_onedetected);
input i_data,i_baudclk,i_clk;
output reg o_zerodetected,o_onedetected;
reg [3:0] tempreg;
always@(posedge i_clk)
begin
	if(i_baudclk)
		tempreg={i_data,tempreg[3:1]};
	end
always@(posedge i_baudclk)
begin
	o_onedetected<=&(tempreg);
	o_zerodetected<=~|(tempreg);
end
endmodule
