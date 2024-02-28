module IssueSlot(
  input   clock,
  input   reset,
  output  io_valid,
  output  io_will_be_valid,
  output  io_request,
  output  io_request_hp,
  input   io_grant,
  input   io_brinfo_valid,
  input   io_brinfo_mispredict,
  input  [7:0] io_brinfo_mask,
  input  [2:0] io_brinfo_tag,
  input  [7:0] io_brinfo_exe_mask,
  input  [6:0] io_brinfo_rob_idx,
  input  [4:0] io_brinfo_ldq_idx,
  input  [4:0] io_brinfo_stq_idx,
  input   io_brinfo_taken,
  input   io_brinfo_is_jr,
  input   io_brinfo_btb_made_pred,
  input   io_brinfo_btb_mispredict,
  input   io_brinfo_bpd_made_pred,
  input   io_brinfo_bpd_mispredict,
  input   io_kill,
  input   io_clear,
  input   io_wakeup_dsts_0_valid,
  input  [6:0] io_wakeup_dsts_0_bits,
  input   io_wakeup_dsts_1_valid,
  input  [6:0] io_wakeup_dsts_1_bits,
  input   io_wakeup_dsts_2_valid,
  input  [6:0] io_wakeup_dsts_2_bits,
  input   io_wakeup_dsts_3_valid,
  input  [6:0] io_wakeup_dsts_3_bits,
  input   io_wakeup_dsts_4_valid,
  input  [6:0] io_wakeup_dsts_4_bits,
  input   io_wakeup_dsts_5_valid,
  input  [6:0] io_wakeup_dsts_5_bits,
  input   io_wakeup_dsts_6_valid,
  input  [6:0] io_wakeup_dsts_6_bits,
  input   io_in_uop_valid,
  input   io_in_uop_bits_valid,
  input  [1:0] io_in_uop_bits_iw_state,
  input  [8:0] io_in_uop_bits_uopc,
  input  [31:0] io_in_uop_bits_inst,
  input  [39:0] io_in_uop_bits_pc,
  input  [7:0] io_in_uop_bits_fu_code,
  input  [3:0] io_in_uop_bits_ctrl_br_type,
  input  [1:0] io_in_uop_bits_ctrl_op1_sel,
  input  [2:0] io_in_uop_bits_ctrl_op2_sel,
  input  [2:0] io_in_uop_bits_ctrl_imm_sel,
  input  [3:0] io_in_uop_bits_ctrl_op_fcn,
  input   io_in_uop_bits_ctrl_fcn_dw,
  input   io_in_uop_bits_ctrl_rf_wen,
  input  [2:0] io_in_uop_bits_ctrl_csr_cmd,
  input   io_in_uop_bits_ctrl_is_load,
  input   io_in_uop_bits_ctrl_is_sta,
  input   io_in_uop_bits_ctrl_is_std,
  input  [1:0] io_in_uop_bits_wakeup_delay,
  input   io_in_uop_bits_allocate_brtag,
  input   io_in_uop_bits_is_br_or_jmp,
  input   io_in_uop_bits_is_jump,
  input   io_in_uop_bits_is_jal,
  input   io_in_uop_bits_is_ret,
  input   io_in_uop_bits_is_call,
  input  [7:0] io_in_uop_bits_br_mask,
  input  [2:0] io_in_uop_bits_br_tag,
  input   io_in_uop_bits_br_prediction_bpd_predict_val,
  input   io_in_uop_bits_br_prediction_bpd_predict_taken,
  input   io_in_uop_bits_br_prediction_btb_hit,
  input   io_in_uop_bits_br_prediction_btb_predicted,
  input   io_in_uop_bits_br_prediction_is_br_or_jalr,
  input   io_in_uop_bits_stat_brjmp_mispredicted,
  input   io_in_uop_bits_stat_btb_made_pred,
  input   io_in_uop_bits_stat_btb_mispredicted,
  input   io_in_uop_bits_stat_bpd_made_pred,
  input   io_in_uop_bits_stat_bpd_mispredicted,
  input  [3:0] io_in_uop_bits_fetch_pc_lob,
  input  [19:0] io_in_uop_bits_imm_packed,
  input  [11:0] io_in_uop_bits_csr_addr,
  input  [6:0] io_in_uop_bits_rob_idx,
  input  [4:0] io_in_uop_bits_ldq_idx,
  input  [4:0] io_in_uop_bits_stq_idx,
  input  [4:0] io_in_uop_bits_brob_idx,
  input  [6:0] io_in_uop_bits_pdst,
  input  [6:0] io_in_uop_bits_pop1,
  input  [6:0] io_in_uop_bits_pop2,
  input  [6:0] io_in_uop_bits_pop3,
  input   io_in_uop_bits_prs1_busy,
  input   io_in_uop_bits_prs2_busy,
  input   io_in_uop_bits_prs3_busy,
  input  [6:0] io_in_uop_bits_stale_pdst,
  input   io_in_uop_bits_exception,
  input  [63:0] io_in_uop_bits_exc_cause,
  input   io_in_uop_bits_bypassable,
  input  [3:0] io_in_uop_bits_mem_cmd,
  input  [2:0] io_in_uop_bits_mem_typ,
  input   io_in_uop_bits_is_fence,
  input   io_in_uop_bits_is_fencei,
  input   io_in_uop_bits_is_store,
  input   io_in_uop_bits_is_amo,
  input   io_in_uop_bits_is_load,
  input   io_in_uop_bits_is_unique,
  input   io_in_uop_bits_flush_on_commit,
  input  [5:0] io_in_uop_bits_ldst,
  input  [5:0] io_in_uop_bits_lrs1,
  input  [5:0] io_in_uop_bits_lrs2,
  input  [5:0] io_in_uop_bits_lrs3,
  input   io_in_uop_bits_ldst_val,
  input  [1:0] io_in_uop_bits_dst_rtype,
  input  [1:0] io_in_uop_bits_lrs1_rtype,
  input  [1:0] io_in_uop_bits_lrs2_rtype,
  input   io_in_uop_bits_frs3_en,
  input   io_in_uop_bits_fp_val,
  input   io_in_uop_bits_fp_single,
  input   io_in_uop_bits_xcpt_if,
  input   io_in_uop_bits_replay_if,
  input  [63:0] io_in_uop_bits_debug_wdata,
  input  [31:0] io_in_uop_bits_debug_events_fetch_seq,
  output  io_updated_uop_valid,
  output [1:0] io_updated_uop_iw_state,
  output [8:0] io_updated_uop_uopc,
  output [31:0] io_updated_uop_inst,
  output [39:0] io_updated_uop_pc,
  output [7:0] io_updated_uop_fu_code,
  output [3:0] io_updated_uop_ctrl_br_type,
  output [1:0] io_updated_uop_ctrl_op1_sel,
  output [2:0] io_updated_uop_ctrl_op2_sel,
  output [2:0] io_updated_uop_ctrl_imm_sel,
  output [3:0] io_updated_uop_ctrl_op_fcn,
  output  io_updated_uop_ctrl_fcn_dw,
  output  io_updated_uop_ctrl_rf_wen,
  output [2:0] io_updated_uop_ctrl_csr_cmd,
  output  io_updated_uop_ctrl_is_load,
  output  io_updated_uop_ctrl_is_sta,
  output  io_updated_uop_ctrl_is_std,
  output [1:0] io_updated_uop_wakeup_delay,
  output  io_updated_uop_allocate_brtag,
  output  io_updated_uop_is_br_or_jmp,
  output  io_updated_uop_is_jump,
  output  io_updated_uop_is_jal,
  output  io_updated_uop_is_ret,
  output  io_updated_uop_is_call,
  output [7:0] io_updated_uop_br_mask,
  output [2:0] io_updated_uop_br_tag,
  output  io_updated_uop_br_prediction_bpd_predict_val,
  output  io_updated_uop_br_prediction_bpd_predict_taken,
  output  io_updated_uop_br_prediction_btb_hit,
  output  io_updated_uop_br_prediction_btb_predicted,
  output  io_updated_uop_br_prediction_is_br_or_jalr,
  output  io_updated_uop_stat_brjmp_mispredicted,
  output  io_updated_uop_stat_btb_made_pred,
  output  io_updated_uop_stat_btb_mispredicted,
  output  io_updated_uop_stat_bpd_made_pred,
  output  io_updated_uop_stat_bpd_mispredicted,
  output [3:0] io_updated_uop_fetch_pc_lob,
  output [19:0] io_updated_uop_imm_packed,
  output [11:0] io_updated_uop_csr_addr,
  output [6:0] io_updated_uop_rob_idx,
  output [4:0] io_updated_uop_ldq_idx,
  output [4:0] io_updated_uop_stq_idx,
  output [4:0] io_updated_uop_brob_idx,
  output [6:0] io_updated_uop_pdst,
  output [6:0] io_updated_uop_pop1,
  output [6:0] io_updated_uop_pop2,
  output [6:0] io_updated_uop_pop3,
  output  io_updated_uop_prs1_busy,
  output  io_updated_uop_prs2_busy,
  output  io_updated_uop_prs3_busy,
  output [6:0] io_updated_uop_stale_pdst,
  output  io_updated_uop_exception,
  output [63:0] io_updated_uop_exc_cause,
  output  io_updated_uop_bypassable,
  output [3:0] io_updated_uop_mem_cmd,
  output [2:0] io_updated_uop_mem_typ,
  output  io_updated_uop_is_fence,
  output  io_updated_uop_is_fencei,
  output  io_updated_uop_is_store,
  output  io_updated_uop_is_amo,
  output  io_updated_uop_is_load,
  output  io_updated_uop_is_unique,
  output  io_updated_uop_flush_on_commit,
  output [5:0] io_updated_uop_ldst,
  output [5:0] io_updated_uop_lrs1,
  output [5:0] io_updated_uop_lrs2,
  output [5:0] io_updated_uop_lrs3,
  output  io_updated_uop_ldst_val,
  output [1:0] io_updated_uop_dst_rtype,
  output [1:0] io_updated_uop_lrs1_rtype,
  output [1:0] io_updated_uop_lrs2_rtype,
  output  io_updated_uop_frs3_en,
  output  io_updated_uop_fp_val,
  output  io_updated_uop_fp_single,
  output  io_updated_uop_xcpt_if,
  output  io_updated_uop_replay_if,
  output [63:0] io_updated_uop_debug_wdata,
  output [31:0] io_updated_uop_debug_events_fetch_seq,
  output  io_uop_valid,
  output [1:0] io_uop_iw_state,
  output [8:0] io_uop_uopc,
  output [31:0] io_uop_inst,
  output [39:0] io_uop_pc,
  output [7:0] io_uop_fu_code,
  output [3:0] io_uop_ctrl_br_type,
  output [1:0] io_uop_ctrl_op1_sel,
  output [2:0] io_uop_ctrl_op2_sel,
  output [2:0] io_uop_ctrl_imm_sel,
  output [3:0] io_uop_ctrl_op_fcn,
  output  io_uop_ctrl_fcn_dw,
  output  io_uop_ctrl_rf_wen,
  output [2:0] io_uop_ctrl_csr_cmd,
  output  io_uop_ctrl_is_load,
  output  io_uop_ctrl_is_sta,
  output  io_uop_ctrl_is_std,
  output [1:0] io_uop_wakeup_delay,
  output  io_uop_allocate_brtag,
  output  io_uop_is_br_or_jmp,
  output  io_uop_is_jump,
  output  io_uop_is_jal,
  output  io_uop_is_ret,
  output  io_uop_is_call,
  output [7:0] io_uop_br_mask,
  output [2:0] io_uop_br_tag,
  output  io_uop_br_prediction_bpd_predict_val,
  output  io_uop_br_prediction_bpd_predict_taken,
  output  io_uop_br_prediction_btb_hit,
  output  io_uop_br_prediction_btb_predicted,
  output  io_uop_br_prediction_is_br_or_jalr,
  output  io_uop_stat_brjmp_mispredicted,
  output  io_uop_stat_btb_made_pred,
  output  io_uop_stat_btb_mispredicted,
  output  io_uop_stat_bpd_made_pred,
  output  io_uop_stat_bpd_mispredicted,
  output [3:0] io_uop_fetch_pc_lob,
  output [19:0] io_uop_imm_packed,
  output [11:0] io_uop_csr_addr,
  output [6:0] io_uop_rob_idx,
  output [4:0] io_uop_ldq_idx,
  output [4:0] io_uop_stq_idx,
  output [4:0] io_uop_brob_idx,
  output [6:0] io_uop_pdst,
  output [6:0] io_uop_pop1,
  output [6:0] io_uop_pop2,
  output [6:0] io_uop_pop3,
  output  io_uop_prs1_busy,
  output  io_uop_prs2_busy,
  output  io_uop_prs3_busy,
  output [6:0] io_uop_stale_pdst,
  output  io_uop_exception,
  output [63:0] io_uop_exc_cause,
  output  io_uop_bypassable,
  output [3:0] io_uop_mem_cmd,
  output [2:0] io_uop_mem_typ,
  output  io_uop_is_fence,
  output  io_uop_is_fencei,
  output  io_uop_is_store,
  output  io_uop_is_amo,
  output  io_uop_is_load,
  output  io_uop_is_unique,
  output  io_uop_flush_on_commit,
  output [5:0] io_uop_ldst,
  output [5:0] io_uop_lrs1,
  output [5:0] io_uop_lrs2,
  output [5:0] io_uop_lrs3,
  output  io_uop_ldst_val,
  output [1:0] io_uop_dst_rtype,
  output [1:0] io_uop_lrs1_rtype,
  output [1:0] io_uop_lrs2_rtype,
  output  io_uop_frs3_en,
  output  io_uop_fp_val,
  output  io_uop_fp_single,
  output  io_uop_xcpt_if,
  output  io_uop_replay_if,
  output [63:0] io_uop_debug_wdata,
  output [31:0] io_uop_debug_events_fetch_seq,
  output  io_debug_p1,
  output  io_debug_p2,
  output  io_debug_p3
);
  wire [1:0] updated_state;
  wire [8:0] updated_uopc;
  wire  next_p1;
  wire  next_p2;
  wire  next_p3;
  reg [1:0] slot_state;
  reg [31:0] _GEN_191;
  reg  slot_p1;
  reg [31:0] _GEN_192;
  reg  slot_p2;
  reg [31:0] _GEN_193;
  reg  slot_p3;
  reg [31:0] _GEN_194;
  reg  slot_is_2uops;
  reg [31:0] _GEN_195;
  wire  _T_1011_valid;
  wire [1:0] _T_1011_iw_state;
  wire [8:0] _T_1011_uopc;
  wire [31:0] _T_1011_inst;
  wire [39:0] _T_1011_pc;
  wire [7:0] _T_1011_fu_code;
  wire [3:0] _T_1011_ctrl_br_type;
  wire [1:0] _T_1011_ctrl_op1_sel;
  wire [2:0] _T_1011_ctrl_op2_sel;
  wire [2:0] _T_1011_ctrl_imm_sel;
  wire [3:0] _T_1011_ctrl_op_fcn;
  wire  _T_1011_ctrl_fcn_dw;
  wire  _T_1011_ctrl_rf_wen;
  wire [2:0] _T_1011_ctrl_csr_cmd;
  wire  _T_1011_ctrl_is_load;
  wire  _T_1011_ctrl_is_sta;
  wire  _T_1011_ctrl_is_std;
  wire [1:0] _T_1011_wakeup_delay;
  wire  _T_1011_allocate_brtag;
  wire  _T_1011_is_br_or_jmp;
  wire  _T_1011_is_jump;
  wire  _T_1011_is_jal;
  wire  _T_1011_is_ret;
  wire  _T_1011_is_call;
  wire [7:0] _T_1011_br_mask;
  wire [2:0] _T_1011_br_tag;
  wire  _T_1011_br_prediction_bpd_predict_val;
  wire  _T_1011_br_prediction_bpd_predict_taken;
  wire  _T_1011_br_prediction_btb_hit;
  wire  _T_1011_br_prediction_btb_predicted;
  wire  _T_1011_br_prediction_is_br_or_jalr;
  wire  _T_1011_stat_brjmp_mispredicted;
  wire  _T_1011_stat_btb_made_pred;
  wire  _T_1011_stat_btb_mispredicted;
  wire  _T_1011_stat_bpd_made_pred;
  wire  _T_1011_stat_bpd_mispredicted;
  wire [3:0] _T_1011_fetch_pc_lob;
  wire [19:0] _T_1011_imm_packed;
  wire [11:0] _T_1011_csr_addr;
  wire [6:0] _T_1011_rob_idx;
  wire [4:0] _T_1011_ldq_idx;
  wire [4:0] _T_1011_stq_idx;
  wire [4:0] _T_1011_brob_idx;
  wire [6:0] _T_1011_pdst;
  wire [6:0] _T_1011_pop1;
  wire [6:0] _T_1011_pop2;
  wire [6:0] _T_1011_pop3;
  wire  _T_1011_prs1_busy;
  wire  _T_1011_prs2_busy;
  wire  _T_1011_prs3_busy;
  wire [6:0] _T_1011_stale_pdst;
  wire  _T_1011_exception;
  wire [63:0] _T_1011_exc_cause;
  wire  _T_1011_bypassable;
  wire [3:0] _T_1011_mem_cmd;
  wire [2:0] _T_1011_mem_typ;
  wire  _T_1011_is_fence;
  wire  _T_1011_is_fencei;
  wire  _T_1011_is_store;
  wire  _T_1011_is_amo;
  wire  _T_1011_is_load;
  wire  _T_1011_is_unique;
  wire  _T_1011_flush_on_commit;
  wire [5:0] _T_1011_ldst;
  wire [5:0] _T_1011_lrs1;
  wire [5:0] _T_1011_lrs2;
  wire [5:0] _T_1011_lrs3;
  wire  _T_1011_ldst_val;
  wire [1:0] _T_1011_dst_rtype;
  wire [1:0] _T_1011_lrs1_rtype;
  wire [1:0] _T_1011_lrs2_rtype;
  wire  _T_1011_frs3_en;
  wire  _T_1011_fp_val;
  wire  _T_1011_fp_single;
  wire  _T_1011_xcpt_if;
  wire  _T_1011_replay_if;
  wire [63:0] _T_1011_debug_wdata;
  wire [31:0] _T_1011_debug_events_fetch_seq;
  wire [3:0] _T_1116_br_type;
  wire [1:0] _T_1116_op1_sel;
  wire [2:0] _T_1116_op2_sel;
  wire [2:0] _T_1116_imm_sel;
  wire [3:0] _T_1116_op_fcn;
  wire  _T_1116_fcn_dw;
  wire  _T_1116_rf_wen;
  wire [2:0] _T_1116_csr_cmd;
  wire  _T_1116_is_load;
  wire  _T_1116_is_sta;
  wire  _T_1116_is_std;
  reg  slotUop_valid;
  reg [31:0] _GEN_196;
  reg [1:0] slotUop_iw_state;
  reg [31:0] _GEN_197;
  reg [8:0] slotUop_uopc;
  reg [31:0] _GEN_198;
  reg [31:0] slotUop_inst;
  reg [31:0] _GEN_199;
  reg [39:0] slotUop_pc;
  reg [63:0] _GEN_200;
  reg [7:0] slotUop_fu_code;
  reg [31:0] _GEN_201;
  reg [3:0] slotUop_ctrl_br_type;
  reg [31:0] _GEN_202;
  reg [1:0] slotUop_ctrl_op1_sel;
  reg [31:0] _GEN_203;
  reg [2:0] slotUop_ctrl_op2_sel;
  reg [31:0] _GEN_204;
  reg [2:0] slotUop_ctrl_imm_sel;
  reg [31:0] _GEN_205;
  reg [3:0] slotUop_ctrl_op_fcn;
  reg [31:0] _GEN_206;
  reg  slotUop_ctrl_fcn_dw;
  reg [31:0] _GEN_207;
  reg  slotUop_ctrl_rf_wen;
  reg [31:0] _GEN_208;
  reg [2:0] slotUop_ctrl_csr_cmd;
  reg [31:0] _GEN_209;
  reg  slotUop_ctrl_is_load;
  reg [31:0] _GEN_210;
  reg  slotUop_ctrl_is_sta;
  reg [31:0] _GEN_211;
  reg  slotUop_ctrl_is_std;
  reg [31:0] _GEN_212;
  reg [1:0] slotUop_wakeup_delay;
  reg [31:0] _GEN_213;
  reg  slotUop_allocate_brtag;
  reg [31:0] _GEN_214;
  reg  slotUop_is_br_or_jmp;
  reg [31:0] _GEN_215;
  reg  slotUop_is_jump;
  reg [31:0] _GEN_216;
  reg  slotUop_is_jal;
  reg [31:0] _GEN_217;
  reg  slotUop_is_ret;
  reg [31:0] _GEN_218;
  reg  slotUop_is_call;
  reg [31:0] _GEN_219;
  reg [7:0] slotUop_br_mask;
  reg [31:0] _GEN_220;
  reg [2:0] slotUop_br_tag;
  reg [31:0] _GEN_221;
  reg  slotUop_br_prediction_bpd_predict_val;
  reg [31:0] _GEN_222;
  reg  slotUop_br_prediction_bpd_predict_taken;
  reg [31:0] _GEN_223;
  reg  slotUop_br_prediction_btb_hit;
  reg [31:0] _GEN_224;
  reg  slotUop_br_prediction_btb_predicted;
  reg [31:0] _GEN_225;
  reg  slotUop_br_prediction_is_br_or_jalr;
  reg [31:0] _GEN_226;
  reg  slotUop_stat_brjmp_mispredicted;
  reg [31:0] _GEN_227;
  reg  slotUop_stat_btb_made_pred;
  reg [31:0] _GEN_228;
  reg  slotUop_stat_btb_mispredicted;
  reg [31:0] _GEN_229;
  reg  slotUop_stat_bpd_made_pred;
  reg [31:0] _GEN_230;
  reg  slotUop_stat_bpd_mispredicted;
  reg [31:0] _GEN_231;
  reg [3:0] slotUop_fetch_pc_lob;
  reg [31:0] _GEN_232;
  reg [19:0] slotUop_imm_packed;
  reg [31:0] _GEN_233;
  reg [11:0] slotUop_csr_addr;
  reg [31:0] _GEN_234;
  reg [6:0] slotUop_rob_idx;
  reg [31:0] _GEN_235;
  reg [4:0] slotUop_ldq_idx;
  reg [31:0] _GEN_236;
  reg [4:0] slotUop_stq_idx;
  reg [31:0] _GEN_237;
  reg [4:0] slotUop_brob_idx;
  reg [31:0] _GEN_238;
  reg [6:0] slotUop_pdst;
  reg [31:0] _GEN_239;
  reg [6:0] slotUop_pop1;
  reg [31:0] _GEN_240;
  reg [6:0] slotUop_pop2;
  reg [31:0] _GEN_241;
  reg [6:0] slotUop_pop3;
  reg [31:0] _GEN_242;
  reg  slotUop_prs1_busy;
  reg [31:0] _GEN_243;
  reg  slotUop_prs2_busy;
  reg [31:0] _GEN_244;
  reg  slotUop_prs3_busy;
  reg [31:0] _GEN_245;
  reg [6:0] slotUop_stale_pdst;
  reg [31:0] _GEN_246;
  reg  slotUop_exception;
  reg [31:0] _GEN_247;
  reg [63:0] slotUop_exc_cause;
  reg [63:0] _GEN_248;
  reg  slotUop_bypassable;
  reg [31:0] _GEN_249;
  reg [3:0] slotUop_mem_cmd;
  reg [31:0] _GEN_250;
  reg [2:0] slotUop_mem_typ;
  reg [31:0] _GEN_251;
  reg  slotUop_is_fence;
  reg [31:0] _GEN_252;
  reg  slotUop_is_fencei;
  reg [31:0] _GEN_253;
  reg  slotUop_is_store;
  reg [31:0] _GEN_254;
  reg  slotUop_is_amo;
  reg [31:0] _GEN_255;
  reg  slotUop_is_load;
  reg [31:0] _GEN_256;
  reg  slotUop_is_unique;
  reg [31:0] _GEN_257;
  reg  slotUop_flush_on_commit;
  reg [31:0] _GEN_258;
  reg [5:0] slotUop_ldst;
  reg [31:0] _GEN_259;
  reg [5:0] slotUop_lrs1;
  reg [31:0] _GEN_260;
  reg [5:0] slotUop_lrs2;
  reg [31:0] _GEN_261;
  reg [5:0] slotUop_lrs3;
  reg [31:0] _GEN_262;
  reg  slotUop_ldst_val;
  reg [31:0] _GEN_263;
  reg [1:0] slotUop_dst_rtype;
  reg [31:0] _GEN_264;
  reg [1:0] slotUop_lrs1_rtype;
  reg [31:0] _GEN_265;
  reg [1:0] slotUop_lrs2_rtype;
  reg [31:0] _GEN_266;
  reg  slotUop_frs3_en;
  reg [31:0] _GEN_267;
  reg  slotUop_fp_val;
  reg [31:0] _GEN_268;
  reg  slotUop_fp_single;
  reg [31:0] _GEN_269;
  reg  slotUop_xcpt_if;
  reg [31:0] _GEN_270;
  reg  slotUop_replay_if;
  reg [31:0] _GEN_271;
  reg [63:0] slotUop_debug_wdata;
  reg [63:0] _GEN_272;
  reg [31:0] slotUop_debug_events_fetch_seq;
  reg [31:0] _GEN_273;
  wire [1:0] _GEN_0;
  wire  _T_1218;
  wire  _T_1219;
  wire [1:0] _GEN_1;
  wire  _T_1223;
  wire  _T_1224;
  wire  _T_1225;
  wire [1:0] _GEN_2;
  wire  _T_1232;
  wire  _T_1233;
  wire [1:0] _GEN_3;
  wire  _T_1234;
  wire  _T_1235;
  wire  _T_1236;
  wire  _T_1237;
  wire  _T_1238;
  wire  _T_1239;
  wire  _T_1240;
  wire  _T_1241;
  wire [1:0] _GEN_4;
  wire  _T_1245;
  wire  _T_1246;
  wire [8:0] _GEN_5;
  wire [1:0] _GEN_7;
  wire  _T_1248;
  wire [1:0] _GEN_8;
  wire [1:0] _GEN_9;
  wire [8:0] _GEN_10;
  wire [1:0] _GEN_12;
  wire [1:0] _GEN_13;
  wire  _T_1249;
  wire  _T_1250;
  wire  _T_1251;
  wire  _T_1252;
  wire  _T_1254;
  wire  _GEN_14;
  wire [1:0] _GEN_15;
  wire [8:0] _GEN_16;
  wire [31:0] _GEN_17;
  wire [39:0] _GEN_18;
  wire [7:0] _GEN_19;
  wire [3:0] _GEN_20;
  wire [1:0] _GEN_21;
  wire [2:0] _GEN_22;
  wire [2:0] _GEN_23;
  wire [3:0] _GEN_24;
  wire  _GEN_25;
  wire  _GEN_26;
  wire [2:0] _GEN_27;
  wire  _GEN_28;
  wire  _GEN_29;
  wire  _GEN_30;
  wire [1:0] _GEN_31;
  wire  _GEN_32;
  wire  _GEN_33;
  wire  _GEN_34;
  wire  _GEN_35;
  wire  _GEN_36;
  wire  _GEN_37;
  wire [7:0] _GEN_38;
  wire [2:0] _GEN_39;
  wire  _GEN_40;
  wire  _GEN_41;
  wire  _GEN_42;
  wire  _GEN_43;
  wire  _GEN_44;
  wire  _GEN_45;
  wire  _GEN_46;
  wire  _GEN_47;
  wire  _GEN_48;
  wire  _GEN_49;
  wire [3:0] _GEN_50;
  wire [19:0] _GEN_51;
  wire [11:0] _GEN_52;
  wire [6:0] _GEN_53;
  wire [4:0] _GEN_54;
  wire [4:0] _GEN_55;
  wire [4:0] _GEN_56;
  wire [6:0] _GEN_57;
  wire [6:0] _GEN_58;
  wire [6:0] _GEN_59;
  wire [6:0] _GEN_60;
  wire  _GEN_61;
  wire  _GEN_62;
  wire  _GEN_63;
  wire [6:0] _GEN_64;
  wire  _GEN_65;
  wire [63:0] _GEN_66;
  wire  _GEN_67;
  wire [3:0] _GEN_68;
  wire [2:0] _GEN_69;
  wire  _GEN_70;
  wire  _GEN_71;
  wire  _GEN_72;
  wire  _GEN_73;
  wire  _GEN_74;
  wire  _GEN_75;
  wire  _GEN_76;
  wire [5:0] _GEN_77;
  wire [5:0] _GEN_78;
  wire [5:0] _GEN_79;
  wire [5:0] _GEN_80;
  wire  _GEN_81;
  wire [1:0] _GEN_82;
  wire [1:0] _GEN_83;
  wire [1:0] _GEN_84;
  wire  _GEN_85;
  wire  _GEN_86;
  wire  _GEN_87;
  wire  _GEN_88;
  wire  _GEN_89;
  wire [63:0] _GEN_90;
  wire [31:0] _GEN_91;
  wire  out_p1;
  wire  out_p2;
  wire  out_p3;
  wire  _T_1262;
  wire  _T_1264;
  wire  _T_1266;
  wire  _GEN_92;
  wire  _GEN_93;
  wire  _GEN_94;
  wire  _GEN_95;
  wire  _GEN_96;
  wire  _GEN_97;
  wire  _T_1269;
  wire  _T_1270;
  wire  _GEN_98;
  wire  _T_1272;
  wire  _T_1273;
  wire  _GEN_99;
  wire  _T_1275;
  wire  _T_1276;
  wire  _GEN_100;
  wire  _T_1278;
  wire  _T_1279;
  wire  _GEN_101;
  wire  _T_1281;
  wire  _T_1282;
  wire  _GEN_102;
  wire  _T_1284;
  wire  _T_1285;
  wire  _GEN_103;
  wire  _T_1287;
  wire  _T_1288;
  wire  _GEN_104;
  wire  _T_1290;
  wire  _T_1291;
  wire  _GEN_105;
  wire  _T_1293;
  wire  _T_1294;
  wire  _GEN_106;
  wire  _T_1296;
  wire  _T_1297;
  wire  _GEN_107;
  wire  _T_1299;
  wire  _T_1300;
  wire  _GEN_108;
  wire  _T_1302;
  wire  _T_1303;
  wire  _GEN_109;
  wire  _T_1305;
  wire  _T_1306;
  wire  _GEN_110;
  wire  _T_1308;
  wire  _T_1309;
  wire  _GEN_111;
  wire  _T_1311;
  wire  _T_1312;
  wire  _GEN_112;
  wire  _T_1314;
  wire  _T_1315;
  wire  _GEN_113;
  wire  _T_1317;
  wire  _T_1318;
  wire  _GEN_114;
  wire  _T_1320;
  wire  _T_1321;
  wire  _GEN_115;
  wire  _T_1323;
  wire  _T_1324;
  wire  _GEN_116;
  wire  _T_1326;
  wire  _T_1327;
  wire  _GEN_117;
  wire  _T_1329;
  wire  _T_1330;
  wire  _GEN_118;
  wire [7:0] _T_1332;
  wire [7:0] _T_1333;
  wire [7:0] out_br_mask;
  wire  _T_1334;
  wire [7:0] _T_1335;
  wire  _T_1337;
  wire  _T_1338;
  wire [1:0] _GEN_119;
  wire [7:0] _GEN_120;
  wire  _T_1341;
  wire  _T_1342;
  wire  _T_1343;
  wire  _T_1344;
  wire  _T_1347;
  wire  _T_1348;
  wire  _T_1350;
  wire  _T_1351;
  wire  _T_1354;
  wire  _GEN_121;
  wire  _T_1357;
  wire  _T_1358;
  wire  _T_1359;
  wire  _T_1362;
  wire  _GEN_122;
  wire  _T_1366;
  wire  _T_1367;
  wire  _GEN_123;
  wire  _T_1373;
  wire  _T_1374;
  wire  _T_1375;
  wire  _T_1376;
  wire  _T_1378;
  wire  _T_1379;
  wire  _T_1381;
  wire  _T_1383;
  wire  _T_1385;
  wire  _T_1389;
  wire  _T_1390;
  wire [1:0] _GEN_125;
  wire  _T_1395;
  wire  _T_1396;
  wire [8:0] _GEN_126;
  wire [1:0] _GEN_127;
  wire [8:0] _GEN_128;
  wire [1:0] _GEN_129;
  wire [1:0] _GEN_130;
  reg [1:0] _GEN_6;
  reg [31:0] _GEN_274;
  reg [31:0] _GEN_11;
  reg [31:0] _GEN_275;
  reg [39:0] _GEN_124;
  reg [63:0] _GEN_276;
  reg [7:0] _GEN_131;
  reg [31:0] _GEN_277;
  reg [1:0] _GEN_132;
  reg [31:0] _GEN_278;
  reg  _GEN_133;
  reg [31:0] _GEN_279;
  reg  _GEN_134;
  reg [31:0] _GEN_280;
  reg  _GEN_135;
  reg [31:0] _GEN_281;
  reg  _GEN_136;
  reg [31:0] _GEN_282;
  reg  _GEN_137;
  reg [31:0] _GEN_283;
  reg [7:0] _GEN_138;
  reg [31:0] _GEN_284;
  reg [2:0] _GEN_139;
  reg [31:0] _GEN_285;
  reg  _GEN_140;
  reg [31:0] _GEN_286;
  reg  _GEN_141;
  reg [31:0] _GEN_287;
  reg  _GEN_142;
  reg [31:0] _GEN_288;
  reg  _GEN_143;
  reg [31:0] _GEN_289;
  reg  _GEN_144;
  reg [31:0] _GEN_290;
  reg  _GEN_145;
  reg [31:0] _GEN_291;
  reg  _GEN_146;
  reg [31:0] _GEN_292;
  reg  _GEN_147;
  reg [31:0] _GEN_293;
  reg  _GEN_148;
  reg [31:0] _GEN_294;
  reg  _GEN_149;
  reg [31:0] _GEN_295;
  reg [3:0] _GEN_150;
  reg [31:0] _GEN_296;
  reg [19:0] _GEN_151;
  reg [31:0] _GEN_297;
  reg [11:0] _GEN_152;
  reg [31:0] _GEN_298;
  reg [6:0] _GEN_153;
  reg [31:0] _GEN_299;
  reg [4:0] _GEN_154;
  reg [31:0] _GEN_300;
  reg [4:0] _GEN_155;
  reg [31:0] _GEN_301;
  reg [4:0] _GEN_156;
  reg [31:0] _GEN_302;
  reg [6:0] _GEN_157;
  reg [31:0] _GEN_303;
  reg [6:0] _GEN_158;
  reg [31:0] _GEN_304;
  reg [6:0] _GEN_159;
  reg [31:0] _GEN_305;
  reg  _GEN_160;
  reg [31:0] _GEN_306;
  reg  _GEN_161;
  reg [31:0] _GEN_307;
  reg  _GEN_162;
  reg [31:0] _GEN_308;
  reg [6:0] _GEN_163;
  reg [31:0] _GEN_309;
  reg  _GEN_164;
  reg [31:0] _GEN_310;
  reg [63:0] _GEN_165;
  reg [63:0] _GEN_311;
  reg [3:0] _GEN_166;
  reg [31:0] _GEN_312;
  reg [2:0] _GEN_167;
  reg [31:0] _GEN_313;
  reg  _GEN_168;
  reg [31:0] _GEN_314;
  reg  _GEN_169;
  reg [31:0] _GEN_315;
  reg  _GEN_170;
  reg [31:0] _GEN_316;
  reg  _GEN_171;
  reg [31:0] _GEN_317;
  reg  _GEN_172;
  reg [31:0] _GEN_318;
  reg [5:0] _GEN_173;
  reg [31:0] _GEN_319;
  reg [5:0] _GEN_174;
  reg [31:0] _GEN_320;
  reg [5:0] _GEN_175;
  reg [31:0] _GEN_321;
  reg [5:0] _GEN_176;
  reg [31:0] _GEN_322;
  reg  _GEN_177;
  reg [31:0] _GEN_323;
  reg [1:0] _GEN_178;
  reg [31:0] _GEN_324;
  reg [1:0] _GEN_179;
  reg [31:0] _GEN_325;
  reg  _GEN_180;
  reg [31:0] _GEN_326;
  reg  _GEN_181;
  reg [31:0] _GEN_327;
  reg  _GEN_182;
  reg [31:0] _GEN_328;
  reg  _GEN_183;
  reg [31:0] _GEN_329;
  reg [63:0] _GEN_184;
  reg [63:0] _GEN_330;
  reg [31:0] _GEN_185;
  reg [31:0] _GEN_331;
  reg [1:0] _GEN_186;
  reg [31:0] _GEN_332;
  reg [2:0] _GEN_187;
  reg [31:0] _GEN_333;
  reg [2:0] _GEN_188;
  reg [31:0] _GEN_334;
  reg [3:0] _GEN_189;
  reg [31:0] _GEN_335;
  reg  _GEN_190;
  reg [31:0] _GEN_336;
  assign io_valid = _T_1341;
  assign io_will_be_valid = _T_1379;
  assign io_request = _GEN_123;
  assign io_request_hp = _T_1348;
  assign io_updated_uop_valid = slotUop_valid;
  assign io_updated_uop_iw_state = updated_state;
  assign io_updated_uop_uopc = updated_uopc;
  assign io_updated_uop_inst = slotUop_inst;
  assign io_updated_uop_pc = slotUop_pc;
  assign io_updated_uop_fu_code = slotUop_fu_code;
  assign io_updated_uop_ctrl_br_type = slotUop_ctrl_br_type;
  assign io_updated_uop_ctrl_op1_sel = slotUop_ctrl_op1_sel;
  assign io_updated_uop_ctrl_op2_sel = slotUop_ctrl_op2_sel;
  assign io_updated_uop_ctrl_imm_sel = slotUop_ctrl_imm_sel;
  assign io_updated_uop_ctrl_op_fcn = slotUop_ctrl_op_fcn;
  assign io_updated_uop_ctrl_fcn_dw = slotUop_ctrl_fcn_dw;
  assign io_updated_uop_ctrl_rf_wen = slotUop_ctrl_rf_wen;
  assign io_updated_uop_ctrl_csr_cmd = slotUop_ctrl_csr_cmd;
  assign io_updated_uop_ctrl_is_load = slotUop_ctrl_is_load;
  assign io_updated_uop_ctrl_is_sta = slotUop_ctrl_is_sta;
  assign io_updated_uop_ctrl_is_std = slotUop_ctrl_is_std;
  assign io_updated_uop_wakeup_delay = slotUop_wakeup_delay;
  assign io_updated_uop_allocate_brtag = slotUop_allocate_brtag;
  assign io_updated_uop_is_br_or_jmp = slotUop_is_br_or_jmp;
  assign io_updated_uop_is_jump = slotUop_is_jump;
  assign io_updated_uop_is_jal = slotUop_is_jal;
  assign io_updated_uop_is_ret = slotUop_is_ret;
  assign io_updated_uop_is_call = slotUop_is_call;
  assign io_updated_uop_br_mask = out_br_mask;
  assign io_updated_uop_br_tag = slotUop_br_tag;
  assign io_updated_uop_br_prediction_bpd_predict_val = slotUop_br_prediction_bpd_predict_val;
  assign io_updated_uop_br_prediction_bpd_predict_taken = slotUop_br_prediction_bpd_predict_taken;
  assign io_updated_uop_br_prediction_btb_hit = slotUop_br_prediction_btb_hit;
  assign io_updated_uop_br_prediction_btb_predicted = slotUop_br_prediction_btb_predicted;
  assign io_updated_uop_br_prediction_is_br_or_jalr = slotUop_br_prediction_is_br_or_jalr;
  assign io_updated_uop_stat_brjmp_mispredicted = slotUop_stat_brjmp_mispredicted;
  assign io_updated_uop_stat_btb_made_pred = slotUop_stat_btb_made_pred;
  assign io_updated_uop_stat_btb_mispredicted = slotUop_stat_btb_mispredicted;
  assign io_updated_uop_stat_bpd_made_pred = slotUop_stat_bpd_made_pred;
  assign io_updated_uop_stat_bpd_mispredicted = slotUop_stat_bpd_mispredicted;
  assign io_updated_uop_fetch_pc_lob = slotUop_fetch_pc_lob;
  assign io_updated_uop_imm_packed = slotUop_imm_packed;
  assign io_updated_uop_csr_addr = slotUop_csr_addr;
  assign io_updated_uop_rob_idx = slotUop_rob_idx;
  assign io_updated_uop_ldq_idx = slotUop_ldq_idx;
  assign io_updated_uop_stq_idx = slotUop_stq_idx;
  assign io_updated_uop_brob_idx = slotUop_brob_idx;
  assign io_updated_uop_pdst = slotUop_pdst;
  assign io_updated_uop_pop1 = slotUop_pop1;
  assign io_updated_uop_pop2 = slotUop_pop2;
  assign io_updated_uop_pop3 = slotUop_pop3;
  assign io_updated_uop_prs1_busy = _T_1381;
  assign io_updated_uop_prs2_busy = _T_1383;
  assign io_updated_uop_prs3_busy = _T_1385;
  assign io_updated_uop_stale_pdst = slotUop_stale_pdst;
  assign io_updated_uop_exception = slotUop_exception;
  assign io_updated_uop_exc_cause = slotUop_exc_cause;
  assign io_updated_uop_bypassable = slotUop_bypassable;
  assign io_updated_uop_mem_cmd = slotUop_mem_cmd;
  assign io_updated_uop_mem_typ = slotUop_mem_typ;
  assign io_updated_uop_is_fence = slotUop_is_fence;
  assign io_updated_uop_is_fencei = slotUop_is_fencei;
  assign io_updated_uop_is_store = slotUop_is_store;
  assign io_updated_uop_is_amo = slotUop_is_amo;
  assign io_updated_uop_is_load = slotUop_is_load;
  assign io_updated_uop_is_unique = slotUop_is_unique;
  assign io_updated_uop_flush_on_commit = slotUop_flush_on_commit;
  assign io_updated_uop_ldst = slotUop_ldst;
  assign io_updated_uop_lrs1 = slotUop_lrs1;
  assign io_updated_uop_lrs2 = slotUop_lrs2;
  assign io_updated_uop_lrs3 = slotUop_lrs3;
  assign io_updated_uop_ldst_val = slotUop_ldst_val;
  assign io_updated_uop_dst_rtype = slotUop_dst_rtype;
  assign io_updated_uop_lrs1_rtype = slotUop_lrs1_rtype;
  assign io_updated_uop_lrs2_rtype = slotUop_lrs2_rtype;
  assign io_updated_uop_frs3_en = slotUop_frs3_en;
  assign io_updated_uop_fp_val = slotUop_fp_val;
  assign io_updated_uop_fp_single = slotUop_fp_single;
  assign io_updated_uop_xcpt_if = slotUop_xcpt_if;
  assign io_updated_uop_replay_if = slotUop_replay_if;
  assign io_updated_uop_debug_wdata = slotUop_debug_wdata;
  assign io_updated_uop_debug_events_fetch_seq = slotUop_debug_events_fetch_seq;
  assign io_uop_valid = slotUop_valid;
  assign io_uop_iw_state = slotUop_iw_state;
  assign io_uop_uopc = _GEN_128;
  assign io_uop_inst = slotUop_inst;
  assign io_uop_pc = slotUop_pc;
  assign io_uop_fu_code = slotUop_fu_code;
  assign io_uop_ctrl_br_type = slotUop_ctrl_br_type;
  assign io_uop_ctrl_op1_sel = slotUop_ctrl_op1_sel;
  assign io_uop_ctrl_op2_sel = slotUop_ctrl_op2_sel;
  assign io_uop_ctrl_imm_sel = slotUop_ctrl_imm_sel;
  assign io_uop_ctrl_op_fcn = slotUop_ctrl_op_fcn;
  assign io_uop_ctrl_fcn_dw = slotUop_ctrl_fcn_dw;
  assign io_uop_ctrl_rf_wen = slotUop_ctrl_rf_wen;
  assign io_uop_ctrl_csr_cmd = slotUop_ctrl_csr_cmd;
  assign io_uop_ctrl_is_load = slotUop_ctrl_is_load;
  assign io_uop_ctrl_is_sta = slotUop_ctrl_is_sta;
  assign io_uop_ctrl_is_std = slotUop_ctrl_is_std;
  assign io_uop_wakeup_delay = slotUop_wakeup_delay;
  assign io_uop_allocate_brtag = slotUop_allocate_brtag;
  assign io_uop_is_br_or_jmp = slotUop_is_br_or_jmp;
  assign io_uop_is_jump = slotUop_is_jump;
  assign io_uop_is_jal = slotUop_is_jal;
  assign io_uop_is_ret = slotUop_is_ret;
  assign io_uop_is_call = slotUop_is_call;
  assign io_uop_br_mask = slotUop_br_mask;
  assign io_uop_br_tag = slotUop_br_tag;
  assign io_uop_br_prediction_bpd_predict_val = slotUop_br_prediction_bpd_predict_val;
  assign io_uop_br_prediction_bpd_predict_taken = slotUop_br_prediction_bpd_predict_taken;
  assign io_uop_br_prediction_btb_hit = slotUop_br_prediction_btb_hit;
  assign io_uop_br_prediction_btb_predicted = slotUop_br_prediction_btb_predicted;
  assign io_uop_br_prediction_is_br_or_jalr = slotUop_br_prediction_is_br_or_jalr;
  assign io_uop_stat_brjmp_mispredicted = slotUop_stat_brjmp_mispredicted;
  assign io_uop_stat_btb_made_pred = slotUop_stat_btb_made_pred;
  assign io_uop_stat_btb_mispredicted = slotUop_stat_btb_mispredicted;
  assign io_uop_stat_bpd_made_pred = slotUop_stat_bpd_made_pred;
  assign io_uop_stat_bpd_mispredicted = slotUop_stat_bpd_mispredicted;
  assign io_uop_fetch_pc_lob = slotUop_fetch_pc_lob;
  assign io_uop_imm_packed = slotUop_imm_packed;
  assign io_uop_csr_addr = slotUop_csr_addr;
  assign io_uop_rob_idx = slotUop_rob_idx;
  assign io_uop_ldq_idx = slotUop_ldq_idx;
  assign io_uop_stq_idx = slotUop_stq_idx;
  assign io_uop_brob_idx = slotUop_brob_idx;
  assign io_uop_pdst = slotUop_pdst;
  assign io_uop_pop1 = slotUop_pop1;
  assign io_uop_pop2 = slotUop_pop2;
  assign io_uop_pop3 = slotUop_pop3;
  assign io_uop_prs1_busy = slotUop_prs1_busy;
  assign io_uop_prs2_busy = slotUop_prs2_busy;
  assign io_uop_prs3_busy = slotUop_prs3_busy;
  assign io_uop_stale_pdst = slotUop_stale_pdst;
  assign io_uop_exception = slotUop_exception;
  assign io_uop_exc_cause = slotUop_exc_cause;
  assign io_uop_bypassable = slotUop_bypassable;
  assign io_uop_mem_cmd = slotUop_mem_cmd;
  assign io_uop_mem_typ = slotUop_mem_typ;
  assign io_uop_is_fence = slotUop_is_fence;
  assign io_uop_is_fencei = slotUop_is_fencei;
  assign io_uop_is_store = slotUop_is_store;
  assign io_uop_is_amo = slotUop_is_amo;
  assign io_uop_is_load = slotUop_is_load;
  assign io_uop_is_unique = slotUop_is_unique;
  assign io_uop_flush_on_commit = slotUop_flush_on_commit;
  assign io_uop_ldst = slotUop_ldst;
  assign io_uop_lrs1 = slotUop_lrs1;
  assign io_uop_lrs2 = slotUop_lrs2;
  assign io_uop_lrs3 = slotUop_lrs3;
  assign io_uop_ldst_val = slotUop_ldst_val;
  assign io_uop_dst_rtype = slotUop_dst_rtype;
  assign io_uop_lrs1_rtype = _GEN_130;
  assign io_uop_lrs2_rtype = _GEN_129;
  assign io_uop_frs3_en = slotUop_frs3_en;
  assign io_uop_fp_val = slotUop_fp_val;
  assign io_uop_fp_single = slotUop_fp_single;
  assign io_uop_xcpt_if = slotUop_xcpt_if;
  assign io_uop_replay_if = slotUop_replay_if;
  assign io_uop_debug_wdata = slotUop_debug_wdata;
  assign io_uop_debug_events_fetch_seq = slotUop_debug_events_fetch_seq;
  assign io_debug_p1 = slot_p1;
  assign io_debug_p2 = slot_p2;
  assign io_debug_p3 = slot_p3;
  assign updated_state = _GEN_119;
  assign updated_uopc = _GEN_10;
  assign next_p1 = _GEN_95;
  assign next_p2 = _GEN_96;
  assign next_p3 = _GEN_97;
  assign _T_1011_valid = 1'h0;
  assign _T_1011_iw_state = _GEN_6;
  assign _T_1011_uopc = 9'h0;
  assign _T_1011_inst = _GEN_11;
  assign _T_1011_pc = _GEN_124;
  assign _T_1011_fu_code = _GEN_131;
  assign _T_1011_ctrl_br_type = _T_1116_br_type;
  assign _T_1011_ctrl_op1_sel = _T_1116_op1_sel;
  assign _T_1011_ctrl_op2_sel = _T_1116_op2_sel;
  assign _T_1011_ctrl_imm_sel = _T_1116_imm_sel;
  assign _T_1011_ctrl_op_fcn = _T_1116_op_fcn;
  assign _T_1011_ctrl_fcn_dw = _T_1116_fcn_dw;
  assign _T_1011_ctrl_rf_wen = _T_1116_rf_wen;
  assign _T_1011_ctrl_csr_cmd = _T_1116_csr_cmd;
  assign _T_1011_ctrl_is_load = _T_1116_is_load;
  assign _T_1011_ctrl_is_sta = _T_1116_is_sta;
  assign _T_1011_ctrl_is_std = _T_1116_is_std;
  assign _T_1011_wakeup_delay = _GEN_132;
  assign _T_1011_allocate_brtag = _GEN_133;
  assign _T_1011_is_br_or_jmp = 1'h0;
  assign _T_1011_is_jump = _GEN_134;
  assign _T_1011_is_jal = _GEN_135;
  assign _T_1011_is_ret = _GEN_136;
  assign _T_1011_is_call = _GEN_137;
  assign _T_1011_br_mask = _GEN_138;
  assign _T_1011_br_tag = _GEN_139;
  assign _T_1011_br_prediction_bpd_predict_val = _GEN_140;
  assign _T_1011_br_prediction_bpd_predict_taken = _GEN_141;
  assign _T_1011_br_prediction_btb_hit = _GEN_142;
  assign _T_1011_br_prediction_btb_predicted = _GEN_143;
  assign _T_1011_br_prediction_is_br_or_jalr = _GEN_144;
  assign _T_1011_stat_brjmp_mispredicted = _GEN_145;
  assign _T_1011_stat_btb_made_pred = _GEN_146;
  assign _T_1011_stat_btb_mispredicted = _GEN_147;
  assign _T_1011_stat_bpd_made_pred = _GEN_148;
  assign _T_1011_stat_bpd_mispredicted = _GEN_149;
  assign _T_1011_fetch_pc_lob = _GEN_150;
  assign _T_1011_imm_packed = _GEN_151;
  assign _T_1011_csr_addr = _GEN_152;
  assign _T_1011_rob_idx = _GEN_153;
  assign _T_1011_ldq_idx = _GEN_154;
  assign _T_1011_stq_idx = _GEN_155;
  assign _T_1011_brob_idx = _GEN_156;
  assign _T_1011_pdst = 7'h0;
  assign _T_1011_pop1 = _GEN_157;
  assign _T_1011_pop2 = _GEN_158;
  assign _T_1011_pop3 = _GEN_159;
  assign _T_1011_prs1_busy = _GEN_160;
  assign _T_1011_prs2_busy = _GEN_161;
  assign _T_1011_prs3_busy = _GEN_162;
  assign _T_1011_stale_pdst = _GEN_163;
  assign _T_1011_exception = _GEN_164;
  assign _T_1011_exc_cause = _GEN_165;
  assign _T_1011_bypassable = 1'h0;
  assign _T_1011_mem_cmd = _GEN_166;
  assign _T_1011_mem_typ = _GEN_167;
  assign _T_1011_is_fence = _GEN_168;
  assign _T_1011_is_fencei = _GEN_169;
  assign _T_1011_is_store = 1'h0;
  assign _T_1011_is_amo = _GEN_170;
  assign _T_1011_is_load = 1'h0;
  assign _T_1011_is_unique = _GEN_171;
  assign _T_1011_flush_on_commit = _GEN_172;
  assign _T_1011_ldst = _GEN_173;
  assign _T_1011_lrs1 = _GEN_174;
  assign _T_1011_lrs2 = _GEN_175;
  assign _T_1011_lrs3 = _GEN_176;
  assign _T_1011_ldst_val = _GEN_177;
  assign _T_1011_dst_rtype = 2'h2;
  assign _T_1011_lrs1_rtype = _GEN_178;
  assign _T_1011_lrs2_rtype = _GEN_179;
  assign _T_1011_frs3_en = _GEN_180;
  assign _T_1011_fp_val = 1'h0;
  assign _T_1011_fp_single = _GEN_181;
  assign _T_1011_xcpt_if = _GEN_182;
  assign _T_1011_replay_if = _GEN_183;
  assign _T_1011_debug_wdata = _GEN_184;
  assign _T_1011_debug_events_fetch_seq = _GEN_185;
  assign _T_1116_br_type = 4'h0;
  assign _T_1116_op1_sel = _GEN_186;
  assign _T_1116_op2_sel = _GEN_187;
  assign _T_1116_imm_sel = _GEN_188;
  assign _T_1116_op_fcn = _GEN_189;
  assign _T_1116_fcn_dw = _GEN_190;
  assign _T_1116_rf_wen = 1'h0;
  assign _T_1116_csr_cmd = 3'h0;
  assign _T_1116_is_load = 1'h0;
  assign _T_1116_is_sta = 1'h0;
  assign _T_1116_is_std = 1'h0;
  assign _GEN_0 = io_kill ? 2'h0 : slot_state;
  assign _T_1218 = io_kill == 1'h0;
  assign _T_1219 = _T_1218 & io_in_uop_valid;
  assign _GEN_1 = _T_1219 ? io_in_uop_bits_iw_state : _GEN_0;
  assign _T_1223 = io_in_uop_valid == 1'h0;
  assign _T_1224 = _T_1218 & _T_1223;
  assign _T_1225 = _T_1224 & io_clear;
  assign _GEN_2 = _T_1225 ? 2'h0 : _GEN_1;
  assign _T_1232 = io_clear == 1'h0;
  assign _T_1233 = _T_1224 & _T_1232;
  assign _GEN_3 = _T_1233 ? updated_state : _GEN_2;
  assign _T_1234 = slot_state == 2'h1;
  assign _T_1235 = io_grant & _T_1234;
  assign _T_1236 = io_kill | _T_1235;
  assign _T_1237 = slot_state == 2'h2;
  assign _T_1238 = io_grant & _T_1237;
  assign _T_1239 = _T_1238 & slot_p1;
  assign _T_1240 = _T_1239 & slot_p2;
  assign _T_1241 = _T_1236 | _T_1240;
  assign _GEN_4 = _T_1241 ? 2'h0 : slot_state;
  assign _T_1245 = _T_1241 == 1'h0;
  assign _T_1246 = _T_1245 & _T_1238;
  assign _GEN_5 = slot_p1 ? 9'h3 : slotUop_uopc;
  assign _GEN_7 = slot_p1 ? 2'h2 : slotUop_lrs1_rtype;
  assign _T_1248 = slot_p1 == 1'h0;
  assign _GEN_8 = _T_1248 ? 2'h2 : slotUop_lrs2_rtype;
  assign _GEN_9 = _T_1246 ? 2'h1 : _GEN_4;
  assign _GEN_10 = _T_1246 ? _GEN_5 : slotUop_uopc;
  assign _GEN_12 = _T_1246 ? _GEN_7 : slotUop_lrs1_rtype;
  assign _GEN_13 = _T_1246 ? _GEN_8 : slotUop_lrs2_rtype;
  assign _T_1249 = slot_state == 2'h0;
  assign _T_1250 = _T_1249 | io_clear;
  assign _T_1251 = _T_1250 | io_kill;
  assign _T_1252 = _T_1251 | reset;
  assign _T_1254 = _T_1252 == 1'h0;
  assign _GEN_14 = io_in_uop_valid ? io_in_uop_bits_valid : slotUop_valid;
  assign _GEN_15 = io_in_uop_valid ? io_in_uop_bits_iw_state : slotUop_iw_state;
  assign _GEN_16 = io_in_uop_valid ? io_in_uop_bits_uopc : _GEN_10;
  assign _GEN_17 = io_in_uop_valid ? io_in_uop_bits_inst : slotUop_inst;
  assign _GEN_18 = io_in_uop_valid ? io_in_uop_bits_pc : slotUop_pc;
  assign _GEN_19 = io_in_uop_valid ? io_in_uop_bits_fu_code : slotUop_fu_code;
  assign _GEN_20 = io_in_uop_valid ? io_in_uop_bits_ctrl_br_type : slotUop_ctrl_br_type;
  assign _GEN_21 = io_in_uop_valid ? io_in_uop_bits_ctrl_op1_sel : slotUop_ctrl_op1_sel;
  assign _GEN_22 = io_in_uop_valid ? io_in_uop_bits_ctrl_op2_sel : slotUop_ctrl_op2_sel;
  assign _GEN_23 = io_in_uop_valid ? io_in_uop_bits_ctrl_imm_sel : slotUop_ctrl_imm_sel;
  assign _GEN_24 = io_in_uop_valid ? io_in_uop_bits_ctrl_op_fcn : slotUop_ctrl_op_fcn;
  assign _GEN_25 = io_in_uop_valid ? io_in_uop_bits_ctrl_fcn_dw : slotUop_ctrl_fcn_dw;
  assign _GEN_26 = io_in_uop_valid ? io_in_uop_bits_ctrl_rf_wen : slotUop_ctrl_rf_wen;
  assign _GEN_27 = io_in_uop_valid ? io_in_uop_bits_ctrl_csr_cmd : slotUop_ctrl_csr_cmd;
  assign _GEN_28 = io_in_uop_valid ? io_in_uop_bits_ctrl_is_load : slotUop_ctrl_is_load;
  assign _GEN_29 = io_in_uop_valid ? io_in_uop_bits_ctrl_is_sta : slotUop_ctrl_is_sta;
  assign _GEN_30 = io_in_uop_valid ? io_in_uop_bits_ctrl_is_std : slotUop_ctrl_is_std;
  assign _GEN_31 = io_in_uop_valid ? io_in_uop_bits_wakeup_delay : slotUop_wakeup_delay;
  assign _GEN_32 = io_in_uop_valid ? io_in_uop_bits_allocate_brtag : slotUop_allocate_brtag;
  assign _GEN_33 = io_in_uop_valid ? io_in_uop_bits_is_br_or_jmp : slotUop_is_br_or_jmp;
  assign _GEN_34 = io_in_uop_valid ? io_in_uop_bits_is_jump : slotUop_is_jump;
  assign _GEN_35 = io_in_uop_valid ? io_in_uop_bits_is_jal : slotUop_is_jal;
  assign _GEN_36 = io_in_uop_valid ? io_in_uop_bits_is_ret : slotUop_is_ret;
  assign _GEN_37 = io_in_uop_valid ? io_in_uop_bits_is_call : slotUop_is_call;
  assign _GEN_38 = io_in_uop_valid ? io_in_uop_bits_br_mask : slotUop_br_mask;
  assign _GEN_39 = io_in_uop_valid ? io_in_uop_bits_br_tag : slotUop_br_tag;
  assign _GEN_40 = io_in_uop_valid ? io_in_uop_bits_br_prediction_bpd_predict_val : slotUop_br_prediction_bpd_predict_val;
  assign _GEN_41 = io_in_uop_valid ? io_in_uop_bits_br_prediction_bpd_predict_taken : slotUop_br_prediction_bpd_predict_taken;
  assign _GEN_42 = io_in_uop_valid ? io_in_uop_bits_br_prediction_btb_hit : slotUop_br_prediction_btb_hit;
  assign _GEN_43 = io_in_uop_valid ? io_in_uop_bits_br_prediction_btb_predicted : slotUop_br_prediction_btb_predicted;
  assign _GEN_44 = io_in_uop_valid ? io_in_uop_bits_br_prediction_is_br_or_jalr : slotUop_br_prediction_is_br_or_jalr;
  assign _GEN_45 = io_in_uop_valid ? io_in_uop_bits_stat_brjmp_mispredicted : slotUop_stat_brjmp_mispredicted;
  assign _GEN_46 = io_in_uop_valid ? io_in_uop_bits_stat_btb_made_pred : slotUop_stat_btb_made_pred;
  assign _GEN_47 = io_in_uop_valid ? io_in_uop_bits_stat_btb_mispredicted : slotUop_stat_btb_mispredicted;
  assign _GEN_48 = io_in_uop_valid ? io_in_uop_bits_stat_bpd_made_pred : slotUop_stat_bpd_made_pred;
  assign _GEN_49 = io_in_uop_valid ? io_in_uop_bits_stat_bpd_mispredicted : slotUop_stat_bpd_mispredicted;
  assign _GEN_50 = io_in_uop_valid ? io_in_uop_bits_fetch_pc_lob : slotUop_fetch_pc_lob;
  assign _GEN_51 = io_in_uop_valid ? io_in_uop_bits_imm_packed : slotUop_imm_packed;
  assign _GEN_52 = io_in_uop_valid ? io_in_uop_bits_csr_addr : slotUop_csr_addr;
  assign _GEN_53 = io_in_uop_valid ? io_in_uop_bits_rob_idx : slotUop_rob_idx;
  assign _GEN_54 = io_in_uop_valid ? io_in_uop_bits_ldq_idx : slotUop_ldq_idx;
  assign _GEN_55 = io_in_uop_valid ? io_in_uop_bits_stq_idx : slotUop_stq_idx;
  assign _GEN_56 = io_in_uop_valid ? io_in_uop_bits_brob_idx : slotUop_brob_idx;
  assign _GEN_57 = io_in_uop_valid ? io_in_uop_bits_pdst : slotUop_pdst;
  assign _GEN_58 = io_in_uop_valid ? io_in_uop_bits_pop1 : slotUop_pop1;
  assign _GEN_59 = io_in_uop_valid ? io_in_uop_bits_pop2 : slotUop_pop2;
  assign _GEN_60 = io_in_uop_valid ? io_in_uop_bits_pop3 : slotUop_pop3;
  assign _GEN_61 = io_in_uop_valid ? io_in_uop_bits_prs1_busy : slotUop_prs1_busy;
  assign _GEN_62 = io_in_uop_valid ? io_in_uop_bits_prs2_busy : slotUop_prs2_busy;
  assign _GEN_63 = io_in_uop_valid ? io_in_uop_bits_prs3_busy : slotUop_prs3_busy;
  assign _GEN_64 = io_in_uop_valid ? io_in_uop_bits_stale_pdst : slotUop_stale_pdst;
  assign _GEN_65 = io_in_uop_valid ? io_in_uop_bits_exception : slotUop_exception;
  assign _GEN_66 = io_in_uop_valid ? io_in_uop_bits_exc_cause : slotUop_exc_cause;
  assign _GEN_67 = io_in_uop_valid ? io_in_uop_bits_bypassable : slotUop_bypassable;
  assign _GEN_68 = io_in_uop_valid ? io_in_uop_bits_mem_cmd : slotUop_mem_cmd;
  assign _GEN_69 = io_in_uop_valid ? io_in_uop_bits_mem_typ : slotUop_mem_typ;
  assign _GEN_70 = io_in_uop_valid ? io_in_uop_bits_is_fence : slotUop_is_fence;
  assign _GEN_71 = io_in_uop_valid ? io_in_uop_bits_is_fencei : slotUop_is_fencei;
  assign _GEN_72 = io_in_uop_valid ? io_in_uop_bits_is_store : slotUop_is_store;
  assign _GEN_73 = io_in_uop_valid ? io_in_uop_bits_is_amo : slotUop_is_amo;
  assign _GEN_74 = io_in_uop_valid ? io_in_uop_bits_is_load : slotUop_is_load;
  assign _GEN_75 = io_in_uop_valid ? io_in_uop_bits_is_unique : slotUop_is_unique;
  assign _GEN_76 = io_in_uop_valid ? io_in_uop_bits_flush_on_commit : slotUop_flush_on_commit;
  assign _GEN_77 = io_in_uop_valid ? io_in_uop_bits_ldst : slotUop_ldst;
  assign _GEN_78 = io_in_uop_valid ? io_in_uop_bits_lrs1 : slotUop_lrs1;
  assign _GEN_79 = io_in_uop_valid ? io_in_uop_bits_lrs2 : slotUop_lrs2;
  assign _GEN_80 = io_in_uop_valid ? io_in_uop_bits_lrs3 : slotUop_lrs3;
  assign _GEN_81 = io_in_uop_valid ? io_in_uop_bits_ldst_val : slotUop_ldst_val;
  assign _GEN_82 = io_in_uop_valid ? io_in_uop_bits_dst_rtype : slotUop_dst_rtype;
  assign _GEN_83 = io_in_uop_valid ? io_in_uop_bits_lrs1_rtype : _GEN_12;
  assign _GEN_84 = io_in_uop_valid ? io_in_uop_bits_lrs2_rtype : _GEN_13;
  assign _GEN_85 = io_in_uop_valid ? io_in_uop_bits_frs3_en : slotUop_frs3_en;
  assign _GEN_86 = io_in_uop_valid ? io_in_uop_bits_fp_val : slotUop_fp_val;
  assign _GEN_87 = io_in_uop_valid ? io_in_uop_bits_fp_single : slotUop_fp_single;
  assign _GEN_88 = io_in_uop_valid ? io_in_uop_bits_xcpt_if : slotUop_xcpt_if;
  assign _GEN_89 = io_in_uop_valid ? io_in_uop_bits_replay_if : slotUop_replay_if;
  assign _GEN_90 = io_in_uop_valid ? io_in_uop_bits_debug_wdata : slotUop_debug_wdata;
  assign _GEN_91 = io_in_uop_valid ? io_in_uop_bits_debug_events_fetch_seq : slotUop_debug_events_fetch_seq;
  assign out_p1 = _GEN_116;
  assign out_p2 = _GEN_117;
  assign out_p3 = _GEN_118;
  assign _T_1262 = io_in_uop_bits_prs1_busy == 1'h0;
  assign _T_1264 = io_in_uop_bits_prs2_busy == 1'h0;
  assign _T_1266 = io_in_uop_bits_prs3_busy == 1'h0;
  assign _GEN_92 = io_in_uop_valid ? _T_1262 : 1'h0;
  assign _GEN_93 = io_in_uop_valid ? _T_1264 : 1'h0;
  assign _GEN_94 = io_in_uop_valid ? _T_1266 : 1'h0;
  assign _GEN_95 = _T_1223 ? out_p1 : _GEN_92;
  assign _GEN_96 = _T_1223 ? out_p2 : _GEN_93;
  assign _GEN_97 = _T_1223 ? out_p3 : _GEN_94;
  assign _T_1269 = io_wakeup_dsts_0_bits == slotUop_pop1;
  assign _T_1270 = io_wakeup_dsts_0_valid & _T_1269;
  assign _GEN_98 = _T_1270 ? 1'h1 : slot_p1;
  assign _T_1272 = io_wakeup_dsts_0_bits == slotUop_pop2;
  assign _T_1273 = io_wakeup_dsts_0_valid & _T_1272;
  assign _GEN_99 = _T_1273 ? 1'h1 : slot_p2;
  assign _T_1275 = io_wakeup_dsts_0_bits == slotUop_pop3;
  assign _T_1276 = io_wakeup_dsts_0_valid & _T_1275;
  assign _GEN_100 = _T_1276 ? 1'h1 : slot_p3;
  assign _T_1278 = io_wakeup_dsts_1_bits == slotUop_pop1;
  assign _T_1279 = io_wakeup_dsts_1_valid & _T_1278;
  assign _GEN_101 = _T_1279 ? 1'h1 : _GEN_98;
  assign _T_1281 = io_wakeup_dsts_1_bits == slotUop_pop2;
  assign _T_1282 = io_wakeup_dsts_1_valid & _T_1281;
  assign _GEN_102 = _T_1282 ? 1'h1 : _GEN_99;
  assign _T_1284 = io_wakeup_dsts_1_bits == slotUop_pop3;
  assign _T_1285 = io_wakeup_dsts_1_valid & _T_1284;
  assign _GEN_103 = _T_1285 ? 1'h1 : _GEN_100;
  assign _T_1287 = io_wakeup_dsts_2_bits == slotUop_pop1;
  assign _T_1288 = io_wakeup_dsts_2_valid & _T_1287;
  assign _GEN_104 = _T_1288 ? 1'h1 : _GEN_101;
  assign _T_1290 = io_wakeup_dsts_2_bits == slotUop_pop2;
  assign _T_1291 = io_wakeup_dsts_2_valid & _T_1290;
  assign _GEN_105 = _T_1291 ? 1'h1 : _GEN_102;
  assign _T_1293 = io_wakeup_dsts_2_bits == slotUop_pop3;
  assign _T_1294 = io_wakeup_dsts_2_valid & _T_1293;
  assign _GEN_106 = _T_1294 ? 1'h1 : _GEN_103;
  assign _T_1296 = io_wakeup_dsts_3_bits == slotUop_pop1;
  assign _T_1297 = io_wakeup_dsts_3_valid & _T_1296;
  assign _GEN_107 = _T_1297 ? 1'h1 : _GEN_104;
  assign _T_1299 = io_wakeup_dsts_3_bits == slotUop_pop2;
  assign _T_1300 = io_wakeup_dsts_3_valid & _T_1299;
  assign _GEN_108 = _T_1300 ? 1'h1 : _GEN_105;
  assign _T_1302 = io_wakeup_dsts_3_bits == slotUop_pop3;
  assign _T_1303 = io_wakeup_dsts_3_valid & _T_1302;
  assign _GEN_109 = _T_1303 ? 1'h1 : _GEN_106;
  assign _T_1305 = io_wakeup_dsts_4_bits == slotUop_pop1;
  assign _T_1306 = io_wakeup_dsts_4_valid & _T_1305;
  assign _GEN_110 = _T_1306 ? 1'h1 : _GEN_107;
  assign _T_1308 = io_wakeup_dsts_4_bits == slotUop_pop2;
  assign _T_1309 = io_wakeup_dsts_4_valid & _T_1308;
  assign _GEN_111 = _T_1309 ? 1'h1 : _GEN_108;
  assign _T_1311 = io_wakeup_dsts_4_bits == slotUop_pop3;
  assign _T_1312 = io_wakeup_dsts_4_valid & _T_1311;
  assign _GEN_112 = _T_1312 ? 1'h1 : _GEN_109;
  assign _T_1314 = io_wakeup_dsts_5_bits == slotUop_pop1;
  assign _T_1315 = io_wakeup_dsts_5_valid & _T_1314;
  assign _GEN_113 = _T_1315 ? 1'h1 : _GEN_110;
  assign _T_1317 = io_wakeup_dsts_5_bits == slotUop_pop2;
  assign _T_1318 = io_wakeup_dsts_5_valid & _T_1317;
  assign _GEN_114 = _T_1318 ? 1'h1 : _GEN_111;
  assign _T_1320 = io_wakeup_dsts_5_bits == slotUop_pop3;
  assign _T_1321 = io_wakeup_dsts_5_valid & _T_1320;
  assign _GEN_115 = _T_1321 ? 1'h1 : _GEN_112;
  assign _T_1323 = io_wakeup_dsts_6_bits == slotUop_pop1;
  assign _T_1324 = io_wakeup_dsts_6_valid & _T_1323;
  assign _GEN_116 = _T_1324 ? 1'h1 : _GEN_113;
  assign _T_1326 = io_wakeup_dsts_6_bits == slotUop_pop2;
  assign _T_1327 = io_wakeup_dsts_6_valid & _T_1326;
  assign _GEN_117 = _T_1327 ? 1'h1 : _GEN_114;
  assign _T_1329 = io_wakeup_dsts_6_bits == slotUop_pop3;
  assign _T_1330 = io_wakeup_dsts_6_valid & _T_1329;
  assign _GEN_118 = _T_1330 ? 1'h1 : _GEN_115;
  assign _T_1332 = ~ io_brinfo_mask;
  assign _T_1333 = slotUop_br_mask & _T_1332;
  assign out_br_mask = io_brinfo_valid ? _T_1333 : slotUop_br_mask;
  assign _T_1334 = io_brinfo_valid & io_brinfo_mispredict;
  assign _T_1335 = io_brinfo_mask & slotUop_br_mask;
  assign _T_1337 = _T_1335 != 8'h0;
  assign _T_1338 = _T_1334 & _T_1337;
  assign _GEN_119 = _T_1338 ? 2'h0 : _GEN_9;
  assign _GEN_120 = _T_1223 ? out_br_mask : _GEN_38;
  assign _T_1341 = slot_state != 2'h0;
  assign _T_1342 = _T_1341 & slot_p1;
  assign _T_1343 = _T_1342 & slot_p2;
  assign _T_1344 = _T_1343 & slot_p3;
  assign _T_1347 = _T_1344 & _T_1218;
  assign _T_1348 = io_request & slotUop_is_br_or_jmp;
  assign _T_1350 = slot_p1 & slot_p2;
  assign _T_1351 = _T_1350 & slot_p3;
  assign _T_1354 = _T_1351 & _T_1218;
  assign _GEN_121 = _T_1234 ? _T_1354 : _T_1347;
  assign _T_1357 = _T_1234 == 1'h0;
  assign _T_1358 = _T_1357 & _T_1237;
  assign _T_1359 = slot_p1 | slot_p2;
  assign _T_1362 = _T_1359 & _T_1218;
  assign _GEN_122 = _T_1358 ? _T_1362 : _GEN_121;
  assign _T_1366 = _T_1237 == 1'h0;
  assign _T_1367 = _T_1357 & _T_1366;
  assign _GEN_123 = _T_1367 ? 1'h0 : _GEN_122;
  assign _T_1373 = _T_1237 & slot_p1;
  assign _T_1374 = _T_1373 & slot_p2;
  assign _T_1375 = _T_1234 | _T_1374;
  assign _T_1376 = io_grant & _T_1375;
  assign _T_1378 = _T_1376 == 1'h0;
  assign _T_1379 = _T_1341 & _T_1378;
  assign _T_1381 = out_p1 == 1'h0;
  assign _T_1383 = out_p2 == 1'h0;
  assign _T_1385 = out_p3 == 1'h0;
  assign _T_1389 = _T_1350 == 1'h0;
  assign _T_1390 = _T_1389 & slot_p1;
  assign _GEN_125 = _T_1390 ? 2'h2 : slotUop_lrs2_rtype;
  assign _T_1395 = _T_1389 & _T_1248;
  assign _T_1396 = _T_1395 & slot_p2;
  assign _GEN_126 = _T_1396 ? 9'h3 : slotUop_uopc;
  assign _GEN_127 = _T_1396 ? 2'h2 : slotUop_lrs1_rtype;
  assign _GEN_128 = _T_1237 ? _GEN_126 : slotUop_uopc;
  assign _GEN_129 = _T_1237 ? _GEN_125 : slotUop_lrs2_rtype;
  assign _GEN_130 = _T_1237 ? _GEN_127 : slotUop_lrs1_rtype;
`ifdef RANDOMIZE
  integer initvar;
  initial begin
    `ifndef verilator
      #0.002 begin end
    `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_191 = {1{$random}};
  slot_state = _GEN_191[1:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_192 = {1{$random}};
  slot_p1 = _GEN_192[0:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_193 = {1{$random}};
  slot_p2 = _GEN_193[0:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_194 = {1{$random}};
  slot_p3 = _GEN_194[0:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_195 = {1{$random}};
  slot_is_2uops = _GEN_195[0:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_196 = {1{$random}};
  slotUop_valid = _GEN_196[0:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_197 = {1{$random}};
  slotUop_iw_state = _GEN_197[1:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_198 = {1{$random}};
  slotUop_uopc = _GEN_198[8:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_199 = {1{$random}};
  slotUop_inst = _GEN_199[31:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_200 = {2{$random}};
  slotUop_pc = _GEN_200[39:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_201 = {1{$random}};
  slotUop_fu_code = _GEN_201[7:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_202 = {1{$random}};
  slotUop_ctrl_br_type = _GEN_202[3:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_203 = {1{$random}};
  slotUop_ctrl_op1_sel = _GEN_203[1:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_204 = {1{$random}};
  slotUop_ctrl_op2_sel = _GEN_204[2:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_205 = {1{$random}};
  slotUop_ctrl_imm_sel = _GEN_205[2:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_206 = {1{$random}};
  slotUop_ctrl_op_fcn = _GEN_206[3:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_207 = {1{$random}};
  slotUop_ctrl_fcn_dw = _GEN_207[0:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_208 = {1{$random}};
  slotUop_ctrl_rf_wen = _GEN_208[0:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_209 = {1{$random}};
  slotUop_ctrl_csr_cmd = _GEN_209[2:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_210 = {1{$random}};
  slotUop_ctrl_is_load = _GEN_210[0:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_211 = {1{$random}};
  slotUop_ctrl_is_sta = _GEN_211[0:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_212 = {1{$random}};
  slotUop_ctrl_is_std = _GEN_212[0:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_213 = {1{$random}};
  slotUop_wakeup_delay = _GEN_213[1:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_214 = {1{$random}};
  slotUop_allocate_brtag = _GEN_214[0:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_215 = {1{$random}};
  slotUop_is_br_or_jmp = _GEN_215[0:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_216 = {1{$random}};
  slotUop_is_jump = _GEN_216[0:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_217 = {1{$random}};
  slotUop_is_jal = _GEN_217[0:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_218 = {1{$random}};
  slotUop_is_ret = _GEN_218[0:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_219 = {1{$random}};
  slotUop_is_call = _GEN_219[0:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_220 = {1{$random}};
  slotUop_br_mask = _GEN_220[7:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_221 = {1{$random}};
  slotUop_br_tag = _GEN_221[2:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_222 = {1{$random}};
  slotUop_br_prediction_bpd_predict_val = _GEN_222[0:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_223 = {1{$random}};
  slotUop_br_prediction_bpd_predict_taken = _GEN_223[0:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_224 = {1{$random}};
  slotUop_br_prediction_btb_hit = _GEN_224[0:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_225 = {1{$random}};
  slotUop_br_prediction_btb_predicted = _GEN_225[0:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_226 = {1{$random}};
  slotUop_br_prediction_is_br_or_jalr = _GEN_226[0:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_227 = {1{$random}};
  slotUop_stat_brjmp_mispredicted = _GEN_227[0:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_228 = {1{$random}};
  slotUop_stat_btb_made_pred = _GEN_228[0:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_229 = {1{$random}};
  slotUop_stat_btb_mispredicted = _GEN_229[0:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_230 = {1{$random}};
  slotUop_stat_bpd_made_pred = _GEN_230[0:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_231 = {1{$random}};
  slotUop_stat_bpd_mispredicted = _GEN_231[0:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_232 = {1{$random}};
  slotUop_fetch_pc_lob = _GEN_232[3:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_233 = {1{$random}};
  slotUop_imm_packed = _GEN_233[19:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_234 = {1{$random}};
  slotUop_csr_addr = _GEN_234[11:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_235 = {1{$random}};
  slotUop_rob_idx = _GEN_235[6:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_236 = {1{$random}};
  slotUop_ldq_idx = _GEN_236[4:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_237 = {1{$random}};
  slotUop_stq_idx = _GEN_237[4:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_238 = {1{$random}};
  slotUop_brob_idx = _GEN_238[4:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_239 = {1{$random}};
  slotUop_pdst = _GEN_239[6:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_240 = {1{$random}};
  slotUop_pop1 = _GEN_240[6:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_241 = {1{$random}};
  slotUop_pop2 = _GEN_241[6:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_242 = {1{$random}};
  slotUop_pop3 = _GEN_242[6:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_243 = {1{$random}};
  slotUop_prs1_busy = _GEN_243[0:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_244 = {1{$random}};
  slotUop_prs2_busy = _GEN_244[0:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_245 = {1{$random}};
  slotUop_prs3_busy = _GEN_245[0:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_246 = {1{$random}};
  slotUop_stale_pdst = _GEN_246[6:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_247 = {1{$random}};
  slotUop_exception = _GEN_247[0:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_248 = {2{$random}};
  slotUop_exc_cause = _GEN_248[63:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_249 = {1{$random}};
  slotUop_bypassable = _GEN_249[0:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_250 = {1{$random}};
  slotUop_mem_cmd = _GEN_250[3:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_251 = {1{$random}};
  slotUop_mem_typ = _GEN_251[2:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_252 = {1{$random}};
  slotUop_is_fence = _GEN_252[0:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_253 = {1{$random}};
  slotUop_is_fencei = _GEN_253[0:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_254 = {1{$random}};
  slotUop_is_store = _GEN_254[0:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_255 = {1{$random}};
  slotUop_is_amo = _GEN_255[0:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_256 = {1{$random}};
  slotUop_is_load = _GEN_256[0:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_257 = {1{$random}};
  slotUop_is_unique = _GEN_257[0:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_258 = {1{$random}};
  slotUop_flush_on_commit = _GEN_258[0:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_259 = {1{$random}};
  slotUop_ldst = _GEN_259[5:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_260 = {1{$random}};
  slotUop_lrs1 = _GEN_260[5:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_261 = {1{$random}};
  slotUop_lrs2 = _GEN_261[5:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_262 = {1{$random}};
  slotUop_lrs3 = _GEN_262[5:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_263 = {1{$random}};
  slotUop_ldst_val = _GEN_263[0:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_264 = {1{$random}};
  slotUop_dst_rtype = _GEN_264[1:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_265 = {1{$random}};
  slotUop_lrs1_rtype = _GEN_265[1:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_266 = {1{$random}};
  slotUop_lrs2_rtype = _GEN_266[1:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_267 = {1{$random}};
  slotUop_frs3_en = _GEN_267[0:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_268 = {1{$random}};
  slotUop_fp_val = _GEN_268[0:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_269 = {1{$random}};
  slotUop_fp_single = _GEN_269[0:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_270 = {1{$random}};
  slotUop_xcpt_if = _GEN_270[0:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_271 = {1{$random}};
  slotUop_replay_if = _GEN_271[0:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_272 = {2{$random}};
  slotUop_debug_wdata = _GEN_272[63:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_273 = {1{$random}};
  slotUop_debug_events_fetch_seq = _GEN_273[31:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_274 = {1{$random}};
  _GEN_6 = _GEN_274[1:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_275 = {1{$random}};
  _GEN_11 = _GEN_275[31:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_276 = {2{$random}};
  _GEN_124 = _GEN_276[39:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_277 = {1{$random}};
  _GEN_131 = _GEN_277[7:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_278 = {1{$random}};
  _GEN_132 = _GEN_278[1:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_279 = {1{$random}};
  _GEN_133 = _GEN_279[0:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_280 = {1{$random}};
  _GEN_134 = _GEN_280[0:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_281 = {1{$random}};
  _GEN_135 = _GEN_281[0:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_282 = {1{$random}};
  _GEN_136 = _GEN_282[0:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_283 = {1{$random}};
  _GEN_137 = _GEN_283[0:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_284 = {1{$random}};
  _GEN_138 = _GEN_284[7:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_285 = {1{$random}};
  _GEN_139 = _GEN_285[2:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_286 = {1{$random}};
  _GEN_140 = _GEN_286[0:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_287 = {1{$random}};
  _GEN_141 = _GEN_287[0:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_288 = {1{$random}};
  _GEN_142 = _GEN_288[0:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_289 = {1{$random}};
  _GEN_143 = _GEN_289[0:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_290 = {1{$random}};
  _GEN_144 = _GEN_290[0:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_291 = {1{$random}};
  _GEN_145 = _GEN_291[0:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_292 = {1{$random}};
  _GEN_146 = _GEN_292[0:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_293 = {1{$random}};
  _GEN_147 = _GEN_293[0:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_294 = {1{$random}};
  _GEN_148 = _GEN_294[0:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_295 = {1{$random}};
  _GEN_149 = _GEN_295[0:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_296 = {1{$random}};
  _GEN_150 = _GEN_296[3:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_297 = {1{$random}};
  _GEN_151 = _GEN_297[19:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_298 = {1{$random}};
  _GEN_152 = _GEN_298[11:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_299 = {1{$random}};
  _GEN_153 = _GEN_299[6:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_300 = {1{$random}};
  _GEN_154 = _GEN_300[4:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_301 = {1{$random}};
  _GEN_155 = _GEN_301[4:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_302 = {1{$random}};
  _GEN_156 = _GEN_302[4:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_303 = {1{$random}};
  _GEN_157 = _GEN_303[6:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_304 = {1{$random}};
  _GEN_158 = _GEN_304[6:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_305 = {1{$random}};
  _GEN_159 = _GEN_305[6:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_306 = {1{$random}};
  _GEN_160 = _GEN_306[0:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_307 = {1{$random}};
  _GEN_161 = _GEN_307[0:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_308 = {1{$random}};
  _GEN_162 = _GEN_308[0:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_309 = {1{$random}};
  _GEN_163 = _GEN_309[6:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_310 = {1{$random}};
  _GEN_164 = _GEN_310[0:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_311 = {2{$random}};
  _GEN_165 = _GEN_311[63:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_312 = {1{$random}};
  _GEN_166 = _GEN_312[3:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_313 = {1{$random}};
  _GEN_167 = _GEN_313[2:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_314 = {1{$random}};
  _GEN_168 = _GEN_314[0:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_315 = {1{$random}};
  _GEN_169 = _GEN_315[0:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_316 = {1{$random}};
  _GEN_170 = _GEN_316[0:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_317 = {1{$random}};
  _GEN_171 = _GEN_317[0:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_318 = {1{$random}};
  _GEN_172 = _GEN_318[0:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_319 = {1{$random}};
  _GEN_173 = _GEN_319[5:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_320 = {1{$random}};
  _GEN_174 = _GEN_320[5:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_321 = {1{$random}};
  _GEN_175 = _GEN_321[5:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_322 = {1{$random}};
  _GEN_176 = _GEN_322[5:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_323 = {1{$random}};
  _GEN_177 = _GEN_323[0:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_324 = {1{$random}};
  _GEN_178 = _GEN_324[1:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_325 = {1{$random}};
  _GEN_179 = _GEN_325[1:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_326 = {1{$random}};
  _GEN_180 = _GEN_326[0:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_327 = {1{$random}};
  _GEN_181 = _GEN_327[0:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_328 = {1{$random}};
  _GEN_182 = _GEN_328[0:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_329 = {1{$random}};
  _GEN_183 = _GEN_329[0:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_330 = {2{$random}};
  _GEN_184 = _GEN_330[63:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_331 = {1{$random}};
  _GEN_185 = _GEN_331[31:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_332 = {1{$random}};
  _GEN_186 = _GEN_332[1:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_333 = {1{$random}};
  _GEN_187 = _GEN_333[2:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_334 = {1{$random}};
  _GEN_188 = _GEN_334[2:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_335 = {1{$random}};
  _GEN_189 = _GEN_335[3:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_336 = {1{$random}};
  _GEN_190 = _GEN_336[0:0];
  `endif
  end
`endif
  always @(posedge clock) begin
    if (reset) begin
      slot_state <= 2'h0;
    end else begin
      if (_T_1233) begin
        slot_state <= updated_state;
      end else begin
        if (_T_1225) begin
          slot_state <= 2'h0;
        end else begin
          if (_T_1219) begin
            slot_state <= io_in_uop_bits_iw_state;
          end else begin
            if (io_kill) begin
              slot_state <= 2'h0;
            end
          end
        end
      end
    end
    if (reset) begin
      slot_p1 <= 1'h0;
    end else begin
      slot_p1 <= next_p1;
    end
    if (reset) begin
      slot_p2 <= 1'h0;
    end else begin
      slot_p2 <= next_p2;
    end
    if (reset) begin
      slot_p3 <= 1'h0;
    end else begin
      slot_p3 <= next_p3;
    end
    if (reset) begin
      slotUop_valid <= _T_1011_valid;
    end else begin
      if (io_in_uop_valid) begin
        slotUop_valid <= io_in_uop_bits_valid;
      end
    end
    if (reset) begin
      slotUop_iw_state <= _T_1011_iw_state;
    end else begin
      if (io_in_uop_valid) begin
        slotUop_iw_state <= io_in_uop_bits_iw_state;
      end
    end
    if (reset) begin
      slotUop_uopc <= _T_1011_uopc;
    end else begin
      if (io_in_uop_valid) begin
        slotUop_uopc <= io_in_uop_bits_uopc;
      end else begin
        if (_T_1246) begin
          if (slot_p1) begin
            slotUop_uopc <= 9'h3;
          end
        end
      end
    end
    if (reset) begin
      slotUop_inst <= _T_1011_inst;
    end else begin
      if (io_in_uop_valid) begin
        slotUop_inst <= io_in_uop_bits_inst;
      end
    end
    if (reset) begin
      slotUop_pc <= _T_1011_pc;
    end else begin
      if (io_in_uop_valid) begin
        slotUop_pc <= io_in_uop_bits_pc;
      end
    end
    if (reset) begin
      slotUop_fu_code <= _T_1011_fu_code;
    end else begin
      if (io_in_uop_valid) begin
        slotUop_fu_code <= io_in_uop_bits_fu_code;
      end
    end
    if (reset) begin
      slotUop_ctrl_br_type <= _T_1011_ctrl_br_type;
    end else begin
      if (io_in_uop_valid) begin
        slotUop_ctrl_br_type <= io_in_uop_bits_ctrl_br_type;
      end
    end
    if (reset) begin
      slotUop_ctrl_op1_sel <= _T_1011_ctrl_op1_sel;
    end else begin
      if (io_in_uop_valid) begin
        slotUop_ctrl_op1_sel <= io_in_uop_bits_ctrl_op1_sel;
      end
    end
    if (reset) begin
      slotUop_ctrl_op2_sel <= _T_1011_ctrl_op2_sel;
    end else begin
      if (io_in_uop_valid) begin
        slotUop_ctrl_op2_sel <= io_in_uop_bits_ctrl_op2_sel;
      end
    end
    if (reset) begin
      slotUop_ctrl_imm_sel <= _T_1011_ctrl_imm_sel;
    end else begin
      if (io_in_uop_valid) begin
        slotUop_ctrl_imm_sel <= io_in_uop_bits_ctrl_imm_sel;
      end
    end
    if (reset) begin
      slotUop_ctrl_op_fcn <= _T_1011_ctrl_op_fcn;
    end else begin
      if (io_in_uop_valid) begin
        slotUop_ctrl_op_fcn <= io_in_uop_bits_ctrl_op_fcn;
      end
    end
    if (reset) begin
      slotUop_ctrl_fcn_dw <= _T_1011_ctrl_fcn_dw;
    end else begin
      if (io_in_uop_valid) begin
        slotUop_ctrl_fcn_dw <= io_in_uop_bits_ctrl_fcn_dw;
      end
    end
    if (reset) begin
      slotUop_ctrl_rf_wen <= _T_1011_ctrl_rf_wen;
    end else begin
      if (io_in_uop_valid) begin
        slotUop_ctrl_rf_wen <= io_in_uop_bits_ctrl_rf_wen;
      end
    end
    if (reset) begin
      slotUop_ctrl_csr_cmd <= _T_1011_ctrl_csr_cmd;
    end else begin
      if (io_in_uop_valid) begin
        slotUop_ctrl_csr_cmd <= io_in_uop_bits_ctrl_csr_cmd;
      end
    end
    if (reset) begin
      slotUop_ctrl_is_load <= _T_1011_ctrl_is_load;
    end else begin
      if (io_in_uop_valid) begin
        slotUop_ctrl_is_load <= io_in_uop_bits_ctrl_is_load;
      end
    end
    if (reset) begin
      slotUop_ctrl_is_sta <= _T_1011_ctrl_is_sta;
    end else begin
      if (io_in_uop_valid) begin
        slotUop_ctrl_is_sta <= io_in_uop_bits_ctrl_is_sta;
      end
    end
    if (reset) begin
      slotUop_ctrl_is_std <= _T_1011_ctrl_is_std;
    end else begin
      if (io_in_uop_valid) begin
        slotUop_ctrl_is_std <= io_in_uop_bits_ctrl_is_std;
      end
    end
    if (reset) begin
      slotUop_wakeup_delay <= _T_1011_wakeup_delay;
    end else begin
      if (io_in_uop_valid) begin
        slotUop_wakeup_delay <= io_in_uop_bits_wakeup_delay;
      end
    end
    if (reset) begin
      slotUop_allocate_brtag <= _T_1011_allocate_brtag;
    end else begin
      if (io_in_uop_valid) begin
        slotUop_allocate_brtag <= io_in_uop_bits_allocate_brtag;
      end
    end
    if (reset) begin
      slotUop_is_br_or_jmp <= _T_1011_is_br_or_jmp;
    end else begin
      if (io_in_uop_valid) begin
        slotUop_is_br_or_jmp <= io_in_uop_bits_is_br_or_jmp;
      end
    end
    if (reset) begin
      slotUop_is_jump <= _T_1011_is_jump;
    end else begin
      if (io_in_uop_valid) begin
        slotUop_is_jump <= io_in_uop_bits_is_jump;
      end
    end
    if (reset) begin
      slotUop_is_jal <= _T_1011_is_jal;
    end else begin
      if (io_in_uop_valid) begin
        slotUop_is_jal <= io_in_uop_bits_is_jal;
      end
    end
    if (reset) begin
      slotUop_is_ret <= _T_1011_is_ret;
    end else begin
      if (io_in_uop_valid) begin
        slotUop_is_ret <= io_in_uop_bits_is_ret;
      end
    end
    if (reset) begin
      slotUop_is_call <= _T_1011_is_call;
    end else begin
      if (io_in_uop_valid) begin
        slotUop_is_call <= io_in_uop_bits_is_call;
      end
    end
    if (reset) begin
      slotUop_br_mask <= _T_1011_br_mask;
    end else begin
      if (_T_1223) begin
        if (io_brinfo_valid) begin
          slotUop_br_mask <= _T_1333;
        end
      end else begin
        if (io_in_uop_valid) begin
          slotUop_br_mask <= io_in_uop_bits_br_mask;
        end
      end
    end
    if (reset) begin
      slotUop_br_tag <= _T_1011_br_tag;
    end else begin
      if (io_in_uop_valid) begin
        slotUop_br_tag <= io_in_uop_bits_br_tag;
      end
    end
    if (reset) begin
      slotUop_br_prediction_bpd_predict_val <= _T_1011_br_prediction_bpd_predict_val;
    end else begin
      if (io_in_uop_valid) begin
        slotUop_br_prediction_bpd_predict_val <= io_in_uop_bits_br_prediction_bpd_predict_val;
      end
    end
    if (reset) begin
      slotUop_br_prediction_bpd_predict_taken <= _T_1011_br_prediction_bpd_predict_taken;
    end else begin
      if (io_in_uop_valid) begin
        slotUop_br_prediction_bpd_predict_taken <= io_in_uop_bits_br_prediction_bpd_predict_taken;
      end
    end
    if (reset) begin
      slotUop_br_prediction_btb_hit <= _T_1011_br_prediction_btb_hit;
    end else begin
      if (io_in_uop_valid) begin
        slotUop_br_prediction_btb_hit <= io_in_uop_bits_br_prediction_btb_hit;
      end
    end
    if (reset) begin
      slotUop_br_prediction_btb_predicted <= _T_1011_br_prediction_btb_predicted;
    end else begin
      if (io_in_uop_valid) begin
        slotUop_br_prediction_btb_predicted <= io_in_uop_bits_br_prediction_btb_predicted;
      end
    end
    if (reset) begin
      slotUop_br_prediction_is_br_or_jalr <= _T_1011_br_prediction_is_br_or_jalr;
    end else begin
      if (io_in_uop_valid) begin
        slotUop_br_prediction_is_br_or_jalr <= io_in_uop_bits_br_prediction_is_br_or_jalr;
      end
    end
    if (reset) begin
      slotUop_stat_brjmp_mispredicted <= _T_1011_stat_brjmp_mispredicted;
    end else begin
      if (io_in_uop_valid) begin
        slotUop_stat_brjmp_mispredicted <= io_in_uop_bits_stat_brjmp_mispredicted;
      end
    end
    if (reset) begin
      slotUop_stat_btb_made_pred <= _T_1011_stat_btb_made_pred;
    end else begin
      if (io_in_uop_valid) begin
        slotUop_stat_btb_made_pred <= io_in_uop_bits_stat_btb_made_pred;
      end
    end
    if (reset) begin
      slotUop_stat_btb_mispredicted <= _T_1011_stat_btb_mispredicted;
    end else begin
      if (io_in_uop_valid) begin
        slotUop_stat_btb_mispredicted <= io_in_uop_bits_stat_btb_mispredicted;
      end
    end
    if (reset) begin
      slotUop_stat_bpd_made_pred <= _T_1011_stat_bpd_made_pred;
    end else begin
      if (io_in_uop_valid) begin
        slotUop_stat_bpd_made_pred <= io_in_uop_bits_stat_bpd_made_pred;
      end
    end
    if (reset) begin
      slotUop_stat_bpd_mispredicted <= _T_1011_stat_bpd_mispredicted;
    end else begin
      if (io_in_uop_valid) begin
        slotUop_stat_bpd_mispredicted <= io_in_uop_bits_stat_bpd_mispredicted;
      end
    end
    if (reset) begin
      slotUop_fetch_pc_lob <= _T_1011_fetch_pc_lob;
    end else begin
      if (io_in_uop_valid) begin
        slotUop_fetch_pc_lob <= io_in_uop_bits_fetch_pc_lob;
      end
    end
    if (reset) begin
      slotUop_imm_packed <= _T_1011_imm_packed;
    end else begin
      if (io_in_uop_valid) begin
        slotUop_imm_packed <= io_in_uop_bits_imm_packed;
      end
    end
    if (reset) begin
      slotUop_csr_addr <= _T_1011_csr_addr;
    end else begin
      if (io_in_uop_valid) begin
        slotUop_csr_addr <= io_in_uop_bits_csr_addr;
      end
    end
    if (reset) begin
      slotUop_rob_idx <= _T_1011_rob_idx;
    end else begin
      if (io_in_uop_valid) begin
        slotUop_rob_idx <= io_in_uop_bits_rob_idx;
      end
    end
    if (reset) begin
      slotUop_ldq_idx <= _T_1011_ldq_idx;
    end else begin
      if (io_in_uop_valid) begin
        slotUop_ldq_idx <= io_in_uop_bits_ldq_idx;
      end
    end
    if (reset) begin
      slotUop_stq_idx <= _T_1011_stq_idx;
    end else begin
      if (io_in_uop_valid) begin
        slotUop_stq_idx <= io_in_uop_bits_stq_idx;
      end
    end
    if (reset) begin
      slotUop_brob_idx <= _T_1011_brob_idx;
    end else begin
      if (io_in_uop_valid) begin
        slotUop_brob_idx <= io_in_uop_bits_brob_idx;
      end
    end
    if (reset) begin
      slotUop_pdst <= _T_1011_pdst;
    end else begin
      if (io_in_uop_valid) begin
        slotUop_pdst <= io_in_uop_bits_pdst;
      end
    end
    if (reset) begin
      slotUop_pop1 <= _T_1011_pop1;
    end else begin
      if (io_in_uop_valid) begin
        slotUop_pop1 <= io_in_uop_bits_pop1;
      end
    end
    if (reset) begin
      slotUop_pop2 <= _T_1011_pop2;
    end else begin
      if (io_in_uop_valid) begin
        slotUop_pop2 <= io_in_uop_bits_pop2;
      end
    end
    if (reset) begin
      slotUop_pop3 <= _T_1011_pop3;
    end else begin
      if (io_in_uop_valid) begin
        slotUop_pop3 <= io_in_uop_bits_pop3;
      end
    end
    if (reset) begin
      slotUop_prs1_busy <= _T_1011_prs1_busy;
    end else begin
      if (io_in_uop_valid) begin
        slotUop_prs1_busy <= io_in_uop_bits_prs1_busy;
      end
    end
    if (reset) begin
      slotUop_prs2_busy <= _T_1011_prs2_busy;
    end else begin
      if (io_in_uop_valid) begin
        slotUop_prs2_busy <= io_in_uop_bits_prs2_busy;
      end
    end
    if (reset) begin
      slotUop_prs3_busy <= _T_1011_prs3_busy;
    end else begin
      if (io_in_uop_valid) begin
        slotUop_prs3_busy <= io_in_uop_bits_prs3_busy;
      end
    end
    if (reset) begin
      slotUop_stale_pdst <= _T_1011_stale_pdst;
    end else begin
      if (io_in_uop_valid) begin
        slotUop_stale_pdst <= io_in_uop_bits_stale_pdst;
      end
    end
    if (reset) begin
      slotUop_exception <= _T_1011_exception;
    end else begin
      if (io_in_uop_valid) begin
        slotUop_exception <= io_in_uop_bits_exception;
      end
    end
    if (reset) begin
      slotUop_exc_cause <= _T_1011_exc_cause;
    end else begin
      if (io_in_uop_valid) begin
        slotUop_exc_cause <= io_in_uop_bits_exc_cause;
      end
    end
    if (reset) begin
      slotUop_bypassable <= _T_1011_bypassable;
    end else begin
      if (io_in_uop_valid) begin
        slotUop_bypassable <= io_in_uop_bits_bypassable;
      end
    end
    if (reset) begin
      slotUop_mem_cmd <= _T_1011_mem_cmd;
    end else begin
      if (io_in_uop_valid) begin
        slotUop_mem_cmd <= io_in_uop_bits_mem_cmd;
      end
    end
    if (reset) begin
      slotUop_mem_typ <= _T_1011_mem_typ;
    end else begin
      if (io_in_uop_valid) begin
        slotUop_mem_typ <= io_in_uop_bits_mem_typ;
      end
    end
    if (reset) begin
      slotUop_is_fence <= _T_1011_is_fence;
    end else begin
      if (io_in_uop_valid) begin
        slotUop_is_fence <= io_in_uop_bits_is_fence;
      end
    end
    if (reset) begin
      slotUop_is_fencei <= _T_1011_is_fencei;
    end else begin
      if (io_in_uop_valid) begin
        slotUop_is_fencei <= io_in_uop_bits_is_fencei;
      end
    end
    if (reset) begin
      slotUop_is_store <= _T_1011_is_store;
    end else begin
      if (io_in_uop_valid) begin
        slotUop_is_store <= io_in_uop_bits_is_store;
      end
    end
    if (reset) begin
      slotUop_is_amo <= _T_1011_is_amo;
    end else begin
      if (io_in_uop_valid) begin
        slotUop_is_amo <= io_in_uop_bits_is_amo;
      end
    end
    if (reset) begin
      slotUop_is_load <= _T_1011_is_load;
    end else begin
      if (io_in_uop_valid) begin
        slotUop_is_load <= io_in_uop_bits_is_load;
      end
    end
    if (reset) begin
      slotUop_is_unique <= _T_1011_is_unique;
    end else begin
      if (io_in_uop_valid) begin
        slotUop_is_unique <= io_in_uop_bits_is_unique;
      end
    end
    if (reset) begin
      slotUop_flush_on_commit <= _T_1011_flush_on_commit;
    end else begin
      if (io_in_uop_valid) begin
        slotUop_flush_on_commit <= io_in_uop_bits_flush_on_commit;
      end
    end
    if (reset) begin
      slotUop_ldst <= _T_1011_ldst;
    end else begin
      if (io_in_uop_valid) begin
        slotUop_ldst <= io_in_uop_bits_ldst;
      end
    end
    if (reset) begin
      slotUop_lrs1 <= _T_1011_lrs1;
    end else begin
      if (io_in_uop_valid) begin
        slotUop_lrs1 <= io_in_uop_bits_lrs1;
      end
    end
    if (reset) begin
      slotUop_lrs2 <= _T_1011_lrs2;
    end else begin
      if (io_in_uop_valid) begin
        slotUop_lrs2 <= io_in_uop_bits_lrs2;
      end
    end
    if (reset) begin
      slotUop_lrs3 <= _T_1011_lrs3;
    end else begin
      if (io_in_uop_valid) begin
        slotUop_lrs3 <= io_in_uop_bits_lrs3;
      end
    end
    if (reset) begin
      slotUop_ldst_val <= _T_1011_ldst_val;
    end else begin
      if (io_in_uop_valid) begin
        slotUop_ldst_val <= io_in_uop_bits_ldst_val;
      end
    end
    if (reset) begin
      slotUop_dst_rtype <= _T_1011_dst_rtype;
    end else begin
      if (io_in_uop_valid) begin
        slotUop_dst_rtype <= io_in_uop_bits_dst_rtype;
      end
    end
    if (reset) begin
      slotUop_lrs1_rtype <= _T_1011_lrs1_rtype;
    end else begin
      if (io_in_uop_valid) begin
        slotUop_lrs1_rtype <= io_in_uop_bits_lrs1_rtype;
      end else begin
        if (_T_1246) begin
          if (slot_p1) begin
            slotUop_lrs1_rtype <= 2'h2;
          end
        end
      end
    end
    if (reset) begin
      slotUop_lrs2_rtype <= _T_1011_lrs2_rtype;
    end else begin
      if (io_in_uop_valid) begin
        slotUop_lrs2_rtype <= io_in_uop_bits_lrs2_rtype;
      end else begin
        if (_T_1246) begin
          if (_T_1248) begin
            slotUop_lrs2_rtype <= 2'h2;
          end
        end
      end
    end
    if (reset) begin
      slotUop_frs3_en <= _T_1011_frs3_en;
    end else begin
      if (io_in_uop_valid) begin
        slotUop_frs3_en <= io_in_uop_bits_frs3_en;
      end
    end
    if (reset) begin
      slotUop_fp_val <= _T_1011_fp_val;
    end else begin
      if (io_in_uop_valid) begin
        slotUop_fp_val <= io_in_uop_bits_fp_val;
      end
    end
    if (reset) begin
      slotUop_fp_single <= _T_1011_fp_single;
    end else begin
      if (io_in_uop_valid) begin
        slotUop_fp_single <= io_in_uop_bits_fp_single;
      end
    end
    if (reset) begin
      slotUop_xcpt_if <= _T_1011_xcpt_if;
    end else begin
      if (io_in_uop_valid) begin
        slotUop_xcpt_if <= io_in_uop_bits_xcpt_if;
      end
    end
    if (reset) begin
      slotUop_replay_if <= _T_1011_replay_if;
    end else begin
      if (io_in_uop_valid) begin
        slotUop_replay_if <= io_in_uop_bits_replay_if;
      end
    end
    if (reset) begin
      slotUop_debug_wdata <= _T_1011_debug_wdata;
    end else begin
      if (io_in_uop_valid) begin
        slotUop_debug_wdata <= io_in_uop_bits_debug_wdata;
      end
    end
    if (reset) begin
      slotUop_debug_events_fetch_seq <= _T_1011_debug_events_fetch_seq;
    end else begin
      if (io_in_uop_valid) begin
        slotUop_debug_events_fetch_seq <= io_in_uop_bits_debug_events_fetch_seq;
      end
    end
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (io_in_uop_valid & _T_1254) begin
          $fwrite(32'h80000002,"Assertion failed: trying to overwrite a valid issue slot.\n    at issue_slot.scala:128 assert (isInvalid || io.clear || io.kill, \"trying to overwrite a valid issue slot.\")\n");
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (io_in_uop_valid & _T_1254) begin
          $fatal;
        end
    `ifdef STOP_COND
      end
    `endif
    `endif
  end
endmodule