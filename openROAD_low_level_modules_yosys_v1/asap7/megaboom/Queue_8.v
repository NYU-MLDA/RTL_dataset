module Queue_8(
  input   clock,
  input   reset,
  output  io_enq_ready,
  input   io_enq_valid,
  input  [63:0] io_enq_bits_data,
  input  [7:0] io_enq_bits_strb,
  input   io_enq_bits_last,
  input   io_deq_ready,
  output  io_deq_valid,
  output [63:0] io_deq_bits_data,
  output [7:0] io_deq_bits_strb,
  output  io_deq_bits_last,
  output [1:0] io_count
);
  reg [63:0] ram_data [0:1];
  reg [63:0] _GEN_0;
  wire [63:0] ram_data__T_78_data;
  wire  ram_data__T_78_addr;
  wire [63:0] ram_data__T_59_data;
  wire  ram_data__T_59_addr;
  wire  ram_data__T_59_mask;
  wire  ram_data__T_59_en;
  reg [7:0] ram_strb [0:1];
  reg [31:0] _GEN_1;
  wire [7:0] ram_strb__T_78_data;
  wire  ram_strb__T_78_addr;
  wire [7:0] ram_strb__T_59_data;
  wire  ram_strb__T_59_addr;
  wire  ram_strb__T_59_mask;
  wire  ram_strb__T_59_en;
  reg  ram_last [0:1];
  reg [31:0] _GEN_2;
  wire  ram_last__T_78_data;
  wire  ram_last__T_78_addr;
  wire  ram_last__T_59_data;
  wire  ram_last__T_59_addr;
  wire  ram_last__T_59_mask;
  wire  ram_last__T_59_en;
  reg  _T_48;
  reg [31:0] _GEN_3;
  reg  _T_50;
  reg [31:0] _GEN_4;
  reg  maybe_full;
  reg [31:0] _GEN_5;
  wire  _T_52;
  wire  _T_54;
  wire  _T_55;
  wire  _T_56;
  wire  _T_57;
  wire  do_enq;
  wire  _T_58;
  wire  do_deq;
  wire [1:0] _T_66;
  wire  _T_67;
  wire  _GEN_6;
  wire [1:0] _T_71;
  wire  _T_72;
  wire  _GEN_7;
  wire  _T_73;
  wire  _GEN_8;
  wire  _T_75;
  wire  _T_77;
  wire [1:0] _T_82;
  wire  _T_83;
  wire  _T_84;
  wire [1:0] _T_85;
  assign io_enq_ready = _T_77;
  assign io_deq_valid = _T_75;
  assign io_deq_bits_data = ram_data__T_78_data;
  assign io_deq_bits_strb = ram_strb__T_78_data;
  assign io_deq_bits_last = ram_last__T_78_data;
  assign io_count = _T_85;
  assign ram_data__T_78_addr = _T_50;
  assign ram_data__T_78_data = ram_data[ram_data__T_78_addr];
  assign ram_data__T_59_data = io_enq_bits_data;
  assign ram_data__T_59_addr = _T_48;
  assign ram_data__T_59_mask = do_enq;
  assign ram_data__T_59_en = do_enq;
  assign ram_strb__T_78_addr = _T_50;
  assign ram_strb__T_78_data = ram_strb[ram_strb__T_78_addr];
  assign ram_strb__T_59_data = io_enq_bits_strb;
  assign ram_strb__T_59_addr = _T_48;
  assign ram_strb__T_59_mask = do_enq;
  assign ram_strb__T_59_en = do_enq;
  assign ram_last__T_78_addr = _T_50;
  assign ram_last__T_78_data = ram_last[ram_last__T_78_addr];
  assign ram_last__T_59_data = io_enq_bits_last;
  assign ram_last__T_59_addr = _T_48;
  assign ram_last__T_59_mask = do_enq;
  assign ram_last__T_59_en = do_enq;
  assign _T_52 = _T_48 == _T_50;
  assign _T_54 = maybe_full == 1'h0;
  assign _T_55 = _T_52 & _T_54;
  assign _T_56 = _T_52 & maybe_full;
  assign _T_57 = io_enq_ready & io_enq_valid;
  assign do_enq = _T_57;
  assign _T_58 = io_deq_ready & io_deq_valid;
  assign do_deq = _T_58;
  assign _T_66 = _T_48 + 1'h1;
  assign _T_67 = _T_66[0:0];
  assign _GEN_6 = do_enq ? _T_67 : _T_48;
  assign _T_71 = _T_50 + 1'h1;
  assign _T_72 = _T_71[0:0];
  assign _GEN_7 = do_deq ? _T_72 : _T_50;
  assign _T_73 = do_enq != do_deq;
  assign _GEN_8 = _T_73 ? do_enq : maybe_full;
  assign _T_75 = _T_55 == 1'h0;
  assign _T_77 = _T_56 == 1'h0;
  assign _T_82 = _T_48 - _T_50;
  assign _T_83 = _T_82[0:0];
  assign _T_84 = maybe_full & _T_52;
  assign _T_85 = {_T_84,_T_83};
`ifdef RANDOMIZE
  integer initvar;
  initial begin
    `ifndef verilator
      #0.002 begin end
    `endif
  _GEN_0 = {2{$random}};
  `ifdef RANDOMIZE_MEM_INIT
  for (initvar = 0; initvar < 2; initvar = initvar+1)
    ram_data[initvar] = _GEN_0[63:0];
  `endif
  _GEN_1 = {1{$random}};
  `ifdef RANDOMIZE_MEM_INIT
  for (initvar = 0; initvar < 2; initvar = initvar+1)
    ram_strb[initvar] = _GEN_1[7:0];
  `endif
  _GEN_2 = {1{$random}};
  `ifdef RANDOMIZE_MEM_INIT
  for (initvar = 0; initvar < 2; initvar = initvar+1)
    ram_last[initvar] = _GEN_2[0:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_3 = {1{$random}};
  _T_48 = _GEN_3[0:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_4 = {1{$random}};
  _T_50 = _GEN_4[0:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_5 = {1{$random}};
  maybe_full = _GEN_5[0:0];
  `endif
  end
`endif
  always @(posedge clock) begin
    if(ram_data__T_59_en & ram_data__T_59_mask) begin
      ram_data[ram_data__T_59_addr] <= ram_data__T_59_data;
    end
    if(ram_strb__T_59_en & ram_strb__T_59_mask) begin
      ram_strb[ram_strb__T_59_addr] <= ram_strb__T_59_data;
    end
    if(ram_last__T_59_en & ram_last__T_59_mask) begin
      ram_last[ram_last__T_59_addr] <= ram_last__T_59_data;
    end
    if (reset) begin
      _T_48 <= 1'h0;
    end else begin
      if (do_enq) begin
        _T_48 <= _T_67;
      end
    end
    if (reset) begin
      _T_50 <= 1'h0;
    end else begin
      if (do_deq) begin
        _T_50 <= _T_72;
      end
    end
    if (reset) begin
      maybe_full <= 1'h0;
    end else begin
      if (_T_73) begin
        maybe_full <= do_enq;
      end
    end
  end
endmodule