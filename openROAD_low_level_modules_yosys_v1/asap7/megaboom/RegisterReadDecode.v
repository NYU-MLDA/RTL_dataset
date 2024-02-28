module RegisterReadDecode(
  input   clock,
  input   reset,
  input   io_iss_valid,
  input   io_iss_uop_valid,
  input  [1:0] io_iss_uop_iw_state,
  input  [8:0] io_iss_uop_uopc,
  input  [31:0] io_iss_uop_inst,
  input  [39:0] io_iss_uop_pc,
  input  [7:0] io_iss_uop_fu_code,
  input  [3:0] io_iss_uop_ctrl_br_type,
  input  [1:0] io_iss_uop_ctrl_op1_sel,
  input  [2:0] io_iss_uop_ctrl_op2_sel,
  input  [2:0] io_iss_uop_ctrl_imm_sel,
  input  [3:0] io_iss_uop_ctrl_op_fcn,
  input   io_iss_uop_ctrl_fcn_dw,
  input   io_iss_uop_ctrl_rf_wen,
  input  [2:0] io_iss_uop_ctrl_csr_cmd,
  input   io_iss_uop_ctrl_is_load,
  input   io_iss_uop_ctrl_is_sta,
  input   io_iss_uop_ctrl_is_std,
  input  [1:0] io_iss_uop_wakeup_delay,
  input   io_iss_uop_allocate_brtag,
  input   io_iss_uop_is_br_or_jmp,
  input   io_iss_uop_is_jump,
  input   io_iss_uop_is_jal,
  input   io_iss_uop_is_ret,
  input   io_iss_uop_is_call,
  input  [7:0] io_iss_uop_br_mask,
  input  [2:0] io_iss_uop_br_tag,
  input   io_iss_uop_br_prediction_bpd_predict_val,
  input   io_iss_uop_br_prediction_bpd_predict_taken,
  input   io_iss_uop_br_prediction_btb_hit,
  input   io_iss_uop_br_prediction_btb_predicted,
  input   io_iss_uop_br_prediction_is_br_or_jalr,
  input   io_iss_uop_stat_brjmp_mispredicted,
  input   io_iss_uop_stat_btb_made_pred,
  input   io_iss_uop_stat_btb_mispredicted,
  input   io_iss_uop_stat_bpd_made_pred,
  input   io_iss_uop_stat_bpd_mispredicted,
  input  [3:0] io_iss_uop_fetch_pc_lob,
  input  [19:0] io_iss_uop_imm_packed,
  input  [11:0] io_iss_uop_csr_addr,
  input  [6:0] io_iss_uop_rob_idx,
  input  [4:0] io_iss_uop_ldq_idx,
  input  [4:0] io_iss_uop_stq_idx,
  input  [4:0] io_iss_uop_brob_idx,
  input  [6:0] io_iss_uop_pdst,
  input  [6:0] io_iss_uop_pop1,
  input  [6:0] io_iss_uop_pop2,
  input  [6:0] io_iss_uop_pop3,
  input   io_iss_uop_prs1_busy,
  input   io_iss_uop_prs2_busy,
  input   io_iss_uop_prs3_busy,
  input  [6:0] io_iss_uop_stale_pdst,
  input   io_iss_uop_exception,
  input  [63:0] io_iss_uop_exc_cause,
  input   io_iss_uop_bypassable,
  input  [3:0] io_iss_uop_mem_cmd,
  input  [2:0] io_iss_uop_mem_typ,
  input   io_iss_uop_is_fence,
  input   io_iss_uop_is_fencei,
  input   io_iss_uop_is_store,
  input   io_iss_uop_is_amo,
  input   io_iss_uop_is_load,
  input   io_iss_uop_is_unique,
  input   io_iss_uop_flush_on_commit,
  input  [5:0] io_iss_uop_ldst,
  input  [5:0] io_iss_uop_lrs1,
  input  [5:0] io_iss_uop_lrs2,
  input  [5:0] io_iss_uop_lrs3,
  input   io_iss_uop_ldst_val,
  input  [1:0] io_iss_uop_dst_rtype,
  input  [1:0] io_iss_uop_lrs1_rtype,
  input  [1:0] io_iss_uop_lrs2_rtype,
  input   io_iss_uop_frs3_en,
  input   io_iss_uop_fp_val,
  input   io_iss_uop_fp_single,
  input   io_iss_uop_xcpt_if,
  input   io_iss_uop_replay_if,
  input  [63:0] io_iss_uop_debug_wdata,
  input  [31:0] io_iss_uop_debug_events_fetch_seq,
  output  io_rrd_valid,
  output  io_rrd_uop_valid,
  output [1:0] io_rrd_uop_iw_state,
  output [8:0] io_rrd_uop_uopc,
  output [31:0] io_rrd_uop_inst,
  output [39:0] io_rrd_uop_pc,
  output [7:0] io_rrd_uop_fu_code,
  output [3:0] io_rrd_uop_ctrl_br_type,
  output [1:0] io_rrd_uop_ctrl_op1_sel,
  output [2:0] io_rrd_uop_ctrl_op2_sel,
  output [2:0] io_rrd_uop_ctrl_imm_sel,
  output [3:0] io_rrd_uop_ctrl_op_fcn,
  output  io_rrd_uop_ctrl_fcn_dw,
  output  io_rrd_uop_ctrl_rf_wen,
  output [2:0] io_rrd_uop_ctrl_csr_cmd,
  output  io_rrd_uop_ctrl_is_load,
  output  io_rrd_uop_ctrl_is_sta,
  output  io_rrd_uop_ctrl_is_std,
  output [1:0] io_rrd_uop_wakeup_delay,
  output  io_rrd_uop_allocate_brtag,
  output  io_rrd_uop_is_br_or_jmp,
  output  io_rrd_uop_is_jump,
  output  io_rrd_uop_is_jal,
  output  io_rrd_uop_is_ret,
  output  io_rrd_uop_is_call,
  output [7:0] io_rrd_uop_br_mask,
  output [2:0] io_rrd_uop_br_tag,
  output  io_rrd_uop_br_prediction_bpd_predict_val,
  output  io_rrd_uop_br_prediction_bpd_predict_taken,
  output  io_rrd_uop_br_prediction_btb_hit,
  output  io_rrd_uop_br_prediction_btb_predicted,
  output  io_rrd_uop_br_prediction_is_br_or_jalr,
  output  io_rrd_uop_stat_brjmp_mispredicted,
  output  io_rrd_uop_stat_btb_made_pred,
  output  io_rrd_uop_stat_btb_mispredicted,
  output  io_rrd_uop_stat_bpd_made_pred,
  output  io_rrd_uop_stat_bpd_mispredicted,
  output [3:0] io_rrd_uop_fetch_pc_lob,
  output [19:0] io_rrd_uop_imm_packed,
  output [11:0] io_rrd_uop_csr_addr,
  output [6:0] io_rrd_uop_rob_idx,
  output [4:0] io_rrd_uop_ldq_idx,
  output [4:0] io_rrd_uop_stq_idx,
  output [4:0] io_rrd_uop_brob_idx,
  output [6:0] io_rrd_uop_pdst,
  output [6:0] io_rrd_uop_pop1,
  output [6:0] io_rrd_uop_pop2,
  output [6:0] io_rrd_uop_pop3,
  output  io_rrd_uop_prs1_busy,
  output  io_rrd_uop_prs2_busy,
  output  io_rrd_uop_prs3_busy,
  output [6:0] io_rrd_uop_stale_pdst,
  output  io_rrd_uop_exception,
  output [63:0] io_rrd_uop_exc_cause,
  output  io_rrd_uop_bypassable,
  output [3:0] io_rrd_uop_mem_cmd,
  output [2:0] io_rrd_uop_mem_typ,
  output  io_rrd_uop_is_fence,
  output  io_rrd_uop_is_fencei,
  output  io_rrd_uop_is_store,
  output  io_rrd_uop_is_amo,
  output  io_rrd_uop_is_load,
  output  io_rrd_uop_is_unique,
  output  io_rrd_uop_flush_on_commit,
  output [5:0] io_rrd_uop_ldst,
  output [5:0] io_rrd_uop_lrs1,
  output [5:0] io_rrd_uop_lrs2,
  output [5:0] io_rrd_uop_lrs3,
  output  io_rrd_uop_ldst_val,
  output [1:0] io_rrd_uop_dst_rtype,
  output [1:0] io_rrd_uop_lrs1_rtype,
  output [1:0] io_rrd_uop_lrs2_rtype,
  output  io_rrd_uop_frs3_en,
  output  io_rrd_uop_fp_val,
  output  io_rrd_uop_fp_single,
  output  io_rrd_uop_xcpt_if,
  output  io_rrd_uop_replay_if,
  output [63:0] io_rrd_uop_debug_wdata,
  output [31:0] io_rrd_uop_debug_events_fetch_seq
);
  wire [3:0] rrd_cs_br_type;
  wire  rrd_cs_use_alupipe;
  wire  rrd_cs_use_muldivpipe;
  wire  rrd_cs_use_mempipe;
  wire [3:0] rrd_cs_op_fcn;
  wire  rrd_cs_fcn_dw;
  wire [1:0] rrd_cs_op1_sel;
  wire [2:0] rrd_cs_op2_sel;
  wire [2:0] rrd_cs_imm_sel;
  wire  rrd_cs_rf_wen;
  wire [2:0] rrd_cs_csr_cmd;
  wire [8:0] _T_543;
  wire  _T_545;
  wire [8:0] _T_547;
  wire  _T_549;
  wire  _T_551;
  wire  _T_554;
  wire  _T_555;
  wire  _T_556;
  wire [8:0] _T_563;
  wire  _T_565;
  wire [8:0] _T_567;
  wire  _T_569;
  wire  _T_573;
  wire [8:0] _T_575;
  wire  _T_577;
  wire [8:0] _T_579;
  wire  _T_581;
  wire [8:0] _T_583;
  wire  _T_585;
  wire [8:0] _T_587;
  wire  _T_589;
  wire  _T_593;
  wire [8:0] _T_595;
  wire  _T_597;
  wire [8:0] _T_599;
  wire  _T_601;
  wire [8:0] _T_603;
  wire  _T_605;
  wire  _T_608;
  wire  _T_609;
  wire  _T_610;
  wire  _T_611;
  wire  _T_612;
  wire  _T_613;
  wire  _T_614;
  wire  _T_615;
  wire  _T_616;
  wire  _T_617;
  wire  _T_621;
  wire  _T_625;
  wire  _T_629;
  wire [8:0] _T_631;
  wire  _T_633;
  wire  _T_637;
  wire [8:0] _T_639;
  wire  _T_641;
  wire  _T_645;
  wire  _T_649;
  wire [8:0] _T_651;
  wire  _T_653;
  wire  _T_655;
  wire  _T_658;
  wire  _T_659;
  wire  _T_660;
  wire  _T_661;
  wire  _T_662;
  wire  _T_663;
  wire  _T_664;
  wire  _T_665;
  wire  _T_666;
  wire  _T_667;
  wire [8:0] _T_669;
  wire  _T_671;
  wire  _T_675;
  wire  _T_679;
  wire [8:0] _T_681;
  wire  _T_683;
  wire  _T_687;
  wire [8:0] _T_689;
  wire  _T_691;
  wire [8:0] _T_693;
  wire  _T_695;
  wire [8:0] _T_697;
  wire  _T_699;
  wire  _T_702;
  wire  _T_703;
  wire  _T_704;
  wire  _T_705;
  wire  _T_706;
  wire  _T_707;
  wire  _T_708;
  wire  _T_709;
  wire  _T_710;
  wire  _T_714;
  wire  _T_718;
  wire [8:0] _T_720;
  wire  _T_722;
  wire  _T_726;
  wire  _T_729;
  wire  _T_730;
  wire  _T_731;
  wire  _T_732;
  wire  _T_733;
  wire  _T_734;
  wire [1:0] _T_735;
  wire [1:0] _T_736;
  wire [3:0] _T_737;
  wire  _T_741;
  wire  _T_745;
  wire [8:0] _T_747;
  wire  _T_749;
  wire [8:0] _T_751;
  wire  _T_753;
  wire  _T_757;
  wire  _T_761;
  wire  _T_764;
  wire  _T_765;
  wire  _T_766;
  wire  _T_767;
  wire  _T_768;
  wire  _T_769;
  wire  _T_770;
  wire [8:0] _T_772;
  wire  _T_774;
  wire [8:0] _T_776;
  wire  _T_778;
  wire [8:0] _T_780;
  wire  _T_782;
  wire [8:0] _T_784;
  wire  _T_786;
  wire  _T_789;
  wire  _T_790;
  wire  _T_791;
  wire [1:0] _T_793;
  wire [8:0] _T_795;
  wire  _T_797;
  wire [8:0] _T_799;
  wire  _T_801;
  wire [8:0] _T_803;
  wire  _T_805;
  wire [8:0] _T_807;
  wire  _T_809;
  wire [8:0] _T_811;
  wire  _T_813;
  wire  _T_816;
  wire  _T_817;
  wire  _T_818;
  wire  _T_819;
  wire [8:0] _T_821;
  wire  _T_823;
  wire [8:0] _T_825;
  wire  _T_827;
  wire  _T_830;
  wire  _T_833;
  wire  _T_834;
  wire [1:0] _T_835;
  wire [2:0] _T_836;
  wire [8:0] _T_838;
  wire  _T_840;
  wire [1:0] _T_846;
  wire [2:0] _T_847;
  wire [8:0] _T_849;
  wire  _T_851;
  wire [8:0] _T_853;
  wire  _T_855;
  wire [8:0] _T_857;
  wire  _T_859;
  wire  _T_863;
  wire [8:0] _T_865;
  wire  _T_867;
  wire [8:0] _T_869;
  wire  _T_871;
  wire  _T_875;
  wire  _T_879;
  wire  _T_883;
  wire [8:0] _T_885;
  wire  _T_887;
  wire [8:0] _T_889;
  wire  _T_891;
  wire [8:0] _T_893;
  wire  _T_895;
  wire  _T_898;
  wire  _T_899;
  wire  _T_900;
  wire  _T_901;
  wire  _T_902;
  wire  _T_903;
  wire  _T_904;
  wire  _T_905;
  wire  _T_906;
  wire  _T_907;
  wire  _T_908;
  wire  _T_910;
  wire  _T_914;
  wire  _T_918;
  wire  _T_921;
  wire  _T_922;
  wire  _T_924;
  wire  _T_928;
  wire  _T_932;
  wire  _T_935;
  wire  _T_936;
  wire  _T_938;
  wire [1:0] _T_941;
  wire [2:0] _T_942;
  wire  _T_944;
  wire  _T_945;
  wire  _T_946;
  wire  _T_947;
  wire  _T_948;
  wire  _T_949;
  wire  _T_950;
  wire  _T_951;
  wire [19:0] _GEN_0;
  wire  _T_955;
  wire  _T_957;
  wire  _T_958;
  wire  _T_960;
  wire  csr_ren;
  wire [2:0] _T_962;
  assign io_rrd_valid = io_iss_valid;
  assign io_rrd_uop_valid = io_iss_uop_valid;
  assign io_rrd_uop_iw_state = io_iss_uop_iw_state;
  assign io_rrd_uop_uopc = io_iss_uop_uopc;
  assign io_rrd_uop_inst = io_iss_uop_inst;
  assign io_rrd_uop_pc = io_iss_uop_pc;
  assign io_rrd_uop_fu_code = io_iss_uop_fu_code;
  assign io_rrd_uop_ctrl_br_type = rrd_cs_br_type;
  assign io_rrd_uop_ctrl_op1_sel = rrd_cs_op1_sel;
  assign io_rrd_uop_ctrl_op2_sel = rrd_cs_op2_sel;
  assign io_rrd_uop_ctrl_imm_sel = rrd_cs_imm_sel;
  assign io_rrd_uop_ctrl_op_fcn = rrd_cs_op_fcn;
  assign io_rrd_uop_ctrl_fcn_dw = rrd_cs_fcn_dw;
  assign io_rrd_uop_ctrl_rf_wen = rrd_cs_rf_wen;
  assign io_rrd_uop_ctrl_csr_cmd = _T_962;
  assign io_rrd_uop_ctrl_is_load = _T_944;
  assign io_rrd_uop_ctrl_is_sta = _T_947;
  assign io_rrd_uop_ctrl_is_std = _T_951;
  assign io_rrd_uop_wakeup_delay = io_iss_uop_wakeup_delay;
  assign io_rrd_uop_allocate_brtag = io_iss_uop_allocate_brtag;
  assign io_rrd_uop_is_br_or_jmp = io_iss_uop_is_br_or_jmp;
  assign io_rrd_uop_is_jump = io_iss_uop_is_jump;
  assign io_rrd_uop_is_jal = io_iss_uop_is_jal;
  assign io_rrd_uop_is_ret = io_iss_uop_is_ret;
  assign io_rrd_uop_is_call = io_iss_uop_is_call;
  assign io_rrd_uop_br_mask = io_iss_uop_br_mask;
  assign io_rrd_uop_br_tag = io_iss_uop_br_tag;
  assign io_rrd_uop_br_prediction_bpd_predict_val = io_iss_uop_br_prediction_bpd_predict_val;
  assign io_rrd_uop_br_prediction_bpd_predict_taken = io_iss_uop_br_prediction_bpd_predict_taken;
  assign io_rrd_uop_br_prediction_btb_hit = io_iss_uop_br_prediction_btb_hit;
  assign io_rrd_uop_br_prediction_btb_predicted = io_iss_uop_br_prediction_btb_predicted;
  assign io_rrd_uop_br_prediction_is_br_or_jalr = io_iss_uop_br_prediction_is_br_or_jalr;
  assign io_rrd_uop_stat_brjmp_mispredicted = io_iss_uop_stat_brjmp_mispredicted;
  assign io_rrd_uop_stat_btb_made_pred = io_iss_uop_stat_btb_made_pred;
  assign io_rrd_uop_stat_btb_mispredicted = io_iss_uop_stat_btb_mispredicted;
  assign io_rrd_uop_stat_bpd_made_pred = io_iss_uop_stat_bpd_made_pred;
  assign io_rrd_uop_stat_bpd_mispredicted = io_iss_uop_stat_bpd_mispredicted;
  assign io_rrd_uop_fetch_pc_lob = io_iss_uop_fetch_pc_lob;
  assign io_rrd_uop_imm_packed = _GEN_0;
  assign io_rrd_uop_csr_addr = io_iss_uop_csr_addr;
  assign io_rrd_uop_rob_idx = io_iss_uop_rob_idx;
  assign io_rrd_uop_ldq_idx = io_iss_uop_ldq_idx;
  assign io_rrd_uop_stq_idx = io_iss_uop_stq_idx;
  assign io_rrd_uop_brob_idx = io_iss_uop_brob_idx;
  assign io_rrd_uop_pdst = io_iss_uop_pdst;
  assign io_rrd_uop_pop1 = io_iss_uop_pop1;
  assign io_rrd_uop_pop2 = io_iss_uop_pop2;
  assign io_rrd_uop_pop3 = io_iss_uop_pop3;
  assign io_rrd_uop_prs1_busy = io_iss_uop_prs1_busy;
  assign io_rrd_uop_prs2_busy = io_iss_uop_prs2_busy;
  assign io_rrd_uop_prs3_busy = io_iss_uop_prs3_busy;
  assign io_rrd_uop_stale_pdst = io_iss_uop_stale_pdst;
  assign io_rrd_uop_exception = io_iss_uop_exception;
  assign io_rrd_uop_exc_cause = io_iss_uop_exc_cause;
  assign io_rrd_uop_bypassable = io_iss_uop_bypassable;
  assign io_rrd_uop_mem_cmd = io_iss_uop_mem_cmd;
  assign io_rrd_uop_mem_typ = io_iss_uop_mem_typ;
  assign io_rrd_uop_is_fence = io_iss_uop_is_fence;
  assign io_rrd_uop_is_fencei = io_iss_uop_is_fencei;
  assign io_rrd_uop_is_store = io_iss_uop_is_store;
  assign io_rrd_uop_is_amo = io_iss_uop_is_amo;
  assign io_rrd_uop_is_load = io_iss_uop_is_load;
  assign io_rrd_uop_is_unique = io_iss_uop_is_unique;
  assign io_rrd_uop_flush_on_commit = io_iss_uop_flush_on_commit;
  assign io_rrd_uop_ldst = io_iss_uop_ldst;
  assign io_rrd_uop_lrs1 = io_iss_uop_lrs1;
  assign io_rrd_uop_lrs2 = io_iss_uop_lrs2;
  assign io_rrd_uop_lrs3 = io_iss_uop_lrs3;
  assign io_rrd_uop_ldst_val = io_iss_uop_ldst_val;
  assign io_rrd_uop_dst_rtype = io_iss_uop_dst_rtype;
  assign io_rrd_uop_lrs1_rtype = io_iss_uop_lrs1_rtype;
  assign io_rrd_uop_lrs2_rtype = io_iss_uop_lrs2_rtype;
  assign io_rrd_uop_frs3_en = io_iss_uop_frs3_en;
  assign io_rrd_uop_fp_val = io_iss_uop_fp_val;
  assign io_rrd_uop_fp_single = io_iss_uop_fp_single;
  assign io_rrd_uop_xcpt_if = io_iss_uop_xcpt_if;
  assign io_rrd_uop_replay_if = io_iss_uop_replay_if;
  assign io_rrd_uop_debug_wdata = io_iss_uop_debug_wdata;
  assign io_rrd_uop_debug_events_fetch_seq = io_iss_uop_debug_events_fetch_seq;
  assign rrd_cs_br_type = 4'h0;
  assign rrd_cs_use_alupipe = _T_556;
  assign rrd_cs_use_muldivpipe = _T_555;
  assign rrd_cs_use_mempipe = 1'h0;
  assign rrd_cs_op_fcn = _T_737;
  assign rrd_cs_fcn_dw = _T_770;
  assign rrd_cs_op1_sel = _T_793;
  assign rrd_cs_op2_sel = _T_836;
  assign rrd_cs_imm_sel = _T_847;
  assign rrd_cs_rf_wen = _T_908;
  assign rrd_cs_csr_cmd = _T_942;
  assign _T_543 = io_rrd_uop_uopc & 9'h1f4;
  assign _T_545 = _T_543 == 9'h34;
  assign _T_547 = io_rrd_uop_uopc & 9'h1f8;
  assign _T_549 = _T_547 == 9'h38;
  assign _T_551 = io_rrd_uop_uopc == 9'h40;
  assign _T_554 = _T_545 | _T_549;
  assign _T_555 = _T_554 | _T_551;
  assign _T_556 = ~ _T_555;
  assign _T_563 = io_rrd_uop_uopc & 9'h1bf;
  assign _T_565 = _T_563 == 9'hb;
  assign _T_567 = io_rrd_uop_uopc & 9'h1be;
  assign _T_569 = _T_567 == 9'hc;
  assign _T_573 = _T_567 == 9'h2e;
  assign _T_575 = io_rrd_uop_uopc & 9'h1bc;
  assign _T_577 = _T_575 == 9'h30;
  assign _T_579 = io_rrd_uop_uopc & 9'h1bb;
  assign _T_581 = _T_579 == 9'h31;
  assign _T_583 = io_rrd_uop_uopc & 9'h1fd;
  assign _T_585 = _T_583 == 9'h3c;
  assign _T_587 = io_rrd_uop_uopc & 9'h1b7;
  assign _T_589 = _T_587 == 9'h6;
  assign _T_593 = _T_579 == 9'h13;
  assign _T_595 = io_rrd_uop_uopc & 9'h1e3;
  assign _T_597 = _T_595 == 9'h40;
  assign _T_599 = io_rrd_uop_uopc & 9'h1f7;
  assign _T_601 = _T_599 == 9'h32;
  assign _T_603 = io_rrd_uop_uopc & 9'h1af;
  assign _T_605 = _T_603 == 9'h6;
  assign _T_608 = _T_565 | _T_569;
  assign _T_609 = _T_608 | _T_573;
  assign _T_610 = _T_609 | _T_577;
  assign _T_611 = _T_610 | _T_581;
  assign _T_612 = _T_611 | _T_585;
  assign _T_613 = _T_612 | _T_589;
  assign _T_614 = _T_613 | _T_593;
  assign _T_615 = _T_614 | _T_597;
  assign _T_616 = _T_615 | _T_601;
  assign _T_617 = _T_616 | _T_605;
  assign _T_621 = _T_567 == 9'h6;
  assign _T_625 = _T_563 == 9'ha;
  assign _T_629 = _T_563 == 9'hc;
  assign _T_631 = io_rrd_uop_uopc & 9'h1b9;
  assign _T_633 = _T_631 == 9'h10;
  assign _T_637 = _T_567 == 9'h12;
  assign _T_639 = io_rrd_uop_uopc & 9'h1df;
  assign _T_641 = _T_639 == 9'h16;
  assign _T_645 = _T_563 == 9'h2d;
  assign _T_649 = _T_567 == 9'h30;
  assign _T_651 = io_rrd_uop_uopc & 9'h1fb;
  assign _T_653 = _T_651 == 9'h3b;
  assign _T_655 = io_rrd_uop_uopc == 9'h3c;
  assign _T_658 = _T_621 | _T_625;
  assign _T_659 = _T_658 | _T_629;
  assign _T_660 = _T_659 | _T_633;
  assign _T_661 = _T_660 | _T_637;
  assign _T_662 = _T_661 | _T_641;
  assign _T_663 = _T_662 | _T_645;
  assign _T_664 = _T_663 | _T_649;
  assign _T_665 = _T_664 | _T_653;
  assign _T_666 = _T_665 | _T_655;
  assign _T_667 = _T_666 | _T_597;
  assign _T_669 = io_rrd_uop_uopc & 9'h1bd;
  assign _T_671 = _T_669 == 9'h8;
  assign _T_675 = _T_579 == 9'h9;
  assign _T_679 = _T_631 == 9'h11;
  assign _T_681 = io_rrd_uop_uopc & 9'h19e;
  assign _T_683 = _T_681 == 9'h12;
  assign _T_687 = _T_567 == 9'h14;
  assign _T_689 = io_rrd_uop_uopc & 9'h1f2;
  assign _T_691 = _T_689 == 9'h32;
  assign _T_693 = io_rrd_uop_uopc & 9'h1f9;
  assign _T_695 = _T_693 == 9'h39;
  assign _T_697 = io_rrd_uop_uopc & 9'h1fc;
  assign _T_699 = _T_697 == 9'h3c;
  assign _T_702 = _T_621 | _T_671;
  assign _T_703 = _T_702 | _T_675;
  assign _T_704 = _T_703 | _T_679;
  assign _T_705 = _T_704 | _T_683;
  assign _T_706 = _T_705 | _T_687;
  assign _T_707 = _T_706 | _T_691;
  assign _T_708 = _T_707 | _T_695;
  assign _T_709 = _T_708 | _T_699;
  assign _T_710 = _T_709 | _T_597;
  assign _T_714 = _T_563 == 9'h9;
  assign _T_718 = _T_681 == 9'h10;
  assign _T_720 = io_rrd_uop_uopc & 9'h1fe;
  assign _T_722 = _T_720 == 9'h36;
  assign _T_726 = _T_579 == 9'h12;
  assign _T_729 = _T_714 | _T_625;
  assign _T_730 = _T_729 | _T_629;
  assign _T_731 = _T_730 | _T_718;
  assign _T_732 = _T_731 | _T_645;
  assign _T_733 = _T_732 | _T_722;
  assign _T_734 = _T_733 | _T_726;
  assign _T_735 = {_T_667,_T_617};
  assign _T_736 = {_T_734,_T_710};
  assign _T_737 = {_T_736,_T_735};
  assign _T_741 = _T_651 == 9'h2b;
  assign _T_745 = _T_697 == 9'h2c;
  assign _T_747 = io_rrd_uop_uopc & 9'h1ed;
  assign _T_749 = _T_747 == 9'h2d;
  assign _T_751 = io_rrd_uop_uopc & 9'h1ee;
  assign _T_753 = _T_751 == 9'h2e;
  assign _T_757 = _T_697 == 9'h30;
  assign _T_761 = _T_599 == 9'h30;
  assign _T_764 = _T_741 | _T_745;
  assign _T_765 = _T_764 | _T_749;
  assign _T_766 = _T_765 | _T_753;
  assign _T_767 = _T_766 | _T_757;
  assign _T_768 = _T_767 | _T_761;
  assign _T_769 = _T_768 | _T_551;
  assign _T_770 = ~ _T_769;
  assign _T_772 = io_rrd_uop_uopc & 9'h7b;
  assign _T_774 = _T_772 == 9'h0;
  assign _T_776 = io_rrd_uop_uopc & 9'h1d;
  assign _T_778 = _T_776 == 9'h1;
  assign _T_780 = io_rrd_uop_uopc & 9'h1e;
  assign _T_782 = _T_780 == 9'h2;
  assign _T_784 = io_rrd_uop_uopc & 9'h60;
  assign _T_786 = _T_784 == 9'h60;
  assign _T_789 = _T_774 | _T_778;
  assign _T_790 = _T_789 | _T_782;
  assign _T_791 = _T_790 | _T_786;
  assign _T_793 = {1'h0,_T_791};
  assign _T_795 = io_rrd_uop_uopc & 9'h78;
  assign _T_797 = _T_795 == 9'h0;
  assign _T_799 = io_rrd_uop_uopc & 9'h72;
  assign _T_801 = _T_799 == 9'h0;
  assign _T_803 = io_rrd_uop_uopc & 9'h1c;
  assign _T_805 = _T_803 == 9'h8;
  assign _T_807 = io_rrd_uop_uopc & 9'h3b;
  assign _T_809 = _T_807 == 9'h2a;
  assign _T_811 = io_rrd_uop_uopc & 9'h3d;
  assign _T_813 = _T_811 == 9'h30;
  assign _T_816 = _T_797 | _T_801;
  assign _T_817 = _T_816 | _T_805;
  assign _T_818 = _T_817 | _T_809;
  assign _T_819 = _T_818 | _T_813;
  assign _T_821 = io_rrd_uop_uopc & 9'h5f;
  assign _T_823 = _T_821 == 9'h0;
  assign _T_825 = io_rrd_uop_uopc & 9'h38;
  assign _T_827 = _T_825 == 9'h18;
  assign _T_830 = _T_823 | _T_827;
  assign _T_833 = _T_778 | _T_782;
  assign _T_834 = _T_833 | _T_786;
  assign _T_835 = {_T_834,_T_830};
  assign _T_836 = {_T_835,_T_819};
  assign _T_838 = io_rrd_uop_uopc & 9'h2b;
  assign _T_840 = _T_838 == 9'h0;
  assign _T_846 = {1'h0,_T_840};
  assign _T_847 = {_T_846,_T_840};
  assign _T_849 = io_rrd_uop_uopc & 9'h1b8;
  assign _T_851 = _T_849 == 9'h8;
  assign _T_853 = io_rrd_uop_uopc & 9'h1ac;
  assign _T_855 = _T_853 == 9'h20;
  assign _T_857 = io_rrd_uop_uopc & 9'h1f0;
  assign _T_859 = _T_857 == 9'h30;
  assign _T_863 = _T_853 == 9'h4;
  assign _T_865 = io_rrd_uop_uopc & 9'h19b;
  assign _T_867 = _T_865 == 9'hb;
  assign _T_869 = io_rrd_uop_uopc & 9'h19c;
  assign _T_871 = _T_869 == 9'hc;
  assign _T_875 = _T_849 == 9'h10;
  assign _T_879 = _T_857 == 9'h50;
  assign _T_883 = _T_857 == 9'h60;
  assign _T_885 = io_rrd_uop_uopc & 9'h1cb;
  assign _T_887 = _T_885 == 9'h40;
  assign _T_889 = io_rrd_uop_uopc & 9'h19a;
  assign _T_891 = _T_889 == 9'h10;
  assign _T_893 = io_rrd_uop_uopc & 9'h1a6;
  assign _T_895 = _T_893 == 9'h6;
  assign _T_898 = _T_851 | _T_855;
  assign _T_899 = _T_898 | _T_859;
  assign _T_900 = _T_899 | _T_863;
  assign _T_901 = _T_900 | _T_867;
  assign _T_902 = _T_901 | _T_871;
  assign _T_903 = _T_902 | _T_875;
  assign _T_904 = _T_903 | _T_879;
  assign _T_905 = _T_904 | _T_883;
  assign _T_906 = _T_905 | _T_887;
  assign _T_907 = _T_906 | _T_891;
  assign _T_908 = _T_907 | _T_895;
  assign _T_910 = io_rrd_uop_uopc == 9'h1e;
  assign _T_914 = _T_720 == 9'h20;
  assign _T_918 = _T_583 == 9'h21;
  assign _T_921 = _T_910 | _T_914;
  assign _T_922 = _T_921 | _T_918;
  assign _T_924 = io_rrd_uop_uopc == 9'h1f;
  assign _T_928 = _T_583 == 9'h20;
  assign _T_932 = _T_720 == 9'h22;
  assign _T_935 = _T_924 | _T_928;
  assign _T_936 = _T_935 | _T_932;
  assign _T_938 = io_rrd_uop_uopc == 9'h7a;
  assign _T_941 = {_T_938,_T_936};
  assign _T_942 = {_T_941,_T_922};
  assign _T_944 = io_rrd_uop_uopc == 9'h1;
  assign _T_945 = io_rrd_uop_uopc == 9'h2;
  assign _T_946 = io_rrd_uop_uopc == 9'h43;
  assign _T_947 = _T_945 | _T_946;
  assign _T_948 = io_rrd_uop_uopc == 9'h3;
  assign _T_949 = io_rrd_uop_lrs2_rtype != 2'h2;
  assign _T_950 = io_rrd_uop_ctrl_is_sta & _T_949;
  assign _T_951 = _T_948 | _T_950;
  assign _GEN_0 = _T_946 ? 20'h0 : io_iss_uop_imm_packed;
  assign _T_955 = rrd_cs_csr_cmd == 3'h2;
  assign _T_957 = rrd_cs_csr_cmd == 3'h3;
  assign _T_958 = _T_955 | _T_957;
  assign _T_960 = io_rrd_uop_pop1 == 7'h0;
  assign csr_ren = _T_958 & _T_960;
  assign _T_962 = csr_ren ? 3'h5 : rrd_cs_csr_cmd;
endmodule