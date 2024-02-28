module Arbiter(
  input   clock,
  input   reset,
  output  io_in_0_ready,
  input   io_in_0_valid,
  input  [5:0] io_in_0_bits_idx,
  input  [3:0] io_in_0_bits_way_en,
  input  [19:0] io_in_0_bits_tag,
  output  io_in_1_ready,
  input   io_in_1_valid,
  input  [5:0] io_in_1_bits_idx,
  input  [3:0] io_in_1_bits_way_en,
  input  [19:0] io_in_1_bits_tag,
  input   io_out_ready,
  output  io_out_valid,
  output [5:0] io_out_bits_idx,
  output [3:0] io_out_bits_way_en,
  output [19:0] io_out_bits_tag,
  output  io_chosen
);
  wire  _GEN_0;
  wire [5:0] _GEN_1;
  wire [3:0] _GEN_2;
  wire [19:0] _GEN_3;
  wire  _T_110;
  wire  _T_112;
  wire  _T_114;
  wire  _T_115;
  assign io_in_0_ready = io_out_ready;
  assign io_in_1_ready = _T_112;
  assign io_out_valid = _T_115;
  assign io_out_bits_idx = _GEN_1;
  assign io_out_bits_way_en = _GEN_2;
  assign io_out_bits_tag = _GEN_3;
  assign io_chosen = _GEN_0;
  assign _GEN_0 = io_in_0_valid ? 1'h0 : 1'h1;
  assign _GEN_1 = io_in_0_valid ? io_in_0_bits_idx : io_in_1_bits_idx;
  assign _GEN_2 = io_in_0_valid ? io_in_0_bits_way_en : io_in_1_bits_way_en;
  assign _GEN_3 = io_in_0_valid ? io_in_0_bits_tag : io_in_1_bits_tag;
  assign _T_110 = io_in_0_valid == 1'h0;
  assign _T_112 = _T_110 & io_out_ready;
  assign _T_114 = _T_110 == 1'h0;
  assign _T_115 = _T_114 | io_in_1_valid;
endmodule