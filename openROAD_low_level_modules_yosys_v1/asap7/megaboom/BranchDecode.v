module BranchDecode(
  input   clock,
  input   reset,
  input  [31:0] io_inst,
  output  io_is_br,
  output  io_is_jal,
  output  io_is_jalr
);
  wire [31:0] _T_11;
  wire  _T_13;
  wire [31:0] _T_15;
  wire  _T_17;
  wire  bpd_csignals_0;
  wire [31:0] _T_21;
  wire  _T_23;
  wire [31:0] _T_26;
  wire  _T_28;
  assign io_is_br = bpd_csignals_0;
  assign io_is_jal = _T_23;
  assign io_is_jalr = _T_28;
  assign _T_11 = io_inst & 32'h207f;
  assign _T_13 = _T_11 == 32'h63;
  assign _T_15 = io_inst & 32'h407f;
  assign _T_17 = _T_15 == 32'h4063;
  assign bpd_csignals_0 = _T_13 | _T_17;
  assign _T_21 = io_inst & 32'h7f;
  assign _T_23 = _T_21 == 32'h6f;
  assign _T_26 = io_inst & 32'h707f;
  assign _T_28 = _T_26 == 32'h67;
endmodule