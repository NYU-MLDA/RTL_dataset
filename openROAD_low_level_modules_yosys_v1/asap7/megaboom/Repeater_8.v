module Repeater_8(
  input   clock,
  input   reset,
  input   io_repeat,
  output  io_full,
  output  io_enq_ready,
  input   io_enq_valid,
  input  [2:0] io_enq_bits_opcode,
  input  [2:0] io_enq_bits_param,
  input  [2:0] io_enq_bits_size,
  input  [3:0] io_enq_bits_source,
  input  [27:0] io_enq_bits_address,
  input  [7:0] io_enq_bits_mask,
  input  [63:0] io_enq_bits_data,
  input   io_deq_ready,
  output  io_deq_valid,
  output [2:0] io_deq_bits_opcode,
  output [2:0] io_deq_bits_param,
  output [2:0] io_deq_bits_size,
  output [3:0] io_deq_bits_source,
  output [27:0] io_deq_bits_address,
  output [7:0] io_deq_bits_mask,
  output [63:0] io_deq_bits_data
);
  reg  full;
  reg [31:0] _GEN_9;
  reg [2:0] saved_opcode;
  reg [31:0] _GEN_10;
  reg [2:0] saved_param;
  reg [31:0] _GEN_11;
  reg [2:0] saved_size;
  reg [31:0] _GEN_12;
  reg [3:0] saved_source;
  reg [31:0] _GEN_13;
  reg [27:0] saved_address;
  reg [31:0] _GEN_14;
  reg [7:0] saved_mask;
  reg [31:0] _GEN_15;
  reg [63:0] saved_data;
  reg [63:0] _GEN_16;
  wire  _T_77;
  wire  _T_79;
  wire  _T_80;
  wire [2:0] _T_81_opcode;
  wire [2:0] _T_81_param;
  wire [2:0] _T_81_size;
  wire [3:0] _T_81_source;
  wire [27:0] _T_81_address;
  wire [7:0] _T_81_mask;
  wire [63:0] _T_81_data;
  wire  _T_89;
  wire  _T_90;
  wire  _GEN_0;
  wire [2:0] _GEN_1;
  wire [2:0] _GEN_2;
  wire [2:0] _GEN_3;
  wire [3:0] _GEN_4;
  wire [27:0] _GEN_5;
  wire [7:0] _GEN_6;
  wire [63:0] _GEN_7;
  wire  _T_92;
  wire  _T_94;
  wire  _T_95;
  wire  _GEN_8;
  assign io_full = full;
  assign io_enq_ready = _T_80;
  assign io_deq_valid = _T_77;
  assign io_deq_bits_opcode = _T_81_opcode;
  assign io_deq_bits_param = _T_81_param;
  assign io_deq_bits_size = _T_81_size;
  assign io_deq_bits_source = _T_81_source;
  assign io_deq_bits_address = _T_81_address;
  assign io_deq_bits_mask = _T_81_mask;
  assign io_deq_bits_data = _T_81_data;
  assign _T_77 = io_enq_valid | full;
  assign _T_79 = full == 1'h0;
  assign _T_80 = io_deq_ready & _T_79;
  assign _T_81_opcode = full ? saved_opcode : io_enq_bits_opcode;
  assign _T_81_param = full ? saved_param : io_enq_bits_param;
  assign _T_81_size = full ? saved_size : io_enq_bits_size;
  assign _T_81_source = full ? saved_source : io_enq_bits_source;
  assign _T_81_address = full ? saved_address : io_enq_bits_address;
  assign _T_81_mask = full ? saved_mask : io_enq_bits_mask;
  assign _T_81_data = full ? saved_data : io_enq_bits_data;
  assign _T_89 = io_enq_ready & io_enq_valid;
  assign _T_90 = _T_89 & io_repeat;
  assign _GEN_0 = _T_90 ? 1'h1 : full;
  assign _GEN_1 = _T_90 ? io_enq_bits_opcode : saved_opcode;
  assign _GEN_2 = _T_90 ? io_enq_bits_param : saved_param;
  assign _GEN_3 = _T_90 ? io_enq_bits_size : saved_size;
  assign _GEN_4 = _T_90 ? io_enq_bits_source : saved_source;
  assign _GEN_5 = _T_90 ? io_enq_bits_address : saved_address;
  assign _GEN_6 = _T_90 ? io_enq_bits_mask : saved_mask;
  assign _GEN_7 = _T_90 ? io_enq_bits_data : saved_data;
  assign _T_92 = io_deq_ready & io_deq_valid;
  assign _T_94 = io_repeat == 1'h0;
  assign _T_95 = _T_92 & _T_94;
  assign _GEN_8 = _T_95 ? 1'h0 : _GEN_0;
`ifdef RANDOMIZE
  integer initvar;
  initial begin
    `ifndef verilator
      #0.002 begin end
    `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_9 = {1{$random}};
  full = _GEN_9[0:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_10 = {1{$random}};
  saved_opcode = _GEN_10[2:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_11 = {1{$random}};
  saved_param = _GEN_11[2:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_12 = {1{$random}};
  saved_size = _GEN_12[2:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_13 = {1{$random}};
  saved_source = _GEN_13[3:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_14 = {1{$random}};
  saved_address = _GEN_14[27:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_15 = {1{$random}};
  saved_mask = _GEN_15[7:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_16 = {2{$random}};
  saved_data = _GEN_16[63:0];
  `endif
  end
`endif
  always @(posedge clock) begin
    if (reset) begin
      full <= 1'h0;
    end else begin
      if (_T_95) begin
        full <= 1'h0;
      end else begin
        if (_T_90) begin
          full <= 1'h1;
        end
      end
    end
    if (_T_90) begin
      saved_opcode <= io_enq_bits_opcode;
    end
    if (_T_90) begin
      saved_param <= io_enq_bits_param;
    end
    if (_T_90) begin
      saved_size <= io_enq_bits_size;
    end
    if (_T_90) begin
      saved_source <= io_enq_bits_source;
    end
    if (_T_90) begin
      saved_address <= io_enq_bits_address;
    end
    if (_T_90) begin
      saved_mask <= io_enq_bits_mask;
    end
    if (_T_90) begin
      saved_data <= io_enq_bits_data;
    end
  end
endmodule