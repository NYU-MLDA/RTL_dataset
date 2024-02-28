module RRArbiter(
  input   clock,
  input   reset,
  output  io_in_0_ready,
  input   io_in_0_valid,
  input  [1:0] io_in_0_bits_prv,
  input   io_in_0_bits_pum,
  input   io_in_0_bits_mxr,
  input  [26:0] io_in_0_bits_addr,
  input   io_in_0_bits_store,
  input   io_in_0_bits_fetch,
  output  io_in_1_ready,
  input   io_in_1_valid,
  input  [1:0] io_in_1_bits_prv,
  input   io_in_1_bits_pum,
  input   io_in_1_bits_mxr,
  input  [26:0] io_in_1_bits_addr,
  input   io_in_1_bits_store,
  input   io_in_1_bits_fetch,
  output  io_in_2_ready,
  input   io_in_2_valid,
  input  [1:0] io_in_2_bits_prv,
  input   io_in_2_bits_pum,
  input   io_in_2_bits_mxr,
  input  [26:0] io_in_2_bits_addr,
  input   io_in_2_bits_store,
  input   io_in_2_bits_fetch,
  input   io_out_ready,
  output  io_out_valid,
  output [1:0] io_out_bits_prv,
  output  io_out_bits_pum,
  output  io_out_bits_mxr,
  output [26:0] io_out_bits_addr,
  output  io_out_bits_store,
  output  io_out_bits_fetch,
  output [1:0] io_chosen
);
  wire [1:0] choice;
  wire  _GEN_0_ready;
  wire  _GEN_0_valid;
  wire [1:0] _GEN_0_bits_prv;
  wire  _GEN_0_bits_pum;
  wire  _GEN_0_bits_mxr;
  wire [26:0] _GEN_0_bits_addr;
  wire  _GEN_0_bits_store;
  wire  _GEN_0_bits_fetch;
  wire  _GEN_7;
  wire  _GEN_8;
  wire [1:0] _GEN_9;
  wire  _GEN_10;
  wire  _GEN_11;
  wire [26:0] _GEN_12;
  wire  _GEN_13;
  wire  _GEN_14;
  wire  _GEN_15;
  wire  _GEN_16;
  wire [1:0] _GEN_17;
  wire  _GEN_18;
  wire  _GEN_19;
  wire [26:0] _GEN_20;
  wire  _GEN_21;
  wire  _GEN_22;
  wire  _GEN_1_ready;
  wire  _GEN_1_valid;
  wire [1:0] _GEN_1_bits_prv;
  wire  _GEN_1_bits_pum;
  wire  _GEN_1_bits_mxr;
  wire [26:0] _GEN_1_bits_addr;
  wire  _GEN_1_bits_store;
  wire  _GEN_1_bits_fetch;
  wire  _GEN_2_ready;
  wire  _GEN_2_valid;
  wire [1:0] _GEN_2_bits_prv;
  wire  _GEN_2_bits_pum;
  wire  _GEN_2_bits_mxr;
  wire [26:0] _GEN_2_bits_addr;
  wire  _GEN_2_bits_store;
  wire  _GEN_2_bits_fetch;
  wire  _GEN_3_ready;
  wire  _GEN_3_valid;
  wire [1:0] _GEN_3_bits_prv;
  wire  _GEN_3_bits_pum;
  wire  _GEN_3_bits_mxr;
  wire [26:0] _GEN_3_bits_addr;
  wire  _GEN_3_bits_store;
  wire  _GEN_3_bits_fetch;
  wire  _GEN_4_ready;
  wire  _GEN_4_valid;
  wire [1:0] _GEN_4_bits_prv;
  wire  _GEN_4_bits_pum;
  wire  _GEN_4_bits_mxr;
  wire [26:0] _GEN_4_bits_addr;
  wire  _GEN_4_bits_store;
  wire  _GEN_4_bits_fetch;
  wire  _GEN_5_ready;
  wire  _GEN_5_valid;
  wire [1:0] _GEN_5_bits_prv;
  wire  _GEN_5_bits_pum;
  wire  _GEN_5_bits_mxr;
  wire [26:0] _GEN_5_bits_addr;
  wire  _GEN_5_bits_store;
  wire  _GEN_5_bits_fetch;
  wire  _GEN_6_ready;
  wire  _GEN_6_valid;
  wire [1:0] _GEN_6_bits_prv;
  wire  _GEN_6_bits_pum;
  wire  _GEN_6_bits_mxr;
  wire [26:0] _GEN_6_bits_addr;
  wire  _GEN_6_bits_store;
  wire  _GEN_6_bits_fetch;
  wire  _T_228;
  reg [1:0] lastGrant;
  reg [31:0] _GEN_0;
  wire [1:0] _GEN_23;
  wire  grantMask_1;
  wire  grantMask_2;
  wire  validMask_1;
  wire  validMask_2;
  wire  _T_234;
  wire  _T_235;
  wire  _T_236;
  wire  _T_240;
  wire  _T_242;
  wire  _T_244;
  wire  _T_246;
  wire  _T_250;
  wire  _T_251;
  wire  _T_252;
  wire  _T_253;
  wire  _T_254;
  wire  _T_255;
  wire [1:0] _GEN_24;
  wire [1:0] _GEN_25;
  wire [1:0] _GEN_26;
  wire [1:0] _GEN_27;
  assign io_in_0_ready = _T_253;
  assign io_in_1_ready = _T_254;
  assign io_in_2_ready = _T_255;
  assign io_out_valid = _GEN_0_valid;
  assign io_out_bits_prv = _GEN_1_bits_prv;
  assign io_out_bits_pum = _GEN_2_bits_pum;
  assign io_out_bits_mxr = _GEN_3_bits_mxr;
  assign io_out_bits_addr = _GEN_4_bits_addr;
  assign io_out_bits_store = _GEN_5_bits_store;
  assign io_out_bits_fetch = _GEN_6_bits_fetch;
  assign io_chosen = choice;
  assign choice = _GEN_27;
  assign _GEN_0_ready = _GEN_15;
  assign _GEN_0_valid = _GEN_16;
  assign _GEN_0_bits_prv = _GEN_17;
  assign _GEN_0_bits_pum = _GEN_18;
  assign _GEN_0_bits_mxr = _GEN_19;
  assign _GEN_0_bits_addr = _GEN_20;
  assign _GEN_0_bits_store = _GEN_21;
  assign _GEN_0_bits_fetch = _GEN_22;
  assign _GEN_7 = 2'h1 == io_chosen ? io_in_1_ready : io_in_0_ready;
  assign _GEN_8 = 2'h1 == io_chosen ? io_in_1_valid : io_in_0_valid;
  assign _GEN_9 = 2'h1 == io_chosen ? io_in_1_bits_prv : io_in_0_bits_prv;
  assign _GEN_10 = 2'h1 == io_chosen ? io_in_1_bits_pum : io_in_0_bits_pum;
  assign _GEN_11 = 2'h1 == io_chosen ? io_in_1_bits_mxr : io_in_0_bits_mxr;
  assign _GEN_12 = 2'h1 == io_chosen ? io_in_1_bits_addr : io_in_0_bits_addr;
  assign _GEN_13 = 2'h1 == io_chosen ? io_in_1_bits_store : io_in_0_bits_store;
  assign _GEN_14 = 2'h1 == io_chosen ? io_in_1_bits_fetch : io_in_0_bits_fetch;
  assign _GEN_15 = 2'h2 == io_chosen ? io_in_2_ready : _GEN_7;
  assign _GEN_16 = 2'h2 == io_chosen ? io_in_2_valid : _GEN_8;
  assign _GEN_17 = 2'h2 == io_chosen ? io_in_2_bits_prv : _GEN_9;
  assign _GEN_18 = 2'h2 == io_chosen ? io_in_2_bits_pum : _GEN_10;
  assign _GEN_19 = 2'h2 == io_chosen ? io_in_2_bits_mxr : _GEN_11;
  assign _GEN_20 = 2'h2 == io_chosen ? io_in_2_bits_addr : _GEN_12;
  assign _GEN_21 = 2'h2 == io_chosen ? io_in_2_bits_store : _GEN_13;
  assign _GEN_22 = 2'h2 == io_chosen ? io_in_2_bits_fetch : _GEN_14;
  assign _GEN_1_ready = _GEN_15;
  assign _GEN_1_valid = _GEN_16;
  assign _GEN_1_bits_prv = _GEN_17;
  assign _GEN_1_bits_pum = _GEN_18;
  assign _GEN_1_bits_mxr = _GEN_19;
  assign _GEN_1_bits_addr = _GEN_20;
  assign _GEN_1_bits_store = _GEN_21;
  assign _GEN_1_bits_fetch = _GEN_22;
  assign _GEN_2_ready = _GEN_15;
  assign _GEN_2_valid = _GEN_16;
  assign _GEN_2_bits_prv = _GEN_17;
  assign _GEN_2_bits_pum = _GEN_18;
  assign _GEN_2_bits_mxr = _GEN_19;
  assign _GEN_2_bits_addr = _GEN_20;
  assign _GEN_2_bits_store = _GEN_21;
  assign _GEN_2_bits_fetch = _GEN_22;
  assign _GEN_3_ready = _GEN_15;
  assign _GEN_3_valid = _GEN_16;
  assign _GEN_3_bits_prv = _GEN_17;
  assign _GEN_3_bits_pum = _GEN_18;
  assign _GEN_3_bits_mxr = _GEN_19;
  assign _GEN_3_bits_addr = _GEN_20;
  assign _GEN_3_bits_store = _GEN_21;
  assign _GEN_3_bits_fetch = _GEN_22;
  assign _GEN_4_ready = _GEN_15;
  assign _GEN_4_valid = _GEN_16;
  assign _GEN_4_bits_prv = _GEN_17;
  assign _GEN_4_bits_pum = _GEN_18;
  assign _GEN_4_bits_mxr = _GEN_19;
  assign _GEN_4_bits_addr = _GEN_20;
  assign _GEN_4_bits_store = _GEN_21;
  assign _GEN_4_bits_fetch = _GEN_22;
  assign _GEN_5_ready = _GEN_15;
  assign _GEN_5_valid = _GEN_16;
  assign _GEN_5_bits_prv = _GEN_17;
  assign _GEN_5_bits_pum = _GEN_18;
  assign _GEN_5_bits_mxr = _GEN_19;
  assign _GEN_5_bits_addr = _GEN_20;
  assign _GEN_5_bits_store = _GEN_21;
  assign _GEN_5_bits_fetch = _GEN_22;
  assign _GEN_6_ready = _GEN_15;
  assign _GEN_6_valid = _GEN_16;
  assign _GEN_6_bits_prv = _GEN_17;
  assign _GEN_6_bits_pum = _GEN_18;
  assign _GEN_6_bits_mxr = _GEN_19;
  assign _GEN_6_bits_addr = _GEN_20;
  assign _GEN_6_bits_store = _GEN_21;
  assign _GEN_6_bits_fetch = _GEN_22;
  assign _T_228 = io_out_ready & io_out_valid;
  assign _GEN_23 = _T_228 ? io_chosen : lastGrant;
  assign grantMask_1 = 2'h1 > lastGrant;
  assign grantMask_2 = 2'h2 > lastGrant;
  assign validMask_1 = io_in_1_valid & grantMask_1;
  assign validMask_2 = io_in_2_valid & grantMask_2;
  assign _T_234 = validMask_1 | validMask_2;
  assign _T_235 = _T_234 | io_in_0_valid;
  assign _T_236 = _T_235 | io_in_1_valid;
  assign _T_240 = validMask_1 == 1'h0;
  assign _T_242 = _T_234 == 1'h0;
  assign _T_244 = _T_235 == 1'h0;
  assign _T_246 = _T_236 == 1'h0;
  assign _T_250 = grantMask_1 | _T_244;
  assign _T_251 = _T_240 & grantMask_2;
  assign _T_252 = _T_251 | _T_246;
  assign _T_253 = _T_242 & io_out_ready;
  assign _T_254 = _T_250 & io_out_ready;
  assign _T_255 = _T_252 & io_out_ready;
  assign _GEN_24 = io_in_1_valid ? 2'h1 : 2'h2;
  assign _GEN_25 = io_in_0_valid ? 2'h0 : _GEN_24;
  assign _GEN_26 = validMask_2 ? 2'h2 : _GEN_25;
  assign _GEN_27 = validMask_1 ? 2'h1 : _GEN_26;
`ifdef RANDOMIZE
  integer initvar;
  initial begin
    `ifndef verilator
      #0.002 begin end
    `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_0 = {1{$random}};
  lastGrant = _GEN_0[1:0];
  `endif
  end
`endif
  always @(posedge clock) begin
    if (_T_228) begin
      lastGrant <= io_chosen;
    end
  end
endmodule