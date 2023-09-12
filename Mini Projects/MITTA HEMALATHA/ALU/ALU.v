module ALU(
    output reg [7:0]out,
	 input [3:0]a,b,
	 input en,
	 input [3:0]op);
always @(*)
begin
	case(op)
	4'd0:out<=a+b;
	4'd1:out<=a-b;
	4'd2:out<=a*b;
	4'd3:out<=a/b;
	4'd4:out<=a%b;
	4'd5:out<=a && b;
	4'd6:out<=a || b;
	4'd7:out<=a^b;
	4'd8:out<=~(a^b);
	4'd9:out<=~(a && b);
	4'd10:out<=~(a || b);
	4'd11:out<=!a;
	4'd12:out<=!b;
	4'd13:out<=a<<1;
	4'd14:out<=a<b;
	4'd15:out<=a>b;
	default:out<=0;
	endcase
end
endmodule
