module Arbiter_5(
  input   clock,
  input   reset,
  output  io_in_0_ready,
  input   io_in_0_valid,
  input   io_in_0_bits,
  input   io_out_ready,
  output  io_out_valid,
  output  io_out_bits,
  output  io_chosen
);
  assign io_in_0_ready = io_out_ready;
  assign io_out_valid = io_in_0_valid;
  assign io_out_bits = io_in_0_bits;
  assign io_chosen = 1'h0;
endmodule