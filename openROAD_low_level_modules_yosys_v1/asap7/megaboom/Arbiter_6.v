module Arbiter_6(
  input   clock,
  input   reset,
  output  io_in_0_ready,
  input   io_in_0_valid,
  input  [39:0] io_in_0_bits_addr,
  input  [6:0] io_in_0_bits_tag,
  input  [4:0] io_in_0_bits_cmd,
  input  [2:0] io_in_0_bits_typ,
  input  [63:0] io_in_0_bits_data,
  input   io_in_0_bits_replay,
  input   io_in_0_bits_has_data,
  input  [63:0] io_in_0_bits_data_word_bypass,
  input  [63:0] io_in_0_bits_store_data,
  input   io_out_ready,
  output  io_out_valid,
  output [39:0] io_out_bits_addr,
  output [6:0] io_out_bits_tag,
  output [4:0] io_out_bits_cmd,
  output [2:0] io_out_bits_typ,
  output [63:0] io_out_bits_data,
  output  io_out_bits_replay,
  output  io_out_bits_has_data,
  output [63:0] io_out_bits_data_word_bypass,
  output [63:0] io_out_bits_store_data,
  output  io_chosen
);
  assign io_in_0_ready = io_out_ready;
  assign io_out_valid = io_in_0_valid;
  assign io_out_bits_addr = io_in_0_bits_addr;
  assign io_out_bits_tag = io_in_0_bits_tag;
  assign io_out_bits_cmd = io_in_0_bits_cmd;
  assign io_out_bits_typ = io_in_0_bits_typ;
  assign io_out_bits_data = io_in_0_bits_data;
  assign io_out_bits_replay = io_in_0_bits_replay;
  assign io_out_bits_has_data = io_in_0_bits_has_data;
  assign io_out_bits_data_word_bypass = io_in_0_bits_data_word_bypass;
  assign io_out_bits_store_data = io_in_0_bits_store_data;
  assign io_chosen = 1'h0;
endmodule