module Queue_25(
  input   clock,
  input   reset,
  output  io_enq_ready,
  input   io_enq_valid,
  input  [7:0] io_enq_bits,
  input   io_deq_ready,
  output  io_deq_valid,
  output [7:0] io_deq_bits,
  output [1:0] io_count
);
  reg [7:0] ram [0:1];
  reg [31:0] _GEN_0;
  wire [7:0] ram__T_54_data;
  wire  ram__T_54_addr;
  wire [7:0] ram__T_38_data;
  wire  ram__T_38_addr;
  wire  ram__T_38_mask;
  wire  ram__T_38_en;
  reg  _T_27;
  reg [31:0] _GEN_1;
  reg  _T_29;
  reg [31:0] _GEN_2;
  reg  maybe_full;
  reg [31:0] _GEN_3;
  wire  _T_31;
  wire  _T_33;
  wire  _T_34;
  wire  _T_35;
  wire  _T_36;
  wire  do_enq;
  wire  _T_37;
  wire  do_deq;
  wire [1:0] _T_42;
  wire  _T_43;
  wire  _GEN_4;
  wire [1:0] _T_47;
  wire  _T_48;
  wire  _GEN_5;
  wire  _T_49;
  wire  _GEN_6;
  wire  _T_51;
  wire  _T_53;
  wire [1:0] _T_55;
  wire  _T_56;
  wire  _T_57;
  wire [1:0] _T_58;
  assign io_enq_ready = _T_53;
  assign io_deq_valid = _T_51;
  assign io_deq_bits = ram__T_54_data;
  assign io_count = _T_58;
  assign ram__T_54_addr = _T_29;
  assign ram__T_54_data = ram[ram__T_54_addr];
  assign ram__T_38_data = io_enq_bits;
  assign ram__T_38_addr = _T_27;
  assign ram__T_38_mask = do_enq;
  assign ram__T_38_en = do_enq;
  assign _T_31 = _T_27 == _T_29;
  assign _T_33 = maybe_full == 1'h0;
  assign _T_34 = _T_31 & _T_33;
  assign _T_35 = _T_31 & maybe_full;
  assign _T_36 = io_enq_ready & io_enq_valid;
  assign do_enq = _T_36;
  assign _T_37 = io_deq_ready & io_deq_valid;
  assign do_deq = _T_37;
  assign _T_42 = _T_27 + 1'h1;
  assign _T_43 = _T_42[0:0];
  assign _GEN_4 = do_enq ? _T_43 : _T_27;
  assign _T_47 = _T_29 + 1'h1;
  assign _T_48 = _T_47[0:0];
  assign _GEN_5 = do_deq ? _T_48 : _T_29;
  assign _T_49 = do_enq != do_deq;
  assign _GEN_6 = _T_49 ? do_enq : maybe_full;
  assign _T_51 = _T_34 == 1'h0;
  assign _T_53 = _T_35 == 1'h0;
  assign _T_55 = _T_27 - _T_29;
  assign _T_56 = _T_55[0:0];
  assign _T_57 = maybe_full & _T_31;
  assign _T_58 = {_T_57,_T_56};
`ifdef RANDOMIZE
  integer initvar;
  initial begin
    `ifndef verilator
      #0.002 begin end
    `endif
  _GEN_0 = {1{$random}};
  `ifdef RANDOMIZE_MEM_INIT
  for (initvar = 0; initvar < 2; initvar = initvar+1)
    ram[initvar] = _GEN_0[7:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_1 = {1{$random}};
  _T_27 = _GEN_1[0:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_2 = {1{$random}};
  _T_29 = _GEN_2[0:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_3 = {1{$random}};
  maybe_full = _GEN_3[0:0];
  `endif
  end
`endif
  always @(posedge clock) begin
    if(ram__T_38_en & ram__T_38_mask) begin
      ram[ram__T_38_addr] <= ram__T_38_data;
    end
    if (reset) begin
      _T_27 <= 1'h0;
    end else begin
      if (do_enq) begin
        _T_27 <= _T_43;
      end
    end
    if (reset) begin
      _T_29 <= 1'h0;
    end else begin
      if (do_deq) begin
        _T_29 <= _T_48;
      end
    end
    if (reset) begin
      maybe_full <= 1'h0;
    end else begin
      if (_T_49) begin
        maybe_full <= do_enq;
      end
    end
  end
endmodule