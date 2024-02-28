module Queue_39(
  input   clock,
  input   reset,
  output  io_enq_ready,
  input   io_enq_valid,
  input  [39:0] io_enq_bits_pc,
  input  [31:0] io_enq_bits_insts_0,
  input  [31:0] io_enq_bits_insts_1,
  input  [31:0] io_enq_bits_insts_2,
  input  [31:0] io_enq_bits_insts_3,
  input  [3:0] io_enq_bits_mask,
  input   io_enq_bits_xcpt_if,
  input   io_enq_bits_replay_if,
  input   io_enq_bits_pred_resp_btb_resp_valid,
  input   io_enq_bits_pred_resp_btb_resp_taken,
  input  [3:0] io_enq_bits_pred_resp_btb_resp_mask,
  input  [1:0] io_enq_bits_pred_resp_btb_resp_bridx,
  input  [38:0] io_enq_bits_pred_resp_btb_resp_target,
  input  [5:0] io_enq_bits_pred_resp_btb_resp_entry,
  input  [6:0] io_enq_bits_pred_resp_btb_resp_bht_history,
  input  [1:0] io_enq_bits_pred_resp_btb_resp_bht_value,
  input  [3:0] io_enq_bits_pred_resp_bpd_resp_takens,
  input  [10:0] io_enq_bits_pred_resp_bpd_resp_history,
  input  [10:0] io_enq_bits_pred_resp_bpd_resp_history_u,
  input  [8:0] io_enq_bits_pred_resp_bpd_resp_history_ptr,
  input  [10:0] io_enq_bits_pred_resp_bpd_resp_info,
  input  [3:0] io_enq_bits_pred_resp_mask,
  input   io_enq_bits_pred_resp_br_seen,
  input   io_enq_bits_predictions_0_bpd_predict_val,
  input   io_enq_bits_predictions_0_bpd_predict_taken,
  input   io_enq_bits_predictions_0_btb_hit,
  input   io_enq_bits_predictions_0_btb_predicted,
  input   io_enq_bits_predictions_0_is_br_or_jalr,
  input   io_enq_bits_predictions_1_bpd_predict_val,
  input   io_enq_bits_predictions_1_bpd_predict_taken,
  input   io_enq_bits_predictions_1_btb_hit,
  input   io_enq_bits_predictions_1_btb_predicted,
  input   io_enq_bits_predictions_1_is_br_or_jalr,
  input   io_enq_bits_predictions_2_bpd_predict_val,
  input   io_enq_bits_predictions_2_bpd_predict_taken,
  input   io_enq_bits_predictions_2_btb_hit,
  input   io_enq_bits_predictions_2_btb_predicted,
  input   io_enq_bits_predictions_2_is_br_or_jalr,
  input   io_enq_bits_predictions_3_bpd_predict_val,
  input   io_enq_bits_predictions_3_bpd_predict_taken,
  input   io_enq_bits_predictions_3_btb_hit,
  input   io_enq_bits_predictions_3_btb_predicted,
  input   io_enq_bits_predictions_3_is_br_or_jalr,
  input  [31:0] io_enq_bits_debug_events_0_fetch_seq,
  input  [31:0] io_enq_bits_debug_events_1_fetch_seq,
  input  [31:0] io_enq_bits_debug_events_2_fetch_seq,
  input  [31:0] io_enq_bits_debug_events_3_fetch_seq,
  input   io_deq_ready,
  output  io_deq_valid,
  output [39:0] io_deq_bits_pc,
  output [31:0] io_deq_bits_insts_0,
  output [31:0] io_deq_bits_insts_1,
  output [31:0] io_deq_bits_insts_2,
  output [31:0] io_deq_bits_insts_3,
  output [3:0] io_deq_bits_mask,
  output  io_deq_bits_xcpt_if,
  output  io_deq_bits_replay_if,
  output  io_deq_bits_pred_resp_btb_resp_valid,
  output  io_deq_bits_pred_resp_btb_resp_taken,
  output [3:0] io_deq_bits_pred_resp_btb_resp_mask,
  output [1:0] io_deq_bits_pred_resp_btb_resp_bridx,
  output [38:0] io_deq_bits_pred_resp_btb_resp_target,
  output [5:0] io_deq_bits_pred_resp_btb_resp_entry,
  output [6:0] io_deq_bits_pred_resp_btb_resp_bht_history,
  output [1:0] io_deq_bits_pred_resp_btb_resp_bht_value,
  output [3:0] io_deq_bits_pred_resp_bpd_resp_takens,
  output [10:0] io_deq_bits_pred_resp_bpd_resp_history,
  output [10:0] io_deq_bits_pred_resp_bpd_resp_history_u,
  output [8:0] io_deq_bits_pred_resp_bpd_resp_history_ptr,
  output [10:0] io_deq_bits_pred_resp_bpd_resp_info,
  output [3:0] io_deq_bits_pred_resp_mask,
  output  io_deq_bits_pred_resp_br_seen,
  output  io_deq_bits_predictions_0_bpd_predict_val,
  output  io_deq_bits_predictions_0_bpd_predict_taken,
  output  io_deq_bits_predictions_0_btb_hit,
  output  io_deq_bits_predictions_0_btb_predicted,
  output  io_deq_bits_predictions_0_is_br_or_jalr,
  output  io_deq_bits_predictions_1_bpd_predict_val,
  output  io_deq_bits_predictions_1_bpd_predict_taken,
  output  io_deq_bits_predictions_1_btb_hit,
  output  io_deq_bits_predictions_1_btb_predicted,
  output  io_deq_bits_predictions_1_is_br_or_jalr,
  output  io_deq_bits_predictions_2_bpd_predict_val,
  output  io_deq_bits_predictions_2_bpd_predict_taken,
  output  io_deq_bits_predictions_2_btb_hit,
  output  io_deq_bits_predictions_2_btb_predicted,
  output  io_deq_bits_predictions_2_is_br_or_jalr,
  output  io_deq_bits_predictions_3_bpd_predict_val,
  output  io_deq_bits_predictions_3_bpd_predict_taken,
  output  io_deq_bits_predictions_3_btb_hit,
  output  io_deq_bits_predictions_3_btb_predicted,
  output  io_deq_bits_predictions_3_is_br_or_jalr,
  output [31:0] io_deq_bits_debug_events_0_fetch_seq,
  output [31:0] io_deq_bits_debug_events_1_fetch_seq,
  output [31:0] io_deq_bits_debug_events_2_fetch_seq,
  output [31:0] io_deq_bits_debug_events_3_fetch_seq,
  output [2:0] io_count
);
  reg [39:0] ram_pc [0:3];
  reg [63:0] _GEN_0;
  wire [39:0] ram_pc__T_742_data;
  wire [1:0] ram_pc__T_742_addr;
  wire [39:0] ram_pc__T_640_data;
  wire [1:0] ram_pc__T_640_addr;
  wire  ram_pc__T_640_mask;
  wire  ram_pc__T_640_en;
  reg [31:0] ram_insts_0 [0:3];
  reg [31:0] _GEN_1;
  wire [31:0] ram_insts_0__T_742_data;
  wire [1:0] ram_insts_0__T_742_addr;
  wire [31:0] ram_insts_0__T_640_data;
  wire [1:0] ram_insts_0__T_640_addr;
  wire  ram_insts_0__T_640_mask;
  wire  ram_insts_0__T_640_en;
  reg [31:0] ram_insts_1 [0:3];
  reg [31:0] _GEN_2;
  wire [31:0] ram_insts_1__T_742_data;
  wire [1:0] ram_insts_1__T_742_addr;
  wire [31:0] ram_insts_1__T_640_data;
  wire [1:0] ram_insts_1__T_640_addr;
  wire  ram_insts_1__T_640_mask;
  wire  ram_insts_1__T_640_en;
  reg [31:0] ram_insts_2 [0:3];
  reg [31:0] _GEN_3;
  wire [31:0] ram_insts_2__T_742_data;
  wire [1:0] ram_insts_2__T_742_addr;
  wire [31:0] ram_insts_2__T_640_data;
  wire [1:0] ram_insts_2__T_640_addr;
  wire  ram_insts_2__T_640_mask;
  wire  ram_insts_2__T_640_en;
  reg [31:0] ram_insts_3 [0:3];
  reg [31:0] _GEN_4;
  wire [31:0] ram_insts_3__T_742_data;
  wire [1:0] ram_insts_3__T_742_addr;
  wire [31:0] ram_insts_3__T_640_data;
  wire [1:0] ram_insts_3__T_640_addr;
  wire  ram_insts_3__T_640_mask;
  wire  ram_insts_3__T_640_en;
  reg [3:0] ram_mask [0:3];
  reg [31:0] _GEN_5;
  wire [3:0] ram_mask__T_742_data;
  wire [1:0] ram_mask__T_742_addr;
  wire [3:0] ram_mask__T_640_data;
  wire [1:0] ram_mask__T_640_addr;
  wire  ram_mask__T_640_mask;
  wire  ram_mask__T_640_en;
  reg  ram_xcpt_if [0:3];
  reg [31:0] _GEN_6;
  wire  ram_xcpt_if__T_742_data;
  wire [1:0] ram_xcpt_if__T_742_addr;
  wire  ram_xcpt_if__T_640_data;
  wire [1:0] ram_xcpt_if__T_640_addr;
  wire  ram_xcpt_if__T_640_mask;
  wire  ram_xcpt_if__T_640_en;
  reg  ram_replay_if [0:3];
  reg [31:0] _GEN_7;
  wire  ram_replay_if__T_742_data;
  wire [1:0] ram_replay_if__T_742_addr;
  wire  ram_replay_if__T_640_data;
  wire [1:0] ram_replay_if__T_640_addr;
  wire  ram_replay_if__T_640_mask;
  wire  ram_replay_if__T_640_en;
  reg  ram_pred_resp_btb_resp_valid [0:3];
  reg [31:0] _GEN_8;
  wire  ram_pred_resp_btb_resp_valid__T_742_data;
  wire [1:0] ram_pred_resp_btb_resp_valid__T_742_addr;
  wire  ram_pred_resp_btb_resp_valid__T_640_data;
  wire [1:0] ram_pred_resp_btb_resp_valid__T_640_addr;
  wire  ram_pred_resp_btb_resp_valid__T_640_mask;
  wire  ram_pred_resp_btb_resp_valid__T_640_en;
  reg  ram_pred_resp_btb_resp_taken [0:3];
  reg [31:0] _GEN_9;
  wire  ram_pred_resp_btb_resp_taken__T_742_data;
  wire [1:0] ram_pred_resp_btb_resp_taken__T_742_addr;
  wire  ram_pred_resp_btb_resp_taken__T_640_data;
  wire [1:0] ram_pred_resp_btb_resp_taken__T_640_addr;
  wire  ram_pred_resp_btb_resp_taken__T_640_mask;
  wire  ram_pred_resp_btb_resp_taken__T_640_en;
  reg [3:0] ram_pred_resp_btb_resp_mask [0:3];
  reg [31:0] _GEN_10;
  wire [3:0] ram_pred_resp_btb_resp_mask__T_742_data;
  wire [1:0] ram_pred_resp_btb_resp_mask__T_742_addr;
  wire [3:0] ram_pred_resp_btb_resp_mask__T_640_data;
  wire [1:0] ram_pred_resp_btb_resp_mask__T_640_addr;
  wire  ram_pred_resp_btb_resp_mask__T_640_mask;
  wire  ram_pred_resp_btb_resp_mask__T_640_en;
  reg [1:0] ram_pred_resp_btb_resp_bridx [0:3];
  reg [31:0] _GEN_11;
  wire [1:0] ram_pred_resp_btb_resp_bridx__T_742_data;
  wire [1:0] ram_pred_resp_btb_resp_bridx__T_742_addr;
  wire [1:0] ram_pred_resp_btb_resp_bridx__T_640_data;
  wire [1:0] ram_pred_resp_btb_resp_bridx__T_640_addr;
  wire  ram_pred_resp_btb_resp_bridx__T_640_mask;
  wire  ram_pred_resp_btb_resp_bridx__T_640_en;
  reg [38:0] ram_pred_resp_btb_resp_target [0:3];
  reg [63:0] _GEN_12;
  wire [38:0] ram_pred_resp_btb_resp_target__T_742_data;
  wire [1:0] ram_pred_resp_btb_resp_target__T_742_addr;
  wire [38:0] ram_pred_resp_btb_resp_target__T_640_data;
  wire [1:0] ram_pred_resp_btb_resp_target__T_640_addr;
  wire  ram_pred_resp_btb_resp_target__T_640_mask;
  wire  ram_pred_resp_btb_resp_target__T_640_en;
  reg [5:0] ram_pred_resp_btb_resp_entry [0:3];
  reg [31:0] _GEN_13;
  wire [5:0] ram_pred_resp_btb_resp_entry__T_742_data;
  wire [1:0] ram_pred_resp_btb_resp_entry__T_742_addr;
  wire [5:0] ram_pred_resp_btb_resp_entry__T_640_data;
  wire [1:0] ram_pred_resp_btb_resp_entry__T_640_addr;
  wire  ram_pred_resp_btb_resp_entry__T_640_mask;
  wire  ram_pred_resp_btb_resp_entry__T_640_en;
  reg [6:0] ram_pred_resp_btb_resp_bht_history [0:3];
  reg [31:0] _GEN_14;
  wire [6:0] ram_pred_resp_btb_resp_bht_history__T_742_data;
  wire [1:0] ram_pred_resp_btb_resp_bht_history__T_742_addr;
  wire [6:0] ram_pred_resp_btb_resp_bht_history__T_640_data;
  wire [1:0] ram_pred_resp_btb_resp_bht_history__T_640_addr;
  wire  ram_pred_resp_btb_resp_bht_history__T_640_mask;
  wire  ram_pred_resp_btb_resp_bht_history__T_640_en;
  reg [1:0] ram_pred_resp_btb_resp_bht_value [0:3];
  reg [31:0] _GEN_15;
  wire [1:0] ram_pred_resp_btb_resp_bht_value__T_742_data;
  wire [1:0] ram_pred_resp_btb_resp_bht_value__T_742_addr;
  wire [1:0] ram_pred_resp_btb_resp_bht_value__T_640_data;
  wire [1:0] ram_pred_resp_btb_resp_bht_value__T_640_addr;
  wire  ram_pred_resp_btb_resp_bht_value__T_640_mask;
  wire  ram_pred_resp_btb_resp_bht_value__T_640_en;
  reg [3:0] ram_pred_resp_bpd_resp_takens [0:3];
  reg [31:0] _GEN_16;
  wire [3:0] ram_pred_resp_bpd_resp_takens__T_742_data;
  wire [1:0] ram_pred_resp_bpd_resp_takens__T_742_addr;
  wire [3:0] ram_pred_resp_bpd_resp_takens__T_640_data;
  wire [1:0] ram_pred_resp_bpd_resp_takens__T_640_addr;
  wire  ram_pred_resp_bpd_resp_takens__T_640_mask;
  wire  ram_pred_resp_bpd_resp_takens__T_640_en;
  reg [10:0] ram_pred_resp_bpd_resp_history [0:3];
  reg [31:0] _GEN_17;
  wire [10:0] ram_pred_resp_bpd_resp_history__T_742_data;
  wire [1:0] ram_pred_resp_bpd_resp_history__T_742_addr;
  wire [10:0] ram_pred_resp_bpd_resp_history__T_640_data;
  wire [1:0] ram_pred_resp_bpd_resp_history__T_640_addr;
  wire  ram_pred_resp_bpd_resp_history__T_640_mask;
  wire  ram_pred_resp_bpd_resp_history__T_640_en;
  reg [10:0] ram_pred_resp_bpd_resp_history_u [0:3];
  reg [31:0] _GEN_18;
  wire [10:0] ram_pred_resp_bpd_resp_history_u__T_742_data;
  wire [1:0] ram_pred_resp_bpd_resp_history_u__T_742_addr;
  wire [10:0] ram_pred_resp_bpd_resp_history_u__T_640_data;
  wire [1:0] ram_pred_resp_bpd_resp_history_u__T_640_addr;
  wire  ram_pred_resp_bpd_resp_history_u__T_640_mask;
  wire  ram_pred_resp_bpd_resp_history_u__T_640_en;
  reg [8:0] ram_pred_resp_bpd_resp_history_ptr [0:3];
  reg [31:0] _GEN_19;
  wire [8:0] ram_pred_resp_bpd_resp_history_ptr__T_742_data;
  wire [1:0] ram_pred_resp_bpd_resp_history_ptr__T_742_addr;
  wire [8:0] ram_pred_resp_bpd_resp_history_ptr__T_640_data;
  wire [1:0] ram_pred_resp_bpd_resp_history_ptr__T_640_addr;
  wire  ram_pred_resp_bpd_resp_history_ptr__T_640_mask;
  wire  ram_pred_resp_bpd_resp_history_ptr__T_640_en;
  reg [10:0] ram_pred_resp_bpd_resp_info [0:3];
  reg [31:0] _GEN_20;
  wire [10:0] ram_pred_resp_bpd_resp_info__T_742_data;
  wire [1:0] ram_pred_resp_bpd_resp_info__T_742_addr;
  wire [10:0] ram_pred_resp_bpd_resp_info__T_640_data;
  wire [1:0] ram_pred_resp_bpd_resp_info__T_640_addr;
  wire  ram_pred_resp_bpd_resp_info__T_640_mask;
  wire  ram_pred_resp_bpd_resp_info__T_640_en;
  reg [3:0] ram_pred_resp_mask [0:3];
  reg [31:0] _GEN_21;
  wire [3:0] ram_pred_resp_mask__T_742_data;
  wire [1:0] ram_pred_resp_mask__T_742_addr;
  wire [3:0] ram_pred_resp_mask__T_640_data;
  wire [1:0] ram_pred_resp_mask__T_640_addr;
  wire  ram_pred_resp_mask__T_640_mask;
  wire  ram_pred_resp_mask__T_640_en;
  reg  ram_pred_resp_br_seen [0:3];
  reg [31:0] _GEN_22;
  wire  ram_pred_resp_br_seen__T_742_data;
  wire [1:0] ram_pred_resp_br_seen__T_742_addr;
  wire  ram_pred_resp_br_seen__T_640_data;
  wire [1:0] ram_pred_resp_br_seen__T_640_addr;
  wire  ram_pred_resp_br_seen__T_640_mask;
  wire  ram_pred_resp_br_seen__T_640_en;
  reg  ram_predictions_0_bpd_predict_val [0:3];
  reg [31:0] _GEN_23;
  wire  ram_predictions_0_bpd_predict_val__T_742_data;
  wire [1:0] ram_predictions_0_bpd_predict_val__T_742_addr;
  wire  ram_predictions_0_bpd_predict_val__T_640_data;
  wire [1:0] ram_predictions_0_bpd_predict_val__T_640_addr;
  wire  ram_predictions_0_bpd_predict_val__T_640_mask;
  wire  ram_predictions_0_bpd_predict_val__T_640_en;
  reg  ram_predictions_0_bpd_predict_taken [0:3];
  reg [31:0] _GEN_24;
  wire  ram_predictions_0_bpd_predict_taken__T_742_data;
  wire [1:0] ram_predictions_0_bpd_predict_taken__T_742_addr;
  wire  ram_predictions_0_bpd_predict_taken__T_640_data;
  wire [1:0] ram_predictions_0_bpd_predict_taken__T_640_addr;
  wire  ram_predictions_0_bpd_predict_taken__T_640_mask;
  wire  ram_predictions_0_bpd_predict_taken__T_640_en;
  reg  ram_predictions_0_btb_hit [0:3];
  reg [31:0] _GEN_25;
  wire  ram_predictions_0_btb_hit__T_742_data;
  wire [1:0] ram_predictions_0_btb_hit__T_742_addr;
  wire  ram_predictions_0_btb_hit__T_640_data;
  wire [1:0] ram_predictions_0_btb_hit__T_640_addr;
  wire  ram_predictions_0_btb_hit__T_640_mask;
  wire  ram_predictions_0_btb_hit__T_640_en;
  reg  ram_predictions_0_btb_predicted [0:3];
  reg [31:0] _GEN_26;
  wire  ram_predictions_0_btb_predicted__T_742_data;
  wire [1:0] ram_predictions_0_btb_predicted__T_742_addr;
  wire  ram_predictions_0_btb_predicted__T_640_data;
  wire [1:0] ram_predictions_0_btb_predicted__T_640_addr;
  wire  ram_predictions_0_btb_predicted__T_640_mask;
  wire  ram_predictions_0_btb_predicted__T_640_en;
  reg  ram_predictions_0_is_br_or_jalr [0:3];
  reg [31:0] _GEN_27;
  wire  ram_predictions_0_is_br_or_jalr__T_742_data;
  wire [1:0] ram_predictions_0_is_br_or_jalr__T_742_addr;
  wire  ram_predictions_0_is_br_or_jalr__T_640_data;
  wire [1:0] ram_predictions_0_is_br_or_jalr__T_640_addr;
  wire  ram_predictions_0_is_br_or_jalr__T_640_mask;
  wire  ram_predictions_0_is_br_or_jalr__T_640_en;
  reg  ram_predictions_1_bpd_predict_val [0:3];
  reg [31:0] _GEN_28;
  wire  ram_predictions_1_bpd_predict_val__T_742_data;
  wire [1:0] ram_predictions_1_bpd_predict_val__T_742_addr;
  wire  ram_predictions_1_bpd_predict_val__T_640_data;
  wire [1:0] ram_predictions_1_bpd_predict_val__T_640_addr;
  wire  ram_predictions_1_bpd_predict_val__T_640_mask;
  wire  ram_predictions_1_bpd_predict_val__T_640_en;
  reg  ram_predictions_1_bpd_predict_taken [0:3];
  reg [31:0] _GEN_29;
  wire  ram_predictions_1_bpd_predict_taken__T_742_data;
  wire [1:0] ram_predictions_1_bpd_predict_taken__T_742_addr;
  wire  ram_predictions_1_bpd_predict_taken__T_640_data;
  wire [1:0] ram_predictions_1_bpd_predict_taken__T_640_addr;
  wire  ram_predictions_1_bpd_predict_taken__T_640_mask;
  wire  ram_predictions_1_bpd_predict_taken__T_640_en;
  reg  ram_predictions_1_btb_hit [0:3];
  reg [31:0] _GEN_30;
  wire  ram_predictions_1_btb_hit__T_742_data;
  wire [1:0] ram_predictions_1_btb_hit__T_742_addr;
  wire  ram_predictions_1_btb_hit__T_640_data;
  wire [1:0] ram_predictions_1_btb_hit__T_640_addr;
  wire  ram_predictions_1_btb_hit__T_640_mask;
  wire  ram_predictions_1_btb_hit__T_640_en;
  reg  ram_predictions_1_btb_predicted [0:3];
  reg [31:0] _GEN_31;
  wire  ram_predictions_1_btb_predicted__T_742_data;
  wire [1:0] ram_predictions_1_btb_predicted__T_742_addr;
  wire  ram_predictions_1_btb_predicted__T_640_data;
  wire [1:0] ram_predictions_1_btb_predicted__T_640_addr;
  wire  ram_predictions_1_btb_predicted__T_640_mask;
  wire  ram_predictions_1_btb_predicted__T_640_en;
  reg  ram_predictions_1_is_br_or_jalr [0:3];
  reg [31:0] _GEN_32;
  wire  ram_predictions_1_is_br_or_jalr__T_742_data;
  wire [1:0] ram_predictions_1_is_br_or_jalr__T_742_addr;
  wire  ram_predictions_1_is_br_or_jalr__T_640_data;
  wire [1:0] ram_predictions_1_is_br_or_jalr__T_640_addr;
  wire  ram_predictions_1_is_br_or_jalr__T_640_mask;
  wire  ram_predictions_1_is_br_or_jalr__T_640_en;
  reg  ram_predictions_2_bpd_predict_val [0:3];
  reg [31:0] _GEN_33;
  wire  ram_predictions_2_bpd_predict_val__T_742_data;
  wire [1:0] ram_predictions_2_bpd_predict_val__T_742_addr;
  wire  ram_predictions_2_bpd_predict_val__T_640_data;
  wire [1:0] ram_predictions_2_bpd_predict_val__T_640_addr;
  wire  ram_predictions_2_bpd_predict_val__T_640_mask;
  wire  ram_predictions_2_bpd_predict_val__T_640_en;
  reg  ram_predictions_2_bpd_predict_taken [0:3];
  reg [31:0] _GEN_34;
  wire  ram_predictions_2_bpd_predict_taken__T_742_data;
  wire [1:0] ram_predictions_2_bpd_predict_taken__T_742_addr;
  wire  ram_predictions_2_bpd_predict_taken__T_640_data;
  wire [1:0] ram_predictions_2_bpd_predict_taken__T_640_addr;
  wire  ram_predictions_2_bpd_predict_taken__T_640_mask;
  wire  ram_predictions_2_bpd_predict_taken__T_640_en;
  reg  ram_predictions_2_btb_hit [0:3];
  reg [31:0] _GEN_35;
  wire  ram_predictions_2_btb_hit__T_742_data;
  wire [1:0] ram_predictions_2_btb_hit__T_742_addr;
  wire  ram_predictions_2_btb_hit__T_640_data;
  wire [1:0] ram_predictions_2_btb_hit__T_640_addr;
  wire  ram_predictions_2_btb_hit__T_640_mask;
  wire  ram_predictions_2_btb_hit__T_640_en;
  reg  ram_predictions_2_btb_predicted [0:3];
  reg [31:0] _GEN_36;
  wire  ram_predictions_2_btb_predicted__T_742_data;
  wire [1:0] ram_predictions_2_btb_predicted__T_742_addr;
  wire  ram_predictions_2_btb_predicted__T_640_data;
  wire [1:0] ram_predictions_2_btb_predicted__T_640_addr;
  wire  ram_predictions_2_btb_predicted__T_640_mask;
  wire  ram_predictions_2_btb_predicted__T_640_en;
  reg  ram_predictions_2_is_br_or_jalr [0:3];
  reg [31:0] _GEN_37;
  wire  ram_predictions_2_is_br_or_jalr__T_742_data;
  wire [1:0] ram_predictions_2_is_br_or_jalr__T_742_addr;
  wire  ram_predictions_2_is_br_or_jalr__T_640_data;
  wire [1:0] ram_predictions_2_is_br_or_jalr__T_640_addr;
  wire  ram_predictions_2_is_br_or_jalr__T_640_mask;
  wire  ram_predictions_2_is_br_or_jalr__T_640_en;
  reg  ram_predictions_3_bpd_predict_val [0:3];
  reg [31:0] _GEN_38;
  wire  ram_predictions_3_bpd_predict_val__T_742_data;
  wire [1:0] ram_predictions_3_bpd_predict_val__T_742_addr;
  wire  ram_predictions_3_bpd_predict_val__T_640_data;
  wire [1:0] ram_predictions_3_bpd_predict_val__T_640_addr;
  wire  ram_predictions_3_bpd_predict_val__T_640_mask;
  wire  ram_predictions_3_bpd_predict_val__T_640_en;
  reg  ram_predictions_3_bpd_predict_taken [0:3];
  reg [31:0] _GEN_39;
  wire  ram_predictions_3_bpd_predict_taken__T_742_data;
  wire [1:0] ram_predictions_3_bpd_predict_taken__T_742_addr;
  wire  ram_predictions_3_bpd_predict_taken__T_640_data;
  wire [1:0] ram_predictions_3_bpd_predict_taken__T_640_addr;
  wire  ram_predictions_3_bpd_predict_taken__T_640_mask;
  wire  ram_predictions_3_bpd_predict_taken__T_640_en;
  reg  ram_predictions_3_btb_hit [0:3];
  reg [31:0] _GEN_40;
  wire  ram_predictions_3_btb_hit__T_742_data;
  wire [1:0] ram_predictions_3_btb_hit__T_742_addr;
  wire  ram_predictions_3_btb_hit__T_640_data;
  wire [1:0] ram_predictions_3_btb_hit__T_640_addr;
  wire  ram_predictions_3_btb_hit__T_640_mask;
  wire  ram_predictions_3_btb_hit__T_640_en;
  reg  ram_predictions_3_btb_predicted [0:3];
  reg [31:0] _GEN_41;
  wire  ram_predictions_3_btb_predicted__T_742_data;
  wire [1:0] ram_predictions_3_btb_predicted__T_742_addr;
  wire  ram_predictions_3_btb_predicted__T_640_data;
  wire [1:0] ram_predictions_3_btb_predicted__T_640_addr;
  wire  ram_predictions_3_btb_predicted__T_640_mask;
  wire  ram_predictions_3_btb_predicted__T_640_en;
  reg  ram_predictions_3_is_br_or_jalr [0:3];
  reg [31:0] _GEN_42;
  wire  ram_predictions_3_is_br_or_jalr__T_742_data;
  wire [1:0] ram_predictions_3_is_br_or_jalr__T_742_addr;
  wire  ram_predictions_3_is_br_or_jalr__T_640_data;
  wire [1:0] ram_predictions_3_is_br_or_jalr__T_640_addr;
  wire  ram_predictions_3_is_br_or_jalr__T_640_mask;
  wire  ram_predictions_3_is_br_or_jalr__T_640_en;
  reg [31:0] ram_debug_events_0_fetch_seq [0:3];
  reg [31:0] _GEN_43;
  wire [31:0] ram_debug_events_0_fetch_seq__T_742_data;
  wire [1:0] ram_debug_events_0_fetch_seq__T_742_addr;
  wire [31:0] ram_debug_events_0_fetch_seq__T_640_data;
  wire [1:0] ram_debug_events_0_fetch_seq__T_640_addr;
  wire  ram_debug_events_0_fetch_seq__T_640_mask;
  wire  ram_debug_events_0_fetch_seq__T_640_en;
  reg [31:0] ram_debug_events_1_fetch_seq [0:3];
  reg [31:0] _GEN_44;
  wire [31:0] ram_debug_events_1_fetch_seq__T_742_data;
  wire [1:0] ram_debug_events_1_fetch_seq__T_742_addr;
  wire [31:0] ram_debug_events_1_fetch_seq__T_640_data;
  wire [1:0] ram_debug_events_1_fetch_seq__T_640_addr;
  wire  ram_debug_events_1_fetch_seq__T_640_mask;
  wire  ram_debug_events_1_fetch_seq__T_640_en;
  reg [31:0] ram_debug_events_2_fetch_seq [0:3];
  reg [31:0] _GEN_45;
  wire [31:0] ram_debug_events_2_fetch_seq__T_742_data;
  wire [1:0] ram_debug_events_2_fetch_seq__T_742_addr;
  wire [31:0] ram_debug_events_2_fetch_seq__T_640_data;
  wire [1:0] ram_debug_events_2_fetch_seq__T_640_addr;
  wire  ram_debug_events_2_fetch_seq__T_640_mask;
  wire  ram_debug_events_2_fetch_seq__T_640_en;
  reg [31:0] ram_debug_events_3_fetch_seq [0:3];
  reg [31:0] _GEN_46;
  wire [31:0] ram_debug_events_3_fetch_seq__T_742_data;
  wire [1:0] ram_debug_events_3_fetch_seq__T_742_addr;
  wire [31:0] ram_debug_events_3_fetch_seq__T_640_data;
  wire [1:0] ram_debug_events_3_fetch_seq__T_640_addr;
  wire  ram_debug_events_3_fetch_seq__T_640_mask;
  wire  ram_debug_events_3_fetch_seq__T_640_en;
  reg [1:0] _T_629;
  reg [31:0] _GEN_47;
  reg [1:0] _T_631;
  reg [31:0] _GEN_48;
  reg  maybe_full;
  reg [31:0] _GEN_49;
  wire  _T_633;
  wire  _T_635;
  wire  _T_636;
  wire  _T_637;
  wire  _T_638;
  wire  do_enq;
  wire  _T_639;
  wire  do_deq;
  wire [2:0] _T_730;
  wire [1:0] _T_731;
  wire [1:0] _GEN_50;
  wire [2:0] _T_735;
  wire [1:0] _T_736;
  wire [1:0] _GEN_51;
  wire  _T_737;
  wire  _GEN_52;
  wire  _T_739;
  wire  _T_741;
  wire [2:0] _T_829;
  wire [1:0] _T_830;
  wire  _T_831;
  wire [2:0] _T_832;
  assign io_enq_ready = _T_741;
  assign io_deq_valid = _T_739;
  assign io_deq_bits_pc = ram_pc__T_742_data;
  assign io_deq_bits_insts_0 = ram_insts_0__T_742_data;
  assign io_deq_bits_insts_1 = ram_insts_1__T_742_data;
  assign io_deq_bits_insts_2 = ram_insts_2__T_742_data;
  assign io_deq_bits_insts_3 = ram_insts_3__T_742_data;
  assign io_deq_bits_mask = ram_mask__T_742_data;
  assign io_deq_bits_xcpt_if = ram_xcpt_if__T_742_data;
  assign io_deq_bits_replay_if = ram_replay_if__T_742_data;
  assign io_deq_bits_pred_resp_btb_resp_valid = ram_pred_resp_btb_resp_valid__T_742_data;
  assign io_deq_bits_pred_resp_btb_resp_taken = ram_pred_resp_btb_resp_taken__T_742_data;
  assign io_deq_bits_pred_resp_btb_resp_mask = ram_pred_resp_btb_resp_mask__T_742_data;
  assign io_deq_bits_pred_resp_btb_resp_bridx = ram_pred_resp_btb_resp_bridx__T_742_data;
  assign io_deq_bits_pred_resp_btb_resp_target = ram_pred_resp_btb_resp_target__T_742_data;
  assign io_deq_bits_pred_resp_btb_resp_entry = ram_pred_resp_btb_resp_entry__T_742_data;
  assign io_deq_bits_pred_resp_btb_resp_bht_history = ram_pred_resp_btb_resp_bht_history__T_742_data;
  assign io_deq_bits_pred_resp_btb_resp_bht_value = ram_pred_resp_btb_resp_bht_value__T_742_data;
  assign io_deq_bits_pred_resp_bpd_resp_takens = ram_pred_resp_bpd_resp_takens__T_742_data;
  assign io_deq_bits_pred_resp_bpd_resp_history = ram_pred_resp_bpd_resp_history__T_742_data;
  assign io_deq_bits_pred_resp_bpd_resp_history_u = ram_pred_resp_bpd_resp_history_u__T_742_data;
  assign io_deq_bits_pred_resp_bpd_resp_history_ptr = ram_pred_resp_bpd_resp_history_ptr__T_742_data;
  assign io_deq_bits_pred_resp_bpd_resp_info = ram_pred_resp_bpd_resp_info__T_742_data;
  assign io_deq_bits_pred_resp_mask = ram_pred_resp_mask__T_742_data;
  assign io_deq_bits_pred_resp_br_seen = ram_pred_resp_br_seen__T_742_data;
  assign io_deq_bits_predictions_0_bpd_predict_val = ram_predictions_0_bpd_predict_val__T_742_data;
  assign io_deq_bits_predictions_0_bpd_predict_taken = ram_predictions_0_bpd_predict_taken__T_742_data;
  assign io_deq_bits_predictions_0_btb_hit = ram_predictions_0_btb_hit__T_742_data;
  assign io_deq_bits_predictions_0_btb_predicted = ram_predictions_0_btb_predicted__T_742_data;
  assign io_deq_bits_predictions_0_is_br_or_jalr = ram_predictions_0_is_br_or_jalr__T_742_data;
  assign io_deq_bits_predictions_1_bpd_predict_val = ram_predictions_1_bpd_predict_val__T_742_data;
  assign io_deq_bits_predictions_1_bpd_predict_taken = ram_predictions_1_bpd_predict_taken__T_742_data;
  assign io_deq_bits_predictions_1_btb_hit = ram_predictions_1_btb_hit__T_742_data;
  assign io_deq_bits_predictions_1_btb_predicted = ram_predictions_1_btb_predicted__T_742_data;
  assign io_deq_bits_predictions_1_is_br_or_jalr = ram_predictions_1_is_br_or_jalr__T_742_data;
  assign io_deq_bits_predictions_2_bpd_predict_val = ram_predictions_2_bpd_predict_val__T_742_data;
  assign io_deq_bits_predictions_2_bpd_predict_taken = ram_predictions_2_bpd_predict_taken__T_742_data;
  assign io_deq_bits_predictions_2_btb_hit = ram_predictions_2_btb_hit__T_742_data;
  assign io_deq_bits_predictions_2_btb_predicted = ram_predictions_2_btb_predicted__T_742_data;
  assign io_deq_bits_predictions_2_is_br_or_jalr = ram_predictions_2_is_br_or_jalr__T_742_data;
  assign io_deq_bits_predictions_3_bpd_predict_val = ram_predictions_3_bpd_predict_val__T_742_data;
  assign io_deq_bits_predictions_3_bpd_predict_taken = ram_predictions_3_bpd_predict_taken__T_742_data;
  assign io_deq_bits_predictions_3_btb_hit = ram_predictions_3_btb_hit__T_742_data;
  assign io_deq_bits_predictions_3_btb_predicted = ram_predictions_3_btb_predicted__T_742_data;
  assign io_deq_bits_predictions_3_is_br_or_jalr = ram_predictions_3_is_br_or_jalr__T_742_data;
  assign io_deq_bits_debug_events_0_fetch_seq = ram_debug_events_0_fetch_seq__T_742_data;
  assign io_deq_bits_debug_events_1_fetch_seq = ram_debug_events_1_fetch_seq__T_742_data;
  assign io_deq_bits_debug_events_2_fetch_seq = ram_debug_events_2_fetch_seq__T_742_data;
  assign io_deq_bits_debug_events_3_fetch_seq = ram_debug_events_3_fetch_seq__T_742_data;
  assign io_count = _T_832;
  assign ram_pc__T_742_addr = _T_631;
  assign ram_pc__T_742_data = ram_pc[ram_pc__T_742_addr];
  assign ram_pc__T_640_data = io_enq_bits_pc;
  assign ram_pc__T_640_addr = _T_629;
  assign ram_pc__T_640_mask = do_enq;
  assign ram_pc__T_640_en = do_enq;
  assign ram_insts_0__T_742_addr = _T_631;
  assign ram_insts_0__T_742_data = ram_insts_0[ram_insts_0__T_742_addr];
  assign ram_insts_0__T_640_data = io_enq_bits_insts_0;
  assign ram_insts_0__T_640_addr = _T_629;
  assign ram_insts_0__T_640_mask = do_enq;
  assign ram_insts_0__T_640_en = do_enq;
  assign ram_insts_1__T_742_addr = _T_631;
  assign ram_insts_1__T_742_data = ram_insts_1[ram_insts_1__T_742_addr];
  assign ram_insts_1__T_640_data = io_enq_bits_insts_1;
  assign ram_insts_1__T_640_addr = _T_629;
  assign ram_insts_1__T_640_mask = do_enq;
  assign ram_insts_1__T_640_en = do_enq;
  assign ram_insts_2__T_742_addr = _T_631;
  assign ram_insts_2__T_742_data = ram_insts_2[ram_insts_2__T_742_addr];
  assign ram_insts_2__T_640_data = io_enq_bits_insts_2;
  assign ram_insts_2__T_640_addr = _T_629;
  assign ram_insts_2__T_640_mask = do_enq;
  assign ram_insts_2__T_640_en = do_enq;
  assign ram_insts_3__T_742_addr = _T_631;
  assign ram_insts_3__T_742_data = ram_insts_3[ram_insts_3__T_742_addr];
  assign ram_insts_3__T_640_data = io_enq_bits_insts_3;
  assign ram_insts_3__T_640_addr = _T_629;
  assign ram_insts_3__T_640_mask = do_enq;
  assign ram_insts_3__T_640_en = do_enq;
  assign ram_mask__T_742_addr = _T_631;
  assign ram_mask__T_742_data = ram_mask[ram_mask__T_742_addr];
  assign ram_mask__T_640_data = io_enq_bits_mask;
  assign ram_mask__T_640_addr = _T_629;
  assign ram_mask__T_640_mask = do_enq;
  assign ram_mask__T_640_en = do_enq;
  assign ram_xcpt_if__T_742_addr = _T_631;
  assign ram_xcpt_if__T_742_data = ram_xcpt_if[ram_xcpt_if__T_742_addr];
  assign ram_xcpt_if__T_640_data = io_enq_bits_xcpt_if;
  assign ram_xcpt_if__T_640_addr = _T_629;
  assign ram_xcpt_if__T_640_mask = do_enq;
  assign ram_xcpt_if__T_640_en = do_enq;
  assign ram_replay_if__T_742_addr = _T_631;
  assign ram_replay_if__T_742_data = ram_replay_if[ram_replay_if__T_742_addr];
  assign ram_replay_if__T_640_data = io_enq_bits_replay_if;
  assign ram_replay_if__T_640_addr = _T_629;
  assign ram_replay_if__T_640_mask = do_enq;
  assign ram_replay_if__T_640_en = do_enq;
  assign ram_pred_resp_btb_resp_valid__T_742_addr = _T_631;
  assign ram_pred_resp_btb_resp_valid__T_742_data = ram_pred_resp_btb_resp_valid[ram_pred_resp_btb_resp_valid__T_742_addr];
  assign ram_pred_resp_btb_resp_valid__T_640_data = io_enq_bits_pred_resp_btb_resp_valid;
  assign ram_pred_resp_btb_resp_valid__T_640_addr = _T_629;
  assign ram_pred_resp_btb_resp_valid__T_640_mask = do_enq;
  assign ram_pred_resp_btb_resp_valid__T_640_en = do_enq;
  assign ram_pred_resp_btb_resp_taken__T_742_addr = _T_631;
  assign ram_pred_resp_btb_resp_taken__T_742_data = ram_pred_resp_btb_resp_taken[ram_pred_resp_btb_resp_taken__T_742_addr];
  assign ram_pred_resp_btb_resp_taken__T_640_data = io_enq_bits_pred_resp_btb_resp_taken;
  assign ram_pred_resp_btb_resp_taken__T_640_addr = _T_629;
  assign ram_pred_resp_btb_resp_taken__T_640_mask = do_enq;
  assign ram_pred_resp_btb_resp_taken__T_640_en = do_enq;
  assign ram_pred_resp_btb_resp_mask__T_742_addr = _T_631;
  assign ram_pred_resp_btb_resp_mask__T_742_data = ram_pred_resp_btb_resp_mask[ram_pred_resp_btb_resp_mask__T_742_addr];
  assign ram_pred_resp_btb_resp_mask__T_640_data = io_enq_bits_pred_resp_btb_resp_mask;
  assign ram_pred_resp_btb_resp_mask__T_640_addr = _T_629;
  assign ram_pred_resp_btb_resp_mask__T_640_mask = do_enq;
  assign ram_pred_resp_btb_resp_mask__T_640_en = do_enq;
  assign ram_pred_resp_btb_resp_bridx__T_742_addr = _T_631;
  assign ram_pred_resp_btb_resp_bridx__T_742_data = ram_pred_resp_btb_resp_bridx[ram_pred_resp_btb_resp_bridx__T_742_addr];
  assign ram_pred_resp_btb_resp_bridx__T_640_data = io_enq_bits_pred_resp_btb_resp_bridx;
  assign ram_pred_resp_btb_resp_bridx__T_640_addr = _T_629;
  assign ram_pred_resp_btb_resp_bridx__T_640_mask = do_enq;
  assign ram_pred_resp_btb_resp_bridx__T_640_en = do_enq;
  assign ram_pred_resp_btb_resp_target__T_742_addr = _T_631;
  assign ram_pred_resp_btb_resp_target__T_742_data = ram_pred_resp_btb_resp_target[ram_pred_resp_btb_resp_target__T_742_addr];
  assign ram_pred_resp_btb_resp_target__T_640_data = io_enq_bits_pred_resp_btb_resp_target;
  assign ram_pred_resp_btb_resp_target__T_640_addr = _T_629;
  assign ram_pred_resp_btb_resp_target__T_640_mask = do_enq;
  assign ram_pred_resp_btb_resp_target__T_640_en = do_enq;
  assign ram_pred_resp_btb_resp_entry__T_742_addr = _T_631;
  assign ram_pred_resp_btb_resp_entry__T_742_data = ram_pred_resp_btb_resp_entry[ram_pred_resp_btb_resp_entry__T_742_addr];
  assign ram_pred_resp_btb_resp_entry__T_640_data = io_enq_bits_pred_resp_btb_resp_entry;
  assign ram_pred_resp_btb_resp_entry__T_640_addr = _T_629;
  assign ram_pred_resp_btb_resp_entry__T_640_mask = do_enq;
  assign ram_pred_resp_btb_resp_entry__T_640_en = do_enq;
  assign ram_pred_resp_btb_resp_bht_history__T_742_addr = _T_631;
  assign ram_pred_resp_btb_resp_bht_history__T_742_data = ram_pred_resp_btb_resp_bht_history[ram_pred_resp_btb_resp_bht_history__T_742_addr];
  assign ram_pred_resp_btb_resp_bht_history__T_640_data = io_enq_bits_pred_resp_btb_resp_bht_history;
  assign ram_pred_resp_btb_resp_bht_history__T_640_addr = _T_629;
  assign ram_pred_resp_btb_resp_bht_history__T_640_mask = do_enq;
  assign ram_pred_resp_btb_resp_bht_history__T_640_en = do_enq;
  assign ram_pred_resp_btb_resp_bht_value__T_742_addr = _T_631;
  assign ram_pred_resp_btb_resp_bht_value__T_742_data = ram_pred_resp_btb_resp_bht_value[ram_pred_resp_btb_resp_bht_value__T_742_addr];
  assign ram_pred_resp_btb_resp_bht_value__T_640_data = io_enq_bits_pred_resp_btb_resp_bht_value;
  assign ram_pred_resp_btb_resp_bht_value__T_640_addr = _T_629;
  assign ram_pred_resp_btb_resp_bht_value__T_640_mask = do_enq;
  assign ram_pred_resp_btb_resp_bht_value__T_640_en = do_enq;
  assign ram_pred_resp_bpd_resp_takens__T_742_addr = _T_631;
  assign ram_pred_resp_bpd_resp_takens__T_742_data = ram_pred_resp_bpd_resp_takens[ram_pred_resp_bpd_resp_takens__T_742_addr];
  assign ram_pred_resp_bpd_resp_takens__T_640_data = io_enq_bits_pred_resp_bpd_resp_takens;
  assign ram_pred_resp_bpd_resp_takens__T_640_addr = _T_629;
  assign ram_pred_resp_bpd_resp_takens__T_640_mask = do_enq;
  assign ram_pred_resp_bpd_resp_takens__T_640_en = do_enq;
  assign ram_pred_resp_bpd_resp_history__T_742_addr = _T_631;
  assign ram_pred_resp_bpd_resp_history__T_742_data = ram_pred_resp_bpd_resp_history[ram_pred_resp_bpd_resp_history__T_742_addr];
  assign ram_pred_resp_bpd_resp_history__T_640_data = io_enq_bits_pred_resp_bpd_resp_history;
  assign ram_pred_resp_bpd_resp_history__T_640_addr = _T_629;
  assign ram_pred_resp_bpd_resp_history__T_640_mask = do_enq;
  assign ram_pred_resp_bpd_resp_history__T_640_en = do_enq;
  assign ram_pred_resp_bpd_resp_history_u__T_742_addr = _T_631;
  assign ram_pred_resp_bpd_resp_history_u__T_742_data = ram_pred_resp_bpd_resp_history_u[ram_pred_resp_bpd_resp_history_u__T_742_addr];
  assign ram_pred_resp_bpd_resp_history_u__T_640_data = io_enq_bits_pred_resp_bpd_resp_history_u;
  assign ram_pred_resp_bpd_resp_history_u__T_640_addr = _T_629;
  assign ram_pred_resp_bpd_resp_history_u__T_640_mask = do_enq;
  assign ram_pred_resp_bpd_resp_history_u__T_640_en = do_enq;
  assign ram_pred_resp_bpd_resp_history_ptr__T_742_addr = _T_631;
  assign ram_pred_resp_bpd_resp_history_ptr__T_742_data = ram_pred_resp_bpd_resp_history_ptr[ram_pred_resp_bpd_resp_history_ptr__T_742_addr];
  assign ram_pred_resp_bpd_resp_history_ptr__T_640_data = io_enq_bits_pred_resp_bpd_resp_history_ptr;
  assign ram_pred_resp_bpd_resp_history_ptr__T_640_addr = _T_629;
  assign ram_pred_resp_bpd_resp_history_ptr__T_640_mask = do_enq;
  assign ram_pred_resp_bpd_resp_history_ptr__T_640_en = do_enq;
  assign ram_pred_resp_bpd_resp_info__T_742_addr = _T_631;
  assign ram_pred_resp_bpd_resp_info__T_742_data = ram_pred_resp_bpd_resp_info[ram_pred_resp_bpd_resp_info__T_742_addr];
  assign ram_pred_resp_bpd_resp_info__T_640_data = io_enq_bits_pred_resp_bpd_resp_info;
  assign ram_pred_resp_bpd_resp_info__T_640_addr = _T_629;
  assign ram_pred_resp_bpd_resp_info__T_640_mask = do_enq;
  assign ram_pred_resp_bpd_resp_info__T_640_en = do_enq;
  assign ram_pred_resp_mask__T_742_addr = _T_631;
  assign ram_pred_resp_mask__T_742_data = ram_pred_resp_mask[ram_pred_resp_mask__T_742_addr];
  assign ram_pred_resp_mask__T_640_data = io_enq_bits_pred_resp_mask;
  assign ram_pred_resp_mask__T_640_addr = _T_629;
  assign ram_pred_resp_mask__T_640_mask = do_enq;
  assign ram_pred_resp_mask__T_640_en = do_enq;
  assign ram_pred_resp_br_seen__T_742_addr = _T_631;
  assign ram_pred_resp_br_seen__T_742_data = ram_pred_resp_br_seen[ram_pred_resp_br_seen__T_742_addr];
  assign ram_pred_resp_br_seen__T_640_data = io_enq_bits_pred_resp_br_seen;
  assign ram_pred_resp_br_seen__T_640_addr = _T_629;
  assign ram_pred_resp_br_seen__T_640_mask = do_enq;
  assign ram_pred_resp_br_seen__T_640_en = do_enq;
  assign ram_predictions_0_bpd_predict_val__T_742_addr = _T_631;
  assign ram_predictions_0_bpd_predict_val__T_742_data = ram_predictions_0_bpd_predict_val[ram_predictions_0_bpd_predict_val__T_742_addr];
  assign ram_predictions_0_bpd_predict_val__T_640_data = io_enq_bits_predictions_0_bpd_predict_val;
  assign ram_predictions_0_bpd_predict_val__T_640_addr = _T_629;
  assign ram_predictions_0_bpd_predict_val__T_640_mask = do_enq;
  assign ram_predictions_0_bpd_predict_val__T_640_en = do_enq;
  assign ram_predictions_0_bpd_predict_taken__T_742_addr = _T_631;
  assign ram_predictions_0_bpd_predict_taken__T_742_data = ram_predictions_0_bpd_predict_taken[ram_predictions_0_bpd_predict_taken__T_742_addr];
  assign ram_predictions_0_bpd_predict_taken__T_640_data = io_enq_bits_predictions_0_bpd_predict_taken;
  assign ram_predictions_0_bpd_predict_taken__T_640_addr = _T_629;
  assign ram_predictions_0_bpd_predict_taken__T_640_mask = do_enq;
  assign ram_predictions_0_bpd_predict_taken__T_640_en = do_enq;
  assign ram_predictions_0_btb_hit__T_742_addr = _T_631;
  assign ram_predictions_0_btb_hit__T_742_data = ram_predictions_0_btb_hit[ram_predictions_0_btb_hit__T_742_addr];
  assign ram_predictions_0_btb_hit__T_640_data = io_enq_bits_predictions_0_btb_hit;
  assign ram_predictions_0_btb_hit__T_640_addr = _T_629;
  assign ram_predictions_0_btb_hit__T_640_mask = do_enq;
  assign ram_predictions_0_btb_hit__T_640_en = do_enq;
  assign ram_predictions_0_btb_predicted__T_742_addr = _T_631;
  assign ram_predictions_0_btb_predicted__T_742_data = ram_predictions_0_btb_predicted[ram_predictions_0_btb_predicted__T_742_addr];
  assign ram_predictions_0_btb_predicted__T_640_data = io_enq_bits_predictions_0_btb_predicted;
  assign ram_predictions_0_btb_predicted__T_640_addr = _T_629;
  assign ram_predictions_0_btb_predicted__T_640_mask = do_enq;
  assign ram_predictions_0_btb_predicted__T_640_en = do_enq;
  assign ram_predictions_0_is_br_or_jalr__T_742_addr = _T_631;
  assign ram_predictions_0_is_br_or_jalr__T_742_data = ram_predictions_0_is_br_or_jalr[ram_predictions_0_is_br_or_jalr__T_742_addr];
  assign ram_predictions_0_is_br_or_jalr__T_640_data = io_enq_bits_predictions_0_is_br_or_jalr;
  assign ram_predictions_0_is_br_or_jalr__T_640_addr = _T_629;
  assign ram_predictions_0_is_br_or_jalr__T_640_mask = do_enq;
  assign ram_predictions_0_is_br_or_jalr__T_640_en = do_enq;
  assign ram_predictions_1_bpd_predict_val__T_742_addr = _T_631;
  assign ram_predictions_1_bpd_predict_val__T_742_data = ram_predictions_1_bpd_predict_val[ram_predictions_1_bpd_predict_val__T_742_addr];
  assign ram_predictions_1_bpd_predict_val__T_640_data = io_enq_bits_predictions_1_bpd_predict_val;
  assign ram_predictions_1_bpd_predict_val__T_640_addr = _T_629;
  assign ram_predictions_1_bpd_predict_val__T_640_mask = do_enq;
  assign ram_predictions_1_bpd_predict_val__T_640_en = do_enq;
  assign ram_predictions_1_bpd_predict_taken__T_742_addr = _T_631;
  assign ram_predictions_1_bpd_predict_taken__T_742_data = ram_predictions_1_bpd_predict_taken[ram_predictions_1_bpd_predict_taken__T_742_addr];
  assign ram_predictions_1_bpd_predict_taken__T_640_data = io_enq_bits_predictions_1_bpd_predict_taken;
  assign ram_predictions_1_bpd_predict_taken__T_640_addr = _T_629;
  assign ram_predictions_1_bpd_predict_taken__T_640_mask = do_enq;
  assign ram_predictions_1_bpd_predict_taken__T_640_en = do_enq;
  assign ram_predictions_1_btb_hit__T_742_addr = _T_631;
  assign ram_predictions_1_btb_hit__T_742_data = ram_predictions_1_btb_hit[ram_predictions_1_btb_hit__T_742_addr];
  assign ram_predictions_1_btb_hit__T_640_data = io_enq_bits_predictions_1_btb_hit;
  assign ram_predictions_1_btb_hit__T_640_addr = _T_629;
  assign ram_predictions_1_btb_hit__T_640_mask = do_enq;
  assign ram_predictions_1_btb_hit__T_640_en = do_enq;
  assign ram_predictions_1_btb_predicted__T_742_addr = _T_631;
  assign ram_predictions_1_btb_predicted__T_742_data = ram_predictions_1_btb_predicted[ram_predictions_1_btb_predicted__T_742_addr];
  assign ram_predictions_1_btb_predicted__T_640_data = io_enq_bits_predictions_1_btb_predicted;
  assign ram_predictions_1_btb_predicted__T_640_addr = _T_629;
  assign ram_predictions_1_btb_predicted__T_640_mask = do_enq;
  assign ram_predictions_1_btb_predicted__T_640_en = do_enq;
  assign ram_predictions_1_is_br_or_jalr__T_742_addr = _T_631;
  assign ram_predictions_1_is_br_or_jalr__T_742_data = ram_predictions_1_is_br_or_jalr[ram_predictions_1_is_br_or_jalr__T_742_addr];
  assign ram_predictions_1_is_br_or_jalr__T_640_data = io_enq_bits_predictions_1_is_br_or_jalr;
  assign ram_predictions_1_is_br_or_jalr__T_640_addr = _T_629;
  assign ram_predictions_1_is_br_or_jalr__T_640_mask = do_enq;
  assign ram_predictions_1_is_br_or_jalr__T_640_en = do_enq;
  assign ram_predictions_2_bpd_predict_val__T_742_addr = _T_631;
  assign ram_predictions_2_bpd_predict_val__T_742_data = ram_predictions_2_bpd_predict_val[ram_predictions_2_bpd_predict_val__T_742_addr];
  assign ram_predictions_2_bpd_predict_val__T_640_data = io_enq_bits_predictions_2_bpd_predict_val;
  assign ram_predictions_2_bpd_predict_val__T_640_addr = _T_629;
  assign ram_predictions_2_bpd_predict_val__T_640_mask = do_enq;
  assign ram_predictions_2_bpd_predict_val__T_640_en = do_enq;
  assign ram_predictions_2_bpd_predict_taken__T_742_addr = _T_631;
  assign ram_predictions_2_bpd_predict_taken__T_742_data = ram_predictions_2_bpd_predict_taken[ram_predictions_2_bpd_predict_taken__T_742_addr];
  assign ram_predictions_2_bpd_predict_taken__T_640_data = io_enq_bits_predictions_2_bpd_predict_taken;
  assign ram_predictions_2_bpd_predict_taken__T_640_addr = _T_629;
  assign ram_predictions_2_bpd_predict_taken__T_640_mask = do_enq;
  assign ram_predictions_2_bpd_predict_taken__T_640_en = do_enq;
  assign ram_predictions_2_btb_hit__T_742_addr = _T_631;
  assign ram_predictions_2_btb_hit__T_742_data = ram_predictions_2_btb_hit[ram_predictions_2_btb_hit__T_742_addr];
  assign ram_predictions_2_btb_hit__T_640_data = io_enq_bits_predictions_2_btb_hit;
  assign ram_predictions_2_btb_hit__T_640_addr = _T_629;
  assign ram_predictions_2_btb_hit__T_640_mask = do_enq;
  assign ram_predictions_2_btb_hit__T_640_en = do_enq;
  assign ram_predictions_2_btb_predicted__T_742_addr = _T_631;
  assign ram_predictions_2_btb_predicted__T_742_data = ram_predictions_2_btb_predicted[ram_predictions_2_btb_predicted__T_742_addr];
  assign ram_predictions_2_btb_predicted__T_640_data = io_enq_bits_predictions_2_btb_predicted;
  assign ram_predictions_2_btb_predicted__T_640_addr = _T_629;
  assign ram_predictions_2_btb_predicted__T_640_mask = do_enq;
  assign ram_predictions_2_btb_predicted__T_640_en = do_enq;
  assign ram_predictions_2_is_br_or_jalr__T_742_addr = _T_631;
  assign ram_predictions_2_is_br_or_jalr__T_742_data = ram_predictions_2_is_br_or_jalr[ram_predictions_2_is_br_or_jalr__T_742_addr];
  assign ram_predictions_2_is_br_or_jalr__T_640_data = io_enq_bits_predictions_2_is_br_or_jalr;
  assign ram_predictions_2_is_br_or_jalr__T_640_addr = _T_629;
  assign ram_predictions_2_is_br_or_jalr__T_640_mask = do_enq;
  assign ram_predictions_2_is_br_or_jalr__T_640_en = do_enq;
  assign ram_predictions_3_bpd_predict_val__T_742_addr = _T_631;
  assign ram_predictions_3_bpd_predict_val__T_742_data = ram_predictions_3_bpd_predict_val[ram_predictions_3_bpd_predict_val__T_742_addr];
  assign ram_predictions_3_bpd_predict_val__T_640_data = io_enq_bits_predictions_3_bpd_predict_val;
  assign ram_predictions_3_bpd_predict_val__T_640_addr = _T_629;
  assign ram_predictions_3_bpd_predict_val__T_640_mask = do_enq;
  assign ram_predictions_3_bpd_predict_val__T_640_en = do_enq;
  assign ram_predictions_3_bpd_predict_taken__T_742_addr = _T_631;
  assign ram_predictions_3_bpd_predict_taken__T_742_data = ram_predictions_3_bpd_predict_taken[ram_predictions_3_bpd_predict_taken__T_742_addr];
  assign ram_predictions_3_bpd_predict_taken__T_640_data = io_enq_bits_predictions_3_bpd_predict_taken;
  assign ram_predictions_3_bpd_predict_taken__T_640_addr = _T_629;
  assign ram_predictions_3_bpd_predict_taken__T_640_mask = do_enq;
  assign ram_predictions_3_bpd_predict_taken__T_640_en = do_enq;
  assign ram_predictions_3_btb_hit__T_742_addr = _T_631;
  assign ram_predictions_3_btb_hit__T_742_data = ram_predictions_3_btb_hit[ram_predictions_3_btb_hit__T_742_addr];
  assign ram_predictions_3_btb_hit__T_640_data = io_enq_bits_predictions_3_btb_hit;
  assign ram_predictions_3_btb_hit__T_640_addr = _T_629;
  assign ram_predictions_3_btb_hit__T_640_mask = do_enq;
  assign ram_predictions_3_btb_hit__T_640_en = do_enq;
  assign ram_predictions_3_btb_predicted__T_742_addr = _T_631;
  assign ram_predictions_3_btb_predicted__T_742_data = ram_predictions_3_btb_predicted[ram_predictions_3_btb_predicted__T_742_addr];
  assign ram_predictions_3_btb_predicted__T_640_data = io_enq_bits_predictions_3_btb_predicted;
  assign ram_predictions_3_btb_predicted__T_640_addr = _T_629;
  assign ram_predictions_3_btb_predicted__T_640_mask = do_enq;
  assign ram_predictions_3_btb_predicted__T_640_en = do_enq;
  assign ram_predictions_3_is_br_or_jalr__T_742_addr = _T_631;
  assign ram_predictions_3_is_br_or_jalr__T_742_data = ram_predictions_3_is_br_or_jalr[ram_predictions_3_is_br_or_jalr__T_742_addr];
  assign ram_predictions_3_is_br_or_jalr__T_640_data = io_enq_bits_predictions_3_is_br_or_jalr;
  assign ram_predictions_3_is_br_or_jalr__T_640_addr = _T_629;
  assign ram_predictions_3_is_br_or_jalr__T_640_mask = do_enq;
  assign ram_predictions_3_is_br_or_jalr__T_640_en = do_enq;
  assign ram_debug_events_0_fetch_seq__T_742_addr = _T_631;
  assign ram_debug_events_0_fetch_seq__T_742_data = ram_debug_events_0_fetch_seq[ram_debug_events_0_fetch_seq__T_742_addr];
  assign ram_debug_events_0_fetch_seq__T_640_data = io_enq_bits_debug_events_0_fetch_seq;
  assign ram_debug_events_0_fetch_seq__T_640_addr = _T_629;
  assign ram_debug_events_0_fetch_seq__T_640_mask = do_enq;
  assign ram_debug_events_0_fetch_seq__T_640_en = do_enq;
  assign ram_debug_events_1_fetch_seq__T_742_addr = _T_631;
  assign ram_debug_events_1_fetch_seq__T_742_data = ram_debug_events_1_fetch_seq[ram_debug_events_1_fetch_seq__T_742_addr];
  assign ram_debug_events_1_fetch_seq__T_640_data = io_enq_bits_debug_events_1_fetch_seq;
  assign ram_debug_events_1_fetch_seq__T_640_addr = _T_629;
  assign ram_debug_events_1_fetch_seq__T_640_mask = do_enq;
  assign ram_debug_events_1_fetch_seq__T_640_en = do_enq;
  assign ram_debug_events_2_fetch_seq__T_742_addr = _T_631;
  assign ram_debug_events_2_fetch_seq__T_742_data = ram_debug_events_2_fetch_seq[ram_debug_events_2_fetch_seq__T_742_addr];
  assign ram_debug_events_2_fetch_seq__T_640_data = io_enq_bits_debug_events_2_fetch_seq;
  assign ram_debug_events_2_fetch_seq__T_640_addr = _T_629;
  assign ram_debug_events_2_fetch_seq__T_640_mask = do_enq;
  assign ram_debug_events_2_fetch_seq__T_640_en = do_enq;
  assign ram_debug_events_3_fetch_seq__T_742_addr = _T_631;
  assign ram_debug_events_3_fetch_seq__T_742_data = ram_debug_events_3_fetch_seq[ram_debug_events_3_fetch_seq__T_742_addr];
  assign ram_debug_events_3_fetch_seq__T_640_data = io_enq_bits_debug_events_3_fetch_seq;
  assign ram_debug_events_3_fetch_seq__T_640_addr = _T_629;
  assign ram_debug_events_3_fetch_seq__T_640_mask = do_enq;
  assign ram_debug_events_3_fetch_seq__T_640_en = do_enq;
  assign _T_633 = _T_629 == _T_631;
  assign _T_635 = maybe_full == 1'h0;
  assign _T_636 = _T_633 & _T_635;
  assign _T_637 = _T_633 & maybe_full;
  assign _T_638 = io_enq_ready & io_enq_valid;
  assign do_enq = _T_638;
  assign _T_639 = io_deq_ready & io_deq_valid;
  assign do_deq = _T_639;
  assign _T_730 = _T_629 + 2'h1;
  assign _T_731 = _T_730[1:0];
  assign _GEN_50 = do_enq ? _T_731 : _T_629;
  assign _T_735 = _T_631 + 2'h1;
  assign _T_736 = _T_735[1:0];
  assign _GEN_51 = do_deq ? _T_736 : _T_631;
  assign _T_737 = do_enq != do_deq;
  assign _GEN_52 = _T_737 ? do_enq : maybe_full;
  assign _T_739 = _T_636 == 1'h0;
  assign _T_741 = _T_637 == 1'h0;
  assign _T_829 = _T_629 - _T_631;
  assign _T_830 = _T_829[1:0];
  assign _T_831 = maybe_full & _T_633;
  assign _T_832 = {_T_831,_T_830};
`ifdef RANDOMIZE
  integer initvar;
  initial begin
    `ifndef verilator
      #0.002 begin end
    `endif
  _GEN_0 = {2{$random}};
  `ifdef RANDOMIZE_MEM_INIT
  for (initvar = 0; initvar < 4; initvar = initvar+1)
    ram_pc[initvar] = _GEN_0[39:0];
  `endif
  _GEN_1 = {1{$random}};
  `ifdef RANDOMIZE_MEM_INIT
  for (initvar = 0; initvar < 4; initvar = initvar+1)
    ram_insts_0[initvar] = _GEN_1[31:0];
  `endif
  _GEN_2 = {1{$random}};
  `ifdef RANDOMIZE_MEM_INIT
  for (initvar = 0; initvar < 4; initvar = initvar+1)
    ram_insts_1[initvar] = _GEN_2[31:0];
  `endif
  _GEN_3 = {1{$random}};
  `ifdef RANDOMIZE_MEM_INIT
  for (initvar = 0; initvar < 4; initvar = initvar+1)
    ram_insts_2[initvar] = _GEN_3[31:0];
  `endif
  _GEN_4 = {1{$random}};
  `ifdef RANDOMIZE_MEM_INIT
  for (initvar = 0; initvar < 4; initvar = initvar+1)
    ram_insts_3[initvar] = _GEN_4[31:0];
  `endif
  _GEN_5 = {1{$random}};
  `ifdef RANDOMIZE_MEM_INIT
  for (initvar = 0; initvar < 4; initvar = initvar+1)
    ram_mask[initvar] = _GEN_5[3:0];
  `endif
  _GEN_6 = {1{$random}};
  `ifdef RANDOMIZE_MEM_INIT
  for (initvar = 0; initvar < 4; initvar = initvar+1)
    ram_xcpt_if[initvar] = _GEN_6[0:0];
  `endif
  _GEN_7 = {1{$random}};
  `ifdef RANDOMIZE_MEM_INIT
  for (initvar = 0; initvar < 4; initvar = initvar+1)
    ram_replay_if[initvar] = _GEN_7[0:0];
  `endif
  _GEN_8 = {1{$random}};
  `ifdef RANDOMIZE_MEM_INIT
  for (initvar = 0; initvar < 4; initvar = initvar+1)
    ram_pred_resp_btb_resp_valid[initvar] = _GEN_8[0:0];
  `endif
  _GEN_9 = {1{$random}};
  `ifdef RANDOMIZE_MEM_INIT
  for (initvar = 0; initvar < 4; initvar = initvar+1)
    ram_pred_resp_btb_resp_taken[initvar] = _GEN_9[0:0];
  `endif
  _GEN_10 = {1{$random}};
  `ifdef RANDOMIZE_MEM_INIT
  for (initvar = 0; initvar < 4; initvar = initvar+1)
    ram_pred_resp_btb_resp_mask[initvar] = _GEN_10[3:0];
  `endif
  _GEN_11 = {1{$random}};
  `ifdef RANDOMIZE_MEM_INIT
  for (initvar = 0; initvar < 4; initvar = initvar+1)
    ram_pred_resp_btb_resp_bridx[initvar] = _GEN_11[1:0];
  `endif
  _GEN_12 = {2{$random}};
  `ifdef RANDOMIZE_MEM_INIT
  for (initvar = 0; initvar < 4; initvar = initvar+1)
    ram_pred_resp_btb_resp_target[initvar] = _GEN_12[38:0];
  `endif
  _GEN_13 = {1{$random}};
  `ifdef RANDOMIZE_MEM_INIT
  for (initvar = 0; initvar < 4; initvar = initvar+1)
    ram_pred_resp_btb_resp_entry[initvar] = _GEN_13[5:0];
  `endif
  _GEN_14 = {1{$random}};
  `ifdef RANDOMIZE_MEM_INIT
  for (initvar = 0; initvar < 4; initvar = initvar+1)
    ram_pred_resp_btb_resp_bht_history[initvar] = _GEN_14[6:0];
  `endif
  _GEN_15 = {1{$random}};
  `ifdef RANDOMIZE_MEM_INIT
  for (initvar = 0; initvar < 4; initvar = initvar+1)
    ram_pred_resp_btb_resp_bht_value[initvar] = _GEN_15[1:0];
  `endif
  _GEN_16 = {1{$random}};
  `ifdef RANDOMIZE_MEM_INIT
  for (initvar = 0; initvar < 4; initvar = initvar+1)
    ram_pred_resp_bpd_resp_takens[initvar] = _GEN_16[3:0];
  `endif
  _GEN_17 = {1{$random}};
  `ifdef RANDOMIZE_MEM_INIT
  for (initvar = 0; initvar < 4; initvar = initvar+1)
    ram_pred_resp_bpd_resp_history[initvar] = _GEN_17[10:0];
  `endif
  _GEN_18 = {1{$random}};
  `ifdef RANDOMIZE_MEM_INIT
  for (initvar = 0; initvar < 4; initvar = initvar+1)
    ram_pred_resp_bpd_resp_history_u[initvar] = _GEN_18[10:0];
  `endif
  _GEN_19 = {1{$random}};
  `ifdef RANDOMIZE_MEM_INIT
  for (initvar = 0; initvar < 4; initvar = initvar+1)
    ram_pred_resp_bpd_resp_history_ptr[initvar] = _GEN_19[8:0];
  `endif
  _GEN_20 = {1{$random}};
  `ifdef RANDOMIZE_MEM_INIT
  for (initvar = 0; initvar < 4; initvar = initvar+1)
    ram_pred_resp_bpd_resp_info[initvar] = _GEN_20[10:0];
  `endif
  _GEN_21 = {1{$random}};
  `ifdef RANDOMIZE_MEM_INIT
  for (initvar = 0; initvar < 4; initvar = initvar+1)
    ram_pred_resp_mask[initvar] = _GEN_21[3:0];
  `endif
  _GEN_22 = {1{$random}};
  `ifdef RANDOMIZE_MEM_INIT
  for (initvar = 0; initvar < 4; initvar = initvar+1)
    ram_pred_resp_br_seen[initvar] = _GEN_22[0:0];
  `endif
  _GEN_23 = {1{$random}};
  `ifdef RANDOMIZE_MEM_INIT
  for (initvar = 0; initvar < 4; initvar = initvar+1)
    ram_predictions_0_bpd_predict_val[initvar] = _GEN_23[0:0];
  `endif
  _GEN_24 = {1{$random}};
  `ifdef RANDOMIZE_MEM_INIT
  for (initvar = 0; initvar < 4; initvar = initvar+1)
    ram_predictions_0_bpd_predict_taken[initvar] = _GEN_24[0:0];
  `endif
  _GEN_25 = {1{$random}};
  `ifdef RANDOMIZE_MEM_INIT
  for (initvar = 0; initvar < 4; initvar = initvar+1)
    ram_predictions_0_btb_hit[initvar] = _GEN_25[0:0];
  `endif
  _GEN_26 = {1{$random}};
  `ifdef RANDOMIZE_MEM_INIT
  for (initvar = 0; initvar < 4; initvar = initvar+1)
    ram_predictions_0_btb_predicted[initvar] = _GEN_26[0:0];
  `endif
  _GEN_27 = {1{$random}};
  `ifdef RANDOMIZE_MEM_INIT
  for (initvar = 0; initvar < 4; initvar = initvar+1)
    ram_predictions_0_is_br_or_jalr[initvar] = _GEN_27[0:0];
  `endif
  _GEN_28 = {1{$random}};
  `ifdef RANDOMIZE_MEM_INIT
  for (initvar = 0; initvar < 4; initvar = initvar+1)
    ram_predictions_1_bpd_predict_val[initvar] = _GEN_28[0:0];
  `endif
  _GEN_29 = {1{$random}};
  `ifdef RANDOMIZE_MEM_INIT
  for (initvar = 0; initvar < 4; initvar = initvar+1)
    ram_predictions_1_bpd_predict_taken[initvar] = _GEN_29[0:0];
  `endif
  _GEN_30 = {1{$random}};
  `ifdef RANDOMIZE_MEM_INIT
  for (initvar = 0; initvar < 4; initvar = initvar+1)
    ram_predictions_1_btb_hit[initvar] = _GEN_30[0:0];
  `endif
  _GEN_31 = {1{$random}};
  `ifdef RANDOMIZE_MEM_INIT
  for (initvar = 0; initvar < 4; initvar = initvar+1)
    ram_predictions_1_btb_predicted[initvar] = _GEN_31[0:0];
  `endif
  _GEN_32 = {1{$random}};
  `ifdef RANDOMIZE_MEM_INIT
  for (initvar = 0; initvar < 4; initvar = initvar+1)
    ram_predictions_1_is_br_or_jalr[initvar] = _GEN_32[0:0];
  `endif
  _GEN_33 = {1{$random}};
  `ifdef RANDOMIZE_MEM_INIT
  for (initvar = 0; initvar < 4; initvar = initvar+1)
    ram_predictions_2_bpd_predict_val[initvar] = _GEN_33[0:0];
  `endif
  _GEN_34 = {1{$random}};
  `ifdef RANDOMIZE_MEM_INIT
  for (initvar = 0; initvar < 4; initvar = initvar+1)
    ram_predictions_2_bpd_predict_taken[initvar] = _GEN_34[0:0];
  `endif
  _GEN_35 = {1{$random}};
  `ifdef RANDOMIZE_MEM_INIT
  for (initvar = 0; initvar < 4; initvar = initvar+1)
    ram_predictions_2_btb_hit[initvar] = _GEN_35[0:0];
  `endif
  _GEN_36 = {1{$random}};
  `ifdef RANDOMIZE_MEM_INIT
  for (initvar = 0; initvar < 4; initvar = initvar+1)
    ram_predictions_2_btb_predicted[initvar] = _GEN_36[0:0];
  `endif
  _GEN_37 = {1{$random}};
  `ifdef RANDOMIZE_MEM_INIT
  for (initvar = 0; initvar < 4; initvar = initvar+1)
    ram_predictions_2_is_br_or_jalr[initvar] = _GEN_37[0:0];
  `endif
  _GEN_38 = {1{$random}};
  `ifdef RANDOMIZE_MEM_INIT
  for (initvar = 0; initvar < 4; initvar = initvar+1)
    ram_predictions_3_bpd_predict_val[initvar] = _GEN_38[0:0];
  `endif
  _GEN_39 = {1{$random}};
  `ifdef RANDOMIZE_MEM_INIT
  for (initvar = 0; initvar < 4; initvar = initvar+1)
    ram_predictions_3_bpd_predict_taken[initvar] = _GEN_39[0:0];
  `endif
  _GEN_40 = {1{$random}};
  `ifdef RANDOMIZE_MEM_INIT
  for (initvar = 0; initvar < 4; initvar = initvar+1)
    ram_predictions_3_btb_hit[initvar] = _GEN_40[0:0];
  `endif
  _GEN_41 = {1{$random}};
  `ifdef RANDOMIZE_MEM_INIT
  for (initvar = 0; initvar < 4; initvar = initvar+1)
    ram_predictions_3_btb_predicted[initvar] = _GEN_41[0:0];
  `endif
  _GEN_42 = {1{$random}};
  `ifdef RANDOMIZE_MEM_INIT
  for (initvar = 0; initvar < 4; initvar = initvar+1)
    ram_predictions_3_is_br_or_jalr[initvar] = _GEN_42[0:0];
  `endif
  _GEN_43 = {1{$random}};
  `ifdef RANDOMIZE_MEM_INIT
  for (initvar = 0; initvar < 4; initvar = initvar+1)
    ram_debug_events_0_fetch_seq[initvar] = _GEN_43[31:0];
  `endif
  _GEN_44 = {1{$random}};
  `ifdef RANDOMIZE_MEM_INIT
  for (initvar = 0; initvar < 4; initvar = initvar+1)
    ram_debug_events_1_fetch_seq[initvar] = _GEN_44[31:0];
  `endif
  _GEN_45 = {1{$random}};
  `ifdef RANDOMIZE_MEM_INIT
  for (initvar = 0; initvar < 4; initvar = initvar+1)
    ram_debug_events_2_fetch_seq[initvar] = _GEN_45[31:0];
  `endif
  _GEN_46 = {1{$random}};
  `ifdef RANDOMIZE_MEM_INIT
  for (initvar = 0; initvar < 4; initvar = initvar+1)
    ram_debug_events_3_fetch_seq[initvar] = _GEN_46[31:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_47 = {1{$random}};
  _T_629 = _GEN_47[1:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_48 = {1{$random}};
  _T_631 = _GEN_48[1:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_49 = {1{$random}};
  maybe_full = _GEN_49[0:0];
  `endif
  end
`endif
  always @(posedge clock) begin
    if(ram_pc__T_640_en & ram_pc__T_640_mask) begin
      ram_pc[ram_pc__T_640_addr] <= ram_pc__T_640_data;
    end
    if(ram_insts_0__T_640_en & ram_insts_0__T_640_mask) begin
      ram_insts_0[ram_insts_0__T_640_addr] <= ram_insts_0__T_640_data;
    end
    if(ram_insts_1__T_640_en & ram_insts_1__T_640_mask) begin
      ram_insts_1[ram_insts_1__T_640_addr] <= ram_insts_1__T_640_data;
    end
    if(ram_insts_2__T_640_en & ram_insts_2__T_640_mask) begin
      ram_insts_2[ram_insts_2__T_640_addr] <= ram_insts_2__T_640_data;
    end
    if(ram_insts_3__T_640_en & ram_insts_3__T_640_mask) begin
      ram_insts_3[ram_insts_3__T_640_addr] <= ram_insts_3__T_640_data;
    end
    if(ram_mask__T_640_en & ram_mask__T_640_mask) begin
      ram_mask[ram_mask__T_640_addr] <= ram_mask__T_640_data;
    end
    if(ram_xcpt_if__T_640_en & ram_xcpt_if__T_640_mask) begin
      ram_xcpt_if[ram_xcpt_if__T_640_addr] <= ram_xcpt_if__T_640_data;
    end
    if(ram_replay_if__T_640_en & ram_replay_if__T_640_mask) begin
      ram_replay_if[ram_replay_if__T_640_addr] <= ram_replay_if__T_640_data;
    end
    if(ram_pred_resp_btb_resp_valid__T_640_en & ram_pred_resp_btb_resp_valid__T_640_mask) begin
      ram_pred_resp_btb_resp_valid[ram_pred_resp_btb_resp_valid__T_640_addr] <= ram_pred_resp_btb_resp_valid__T_640_data;
    end
    if(ram_pred_resp_btb_resp_taken__T_640_en & ram_pred_resp_btb_resp_taken__T_640_mask) begin
      ram_pred_resp_btb_resp_taken[ram_pred_resp_btb_resp_taken__T_640_addr] <= ram_pred_resp_btb_resp_taken__T_640_data;
    end
    if(ram_pred_resp_btb_resp_mask__T_640_en & ram_pred_resp_btb_resp_mask__T_640_mask) begin
      ram_pred_resp_btb_resp_mask[ram_pred_resp_btb_resp_mask__T_640_addr] <= ram_pred_resp_btb_resp_mask__T_640_data;
    end
    if(ram_pred_resp_btb_resp_bridx__T_640_en & ram_pred_resp_btb_resp_bridx__T_640_mask) begin
      ram_pred_resp_btb_resp_bridx[ram_pred_resp_btb_resp_bridx__T_640_addr] <= ram_pred_resp_btb_resp_bridx__T_640_data;
    end
    if(ram_pred_resp_btb_resp_target__T_640_en & ram_pred_resp_btb_resp_target__T_640_mask) begin
      ram_pred_resp_btb_resp_target[ram_pred_resp_btb_resp_target__T_640_addr] <= ram_pred_resp_btb_resp_target__T_640_data;
    end
    if(ram_pred_resp_btb_resp_entry__T_640_en & ram_pred_resp_btb_resp_entry__T_640_mask) begin
      ram_pred_resp_btb_resp_entry[ram_pred_resp_btb_resp_entry__T_640_addr] <= ram_pred_resp_btb_resp_entry__T_640_data;
    end
    if(ram_pred_resp_btb_resp_bht_history__T_640_en & ram_pred_resp_btb_resp_bht_history__T_640_mask) begin
      ram_pred_resp_btb_resp_bht_history[ram_pred_resp_btb_resp_bht_history__T_640_addr] <= ram_pred_resp_btb_resp_bht_history__T_640_data;
    end
    if(ram_pred_resp_btb_resp_bht_value__T_640_en & ram_pred_resp_btb_resp_bht_value__T_640_mask) begin
      ram_pred_resp_btb_resp_bht_value[ram_pred_resp_btb_resp_bht_value__T_640_addr] <= ram_pred_resp_btb_resp_bht_value__T_640_data;
    end
    if(ram_pred_resp_bpd_resp_takens__T_640_en & ram_pred_resp_bpd_resp_takens__T_640_mask) begin
      ram_pred_resp_bpd_resp_takens[ram_pred_resp_bpd_resp_takens__T_640_addr] <= ram_pred_resp_bpd_resp_takens__T_640_data;
    end
    if(ram_pred_resp_bpd_resp_history__T_640_en & ram_pred_resp_bpd_resp_history__T_640_mask) begin
      ram_pred_resp_bpd_resp_history[ram_pred_resp_bpd_resp_history__T_640_addr] <= ram_pred_resp_bpd_resp_history__T_640_data;
    end
    if(ram_pred_resp_bpd_resp_history_u__T_640_en & ram_pred_resp_bpd_resp_history_u__T_640_mask) begin
      ram_pred_resp_bpd_resp_history_u[ram_pred_resp_bpd_resp_history_u__T_640_addr] <= ram_pred_resp_bpd_resp_history_u__T_640_data;
    end
    if(ram_pred_resp_bpd_resp_history_ptr__T_640_en & ram_pred_resp_bpd_resp_history_ptr__T_640_mask) begin
      ram_pred_resp_bpd_resp_history_ptr[ram_pred_resp_bpd_resp_history_ptr__T_640_addr] <= ram_pred_resp_bpd_resp_history_ptr__T_640_data;
    end
    if(ram_pred_resp_bpd_resp_info__T_640_en & ram_pred_resp_bpd_resp_info__T_640_mask) begin
      ram_pred_resp_bpd_resp_info[ram_pred_resp_bpd_resp_info__T_640_addr] <= ram_pred_resp_bpd_resp_info__T_640_data;
    end
    if(ram_pred_resp_mask__T_640_en & ram_pred_resp_mask__T_640_mask) begin
      ram_pred_resp_mask[ram_pred_resp_mask__T_640_addr] <= ram_pred_resp_mask__T_640_data;
    end
    if(ram_pred_resp_br_seen__T_640_en & ram_pred_resp_br_seen__T_640_mask) begin
      ram_pred_resp_br_seen[ram_pred_resp_br_seen__T_640_addr] <= ram_pred_resp_br_seen__T_640_data;
    end
    if(ram_predictions_0_bpd_predict_val__T_640_en & ram_predictions_0_bpd_predict_val__T_640_mask) begin
      ram_predictions_0_bpd_predict_val[ram_predictions_0_bpd_predict_val__T_640_addr] <= ram_predictions_0_bpd_predict_val__T_640_data;
    end
    if(ram_predictions_0_bpd_predict_taken__T_640_en & ram_predictions_0_bpd_predict_taken__T_640_mask) begin
      ram_predictions_0_bpd_predict_taken[ram_predictions_0_bpd_predict_taken__T_640_addr] <= ram_predictions_0_bpd_predict_taken__T_640_data;
    end
    if(ram_predictions_0_btb_hit__T_640_en & ram_predictions_0_btb_hit__T_640_mask) begin
      ram_predictions_0_btb_hit[ram_predictions_0_btb_hit__T_640_addr] <= ram_predictions_0_btb_hit__T_640_data;
    end
    if(ram_predictions_0_btb_predicted__T_640_en & ram_predictions_0_btb_predicted__T_640_mask) begin
      ram_predictions_0_btb_predicted[ram_predictions_0_btb_predicted__T_640_addr] <= ram_predictions_0_btb_predicted__T_640_data;
    end
    if(ram_predictions_0_is_br_or_jalr__T_640_en & ram_predictions_0_is_br_or_jalr__T_640_mask) begin
      ram_predictions_0_is_br_or_jalr[ram_predictions_0_is_br_or_jalr__T_640_addr] <= ram_predictions_0_is_br_or_jalr__T_640_data;
    end
    if(ram_predictions_1_bpd_predict_val__T_640_en & ram_predictions_1_bpd_predict_val__T_640_mask) begin
      ram_predictions_1_bpd_predict_val[ram_predictions_1_bpd_predict_val__T_640_addr] <= ram_predictions_1_bpd_predict_val__T_640_data;
    end
    if(ram_predictions_1_bpd_predict_taken__T_640_en & ram_predictions_1_bpd_predict_taken__T_640_mask) begin
      ram_predictions_1_bpd_predict_taken[ram_predictions_1_bpd_predict_taken__T_640_addr] <= ram_predictions_1_bpd_predict_taken__T_640_data;
    end
    if(ram_predictions_1_btb_hit__T_640_en & ram_predictions_1_btb_hit__T_640_mask) begin
      ram_predictions_1_btb_hit[ram_predictions_1_btb_hit__T_640_addr] <= ram_predictions_1_btb_hit__T_640_data;
    end
    if(ram_predictions_1_btb_predicted__T_640_en & ram_predictions_1_btb_predicted__T_640_mask) begin
      ram_predictions_1_btb_predicted[ram_predictions_1_btb_predicted__T_640_addr] <= ram_predictions_1_btb_predicted__T_640_data;
    end
    if(ram_predictions_1_is_br_or_jalr__T_640_en & ram_predictions_1_is_br_or_jalr__T_640_mask) begin
      ram_predictions_1_is_br_or_jalr[ram_predictions_1_is_br_or_jalr__T_640_addr] <= ram_predictions_1_is_br_or_jalr__T_640_data;
    end
    if(ram_predictions_2_bpd_predict_val__T_640_en & ram_predictions_2_bpd_predict_val__T_640_mask) begin
      ram_predictions_2_bpd_predict_val[ram_predictions_2_bpd_predict_val__T_640_addr] <= ram_predictions_2_bpd_predict_val__T_640_data;
    end
    if(ram_predictions_2_bpd_predict_taken__T_640_en & ram_predictions_2_bpd_predict_taken__T_640_mask) begin
      ram_predictions_2_bpd_predict_taken[ram_predictions_2_bpd_predict_taken__T_640_addr] <= ram_predictions_2_bpd_predict_taken__T_640_data;
    end
    if(ram_predictions_2_btb_hit__T_640_en & ram_predictions_2_btb_hit__T_640_mask) begin
      ram_predictions_2_btb_hit[ram_predictions_2_btb_hit__T_640_addr] <= ram_predictions_2_btb_hit__T_640_data;
    end
    if(ram_predictions_2_btb_predicted__T_640_en & ram_predictions_2_btb_predicted__T_640_mask) begin
      ram_predictions_2_btb_predicted[ram_predictions_2_btb_predicted__T_640_addr] <= ram_predictions_2_btb_predicted__T_640_data;
    end
    if(ram_predictions_2_is_br_or_jalr__T_640_en & ram_predictions_2_is_br_or_jalr__T_640_mask) begin
      ram_predictions_2_is_br_or_jalr[ram_predictions_2_is_br_or_jalr__T_640_addr] <= ram_predictions_2_is_br_or_jalr__T_640_data;
    end
    if(ram_predictions_3_bpd_predict_val__T_640_en & ram_predictions_3_bpd_predict_val__T_640_mask) begin
      ram_predictions_3_bpd_predict_val[ram_predictions_3_bpd_predict_val__T_640_addr] <= ram_predictions_3_bpd_predict_val__T_640_data;
    end
    if(ram_predictions_3_bpd_predict_taken__T_640_en & ram_predictions_3_bpd_predict_taken__T_640_mask) begin
      ram_predictions_3_bpd_predict_taken[ram_predictions_3_bpd_predict_taken__T_640_addr] <= ram_predictions_3_bpd_predict_taken__T_640_data;
    end
    if(ram_predictions_3_btb_hit__T_640_en & ram_predictions_3_btb_hit__T_640_mask) begin
      ram_predictions_3_btb_hit[ram_predictions_3_btb_hit__T_640_addr] <= ram_predictions_3_btb_hit__T_640_data;
    end
    if(ram_predictions_3_btb_predicted__T_640_en & ram_predictions_3_btb_predicted__T_640_mask) begin
      ram_predictions_3_btb_predicted[ram_predictions_3_btb_predicted__T_640_addr] <= ram_predictions_3_btb_predicted__T_640_data;
    end
    if(ram_predictions_3_is_br_or_jalr__T_640_en & ram_predictions_3_is_br_or_jalr__T_640_mask) begin
      ram_predictions_3_is_br_or_jalr[ram_predictions_3_is_br_or_jalr__T_640_addr] <= ram_predictions_3_is_br_or_jalr__T_640_data;
    end
    if(ram_debug_events_0_fetch_seq__T_640_en & ram_debug_events_0_fetch_seq__T_640_mask) begin
      ram_debug_events_0_fetch_seq[ram_debug_events_0_fetch_seq__T_640_addr] <= ram_debug_events_0_fetch_seq__T_640_data;
    end
    if(ram_debug_events_1_fetch_seq__T_640_en & ram_debug_events_1_fetch_seq__T_640_mask) begin
      ram_debug_events_1_fetch_seq[ram_debug_events_1_fetch_seq__T_640_addr] <= ram_debug_events_1_fetch_seq__T_640_data;
    end
    if(ram_debug_events_2_fetch_seq__T_640_en & ram_debug_events_2_fetch_seq__T_640_mask) begin
      ram_debug_events_2_fetch_seq[ram_debug_events_2_fetch_seq__T_640_addr] <= ram_debug_events_2_fetch_seq__T_640_data;
    end
    if(ram_debug_events_3_fetch_seq__T_640_en & ram_debug_events_3_fetch_seq__T_640_mask) begin
      ram_debug_events_3_fetch_seq[ram_debug_events_3_fetch_seq__T_640_addr] <= ram_debug_events_3_fetch_seq__T_640_data;
    end
    if (reset) begin
      _T_629 <= 2'h0;
    end else begin
      if (do_enq) begin
        _T_629 <= _T_731;
      end
    end
    if (reset) begin
      _T_631 <= 2'h0;
    end else begin
      if (do_deq) begin
        _T_631 <= _T_736;
      end
    end
    if (reset) begin
      maybe_full <= 1'h0;
    end else begin
      if (_T_737) begin
        maybe_full <= do_enq;
      end
    end
  end
endmodule