module Arbiter_3(
  input   clock,
  input   reset,
  output  io_in_0_ready,
  input   io_in_0_valid,
  input  [39:0] io_in_0_bits_addr,
  input  [6:0] io_in_0_bits_tag,
  input  [4:0] io_in_0_bits_cmd,
  input  [2:0] io_in_0_bits_typ,
  input   io_in_0_bits_phys,
  input  [4:0] io_in_0_bits_sdq_id,
  output  io_in_1_ready,
  input   io_in_1_valid,
  input  [39:0] io_in_1_bits_addr,
  input  [6:0] io_in_1_bits_tag,
  input  [4:0] io_in_1_bits_cmd,
  input  [2:0] io_in_1_bits_typ,
  input   io_in_1_bits_phys,
  input  [4:0] io_in_1_bits_sdq_id,
  input   io_out_ready,
  output  io_out_valid,
  output [39:0] io_out_bits_addr,
  output [6:0] io_out_bits_tag,
  output [4:0] io_out_bits_cmd,
  output [2:0] io_out_bits_typ,
  output  io_out_bits_phys,
  output [4:0] io_out_bits_sdq_id,
  output  io_chosen
);
  wire  _GEN_0;
  wire [39:0] _GEN_1;
  wire [6:0] _GEN_2;
  wire [4:0] _GEN_3;
  wire [2:0] _GEN_4;
  wire  _GEN_5;
  wire [4:0] _GEN_6;
  wire  _T_158;
  wire  _T_160;
  wire  _T_162;
  wire  _T_163;
  assign io_in_0_ready = io_out_ready;
  assign io_in_1_ready = _T_160;
  assign io_out_valid = _T_163;
  assign io_out_bits_addr = _GEN_1;
  assign io_out_bits_tag = _GEN_2;
  assign io_out_bits_cmd = _GEN_3;
  assign io_out_bits_typ = _GEN_4;
  assign io_out_bits_phys = _GEN_5;
  assign io_out_bits_sdq_id = _GEN_6;
  assign io_chosen = _GEN_0;
  assign _GEN_0 = io_in_0_valid ? 1'h0 : 1'h1;
  assign _GEN_1 = io_in_0_valid ? io_in_0_bits_addr : io_in_1_bits_addr;
  assign _GEN_2 = io_in_0_valid ? io_in_0_bits_tag : io_in_1_bits_tag;
  assign _GEN_3 = io_in_0_valid ? io_in_0_bits_cmd : io_in_1_bits_cmd;
  assign _GEN_4 = io_in_0_valid ? io_in_0_bits_typ : io_in_1_bits_typ;
  assign _GEN_5 = io_in_0_valid ? io_in_0_bits_phys : io_in_1_bits_phys;
  assign _GEN_6 = io_in_0_valid ? io_in_0_bits_sdq_id : io_in_1_bits_sdq_id;
  assign _T_158 = io_in_0_valid == 1'h0;
  assign _T_160 = _T_158 & io_out_ready;
  assign _T_162 = _T_158 == 1'h0;
  assign _T_163 = _T_162 | io_in_1_valid;
endmodule