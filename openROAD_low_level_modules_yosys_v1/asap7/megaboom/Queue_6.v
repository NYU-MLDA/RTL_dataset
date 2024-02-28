module Queue_6(
  input   clock,
  input   reset,
  output  io_enq_ready,
  input   io_enq_valid,
  input  [3:0] io_enq_bits_id,
  input  [31:0] io_enq_bits_addr,
  input  [7:0] io_enq_bits_len,
  input  [2:0] io_enq_bits_size,
  input  [1:0] io_enq_bits_burst,
  input   io_enq_bits_lock,
  input  [3:0] io_enq_bits_cache,
  input  [2:0] io_enq_bits_prot,
  input  [3:0] io_enq_bits_qos,
  input   io_enq_bits_wen,
  input   io_deq_ready,
  output  io_deq_valid,
  output [3:0] io_deq_bits_id,
  output [31:0] io_deq_bits_addr,
  output [7:0] io_deq_bits_len,
  output [2:0] io_deq_bits_size,
  output [1:0] io_deq_bits_burst,
  output  io_deq_bits_lock,
  output [3:0] io_deq_bits_cache,
  output [2:0] io_deq_bits_prot,
  output [3:0] io_deq_bits_qos,
  output  io_deq_bits_wen,
  output  io_count
);
  reg [3:0] ram_id [0:0];
  reg [31:0] _GEN_0;
  wire [3:0] ram_id__T_126_data;
  wire  ram_id__T_126_addr;
  wire [3:0] ram_id__T_107_data;
  wire  ram_id__T_107_addr;
  wire  ram_id__T_107_mask;
  wire  ram_id__T_107_en;
  reg [31:0] ram_addr [0:0];
  reg [31:0] _GEN_1;
  wire [31:0] ram_addr__T_126_data;
  wire  ram_addr__T_126_addr;
  wire [31:0] ram_addr__T_107_data;
  wire  ram_addr__T_107_addr;
  wire  ram_addr__T_107_mask;
  wire  ram_addr__T_107_en;
  reg [7:0] ram_len [0:0];
  reg [31:0] _GEN_2;
  wire [7:0] ram_len__T_126_data;
  wire  ram_len__T_126_addr;
  wire [7:0] ram_len__T_107_data;
  wire  ram_len__T_107_addr;
  wire  ram_len__T_107_mask;
  wire  ram_len__T_107_en;
  reg [2:0] ram_size [0:0];
  reg [31:0] _GEN_3;
  wire [2:0] ram_size__T_126_data;
  wire  ram_size__T_126_addr;
  wire [2:0] ram_size__T_107_data;
  wire  ram_size__T_107_addr;
  wire  ram_size__T_107_mask;
  wire  ram_size__T_107_en;
  reg [1:0] ram_burst [0:0];
  reg [31:0] _GEN_4;
  wire [1:0] ram_burst__T_126_data;
  wire  ram_burst__T_126_addr;
  wire [1:0] ram_burst__T_107_data;
  wire  ram_burst__T_107_addr;
  wire  ram_burst__T_107_mask;
  wire  ram_burst__T_107_en;
  reg  ram_lock [0:0];
  reg [31:0] _GEN_5;
  wire  ram_lock__T_126_data;
  wire  ram_lock__T_126_addr;
  wire  ram_lock__T_107_data;
  wire  ram_lock__T_107_addr;
  wire  ram_lock__T_107_mask;
  wire  ram_lock__T_107_en;
  reg [3:0] ram_cache [0:0];
  reg [31:0] _GEN_6;
  wire [3:0] ram_cache__T_126_data;
  wire  ram_cache__T_126_addr;
  wire [3:0] ram_cache__T_107_data;
  wire  ram_cache__T_107_addr;
  wire  ram_cache__T_107_mask;
  wire  ram_cache__T_107_en;
  reg [2:0] ram_prot [0:0];
  reg [31:0] _GEN_7;
  wire [2:0] ram_prot__T_126_data;
  wire  ram_prot__T_126_addr;
  wire [2:0] ram_prot__T_107_data;
  wire  ram_prot__T_107_addr;
  wire  ram_prot__T_107_mask;
  wire  ram_prot__T_107_en;
  reg [3:0] ram_qos [0:0];
  reg [31:0] _GEN_8;
  wire [3:0] ram_qos__T_126_data;
  wire  ram_qos__T_126_addr;
  wire [3:0] ram_qos__T_107_data;
  wire  ram_qos__T_107_addr;
  wire  ram_qos__T_107_mask;
  wire  ram_qos__T_107_en;
  reg  ram_wen [0:0];
  reg [31:0] _GEN_9;
  wire  ram_wen__T_126_data;
  wire  ram_wen__T_126_addr;
  wire  ram_wen__T_107_data;
  wire  ram_wen__T_107_addr;
  wire  ram_wen__T_107_mask;
  wire  ram_wen__T_107_en;
  reg  maybe_full;
  reg [31:0] _GEN_10;
  wire  _T_101;
  wire  _T_104;
  wire  do_enq;
  wire  _T_105;
  wire  do_deq;
  wire  _T_120;
  wire  _GEN_13;
  wire  _T_122;
  wire  _GEN_14;
  wire  _GEN_15;
  wire [3:0] _GEN_16;
  wire [31:0] _GEN_17;
  wire [7:0] _GEN_18;
  wire [2:0] _GEN_19;
  wire [1:0] _GEN_20;
  wire  _GEN_21;
  wire [3:0] _GEN_22;
  wire [2:0] _GEN_23;
  wire [3:0] _GEN_24;
  wire  _GEN_25;
  wire  _GEN_26;
  wire  _GEN_27;
  wire [1:0] _T_140;
  wire  _T_141;
  wire [1:0] _T_143;
  assign io_enq_ready = _T_101;
  assign io_deq_valid = _GEN_14;
  assign io_deq_bits_id = _GEN_16;
  assign io_deq_bits_addr = _GEN_17;
  assign io_deq_bits_len = _GEN_18;
  assign io_deq_bits_size = _GEN_19;
  assign io_deq_bits_burst = _GEN_20;
  assign io_deq_bits_lock = _GEN_21;
  assign io_deq_bits_cache = _GEN_22;
  assign io_deq_bits_prot = _GEN_23;
  assign io_deq_bits_qos = _GEN_24;
  assign io_deq_bits_wen = _GEN_25;
  assign io_count = _T_143[0];
  assign ram_id__T_126_addr = 1'h0;
  assign ram_id__T_126_data = ram_id[ram_id__T_126_addr];
  assign ram_id__T_107_data = io_enq_bits_id;
  assign ram_id__T_107_addr = 1'h0;
  assign ram_id__T_107_mask = do_enq;
  assign ram_id__T_107_en = do_enq;
  assign ram_addr__T_126_addr = 1'h0;
  assign ram_addr__T_126_data = ram_addr[ram_addr__T_126_addr];
  assign ram_addr__T_107_data = io_enq_bits_addr;
  assign ram_addr__T_107_addr = 1'h0;
  assign ram_addr__T_107_mask = do_enq;
  assign ram_addr__T_107_en = do_enq;
  assign ram_len__T_126_addr = 1'h0;
  assign ram_len__T_126_data = ram_len[ram_len__T_126_addr];
  assign ram_len__T_107_data = io_enq_bits_len;
  assign ram_len__T_107_addr = 1'h0;
  assign ram_len__T_107_mask = do_enq;
  assign ram_len__T_107_en = do_enq;
  assign ram_size__T_126_addr = 1'h0;
  assign ram_size__T_126_data = ram_size[ram_size__T_126_addr];
  assign ram_size__T_107_data = io_enq_bits_size;
  assign ram_size__T_107_addr = 1'h0;
  assign ram_size__T_107_mask = do_enq;
  assign ram_size__T_107_en = do_enq;
  assign ram_burst__T_126_addr = 1'h0;
  assign ram_burst__T_126_data = ram_burst[ram_burst__T_126_addr];
  assign ram_burst__T_107_data = io_enq_bits_burst;
  assign ram_burst__T_107_addr = 1'h0;
  assign ram_burst__T_107_mask = do_enq;
  assign ram_burst__T_107_en = do_enq;
  assign ram_lock__T_126_addr = 1'h0;
  assign ram_lock__T_126_data = ram_lock[ram_lock__T_126_addr];
  assign ram_lock__T_107_data = io_enq_bits_lock;
  assign ram_lock__T_107_addr = 1'h0;
  assign ram_lock__T_107_mask = do_enq;
  assign ram_lock__T_107_en = do_enq;
  assign ram_cache__T_126_addr = 1'h0;
  assign ram_cache__T_126_data = ram_cache[ram_cache__T_126_addr];
  assign ram_cache__T_107_data = io_enq_bits_cache;
  assign ram_cache__T_107_addr = 1'h0;
  assign ram_cache__T_107_mask = do_enq;
  assign ram_cache__T_107_en = do_enq;
  assign ram_prot__T_126_addr = 1'h0;
  assign ram_prot__T_126_data = ram_prot[ram_prot__T_126_addr];
  assign ram_prot__T_107_data = io_enq_bits_prot;
  assign ram_prot__T_107_addr = 1'h0;
  assign ram_prot__T_107_mask = do_enq;
  assign ram_prot__T_107_en = do_enq;
  assign ram_qos__T_126_addr = 1'h0;
  assign ram_qos__T_126_data = ram_qos[ram_qos__T_126_addr];
  assign ram_qos__T_107_data = io_enq_bits_qos;
  assign ram_qos__T_107_addr = 1'h0;
  assign ram_qos__T_107_mask = do_enq;
  assign ram_qos__T_107_en = do_enq;
  assign ram_wen__T_126_addr = 1'h0;
  assign ram_wen__T_126_data = ram_wen[ram_wen__T_126_addr];
  assign ram_wen__T_107_data = io_enq_bits_wen;
  assign ram_wen__T_107_addr = 1'h0;
  assign ram_wen__T_107_mask = do_enq;
  assign ram_wen__T_107_en = do_enq;
  assign _T_101 = maybe_full == 1'h0;
  assign _T_104 = io_enq_ready & io_enq_valid;
  assign do_enq = _GEN_27;
  assign _T_105 = io_deq_ready & io_deq_valid;
  assign do_deq = _GEN_26;
  assign _T_120 = do_enq != do_deq;
  assign _GEN_13 = _T_120 ? do_enq : maybe_full;
  assign _T_122 = _T_101 == 1'h0;
  assign _GEN_14 = io_enq_valid ? 1'h1 : _T_122;
  assign _GEN_15 = io_deq_ready ? 1'h0 : _T_104;
  assign _GEN_16 = _T_101 ? io_enq_bits_id : ram_id__T_126_data;
  assign _GEN_17 = _T_101 ? io_enq_bits_addr : ram_addr__T_126_data;
  assign _GEN_18 = _T_101 ? io_enq_bits_len : ram_len__T_126_data;
  assign _GEN_19 = _T_101 ? io_enq_bits_size : ram_size__T_126_data;
  assign _GEN_20 = _T_101 ? io_enq_bits_burst : ram_burst__T_126_data;
  assign _GEN_21 = _T_101 ? io_enq_bits_lock : ram_lock__T_126_data;
  assign _GEN_22 = _T_101 ? io_enq_bits_cache : ram_cache__T_126_data;
  assign _GEN_23 = _T_101 ? io_enq_bits_prot : ram_prot__T_126_data;
  assign _GEN_24 = _T_101 ? io_enq_bits_qos : ram_qos__T_126_data;
  assign _GEN_25 = _T_101 ? io_enq_bits_wen : ram_wen__T_126_data;
  assign _GEN_26 = _T_101 ? 1'h0 : _T_105;
  assign _GEN_27 = _T_101 ? _GEN_15 : _T_104;
  assign _T_140 = 1'h0 - 1'h0;
  assign _T_141 = _T_140[0:0];
  assign _T_143 = {maybe_full,_T_141};
`ifdef RANDOMIZE
  integer initvar;
  initial begin
    `ifndef verilator
      #0.002 begin end
    `endif
  _GEN_0 = {1{$random}};
  `ifdef RANDOMIZE_MEM_INIT
  for (initvar = 0; initvar < 1; initvar = initvar+1)
    ram_id[initvar] = _GEN_0[3:0];
  `endif
  _GEN_1 = {1{$random}};
  `ifdef RANDOMIZE_MEM_INIT
  for (initvar = 0; initvar < 1; initvar = initvar+1)
    ram_addr[initvar] = _GEN_1[31:0];
  `endif
  _GEN_2 = {1{$random}};
  `ifdef RANDOMIZE_MEM_INIT
  for (initvar = 0; initvar < 1; initvar = initvar+1)
    ram_len[initvar] = _GEN_2[7:0];
  `endif
  _GEN_3 = {1{$random}};
  `ifdef RANDOMIZE_MEM_INIT
  for (initvar = 0; initvar < 1; initvar = initvar+1)
    ram_size[initvar] = _GEN_3[2:0];
  `endif
  _GEN_4 = {1{$random}};
  `ifdef RANDOMIZE_MEM_INIT
  for (initvar = 0; initvar < 1; initvar = initvar+1)
    ram_burst[initvar] = _GEN_4[1:0];
  `endif
  _GEN_5 = {1{$random}};
  `ifdef RANDOMIZE_MEM_INIT
  for (initvar = 0; initvar < 1; initvar = initvar+1)
    ram_lock[initvar] = _GEN_5[0:0];
  `endif
  _GEN_6 = {1{$random}};
  `ifdef RANDOMIZE_MEM_INIT
  for (initvar = 0; initvar < 1; initvar = initvar+1)
    ram_cache[initvar] = _GEN_6[3:0];
  `endif
  _GEN_7 = {1{$random}};
  `ifdef RANDOMIZE_MEM_INIT
  for (initvar = 0; initvar < 1; initvar = initvar+1)
    ram_prot[initvar] = _GEN_7[2:0];
  `endif
  _GEN_8 = {1{$random}};
  `ifdef RANDOMIZE_MEM_INIT
  for (initvar = 0; initvar < 1; initvar = initvar+1)
    ram_qos[initvar] = _GEN_8[3:0];
  `endif
  _GEN_9 = {1{$random}};
  `ifdef RANDOMIZE_MEM_INIT
  for (initvar = 0; initvar < 1; initvar = initvar+1)
    ram_wen[initvar] = _GEN_9[0:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_10 = {1{$random}};
  maybe_full = _GEN_10[0:0];
  `endif
  end
`endif
  always @(posedge clock) begin
    if(ram_id__T_107_en & ram_id__T_107_mask) begin
      ram_id[ram_id__T_107_addr] <= ram_id__T_107_data;
    end
    if(ram_addr__T_107_en & ram_addr__T_107_mask) begin
      ram_addr[ram_addr__T_107_addr] <= ram_addr__T_107_data;
    end
    if(ram_len__T_107_en & ram_len__T_107_mask) begin
      ram_len[ram_len__T_107_addr] <= ram_len__T_107_data;
    end
    if(ram_size__T_107_en & ram_size__T_107_mask) begin
      ram_size[ram_size__T_107_addr] <= ram_size__T_107_data;
    end
    if(ram_burst__T_107_en & ram_burst__T_107_mask) begin
      ram_burst[ram_burst__T_107_addr] <= ram_burst__T_107_data;
    end
    if(ram_lock__T_107_en & ram_lock__T_107_mask) begin
      ram_lock[ram_lock__T_107_addr] <= ram_lock__T_107_data;
    end
    if(ram_cache__T_107_en & ram_cache__T_107_mask) begin
      ram_cache[ram_cache__T_107_addr] <= ram_cache__T_107_data;
    end
    if(ram_prot__T_107_en & ram_prot__T_107_mask) begin
      ram_prot[ram_prot__T_107_addr] <= ram_prot__T_107_data;
    end
    if(ram_qos__T_107_en & ram_qos__T_107_mask) begin
      ram_qos[ram_qos__T_107_addr] <= ram_qos__T_107_data;
    end
    if(ram_wen__T_107_en & ram_wen__T_107_mask) begin
      ram_wen[ram_wen__T_107_addr] <= ram_wen__T_107_data;
    end
    if (reset) begin
      maybe_full <= 1'h0;
    end else begin
      if (_T_120) begin
        maybe_full <= do_enq;
      end
    end
  end
endmodule