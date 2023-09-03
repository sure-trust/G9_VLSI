`timescale 1ns/1ps

module spi_master
    #(
        parameter	clk_frequency	= 50_000_000,
                    spi_frequency	= 5_000_000	,	
                    data_width		= 8	,
                    CPOL			= 0	,//mode 0 default
                    CPHA			= 0	
    )
    (
        input clk,	
        input rst_n	,	
        input [data_width-1:0]data_in,
        input start,
        input MISO,	
        output	reg	sclk,	
        output	reg	cs_n,
        output	MOSI,
        output	reg	finish,
        output	reg [data_width-1:0]data_out//the data received by MISO,valid when the finish is high
    );
    
    localparam	frequency_count	= clk_frequency/spi_frequency - 1	,
                SHIFT_WIDTH		= log2(data_width)					,
                CNT_WIDTH		= log2(frequency_count)				;
    
    localparam	IDLE	=	3'b000	,
                LOAD	=	3'b001	,
                SHIFT	=	3'b010	,
                DONE	=	3'b100	;
    
    reg	[2:0]cstate	;	
    reg	[2:0]nstate	;
    reg	clk_cnt_en	;	//to generate sclk
    reg	sclk_a;	
    reg	sclk_b;
    wire sclk_posedge;
    wire sclk_negedge;
    wire shift_en;	
    wire sampl_en;	
    reg	[CNT_WIDTH-1:0]	clk_cnt;	//to generate sclk
    reg	[SHIFT_WIDTH-1:0]shift_cnt;	
    reg	[data_width-1:0]data_reg;	
   
    //counter to generate the sclk
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) 
            clk_cnt <= 'd0;
        else if (clk_cnt_en) 
            if (clk_cnt == frequency_count) 
                clk_cnt <= 'd0;
            else
                clk_cnt <= clk_cnt + 1'b1;
        else
            clk_cnt <= 'd0;
    end
    
    //TO generate the sclk
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) 
            sclk <= CPOL;
        else if (clk_cnt_en) 
            if (clk_cnt == frequency_count)  	
                sclk <= ~sclk; 
            else 
                sclk <= sclk;
        else
            sclk <= CPOL;
    end

    //to capture the edge of sclk
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            sclk_a <= CPOL;
            sclk_b <= CPOL;
        end else if (clk_cnt_en) begin
            sclk_a <= sclk;
            sclk_b <= sclk_a;
        end
    end
    
    assign sclk_posedge = ~sclk_b & sclk_a;
    assign sclk_negedge = ~sclk_a & sclk_b;

    //GENERATE BLOCKS
    generate
        case (CPHA)
            0: assign sampl_en = sclk_posedge;
            1: assign sampl_en = sclk_negedge;
            default: assign sampl_en = sclk_posedge;
        endcase
    endgenerate
    
    generate
        case (CPHA)
            0: assign shift_en = sclk_negedge;
            1: assign shift_en = sclk_posedge;
            default: assign shift_en = sclk_posedge;
        endcase
    endgenerate
    
    //FSM-1
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) 
            cstate <= IDLE;
        else 
            cstate <= nstate;
    end
    
    //FSM-2
    always @(*) begin
        case (cstate)
            IDLE	: nstate = start ? LOAD : IDLE;
            LOAD	: nstate = SHIFT;
            SHIFT	: nstate = (shift_cnt == data_width) ? DONE : SHIFT;
            DONE	: nstate = IDLE;
            default: nstate = IDLE;
        endcase
    end
    
    //FSM-3
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            clk_cnt_en	<= 1'b0	;
            data_reg	<= 'd0	;
            cs_n		<= 1'b1	;
            shift_cnt	<= 'd0	;
            finish <= 1'b0	;
        end else begin
            case (nstate)
                IDLE	: begin
                    clk_cnt_en	<= 1'b0	;
                    data_reg	<= 'd0	;
                    cs_n		<= 1'b1	;
                    shift_cnt	<= 'd0	;
                    finish 		<= 1'b0	;
                end
                LOAD	: begin
                    clk_cnt_en	<= 1'b1		;
                    data_reg	<= data_in	;
                    cs_n		<= 1'b0		;
                    shift_cnt	<= 'd0		;
                    finish 		<= 1'b0		;
                end
                SHIFT	: begin
                    if (shift_en) begin
                        shift_cnt	<= shift_cnt + 1'b1 ;
                        data_reg	<= {data_reg[data_width-2:0],1'b0};
                    end else begin
                        shift_cnt	<= shift_cnt	;
                        data_reg	<= data_reg		;
                    end
                    clk_cnt_en	<= 1'b1	;
                    cs_n		<= 1'b0	;
                    finish 		<= 1'b0	;
                end
                DONE	: begin
                    clk_cnt_en	<= 1'b0	;
                    data_reg	<= 'd0	;
                    cs_n		<= 1'b1	;
                    data_reg	<= 'd0	;
                    finish 		<= 1'b1	;
                end
                default	: begin
                    clk_cnt_en	<= 1'b0	;
                    data_reg	<= 'd0	;
                    cs_n		<= 1'b1	;
                    data_reg	<= 'd0	;
                    finish 		<= 1'b0	;
                end
            endcase
        end
    end
    
    //MOSI output MSB first
    assign MOSI = data_reg[data_width-1];
    
    //sample data from the MISO line
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) 
            data_out <= 'd0;
        else if (sampl_en) 
            data_out <= {data_out[data_width-1:0],MISO};
        else
            data_out <= data_out;
    end
    
    //to get the width of data 
    function integer log2(input integer v);
      begin
        log2=0;
        while(v>>log2) 
          log2=log2+1;
      end
    endfunction

endmodule


