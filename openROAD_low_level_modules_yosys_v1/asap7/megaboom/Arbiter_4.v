module Arbiter_4(
  input   clock,
  input   reset,
  output  io_in_0_ready,
  input   io_in_0_valid,
  input   io_in_0_bits,
  output  io_in_1_ready,
  input   io_in_1_valid,
  input   io_in_1_bits,
  input   io_out_ready,
  output  io_out_valid,
  output  io_out_bits,
  output  io_chosen
);
  wire  _GEN_0;
  wire  _GEN_1;
  wire  _T_62;
  wire  _T_64;
  wire  _T_66;
  wire  _T_67;
  assign io_in_0_ready = io_out_ready;
  assign io_in_1_ready = _T_64;
  assign io_out_valid = _T_67;
  assign io_out_bits = _GEN_1;
  assign io_chosen = _GEN_0;
  assign _GEN_0 = io_in_0_valid ? 1'h0 : 1'h1;
  assign _GEN_1 = io_in_0_valid ? io_in_0_bits : io_in_1_bits;
  assign _T_62 = io_in_0_valid == 1'h0;
  assign _T_64 = _T_62 & io_out_ready;
  assign _T_66 = _T_62 == 1'h0;
  assign _T_67 = _T_66 | io_in_1_valid;
endmodule