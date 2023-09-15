`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 30.08.2023 17:19:23
// Design Name: 
// Module Name: UART
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module uart_tx_controller(
  
  input              clk,
  input              reset_n,
  input [7:0]        i_Tx_Byte,
  input              i_Tx_Ready,
  output             o_Tx_Done,
  output             o_Tx_Active, // Asserted for 1 clk cycle after receiving one byte of data 
  output             o_Tx_Data
);
  
  localparam UART_TX_IDLE = 3'b000,
             UART_TX_START = 3'b001,
             UART_TX_DATA =  3'b010,
             UART_TX_STOP = 3'b011;
  
  reg [2:0]          r_Bit_Index;
  reg                r_Tx_Done;
  reg                r_Tx_Data;
  reg [2:0]          r_State;
  reg                r_Tx_Active;
 //UART TX Logic Implementation 
  
  always @(posedge clk or negedge reset_n)
    begin
      if(~reset_n)
        begin
          r_State <= UART_TX_IDLE;          
          r_Bit_Index <= 0;
          r_Tx_Done <= 1'b0;
          r_Tx_Data <= 1'b1;  
          r_Tx_Active <= 1'b0;
        end
      else 
        begin
          case(r_State)
        UART_TX_IDLE: begin       
          r_Bit_Index <= 0;
          r_Tx_Done <= 1'b0;
          r_Tx_Data <= 1'b1;
          if(i_Tx_Ready == 1'b1)
            begin
              r_State <= UART_TX_START;
              r_Tx_Active <= 1'b1;
            end
          else begin
              r_State <= UART_TX_IDLE;
          end
        end
        
        UART_TX_START: begin
              r_Tx_Data <= 1'b0;
              r_State <= UART_TX_DATA;    
            end          
        
        UART_TX_DATA: begin
          r_Tx_Data <= i_Tx_Byte[r_Bit_Index];      
          if(r_Bit_Index < 7 )
              begin
                r_Bit_Index <= r_Bit_Index + 1;
                r_State <= UART_TX_DATA;
              end
            else begin
                r_Bit_Index <= 0;
                r_State <= UART_TX_STOP;
            end
          end        
          
          UART_TX_STOP: begin          
              r_State <= UART_TX_IDLE;            
              r_Tx_Done <= 1'b1;
              r_Tx_Active <= 1'b0;
              r_Tx_Data <= 1'b1;
            end           
          
          default: begin
              r_State <= UART_TX_IDLE;
          end
          endcase
     end
    end
  assign o_Tx_Done = r_Tx_Done;
  assign o_Tx_Data = r_Tx_Data;
  assign o_Tx_Active = r_Tx_Active;
 endmodule
  module uart_rx_controller #(parameter RX_OVERSAMPLE = 0)(
  
  input             clk,
  input             reset_n,
  input             i_Rx_Data,
  output            o_Rx_Done,  // Asserted for 1 clk cycle after receiving one byte of data 
  output [7:0]      o_Rx_Byte
);
  
  localparam UART_RX_IDLE = 3'b000,
             UART_RX_START = 3'b001,
             UART_RX_DATA =  3'b010,
             UART_RX_STOP = 3'b011;
  
  reg [7:0]        r_Rx_Data;
  reg [2:0]        r_Bit_Index;
  reg [4:0]        r_Clk_Count;
  reg              r_Rx_Done;
  reg [2:0]        r_State;
  
   
  //UART RX Logic Implementation 
  
  always @(posedge clk or negedge reset_n)
    begin
      if(~reset_n)
        begin
          r_State <= UART_RX_IDLE;          
          r_Bit_Index <= 0;
          r_Clk_Count <= 0;
          r_Rx_Done <= 1'b0;
          r_Rx_Data <= 8'b00;
        end
      else
    begin
      case(r_State)
        UART_RX_IDLE: begin      
          r_Bit_Index <= 0;
          r_Clk_Count <= 0;
          r_Rx_Done <= 1'b0;
          if(i_Rx_Data == 1'b0)
            begin
              r_State <= UART_RX_START;
            end
          else begin
            r_State <= UART_RX_IDLE;
          end
        end
        
        UART_RX_START: begin
          if(r_Clk_Count == RX_OVERSAMPLE/2)
            begin
              if(i_Rx_Data == 1'b0)
                begin
                  r_State <= UART_RX_DATA;
                  r_Clk_Count <= 0;
                end
              else begin
                  r_State <= UART_RX_IDLE;
              end
            end
          else begin
                  r_State <= UART_RX_START;
                  r_Clk_Count <= r_Clk_Count + 1;
          end
        end
        
        UART_RX_DATA: begin
          if(r_Clk_Count < (RX_OVERSAMPLE))
            begin
              r_State <= UART_RX_DATA;
              r_Clk_Count <= r_Clk_Count + 1;
            end
          else begin
              r_Rx_Data[r_Bit_Index] <= i_Rx_Data;
              r_Clk_Count <= 0;
            if(r_Bit_Index < 7 )
              begin
                r_Bit_Index <= r_Bit_Index + 1;
                r_State <= UART_RX_DATA;
              end
            else begin
                r_Bit_Index <= 0;
                r_State <= UART_RX_STOP;
            end
          end
        end
          
          UART_RX_STOP: begin
            if(r_Clk_Count < (RX_OVERSAMPLE))
              begin
                r_State <= UART_RX_STOP;
                r_Clk_Count = r_Clk_Count + 1;
              end
            else begin
              r_State <= UART_RX_IDLE;
              r_Clk_Count <= 0;
              r_Rx_Done <= 1'b1;
            end           
          end
          default: begin
              r_State <= UART_RX_IDLE;
          end
          endcase
     end
    end
  assign o_Rx_Done = r_Rx_Done;
  assign o_Rx_Byte = r_Rx_Done ? r_Rx_Data : 8'h00;
 endmodule
`include "defines.v"
`include "baudRateGenerator.sv"
`ifdef UART_TX_ONLY
`include "uart_tx_controller.v"
`elsif UART_RX_ONLY
`include "uart_rx_controller.sv"
`else
`include "uart_tx_controller.v"
`include "uart_rx_controller.sv"
`endif


module uart_controller #(parameter CLOCK_RATE = 0,
                         parameter BAUD_RATE = 0,
                         parameter RX_OVERSAMPLE = 1)(
  
  input               clk,
  input               reset_n,
`ifdef UART_TX_ONLY
  input               i_Tx_Ready,
  input [7:0]         i_Tx_Byte,
  output              o_Tx_Active,
  output              o_Tx_Data,
  output              o_Tx_Done
`elsif UART_RX_ONLY
  input               i_Rx_Data,
  output              o_Rx_Done,
  output [7:0]        o_Rx_Byte
`else  
  input [7:0]         i_Tx_Byte,
  input               i_Tx_Ready,
  output              o_Rx_Done,  // Asserted for 1 clk cycle after receiving one byte of data 
  output [7:0]        o_Rx_Byte
  `endif
);
  
  wire                w_Rx_ClkTick, 
                      w_Tx_ClkTick;
  wire                w_Tx_Data_to_Rx;
  
  
`ifdef UART_TX_ONLY
  assign o_Tx_Data = w_Tx_Data_to_Rx;
`elsif UART_RX_ONLY
  assign w_Tx_Data_to_Rx = i_Rx_Data;
`endif
 
  
  //Instantiate Baud Rate Generator 
  
  baudRateGenerator #(CLOCK_RATE, BAUD_RATE, RX_OVERSAMPLE) xbaudRateGenerator(
    
    .clk                (clk), 
    .reset_n            (reset_n), 
    .o_Rx_ClkTick       (w_Rx_ClkTick), 
    .o_Tx_ClkTick       (w_Tx_ClkTick)
  );
  
`ifdef UART_TX_ONLY
  
  //Instantiation of TX Controller 
  uart_tx_controller xUART_TX(
    
    .clk                (w_Tx_ClkTick), 
    .reset_n            (reset_n), 
    .i_Tx_Byte          (i_Tx_Byte), 
    .i_Tx_Ready         (i_Tx_Ready), 
    .o_Tx_Done          (o_Tx_Done), 
    .o_Tx_Active        (o_Tx_Active), 
    .o_Tx_Data          (w_Tx_Data_to_Rx)
  );

`elsif UART_RX_ONLY
  
  //Instantiation of RX Controller  
  uart_rx_controller #(RX_OVERSAMPLE) xUART_RX(
    
    .clk                (w_Rx_ClkTick), 
    .reset_n            (reset_n), 
    .i_Rx_Data          (w_Tx_Data_to_Rx), 
    .o_Rx_Done          (o_Rx_Done), 
    .o_Rx_Byte          (o_Rx_Byte)
  );
  
`else
  
  //Instantiation of TX Controller 
  uart_tx_controller xUART_TX(
    
    .clk                (w_Tx_ClkTick), 
    .reset_n            (reset_n), 
    .i_Tx_Byte          (i_Tx_Byte), 
    .i_Tx_Ready         (i_Tx_Ready), 
    .o_Tx_Done          (), 
    .o_Tx_Active        (), 
    .o_Tx_Data          (w_Tx_Data_to_Rx)
  );
 
  //Instantiation of RX Controller   
  uart_rx_controller #(RX_OVERSAMPLE) xUART_RX(
    
    .clk                (w_Rx_ClkTick), 
    .reset_n            (reset_n), 
    .i_Rx_Data          (w_Tx_Data_to_Rx), 
    .o_Rx_Done          (o_Rx_Done), 
    .o_Rx_Byte          (o_Rx_Byte)
  );
 
  `endif
  
 endmodule
      


 

module baudRateGenerator#(parameter CLOCK_RATE = 25000000,
                          parameter  BAUD_RATE = 115200,
                          parameter RX_OVERSAMPLE = 16)

  // Global Signals
    ( input clk,
     input reset_n,
  // RX and TX Baud Rates
     output reg       o_Rx_ClkTick,
     output reg       o_Tx_ClkTick
);

  
  parameter TX_CNT = CLOCK_RATE/(2*BAUD_RATE);
  parameter RX_CNT = CLOCK_RATE/(2*BAUD_RATE*RX_OVERSAMPLE);
  parameter TX_CNT_WIDTH = $clog2(TX_CNT);
  parameter RX_CNT_WIDTH = $clog2(RX_CNT);
  
  reg[TX_CNT_WIDTH - 1:0] r_Tx_Counter;
  reg[RX_CNT_WIDTH - 1:0] r_Rx_Counter;
  
  //RX Baud Rate 
  
  always @(posedge clk or negedge reset_n)
    begin
      if(~reset_n)
        begin
          o_Rx_ClkTick <= 1'b0;
          r_Rx_Counter <= 0;
        end
      else if(r_Rx_Counter == RX_CNT - 1) begin
          o_Rx_ClkTick <= ~o_Rx_ClkTick;
          r_Rx_Counter <= 0;
         end
        else begin
          r_Rx_Counter <= r_Rx_Counter + 1;
        end
    end
  
  //TX Baud Rate
        
  always @(posedge clk or negedge reset_n)
    begin
      if(~reset_n)
        begin
          o_Tx_ClkTick <= 1'b0;
          r_Tx_Counter <= 0;
        end
      else if(r_Tx_Counter == TX_CNT - 1) begin
          o_Tx_ClkTick <= ~o_Tx_ClkTick;
          r_Tx_Counter <= 0;
         end
        else begin
          r_Tx_Counter <= r_Tx_Counter + 1;
        end
    end
endmodule




