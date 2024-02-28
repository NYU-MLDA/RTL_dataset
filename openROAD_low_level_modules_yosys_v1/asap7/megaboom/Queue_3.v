module Queue_3(
  input   clock,
  input   reset,
  output  io_enq_ready,
  input   io_enq_valid,
  input  [2:0] io_enq_bits_opcode,
  input  [1:0] io_enq_bits_param,
  input  [2:0] io_enq_bits_size,
  input  [3:0] io_enq_bits_source,
  input   io_enq_bits_sink,
  input  [1:0] io_enq_bits_addr_lo,
  input  [31:0] io_enq_bits_data,
  input   io_enq_bits_error,
  input   io_deq_ready,
  output  io_deq_valid,
  output [2:0] io_deq_bits_opcode,
  output [1:0] io_deq_bits_param,
  output [2:0] io_deq_bits_size,
  output [3:0] io_deq_bits_source,
  output  io_deq_bits_sink,
  output [1:0] io_deq_bits_addr_lo,
  output [31:0] io_deq_bits_data,
  output  io_deq_bits_error,
  output [1:0] io_count
);
  reg [2:0] ram_opcode [0:1];
  reg [31:0] _GEN_0;
  wire [2:0] ram_opcode__T_118_data;
  wire  ram_opcode__T_118_addr;
  wire [2:0] ram_opcode__T_94_data;
  wire  ram_opcode__T_94_addr;
  wire  ram_opcode__T_94_mask;
  wire  ram_opcode__T_94_en;
  reg [1:0] ram_param [0:1];
  reg [31:0] _GEN_1;
  wire [1:0] ram_param__T_118_data;
  wire  ram_param__T_118_addr;
  wire [1:0] ram_param__T_94_data;
  wire  ram_param__T_94_addr;
  wire  ram_param__T_94_mask;
  wire  ram_param__T_94_en;
  reg [2:0] ram_size [0:1];
  reg [31:0] _GEN_2;
  wire [2:0] ram_size__T_118_data;
  wire  ram_size__T_118_addr;
  wire [2:0] ram_size__T_94_data;
  wire  ram_size__T_94_addr;
  wire  ram_size__T_94_mask;
  wire  ram_size__T_94_en;
  reg [3:0] ram_source [0:1];
  reg [31:0] _GEN_3;
  wire [3:0] ram_source__T_118_data;
  wire  ram_source__T_118_addr;
  wire [3:0] ram_source__T_94_data;
  wire  ram_source__T_94_addr;
  wire  ram_source__T_94_mask;
  wire  ram_source__T_94_en;
  reg  ram_sink [0:1];
  reg [31:0] _GEN_4;
  wire  ram_sink__T_118_data;
  wire  ram_sink__T_118_addr;
  wire  ram_sink__T_94_data;
  wire  ram_sink__T_94_addr;
  wire  ram_sink__T_94_mask;
  wire  ram_sink__T_94_en;
  reg [1:0] ram_addr_lo [0:1];
  reg [31:0] _GEN_5;
  wire [1:0] ram_addr_lo__T_118_data;
  wire  ram_addr_lo__T_118_addr;
  wire [1:0] ram_addr_lo__T_94_data;
  wire  ram_addr_lo__T_94_addr;
  wire  ram_addr_lo__T_94_mask;
  wire  ram_addr_lo__T_94_en;
  reg [31:0] ram_data [0:1];
  reg [31:0] _GEN_6;
  wire [31:0] ram_data__T_118_data;
  wire  ram_data__T_118_addr;
  wire [31:0] ram_data__T_94_data;
  wire  ram_data__T_94_addr;
  wire  ram_data__T_94_mask;
  wire  ram_data__T_94_en;
  reg  ram_error [0:1];
  reg [31:0] _GEN_7;
  wire  ram_error__T_118_data;
  wire  ram_error__T_118_addr;
  wire  ram_error__T_94_data;
  wire  ram_error__T_94_addr;
  wire  ram_error__T_94_mask;
  wire  ram_error__T_94_en;
  reg  _T_83;
  reg [31:0] _GEN_8;
  reg  _T_85;
  reg [31:0] _GEN_9;
  reg  maybe_full;
  reg [31:0] _GEN_10;
  wire  _T_87;
  wire  _T_89;
  wire  _T_90;
  wire  _T_91;
  wire  _T_92;
  wire  do_enq;
  wire  _T_93;
  wire  do_deq;
  wire [1:0] _T_106;
  wire  _T_107;
  wire  _GEN_11;
  wire [1:0] _T_111;
  wire  _T_112;
  wire  _GEN_12;
  wire  _T_113;
  wire  _GEN_13;
  wire  _T_115;
  wire  _T_117;
  wire [1:0] _T_127;
  wire  _T_128;
  wire  _T_129;
  wire [1:0] _T_130;
  assign io_enq_ready = _T_117;
  assign io_deq_valid = _T_115;
  assign io_deq_bits_opcode = ram_opcode__T_118_data;
  assign io_deq_bits_param = ram_param__T_118_data;
  assign io_deq_bits_size = ram_size__T_118_data;
  assign io_deq_bits_source = ram_source__T_118_data;
  assign io_deq_bits_sink = ram_sink__T_118_data;
  assign io_deq_bits_addr_lo = ram_addr_lo__T_118_data;
  assign io_deq_bits_data = ram_data__T_118_data;
  assign io_deq_bits_error = ram_error__T_118_data;
  assign io_count = _T_130;
  assign ram_opcode__T_118_addr = _T_85;
  assign ram_opcode__T_118_data = ram_opcode[ram_opcode__T_118_addr];
  assign ram_opcode__T_94_data = io_enq_bits_opcode;
  assign ram_opcode__T_94_addr = _T_83;
  assign ram_opcode__T_94_mask = do_enq;
  assign ram_opcode__T_94_en = do_enq;
  assign ram_param__T_118_addr = _T_85;
  assign ram_param__T_118_data = ram_param[ram_param__T_118_addr];
  assign ram_param__T_94_data = io_enq_bits_param;
  assign ram_param__T_94_addr = _T_83;
  assign ram_param__T_94_mask = do_enq;
  assign ram_param__T_94_en = do_enq;
  assign ram_size__T_118_addr = _T_85;
  assign ram_size__T_118_data = ram_size[ram_size__T_118_addr];
  assign ram_size__T_94_data = io_enq_bits_size;
  assign ram_size__T_94_addr = _T_83;
  assign ram_size__T_94_mask = do_enq;
  assign ram_size__T_94_en = do_enq;
  assign ram_source__T_118_addr = _T_85;
  assign ram_source__T_118_data = ram_source[ram_source__T_118_addr];
  assign ram_source__T_94_data = io_enq_bits_source;
  assign ram_source__T_94_addr = _T_83;
  assign ram_source__T_94_mask = do_enq;
  assign ram_source__T_94_en = do_enq;
  assign ram_sink__T_118_addr = _T_85;
  assign ram_sink__T_118_data = ram_sink[ram_sink__T_118_addr];
  assign ram_sink__T_94_data = io_enq_bits_sink;
  assign ram_sink__T_94_addr = _T_83;
  assign ram_sink__T_94_mask = do_enq;
  assign ram_sink__T_94_en = do_enq;
  assign ram_addr_lo__T_118_addr = _T_85;
  assign ram_addr_lo__T_118_data = ram_addr_lo[ram_addr_lo__T_118_addr];
  assign ram_addr_lo__T_94_data = io_enq_bits_addr_lo;
  assign ram_addr_lo__T_94_addr = _T_83;
  assign ram_addr_lo__T_94_mask = do_enq;
  assign ram_addr_lo__T_94_en = do_enq;
  assign ram_data__T_118_addr = _T_85;
  assign ram_data__T_118_data = ram_data[ram_data__T_118_addr];
  assign ram_data__T_94_data = io_enq_bits_data;
  assign ram_data__T_94_addr = _T_83;
  assign ram_data__T_94_mask = do_enq;
  assign ram_data__T_94_en = do_enq;
  assign ram_error__T_118_addr = _T_85;
  assign ram_error__T_118_data = ram_error[ram_error__T_118_addr];
  assign ram_error__T_94_data = io_enq_bits_error;
  assign ram_error__T_94_addr = _T_83;
  assign ram_error__T_94_mask = do_enq;
  assign ram_error__T_94_en = do_enq;
  assign _T_87 = _T_83 == _T_85;
  assign _T_89 = maybe_full == 1'h0;
  assign _T_90 = _T_87 & _T_89;
  assign _T_91 = _T_87 & maybe_full;
  assign _T_92 = io_enq_ready & io_enq_valid;
  assign do_enq = _T_92;
  assign _T_93 = io_deq_ready & io_deq_valid;
  assign do_deq = _T_93;
  assign _T_106 = _T_83 + 1'h1;
  assign _T_107 = _T_106[0:0];
  assign _GEN_11 = do_enq ? _T_107 : _T_83;
  assign _T_111 = _T_85 + 1'h1;
  assign _T_112 = _T_111[0:0];
  assign _GEN_12 = do_deq ? _T_112 : _T_85;
  assign _T_113 = do_enq != do_deq;
  assign _GEN_13 = _T_113 ? do_enq : maybe_full;
  assign _T_115 = _T_90 == 1'h0;
  assign _T_117 = _T_91 == 1'h0;
  assign _T_127 = _T_83 - _T_85;
  assign _T_128 = _T_127[0:0];
  assign _T_129 = maybe_full & _T_87;
  assign _T_130 = {_T_129,_T_128};
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
    ram_param[initvar] = _GEN_1[1:0];
  `endif
  _GEN_2 = {1{$random}};
  `ifdef RANDOMIZE_MEM_INIT
  for (initvar = 0; initvar < 2; initvar = initvar+1)
    ram_size[initvar] = _GEN_2[2:0];
  `endif
  _GEN_3 = {1{$random}};
  `ifdef RANDOMIZE_MEM_INIT
  for (initvar = 0; initvar < 2; initvar = initvar+1)
    ram_source[initvar] = _GEN_3[3:0];
  `endif
  _GEN_4 = {1{$random}};
  `ifdef RANDOMIZE_MEM_INIT
  for (initvar = 0; initvar < 2; initvar = initvar+1)
    ram_sink[initvar] = _GEN_4[0:0];
  `endif
  _GEN_5 = {1{$random}};
  `ifdef RANDOMIZE_MEM_INIT
  for (initvar = 0; initvar < 2; initvar = initvar+1)
    ram_addr_lo[initvar] = _GEN_5[1:0];
  `endif
  _GEN_6 = {1{$random}};
  `ifdef RANDOMIZE_MEM_INIT
  for (initvar = 0; initvar < 2; initvar = initvar+1)
    ram_data[initvar] = _GEN_6[31:0];
  `endif
  _GEN_7 = {1{$random}};
  `ifdef RANDOMIZE_MEM_INIT
  for (initvar = 0; initvar < 2; initvar = initvar+1)
    ram_error[initvar] = _GEN_7[0:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_8 = {1{$random}};
  _T_83 = _GEN_8[0:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_9 = {1{$random}};
  _T_85 = _GEN_9[0:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_10 = {1{$random}};
  maybe_full = _GEN_10[0:0];
  `endif
  end
`endif
  always @(posedge clock) begin
    if(ram_opcode__T_94_en & ram_opcode__T_94_mask) begin
      ram_opcode[ram_opcode__T_94_addr] <= ram_opcode__T_94_data;
    end
    if(ram_param__T_94_en & ram_param__T_94_mask) begin
      ram_param[ram_param__T_94_addr] <= ram_param__T_94_data;
    end
    if(ram_size__T_94_en & ram_size__T_94_mask) begin
      ram_size[ram_size__T_94_addr] <= ram_size__T_94_data;
    end
    if(ram_source__T_94_en & ram_source__T_94_mask) begin
      ram_source[ram_source__T_94_addr] <= ram_source__T_94_data;
    end
    if(ram_sink__T_94_en & ram_sink__T_94_mask) begin
      ram_sink[ram_sink__T_94_addr] <= ram_sink__T_94_data;
    end
    if(ram_addr_lo__T_94_en & ram_addr_lo__T_94_mask) begin
      ram_addr_lo[ram_addr_lo__T_94_addr] <= ram_addr_lo__T_94_data;
    end
    if(ram_data__T_94_en & ram_data__T_94_mask) begin
      ram_data[ram_data__T_94_addr] <= ram_data__T_94_data;
    end
    if(ram_error__T_94_en & ram_error__T_94_mask) begin
      ram_error[ram_error__T_94_addr] <= ram_error__T_94_data;
    end
    if (reset) begin
      _T_83 <= 1'h0;
    end else begin
      if (do_enq) begin
        _T_83 <= _T_107;
      end
    end
    if (reset) begin
      _T_85 <= 1'h0;
    end else begin
      if (do_deq) begin
        _T_85 <= _T_112;
      end
    end
    if (reset) begin
      maybe_full <= 1'h0;
    end else begin
      if (_T_113) begin
        maybe_full <= do_enq;
      end
    end
  end
endmodule