module Queue_35(
  input   clock,
  input   reset,
  output  io_enq_ready,
  input   io_enq_valid,
  input  [39:0] io_enq_bits_addr,
  input  [6:0] io_enq_bits_tag,
  input  [4:0] io_enq_bits_cmd,
  input  [2:0] io_enq_bits_typ,
  input   io_enq_bits_phys,
  input  [4:0] io_enq_bits_sdq_id,
  input   io_deq_ready,
  output  io_deq_valid,
  output [39:0] io_deq_bits_addr,
  output [6:0] io_deq_bits_tag,
  output [4:0] io_deq_bits_cmd,
  output [2:0] io_deq_bits_typ,
  output  io_deq_bits_phys,
  output [4:0] io_deq_bits_sdq_id,
  output [4:0] io_count
);
  reg [39:0] ram_addr [0:15];
  reg [63:0] _GEN_0;
  wire [39:0] ram_addr__T_102_data;
  wire [3:0] ram_addr__T_102_addr;
  wire [39:0] ram_addr__T_80_data;
  wire [3:0] ram_addr__T_80_addr;
  wire  ram_addr__T_80_mask;
  wire  ram_addr__T_80_en;
  reg [6:0] ram_tag [0:15];
  reg [31:0] _GEN_1;
  wire [6:0] ram_tag__T_102_data;
  wire [3:0] ram_tag__T_102_addr;
  wire [6:0] ram_tag__T_80_data;
  wire [3:0] ram_tag__T_80_addr;
  wire  ram_tag__T_80_mask;
  wire  ram_tag__T_80_en;
  reg [4:0] ram_cmd [0:15];
  reg [31:0] _GEN_2;
  wire [4:0] ram_cmd__T_102_data;
  wire [3:0] ram_cmd__T_102_addr;
  wire [4:0] ram_cmd__T_80_data;
  wire [3:0] ram_cmd__T_80_addr;
  wire  ram_cmd__T_80_mask;
  wire  ram_cmd__T_80_en;
  reg [2:0] ram_typ [0:15];
  reg [31:0] _GEN_3;
  wire [2:0] ram_typ__T_102_data;
  wire [3:0] ram_typ__T_102_addr;
  wire [2:0] ram_typ__T_80_data;
  wire [3:0] ram_typ__T_80_addr;
  wire  ram_typ__T_80_mask;
  wire  ram_typ__T_80_en;
  reg  ram_phys [0:15];
  reg [31:0] _GEN_4;
  wire  ram_phys__T_102_data;
  wire [3:0] ram_phys__T_102_addr;
  wire  ram_phys__T_80_data;
  wire [3:0] ram_phys__T_80_addr;
  wire  ram_phys__T_80_mask;
  wire  ram_phys__T_80_en;
  reg [4:0] ram_sdq_id [0:15];
  reg [31:0] _GEN_5;
  wire [4:0] ram_sdq_id__T_102_data;
  wire [3:0] ram_sdq_id__T_102_addr;
  wire [4:0] ram_sdq_id__T_80_data;
  wire [3:0] ram_sdq_id__T_80_addr;
  wire  ram_sdq_id__T_80_mask;
  wire  ram_sdq_id__T_80_en;
  reg [3:0] _T_69;
  reg [31:0] _GEN_6;
  reg [3:0] _T_71;
  reg [31:0] _GEN_7;
  reg  maybe_full;
  reg [31:0] _GEN_8;
  wire  _T_73;
  wire  _T_75;
  wire  _T_76;
  wire  _T_77;
  wire  _T_78;
  wire  do_enq;
  wire  _T_79;
  wire  do_deq;
  wire [4:0] _T_90;
  wire [3:0] _T_91;
  wire [3:0] _GEN_9;
  wire [4:0] _T_95;
  wire [3:0] _T_96;
  wire [3:0] _GEN_10;
  wire  _T_97;
  wire  _GEN_11;
  wire  _T_99;
  wire  _T_101;
  wire [4:0] _T_109;
  wire [3:0] _T_110;
  wire  _T_111;
  wire [4:0] _T_112;
  assign io_enq_ready = _T_101;
  assign io_deq_valid = _T_99;
  assign io_deq_bits_addr = ram_addr__T_102_data;
  assign io_deq_bits_tag = ram_tag__T_102_data;
  assign io_deq_bits_cmd = ram_cmd__T_102_data;
  assign io_deq_bits_typ = ram_typ__T_102_data;
  assign io_deq_bits_phys = ram_phys__T_102_data;
  assign io_deq_bits_sdq_id = ram_sdq_id__T_102_data;
  assign io_count = _T_112;
  assign ram_addr__T_102_addr = _T_71;
  assign ram_addr__T_102_data = ram_addr[ram_addr__T_102_addr];
  assign ram_addr__T_80_data = io_enq_bits_addr;
  assign ram_addr__T_80_addr = _T_69;
  assign ram_addr__T_80_mask = do_enq;
  assign ram_addr__T_80_en = do_enq;
  assign ram_tag__T_102_addr = _T_71;
  assign ram_tag__T_102_data = ram_tag[ram_tag__T_102_addr];
  assign ram_tag__T_80_data = io_enq_bits_tag;
  assign ram_tag__T_80_addr = _T_69;
  assign ram_tag__T_80_mask = do_enq;
  assign ram_tag__T_80_en = do_enq;
  assign ram_cmd__T_102_addr = _T_71;
  assign ram_cmd__T_102_data = ram_cmd[ram_cmd__T_102_addr];
  assign ram_cmd__T_80_data = io_enq_bits_cmd;
  assign ram_cmd__T_80_addr = _T_69;
  assign ram_cmd__T_80_mask = do_enq;
  assign ram_cmd__T_80_en = do_enq;
  assign ram_typ__T_102_addr = _T_71;
  assign ram_typ__T_102_data = ram_typ[ram_typ__T_102_addr];
  assign ram_typ__T_80_data = io_enq_bits_typ;
  assign ram_typ__T_80_addr = _T_69;
  assign ram_typ__T_80_mask = do_enq;
  assign ram_typ__T_80_en = do_enq;
  assign ram_phys__T_102_addr = _T_71;
  assign ram_phys__T_102_data = ram_phys[ram_phys__T_102_addr];
  assign ram_phys__T_80_data = io_enq_bits_phys;
  assign ram_phys__T_80_addr = _T_69;
  assign ram_phys__T_80_mask = do_enq;
  assign ram_phys__T_80_en = do_enq;
  assign ram_sdq_id__T_102_addr = _T_71;
  assign ram_sdq_id__T_102_data = ram_sdq_id[ram_sdq_id__T_102_addr];
  assign ram_sdq_id__T_80_data = io_enq_bits_sdq_id;
  assign ram_sdq_id__T_80_addr = _T_69;
  assign ram_sdq_id__T_80_mask = do_enq;
  assign ram_sdq_id__T_80_en = do_enq;
  assign _T_73 = _T_69 == _T_71;
  assign _T_75 = maybe_full == 1'h0;
  assign _T_76 = _T_73 & _T_75;
  assign _T_77 = _T_73 & maybe_full;
  assign _T_78 = io_enq_ready & io_enq_valid;
  assign do_enq = _T_78;
  assign _T_79 = io_deq_ready & io_deq_valid;
  assign do_deq = _T_79;
  assign _T_90 = _T_69 + 4'h1;
  assign _T_91 = _T_90[3:0];
  assign _GEN_9 = do_enq ? _T_91 : _T_69;
  assign _T_95 = _T_71 + 4'h1;
  assign _T_96 = _T_95[3:0];
  assign _GEN_10 = do_deq ? _T_96 : _T_71;
  assign _T_97 = do_enq != do_deq;
  assign _GEN_11 = _T_97 ? do_enq : maybe_full;
  assign _T_99 = _T_76 == 1'h0;
  assign _T_101 = _T_77 == 1'h0;
  assign _T_109 = _T_69 - _T_71;
  assign _T_110 = _T_109[3:0];
  assign _T_111 = maybe_full & _T_73;
  assign _T_112 = {_T_111,_T_110};
`ifdef RANDOMIZE
  integer initvar;
  initial begin
    `ifndef verilator
      #0.002 begin end
    `endif
  _GEN_0 = {2{$random}};
  `ifdef RANDOMIZE_MEM_INIT
  for (initvar = 0; initvar < 16; initvar = initvar+1)
    ram_addr[initvar] = _GEN_0[39:0];
  `endif
  _GEN_1 = {1{$random}};
  `ifdef RANDOMIZE_MEM_INIT
  for (initvar = 0; initvar < 16; initvar = initvar+1)
    ram_tag[initvar] = _GEN_1[6:0];
  `endif
  _GEN_2 = {1{$random}};
  `ifdef RANDOMIZE_MEM_INIT
  for (initvar = 0; initvar < 16; initvar = initvar+1)
    ram_cmd[initvar] = _GEN_2[4:0];
  `endif
  _GEN_3 = {1{$random}};
  `ifdef RANDOMIZE_MEM_INIT
  for (initvar = 0; initvar < 16; initvar = initvar+1)
    ram_typ[initvar] = _GEN_3[2:0];
  `endif
  _GEN_4 = {1{$random}};
  `ifdef RANDOMIZE_MEM_INIT
  for (initvar = 0; initvar < 16; initvar = initvar+1)
    ram_phys[initvar] = _GEN_4[0:0];
  `endif
  _GEN_5 = {1{$random}};
  `ifdef RANDOMIZE_MEM_INIT
  for (initvar = 0; initvar < 16; initvar = initvar+1)
    ram_sdq_id[initvar] = _GEN_5[4:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_6 = {1{$random}};
  _T_69 = _GEN_6[3:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_7 = {1{$random}};
  _T_71 = _GEN_7[3:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_8 = {1{$random}};
  maybe_full = _GEN_8[0:0];
  `endif
  end
`endif
  always @(posedge clock) begin
    if(ram_addr__T_80_en & ram_addr__T_80_mask) begin
      ram_addr[ram_addr__T_80_addr] <= ram_addr__T_80_data;
    end
    if(ram_tag__T_80_en & ram_tag__T_80_mask) begin
      ram_tag[ram_tag__T_80_addr] <= ram_tag__T_80_data;
    end
    if(ram_cmd__T_80_en & ram_cmd__T_80_mask) begin
      ram_cmd[ram_cmd__T_80_addr] <= ram_cmd__T_80_data;
    end
    if(ram_typ__T_80_en & ram_typ__T_80_mask) begin
      ram_typ[ram_typ__T_80_addr] <= ram_typ__T_80_data;
    end
    if(ram_phys__T_80_en & ram_phys__T_80_mask) begin
      ram_phys[ram_phys__T_80_addr] <= ram_phys__T_80_data;
    end
    if(ram_sdq_id__T_80_en & ram_sdq_id__T_80_mask) begin
      ram_sdq_id[ram_sdq_id__T_80_addr] <= ram_sdq_id__T_80_data;
    end
    if (reset) begin
      _T_69 <= 4'h0;
    end else begin
      if (do_enq) begin
        _T_69 <= _T_91;
      end
    end
    if (reset) begin
      _T_71 <= 4'h0;
    end else begin
      if (do_deq) begin
        _T_71 <= _T_96;
      end
    end
    if (reset) begin
      maybe_full <= 1'h0;
    end else begin
      if (_T_97) begin
        maybe_full <= do_enq;
      end
    end
  end
endmodule