module Queue_15(
  input   clock,
  input   reset,
  output  io_enq_ready,
  input   io_enq_valid,
  input  [3:0] io_enq_bits_id,
  input  [30:0] io_enq_bits_addr,
  input  [7:0] io_enq_bits_len,
  input  [2:0] io_enq_bits_size,
  input  [1:0] io_enq_bits_burst,
  input   io_enq_bits_lock,
  input  [3:0] io_enq_bits_cache,
  input  [2:0] io_enq_bits_prot,
  input  [3:0] io_enq_bits_qos,
  input   io_deq_ready,
  output  io_deq_valid,
  output [3:0] io_deq_bits_id,
  output [30:0] io_deq_bits_addr,
  output [7:0] io_deq_bits_len,
  output [2:0] io_deq_bits_size,
  output [1:0] io_deq_bits_burst,
  output  io_deq_bits_lock,
  output [3:0] io_deq_bits_cache,
  output [2:0] io_deq_bits_prot,
  output [3:0] io_deq_bits_qos,
  output [1:0] io_count
);
  reg [3:0] ram_id [0:1];
  reg [31:0] _GEN_0;
  wire [3:0] ram_id__T_126_data;
  wire  ram_id__T_126_addr;
  wire [3:0] ram_id__T_101_data;
  wire  ram_id__T_101_addr;
  wire  ram_id__T_101_mask;
  wire  ram_id__T_101_en;
  reg [30:0] ram_addr [0:1];
  reg [31:0] _GEN_1;
  wire [30:0] ram_addr__T_126_data;
  wire  ram_addr__T_126_addr;
  wire [30:0] ram_addr__T_101_data;
  wire  ram_addr__T_101_addr;
  wire  ram_addr__T_101_mask;
  wire  ram_addr__T_101_en;
  reg [7:0] ram_len [0:1];
  reg [31:0] _GEN_2;
  wire [7:0] ram_len__T_126_data;
  wire  ram_len__T_126_addr;
  wire [7:0] ram_len__T_101_data;
  wire  ram_len__T_101_addr;
  wire  ram_len__T_101_mask;
  wire  ram_len__T_101_en;
  reg [2:0] ram_size [0:1];
  reg [31:0] _GEN_3;
  wire [2:0] ram_size__T_126_data;
  wire  ram_size__T_126_addr;
  wire [2:0] ram_size__T_101_data;
  wire  ram_size__T_101_addr;
  wire  ram_size__T_101_mask;
  wire  ram_size__T_101_en;
  reg [1:0] ram_burst [0:1];
  reg [31:0] _GEN_4;
  wire [1:0] ram_burst__T_126_data;
  wire  ram_burst__T_126_addr;
  wire [1:0] ram_burst__T_101_data;
  wire  ram_burst__T_101_addr;
  wire  ram_burst__T_101_mask;
  wire  ram_burst__T_101_en;
  reg  ram_lock [0:1];
  reg [31:0] _GEN_5;
  wire  ram_lock__T_126_data;
  wire  ram_lock__T_126_addr;
  wire  ram_lock__T_101_data;
  wire  ram_lock__T_101_addr;
  wire  ram_lock__T_101_mask;
  wire  ram_lock__T_101_en;
  reg [3:0] ram_cache [0:1];
  reg [31:0] _GEN_6;
  wire [3:0] ram_cache__T_126_data;
  wire  ram_cache__T_126_addr;
  wire [3:0] ram_cache__T_101_data;
  wire  ram_cache__T_101_addr;
  wire  ram_cache__T_101_mask;
  wire  ram_cache__T_101_en;
  reg [2:0] ram_prot [0:1];
  reg [31:0] _GEN_7;
  wire [2:0] ram_prot__T_126_data;
  wire  ram_prot__T_126_addr;
  wire [2:0] ram_prot__T_101_data;
  wire  ram_prot__T_101_addr;
  wire  ram_prot__T_101_mask;
  wire  ram_prot__T_101_en;
  reg [3:0] ram_qos [0:1];
  reg [31:0] _GEN_8;
  wire [3:0] ram_qos__T_126_data;
  wire  ram_qos__T_126_addr;
  wire [3:0] ram_qos__T_101_data;
  wire  ram_qos__T_101_addr;
  wire  ram_qos__T_101_mask;
  wire  ram_qos__T_101_en;
  reg  _T_90;
  reg [31:0] _GEN_9;
  reg  _T_92;
  reg [31:0] _GEN_10;
  reg  maybe_full;
  reg [31:0] _GEN_11;
  wire  _T_94;
  wire  _T_96;
  wire  _T_97;
  wire  _T_98;
  wire  _T_99;
  wire  do_enq;
  wire  _T_100;
  wire  do_deq;
  wire [1:0] _T_114;
  wire  _T_115;
  wire  _GEN_12;
  wire [1:0] _T_119;
  wire  _T_120;
  wire  _GEN_13;
  wire  _T_121;
  wire  _GEN_14;
  wire  _T_123;
  wire  _T_125;
  wire [1:0] _T_136;
  wire  _T_137;
  wire  _T_138;
  wire [1:0] _T_139;
  assign io_enq_ready = _T_125;
  assign io_deq_valid = _T_123;
  assign io_deq_bits_id = ram_id__T_126_data;
  assign io_deq_bits_addr = ram_addr__T_126_data;
  assign io_deq_bits_len = ram_len__T_126_data;
  assign io_deq_bits_size = ram_size__T_126_data;
  assign io_deq_bits_burst = ram_burst__T_126_data;
  assign io_deq_bits_lock = ram_lock__T_126_data;
  assign io_deq_bits_cache = ram_cache__T_126_data;
  assign io_deq_bits_prot = ram_prot__T_126_data;
  assign io_deq_bits_qos = ram_qos__T_126_data;
  assign io_count = _T_139;
  assign ram_id__T_126_addr = _T_92;
  assign ram_id__T_126_data = ram_id[ram_id__T_126_addr];
  assign ram_id__T_101_data = io_enq_bits_id;
  assign ram_id__T_101_addr = _T_90;
  assign ram_id__T_101_mask = do_enq;
  assign ram_id__T_101_en = do_enq;
  assign ram_addr__T_126_addr = _T_92;
  assign ram_addr__T_126_data = ram_addr[ram_addr__T_126_addr];
  assign ram_addr__T_101_data = io_enq_bits_addr;
  assign ram_addr__T_101_addr = _T_90;
  assign ram_addr__T_101_mask = do_enq;
  assign ram_addr__T_101_en = do_enq;
  assign ram_len__T_126_addr = _T_92;
  assign ram_len__T_126_data = ram_len[ram_len__T_126_addr];
  assign ram_len__T_101_data = io_enq_bits_len;
  assign ram_len__T_101_addr = _T_90;
  assign ram_len__T_101_mask = do_enq;
  assign ram_len__T_101_en = do_enq;
  assign ram_size__T_126_addr = _T_92;
  assign ram_size__T_126_data = ram_size[ram_size__T_126_addr];
  assign ram_size__T_101_data = io_enq_bits_size;
  assign ram_size__T_101_addr = _T_90;
  assign ram_size__T_101_mask = do_enq;
  assign ram_size__T_101_en = do_enq;
  assign ram_burst__T_126_addr = _T_92;
  assign ram_burst__T_126_data = ram_burst[ram_burst__T_126_addr];
  assign ram_burst__T_101_data = io_enq_bits_burst;
  assign ram_burst__T_101_addr = _T_90;
  assign ram_burst__T_101_mask = do_enq;
  assign ram_burst__T_101_en = do_enq;
  assign ram_lock__T_126_addr = _T_92;
  assign ram_lock__T_126_data = ram_lock[ram_lock__T_126_addr];
  assign ram_lock__T_101_data = io_enq_bits_lock;
  assign ram_lock__T_101_addr = _T_90;
  assign ram_lock__T_101_mask = do_enq;
  assign ram_lock__T_101_en = do_enq;
  assign ram_cache__T_126_addr = _T_92;
  assign ram_cache__T_126_data = ram_cache[ram_cache__T_126_addr];
  assign ram_cache__T_101_data = io_enq_bits_cache;
  assign ram_cache__T_101_addr = _T_90;
  assign ram_cache__T_101_mask = do_enq;
  assign ram_cache__T_101_en = do_enq;
  assign ram_prot__T_126_addr = _T_92;
  assign ram_prot__T_126_data = ram_prot[ram_prot__T_126_addr];
  assign ram_prot__T_101_data = io_enq_bits_prot;
  assign ram_prot__T_101_addr = _T_90;
  assign ram_prot__T_101_mask = do_enq;
  assign ram_prot__T_101_en = do_enq;
  assign ram_qos__T_126_addr = _T_92;
  assign ram_qos__T_126_data = ram_qos[ram_qos__T_126_addr];
  assign ram_qos__T_101_data = io_enq_bits_qos;
  assign ram_qos__T_101_addr = _T_90;
  assign ram_qos__T_101_mask = do_enq;
  assign ram_qos__T_101_en = do_enq;
  assign _T_94 = _T_90 == _T_92;
  assign _T_96 = maybe_full == 1'h0;
  assign _T_97 = _T_94 & _T_96;
  assign _T_98 = _T_94 & maybe_full;
  assign _T_99 = io_enq_ready & io_enq_valid;
  assign do_enq = _T_99;
  assign _T_100 = io_deq_ready & io_deq_valid;
  assign do_deq = _T_100;
  assign _T_114 = _T_90 + 1'h1;
  assign _T_115 = _T_114[0:0];
  assign _GEN_12 = do_enq ? _T_115 : _T_90;
  assign _T_119 = _T_92 + 1'h1;
  assign _T_120 = _T_119[0:0];
  assign _GEN_13 = do_deq ? _T_120 : _T_92;
  assign _T_121 = do_enq != do_deq;
  assign _GEN_14 = _T_121 ? do_enq : maybe_full;
  assign _T_123 = _T_97 == 1'h0;
  assign _T_125 = _T_98 == 1'h0;
  assign _T_136 = _T_90 - _T_92;
  assign _T_137 = _T_136[0:0];
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
  for (initvar = 0; initvar < 2; initvar = initvar+1)
    ram_id[initvar] = _GEN_0[3:0];
  `endif
  _GEN_1 = {1{$random}};
  `ifdef RANDOMIZE_MEM_INIT
  for (initvar = 0; initvar < 2; initvar = initvar+1)
    ram_addr[initvar] = _GEN_1[30:0];
  `endif
  _GEN_2 = {1{$random}};
  `ifdef RANDOMIZE_MEM_INIT
  for (initvar = 0; initvar < 2; initvar = initvar+1)
    ram_len[initvar] = _GEN_2[7:0];
  `endif
  _GEN_3 = {1{$random}};
  `ifdef RANDOMIZE_MEM_INIT
  for (initvar = 0; initvar < 2; initvar = initvar+1)
    ram_size[initvar] = _GEN_3[2:0];
  `endif
  _GEN_4 = {1{$random}};
  `ifdef RANDOMIZE_MEM_INIT
  for (initvar = 0; initvar < 2; initvar = initvar+1)
    ram_burst[initvar] = _GEN_4[1:0];
  `endif
  _GEN_5 = {1{$random}};
  `ifdef RANDOMIZE_MEM_INIT
  for (initvar = 0; initvar < 2; initvar = initvar+1)
    ram_lock[initvar] = _GEN_5[0:0];
  `endif
  _GEN_6 = {1{$random}};
  `ifdef RANDOMIZE_MEM_INIT
  for (initvar = 0; initvar < 2; initvar = initvar+1)
    ram_cache[initvar] = _GEN_6[3:0];
  `endif
  _GEN_7 = {1{$random}};
  `ifdef RANDOMIZE_MEM_INIT
  for (initvar = 0; initvar < 2; initvar = initvar+1)
    ram_prot[initvar] = _GEN_7[2:0];
  `endif
  _GEN_8 = {1{$random}};
  `ifdef RANDOMIZE_MEM_INIT
  for (initvar = 0; initvar < 2; initvar = initvar+1)
    ram_qos[initvar] = _GEN_8[3:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_9 = {1{$random}};
  _T_90 = _GEN_9[0:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_10 = {1{$random}};
  _T_92 = _GEN_10[0:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_11 = {1{$random}};
  maybe_full = _GEN_11[0:0];
  `endif
  end
`endif
  always @(posedge clock) begin
    if(ram_id__T_101_en & ram_id__T_101_mask) begin
      ram_id[ram_id__T_101_addr] <= ram_id__T_101_data;
    end
    if(ram_addr__T_101_en & ram_addr__T_101_mask) begin
      ram_addr[ram_addr__T_101_addr] <= ram_addr__T_101_data;
    end
    if(ram_len__T_101_en & ram_len__T_101_mask) begin
      ram_len[ram_len__T_101_addr] <= ram_len__T_101_data;
    end
    if(ram_size__T_101_en & ram_size__T_101_mask) begin
      ram_size[ram_size__T_101_addr] <= ram_size__T_101_data;
    end
    if(ram_burst__T_101_en & ram_burst__T_101_mask) begin
      ram_burst[ram_burst__T_101_addr] <= ram_burst__T_101_data;
    end
    if(ram_lock__T_101_en & ram_lock__T_101_mask) begin
      ram_lock[ram_lock__T_101_addr] <= ram_lock__T_101_data;
    end
    if(ram_cache__T_101_en & ram_cache__T_101_mask) begin
      ram_cache[ram_cache__T_101_addr] <= ram_cache__T_101_data;
    end
    if(ram_prot__T_101_en & ram_prot__T_101_mask) begin
      ram_prot[ram_prot__T_101_addr] <= ram_prot__T_101_data;
    end
    if(ram_qos__T_101_en & ram_qos__T_101_mask) begin
      ram_qos[ram_qos__T_101_addr] <= ram_qos__T_101_data;
    end
    if (reset) begin
      _T_90 <= 1'h0;
    end else begin
      if (do_enq) begin
        _T_90 <= _T_115;
      end
    end
    if (reset) begin
      _T_92 <= 1'h0;
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