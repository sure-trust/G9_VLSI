//Top module
module top_module(
input [7:0]i_txdatain,input i_clk,i_reset,i_Txstart,output [7:0]o_rxdataout);
wire txdataout;
top_tx tx(i_Txstart,i_clk,i_reset,i_txdatain,txdataout);
top_rx rx(txdataout,i_clk,i_reset,o_rxdataout);
endmodule
