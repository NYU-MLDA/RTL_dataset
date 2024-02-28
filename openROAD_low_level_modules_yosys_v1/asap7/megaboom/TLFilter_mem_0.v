module TLFilter_mem_0(
  input   clock,
  input   reset,
  output  io_in_0_a_ready,
  input   io_in_0_a_valid,
  input  [2:0] io_in_0_a_bits_opcode,
  input  [2:0] io_in_0_a_bits_param,
  input  [3:0] io_in_0_a_bits_size,
  input  [5:0] io_in_0_a_bits_source,
  input  [31:0] io_in_0_a_bits_address,
  input  [7:0] io_in_0_a_bits_mask,
  input  [63:0] io_in_0_a_bits_data,
  input   io_in_0_b_ready,
  output  io_in_0_b_valid,
  output [2:0] io_in_0_b_bits_opcode,
  output [1:0] io_in_0_b_bits_param,
  output [3:0] io_in_0_b_bits_size,
  output [5:0] io_in_0_b_bits_source,
  output [31:0] io_in_0_b_bits_address,
  output [7:0] io_in_0_b_bits_mask,
  output [63:0] io_in_0_b_bits_data,
  output  io_in_0_c_ready,
  input   io_in_0_c_valid,
  input  [2:0] io_in_0_c_bits_opcode,
  input  [2:0] io_in_0_c_bits_param,
  input  [3:0] io_in_0_c_bits_size,
  input  [5:0] io_in_0_c_bits_source,
  input  [31:0] io_in_0_c_bits_address,
  input  [63:0] io_in_0_c_bits_data,
  input   io_in_0_c_bits_error,
  input   io_in_0_d_ready,
  output  io_in_0_d_valid,
  output [2:0] io_in_0_d_bits_opcode,
  output [1:0] io_in_0_d_bits_param,
  output [3:0] io_in_0_d_bits_size,
  output [5:0] io_in_0_d_bits_source,
  output  io_in_0_d_bits_sink,
  output [2:0] io_in_0_d_bits_addr_lo,
  output [63:0] io_in_0_d_bits_data,
  output  io_in_0_d_bits_error,
  output  io_in_0_e_ready,
  input   io_in_0_e_valid,
  input   io_in_0_e_bits_sink,
  input   io_out_0_a_ready,
  output  io_out_0_a_valid,
  output [2:0] io_out_0_a_bits_opcode,
  output [2:0] io_out_0_a_bits_param,
  output [3:0] io_out_0_a_bits_size,
  output [5:0] io_out_0_a_bits_source,
  output [31:0] io_out_0_a_bits_address,
  output [7:0] io_out_0_a_bits_mask,
  output [63:0] io_out_0_a_bits_data,
  output  io_out_0_b_ready,
  input   io_out_0_b_valid,
  input  [2:0] io_out_0_b_bits_opcode,
  input  [1:0] io_out_0_b_bits_param,
  input  [3:0] io_out_0_b_bits_size,
  input  [5:0] io_out_0_b_bits_source,
  input  [31:0] io_out_0_b_bits_address,
  input  [7:0] io_out_0_b_bits_mask,
  input  [63:0] io_out_0_b_bits_data,
  input   io_out_0_c_ready,
  output  io_out_0_c_valid,
  output [2:0] io_out_0_c_bits_opcode,
  output [2:0] io_out_0_c_bits_param,
  output [3:0] io_out_0_c_bits_size,
  output [5:0] io_out_0_c_bits_source,
  output [31:0] io_out_0_c_bits_address,
  output [63:0] io_out_0_c_bits_data,
  output  io_out_0_c_bits_error,
  output  io_out_0_d_ready,
  input   io_out_0_d_valid,
  input  [2:0] io_out_0_d_bits_opcode,
  input  [1:0] io_out_0_d_bits_param,
  input  [3:0] io_out_0_d_bits_size,
  input  [5:0] io_out_0_d_bits_source,
  input   io_out_0_d_bits_sink,
  input  [2:0] io_out_0_d_bits_addr_lo,
  input  [63:0] io_out_0_d_bits_data,
  input   io_out_0_d_bits_error,
  input   io_out_0_e_ready,
  output  io_out_0_e_valid,
  output  io_out_0_e_bits_sink
);
  assign io_in_0_a_ready = io_out_0_a_ready;
  assign io_in_0_b_valid = io_out_0_b_valid;
  assign io_in_0_b_bits_opcode = io_out_0_b_bits_opcode;
  assign io_in_0_b_bits_param = io_out_0_b_bits_param;
  assign io_in_0_b_bits_size = io_out_0_b_bits_size;
  assign io_in_0_b_bits_source = io_out_0_b_bits_source;
  assign io_in_0_b_bits_address = io_out_0_b_bits_address;
  assign io_in_0_b_bits_mask = io_out_0_b_bits_mask;
  assign io_in_0_b_bits_data = io_out_0_b_bits_data;
  assign io_in_0_c_ready = io_out_0_c_ready;
  assign io_in_0_d_valid = io_out_0_d_valid;
  assign io_in_0_d_bits_opcode = io_out_0_d_bits_opcode;
  assign io_in_0_d_bits_param = io_out_0_d_bits_param;
  assign io_in_0_d_bits_size = io_out_0_d_bits_size;
  assign io_in_0_d_bits_source = io_out_0_d_bits_source;
  assign io_in_0_d_bits_sink = io_out_0_d_bits_sink;
  assign io_in_0_d_bits_addr_lo = io_out_0_d_bits_addr_lo;
  assign io_in_0_d_bits_data = io_out_0_d_bits_data;
  assign io_in_0_d_bits_error = io_out_0_d_bits_error;
  assign io_in_0_e_ready = io_out_0_e_ready;
  assign io_out_0_a_valid = io_in_0_a_valid;
  assign io_out_0_a_bits_opcode = io_in_0_a_bits_opcode;
  assign io_out_0_a_bits_param = io_in_0_a_bits_param;
  assign io_out_0_a_bits_size = io_in_0_a_bits_size;
  assign io_out_0_a_bits_source = io_in_0_a_bits_source;
  assign io_out_0_a_bits_address = io_in_0_a_bits_address;
  assign io_out_0_a_bits_mask = io_in_0_a_bits_mask;
  assign io_out_0_a_bits_data = io_in_0_a_bits_data;
  assign io_out_0_b_ready = io_in_0_b_ready;
  assign io_out_0_c_valid = io_in_0_c_valid;
  assign io_out_0_c_bits_opcode = io_in_0_c_bits_opcode;
  assign io_out_0_c_bits_param = io_in_0_c_bits_param;
  assign io_out_0_c_bits_size = io_in_0_c_bits_size;
  assign io_out_0_c_bits_source = io_in_0_c_bits_source;
  assign io_out_0_c_bits_address = io_in_0_c_bits_address;
  assign io_out_0_c_bits_data = io_in_0_c_bits_data;
  assign io_out_0_c_bits_error = io_in_0_c_bits_error;
  assign io_out_0_d_ready = io_in_0_d_ready;
  assign io_out_0_e_valid = io_in_0_e_valid;
  assign io_out_0_e_bits_sink = io_in_0_e_bits_sink;
endmodule