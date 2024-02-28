module FetchSerializerNtoM(
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
  output  io_deq_bits_uops_0_valid,
  output [1:0] io_deq_bits_uops_0_iw_state,
  output [8:0] io_deq_bits_uops_0_uopc,
  output [31:0] io_deq_bits_uops_0_inst,
  output [39:0] io_deq_bits_uops_0_pc,
  output [7:0] io_deq_bits_uops_0_fu_code,
  output [3:0] io_deq_bits_uops_0_ctrl_br_type,
  output [1:0] io_deq_bits_uops_0_ctrl_op1_sel,
  output [2:0] io_deq_bits_uops_0_ctrl_op2_sel,
  output [2:0] io_deq_bits_uops_0_ctrl_imm_sel,
  output [3:0] io_deq_bits_uops_0_ctrl_op_fcn,
  output  io_deq_bits_uops_0_ctrl_fcn_dw,
  output  io_deq_bits_uops_0_ctrl_rf_wen,
  output [2:0] io_deq_bits_uops_0_ctrl_csr_cmd,
  output  io_deq_bits_uops_0_ctrl_is_load,
  output  io_deq_bits_uops_0_ctrl_is_sta,
  output  io_deq_bits_uops_0_ctrl_is_std,
  output [1:0] io_deq_bits_uops_0_wakeup_delay,
  output  io_deq_bits_uops_0_allocate_brtag,
  output  io_deq_bits_uops_0_is_br_or_jmp,
  output  io_deq_bits_uops_0_is_jump,
  output  io_deq_bits_uops_0_is_jal,
  output  io_deq_bits_uops_0_is_ret,
  output  io_deq_bits_uops_0_is_call,
  output [7:0] io_deq_bits_uops_0_br_mask,
  output [2:0] io_deq_bits_uops_0_br_tag,
  output  io_deq_bits_uops_0_br_prediction_bpd_predict_val,
  output  io_deq_bits_uops_0_br_prediction_bpd_predict_taken,
  output  io_deq_bits_uops_0_br_prediction_btb_hit,
  output  io_deq_bits_uops_0_br_prediction_btb_predicted,
  output  io_deq_bits_uops_0_br_prediction_is_br_or_jalr,
  output  io_deq_bits_uops_0_stat_brjmp_mispredicted,
  output  io_deq_bits_uops_0_stat_btb_made_pred,
  output  io_deq_bits_uops_0_stat_btb_mispredicted,
  output  io_deq_bits_uops_0_stat_bpd_made_pred,
  output  io_deq_bits_uops_0_stat_bpd_mispredicted,
  output [3:0] io_deq_bits_uops_0_fetch_pc_lob,
  output [19:0] io_deq_bits_uops_0_imm_packed,
  output [11:0] io_deq_bits_uops_0_csr_addr,
  output [6:0] io_deq_bits_uops_0_rob_idx,
  output [4:0] io_deq_bits_uops_0_ldq_idx,
  output [4:0] io_deq_bits_uops_0_stq_idx,
  output [4:0] io_deq_bits_uops_0_brob_idx,
  output [6:0] io_deq_bits_uops_0_pdst,
  output [6:0] io_deq_bits_uops_0_pop1,
  output [6:0] io_deq_bits_uops_0_pop2,
  output [6:0] io_deq_bits_uops_0_pop3,
  output  io_deq_bits_uops_0_prs1_busy,
  output  io_deq_bits_uops_0_prs2_busy,
  output  io_deq_bits_uops_0_prs3_busy,
  output [6:0] io_deq_bits_uops_0_stale_pdst,
  output  io_deq_bits_uops_0_exception,
  output [63:0] io_deq_bits_uops_0_exc_cause,
  output  io_deq_bits_uops_0_bypassable,
  output [3:0] io_deq_bits_uops_0_mem_cmd,
  output [2:0] io_deq_bits_uops_0_mem_typ,
  output  io_deq_bits_uops_0_is_fence,
  output  io_deq_bits_uops_0_is_fencei,
  output  io_deq_bits_uops_0_is_store,
  output  io_deq_bits_uops_0_is_amo,
  output  io_deq_bits_uops_0_is_load,
  output  io_deq_bits_uops_0_is_unique,
  output  io_deq_bits_uops_0_flush_on_commit,
  output [5:0] io_deq_bits_uops_0_ldst,
  output [5:0] io_deq_bits_uops_0_lrs1,
  output [5:0] io_deq_bits_uops_0_lrs2,
  output [5:0] io_deq_bits_uops_0_lrs3,
  output  io_deq_bits_uops_0_ldst_val,
  output [1:0] io_deq_bits_uops_0_dst_rtype,
  output [1:0] io_deq_bits_uops_0_lrs1_rtype,
  output [1:0] io_deq_bits_uops_0_lrs2_rtype,
  output  io_deq_bits_uops_0_frs3_en,
  output  io_deq_bits_uops_0_fp_val,
  output  io_deq_bits_uops_0_fp_single,
  output  io_deq_bits_uops_0_xcpt_if,
  output  io_deq_bits_uops_0_replay_if,
  output [63:0] io_deq_bits_uops_0_debug_wdata,
  output [31:0] io_deq_bits_uops_0_debug_events_fetch_seq,
  output  io_deq_bits_uops_1_valid,
  output [1:0] io_deq_bits_uops_1_iw_state,
  output [8:0] io_deq_bits_uops_1_uopc,
  output [31:0] io_deq_bits_uops_1_inst,
  output [39:0] io_deq_bits_uops_1_pc,
  output [7:0] io_deq_bits_uops_1_fu_code,
  output [3:0] io_deq_bits_uops_1_ctrl_br_type,
  output [1:0] io_deq_bits_uops_1_ctrl_op1_sel,
  output [2:0] io_deq_bits_uops_1_ctrl_op2_sel,
  output [2:0] io_deq_bits_uops_1_ctrl_imm_sel,
  output [3:0] io_deq_bits_uops_1_ctrl_op_fcn,
  output  io_deq_bits_uops_1_ctrl_fcn_dw,
  output  io_deq_bits_uops_1_ctrl_rf_wen,
  output [2:0] io_deq_bits_uops_1_ctrl_csr_cmd,
  output  io_deq_bits_uops_1_ctrl_is_load,
  output  io_deq_bits_uops_1_ctrl_is_sta,
  output  io_deq_bits_uops_1_ctrl_is_std,
  output [1:0] io_deq_bits_uops_1_wakeup_delay,
  output  io_deq_bits_uops_1_allocate_brtag,
  output  io_deq_bits_uops_1_is_br_or_jmp,
  output  io_deq_bits_uops_1_is_jump,
  output  io_deq_bits_uops_1_is_jal,
  output  io_deq_bits_uops_1_is_ret,
  output  io_deq_bits_uops_1_is_call,
  output [7:0] io_deq_bits_uops_1_br_mask,
  output [2:0] io_deq_bits_uops_1_br_tag,
  output  io_deq_bits_uops_1_br_prediction_bpd_predict_val,
  output  io_deq_bits_uops_1_br_prediction_bpd_predict_taken,
  output  io_deq_bits_uops_1_br_prediction_btb_hit,
  output  io_deq_bits_uops_1_br_prediction_btb_predicted,
  output  io_deq_bits_uops_1_br_prediction_is_br_or_jalr,
  output  io_deq_bits_uops_1_stat_brjmp_mispredicted,
  output  io_deq_bits_uops_1_stat_btb_made_pred,
  output  io_deq_bits_uops_1_stat_btb_mispredicted,
  output  io_deq_bits_uops_1_stat_bpd_made_pred,
  output  io_deq_bits_uops_1_stat_bpd_mispredicted,
  output [3:0] io_deq_bits_uops_1_fetch_pc_lob,
  output [19:0] io_deq_bits_uops_1_imm_packed,
  output [11:0] io_deq_bits_uops_1_csr_addr,
  output [6:0] io_deq_bits_uops_1_rob_idx,
  output [4:0] io_deq_bits_uops_1_ldq_idx,
  output [4:0] io_deq_bits_uops_1_stq_idx,
  output [4:0] io_deq_bits_uops_1_brob_idx,
  output [6:0] io_deq_bits_uops_1_pdst,
  output [6:0] io_deq_bits_uops_1_pop1,
  output [6:0] io_deq_bits_uops_1_pop2,
  output [6:0] io_deq_bits_uops_1_pop3,
  output  io_deq_bits_uops_1_prs1_busy,
  output  io_deq_bits_uops_1_prs2_busy,
  output  io_deq_bits_uops_1_prs3_busy,
  output [6:0] io_deq_bits_uops_1_stale_pdst,
  output  io_deq_bits_uops_1_exception,
  output [63:0] io_deq_bits_uops_1_exc_cause,
  output  io_deq_bits_uops_1_bypassable,
  output [3:0] io_deq_bits_uops_1_mem_cmd,
  output [2:0] io_deq_bits_uops_1_mem_typ,
  output  io_deq_bits_uops_1_is_fence,
  output  io_deq_bits_uops_1_is_fencei,
  output  io_deq_bits_uops_1_is_store,
  output  io_deq_bits_uops_1_is_amo,
  output  io_deq_bits_uops_1_is_load,
  output  io_deq_bits_uops_1_is_unique,
  output  io_deq_bits_uops_1_flush_on_commit,
  output [5:0] io_deq_bits_uops_1_ldst,
  output [5:0] io_deq_bits_uops_1_lrs1,
  output [5:0] io_deq_bits_uops_1_lrs2,
  output [5:0] io_deq_bits_uops_1_lrs3,
  output  io_deq_bits_uops_1_ldst_val,
  output [1:0] io_deq_bits_uops_1_dst_rtype,
  output [1:0] io_deq_bits_uops_1_lrs1_rtype,
  output [1:0] io_deq_bits_uops_1_lrs2_rtype,
  output  io_deq_bits_uops_1_frs3_en,
  output  io_deq_bits_uops_1_fp_val,
  output  io_deq_bits_uops_1_fp_single,
  output  io_deq_bits_uops_1_xcpt_if,
  output  io_deq_bits_uops_1_replay_if,
  output [63:0] io_deq_bits_uops_1_debug_wdata,
  output [31:0] io_deq_bits_uops_1_debug_events_fetch_seq,
  output  io_deq_bits_uops_2_valid,
  output [1:0] io_deq_bits_uops_2_iw_state,
  output [8:0] io_deq_bits_uops_2_uopc,
  output [31:0] io_deq_bits_uops_2_inst,
  output [39:0] io_deq_bits_uops_2_pc,
  output [7:0] io_deq_bits_uops_2_fu_code,
  output [3:0] io_deq_bits_uops_2_ctrl_br_type,
  output [1:0] io_deq_bits_uops_2_ctrl_op1_sel,
  output [2:0] io_deq_bits_uops_2_ctrl_op2_sel,
  output [2:0] io_deq_bits_uops_2_ctrl_imm_sel,
  output [3:0] io_deq_bits_uops_2_ctrl_op_fcn,
  output  io_deq_bits_uops_2_ctrl_fcn_dw,
  output  io_deq_bits_uops_2_ctrl_rf_wen,
  output [2:0] io_deq_bits_uops_2_ctrl_csr_cmd,
  output  io_deq_bits_uops_2_ctrl_is_load,
  output  io_deq_bits_uops_2_ctrl_is_sta,
  output  io_deq_bits_uops_2_ctrl_is_std,
  output [1:0] io_deq_bits_uops_2_wakeup_delay,
  output  io_deq_bits_uops_2_allocate_brtag,
  output  io_deq_bits_uops_2_is_br_or_jmp,
  output  io_deq_bits_uops_2_is_jump,
  output  io_deq_bits_uops_2_is_jal,
  output  io_deq_bits_uops_2_is_ret,
  output  io_deq_bits_uops_2_is_call,
  output [7:0] io_deq_bits_uops_2_br_mask,
  output [2:0] io_deq_bits_uops_2_br_tag,
  output  io_deq_bits_uops_2_br_prediction_bpd_predict_val,
  output  io_deq_bits_uops_2_br_prediction_bpd_predict_taken,
  output  io_deq_bits_uops_2_br_prediction_btb_hit,
  output  io_deq_bits_uops_2_br_prediction_btb_predicted,
  output  io_deq_bits_uops_2_br_prediction_is_br_or_jalr,
  output  io_deq_bits_uops_2_stat_brjmp_mispredicted,
  output  io_deq_bits_uops_2_stat_btb_made_pred,
  output  io_deq_bits_uops_2_stat_btb_mispredicted,
  output  io_deq_bits_uops_2_stat_bpd_made_pred,
  output  io_deq_bits_uops_2_stat_bpd_mispredicted,
  output [3:0] io_deq_bits_uops_2_fetch_pc_lob,
  output [19:0] io_deq_bits_uops_2_imm_packed,
  output [11:0] io_deq_bits_uops_2_csr_addr,
  output [6:0] io_deq_bits_uops_2_rob_idx,
  output [4:0] io_deq_bits_uops_2_ldq_idx,
  output [4:0] io_deq_bits_uops_2_stq_idx,
  output [4:0] io_deq_bits_uops_2_brob_idx,
  output [6:0] io_deq_bits_uops_2_pdst,
  output [6:0] io_deq_bits_uops_2_pop1,
  output [6:0] io_deq_bits_uops_2_pop2,
  output [6:0] io_deq_bits_uops_2_pop3,
  output  io_deq_bits_uops_2_prs1_busy,
  output  io_deq_bits_uops_2_prs2_busy,
  output  io_deq_bits_uops_2_prs3_busy,
  output [6:0] io_deq_bits_uops_2_stale_pdst,
  output  io_deq_bits_uops_2_exception,
  output [63:0] io_deq_bits_uops_2_exc_cause,
  output  io_deq_bits_uops_2_bypassable,
  output [3:0] io_deq_bits_uops_2_mem_cmd,
  output [2:0] io_deq_bits_uops_2_mem_typ,
  output  io_deq_bits_uops_2_is_fence,
  output  io_deq_bits_uops_2_is_fencei,
  output  io_deq_bits_uops_2_is_store,
  output  io_deq_bits_uops_2_is_amo,
  output  io_deq_bits_uops_2_is_load,
  output  io_deq_bits_uops_2_is_unique,
  output  io_deq_bits_uops_2_flush_on_commit,
  output [5:0] io_deq_bits_uops_2_ldst,
  output [5:0] io_deq_bits_uops_2_lrs1,
  output [5:0] io_deq_bits_uops_2_lrs2,
  output [5:0] io_deq_bits_uops_2_lrs3,
  output  io_deq_bits_uops_2_ldst_val,
  output [1:0] io_deq_bits_uops_2_dst_rtype,
  output [1:0] io_deq_bits_uops_2_lrs1_rtype,
  output [1:0] io_deq_bits_uops_2_lrs2_rtype,
  output  io_deq_bits_uops_2_frs3_en,
  output  io_deq_bits_uops_2_fp_val,
  output  io_deq_bits_uops_2_fp_single,
  output  io_deq_bits_uops_2_xcpt_if,
  output  io_deq_bits_uops_2_replay_if,
  output [63:0] io_deq_bits_uops_2_debug_wdata,
  output [31:0] io_deq_bits_uops_2_debug_events_fetch_seq,
  output  io_deq_bits_uops_3_valid,
  output [1:0] io_deq_bits_uops_3_iw_state,
  output [8:0] io_deq_bits_uops_3_uopc,
  output [31:0] io_deq_bits_uops_3_inst,
  output [39:0] io_deq_bits_uops_3_pc,
  output [7:0] io_deq_bits_uops_3_fu_code,
  output [3:0] io_deq_bits_uops_3_ctrl_br_type,
  output [1:0] io_deq_bits_uops_3_ctrl_op1_sel,
  output [2:0] io_deq_bits_uops_3_ctrl_op2_sel,
  output [2:0] io_deq_bits_uops_3_ctrl_imm_sel,
  output [3:0] io_deq_bits_uops_3_ctrl_op_fcn,
  output  io_deq_bits_uops_3_ctrl_fcn_dw,
  output  io_deq_bits_uops_3_ctrl_rf_wen,
  output [2:0] io_deq_bits_uops_3_ctrl_csr_cmd,
  output  io_deq_bits_uops_3_ctrl_is_load,
  output  io_deq_bits_uops_3_ctrl_is_sta,
  output  io_deq_bits_uops_3_ctrl_is_std,
  output [1:0] io_deq_bits_uops_3_wakeup_delay,
  output  io_deq_bits_uops_3_allocate_brtag,
  output  io_deq_bits_uops_3_is_br_or_jmp,
  output  io_deq_bits_uops_3_is_jump,
  output  io_deq_bits_uops_3_is_jal,
  output  io_deq_bits_uops_3_is_ret,
  output  io_deq_bits_uops_3_is_call,
  output [7:0] io_deq_bits_uops_3_br_mask,
  output [2:0] io_deq_bits_uops_3_br_tag,
  output  io_deq_bits_uops_3_br_prediction_bpd_predict_val,
  output  io_deq_bits_uops_3_br_prediction_bpd_predict_taken,
  output  io_deq_bits_uops_3_br_prediction_btb_hit,
  output  io_deq_bits_uops_3_br_prediction_btb_predicted,
  output  io_deq_bits_uops_3_br_prediction_is_br_or_jalr,
  output  io_deq_bits_uops_3_stat_brjmp_mispredicted,
  output  io_deq_bits_uops_3_stat_btb_made_pred,
  output  io_deq_bits_uops_3_stat_btb_mispredicted,
  output  io_deq_bits_uops_3_stat_bpd_made_pred,
  output  io_deq_bits_uops_3_stat_bpd_mispredicted,
  output [3:0] io_deq_bits_uops_3_fetch_pc_lob,
  output [19:0] io_deq_bits_uops_3_imm_packed,
  output [11:0] io_deq_bits_uops_3_csr_addr,
  output [6:0] io_deq_bits_uops_3_rob_idx,
  output [4:0] io_deq_bits_uops_3_ldq_idx,
  output [4:0] io_deq_bits_uops_3_stq_idx,
  output [4:0] io_deq_bits_uops_3_brob_idx,
  output [6:0] io_deq_bits_uops_3_pdst,
  output [6:0] io_deq_bits_uops_3_pop1,
  output [6:0] io_deq_bits_uops_3_pop2,
  output [6:0] io_deq_bits_uops_3_pop3,
  output  io_deq_bits_uops_3_prs1_busy,
  output  io_deq_bits_uops_3_prs2_busy,
  output  io_deq_bits_uops_3_prs3_busy,
  output [6:0] io_deq_bits_uops_3_stale_pdst,
  output  io_deq_bits_uops_3_exception,
  output [63:0] io_deq_bits_uops_3_exc_cause,
  output  io_deq_bits_uops_3_bypassable,
  output [3:0] io_deq_bits_uops_3_mem_cmd,
  output [2:0] io_deq_bits_uops_3_mem_typ,
  output  io_deq_bits_uops_3_is_fence,
  output  io_deq_bits_uops_3_is_fencei,
  output  io_deq_bits_uops_3_is_store,
  output  io_deq_bits_uops_3_is_amo,
  output  io_deq_bits_uops_3_is_load,
  output  io_deq_bits_uops_3_is_unique,
  output  io_deq_bits_uops_3_flush_on_commit,
  output [5:0] io_deq_bits_uops_3_ldst,
  output [5:0] io_deq_bits_uops_3_lrs1,
  output [5:0] io_deq_bits_uops_3_lrs2,
  output [5:0] io_deq_bits_uops_3_lrs3,
  output  io_deq_bits_uops_3_ldst_val,
  output [1:0] io_deq_bits_uops_3_dst_rtype,
  output [1:0] io_deq_bits_uops_3_lrs1_rtype,
  output [1:0] io_deq_bits_uops_3_lrs2_rtype,
  output  io_deq_bits_uops_3_frs3_en,
  output  io_deq_bits_uops_3_fp_val,
  output  io_deq_bits_uops_3_fp_single,
  output  io_deq_bits_uops_3_xcpt_if,
  output  io_deq_bits_uops_3_replay_if,
  output [63:0] io_deq_bits_uops_3_debug_wdata,
  output [31:0] io_deq_bits_uops_3_debug_events_fetch_seq,
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
  input   io_kill
);
  reg [1:0] counter;
  reg [31:0] _GEN_289;
  wire  inst_idx;
  wire  _T_2079;
  wire  _T_2082;
  wire  _T_2084;
  wire  _GEN_8;
  wire  _T_2094;
  wire [1:0] _GEN_9;
  wire  _T_2096;
  wire  _T_2098;
  wire  _T_2099;
  wire [2:0] _T_2101;
  wire [1:0] _T_2102;
  wire [1:0] _GEN_10;
  wire [1:0] _T_2104;
  wire [31:0] _GEN_0;
  wire [31:0] _GEN_11;
  wire [31:0] _GEN_12;
  wire [31:0] _GEN_13;
  wire  _GEN_1_bpd_predict_val;
  wire  _GEN_1_bpd_predict_taken;
  wire  _GEN_1_btb_hit;
  wire  _GEN_1_btb_predicted;
  wire  _GEN_1_is_br_or_jalr;
  wire  _GEN_14;
  wire  _GEN_15;
  wire  _GEN_16;
  wire  _GEN_17;
  wire  _GEN_18;
  wire  _GEN_19;
  wire  _GEN_20;
  wire  _GEN_21;
  wire  _GEN_22;
  wire  _GEN_23;
  wire  _GEN_24;
  wire  _GEN_25;
  wire  _GEN_26;
  wire  _GEN_27;
  wire  _GEN_28;
  wire  _GEN_2_bpd_predict_val;
  wire  _GEN_2_bpd_predict_taken;
  wire  _GEN_2_btb_hit;
  wire  _GEN_2_btb_predicted;
  wire  _GEN_2_is_br_or_jalr;
  wire  _GEN_3_bpd_predict_val;
  wire  _GEN_3_bpd_predict_taken;
  wire  _GEN_3_btb_hit;
  wire  _GEN_3_btb_predicted;
  wire  _GEN_3_is_br_or_jalr;
  wire  _GEN_4_bpd_predict_val;
  wire  _GEN_4_bpd_predict_taken;
  wire  _GEN_4_btb_hit;
  wire  _GEN_4_btb_predicted;
  wire  _GEN_4_is_br_or_jalr;
  wire  _GEN_5_bpd_predict_val;
  wire  _GEN_5_bpd_predict_taken;
  wire  _GEN_5_btb_hit;
  wire  _GEN_5_btb_predicted;
  wire  _GEN_5_is_br_or_jalr;
  wire [31:0] _GEN_6_fetch_seq;
  wire [31:0] _GEN_29;
  wire [31:0] _GEN_30;
  wire [31:0] _GEN_31;
  wire  _T_2122;
  wire [39:0] _T_2123;
  wire [39:0] _T_2125;
  wire [39:0] _T_2126;
  wire [39:0] _T_2127;
  wire [40:0] _T_2129;
  wire [39:0] _T_2130;
  wire  _T_2131;
  wire [40:0] _T_2138;
  wire [39:0] _T_2139;
  wire  _T_2140;
  wire [40:0] _T_2147;
  wire [39:0] _T_2148;
  wire  _T_2149;
  wire [40:0] _T_2156;
  wire [39:0] _T_2157;
  reg [1:0] _GEN_1;
  reg [31:0] _GEN_290;
  reg [8:0] _GEN_2;
  reg [31:0] _GEN_291;
  reg [7:0] _GEN_3;
  reg [31:0] _GEN_292;
  reg [3:0] _GEN_4;
  reg [31:0] _GEN_293;
  reg [1:0] _GEN_5;
  reg [31:0] _GEN_294;
  reg [2:0] _GEN_6;
  reg [31:0] _GEN_295;
  reg [2:0] _GEN_7;
  reg [31:0] _GEN_296;
  reg [3:0] _GEN_32;
  reg [31:0] _GEN_297;
  reg  _GEN_33;
  reg [31:0] _GEN_298;
  reg  _GEN_34;
  reg [31:0] _GEN_299;
  reg [2:0] _GEN_35;
  reg [31:0] _GEN_300;
  reg  _GEN_36;
  reg [31:0] _GEN_301;
  reg  _GEN_37;
  reg [31:0] _GEN_302;
  reg  _GEN_38;
  reg [31:0] _GEN_303;
  reg [1:0] _GEN_39;
  reg [31:0] _GEN_304;
  reg  _GEN_40;
  reg [31:0] _GEN_305;
  reg  _GEN_41;
  reg [31:0] _GEN_306;
  reg  _GEN_42;
  reg [31:0] _GEN_307;
  reg  _GEN_43;
  reg [31:0] _GEN_308;
  reg  _GEN_44;
  reg [31:0] _GEN_309;
  reg  _GEN_45;
  reg [31:0] _GEN_310;
  reg [7:0] _GEN_46;
  reg [31:0] _GEN_311;
  reg [2:0] _GEN_47;
  reg [31:0] _GEN_312;
  reg  _GEN_48;
  reg [31:0] _GEN_313;
  reg  _GEN_49;
  reg [31:0] _GEN_314;
  reg  _GEN_50;
  reg [31:0] _GEN_315;
  reg  _GEN_51;
  reg [31:0] _GEN_316;
  reg  _GEN_52;
  reg [31:0] _GEN_317;
  reg [19:0] _GEN_53;
  reg [31:0] _GEN_318;
  reg [11:0] _GEN_54;
  reg [31:0] _GEN_319;
  reg [6:0] _GEN_55;
  reg [31:0] _GEN_320;
  reg [4:0] _GEN_56;
  reg [31:0] _GEN_321;
  reg [4:0] _GEN_57;
  reg [31:0] _GEN_322;
  reg [4:0] _GEN_58;
  reg [31:0] _GEN_323;
  reg [6:0] _GEN_59;
  reg [31:0] _GEN_324;
  reg [6:0] _GEN_60;
  reg [31:0] _GEN_325;
  reg [6:0] _GEN_61;
  reg [31:0] _GEN_326;
  reg [6:0] _GEN_62;
  reg [31:0] _GEN_327;
  reg  _GEN_63;
  reg [31:0] _GEN_328;
  reg  _GEN_64;
  reg [31:0] _GEN_329;
  reg  _GEN_65;
  reg [31:0] _GEN_330;
  reg [6:0] _GEN_66;
  reg [31:0] _GEN_331;
  reg  _GEN_67;
  reg [31:0] _GEN_332;
  reg [63:0] _GEN_68;
  reg [63:0] _GEN_333;
  reg  _GEN_69;
  reg [31:0] _GEN_334;
  reg [3:0] _GEN_70;
  reg [31:0] _GEN_335;
  reg [2:0] _GEN_71;
  reg [31:0] _GEN_336;
  reg  _GEN_72;
  reg [31:0] _GEN_337;
  reg  _GEN_73;
  reg [31:0] _GEN_338;
  reg  _GEN_74;
  reg [31:0] _GEN_339;
  reg  _GEN_75;
  reg [31:0] _GEN_340;
  reg  _GEN_76;
  reg [31:0] _GEN_341;
  reg  _GEN_77;
  reg [31:0] _GEN_342;
  reg  _GEN_78;
  reg [31:0] _GEN_343;
  reg [5:0] _GEN_79;
  reg [31:0] _GEN_344;
  reg [5:0] _GEN_80;
  reg [31:0] _GEN_345;
  reg [5:0] _GEN_81;
  reg [31:0] _GEN_346;
  reg [5:0] _GEN_82;
  reg [31:0] _GEN_347;
  reg  _GEN_83;
  reg [31:0] _GEN_348;
  reg [1:0] _GEN_84;
  reg [31:0] _GEN_349;
  reg [1:0] _GEN_85;
  reg [31:0] _GEN_350;
  reg [1:0] _GEN_86;
  reg [31:0] _GEN_351;
  reg  _GEN_87;
  reg [31:0] _GEN_352;
  reg  _GEN_88;
  reg [31:0] _GEN_353;
  reg  _GEN_89;
  reg [31:0] _GEN_354;
  reg [63:0] _GEN_90;
  reg [63:0] _GEN_355;
  reg [1:0] _GEN_91;
  reg [31:0] _GEN_356;
  reg [8:0] _GEN_92;
  reg [31:0] _GEN_357;
  reg [7:0] _GEN_93;
  reg [31:0] _GEN_358;
  reg [3:0] _GEN_94;
  reg [31:0] _GEN_359;
  reg [1:0] _GEN_95;
  reg [31:0] _GEN_360;
  reg [2:0] _GEN_96;
  reg [31:0] _GEN_361;
  reg [2:0] _GEN_97;
  reg [31:0] _GEN_362;
  reg [3:0] _GEN_98;
  reg [31:0] _GEN_363;
  reg  _GEN_99;
  reg [31:0] _GEN_364;
  reg  _GEN_100;
  reg [31:0] _GEN_365;
  reg [2:0] _GEN_101;
  reg [31:0] _GEN_366;
  reg  _GEN_102;
  reg [31:0] _GEN_367;
  reg  _GEN_103;
  reg [31:0] _GEN_368;
  reg  _GEN_104;
  reg [31:0] _GEN_369;
  reg [1:0] _GEN_105;
  reg [31:0] _GEN_370;
  reg  _GEN_106;
  reg [31:0] _GEN_371;
  reg  _GEN_107;
  reg [31:0] _GEN_372;
  reg  _GEN_108;
  reg [31:0] _GEN_373;
  reg  _GEN_109;
  reg [31:0] _GEN_374;
  reg  _GEN_110;
  reg [31:0] _GEN_375;
  reg  _GEN_111;
  reg [31:0] _GEN_376;
  reg [7:0] _GEN_112;
  reg [31:0] _GEN_377;
  reg [2:0] _GEN_113;
  reg [31:0] _GEN_378;
  reg  _GEN_114;
  reg [31:0] _GEN_379;
  reg  _GEN_115;
  reg [31:0] _GEN_380;
  reg  _GEN_116;
  reg [31:0] _GEN_381;
  reg  _GEN_117;
  reg [31:0] _GEN_382;
  reg  _GEN_118;
  reg [31:0] _GEN_383;
  reg [19:0] _GEN_119;
  reg [31:0] _GEN_384;
  reg [11:0] _GEN_120;
  reg [31:0] _GEN_385;
  reg [6:0] _GEN_121;
  reg [31:0] _GEN_386;
  reg [4:0] _GEN_122;
  reg [31:0] _GEN_387;
  reg [4:0] _GEN_123;
  reg [31:0] _GEN_388;
  reg [4:0] _GEN_124;
  reg [31:0] _GEN_389;
  reg [6:0] _GEN_125;
  reg [31:0] _GEN_390;
  reg [6:0] _GEN_126;
  reg [31:0] _GEN_391;
  reg [6:0] _GEN_127;
  reg [31:0] _GEN_392;
  reg [6:0] _GEN_128;
  reg [31:0] _GEN_393;
  reg  _GEN_129;
  reg [31:0] _GEN_394;
  reg  _GEN_130;
  reg [31:0] _GEN_395;
  reg  _GEN_131;
  reg [31:0] _GEN_396;
  reg [6:0] _GEN_132;
  reg [31:0] _GEN_397;
  reg  _GEN_133;
  reg [31:0] _GEN_398;
  reg [63:0] _GEN_134;
  reg [63:0] _GEN_399;
  reg  _GEN_135;
  reg [31:0] _GEN_400;
  reg [3:0] _GEN_136;
  reg [31:0] _GEN_401;
  reg [2:0] _GEN_137;
  reg [31:0] _GEN_402;
  reg  _GEN_138;
  reg [31:0] _GEN_403;
  reg  _GEN_139;
  reg [31:0] _GEN_404;
  reg  _GEN_140;
  reg [31:0] _GEN_405;
  reg  _GEN_141;
  reg [31:0] _GEN_406;
  reg  _GEN_142;
  reg [31:0] _GEN_407;
  reg  _GEN_143;
  reg [31:0] _GEN_408;
  reg  _GEN_144;
  reg [31:0] _GEN_409;
  reg [5:0] _GEN_145;
  reg [31:0] _GEN_410;
  reg [5:0] _GEN_146;
  reg [31:0] _GEN_411;
  reg [5:0] _GEN_147;
  reg [31:0] _GEN_412;
  reg [5:0] _GEN_148;
  reg [31:0] _GEN_413;
  reg  _GEN_149;
  reg [31:0] _GEN_414;
  reg [1:0] _GEN_150;
  reg [31:0] _GEN_415;
  reg [1:0] _GEN_151;
  reg [31:0] _GEN_416;
  reg [1:0] _GEN_152;
  reg [31:0] _GEN_417;
  reg  _GEN_153;
  reg [31:0] _GEN_418;
  reg  _GEN_154;
  reg [31:0] _GEN_419;
  reg  _GEN_155;
  reg [31:0] _GEN_420;
  reg [63:0] _GEN_156;
  reg [63:0] _GEN_421;
  reg [1:0] _GEN_157;
  reg [31:0] _GEN_422;
  reg [8:0] _GEN_158;
  reg [31:0] _GEN_423;
  reg [7:0] _GEN_159;
  reg [31:0] _GEN_424;
  reg [3:0] _GEN_160;
  reg [31:0] _GEN_425;
  reg [1:0] _GEN_161;
  reg [31:0] _GEN_426;
  reg [2:0] _GEN_162;
  reg [31:0] _GEN_427;
  reg [2:0] _GEN_163;
  reg [31:0] _GEN_428;
  reg [3:0] _GEN_164;
  reg [31:0] _GEN_429;
  reg  _GEN_165;
  reg [31:0] _GEN_430;
  reg  _GEN_166;
  reg [31:0] _GEN_431;
  reg [2:0] _GEN_167;
  reg [31:0] _GEN_432;
  reg  _GEN_168;
  reg [31:0] _GEN_433;
  reg  _GEN_169;
  reg [31:0] _GEN_434;
  reg  _GEN_170;
  reg [31:0] _GEN_435;
  reg [1:0] _GEN_171;
  reg [31:0] _GEN_436;
  reg  _GEN_172;
  reg [31:0] _GEN_437;
  reg  _GEN_173;
  reg [31:0] _GEN_438;
  reg  _GEN_174;
  reg [31:0] _GEN_439;
  reg  _GEN_175;
  reg [31:0] _GEN_440;
  reg  _GEN_176;
  reg [31:0] _GEN_441;
  reg  _GEN_177;
  reg [31:0] _GEN_442;
  reg [7:0] _GEN_178;
  reg [31:0] _GEN_443;
  reg [2:0] _GEN_179;
  reg [31:0] _GEN_444;
  reg  _GEN_180;
  reg [31:0] _GEN_445;
  reg  _GEN_181;
  reg [31:0] _GEN_446;
  reg  _GEN_182;
  reg [31:0] _GEN_447;
  reg  _GEN_183;
  reg [31:0] _GEN_448;
  reg  _GEN_184;
  reg [31:0] _GEN_449;
  reg [19:0] _GEN_185;
  reg [31:0] _GEN_450;
  reg [11:0] _GEN_186;
  reg [31:0] _GEN_451;
  reg [6:0] _GEN_187;
  reg [31:0] _GEN_452;
  reg [4:0] _GEN_188;
  reg [31:0] _GEN_453;
  reg [4:0] _GEN_189;
  reg [31:0] _GEN_454;
  reg [4:0] _GEN_190;
  reg [31:0] _GEN_455;
  reg [6:0] _GEN_191;
  reg [31:0] _GEN_456;
  reg [6:0] _GEN_192;
  reg [31:0] _GEN_457;
  reg [6:0] _GEN_193;
  reg [31:0] _GEN_458;
  reg [6:0] _GEN_194;
  reg [31:0] _GEN_459;
  reg  _GEN_195;
  reg [31:0] _GEN_460;
  reg  _GEN_196;
  reg [31:0] _GEN_461;
  reg  _GEN_197;
  reg [31:0] _GEN_462;
  reg [6:0] _GEN_198;
  reg [31:0] _GEN_463;
  reg  _GEN_199;
  reg [31:0] _GEN_464;
  reg [63:0] _GEN_200;
  reg [63:0] _GEN_465;
  reg  _GEN_201;
  reg [31:0] _GEN_466;
  reg [3:0] _GEN_202;
  reg [31:0] _GEN_467;
  reg [2:0] _GEN_203;
  reg [31:0] _GEN_468;
  reg  _GEN_204;
  reg [31:0] _GEN_469;
  reg  _GEN_205;
  reg [31:0] _GEN_470;
  reg  _GEN_206;
  reg [31:0] _GEN_471;
  reg  _GEN_207;
  reg [31:0] _GEN_472;
  reg  _GEN_208;
  reg [31:0] _GEN_473;
  reg  _GEN_209;
  reg [31:0] _GEN_474;
  reg  _GEN_210;
  reg [31:0] _GEN_475;
  reg [5:0] _GEN_211;
  reg [31:0] _GEN_476;
  reg [5:0] _GEN_212;
  reg [31:0] _GEN_477;
  reg [5:0] _GEN_213;
  reg [31:0] _GEN_478;
  reg [5:0] _GEN_214;
  reg [31:0] _GEN_479;
  reg  _GEN_215;
  reg [31:0] _GEN_480;
  reg [1:0] _GEN_216;
  reg [31:0] _GEN_481;
  reg [1:0] _GEN_217;
  reg [31:0] _GEN_482;
  reg [1:0] _GEN_218;
  reg [31:0] _GEN_483;
  reg  _GEN_219;
  reg [31:0] _GEN_484;
  reg  _GEN_220;
  reg [31:0] _GEN_485;
  reg  _GEN_221;
  reg [31:0] _GEN_486;
  reg [63:0] _GEN_222;
  reg [63:0] _GEN_487;
  reg [1:0] _GEN_223;
  reg [31:0] _GEN_488;
  reg [8:0] _GEN_224;
  reg [31:0] _GEN_489;
  reg [7:0] _GEN_225;
  reg [31:0] _GEN_490;
  reg [3:0] _GEN_226;
  reg [31:0] _GEN_491;
  reg [1:0] _GEN_227;
  reg [31:0] _GEN_492;
  reg [2:0] _GEN_228;
  reg [31:0] _GEN_493;
  reg [2:0] _GEN_229;
  reg [31:0] _GEN_494;
  reg [3:0] _GEN_230;
  reg [31:0] _GEN_495;
  reg  _GEN_231;
  reg [31:0] _GEN_496;
  reg  _GEN_232;
  reg [31:0] _GEN_497;
  reg [2:0] _GEN_233;
  reg [31:0] _GEN_498;
  reg  _GEN_234;
  reg [31:0] _GEN_499;
  reg  _GEN_235;
  reg [31:0] _GEN_500;
  reg  _GEN_236;
  reg [31:0] _GEN_501;
  reg [1:0] _GEN_237;
  reg [31:0] _GEN_502;
  reg  _GEN_238;
  reg [31:0] _GEN_503;
  reg  _GEN_239;
  reg [31:0] _GEN_504;
  reg  _GEN_240;
  reg [31:0] _GEN_505;
  reg  _GEN_241;
  reg [31:0] _GEN_506;
  reg  _GEN_242;
  reg [31:0] _GEN_507;
  reg  _GEN_243;
  reg [31:0] _GEN_508;
  reg [7:0] _GEN_244;
  reg [31:0] _GEN_509;
  reg [2:0] _GEN_245;
  reg [31:0] _GEN_510;
  reg  _GEN_246;
  reg [31:0] _GEN_511;
  reg  _GEN_247;
  reg [31:0] _GEN_512;
  reg  _GEN_248;
  reg [31:0] _GEN_513;
  reg  _GEN_249;
  reg [31:0] _GEN_514;
  reg  _GEN_250;
  reg [31:0] _GEN_515;
  reg [19:0] _GEN_251;
  reg [31:0] _GEN_516;
  reg [11:0] _GEN_252;
  reg [31:0] _GEN_517;
  reg [6:0] _GEN_253;
  reg [31:0] _GEN_518;
  reg [4:0] _GEN_254;
  reg [31:0] _GEN_519;
  reg [4:0] _GEN_255;
  reg [31:0] _GEN_520;
  reg [4:0] _GEN_256;
  reg [31:0] _GEN_521;
  reg [6:0] _GEN_257;
  reg [31:0] _GEN_522;
  reg [6:0] _GEN_258;
  reg [31:0] _GEN_523;
  reg [6:0] _GEN_259;
  reg [31:0] _GEN_524;
  reg [6:0] _GEN_260;
  reg [31:0] _GEN_525;
  reg  _GEN_261;
  reg [31:0] _GEN_526;
  reg  _GEN_262;
  reg [31:0] _GEN_527;
  reg  _GEN_263;
  reg [31:0] _GEN_528;
  reg [6:0] _GEN_264;
  reg [31:0] _GEN_529;
  reg  _GEN_265;
  reg [31:0] _GEN_530;
  reg [63:0] _GEN_266;
  reg [63:0] _GEN_531;
  reg  _GEN_267;
  reg [31:0] _GEN_532;
  reg [3:0] _GEN_268;
  reg [31:0] _GEN_533;
  reg [2:0] _GEN_269;
  reg [31:0] _GEN_534;
  reg  _GEN_270;
  reg [31:0] _GEN_535;
  reg  _GEN_271;
  reg [31:0] _GEN_536;
  reg  _GEN_272;
  reg [31:0] _GEN_537;
  reg  _GEN_273;
  reg [31:0] _GEN_538;
  reg  _GEN_274;
  reg [31:0] _GEN_539;
  reg  _GEN_275;
  reg [31:0] _GEN_540;
  reg  _GEN_276;
  reg [31:0] _GEN_541;
  reg [5:0] _GEN_277;
  reg [31:0] _GEN_542;
  reg [5:0] _GEN_278;
  reg [31:0] _GEN_543;
  reg [5:0] _GEN_279;
  reg [31:0] _GEN_544;
  reg [5:0] _GEN_280;
  reg [31:0] _GEN_545;
  reg  _GEN_281;
  reg [31:0] _GEN_546;
  reg [1:0] _GEN_282;
  reg [31:0] _GEN_547;
  reg [1:0] _GEN_283;
  reg [31:0] _GEN_548;
  reg [1:0] _GEN_284;
  reg [31:0] _GEN_549;
  reg  _GEN_285;
  reg [31:0] _GEN_550;
  reg  _GEN_286;
  reg [31:0] _GEN_551;
  reg  _GEN_287;
  reg [31:0] _GEN_552;
  reg [63:0] _GEN_288;
  reg [63:0] _GEN_553;
  assign io_enq_ready = io_deq_ready;
  assign io_deq_valid = io_enq_valid;
  assign io_deq_bits_uops_0_valid = _T_2122;
  assign io_deq_bits_uops_0_iw_state = _GEN_1;
  assign io_deq_bits_uops_0_uopc = _GEN_2;
  assign io_deq_bits_uops_0_inst = io_enq_bits_insts_0;
  assign io_deq_bits_uops_0_pc = _T_2130;
  assign io_deq_bits_uops_0_fu_code = _GEN_3;
  assign io_deq_bits_uops_0_ctrl_br_type = _GEN_4;
  assign io_deq_bits_uops_0_ctrl_op1_sel = _GEN_5;
  assign io_deq_bits_uops_0_ctrl_op2_sel = _GEN_6;
  assign io_deq_bits_uops_0_ctrl_imm_sel = _GEN_7;
  assign io_deq_bits_uops_0_ctrl_op_fcn = _GEN_32;
  assign io_deq_bits_uops_0_ctrl_fcn_dw = _GEN_33;
  assign io_deq_bits_uops_0_ctrl_rf_wen = _GEN_34;
  assign io_deq_bits_uops_0_ctrl_csr_cmd = _GEN_35;
  assign io_deq_bits_uops_0_ctrl_is_load = _GEN_36;
  assign io_deq_bits_uops_0_ctrl_is_sta = _GEN_37;
  assign io_deq_bits_uops_0_ctrl_is_std = _GEN_38;
  assign io_deq_bits_uops_0_wakeup_delay = _GEN_39;
  assign io_deq_bits_uops_0_allocate_brtag = _GEN_40;
  assign io_deq_bits_uops_0_is_br_or_jmp = _GEN_41;
  assign io_deq_bits_uops_0_is_jump = _GEN_42;
  assign io_deq_bits_uops_0_is_jal = _GEN_43;
  assign io_deq_bits_uops_0_is_ret = _GEN_44;
  assign io_deq_bits_uops_0_is_call = _GEN_45;
  assign io_deq_bits_uops_0_br_mask = _GEN_46;
  assign io_deq_bits_uops_0_br_tag = _GEN_47;
  assign io_deq_bits_uops_0_br_prediction_bpd_predict_val = io_enq_bits_predictions_0_bpd_predict_val;
  assign io_deq_bits_uops_0_br_prediction_bpd_predict_taken = io_enq_bits_predictions_0_bpd_predict_taken;
  assign io_deq_bits_uops_0_br_prediction_btb_hit = io_enq_bits_predictions_0_btb_hit;
  assign io_deq_bits_uops_0_br_prediction_btb_predicted = io_enq_bits_predictions_0_btb_predicted;
  assign io_deq_bits_uops_0_br_prediction_is_br_or_jalr = io_enq_bits_predictions_0_is_br_or_jalr;
  assign io_deq_bits_uops_0_stat_brjmp_mispredicted = _GEN_48;
  assign io_deq_bits_uops_0_stat_btb_made_pred = _GEN_49;
  assign io_deq_bits_uops_0_stat_btb_mispredicted = _GEN_50;
  assign io_deq_bits_uops_0_stat_bpd_made_pred = _GEN_51;
  assign io_deq_bits_uops_0_stat_bpd_mispredicted = _GEN_52;
  assign io_deq_bits_uops_0_fetch_pc_lob = io_enq_bits_pc[3:0];
  assign io_deq_bits_uops_0_imm_packed = _GEN_53;
  assign io_deq_bits_uops_0_csr_addr = _GEN_54;
  assign io_deq_bits_uops_0_rob_idx = _GEN_55;
  assign io_deq_bits_uops_0_ldq_idx = _GEN_56;
  assign io_deq_bits_uops_0_stq_idx = _GEN_57;
  assign io_deq_bits_uops_0_brob_idx = _GEN_58;
  assign io_deq_bits_uops_0_pdst = _GEN_59;
  assign io_deq_bits_uops_0_pop1 = _GEN_60;
  assign io_deq_bits_uops_0_pop2 = _GEN_61;
  assign io_deq_bits_uops_0_pop3 = _GEN_62;
  assign io_deq_bits_uops_0_prs1_busy = _GEN_63;
  assign io_deq_bits_uops_0_prs2_busy = _GEN_64;
  assign io_deq_bits_uops_0_prs3_busy = _GEN_65;
  assign io_deq_bits_uops_0_stale_pdst = _GEN_66;
  assign io_deq_bits_uops_0_exception = _GEN_67;
  assign io_deq_bits_uops_0_exc_cause = _GEN_68;
  assign io_deq_bits_uops_0_bypassable = _GEN_69;
  assign io_deq_bits_uops_0_mem_cmd = _GEN_70;
  assign io_deq_bits_uops_0_mem_typ = _GEN_71;
  assign io_deq_bits_uops_0_is_fence = _GEN_72;
  assign io_deq_bits_uops_0_is_fencei = _GEN_73;
  assign io_deq_bits_uops_0_is_store = _GEN_74;
  assign io_deq_bits_uops_0_is_amo = _GEN_75;
  assign io_deq_bits_uops_0_is_load = _GEN_76;
  assign io_deq_bits_uops_0_is_unique = _GEN_77;
  assign io_deq_bits_uops_0_flush_on_commit = _GEN_78;
  assign io_deq_bits_uops_0_ldst = _GEN_79;
  assign io_deq_bits_uops_0_lrs1 = _GEN_80;
  assign io_deq_bits_uops_0_lrs2 = _GEN_81;
  assign io_deq_bits_uops_0_lrs3 = _GEN_82;
  assign io_deq_bits_uops_0_ldst_val = _GEN_83;
  assign io_deq_bits_uops_0_dst_rtype = _GEN_84;
  assign io_deq_bits_uops_0_lrs1_rtype = _GEN_85;
  assign io_deq_bits_uops_0_lrs2_rtype = _GEN_86;
  assign io_deq_bits_uops_0_frs3_en = _GEN_87;
  assign io_deq_bits_uops_0_fp_val = _GEN_88;
  assign io_deq_bits_uops_0_fp_single = _GEN_89;
  assign io_deq_bits_uops_0_xcpt_if = io_enq_bits_xcpt_if;
  assign io_deq_bits_uops_0_replay_if = io_enq_bits_replay_if;
  assign io_deq_bits_uops_0_debug_wdata = _GEN_90;
  assign io_deq_bits_uops_0_debug_events_fetch_seq = io_enq_bits_debug_events_0_fetch_seq;
  assign io_deq_bits_uops_1_valid = _T_2131;
  assign io_deq_bits_uops_1_iw_state = _GEN_91;
  assign io_deq_bits_uops_1_uopc = _GEN_92;
  assign io_deq_bits_uops_1_inst = io_enq_bits_insts_1;
  assign io_deq_bits_uops_1_pc = _T_2139;
  assign io_deq_bits_uops_1_fu_code = _GEN_93;
  assign io_deq_bits_uops_1_ctrl_br_type = _GEN_94;
  assign io_deq_bits_uops_1_ctrl_op1_sel = _GEN_95;
  assign io_deq_bits_uops_1_ctrl_op2_sel = _GEN_96;
  assign io_deq_bits_uops_1_ctrl_imm_sel = _GEN_97;
  assign io_deq_bits_uops_1_ctrl_op_fcn = _GEN_98;
  assign io_deq_bits_uops_1_ctrl_fcn_dw = _GEN_99;
  assign io_deq_bits_uops_1_ctrl_rf_wen = _GEN_100;
  assign io_deq_bits_uops_1_ctrl_csr_cmd = _GEN_101;
  assign io_deq_bits_uops_1_ctrl_is_load = _GEN_102;
  assign io_deq_bits_uops_1_ctrl_is_sta = _GEN_103;
  assign io_deq_bits_uops_1_ctrl_is_std = _GEN_104;
  assign io_deq_bits_uops_1_wakeup_delay = _GEN_105;
  assign io_deq_bits_uops_1_allocate_brtag = _GEN_106;
  assign io_deq_bits_uops_1_is_br_or_jmp = _GEN_107;
  assign io_deq_bits_uops_1_is_jump = _GEN_108;
  assign io_deq_bits_uops_1_is_jal = _GEN_109;
  assign io_deq_bits_uops_1_is_ret = _GEN_110;
  assign io_deq_bits_uops_1_is_call = _GEN_111;
  assign io_deq_bits_uops_1_br_mask = _GEN_112;
  assign io_deq_bits_uops_1_br_tag = _GEN_113;
  assign io_deq_bits_uops_1_br_prediction_bpd_predict_val = io_enq_bits_predictions_1_bpd_predict_val;
  assign io_deq_bits_uops_1_br_prediction_bpd_predict_taken = io_enq_bits_predictions_1_bpd_predict_taken;
  assign io_deq_bits_uops_1_br_prediction_btb_hit = io_enq_bits_predictions_1_btb_hit;
  assign io_deq_bits_uops_1_br_prediction_btb_predicted = io_enq_bits_predictions_1_btb_predicted;
  assign io_deq_bits_uops_1_br_prediction_is_br_or_jalr = io_enq_bits_predictions_1_is_br_or_jalr;
  assign io_deq_bits_uops_1_stat_brjmp_mispredicted = _GEN_114;
  assign io_deq_bits_uops_1_stat_btb_made_pred = _GEN_115;
  assign io_deq_bits_uops_1_stat_btb_mispredicted = _GEN_116;
  assign io_deq_bits_uops_1_stat_bpd_made_pred = _GEN_117;
  assign io_deq_bits_uops_1_stat_bpd_mispredicted = _GEN_118;
  assign io_deq_bits_uops_1_fetch_pc_lob = io_enq_bits_pc[3:0];
  assign io_deq_bits_uops_1_imm_packed = _GEN_119;
  assign io_deq_bits_uops_1_csr_addr = _GEN_120;
  assign io_deq_bits_uops_1_rob_idx = _GEN_121;
  assign io_deq_bits_uops_1_ldq_idx = _GEN_122;
  assign io_deq_bits_uops_1_stq_idx = _GEN_123;
  assign io_deq_bits_uops_1_brob_idx = _GEN_124;
  assign io_deq_bits_uops_1_pdst = _GEN_125;
  assign io_deq_bits_uops_1_pop1 = _GEN_126;
  assign io_deq_bits_uops_1_pop2 = _GEN_127;
  assign io_deq_bits_uops_1_pop3 = _GEN_128;
  assign io_deq_bits_uops_1_prs1_busy = _GEN_129;
  assign io_deq_bits_uops_1_prs2_busy = _GEN_130;
  assign io_deq_bits_uops_1_prs3_busy = _GEN_131;
  assign io_deq_bits_uops_1_stale_pdst = _GEN_132;
  assign io_deq_bits_uops_1_exception = _GEN_133;
  assign io_deq_bits_uops_1_exc_cause = _GEN_134;
  assign io_deq_bits_uops_1_bypassable = _GEN_135;
  assign io_deq_bits_uops_1_mem_cmd = _GEN_136;
  assign io_deq_bits_uops_1_mem_typ = _GEN_137;
  assign io_deq_bits_uops_1_is_fence = _GEN_138;
  assign io_deq_bits_uops_1_is_fencei = _GEN_139;
  assign io_deq_bits_uops_1_is_store = _GEN_140;
  assign io_deq_bits_uops_1_is_amo = _GEN_141;
  assign io_deq_bits_uops_1_is_load = _GEN_142;
  assign io_deq_bits_uops_1_is_unique = _GEN_143;
  assign io_deq_bits_uops_1_flush_on_commit = _GEN_144;
  assign io_deq_bits_uops_1_ldst = _GEN_145;
  assign io_deq_bits_uops_1_lrs1 = _GEN_146;
  assign io_deq_bits_uops_1_lrs2 = _GEN_147;
  assign io_deq_bits_uops_1_lrs3 = _GEN_148;
  assign io_deq_bits_uops_1_ldst_val = _GEN_149;
  assign io_deq_bits_uops_1_dst_rtype = _GEN_150;
  assign io_deq_bits_uops_1_lrs1_rtype = _GEN_151;
  assign io_deq_bits_uops_1_lrs2_rtype = _GEN_152;
  assign io_deq_bits_uops_1_frs3_en = _GEN_153;
  assign io_deq_bits_uops_1_fp_val = _GEN_154;
  assign io_deq_bits_uops_1_fp_single = _GEN_155;
  assign io_deq_bits_uops_1_xcpt_if = io_enq_bits_xcpt_if;
  assign io_deq_bits_uops_1_replay_if = io_enq_bits_replay_if;
  assign io_deq_bits_uops_1_debug_wdata = _GEN_156;
  assign io_deq_bits_uops_1_debug_events_fetch_seq = io_enq_bits_debug_events_1_fetch_seq;
  assign io_deq_bits_uops_2_valid = _T_2140;
  assign io_deq_bits_uops_2_iw_state = _GEN_157;
  assign io_deq_bits_uops_2_uopc = _GEN_158;
  assign io_deq_bits_uops_2_inst = io_enq_bits_insts_2;
  assign io_deq_bits_uops_2_pc = _T_2148;
  assign io_deq_bits_uops_2_fu_code = _GEN_159;
  assign io_deq_bits_uops_2_ctrl_br_type = _GEN_160;
  assign io_deq_bits_uops_2_ctrl_op1_sel = _GEN_161;
  assign io_deq_bits_uops_2_ctrl_op2_sel = _GEN_162;
  assign io_deq_bits_uops_2_ctrl_imm_sel = _GEN_163;
  assign io_deq_bits_uops_2_ctrl_op_fcn = _GEN_164;
  assign io_deq_bits_uops_2_ctrl_fcn_dw = _GEN_165;
  assign io_deq_bits_uops_2_ctrl_rf_wen = _GEN_166;
  assign io_deq_bits_uops_2_ctrl_csr_cmd = _GEN_167;
  assign io_deq_bits_uops_2_ctrl_is_load = _GEN_168;
  assign io_deq_bits_uops_2_ctrl_is_sta = _GEN_169;
  assign io_deq_bits_uops_2_ctrl_is_std = _GEN_170;
  assign io_deq_bits_uops_2_wakeup_delay = _GEN_171;
  assign io_deq_bits_uops_2_allocate_brtag = _GEN_172;
  assign io_deq_bits_uops_2_is_br_or_jmp = _GEN_173;
  assign io_deq_bits_uops_2_is_jump = _GEN_174;
  assign io_deq_bits_uops_2_is_jal = _GEN_175;
  assign io_deq_bits_uops_2_is_ret = _GEN_176;
  assign io_deq_bits_uops_2_is_call = _GEN_177;
  assign io_deq_bits_uops_2_br_mask = _GEN_178;
  assign io_deq_bits_uops_2_br_tag = _GEN_179;
  assign io_deq_bits_uops_2_br_prediction_bpd_predict_val = io_enq_bits_predictions_2_bpd_predict_val;
  assign io_deq_bits_uops_2_br_prediction_bpd_predict_taken = io_enq_bits_predictions_2_bpd_predict_taken;
  assign io_deq_bits_uops_2_br_prediction_btb_hit = io_enq_bits_predictions_2_btb_hit;
  assign io_deq_bits_uops_2_br_prediction_btb_predicted = io_enq_bits_predictions_2_btb_predicted;
  assign io_deq_bits_uops_2_br_prediction_is_br_or_jalr = io_enq_bits_predictions_2_is_br_or_jalr;
  assign io_deq_bits_uops_2_stat_brjmp_mispredicted = _GEN_180;
  assign io_deq_bits_uops_2_stat_btb_made_pred = _GEN_181;
  assign io_deq_bits_uops_2_stat_btb_mispredicted = _GEN_182;
  assign io_deq_bits_uops_2_stat_bpd_made_pred = _GEN_183;
  assign io_deq_bits_uops_2_stat_bpd_mispredicted = _GEN_184;
  assign io_deq_bits_uops_2_fetch_pc_lob = io_enq_bits_pc[3:0];
  assign io_deq_bits_uops_2_imm_packed = _GEN_185;
  assign io_deq_bits_uops_2_csr_addr = _GEN_186;
  assign io_deq_bits_uops_2_rob_idx = _GEN_187;
  assign io_deq_bits_uops_2_ldq_idx = _GEN_188;
  assign io_deq_bits_uops_2_stq_idx = _GEN_189;
  assign io_deq_bits_uops_2_brob_idx = _GEN_190;
  assign io_deq_bits_uops_2_pdst = _GEN_191;
  assign io_deq_bits_uops_2_pop1 = _GEN_192;
  assign io_deq_bits_uops_2_pop2 = _GEN_193;
  assign io_deq_bits_uops_2_pop3 = _GEN_194;
  assign io_deq_bits_uops_2_prs1_busy = _GEN_195;
  assign io_deq_bits_uops_2_prs2_busy = _GEN_196;
  assign io_deq_bits_uops_2_prs3_busy = _GEN_197;
  assign io_deq_bits_uops_2_stale_pdst = _GEN_198;
  assign io_deq_bits_uops_2_exception = _GEN_199;
  assign io_deq_bits_uops_2_exc_cause = _GEN_200;
  assign io_deq_bits_uops_2_bypassable = _GEN_201;
  assign io_deq_bits_uops_2_mem_cmd = _GEN_202;
  assign io_deq_bits_uops_2_mem_typ = _GEN_203;
  assign io_deq_bits_uops_2_is_fence = _GEN_204;
  assign io_deq_bits_uops_2_is_fencei = _GEN_205;
  assign io_deq_bits_uops_2_is_store = _GEN_206;
  assign io_deq_bits_uops_2_is_amo = _GEN_207;
  assign io_deq_bits_uops_2_is_load = _GEN_208;
  assign io_deq_bits_uops_2_is_unique = _GEN_209;
  assign io_deq_bits_uops_2_flush_on_commit = _GEN_210;
  assign io_deq_bits_uops_2_ldst = _GEN_211;
  assign io_deq_bits_uops_2_lrs1 = _GEN_212;
  assign io_deq_bits_uops_2_lrs2 = _GEN_213;
  assign io_deq_bits_uops_2_lrs3 = _GEN_214;
  assign io_deq_bits_uops_2_ldst_val = _GEN_215;
  assign io_deq_bits_uops_2_dst_rtype = _GEN_216;
  assign io_deq_bits_uops_2_lrs1_rtype = _GEN_217;
  assign io_deq_bits_uops_2_lrs2_rtype = _GEN_218;
  assign io_deq_bits_uops_2_frs3_en = _GEN_219;
  assign io_deq_bits_uops_2_fp_val = _GEN_220;
  assign io_deq_bits_uops_2_fp_single = _GEN_221;
  assign io_deq_bits_uops_2_xcpt_if = io_enq_bits_xcpt_if;
  assign io_deq_bits_uops_2_replay_if = io_enq_bits_replay_if;
  assign io_deq_bits_uops_2_debug_wdata = _GEN_222;
  assign io_deq_bits_uops_2_debug_events_fetch_seq = io_enq_bits_debug_events_2_fetch_seq;
  assign io_deq_bits_uops_3_valid = _T_2149;
  assign io_deq_bits_uops_3_iw_state = _GEN_223;
  assign io_deq_bits_uops_3_uopc = _GEN_224;
  assign io_deq_bits_uops_3_inst = io_enq_bits_insts_3;
  assign io_deq_bits_uops_3_pc = _T_2157;
  assign io_deq_bits_uops_3_fu_code = _GEN_225;
  assign io_deq_bits_uops_3_ctrl_br_type = _GEN_226;
  assign io_deq_bits_uops_3_ctrl_op1_sel = _GEN_227;
  assign io_deq_bits_uops_3_ctrl_op2_sel = _GEN_228;
  assign io_deq_bits_uops_3_ctrl_imm_sel = _GEN_229;
  assign io_deq_bits_uops_3_ctrl_op_fcn = _GEN_230;
  assign io_deq_bits_uops_3_ctrl_fcn_dw = _GEN_231;
  assign io_deq_bits_uops_3_ctrl_rf_wen = _GEN_232;
  assign io_deq_bits_uops_3_ctrl_csr_cmd = _GEN_233;
  assign io_deq_bits_uops_3_ctrl_is_load = _GEN_234;
  assign io_deq_bits_uops_3_ctrl_is_sta = _GEN_235;
  assign io_deq_bits_uops_3_ctrl_is_std = _GEN_236;
  assign io_deq_bits_uops_3_wakeup_delay = _GEN_237;
  assign io_deq_bits_uops_3_allocate_brtag = _GEN_238;
  assign io_deq_bits_uops_3_is_br_or_jmp = _GEN_239;
  assign io_deq_bits_uops_3_is_jump = _GEN_240;
  assign io_deq_bits_uops_3_is_jal = _GEN_241;
  assign io_deq_bits_uops_3_is_ret = _GEN_242;
  assign io_deq_bits_uops_3_is_call = _GEN_243;
  assign io_deq_bits_uops_3_br_mask = _GEN_244;
  assign io_deq_bits_uops_3_br_tag = _GEN_245;
  assign io_deq_bits_uops_3_br_prediction_bpd_predict_val = io_enq_bits_predictions_3_bpd_predict_val;
  assign io_deq_bits_uops_3_br_prediction_bpd_predict_taken = io_enq_bits_predictions_3_bpd_predict_taken;
  assign io_deq_bits_uops_3_br_prediction_btb_hit = io_enq_bits_predictions_3_btb_hit;
  assign io_deq_bits_uops_3_br_prediction_btb_predicted = io_enq_bits_predictions_3_btb_predicted;
  assign io_deq_bits_uops_3_br_prediction_is_br_or_jalr = io_enq_bits_predictions_3_is_br_or_jalr;
  assign io_deq_bits_uops_3_stat_brjmp_mispredicted = _GEN_246;
  assign io_deq_bits_uops_3_stat_btb_made_pred = _GEN_247;
  assign io_deq_bits_uops_3_stat_btb_mispredicted = _GEN_248;
  assign io_deq_bits_uops_3_stat_bpd_made_pred = _GEN_249;
  assign io_deq_bits_uops_3_stat_bpd_mispredicted = _GEN_250;
  assign io_deq_bits_uops_3_fetch_pc_lob = io_enq_bits_pc[3:0];
  assign io_deq_bits_uops_3_imm_packed = _GEN_251;
  assign io_deq_bits_uops_3_csr_addr = _GEN_252;
  assign io_deq_bits_uops_3_rob_idx = _GEN_253;
  assign io_deq_bits_uops_3_ldq_idx = _GEN_254;
  assign io_deq_bits_uops_3_stq_idx = _GEN_255;
  assign io_deq_bits_uops_3_brob_idx = _GEN_256;
  assign io_deq_bits_uops_3_pdst = _GEN_257;
  assign io_deq_bits_uops_3_pop1 = _GEN_258;
  assign io_deq_bits_uops_3_pop2 = _GEN_259;
  assign io_deq_bits_uops_3_pop3 = _GEN_260;
  assign io_deq_bits_uops_3_prs1_busy = _GEN_261;
  assign io_deq_bits_uops_3_prs2_busy = _GEN_262;
  assign io_deq_bits_uops_3_prs3_busy = _GEN_263;
  assign io_deq_bits_uops_3_stale_pdst = _GEN_264;
  assign io_deq_bits_uops_3_exception = _GEN_265;
  assign io_deq_bits_uops_3_exc_cause = _GEN_266;
  assign io_deq_bits_uops_3_bypassable = _GEN_267;
  assign io_deq_bits_uops_3_mem_cmd = _GEN_268;
  assign io_deq_bits_uops_3_mem_typ = _GEN_269;
  assign io_deq_bits_uops_3_is_fence = _GEN_270;
  assign io_deq_bits_uops_3_is_fencei = _GEN_271;
  assign io_deq_bits_uops_3_is_store = _GEN_272;
  assign io_deq_bits_uops_3_is_amo = _GEN_273;
  assign io_deq_bits_uops_3_is_load = _GEN_274;
  assign io_deq_bits_uops_3_is_unique = _GEN_275;
  assign io_deq_bits_uops_3_flush_on_commit = _GEN_276;
  assign io_deq_bits_uops_3_ldst = _GEN_277;
  assign io_deq_bits_uops_3_lrs1 = _GEN_278;
  assign io_deq_bits_uops_3_lrs2 = _GEN_279;
  assign io_deq_bits_uops_3_lrs3 = _GEN_280;
  assign io_deq_bits_uops_3_ldst_val = _GEN_281;
  assign io_deq_bits_uops_3_dst_rtype = _GEN_282;
  assign io_deq_bits_uops_3_lrs1_rtype = _GEN_283;
  assign io_deq_bits_uops_3_lrs2_rtype = _GEN_284;
  assign io_deq_bits_uops_3_frs3_en = _GEN_285;
  assign io_deq_bits_uops_3_fp_val = _GEN_286;
  assign io_deq_bits_uops_3_fp_single = _GEN_287;
  assign io_deq_bits_uops_3_xcpt_if = io_enq_bits_xcpt_if;
  assign io_deq_bits_uops_3_replay_if = io_enq_bits_replay_if;
  assign io_deq_bits_uops_3_debug_wdata = _GEN_288;
  assign io_deq_bits_uops_3_debug_events_fetch_seq = io_enq_bits_debug_events_3_fetch_seq;
  assign io_deq_bits_pred_resp_btb_resp_valid = io_enq_bits_pred_resp_btb_resp_valid;
  assign io_deq_bits_pred_resp_btb_resp_taken = io_enq_bits_pred_resp_btb_resp_taken;
  assign io_deq_bits_pred_resp_btb_resp_mask = io_enq_bits_pred_resp_btb_resp_mask;
  assign io_deq_bits_pred_resp_btb_resp_bridx = io_enq_bits_pred_resp_btb_resp_bridx;
  assign io_deq_bits_pred_resp_btb_resp_target = io_enq_bits_pred_resp_btb_resp_target;
  assign io_deq_bits_pred_resp_btb_resp_entry = io_enq_bits_pred_resp_btb_resp_entry;
  assign io_deq_bits_pred_resp_btb_resp_bht_history = io_enq_bits_pred_resp_btb_resp_bht_history;
  assign io_deq_bits_pred_resp_btb_resp_bht_value = io_enq_bits_pred_resp_btb_resp_bht_value;
  assign io_deq_bits_pred_resp_bpd_resp_takens = io_enq_bits_pred_resp_bpd_resp_takens;
  assign io_deq_bits_pred_resp_bpd_resp_history = io_enq_bits_pred_resp_bpd_resp_history;
  assign io_deq_bits_pred_resp_bpd_resp_history_u = io_enq_bits_pred_resp_bpd_resp_history_u;
  assign io_deq_bits_pred_resp_bpd_resp_history_ptr = io_enq_bits_pred_resp_bpd_resp_history_ptr;
  assign io_deq_bits_pred_resp_bpd_resp_info = io_enq_bits_pred_resp_bpd_resp_info;
  assign io_deq_bits_pred_resp_mask = io_enq_bits_pred_resp_mask;
  assign io_deq_bits_pred_resp_br_seen = io_enq_bits_pred_resp_br_seen;
  assign inst_idx = _GEN_8;
  assign _T_2079 = counter == 2'h1;
  assign _T_2082 = _T_2079 == 1'h0;
  assign _T_2084 = io_enq_bits_mask == 4'h2;
  assign _GEN_8 = _T_2082 ? _T_2084 : _T_2079;
  assign _T_2094 = io_kill | io_enq_ready;
  assign _GEN_9 = _T_2094 ? 2'h0 : counter;
  assign _T_2096 = io_deq_valid & io_deq_ready;
  assign _T_2098 = _T_2094 == 1'h0;
  assign _T_2099 = _T_2098 & _T_2096;
  assign _T_2101 = counter + 2'h1;
  assign _T_2102 = _T_2101[1:0];
  assign _GEN_10 = _T_2099 ? _T_2102 : _GEN_9;
  assign _T_2104 = {{1'd0}, inst_idx};
  assign _GEN_0 = _GEN_13;
  assign _GEN_11 = 2'h1 == _T_2104 ? io_enq_bits_insts_1 : io_enq_bits_insts_0;
  assign _GEN_12 = 2'h2 == _T_2104 ? io_enq_bits_insts_2 : _GEN_11;
  assign _GEN_13 = 2'h3 == _T_2104 ? io_enq_bits_insts_3 : _GEN_12;
  assign _GEN_1_bpd_predict_val = _GEN_24;
  assign _GEN_1_bpd_predict_taken = _GEN_25;
  assign _GEN_1_btb_hit = _GEN_26;
  assign _GEN_1_btb_predicted = _GEN_27;
  assign _GEN_1_is_br_or_jalr = _GEN_28;
  assign _GEN_14 = 2'h1 == _T_2104 ? io_enq_bits_predictions_1_bpd_predict_val : io_enq_bits_predictions_0_bpd_predict_val;
  assign _GEN_15 = 2'h1 == _T_2104 ? io_enq_bits_predictions_1_bpd_predict_taken : io_enq_bits_predictions_0_bpd_predict_taken;
  assign _GEN_16 = 2'h1 == _T_2104 ? io_enq_bits_predictions_1_btb_hit : io_enq_bits_predictions_0_btb_hit;
  assign _GEN_17 = 2'h1 == _T_2104 ? io_enq_bits_predictions_1_btb_predicted : io_enq_bits_predictions_0_btb_predicted;
  assign _GEN_18 = 2'h1 == _T_2104 ? io_enq_bits_predictions_1_is_br_or_jalr : io_enq_bits_predictions_0_is_br_or_jalr;
  assign _GEN_19 = 2'h2 == _T_2104 ? io_enq_bits_predictions_2_bpd_predict_val : _GEN_14;
  assign _GEN_20 = 2'h2 == _T_2104 ? io_enq_bits_predictions_2_bpd_predict_taken : _GEN_15;
  assign _GEN_21 = 2'h2 == _T_2104 ? io_enq_bits_predictions_2_btb_hit : _GEN_16;
  assign _GEN_22 = 2'h2 == _T_2104 ? io_enq_bits_predictions_2_btb_predicted : _GEN_17;
  assign _GEN_23 = 2'h2 == _T_2104 ? io_enq_bits_predictions_2_is_br_or_jalr : _GEN_18;
  assign _GEN_24 = 2'h3 == _T_2104 ? io_enq_bits_predictions_3_bpd_predict_val : _GEN_19;
  assign _GEN_25 = 2'h3 == _T_2104 ? io_enq_bits_predictions_3_bpd_predict_taken : _GEN_20;
  assign _GEN_26 = 2'h3 == _T_2104 ? io_enq_bits_predictions_3_btb_hit : _GEN_21;
  assign _GEN_27 = 2'h3 == _T_2104 ? io_enq_bits_predictions_3_btb_predicted : _GEN_22;
  assign _GEN_28 = 2'h3 == _T_2104 ? io_enq_bits_predictions_3_is_br_or_jalr : _GEN_23;
  assign _GEN_2_bpd_predict_val = _GEN_24;
  assign _GEN_2_bpd_predict_taken = _GEN_25;
  assign _GEN_2_btb_hit = _GEN_26;
  assign _GEN_2_btb_predicted = _GEN_27;
  assign _GEN_2_is_br_or_jalr = _GEN_28;
  assign _GEN_3_bpd_predict_val = _GEN_24;
  assign _GEN_3_bpd_predict_taken = _GEN_25;
  assign _GEN_3_btb_hit = _GEN_26;
  assign _GEN_3_btb_predicted = _GEN_27;
  assign _GEN_3_is_br_or_jalr = _GEN_28;
  assign _GEN_4_bpd_predict_val = _GEN_24;
  assign _GEN_4_bpd_predict_taken = _GEN_25;
  assign _GEN_4_btb_hit = _GEN_26;
  assign _GEN_4_btb_predicted = _GEN_27;
  assign _GEN_4_is_br_or_jalr = _GEN_28;
  assign _GEN_5_bpd_predict_val = _GEN_24;
  assign _GEN_5_bpd_predict_taken = _GEN_25;
  assign _GEN_5_btb_hit = _GEN_26;
  assign _GEN_5_btb_predicted = _GEN_27;
  assign _GEN_5_is_br_or_jalr = _GEN_28;
  assign _GEN_6_fetch_seq = _GEN_31;
  assign _GEN_29 = 2'h1 == _T_2104 ? io_enq_bits_debug_events_1_fetch_seq : io_enq_bits_debug_events_0_fetch_seq;
  assign _GEN_30 = 2'h2 == _T_2104 ? io_enq_bits_debug_events_2_fetch_seq : _GEN_29;
  assign _GEN_31 = 2'h3 == _T_2104 ? io_enq_bits_debug_events_3_fetch_seq : _GEN_30;
  assign _T_2122 = io_enq_bits_mask[0];
  assign _T_2123 = $signed(io_enq_bits_pc);
  assign _T_2125 = $signed(_T_2123) & $signed(40'shfffffffff0);
  assign _T_2126 = $signed(_T_2125);
  assign _T_2127 = $unsigned(_T_2126);
  assign _T_2129 = _T_2127 + 40'h0;
  assign _T_2130 = _T_2129[39:0];
  assign _T_2131 = io_enq_bits_mask[1];
  assign _T_2138 = _T_2127 + 40'h4;
  assign _T_2139 = _T_2138[39:0];
  assign _T_2140 = io_enq_bits_mask[2];
  assign _T_2147 = _T_2127 + 40'h8;
  assign _T_2148 = _T_2147[39:0];
  assign _T_2149 = io_enq_bits_mask[3];
  assign _T_2156 = _T_2127 + 40'hc;
  assign _T_2157 = _T_2156[39:0];
`ifdef RANDOMIZE
  integer initvar;
  initial begin
    `ifndef verilator
      #0.002 begin end
    `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_289 = {1{$random}};
  counter = _GEN_289[1:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_290 = {1{$random}};
  _GEN_1 = _GEN_290[1:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_291 = {1{$random}};
  _GEN_2 = _GEN_291[8:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_292 = {1{$random}};
  _GEN_3 = _GEN_292[7:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_293 = {1{$random}};
  _GEN_4 = _GEN_293[3:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_294 = {1{$random}};
  _GEN_5 = _GEN_294[1:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_295 = {1{$random}};
  _GEN_6 = _GEN_295[2:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_296 = {1{$random}};
  _GEN_7 = _GEN_296[2:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_297 = {1{$random}};
  _GEN_32 = _GEN_297[3:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_298 = {1{$random}};
  _GEN_33 = _GEN_298[0:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_299 = {1{$random}};
  _GEN_34 = _GEN_299[0:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_300 = {1{$random}};
  _GEN_35 = _GEN_300[2:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_301 = {1{$random}};
  _GEN_36 = _GEN_301[0:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_302 = {1{$random}};
  _GEN_37 = _GEN_302[0:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_303 = {1{$random}};
  _GEN_38 = _GEN_303[0:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_304 = {1{$random}};
  _GEN_39 = _GEN_304[1:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_305 = {1{$random}};
  _GEN_40 = _GEN_305[0:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_306 = {1{$random}};
  _GEN_41 = _GEN_306[0:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_307 = {1{$random}};
  _GEN_42 = _GEN_307[0:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_308 = {1{$random}};
  _GEN_43 = _GEN_308[0:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_309 = {1{$random}};
  _GEN_44 = _GEN_309[0:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_310 = {1{$random}};
  _GEN_45 = _GEN_310[0:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_311 = {1{$random}};
  _GEN_46 = _GEN_311[7:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_312 = {1{$random}};
  _GEN_47 = _GEN_312[2:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_313 = {1{$random}};
  _GEN_48 = _GEN_313[0:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_314 = {1{$random}};
  _GEN_49 = _GEN_314[0:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_315 = {1{$random}};
  _GEN_50 = _GEN_315[0:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_316 = {1{$random}};
  _GEN_51 = _GEN_316[0:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_317 = {1{$random}};
  _GEN_52 = _GEN_317[0:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_318 = {1{$random}};
  _GEN_53 = _GEN_318[19:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_319 = {1{$random}};
  _GEN_54 = _GEN_319[11:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_320 = {1{$random}};
  _GEN_55 = _GEN_320[6:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_321 = {1{$random}};
  _GEN_56 = _GEN_321[4:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_322 = {1{$random}};
  _GEN_57 = _GEN_322[4:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_323 = {1{$random}};
  _GEN_58 = _GEN_323[4:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_324 = {1{$random}};
  _GEN_59 = _GEN_324[6:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_325 = {1{$random}};
  _GEN_60 = _GEN_325[6:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_326 = {1{$random}};
  _GEN_61 = _GEN_326[6:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_327 = {1{$random}};
  _GEN_62 = _GEN_327[6:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_328 = {1{$random}};
  _GEN_63 = _GEN_328[0:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_329 = {1{$random}};
  _GEN_64 = _GEN_329[0:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_330 = {1{$random}};
  _GEN_65 = _GEN_330[0:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_331 = {1{$random}};
  _GEN_66 = _GEN_331[6:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_332 = {1{$random}};
  _GEN_67 = _GEN_332[0:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_333 = {2{$random}};
  _GEN_68 = _GEN_333[63:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_334 = {1{$random}};
  _GEN_69 = _GEN_334[0:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_335 = {1{$random}};
  _GEN_70 = _GEN_335[3:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_336 = {1{$random}};
  _GEN_71 = _GEN_336[2:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_337 = {1{$random}};
  _GEN_72 = _GEN_337[0:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_338 = {1{$random}};
  _GEN_73 = _GEN_338[0:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_339 = {1{$random}};
  _GEN_74 = _GEN_339[0:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_340 = {1{$random}};
  _GEN_75 = _GEN_340[0:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_341 = {1{$random}};
  _GEN_76 = _GEN_341[0:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_342 = {1{$random}};
  _GEN_77 = _GEN_342[0:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_343 = {1{$random}};
  _GEN_78 = _GEN_343[0:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_344 = {1{$random}};
  _GEN_79 = _GEN_344[5:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_345 = {1{$random}};
  _GEN_80 = _GEN_345[5:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_346 = {1{$random}};
  _GEN_81 = _GEN_346[5:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_347 = {1{$random}};
  _GEN_82 = _GEN_347[5:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_348 = {1{$random}};
  _GEN_83 = _GEN_348[0:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_349 = {1{$random}};
  _GEN_84 = _GEN_349[1:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_350 = {1{$random}};
  _GEN_85 = _GEN_350[1:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_351 = {1{$random}};
  _GEN_86 = _GEN_351[1:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_352 = {1{$random}};
  _GEN_87 = _GEN_352[0:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_353 = {1{$random}};
  _GEN_88 = _GEN_353[0:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_354 = {1{$random}};
  _GEN_89 = _GEN_354[0:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_355 = {2{$random}};
  _GEN_90 = _GEN_355[63:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_356 = {1{$random}};
  _GEN_91 = _GEN_356[1:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_357 = {1{$random}};
  _GEN_92 = _GEN_357[8:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_358 = {1{$random}};
  _GEN_93 = _GEN_358[7:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_359 = {1{$random}};
  _GEN_94 = _GEN_359[3:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_360 = {1{$random}};
  _GEN_95 = _GEN_360[1:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_361 = {1{$random}};
  _GEN_96 = _GEN_361[2:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_362 = {1{$random}};
  _GEN_97 = _GEN_362[2:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_363 = {1{$random}};
  _GEN_98 = _GEN_363[3:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_364 = {1{$random}};
  _GEN_99 = _GEN_364[0:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_365 = {1{$random}};
  _GEN_100 = _GEN_365[0:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_366 = {1{$random}};
  _GEN_101 = _GEN_366[2:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_367 = {1{$random}};
  _GEN_102 = _GEN_367[0:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_368 = {1{$random}};
  _GEN_103 = _GEN_368[0:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_369 = {1{$random}};
  _GEN_104 = _GEN_369[0:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_370 = {1{$random}};
  _GEN_105 = _GEN_370[1:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_371 = {1{$random}};
  _GEN_106 = _GEN_371[0:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_372 = {1{$random}};
  _GEN_107 = _GEN_372[0:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_373 = {1{$random}};
  _GEN_108 = _GEN_373[0:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_374 = {1{$random}};
  _GEN_109 = _GEN_374[0:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_375 = {1{$random}};
  _GEN_110 = _GEN_375[0:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_376 = {1{$random}};
  _GEN_111 = _GEN_376[0:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_377 = {1{$random}};
  _GEN_112 = _GEN_377[7:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_378 = {1{$random}};
  _GEN_113 = _GEN_378[2:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_379 = {1{$random}};
  _GEN_114 = _GEN_379[0:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_380 = {1{$random}};
  _GEN_115 = _GEN_380[0:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_381 = {1{$random}};
  _GEN_116 = _GEN_381[0:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_382 = {1{$random}};
  _GEN_117 = _GEN_382[0:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_383 = {1{$random}};
  _GEN_118 = _GEN_383[0:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_384 = {1{$random}};
  _GEN_119 = _GEN_384[19:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_385 = {1{$random}};
  _GEN_120 = _GEN_385[11:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_386 = {1{$random}};
  _GEN_121 = _GEN_386[6:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_387 = {1{$random}};
  _GEN_122 = _GEN_387[4:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_388 = {1{$random}};
  _GEN_123 = _GEN_388[4:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_389 = {1{$random}};
  _GEN_124 = _GEN_389[4:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_390 = {1{$random}};
  _GEN_125 = _GEN_390[6:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_391 = {1{$random}};
  _GEN_126 = _GEN_391[6:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_392 = {1{$random}};
  _GEN_127 = _GEN_392[6:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_393 = {1{$random}};
  _GEN_128 = _GEN_393[6:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_394 = {1{$random}};
  _GEN_129 = _GEN_394[0:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_395 = {1{$random}};
  _GEN_130 = _GEN_395[0:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_396 = {1{$random}};
  _GEN_131 = _GEN_396[0:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_397 = {1{$random}};
  _GEN_132 = _GEN_397[6:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_398 = {1{$random}};
  _GEN_133 = _GEN_398[0:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_399 = {2{$random}};
  _GEN_134 = _GEN_399[63:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_400 = {1{$random}};
  _GEN_135 = _GEN_400[0:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_401 = {1{$random}};
  _GEN_136 = _GEN_401[3:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_402 = {1{$random}};
  _GEN_137 = _GEN_402[2:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_403 = {1{$random}};
  _GEN_138 = _GEN_403[0:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_404 = {1{$random}};
  _GEN_139 = _GEN_404[0:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_405 = {1{$random}};
  _GEN_140 = _GEN_405[0:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_406 = {1{$random}};
  _GEN_141 = _GEN_406[0:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_407 = {1{$random}};
  _GEN_142 = _GEN_407[0:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_408 = {1{$random}};
  _GEN_143 = _GEN_408[0:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_409 = {1{$random}};
  _GEN_144 = _GEN_409[0:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_410 = {1{$random}};
  _GEN_145 = _GEN_410[5:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_411 = {1{$random}};
  _GEN_146 = _GEN_411[5:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_412 = {1{$random}};
  _GEN_147 = _GEN_412[5:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_413 = {1{$random}};
  _GEN_148 = _GEN_413[5:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_414 = {1{$random}};
  _GEN_149 = _GEN_414[0:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_415 = {1{$random}};
  _GEN_150 = _GEN_415[1:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_416 = {1{$random}};
  _GEN_151 = _GEN_416[1:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_417 = {1{$random}};
  _GEN_152 = _GEN_417[1:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_418 = {1{$random}};
  _GEN_153 = _GEN_418[0:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_419 = {1{$random}};
  _GEN_154 = _GEN_419[0:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_420 = {1{$random}};
  _GEN_155 = _GEN_420[0:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_421 = {2{$random}};
  _GEN_156 = _GEN_421[63:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_422 = {1{$random}};
  _GEN_157 = _GEN_422[1:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_423 = {1{$random}};
  _GEN_158 = _GEN_423[8:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_424 = {1{$random}};
  _GEN_159 = _GEN_424[7:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_425 = {1{$random}};
  _GEN_160 = _GEN_425[3:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_426 = {1{$random}};
  _GEN_161 = _GEN_426[1:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_427 = {1{$random}};
  _GEN_162 = _GEN_427[2:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_428 = {1{$random}};
  _GEN_163 = _GEN_428[2:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_429 = {1{$random}};
  _GEN_164 = _GEN_429[3:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_430 = {1{$random}};
  _GEN_165 = _GEN_430[0:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_431 = {1{$random}};
  _GEN_166 = _GEN_431[0:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_432 = {1{$random}};
  _GEN_167 = _GEN_432[2:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_433 = {1{$random}};
  _GEN_168 = _GEN_433[0:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_434 = {1{$random}};
  _GEN_169 = _GEN_434[0:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_435 = {1{$random}};
  _GEN_170 = _GEN_435[0:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_436 = {1{$random}};
  _GEN_171 = _GEN_436[1:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_437 = {1{$random}};
  _GEN_172 = _GEN_437[0:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_438 = {1{$random}};
  _GEN_173 = _GEN_438[0:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_439 = {1{$random}};
  _GEN_174 = _GEN_439[0:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_440 = {1{$random}};
  _GEN_175 = _GEN_440[0:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_441 = {1{$random}};
  _GEN_176 = _GEN_441[0:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_442 = {1{$random}};
  _GEN_177 = _GEN_442[0:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_443 = {1{$random}};
  _GEN_178 = _GEN_443[7:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_444 = {1{$random}};
  _GEN_179 = _GEN_444[2:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_445 = {1{$random}};
  _GEN_180 = _GEN_445[0:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_446 = {1{$random}};
  _GEN_181 = _GEN_446[0:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_447 = {1{$random}};
  _GEN_182 = _GEN_447[0:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_448 = {1{$random}};
  _GEN_183 = _GEN_448[0:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_449 = {1{$random}};
  _GEN_184 = _GEN_449[0:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_450 = {1{$random}};
  _GEN_185 = _GEN_450[19:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_451 = {1{$random}};
  _GEN_186 = _GEN_451[11:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_452 = {1{$random}};
  _GEN_187 = _GEN_452[6:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_453 = {1{$random}};
  _GEN_188 = _GEN_453[4:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_454 = {1{$random}};
  _GEN_189 = _GEN_454[4:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_455 = {1{$random}};
  _GEN_190 = _GEN_455[4:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_456 = {1{$random}};
  _GEN_191 = _GEN_456[6:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_457 = {1{$random}};
  _GEN_192 = _GEN_457[6:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_458 = {1{$random}};
  _GEN_193 = _GEN_458[6:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_459 = {1{$random}};
  _GEN_194 = _GEN_459[6:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_460 = {1{$random}};
  _GEN_195 = _GEN_460[0:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_461 = {1{$random}};
  _GEN_196 = _GEN_461[0:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_462 = {1{$random}};
  _GEN_197 = _GEN_462[0:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_463 = {1{$random}};
  _GEN_198 = _GEN_463[6:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_464 = {1{$random}};
  _GEN_199 = _GEN_464[0:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_465 = {2{$random}};
  _GEN_200 = _GEN_465[63:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_466 = {1{$random}};
  _GEN_201 = _GEN_466[0:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_467 = {1{$random}};
  _GEN_202 = _GEN_467[3:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_468 = {1{$random}};
  _GEN_203 = _GEN_468[2:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_469 = {1{$random}};
  _GEN_204 = _GEN_469[0:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_470 = {1{$random}};
  _GEN_205 = _GEN_470[0:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_471 = {1{$random}};
  _GEN_206 = _GEN_471[0:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_472 = {1{$random}};
  _GEN_207 = _GEN_472[0:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_473 = {1{$random}};
  _GEN_208 = _GEN_473[0:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_474 = {1{$random}};
  _GEN_209 = _GEN_474[0:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_475 = {1{$random}};
  _GEN_210 = _GEN_475[0:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_476 = {1{$random}};
  _GEN_211 = _GEN_476[5:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_477 = {1{$random}};
  _GEN_212 = _GEN_477[5:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_478 = {1{$random}};
  _GEN_213 = _GEN_478[5:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_479 = {1{$random}};
  _GEN_214 = _GEN_479[5:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_480 = {1{$random}};
  _GEN_215 = _GEN_480[0:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_481 = {1{$random}};
  _GEN_216 = _GEN_481[1:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_482 = {1{$random}};
  _GEN_217 = _GEN_482[1:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_483 = {1{$random}};
  _GEN_218 = _GEN_483[1:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_484 = {1{$random}};
  _GEN_219 = _GEN_484[0:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_485 = {1{$random}};
  _GEN_220 = _GEN_485[0:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_486 = {1{$random}};
  _GEN_221 = _GEN_486[0:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_487 = {2{$random}};
  _GEN_222 = _GEN_487[63:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_488 = {1{$random}};
  _GEN_223 = _GEN_488[1:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_489 = {1{$random}};
  _GEN_224 = _GEN_489[8:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_490 = {1{$random}};
  _GEN_225 = _GEN_490[7:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_491 = {1{$random}};
  _GEN_226 = _GEN_491[3:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_492 = {1{$random}};
  _GEN_227 = _GEN_492[1:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_493 = {1{$random}};
  _GEN_228 = _GEN_493[2:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_494 = {1{$random}};
  _GEN_229 = _GEN_494[2:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_495 = {1{$random}};
  _GEN_230 = _GEN_495[3:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_496 = {1{$random}};
  _GEN_231 = _GEN_496[0:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_497 = {1{$random}};
  _GEN_232 = _GEN_497[0:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_498 = {1{$random}};
  _GEN_233 = _GEN_498[2:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_499 = {1{$random}};
  _GEN_234 = _GEN_499[0:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_500 = {1{$random}};
  _GEN_235 = _GEN_500[0:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_501 = {1{$random}};
  _GEN_236 = _GEN_501[0:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_502 = {1{$random}};
  _GEN_237 = _GEN_502[1:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_503 = {1{$random}};
  _GEN_238 = _GEN_503[0:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_504 = {1{$random}};
  _GEN_239 = _GEN_504[0:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_505 = {1{$random}};
  _GEN_240 = _GEN_505[0:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_506 = {1{$random}};
  _GEN_241 = _GEN_506[0:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_507 = {1{$random}};
  _GEN_242 = _GEN_507[0:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_508 = {1{$random}};
  _GEN_243 = _GEN_508[0:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_509 = {1{$random}};
  _GEN_244 = _GEN_509[7:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_510 = {1{$random}};
  _GEN_245 = _GEN_510[2:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_511 = {1{$random}};
  _GEN_246 = _GEN_511[0:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_512 = {1{$random}};
  _GEN_247 = _GEN_512[0:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_513 = {1{$random}};
  _GEN_248 = _GEN_513[0:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_514 = {1{$random}};
  _GEN_249 = _GEN_514[0:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_515 = {1{$random}};
  _GEN_250 = _GEN_515[0:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_516 = {1{$random}};
  _GEN_251 = _GEN_516[19:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_517 = {1{$random}};
  _GEN_252 = _GEN_517[11:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_518 = {1{$random}};
  _GEN_253 = _GEN_518[6:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_519 = {1{$random}};
  _GEN_254 = _GEN_519[4:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_520 = {1{$random}};
  _GEN_255 = _GEN_520[4:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_521 = {1{$random}};
  _GEN_256 = _GEN_521[4:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_522 = {1{$random}};
  _GEN_257 = _GEN_522[6:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_523 = {1{$random}};
  _GEN_258 = _GEN_523[6:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_524 = {1{$random}};
  _GEN_259 = _GEN_524[6:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_525 = {1{$random}};
  _GEN_260 = _GEN_525[6:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_526 = {1{$random}};
  _GEN_261 = _GEN_526[0:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_527 = {1{$random}};
  _GEN_262 = _GEN_527[0:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_528 = {1{$random}};
  _GEN_263 = _GEN_528[0:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_529 = {1{$random}};
  _GEN_264 = _GEN_529[6:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_530 = {1{$random}};
  _GEN_265 = _GEN_530[0:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_531 = {2{$random}};
  _GEN_266 = _GEN_531[63:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_532 = {1{$random}};
  _GEN_267 = _GEN_532[0:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_533 = {1{$random}};
  _GEN_268 = _GEN_533[3:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_534 = {1{$random}};
  _GEN_269 = _GEN_534[2:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_535 = {1{$random}};
  _GEN_270 = _GEN_535[0:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_536 = {1{$random}};
  _GEN_271 = _GEN_536[0:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_537 = {1{$random}};
  _GEN_272 = _GEN_537[0:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_538 = {1{$random}};
  _GEN_273 = _GEN_538[0:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_539 = {1{$random}};
  _GEN_274 = _GEN_539[0:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_540 = {1{$random}};
  _GEN_275 = _GEN_540[0:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_541 = {1{$random}};
  _GEN_276 = _GEN_541[0:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_542 = {1{$random}};
  _GEN_277 = _GEN_542[5:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_543 = {1{$random}};
  _GEN_278 = _GEN_543[5:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_544 = {1{$random}};
  _GEN_279 = _GEN_544[5:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_545 = {1{$random}};
  _GEN_280 = _GEN_545[5:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_546 = {1{$random}};
  _GEN_281 = _GEN_546[0:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_547 = {1{$random}};
  _GEN_282 = _GEN_547[1:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_548 = {1{$random}};
  _GEN_283 = _GEN_548[1:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_549 = {1{$random}};
  _GEN_284 = _GEN_549[1:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_550 = {1{$random}};
  _GEN_285 = _GEN_550[0:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_551 = {1{$random}};
  _GEN_286 = _GEN_551[0:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_552 = {1{$random}};
  _GEN_287 = _GEN_552[0:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_553 = {2{$random}};
  _GEN_288 = _GEN_553[63:0];
  `endif
  end
`endif
  always @(posedge clock) begin
    if (reset) begin
      counter <= 2'h0;
    end else begin
      if (_T_2099) begin
        counter <= _T_2102;
      end else begin
        if (_T_2094) begin
          counter <= 2'h0;
        end
      end
    end
  end
endmodule