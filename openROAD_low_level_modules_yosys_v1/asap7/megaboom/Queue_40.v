module Queue_40(
  input   clock,
  input   reset,
  output  io_enq_ready,
  input   io_enq_valid,
  input  [10:0] io_enq_bits_index,
  input   io_enq_bits_executed_0,
  input   io_enq_bits_executed_1,
  input   io_enq_bits_executed_2,
  input   io_enq_bits_executed_3,
  input   io_enq_bits_takens_0,
  input   io_enq_bits_takens_1,
  input   io_enq_bits_takens_2,
  input   io_enq_bits_takens_3,
  input   io_enq_bits_was_mispredicted,
  input   io_enq_bits_do_initialize,
  input   io_deq_ready,
  output  io_deq_valid,
  output [10:0] io_deq_bits_index,
  output  io_deq_bits_executed_0,
  output  io_deq_bits_executed_1,
  output  io_deq_bits_executed_2,
  output  io_deq_bits_executed_3,
  output  io_deq_bits_takens_0,
  output  io_deq_bits_takens_1,
  output  io_deq_bits_takens_2,
  output  io_deq_bits_takens_3,
  output  io_deq_bits_was_mispredicted,
  output  io_deq_bits_do_initialize,
  output [2:0] io_count
);
  reg [10:0] ram_index [0:3];
  reg [31:0] _GEN_0;
  wire [10:0] ram_index__T_126_data;
  wire [1:0] ram_index__T_126_addr;
  wire [10:0] ram_index__T_101_data;
  wire [1:0] ram_index__T_101_addr;
  wire  ram_index__T_101_mask;
  wire  ram_index__T_101_en;
  reg  ram_executed_0 [0:3];
  reg [31:0] _GEN_1;
  wire  ram_executed_0__T_126_data;
  wire [1:0] ram_executed_0__T_126_addr;
  wire  ram_executed_0__T_101_data;
  wire [1:0] ram_executed_0__T_101_addr;
  wire  ram_executed_0__T_101_mask;
  wire  ram_executed_0__T_101_en;
  reg  ram_executed_1 [0:3];
  reg [31:0] _GEN_2;
  wire  ram_executed_1__T_126_data;
  wire [1:0] ram_executed_1__T_126_addr;
  wire  ram_executed_1__T_101_data;
  wire [1:0] ram_executed_1__T_101_addr;
  wire  ram_executed_1__T_101_mask;
  wire  ram_executed_1__T_101_en;
  reg  ram_executed_2 [0:3];
  reg [31:0] _GEN_3;
  wire  ram_executed_2__T_126_data;
  wire [1:0] ram_executed_2__T_126_addr;
  wire  ram_executed_2__T_101_data;
  wire [1:0] ram_executed_2__T_101_addr;
  wire  ram_executed_2__T_101_mask;
  wire  ram_executed_2__T_101_en;
  reg  ram_executed_3 [0:3];
  reg [31:0] _GEN_4;
  wire  ram_executed_3__T_126_data;
  wire [1:0] ram_executed_3__T_126_addr;
  wire  ram_executed_3__T_101_data;
  wire [1:0] ram_executed_3__T_101_addr;
  wire  ram_executed_3__T_101_mask;
  wire  ram_executed_3__T_101_en;
  reg  ram_takens_0 [0:3];
  reg [31:0] _GEN_5;
  wire  ram_takens_0__T_126_data;
  wire [1:0] ram_takens_0__T_126_addr;
  wire  ram_takens_0__T_101_data;
  wire [1:0] ram_takens_0__T_101_addr;
  wire  ram_takens_0__T_101_mask;
  wire  ram_takens_0__T_101_en;
  reg  ram_takens_1 [0:3];
  reg [31:0] _GEN_6;
  wire  ram_takens_1__T_126_data;
  wire [1:0] ram_takens_1__T_126_addr;
  wire  ram_takens_1__T_101_data;
  wire [1:0] ram_takens_1__T_101_addr;
  wire  ram_takens_1__T_101_mask;
  wire  ram_takens_1__T_101_en;
  reg  ram_takens_2 [0:3];
  reg [31:0] _GEN_7;
  wire  ram_takens_2__T_126_data;
  wire [1:0] ram_takens_2__T_126_addr;
  wire  ram_takens_2__T_101_data;
  wire [1:0] ram_takens_2__T_101_addr;
  wire  ram_takens_2__T_101_mask;
  wire  ram_takens_2__T_101_en;
  reg  ram_takens_3 [0:3];
  reg [31:0] _GEN_8;
  wire  ram_takens_3__T_126_data;
  wire [1:0] ram_takens_3__T_126_addr;
  wire  ram_takens_3__T_101_data;
  wire [1:0] ram_takens_3__T_101_addr;
  wire  ram_takens_3__T_101_mask;
  wire  ram_takens_3__T_101_en;
  reg  ram_was_mispredicted [0:3];
  reg [31:0] _GEN_9;
  wire  ram_was_mispredicted__T_126_data;
  wire [1:0] ram_was_mispredicted__T_126_addr;
  wire  ram_was_mispredicted__T_101_data;
  wire [1:0] ram_was_mispredicted__T_101_addr;
  wire  ram_was_mispredicted__T_101_mask;
  wire  ram_was_mispredicted__T_101_en;
  reg  ram_do_initialize [0:3];
  reg [31:0] _GEN_10;
  wire  ram_do_initialize__T_126_data;
  wire [1:0] ram_do_initialize__T_126_addr;
  wire  ram_do_initialize__T_101_data;
  wire [1:0] ram_do_initialize__T_101_addr;
  wire  ram_do_initialize__T_101_mask;
  wire  ram_do_initialize__T_101_en;
  reg [1:0] _T_90;
  reg [31:0] _GEN_11;
  reg [1:0] _T_92;
  reg [31:0] _GEN_12;
  reg  maybe_full;
  reg [31:0] _GEN_13;
  wire  _T_94;
  wire  _T_96;
  wire  _T_97;
  wire  _T_98;
  wire  _T_99;
  wire  do_enq;
  wire  _T_100;
  wire  do_deq;
  wire [2:0] _T_114;
  wire [1:0] _T_115;
  wire [1:0] _GEN_14;
  wire [2:0] _T_119;
  wire [1:0] _T_120;
  wire [1:0] _GEN_15;
  wire  _T_121;
  wire  _GEN_16;
  wire  _T_123;
  wire  _T_125;
  wire [2:0] _T_136;
  wire [1:0] _T_137;
  wire  _T_138;
  wire [2:0] _T_139;
  assign io_enq_ready = _T_125;
  assign io_deq_valid = _T_123;
  assign io_deq_bits_index = ram_index__T_126_data;
  assign io_deq_bits_executed_0 = ram_executed_0__T_126_data;
  assign io_deq_bits_executed_1 = ram_executed_1__T_126_data;
  assign io_deq_bits_executed_2 = ram_executed_2__T_126_data;
  assign io_deq_bits_executed_3 = ram_executed_3__T_126_data;
  assign io_deq_bits_takens_0 = ram_takens_0__T_126_data;
  assign io_deq_bits_takens_1 = ram_takens_1__T_126_data;
  assign io_deq_bits_takens_2 = ram_takens_2__T_126_data;
  assign io_deq_bits_takens_3 = ram_takens_3__T_126_data;
  assign io_deq_bits_was_mispredicted = ram_was_mispredicted__T_126_data;
  assign io_deq_bits_do_initialize = ram_do_initialize__T_126_data;
  assign io_count = _T_139;
  assign ram_index__T_126_addr = _T_92;
  assign ram_index__T_126_data = ram_index[ram_index__T_126_addr];
  assign ram_index__T_101_data = io_enq_bits_index;
  assign ram_index__T_101_addr = _T_90;
  assign ram_index__T_101_mask = do_enq;
  assign ram_index__T_101_en = do_enq;
  assign ram_executed_0__T_126_addr = _T_92;
  assign ram_executed_0__T_126_data = ram_executed_0[ram_executed_0__T_126_addr];
  assign ram_executed_0__T_101_data = io_enq_bits_executed_0;
  assign ram_executed_0__T_101_addr = _T_90;
  assign ram_executed_0__T_101_mask = do_enq;
  assign ram_executed_0__T_101_en = do_enq;
  assign ram_executed_1__T_126_addr = _T_92;
  assign ram_executed_1__T_126_data = ram_executed_1[ram_executed_1__T_126_addr];
  assign ram_executed_1__T_101_data = io_enq_bits_executed_1;
  assign ram_executed_1__T_101_addr = _T_90;
  assign ram_executed_1__T_101_mask = do_enq;
  assign ram_executed_1__T_101_en = do_enq;
  assign ram_executed_2__T_126_addr = _T_92;
  assign ram_executed_2__T_126_data = ram_executed_2[ram_executed_2__T_126_addr];
  assign ram_executed_2__T_101_data = io_enq_bits_executed_2;
  assign ram_executed_2__T_101_addr = _T_90;
  assign ram_executed_2__T_101_mask = do_enq;
  assign ram_executed_2__T_101_en = do_enq;
  assign ram_executed_3__T_126_addr = _T_92;
  assign ram_executed_3__T_126_data = ram_executed_3[ram_executed_3__T_126_addr];
  assign ram_executed_3__T_101_data = io_enq_bits_executed_3;
  assign ram_executed_3__T_101_addr = _T_90;
  assign ram_executed_3__T_101_mask = do_enq;
  assign ram_executed_3__T_101_en = do_enq;
  assign ram_takens_0__T_126_addr = _T_92;
  assign ram_takens_0__T_126_data = ram_takens_0[ram_takens_0__T_126_addr];
  assign ram_takens_0__T_101_data = io_enq_bits_takens_0;
  assign ram_takens_0__T_101_addr = _T_90;
  assign ram_takens_0__T_101_mask = do_enq;
  assign ram_takens_0__T_101_en = do_enq;
  assign ram_takens_1__T_126_addr = _T_92;
  assign ram_takens_1__T_126_data = ram_takens_1[ram_takens_1__T_126_addr];
  assign ram_takens_1__T_101_data = io_enq_bits_takens_1;
  assign ram_takens_1__T_101_addr = _T_90;
  assign ram_takens_1__T_101_mask = do_enq;
  assign ram_takens_1__T_101_en = do_enq;
  assign ram_takens_2__T_126_addr = _T_92;
  assign ram_takens_2__T_126_data = ram_takens_2[ram_takens_2__T_126_addr];
  assign ram_takens_2__T_101_data = io_enq_bits_takens_2;
  assign ram_takens_2__T_101_addr = _T_90;
  assign ram_takens_2__T_101_mask = do_enq;
  assign ram_takens_2__T_101_en = do_enq;
  assign ram_takens_3__T_126_addr = _T_92;
  assign ram_takens_3__T_126_data = ram_takens_3[ram_takens_3__T_126_addr];
  assign ram_takens_3__T_101_data = io_enq_bits_takens_3;
  assign ram_takens_3__T_101_addr = _T_90;
  assign ram_takens_3__T_101_mask = do_enq;
  assign ram_takens_3__T_101_en = do_enq;
  assign ram_was_mispredicted__T_126_addr = _T_92;
  assign ram_was_mispredicted__T_126_data = ram_was_mispredicted[ram_was_mispredicted__T_126_addr];
  assign ram_was_mispredicted__T_101_data = io_enq_bits_was_mispredicted;
  assign ram_was_mispredicted__T_101_addr = _T_90;
  assign ram_was_mispredicted__T_101_mask = do_enq;
  assign ram_was_mispredicted__T_101_en = do_enq;
  assign ram_do_initialize__T_126_addr = _T_92;
  assign ram_do_initialize__T_126_data = ram_do_initialize[ram_do_initialize__T_126_addr];
  assign ram_do_initialize__T_101_data = io_enq_bits_do_initialize;
  assign ram_do_initialize__T_101_addr = _T_90;
  assign ram_do_initialize__T_101_mask = do_enq;
  assign ram_do_initialize__T_101_en = do_enq;
  assign _T_94 = _T_90 == _T_92;
  assign _T_96 = maybe_full == 1'h0;
  assign _T_97 = _T_94 & _T_96;
  assign _T_98 = _T_94 & maybe_full;
  assign _T_99 = io_enq_ready & io_enq_valid;
  assign do_enq = _T_99;
  assign _T_100 = io_deq_ready & io_deq_valid;
  assign do_deq = _T_100;
  assign _T_114 = _T_90 + 2'h1;
  assign _T_115 = _T_114[1:0];
  assign _GEN_14 = do_enq ? _T_115 : _T_90;
  assign _T_119 = _T_92 + 2'h1;
  assign _T_120 = _T_119[1:0];
  assign _GEN_15 = do_deq ? _T_120 : _T_92;
  assign _T_121 = do_enq != do_deq;
  assign _GEN_16 = _T_121 ? do_enq : maybe_full;
  assign _T_123 = _T_97 == 1'h0;
  assign _T_125 = _T_98 == 1'h0;
  assign _T_136 = _T_90 - _T_92;
  assign _T_137 = _T_136[1:0];
  assign _T_138 = maybe_full & _T_94;
  assign _T_139 = {_T_138,_T_137};
`ifdef RANDOMIZE
  integer initvar;
  initial begin
    `ifndef verilator
      #0.002 begin end
    `endif
  _GEN_0 = {1{$random}};
  `ifdef RANDOMIZE_MEM_INIT
  for (initvar = 0; initvar < 4; initvar = initvar+1)
    ram_index[initvar] = _GEN_0[10:0];
  `endif
  _GEN_1 = {1{$random}};
  `ifdef RANDOMIZE_MEM_INIT
  for (initvar = 0; initvar < 4; initvar = initvar+1)
    ram_executed_0[initvar] = _GEN_1[0:0];
  `endif
  _GEN_2 = {1{$random}};
  `ifdef RANDOMIZE_MEM_INIT
  for (initvar = 0; initvar < 4; initvar = initvar+1)
    ram_executed_1[initvar] = _GEN_2[0:0];
  `endif
  _GEN_3 = {1{$random}};
  `ifdef RANDOMIZE_MEM_INIT
  for (initvar = 0; initvar < 4; initvar = initvar+1)
    ram_executed_2[initvar] = _GEN_3[0:0];
  `endif
  _GEN_4 = {1{$random}};
  `ifdef RANDOMIZE_MEM_INIT
  for (initvar = 0; initvar < 4; initvar = initvar+1)
    ram_executed_3[initvar] = _GEN_4[0:0];
  `endif
  _GEN_5 = {1{$random}};
  `ifdef RANDOMIZE_MEM_INIT
  for (initvar = 0; initvar < 4; initvar = initvar+1)
    ram_takens_0[initvar] = _GEN_5[0:0];
  `endif
  _GEN_6 = {1{$random}};
  `ifdef RANDOMIZE_MEM_INIT
  for (initvar = 0; initvar < 4; initvar = initvar+1)
    ram_takens_1[initvar] = _GEN_6[0:0];
  `endif
  _GEN_7 = {1{$random}};
  `ifdef RANDOMIZE_MEM_INIT
  for (initvar = 0; initvar < 4; initvar = initvar+1)
    ram_takens_2[initvar] = _GEN_7[0:0];
  `endif
  _GEN_8 = {1{$random}};
  `ifdef RANDOMIZE_MEM_INIT
  for (initvar = 0; initvar < 4; initvar = initvar+1)
    ram_takens_3[initvar] = _GEN_8[0:0];
  `endif
  _GEN_9 = {1{$random}};
  `ifdef RANDOMIZE_MEM_INIT
  for (initvar = 0; initvar < 4; initvar = initvar+1)
    ram_was_mispredicted[initvar] = _GEN_9[0:0];
  `endif
  _GEN_10 = {1{$random}};
  `ifdef RANDOMIZE_MEM_INIT
  for (initvar = 0; initvar < 4; initvar = initvar+1)
    ram_do_initialize[initvar] = _GEN_10[0:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_11 = {1{$random}};
  _T_90 = _GEN_11[1:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_12 = {1{$random}};
  _T_92 = _GEN_12[1:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_13 = {1{$random}};
  maybe_full = _GEN_13[0:0];
  `endif
  end
`endif
  always @(posedge clock) begin
    if(ram_index__T_101_en & ram_index__T_101_mask) begin
      ram_index[ram_index__T_101_addr] <= ram_index__T_101_data;
    end
    if(ram_executed_0__T_101_en & ram_executed_0__T_101_mask) begin
      ram_executed_0[ram_executed_0__T_101_addr] <= ram_executed_0__T_101_data;
    end
    if(ram_executed_1__T_101_en & ram_executed_1__T_101_mask) begin
      ram_executed_1[ram_executed_1__T_101_addr] <= ram_executed_1__T_101_data;
    end
    if(ram_executed_2__T_101_en & ram_executed_2__T_101_mask) begin
      ram_executed_2[ram_executed_2__T_101_addr] <= ram_executed_2__T_101_data;
    end
    if(ram_executed_3__T_101_en & ram_executed_3__T_101_mask) begin
      ram_executed_3[ram_executed_3__T_101_addr] <= ram_executed_3__T_101_data;
    end
    if(ram_takens_0__T_101_en & ram_takens_0__T_101_mask) begin
      ram_takens_0[ram_takens_0__T_101_addr] <= ram_takens_0__T_101_data;
    end
    if(ram_takens_1__T_101_en & ram_takens_1__T_101_mask) begin
      ram_takens_1[ram_takens_1__T_101_addr] <= ram_takens_1__T_101_data;
    end
    if(ram_takens_2__T_101_en & ram_takens_2__T_101_mask) begin
      ram_takens_2[ram_takens_2__T_101_addr] <= ram_takens_2__T_101_data;
    end
    if(ram_takens_3__T_101_en & ram_takens_3__T_101_mask) begin
      ram_takens_3[ram_takens_3__T_101_addr] <= ram_takens_3__T_101_data;
    end
    if(ram_was_mispredicted__T_101_en & ram_was_mispredicted__T_101_mask) begin
      ram_was_mispredicted[ram_was_mispredicted__T_101_addr] <= ram_was_mispredicted__T_101_data;
    end
    if(ram_do_initialize__T_101_en & ram_do_initialize__T_101_mask) begin
      ram_do_initialize[ram_do_initialize__T_101_addr] <= ram_do_initialize__T_101_data;
    end
    if (reset) begin
      _T_90 <= 2'h0;
    end else begin
      if (do_enq) begin
        _T_90 <= _T_115;
      end
    end
    if (reset) begin
      _T_92 <= 2'h0;
    end else begin
      if (do_deq) begin
        _T_92 <= _T_120;
      end
    end
    if (reset) begin
      maybe_full <= 1'h0;
    end else begin
      if (_T_121) begin
        maybe_full <= do_enq;
      end
    end
  end
endmodule