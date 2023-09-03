`timescale 1ns / 1ps

module pwm( input wire clk,
    input wire rst,
    input wire [7:0] duty_cycle,
    output wire pwm_out
 );
  reg [7:0] counter = 0;
    reg pwm_out_reg = 0;
    
    always @(posedge clk or posedge rst) begin
        if (rst)
            counter <= 0;
        else begin
            if (counter < 255)
                counter <= counter + 1'b1;
            else
                counter <= 0;
        end
    end
    
    always @(posedge clk) begin
        if (counter < duty_cycle)
            pwm_out_reg <= 1'b1;
        else
            pwm_out_reg <= 1'b0;
    end
    
    assign pwm_out = pwm_out_reg;

endmodule


