module RegisterReadDecode_2(
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
  wire [8:0] _T_393;
  wire  _T_395;
  wire [8:0] _T_397;
  wire  _T_399;
  wire [8:0] _T_401;
  wire  _T_403;
  wire  _T_407;
  wire  _T_409;
  wire  _T_412;
  wire  _T_413;
  wire  _T_414;
  wire  _T_415;
  wire  _T_416;
  wire  _T_425;
  wire [8:0] _T_427;
  wire  _T_429;
  wire  _T_433;
  wire [8:0] _T_435;
  wire  _T_437;
  wire [8:0] _T_439;
  wire  _T_441;
  wire [8:0] _T_443;
  wire  _T_445;
  wire [8:0] _T_447;
  wire  _T_449;
  wire  _T_453;
  wire  _T_457;
  wire [8:0] _T_459;
  wire  _T_461;
  wire  _T_464;
  wire  _T_465;
  wire  _T_466;
  wire  _T_467;
  wire  _T_468;
  wire  _T_469;
  wire  _T_470;
  wire  _T_471;
  wire  _T_472;
  wire  _T_473;
  wire  _T_477;
  wire  _T_479;
  wire  _T_481;
  wire [8:0] _T_483;
  wire  _T_485;
  wire  _T_489;
  wire [8:0] _T_491;
  wire  _T_493;
  wire  _T_495;
  wire  _T_499;
  wire  _T_503;
  wire  _T_505;
  wire  _T_508;
  wire  _T_509;
  wire  _T_510;
  wire  _T_511;
  wire  _T_512;
  wire  _T_513;
  wire  _T_514;
  wire  _T_515;
  wire  _T_516;
  wire  _T_517;
  wire  _T_521;
  wire  _T_525;
  wire  _T_529;
  wire [8:0] _T_531;
  wire  _T_533;
  wire  _T_537;
  wire [8:0] _T_539;
  wire  _T_541;
  wire  _T_545;
  wire  _T_549;
  wire  _T_552;
  wire  _T_553;
  wire  _T_554;
  wire  _T_555;
  wire  _T_556;
  wire  _T_557;
  wire  _T_558;
  wire  _T_559;
  wire  _T_560;
  wire  _T_562;
  wire  _T_566;
  wire  _T_570;
  wire  _T_573;
  wire  _T_574;
  wire  _T_575;
  wire  _T_576;
  wire  _T_577;
  wire  _T_578;
  wire [1:0] _T_579;
  wire [1:0] _T_580;
  wire [3:0] _T_581;
  wire  _T_585;
  wire  _T_589;
  wire [8:0] _T_591;
  wire  _T_593;
  wire [8:0] _T_595;
  wire  _T_597;
  wire  _T_601;
  wire  _T_604;
  wire  _T_605;
  wire  _T_606;
  wire  _T_607;
  wire  _T_608;
  wire  _T_609;
  wire  _T_610;
  wire [8:0] _T_612;
  wire  _T_614;
  wire [1:0] _T_618;
  wire [8:0] _T_620;
  wire  _T_622;
  wire [8:0] _T_624;
  wire  _T_626;
  wire [8:0] _T_628;
  wire  _T_630;
  wire [8:0] _T_632;
  wire  _T_634;
  wire [8:0] _T_636;
  wire  _T_638;
  wire  _T_641;
  wire  _T_642;
  wire  _T_643;
  wire  _T_644;
  wire [2:0] _T_648;
  wire [8:0] _T_650;
  wire  _T_652;
  wire [1:0] _T_658;
  wire [2:0] _T_659;
  wire  _T_663;
  wire [8:0] _T_665;
  wire  _T_667;
  wire [8:0] _T_669;
  wire  _T_671;
  wire [8:0] _T_673;
  wire  _T_675;
  wire  _T_679;
  wire [8:0] _T_681;
  wire  _T_683;
  wire  _T_686;
  wire  _T_687;
  wire  _T_688;
  wire  _T_689;
  wire  _T_690;
  wire  _T_691;
  wire  _T_692;
  wire  _T_693;
  wire  _T_700;
  wire  _T_701;
  wire  _T_702;
  wire  _T_703;
  wire  _T_704;
  wire  _T_705;
  wire  _T_706;
  wire  _T_707;
  wire [19:0] _GEN_0;
  wire  _T_711;
  wire  _T_713;
  wire  _T_714;
  wire  _T_716;
  wire  csr_ren;
  wire [2:0] _T_718;
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
  assign io_rrd_uop_ctrl_csr_cmd = _T_718;
  assign io_rrd_uop_ctrl_is_load = _T_700;
  assign io_rrd_uop_ctrl_is_sta = _T_703;
  assign io_rrd_uop_ctrl_is_std = _T_707;
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
  assign rrd_cs_use_alupipe = _T_416;
  assign rrd_cs_use_muldivpipe = _T_415;
  assign rrd_cs_use_mempipe = 1'h0;
  assign rrd_cs_op_fcn = _T_581;
  assign rrd_cs_fcn_dw = _T_610;
  assign rrd_cs_op1_sel = _T_618;
  assign rrd_cs_op2_sel = _T_648;
  assign rrd_cs_imm_sel = _T_659;
  assign rrd_cs_rf_wen = _T_693;
  assign rrd_cs_csr_cmd = 3'h0;
  assign _T_393 = io_rrd_uop_uopc & 9'h1f4;
  assign _T_395 = _T_393 == 9'h34;
  assign _T_397 = io_rrd_uop_uopc & 9'h1be;
  assign _T_399 = _T_397 == 9'h36;
  assign _T_401 = io_rrd_uop_uopc & 9'h1f8;
  assign _T_403 = _T_401 == 9'h38;
  assign _T_407 = _T_397 == 9'h38;
  assign _T_409 = io_rrd_uop_uopc == 9'h40;
  assign _T_412 = _T_395 | _T_399;
  assign _T_413 = _T_412 | _T_403;
  assign _T_414 = _T_413 | _T_407;
  assign _T_415 = _T_414 | _T_409;
  assign _T_416 = ~ _T_415;
  assign _T_425 = io_rrd_uop_uopc == 9'hb;
  assign _T_427 = io_rrd_uop_uopc & 9'h1fe;
  assign _T_429 = _T_427 == 9'hc;
  assign _T_433 = _T_427 == 9'h2e;
  assign _T_435 = io_rrd_uop_uopc & 9'h1fc;
  assign _T_437 = _T_435 == 9'h30;
  assign _T_439 = io_rrd_uop_uopc & 9'h1fb;
  assign _T_441 = _T_439 == 9'h31;
  assign _T_443 = io_rrd_uop_uopc & 9'h1fd;
  assign _T_445 = _T_443 == 9'h3c;
  assign _T_447 = io_rrd_uop_uopc & 9'h1f7;
  assign _T_449 = _T_447 == 9'h6;
  assign _T_453 = _T_439 == 9'h13;
  assign _T_457 = _T_447 == 9'h32;
  assign _T_459 = io_rrd_uop_uopc & 9'h1ef;
  assign _T_461 = _T_459 == 9'h6;
  assign _T_464 = _T_425 | _T_429;
  assign _T_465 = _T_464 | _T_433;
  assign _T_466 = _T_465 | _T_437;
  assign _T_467 = _T_466 | _T_441;
  assign _T_468 = _T_467 | _T_445;
  assign _T_469 = _T_468 | _T_409;
  assign _T_470 = _T_469 | _T_449;
  assign _T_471 = _T_470 | _T_453;
  assign _T_472 = _T_471 | _T_457;
  assign _T_473 = _T_472 | _T_461;
  assign _T_477 = _T_427 == 9'h6;
  assign _T_479 = io_rrd_uop_uopc == 9'ha;
  assign _T_481 = io_rrd_uop_uopc == 9'hc;
  assign _T_483 = io_rrd_uop_uopc & 9'h1f9;
  assign _T_485 = _T_483 == 9'h10;
  assign _T_489 = _T_427 == 9'h12;
  assign _T_491 = io_rrd_uop_uopc & 9'h1df;
  assign _T_493 = _T_491 == 9'h16;
  assign _T_495 = io_rrd_uop_uopc == 9'h2d;
  assign _T_499 = _T_427 == 9'h30;
  assign _T_503 = _T_439 == 9'h3b;
  assign _T_505 = io_rrd_uop_uopc == 9'h3c;
  assign _T_508 = _T_477 | _T_479;
  assign _T_509 = _T_508 | _T_481;
  assign _T_510 = _T_509 | _T_485;
  assign _T_511 = _T_510 | _T_489;
  assign _T_512 = _T_511 | _T_493;
  assign _T_513 = _T_512 | _T_495;
  assign _T_514 = _T_513 | _T_499;
  assign _T_515 = _T_514 | _T_503;
  assign _T_516 = _T_515 | _T_505;
  assign _T_517 = _T_516 | _T_409;
  assign _T_521 = _T_443 == 9'h8;
  assign _T_525 = _T_439 == 9'h9;
  assign _T_529 = _T_483 == 9'h11;
  assign _T_531 = io_rrd_uop_uopc & 9'h1de;
  assign _T_533 = _T_531 == 9'h12;
  assign _T_537 = _T_427 == 9'h14;
  assign _T_539 = io_rrd_uop_uopc & 9'h1f2;
  assign _T_541 = _T_539 == 9'h32;
  assign _T_545 = _T_483 == 9'h39;
  assign _T_549 = _T_435 == 9'h3c;
  assign _T_552 = _T_477 | _T_521;
  assign _T_553 = _T_552 | _T_525;
  assign _T_554 = _T_553 | _T_529;
  assign _T_555 = _T_554 | _T_533;
  assign _T_556 = _T_555 | _T_537;
  assign _T_557 = _T_556 | _T_541;
  assign _T_558 = _T_557 | _T_545;
  assign _T_559 = _T_558 | _T_549;
  assign _T_560 = _T_559 | _T_409;
  assign _T_562 = io_rrd_uop_uopc == 9'h9;
  assign _T_566 = _T_531 == 9'h10;
  assign _T_570 = _T_439 == 9'h12;
  assign _T_573 = _T_562 | _T_479;
  assign _T_574 = _T_573 | _T_481;
  assign _T_575 = _T_574 | _T_566;
  assign _T_576 = _T_575 | _T_495;
  assign _T_577 = _T_576 | _T_399;
  assign _T_578 = _T_577 | _T_570;
  assign _T_579 = {_T_517,_T_473};
  assign _T_580 = {_T_578,_T_560};
  assign _T_581 = {_T_580,_T_579};
  assign _T_585 = _T_439 == 9'h2b;
  assign _T_589 = _T_435 == 9'h2c;
  assign _T_591 = io_rrd_uop_uopc & 9'h1ed;
  assign _T_593 = _T_591 == 9'h2d;
  assign _T_595 = io_rrd_uop_uopc & 9'h1ee;
  assign _T_597 = _T_595 == 9'h2e;
  assign _T_601 = _T_447 == 9'h30;
  assign _T_604 = _T_585 | _T_589;
  assign _T_605 = _T_604 | _T_593;
  assign _T_606 = _T_605 | _T_597;
  assign _T_607 = _T_606 | _T_437;
  assign _T_608 = _T_607 | _T_601;
  assign _T_609 = _T_608 | _T_409;
  assign _T_610 = ~ _T_609;
  assign _T_612 = io_rrd_uop_uopc & 9'h5b;
  assign _T_614 = _T_612 == 9'h0;
  assign _T_618 = {1'h0,_T_614};
  assign _T_620 = io_rrd_uop_uopc & 9'h72;
  assign _T_622 = _T_620 == 9'h0;
  assign _T_624 = io_rrd_uop_uopc & 9'h58;
  assign _T_626 = _T_624 == 9'h0;
  assign _T_628 = io_rrd_uop_uopc & 9'h54;
  assign _T_630 = _T_628 == 9'h0;
  assign _T_632 = io_rrd_uop_uopc & 9'h2d;
  assign _T_634 = _T_632 == 9'h20;
  assign _T_636 = io_rrd_uop_uopc & 9'h33;
  assign _T_638 = _T_636 == 9'h22;
  assign _T_641 = _T_622 | _T_626;
  assign _T_642 = _T_641 | _T_630;
  assign _T_643 = _T_642 | _T_634;
  assign _T_644 = _T_643 | _T_638;
  assign _T_648 = {2'h0,_T_644};
  assign _T_650 = io_rrd_uop_uopc & 9'h2b;
  assign _T_652 = _T_650 == 9'h0;
  assign _T_658 = {1'h0,_T_652};
  assign _T_659 = {_T_658,_T_652};
  assign _T_663 = _T_401 == 9'h8;
  assign _T_665 = io_rrd_uop_uopc & 9'h1d8;
  assign _T_667 = _T_665 == 9'h10;
  assign _T_669 = io_rrd_uop_uopc & 9'h1f0;
  assign _T_671 = _T_669 == 9'h30;
  assign _T_673 = io_rrd_uop_uopc & 9'h1dc;
  assign _T_675 = _T_673 == 9'hc;
  assign _T_679 = _T_393 == 9'h4;
  assign _T_681 = io_rrd_uop_uopc & 9'h1db;
  assign _T_683 = _T_681 == 9'hb;
  assign _T_686 = _T_663 | _T_667;
  assign _T_687 = _T_686 | _T_671;
  assign _T_688 = _T_687 | _T_399;
  assign _T_689 = _T_688 | _T_407;
  assign _T_690 = _T_689 | _T_409;
  assign _T_691 = _T_690 | _T_675;
  assign _T_692 = _T_691 | _T_679;
  assign _T_693 = _T_692 | _T_683;
  assign _T_700 = io_rrd_uop_uopc == 9'h1;
  assign _T_701 = io_rrd_uop_uopc == 9'h2;
  assign _T_702 = io_rrd_uop_uopc == 9'h43;
  assign _T_703 = _T_701 | _T_702;
  assign _T_704 = io_rrd_uop_uopc == 9'h3;
  assign _T_705 = io_rrd_uop_lrs2_rtype != 2'h2;
  assign _T_706 = io_rrd_uop_ctrl_is_sta & _T_705;
  assign _T_707 = _T_704 | _T_706;
  assign _GEN_0 = _T_702 ? 20'h0 : io_iss_uop_imm_packed;
  assign _T_711 = rrd_cs_csr_cmd == 3'h2;
  assign _T_713 = rrd_cs_csr_cmd == 3'h3;
  assign _T_714 = _T_711 | _T_713;
  assign _T_716 = io_rrd_uop_pop1 == 7'h0;
  assign csr_ren = _T_714 & _T_716;
  assign _T_718 = csr_ren ? 3'h5 : rrd_cs_csr_cmd;
endmodule