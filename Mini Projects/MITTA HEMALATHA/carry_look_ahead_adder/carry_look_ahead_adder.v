DESIGN:
module carry_look_ahead_adder(
						output [3:0]s,
						output cout,
						input [3:0]a,b,
						input cin);
wire [3:0]c,p,g;
assign p[0]=a[0]^b[0],
			p[1]=a[1]^b[1],
			p[2]=a[2]^b[2],
			p[3]=a[3]^b[3];
assign g[0]=a[0]&b[0],
			g[1]=a[1]&b[1],
			g[2]=a[2]&b[2],
			g[3]=a[3]&b[3];
assign s=a^b^c;
assign c[0]=cin,
			c[1]=(g[0]|(p[0]&c[0])),
			c[2]=(g[1]|(p[1]&g[0])|(p[1]&p[0]&c[0])),
			c[3]=(g[2]|(p[2]&g[1])|(p[2]&p[1]&g[0])|(p[2]&p[1]&p[0]&c[0])),
			cout=(g[3]|(p[3]&g[2])|(p[3]&p[2]&g[1])|(p[3]&p[2]&p[1]&g[0])|(p[3]&p[2]&p[1]&p[0]&c[0]));
			
endmodule
