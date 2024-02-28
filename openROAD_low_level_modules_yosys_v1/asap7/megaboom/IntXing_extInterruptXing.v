module IntXing_extInterruptXing(
  input   clock,
  input   reset,
  input   io_in_0_0,
  input   io_in_0_1,
  output  io_out_0_0,
  output  io_out_0_1
);
  reg  _T_20_0_0;
  reg [31:0] _GEN_0;
  reg  _T_20_0_1;
  reg [31:0] _GEN_1;
  reg  _T_24_0_0;
  reg [31:0] _GEN_2;
  reg  _T_24_0_1;
  reg [31:0] _GEN_3;
  reg  _T_28_0_0;
  reg [31:0] _GEN_4;
  reg  _T_28_0_1;
  reg [31:0] _GEN_5;
  assign io_out_0_0 = _T_28_0_0;
  assign io_out_0_1 = _T_28_0_1;
`ifdef RANDOMIZE
  integer initvar;
  initial begin
    `ifndef verilator
      #0.002 begin end
    `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_0 = {1{$random}};
  _T_20_0_0 = _GEN_0[0:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_1 = {1{$random}};
  _T_20_0_1 = _GEN_1[0:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_2 = {1{$random}};
  _T_24_0_0 = _GEN_2[0:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_3 = {1{$random}};
  _T_24_0_1 = _GEN_3[0:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_4 = {1{$random}};
  _T_28_0_0 = _GEN_4[0:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_5 = {1{$random}};
  _T_28_0_1 = _GEN_5[0:0];
  `endif
  end
`endif
  always @(posedge clock) begin
    _T_20_0_0 <= io_in_0_0;
    _T_20_0_1 <= io_in_0_1;
    _T_24_0_0 <= _T_20_0_0;
    _T_24_0_1 <= _T_20_0_1;
    _T_28_0_0 <= _T_24_0_0;
    _T_28_0_1 <= _T_24_0_1;
  end
endmodule