module Queue_24(
  input   clock,
  input   reset,
  output  io_enq_ready,
  input   io_enq_valid,
  input  [7:0] io_enq_bits_id,
  input   io_enq_bits_last,
  input   io_deq_ready,
  output  io_deq_valid,
  output [7:0] io_deq_bits_id,
  output  io_deq_bits_last,
  output [1:0] io_count
);
  reg [7:0] ram_id [0:1];
  reg [31:0] _GEN_0;
  wire [7:0] ram_id__T_70_data;
  wire  ram_id__T_70_addr;
  wire [7:0] ram_id__T_52_data;
  wire  ram_id__T_52_addr;
  wire  ram_id__T_52_mask;
  wire  ram_id__T_52_en;
  reg  ram_last [0:1];
  reg [31:0] _GEN_1;
  wire  ram_last__T_70_data;
  wire  ram_last__T_70_addr;
  wire  ram_last__T_52_data;
  wire  ram_last__T_52_addr;
  wire  ram_last__T_52_mask;
  wire  ram_last__T_52_en;
  reg  _T_41;
  reg [31:0] _GEN_2;
  reg  _T_43;
  reg [31:0] _GEN_3;
  reg  maybe_full;
  reg [31:0] _GEN_4;
  wire  _T_45;
  wire  _T_47;
  wire  _T_48;
  wire  _T_49;
  wire  _T_50;
  wire  do_enq;
  wire  _T_51;
  wire  do_deq;
  wire [1:0] _T_58;
  wire  _T_59;
  wire  _GEN_5;
  wire [1:0] _T_63;
  wire  _T_64;
  wire  _GEN_6;
  wire  _T_65;
  wire  _GEN_7;
  wire  _T_67;
  wire  _T_69;
  wire [1:0] _T_73;
  wire  _T_74;
  wire  _T_75;
  wire [1:0] _T_76;
  assign io_enq_ready = _T_69;
  assign io_deq_valid = _T_67;
  assign io_deq_bits_id = ram_id__T_70_data;
  assign io_deq_bits_last = ram_last__T_70_data;
  assign io_count = _T_76;
  assign ram_id__T_70_addr = _T_43;
  assign ram_id__T_70_data = ram_id[ram_id__T_70_addr];
  assign ram_id__T_52_data = io_enq_bits_id;
  assign ram_id__T_52_addr = _T_41;
  assign ram_id__T_52_mask = do_enq;
  assign ram_id__T_52_en = do_enq;
  assign ram_last__T_70_addr = _T_43;
  assign ram_last__T_70_data = ram_last[ram_last__T_70_addr];
  assign ram_last__T_52_data = io_enq_bits_last;
  assign ram_last__T_52_addr = _T_41;
  assign ram_last__T_52_mask = do_enq;
  assign ram_last__T_52_en = do_enq;
  assign _T_45 = _T_41 == _T_43;
  assign _T_47 = maybe_full == 1'h0;
  assign _T_48 = _T_45 & _T_47;
  assign _T_49 = _T_45 & maybe_full;
  assign _T_50 = io_enq_ready & io_enq_valid;
  assign do_enq = _T_50;
  assign _T_51 = io_deq_ready & io_deq_valid;
  assign do_deq = _T_51;
  assign _T_58 = _T_41 + 1'h1;
  assign _T_59 = _T_58[0:0];
  assign _GEN_5 = do_enq ? _T_59 : _T_41;
  assign _T_63 = _T_43 + 1'h1;
  assign _T_64 = _T_63[0:0];
  assign _GEN_6 = do_deq ? _T_64 : _T_43;
  assign _T_65 = do_enq != do_deq;
  assign _GEN_7 = _T_65 ? do_enq : maybe_full;
  assign _T_67 = _T_48 == 1'h0;
  assign _T_69 = _T_49 == 1'h0;
  assign _T_73 = _T_41 - _T_43;
  assign _T_74 = _T_73[0:0];
  assign _T_75 = maybe_full & _T_45;
  assign _T_76 = {_T_75,_T_74};
`ifdef RANDOMIZE
  integer initvar;
  initial begin
    `ifndef verilator
      #0.002 begin end
    `endif
  _GEN_0 = {1{$random}};
  `ifdef RANDOMIZE_MEM_INIT
  for (initvar = 0; initvar < 2; initvar = initvar+1)
    ram_id[initvar] = _GEN_0[7:0];
  `endif
  _GEN_1 = {1{$random}};
  `ifdef RANDOMIZE_MEM_INIT
  for (initvar = 0; initvar < 2; initvar = initvar+1)
    ram_last[initvar] = _GEN_1[0:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_2 = {1{$random}};
  _T_41 = _GEN_2[0:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_3 = {1{$random}};
  _T_43 = _GEN_3[0:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_4 = {1{$random}};
  maybe_full = _GEN_4[0:0];
  `endif
  end
`endif
  always @(posedge clock) begin
    if(ram_id__T_52_en & ram_id__T_52_mask) begin
      ram_id[ram_id__T_52_addr] <= ram_id__T_52_data;
    end
    if(ram_last__T_52_en & ram_last__T_52_mask) begin
      ram_last[ram_last__T_52_addr] <= ram_last__T_52_data;
    end
    if (reset) begin
      _T_41 <= 1'h0;
    end else begin
      if (do_enq) begin
        _T_41 <= _T_59;
      end
    end
    if (reset) begin
      _T_43 <= 1'h0;
    end else begin
      if (do_deq) begin
        _T_43 <= _T_64;
      end
    end
    if (reset) begin
      maybe_full <= 1'h0;
    end else begin
      if (_T_65) begin
        maybe_full <= do_enq;
      end
    end
  end
endmodule