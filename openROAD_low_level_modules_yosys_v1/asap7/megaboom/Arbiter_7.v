module Arbiter_7(
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
  output  io_in_2_ready,
  input   io_in_2_valid,
  input  [5:0] io_in_2_bits_idx,
  input  [3:0] io_in_2_bits_way_en,
  input  [19:0] io_in_2_bits_tag,
  output  io_in_3_ready,
  input   io_in_3_valid,
  input  [5:0] io_in_3_bits_idx,
  input  [3:0] io_in_3_bits_way_en,
  input  [19:0] io_in_3_bits_tag,
  output  io_in_4_ready,
  input   io_in_4_valid,
  input  [5:0] io_in_4_bits_idx,
  input  [3:0] io_in_4_bits_way_en,
  input  [19:0] io_in_4_bits_tag,
  input   io_out_ready,
  output  io_out_valid,
  output [5:0] io_out_bits_idx,
  output [3:0] io_out_bits_way_en,
  output [19:0] io_out_bits_tag,
  output [2:0] io_chosen
);
  wire [2:0] _GEN_0;
  wire [5:0] _GEN_1;
  wire [3:0] _GEN_2;
  wire [19:0] _GEN_3;
  wire [2:0] _GEN_4;
  wire [5:0] _GEN_5;
  wire [3:0] _GEN_6;
  wire [19:0] _GEN_7;
  wire [2:0] _GEN_8;
  wire [5:0] _GEN_9;
  wire [3:0] _GEN_10;
  wire [19:0] _GEN_11;
  wire [2:0] _GEN_12;
  wire [5:0] _GEN_13;
  wire [3:0] _GEN_14;
  wire [19:0] _GEN_15;
  wire  _T_184;
  wire  _T_185;
  wire  _T_186;
  wire  _T_188;
  wire  _T_190;
  wire  _T_192;
  wire  _T_194;
  wire  _T_196;
  wire  _T_197;
  wire  _T_198;
  wire  _T_199;
  wire  _T_201;
  wire  _T_202;
  assign io_in_0_ready = io_out_ready;
  assign io_in_1_ready = _T_196;
  assign io_in_2_ready = _T_197;
  assign io_in_3_ready = _T_198;
  assign io_in_4_ready = _T_199;
  assign io_out_valid = _T_202;
  assign io_out_bits_idx = _GEN_13;
  assign io_out_bits_way_en = _GEN_14;
  assign io_out_bits_tag = _GEN_15;
  assign io_chosen = _GEN_12;
  assign _GEN_0 = io_in_3_valid ? 3'h3 : 3'h4;
  assign _GEN_1 = io_in_3_valid ? io_in_3_bits_idx : io_in_4_bits_idx;
  assign _GEN_2 = io_in_3_valid ? io_in_3_bits_way_en : io_in_4_bits_way_en;
  assign _GEN_3 = io_in_3_valid ? io_in_3_bits_tag : io_in_4_bits_tag;
  assign _GEN_4 = io_in_2_valid ? 3'h2 : _GEN_0;
  assign _GEN_5 = io_in_2_valid ? io_in_2_bits_idx : _GEN_1;
  assign _GEN_6 = io_in_2_valid ? io_in_2_bits_way_en : _GEN_2;
  assign _GEN_7 = io_in_2_valid ? io_in_2_bits_tag : _GEN_3;
  assign _GEN_8 = io_in_1_valid ? 3'h1 : _GEN_4;
  assign _GEN_9 = io_in_1_valid ? io_in_1_bits_idx : _GEN_5;
  assign _GEN_10 = io_in_1_valid ? io_in_1_bits_way_en : _GEN_6;
  assign _GEN_11 = io_in_1_valid ? io_in_1_bits_tag : _GEN_7;
  assign _GEN_12 = io_in_0_valid ? 3'h0 : _GEN_8;
  assign _GEN_13 = io_in_0_valid ? io_in_0_bits_idx : _GEN_9;
  assign _GEN_14 = io_in_0_valid ? io_in_0_bits_way_en : _GEN_10;
  assign _GEN_15 = io_in_0_valid ? io_in_0_bits_tag : _GEN_11;
  assign _T_184 = io_in_0_valid | io_in_1_valid;
  assign _T_185 = _T_184 | io_in_2_valid;
  assign _T_186 = _T_185 | io_in_3_valid;
  assign _T_188 = io_in_0_valid == 1'h0;
  assign _T_190 = _T_184 == 1'h0;
  assign _T_192 = _T_185 == 1'h0;
  assign _T_194 = _T_186 == 1'h0;
  assign _T_196 = _T_188 & io_out_ready;
  assign _T_197 = _T_190 & io_out_ready;
  assign _T_198 = _T_192 & io_out_ready;
  assign _T_199 = _T_194 & io_out_ready;
  assign _T_201 = _T_194 == 1'h0;
  assign _T_202 = _T_201 | io_in_4_valid;
endmodule