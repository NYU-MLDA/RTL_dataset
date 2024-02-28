module FLASH_READER #(parameter LINE_SIZE=128)(
    input   wire                    clk,
    input   wire                    rst_n,
    input   wire [23:0]             addr,
    input   wire                    rd,
    output  wire                    done,
    output  wire [LINE_SIZE-1: 0]   line,      

    output  reg                     sck,
    output  reg                     ce_n,
    input   wire[3:0]               din,
    output      [3:0]               dout,
    output  wire                    douten
);

    localparam LINE_BYTES = LINE_SIZE/8;
    localparam LINE_CYCLES = LINE_BYTES * 8;

    parameter IDLE=1'b0, READ=1'b1;

    reg         state, nstate;
    reg [7:0]   counter;
    reg [23:0]  saddr;
    reg [7:0]   data [LINE_BYTES-1 : 0]; 

    reg         first;

    wire[7:0]   EBH     = 8'heb;
    
    // for debugging
    wire [7:0] data_0 = data[0];
    wire [7:0] data_1 = data[1];
    wire [7:0] data_15 = data[15];


    always @*
        case (state)
            IDLE: if(rd) nstate = READ; else nstate = IDLE;
            READ: if(done) nstate = IDLE; else nstate = READ;
        endcase 

    always @ (posedge clk or negedge rst_n)
        if(!rst_n) first = 1'b1;
        else if(first & done) first <= 0;

    
    always @ (posedge clk or negedge rst_n)
        if(!rst_n) state = IDLE;
        else state <= nstate;

    always @ (posedge clk or negedge rst_n)
        if(!rst_n) sck <= 1'b0;
        else if(~ce_n) sck <= ~ sck;
        else if(state == IDLE) sck <= 1'b0;

    always @ (posedge clk or negedge rst_n)
        if(!rst_n) ce_n <= 1'b1;
        else if(state == READ) ce_n <= 1'b0;
        else ce_n <= 1'b1;

    always @ (posedge clk or negedge rst_n)
        if(!rst_n) counter <= 8'b0;
        else if(sck & ~done) counter <= counter + 1'b1;
        else if(state == IDLE) 
            if(first) counter <= 8'b0;
            else counter <= 8'd8;

    always @ (posedge clk or negedge rst_n)
        if(!rst_n) saddr <= 24'b0;
        else if((state == IDLE) && rd) saddr <= addr;

    always @ (posedge clk)
        if(counter >= 20 && counter <= 19+LINE_BYTES*2)
            if(sck) data[counter/2 - 10] <= {data[counter/2 - 10][3:0], din}; // Optimize!

    //assign busy = (state == READ);

    assign dout     =   (counter < 8)   ? EBH[7 - counter] :
                        (counter == 8)  ? saddr[23:20] : 
                        (counter == 9)  ? saddr[19:16] :
                        (counter == 10)  ? saddr[15:12] :
                        (counter == 11)  ? saddr[11:8] :
                        (counter == 12)  ? saddr[7:4] :
                        (counter == 13)  ? saddr[3:0] :
                        (counter == 14)  ? 4'hA :
                        (counter == 15)  ? 4'h5 : 4'h0;    
        
    assign douten   = (counter < 20);

    assign done     = (counter == 19+LINE_BYTES*2);


    generate
        genvar i; 
        for(i=0; i<LINE_BYTES; i=i+1)
            assign line[i*8+7: i*8] = data[i];
    endgenerate

endmodule