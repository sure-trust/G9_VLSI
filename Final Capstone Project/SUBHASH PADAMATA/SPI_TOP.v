`timescale 1ns/1ps

module SPI_TOP
    #(
        parameter	clk_frequency	= 50_000_000,	//system clk frequence
                    spi_frequency	= 5_000_000,	//spi clk frequence
                    data_width		= 8	,
                    CPOL			= 0	,	
                    CPHA			= 0	)
    (
        input clk,
        input rst_n	,
        input [data_width-1:0]	data_m_in,
        input [data_width-1:0]	data_s_in,
        input start_m,
        output finish_m	,
        output [data_width-1:0]	data_m_out,
        output [data_width-1:0]	data_s_out,
        output	data_valid_s	 
    );
    
    wire MISO;
    wire MOSI;
    wire cs_n;
    wire sclk;
    
    spi_master 
    #(clk_frequency,spi_frequency ,data_width,CPOL,CPHA)
    master(clk, rst_n, data_m_in, start_m, MISO, sclk, cs_n, MOSI, finish_m, data_m_out );
    
    SPI_Slave 
    #(clk_frequency,spi_frequency ,data_width,CPOL,CPHA)
    Slave(clk, rst_n, data_s_in, sclk, cs_n, MOSI, MISO, data_valid_s, data_s_out);

endmodule