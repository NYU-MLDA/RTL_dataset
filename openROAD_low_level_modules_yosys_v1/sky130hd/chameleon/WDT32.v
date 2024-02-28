module WDT32 (
		input wire clk,
		input wire rst,
		output reg [31:0] WDTMR,
		input wire [31:0] WDLOAD,
		output reg WDOV,
		input wire WDOVCLR,
		input wire WDEN
);

	wire	wdov = (WDTMR == 32'd0);
	
	// WDTimer
	always @(posedge clk or posedge rst)
	begin
		if(rst)
			WDTMR <= 32'h0;
		else if(wdov & WDEN)
			WDTMR <= WDLOAD;
		else if(WDEN)
			WDTMR <= WDTMR - 32'd1;
		else if(~WDEN)
		  WDTMR <= 32'h0;
	end
	
	reg wden_p;
	always @(posedge clk) 
	  wden_p <= WDEN;

	always @(posedge clk or posedge rst)
	begin
		if(rst)
			WDOV <= 1'd0;
		else if(WDOVCLR)
			WDOV <= 1'd0;
		else if(wdov & wden_p)
			WDOV <= 1'd1;
	end

endmodule