module Repeater_2(
  input   clock,
  input   reset,
  input   io_repeat,
  output  io_full,
  output  io_enq_ready,
  input   io_enq_valid,
  input  [2:0] io_enq_bits_opcode,
  input  [1:0] io_enq_bits_param,
  input  [3:0] io_enq_bits_size,
  input  [8:0] io_enq_bits_source,
  input  [3:0] io_enq_bits_sink,
  input  [3:0] io_enq_bits_addr_lo,
  input  [127:0] io_enq_bits_data,
  input   io_enq_bits_error,
  input   io_deq_ready,
  output  io_deq_valid,
  output [2:0] io_deq_bits_opcode,
  output [1:0] io_deq_bits_param,
  output [3:0] io_deq_bits_size,
  output [8:0] io_deq_bits_source,
  output [3:0] io_deq_bits_sink,
  output [3:0] io_deq_bits_addr_lo,
  output [127:0] io_deq_bits_data,
  output  io_deq_bits_error
);
  reg  full;
  reg [31:0] _GEN_10;
  reg [2:0] saved_opcode;
  reg [31:0] _GEN_11;
  reg [1:0] saved_param;
  reg [31:0] _GEN_12;
  reg [3:0] saved_size;
  reg [31:0] _GEN_13;
  reg [8:0] saved_source;
  reg [31:0] _GEN_14;
  reg [3:0] saved_sink;
  reg [31:0] _GEN_15;
  reg [3:0] saved_addr_lo;
  reg [31:0] _GEN_16;
  reg [127:0] saved_data;
  reg [127:0] _GEN_17;
  reg  saved_error;
  reg [31:0] _GEN_18;
  wire  _T_84;
  wire  _T_86;
  wire  _T_87;
  wire [2:0] _T_88_opcode;
  wire [1:0] _T_88_param;
  wire [3:0] _T_88_size;
  wire [8:0] _T_88_source;
  wire [3:0] _T_88_sink;
  wire [3:0] _T_88_addr_lo;
  wire [127:0] _T_88_data;
  wire  _T_88_error;
  wire  _T_97;
  wire  _T_98;
  wire  _GEN_0;
  wire [2:0] _GEN_1;
  wire [1:0] _GEN_2;
  wire [3:0] _GEN_3;
  wire [8:0] _GEN_4;
  wire [3:0] _GEN_5;
  wire [3:0] _GEN_6;
  wire [127:0] _GEN_7;
  wire  _GEN_8;
  wire  _T_100;
  wire  _T_102;
  wire  _T_103;
  wire  _GEN_9;
  assign io_full = full;
  assign io_enq_ready = _T_87;
  assign io_deq_valid = _T_84;
  assign io_deq_bits_opcode = _T_88_opcode;
  assign io_deq_bits_param = _T_88_param;
  assign io_deq_bits_size = _T_88_size;
  assign io_deq_bits_source = _T_88_source;
  assign io_deq_bits_sink = _T_88_sink;
  assign io_deq_bits_addr_lo = _T_88_addr_lo;
  assign io_deq_bits_data = _T_88_data;
  assign io_deq_bits_error = _T_88_error;
  assign _T_84 = io_enq_valid | full;
  assign _T_86 = full == 1'h0;
  assign _T_87 = io_deq_ready & _T_86;
  assign _T_88_opcode = full ? saved_opcode : io_enq_bits_opcode;
  assign _T_88_param = full ? saved_param : io_enq_bits_param;
  assign _T_88_size = full ? saved_size : io_enq_bits_size;
  assign _T_88_source = full ? saved_source : io_enq_bits_source;
  assign _T_88_sink = full ? saved_sink : io_enq_bits_sink;
  assign _T_88_addr_lo = full ? saved_addr_lo : io_enq_bits_addr_lo;
  assign _T_88_data = full ? saved_data : io_enq_bits_data;
  assign _T_88_error = full ? saved_error : io_enq_bits_error;
  assign _T_97 = io_enq_ready & io_enq_valid;
  assign _T_98 = _T_97 & io_repeat;
  assign _GEN_0 = _T_98 ? 1'h1 : full;
  assign _GEN_1 = _T_98 ? io_enq_bits_opcode : saved_opcode;
  assign _GEN_2 = _T_98 ? io_enq_bits_param : saved_param;
  assign _GEN_3 = _T_98 ? io_enq_bits_size : saved_size;
  assign _GEN_4 = _T_98 ? io_enq_bits_source : saved_source;
  assign _GEN_5 = _T_98 ? io_enq_bits_sink : saved_sink;
  assign _GEN_6 = _T_98 ? io_enq_bits_addr_lo : saved_addr_lo;
  assign _GEN_7 = _T_98 ? io_enq_bits_data : saved_data;
  assign _GEN_8 = _T_98 ? io_enq_bits_error : saved_error;
  assign _T_100 = io_deq_ready & io_deq_valid;
  assign _T_102 = io_repeat == 1'h0;
  assign _T_103 = _T_100 & _T_102;
  assign _GEN_9 = _T_103 ? 1'h0 : _GEN_0;
`ifdef RANDOMIZE
  integer initvar;
  initial begin
    `ifndef verilator
      #0.002 begin end
    `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_10 = {1{$random}};
  full = _GEN_10[0:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_11 = {1{$random}};
  saved_opcode = _GEN_11[2:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_12 = {1{$random}};
  saved_param = _GEN_12[1:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_13 = {1{$random}};
  saved_size = _GEN_13[3:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_14 = {1{$random}};
  saved_source = _GEN_14[8:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_15 = {1{$random}};
  saved_sink = _GEN_15[3:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_16 = {1{$random}};
  saved_addr_lo = _GEN_16[3:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_17 = {4{$random}};
  saved_data = _GEN_17[127:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_18 = {1{$random}};
  saved_error = _GEN_18[0:0];
  `endif
  end
`endif
  always @(posedge clock) begin
    if (reset) begin
      full <= 1'h0;
    end else begin
      if (_T_103) begin
        full <= 1'h0;
      end else begin
        if (_T_98) begin
          full <= 1'h1;
        end
      end
    end
    if (_T_98) begin
      saved_opcode <= io_enq_bits_opcode;
    end
    if (_T_98) begin
      saved_param <= io_enq_bits_param;
    end
    if (_T_98) begin
      saved_size <= io_enq_bits_size;
    end
    if (_T_98) begin
      saved_source <= io_enq_bits_source;
    end
    if (_T_98) begin
      saved_sink <= io_enq_bits_sink;
    end
    if (_T_98) begin
      saved_addr_lo <= io_enq_bits_addr_lo;
    end
    if (_T_98) begin
      saved_data <= io_enq_bits_data;
    end
    if (_T_98) begin
      saved_error <= io_enq_bits_error;
    end
  end
endmodule