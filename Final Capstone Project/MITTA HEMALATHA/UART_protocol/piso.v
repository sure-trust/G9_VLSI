module piso(
i_datain,i_load,i_shift,i_clk,o_serialdata);
input [7:0]i_datain;
input i_load,i_clk,i_shift;
output reg o_serialdata;
reg [7:0]temp_reg;
always@(posedge i_clk)
begin
	if(i_load)
		temp_reg<=i_datain;
	else if (i_shift)
		begin
			o_serialdata<=temp_reg[0];
			temp_reg<=temp_reg>>1;
		end
end
endmodule
