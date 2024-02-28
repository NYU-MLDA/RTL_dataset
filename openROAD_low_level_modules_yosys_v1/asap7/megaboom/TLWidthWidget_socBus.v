module TLWidthWidget_socBus(
  input   clock,
  input   reset,
  output  io_in_0_a_ready,
  input   io_in_0_a_valid,
  input  [2:0] io_in_0_a_bits_opcode,
  input  [2:0] io_in_0_a_bits_param,
  input  [3:0] io_in_0_a_bits_size,
  input  [3:0] io_in_0_a_bits_source,
  input  [30:0] io_in_0_a_bits_address,
  input  [15:0] io_in_0_a_bits_mask,
  input  [127:0] io_in_0_a_bits_data,
  input   io_in_0_b_ready,
  output  io_in_0_b_valid,
  output [2:0] io_in_0_b_bits_opcode,
  output [1:0] io_in_0_b_bits_param,
  output [3:0] io_in_0_b_bits_size,
  output [3:0] io_in_0_b_bits_source,
  output [30:0] io_in_0_b_bits_address,
  output [15:0] io_in_0_b_bits_mask,
  output [127:0] io_in_0_b_bits_data,
  output  io_in_0_c_ready,
  input   io_in_0_c_valid,
  input  [2:0] io_in_0_c_bits_opcode,
  input  [2:0] io_in_0_c_bits_param,
  input  [3:0] io_in_0_c_bits_size,
  input  [3:0] io_in_0_c_bits_source,
  input  [30:0] io_in_0_c_bits_address,
  input  [127:0] io_in_0_c_bits_data,
  input   io_in_0_c_bits_error,
  input   io_in_0_d_ready,
  output  io_in_0_d_valid,
  output [2:0] io_in_0_d_bits_opcode,
  output [1:0] io_in_0_d_bits_param,
  output [3:0] io_in_0_d_bits_size,
  output [3:0] io_in_0_d_bits_source,
  output  io_in_0_d_bits_sink,
  output [3:0] io_in_0_d_bits_addr_lo,
  output [127:0] io_in_0_d_bits_data,
  output  io_in_0_d_bits_error,
  output  io_in_0_e_ready,
  input   io_in_0_e_valid,
  input   io_in_0_e_bits_sink,
  input   io_out_0_a_ready,
  output  io_out_0_a_valid,
  output [2:0] io_out_0_a_bits_opcode,
  output [2:0] io_out_0_a_bits_param,
  output [3:0] io_out_0_a_bits_size,
  output [3:0] io_out_0_a_bits_source,
  output [30:0] io_out_0_a_bits_address,
  output [15:0] io_out_0_a_bits_mask,
  output [127:0] io_out_0_a_bits_data,
  output  io_out_0_b_ready,
  input   io_out_0_b_valid,
  input  [2:0] io_out_0_b_bits_opcode,
  input  [1:0] io_out_0_b_bits_param,
  input  [3:0] io_out_0_b_bits_size,
  input  [3:0] io_out_0_b_bits_source,
  input  [30:0] io_out_0_b_bits_address,
  input  [15:0] io_out_0_b_bits_mask,
  input  [127:0] io_out_0_b_bits_data,
  input   io_out_0_c_ready,
  output  io_out_0_c_valid,
  output [2:0] io_out_0_c_bits_opcode,
  output [2:0] io_out_0_c_bits_param,
  output [3:0] io_out_0_c_bits_size,
  output [3:0] io_out_0_c_bits_source,
  output [30:0] io_out_0_c_bits_address,
  output [127:0] io_out_0_c_bits_data,
  output  io_out_0_c_bits_error,
  output  io_out_0_d_ready,
  input   io_out_0_d_valid,
  input  [2:0] io_out_0_d_bits_opcode,
  input  [1:0] io_out_0_d_bits_param,
  input  [3:0] io_out_0_d_bits_size,
  input  [3:0] io_out_0_d_bits_source,
  input   io_out_0_d_bits_sink,
  input  [3:0] io_out_0_d_bits_addr_lo,
  input  [127:0] io_out_0_d_bits_data,
  input   io_out_0_d_bits_error,
  input   io_out_0_e_ready,
  output  io_out_0_e_valid,
  output  io_out_0_e_bits_sink
);
  reg [2:0] _GEN_0;
  reg [31:0] _GEN_15;
  reg [1:0] _GEN_1;
  reg [31:0] _GEN_16;
  reg [3:0] _GEN_2;
  reg [31:0] _GEN_17;
  reg [3:0] _GEN_3;
  reg [31:0] _GEN_18;
  reg [30:0] _GEN_4;
  reg [31:0] _GEN_19;
  reg [15:0] _GEN_5;
  reg [31:0] _GEN_20;
  reg [127:0] _GEN_6;
  reg [127:0] _GEN_21;
  reg [2:0] _GEN_7;
  reg [31:0] _GEN_22;
  reg [2:0] _GEN_8;
  reg [31:0] _GEN_23;
  reg [3:0] _GEN_9;
  reg [31:0] _GEN_24;
  reg [3:0] _GEN_10;
  reg [31:0] _GEN_25;
  reg [30:0] _GEN_11;
  reg [31:0] _GEN_26;
  reg [127:0] _GEN_12;
  reg [127:0] _GEN_27;
  reg  _GEN_13;
  reg [31:0] _GEN_28;
  reg  _GEN_14;
  reg [31:0] _GEN_29;
  assign io_in_0_a_ready = io_out_0_a_ready;
  assign io_in_0_b_valid = 1'h0;
  assign io_in_0_b_bits_opcode = _GEN_0;
  assign io_in_0_b_bits_param = _GEN_1;
  assign io_in_0_b_bits_size = _GEN_2;
  assign io_in_0_b_bits_source = _GEN_3;
  assign io_in_0_b_bits_address = _GEN_4;
  assign io_in_0_b_bits_mask = _GEN_5;
  assign io_in_0_b_bits_data = _GEN_6;
  assign io_in_0_c_ready = 1'h1;
  assign io_in_0_d_valid = io_out_0_d_valid;
  assign io_in_0_d_bits_opcode = io_out_0_d_bits_opcode;
  assign io_in_0_d_bits_param = io_out_0_d_bits_param;
  assign io_in_0_d_bits_size = io_out_0_d_bits_size;
  assign io_in_0_d_bits_source = io_out_0_d_bits_source;
  assign io_in_0_d_bits_sink = io_out_0_d_bits_sink;
  assign io_in_0_d_bits_addr_lo = io_out_0_d_bits_addr_lo;
  assign io_in_0_d_bits_data = io_out_0_d_bits_data;
  assign io_in_0_d_bits_error = io_out_0_d_bits_error;
  assign io_in_0_e_ready = 1'h1;
  assign io_out_0_a_valid = io_in_0_a_valid;
  assign io_out_0_a_bits_opcode = io_in_0_a_bits_opcode;
  assign io_out_0_a_bits_param = io_in_0_a_bits_param;
  assign io_out_0_a_bits_size = io_in_0_a_bits_size;
  assign io_out_0_a_bits_source = io_in_0_a_bits_source;
  assign io_out_0_a_bits_address = io_in_0_a_bits_address;
  assign io_out_0_a_bits_mask = io_in_0_a_bits_mask;
  assign io_out_0_a_bits_data = io_in_0_a_bits_data;
  assign io_out_0_b_ready = 1'h1;
  assign io_out_0_c_valid = 1'h0;
  assign io_out_0_c_bits_opcode = _GEN_7;
  assign io_out_0_c_bits_param = _GEN_8;
  assign io_out_0_c_bits_size = _GEN_9;
  assign io_out_0_c_bits_source = _GEN_10;
  assign io_out_0_c_bits_address = _GEN_11;
  assign io_out_0_c_bits_data = _GEN_12;
  assign io_out_0_c_bits_error = _GEN_13;
  assign io_out_0_d_ready = io_in_0_d_ready;
  assign io_out_0_e_valid = 1'h0;
  assign io_out_0_e_bits_sink = _GEN_14;
`ifdef RANDOMIZE
  integer initvar;
  initial begin
    `ifndef verilator
      #0.002 begin end
    `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_15 = {1{$random}};
  _GEN_0 = _GEN_15[2:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_16 = {1{$random}};
  _GEN_1 = _GEN_16[1:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_17 = {1{$random}};
  _GEN_2 = _GEN_17[3:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_18 = {1{$random}};
  _GEN_3 = _GEN_18[3:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_19 = {1{$random}};
  _GEN_4 = _GEN_19[30:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_20 = {1{$random}};
  _GEN_5 = _GEN_20[15:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_21 = {4{$random}};
  _GEN_6 = _GEN_21[127:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_22 = {1{$random}};
  _GEN_7 = _GEN_22[2:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_23 = {1{$random}};
  _GEN_8 = _GEN_23[2:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_24 = {1{$random}};
  _GEN_9 = _GEN_24[3:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_25 = {1{$random}};
  _GEN_10 = _GEN_25[3:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_26 = {1{$random}};
  _GEN_11 = _GEN_26[30:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_27 = {4{$random}};
  _GEN_12 = _GEN_27[127:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_28 = {1{$random}};
  _GEN_13 = _GEN_28[0:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_29 = {1{$random}};
  _GEN_14 = _GEN_29[0:0];
  `endif
  end
`endif
endmodule