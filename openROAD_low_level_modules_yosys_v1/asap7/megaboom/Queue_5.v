module Queue_5(
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
  output  io_count
);
  reg [63:0] ram_data [0:0];
  reg [63:0] _GEN_0;
  wire [63:0] ram_data__T_70_data;
  wire  ram_data__T_70_addr;
  wire [63:0] ram_data__T_58_data;
  wire  ram_data__T_58_addr;
  wire  ram_data__T_58_mask;
  wire  ram_data__T_58_en;
  reg [7:0] ram_strb [0:0];
  reg [31:0] _GEN_1;
  wire [7:0] ram_strb__T_70_data;
  wire  ram_strb__T_70_addr;
  wire [7:0] ram_strb__T_58_data;
  wire  ram_strb__T_58_addr;
  wire  ram_strb__T_58_mask;
  wire  ram_strb__T_58_en;
  reg  ram_last [0:0];
  reg [31:0] _GEN_2;
  wire  ram_last__T_70_data;
  wire  ram_last__T_70_addr;
  wire  ram_last__T_58_data;
  wire  ram_last__T_58_addr;
  wire  ram_last__T_58_mask;
  wire  ram_last__T_58_en;
  reg  maybe_full;
  reg [31:0] _GEN_3;
  wire  _T_52;
  wire  _T_55;
  wire  do_enq;
  wire  _T_56;
  wire  do_deq;
  wire  _T_64;
  wire  _GEN_6;
  wire  _T_66;
  wire  _GEN_7;
  wire  _GEN_8;
  wire [63:0] _GEN_9;
  wire [7:0] _GEN_10;
  wire  _GEN_11;
  wire  _GEN_12;
  wire  _GEN_13;
  wire [1:0] _T_77;
  wire  _T_78;
  wire [1:0] _T_80;
  assign io_enq_ready = _T_52;
  assign io_deq_valid = _GEN_7;
  assign io_deq_bits_data = _GEN_9;
  assign io_deq_bits_strb = _GEN_10;
  assign io_deq_bits_last = _GEN_11;
  assign io_count = _T_80[0];
  assign ram_data__T_70_addr = 1'h0;
  assign ram_data__T_70_data = ram_data[ram_data__T_70_addr];
  assign ram_data__T_58_data = io_enq_bits_data;
  assign ram_data__T_58_addr = 1'h0;
  assign ram_data__T_58_mask = do_enq;
  assign ram_data__T_58_en = do_enq;
  assign ram_strb__T_70_addr = 1'h0;
  assign ram_strb__T_70_data = ram_strb[ram_strb__T_70_addr];
  assign ram_strb__T_58_data = io_enq_bits_strb;
  assign ram_strb__T_58_addr = 1'h0;
  assign ram_strb__T_58_mask = do_enq;
  assign ram_strb__T_58_en = do_enq;
  assign ram_last__T_70_addr = 1'h0;
  assign ram_last__T_70_data = ram_last[ram_last__T_70_addr];
  assign ram_last__T_58_data = io_enq_bits_last;
  assign ram_last__T_58_addr = 1'h0;
  assign ram_last__T_58_mask = do_enq;
  assign ram_last__T_58_en = do_enq;
  assign _T_52 = maybe_full == 1'h0;
  assign _T_55 = io_enq_ready & io_enq_valid;
  assign do_enq = _GEN_13;
  assign _T_56 = io_deq_ready & io_deq_valid;
  assign do_deq = _GEN_12;
  assign _T_64 = do_enq != do_deq;
  assign _GEN_6 = _T_64 ? do_enq : maybe_full;
  assign _T_66 = _T_52 == 1'h0;
  assign _GEN_7 = io_enq_valid ? 1'h1 : _T_66;
  assign _GEN_8 = io_deq_ready ? 1'h0 : _T_55;
  assign _GEN_9 = _T_52 ? io_enq_bits_data : ram_data__T_70_data;
  assign _GEN_10 = _T_52 ? io_enq_bits_strb : ram_strb__T_70_data;
  assign _GEN_11 = _T_52 ? io_enq_bits_last : ram_last__T_70_data;
  assign _GEN_12 = _T_52 ? 1'h0 : _T_56;
  assign _GEN_13 = _T_52 ? _GEN_8 : _T_55;
  assign _T_77 = 1'h0 - 1'h0;
  assign _T_78 = _T_77[0:0];
  assign _T_80 = {maybe_full,_T_78};
`ifdef RANDOMIZE
  integer initvar;
  initial begin
    `ifndef verilator
      #0.002 begin end
    `endif
  _GEN_0 = {2{$random}};
  `ifdef RANDOMIZE_MEM_INIT
  for (initvar = 0; initvar < 1; initvar = initvar+1)
    ram_data[initvar] = _GEN_0[63:0];
  `endif
  _GEN_1 = {1{$random}};
  `ifdef RANDOMIZE_MEM_INIT
  for (initvar = 0; initvar < 1; initvar = initvar+1)
    ram_strb[initvar] = _GEN_1[7:0];
  `endif
  _GEN_2 = {1{$random}};
  `ifdef RANDOMIZE_MEM_INIT
  for (initvar = 0; initvar < 1; initvar = initvar+1)
    ram_last[initvar] = _GEN_2[0:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_3 = {1{$random}};
  maybe_full = _GEN_3[0:0];
  `endif
  end
`endif
  always @(posedge clock) begin
    if(ram_data__T_58_en & ram_data__T_58_mask) begin
      ram_data[ram_data__T_58_addr] <= ram_data__T_58_data;
    end
    if(ram_strb__T_58_en & ram_strb__T_58_mask) begin
      ram_strb[ram_strb__T_58_addr] <= ram_strb__T_58_data;
    end
    if(ram_last__T_58_en & ram_last__T_58_mask) begin
      ram_last[ram_last__T_58_addr] <= ram_last__T_58_data;
    end
    if (reset) begin
      maybe_full <= 1'h0;
    end else begin
      if (_T_64) begin
        maybe_full <= do_enq;
      end
    end
  end
endmodule