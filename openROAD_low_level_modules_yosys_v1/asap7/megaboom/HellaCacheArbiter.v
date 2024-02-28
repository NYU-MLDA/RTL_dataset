module HellaCacheArbiter(
  input   clock,
  input   reset,
  output  io_requestor_0_req_ready,
  input   io_requestor_0_req_valid,
  input  [39:0] io_requestor_0_req_bits_addr,
  input  [6:0] io_requestor_0_req_bits_tag,
  input  [4:0] io_requestor_0_req_bits_cmd,
  input  [2:0] io_requestor_0_req_bits_typ,
  input   io_requestor_0_req_bits_phys,
  input  [63:0] io_requestor_0_req_bits_data,
  input   io_requestor_0_s1_kill,
  input  [63:0] io_requestor_0_s1_data,
  output  io_requestor_0_s2_nack,
  output  io_requestor_0_resp_valid,
  output [39:0] io_requestor_0_resp_bits_addr,
  output [6:0] io_requestor_0_resp_bits_tag,
  output [4:0] io_requestor_0_resp_bits_cmd,
  output [2:0] io_requestor_0_resp_bits_typ,
  output [63:0] io_requestor_0_resp_bits_data,
  output  io_requestor_0_resp_bits_replay,
  output  io_requestor_0_resp_bits_has_data,
  output [63:0] io_requestor_0_resp_bits_data_word_bypass,
  output [63:0] io_requestor_0_resp_bits_store_data,
  output  io_requestor_0_replay_next,
  output  io_requestor_0_xcpt_ma_ld,
  output  io_requestor_0_xcpt_ma_st,
  output  io_requestor_0_xcpt_pf_ld,
  output  io_requestor_0_xcpt_pf_st,
  input   io_requestor_0_invalidate_lr,
  output  io_requestor_0_ordered,
  output  io_requestor_1_req_ready,
  input   io_requestor_1_req_valid,
  input  [39:0] io_requestor_1_req_bits_addr,
  input  [6:0] io_requestor_1_req_bits_tag,
  input  [4:0] io_requestor_1_req_bits_cmd,
  input  [2:0] io_requestor_1_req_bits_typ,
  input   io_requestor_1_req_bits_phys,
  input  [63:0] io_requestor_1_req_bits_data,
  input   io_requestor_1_s1_kill,
  input  [63:0] io_requestor_1_s1_data,
  output  io_requestor_1_s2_nack,
  output  io_requestor_1_resp_valid,
  output [39:0] io_requestor_1_resp_bits_addr,
  output [6:0] io_requestor_1_resp_bits_tag,
  output [4:0] io_requestor_1_resp_bits_cmd,
  output [2:0] io_requestor_1_resp_bits_typ,
  output [63:0] io_requestor_1_resp_bits_data,
  output  io_requestor_1_resp_bits_replay,
  output  io_requestor_1_resp_bits_has_data,
  output [63:0] io_requestor_1_resp_bits_data_word_bypass,
  output [63:0] io_requestor_1_resp_bits_store_data,
  output  io_requestor_1_replay_next,
  output  io_requestor_1_xcpt_ma_ld,
  output  io_requestor_1_xcpt_ma_st,
  output  io_requestor_1_xcpt_pf_ld,
  output  io_requestor_1_xcpt_pf_st,
  input   io_requestor_1_invalidate_lr,
  output  io_requestor_1_ordered,
  input   io_mem_req_ready,
  output  io_mem_req_valid,
  output [39:0] io_mem_req_bits_addr,
  output [6:0] io_mem_req_bits_tag,
  output [4:0] io_mem_req_bits_cmd,
  output [2:0] io_mem_req_bits_typ,
  output  io_mem_req_bits_phys,
  output [63:0] io_mem_req_bits_data,
  output  io_mem_s1_kill,
  output [63:0] io_mem_s1_data,
  input   io_mem_s2_nack,
  input   io_mem_resp_valid,
  input  [39:0] io_mem_resp_bits_addr,
  input  [6:0] io_mem_resp_bits_tag,
  input  [4:0] io_mem_resp_bits_cmd,
  input  [2:0] io_mem_resp_bits_typ,
  input  [63:0] io_mem_resp_bits_data,
  input   io_mem_resp_bits_replay,
  input   io_mem_resp_bits_has_data,
  input  [63:0] io_mem_resp_bits_data_word_bypass,
  input  [63:0] io_mem_resp_bits_store_data,
  input   io_mem_replay_next,
  input   io_mem_xcpt_ma_ld,
  input   io_mem_xcpt_ma_st,
  input   io_mem_xcpt_pf_ld,
  input   io_mem_xcpt_pf_st,
  output  io_mem_invalidate_lr,
  input   io_mem_ordered
);
  reg  _T_873;
  reg [31:0] _GEN_9;
  reg  _T_874;
  reg [31:0] _GEN_10;
  wire  _T_875;
  wire  _T_876;
  wire  _T_878;
  wire  _T_879;
  wire [7:0] _T_881;
  wire [7:0] _T_884;
  wire [4:0] _GEN_0;
  wire [2:0] _GEN_1;
  wire [39:0] _GEN_2;
  wire  _GEN_3;
  wire [7:0] _GEN_4;
  wire  _GEN_5;
  wire  _T_887;
  wire  _GEN_6;
  wire [63:0] _GEN_7;
  wire  _T_888;
  wire  _T_890;
  wire  _T_891;
  wire  _T_893;
  wire  _T_894;
  wire [5:0] _T_895;
  wire  _T_899;
  wire  _T_902;
  reg [63:0] _GEN_8;
  reg [63:0] _GEN_11;
  assign io_requestor_0_req_ready = io_mem_req_ready;
  assign io_requestor_0_s2_nack = _T_894;
  assign io_requestor_0_resp_valid = _T_891;
  assign io_requestor_0_resp_bits_addr = io_mem_resp_bits_addr;
  assign io_requestor_0_resp_bits_tag = {{1'd0}, _T_895};
  assign io_requestor_0_resp_bits_cmd = io_mem_resp_bits_cmd;
  assign io_requestor_0_resp_bits_typ = io_mem_resp_bits_typ;
  assign io_requestor_0_resp_bits_data = io_mem_resp_bits_data;
  assign io_requestor_0_resp_bits_replay = io_mem_resp_bits_replay;
  assign io_requestor_0_resp_bits_has_data = io_mem_resp_bits_has_data;
  assign io_requestor_0_resp_bits_data_word_bypass = io_mem_resp_bits_data_word_bypass;
  assign io_requestor_0_resp_bits_store_data = io_mem_resp_bits_store_data;
  assign io_requestor_0_replay_next = io_mem_replay_next;
  assign io_requestor_0_xcpt_ma_ld = io_mem_xcpt_ma_ld;
  assign io_requestor_0_xcpt_ma_st = io_mem_xcpt_ma_st;
  assign io_requestor_0_xcpt_pf_ld = io_mem_xcpt_pf_ld;
  assign io_requestor_0_xcpt_pf_st = io_mem_xcpt_pf_st;
  assign io_requestor_0_ordered = io_mem_ordered;
  assign io_requestor_1_req_ready = _T_879;
  assign io_requestor_1_s2_nack = _T_902;
  assign io_requestor_1_resp_valid = _T_899;
  assign io_requestor_1_resp_bits_addr = io_mem_resp_bits_addr;
  assign io_requestor_1_resp_bits_tag = {{1'd0}, _T_895};
  assign io_requestor_1_resp_bits_cmd = io_mem_resp_bits_cmd;
  assign io_requestor_1_resp_bits_typ = io_mem_resp_bits_typ;
  assign io_requestor_1_resp_bits_data = io_mem_resp_bits_data;
  assign io_requestor_1_resp_bits_replay = io_mem_resp_bits_replay;
  assign io_requestor_1_resp_bits_has_data = io_mem_resp_bits_has_data;
  assign io_requestor_1_resp_bits_data_word_bypass = io_mem_resp_bits_data_word_bypass;
  assign io_requestor_1_resp_bits_store_data = io_mem_resp_bits_store_data;
  assign io_requestor_1_replay_next = io_mem_replay_next;
  assign io_requestor_1_xcpt_ma_ld = io_mem_xcpt_ma_ld;
  assign io_requestor_1_xcpt_ma_st = io_mem_xcpt_ma_st;
  assign io_requestor_1_xcpt_pf_ld = io_mem_xcpt_pf_ld;
  assign io_requestor_1_xcpt_pf_st = io_mem_xcpt_pf_st;
  assign io_requestor_1_ordered = io_mem_ordered;
  assign io_mem_req_valid = _T_876;
  assign io_mem_req_bits_addr = _GEN_2;
  assign io_mem_req_bits_tag = _GEN_4[6:0];
  assign io_mem_req_bits_cmd = _GEN_0;
  assign io_mem_req_bits_typ = _GEN_1;
  assign io_mem_req_bits_phys = _GEN_3;
  assign io_mem_req_bits_data = _GEN_8;
  assign io_mem_s1_kill = _GEN_6;
  assign io_mem_s1_data = _GEN_7;
  assign io_mem_invalidate_lr = _T_875;
  assign _T_875 = io_requestor_0_invalidate_lr | io_requestor_1_invalidate_lr;
  assign _T_876 = io_requestor_0_req_valid | io_requestor_1_req_valid;
  assign _T_878 = io_requestor_0_req_valid == 1'h0;
  assign _T_879 = io_requestor_0_req_ready & _T_878;
  assign _T_881 = {io_requestor_1_req_bits_tag,1'h1};
  assign _T_884 = {io_requestor_0_req_bits_tag,1'h0};
  assign _GEN_0 = io_requestor_0_req_valid ? io_requestor_0_req_bits_cmd : io_requestor_1_req_bits_cmd;
  assign _GEN_1 = io_requestor_0_req_valid ? io_requestor_0_req_bits_typ : io_requestor_1_req_bits_typ;
  assign _GEN_2 = io_requestor_0_req_valid ? io_requestor_0_req_bits_addr : io_requestor_1_req_bits_addr;
  assign _GEN_3 = io_requestor_0_req_valid ? io_requestor_0_req_bits_phys : io_requestor_1_req_bits_phys;
  assign _GEN_4 = io_requestor_0_req_valid ? _T_884 : _T_881;
  assign _GEN_5 = io_requestor_0_req_valid ? 1'h0 : 1'h1;
  assign _T_887 = _T_873 == 1'h0;
  assign _GEN_6 = _T_887 ? io_requestor_0_s1_kill : io_requestor_1_s1_kill;
  assign _GEN_7 = _T_887 ? io_requestor_0_s1_data : io_requestor_1_s1_data;
  assign _T_888 = io_mem_resp_bits_tag[0];
  assign _T_890 = _T_888 == 1'h0;
  assign _T_891 = io_mem_resp_valid & _T_890;
  assign _T_893 = _T_874 == 1'h0;
  assign _T_894 = io_mem_s2_nack & _T_893;
  assign _T_895 = io_mem_resp_bits_tag[6:1];
  assign _T_899 = io_mem_resp_valid & _T_888;
  assign _T_902 = io_mem_s2_nack & _T_874;
`ifdef RANDOMIZE
  integer initvar;
  initial begin
    `ifndef verilator
      #0.002 begin end
    `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_9 = {1{$random}};
  _T_873 = _GEN_9[0:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_10 = {1{$random}};
  _T_874 = _GEN_10[0:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_11 = {2{$random}};
  _GEN_8 = _GEN_11[63:0];
  `endif
  end
`endif
  always @(posedge clock) begin
    if (io_requestor_0_req_valid) begin
      _T_873 <= 1'h0;
    end else begin
      _T_873 <= 1'h1;
    end
    _T_874 <= _T_873;
  end
endmodule