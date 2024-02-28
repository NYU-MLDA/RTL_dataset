module LoadReqSlot(
  input   clock,
  input   reset,
  output  io_valid,
  input   io_wen,
  input   io_in_uop_valid,
  input  [1:0] io_in_uop_iw_state,
  input  [8:0] io_in_uop_uopc,
  input  [31:0] io_in_uop_inst,
  input  [39:0] io_in_uop_pc,
  input  [7:0] io_in_uop_fu_code,
  input  [3:0] io_in_uop_ctrl_br_type,
  input  [1:0] io_in_uop_ctrl_op1_sel,
  input  [2:0] io_in_uop_ctrl_op2_sel,
  input  [2:0] io_in_uop_ctrl_imm_sel,
  input  [3:0] io_in_uop_ctrl_op_fcn,
  input   io_in_uop_ctrl_fcn_dw,
  input   io_in_uop_ctrl_rf_wen,
  input  [2:0] io_in_uop_ctrl_csr_cmd,
  input   io_in_uop_ctrl_is_load,
  input   io_in_uop_ctrl_is_sta,
  input   io_in_uop_ctrl_is_std,
  input  [1:0] io_in_uop_wakeup_delay,
  input   io_in_uop_allocate_brtag,
  input   io_in_uop_is_br_or_jmp,
  input   io_in_uop_is_jump,
  input   io_in_uop_is_jal,
  input   io_in_uop_is_ret,
  input   io_in_uop_is_call,
  input  [7:0] io_in_uop_br_mask,
  input  [2:0] io_in_uop_br_tag,
  input   io_in_uop_br_prediction_bpd_predict_val,
  input   io_in_uop_br_prediction_bpd_predict_taken,
  input   io_in_uop_br_prediction_btb_hit,
  input   io_in_uop_br_prediction_btb_predicted,
  input   io_in_uop_br_prediction_is_br_or_jalr,
  input   io_in_uop_stat_brjmp_mispredicted,
  input   io_in_uop_stat_btb_made_pred,
  input   io_in_uop_stat_btb_mispredicted,
  input   io_in_uop_stat_bpd_made_pred,
  input   io_in_uop_stat_bpd_mispredicted,
  input  [3:0] io_in_uop_fetch_pc_lob,
  input  [19:0] io_in_uop_imm_packed,
  input  [11:0] io_in_uop_csr_addr,
  input  [6:0] io_in_uop_rob_idx,
  input  [4:0] io_in_uop_ldq_idx,
  input  [4:0] io_in_uop_stq_idx,
  input  [4:0] io_in_uop_brob_idx,
  input  [6:0] io_in_uop_pdst,
  input  [6:0] io_in_uop_pop1,
  input  [6:0] io_in_uop_pop2,
  input  [6:0] io_in_uop_pop3,
  input   io_in_uop_prs1_busy,
  input   io_in_uop_prs2_busy,
  input   io_in_uop_prs3_busy,
  input  [6:0] io_in_uop_stale_pdst,
  input   io_in_uop_exception,
  input  [63:0] io_in_uop_exc_cause,
  input   io_in_uop_bypassable,
  input  [3:0] io_in_uop_mem_cmd,
  input  [2:0] io_in_uop_mem_typ,
  input   io_in_uop_is_fence,
  input   io_in_uop_is_fencei,
  input   io_in_uop_is_store,
  input   io_in_uop_is_amo,
  input   io_in_uop_is_load,
  input   io_in_uop_is_unique,
  input   io_in_uop_flush_on_commit,
  input  [5:0] io_in_uop_ldst,
  input  [5:0] io_in_uop_lrs1,
  input  [5:0] io_in_uop_lrs2,
  input  [5:0] io_in_uop_lrs3,
  input   io_in_uop_ldst_val,
  input  [1:0] io_in_uop_dst_rtype,
  input  [1:0] io_in_uop_lrs1_rtype,
  input  [1:0] io_in_uop_lrs2_rtype,
  input   io_in_uop_frs3_en,
  input   io_in_uop_fp_val,
  input   io_in_uop_fp_single,
  input   io_in_uop_xcpt_if,
  input   io_in_uop_replay_if,
  input  [63:0] io_in_uop_debug_wdata,
  input  [31:0] io_in_uop_debug_events_fetch_seq,
  input   io_clear,
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
  input   io_flush_pipe,
  output  io_out_uop_valid,
  output [1:0] io_out_uop_iw_state,
  output [8:0] io_out_uop_uopc,
  output [31:0] io_out_uop_inst,
  output [39:0] io_out_uop_pc,
  output [7:0] io_out_uop_fu_code,
  output [3:0] io_out_uop_ctrl_br_type,
  output [1:0] io_out_uop_ctrl_op1_sel,
  output [2:0] io_out_uop_ctrl_op2_sel,
  output [2:0] io_out_uop_ctrl_imm_sel,
  output [3:0] io_out_uop_ctrl_op_fcn,
  output  io_out_uop_ctrl_fcn_dw,
  output  io_out_uop_ctrl_rf_wen,
  output [2:0] io_out_uop_ctrl_csr_cmd,
  output  io_out_uop_ctrl_is_load,
  output  io_out_uop_ctrl_is_sta,
  output  io_out_uop_ctrl_is_std,
  output [1:0] io_out_uop_wakeup_delay,
  output  io_out_uop_allocate_brtag,
  output  io_out_uop_is_br_or_jmp,
  output  io_out_uop_is_jump,
  output  io_out_uop_is_jal,
  output  io_out_uop_is_ret,
  output  io_out_uop_is_call,
  output [7:0] io_out_uop_br_mask,
  output [2:0] io_out_uop_br_tag,
  output  io_out_uop_br_prediction_bpd_predict_val,
  output  io_out_uop_br_prediction_bpd_predict_taken,
  output  io_out_uop_br_prediction_btb_hit,
  output  io_out_uop_br_prediction_btb_predicted,
  output  io_out_uop_br_prediction_is_br_or_jalr,
  output  io_out_uop_stat_brjmp_mispredicted,
  output  io_out_uop_stat_btb_made_pred,
  output  io_out_uop_stat_btb_mispredicted,
  output  io_out_uop_stat_bpd_made_pred,
  output  io_out_uop_stat_bpd_mispredicted,
  output [3:0] io_out_uop_fetch_pc_lob,
  output [19:0] io_out_uop_imm_packed,
  output [11:0] io_out_uop_csr_addr,
  output [6:0] io_out_uop_rob_idx,
  output [4:0] io_out_uop_ldq_idx,
  output [4:0] io_out_uop_stq_idx,
  output [4:0] io_out_uop_brob_idx,
  output [6:0] io_out_uop_pdst,
  output [6:0] io_out_uop_pop1,
  output [6:0] io_out_uop_pop2,
  output [6:0] io_out_uop_pop3,
  output  io_out_uop_prs1_busy,
  output  io_out_uop_prs2_busy,
  output  io_out_uop_prs3_busy,
  output [6:0] io_out_uop_stale_pdst,
  output  io_out_uop_exception,
  output [63:0] io_out_uop_exc_cause,
  output  io_out_uop_bypassable,
  output [3:0] io_out_uop_mem_cmd,
  output [2:0] io_out_uop_mem_typ,
  output  io_out_uop_is_fence,
  output  io_out_uop_is_fencei,
  output  io_out_uop_is_store,
  output  io_out_uop_is_amo,
  output  io_out_uop_is_load,
  output  io_out_uop_is_unique,
  output  io_out_uop_flush_on_commit,
  output [5:0] io_out_uop_ldst,
  output [5:0] io_out_uop_lrs1,
  output [5:0] io_out_uop_lrs2,
  output [5:0] io_out_uop_lrs3,
  output  io_out_uop_ldst_val,
  output [1:0] io_out_uop_dst_rtype,
  output [1:0] io_out_uop_lrs1_rtype,
  output [1:0] io_out_uop_lrs2_rtype,
  output  io_out_uop_frs3_en,
  output  io_out_uop_fp_val,
  output  io_out_uop_fp_single,
  output  io_out_uop_xcpt_if,
  output  io_out_uop_replay_if,
  output [63:0] io_out_uop_debug_wdata,
  output [31:0] io_out_uop_debug_events_fetch_seq,
  output  io_was_killed
);
  reg  valid;
  reg [31:0] _GEN_84;
  reg  was_killed;
  reg [31:0] _GEN_85;
  reg  uop_valid;
  reg [31:0] _GEN_88;
  reg [1:0] uop_iw_state;
  reg [31:0] _GEN_89;
  reg [8:0] uop_uopc;
  reg [31:0] _GEN_90;
  reg [31:0] uop_inst;
  reg [31:0] _GEN_91;
  reg [39:0] uop_pc;
  reg [63:0] _GEN_92;
  reg [7:0] uop_fu_code;
  reg [31:0] _GEN_93;
  reg [3:0] uop_ctrl_br_type;
  reg [31:0] _GEN_94;
  reg [1:0] uop_ctrl_op1_sel;
  reg [31:0] _GEN_95;
  reg [2:0] uop_ctrl_op2_sel;
  reg [31:0] _GEN_96;
  reg [2:0] uop_ctrl_imm_sel;
  reg [31:0] _GEN_97;
  reg [3:0] uop_ctrl_op_fcn;
  reg [31:0] _GEN_98;
  reg  uop_ctrl_fcn_dw;
  reg [31:0] _GEN_99;
  reg  uop_ctrl_rf_wen;
  reg [31:0] _GEN_100;
  reg [2:0] uop_ctrl_csr_cmd;
  reg [31:0] _GEN_101;
  reg  uop_ctrl_is_load;
  reg [31:0] _GEN_102;
  reg  uop_ctrl_is_sta;
  reg [31:0] _GEN_103;
  reg  uop_ctrl_is_std;
  reg [31:0] _GEN_104;
  reg [1:0] uop_wakeup_delay;
  reg [31:0] _GEN_105;
  reg  uop_allocate_brtag;
  reg [31:0] _GEN_106;
  reg  uop_is_br_or_jmp;
  reg [31:0] _GEN_107;
  reg  uop_is_jump;
  reg [31:0] _GEN_108;
  reg  uop_is_jal;
  reg [31:0] _GEN_109;
  reg  uop_is_ret;
  reg [31:0] _GEN_110;
  reg  uop_is_call;
  reg [31:0] _GEN_111;
  reg [7:0] uop_br_mask;
  reg [31:0] _GEN_112;
  reg [2:0] uop_br_tag;
  reg [31:0] _GEN_113;
  reg  uop_br_prediction_bpd_predict_val;
  reg [31:0] _GEN_114;
  reg  uop_br_prediction_bpd_predict_taken;
  reg [31:0] _GEN_115;
  reg  uop_br_prediction_btb_hit;
  reg [31:0] _GEN_116;
  reg  uop_br_prediction_btb_predicted;
  reg [31:0] _GEN_117;
  reg  uop_br_prediction_is_br_or_jalr;
  reg [31:0] _GEN_118;
  reg  uop_stat_brjmp_mispredicted;
  reg [31:0] _GEN_119;
  reg  uop_stat_btb_made_pred;
  reg [31:0] _GEN_120;
  reg  uop_stat_btb_mispredicted;
  reg [31:0] _GEN_121;
  reg  uop_stat_bpd_made_pred;
  reg [31:0] _GEN_122;
  reg  uop_stat_bpd_mispredicted;
  reg [31:0] _GEN_123;
  reg [3:0] uop_fetch_pc_lob;
  reg [31:0] _GEN_124;
  reg [19:0] uop_imm_packed;
  reg [31:0] _GEN_125;
  reg [11:0] uop_csr_addr;
  reg [31:0] _GEN_126;
  reg [6:0] uop_rob_idx;
  reg [31:0] _GEN_127;
  reg [4:0] uop_ldq_idx;
  reg [31:0] _GEN_128;
  reg [4:0] uop_stq_idx;
  reg [31:0] _GEN_129;
  reg [4:0] uop_brob_idx;
  reg [31:0] _GEN_130;
  reg [6:0] uop_pdst;
  reg [31:0] _GEN_131;
  reg [6:0] uop_pop1;
  reg [31:0] _GEN_132;
  reg [6:0] uop_pop2;
  reg [31:0] _GEN_133;
  reg [6:0] uop_pop3;
  reg [31:0] _GEN_134;
  reg  uop_prs1_busy;
  reg [31:0] _GEN_135;
  reg  uop_prs2_busy;
  reg [31:0] _GEN_136;
  reg  uop_prs3_busy;
  reg [31:0] _GEN_137;
  reg [6:0] uop_stale_pdst;
  reg [31:0] _GEN_138;
  reg  uop_exception;
  reg [31:0] _GEN_139;
  reg [63:0] uop_exc_cause;
  reg [63:0] _GEN_140;
  reg  uop_bypassable;
  reg [31:0] _GEN_141;
  reg [3:0] uop_mem_cmd;
  reg [31:0] _GEN_142;
  reg [2:0] uop_mem_typ;
  reg [31:0] _GEN_143;
  reg  uop_is_fence;
  reg [31:0] _GEN_144;
  reg  uop_is_fencei;
  reg [31:0] _GEN_145;
  reg  uop_is_store;
  reg [31:0] _GEN_146;
  reg  uop_is_amo;
  reg [31:0] _GEN_147;
  reg  uop_is_load;
  reg [31:0] _GEN_148;
  reg  uop_is_unique;
  reg [31:0] _GEN_149;
  reg  uop_flush_on_commit;
  reg [31:0] _GEN_150;
  reg [5:0] uop_ldst;
  reg [31:0] _GEN_151;
  reg [5:0] uop_lrs1;
  reg [31:0] _GEN_152;
  reg [5:0] uop_lrs2;
  reg [31:0] _GEN_153;
  reg [5:0] uop_lrs3;
  reg [31:0] _GEN_154;
  reg  uop_ldst_val;
  reg [31:0] _GEN_155;
  reg [1:0] uop_dst_rtype;
  reg [31:0] _GEN_156;
  reg [1:0] uop_lrs1_rtype;
  reg [31:0] _GEN_157;
  reg [1:0] uop_lrs2_rtype;
  reg [31:0] _GEN_158;
  reg  uop_frs3_en;
  reg [31:0] _GEN_159;
  reg  uop_fp_val;
  reg [31:0] _GEN_160;
  reg  uop_fp_single;
  reg [31:0] _GEN_161;
  reg  uop_xcpt_if;
  reg [31:0] _GEN_162;
  reg  uop_replay_if;
  reg [31:0] _GEN_163;
  reg [63:0] uop_debug_wdata;
  reg [63:0] _GEN_164;
  reg [31:0] uop_debug_events_fetch_seq;
  reg [31:0] _GEN_165;
  wire  br_killed;
  wire  br_killed_incoming;
  wire  _T_571;
  wire  _GEN_0;
  wire  _T_574;
  wire  _T_575;
  wire  _T_577;
  wire  _GEN_1;
  wire  _GEN_2;
  wire  _GEN_3;
  wire [1:0] _GEN_4;
  wire [8:0] _GEN_5;
  wire [31:0] _GEN_6;
  wire [39:0] _GEN_7;
  wire [7:0] _GEN_8;
  wire [3:0] _GEN_9;
  wire [1:0] _GEN_10;
  wire [2:0] _GEN_11;
  wire [2:0] _GEN_12;
  wire [3:0] _GEN_13;
  wire  _GEN_14;
  wire  _GEN_15;
  wire [2:0] _GEN_16;
  wire  _GEN_17;
  wire  _GEN_18;
  wire  _GEN_19;
  wire [1:0] _GEN_20;
  wire  _GEN_21;
  wire  _GEN_22;
  wire  _GEN_23;
  wire  _GEN_24;
  wire  _GEN_25;
  wire  _GEN_26;
  wire [7:0] _GEN_27;
  wire [2:0] _GEN_28;
  wire  _GEN_29;
  wire  _GEN_30;
  wire  _GEN_31;
  wire  _GEN_32;
  wire  _GEN_33;
  wire  _GEN_34;
  wire  _GEN_35;
  wire  _GEN_36;
  wire  _GEN_37;
  wire  _GEN_38;
  wire [3:0] _GEN_39;
  wire [19:0] _GEN_40;
  wire [11:0] _GEN_41;
  wire [6:0] _GEN_42;
  wire [4:0] _GEN_43;
  wire [4:0] _GEN_44;
  wire [4:0] _GEN_45;
  wire [6:0] _GEN_46;
  wire [6:0] _GEN_47;
  wire [6:0] _GEN_48;
  wire [6:0] _GEN_49;
  wire  _GEN_50;
  wire  _GEN_51;
  wire  _GEN_52;
  wire [6:0] _GEN_53;
  wire  _GEN_54;
  wire [63:0] _GEN_55;
  wire  _GEN_56;
  wire [3:0] _GEN_57;
  wire [2:0] _GEN_58;
  wire  _GEN_59;
  wire  _GEN_60;
  wire  _GEN_61;
  wire  _GEN_62;
  wire  _GEN_63;
  wire  _GEN_64;
  wire  _GEN_65;
  wire [5:0] _GEN_66;
  wire [5:0] _GEN_67;
  wire [5:0] _GEN_68;
  wire [5:0] _GEN_69;
  wire  _GEN_70;
  wire [1:0] _GEN_71;
  wire [1:0] _GEN_72;
  wire [1:0] _GEN_73;
  wire  _GEN_74;
  wire  _GEN_75;
  wire  _GEN_76;
  wire  _GEN_77;
  wire  _GEN_78;
  wire [63:0] _GEN_79;
  wire [31:0] _GEN_80;
  wire  _T_578;
  wire  _T_582;
  wire  _T_583;
  wire  _T_584;
  wire  _GEN_81;
  wire [7:0] _T_586;
  wire  _T_588;
  wire  bmask_match;
  wire [7:0] _T_589;
  wire  _T_591;
  wire  bmask_match_incoming;
  wire [7:0] _T_592;
  wire [7:0] _T_593;
  wire [7:0] _T_594;
  wire [7:0] _GEN_82;
  wire  _T_597;
  wire [7:0] _T_599;
  wire [7:0] _GEN_83;
  wire  _GEN_86;
  wire  _GEN_87;
  wire  _T_602;
  assign io_valid = valid;
  assign io_out_uop_valid = uop_valid;
  assign io_out_uop_iw_state = uop_iw_state;
  assign io_out_uop_uopc = uop_uopc;
  assign io_out_uop_inst = uop_inst;
  assign io_out_uop_pc = uop_pc;
  assign io_out_uop_fu_code = uop_fu_code;
  assign io_out_uop_ctrl_br_type = uop_ctrl_br_type;
  assign io_out_uop_ctrl_op1_sel = uop_ctrl_op1_sel;
  assign io_out_uop_ctrl_op2_sel = uop_ctrl_op2_sel;
  assign io_out_uop_ctrl_imm_sel = uop_ctrl_imm_sel;
  assign io_out_uop_ctrl_op_fcn = uop_ctrl_op_fcn;
  assign io_out_uop_ctrl_fcn_dw = uop_ctrl_fcn_dw;
  assign io_out_uop_ctrl_rf_wen = uop_ctrl_rf_wen;
  assign io_out_uop_ctrl_csr_cmd = uop_ctrl_csr_cmd;
  assign io_out_uop_ctrl_is_load = uop_ctrl_is_load;
  assign io_out_uop_ctrl_is_sta = uop_ctrl_is_sta;
  assign io_out_uop_ctrl_is_std = uop_ctrl_is_std;
  assign io_out_uop_wakeup_delay = uop_wakeup_delay;
  assign io_out_uop_allocate_brtag = uop_allocate_brtag;
  assign io_out_uop_is_br_or_jmp = uop_is_br_or_jmp;
  assign io_out_uop_is_jump = uop_is_jump;
  assign io_out_uop_is_jal = uop_is_jal;
  assign io_out_uop_is_ret = uop_is_ret;
  assign io_out_uop_is_call = uop_is_call;
  assign io_out_uop_br_mask = uop_br_mask;
  assign io_out_uop_br_tag = uop_br_tag;
  assign io_out_uop_br_prediction_bpd_predict_val = uop_br_prediction_bpd_predict_val;
  assign io_out_uop_br_prediction_bpd_predict_taken = uop_br_prediction_bpd_predict_taken;
  assign io_out_uop_br_prediction_btb_hit = uop_br_prediction_btb_hit;
  assign io_out_uop_br_prediction_btb_predicted = uop_br_prediction_btb_predicted;
  assign io_out_uop_br_prediction_is_br_or_jalr = uop_br_prediction_is_br_or_jalr;
  assign io_out_uop_stat_brjmp_mispredicted = uop_stat_brjmp_mispredicted;
  assign io_out_uop_stat_btb_made_pred = uop_stat_btb_made_pred;
  assign io_out_uop_stat_btb_mispredicted = uop_stat_btb_mispredicted;
  assign io_out_uop_stat_bpd_made_pred = uop_stat_bpd_made_pred;
  assign io_out_uop_stat_bpd_mispredicted = uop_stat_bpd_mispredicted;
  assign io_out_uop_fetch_pc_lob = uop_fetch_pc_lob;
  assign io_out_uop_imm_packed = uop_imm_packed;
  assign io_out_uop_csr_addr = uop_csr_addr;
  assign io_out_uop_rob_idx = uop_rob_idx;
  assign io_out_uop_ldq_idx = uop_ldq_idx;
  assign io_out_uop_stq_idx = uop_stq_idx;
  assign io_out_uop_brob_idx = uop_brob_idx;
  assign io_out_uop_pdst = uop_pdst;
  assign io_out_uop_pop1 = uop_pop1;
  assign io_out_uop_pop2 = uop_pop2;
  assign io_out_uop_pop3 = uop_pop3;
  assign io_out_uop_prs1_busy = uop_prs1_busy;
  assign io_out_uop_prs2_busy = uop_prs2_busy;
  assign io_out_uop_prs3_busy = uop_prs3_busy;
  assign io_out_uop_stale_pdst = uop_stale_pdst;
  assign io_out_uop_exception = uop_exception;
  assign io_out_uop_exc_cause = uop_exc_cause;
  assign io_out_uop_bypassable = uop_bypassable;
  assign io_out_uop_mem_cmd = uop_mem_cmd;
  assign io_out_uop_mem_typ = uop_mem_typ;
  assign io_out_uop_is_fence = uop_is_fence;
  assign io_out_uop_is_fencei = uop_is_fencei;
  assign io_out_uop_is_store = uop_is_store;
  assign io_out_uop_is_amo = uop_is_amo;
  assign io_out_uop_is_load = uop_is_load;
  assign io_out_uop_is_unique = uop_is_unique;
  assign io_out_uop_flush_on_commit = uop_flush_on_commit;
  assign io_out_uop_ldst = uop_ldst;
  assign io_out_uop_lrs1 = uop_lrs1;
  assign io_out_uop_lrs2 = uop_lrs2;
  assign io_out_uop_lrs3 = uop_lrs3;
  assign io_out_uop_ldst_val = uop_ldst_val;
  assign io_out_uop_dst_rtype = uop_dst_rtype;
  assign io_out_uop_lrs1_rtype = uop_lrs1_rtype;
  assign io_out_uop_lrs2_rtype = uop_lrs2_rtype;
  assign io_out_uop_frs3_en = uop_frs3_en;
  assign io_out_uop_fp_val = uop_fp_val;
  assign io_out_uop_fp_single = uop_fp_single;
  assign io_out_uop_xcpt_if = uop_xcpt_if;
  assign io_out_uop_replay_if = uop_replay_if;
  assign io_out_uop_debug_wdata = uop_debug_wdata;
  assign io_out_uop_debug_events_fetch_seq = uop_debug_events_fetch_seq;
  assign io_was_killed = _T_602;
  assign br_killed = _GEN_86;
  assign br_killed_incoming = _GEN_87;
  assign _T_571 = io_clear & valid;
  assign _GEN_0 = _T_571 ? 1'h0 : valid;
  assign _T_574 = _T_571 == 1'h0;
  assign _T_575 = _T_574 & io_wen;
  assign _T_577 = io_flush_pipe | br_killed_incoming;
  assign _GEN_1 = _T_575 ? 1'h1 : _GEN_0;
  assign _GEN_2 = _T_575 ? _T_577 : was_killed;
  assign _GEN_3 = _T_575 ? io_in_uop_valid : uop_valid;
  assign _GEN_4 = _T_575 ? io_in_uop_iw_state : uop_iw_state;
  assign _GEN_5 = _T_575 ? io_in_uop_uopc : uop_uopc;
  assign _GEN_6 = _T_575 ? io_in_uop_inst : uop_inst;
  assign _GEN_7 = _T_575 ? io_in_uop_pc : uop_pc;
  assign _GEN_8 = _T_575 ? io_in_uop_fu_code : uop_fu_code;
  assign _GEN_9 = _T_575 ? io_in_uop_ctrl_br_type : uop_ctrl_br_type;
  assign _GEN_10 = _T_575 ? io_in_uop_ctrl_op1_sel : uop_ctrl_op1_sel;
  assign _GEN_11 = _T_575 ? io_in_uop_ctrl_op2_sel : uop_ctrl_op2_sel;
  assign _GEN_12 = _T_575 ? io_in_uop_ctrl_imm_sel : uop_ctrl_imm_sel;
  assign _GEN_13 = _T_575 ? io_in_uop_ctrl_op_fcn : uop_ctrl_op_fcn;
  assign _GEN_14 = _T_575 ? io_in_uop_ctrl_fcn_dw : uop_ctrl_fcn_dw;
  assign _GEN_15 = _T_575 ? io_in_uop_ctrl_rf_wen : uop_ctrl_rf_wen;
  assign _GEN_16 = _T_575 ? io_in_uop_ctrl_csr_cmd : uop_ctrl_csr_cmd;
  assign _GEN_17 = _T_575 ? io_in_uop_ctrl_is_load : uop_ctrl_is_load;
  assign _GEN_18 = _T_575 ? io_in_uop_ctrl_is_sta : uop_ctrl_is_sta;
  assign _GEN_19 = _T_575 ? io_in_uop_ctrl_is_std : uop_ctrl_is_std;
  assign _GEN_20 = _T_575 ? io_in_uop_wakeup_delay : uop_wakeup_delay;
  assign _GEN_21 = _T_575 ? io_in_uop_allocate_brtag : uop_allocate_brtag;
  assign _GEN_22 = _T_575 ? io_in_uop_is_br_or_jmp : uop_is_br_or_jmp;
  assign _GEN_23 = _T_575 ? io_in_uop_is_jump : uop_is_jump;
  assign _GEN_24 = _T_575 ? io_in_uop_is_jal : uop_is_jal;
  assign _GEN_25 = _T_575 ? io_in_uop_is_ret : uop_is_ret;
  assign _GEN_26 = _T_575 ? io_in_uop_is_call : uop_is_call;
  assign _GEN_27 = _T_575 ? io_in_uop_br_mask : uop_br_mask;
  assign _GEN_28 = _T_575 ? io_in_uop_br_tag : uop_br_tag;
  assign _GEN_29 = _T_575 ? io_in_uop_br_prediction_bpd_predict_val : uop_br_prediction_bpd_predict_val;
  assign _GEN_30 = _T_575 ? io_in_uop_br_prediction_bpd_predict_taken : uop_br_prediction_bpd_predict_taken;
  assign _GEN_31 = _T_575 ? io_in_uop_br_prediction_btb_hit : uop_br_prediction_btb_hit;
  assign _GEN_32 = _T_575 ? io_in_uop_br_prediction_btb_predicted : uop_br_prediction_btb_predicted;
  assign _GEN_33 = _T_575 ? io_in_uop_br_prediction_is_br_or_jalr : uop_br_prediction_is_br_or_jalr;
  assign _GEN_34 = _T_575 ? io_in_uop_stat_brjmp_mispredicted : uop_stat_brjmp_mispredicted;
  assign _GEN_35 = _T_575 ? io_in_uop_stat_btb_made_pred : uop_stat_btb_made_pred;
  assign _GEN_36 = _T_575 ? io_in_uop_stat_btb_mispredicted : uop_stat_btb_mispredicted;
  assign _GEN_37 = _T_575 ? io_in_uop_stat_bpd_made_pred : uop_stat_bpd_made_pred;
  assign _GEN_38 = _T_575 ? io_in_uop_stat_bpd_mispredicted : uop_stat_bpd_mispredicted;
  assign _GEN_39 = _T_575 ? io_in_uop_fetch_pc_lob : uop_fetch_pc_lob;
  assign _GEN_40 = _T_575 ? io_in_uop_imm_packed : uop_imm_packed;
  assign _GEN_41 = _T_575 ? io_in_uop_csr_addr : uop_csr_addr;
  assign _GEN_42 = _T_575 ? io_in_uop_rob_idx : uop_rob_idx;
  assign _GEN_43 = _T_575 ? io_in_uop_ldq_idx : uop_ldq_idx;
  assign _GEN_44 = _T_575 ? io_in_uop_stq_idx : uop_stq_idx;
  assign _GEN_45 = _T_575 ? io_in_uop_brob_idx : uop_brob_idx;
  assign _GEN_46 = _T_575 ? io_in_uop_pdst : uop_pdst;
  assign _GEN_47 = _T_575 ? io_in_uop_pop1 : uop_pop1;
  assign _GEN_48 = _T_575 ? io_in_uop_pop2 : uop_pop2;
  assign _GEN_49 = _T_575 ? io_in_uop_pop3 : uop_pop3;
  assign _GEN_50 = _T_575 ? io_in_uop_prs1_busy : uop_prs1_busy;
  assign _GEN_51 = _T_575 ? io_in_uop_prs2_busy : uop_prs2_busy;
  assign _GEN_52 = _T_575 ? io_in_uop_prs3_busy : uop_prs3_busy;
  assign _GEN_53 = _T_575 ? io_in_uop_stale_pdst : uop_stale_pdst;
  assign _GEN_54 = _T_575 ? io_in_uop_exception : uop_exception;
  assign _GEN_55 = _T_575 ? io_in_uop_exc_cause : uop_exc_cause;
  assign _GEN_56 = _T_575 ? io_in_uop_bypassable : uop_bypassable;
  assign _GEN_57 = _T_575 ? io_in_uop_mem_cmd : uop_mem_cmd;
  assign _GEN_58 = _T_575 ? io_in_uop_mem_typ : uop_mem_typ;
  assign _GEN_59 = _T_575 ? io_in_uop_is_fence : uop_is_fence;
  assign _GEN_60 = _T_575 ? io_in_uop_is_fencei : uop_is_fencei;
  assign _GEN_61 = _T_575 ? io_in_uop_is_store : uop_is_store;
  assign _GEN_62 = _T_575 ? io_in_uop_is_amo : uop_is_amo;
  assign _GEN_63 = _T_575 ? io_in_uop_is_load : uop_is_load;
  assign _GEN_64 = _T_575 ? io_in_uop_is_unique : uop_is_unique;
  assign _GEN_65 = _T_575 ? io_in_uop_flush_on_commit : uop_flush_on_commit;
  assign _GEN_66 = _T_575 ? io_in_uop_ldst : uop_ldst;
  assign _GEN_67 = _T_575 ? io_in_uop_lrs1 : uop_lrs1;
  assign _GEN_68 = _T_575 ? io_in_uop_lrs2 : uop_lrs2;
  assign _GEN_69 = _T_575 ? io_in_uop_lrs3 : uop_lrs3;
  assign _GEN_70 = _T_575 ? io_in_uop_ldst_val : uop_ldst_val;
  assign _GEN_71 = _T_575 ? io_in_uop_dst_rtype : uop_dst_rtype;
  assign _GEN_72 = _T_575 ? io_in_uop_lrs1_rtype : uop_lrs1_rtype;
  assign _GEN_73 = _T_575 ? io_in_uop_lrs2_rtype : uop_lrs2_rtype;
  assign _GEN_74 = _T_575 ? io_in_uop_frs3_en : uop_frs3_en;
  assign _GEN_75 = _T_575 ? io_in_uop_fp_val : uop_fp_val;
  assign _GEN_76 = _T_575 ? io_in_uop_fp_single : uop_fp_single;
  assign _GEN_77 = _T_575 ? io_in_uop_xcpt_if : uop_xcpt_if;
  assign _GEN_78 = _T_575 ? io_in_uop_replay_if : uop_replay_if;
  assign _GEN_79 = _T_575 ? io_in_uop_debug_wdata : uop_debug_wdata;
  assign _GEN_80 = _T_575 ? io_in_uop_debug_events_fetch_seq : uop_debug_events_fetch_seq;
  assign _T_578 = io_flush_pipe | br_killed;
  assign _T_582 = io_wen == 1'h0;
  assign _T_583 = _T_574 & _T_582;
  assign _T_584 = _T_583 & _T_578;
  assign _GEN_81 = _T_584 ? 1'h1 : _GEN_2;
  assign _T_586 = io_brinfo_mask & uop_br_mask;
  assign _T_588 = _T_586 != 8'h0;
  assign bmask_match = io_brinfo_valid & _T_588;
  assign _T_589 = io_brinfo_mask & io_in_uop_br_mask;
  assign _T_591 = _T_589 != 8'h0;
  assign bmask_match_incoming = io_brinfo_valid & _T_591;
  assign _T_592 = ~ io_brinfo_mask;
  assign _T_593 = io_in_uop_br_mask & _T_592;
  assign _T_594 = io_brinfo_valid ? _T_593 : io_in_uop_br_mask;
  assign _GEN_82 = io_wen ? _T_594 : _GEN_27;
  assign _T_597 = _T_582 & bmask_match;
  assign _T_599 = uop_br_mask & _T_592;
  assign _GEN_83 = _T_597 ? _T_599 : _GEN_82;
  assign _GEN_86 = io_brinfo_mispredict ? bmask_match : 1'h0;
  assign _GEN_87 = io_brinfo_mispredict ? bmask_match_incoming : 1'h0;
  assign _T_602 = was_killed | br_killed;
`ifdef RANDOMIZE
  integer initvar;
  initial begin
    `ifndef verilator
      #0.002 begin end
    `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_84 = {1{$random}};
  valid = _GEN_84[0:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_85 = {1{$random}};
  was_killed = _GEN_85[0:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_88 = {1{$random}};
  uop_valid = _GEN_88[0:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_89 = {1{$random}};
  uop_iw_state = _GEN_89[1:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_90 = {1{$random}};
  uop_uopc = _GEN_90[8:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_91 = {1{$random}};
  uop_inst = _GEN_91[31:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_92 = {2{$random}};
  uop_pc = _GEN_92[39:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_93 = {1{$random}};
  uop_fu_code = _GEN_93[7:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_94 = {1{$random}};
  uop_ctrl_br_type = _GEN_94[3:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_95 = {1{$random}};
  uop_ctrl_op1_sel = _GEN_95[1:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_96 = {1{$random}};
  uop_ctrl_op2_sel = _GEN_96[2:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_97 = {1{$random}};
  uop_ctrl_imm_sel = _GEN_97[2:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_98 = {1{$random}};
  uop_ctrl_op_fcn = _GEN_98[3:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_99 = {1{$random}};
  uop_ctrl_fcn_dw = _GEN_99[0:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_100 = {1{$random}};
  uop_ctrl_rf_wen = _GEN_100[0:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_101 = {1{$random}};
  uop_ctrl_csr_cmd = _GEN_101[2:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_102 = {1{$random}};
  uop_ctrl_is_load = _GEN_102[0:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_103 = {1{$random}};
  uop_ctrl_is_sta = _GEN_103[0:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_104 = {1{$random}};
  uop_ctrl_is_std = _GEN_104[0:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_105 = {1{$random}};
  uop_wakeup_delay = _GEN_105[1:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_106 = {1{$random}};
  uop_allocate_brtag = _GEN_106[0:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_107 = {1{$random}};
  uop_is_br_or_jmp = _GEN_107[0:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_108 = {1{$random}};
  uop_is_jump = _GEN_108[0:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_109 = {1{$random}};
  uop_is_jal = _GEN_109[0:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_110 = {1{$random}};
  uop_is_ret = _GEN_110[0:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_111 = {1{$random}};
  uop_is_call = _GEN_111[0:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_112 = {1{$random}};
  uop_br_mask = _GEN_112[7:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_113 = {1{$random}};
  uop_br_tag = _GEN_113[2:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_114 = {1{$random}};
  uop_br_prediction_bpd_predict_val = _GEN_114[0:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_115 = {1{$random}};
  uop_br_prediction_bpd_predict_taken = _GEN_115[0:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_116 = {1{$random}};
  uop_br_prediction_btb_hit = _GEN_116[0:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_117 = {1{$random}};
  uop_br_prediction_btb_predicted = _GEN_117[0:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_118 = {1{$random}};
  uop_br_prediction_is_br_or_jalr = _GEN_118[0:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_119 = {1{$random}};
  uop_stat_brjmp_mispredicted = _GEN_119[0:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_120 = {1{$random}};
  uop_stat_btb_made_pred = _GEN_120[0:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_121 = {1{$random}};
  uop_stat_btb_mispredicted = _GEN_121[0:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_122 = {1{$random}};
  uop_stat_bpd_made_pred = _GEN_122[0:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_123 = {1{$random}};
  uop_stat_bpd_mispredicted = _GEN_123[0:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_124 = {1{$random}};
  uop_fetch_pc_lob = _GEN_124[3:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_125 = {1{$random}};
  uop_imm_packed = _GEN_125[19:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_126 = {1{$random}};
  uop_csr_addr = _GEN_126[11:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_127 = {1{$random}};
  uop_rob_idx = _GEN_127[6:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_128 = {1{$random}};
  uop_ldq_idx = _GEN_128[4:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_129 = {1{$random}};
  uop_stq_idx = _GEN_129[4:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_130 = {1{$random}};
  uop_brob_idx = _GEN_130[4:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_131 = {1{$random}};
  uop_pdst = _GEN_131[6:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_132 = {1{$random}};
  uop_pop1 = _GEN_132[6:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_133 = {1{$random}};
  uop_pop2 = _GEN_133[6:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_134 = {1{$random}};
  uop_pop3 = _GEN_134[6:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_135 = {1{$random}};
  uop_prs1_busy = _GEN_135[0:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_136 = {1{$random}};
  uop_prs2_busy = _GEN_136[0:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_137 = {1{$random}};
  uop_prs3_busy = _GEN_137[0:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_138 = {1{$random}};
  uop_stale_pdst = _GEN_138[6:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_139 = {1{$random}};
  uop_exception = _GEN_139[0:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_140 = {2{$random}};
  uop_exc_cause = _GEN_140[63:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_141 = {1{$random}};
  uop_bypassable = _GEN_141[0:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_142 = {1{$random}};
  uop_mem_cmd = _GEN_142[3:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_143 = {1{$random}};
  uop_mem_typ = _GEN_143[2:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_144 = {1{$random}};
  uop_is_fence = _GEN_144[0:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_145 = {1{$random}};
  uop_is_fencei = _GEN_145[0:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_146 = {1{$random}};
  uop_is_store = _GEN_146[0:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_147 = {1{$random}};
  uop_is_amo = _GEN_147[0:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_148 = {1{$random}};
  uop_is_load = _GEN_148[0:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_149 = {1{$random}};
  uop_is_unique = _GEN_149[0:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_150 = {1{$random}};
  uop_flush_on_commit = _GEN_150[0:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_151 = {1{$random}};
  uop_ldst = _GEN_151[5:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_152 = {1{$random}};
  uop_lrs1 = _GEN_152[5:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_153 = {1{$random}};
  uop_lrs2 = _GEN_153[5:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_154 = {1{$random}};
  uop_lrs3 = _GEN_154[5:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_155 = {1{$random}};
  uop_ldst_val = _GEN_155[0:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_156 = {1{$random}};
  uop_dst_rtype = _GEN_156[1:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_157 = {1{$random}};
  uop_lrs1_rtype = _GEN_157[1:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_158 = {1{$random}};
  uop_lrs2_rtype = _GEN_158[1:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_159 = {1{$random}};
  uop_frs3_en = _GEN_159[0:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_160 = {1{$random}};
  uop_fp_val = _GEN_160[0:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_161 = {1{$random}};
  uop_fp_single = _GEN_161[0:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_162 = {1{$random}};
  uop_xcpt_if = _GEN_162[0:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_163 = {1{$random}};
  uop_replay_if = _GEN_163[0:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_164 = {2{$random}};
  uop_debug_wdata = _GEN_164[63:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_165 = {1{$random}};
  uop_debug_events_fetch_seq = _GEN_165[31:0];
  `endif
  end
`endif
  always @(posedge clock) begin
    if (reset) begin
      valid <= 1'h0;
    end else begin
      if (_T_575) begin
        valid <= 1'h1;
      end else begin
        if (_T_571) begin
          valid <= 1'h0;
        end
      end
    end
    if (reset) begin
      was_killed <= 1'h0;
    end else begin
      if (_T_584) begin
        was_killed <= 1'h1;
      end else begin
        if (_T_575) begin
          was_killed <= _T_577;
        end
      end
    end
    if (_T_575) begin
      uop_valid <= io_in_uop_valid;
    end
    if (_T_575) begin
      uop_iw_state <= io_in_uop_iw_state;
    end
    if (_T_575) begin
      uop_uopc <= io_in_uop_uopc;
    end
    if (_T_575) begin
      uop_inst <= io_in_uop_inst;
    end
    if (_T_575) begin
      uop_pc <= io_in_uop_pc;
    end
    if (_T_575) begin
      uop_fu_code <= io_in_uop_fu_code;
    end
    if (_T_575) begin
      uop_ctrl_br_type <= io_in_uop_ctrl_br_type;
    end
    if (_T_575) begin
      uop_ctrl_op1_sel <= io_in_uop_ctrl_op1_sel;
    end
    if (_T_575) begin
      uop_ctrl_op2_sel <= io_in_uop_ctrl_op2_sel;
    end
    if (_T_575) begin
      uop_ctrl_imm_sel <= io_in_uop_ctrl_imm_sel;
    end
    if (_T_575) begin
      uop_ctrl_op_fcn <= io_in_uop_ctrl_op_fcn;
    end
    if (_T_575) begin
      uop_ctrl_fcn_dw <= io_in_uop_ctrl_fcn_dw;
    end
    if (_T_575) begin
      uop_ctrl_rf_wen <= io_in_uop_ctrl_rf_wen;
    end
    if (_T_575) begin
      uop_ctrl_csr_cmd <= io_in_uop_ctrl_csr_cmd;
    end
    if (_T_575) begin
      uop_ctrl_is_load <= io_in_uop_ctrl_is_load;
    end
    if (_T_575) begin
      uop_ctrl_is_sta <= io_in_uop_ctrl_is_sta;
    end
    if (_T_575) begin
      uop_ctrl_is_std <= io_in_uop_ctrl_is_std;
    end
    if (_T_575) begin
      uop_wakeup_delay <= io_in_uop_wakeup_delay;
    end
    if (_T_575) begin
      uop_allocate_brtag <= io_in_uop_allocate_brtag;
    end
    if (_T_575) begin
      uop_is_br_or_jmp <= io_in_uop_is_br_or_jmp;
    end
    if (_T_575) begin
      uop_is_jump <= io_in_uop_is_jump;
    end
    if (_T_575) begin
      uop_is_jal <= io_in_uop_is_jal;
    end
    if (_T_575) begin
      uop_is_ret <= io_in_uop_is_ret;
    end
    if (_T_575) begin
      uop_is_call <= io_in_uop_is_call;
    end
    if (_T_597) begin
      uop_br_mask <= _T_599;
    end else begin
      if (io_wen) begin
        if (io_brinfo_valid) begin
          uop_br_mask <= _T_593;
        end else begin
          uop_br_mask <= io_in_uop_br_mask;
        end
      end else begin
        if (_T_575) begin
          uop_br_mask <= io_in_uop_br_mask;
        end
      end
    end
    if (_T_575) begin
      uop_br_tag <= io_in_uop_br_tag;
    end
    if (_T_575) begin
      uop_br_prediction_bpd_predict_val <= io_in_uop_br_prediction_bpd_predict_val;
    end
    if (_T_575) begin
      uop_br_prediction_bpd_predict_taken <= io_in_uop_br_prediction_bpd_predict_taken;
    end
    if (_T_575) begin
      uop_br_prediction_btb_hit <= io_in_uop_br_prediction_btb_hit;
    end
    if (_T_575) begin
      uop_br_prediction_btb_predicted <= io_in_uop_br_prediction_btb_predicted;
    end
    if (_T_575) begin
      uop_br_prediction_is_br_or_jalr <= io_in_uop_br_prediction_is_br_or_jalr;
    end
    if (_T_575) begin
      uop_stat_brjmp_mispredicted <= io_in_uop_stat_brjmp_mispredicted;
    end
    if (_T_575) begin
      uop_stat_btb_made_pred <= io_in_uop_stat_btb_made_pred;
    end
    if (_T_575) begin
      uop_stat_btb_mispredicted <= io_in_uop_stat_btb_mispredicted;
    end
    if (_T_575) begin
      uop_stat_bpd_made_pred <= io_in_uop_stat_bpd_made_pred;
    end
    if (_T_575) begin
      uop_stat_bpd_mispredicted <= io_in_uop_stat_bpd_mispredicted;
    end
    if (_T_575) begin
      uop_fetch_pc_lob <= io_in_uop_fetch_pc_lob;
    end
    if (_T_575) begin
      uop_imm_packed <= io_in_uop_imm_packed;
    end
    if (_T_575) begin
      uop_csr_addr <= io_in_uop_csr_addr;
    end
    if (_T_575) begin
      uop_rob_idx <= io_in_uop_rob_idx;
    end
    if (_T_575) begin
      uop_ldq_idx <= io_in_uop_ldq_idx;
    end
    if (_T_575) begin
      uop_stq_idx <= io_in_uop_stq_idx;
    end
    if (_T_575) begin
      uop_brob_idx <= io_in_uop_brob_idx;
    end
    if (_T_575) begin
      uop_pdst <= io_in_uop_pdst;
    end
    if (_T_575) begin
      uop_pop1 <= io_in_uop_pop1;
    end
    if (_T_575) begin
      uop_pop2 <= io_in_uop_pop2;
    end
    if (_T_575) begin
      uop_pop3 <= io_in_uop_pop3;
    end
    if (_T_575) begin
      uop_prs1_busy <= io_in_uop_prs1_busy;
    end
    if (_T_575) begin
      uop_prs2_busy <= io_in_uop_prs2_busy;
    end
    if (_T_575) begin
      uop_prs3_busy <= io_in_uop_prs3_busy;
    end
    if (_T_575) begin
      uop_stale_pdst <= io_in_uop_stale_pdst;
    end
    if (_T_575) begin
      uop_exception <= io_in_uop_exception;
    end
    if (_T_575) begin
      uop_exc_cause <= io_in_uop_exc_cause;
    end
    if (_T_575) begin
      uop_bypassable <= io_in_uop_bypassable;
    end
    if (_T_575) begin
      uop_mem_cmd <= io_in_uop_mem_cmd;
    end
    if (_T_575) begin
      uop_mem_typ <= io_in_uop_mem_typ;
    end
    if (_T_575) begin
      uop_is_fence <= io_in_uop_is_fence;
    end
    if (_T_575) begin
      uop_is_fencei <= io_in_uop_is_fencei;
    end
    if (_T_575) begin
      uop_is_store <= io_in_uop_is_store;
    end
    if (_T_575) begin
      uop_is_amo <= io_in_uop_is_amo;
    end
    if (_T_575) begin
      uop_is_load <= io_in_uop_is_load;
    end
    if (_T_575) begin
      uop_is_unique <= io_in_uop_is_unique;
    end
    if (_T_575) begin
      uop_flush_on_commit <= io_in_uop_flush_on_commit;
    end
    if (_T_575) begin
      uop_ldst <= io_in_uop_ldst;
    end
    if (_T_575) begin
      uop_lrs1 <= io_in_uop_lrs1;
    end
    if (_T_575) begin
      uop_lrs2 <= io_in_uop_lrs2;
    end
    if (_T_575) begin
      uop_lrs3 <= io_in_uop_lrs3;
    end
    if (_T_575) begin
      uop_ldst_val <= io_in_uop_ldst_val;
    end
    if (_T_575) begin
      uop_dst_rtype <= io_in_uop_dst_rtype;
    end
    if (_T_575) begin
      uop_lrs1_rtype <= io_in_uop_lrs1_rtype;
    end
    if (_T_575) begin
      uop_lrs2_rtype <= io_in_uop_lrs2_rtype;
    end
    if (_T_575) begin
      uop_frs3_en <= io_in_uop_frs3_en;
    end
    if (_T_575) begin
      uop_fp_val <= io_in_uop_fp_val;
    end
    if (_T_575) begin
      uop_fp_single <= io_in_uop_fp_single;
    end
    if (_T_575) begin
      uop_xcpt_if <= io_in_uop_xcpt_if;
    end
    if (_T_575) begin
      uop_replay_if <= io_in_uop_replay_if;
    end
    if (_T_575) begin
      uop_debug_wdata <= io_in_uop_debug_wdata;
    end
    if (_T_575) begin
      uop_debug_events_fetch_seq <= io_in_uop_debug_events_fetch_seq;
    end
  end
endmodule