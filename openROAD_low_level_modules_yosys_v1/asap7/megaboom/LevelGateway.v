module LevelGateway(
  input   clock,
  input   reset,
  input   io_interrupt,
  output  io_plic_valid,
  input   io_plic_ready,
  input   io_plic_complete
);
  reg  inFlight;
  reg [31:0] _GEN_2;
  wire  _T_12;
  wire  _GEN_0;
  wire  _GEN_1;
  wire  _T_16;
  wire  _T_17;
  assign io_plic_valid = _T_17;
  assign _T_12 = io_interrupt & io_plic_ready;
  assign _GEN_0 = _T_12 ? 1'h1 : inFlight;
  assign _GEN_1 = io_plic_complete ? 1'h0 : _GEN_0;
  assign _T_16 = inFlight == 1'h0;
  assign _T_17 = io_interrupt & _T_16;
`ifdef RANDOMIZE
  integer initvar;
  initial begin
    `ifndef verilator
      #0.002 begin end
    `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_2 = {1{$random}};
  inFlight = _GEN_2[0:0];
  `endif
  end
`endif
  always @(posedge clock) begin
    if (reset) begin
      inFlight <= 1'h0;
    end else begin
      if (io_plic_complete) begin
        inFlight <= 1'h0;
      end else begin
        if (_T_12) begin
          inFlight <= 1'h1;
        end
      end
    end
  end
endmodule