//Transmitter
module top_tx(
i_Txstart,i_clk,i_reset,i_datain,o_Txdataout);
input i_Txstart,i_clk,i_reset;
input [7:0]i_datain;
output o_Txdataout;
parameter startBit=1'b0,stopBit=1'b1;
//wire [3:0]count;
wire countreached,shift,load,sel_1,sel_0,startcounter,resetcounter;
//fsm intermediate signals
wire serial_dataout; //piso intermediate signals
wire  paritybit; //paritygen intermediate signals
reg [3:0]count_clk;
wire baud_clk;
assign baud_clk=(count_clk[3]==1);
always@(posedge i_clk,negedge i_reset)
begin
	if(!i_reset)
		count_clk<=1'b0;
	else 
		count_clk<=count_clk+1'b1;
end
fsm_tx FSM(.i_Txstart(i_Txstart),
		 .i_clk(baud_clk),
		 .i_reset(i_reset),
		 .i_countreached(countreached),
		 .o_shift(shift),
		 .o_load(load),
		 .o_sel_1(sel_1),
		 .o_sel_0(sel_0),
		 .o_startcounter(startcounter),
		 .o_resetcounter(resetcounter));
piso PISO(.i_datain(i_datain),
				 .i_shift(shift),
				 .i_load(load),
				 .i_clk(baud_clk),
				 .o_serialdata(serial_dataout));
parity_gen PARITYGEN (.i_datain(i_datain),
								.i_load(load),
								.o_parity(paritybit));
mux  MUX(.i_sel_1(sel_1),	
	              .i_sel_0(sel_0),
					  .i_data_0(1'b0),
					  .i_data_1(serial_dataout),
					  .i_data_2(paritybit),
					  .i_data_3(1'b1),
                 .o_data(o_Txdataout)); 								

counter COUNTER_t(.i_reset(resetcounter),
	                  .i_clk(baud_clk),
						   .i_up(startcounter),
                     .o_countreached(countreached));	
endmodule
