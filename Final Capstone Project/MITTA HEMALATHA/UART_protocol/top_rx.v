module top_rx(
i_datain,i_clk,i_reset,o_dataout);
input i_clk,i_datain,i_reset;
output [7:0]o_dataout;
//input parityerror;
wire  zerodetected,onedetected,parityerror,countreached,shift,startcount,resetcounter,outputenable; //fsm intermediate signals
wire [7:0] pardataout;
assign o_dataout = (outputenable) ? pardataout : 8'bz;
//-------- Baud clock generator ----- F/8 of i_clk -----
	reg [3:0] count_clk; 
	wire baud_clk;
	assign baud_clk = (count_clk[3] == 1);	
	always@(posedge i_clk,negedge i_reset)
	   begin
	      if(!i_reset)
		      count_clk <= 1'b0;
		  else 
              count_clk <= count_clk + 1'b1;		  
	   end
//------------Module instantiations-------------

fsm_rx FSM_RX(	  .i_onedetected(onedetected),
				  .i_zerodetected(zerodetected),
				  .i_parityerror(parityerror),
				  .i_clk(baud_clk),
				  .i_reset(i_reset),
				  .i_countreached(countreached),
				  .o_shift(shift),
				  .o_startcount(startcount),
				  .o_resetcounter(resetcounter),
				  .o_outputenable(outputenable));
sipo SIPO_RX(.i_onedetected(onedetected),
					 .i_zerodetected(zerodetected),
					 .i_baudclk(baud_clk),
					 .i_shift(shift),
					 .o_parallelout(pardataout));
bit_checker BITCHK_RX(.i_data(i_datain),
				.i_clk(i_clk),
				.i_baudclk(baud_clk),
				.o_zerodetected(zerodetected),
				.o_onedetected(onedetected));
counter_rx COUNTER_RX(.i_reset(resetcounter),
							 .i_clk(baud_clk),
							 .i_up(startcount),
							 .o_countreached(countreached));
parity_checker PARITYCHECKER_RX(.i_datain(pardataout), .i_zerodetected(zerodetected), .i_onedetected(onedetected), .o_parityerror(parityerror));
endmodule
