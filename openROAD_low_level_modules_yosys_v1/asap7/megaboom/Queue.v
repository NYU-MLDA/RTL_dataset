module Queue(
  input   clock,
  input   reset,
  output  io_enq_ready,
  input   io_enq_valid,
  input  [2:0] io_enq_bits_opcode,
  input  [2:0] io_enq_bits_param,
  input  [3:0] io_enq_bits_size,
  input  [1:0] io_enq_bits_source,
  input  [31:0] io_enq_bits_address,
  input  [15:0] io_enq_bits_mask,
  input  [127:0] io_enq_bits_data,
  input   io_deq_ready,
  output  io_deq_valid,
  output [2:0] io_deq_bits_opcode,
  output [2:0] io_deq_bits_param,
  output [3:0] io_deq_bits_size,
  output [1:0] io_deq_bits_source,
  output [31:0] io_deq_bits_address,
  output [15:0] io_deq_bits_mask,
  output [127:0] io_deq_bits_data,
  output [1:0] io_count
);
  reg [2:0] ram_opcode [0:1];
  reg [31:0] _GEN_0;
  wire [2:0] ram_opcode__T_110_data;
  wire  ram_opcode__T_110_addr;
  wire [2:0] ram_opcode__T_87_data;
  wire  ram_opcode__T_87_addr;
  wire  ram_opcode__T_87_mask;
  wire  ram_opcode__T_87_en;
  reg [2:0] ram_param [0:1];
  reg [31:0] _GEN_1;
  wire [2:0] ram_param__T_110_data;
  wire  ram_param__T_110_addr;
  wire [2:0] ram_param__T_87_data;
  wire  ram_param__T_87_addr;
  wire  ram_param__T_87_mask;
  wire  ram_param__T_87_en;
  reg [3:0] ram_size [0:1];
  reg [31:0] _GEN_2;
  wire [3:0] ram_size__T_110_data;
  wire  ram_size__T_110_addr;
  wire [3:0] ram_size__T_87_data;
  wire  ram_size__T_87_addr;
  wire  ram_size__T_87_mask;
  wire  ram_size__T_87_en;
  reg [1:0] ram_source [0:1];
  reg [31:0] _GEN_3;
  wire [1:0] ram_source__T_110_data;
  wire  ram_source__T_110_addr;
  wire [1:0] ram_source__T_87_data;
  wire  ram_source__T_87_addr;
  wire  ram_source__T_87_mask;
  wire  ram_source__T_87_en;
  reg [31:0] ram_address [0:1];
  reg [31:0] _GEN_4;
  wire [31:0] ram_address__T_110_data;
  wire  ram_address__T_110_addr;
  wire [31:0] ram_address__T_87_data;
  wire  ram_address__T_87_addr;
  wire  ram_address__T_87_mask;
  wire  ram_address__T_87_en;
  reg [15:0] ram_mask [0:1];
  reg [31:0] _GEN_5;
  wire [15:0] ram_mask__T_110_data;
  wire  ram_mask__T_110_addr;
  wire [15:0] ram_mask__T_87_data;
  wire  ram_mask__T_87_addr;
  wire  ram_mask__T_87_mask;
  wire  ram_mask__T_87_en;
  reg [127:0] ram_data [0:1];
  reg [127:0] _GEN_6;
  wire [127:0] ram_data__T_110_data;
  wire  ram_data__T_110_addr;
  wire [127:0] ram_data__T_87_data;
  wire  ram_data__T_87_addr;
  wire  ram_data__T_87_mask;
  wire  ram_data__T_87_en;
  reg  _T_76;
  reg [31:0] _GEN_7;
  reg  _T_78;
  reg [31:0] _GEN_8;
  reg  maybe_full;
  reg [31:0] _GEN_9;
  wire  _T_80;
  wire  _T_82;
  wire  _T_83;
  wire  _T_84;
  wire  _T_85;
  wire  do_enq;
  wire  _T_86;
  wire  do_deq;
  wire [1:0] _T_98;
  wire  _T_99;
  wire  _GEN_10;
  wire [1:0] _T_103;
  wire  _T_104;
  wire  _GEN_11;
  wire  _T_105;
  wire  _GEN_12;
  wire  _T_107;
  wire  _T_109;
  wire [1:0] _T_118;
  wire  _T_119;
  wire  _T_120;
  wire [1:0] _T_121;
  assign io_enq_ready = _T_109;
  assign io_deq_valid = _T_107;
  assign io_deq_bits_opcode = ram_opcode__T_110_data;
  assign io_deq_bits_param = ram_param__T_110_data;
  assign io_deq_bits_size = ram_size__T_110_data;
  assign io_deq_bits_source = ram_source__T_110_data;
  assign io_deq_bits_address = ram_address__T_110_data;
  assign io_deq_bits_mask = ram_mask__T_110_data;
  assign io_deq_bits_data = ram_data__T_110_data;
  assign io_count = _T_121;
  assign ram_opcode__T_110_addr = _T_78;
  assign ram_opcode__T_110_data = ram_opcode[ram_opcode__T_110_addr];
  assign ram_opcode__T_87_data = io_enq_bits_opcode;
  assign ram_opcode__T_87_addr = _T_76;
  assign ram_opcode__T_87_mask = do_enq;
  assign ram_opcode__T_87_en = do_enq;
  assign ram_param__T_110_addr = _T_78;
  assign ram_param__T_110_data = ram_param[ram_param__T_110_addr];
  assign ram_param__T_87_data = io_enq_bits_param;
  assign ram_param__T_87_addr = _T_76;
  assign ram_param__T_87_mask = do_enq;
  assign ram_param__T_87_en = do_enq;
  assign ram_size__T_110_addr = _T_78;
  assign ram_size__T_110_data = ram_size[ram_size__T_110_addr];
  assign ram_size__T_87_data = io_enq_bits_size;
  assign ram_size__T_87_addr = _T_76;
  assign ram_size__T_87_mask = do_enq;
  assign ram_size__T_87_en = do_enq;
  assign ram_source__T_110_addr = _T_78;
  assign ram_source__T_110_data = ram_source[ram_source__T_110_addr];
  assign ram_source__T_87_data = io_enq_bits_source;
  assign ram_source__T_87_addr = _T_76;
  assign ram_source__T_87_mask = do_enq;
  assign ram_source__T_87_en = do_enq;
  assign ram_address__T_110_addr = _T_78;
  assign ram_address__T_110_data = ram_address[ram_address__T_110_addr];
  assign ram_address__T_87_data = io_enq_bits_address;
  assign ram_address__T_87_addr = _T_76;
  assign ram_address__T_87_mask = do_enq;
  assign ram_address__T_87_en = do_enq;
  assign ram_mask__T_110_addr = _T_78;
  assign ram_mask__T_110_data = ram_mask[ram_mask__T_110_addr];
  assign ram_mask__T_87_data = io_enq_bits_mask;
  assign ram_mask__T_87_addr = _T_76;
  assign ram_mask__T_87_mask = do_enq;
  assign ram_mask__T_87_en = do_enq;
  assign ram_data__T_110_addr = _T_78;
  assign ram_data__T_110_data = ram_data[ram_data__T_110_addr];
  assign ram_data__T_87_data = io_enq_bits_data;
  assign ram_data__T_87_addr = _T_76;
  assign ram_data__T_87_mask = do_enq;
  assign ram_data__T_87_en = do_enq;
  assign _T_80 = _T_76 == _T_78;
  assign _T_82 = maybe_full == 1'h0;
  assign _T_83 = _T_80 & _T_82;
  assign _T_84 = _T_80 & maybe_full;
  assign _T_85 = io_enq_ready & io_enq_valid;
  assign do_enq = _T_85;
  assign _T_86 = io_deq_ready & io_deq_valid;
  assign do_deq = _T_86;
  assign _T_98 = _T_76 + 1'h1;
  assign _T_99 = _T_98[0:0];
  assign _GEN_10 = do_enq ? _T_99 : _T_76;
  assign _T_103 = _T_78 + 1'h1;
  assign _T_104 = _T_103[0:0];
  assign _GEN_11 = do_deq ? _T_104 : _T_78;
  assign _T_105 = do_enq != do_deq;
  assign _GEN_12 = _T_105 ? do_enq : maybe_full;
  assign _T_107 = _T_83 == 1'h0;
  assign _T_109 = _T_84 == 1'h0;
  assign _T_118 = _T_76 - _T_78;
  assign _T_119 = _T_118[0:0];
  assign _T_120 = maybe_full & _T_80;
  assign _T_121 = {_T_120,_T_119};
`ifdef RANDOMIZE
  integer initvar;
  initial begin
    `ifndef verilator
      #0.002 begin end
    `endif
  _GEN_0 = {1{$random}};
  `ifdef RANDOMIZE_MEM_INIT
  for (initvar = 0; initvar < 2; initvar = initvar+1)
    ram_opcode[initvar] = _GEN_0[2:0];
  `endif
  _GEN_1 = {1{$random}};
  `ifdef RANDOMIZE_MEM_INIT
  for (initvar = 0; initvar < 2; initvar = initvar+1)
    ram_param[initvar] = _GEN_1[2:0];
  `endif
  _GEN_2 = {1{$random}};
  `ifdef RANDOMIZE_MEM_INIT
  for (initvar = 0; initvar < 2; initvar = initvar+1)
    ram_size[initvar] = _GEN_2[3:0];
  `endif
  _GEN_3 = {1{$random}};
  `ifdef RANDOMIZE_MEM_INIT
  for (initvar = 0; initvar < 2; initvar = initvar+1)
    ram_source[initvar] = _GEN_3[1:0];
  `endif
  _GEN_4 = {1{$random}};
  `ifdef RANDOMIZE_MEM_INIT
  for (initvar = 0; initvar < 2; initvar = initvar+1)
    ram_address[initvar] = _GEN_4[31:0];
  `endif
  _GEN_5 = {1{$random}};
  `ifdef RANDOMIZE_MEM_INIT
  for (initvar = 0; initvar < 2; initvar = initvar+1)
    ram_mask[initvar] = _GEN_5[15:0];
  `endif
  _GEN_6 = {4{$random}};
  `ifdef RANDOMIZE_MEM_INIT
  for (initvar = 0; initvar < 2; initvar = initvar+1)
    ram_data[initvar] = _GEN_6[127:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_7 = {1{$random}};
  _T_76 = _GEN_7[0:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_8 = {1{$random}};
  _T_78 = _GEN_8[0:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_9 = {1{$random}};
  maybe_full = _GEN_9[0:0];
  `endif
  end
`endif
  always @(posedge clock) begin
    if(ram_opcode__T_87_en & ram_opcode__T_87_mask) begin
      ram_opcode[ram_opcode__T_87_addr] <= ram_opcode__T_87_data;
    end
    if(ram_param__T_87_en & ram_param__T_87_mask) begin
      ram_param[ram_param__T_87_addr] <= ram_param__T_87_data;
    end
    if(ram_size__T_87_en & ram_size__T_87_mask) begin
      ram_size[ram_size__T_87_addr] <= ram_size__T_87_data;
    end
    if(ram_source__T_87_en & ram_source__T_87_mask) begin
      ram_source[ram_source__T_87_addr] <= ram_source__T_87_data;
    end
    if(ram_address__T_87_en & ram_address__T_87_mask) begin
      ram_address[ram_address__T_87_addr] <= ram_address__T_87_data;
    end
    if(ram_mask__T_87_en & ram_mask__T_87_mask) begin
      ram_mask[ram_mask__T_87_addr] <= ram_mask__T_87_data;
    end
    if(ram_data__T_87_en & ram_data__T_87_mask) begin
      ram_data[ram_data__T_87_addr] <= ram_data__T_87_data;
    end
    if (reset) begin
      _T_76 <= 1'h0;
    end else begin
      if (do_enq) begin
        _T_76 <= _T_99;
      end
    end
    if (reset) begin
      _T_78 <= 1'h0;
    end else begin
      if (do_deq) begin
        _T_78 <= _T_104;
      end
    end
    if (reset) begin
      maybe_full <= 1'h0;
    end else begin
      if (_T_105) begin
        maybe_full <= do_enq;
      end
    end
  end
endmodule