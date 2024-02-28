module AHB_SPM #(parameter SIZE=32) (
    input  wire         HCLK,      
    input  wire         HRESETn,   
    input  wire         HSEL,      
    input  wire         HREADY,    
    input  wire [1:0]   HTRANS,    
    input  wire [2:0]   HSIZE,     
    input  wire         HWRITE,    
    input  wire [31:0]  HADDR,     
    input  wire [31:0]  HWDATA,    
    output wire         HREADYOUT, 
    output wire [1:0]   HRESP,
    output wire [31:0]  HRDATA
);

    localparam  X_OFF = 0, Y_OFF = 4, P1_OFF = 8, P2_OFF = 12;
    localparam  S0=0, S1=1, S2=2, S3=3;

    reg [7:0]   AHB_ADDR;    
    wire        ahb_access   = HTRANS[1] & HSEL & HREADY;
    wire        _ahb_write_    = ahb_access &  HWRITE;
    wire        ahb_read     = ahb_access & (~HWRITE);
    reg         AHB_WRITE;
    reg         AHB_READ;

    wire        p;
    reg [31:0]  X, Y, P0, P1; 
    reg [7:0]   CNT, ncnt;

    reg [3:0]   STATE, nstate;

    always @(posedge HCLK or negedge HRESETn)
    if(~HRESETn) begin
        AHB_WRITE   <=  1'b0;
        AHB_READ    <=  1'b0;
        AHB_ADDR    <=  8'b0;
    end
    else begin
        AHB_WRITE   <=  _ahb_write_;
        AHB_READ    <=  ahb_read;
        AHB_ADDR    <=  HADDR[7:0];  
    end

    always @(posedge HCLK or negedge HRESETn)
        if(~HRESETn)
            X  <= 32'b0;
        else if(AHB_WRITE && (AHB_ADDR == X_OFF))
            X <= HWDATA;

    always @(posedge HCLK or negedge HRESETn)
        if(~HRESETn)
            Y  <= 32'b0;
        else if(AHB_WRITE && (AHB_ADDR == Y_OFF))
            Y <= HWDATA;
        else if(STATE==S1) Y <= Y >> 1;

    always @(posedge HCLK or negedge HRESETn)
        if(~HRESETn)
            P0  <= 32'b0;
        else if(STATE==S1)
            P0 <= {p,P0[31:1]};

    always @(posedge HCLK or negedge HRESETn)
        if(~HRESETn)
            STATE  <= S0;
        else 
            STATE <= nstate;

    always @*
        case(STATE)
            S0: if(AHB_WRITE && (AHB_ADDR == Y_OFF)) nstate=S1; else nstate=S0;
            S1: if(CNT==31) nstate=S0; else nstate=S1;
        endcase
    
    always @(posedge HCLK or negedge HRESETn)
        if(~HRESETn)
            CNT  <= 8'd0;
        else 
            CNT <= ncnt;

    always @* begin
        ncnt = 0;
        if(CNT==31) ncnt <= 0;
        else if(STATE==S1) ncnt=CNT+1;
    end

    SPM spm(
      .clk(~HCLK),
      .rst(~HRESETn),
      .x(X),
      .y(Y[0]),
      .p(p)
    );

    assign HREADYOUT = (STATE == S0);

    assign HRDATA = P0;

endmodule