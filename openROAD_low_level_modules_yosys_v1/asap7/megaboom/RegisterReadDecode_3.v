module RegisterReadDecode_3(
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
  wire [8:0] _T_396;
  wire  _T_398;
  wire [8:0] _T_400;
  wire  _T_402;
  wire [8:0] _T_404;
  wire  _T_406;
  wire  _T_409;
  wire  _T_410;
  wire  _T_411;
  wire [8:0] _T_418;
  wire  _T_420;
  wire  _T_424;
  wire  _T_428;
  wire [8:0] _T_430;
  wire  _T_432;
  wire  _T_436;
  wire [8:0] _T_438;
  wire  _T_440;
  wire [8:0] _T_442;
  wire  _T_444;
  wire  _T_447;
  wire  _T_448;
  wire  _T_449;
  wire  _T_450;
  wire  _T_451;
  wire  _T_452;
  wire  _T_456;
  wire  _T_458;
  wire  _T_460;
  wire [8:0] _T_462;
  wire  _T_464;
  wire  _T_468;
  wire  _T_470;
  wire  _T_474;
  wire  _T_477;
  wire  _T_478;
  wire  _T_479;
  wire  _T_480;
  wire  _T_481;
  wire  _T_482;
  wire  _T_486;
  wire  _T_490;
  wire  _T_494;
  wire [8:0] _T_496;
  wire  _T_498;
  wire  _T_502;
  wire  _T_505;
  wire  _T_506;
  wire  _T_507;
  wire  _T_508;
  wire  _T_509;
  wire  _T_511;
  wire  _T_515;
  wire  _T_519;
  wire  _T_522;
  wire  _T_523;
  wire  _T_524;
  wire  _T_525;
  wire  _T_526;
  wire [1:0] _T_527;
  wire [1:0] _T_528;
  wire [3:0] _T_529;
  wire  _T_533;
  wire  _T_537;
  wire  _T_540;
  wire  _T_541;
  wire  _T_542;
  wire [8:0] _T_544;
  wire  _T_546;
  wire [1:0] _T_550;
  wire [8:0] _T_552;
  wire  _T_554;
  wire [8:0] _T_556;
  wire  _T_558;
  wire [8:0] _T_560;
  wire  _T_562;
  wire [8:0] _T_564;
  wire  _T_566;
  wire [8:0] _T_568;
  wire  _T_570;
  wire [8:0] _T_572;
  wire  _T_574;
  wire  _T_577;
  wire  _T_578;
  wire  _T_579;
  wire  _T_580;
  wire  _T_581;
  wire [8:0] _T_583;
  wire  _T_585;
  wire [1:0] _T_589;
  wire [2:0] _T_590;
  wire [8:0] _T_592;
  wire  _T_594;
  wire [8:0] _T_596;
  wire  _T_598;
  wire  _T_601;
  wire [1:0] _T_605;
  wire [2:0] _T_606;
  wire [8:0] _T_608;
  wire  _T_610;
  wire [8:0] _T_612;
  wire  _T_614;
  wire [8:0] _T_616;
  wire  _T_618;
  wire  _T_622;
  wire [8:0] _T_624;
  wire  _T_626;
  wire  _T_629;
  wire  _T_630;
  wire  _T_631;
  wire  _T_632;
  wire  _T_639;
  wire  _T_640;
  wire  _T_641;
  wire  _T_642;
  wire  _T_643;
  wire  _T_644;
  wire  _T_645;
  wire  _T_646;
  wire [19:0] _GEN_0;
  wire  _T_650;
  wire  _T_652;
  wire  _T_653;
  wire  _T_655;
  wire  csr_ren;
  wire [2:0] _T_657;
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
  assign io_rrd_uop_ctrl_csr_cmd = _T_657;
  assign io_rrd_uop_ctrl_is_load = _T_639;
  assign io_rrd_uop_ctrl_is_sta = _T_642;
  assign io_rrd_uop_ctrl_is_std = _T_646;
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
  assign rrd_cs_use_alupipe = _T_411;
  assign rrd_cs_use_muldivpipe = 1'h0;
  assign rrd_cs_use_mempipe = _T_410;
  assign rrd_cs_op_fcn = _T_529;
  assign rrd_cs_fcn_dw = _T_542;
  assign rrd_cs_op1_sel = _T_550;
  assign rrd_cs_op2_sel = _T_590;
  assign rrd_cs_imm_sel = _T_606;
  assign rrd_cs_rf_wen = _T_632;
  assign rrd_cs_csr_cmd = 3'h0;
  assign _T_396 = io_rrd_uop_uopc & 9'h1fd;
  assign _T_398 = _T_396 == 9'h1;
  assign _T_400 = io_rrd_uop_uopc & 9'h1fe;
  assign _T_402 = _T_400 == 9'h2;
  assign _T_404 = io_rrd_uop_uopc & 9'h1bf;
  assign _T_406 = _T_404 == 9'h3;
  assign _T_409 = _T_398 | _T_402;
  assign _T_410 = _T_409 | _T_406;
  assign _T_411 = ~ _T_410;
  assign _T_418 = io_rrd_uop_uopc & 9'h1f7;
  assign _T_420 = _T_418 == 9'h3;
  assign _T_424 = _T_400 == 9'hc;
  assign _T_428 = _T_400 == 9'h2e;
  assign _T_430 = io_rrd_uop_uopc & 9'h1fc;
  assign _T_432 = _T_430 == 9'h30;
  assign _T_436 = _T_418 == 9'h6;
  assign _T_438 = io_rrd_uop_uopc & 9'h1fb;
  assign _T_440 = _T_438 == 9'h13;
  assign _T_442 = io_rrd_uop_uopc & 9'h1ef;
  assign _T_444 = _T_442 == 9'h6;
  assign _T_447 = _T_420 | _T_424;
  assign _T_448 = _T_447 | _T_428;
  assign _T_449 = _T_448 | _T_432;
  assign _T_450 = _T_449 | _T_436;
  assign _T_451 = _T_450 | _T_440;
  assign _T_452 = _T_451 | _T_444;
  assign _T_456 = _T_400 == 9'h6;
  assign _T_458 = io_rrd_uop_uopc == 9'ha;
  assign _T_460 = io_rrd_uop_uopc == 9'hc;
  assign _T_462 = io_rrd_uop_uopc & 9'h1f9;
  assign _T_464 = _T_462 == 9'h10;
  assign _T_468 = _T_400 == 9'h12;
  assign _T_470 = io_rrd_uop_uopc == 9'h2d;
  assign _T_474 = _T_400 == 9'h30;
  assign _T_477 = _T_456 | _T_458;
  assign _T_478 = _T_477 | _T_460;
  assign _T_479 = _T_478 | _T_464;
  assign _T_480 = _T_479 | _T_468;
  assign _T_481 = _T_480 | _T_470;
  assign _T_482 = _T_481 | _T_474;
  assign _T_486 = _T_396 == 9'h8;
  assign _T_490 = _T_438 == 9'h9;
  assign _T_494 = _T_462 == 9'h11;
  assign _T_496 = io_rrd_uop_uopc & 9'h1de;
  assign _T_498 = _T_496 == 9'h12;
  assign _T_502 = _T_400 == 9'h14;
  assign _T_505 = _T_456 | _T_486;
  assign _T_506 = _T_505 | _T_490;
  assign _T_507 = _T_506 | _T_494;
  assign _T_508 = _T_507 | _T_498;
  assign _T_509 = _T_508 | _T_502;
  assign _T_511 = io_rrd_uop_uopc == 9'h9;
  assign _T_515 = _T_496 == 9'h10;
  assign _T_519 = _T_438 == 9'h12;
  assign _T_522 = _T_511 | _T_458;
  assign _T_523 = _T_522 | _T_460;
  assign _T_524 = _T_523 | _T_515;
  assign _T_525 = _T_524 | _T_519;
  assign _T_526 = _T_525 | _T_470;
  assign _T_527 = {_T_482,_T_452};
  assign _T_528 = {_T_526,_T_509};
  assign _T_529 = {_T_528,_T_527};
  assign _T_533 = _T_438 == 9'h2b;
  assign _T_537 = _T_430 == 9'h2c;
  assign _T_540 = _T_533 | _T_537;
  assign _T_541 = _T_540 | _T_432;
  assign _T_542 = ~ _T_541;
  assign _T_544 = io_rrd_uop_uopc & 9'h1b;
  assign _T_546 = _T_544 == 9'h0;
  assign _T_550 = {1'h0,_T_546};
  assign _T_552 = io_rrd_uop_uopc & 9'h32;
  assign _T_554 = _T_552 == 9'h0;
  assign _T_556 = io_rrd_uop_uopc & 9'h1c;
  assign _T_558 = _T_556 == 9'h4;
  assign _T_560 = io_rrd_uop_uopc & 9'hc;
  assign _T_562 = _T_560 == 9'h8;
  assign _T_564 = io_rrd_uop_uopc & 9'h29;
  assign _T_566 = _T_564 == 9'h20;
  assign _T_568 = io_rrd_uop_uopc & 9'h23;
  assign _T_570 = _T_568 == 9'h22;
  assign _T_572 = io_rrd_uop_uopc & 9'h19;
  assign _T_574 = _T_572 == 9'h0;
  assign _T_577 = _T_554 | _T_558;
  assign _T_578 = _T_577 | _T_562;
  assign _T_579 = _T_578 | _T_566;
  assign _T_580 = _T_579 | _T_570;
  assign _T_581 = _T_580 | _T_574;
  assign _T_583 = io_rrd_uop_uopc & 9'h40;
  assign _T_585 = _T_583 == 9'h40;
  assign _T_589 = {1'h0,_T_585};
  assign _T_590 = {_T_589,_T_581};
  assign _T_592 = io_rrd_uop_uopc & 9'h2d;
  assign _T_594 = _T_592 == 9'h0;
  assign _T_596 = io_rrd_uop_uopc & 9'h2b;
  assign _T_598 = _T_596 == 9'h0;
  assign _T_601 = _T_594 | _T_598;
  assign _T_605 = {1'h0,_T_598};
  assign _T_606 = {_T_605,_T_601};
  assign _T_608 = io_rrd_uop_uopc & 9'h1f8;
  assign _T_610 = _T_608 == 9'h8;
  assign _T_612 = io_rrd_uop_uopc & 9'h1db;
  assign _T_614 = _T_612 == 9'hb;
  assign _T_616 = io_rrd_uop_uopc & 9'h1dc;
  assign _T_618 = _T_616 == 9'hc;
  assign _T_622 = _T_616 == 9'h10;
  assign _T_624 = io_rrd_uop_uopc & 9'h1ec;
  assign _T_626 = _T_624 == 9'h4;
  assign _T_629 = _T_610 | _T_614;
  assign _T_630 = _T_629 | _T_618;
  assign _T_631 = _T_630 | _T_622;
  assign _T_632 = _T_631 | _T_626;
  assign _T_639 = io_rrd_uop_uopc == 9'h1;
  assign _T_640 = io_rrd_uop_uopc == 9'h2;
  assign _T_641 = io_rrd_uop_uopc == 9'h43;
  assign _T_642 = _T_640 | _T_641;
  assign _T_643 = io_rrd_uop_uopc == 9'h3;
  assign _T_644 = io_rrd_uop_lrs2_rtype != 2'h2;
  assign _T_645 = io_rrd_uop_ctrl_is_sta & _T_644;
  assign _T_646 = _T_643 | _T_645;
  assign _GEN_0 = _T_641 ? 20'h0 : io_iss_uop_imm_packed;
  assign _T_650 = rrd_cs_csr_cmd == 3'h2;
  assign _T_652 = rrd_cs_csr_cmd == 3'h3;
  assign _T_653 = _T_650 | _T_652;
  assign _T_655 = io_rrd_uop_pop1 == 7'h0;
  assign csr_ren = _T_653 & _T_655;
  assign _T_657 = csr_ren ? 3'h5 : rrd_cs_csr_cmd;
endmodule