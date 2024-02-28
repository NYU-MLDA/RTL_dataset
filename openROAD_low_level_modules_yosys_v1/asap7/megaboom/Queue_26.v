module Queue_26(
  input   clock,
  input   reset,
  output  io_enq_ready,
  input   io_enq_valid,
  input  [7:0] io_enq_bits_id,
  input  [63:0] io_enq_bits_data,
  input  [1:0] io_enq_bits_resp,
  input   io_enq_bits_last,
  input   io_deq_ready,
  output  io_deq_valid,
  output [7:0] io_deq_bits_id,
  output [63:0] io_deq_bits_data,
  output [1:0] io_deq_bits_resp,
  output  io_deq_bits_last,
  output  io_count
);
  reg [7:0] ram_id [0:0];
  reg [31:0] _GEN_0;
  wire [7:0] ram_id__T_78_data;
  wire  ram_id__T_78_addr;
  wire [7:0] ram_id__T_65_data;
  wire  ram_id__T_65_addr;
  wire  ram_id__T_65_mask;
  wire  ram_id__T_65_en;
  reg [63:0] ram_data [0:0];
  reg [63:0] _GEN_1;
  wire [63:0] ram_data__T_78_data;
  wire  ram_data__T_78_addr;
  wire [63:0] ram_data__T_65_data;
  wire  ram_data__T_65_addr;
  wire  ram_data__T_65_mask;
  wire  ram_data__T_65_en;
  reg [1:0] ram_resp [0:0];
  reg [31:0] _GEN_2;
  wire [1:0] ram_resp__T_78_data;
  wire  ram_resp__T_78_addr;
  wire [1:0] ram_resp__T_65_data;
  wire  ram_resp__T_65_addr;
  wire  ram_resp__T_65_mask;
  wire  ram_resp__T_65_en;
  reg  ram_last [0:0];
  reg [31:0] _GEN_3;
  wire  ram_last__T_78_data;
  wire  ram_last__T_78_addr;
  wire  ram_last__T_65_data;
  wire  ram_last__T_65_addr;
  wire  ram_last__T_65_mask;
  wire  ram_last__T_65_en;
  reg  maybe_full;
  reg [31:0] _GEN_4;
  wire  _T_59;
  wire  _T_62;
  wire  do_enq;
  wire  _T_63;
  wire  do_deq;
  wire  _T_72;
  wire  _GEN_7;
  wire  _T_74;
  wire  _GEN_8;
  wire  _GEN_9;
  wire [7:0] _GEN_10;
  wire [63:0] _GEN_11;
  wire [1:0] _GEN_12;
  wire  _GEN_13;
  wire  _GEN_14;
  wire  _GEN_15;
  wire [1:0] _T_86;
  wire  _T_87;
  wire [1:0] _T_89;
  assign io_enq_ready = _T_59;
  assign io_deq_valid = _GEN_8;
  assign io_deq_bits_id = _GEN_10;
  assign io_deq_bits_data = _GEN_11;
  assign io_deq_bits_resp = _GEN_12;
  assign io_deq_bits_last = _GEN_13;
  assign io_count = _T_89[0];
  assign ram_id__T_78_addr = 1'h0;
  assign ram_id__T_78_data = ram_id[ram_id__T_78_addr];
  assign ram_id__T_65_data = io_enq_bits_id;
  assign ram_id__T_65_addr = 1'h0;
  assign ram_id__T_65_mask = do_enq;
  assign ram_id__T_65_en = do_enq;
  assign ram_data__T_78_addr = 1'h0;
  assign ram_data__T_78_data = ram_data[ram_data__T_78_addr];
  assign ram_data__T_65_data = io_enq_bits_data;
  assign ram_data__T_65_addr = 1'h0;
  assign ram_data__T_65_mask = do_enq;
  assign ram_data__T_65_en = do_enq;
  assign ram_resp__T_78_addr = 1'h0;
  assign ram_resp__T_78_data = ram_resp[ram_resp__T_78_addr];
  assign ram_resp__T_65_data = io_enq_bits_resp;
  assign ram_resp__T_65_addr = 1'h0;
  assign ram_resp__T_65_mask = do_enq;
  assign ram_resp__T_65_en = do_enq;
  assign ram_last__T_78_addr = 1'h0;
  assign ram_last__T_78_data = ram_last[ram_last__T_78_addr];
  assign ram_last__T_65_data = io_enq_bits_last;
  assign ram_last__T_65_addr = 1'h0;
  assign ram_last__T_65_mask = do_enq;
  assign ram_last__T_65_en = do_enq;
  assign _T_59 = maybe_full == 1'h0;
  assign _T_62 = io_enq_ready & io_enq_valid;
  assign do_enq = _GEN_15;
  assign _T_63 = io_deq_ready & io_deq_valid;
  assign do_deq = _GEN_14;
  assign _T_72 = do_enq != do_deq;
  assign _GEN_7 = _T_72 ? do_enq : maybe_full;
  assign _T_74 = _T_59 == 1'h0;
  assign _GEN_8 = io_enq_valid ? 1'h1 : _T_74;
  assign _GEN_9 = io_deq_ready ? 1'h0 : _T_62;
  assign _GEN_10 = _T_59 ? io_enq_bits_id : ram_id__T_78_data;
  assign _GEN_11 = _T_59 ? io_enq_bits_data : ram_data__T_78_data;
  assign _GEN_12 = _T_59 ? io_enq_bits_resp : ram_resp__T_78_data;
  assign _GEN_13 = _T_59 ? io_enq_bits_last : ram_last__T_78_data;
  assign _GEN_14 = _T_59 ? 1'h0 : _T_63;
  assign _GEN_15 = _T_59 ? _GEN_9 : _T_62;
  assign _T_86 = 1'h0 - 1'h0;
  assign _T_87 = _T_86[0:0];
  assign _T_89 = {maybe_full,_T_87};
`ifdef RANDOMIZE
  integer initvar;
  initial begin
    `ifndef verilator
      #0.002 begin end
    `endif
  _GEN_0 = {1{$random}};
  `ifdef RANDOMIZE_MEM_INIT
  for (initvar = 0; initvar < 1; initvar = initvar+1)
    ram_id[initvar] = _GEN_0[7:0];
  `endif
  _GEN_1 = {2{$random}};
  `ifdef RANDOMIZE_MEM_INIT
  for (initvar = 0; initvar < 1; initvar = initvar+1)
    ram_data[initvar] = _GEN_1[63:0];
  `endif
  _GEN_2 = {1{$random}};
  `ifdef RANDOMIZE_MEM_INIT
  for (initvar = 0; initvar < 1; initvar = initvar+1)
    ram_resp[initvar] = _GEN_2[1:0];
  `endif
  _GEN_3 = {1{$random}};
  `ifdef RANDOMIZE_MEM_INIT
  for (initvar = 0; initvar < 1; initvar = initvar+1)
    ram_last[initvar] = _GEN_3[0:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_4 = {1{$random}};
  maybe_full = _GEN_4[0:0];
  `endif
  end
`endif
  always @(posedge clock) begin
    if(ram_id__T_65_en & ram_id__T_65_mask) begin
      ram_id[ram_id__T_65_addr] <= ram_id__T_65_data;
    end
    if(ram_data__T_65_en & ram_data__T_65_mask) begin
      ram_data[ram_data__T_65_addr] <= ram_data__T_65_data;
    end
    if(ram_resp__T_65_en & ram_resp__T_65_mask) begin
      ram_resp[ram_resp__T_65_addr] <= ram_resp__T_65_data;
    end
    if(ram_last__T_65_en & ram_last__T_65_mask) begin
      ram_last[ram_last__T_65_addr] <= ram_last__T_65_data;
    end
    if (reset) begin
      maybe_full <= 1'h0;
    end else begin
      if (_T_72) begin
        maybe_full <= do_enq;
      end
    end
  end
endmodule