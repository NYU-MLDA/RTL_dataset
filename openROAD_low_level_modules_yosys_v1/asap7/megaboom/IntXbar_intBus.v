module IntXbar_intBus(
  input   clock,
  input   reset,
  input   io_in_0_0,
  input   io_in_0_1,
  output  io_out_0_0,
  output  io_out_0_1
);
  assign io_out_0_0 = io_in_0_0;
  assign io_out_0_1 = io_in_0_1;
endmodule