module Queue_46(
  input   clock,
  input   reset,
  output  io_enq_ready,
  input   io_enq_valid,
  input  [3:0] io_enq_bits_sink,
  input   io_deq_ready,
  output  io_deq_valid,
  output [3:0] io_deq_bits_sink,
  output [1:0] io_count
);
  reg [3:0] ram_sink [0:1];
  reg [31:0] _GEN_0;
  wire [3:0] ram_sink__T_62_data;
  wire  ram_sink__T_62_addr;
  wire [3:0] ram_sink__T_45_data;
  wire  ram_sink__T_45_addr;
  wire  ram_sink__T_45_mask;
  wire  ram_sink__T_45_en;
  reg  _T_34;
  reg [31:0] _GEN_1;
  reg  _T_36;
  reg [31:0] _GEN_2;
  reg  maybe_full;
  reg [31:0] _GEN_3;
  wire  _T_38;
  wire  _T_40;
  wire  _T_41;
  wire  _T_42;
  wire  _T_43;
  wire  do_enq;
  wire  _T_44;
  wire  do_deq;
  wire [1:0] _T_50;
  wire  _T_51;
  wire  _GEN_4;
  wire [1:0] _T_55;
  wire  _T_56;
  wire  _GEN_5;
  wire  _T_57;
  wire  _GEN_6;
  wire  _T_59;
  wire  _T_61;
  wire [1:0] _T_64;
  wire  _T_65;
  wire  _T_66;
  wire [1:0] _T_67;
  assign io_enq_ready = _T_61;
  assign io_deq_valid = _T_59;
  assign io_deq_bits_sink = ram_sink__T_62_data;
  assign io_count = _T_67;
  assign ram_sink__T_62_addr = _T_36;
  assign ram_sink__T_62_data = ram_sink[ram_sink__T_62_addr];
  assign ram_sink__T_45_data = io_enq_bits_sink;
  assign ram_sink__T_45_addr = _T_34;
  assign ram_sink__T_45_mask = do_enq;
  assign ram_sink__T_45_en = do_enq;
  assign _T_38 = _T_34 == _T_36;
  assign _T_40 = maybe_full == 1'h0;
  assign _T_41 = _T_38 & _T_40;
  assign _T_42 = _T_38 & maybe_full;
  assign _T_43 = io_enq_ready & io_enq_valid;
  assign do_enq = _T_43;
  assign _T_44 = io_deq_ready & io_deq_valid;
  assign do_deq = _T_44;
  assign _T_50 = _T_34 + 1'h1;
  assign _T_51 = _T_50[0:0];
  assign _GEN_4 = do_enq ? _T_51 : _T_34;
  assign _T_55 = _T_36 + 1'h1;
  assign _T_56 = _T_55[0:0];
  assign _GEN_5 = do_deq ? _T_56 : _T_36;
  assign _T_57 = do_enq != do_deq;
  assign _GEN_6 = _T_57 ? do_enq : maybe_full;
  assign _T_59 = _T_41 == 1'h0;
  assign _T_61 = _T_42 == 1'h0;
  assign _T_64 = _T_34 - _T_36;
  assign _T_65 = _T_64[0:0];
  assign _T_66 = maybe_full & _T_38;
  assign _T_67 = {_T_66,_T_65};
`ifdef RANDOMIZE
  integer initvar;
  initial begin
    `ifndef verilator
      #0.002 begin end
    `endif
  _GEN_0 = {1{$random}};
  `ifdef RANDOMIZE_MEM_INIT
  for (initvar = 0; initvar < 2; initvar = initvar+1)
    ram_sink[initvar] = _GEN_0[3:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_1 = {1{$random}};
  _T_34 = _GEN_1[0:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_2 = {1{$random}};
  _T_36 = _GEN_2[0:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_3 = {1{$random}};
  maybe_full = _GEN_3[0:0];
  `endif
  end
`endif
  always @(posedge clock) begin
    if(ram_sink__T_45_en & ram_sink__T_45_mask) begin
      ram_sink[ram_sink__T_45_addr] <= ram_sink__T_45_data;
    end
    if (reset) begin
      _T_34 <= 1'h0;
    end else begin
      if (do_enq) begin
        _T_34 <= _T_51;
      end
    end
    if (reset) begin
      _T_36 <= 1'h0;
    end else begin
      if (do_deq) begin
        _T_36 <= _T_56;
      end
    end
    if (reset) begin
      maybe_full <= 1'h0;
    end else begin
      if (_T_57) begin
        maybe_full <= do_enq;
      end
    end
  end
endmodule