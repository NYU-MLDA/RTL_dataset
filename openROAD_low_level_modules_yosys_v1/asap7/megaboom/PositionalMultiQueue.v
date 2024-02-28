module PositionalMultiQueue(
  input   clock,
  input   reset,
  input   io_enq_valid,
  input  [6:0] io_enq_bits_data,
  input  [1:0] io_enq_bits_pos,
  input   io_enq_bits_way,
  input   io_deq_0_ready,
  output  io_deq_0_valid,
  output [6:0] io_deq_0_bits_data,
  output [1:0] io_deq_0_bits_pos,
  input   io_deq_1_ready,
  output  io_deq_1_valid,
  output [6:0] io_deq_1_bits_data,
  output [1:0] io_deq_1_bits_pos
);
  wire  _T_81_0;
  wire  _T_81_1;
  reg  empty_0;
  reg [31:0] _GEN_4;
  reg  empty_1;
  reg [31:0] _GEN_5;
  reg [1:0] head_0;
  reg [31:0] _GEN_6;
  reg [1:0] head_1;
  reg [31:0] _GEN_7;
  reg [1:0] tail_0;
  reg [31:0] _GEN_8;
  reg [1:0] tail_1;
  reg [31:0] _GEN_9;
  reg [1:0] next [0:3];
  reg [31:0] _GEN_10;
  wire [1:0] next__T_156_data;
  wire [1:0] next__T_156_addr;
  wire [1:0] next__T_172_data;
  wire [1:0] next__T_172_addr;
  wire [1:0] next__T_113_data;
  wire [1:0] next__T_113_addr;
  wire  next__T_113_mask;
  wire  next__T_113_en;
  reg [6:0] data [0:3];
  reg [31:0] _GEN_11;
  wire [6:0] data__T_154_data;
  wire [1:0] data__T_154_addr;
  wire [6:0] data__T_170_data;
  wire [1:0] data__T_170_addr;
  wire [6:0] data__T_102_data;
  wire [1:0] data__T_102_addr;
  wire  data__T_102_mask;
  wire  data__T_102_en;
  reg [3:0] guard;
  reg [31:0] _GEN_12;
  wire [3:0] _T_103;
  wire  _T_104;
  wire  _T_106;
  wire  _T_107;
  wire  _T_109;
  wire  _GEN_0;
  wire  _GEN_2;
  wire  _T_112;
  wire [1:0] _GEN_1;
  wire [1:0] _GEN_3;
  wire  _GEN_14;
  wire [3:0] _GEN_48;
  wire [3:0] setGuard;
  wire  deq_0_ready;
  wire  deq_0_valid;
  wire [6:0] deq_0_bits_data;
  wire [1:0] deq_0_bits_pos;
  wire  deq_1_ready;
  wire  deq_1_valid;
  wire [6:0] deq_1_bits_data;
  wire [1:0] deq_1_bits_pos;
  wire [1:0] _T_147;
  wire  _T_149;
  wire  _T_150;
  wire  _T_151;
  wire [1:0] _GEN_16;
  wire [1:0] _GEN_17;
  wire [1:0] _GEN_18;
  wire  _T_153;
  wire  _T_155;
  wire [1:0] _T_157;
  wire [1:0] _GEN_22;
  wire [3:0] _GEN_49;
  wire [3:0] _T_159;
  wire  _T_162;
  wire  _T_164;
  wire  _GEN_23;
  wire  _T_165;
  wire  _T_166;
  wire  _T_167;
  wire [1:0] _GEN_24;
  wire [1:0] _GEN_25;
  wire [1:0] _GEN_26;
  wire  _T_169;
  wire  _T_171;
  wire [1:0] _T_173;
  wire [1:0] _GEN_30;
  wire [3:0] _GEN_50;
  wire [3:0] _T_175;
  wire [3:0] clrGuard;
  wire  _T_177;
  wire  _T_179;
  wire  _GEN_31;
  wire [3:0] _T_180;
  wire [3:0] _T_181;
  wire [3:0] _T_182;
  assign io_deq_0_valid = deq_0_valid;
  assign io_deq_0_bits_data = deq_0_bits_data;
  assign io_deq_0_bits_pos = deq_0_bits_pos;
  assign io_deq_1_valid = deq_1_valid;
  assign io_deq_1_bits_data = deq_1_bits_data;
  assign io_deq_1_bits_pos = deq_1_bits_pos;
  assign _T_81_0 = 1'h1;
  assign _T_81_1 = 1'h1;
  assign next__T_156_addr = head_0;
  assign next__T_156_data = next[next__T_156_addr];
  assign next__T_172_addr = head_1;
  assign next__T_172_data = next[next__T_172_addr];
  assign next__T_113_data = io_enq_bits_pos;
  assign next__T_113_addr = _GEN_1;
  assign next__T_113_mask = _GEN_14;
  assign next__T_113_en = _GEN_14;
  assign data__T_154_addr = head_0;
  assign data__T_154_data = data[data__T_154_addr];
  assign data__T_170_addr = head_1;
  assign data__T_170_data = data[data__T_170_addr];
  assign data__T_102_data = io_enq_bits_data;
  assign data__T_102_addr = io_enq_bits_pos;
  assign data__T_102_mask = io_enq_valid;
  assign data__T_102_en = io_enq_valid;
  assign _T_103 = guard >> io_enq_bits_pos;
  assign _T_104 = _T_103[0];
  assign _T_106 = _T_104 == 1'h0;
  assign _T_107 = _T_106 | reset;
  assign _T_109 = _T_107 == 1'h0;
  assign _GEN_0 = _GEN_2;
  assign _GEN_2 = io_enq_bits_way ? empty_1 : empty_0;
  assign _T_112 = _GEN_0 == 1'h0;
  assign _GEN_1 = _GEN_3;
  assign _GEN_3 = io_enq_bits_way ? tail_1 : tail_0;
  assign _GEN_14 = io_enq_valid ? _T_112 : 1'h0;
  assign _GEN_48 = {{3'd0}, io_enq_valid};
  assign setGuard = _GEN_48 << io_enq_bits_pos;
  assign deq_0_ready = io_deq_0_ready;
  assign deq_0_valid = _T_153;
  assign deq_0_bits_data = data__T_154_data;
  assign deq_0_bits_pos = head_0;
  assign deq_1_ready = io_deq_1_ready;
  assign deq_1_valid = _T_169;
  assign deq_1_bits_data = data__T_170_data;
  assign deq_1_bits_pos = head_1;
  assign _T_147 = 2'h1 << io_enq_bits_way;
  assign _T_149 = _T_147[0];
  assign _T_150 = io_enq_valid & _T_149;
  assign _T_151 = head_0 == tail_0;
  assign _GEN_16 = empty_0 ? io_enq_bits_pos : head_0;
  assign _GEN_17 = _T_150 ? io_enq_bits_pos : tail_0;
  assign _GEN_18 = _T_150 ? _GEN_16 : head_0;
  assign _T_153 = empty_0 == 1'h0;
  assign _T_155 = deq_0_ready & deq_0_valid;
  assign _T_157 = _T_151 ? io_enq_bits_pos : next__T_156_data;
  assign _GEN_22 = _T_155 ? _T_157 : _GEN_18;
  assign _GEN_49 = {{3'd0}, _T_155};
  assign _T_159 = _GEN_49 << deq_0_bits_pos;
  assign _T_162 = _T_150 != _T_155;
  assign _T_164 = _T_155 & _T_151;
  assign _GEN_23 = _T_162 ? _T_164 : empty_0;
  assign _T_165 = _T_147[1];
  assign _T_166 = io_enq_valid & _T_165;
  assign _T_167 = head_1 == tail_1;
  assign _GEN_24 = empty_1 ? io_enq_bits_pos : head_1;
  assign _GEN_25 = _T_166 ? io_enq_bits_pos : tail_1;
  assign _GEN_26 = _T_166 ? _GEN_24 : head_1;
  assign _T_169 = empty_1 == 1'h0;
  assign _T_171 = deq_1_ready & deq_1_valid;
  assign _T_173 = _T_167 ? io_enq_bits_pos : next__T_172_data;
  assign _GEN_30 = _T_171 ? _T_173 : _GEN_26;
  assign _GEN_50 = {{3'd0}, _T_171};
  assign _T_175 = _GEN_50 << deq_1_bits_pos;
  assign clrGuard = _T_159 | _T_175;
  assign _T_177 = _T_166 != _T_171;
  assign _T_179 = _T_171 & _T_167;
  assign _GEN_31 = _T_177 ? _T_179 : empty_1;
  assign _T_180 = guard | setGuard;
  assign _T_181 = ~ clrGuard;
  assign _T_182 = _T_180 & _T_181;
`ifdef RANDOMIZE
  integer initvar;
  initial begin
    `ifndef verilator
      #0.002 begin end
    `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_4 = {1{$random}};
  empty_0 = _GEN_4[0:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_5 = {1{$random}};
  empty_1 = _GEN_5[0:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_6 = {1{$random}};
  head_0 = _GEN_6[1:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_7 = {1{$random}};
  head_1 = _GEN_7[1:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_8 = {1{$random}};
  tail_0 = _GEN_8[1:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_9 = {1{$random}};
  tail_1 = _GEN_9[1:0];
  `endif
  _GEN_10 = {1{$random}};
  `ifdef RANDOMIZE_MEM_INIT
  for (initvar = 0; initvar < 4; initvar = initvar+1)
    next[initvar] = _GEN_10[1:0];
  `endif
  _GEN_11 = {1{$random}};
  `ifdef RANDOMIZE_MEM_INIT
  for (initvar = 0; initvar < 4; initvar = initvar+1)
    data[initvar] = _GEN_11[6:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_12 = {1{$random}};
  guard = _GEN_12[3:0];
  `endif
  end
`endif
  always @(posedge clock) begin
    if (reset) begin
      empty_0 <= _T_81_0;
    end else begin
      if (_T_162) begin
        empty_0 <= _T_164;
      end
    end
    if (reset) begin
      empty_1 <= _T_81_1;
    end else begin
      if (_T_177) begin
        empty_1 <= _T_179;
      end
    end
    if (_T_155) begin
      head_0 <= _T_157;
    end else begin
      if (_T_150) begin
        head_0 <= _GEN_16;
      end
    end
    if (_T_171) begin
      head_1 <= _T_173;
    end else begin
      if (_T_166) begin
        head_1 <= _GEN_24;
      end
    end
    if (_T_150) begin
      tail_0 <= io_enq_bits_pos;
    end
    if (_T_166) begin
      tail_1 <= io_enq_bits_pos;
    end
    if(next__T_113_en & next__T_113_mask) begin
      next[next__T_113_addr] <= next__T_113_data;
    end
    if(data__T_102_en & data__T_102_mask) begin
      data[data__T_102_addr] <= data__T_102_data;
    end
    if (reset) begin
      guard <= 4'h0;
    end else begin
      guard <= _T_182;
    end
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (io_enq_valid & _T_109) begin
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
        if (io_enq_valid & _T_109) begin
          $fatal;
        end
    `ifdef STOP_COND
      end
    `endif
    `endif
  end
endmodule