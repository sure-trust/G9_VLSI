module sram( clk,cs,we,oe,addr,data);
    parameter address=4,dataw=32,deep=16;
    input clk,cs,we,oe;
    input [address-1:0]addr;
    inout [dataw-1:0]data;
    reg [dataw-1:0]temp;
    reg [dataw-1:0]memory [deep:0];
    always@(posedge clk)
    begin
    if(cs&we)
    memory[address]<=data;
    end
    always@(posedge clk)
    begin
    if(cs& !we)
    temp<=memory[address];
    end
    assign data =(cs&oe&!we)?temp:'hz;
endmodule
