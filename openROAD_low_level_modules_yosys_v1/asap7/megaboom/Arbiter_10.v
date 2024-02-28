module Arbiter_10(
  input   clock,
  input   reset,
  output  io_in_0_ready,
  input   io_in_0_valid,
  input  [3:0] io_in_0_bits_way_en,
  input  [11:0] io_in_0_bits_addr,
  input  [1:0] io_in_0_bits_wmask,
  input  [127:0] io_in_0_bits_data,
  output  io_in_1_ready,
  input   io_in_1_valid,
  input  [3:0] io_in_1_bits_way_en,
  input  [11:0] io_in_1_bits_addr,
  input  [1:0] io_in_1_bits_wmask,
  input  [127:0] io_in_1_bits_data,
  input   io_out_ready,
  output  io_out_valid,
  output [3:0] io_out_bits_way_en,
  output [11:0] io_out_bits_addr,
  output [1:0] io_out_bits_wmask,
  output [127:0] io_out_bits_data,
  output  io_chosen
);
  wire  _GEN_0;
  wire [3:0] _GEN_1;
  wire [11:0] _GEN_2;
  wire [1:0] _GEN_3;
  wire [127:0] _GEN_4;
  wire  _T_126;
  wire  _T_128;
  wire  _T_130;
  wire  _T_131;
  assign io_in_0_ready = io_out_ready;
  assign io_in_1_ready = _T_128;
  assign io_out_valid = _T_131;
  assign io_out_bits_way_en = _GEN_1;
  assign io_out_bits_addr = _GEN_2;
  assign io_out_bits_wmask = _GEN_3;
  assign io_out_bits_data = _GEN_4;
  assign io_chosen = _GEN_0;
  assign _GEN_0 = io_in_0_valid ? 1'h0 : 1'h1;
  assign _GEN_1 = io_in_0_valid ? io_in_0_bits_way_en : io_in_1_bits_way_en;
  assign _GEN_2 = io_in_0_valid ? io_in_0_bits_addr : io_in_1_bits_addr;
  assign _GEN_3 = io_in_0_valid ? io_in_0_bits_wmask : io_in_1_bits_wmask;
  assign _GEN_4 = io_in_0_valid ? io_in_0_bits_data : io_in_1_bits_data;
  assign _T_126 = io_in_0_valid == 1'h0;
  assign _T_128 = _T_126 & io_out_ready;
  assign _T_130 = _T_126 == 1'h0;
  assign _T_131 = _T_130 | io_in_1_valid;
endmodule