`timescale 1ns / 1ps
//Overlapping Moore Sequence Detector
module moore_overlapping(out,clk,rst,in);
output out;
input clk,rst,in;
parameter s0=4'h1,
          s1=4'h2,
          s2=4'h3,
          s3=4'h4,
          s4=4'h5;
reg [3:0] cs,ns;
assign out = cs == s4 ? 1 : 0;
always @(posedge clk)
begin
    if(rst)
        cs<=s0;
    else
        cs<=ns;
end

always @(cs or in)
begin
    case(cs)
        s0:begin
            if(in==1)
                ns<=s1;
            else
                ns<=s0;
            end
        s1:begin
            if(in==1)
                ns<=s1;
            else
                ns<=s2;
            end
        s2:begin
                if(in==1)
                    ns<=s3;
                else
                    ns<=s0;
                end       
        s3:begin
                    if(in==1)
                        ns<=s1;
                    else
                        ns<=s4;
                    end
        s4:begin
                    if(in==1)
                        ns<=s3;
                    else
                        ns<=s0;
                    end
    endcase
end

endmodule
