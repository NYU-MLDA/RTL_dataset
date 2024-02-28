module Queue_36(
  input   clock,
  input   reset,
  output  io_enq_ready,
  input   io_enq_valid,
  input  [3:0] io_enq_bits_sink,
  input   io_deq_ready,
  output  io_deq_valid,
  output [3:0] io_deq_bits_sink,
  output  io_count
);
  reg [3:0] ram_sink [0:0];
  reg [31:0] _GEN_0;
  wire [3:0] ram_sink__T_54_data;
  wire  ram_sink__T_54_addr;
  wire [3:0] ram_sink__T_44_data;
  wire  ram_sink__T_44_addr;
  wire  ram_sink__T_44_mask;
  wire  ram_sink__T_44_en;
  reg  maybe_full;
  reg [31:0] _GEN_1;
  wire  _T_38;
  wire  _T_41;
  wire  do_enq;
  wire  _T_42;
  wire  do_deq;
  wire  _T_48;
  wire  _GEN_4;
  wire  _T_50;
  wire [1:0] _T_56;
  wire  _T_57;
  wire [1:0] _T_59;
  assign io_enq_ready = _T_38;
  assign io_deq_valid = _T_50;
  assign io_deq_bits_sink = ram_sink__T_54_data;
  assign io_count = _T_59[0];
  assign ram_sink__T_54_addr = 1'h0;
  assign ram_sink__T_54_data = ram_sink[ram_sink__T_54_addr];
  assign ram_sink__T_44_data = io_enq_bits_sink;
  assign ram_sink__T_44_addr = 1'h0;
  assign ram_sink__T_44_mask = do_enq;
  assign ram_sink__T_44_en = do_enq;
  assign _T_38 = maybe_full == 1'h0;
  assign _T_41 = io_enq_ready & io_enq_valid;
  assign do_enq = _T_41;
  assign _T_42 = io_deq_ready & io_deq_valid;
  assign do_deq = _T_42;
  assign _T_48 = do_enq != do_deq;
  assign _GEN_4 = _T_48 ? do_enq : maybe_full;
  assign _T_50 = _T_38 == 1'h0;
  assign _T_56 = 1'h0 - 1'h0;
  assign _T_57 = _T_56[0:0];
  assign _T_59 = {maybe_full,_T_57};
`ifdef RANDOMIZE
  integer initvar;
  initial begin
    `ifndef verilator
      #0.002 begin end
    `endif
  _GEN_0 = {1{$random}};
  `ifdef RANDOMIZE_MEM_INIT
  for (initvar = 0; initvar < 1; initvar = initvar+1)
    ram_sink[initvar] = _GEN_0[3:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_1 = {1{$random}};
  maybe_full = _GEN_1[0:0];
  `endif
  end
`endif
  always @(posedge clock) begin
    if(ram_sink__T_44_en & ram_sink__T_44_mask) begin
      ram_sink[ram_sink__T_44_addr] <= ram_sink__T_44_data;
    end
    if (reset) begin
      maybe_full <= 1'h0;
    end else begin
      if (_T_48) begin
        maybe_full <= do_enq;
      end
    end
  end
endmodule