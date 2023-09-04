module uni_shiftreg(output reg [N-1:0]q,
							output sout_left,sout_right,
							input clk,reset,
							input [N-1:0]pin,
							input [1:0]s,
							input sin_left,sin_right);
parameter N=4;
always @(posedge clk)
begin
	if(reset)
		q<=0;
	else
	begin
		if(s==2'b00)
			q<=q;
		else if(s==2'b01)
			q<={sin_right,q[N-1:1]};
		else if(s==2'b10)
			q<={q[N-2:0],sin_left};
		else
			q<=pin;
	end
end
assign sout_right=q[0],
			sout_left=q[N-1];
endmodule
