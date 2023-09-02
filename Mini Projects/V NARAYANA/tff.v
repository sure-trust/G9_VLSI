`timescale 1ns / 1ps
module tff(q,t,clk,rst);
    output q;
    reg q;
    input t,clk,rst;
    initial  begin q = 0; end
    always@(posedge clk )
    begin 
    if(rst==1)
    q = 0;
    else if(t==0)
    q=q;
    else if(t==1)
    q=~q;
    end
    endmodule
