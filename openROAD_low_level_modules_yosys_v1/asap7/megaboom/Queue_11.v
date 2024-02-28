module Queue_11(
  input   clock,
  input   reset,
  output  io_enq_ready,
  input   io_enq_valid,
  input  [3:0] io_enq_bits_id,
  input  [63:0] io_enq_bits_data,
  input  [1:0] io_enq_bits_resp,
  input   io_enq_bits_last,
  input   io_deq_ready,
  output  io_deq_valid,
  output [3:0] io_deq_bits_id,
  output [63:0] io_deq_bits_data,
  output [1:0] io_deq_bits_resp,
  output  io_deq_bits_last,
  output [1:0] io_count
);
  reg [3:0] ram_id [0:1];
  reg [31:0] _GEN_0;
  wire [3:0] ram_id__T_86_data;
  wire  ram_id__T_86_addr;
  wire [3:0] ram_id__T_66_data;
  wire  ram_id__T_66_addr;
  wire  ram_id__T_66_mask;
  wire  ram_id__T_66_en;
  reg [63:0] ram_data [0:1];
  reg [63:0] _GEN_1;
  wire [63:0] ram_data__T_86_data;
  wire  ram_data__T_86_addr;
  wire [63:0] ram_data__T_66_data;
  wire  ram_data__T_66_addr;
  wire  ram_data__T_66_mask;
  wire  ram_data__T_66_en;
  reg [1:0] ram_resp [0:1];
  reg [31:0] _GEN_2;
  wire [1:0] ram_resp__T_86_data;
  wire  ram_resp__T_86_addr;
  wire [1:0] ram_resp__T_66_data;
  wire  ram_resp__T_66_addr;
  wire  ram_resp__T_66_mask;
  wire  ram_resp__T_66_en;
  reg  ram_last [0:1];
  reg [31:0] _GEN_3;
  wire  ram_last__T_86_data;
  wire  ram_last__T_86_addr;
  wire  ram_last__T_66_data;
  wire  ram_last__T_66_addr;
  wire  ram_last__T_66_mask;
  wire  ram_last__T_66_en;
  reg  _T_55;
  reg [31:0] _GEN_4;
  reg  _T_57;
  reg [31:0] _GEN_5;
  reg  maybe_full;
  reg [31:0] _GEN_6;
  wire  _T_59;
  wire  _T_61;
  wire  _T_62;
  wire  _T_63;
  wire  _T_64;
  wire  do_enq;
  wire  _T_65;
  wire  do_deq;
  wire [1:0] _T_74;
  wire  _T_75;
  wire  _GEN_7;
  wire [1:0] _T_79;
  wire  _T_80;
  wire  _GEN_8;
  wire  _T_81;
  wire  _GEN_9;
  wire  _T_83;
  wire  _T_85;
  wire [1:0] _T_91;
  wire  _T_92;
  wire  _T_93;
  wire [1:0] _T_94;
  assign io_enq_ready = _T_85;
  assign io_deq_valid = _T_83;
  assign io_deq_bits_id = ram_id__T_86_data;
  assign io_deq_bits_data = ram_data__T_86_data;
  assign io_deq_bits_resp = ram_resp__T_86_data;
  assign io_deq_bits_last = ram_last__T_86_data;
  assign io_count = _T_94;
  assign ram_id__T_86_addr = _T_57;
  assign ram_id__T_86_data = ram_id[ram_id__T_86_addr];
  assign ram_id__T_66_data = io_enq_bits_id;
  assign ram_id__T_66_addr = _T_55;
  assign ram_id__T_66_mask = do_enq;
  assign ram_id__T_66_en = do_enq;
  assign ram_data__T_86_addr = _T_57;
  assign ram_data__T_86_data = ram_data[ram_data__T_86_addr];
  assign ram_data__T_66_data = io_enq_bits_data;
  assign ram_data__T_66_addr = _T_55;
  assign ram_data__T_66_mask = do_enq;
  assign ram_data__T_66_en = do_enq;
  assign ram_resp__T_86_addr = _T_57;
  assign ram_resp__T_86_data = ram_resp[ram_resp__T_86_addr];
  assign ram_resp__T_66_data = io_enq_bits_resp;
  assign ram_resp__T_66_addr = _T_55;
  assign ram_resp__T_66_mask = do_enq;
  assign ram_resp__T_66_en = do_enq;
  assign ram_last__T_86_addr = _T_57;
  assign ram_last__T_86_data = ram_last[ram_last__T_86_addr];
  assign ram_last__T_66_data = io_enq_bits_last;
  assign ram_last__T_66_addr = _T_55;
  assign ram_last__T_66_mask = do_enq;
  assign ram_last__T_66_en = do_enq;
  assign _T_59 = _T_55 == _T_57;
  assign _T_61 = maybe_full == 1'h0;
  assign _T_62 = _T_59 & _T_61;
  assign _T_63 = _T_59 & maybe_full;
  assign _T_64 = io_enq_ready & io_enq_valid;
  assign do_enq = _T_64;
  assign _T_65 = io_deq_ready & io_deq_valid;
  assign do_deq = _T_65;
  assign _T_74 = _T_55 + 1'h1;
  assign _T_75 = _T_74[0:0];
  assign _GEN_7 = do_enq ? _T_75 : _T_55;
  assign _T_79 = _T_57 + 1'h1;
  assign _T_80 = _T_79[0:0];
  assign _GEN_8 = do_deq ? _T_80 : _T_57;
  assign _T_81 = do_enq != do_deq;
  assign _GEN_9 = _T_81 ? do_enq : maybe_full;
  assign _T_83 = _T_62 == 1'h0;
  assign _T_85 = _T_63 == 1'h0;
  assign _T_91 = _T_55 - _T_57;
  assign _T_92 = _T_91[0:0];
  assign _T_93 = maybe_full & _T_59;
  assign _T_94 = {_T_93,_T_92};
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
  _GEN_1 = {2{$random}};
  `ifdef RANDOMIZE_MEM_INIT
  for (initvar = 0; initvar < 2; initvar = initvar+1)
    ram_data[initvar] = _GEN_1[63:0];
  `endif
  _GEN_2 = {1{$random}};
  `ifdef RANDOMIZE_MEM_INIT
  for (initvar = 0; initvar < 2; initvar = initvar+1)
    ram_resp[initvar] = _GEN_2[1:0];
  `endif
  _GEN_3 = {1{$random}};
  `ifdef RANDOMIZE_MEM_INIT
  for (initvar = 0; initvar < 2; initvar = initvar+1)
    ram_last[initvar] = _GEN_3[0:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_4 = {1{$random}};
  _T_55 = _GEN_4[0:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_5 = {1{$random}};
  _T_57 = _GEN_5[0:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_6 = {1{$random}};
  maybe_full = _GEN_6[0:0];
  `endif
  end
`endif
  always @(posedge clock) begin
    if(ram_id__T_66_en & ram_id__T_66_mask) begin
      ram_id[ram_id__T_66_addr] <= ram_id__T_66_data;
    end
    if(ram_data__T_66_en & ram_data__T_66_mask) begin
      ram_data[ram_data__T_66_addr] <= ram_data__T_66_data;
    end
    if(ram_resp__T_66_en & ram_resp__T_66_mask) begin
      ram_resp[ram_resp__T_66_addr] <= ram_resp__T_66_data;
    end
    if(ram_last__T_66_en & ram_last__T_66_mask) begin
      ram_last[ram_last__T_66_addr] <= ram_last__T_66_data;
    end
    if (reset) begin
      _T_55 <= 1'h0;
    end else begin
      if (do_enq) begin
        _T_55 <= _T_75;
      end
    end
    if (reset) begin
      _T_57 <= 1'h0;
    end else begin
      if (do_deq) begin
        _T_57 <= _T_80;
      end
    end
    if (reset) begin
      maybe_full <= 1'h0;
    end else begin
      if (_T_81) begin
        maybe_full <= do_enq;
      end
    end
  end
endmodule