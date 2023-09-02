`timescale 1ns / 1ps
module i2c(input clk,
    input rst,
    input enable,
    output reg scl,
    output reg [7:0] vtg=0,
    inout sda
    );
reg [7:0]voltage;
reg direction=1;  
reg SDA;
assign sda=direction?SDA:1'b0;   
reg [7:0] state; 
reg [7:0] address;                  // ADDRESS including read bit
reg [7:0] count;
reg ack;
reg received_bit;
parameter STATE_IDLE=0,
          STATE_START=1,
          STATE_ADD_RW=2,
          STATE_ACK=3,
          STATE_DATA=4,
          STATE_RACK=5,
          STATE_STOP=6;
always@(negedge clk)
begin
    if(rst==1)  scl<=1;
    else begin
             if((state==STATE_IDLE)||(state==STATE_START)||(state==STATE_STOP))  
                     scl<=1;
            else    scl<=~scl;
         end 
end 
always@(posedge clk)
begin
    if(rst==1) begin
        state<=STATE_IDLE;
        direction<=1;
        SDA<=1;
        address=8'b10101011;  
        count<=8'd0;  
		   end
    else begin
        case(state)
        
       STATE_IDLE:  begin                     //idle
                        direction<=1;
                        SDA<=1;
                        if(enable)
                        state<=STATE_START;
                     end
 STATE_START: begin                       //start
                        SDA<=0;
                        count<=8;
                        state<=STATE_ADD_RW;
                    end
       STATE_ADD_RW: begin                       //address
                        if(scl==0) begin
                        SDA<=address[count-1];
                        if(count==0)  begin 
								state<=STATE_ACK;
								direction<=0;  
								end
                        else count<=count-1;
                        end
 end
       STATE_ACK:    begin                       //acknowledge by slave
                        ack=1;                 //ack<=sda for real time
                        if(ack==1) begin  
								state<=STATE_DATA; 
								count<=8;   
								end
                        else    begin 
								state<=STATE_IDLE; 
								end
                     end
       STATE_DATA:  begin                        //start to receive data by slave
									if(scl==0) begin           //data is received only when scl is low
                          received_bit<=sda;
                          voltage[0]<=received_bit;
                          voltage<=voltage<<1'b1;
                          count<=count-1'b1;
                          if(count==0) begin     
								  state<=STATE_RACK;
                          direction<=1; 
								  SDA<=1;      //actual ack
									vtg<=8'd15; //vtg<=voltage for real time
                           end
                          else    begin    // vtg<=vtg+1'b1;  // for bug test
                                 state<=STATE_DATA;  
							end
                    end
                    end
STATE_RACK:  begin                        //master acknowledging the data sent 
                       if(scl==0) begin
                        SDA<=0;             //making the line zero so that SDA toggles next when scl is one for stop
                        state<=STATE_STOP;
                    end
                    end
 STATE_STOP: begin                         //stop
                        SDA<=1;
                        state<=STATE_IDLE;
                   end
        endcase              
end
end
endmodule 
