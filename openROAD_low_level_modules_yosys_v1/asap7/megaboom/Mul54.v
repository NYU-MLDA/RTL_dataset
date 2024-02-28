module Mul54(
  input   clock,
  input   reset,
  input   io_val_s0,
  input   io_latch_a_s0,
  input  [53:0] io_a_s0,
  input   io_latch_b_s0,
  input  [53:0] io_b_s0,
  input  [104:0] io_c_s2,
  output [104:0] io_result_s3
);
  reg  val_s1;
  reg [31:0] _GEN_7;
  reg  val_s2;
  reg [31:0] _GEN_8;
  reg [53:0] reg_a_s1;
  reg [63:0] _GEN_9;
  reg [53:0] reg_b_s1;
  reg [63:0] _GEN_10;
  reg [53:0] reg_a_s2;
  reg [63:0] _GEN_11;
  reg [53:0] reg_b_s2;
  reg [63:0] _GEN_12;
  reg [104:0] reg_result_s3;
  reg [127:0] _GEN_13;
  wire [53:0] _GEN_0;
  wire [53:0] _GEN_1;
  wire [53:0] _GEN_2;
  wire [53:0] _GEN_3;
  wire [53:0] _GEN_4;
  wire [53:0] _GEN_5;
  wire [107:0] _T_23;
  wire [104:0] _T_24;
  wire [105:0] _T_25;
  wire [104:0] _T_26;
  wire [104:0] _GEN_6;
  assign io_result_s3 = reg_result_s3;
  assign _GEN_0 = io_latch_a_s0 ? io_a_s0 : reg_a_s1;
  assign _GEN_1 = io_latch_b_s0 ? io_b_s0 : reg_b_s1;
  assign _GEN_2 = io_val_s0 ? _GEN_0 : reg_a_s1;
  assign _GEN_3 = io_val_s0 ? _GEN_1 : reg_b_s1;
  assign _GEN_4 = val_s1 ? reg_a_s1 : reg_a_s2;
  assign _GEN_5 = val_s1 ? reg_b_s1 : reg_b_s2;
  assign _T_23 = reg_a_s2 * reg_b_s2;
  assign _T_24 = _T_23[104:0];
  assign _T_25 = _T_24 + io_c_s2;
  assign _T_26 = _T_25[104:0];
  assign _GEN_6 = val_s2 ? _T_26 : reg_result_s3;
`ifdef RANDOMIZE
  integer initvar;
  initial begin
    `ifndef verilator
      #0.002 begin end
    `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_7 = {1{$random}};
  val_s1 = _GEN_7[0:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_8 = {1{$random}};
  val_s2 = _GEN_8[0:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_9 = {2{$random}};
  reg_a_s1 = _GEN_9[53:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_10 = {2{$random}};
  reg_b_s1 = _GEN_10[53:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_11 = {2{$random}};
  reg_a_s2 = _GEN_11[53:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_12 = {2{$random}};
  reg_b_s2 = _GEN_12[53:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_13 = {4{$random}};
  reg_result_s3 = _GEN_13[104:0];
  `endif
  end
`endif
  always @(posedge clock) begin
    val_s1 <= io_val_s0;
    val_s2 <= val_s1;
    if (io_val_s0) begin
      if (io_latch_a_s0) begin
        reg_a_s1 <= io_a_s0;
      end
    end
    if (io_val_s0) begin
      if (io_latch_b_s0) begin
        reg_b_s1 <= io_b_s0;
      end
    end
    if (val_s1) begin
      reg_a_s2 <= reg_a_s1;
    end
    if (val_s1) begin
      reg_b_s2 <= reg_b_s1;
    end
    if (val_s2) begin
      reg_result_s3 <= _T_26;
    end
  end
endmodule