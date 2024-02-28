module uart_wb (clk, wb_rst_i, 
	wb_we_i, wb_stb_i, wb_cyc_i, wb_ack_o, wb_adr_i,
	wb_adr_int, wb_dat_i, wb_dat_o, wb_dat8_i, wb_dat8_o, wb_dat32_o, wb_sel_i,
	we_o, re_o // Write and read enable output for the core
);

input 		  clk;

// WISHBONE interface	
input 		  wb_rst_i;
input 		  wb_we_i;
input 		  wb_stb_i;
input 		  wb_cyc_i;
input [3:0]   wb_sel_i;
input [2:0] 	wb_adr_i; //WISHBONE address line

input [7:0]  wb_dat_i; //input WISHBONE bus 
output [7:0] wb_dat_o;
reg [7:0] 	 wb_dat_o;
wire [7:0] 	 wb_dat_i;
reg [7:0] 	 wb_dat_is;

output [2:0]	wb_adr_int; // internal signal for address bus
input [7:0]   wb_dat8_o; // internal 8 bit output to be put into wb_dat_o
output [7:0]  wb_dat8_i;
input [31:0]  wb_dat32_o; // 32 bit data output (for debug interface)
output 		  wb_ack_o;
output 		  we_o;
output 		  re_o;

wire 			  we_o;
reg 			  wb_ack_o;
reg [7:0] 	  wb_dat8_i;
wire [7:0] 	  wb_dat8_o;
wire [2:0]	wb_adr_int; // internal signal for address bus
reg [2:0]	wb_adr_is;
reg 								wb_we_is;
reg 								wb_cyc_is;
reg 								wb_stb_is;
wire [3:0]   wb_sel_i;
reg 			 wre ;// timing control signal for write or read enable

// wb_ack_o FSM
reg [1:0] 	 wbstate;
always  @(posedge clk or posedge wb_rst_i)
	if (wb_rst_i) begin
		wb_ack_o <= 1'b0;
		wbstate <= 0;
		wre <= 1'b1;
	end else
		case (wbstate)
			0: begin
				if (wb_stb_is & wb_cyc_is) begin
					wre <= 0;
					wbstate <= 1;
					wb_ack_o <= 1;
				end else begin
					wre <= 1;
					wb_ack_o <= 0;
				end
			end
			1: begin
			   wb_ack_o <= 0;
				wbstate <= 2;
				wre <= 0;
			end
			2: begin
				wb_ack_o <= 0;
				wbstate <= 3;
				wre <= 0;
			end
			3: begin
				wb_ack_o <= 0;
				wbstate <= 0;
				wre <= 1;
			end
		endcase

assign we_o =  wb_we_is & wb_stb_is & wb_cyc_is & wre ; //WE for registers	
assign re_o = ~wb_we_is & wb_stb_is & wb_cyc_is & wre ; //RE for registers	

// Sample input signals
always  @(posedge clk or posedge wb_rst_i)
	if (wb_rst_i) begin
		wb_adr_is <= 0;
		wb_we_is <= 0;
		wb_cyc_is <= 0;
		wb_stb_is <= 0;
		wb_dat_is <= 0;
	end else begin
		wb_adr_is <= wb_adr_i;
		wb_we_is <= wb_we_i;
		wb_cyc_is <= wb_cyc_i;
		wb_stb_is <= wb_stb_i;
		wb_dat_is <= wb_dat_i;
	end

always @(posedge clk or posedge wb_rst_i)
	if (wb_rst_i)
		wb_dat_o <= 0;
	else
		wb_dat_o <= wb_dat8_o;

always @(wb_dat_is)
	wb_dat8_i = wb_dat_is;

assign wb_adr_int = wb_adr_is;


endmodule