module PositionalMultiQueue_16(
  input   clock,
  input   reset,
  input   io_enq_valid,
  input  [6:0] io_enq_bits_data,
  input   io_enq_bits_pos,
  input   io_enq_bits_way,
  input   io_deq_0_ready,
  output  io_deq_0_valid,
  output [6:0] io_deq_0_bits_data,
  output  io_deq_0_bits_pos,
  input   io_deq_1_ready,
  output  io_deq_1_valid,
  output [6:0] io_deq_1_bits_data,
  output  io_deq_1_bits_pos
);
  wire  _T_81_0;
  wire  _T_81_1;
  reg  empty_0;
  reg [31:0] _GEN_2;
  reg  empty_1;
  reg [31:0] _GEN_3;
  reg  head_0;
  reg [31:0] _GEN_4;
  reg  head_1;
  reg [31:0] _GEN_5;
  reg  tail_0;
  reg [31:0] _GEN_6;
  reg  tail_1;
  reg [31:0] _GEN_7;
  reg  next [0:0];
  reg [31:0] _GEN_8;
  wire  next__T_160_data;
  wire  next__T_160_addr;
  wire  next__T_178_data;
  wire  next__T_178_addr;
  wire  next__T_115_data;
  wire  next__T_115_addr;
  wire  next__T_115_mask;
  wire  next__T_115_en;
  reg [6:0] data [0:0];
  reg [31:0] _GEN_9;
  wire [6:0] data__T_157_data;
  wire  data__T_157_addr;
  wire [6:0] data__T_175_data;
  wire  data__T_175_addr;
  wire [6:0] data__T_103_data;
  wire  data__T_103_addr;
  wire  data__T_103_mask;
  wire  data__T_103_en;
  reg  guard;
  reg [31:0] _GEN_10;
  wire  _T_104;
  wire  _T_107;
  wire  _T_108;
  wire  _T_110;
  wire  _GEN_0;
  wire  _GEN_1;
  wire  _T_113;
  wire  _GEN_12;
  wire [1:0] _GEN_46;
  wire [1:0] setGuard;
  wire  deq_0_ready;
  wire  deq_0_valid;
  wire [6:0] deq_0_bits_data;
  wire  deq_0_bits_pos;
  wire  deq_1_ready;
  wire  deq_1_valid;
  wire [6:0] deq_1_bits_data;
  wire  deq_1_bits_pos;
  wire [1:0] _T_149;
  wire  _T_151;
  wire  _T_152;
  wire  _T_153;
  wire  _GEN_14;
  wire  _GEN_15;
  wire  _GEN_16;
  wire  _T_155;
  wire  _T_158;
  wire  _T_161;
  wire  _GEN_20;
  wire [1:0] _GEN_47;
  wire [1:0] _T_163;
  wire  _T_166;
  wire  _T_168;
  wire  _GEN_21;
  wire  _T_169;
  wire  _T_170;
  wire  _T_171;
  wire  _GEN_22;
  wire  _GEN_23;
  wire  _GEN_24;
  wire  _T_173;
  wire  _T_176;
  wire  _T_179;
  wire  _GEN_28;
  wire [1:0] _GEN_48;
  wire [1:0] _T_181;
  wire [1:0] clrGuard;
  wire  _T_183;
  wire  _T_185;
  wire  _GEN_29;
  wire [1:0] _GEN_49;
  wire [1:0] _T_186;
  wire [1:0] _T_187;
  wire [1:0] _T_188;
  assign io_deq_0_valid = deq_0_valid;
  assign io_deq_0_bits_data = deq_0_bits_data;
  assign io_deq_0_bits_pos = deq_0_bits_pos;
  assign io_deq_1_valid = deq_1_valid;
  assign io_deq_1_bits_data = deq_1_bits_data;
  assign io_deq_1_bits_pos = deq_1_bits_pos;
  assign _T_81_0 = 1'h1;
  assign _T_81_1 = 1'h1;
  assign next__T_160_addr = 1'h0;
  assign next__T_160_data = next[next__T_160_addr];
  assign next__T_178_addr = 1'h0;
  assign next__T_178_data = next[next__T_178_addr];
  assign next__T_115_data = io_enq_bits_pos;
  assign next__T_115_addr = 1'h0;
  assign next__T_115_mask = _GEN_12;
  assign next__T_115_en = _GEN_12;
  assign data__T_157_addr = 1'h0;
  assign data__T_157_data = data[data__T_157_addr];
  assign data__T_175_addr = 1'h0;
  assign data__T_175_data = data[data__T_175_addr];
  assign data__T_103_data = io_enq_bits_data;
  assign data__T_103_addr = 1'h0;
  assign data__T_103_mask = io_enq_valid;
  assign data__T_103_en = io_enq_valid;
  assign _T_104 = guard >> io_enq_bits_pos;
  assign _T_107 = _T_104 == 1'h0;
  assign _T_108 = _T_107 | reset;
  assign _T_110 = _T_108 == 1'h0;
  assign _GEN_0 = _GEN_1;
  assign _GEN_1 = io_enq_bits_way ? empty_1 : empty_0;
  assign _T_113 = _GEN_0 == 1'h0;
  assign _GEN_12 = io_enq_valid ? _T_113 : 1'h0;
  assign _GEN_46 = {{1'd0}, io_enq_valid};
  assign setGuard = _GEN_46 << io_enq_bits_pos;
  assign deq_0_ready = io_deq_0_ready;
  assign deq_0_valid = _T_155;
  assign deq_0_bits_data = data__T_157_data;
  assign deq_0_bits_pos = head_0;
  assign deq_1_ready = io_deq_1_ready;
  assign deq_1_valid = _T_173;
  assign deq_1_bits_data = data__T_175_data;
  assign deq_1_bits_pos = head_1;
  assign _T_149 = 2'h1 << io_enq_bits_way;
  assign _T_151 = _T_149[0];
  assign _T_152 = io_enq_valid & _T_151;
  assign _T_153 = head_0 == tail_0;
  assign _GEN_14 = empty_0 ? io_enq_bits_pos : head_0;
  assign _GEN_15 = _T_152 ? io_enq_bits_pos : tail_0;
  assign _GEN_16 = _T_152 ? _GEN_14 : head_0;
  assign _T_155 = empty_0 == 1'h0;
  assign _T_158 = deq_0_ready & deq_0_valid;
  assign _T_161 = _T_153 ? io_enq_bits_pos : next__T_160_data;
  assign _GEN_20 = _T_158 ? _T_161 : _GEN_16;
  assign _GEN_47 = {{1'd0}, _T_158};
  assign _T_163 = _GEN_47 << deq_0_bits_pos;
  assign _T_166 = _T_152 != _T_158;
  assign _T_168 = _T_158 & _T_153;
  assign _GEN_21 = _T_166 ? _T_168 : empty_0;
  assign _T_169 = _T_149[1];
  assign _T_170 = io_enq_valid & _T_169;
  assign _T_171 = head_1 == tail_1;
  assign _GEN_22 = empty_1 ? io_enq_bits_pos : head_1;
  assign _GEN_23 = _T_170 ? io_enq_bits_pos : tail_1;
  assign _GEN_24 = _T_170 ? _GEN_22 : head_1;
  assign _T_173 = empty_1 == 1'h0;
  assign _T_176 = deq_1_ready & deq_1_valid;
  assign _T_179 = _T_171 ? io_enq_bits_pos : next__T_178_data;
  assign _GEN_28 = _T_176 ? _T_179 : _GEN_24;
  assign _GEN_48 = {{1'd0}, _T_176};
  assign _T_181 = _GEN_48 << deq_1_bits_pos;
  assign clrGuard = _T_163 | _T_181;
  assign _T_183 = _T_170 != _T_176;
  assign _T_185 = _T_176 & _T_171;
  assign _GEN_29 = _T_183 ? _T_185 : empty_1;
  assign _GEN_49 = {{1'd0}, guard};
  assign _T_186 = _GEN_49 | setGuard;
  assign _T_187 = ~ clrGuard;
  assign _T_188 = _T_186 & _T_187;
`ifdef RANDOMIZE
  integer initvar;
  initial begin
    `ifndef verilator
      #0.002 begin end
    `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_2 = {1{$random}};
  empty_0 = _GEN_2[0:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_3 = {1{$random}};
  empty_1 = _GEN_3[0:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_4 = {1{$random}};
  head_0 = _GEN_4[0:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_5 = {1{$random}};
  head_1 = _GEN_5[0:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_6 = {1{$random}};
  tail_0 = _GEN_6[0:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_7 = {1{$random}};
  tail_1 = _GEN_7[0:0];
  `endif
  _GEN_8 = {1{$random}};
  `ifdef RANDOMIZE_MEM_INIT
  for (initvar = 0; initvar < 1; initvar = initvar+1)
    next[initvar] = _GEN_8[0:0];
  `endif
  _GEN_9 = {1{$random}};
  `ifdef RANDOMIZE_MEM_INIT
  for (initvar = 0; initvar < 1; initvar = initvar+1)
    data[initvar] = _GEN_9[6:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_10 = {1{$random}};
  guard = _GEN_10[0:0];
  `endif
  end
`endif
  always @(posedge clock) begin
    if (reset) begin
      empty_0 <= _T_81_0;
    end else begin
      if (_T_166) begin
        empty_0 <= _T_168;
      end
    end
    if (reset) begin
      empty_1 <= _T_81_1;
    end else begin
      if (_T_183) begin
        empty_1 <= _T_185;
      end
    end
    if (_T_158) begin
      if (_T_153) begin
        head_0 <= io_enq_bits_pos;
      end else begin
        head_0 <= next__T_160_data;
      end
    end else begin
      if (_T_152) begin
        if (empty_0) begin
          head_0 <= io_enq_bits_pos;
        end
      end
    end
    if (_T_176) begin
      if (_T_171) begin
        head_1 <= io_enq_bits_pos;
      end else begin
        head_1 <= next__T_178_data;
      end
    end else begin
      if (_T_170) begin
        if (empty_1) begin
          head_1 <= io_enq_bits_pos;
        end
      end
    end
    if (_T_152) begin
      tail_0 <= io_enq_bits_pos;
    end
    if (_T_170) begin
      tail_1 <= io_enq_bits_pos;
    end
    if(next__T_115_en & next__T_115_mask) begin
      next[next__T_115_addr] <= next__T_115_data;
    end
    if(data__T_103_en & data__T_103_mask) begin
      data[data__T_103_addr] <= data__T_103_data;
    end
    if (reset) begin
      guard <= 1'h0;
    end else begin
      guard <= _T_188[0];
    end
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (io_enq_valid & _T_110) begin
          $fwrite(32'h80000002,"Assertion failed\n    at PositionalMultiQueue.scala:46 assert (!guard(io.enq.bits.pos))\n");
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (io_enq_valid & _T_110) begin
          $fatal;
        end
    `ifdef STOP_COND
      end
    `endif
    `endif
  end
endmodule