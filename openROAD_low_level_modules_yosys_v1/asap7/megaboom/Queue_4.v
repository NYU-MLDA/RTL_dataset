module Queue_4(
  input   clock,
  input   reset,
  output  io_enq_ready,
  input   io_enq_valid,
  input  [3:0] io_enq_bits_id,
  input  [1:0] io_enq_bits_resp,
  input   io_deq_ready,
  output  io_deq_valid,
  output [3:0] io_deq_bits_id,
  output [1:0] io_deq_bits_resp,
  output [6:0] io_count
);
  reg [3:0] ram_id [0:63];
  reg [31:0] _GEN_0;
  wire [3:0] ram_id__T_70_data;
  wire [5:0] ram_id__T_70_addr;
  wire [3:0] ram_id__T_52_data;
  wire [5:0] ram_id__T_52_addr;
  wire  ram_id__T_52_mask;
  wire  ram_id__T_52_en;
  reg [1:0] ram_resp [0:63];
  reg [31:0] _GEN_1;
  wire [1:0] ram_resp__T_70_data;
  wire [5:0] ram_resp__T_70_addr;
  wire [1:0] ram_resp__T_52_data;
  wire [5:0] ram_resp__T_52_addr;
  wire  ram_resp__T_52_mask;
  wire  ram_resp__T_52_en;
  reg [5:0] _T_41;
  reg [31:0] _GEN_2;
  reg [5:0] _T_43;
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
  wire [6:0] _T_58;
  wire [5:0] _T_59;
  wire [5:0] _GEN_5;
  wire [6:0] _T_63;
  wire [5:0] _T_64;
  wire [5:0] _GEN_6;
  wire  _T_65;
  wire  _GEN_7;
  wire  _T_67;
  wire  _T_69;
  wire  _GEN_8;
  wire  _GEN_9;
  wire [3:0] _GEN_10;
  wire [1:0] _GEN_11;
  wire  _GEN_12;
  wire  _GEN_13;
  wire [6:0] _T_76;
  wire [5:0] _T_77;
  wire  _T_78;
  wire [6:0] _T_79;
  assign io_enq_ready = _T_69;
  assign io_deq_valid = _GEN_8;
  assign io_deq_bits_id = _GEN_10;
  assign io_deq_bits_resp = _GEN_11;
  assign io_count = _T_79;
  assign ram_id__T_70_addr = _T_43;
  assign ram_id__T_70_data = ram_id[ram_id__T_70_addr];
  assign ram_id__T_52_data = io_enq_bits_id;
  assign ram_id__T_52_addr = _T_41;
  assign ram_id__T_52_mask = do_enq;
  assign ram_id__T_52_en = do_enq;
  assign ram_resp__T_70_addr = _T_43;
  assign ram_resp__T_70_data = ram_resp[ram_resp__T_70_addr];
  assign ram_resp__T_52_data = io_enq_bits_resp;
  assign ram_resp__T_52_addr = _T_41;
  assign ram_resp__T_52_mask = do_enq;
  assign ram_resp__T_52_en = do_enq;
  assign _T_45 = _T_41 == _T_43;
  assign _T_47 = maybe_full == 1'h0;
  assign _T_48 = _T_45 & _T_47;
  assign _T_49 = _T_45 & maybe_full;
  assign _T_50 = io_enq_ready & io_enq_valid;
  assign do_enq = _GEN_13;
  assign _T_51 = io_deq_ready & io_deq_valid;
  assign do_deq = _GEN_12;
  assign _T_58 = _T_41 + 6'h1;
  assign _T_59 = _T_58[5:0];
  assign _GEN_5 = do_enq ? _T_59 : _T_41;
  assign _T_63 = _T_43 + 6'h1;
  assign _T_64 = _T_63[5:0];
  assign _GEN_6 = do_deq ? _T_64 : _T_43;
  assign _T_65 = do_enq != do_deq;
  assign _GEN_7 = _T_65 ? do_enq : maybe_full;
  assign _T_67 = _T_48 == 1'h0;
  assign _T_69 = _T_49 == 1'h0;
  assign _GEN_8 = io_enq_valid ? 1'h1 : _T_67;
  assign _GEN_9 = io_deq_ready ? 1'h0 : _T_50;
  assign _GEN_10 = _T_48 ? io_enq_bits_id : ram_id__T_70_data;
  assign _GEN_11 = _T_48 ? io_enq_bits_resp : ram_resp__T_70_data;
  assign _GEN_12 = _T_48 ? 1'h0 : _T_51;
  assign _GEN_13 = _T_48 ? _GEN_9 : _T_50;
  assign _T_76 = _T_41 - _T_43;
  assign _T_77 = _T_76[5:0];
  assign _T_78 = maybe_full & _T_45;
  assign _T_79 = {_T_78,_T_77};
`ifdef RANDOMIZE
  integer initvar;
  initial begin
    `ifndef verilator
      #0.002 begin end
    `endif
  _GEN_0 = {1{$random}};
  `ifdef RANDOMIZE_MEM_INIT
  for (initvar = 0; initvar < 64; initvar = initvar+1)
    ram_id[initvar] = _GEN_0[3:0];
  `endif
  _GEN_1 = {1{$random}};
  `ifdef RANDOMIZE_MEM_INIT
  for (initvar = 0; initvar < 64; initvar = initvar+1)
    ram_resp[initvar] = _GEN_1[1:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_2 = {1{$random}};
  _T_41 = _GEN_2[5:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_3 = {1{$random}};
  _T_43 = _GEN_3[5:0];
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
    if(ram_resp__T_52_en & ram_resp__T_52_mask) begin
      ram_resp[ram_resp__T_52_addr] <= ram_resp__T_52_data;
    end
    if (reset) begin
      _T_41 <= 6'h0;
    end else begin
      if (do_enq) begin
        _T_41 <= _T_59;
      end
    end
    if (reset) begin
      _T_43 <= 6'h0;
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