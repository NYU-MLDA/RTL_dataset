module Queue_41(
  input   clock,
  input   reset,
  output  io_enq_ready,
  input   io_enq_valid,
  input  [10:0] io_enq_bits_index,
  input  [3:0] io_enq_bits_executed,
  input  [3:0] io_enq_bits_new_value,
  input   io_deq_ready,
  output  io_deq_valid,
  output [10:0] io_deq_bits_index,
  output [3:0] io_deq_bits_executed,
  output [3:0] io_deq_bits_new_value,
  output [2:0] io_count
);
  reg [10:0] ram_index [0:5];
  reg [31:0] _GEN_1;
  wire [10:0] ram_index__T_80_data;
  wire [2:0] ram_index__T_80_addr;
  reg [31:0] _GEN_2;
  wire [10:0] ram_index__T_59_data;
  wire [2:0] ram_index__T_59_addr;
  wire  ram_index__T_59_mask;
  wire  ram_index__T_59_en;
  reg [3:0] ram_executed [0:5];
  reg [31:0] _GEN_3;
  wire [3:0] ram_executed__T_80_data;
  wire [2:0] ram_executed__T_80_addr;
  reg [31:0] _GEN_4;
  wire [3:0] ram_executed__T_59_data;
  wire [2:0] ram_executed__T_59_addr;
  wire  ram_executed__T_59_mask;
  wire  ram_executed__T_59_en;
  reg [3:0] ram_new_value [0:5];
  reg [31:0] _GEN_5;
  wire [3:0] ram_new_value__T_80_data;
  wire [2:0] ram_new_value__T_80_addr;
  reg [31:0] _GEN_6;
  wire [3:0] ram_new_value__T_59_data;
  wire [2:0] ram_new_value__T_59_addr;
  wire  ram_new_value__T_59_mask;
  wire  ram_new_value__T_59_en;
  reg [2:0] _T_48;
  reg [31:0] _GEN_11;
  reg [2:0] _T_50;
  reg [31:0] _GEN_12;
  reg  maybe_full;
  reg [31:0] _GEN_13;
  wire  _T_52;
  wire  _T_54;
  wire  _T_55;
  wire  _T_56;
  wire  _T_57;
  wire  do_enq;
  wire  _T_58;
  wire  do_deq;
  wire  _T_64;
  wire [3:0] _T_66;
  wire [2:0] _T_67;
  wire [2:0] _GEN_0;
  wire [2:0] _GEN_7;
  wire  _T_70;
  wire [3:0] _T_72;
  wire [2:0] _T_73;
  wire [2:0] _GEN_8;
  wire [2:0] _GEN_9;
  wire  _T_75;
  wire  _GEN_10;
  wire  _T_77;
  wire  _T_79;
  wire [3:0] _T_84;
  wire [2:0] _T_85;
  wire [2:0] _T_88;
  wire  _T_89;
  wire [3:0] _T_91;
  wire [2:0] _T_92;
  wire [2:0] _T_93;
  wire [2:0] _T_94;
  assign io_enq_ready = _T_79;
  assign io_deq_valid = _T_77;
  assign io_deq_bits_index = ram_index__T_80_data;
  assign io_deq_bits_executed = ram_executed__T_80_data;
  assign io_deq_bits_new_value = ram_new_value__T_80_data;
  assign io_count = _T_94;
  assign ram_index__T_80_addr = _T_50;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign ram_index__T_80_data = ram_index[ram_index__T_80_addr];
  `else
  assign ram_index__T_80_data = ram_index__T_80_addr >= 3'h6 ? _GEN_2[10:0] : ram_index[ram_index__T_80_addr];
  `endif
  assign ram_index__T_59_data = io_enq_bits_index;
  assign ram_index__T_59_addr = _T_48;
  assign ram_index__T_59_mask = do_enq;
  assign ram_index__T_59_en = do_enq;
  assign ram_executed__T_80_addr = _T_50;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign ram_executed__T_80_data = ram_executed[ram_executed__T_80_addr];
  `else
  assign ram_executed__T_80_data = ram_executed__T_80_addr >= 3'h6 ? _GEN_4[3:0] : ram_executed[ram_executed__T_80_addr];
  `endif
  assign ram_executed__T_59_data = io_enq_bits_executed;
  assign ram_executed__T_59_addr = _T_48;
  assign ram_executed__T_59_mask = do_enq;
  assign ram_executed__T_59_en = do_enq;
  assign ram_new_value__T_80_addr = _T_50;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign ram_new_value__T_80_data = ram_new_value[ram_new_value__T_80_addr];
  `else
  assign ram_new_value__T_80_data = ram_new_value__T_80_addr >= 3'h6 ? _GEN_6[3:0] : ram_new_value[ram_new_value__T_80_addr];
  `endif
  assign ram_new_value__T_59_data = io_enq_bits_new_value;
  assign ram_new_value__T_59_addr = _T_48;
  assign ram_new_value__T_59_mask = do_enq;
  assign ram_new_value__T_59_en = do_enq;
  assign _T_52 = _T_48 == _T_50;
  assign _T_54 = maybe_full == 1'h0;
  assign _T_55 = _T_52 & _T_54;
  assign _T_56 = _T_52 & maybe_full;
  assign _T_57 = io_enq_ready & io_enq_valid;
  assign do_enq = _T_57;
  assign _T_58 = io_deq_ready & io_deq_valid;
  assign do_deq = _T_58;
  assign _T_64 = _T_48 == 3'h5;
  assign _T_66 = _T_48 + 3'h1;
  assign _T_67 = _T_66[2:0];
  assign _GEN_0 = _T_64 ? 3'h0 : _T_67;
  assign _GEN_7 = do_enq ? _GEN_0 : _T_48;
  assign _T_70 = _T_50 == 3'h5;
  assign _T_72 = _T_50 + 3'h1;
  assign _T_73 = _T_72[2:0];
  assign _GEN_8 = _T_70 ? 3'h0 : _T_73;
  assign _GEN_9 = do_deq ? _GEN_8 : _T_50;
  assign _T_75 = do_enq != do_deq;
  assign _GEN_10 = _T_75 ? do_enq : maybe_full;
  assign _T_77 = _T_55 == 1'h0;
  assign _T_79 = _T_56 == 1'h0;
  assign _T_84 = _T_48 - _T_50;
  assign _T_85 = _T_84[2:0];
  assign _T_88 = maybe_full ? 3'h6 : 3'h0;
  assign _T_89 = _T_50 > _T_48;
  assign _T_91 = 3'h6 + _T_85;
  assign _T_92 = _T_91[2:0];
  assign _T_93 = _T_89 ? _T_92 : _T_85;
  assign _T_94 = _T_52 ? _T_88 : _T_93;
`ifdef RANDOMIZE
  integer initvar;
  initial begin
    `ifndef verilator
      #0.002 begin end
    `endif
  _GEN_1 = {1{$random}};
  `ifdef RANDOMIZE_MEM_INIT
  for (initvar = 0; initvar < 6; initvar = initvar+1)
    ram_index[initvar] = _GEN_1[10:0];
  `endif
  _GEN_2 = {1{$random}};
  _GEN_3 = {1{$random}};
  `ifdef RANDOMIZE_MEM_INIT
  for (initvar = 0; initvar < 6; initvar = initvar+1)
    ram_executed[initvar] = _GEN_3[3:0];
  `endif
  _GEN_4 = {1{$random}};
  _GEN_5 = {1{$random}};
  `ifdef RANDOMIZE_MEM_INIT
  for (initvar = 0; initvar < 6; initvar = initvar+1)
    ram_new_value[initvar] = _GEN_5[3:0];
  `endif
  _GEN_6 = {1{$random}};
  `ifdef RANDOMIZE_REG_INIT
  _GEN_11 = {1{$random}};
  _T_48 = _GEN_11[2:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_12 = {1{$random}};
  _T_50 = _GEN_12[2:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_13 = {1{$random}};
  maybe_full = _GEN_13[0:0];
  `endif
  end
`endif
  always @(posedge clock) begin
    if(ram_index__T_59_en & ram_index__T_59_mask) begin
      ram_index[ram_index__T_59_addr] <= ram_index__T_59_data;
    end
    if(ram_executed__T_59_en & ram_executed__T_59_mask) begin
      ram_executed[ram_executed__T_59_addr] <= ram_executed__T_59_data;
    end
    if(ram_new_value__T_59_en & ram_new_value__T_59_mask) begin
      ram_new_value[ram_new_value__T_59_addr] <= ram_new_value__T_59_data;
    end
    if (reset) begin
      _T_48 <= 3'h0;
    end else begin
      if (do_enq) begin
        _T_48 <= _GEN_0;
      end
    end
    if (reset) begin
      _T_50 <= 3'h0;
    end else begin
      if (do_deq) begin
        _T_50 <= _GEN_8;
      end
    end
    if (reset) begin
      maybe_full <= 1'h0;
    end else begin
      if (_T_75) begin
        maybe_full <= do_enq;
      end
    end
  end
endmodule