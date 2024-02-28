module Arbiter_9(
  input   clock,
  input   reset,
  output  io_in_0_ready,
  input   io_in_0_valid,
  input  [3:0] io_in_0_bits_way_en,
  input  [11:0] io_in_0_bits_addr,
  output  io_in_1_ready,
  input   io_in_1_valid,
  input  [3:0] io_in_1_bits_way_en,
  input  [11:0] io_in_1_bits_addr,
  output  io_in_2_ready,
  input   io_in_2_valid,
  input  [3:0] io_in_2_bits_way_en,
  input  [11:0] io_in_2_bits_addr,
  output  io_in_3_ready,
  input   io_in_3_valid,
  input  [3:0] io_in_3_bits_way_en,
  input  [11:0] io_in_3_bits_addr,
  input   io_out_ready,
  output  io_out_valid,
  output [3:0] io_out_bits_way_en,
  output [11:0] io_out_bits_addr,
  output [1:0] io_chosen
);
  wire [1:0] _GEN_0;
  wire [3:0] _GEN_1;
  wire [11:0] _GEN_2;
  wire [1:0] _GEN_3;
  wire [3:0] _GEN_4;
  wire [11:0] _GEN_5;
  wire [1:0] _GEN_6;
  wire [3:0] _GEN_7;
  wire [11:0] _GEN_8;
  wire  _T_135;
  wire  _T_136;
  wire  _T_138;
  wire  _T_140;
  wire  _T_142;
  wire  _T_144;
  wire  _T_145;
  wire  _T_146;
  wire  _T_148;
  wire  _T_149;
  assign io_in_0_ready = io_out_ready;
  assign io_in_1_ready = _T_144;
  assign io_in_2_ready = _T_145;
  assign io_in_3_ready = _T_146;
  assign io_out_valid = _T_149;
  assign io_out_bits_way_en = _GEN_7;
  assign io_out_bits_addr = _GEN_8;
  assign io_chosen = _GEN_6;
  assign _GEN_0 = io_in_2_valid ? 2'h2 : 2'h3;
  assign _GEN_1 = io_in_2_valid ? io_in_2_bits_way_en : io_in_3_bits_way_en;
  assign _GEN_2 = io_in_2_valid ? io_in_2_bits_addr : io_in_3_bits_addr;
  assign _GEN_3 = io_in_1_valid ? 2'h1 : _GEN_0;
  assign _GEN_4 = io_in_1_valid ? io_in_1_bits_way_en : _GEN_1;
  assign _GEN_5 = io_in_1_valid ? io_in_1_bits_addr : _GEN_2;
  assign _GEN_6 = io_in_0_valid ? 2'h0 : _GEN_3;
  assign _GEN_7 = io_in_0_valid ? io_in_0_bits_way_en : _GEN_4;
  assign _GEN_8 = io_in_0_valid ? io_in_0_bits_addr : _GEN_5;
  assign _T_135 = io_in_0_valid | io_in_1_valid;
  assign _T_136 = _T_135 | io_in_2_valid;
  assign _T_138 = io_in_0_valid == 1'h0;
  assign _T_140 = _T_135 == 1'h0;
  assign _T_142 = _T_136 == 1'h0;
  assign _T_144 = _T_138 & io_out_ready;
  assign _T_145 = _T_140 & io_out_ready;
  assign _T_146 = _T_142 & io_out_ready;
  assign _T_148 = _T_142 == 1'h0;
  assign _T_149 = _T_148 | io_in_3_valid;
endmodule