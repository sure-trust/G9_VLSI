module sram_tb(

    );
     parameter address=4,dataw=32,deep=16;
    reg clk,cs,we,oe;
    reg [address-1:0]addr;
    wire [dataw-1:0]data;
    reg [dataw-1:0]temp1;
    
    sram s1( clk,cs,we,oe,addr,data);
    always #10 clk=~clk;
    assign data=!oe?temp1:'hz;
    initial begin
    {clk,cs,we,addr,temp1,oe}<=0;
    repeat(2)@(posedge clk);
    for(integer i=0;i<2**address;i=i+1)begin
    repeat(1)@(posedge clk)addr<=i;we<=1;cs<=1;oe<=0;temp1<= $random;
    end
    for(integer i=0;i<2**address;i=i+1)begin
    repeat(1)@(posedge clk)addr<=i;we<=0;cs<=1;oe<=1;
    end
    $finish;
    end
endmodule
