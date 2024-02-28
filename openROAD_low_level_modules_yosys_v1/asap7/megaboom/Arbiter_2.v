module Arbiter_2(
  input   clock,
  input   reset,
  output  io_in_0_ready,
  input   io_in_0_valid,
  input  [19:0] io_in_0_bits_tag,
  input  [5:0] io_in_0_bits_idx,
  input  [1:0] io_in_0_bits_source,
  input  [2:0] io_in_0_bits_param,
  input  [3:0] io_in_0_bits_way_en,
  input   io_in_0_bits_voluntary,
  output  io_in_1_ready,
  input   io_in_1_valid,
  input  [19:0] io_in_1_bits_tag,
  input  [5:0] io_in_1_bits_idx,
  input  [1:0] io_in_1_bits_source,
  input  [2:0] io_in_1_bits_param,
  input  [3:0] io_in_1_bits_way_en,
  input   io_in_1_bits_voluntary,
  input   io_out_ready,
  output  io_out_valid,
  output [19:0] io_out_bits_tag,
  output [5:0] io_out_bits_idx,
  output [1:0] io_out_bits_source,
  output [2:0] io_out_bits_param,
  output [3:0] io_out_bits_way_en,
  output  io_out_bits_voluntary,
  output  io_chosen
);
  wire  _GEN_0;
  wire [19:0] _GEN_1;
  wire [5:0] _GEN_2;
  wire [1:0] _GEN_3;
  wire [2:0] _GEN_4;
  wire [3:0] _GEN_5;
  wire  _GEN_6;
  wire  _T_158;
  wire  _T_160;
  wire  _T_162;
  wire  _T_163;
  assign io_in_0_ready = io_out_ready;
  assign io_in_1_ready = _T_160;
  assign io_out_valid = _T_163;
  assign io_out_bits_tag = _GEN_1;
  assign io_out_bits_idx = _GEN_2;
  assign io_out_bits_source = _GEN_3;
  assign io_out_bits_param = _GEN_4;
  assign io_out_bits_way_en = _GEN_5;
  assign io_out_bits_voluntary = _GEN_6;
  assign io_chosen = _GEN_0;
  assign _GEN_0 = io_in_0_valid ? 1'h0 : 1'h1;
  assign _GEN_1 = io_in_0_valid ? io_in_0_bits_tag : io_in_1_bits_tag;
  assign _GEN_2 = io_in_0_valid ? io_in_0_bits_idx : io_in_1_bits_idx;
  assign _GEN_3 = io_in_0_valid ? io_in_0_bits_source : io_in_1_bits_source;
  assign _GEN_4 = io_in_0_valid ? io_in_0_bits_param : io_in_1_bits_param;
  assign _GEN_5 = io_in_0_valid ? io_in_0_bits_way_en : io_in_1_bits_way_en;
  assign _GEN_6 = io_in_0_valid ? io_in_0_bits_voluntary : io_in_1_bits_voluntary;
  assign _T_158 = io_in_0_valid == 1'h0;
  assign _T_160 = _T_158 & io_out_ready;
  assign _T_162 = _T_158 == 1'h0;
  assign _T_163 = _T_162 | io_in_1_valid;
endmodule