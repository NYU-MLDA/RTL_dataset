module BTB(
  input   clock,
  input   reset,
  input   io_req_valid,
  input  [38:0] io_req_bits_addr,
  output  io_resp_valid,
  output  io_resp_bits_taken,
  output [3:0] io_resp_bits_mask,
  output [1:0] io_resp_bits_bridx,
  output [38:0] io_resp_bits_target,
  output [5:0] io_resp_bits_entry,
  output [6:0] io_resp_bits_bht_history,
  output [1:0] io_resp_bits_bht_value,
  input   io_btb_update_valid,
  input   io_btb_update_bits_prediction_valid,
  input   io_btb_update_bits_prediction_bits_taken,
  input  [3:0] io_btb_update_bits_prediction_bits_mask,
  input  [1:0] io_btb_update_bits_prediction_bits_bridx,
  input  [38:0] io_btb_update_bits_prediction_bits_target,
  input  [5:0] io_btb_update_bits_prediction_bits_entry,
  input  [6:0] io_btb_update_bits_prediction_bits_bht_history,
  input  [1:0] io_btb_update_bits_prediction_bits_bht_value,
  input  [38:0] io_btb_update_bits_pc,
  input  [38:0] io_btb_update_bits_target,
  input   io_btb_update_bits_taken,
  input   io_btb_update_bits_isValid,
  input   io_btb_update_bits_isJump,
  input   io_btb_update_bits_isReturn,
  input  [38:0] io_btb_update_bits_br_pc,
  input   io_bht_update_valid,
  input   io_bht_update_bits_prediction_valid,
  input   io_bht_update_bits_prediction_bits_taken,
  input  [3:0] io_bht_update_bits_prediction_bits_mask,
  input  [1:0] io_bht_update_bits_prediction_bits_bridx,
  input  [38:0] io_bht_update_bits_prediction_bits_target,
  input  [5:0] io_bht_update_bits_prediction_bits_entry,
  input  [6:0] io_bht_update_bits_prediction_bits_bht_history,
  input  [1:0] io_bht_update_bits_prediction_bits_bht_value,
  input  [38:0] io_bht_update_bits_pc,
  input   io_bht_update_bits_taken,
  input   io_bht_update_bits_mispredict,
  input   io_ras_update_valid,
  input   io_ras_update_bits_isCall,
  input   io_ras_update_bits_isReturn,
  input  [38:0] io_ras_update_bits_returnAddr,
  input   io_ras_update_bits_prediction_valid,
  input   io_ras_update_bits_prediction_bits_taken,
  input  [3:0] io_ras_update_bits_prediction_bits_mask,
  input  [1:0] io_ras_update_bits_prediction_bits_bridx,
  input  [38:0] io_ras_update_bits_prediction_bits_target,
  input  [5:0] io_ras_update_bits_prediction_bits_entry,
  input  [6:0] io_ras_update_bits_prediction_bits_bht_history,
  input  [1:0] io_ras_update_bits_prediction_bits_bht_value
);
  reg [9:0] idxs_0;
  reg [31:0] _GEN_444;
  reg [9:0] idxs_1;
  reg [31:0] _GEN_445;
  reg [9:0] idxs_2;
  reg [31:0] _GEN_446;
  reg [9:0] idxs_3;
  reg [31:0] _GEN_447;
  reg [9:0] idxs_4;
  reg [31:0] _GEN_470;
  reg [9:0] idxs_5;
  reg [31:0] _GEN_471;
  reg [9:0] idxs_6;
  reg [31:0] _GEN_472;
  reg [9:0] idxs_7;
  reg [31:0] _GEN_473;
  reg [9:0] idxs_8;
  reg [31:0] _GEN_474;
  reg [9:0] idxs_9;
  reg [31:0] _GEN_475;
  reg [9:0] idxs_10;
  reg [31:0] _GEN_478;
  reg [9:0] idxs_11;
  reg [31:0] _GEN_480;
  reg [9:0] idxs_12;
  reg [31:0] _GEN_482;
  reg [9:0] idxs_13;
  reg [31:0] _GEN_486;
  reg [9:0] idxs_14;
  reg [31:0] _GEN_487;
  reg [9:0] idxs_15;
  reg [31:0] _GEN_488;
  reg [9:0] idxs_16;
  reg [31:0] _GEN_489;
  reg [9:0] idxs_17;
  reg [31:0] _GEN_490;
  reg [9:0] idxs_18;
  reg [31:0] _GEN_491;
  reg [9:0] idxs_19;
  reg [31:0] _GEN_492;
  reg [9:0] idxs_20;
  reg [31:0] _GEN_493;
  reg [9:0] idxs_21;
  reg [31:0] _GEN_494;
  reg [9:0] idxs_22;
  reg [31:0] _GEN_495;
  reg [9:0] idxs_23;
  reg [31:0] _GEN_496;
  reg [9:0] idxs_24;
  reg [31:0] _GEN_497;
  reg [9:0] idxs_25;
  reg [31:0] _GEN_498;
  reg [9:0] idxs_26;
  reg [31:0] _GEN_499;
  reg [9:0] idxs_27;
  reg [31:0] _GEN_500;
  reg [9:0] idxs_28;
  reg [31:0] _GEN_501;
  reg [9:0] idxs_29;
  reg [31:0] _GEN_502;
  reg [9:0] idxs_30;
  reg [31:0] _GEN_503;
  reg [9:0] idxs_31;
  reg [31:0] _GEN_504;
  reg [9:0] idxs_32;
  reg [31:0] _GEN_505;
  reg [9:0] idxs_33;
  reg [31:0] _GEN_506;
  reg [9:0] idxs_34;
  reg [31:0] _GEN_507;
  reg [9:0] idxs_35;
  reg [31:0] _GEN_508;
  reg [9:0] idxs_36;
  reg [31:0] _GEN_509;
  reg [9:0] idxs_37;
  reg [31:0] _GEN_510;
  reg [9:0] idxs_38;
  reg [31:0] _GEN_511;
  reg [9:0] idxs_39;
  reg [31:0] _GEN_512;
  reg [2:0] idxPages_0;
  reg [31:0] _GEN_513;
  reg [2:0] idxPages_1;
  reg [31:0] _GEN_514;
  reg [2:0] idxPages_2;
  reg [31:0] _GEN_515;
  reg [2:0] idxPages_3;
  reg [31:0] _GEN_516;
  reg [2:0] idxPages_4;
  reg [31:0] _GEN_517;
  reg [2:0] idxPages_5;
  reg [31:0] _GEN_518;
  reg [2:0] idxPages_6;
  reg [31:0] _GEN_519;
  reg [2:0] idxPages_7;
  reg [31:0] _GEN_520;
  reg [2:0] idxPages_8;
  reg [31:0] _GEN_521;
  reg [2:0] idxPages_9;
  reg [31:0] _GEN_522;
  reg [2:0] idxPages_10;
  reg [31:0] _GEN_523;
  reg [2:0] idxPages_11;
  reg [31:0] _GEN_524;
  reg [2:0] idxPages_12;
  reg [31:0] _GEN_525;
  reg [2:0] idxPages_13;
  reg [31:0] _GEN_526;
  reg [2:0] idxPages_14;
  reg [31:0] _GEN_527;
  reg [2:0] idxPages_15;
  reg [31:0] _GEN_528;
  reg [2:0] idxPages_16;
  reg [31:0] _GEN_529;
  reg [2:0] idxPages_17;
  reg [31:0] _GEN_530;
  reg [2:0] idxPages_18;
  reg [31:0] _GEN_531;
  reg [2:0] idxPages_19;
  reg [31:0] _GEN_532;
  reg [2:0] idxPages_20;
  reg [31:0] _GEN_533;
  reg [2:0] idxPages_21;
  reg [31:0] _GEN_534;
  reg [2:0] idxPages_22;
  reg [31:0] _GEN_535;
  reg [2:0] idxPages_23;
  reg [31:0] _GEN_536;
  reg [2:0] idxPages_24;
  reg [31:0] _GEN_537;
  reg [2:0] idxPages_25;
  reg [31:0] _GEN_538;
  reg [2:0] idxPages_26;
  reg [31:0] _GEN_539;
  reg [2:0] idxPages_27;
  reg [31:0] _GEN_540;
  reg [2:0] idxPages_28;
  reg [31:0] _GEN_541;
  reg [2:0] idxPages_29;
  reg [31:0] _GEN_542;
  reg [2:0] idxPages_30;
  reg [31:0] _GEN_543;
  reg [2:0] idxPages_31;
  reg [31:0] _GEN_544;
  reg [2:0] idxPages_32;
  reg [31:0] _GEN_545;
  reg [2:0] idxPages_33;
  reg [31:0] _GEN_546;
  reg [2:0] idxPages_34;
  reg [31:0] _GEN_547;
  reg [2:0] idxPages_35;
  reg [31:0] _GEN_548;
  reg [2:0] idxPages_36;
  reg [31:0] _GEN_549;
  reg [2:0] idxPages_37;
  reg [31:0] _GEN_550;
  reg [2:0] idxPages_38;
  reg [31:0] _GEN_551;
  reg [2:0] idxPages_39;
  reg [31:0] _GEN_552;
  reg [9:0] tgts_0;
  reg [31:0] _GEN_553;
  reg [9:0] tgts_1;
  reg [31:0] _GEN_554;
  reg [9:0] tgts_2;
  reg [31:0] _GEN_555;
  reg [9:0] tgts_3;
  reg [31:0] _GEN_556;
  reg [9:0] tgts_4;
  reg [31:0] _GEN_557;
  reg [9:0] tgts_5;
  reg [31:0] _GEN_558;
  reg [9:0] tgts_6;
  reg [31:0] _GEN_559;
  reg [9:0] tgts_7;
  reg [31:0] _GEN_560;
  reg [9:0] tgts_8;
  reg [31:0] _GEN_561;
  reg [9:0] tgts_9;
  reg [31:0] _GEN_562;
  reg [9:0] tgts_10;
  reg [31:0] _GEN_563;
  reg [9:0] tgts_11;
  reg [31:0] _GEN_564;
  reg [9:0] tgts_12;
  reg [31:0] _GEN_565;
  reg [9:0] tgts_13;
  reg [31:0] _GEN_566;
  reg [9:0] tgts_14;
  reg [31:0] _GEN_567;
  reg [9:0] tgts_15;
  reg [31:0] _GEN_568;
  reg [9:0] tgts_16;
  reg [31:0] _GEN_569;
  reg [9:0] tgts_17;
  reg [31:0] _GEN_570;
  reg [9:0] tgts_18;
  reg [31:0] _GEN_571;
  reg [9:0] tgts_19;
  reg [31:0] _GEN_572;
  reg [9:0] tgts_20;
  reg [31:0] _GEN_573;
  reg [9:0] tgts_21;
  reg [31:0] _GEN_574;
  reg [9:0] tgts_22;
  reg [31:0] _GEN_575;
  reg [9:0] tgts_23;
  reg [31:0] _GEN_576;
  reg [9:0] tgts_24;
  reg [31:0] _GEN_577;
  reg [9:0] tgts_25;
  reg [31:0] _GEN_578;
  reg [9:0] tgts_26;
  reg [31:0] _GEN_579;
  reg [9:0] tgts_27;
  reg [31:0] _GEN_580;
  reg [9:0] tgts_28;
  reg [31:0] _GEN_581;
  reg [9:0] tgts_29;
  reg [31:0] _GEN_582;
  reg [9:0] tgts_30;
  reg [31:0] _GEN_583;
  reg [9:0] tgts_31;
  reg [31:0] _GEN_584;
  reg [9:0] tgts_32;
  reg [31:0] _GEN_585;
  reg [9:0] tgts_33;
  reg [31:0] _GEN_586;
  reg [9:0] tgts_34;
  reg [31:0] _GEN_587;
  reg [9:0] tgts_35;
  reg [31:0] _GEN_588;
  reg [9:0] tgts_36;
  reg [31:0] _GEN_589;
  reg [9:0] tgts_37;
  reg [31:0] _GEN_590;
  reg [9:0] tgts_38;
  reg [31:0] _GEN_591;
  reg [9:0] tgts_39;
  reg [31:0] _GEN_592;
  reg [2:0] tgtPages_0;
  reg [31:0] _GEN_593;
  reg [2:0] tgtPages_1;
  reg [31:0] _GEN_594;
  reg [2:0] tgtPages_2;
  reg [31:0] _GEN_595;
  reg [2:0] tgtPages_3;
  reg [31:0] _GEN_596;
  reg [2:0] tgtPages_4;
  reg [31:0] _GEN_597;
  reg [2:0] tgtPages_5;
  reg [31:0] _GEN_598;
  reg [2:0] tgtPages_6;
  reg [31:0] _GEN_599;
  reg [2:0] tgtPages_7;
  reg [31:0] _GEN_600;
  reg [2:0] tgtPages_8;
  reg [31:0] _GEN_601;
  reg [2:0] tgtPages_9;
  reg [31:0] _GEN_602;
  reg [2:0] tgtPages_10;
  reg [31:0] _GEN_603;
  reg [2:0] tgtPages_11;
  reg [31:0] _GEN_604;
  reg [2:0] tgtPages_12;
  reg [31:0] _GEN_605;
  reg [2:0] tgtPages_13;
  reg [31:0] _GEN_606;
  reg [2:0] tgtPages_14;
  reg [31:0] _GEN_607;
  reg [2:0] tgtPages_15;
  reg [31:0] _GEN_608;
  reg [2:0] tgtPages_16;
  reg [31:0] _GEN_609;
  reg [2:0] tgtPages_17;
  reg [31:0] _GEN_610;
  reg [2:0] tgtPages_18;
  reg [31:0] _GEN_611;
  reg [2:0] tgtPages_19;
  reg [31:0] _GEN_612;
  reg [2:0] tgtPages_20;
  reg [31:0] _GEN_613;
  reg [2:0] tgtPages_21;
  reg [31:0] _GEN_614;
  reg [2:0] tgtPages_22;
  reg [31:0] _GEN_615;
  reg [2:0] tgtPages_23;
  reg [31:0] _GEN_616;
  reg [2:0] tgtPages_24;
  reg [31:0] _GEN_617;
  reg [2:0] tgtPages_25;
  reg [31:0] _GEN_618;
  reg [2:0] tgtPages_26;
  reg [31:0] _GEN_619;
  reg [2:0] tgtPages_27;
  reg [31:0] _GEN_620;
  reg [2:0] tgtPages_28;
  reg [31:0] _GEN_621;
  reg [2:0] tgtPages_29;
  reg [31:0] _GEN_622;
  reg [2:0] tgtPages_30;
  reg [31:0] _GEN_623;
  reg [2:0] tgtPages_31;
  reg [31:0] _GEN_624;
  reg [2:0] tgtPages_32;
  reg [31:0] _GEN_625;
  reg [2:0] tgtPages_33;
  reg [31:0] _GEN_626;
  reg [2:0] tgtPages_34;
  reg [31:0] _GEN_627;
  reg [2:0] tgtPages_35;
  reg [31:0] _GEN_628;
  reg [2:0] tgtPages_36;
  reg [31:0] _GEN_629;
  reg [2:0] tgtPages_37;
  reg [31:0] _GEN_630;
  reg [2:0] tgtPages_38;
  reg [31:0] _GEN_631;
  reg [2:0] tgtPages_39;
  reg [31:0] _GEN_632;
  reg [26:0] pages_0;
  reg [31:0] _GEN_633;
  reg [26:0] pages_1;
  reg [31:0] _GEN_634;
  reg [26:0] pages_2;
  reg [31:0] _GEN_635;
  reg [26:0] pages_3;
  reg [31:0] _GEN_636;
  reg [26:0] pages_4;
  reg [31:0] _GEN_637;
  reg [26:0] pages_5;
  reg [31:0] _GEN_638;
  reg [5:0] pageValid;
  reg [31:0] _GEN_639;
  wire [7:0] _T_617;
  wire [5:0] idxPagesOH_0;
  wire [7:0] _T_619;
  wire [5:0] idxPagesOH_1;
  wire [7:0] _T_621;
  wire [5:0] idxPagesOH_2;
  wire [7:0] _T_623;
  wire [5:0] idxPagesOH_3;
  wire [7:0] _T_625;
  wire [5:0] idxPagesOH_4;
  wire [7:0] _T_627;
  wire [5:0] idxPagesOH_5;
  wire [7:0] _T_629;
  wire [5:0] idxPagesOH_6;
  wire [7:0] _T_631;
  wire [5:0] idxPagesOH_7;
  wire [7:0] _T_633;
  wire [5:0] idxPagesOH_8;
  wire [7:0] _T_635;
  wire [5:0] idxPagesOH_9;
  wire [7:0] _T_637;
  wire [5:0] idxPagesOH_10;
  wire [7:0] _T_639;
  wire [5:0] idxPagesOH_11;
  wire [7:0] _T_641;
  wire [5:0] idxPagesOH_12;
  wire [7:0] _T_643;
  wire [5:0] idxPagesOH_13;
  wire [7:0] _T_645;
  wire [5:0] idxPagesOH_14;
  wire [7:0] _T_647;
  wire [5:0] idxPagesOH_15;
  wire [7:0] _T_649;
  wire [5:0] idxPagesOH_16;
  wire [7:0] _T_651;
  wire [5:0] idxPagesOH_17;
  wire [7:0] _T_653;
  wire [5:0] idxPagesOH_18;
  wire [7:0] _T_655;
  wire [5:0] idxPagesOH_19;
  wire [7:0] _T_657;
  wire [5:0] idxPagesOH_20;
  wire [7:0] _T_659;
  wire [5:0] idxPagesOH_21;
  wire [7:0] _T_661;
  wire [5:0] idxPagesOH_22;
  wire [7:0] _T_663;
  wire [5:0] idxPagesOH_23;
  wire [7:0] _T_665;
  wire [5:0] idxPagesOH_24;
  wire [7:0] _T_667;
  wire [5:0] idxPagesOH_25;
  wire [7:0] _T_669;
  wire [5:0] idxPagesOH_26;
  wire [7:0] _T_671;
  wire [5:0] idxPagesOH_27;
  wire [7:0] _T_673;
  wire [5:0] idxPagesOH_28;
  wire [7:0] _T_675;
  wire [5:0] idxPagesOH_29;
  wire [7:0] _T_677;
  wire [5:0] idxPagesOH_30;
  wire [7:0] _T_679;
  wire [5:0] idxPagesOH_31;
  wire [7:0] _T_681;
  wire [5:0] idxPagesOH_32;
  wire [7:0] _T_683;
  wire [5:0] idxPagesOH_33;
  wire [7:0] _T_685;
  wire [5:0] idxPagesOH_34;
  wire [7:0] _T_687;
  wire [5:0] idxPagesOH_35;
  wire [7:0] _T_689;
  wire [5:0] idxPagesOH_36;
  wire [7:0] _T_691;
  wire [5:0] idxPagesOH_37;
  wire [7:0] _T_693;
  wire [5:0] idxPagesOH_38;
  wire [7:0] _T_695;
  wire [5:0] idxPagesOH_39;
  wire [7:0] _T_697;
  wire [5:0] tgtPagesOH_0;
  wire [7:0] _T_699;
  wire [5:0] tgtPagesOH_1;
  wire [7:0] _T_701;
  wire [5:0] tgtPagesOH_2;
  wire [7:0] _T_703;
  wire [5:0] tgtPagesOH_3;
  wire [7:0] _T_705;
  wire [5:0] tgtPagesOH_4;
  wire [7:0] _T_707;
  wire [5:0] tgtPagesOH_5;
  wire [7:0] _T_709;
  wire [5:0] tgtPagesOH_6;
  wire [7:0] _T_711;
  wire [5:0] tgtPagesOH_7;
  wire [7:0] _T_713;
  wire [5:0] tgtPagesOH_8;
  wire [7:0] _T_715;
  wire [5:0] tgtPagesOH_9;
  wire [7:0] _T_717;
  wire [5:0] tgtPagesOH_10;
  wire [7:0] _T_719;
  wire [5:0] tgtPagesOH_11;
  wire [7:0] _T_721;
  wire [5:0] tgtPagesOH_12;
  wire [7:0] _T_723;
  wire [5:0] tgtPagesOH_13;
  wire [7:0] _T_725;
  wire [5:0] tgtPagesOH_14;
  wire [7:0] _T_727;
  wire [5:0] tgtPagesOH_15;
  wire [7:0] _T_729;
  wire [5:0] tgtPagesOH_16;
  wire [7:0] _T_731;
  wire [5:0] tgtPagesOH_17;
  wire [7:0] _T_733;
  wire [5:0] tgtPagesOH_18;
  wire [7:0] _T_735;
  wire [5:0] tgtPagesOH_19;
  wire [7:0] _T_737;
  wire [5:0] tgtPagesOH_20;
  wire [7:0] _T_739;
  wire [5:0] tgtPagesOH_21;
  wire [7:0] _T_741;
  wire [5:0] tgtPagesOH_22;
  wire [7:0] _T_743;
  wire [5:0] tgtPagesOH_23;
  wire [7:0] _T_745;
  wire [5:0] tgtPagesOH_24;
  wire [7:0] _T_747;
  wire [5:0] tgtPagesOH_25;
  wire [7:0] _T_749;
  wire [5:0] tgtPagesOH_26;
  wire [7:0] _T_751;
  wire [5:0] tgtPagesOH_27;
  wire [7:0] _T_753;
  wire [5:0] tgtPagesOH_28;
  wire [7:0] _T_755;
  wire [5:0] tgtPagesOH_29;
  wire [7:0] _T_757;
  wire [5:0] tgtPagesOH_30;
  wire [7:0] _T_759;
  wire [5:0] tgtPagesOH_31;
  wire [7:0] _T_761;
  wire [5:0] tgtPagesOH_32;
  wire [7:0] _T_763;
  wire [5:0] tgtPagesOH_33;
  wire [7:0] _T_765;
  wire [5:0] tgtPagesOH_34;
  wire [7:0] _T_767;
  wire [5:0] tgtPagesOH_35;
  wire [7:0] _T_769;
  wire [5:0] tgtPagesOH_36;
  wire [7:0] _T_771;
  wire [5:0] tgtPagesOH_37;
  wire [7:0] _T_773;
  wire [5:0] tgtPagesOH_38;
  wire [7:0] _T_775;
  wire [5:0] tgtPagesOH_39;
  reg [39:0] isValid;
  reg [63:0] _GEN_640;
  reg [39:0] isReturn;
  reg [63:0] _GEN_641;
  reg [39:0] isJump;
  reg [63:0] _GEN_642;
  reg [1:0] brIdx_0;
  reg [31:0] _GEN_643;
  reg [1:0] brIdx_1;
  reg [31:0] _GEN_644;
  reg [1:0] brIdx_2;
  reg [31:0] _GEN_645;
  reg [1:0] brIdx_3;
  reg [31:0] _GEN_646;
  reg [1:0] brIdx_4;
  reg [31:0] _GEN_647;
  reg [1:0] brIdx_5;
  reg [31:0] _GEN_648;
  reg [1:0] brIdx_6;
  reg [31:0] _GEN_649;
  reg [1:0] brIdx_7;
  reg [31:0] _GEN_650;
  reg [1:0] brIdx_8;
  reg [31:0] _GEN_651;
  reg [1:0] brIdx_9;
  reg [31:0] _GEN_652;
  reg [1:0] brIdx_10;
  reg [31:0] _GEN_653;
  reg [1:0] brIdx_11;
  reg [31:0] _GEN_654;
  reg [1:0] brIdx_12;
  reg [31:0] _GEN_655;
  reg [1:0] brIdx_13;
  reg [31:0] _GEN_656;
  reg [1:0] brIdx_14;
  reg [31:0] _GEN_657;
  reg [1:0] brIdx_15;
  reg [31:0] _GEN_658;
  reg [1:0] brIdx_16;
  reg [31:0] _GEN_659;
  reg [1:0] brIdx_17;
  reg [31:0] _GEN_660;
  reg [1:0] brIdx_18;
  reg [31:0] _GEN_661;
  reg [1:0] brIdx_19;
  reg [31:0] _GEN_662;
  reg [1:0] brIdx_20;
  reg [31:0] _GEN_663;
  reg [1:0] brIdx_21;
  reg [31:0] _GEN_664;
  reg [1:0] brIdx_22;
  reg [31:0] _GEN_665;
  reg [1:0] brIdx_23;
  reg [31:0] _GEN_666;
  reg [1:0] brIdx_24;
  reg [31:0] _GEN_667;
  reg [1:0] brIdx_25;
  reg [31:0] _GEN_668;
  reg [1:0] brIdx_26;
  reg [31:0] _GEN_669;
  reg [1:0] brIdx_27;
  reg [31:0] _GEN_670;
  reg [1:0] brIdx_28;
  reg [31:0] _GEN_671;
  reg [1:0] brIdx_29;
  reg [31:0] _GEN_672;
  reg [1:0] brIdx_30;
  reg [31:0] _GEN_673;
  reg [1:0] brIdx_31;
  reg [31:0] _GEN_674;
  reg [1:0] brIdx_32;
  reg [31:0] _GEN_675;
  reg [1:0] brIdx_33;
  reg [31:0] _GEN_676;
  reg [1:0] brIdx_34;
  reg [31:0] _GEN_677;
  reg [1:0] brIdx_35;
  reg [31:0] _GEN_678;
  reg [1:0] brIdx_36;
  reg [31:0] _GEN_679;
  reg [1:0] brIdx_37;
  reg [31:0] _GEN_680;
  reg [1:0] brIdx_38;
  reg [31:0] _GEN_681;
  reg [1:0] brIdx_39;
  reg [31:0] _GEN_682;
  reg  _T_785;
  reg [31:0] _GEN_683;
  reg  _T_824_prediction_valid;
  reg [31:0] _GEN_684;
  reg  _T_824_prediction_bits_taken;
  reg [31:0] _GEN_685;
  reg [3:0] _T_824_prediction_bits_mask;
  reg [31:0] _GEN_686;
  reg [1:0] _T_824_prediction_bits_bridx;
  reg [31:0] _GEN_687;
  reg [38:0] _T_824_prediction_bits_target;
  reg [63:0] _GEN_688;
  reg [5:0] _T_824_prediction_bits_entry;
  reg [31:0] _GEN_689;
  reg [6:0] _T_824_prediction_bits_bht_history;
  reg [31:0] _GEN_690;
  reg [1:0] _T_824_prediction_bits_bht_value;
  reg [31:0] _GEN_691;
  reg [38:0] _T_824_pc;
  reg [63:0] _GEN_692;
  reg [38:0] _T_824_target;
  reg [63:0] _GEN_693;
  reg  _T_824_taken;
  reg [31:0] _GEN_694;
  reg  _T_824_isValid;
  reg [31:0] _GEN_695;
  reg  _T_824_isJump;
  reg [31:0] _GEN_696;
  reg  _T_824_isReturn;
  reg [31:0] _GEN_697;
  reg [38:0] _T_824_br_pc;
  reg [63:0] _GEN_698;
  wire  _GEN_7;
  wire  _GEN_8;
  wire [3:0] _GEN_9;
  wire [1:0] _GEN_10;
  wire [38:0] _GEN_11;
  wire [5:0] _GEN_12;
  wire [6:0] _GEN_13;
  wire [1:0] _GEN_14;
  wire [38:0] _GEN_15;
  wire [38:0] _GEN_16;
  wire  _GEN_17;
  wire  _GEN_18;
  wire  _GEN_19;
  wire  _GEN_20;
  wire [38:0] _GEN_21;
  wire  r_btb_update_valid;
  wire  r_btb_update_bits_prediction_valid;
  wire  r_btb_update_bits_prediction_bits_taken;
  wire [3:0] r_btb_update_bits_prediction_bits_mask;
  wire [1:0] r_btb_update_bits_prediction_bits_bridx;
  wire [38:0] r_btb_update_bits_prediction_bits_target;
  wire [5:0] r_btb_update_bits_prediction_bits_entry;
  wire [6:0] r_btb_update_bits_prediction_bits_bht_history;
  wire [1:0] r_btb_update_bits_prediction_bits_bht_value;
  wire [38:0] r_btb_update_bits_pc;
  wire [38:0] r_btb_update_bits_target;
  wire  r_btb_update_bits_taken;
  wire  r_btb_update_bits_isValid;
  wire  r_btb_update_bits_isJump;
  wire  r_btb_update_bits_isReturn;
  wire [38:0] r_btb_update_bits_br_pc;
  wire [26:0] _T_1017;
  wire  _T_1018;
  wire  _T_1019;
  wire  _T_1020;
  wire  _T_1021;
  wire  _T_1022;
  wire  _T_1023;
  wire [1:0] _T_1024;
  wire [2:0] _T_1025;
  wire [1:0] _T_1026;
  wire [2:0] _T_1027;
  wire [5:0] _T_1028;
  wire [5:0] pageHit;
  wire [9:0] _T_1029;
  wire  _T_1030;
  wire  _T_1032;
  wire  _T_1034;
  wire  _T_1036;
  wire  _T_1038;
  wire  _T_1040;
  wire  _T_1042;
  wire  _T_1044;
  wire  _T_1046;
  wire  _T_1048;
  wire  _T_1050;
  wire  _T_1052;
  wire  _T_1054;
  wire  _T_1056;
  wire  _T_1058;
  wire  _T_1060;
  wire  _T_1062;
  wire  _T_1064;
  wire  _T_1066;
  wire  _T_1068;
  wire  _T_1070;
  wire  _T_1072;
  wire  _T_1074;
  wire  _T_1076;
  wire  _T_1078;
  wire  _T_1080;
  wire  _T_1082;
  wire  _T_1084;
  wire  _T_1086;
  wire  _T_1088;
  wire  _T_1090;
  wire  _T_1092;
  wire  _T_1094;
  wire  _T_1096;
  wire  _T_1098;
  wire  _T_1100;
  wire  _T_1102;
  wire  _T_1104;
  wire  _T_1106;
  wire  _T_1108;
  wire [1:0] _T_1109;
  wire [1:0] _T_1110;
  wire [2:0] _T_1111;
  wire [4:0] _T_1112;
  wire [1:0] _T_1113;
  wire [1:0] _T_1114;
  wire [2:0] _T_1115;
  wire [4:0] _T_1116;
  wire [9:0] _T_1117;
  wire [1:0] _T_1118;
  wire [1:0] _T_1119;
  wire [2:0] _T_1120;
  wire [4:0] _T_1121;
  wire [1:0] _T_1122;
  wire [1:0] _T_1123;
  wire [2:0] _T_1124;
  wire [4:0] _T_1125;
  wire [9:0] _T_1126;
  wire [19:0] _T_1127;
  wire [1:0] _T_1128;
  wire [1:0] _T_1129;
  wire [2:0] _T_1130;
  wire [4:0] _T_1131;
  wire [1:0] _T_1132;
  wire [1:0] _T_1133;
  wire [2:0] _T_1134;
  wire [4:0] _T_1135;
  wire [9:0] _T_1136;
  wire [1:0] _T_1137;
  wire [1:0] _T_1138;
  wire [2:0] _T_1139;
  wire [4:0] _T_1140;
  wire [1:0] _T_1141;
  wire [1:0] _T_1142;
  wire [2:0] _T_1143;
  wire [4:0] _T_1144;
  wire [9:0] _T_1145;
  wire [19:0] _T_1146;
  wire [39:0] _T_1147;
  wire [5:0] _T_1148;
  wire [5:0] _T_1149;
  wire [5:0] _T_1150;
  wire [5:0] _T_1151;
  wire [5:0] _T_1152;
  wire [5:0] _T_1153;
  wire [5:0] _T_1154;
  wire [5:0] _T_1155;
  wire [5:0] _T_1156;
  wire [5:0] _T_1157;
  wire [5:0] _T_1158;
  wire [5:0] _T_1159;
  wire [5:0] _T_1160;
  wire [5:0] _T_1161;
  wire [5:0] _T_1162;
  wire [5:0] _T_1163;
  wire [5:0] _T_1164;
  wire [5:0] _T_1165;
  wire [5:0] _T_1166;
  wire [5:0] _T_1167;
  wire [5:0] _T_1168;
  wire [5:0] _T_1169;
  wire [5:0] _T_1170;
  wire [5:0] _T_1171;
  wire [5:0] _T_1172;
  wire [5:0] _T_1173;
  wire [5:0] _T_1174;
  wire [5:0] _T_1175;
  wire [5:0] _T_1176;
  wire [5:0] _T_1177;
  wire [5:0] _T_1178;
  wire [5:0] _T_1179;
  wire [5:0] _T_1180;
  wire [5:0] _T_1181;
  wire [5:0] _T_1182;
  wire [5:0] _T_1183;
  wire [5:0] _T_1184;
  wire [5:0] _T_1185;
  wire [5:0] _T_1186;
  wire [5:0] _T_1187;
  wire  _T_1189;
  wire  _T_1191;
  wire  _T_1193;
  wire  _T_1195;
  wire  _T_1197;
  wire  _T_1199;
  wire  _T_1201;
  wire  _T_1203;
  wire  _T_1205;
  wire  _T_1207;
  wire  _T_1209;
  wire  _T_1211;
  wire  _T_1213;
  wire  _T_1215;
  wire  _T_1217;
  wire  _T_1219;
  wire  _T_1221;
  wire  _T_1223;
  wire  _T_1225;
  wire  _T_1227;
  wire  _T_1229;
  wire  _T_1231;
  wire  _T_1233;
  wire  _T_1235;
  wire  _T_1237;
  wire  _T_1239;
  wire  _T_1241;
  wire  _T_1243;
  wire  _T_1245;
  wire  _T_1247;
  wire  _T_1249;
  wire  _T_1251;
  wire  _T_1253;
  wire  _T_1255;
  wire  _T_1257;
  wire  _T_1259;
  wire  _T_1261;
  wire  _T_1263;
  wire  _T_1265;
  wire  _T_1267;
  wire [1:0] _T_1268;
  wire [1:0] _T_1269;
  wire [2:0] _T_1270;
  wire [4:0] _T_1271;
  wire [1:0] _T_1272;
  wire [1:0] _T_1273;
  wire [2:0] _T_1274;
  wire [4:0] _T_1275;
  wire [9:0] _T_1276;
  wire [1:0] _T_1277;
  wire [1:0] _T_1278;
  wire [2:0] _T_1279;
  wire [4:0] _T_1280;
  wire [1:0] _T_1281;
  wire [1:0] _T_1282;
  wire [2:0] _T_1283;
  wire [4:0] _T_1284;
  wire [9:0] _T_1285;
  wire [19:0] _T_1286;
  wire [1:0] _T_1287;
  wire [1:0] _T_1288;
  wire [2:0] _T_1289;
  wire [4:0] _T_1290;
  wire [1:0] _T_1291;
  wire [1:0] _T_1292;
  wire [2:0] _T_1293;
  wire [4:0] _T_1294;
  wire [9:0] _T_1295;
  wire [1:0] _T_1296;
  wire [1:0] _T_1297;
  wire [2:0] _T_1298;
  wire [4:0] _T_1299;
  wire [1:0] _T_1300;
  wire [1:0] _T_1301;
  wire [2:0] _T_1302;
  wire [4:0] _T_1303;
  wire [9:0] _T_1304;
  wire [19:0] _T_1305;
  wire [39:0] _T_1306;
  wire [39:0] _T_1307;
  wire [39:0] hits;
  wire [26:0] _T_1308;
  wire  _T_1309;
  wire  _T_1310;
  wire  _T_1311;
  wire  _T_1312;
  wire  _T_1313;
  wire  _T_1314;
  wire [1:0] _T_1315;
  wire [2:0] _T_1316;
  wire [1:0] _T_1317;
  wire [2:0] _T_1318;
  wire [5:0] _T_1319;
  wire [5:0] updatePageHit;
  wire [9:0] _T_1320;
  wire  _T_1600;
  wire  _T_1601;
  reg [5:0] nextRepl;
  reg [31:0] _GEN_699;
  wire  _T_1604;
  wire [6:0] _T_1606;
  wire [5:0] _T_1607;
  wire [5:0] _GEN_22;
  wire [5:0] _GEN_23;
  wire  useUpdatePageHit;
  wire  usePageHit;
  wire  doIdxPageRepl;
  reg [2:0] nextPageRepl;
  reg [31:0] _GEN_700;
  wire [4:0] _T_1614;
  wire  _T_1615;
  wire [5:0] _T_1616;
  wire [7:0] _T_1618;
  wire [7:0] idxPageRepl;
  wire [7:0] idxPageUpdateOH;
  wire [3:0] _T_1619;
  wire [3:0] _T_1620;
  wire  _T_1622;
  wire [3:0] _T_1623;
  wire [1:0] _T_1624;
  wire [1:0] _T_1625;
  wire  _T_1627;
  wire [1:0] _T_1628;
  wire  _T_1629;
  wire [1:0] _T_1630;
  wire [2:0] idxPageUpdate;
  wire [7:0] idxPageReplEn;
  wire  samePage;
  wire  _T_1635;
  wire  _T_1637;
  wire  doTgtPageRepl;
  wire [4:0] _T_1638;
  wire  _T_1639;
  wire [5:0] _T_1640;
  wire [7:0] tgtPageRepl;
  wire [7:0] _T_1641;
  wire [3:0] _T_1642;
  wire [3:0] _T_1643;
  wire  _T_1645;
  wire [3:0] _T_1646;
  wire [1:0] _T_1647;
  wire [1:0] _T_1648;
  wire  _T_1650;
  wire [1:0] _T_1651;
  wire  _T_1652;
  wire [1:0] _T_1653;
  wire [2:0] tgtPageUpdate;
  wire [7:0] tgtPageReplEn;
  wire  _T_1655;
  wire  _T_1656;
  wire  _T_1657;
  wire [1:0] _T_1660;
  wire [2:0] _GEN_476;
  wire [3:0] _T_1661;
  wire [2:0] _T_1662;
  wire  _T_1664;
  wire  _T_1665;
  wire [2:0] _T_1667;
  wire [2:0] _GEN_24;
  wire [5:0] _T_1668;
  wire [63:0] _T_1670;
  wire [9:0] _GEN_0;
  wire [9:0] _GEN_25;
  wire [9:0] _GEN_26;
  wire [9:0] _GEN_27;
  wire [9:0] _GEN_28;
  wire [9:0] _GEN_29;
  wire [9:0] _GEN_30;
  wire [9:0] _GEN_31;
  wire [9:0] _GEN_32;
  wire [9:0] _GEN_33;
  wire [9:0] _GEN_34;
  wire [9:0] _GEN_35;
  wire [9:0] _GEN_36;
  wire [9:0] _GEN_37;
  wire [9:0] _GEN_38;
  wire [9:0] _GEN_39;
  wire [9:0] _GEN_40;
  wire [9:0] _GEN_41;
  wire [9:0] _GEN_42;
  wire [9:0] _GEN_43;
  wire [9:0] _GEN_44;
  wire [9:0] _GEN_45;
  wire [9:0] _GEN_46;
  wire [9:0] _GEN_47;
  wire [9:0] _GEN_48;
  wire [9:0] _GEN_49;
  wire [9:0] _GEN_50;
  wire [9:0] _GEN_51;
  wire [9:0] _GEN_52;
  wire [9:0] _GEN_53;
  wire [9:0] _GEN_54;
  wire [9:0] _GEN_55;
  wire [9:0] _GEN_56;
  wire [9:0] _GEN_57;
  wire [9:0] _GEN_58;
  wire [9:0] _GEN_59;
  wire [9:0] _GEN_60;
  wire [9:0] _GEN_61;
  wire [9:0] _GEN_62;
  wire [9:0] _GEN_63;
  wire [9:0] _GEN_64;
  wire [9:0] _GEN_1;
  wire [9:0] _GEN_65;
  wire [9:0] _GEN_66;
  wire [9:0] _GEN_67;
  wire [9:0] _GEN_68;
  wire [9:0] _GEN_69;
  wire [9:0] _GEN_70;
  wire [9:0] _GEN_71;
  wire [9:0] _GEN_72;
  wire [9:0] _GEN_73;
  wire [9:0] _GEN_74;
  wire [9:0] _GEN_75;
  wire [9:0] _GEN_76;
  wire [9:0] _GEN_77;
  wire [9:0] _GEN_78;
  wire [9:0] _GEN_79;
  wire [9:0] _GEN_80;
  wire [9:0] _GEN_81;
  wire [9:0] _GEN_82;
  wire [9:0] _GEN_83;
  wire [9:0] _GEN_84;
  wire [9:0] _GEN_85;
  wire [9:0] _GEN_86;
  wire [9:0] _GEN_87;
  wire [9:0] _GEN_88;
  wire [9:0] _GEN_89;
  wire [9:0] _GEN_90;
  wire [9:0] _GEN_91;
  wire [9:0] _GEN_92;
  wire [9:0] _GEN_93;
  wire [9:0] _GEN_94;
  wire [9:0] _GEN_95;
  wire [9:0] _GEN_96;
  wire [9:0] _GEN_97;
  wire [9:0] _GEN_98;
  wire [9:0] _GEN_99;
  wire [9:0] _GEN_100;
  wire [9:0] _GEN_101;
  wire [9:0] _GEN_102;
  wire [9:0] _GEN_103;
  wire [9:0] _GEN_104;
  wire [2:0] _GEN_2;
  wire [2:0] _GEN_105;
  wire [2:0] _GEN_106;
  wire [2:0] _GEN_107;
  wire [2:0] _GEN_108;
  wire [2:0] _GEN_109;
  wire [2:0] _GEN_110;
  wire [2:0] _GEN_111;
  wire [2:0] _GEN_112;
  wire [2:0] _GEN_113;
  wire [2:0] _GEN_114;
  wire [2:0] _GEN_115;
  wire [2:0] _GEN_116;
  wire [2:0] _GEN_117;
  wire [2:0] _GEN_118;
  wire [2:0] _GEN_119;
  wire [2:0] _GEN_120;
  wire [2:0] _GEN_121;
  wire [2:0] _GEN_122;
  wire [2:0] _GEN_123;
  wire [2:0] _GEN_124;
  wire [2:0] _GEN_125;
  wire [2:0] _GEN_126;
  wire [2:0] _GEN_127;
  wire [2:0] _GEN_128;
  wire [2:0] _GEN_129;
  wire [2:0] _GEN_130;
  wire [2:0] _GEN_131;
  wire [2:0] _GEN_132;
  wire [2:0] _GEN_133;
  wire [2:0] _GEN_134;
  wire [2:0] _GEN_135;
  wire [2:0] _GEN_136;
  wire [2:0] _GEN_137;
  wire [2:0] _GEN_138;
  wire [2:0] _GEN_139;
  wire [2:0] _GEN_140;
  wire [2:0] _GEN_141;
  wire [2:0] _GEN_142;
  wire [2:0] _GEN_143;
  wire [2:0] _GEN_144;
  wire [2:0] _GEN_3;
  wire [2:0] _GEN_145;
  wire [2:0] _GEN_146;
  wire [2:0] _GEN_147;
  wire [2:0] _GEN_148;
  wire [2:0] _GEN_149;
  wire [2:0] _GEN_150;
  wire [2:0] _GEN_151;
  wire [2:0] _GEN_152;
  wire [2:0] _GEN_153;
  wire [2:0] _GEN_154;
  wire [2:0] _GEN_155;
  wire [2:0] _GEN_156;
  wire [2:0] _GEN_157;
  wire [2:0] _GEN_158;
  wire [2:0] _GEN_159;
  wire [2:0] _GEN_160;
  wire [2:0] _GEN_161;
  wire [2:0] _GEN_162;
  wire [2:0] _GEN_163;
  wire [2:0] _GEN_164;
  wire [2:0] _GEN_165;
  wire [2:0] _GEN_166;
  wire [2:0] _GEN_167;
  wire [2:0] _GEN_168;
  wire [2:0] _GEN_169;
  wire [2:0] _GEN_170;
  wire [2:0] _GEN_171;
  wire [2:0] _GEN_172;
  wire [2:0] _GEN_173;
  wire [2:0] _GEN_174;
  wire [2:0] _GEN_175;
  wire [2:0] _GEN_176;
  wire [2:0] _GEN_177;
  wire [2:0] _GEN_178;
  wire [2:0] _GEN_179;
  wire [2:0] _GEN_180;
  wire [2:0] _GEN_181;
  wire [2:0] _GEN_182;
  wire [2:0] _GEN_183;
  wire [2:0] _GEN_184;
  wire [63:0] _GEN_477;
  wire [63:0] _T_1673;
  wire [63:0] _T_1674;
  wire [63:0] _T_1675;
  wire [63:0] _T_1676;
  wire [63:0] _GEN_479;
  wire [63:0] _T_1677;
  wire [63:0] _T_1679;
  wire [63:0] _T_1680;
  wire [63:0] _GEN_481;
  wire [63:0] _T_1681;
  wire [63:0] _T_1683;
  wire [63:0] _T_1684;
  wire [36:0] _T_1685;
  wire [1:0] _GEN_4;
  wire [1:0] _GEN_185;
  wire [1:0] _GEN_186;
  wire [1:0] _GEN_187;
  wire [1:0] _GEN_188;
  wire [1:0] _GEN_189;
  wire [1:0] _GEN_190;
  wire [1:0] _GEN_191;
  wire [1:0] _GEN_192;
  wire [1:0] _GEN_193;
  wire [1:0] _GEN_194;
  wire [1:0] _GEN_195;
  wire [1:0] _GEN_196;
  wire [1:0] _GEN_197;
  wire [1:0] _GEN_198;
  wire [1:0] _GEN_199;
  wire [1:0] _GEN_200;
  wire [1:0] _GEN_201;
  wire [1:0] _GEN_202;
  wire [1:0] _GEN_203;
  wire [1:0] _GEN_204;
  wire [1:0] _GEN_205;
  wire [1:0] _GEN_206;
  wire [1:0] _GEN_207;
  wire [1:0] _GEN_208;
  wire [1:0] _GEN_209;
  wire [1:0] _GEN_210;
  wire [1:0] _GEN_211;
  wire [1:0] _GEN_212;
  wire [1:0] _GEN_213;
  wire [1:0] _GEN_214;
  wire [1:0] _GEN_215;
  wire [1:0] _GEN_216;
  wire [1:0] _GEN_217;
  wire [1:0] _GEN_218;
  wire [1:0] _GEN_219;
  wire [1:0] _GEN_220;
  wire [1:0] _GEN_221;
  wire [1:0] _GEN_222;
  wire [1:0] _GEN_223;
  wire [1:0] _GEN_224;
  wire  _T_1686;
  wire  _T_1688;
  wire [7:0] _T_1689;
  wire [26:0] _T_1692;
  wire  _T_1693;
  wire [26:0] _GEN_225;
  wire  _T_1694;
  wire [26:0] _GEN_226;
  wire  _T_1695;
  wire [26:0] _GEN_227;
  wire [7:0] _T_1696;
  wire [26:0] _T_1699;
  wire  _T_1700;
  wire [26:0] _GEN_228;
  wire  _T_1701;
  wire [26:0] _GEN_229;
  wire  _T_1702;
  wire [26:0] _GEN_230;
  wire [7:0] _GEN_483;
  wire [7:0] _T_1703;
  wire [7:0] _T_1704;
  wire [9:0] _GEN_231;
  wire [9:0] _GEN_232;
  wire [9:0] _GEN_233;
  wire [9:0] _GEN_234;
  wire [9:0] _GEN_235;
  wire [9:0] _GEN_236;
  wire [9:0] _GEN_237;
  wire [9:0] _GEN_238;
  wire [9:0] _GEN_239;
  wire [9:0] _GEN_240;
  wire [9:0] _GEN_241;
  wire [9:0] _GEN_242;
  wire [9:0] _GEN_243;
  wire [9:0] _GEN_244;
  wire [9:0] _GEN_245;
  wire [9:0] _GEN_246;
  wire [9:0] _GEN_247;
  wire [9:0] _GEN_248;
  wire [9:0] _GEN_249;
  wire [9:0] _GEN_250;
  wire [9:0] _GEN_251;
  wire [9:0] _GEN_252;
  wire [9:0] _GEN_253;
  wire [9:0] _GEN_254;
  wire [9:0] _GEN_255;
  wire [9:0] _GEN_256;
  wire [9:0] _GEN_257;
  wire [9:0] _GEN_258;
  wire [9:0] _GEN_259;
  wire [9:0] _GEN_260;
  wire [9:0] _GEN_261;
  wire [9:0] _GEN_262;
  wire [9:0] _GEN_263;
  wire [9:0] _GEN_264;
  wire [9:0] _GEN_265;
  wire [9:0] _GEN_266;
  wire [9:0] _GEN_267;
  wire [9:0] _GEN_268;
  wire [9:0] _GEN_269;
  wire [9:0] _GEN_270;
  wire [9:0] _GEN_271;
  wire [9:0] _GEN_272;
  wire [9:0] _GEN_273;
  wire [9:0] _GEN_274;
  wire [9:0] _GEN_275;
  wire [9:0] _GEN_276;
  wire [9:0] _GEN_277;
  wire [9:0] _GEN_278;
  wire [9:0] _GEN_279;
  wire [9:0] _GEN_280;
  wire [9:0] _GEN_281;
  wire [9:0] _GEN_282;
  wire [9:0] _GEN_283;
  wire [9:0] _GEN_284;
  wire [9:0] _GEN_285;
  wire [9:0] _GEN_286;
  wire [9:0] _GEN_287;
  wire [9:0] _GEN_288;
  wire [9:0] _GEN_289;
  wire [9:0] _GEN_290;
  wire [9:0] _GEN_291;
  wire [9:0] _GEN_292;
  wire [9:0] _GEN_293;
  wire [9:0] _GEN_294;
  wire [9:0] _GEN_295;
  wire [9:0] _GEN_296;
  wire [9:0] _GEN_297;
  wire [9:0] _GEN_298;
  wire [9:0] _GEN_299;
  wire [9:0] _GEN_300;
  wire [9:0] _GEN_301;
  wire [9:0] _GEN_302;
  wire [9:0] _GEN_303;
  wire [9:0] _GEN_304;
  wire [9:0] _GEN_305;
  wire [9:0] _GEN_306;
  wire [9:0] _GEN_307;
  wire [9:0] _GEN_308;
  wire [9:0] _GEN_309;
  wire [9:0] _GEN_310;
  wire [2:0] _GEN_311;
  wire [2:0] _GEN_312;
  wire [2:0] _GEN_313;
  wire [2:0] _GEN_314;
  wire [2:0] _GEN_315;
  wire [2:0] _GEN_316;
  wire [2:0] _GEN_317;
  wire [2:0] _GEN_318;
  wire [2:0] _GEN_319;
  wire [2:0] _GEN_320;
  wire [2:0] _GEN_321;
  wire [2:0] _GEN_322;
  wire [2:0] _GEN_323;
  wire [2:0] _GEN_324;
  wire [2:0] _GEN_325;
  wire [2:0] _GEN_326;
  wire [2:0] _GEN_327;
  wire [2:0] _GEN_328;
  wire [2:0] _GEN_329;
  wire [2:0] _GEN_330;
  wire [2:0] _GEN_331;
  wire [2:0] _GEN_332;
  wire [2:0] _GEN_333;
  wire [2:0] _GEN_334;
  wire [2:0] _GEN_335;
  wire [2:0] _GEN_336;
  wire [2:0] _GEN_337;
  wire [2:0] _GEN_338;
  wire [2:0] _GEN_339;
  wire [2:0] _GEN_340;
  wire [2:0] _GEN_341;
  wire [2:0] _GEN_342;
  wire [2:0] _GEN_343;
  wire [2:0] _GEN_344;
  wire [2:0] _GEN_345;
  wire [2:0] _GEN_346;
  wire [2:0] _GEN_347;
  wire [2:0] _GEN_348;
  wire [2:0] _GEN_349;
  wire [2:0] _GEN_350;
  wire [2:0] _GEN_351;
  wire [2:0] _GEN_352;
  wire [2:0] _GEN_353;
  wire [2:0] _GEN_354;
  wire [2:0] _GEN_355;
  wire [2:0] _GEN_356;
  wire [2:0] _GEN_357;
  wire [2:0] _GEN_358;
  wire [2:0] _GEN_359;
  wire [2:0] _GEN_360;
  wire [2:0] _GEN_361;
  wire [2:0] _GEN_362;
  wire [2:0] _GEN_363;
  wire [2:0] _GEN_364;
  wire [2:0] _GEN_365;
  wire [2:0] _GEN_366;
  wire [2:0] _GEN_367;
  wire [2:0] _GEN_368;
  wire [2:0] _GEN_369;
  wire [2:0] _GEN_370;
  wire [2:0] _GEN_371;
  wire [2:0] _GEN_372;
  wire [2:0] _GEN_373;
  wire [2:0] _GEN_374;
  wire [2:0] _GEN_375;
  wire [2:0] _GEN_376;
  wire [2:0] _GEN_377;
  wire [2:0] _GEN_378;
  wire [2:0] _GEN_379;
  wire [2:0] _GEN_380;
  wire [2:0] _GEN_381;
  wire [2:0] _GEN_382;
  wire [2:0] _GEN_383;
  wire [2:0] _GEN_384;
  wire [2:0] _GEN_385;
  wire [2:0] _GEN_386;
  wire [2:0] _GEN_387;
  wire [2:0] _GEN_388;
  wire [2:0] _GEN_389;
  wire [2:0] _GEN_390;
  wire [63:0] _GEN_391;
  wire [63:0] _GEN_392;
  wire [63:0] _GEN_393;
  wire [1:0] _GEN_394;
  wire [1:0] _GEN_395;
  wire [1:0] _GEN_396;
  wire [1:0] _GEN_397;
  wire [1:0] _GEN_398;
  wire [1:0] _GEN_399;
  wire [1:0] _GEN_400;
  wire [1:0] _GEN_401;
  wire [1:0] _GEN_402;
  wire [1:0] _GEN_403;
  wire [1:0] _GEN_404;
  wire [1:0] _GEN_405;
  wire [1:0] _GEN_406;
  wire [1:0] _GEN_407;
  wire [1:0] _GEN_408;
  wire [1:0] _GEN_409;
  wire [1:0] _GEN_410;
  wire [1:0] _GEN_411;
  wire [1:0] _GEN_412;
  wire [1:0] _GEN_413;
  wire [1:0] _GEN_414;
  wire [1:0] _GEN_415;
  wire [1:0] _GEN_416;
  wire [1:0] _GEN_417;
  wire [1:0] _GEN_418;
  wire [1:0] _GEN_419;
  wire [1:0] _GEN_420;
  wire [1:0] _GEN_421;
  wire [1:0] _GEN_422;
  wire [1:0] _GEN_423;
  wire [1:0] _GEN_424;
  wire [1:0] _GEN_425;
  wire [1:0] _GEN_426;
  wire [1:0] _GEN_427;
  wire [1:0] _GEN_428;
  wire [1:0] _GEN_429;
  wire [1:0] _GEN_430;
  wire [1:0] _GEN_431;
  wire [1:0] _GEN_432;
  wire [1:0] _GEN_433;
  wire [26:0] _GEN_434;
  wire [26:0] _GEN_435;
  wire [26:0] _GEN_436;
  wire [26:0] _GEN_437;
  wire [26:0] _GEN_438;
  wire [26:0] _GEN_439;
  wire [7:0] _GEN_440;
  wire  _T_1706;
  wire  _T_1708;
  wire  _T_1709;
  wire  _T_1710;
  wire  _T_1711;
  wire  _T_1712;
  wire  _T_1713;
  wire  _T_1714;
  wire  _T_1715;
  wire  _T_1716;
  wire  _T_1717;
  wire  _T_1718;
  wire  _T_1719;
  wire  _T_1720;
  wire  _T_1721;
  wire  _T_1722;
  wire  _T_1723;
  wire  _T_1724;
  wire  _T_1725;
  wire  _T_1726;
  wire  _T_1727;
  wire  _T_1728;
  wire  _T_1729;
  wire  _T_1730;
  wire  _T_1731;
  wire  _T_1732;
  wire  _T_1733;
  wire  _T_1734;
  wire  _T_1735;
  wire  _T_1736;
  wire  _T_1737;
  wire  _T_1738;
  wire  _T_1739;
  wire  _T_1740;
  wire  _T_1741;
  wire  _T_1742;
  wire  _T_1743;
  wire  _T_1744;
  wire  _T_1745;
  wire  _T_1746;
  wire  _T_1747;
  wire [5:0] _T_1749;
  wire [5:0] _T_1751;
  wire [5:0] _T_1753;
  wire [5:0] _T_1755;
  wire [5:0] _T_1757;
  wire [5:0] _T_1759;
  wire [5:0] _T_1761;
  wire [5:0] _T_1763;
  wire [5:0] _T_1765;
  wire [5:0] _T_1767;
  wire [5:0] _T_1769;
  wire [5:0] _T_1771;
  wire [5:0] _T_1773;
  wire [5:0] _T_1775;
  wire [5:0] _T_1777;
  wire [5:0] _T_1779;
  wire [5:0] _T_1781;
  wire [5:0] _T_1783;
  wire [5:0] _T_1785;
  wire [5:0] _T_1787;
  wire [5:0] _T_1789;
  wire [5:0] _T_1791;
  wire [5:0] _T_1793;
  wire [5:0] _T_1795;
  wire [5:0] _T_1797;
  wire [5:0] _T_1799;
  wire [5:0] _T_1801;
  wire [5:0] _T_1803;
  wire [5:0] _T_1805;
  wire [5:0] _T_1807;
  wire [5:0] _T_1809;
  wire [5:0] _T_1811;
  wire [5:0] _T_1813;
  wire [5:0] _T_1815;
  wire [5:0] _T_1817;
  wire [5:0] _T_1819;
  wire [5:0] _T_1821;
  wire [5:0] _T_1823;
  wire [5:0] _T_1825;
  wire [5:0] _T_1827;
  wire [5:0] _T_1829;
  wire [5:0] _T_1830;
  wire [5:0] _T_1831;
  wire [5:0] _T_1832;
  wire [5:0] _T_1833;
  wire [5:0] _T_1834;
  wire [5:0] _T_1835;
  wire [5:0] _T_1836;
  wire [5:0] _T_1837;
  wire [5:0] _T_1838;
  wire [5:0] _T_1839;
  wire [5:0] _T_1840;
  wire [5:0] _T_1841;
  wire [5:0] _T_1842;
  wire [5:0] _T_1843;
  wire [5:0] _T_1844;
  wire [5:0] _T_1845;
  wire [5:0] _T_1846;
  wire [5:0] _T_1847;
  wire [5:0] _T_1848;
  wire [5:0] _T_1849;
  wire [5:0] _T_1850;
  wire [5:0] _T_1851;
  wire [5:0] _T_1852;
  wire [5:0] _T_1853;
  wire [5:0] _T_1854;
  wire [5:0] _T_1855;
  wire [5:0] _T_1856;
  wire [5:0] _T_1857;
  wire [5:0] _T_1858;
  wire [5:0] _T_1859;
  wire [5:0] _T_1860;
  wire [5:0] _T_1861;
  wire [5:0] _T_1862;
  wire [5:0] _T_1863;
  wire [5:0] _T_1864;
  wire [5:0] _T_1865;
  wire [5:0] _T_1866;
  wire [5:0] _T_1867;
  wire [5:0] _T_1868;
  wire  _T_1869;
  wire  _T_1870;
  wire  _T_1871;
  wire  _T_1872;
  wire  _T_1873;
  wire  _T_1874;
  wire [26:0] _T_1876;
  wire [26:0] _T_1878;
  wire [26:0] _T_1880;
  wire [26:0] _T_1882;
  wire [26:0] _T_1884;
  wire [26:0] _T_1886;
  wire [26:0] _T_1888;
  wire [26:0] _T_1889;
  wire [26:0] _T_1890;
  wire [26:0] _T_1891;
  wire [26:0] _T_1892;
  wire [26:0] _T_1893;
  wire [9:0] _T_1935;
  wire [9:0] _T_1937;
  wire [9:0] _T_1939;
  wire [9:0] _T_1941;
  wire [9:0] _T_1943;
  wire [9:0] _T_1945;
  wire [9:0] _T_1947;
  wire [9:0] _T_1949;
  wire [9:0] _T_1951;
  wire [9:0] _T_1953;
  wire [9:0] _T_1955;
  wire [9:0] _T_1957;
  wire [9:0] _T_1959;
  wire [9:0] _T_1961;
  wire [9:0] _T_1963;
  wire [9:0] _T_1965;
  wire [9:0] _T_1967;
  wire [9:0] _T_1969;
  wire [9:0] _T_1971;
  wire [9:0] _T_1973;
  wire [9:0] _T_1975;
  wire [9:0] _T_1977;
  wire [9:0] _T_1979;
  wire [9:0] _T_1981;
  wire [9:0] _T_1983;
  wire [9:0] _T_1985;
  wire [9:0] _T_1987;
  wire [9:0] _T_1989;
  wire [9:0] _T_1991;
  wire [9:0] _T_1993;
  wire [9:0] _T_1995;
  wire [9:0] _T_1997;
  wire [9:0] _T_1999;
  wire [9:0] _T_2001;
  wire [9:0] _T_2003;
  wire [9:0] _T_2005;
  wire [9:0] _T_2007;
  wire [9:0] _T_2009;
  wire [9:0] _T_2011;
  wire [9:0] _T_2013;
  wire [9:0] _T_2015;
  wire [9:0] _T_2016;
  wire [9:0] _T_2017;
  wire [9:0] _T_2018;
  wire [9:0] _T_2019;
  wire [9:0] _T_2020;
  wire [9:0] _T_2021;
  wire [9:0] _T_2022;
  wire [9:0] _T_2023;
  wire [9:0] _T_2024;
  wire [9:0] _T_2025;
  wire [9:0] _T_2026;
  wire [9:0] _T_2027;
  wire [9:0] _T_2028;
  wire [9:0] _T_2029;
  wire [9:0] _T_2030;
  wire [9:0] _T_2031;
  wire [9:0] _T_2032;
  wire [9:0] _T_2033;
  wire [9:0] _T_2034;
  wire [9:0] _T_2035;
  wire [9:0] _T_2036;
  wire [9:0] _T_2037;
  wire [9:0] _T_2038;
  wire [9:0] _T_2039;
  wire [9:0] _T_2040;
  wire [9:0] _T_2041;
  wire [9:0] _T_2042;
  wire [9:0] _T_2043;
  wire [9:0] _T_2044;
  wire [9:0] _T_2045;
  wire [9:0] _T_2046;
  wire [9:0] _T_2047;
  wire [9:0] _T_2048;
  wire [9:0] _T_2049;
  wire [9:0] _T_2050;
  wire [9:0] _T_2051;
  wire [9:0] _T_2052;
  wire [9:0] _T_2053;
  wire [9:0] _T_2054;
  wire [11:0] _GEN_484;
  wire [11:0] _T_2055;
  wire [38:0] _T_2056;
  wire [7:0] _T_2057;
  wire [31:0] _T_2058;
  wire  _T_2060;
  wire [31:0] _GEN_485;
  wire [31:0] _T_2061;
  wire [15:0] _T_2062;
  wire [15:0] _T_2063;
  wire  _T_2065;
  wire [15:0] _T_2066;
  wire [7:0] _T_2067;
  wire [7:0] _T_2068;
  wire  _T_2070;
  wire [7:0] _T_2071;
  wire [3:0] _T_2072;
  wire [3:0] _T_2073;
  wire  _T_2075;
  wire [3:0] _T_2076;
  wire [1:0] _T_2077;
  wire [1:0] _T_2078;
  wire  _T_2080;
  wire [1:0] _T_2081;
  wire  _T_2082;
  wire [1:0] _T_2083;
  wire [2:0] _T_2084;
  wire [3:0] _T_2085;
  wire [4:0] _T_2086;
  wire [5:0] _T_2087;
  wire [1:0] _T_2129;
  wire [1:0] _T_2131;
  wire [1:0] _T_2133;
  wire [1:0] _T_2135;
  wire [1:0] _T_2137;
  wire [1:0] _T_2139;
  wire [1:0] _T_2141;
  wire [1:0] _T_2143;
  wire [1:0] _T_2145;
  wire [1:0] _T_2147;
  wire [1:0] _T_2149;
  wire [1:0] _T_2151;
  wire [1:0] _T_2153;
  wire [1:0] _T_2155;
  wire [1:0] _T_2157;
  wire [1:0] _T_2159;
  wire [1:0] _T_2161;
  wire [1:0] _T_2163;
  wire [1:0] _T_2165;
  wire [1:0] _T_2167;
  wire [1:0] _T_2169;
  wire [1:0] _T_2171;
  wire [1:0] _T_2173;
  wire [1:0] _T_2175;
  wire [1:0] _T_2177;
  wire [1:0] _T_2179;
  wire [1:0] _T_2181;
  wire [1:0] _T_2183;
  wire [1:0] _T_2185;
  wire [1:0] _T_2187;
  wire [1:0] _T_2189;
  wire [1:0] _T_2191;
  wire [1:0] _T_2193;
  wire [1:0] _T_2195;
  wire [1:0] _T_2197;
  wire [1:0] _T_2199;
  wire [1:0] _T_2201;
  wire [1:0] _T_2203;
  wire [1:0] _T_2205;
  wire [1:0] _T_2207;
  wire [1:0] _T_2209;
  wire [1:0] _T_2210;
  wire [1:0] _T_2211;
  wire [1:0] _T_2212;
  wire [1:0] _T_2213;
  wire [1:0] _T_2214;
  wire [1:0] _T_2215;
  wire [1:0] _T_2216;
  wire [1:0] _T_2217;
  wire [1:0] _T_2218;
  wire [1:0] _T_2219;
  wire [1:0] _T_2220;
  wire [1:0] _T_2221;
  wire [1:0] _T_2222;
  wire [1:0] _T_2223;
  wire [1:0] _T_2224;
  wire [1:0] _T_2225;
  wire [1:0] _T_2226;
  wire [1:0] _T_2227;
  wire [1:0] _T_2228;
  wire [1:0] _T_2229;
  wire [1:0] _T_2230;
  wire [1:0] _T_2231;
  wire [1:0] _T_2232;
  wire [1:0] _T_2233;
  wire [1:0] _T_2234;
  wire [1:0] _T_2235;
  wire [1:0] _T_2236;
  wire [1:0] _T_2237;
  wire [1:0] _T_2238;
  wire [1:0] _T_2239;
  wire [1:0] _T_2240;
  wire [1:0] _T_2241;
  wire [1:0] _T_2242;
  wire [1:0] _T_2243;
  wire [1:0] _T_2244;
  wire [1:0] _T_2245;
  wire [1:0] _T_2246;
  wire [1:0] _T_2247;
  wire [1:0] _T_2248;
  wire [1:0] _T_2250;
  wire [1:0] _T_2252;
  wire [1:0] _T_2253;
  wire [3:0] _T_2254;
  wire [4:0] _T_2256;
  wire [3:0] _T_2257;
  wire [4:0] _T_2259;
  wire [19:0] _T_2260;
  wire [9:0] _T_2261;
  wire [4:0] _T_2262;
  wire [1:0] _T_2263;
  wire  _T_2264;
  wire  _T_2267;
  wire  _T_2270;
  wire  _T_2272;
  wire [2:0] _T_2274;
  wire  _T_2275;
  wire [1:0] _T_2278;
  wire  _T_2279;
  wire  _T_2282;
  wire  _T_2285;
  wire  _T_2287;
  wire  _T_2289;
  wire  _T_2291;
  wire  _T_2292;
  wire  _T_2293;
  wire  _T_2294;
  wire  _T_2295;
  wire  _T_2296;
  wire [4:0] _T_2297;
  wire [1:0] _T_2298;
  wire  _T_2299;
  wire  _T_2302;
  wire  _T_2305;
  wire  _T_2307;
  wire [2:0] _T_2309;
  wire  _T_2310;
  wire [1:0] _T_2313;
  wire  _T_2314;
  wire  _T_2317;
  wire  _T_2320;
  wire  _T_2322;
  wire  _T_2324;
  wire  _T_2326;
  wire  _T_2327;
  wire  _T_2328;
  wire  _T_2329;
  wire  _T_2330;
  wire  _T_2331;
  wire  _T_2332;
  wire  _T_2333;
  wire  _T_2334;
  wire  _T_2335;
  wire [9:0] _T_2336;
  wire [4:0] _T_2337;
  wire [1:0] _T_2338;
  wire  _T_2339;
  wire  _T_2342;
  wire  _T_2345;
  wire  _T_2347;
  wire [2:0] _T_2349;
  wire  _T_2350;
  wire [1:0] _T_2353;
  wire  _T_2354;
  wire  _T_2357;
  wire  _T_2360;
  wire  _T_2362;
  wire  _T_2364;
  wire  _T_2366;
  wire  _T_2367;
  wire  _T_2368;
  wire  _T_2369;
  wire  _T_2370;
  wire  _T_2371;
  wire [4:0] _T_2372;
  wire [1:0] _T_2373;
  wire  _T_2374;
  wire  _T_2377;
  wire  _T_2380;
  wire  _T_2382;
  wire [2:0] _T_2384;
  wire  _T_2385;
  wire [1:0] _T_2388;
  wire  _T_2389;
  wire  _T_2392;
  wire  _T_2395;
  wire  _T_2397;
  wire  _T_2399;
  wire  _T_2401;
  wire  _T_2402;
  wire  _T_2403;
  wire  _T_2404;
  wire  _T_2405;
  wire  _T_2406;
  wire  _T_2407;
  wire  _T_2408;
  wire  _T_2409;
  wire  _T_2410;
  wire  _T_2411;
  wire  _T_2412;
  wire  _T_2413;
  wire  _T_2414;
  wire [19:0] _T_2415;
  wire [9:0] _T_2416;
  wire [4:0] _T_2417;
  wire [1:0] _T_2418;
  wire  _T_2419;
  wire  _T_2422;
  wire  _T_2425;
  wire  _T_2427;
  wire [2:0] _T_2429;
  wire  _T_2430;
  wire [1:0] _T_2433;
  wire  _T_2434;
  wire  _T_2437;
  wire  _T_2440;
  wire  _T_2442;
  wire  _T_2444;
  wire  _T_2446;
  wire  _T_2447;
  wire  _T_2448;
  wire  _T_2449;
  wire  _T_2450;
  wire  _T_2451;
  wire [4:0] _T_2452;
  wire [1:0] _T_2453;
  wire  _T_2454;
  wire  _T_2457;
  wire  _T_2460;
  wire  _T_2462;
  wire [2:0] _T_2464;
  wire  _T_2465;
  wire [1:0] _T_2468;
  wire  _T_2469;
  wire  _T_2472;
  wire  _T_2475;
  wire  _T_2477;
  wire  _T_2479;
  wire  _T_2481;
  wire  _T_2482;
  wire  _T_2483;
  wire  _T_2484;
  wire  _T_2485;
  wire  _T_2486;
  wire  _T_2487;
  wire  _T_2488;
  wire  _T_2489;
  wire  _T_2490;
  wire [9:0] _T_2491;
  wire [4:0] _T_2492;
  wire [1:0] _T_2493;
  wire  _T_2494;
  wire  _T_2497;
  wire  _T_2500;
  wire  _T_2502;
  wire [2:0] _T_2504;
  wire  _T_2505;
  wire [1:0] _T_2508;
  wire  _T_2509;
  wire  _T_2512;
  wire  _T_2515;
  wire  _T_2517;
  wire  _T_2519;
  wire  _T_2521;
  wire  _T_2522;
  wire  _T_2523;
  wire  _T_2524;
  wire  _T_2525;
  wire  _T_2526;
  wire [4:0] _T_2527;
  wire [1:0] _T_2528;
  wire  _T_2529;
  wire  _T_2532;
  wire  _T_2535;
  wire  _T_2537;
  wire [2:0] _T_2539;
  wire  _T_2540;
  wire [1:0] _T_2543;
  wire  _T_2544;
  wire  _T_2547;
  wire  _T_2550;
  wire  _T_2552;
  wire  _T_2554;
  wire  _T_2556;
  wire  _T_2557;
  wire  _T_2558;
  wire  _T_2559;
  wire  _T_2560;
  wire  _T_2561;
  wire  _T_2562;
  wire  _T_2563;
  wire  _T_2564;
  wire  _T_2565;
  wire  _T_2566;
  wire  _T_2567;
  wire  _T_2568;
  wire  _T_2569;
  wire  _T_2571;
  wire  _T_2572;
  wire  _T_2573;
  wire [39:0] _T_2574;
  wire [39:0] _T_2575;
  wire [63:0] _GEN_441;
  reg [1:0] _T_2578 [0:127];
  reg [31:0] _GEN_701;
  wire [1:0] _T_2578__T_2596_data;
  wire [6:0] _T_2578__T_2596_addr;
  wire [1:0] _T_2578__T_2603_data;
  wire [6:0] _T_2578__T_2603_addr;
  wire  _T_2578__T_2603_mask;
  wire  _T_2578__T_2603_en;
  reg [6:0] _T_2580;
  reg [31:0] _GEN_702;
  wire [39:0] _T_2581;
  wire  _T_2583;
  wire  _T_2585;
  wire  _T_2586;
  wire  _T_2587;
  wire [6:0] _T_2591_history;
  wire [1:0] _T_2591_value;
  wire [6:0] _T_2594;
  wire [6:0] _T_2595;
  wire  _T_2597;
  wire [5:0] _T_2598;
  wire [6:0] _T_2599;
  wire [6:0] _GEN_442;
  wire  _T_2600;
  wire [6:0] _T_2601;
  wire [6:0] _T_2602;
  wire  _T_2604;
  wire  _T_2605;
  wire  _T_2606;
  wire  _T_2609;
  wire  _T_2610;
  wire  _T_2611;
  wire [1:0] _T_2612;
  wire [5:0] _T_2613;
  wire [6:0] _T_2614;
  wire [6:0] _GEN_443;
  wire [6:0] _GEN_448;
  wire  _T_2617;
  wire  _T_2618;
  wire  _GEN_449;
  reg [1:0] _T_2621;
  reg [31:0] _GEN_703;
  reg  _T_2623;
  reg [31:0] _GEN_704;
  reg [38:0] _T_2627_0;
  reg [63:0] _GEN_705;
  reg [38:0] _T_2627_1;
  reg [63:0] _GEN_706;
  wire [39:0] _T_2629;
  wire  _T_2631;
  wire  _T_2633;
  wire  _T_2635;
  wire  _T_2636;
  wire [38:0] _GEN_5;
  wire [38:0] _GEN_450;
  wire [38:0] _GEN_451;
  wire  _T_2638;
  wire [2:0] _T_2640;
  wire [1:0] _T_2641;
  wire [1:0] _GEN_452;
  wire [1:0] _T_2647;
  wire  _T_2648;
  wire [38:0] _GEN_6;
  wire [38:0] _GEN_453;
  wire [38:0] _GEN_454;
  wire [38:0] _GEN_455;
  wire [1:0] _GEN_456;
  wire [38:0] _GEN_457;
  wire [38:0] _GEN_458;
  wire  _GEN_459;
  wire [38:0] _GEN_460;
  wire  _T_2651;
  wire  _T_2653;
  wire  _T_2654;
  wire [2:0] _T_2660;
  wire [1:0] _T_2661;
  wire [1:0] _T_2667;
  wire  _T_2668;
  wire [1:0] _GEN_461;
  wire  _GEN_462;
  wire [1:0] _GEN_463;
  wire  _GEN_464;
  wire [1:0] _GEN_465;
  wire [38:0] _GEN_466;
  wire [38:0] _GEN_467;
  wire  _GEN_468;
  wire [38:0] _GEN_469;
  assign io_resp_valid = _T_1706;
  assign io_resp_bits_taken = _GEN_449;
  assign io_resp_bits_mask = _T_2259[3:0];
  assign io_resp_bits_bridx = _T_2248;
  assign io_resp_bits_target = _GEN_469;
  assign io_resp_bits_entry = _T_2087;
  assign io_resp_bits_bht_history = _T_2591_history;
  assign io_resp_bits_bht_value = _T_2591_value;
  assign _T_617 = 8'h1 << idxPages_0;
  assign idxPagesOH_0 = _T_617[5:0];
  assign _T_619 = 8'h1 << idxPages_1;
  assign idxPagesOH_1 = _T_619[5:0];
  assign _T_621 = 8'h1 << idxPages_2;
  assign idxPagesOH_2 = _T_621[5:0];
  assign _T_623 = 8'h1 << idxPages_3;
  assign idxPagesOH_3 = _T_623[5:0];
  assign _T_625 = 8'h1 << idxPages_4;
  assign idxPagesOH_4 = _T_625[5:0];
  assign _T_627 = 8'h1 << idxPages_5;
  assign idxPagesOH_5 = _T_627[5:0];
  assign _T_629 = 8'h1 << idxPages_6;
  assign idxPagesOH_6 = _T_629[5:0];
  assign _T_631 = 8'h1 << idxPages_7;
  assign idxPagesOH_7 = _T_631[5:0];
  assign _T_633 = 8'h1 << idxPages_8;
  assign idxPagesOH_8 = _T_633[5:0];
  assign _T_635 = 8'h1 << idxPages_9;
  assign idxPagesOH_9 = _T_635[5:0];
  assign _T_637 = 8'h1 << idxPages_10;
  assign idxPagesOH_10 = _T_637[5:0];
  assign _T_639 = 8'h1 << idxPages_11;
  assign idxPagesOH_11 = _T_639[5:0];
  assign _T_641 = 8'h1 << idxPages_12;
  assign idxPagesOH_12 = _T_641[5:0];
  assign _T_643 = 8'h1 << idxPages_13;
  assign idxPagesOH_13 = _T_643[5:0];
  assign _T_645 = 8'h1 << idxPages_14;
  assign idxPagesOH_14 = _T_645[5:0];
  assign _T_647 = 8'h1 << idxPages_15;
  assign idxPagesOH_15 = _T_647[5:0];
  assign _T_649 = 8'h1 << idxPages_16;
  assign idxPagesOH_16 = _T_649[5:0];
  assign _T_651 = 8'h1 << idxPages_17;
  assign idxPagesOH_17 = _T_651[5:0];
  assign _T_653 = 8'h1 << idxPages_18;
  assign idxPagesOH_18 = _T_653[5:0];
  assign _T_655 = 8'h1 << idxPages_19;
  assign idxPagesOH_19 = _T_655[5:0];
  assign _T_657 = 8'h1 << idxPages_20;
  assign idxPagesOH_20 = _T_657[5:0];
  assign _T_659 = 8'h1 << idxPages_21;
  assign idxPagesOH_21 = _T_659[5:0];
  assign _T_661 = 8'h1 << idxPages_22;
  assign idxPagesOH_22 = _T_661[5:0];
  assign _T_663 = 8'h1 << idxPages_23;
  assign idxPagesOH_23 = _T_663[5:0];
  assign _T_665 = 8'h1 << idxPages_24;
  assign idxPagesOH_24 = _T_665[5:0];
  assign _T_667 = 8'h1 << idxPages_25;
  assign idxPagesOH_25 = _T_667[5:0];
  assign _T_669 = 8'h1 << idxPages_26;
  assign idxPagesOH_26 = _T_669[5:0];
  assign _T_671 = 8'h1 << idxPages_27;
  assign idxPagesOH_27 = _T_671[5:0];
  assign _T_673 = 8'h1 << idxPages_28;
  assign idxPagesOH_28 = _T_673[5:0];
  assign _T_675 = 8'h1 << idxPages_29;
  assign idxPagesOH_29 = _T_675[5:0];
  assign _T_677 = 8'h1 << idxPages_30;
  assign idxPagesOH_30 = _T_677[5:0];
  assign _T_679 = 8'h1 << idxPages_31;
  assign idxPagesOH_31 = _T_679[5:0];
  assign _T_681 = 8'h1 << idxPages_32;
  assign idxPagesOH_32 = _T_681[5:0];
  assign _T_683 = 8'h1 << idxPages_33;
  assign idxPagesOH_33 = _T_683[5:0];
  assign _T_685 = 8'h1 << idxPages_34;
  assign idxPagesOH_34 = _T_685[5:0];
  assign _T_687 = 8'h1 << idxPages_35;
  assign idxPagesOH_35 = _T_687[5:0];
  assign _T_689 = 8'h1 << idxPages_36;
  assign idxPagesOH_36 = _T_689[5:0];
  assign _T_691 = 8'h1 << idxPages_37;
  assign idxPagesOH_37 = _T_691[5:0];
  assign _T_693 = 8'h1 << idxPages_38;
  assign idxPagesOH_38 = _T_693[5:0];
  assign _T_695 = 8'h1 << idxPages_39;
  assign idxPagesOH_39 = _T_695[5:0];
  assign _T_697 = 8'h1 << tgtPages_0;
  assign tgtPagesOH_0 = _T_697[5:0];
  assign _T_699 = 8'h1 << tgtPages_1;
  assign tgtPagesOH_1 = _T_699[5:0];
  assign _T_701 = 8'h1 << tgtPages_2;
  assign tgtPagesOH_2 = _T_701[5:0];
  assign _T_703 = 8'h1 << tgtPages_3;
  assign tgtPagesOH_3 = _T_703[5:0];
  assign _T_705 = 8'h1 << tgtPages_4;
  assign tgtPagesOH_4 = _T_705[5:0];
  assign _T_707 = 8'h1 << tgtPages_5;
  assign tgtPagesOH_5 = _T_707[5:0];
  assign _T_709 = 8'h1 << tgtPages_6;
  assign tgtPagesOH_6 = _T_709[5:0];
  assign _T_711 = 8'h1 << tgtPages_7;
  assign tgtPagesOH_7 = _T_711[5:0];
  assign _T_713 = 8'h1 << tgtPages_8;
  assign tgtPagesOH_8 = _T_713[5:0];
  assign _T_715 = 8'h1 << tgtPages_9;
  assign tgtPagesOH_9 = _T_715[5:0];
  assign _T_717 = 8'h1 << tgtPages_10;
  assign tgtPagesOH_10 = _T_717[5:0];
  assign _T_719 = 8'h1 << tgtPages_11;
  assign tgtPagesOH_11 = _T_719[5:0];
  assign _T_721 = 8'h1 << tgtPages_12;
  assign tgtPagesOH_12 = _T_721[5:0];
  assign _T_723 = 8'h1 << tgtPages_13;
  assign tgtPagesOH_13 = _T_723[5:0];
  assign _T_725 = 8'h1 << tgtPages_14;
  assign tgtPagesOH_14 = _T_725[5:0];
  assign _T_727 = 8'h1 << tgtPages_15;
  assign tgtPagesOH_15 = _T_727[5:0];
  assign _T_729 = 8'h1 << tgtPages_16;
  assign tgtPagesOH_16 = _T_729[5:0];
  assign _T_731 = 8'h1 << tgtPages_17;
  assign tgtPagesOH_17 = _T_731[5:0];
  assign _T_733 = 8'h1 << tgtPages_18;
  assign tgtPagesOH_18 = _T_733[5:0];
  assign _T_735 = 8'h1 << tgtPages_19;
  assign tgtPagesOH_19 = _T_735[5:0];
  assign _T_737 = 8'h1 << tgtPages_20;
  assign tgtPagesOH_20 = _T_737[5:0];
  assign _T_739 = 8'h1 << tgtPages_21;
  assign tgtPagesOH_21 = _T_739[5:0];
  assign _T_741 = 8'h1 << tgtPages_22;
  assign tgtPagesOH_22 = _T_741[5:0];
  assign _T_743 = 8'h1 << tgtPages_23;
  assign tgtPagesOH_23 = _T_743[5:0];
  assign _T_745 = 8'h1 << tgtPages_24;
  assign tgtPagesOH_24 = _T_745[5:0];
  assign _T_747 = 8'h1 << tgtPages_25;
  assign tgtPagesOH_25 = _T_747[5:0];
  assign _T_749 = 8'h1 << tgtPages_26;
  assign tgtPagesOH_26 = _T_749[5:0];
  assign _T_751 = 8'h1 << tgtPages_27;
  assign tgtPagesOH_27 = _T_751[5:0];
  assign _T_753 = 8'h1 << tgtPages_28;
  assign tgtPagesOH_28 = _T_753[5:0];
  assign _T_755 = 8'h1 << tgtPages_29;
  assign tgtPagesOH_29 = _T_755[5:0];
  assign _T_757 = 8'h1 << tgtPages_30;
  assign tgtPagesOH_30 = _T_757[5:0];
  assign _T_759 = 8'h1 << tgtPages_31;
  assign tgtPagesOH_31 = _T_759[5:0];
  assign _T_761 = 8'h1 << tgtPages_32;
  assign tgtPagesOH_32 = _T_761[5:0];
  assign _T_763 = 8'h1 << tgtPages_33;
  assign tgtPagesOH_33 = _T_763[5:0];
  assign _T_765 = 8'h1 << tgtPages_34;
  assign tgtPagesOH_34 = _T_765[5:0];
  assign _T_767 = 8'h1 << tgtPages_35;
  assign tgtPagesOH_35 = _T_767[5:0];
  assign _T_769 = 8'h1 << tgtPages_36;
  assign tgtPagesOH_36 = _T_769[5:0];
  assign _T_771 = 8'h1 << tgtPages_37;
  assign tgtPagesOH_37 = _T_771[5:0];
  assign _T_773 = 8'h1 << tgtPages_38;
  assign tgtPagesOH_38 = _T_773[5:0];
  assign _T_775 = 8'h1 << tgtPages_39;
  assign tgtPagesOH_39 = _T_775[5:0];
  assign _GEN_7 = io_btb_update_valid ? io_btb_update_bits_prediction_valid : _T_824_prediction_valid;
  assign _GEN_8 = io_btb_update_valid ? io_btb_update_bits_prediction_bits_taken : _T_824_prediction_bits_taken;
  assign _GEN_9 = io_btb_update_valid ? io_btb_update_bits_prediction_bits_mask : _T_824_prediction_bits_mask;
  assign _GEN_10 = io_btb_update_valid ? io_btb_update_bits_prediction_bits_bridx : _T_824_prediction_bits_bridx;
  assign _GEN_11 = io_btb_update_valid ? io_btb_update_bits_prediction_bits_target : _T_824_prediction_bits_target;
  assign _GEN_12 = io_btb_update_valid ? io_btb_update_bits_prediction_bits_entry : _T_824_prediction_bits_entry;
  assign _GEN_13 = io_btb_update_valid ? io_btb_update_bits_prediction_bits_bht_history : _T_824_prediction_bits_bht_history;
  assign _GEN_14 = io_btb_update_valid ? io_btb_update_bits_prediction_bits_bht_value : _T_824_prediction_bits_bht_value;
  assign _GEN_15 = io_btb_update_valid ? io_btb_update_bits_pc : _T_824_pc;
  assign _GEN_16 = io_btb_update_valid ? io_btb_update_bits_target : _T_824_target;
  assign _GEN_17 = io_btb_update_valid ? io_btb_update_bits_taken : _T_824_taken;
  assign _GEN_18 = io_btb_update_valid ? io_btb_update_bits_isValid : _T_824_isValid;
  assign _GEN_19 = io_btb_update_valid ? io_btb_update_bits_isJump : _T_824_isJump;
  assign _GEN_20 = io_btb_update_valid ? io_btb_update_bits_isReturn : _T_824_isReturn;
  assign _GEN_21 = io_btb_update_valid ? io_btb_update_bits_br_pc : _T_824_br_pc;
  assign r_btb_update_valid = _T_785;
  assign r_btb_update_bits_prediction_valid = _T_824_prediction_valid;
  assign r_btb_update_bits_prediction_bits_taken = _T_824_prediction_bits_taken;
  assign r_btb_update_bits_prediction_bits_mask = _T_824_prediction_bits_mask;
  assign r_btb_update_bits_prediction_bits_bridx = _T_824_prediction_bits_bridx;
  assign r_btb_update_bits_prediction_bits_target = _T_824_prediction_bits_target;
  assign r_btb_update_bits_prediction_bits_entry = _T_824_prediction_bits_entry;
  assign r_btb_update_bits_prediction_bits_bht_history = _T_824_prediction_bits_bht_history;
  assign r_btb_update_bits_prediction_bits_bht_value = _T_824_prediction_bits_bht_value;
  assign r_btb_update_bits_pc = _T_824_pc;
  assign r_btb_update_bits_target = _T_824_target;
  assign r_btb_update_bits_taken = _T_824_taken;
  assign r_btb_update_bits_isValid = _T_824_isValid;
  assign r_btb_update_bits_isJump = _T_824_isJump;
  assign r_btb_update_bits_isReturn = _T_824_isReturn;
  assign r_btb_update_bits_br_pc = _T_824_br_pc;
  assign _T_1017 = io_req_bits_addr[38:12];
  assign _T_1018 = pages_0 == _T_1017;
  assign _T_1019 = pages_1 == _T_1017;
  assign _T_1020 = pages_2 == _T_1017;
  assign _T_1021 = pages_3 == _T_1017;
  assign _T_1022 = pages_4 == _T_1017;
  assign _T_1023 = pages_5 == _T_1017;
  assign _T_1024 = {_T_1020,_T_1019};
  assign _T_1025 = {_T_1024,_T_1018};
  assign _T_1026 = {_T_1023,_T_1022};
  assign _T_1027 = {_T_1026,_T_1021};
  assign _T_1028 = {_T_1027,_T_1025};
  assign pageHit = pageValid & _T_1028;
  assign _T_1029 = io_req_bits_addr[11:2];
  assign _T_1030 = idxs_0 == _T_1029;
  assign _T_1032 = idxs_1 == _T_1029;
  assign _T_1034 = idxs_2 == _T_1029;
  assign _T_1036 = idxs_3 == _T_1029;
  assign _T_1038 = idxs_4 == _T_1029;
  assign _T_1040 = idxs_5 == _T_1029;
  assign _T_1042 = idxs_6 == _T_1029;
  assign _T_1044 = idxs_7 == _T_1029;
  assign _T_1046 = idxs_8 == _T_1029;
  assign _T_1048 = idxs_9 == _T_1029;
  assign _T_1050 = idxs_10 == _T_1029;
  assign _T_1052 = idxs_11 == _T_1029;
  assign _T_1054 = idxs_12 == _T_1029;
  assign _T_1056 = idxs_13 == _T_1029;
  assign _T_1058 = idxs_14 == _T_1029;
  assign _T_1060 = idxs_15 == _T_1029;
  assign _T_1062 = idxs_16 == _T_1029;
  assign _T_1064 = idxs_17 == _T_1029;
  assign _T_1066 = idxs_18 == _T_1029;
  assign _T_1068 = idxs_19 == _T_1029;
  assign _T_1070 = idxs_20 == _T_1029;
  assign _T_1072 = idxs_21 == _T_1029;
  assign _T_1074 = idxs_22 == _T_1029;
  assign _T_1076 = idxs_23 == _T_1029;
  assign _T_1078 = idxs_24 == _T_1029;
  assign _T_1080 = idxs_25 == _T_1029;
  assign _T_1082 = idxs_26 == _T_1029;
  assign _T_1084 = idxs_27 == _T_1029;
  assign _T_1086 = idxs_28 == _T_1029;
  assign _T_1088 = idxs_29 == _T_1029;
  assign _T_1090 = idxs_30 == _T_1029;
  assign _T_1092 = idxs_31 == _T_1029;
  assign _T_1094 = idxs_32 == _T_1029;
  assign _T_1096 = idxs_33 == _T_1029;
  assign _T_1098 = idxs_34 == _T_1029;
  assign _T_1100 = idxs_35 == _T_1029;
  assign _T_1102 = idxs_36 == _T_1029;
  assign _T_1104 = idxs_37 == _T_1029;
  assign _T_1106 = idxs_38 == _T_1029;
  assign _T_1108 = idxs_39 == _T_1029;
  assign _T_1109 = {_T_1032,_T_1030};
  assign _T_1110 = {_T_1038,_T_1036};
  assign _T_1111 = {_T_1110,_T_1034};
  assign _T_1112 = {_T_1111,_T_1109};
  assign _T_1113 = {_T_1042,_T_1040};
  assign _T_1114 = {_T_1048,_T_1046};
  assign _T_1115 = {_T_1114,_T_1044};
  assign _T_1116 = {_T_1115,_T_1113};
  assign _T_1117 = {_T_1116,_T_1112};
  assign _T_1118 = {_T_1052,_T_1050};
  assign _T_1119 = {_T_1058,_T_1056};
  assign _T_1120 = {_T_1119,_T_1054};
  assign _T_1121 = {_T_1120,_T_1118};
  assign _T_1122 = {_T_1062,_T_1060};
  assign _T_1123 = {_T_1068,_T_1066};
  assign _T_1124 = {_T_1123,_T_1064};
  assign _T_1125 = {_T_1124,_T_1122};
  assign _T_1126 = {_T_1125,_T_1121};
  assign _T_1127 = {_T_1126,_T_1117};
  assign _T_1128 = {_T_1072,_T_1070};
  assign _T_1129 = {_T_1078,_T_1076};
  assign _T_1130 = {_T_1129,_T_1074};
  assign _T_1131 = {_T_1130,_T_1128};
  assign _T_1132 = {_T_1082,_T_1080};
  assign _T_1133 = {_T_1088,_T_1086};
  assign _T_1134 = {_T_1133,_T_1084};
  assign _T_1135 = {_T_1134,_T_1132};
  assign _T_1136 = {_T_1135,_T_1131};
  assign _T_1137 = {_T_1092,_T_1090};
  assign _T_1138 = {_T_1098,_T_1096};
  assign _T_1139 = {_T_1138,_T_1094};
  assign _T_1140 = {_T_1139,_T_1137};
  assign _T_1141 = {_T_1102,_T_1100};
  assign _T_1142 = {_T_1108,_T_1106};
  assign _T_1143 = {_T_1142,_T_1104};
  assign _T_1144 = {_T_1143,_T_1141};
  assign _T_1145 = {_T_1144,_T_1140};
  assign _T_1146 = {_T_1145,_T_1136};
  assign _T_1147 = {_T_1146,_T_1127};
  assign _T_1148 = idxPagesOH_0 & pageHit;
  assign _T_1149 = idxPagesOH_1 & pageHit;
  assign _T_1150 = idxPagesOH_2 & pageHit;
  assign _T_1151 = idxPagesOH_3 & pageHit;
  assign _T_1152 = idxPagesOH_4 & pageHit;
  assign _T_1153 = idxPagesOH_5 & pageHit;
  assign _T_1154 = idxPagesOH_6 & pageHit;
  assign _T_1155 = idxPagesOH_7 & pageHit;
  assign _T_1156 = idxPagesOH_8 & pageHit;
  assign _T_1157 = idxPagesOH_9 & pageHit;
  assign _T_1158 = idxPagesOH_10 & pageHit;
  assign _T_1159 = idxPagesOH_11 & pageHit;
  assign _T_1160 = idxPagesOH_12 & pageHit;
  assign _T_1161 = idxPagesOH_13 & pageHit;
  assign _T_1162 = idxPagesOH_14 & pageHit;
  assign _T_1163 = idxPagesOH_15 & pageHit;
  assign _T_1164 = idxPagesOH_16 & pageHit;
  assign _T_1165 = idxPagesOH_17 & pageHit;
  assign _T_1166 = idxPagesOH_18 & pageHit;
  assign _T_1167 = idxPagesOH_19 & pageHit;
  assign _T_1168 = idxPagesOH_20 & pageHit;
  assign _T_1169 = idxPagesOH_21 & pageHit;
  assign _T_1170 = idxPagesOH_22 & pageHit;
  assign _T_1171 = idxPagesOH_23 & pageHit;
  assign _T_1172 = idxPagesOH_24 & pageHit;
  assign _T_1173 = idxPagesOH_25 & pageHit;
  assign _T_1174 = idxPagesOH_26 & pageHit;
  assign _T_1175 = idxPagesOH_27 & pageHit;
  assign _T_1176 = idxPagesOH_28 & pageHit;
  assign _T_1177 = idxPagesOH_29 & pageHit;
  assign _T_1178 = idxPagesOH_30 & pageHit;
  assign _T_1179 = idxPagesOH_31 & pageHit;
  assign _T_1180 = idxPagesOH_32 & pageHit;
  assign _T_1181 = idxPagesOH_33 & pageHit;
  assign _T_1182 = idxPagesOH_34 & pageHit;
  assign _T_1183 = idxPagesOH_35 & pageHit;
  assign _T_1184 = idxPagesOH_36 & pageHit;
  assign _T_1185 = idxPagesOH_37 & pageHit;
  assign _T_1186 = idxPagesOH_38 & pageHit;
  assign _T_1187 = idxPagesOH_39 & pageHit;
  assign _T_1189 = _T_1148 != 6'h0;
  assign _T_1191 = _T_1149 != 6'h0;
  assign _T_1193 = _T_1150 != 6'h0;
  assign _T_1195 = _T_1151 != 6'h0;
  assign _T_1197 = _T_1152 != 6'h0;
  assign _T_1199 = _T_1153 != 6'h0;
  assign _T_1201 = _T_1154 != 6'h0;
  assign _T_1203 = _T_1155 != 6'h0;
  assign _T_1205 = _T_1156 != 6'h0;
  assign _T_1207 = _T_1157 != 6'h0;
  assign _T_1209 = _T_1158 != 6'h0;
  assign _T_1211 = _T_1159 != 6'h0;
  assign _T_1213 = _T_1160 != 6'h0;
  assign _T_1215 = _T_1161 != 6'h0;
  assign _T_1217 = _T_1162 != 6'h0;
  assign _T_1219 = _T_1163 != 6'h0;
  assign _T_1221 = _T_1164 != 6'h0;
  assign _T_1223 = _T_1165 != 6'h0;
  assign _T_1225 = _T_1166 != 6'h0;
  assign _T_1227 = _T_1167 != 6'h0;
  assign _T_1229 = _T_1168 != 6'h0;
  assign _T_1231 = _T_1169 != 6'h0;
  assign _T_1233 = _T_1170 != 6'h0;
  assign _T_1235 = _T_1171 != 6'h0;
  assign _T_1237 = _T_1172 != 6'h0;
  assign _T_1239 = _T_1173 != 6'h0;
  assign _T_1241 = _T_1174 != 6'h0;
  assign _T_1243 = _T_1175 != 6'h0;
  assign _T_1245 = _T_1176 != 6'h0;
  assign _T_1247 = _T_1177 != 6'h0;
  assign _T_1249 = _T_1178 != 6'h0;
  assign _T_1251 = _T_1179 != 6'h0;
  assign _T_1253 = _T_1180 != 6'h0;
  assign _T_1255 = _T_1181 != 6'h0;
  assign _T_1257 = _T_1182 != 6'h0;
  assign _T_1259 = _T_1183 != 6'h0;
  assign _T_1261 = _T_1184 != 6'h0;
  assign _T_1263 = _T_1185 != 6'h0;
  assign _T_1265 = _T_1186 != 6'h0;
  assign _T_1267 = _T_1187 != 6'h0;
  assign _T_1268 = {_T_1191,_T_1189};
  assign _T_1269 = {_T_1197,_T_1195};
  assign _T_1270 = {_T_1269,_T_1193};
  assign _T_1271 = {_T_1270,_T_1268};
  assign _T_1272 = {_T_1201,_T_1199};
  assign _T_1273 = {_T_1207,_T_1205};
  assign _T_1274 = {_T_1273,_T_1203};
  assign _T_1275 = {_T_1274,_T_1272};
  assign _T_1276 = {_T_1275,_T_1271};
  assign _T_1277 = {_T_1211,_T_1209};
  assign _T_1278 = {_T_1217,_T_1215};
  assign _T_1279 = {_T_1278,_T_1213};
  assign _T_1280 = {_T_1279,_T_1277};
  assign _T_1281 = {_T_1221,_T_1219};
  assign _T_1282 = {_T_1227,_T_1225};
  assign _T_1283 = {_T_1282,_T_1223};
  assign _T_1284 = {_T_1283,_T_1281};
  assign _T_1285 = {_T_1284,_T_1280};
  assign _T_1286 = {_T_1285,_T_1276};
  assign _T_1287 = {_T_1231,_T_1229};
  assign _T_1288 = {_T_1237,_T_1235};
  assign _T_1289 = {_T_1288,_T_1233};
  assign _T_1290 = {_T_1289,_T_1287};
  assign _T_1291 = {_T_1241,_T_1239};
  assign _T_1292 = {_T_1247,_T_1245};
  assign _T_1293 = {_T_1292,_T_1243};
  assign _T_1294 = {_T_1293,_T_1291};
  assign _T_1295 = {_T_1294,_T_1290};
  assign _T_1296 = {_T_1251,_T_1249};
  assign _T_1297 = {_T_1257,_T_1255};
  assign _T_1298 = {_T_1297,_T_1253};
  assign _T_1299 = {_T_1298,_T_1296};
  assign _T_1300 = {_T_1261,_T_1259};
  assign _T_1301 = {_T_1267,_T_1265};
  assign _T_1302 = {_T_1301,_T_1263};
  assign _T_1303 = {_T_1302,_T_1300};
  assign _T_1304 = {_T_1303,_T_1299};
  assign _T_1305 = {_T_1304,_T_1295};
  assign _T_1306 = {_T_1305,_T_1286};
  assign _T_1307 = _T_1147 & _T_1306;
  assign hits = _T_1307 & isValid;
  assign _T_1308 = r_btb_update_bits_pc[38:12];
  assign _T_1309 = pages_0 == _T_1308;
  assign _T_1310 = pages_1 == _T_1308;
  assign _T_1311 = pages_2 == _T_1308;
  assign _T_1312 = pages_3 == _T_1308;
  assign _T_1313 = pages_4 == _T_1308;
  assign _T_1314 = pages_5 == _T_1308;
  assign _T_1315 = {_T_1311,_T_1310};
  assign _T_1316 = {_T_1315,_T_1309};
  assign _T_1317 = {_T_1314,_T_1313};
  assign _T_1318 = {_T_1317,_T_1312};
  assign _T_1319 = {_T_1318,_T_1316};
  assign updatePageHit = pageValid & _T_1319;
  assign _T_1320 = r_btb_update_bits_pc[11:2];
  assign _T_1600 = r_btb_update_bits_prediction_valid == 1'h0;
  assign _T_1601 = r_btb_update_valid & _T_1600;
  assign _T_1604 = nextRepl == 6'h27;
  assign _T_1606 = nextRepl + 6'h1;
  assign _T_1607 = _T_1606[5:0];
  assign _GEN_22 = _T_1604 ? 6'h0 : _T_1607;
  assign _GEN_23 = _T_1601 ? _GEN_22 : nextRepl;
  assign useUpdatePageHit = updatePageHit != 6'h0;
  assign usePageHit = pageHit != 6'h0;
  assign doIdxPageRepl = useUpdatePageHit == 1'h0;
  assign _T_1614 = pageHit[4:0];
  assign _T_1615 = pageHit[5];
  assign _T_1616 = {_T_1614,_T_1615};
  assign _T_1618 = 8'h1 << nextPageRepl;
  assign idxPageRepl = usePageHit ? {{2'd0}, _T_1616} : _T_1618;
  assign idxPageUpdateOH = useUpdatePageHit ? {{2'd0}, updatePageHit} : idxPageRepl;
  assign _T_1619 = idxPageUpdateOH[7:4];
  assign _T_1620 = idxPageUpdateOH[3:0];
  assign _T_1622 = _T_1619 != 4'h0;
  assign _T_1623 = _T_1619 | _T_1620;
  assign _T_1624 = _T_1623[3:2];
  assign _T_1625 = _T_1623[1:0];
  assign _T_1627 = _T_1624 != 2'h0;
  assign _T_1628 = _T_1624 | _T_1625;
  assign _T_1629 = _T_1628[1];
  assign _T_1630 = {_T_1627,_T_1629};
  assign idxPageUpdate = {_T_1622,_T_1630};
  assign idxPageReplEn = doIdxPageRepl ? idxPageRepl : 8'h0;
  assign samePage = _T_1308 == _T_1017;
  assign _T_1635 = samePage == 1'h0;
  assign _T_1637 = usePageHit == 1'h0;
  assign doTgtPageRepl = _T_1635 & _T_1637;
  assign _T_1638 = idxPageUpdateOH[4:0];
  assign _T_1639 = idxPageUpdateOH[5];
  assign _T_1640 = {_T_1638,_T_1639};
  assign tgtPageRepl = samePage ? idxPageUpdateOH : {{2'd0}, _T_1640};
  assign _T_1641 = usePageHit ? {{2'd0}, pageHit} : tgtPageRepl;
  assign _T_1642 = _T_1641[7:4];
  assign _T_1643 = _T_1641[3:0];
  assign _T_1645 = _T_1642 != 4'h0;
  assign _T_1646 = _T_1642 | _T_1643;
  assign _T_1647 = _T_1646[3:2];
  assign _T_1648 = _T_1646[1:0];
  assign _T_1650 = _T_1647 != 2'h0;
  assign _T_1651 = _T_1647 | _T_1648;
  assign _T_1652 = _T_1651[1];
  assign _T_1653 = {_T_1650,_T_1652};
  assign tgtPageUpdate = {_T_1645,_T_1653};
  assign tgtPageReplEn = doTgtPageRepl ? tgtPageRepl : 8'h0;
  assign _T_1655 = doIdxPageRepl | doTgtPageRepl;
  assign _T_1656 = r_btb_update_valid & _T_1655;
  assign _T_1657 = doIdxPageRepl & doTgtPageRepl;
  assign _T_1660 = _T_1657 ? 2'h2 : 2'h1;
  assign _GEN_476 = {{1'd0}, _T_1660};
  assign _T_1661 = nextPageRepl + _GEN_476;
  assign _T_1662 = _T_1661[2:0];
  assign _T_1664 = _T_1662 >= 3'h6;
  assign _T_1665 = _T_1662[0];
  assign _T_1667 = _T_1664 ? {{2'd0}, _T_1665} : _T_1662;
  assign _GEN_24 = _T_1656 ? _T_1667 : nextPageRepl;
  assign _T_1668 = r_btb_update_bits_prediction_valid ? r_btb_update_bits_prediction_bits_entry : nextRepl;
  assign _T_1670 = 64'h1 << _T_1668;
  assign _GEN_0 = _T_1320;
  assign _GEN_25 = 6'h0 == _T_1668 ? _GEN_0 : idxs_0;
  assign _GEN_26 = 6'h1 == _T_1668 ? _GEN_0 : idxs_1;
  assign _GEN_27 = 6'h2 == _T_1668 ? _GEN_0 : idxs_2;
  assign _GEN_28 = 6'h3 == _T_1668 ? _GEN_0 : idxs_3;
  assign _GEN_29 = 6'h4 == _T_1668 ? _GEN_0 : idxs_4;
  assign _GEN_30 = 6'h5 == _T_1668 ? _GEN_0 : idxs_5;
  assign _GEN_31 = 6'h6 == _T_1668 ? _GEN_0 : idxs_6;
  assign _GEN_32 = 6'h7 == _T_1668 ? _GEN_0 : idxs_7;
  assign _GEN_33 = 6'h8 == _T_1668 ? _GEN_0 : idxs_8;
  assign _GEN_34 = 6'h9 == _T_1668 ? _GEN_0 : idxs_9;
  assign _GEN_35 = 6'ha == _T_1668 ? _GEN_0 : idxs_10;
  assign _GEN_36 = 6'hb == _T_1668 ? _GEN_0 : idxs_11;
  assign _GEN_37 = 6'hc == _T_1668 ? _GEN_0 : idxs_12;
  assign _GEN_38 = 6'hd == _T_1668 ? _GEN_0 : idxs_13;
  assign _GEN_39 = 6'he == _T_1668 ? _GEN_0 : idxs_14;
  assign _GEN_40 = 6'hf == _T_1668 ? _GEN_0 : idxs_15;
  assign _GEN_41 = 6'h10 == _T_1668 ? _GEN_0 : idxs_16;
  assign _GEN_42 = 6'h11 == _T_1668 ? _GEN_0 : idxs_17;
  assign _GEN_43 = 6'h12 == _T_1668 ? _GEN_0 : idxs_18;
  assign _GEN_44 = 6'h13 == _T_1668 ? _GEN_0 : idxs_19;
  assign _GEN_45 = 6'h14 == _T_1668 ? _GEN_0 : idxs_20;
  assign _GEN_46 = 6'h15 == _T_1668 ? _GEN_0 : idxs_21;
  assign _GEN_47 = 6'h16 == _T_1668 ? _GEN_0 : idxs_22;
  assign _GEN_48 = 6'h17 == _T_1668 ? _GEN_0 : idxs_23;
  assign _GEN_49 = 6'h18 == _T_1668 ? _GEN_0 : idxs_24;
  assign _GEN_50 = 6'h19 == _T_1668 ? _GEN_0 : idxs_25;
  assign _GEN_51 = 6'h1a == _T_1668 ? _GEN_0 : idxs_26;
  assign _GEN_52 = 6'h1b == _T_1668 ? _GEN_0 : idxs_27;
  assign _GEN_53 = 6'h1c == _T_1668 ? _GEN_0 : idxs_28;
  assign _GEN_54 = 6'h1d == _T_1668 ? _GEN_0 : idxs_29;
  assign _GEN_55 = 6'h1e == _T_1668 ? _GEN_0 : idxs_30;
  assign _GEN_56 = 6'h1f == _T_1668 ? _GEN_0 : idxs_31;
  assign _GEN_57 = 6'h20 == _T_1668 ? _GEN_0 : idxs_32;
  assign _GEN_58 = 6'h21 == _T_1668 ? _GEN_0 : idxs_33;
  assign _GEN_59 = 6'h22 == _T_1668 ? _GEN_0 : idxs_34;
  assign _GEN_60 = 6'h23 == _T_1668 ? _GEN_0 : idxs_35;
  assign _GEN_61 = 6'h24 == _T_1668 ? _GEN_0 : idxs_36;
  assign _GEN_62 = 6'h25 == _T_1668 ? _GEN_0 : idxs_37;
  assign _GEN_63 = 6'h26 == _T_1668 ? _GEN_0 : idxs_38;
  assign _GEN_64 = 6'h27 == _T_1668 ? _GEN_0 : idxs_39;
  assign _GEN_1 = _T_1029;
  assign _GEN_65 = 6'h0 == _T_1668 ? _GEN_1 : tgts_0;
  assign _GEN_66 = 6'h1 == _T_1668 ? _GEN_1 : tgts_1;
  assign _GEN_67 = 6'h2 == _T_1668 ? _GEN_1 : tgts_2;
  assign _GEN_68 = 6'h3 == _T_1668 ? _GEN_1 : tgts_3;
  assign _GEN_69 = 6'h4 == _T_1668 ? _GEN_1 : tgts_4;
  assign _GEN_70 = 6'h5 == _T_1668 ? _GEN_1 : tgts_5;
  assign _GEN_71 = 6'h6 == _T_1668 ? _GEN_1 : tgts_6;
  assign _GEN_72 = 6'h7 == _T_1668 ? _GEN_1 : tgts_7;
  assign _GEN_73 = 6'h8 == _T_1668 ? _GEN_1 : tgts_8;
  assign _GEN_74 = 6'h9 == _T_1668 ? _GEN_1 : tgts_9;
  assign _GEN_75 = 6'ha == _T_1668 ? _GEN_1 : tgts_10;
  assign _GEN_76 = 6'hb == _T_1668 ? _GEN_1 : tgts_11;
  assign _GEN_77 = 6'hc == _T_1668 ? _GEN_1 : tgts_12;
  assign _GEN_78 = 6'hd == _T_1668 ? _GEN_1 : tgts_13;
  assign _GEN_79 = 6'he == _T_1668 ? _GEN_1 : tgts_14;
  assign _GEN_80 = 6'hf == _T_1668 ? _GEN_1 : tgts_15;
  assign _GEN_81 = 6'h10 == _T_1668 ? _GEN_1 : tgts_16;
  assign _GEN_82 = 6'h11 == _T_1668 ? _GEN_1 : tgts_17;
  assign _GEN_83 = 6'h12 == _T_1668 ? _GEN_1 : tgts_18;
  assign _GEN_84 = 6'h13 == _T_1668 ? _GEN_1 : tgts_19;
  assign _GEN_85 = 6'h14 == _T_1668 ? _GEN_1 : tgts_20;
  assign _GEN_86 = 6'h15 == _T_1668 ? _GEN_1 : tgts_21;
  assign _GEN_87 = 6'h16 == _T_1668 ? _GEN_1 : tgts_22;
  assign _GEN_88 = 6'h17 == _T_1668 ? _GEN_1 : tgts_23;
  assign _GEN_89 = 6'h18 == _T_1668 ? _GEN_1 : tgts_24;
  assign _GEN_90 = 6'h19 == _T_1668 ? _GEN_1 : tgts_25;
  assign _GEN_91 = 6'h1a == _T_1668 ? _GEN_1 : tgts_26;
  assign _GEN_92 = 6'h1b == _T_1668 ? _GEN_1 : tgts_27;
  assign _GEN_93 = 6'h1c == _T_1668 ? _GEN_1 : tgts_28;
  assign _GEN_94 = 6'h1d == _T_1668 ? _GEN_1 : tgts_29;
  assign _GEN_95 = 6'h1e == _T_1668 ? _GEN_1 : tgts_30;
  assign _GEN_96 = 6'h1f == _T_1668 ? _GEN_1 : tgts_31;
  assign _GEN_97 = 6'h20 == _T_1668 ? _GEN_1 : tgts_32;
  assign _GEN_98 = 6'h21 == _T_1668 ? _GEN_1 : tgts_33;
  assign _GEN_99 = 6'h22 == _T_1668 ? _GEN_1 : tgts_34;
  assign _GEN_100 = 6'h23 == _T_1668 ? _GEN_1 : tgts_35;
  assign _GEN_101 = 6'h24 == _T_1668 ? _GEN_1 : tgts_36;
  assign _GEN_102 = 6'h25 == _T_1668 ? _GEN_1 : tgts_37;
  assign _GEN_103 = 6'h26 == _T_1668 ? _GEN_1 : tgts_38;
  assign _GEN_104 = 6'h27 == _T_1668 ? _GEN_1 : tgts_39;
  assign _GEN_2 = idxPageUpdate;
  assign _GEN_105 = 6'h0 == _T_1668 ? _GEN_2 : idxPages_0;
  assign _GEN_106 = 6'h1 == _T_1668 ? _GEN_2 : idxPages_1;
  assign _GEN_107 = 6'h2 == _T_1668 ? _GEN_2 : idxPages_2;
  assign _GEN_108 = 6'h3 == _T_1668 ? _GEN_2 : idxPages_3;
  assign _GEN_109 = 6'h4 == _T_1668 ? _GEN_2 : idxPages_4;
  assign _GEN_110 = 6'h5 == _T_1668 ? _GEN_2 : idxPages_5;
  assign _GEN_111 = 6'h6 == _T_1668 ? _GEN_2 : idxPages_6;
  assign _GEN_112 = 6'h7 == _T_1668 ? _GEN_2 : idxPages_7;
  assign _GEN_113 = 6'h8 == _T_1668 ? _GEN_2 : idxPages_8;
  assign _GEN_114 = 6'h9 == _T_1668 ? _GEN_2 : idxPages_9;
  assign _GEN_115 = 6'ha == _T_1668 ? _GEN_2 : idxPages_10;
  assign _GEN_116 = 6'hb == _T_1668 ? _GEN_2 : idxPages_11;
  assign _GEN_117 = 6'hc == _T_1668 ? _GEN_2 : idxPages_12;
  assign _GEN_118 = 6'hd == _T_1668 ? _GEN_2 : idxPages_13;
  assign _GEN_119 = 6'he == _T_1668 ? _GEN_2 : idxPages_14;
  assign _GEN_120 = 6'hf == _T_1668 ? _GEN_2 : idxPages_15;
  assign _GEN_121 = 6'h10 == _T_1668 ? _GEN_2 : idxPages_16;
  assign _GEN_122 = 6'h11 == _T_1668 ? _GEN_2 : idxPages_17;
  assign _GEN_123 = 6'h12 == _T_1668 ? _GEN_2 : idxPages_18;
  assign _GEN_124 = 6'h13 == _T_1668 ? _GEN_2 : idxPages_19;
  assign _GEN_125 = 6'h14 == _T_1668 ? _GEN_2 : idxPages_20;
  assign _GEN_126 = 6'h15 == _T_1668 ? _GEN_2 : idxPages_21;
  assign _GEN_127 = 6'h16 == _T_1668 ? _GEN_2 : idxPages_22;
  assign _GEN_128 = 6'h17 == _T_1668 ? _GEN_2 : idxPages_23;
  assign _GEN_129 = 6'h18 == _T_1668 ? _GEN_2 : idxPages_24;
  assign _GEN_130 = 6'h19 == _T_1668 ? _GEN_2 : idxPages_25;
  assign _GEN_131 = 6'h1a == _T_1668 ? _GEN_2 : idxPages_26;
  assign _GEN_132 = 6'h1b == _T_1668 ? _GEN_2 : idxPages_27;
  assign _GEN_133 = 6'h1c == _T_1668 ? _GEN_2 : idxPages_28;
  assign _GEN_134 = 6'h1d == _T_1668 ? _GEN_2 : idxPages_29;
  assign _GEN_135 = 6'h1e == _T_1668 ? _GEN_2 : idxPages_30;
  assign _GEN_136 = 6'h1f == _T_1668 ? _GEN_2 : idxPages_31;
  assign _GEN_137 = 6'h20 == _T_1668 ? _GEN_2 : idxPages_32;
  assign _GEN_138 = 6'h21 == _T_1668 ? _GEN_2 : idxPages_33;
  assign _GEN_139 = 6'h22 == _T_1668 ? _GEN_2 : idxPages_34;
  assign _GEN_140 = 6'h23 == _T_1668 ? _GEN_2 : idxPages_35;
  assign _GEN_141 = 6'h24 == _T_1668 ? _GEN_2 : idxPages_36;
  assign _GEN_142 = 6'h25 == _T_1668 ? _GEN_2 : idxPages_37;
  assign _GEN_143 = 6'h26 == _T_1668 ? _GEN_2 : idxPages_38;
  assign _GEN_144 = 6'h27 == _T_1668 ? _GEN_2 : idxPages_39;
  assign _GEN_3 = tgtPageUpdate;
  assign _GEN_145 = 6'h0 == _T_1668 ? _GEN_3 : tgtPages_0;
  assign _GEN_146 = 6'h1 == _T_1668 ? _GEN_3 : tgtPages_1;
  assign _GEN_147 = 6'h2 == _T_1668 ? _GEN_3 : tgtPages_2;
  assign _GEN_148 = 6'h3 == _T_1668 ? _GEN_3 : tgtPages_3;
  assign _GEN_149 = 6'h4 == _T_1668 ? _GEN_3 : tgtPages_4;
  assign _GEN_150 = 6'h5 == _T_1668 ? _GEN_3 : tgtPages_5;
  assign _GEN_151 = 6'h6 == _T_1668 ? _GEN_3 : tgtPages_6;
  assign _GEN_152 = 6'h7 == _T_1668 ? _GEN_3 : tgtPages_7;
  assign _GEN_153 = 6'h8 == _T_1668 ? _GEN_3 : tgtPages_8;
  assign _GEN_154 = 6'h9 == _T_1668 ? _GEN_3 : tgtPages_9;
  assign _GEN_155 = 6'ha == _T_1668 ? _GEN_3 : tgtPages_10;
  assign _GEN_156 = 6'hb == _T_1668 ? _GEN_3 : tgtPages_11;
  assign _GEN_157 = 6'hc == _T_1668 ? _GEN_3 : tgtPages_12;
  assign _GEN_158 = 6'hd == _T_1668 ? _GEN_3 : tgtPages_13;
  assign _GEN_159 = 6'he == _T_1668 ? _GEN_3 : tgtPages_14;
  assign _GEN_160 = 6'hf == _T_1668 ? _GEN_3 : tgtPages_15;
  assign _GEN_161 = 6'h10 == _T_1668 ? _GEN_3 : tgtPages_16;
  assign _GEN_162 = 6'h11 == _T_1668 ? _GEN_3 : tgtPages_17;
  assign _GEN_163 = 6'h12 == _T_1668 ? _GEN_3 : tgtPages_18;
  assign _GEN_164 = 6'h13 == _T_1668 ? _GEN_3 : tgtPages_19;
  assign _GEN_165 = 6'h14 == _T_1668 ? _GEN_3 : tgtPages_20;
  assign _GEN_166 = 6'h15 == _T_1668 ? _GEN_3 : tgtPages_21;
  assign _GEN_167 = 6'h16 == _T_1668 ? _GEN_3 : tgtPages_22;
  assign _GEN_168 = 6'h17 == _T_1668 ? _GEN_3 : tgtPages_23;
  assign _GEN_169 = 6'h18 == _T_1668 ? _GEN_3 : tgtPages_24;
  assign _GEN_170 = 6'h19 == _T_1668 ? _GEN_3 : tgtPages_25;
  assign _GEN_171 = 6'h1a == _T_1668 ? _GEN_3 : tgtPages_26;
  assign _GEN_172 = 6'h1b == _T_1668 ? _GEN_3 : tgtPages_27;
  assign _GEN_173 = 6'h1c == _T_1668 ? _GEN_3 : tgtPages_28;
  assign _GEN_174 = 6'h1d == _T_1668 ? _GEN_3 : tgtPages_29;
  assign _GEN_175 = 6'h1e == _T_1668 ? _GEN_3 : tgtPages_30;
  assign _GEN_176 = 6'h1f == _T_1668 ? _GEN_3 : tgtPages_31;
  assign _GEN_177 = 6'h20 == _T_1668 ? _GEN_3 : tgtPages_32;
  assign _GEN_178 = 6'h21 == _T_1668 ? _GEN_3 : tgtPages_33;
  assign _GEN_179 = 6'h22 == _T_1668 ? _GEN_3 : tgtPages_34;
  assign _GEN_180 = 6'h23 == _T_1668 ? _GEN_3 : tgtPages_35;
  assign _GEN_181 = 6'h24 == _T_1668 ? _GEN_3 : tgtPages_36;
  assign _GEN_182 = 6'h25 == _T_1668 ? _GEN_3 : tgtPages_37;
  assign _GEN_183 = 6'h26 == _T_1668 ? _GEN_3 : tgtPages_38;
  assign _GEN_184 = 6'h27 == _T_1668 ? _GEN_3 : tgtPages_39;
  assign _GEN_477 = {{24'd0}, isValid};
  assign _T_1673 = _GEN_477 | _T_1670;
  assign _T_1674 = ~ _T_1670;
  assign _T_1675 = _GEN_477 & _T_1674;
  assign _T_1676 = r_btb_update_bits_isValid ? _T_1673 : _T_1675;
  assign _GEN_479 = {{24'd0}, isReturn};
  assign _T_1677 = _GEN_479 | _T_1670;
  assign _T_1679 = _GEN_479 & _T_1674;
  assign _T_1680 = r_btb_update_bits_isReturn ? _T_1677 : _T_1679;
  assign _GEN_481 = {{24'd0}, isJump};
  assign _T_1681 = _GEN_481 | _T_1670;
  assign _T_1683 = _GEN_481 & _T_1674;
  assign _T_1684 = r_btb_update_bits_isJump ? _T_1681 : _T_1683;
  assign _T_1685 = r_btb_update_bits_br_pc[38:2];
  assign _GEN_4 = _T_1685[1:0];
  assign _GEN_185 = 6'h0 == _T_1668 ? _GEN_4 : brIdx_0;
  assign _GEN_186 = 6'h1 == _T_1668 ? _GEN_4 : brIdx_1;
  assign _GEN_187 = 6'h2 == _T_1668 ? _GEN_4 : brIdx_2;
  assign _GEN_188 = 6'h3 == _T_1668 ? _GEN_4 : brIdx_3;
  assign _GEN_189 = 6'h4 == _T_1668 ? _GEN_4 : brIdx_4;
  assign _GEN_190 = 6'h5 == _T_1668 ? _GEN_4 : brIdx_5;
  assign _GEN_191 = 6'h6 == _T_1668 ? _GEN_4 : brIdx_6;
  assign _GEN_192 = 6'h7 == _T_1668 ? _GEN_4 : brIdx_7;
  assign _GEN_193 = 6'h8 == _T_1668 ? _GEN_4 : brIdx_8;
  assign _GEN_194 = 6'h9 == _T_1668 ? _GEN_4 : brIdx_9;
  assign _GEN_195 = 6'ha == _T_1668 ? _GEN_4 : brIdx_10;
  assign _GEN_196 = 6'hb == _T_1668 ? _GEN_4 : brIdx_11;
  assign _GEN_197 = 6'hc == _T_1668 ? _GEN_4 : brIdx_12;
  assign _GEN_198 = 6'hd == _T_1668 ? _GEN_4 : brIdx_13;
  assign _GEN_199 = 6'he == _T_1668 ? _GEN_4 : brIdx_14;
  assign _GEN_200 = 6'hf == _T_1668 ? _GEN_4 : brIdx_15;
  assign _GEN_201 = 6'h10 == _T_1668 ? _GEN_4 : brIdx_16;
  assign _GEN_202 = 6'h11 == _T_1668 ? _GEN_4 : brIdx_17;
  assign _GEN_203 = 6'h12 == _T_1668 ? _GEN_4 : brIdx_18;
  assign _GEN_204 = 6'h13 == _T_1668 ? _GEN_4 : brIdx_19;
  assign _GEN_205 = 6'h14 == _T_1668 ? _GEN_4 : brIdx_20;
  assign _GEN_206 = 6'h15 == _T_1668 ? _GEN_4 : brIdx_21;
  assign _GEN_207 = 6'h16 == _T_1668 ? _GEN_4 : brIdx_22;
  assign _GEN_208 = 6'h17 == _T_1668 ? _GEN_4 : brIdx_23;
  assign _GEN_209 = 6'h18 == _T_1668 ? _GEN_4 : brIdx_24;
  assign _GEN_210 = 6'h19 == _T_1668 ? _GEN_4 : brIdx_25;
  assign _GEN_211 = 6'h1a == _T_1668 ? _GEN_4 : brIdx_26;
  assign _GEN_212 = 6'h1b == _T_1668 ? _GEN_4 : brIdx_27;
  assign _GEN_213 = 6'h1c == _T_1668 ? _GEN_4 : brIdx_28;
  assign _GEN_214 = 6'h1d == _T_1668 ? _GEN_4 : brIdx_29;
  assign _GEN_215 = 6'h1e == _T_1668 ? _GEN_4 : brIdx_30;
  assign _GEN_216 = 6'h1f == _T_1668 ? _GEN_4 : brIdx_31;
  assign _GEN_217 = 6'h20 == _T_1668 ? _GEN_4 : brIdx_32;
  assign _GEN_218 = 6'h21 == _T_1668 ? _GEN_4 : brIdx_33;
  assign _GEN_219 = 6'h22 == _T_1668 ? _GEN_4 : brIdx_34;
  assign _GEN_220 = 6'h23 == _T_1668 ? _GEN_4 : brIdx_35;
  assign _GEN_221 = 6'h24 == _T_1668 ? _GEN_4 : brIdx_36;
  assign _GEN_222 = 6'h25 == _T_1668 ? _GEN_4 : brIdx_37;
  assign _GEN_223 = 6'h26 == _T_1668 ? _GEN_4 : brIdx_38;
  assign _GEN_224 = 6'h27 == _T_1668 ? _GEN_4 : brIdx_39;
  assign _T_1686 = idxPageUpdate[0];
  assign _T_1688 = _T_1686 == 1'h0;
  assign _T_1689 = _T_1688 ? idxPageReplEn : tgtPageReplEn;
  assign _T_1692 = _T_1688 ? _T_1308 : _T_1017;
  assign _T_1693 = _T_1689[0];
  assign _GEN_225 = _T_1693 ? _T_1692 : pages_0;
  assign _T_1694 = _T_1689[2];
  assign _GEN_226 = _T_1694 ? _T_1692 : pages_2;
  assign _T_1695 = _T_1689[4];
  assign _GEN_227 = _T_1695 ? _T_1692 : pages_4;
  assign _T_1696 = _T_1688 ? tgtPageReplEn : idxPageReplEn;
  assign _T_1699 = _T_1688 ? _T_1017 : _T_1308;
  assign _T_1700 = _T_1696[1];
  assign _GEN_228 = _T_1700 ? _T_1699 : pages_1;
  assign _T_1701 = _T_1696[3];
  assign _GEN_229 = _T_1701 ? _T_1699 : pages_3;
  assign _T_1702 = _T_1696[5];
  assign _GEN_230 = _T_1702 ? _T_1699 : pages_5;
  assign _GEN_483 = {{2'd0}, pageValid};
  assign _T_1703 = _GEN_483 | tgtPageReplEn;
  assign _T_1704 = _T_1703 | idxPageReplEn;
  assign _GEN_231 = r_btb_update_valid ? _GEN_25 : idxs_0;
  assign _GEN_232 = r_btb_update_valid ? _GEN_26 : idxs_1;
  assign _GEN_233 = r_btb_update_valid ? _GEN_27 : idxs_2;
  assign _GEN_234 = r_btb_update_valid ? _GEN_28 : idxs_3;
  assign _GEN_235 = r_btb_update_valid ? _GEN_29 : idxs_4;
  assign _GEN_236 = r_btb_update_valid ? _GEN_30 : idxs_5;
  assign _GEN_237 = r_btb_update_valid ? _GEN_31 : idxs_6;
  assign _GEN_238 = r_btb_update_valid ? _GEN_32 : idxs_7;
  assign _GEN_239 = r_btb_update_valid ? _GEN_33 : idxs_8;
  assign _GEN_240 = r_btb_update_valid ? _GEN_34 : idxs_9;
  assign _GEN_241 = r_btb_update_valid ? _GEN_35 : idxs_10;
  assign _GEN_242 = r_btb_update_valid ? _GEN_36 : idxs_11;
  assign _GEN_243 = r_btb_update_valid ? _GEN_37 : idxs_12;
  assign _GEN_244 = r_btb_update_valid ? _GEN_38 : idxs_13;
  assign _GEN_245 = r_btb_update_valid ? _GEN_39 : idxs_14;
  assign _GEN_246 = r_btb_update_valid ? _GEN_40 : idxs_15;
  assign _GEN_247 = r_btb_update_valid ? _GEN_41 : idxs_16;
  assign _GEN_248 = r_btb_update_valid ? _GEN_42 : idxs_17;
  assign _GEN_249 = r_btb_update_valid ? _GEN_43 : idxs_18;
  assign _GEN_250 = r_btb_update_valid ? _GEN_44 : idxs_19;
  assign _GEN_251 = r_btb_update_valid ? _GEN_45 : idxs_20;
  assign _GEN_252 = r_btb_update_valid ? _GEN_46 : idxs_21;
  assign _GEN_253 = r_btb_update_valid ? _GEN_47 : idxs_22;
  assign _GEN_254 = r_btb_update_valid ? _GEN_48 : idxs_23;
  assign _GEN_255 = r_btb_update_valid ? _GEN_49 : idxs_24;
  assign _GEN_256 = r_btb_update_valid ? _GEN_50 : idxs_25;
  assign _GEN_257 = r_btb_update_valid ? _GEN_51 : idxs_26;
  assign _GEN_258 = r_btb_update_valid ? _GEN_52 : idxs_27;
  assign _GEN_259 = r_btb_update_valid ? _GEN_53 : idxs_28;
  assign _GEN_260 = r_btb_update_valid ? _GEN_54 : idxs_29;
  assign _GEN_261 = r_btb_update_valid ? _GEN_55 : idxs_30;
  assign _GEN_262 = r_btb_update_valid ? _GEN_56 : idxs_31;
  assign _GEN_263 = r_btb_update_valid ? _GEN_57 : idxs_32;
  assign _GEN_264 = r_btb_update_valid ? _GEN_58 : idxs_33;
  assign _GEN_265 = r_btb_update_valid ? _GEN_59 : idxs_34;
  assign _GEN_266 = r_btb_update_valid ? _GEN_60 : idxs_35;
  assign _GEN_267 = r_btb_update_valid ? _GEN_61 : idxs_36;
  assign _GEN_268 = r_btb_update_valid ? _GEN_62 : idxs_37;
  assign _GEN_269 = r_btb_update_valid ? _GEN_63 : idxs_38;
  assign _GEN_270 = r_btb_update_valid ? _GEN_64 : idxs_39;
  assign _GEN_271 = r_btb_update_valid ? _GEN_65 : tgts_0;
  assign _GEN_272 = r_btb_update_valid ? _GEN_66 : tgts_1;
  assign _GEN_273 = r_btb_update_valid ? _GEN_67 : tgts_2;
  assign _GEN_274 = r_btb_update_valid ? _GEN_68 : tgts_3;
  assign _GEN_275 = r_btb_update_valid ? _GEN_69 : tgts_4;
  assign _GEN_276 = r_btb_update_valid ? _GEN_70 : tgts_5;
  assign _GEN_277 = r_btb_update_valid ? _GEN_71 : tgts_6;
  assign _GEN_278 = r_btb_update_valid ? _GEN_72 : tgts_7;
  assign _GEN_279 = r_btb_update_valid ? _GEN_73 : tgts_8;
  assign _GEN_280 = r_btb_update_valid ? _GEN_74 : tgts_9;
  assign _GEN_281 = r_btb_update_valid ? _GEN_75 : tgts_10;
  assign _GEN_282 = r_btb_update_valid ? _GEN_76 : tgts_11;
  assign _GEN_283 = r_btb_update_valid ? _GEN_77 : tgts_12;
  assign _GEN_284 = r_btb_update_valid ? _GEN_78 : tgts_13;
  assign _GEN_285 = r_btb_update_valid ? _GEN_79 : tgts_14;
  assign _GEN_286 = r_btb_update_valid ? _GEN_80 : tgts_15;
  assign _GEN_287 = r_btb_update_valid ? _GEN_81 : tgts_16;
  assign _GEN_288 = r_btb_update_valid ? _GEN_82 : tgts_17;
  assign _GEN_289 = r_btb_update_valid ? _GEN_83 : tgts_18;
  assign _GEN_290 = r_btb_update_valid ? _GEN_84 : tgts_19;
  assign _GEN_291 = r_btb_update_valid ? _GEN_85 : tgts_20;
  assign _GEN_292 = r_btb_update_valid ? _GEN_86 : tgts_21;
  assign _GEN_293 = r_btb_update_valid ? _GEN_87 : tgts_22;
  assign _GEN_294 = r_btb_update_valid ? _GEN_88 : tgts_23;
  assign _GEN_295 = r_btb_update_valid ? _GEN_89 : tgts_24;
  assign _GEN_296 = r_btb_update_valid ? _GEN_90 : tgts_25;
  assign _GEN_297 = r_btb_update_valid ? _GEN_91 : tgts_26;
  assign _GEN_298 = r_btb_update_valid ? _GEN_92 : tgts_27;
  assign _GEN_299 = r_btb_update_valid ? _GEN_93 : tgts_28;
  assign _GEN_300 = r_btb_update_valid ? _GEN_94 : tgts_29;
  assign _GEN_301 = r_btb_update_valid ? _GEN_95 : tgts_30;
  assign _GEN_302 = r_btb_update_valid ? _GEN_96 : tgts_31;
  assign _GEN_303 = r_btb_update_valid ? _GEN_97 : tgts_32;
  assign _GEN_304 = r_btb_update_valid ? _GEN_98 : tgts_33;
  assign _GEN_305 = r_btb_update_valid ? _GEN_99 : tgts_34;
  assign _GEN_306 = r_btb_update_valid ? _GEN_100 : tgts_35;
  assign _GEN_307 = r_btb_update_valid ? _GEN_101 : tgts_36;
  assign _GEN_308 = r_btb_update_valid ? _GEN_102 : tgts_37;
  assign _GEN_309 = r_btb_update_valid ? _GEN_103 : tgts_38;
  assign _GEN_310 = r_btb_update_valid ? _GEN_104 : tgts_39;
  assign _GEN_311 = r_btb_update_valid ? _GEN_105 : idxPages_0;
  assign _GEN_312 = r_btb_update_valid ? _GEN_106 : idxPages_1;
  assign _GEN_313 = r_btb_update_valid ? _GEN_107 : idxPages_2;
  assign _GEN_314 = r_btb_update_valid ? _GEN_108 : idxPages_3;
  assign _GEN_315 = r_btb_update_valid ? _GEN_109 : idxPages_4;
  assign _GEN_316 = r_btb_update_valid ? _GEN_110 : idxPages_5;
  assign _GEN_317 = r_btb_update_valid ? _GEN_111 : idxPages_6;
  assign _GEN_318 = r_btb_update_valid ? _GEN_112 : idxPages_7;
  assign _GEN_319 = r_btb_update_valid ? _GEN_113 : idxPages_8;
  assign _GEN_320 = r_btb_update_valid ? _GEN_114 : idxPages_9;
  assign _GEN_321 = r_btb_update_valid ? _GEN_115 : idxPages_10;
  assign _GEN_322 = r_btb_update_valid ? _GEN_116 : idxPages_11;
  assign _GEN_323 = r_btb_update_valid ? _GEN_117 : idxPages_12;
  assign _GEN_324 = r_btb_update_valid ? _GEN_118 : idxPages_13;
  assign _GEN_325 = r_btb_update_valid ? _GEN_119 : idxPages_14;
  assign _GEN_326 = r_btb_update_valid ? _GEN_120 : idxPages_15;
  assign _GEN_327 = r_btb_update_valid ? _GEN_121 : idxPages_16;
  assign _GEN_328 = r_btb_update_valid ? _GEN_122 : idxPages_17;
  assign _GEN_329 = r_btb_update_valid ? _GEN_123 : idxPages_18;
  assign _GEN_330 = r_btb_update_valid ? _GEN_124 : idxPages_19;
  assign _GEN_331 = r_btb_update_valid ? _GEN_125 : idxPages_20;
  assign _GEN_332 = r_btb_update_valid ? _GEN_126 : idxPages_21;
  assign _GEN_333 = r_btb_update_valid ? _GEN_127 : idxPages_22;
  assign _GEN_334 = r_btb_update_valid ? _GEN_128 : idxPages_23;
  assign _GEN_335 = r_btb_update_valid ? _GEN_129 : idxPages_24;
  assign _GEN_336 = r_btb_update_valid ? _GEN_130 : idxPages_25;
  assign _GEN_337 = r_btb_update_valid ? _GEN_131 : idxPages_26;
  assign _GEN_338 = r_btb_update_valid ? _GEN_132 : idxPages_27;
  assign _GEN_339 = r_btb_update_valid ? _GEN_133 : idxPages_28;
  assign _GEN_340 = r_btb_update_valid ? _GEN_134 : idxPages_29;
  assign _GEN_341 = r_btb_update_valid ? _GEN_135 : idxPages_30;
  assign _GEN_342 = r_btb_update_valid ? _GEN_136 : idxPages_31;
  assign _GEN_343 = r_btb_update_valid ? _GEN_137 : idxPages_32;
  assign _GEN_344 = r_btb_update_valid ? _GEN_138 : idxPages_33;
  assign _GEN_345 = r_btb_update_valid ? _GEN_139 : idxPages_34;
  assign _GEN_346 = r_btb_update_valid ? _GEN_140 : idxPages_35;
  assign _GEN_347 = r_btb_update_valid ? _GEN_141 : idxPages_36;
  assign _GEN_348 = r_btb_update_valid ? _GEN_142 : idxPages_37;
  assign _GEN_349 = r_btb_update_valid ? _GEN_143 : idxPages_38;
  assign _GEN_350 = r_btb_update_valid ? _GEN_144 : idxPages_39;
  assign _GEN_351 = r_btb_update_valid ? _GEN_145 : tgtPages_0;
  assign _GEN_352 = r_btb_update_valid ? _GEN_146 : tgtPages_1;
  assign _GEN_353 = r_btb_update_valid ? _GEN_147 : tgtPages_2;
  assign _GEN_354 = r_btb_update_valid ? _GEN_148 : tgtPages_3;
  assign _GEN_355 = r_btb_update_valid ? _GEN_149 : tgtPages_4;
  assign _GEN_356 = r_btb_update_valid ? _GEN_150 : tgtPages_5;
  assign _GEN_357 = r_btb_update_valid ? _GEN_151 : tgtPages_6;
  assign _GEN_358 = r_btb_update_valid ? _GEN_152 : tgtPages_7;
  assign _GEN_359 = r_btb_update_valid ? _GEN_153 : tgtPages_8;
  assign _GEN_360 = r_btb_update_valid ? _GEN_154 : tgtPages_9;
  assign _GEN_361 = r_btb_update_valid ? _GEN_155 : tgtPages_10;
  assign _GEN_362 = r_btb_update_valid ? _GEN_156 : tgtPages_11;
  assign _GEN_363 = r_btb_update_valid ? _GEN_157 : tgtPages_12;
  assign _GEN_364 = r_btb_update_valid ? _GEN_158 : tgtPages_13;
  assign _GEN_365 = r_btb_update_valid ? _GEN_159 : tgtPages_14;
  assign _GEN_366 = r_btb_update_valid ? _GEN_160 : tgtPages_15;
  assign _GEN_367 = r_btb_update_valid ? _GEN_161 : tgtPages_16;
  assign _GEN_368 = r_btb_update_valid ? _GEN_162 : tgtPages_17;
  assign _GEN_369 = r_btb_update_valid ? _GEN_163 : tgtPages_18;
  assign _GEN_370 = r_btb_update_valid ? _GEN_164 : tgtPages_19;
  assign _GEN_371 = r_btb_update_valid ? _GEN_165 : tgtPages_20;
  assign _GEN_372 = r_btb_update_valid ? _GEN_166 : tgtPages_21;
  assign _GEN_373 = r_btb_update_valid ? _GEN_167 : tgtPages_22;
  assign _GEN_374 = r_btb_update_valid ? _GEN_168 : tgtPages_23;
  assign _GEN_375 = r_btb_update_valid ? _GEN_169 : tgtPages_24;
  assign _GEN_376 = r_btb_update_valid ? _GEN_170 : tgtPages_25;
  assign _GEN_377 = r_btb_update_valid ? _GEN_171 : tgtPages_26;
  assign _GEN_378 = r_btb_update_valid ? _GEN_172 : tgtPages_27;
  assign _GEN_379 = r_btb_update_valid ? _GEN_173 : tgtPages_28;
  assign _GEN_380 = r_btb_update_valid ? _GEN_174 : tgtPages_29;
  assign _GEN_381 = r_btb_update_valid ? _GEN_175 : tgtPages_30;
  assign _GEN_382 = r_btb_update_valid ? _GEN_176 : tgtPages_31;
  assign _GEN_383 = r_btb_update_valid ? _GEN_177 : tgtPages_32;
  assign _GEN_384 = r_btb_update_valid ? _GEN_178 : tgtPages_33;
  assign _GEN_385 = r_btb_update_valid ? _GEN_179 : tgtPages_34;
  assign _GEN_386 = r_btb_update_valid ? _GEN_180 : tgtPages_35;
  assign _GEN_387 = r_btb_update_valid ? _GEN_181 : tgtPages_36;
  assign _GEN_388 = r_btb_update_valid ? _GEN_182 : tgtPages_37;
  assign _GEN_389 = r_btb_update_valid ? _GEN_183 : tgtPages_38;
  assign _GEN_390 = r_btb_update_valid ? _GEN_184 : tgtPages_39;
  assign _GEN_391 = r_btb_update_valid ? _T_1676 : {{24'd0}, isValid};
  assign _GEN_392 = r_btb_update_valid ? _T_1680 : {{24'd0}, isReturn};
  assign _GEN_393 = r_btb_update_valid ? _T_1684 : {{24'd0}, isJump};
  assign _GEN_394 = r_btb_update_valid ? _GEN_185 : brIdx_0;
  assign _GEN_395 = r_btb_update_valid ? _GEN_186 : brIdx_1;
  assign _GEN_396 = r_btb_update_valid ? _GEN_187 : brIdx_2;
  assign _GEN_397 = r_btb_update_valid ? _GEN_188 : brIdx_3;
  assign _GEN_398 = r_btb_update_valid ? _GEN_189 : brIdx_4;
  assign _GEN_399 = r_btb_update_valid ? _GEN_190 : brIdx_5;
  assign _GEN_400 = r_btb_update_valid ? _GEN_191 : brIdx_6;
  assign _GEN_401 = r_btb_update_valid ? _GEN_192 : brIdx_7;
  assign _GEN_402 = r_btb_update_valid ? _GEN_193 : brIdx_8;
  assign _GEN_403 = r_btb_update_valid ? _GEN_194 : brIdx_9;
  assign _GEN_404 = r_btb_update_valid ? _GEN_195 : brIdx_10;
  assign _GEN_405 = r_btb_update_valid ? _GEN_196 : brIdx_11;
  assign _GEN_406 = r_btb_update_valid ? _GEN_197 : brIdx_12;
  assign _GEN_407 = r_btb_update_valid ? _GEN_198 : brIdx_13;
  assign _GEN_408 = r_btb_update_valid ? _GEN_199 : brIdx_14;
  assign _GEN_409 = r_btb_update_valid ? _GEN_200 : brIdx_15;
  assign _GEN_410 = r_btb_update_valid ? _GEN_201 : brIdx_16;
  assign _GEN_411 = r_btb_update_valid ? _GEN_202 : brIdx_17;
  assign _GEN_412 = r_btb_update_valid ? _GEN_203 : brIdx_18;
  assign _GEN_413 = r_btb_update_valid ? _GEN_204 : brIdx_19;
  assign _GEN_414 = r_btb_update_valid ? _GEN_205 : brIdx_20;
  assign _GEN_415 = r_btb_update_valid ? _GEN_206 : brIdx_21;
  assign _GEN_416 = r_btb_update_valid ? _GEN_207 : brIdx_22;
  assign _GEN_417 = r_btb_update_valid ? _GEN_208 : brIdx_23;
  assign _GEN_418 = r_btb_update_valid ? _GEN_209 : brIdx_24;
  assign _GEN_419 = r_btb_update_valid ? _GEN_210 : brIdx_25;
  assign _GEN_420 = r_btb_update_valid ? _GEN_211 : brIdx_26;
  assign _GEN_421 = r_btb_update_valid ? _GEN_212 : brIdx_27;
  assign _GEN_422 = r_btb_update_valid ? _GEN_213 : brIdx_28;
  assign _GEN_423 = r_btb_update_valid ? _GEN_214 : brIdx_29;
  assign _GEN_424 = r_btb_update_valid ? _GEN_215 : brIdx_30;
  assign _GEN_425 = r_btb_update_valid ? _GEN_216 : brIdx_31;
  assign _GEN_426 = r_btb_update_valid ? _GEN_217 : brIdx_32;
  assign _GEN_427 = r_btb_update_valid ? _GEN_218 : brIdx_33;
  assign _GEN_428 = r_btb_update_valid ? _GEN_219 : brIdx_34;
  assign _GEN_429 = r_btb_update_valid ? _GEN_220 : brIdx_35;
  assign _GEN_430 = r_btb_update_valid ? _GEN_221 : brIdx_36;
  assign _GEN_431 = r_btb_update_valid ? _GEN_222 : brIdx_37;
  assign _GEN_432 = r_btb_update_valid ? _GEN_223 : brIdx_38;
  assign _GEN_433 = r_btb_update_valid ? _GEN_224 : brIdx_39;
  assign _GEN_434 = r_btb_update_valid ? _GEN_225 : pages_0;
  assign _GEN_435 = r_btb_update_valid ? _GEN_226 : pages_2;
  assign _GEN_436 = r_btb_update_valid ? _GEN_227 : pages_4;
  assign _GEN_437 = r_btb_update_valid ? _GEN_228 : pages_1;
  assign _GEN_438 = r_btb_update_valid ? _GEN_229 : pages_3;
  assign _GEN_439 = r_btb_update_valid ? _GEN_230 : pages_5;
  assign _GEN_440 = r_btb_update_valid ? _T_1704 : {{2'd0}, pageValid};
  assign _T_1706 = hits != 40'h0;
  assign _T_1708 = hits[0];
  assign _T_1709 = hits[1];
  assign _T_1710 = hits[2];
  assign _T_1711 = hits[3];
  assign _T_1712 = hits[4];
  assign _T_1713 = hits[5];
  assign _T_1714 = hits[6];
  assign _T_1715 = hits[7];
  assign _T_1716 = hits[8];
  assign _T_1717 = hits[9];
  assign _T_1718 = hits[10];
  assign _T_1719 = hits[11];
  assign _T_1720 = hits[12];
  assign _T_1721 = hits[13];
  assign _T_1722 = hits[14];
  assign _T_1723 = hits[15];
  assign _T_1724 = hits[16];
  assign _T_1725 = hits[17];
  assign _T_1726 = hits[18];
  assign _T_1727 = hits[19];
  assign _T_1728 = hits[20];
  assign _T_1729 = hits[21];
  assign _T_1730 = hits[22];
  assign _T_1731 = hits[23];
  assign _T_1732 = hits[24];
  assign _T_1733 = hits[25];
  assign _T_1734 = hits[26];
  assign _T_1735 = hits[27];
  assign _T_1736 = hits[28];
  assign _T_1737 = hits[29];
  assign _T_1738 = hits[30];
  assign _T_1739 = hits[31];
  assign _T_1740 = hits[32];
  assign _T_1741 = hits[33];
  assign _T_1742 = hits[34];
  assign _T_1743 = hits[35];
  assign _T_1744 = hits[36];
  assign _T_1745 = hits[37];
  assign _T_1746 = hits[38];
  assign _T_1747 = hits[39];
  assign _T_1749 = _T_1708 ? tgtPagesOH_0 : 6'h0;
  assign _T_1751 = _T_1709 ? tgtPagesOH_1 : 6'h0;
  assign _T_1753 = _T_1710 ? tgtPagesOH_2 : 6'h0;
  assign _T_1755 = _T_1711 ? tgtPagesOH_3 : 6'h0;
  assign _T_1757 = _T_1712 ? tgtPagesOH_4 : 6'h0;
  assign _T_1759 = _T_1713 ? tgtPagesOH_5 : 6'h0;
  assign _T_1761 = _T_1714 ? tgtPagesOH_6 : 6'h0;
  assign _T_1763 = _T_1715 ? tgtPagesOH_7 : 6'h0;
  assign _T_1765 = _T_1716 ? tgtPagesOH_8 : 6'h0;
  assign _T_1767 = _T_1717 ? tgtPagesOH_9 : 6'h0;
  assign _T_1769 = _T_1718 ? tgtPagesOH_10 : 6'h0;
  assign _T_1771 = _T_1719 ? tgtPagesOH_11 : 6'h0;
  assign _T_1773 = _T_1720 ? tgtPagesOH_12 : 6'h0;
  assign _T_1775 = _T_1721 ? tgtPagesOH_13 : 6'h0;
  assign _T_1777 = _T_1722 ? tgtPagesOH_14 : 6'h0;
  assign _T_1779 = _T_1723 ? tgtPagesOH_15 : 6'h0;
  assign _T_1781 = _T_1724 ? tgtPagesOH_16 : 6'h0;
  assign _T_1783 = _T_1725 ? tgtPagesOH_17 : 6'h0;
  assign _T_1785 = _T_1726 ? tgtPagesOH_18 : 6'h0;
  assign _T_1787 = _T_1727 ? tgtPagesOH_19 : 6'h0;
  assign _T_1789 = _T_1728 ? tgtPagesOH_20 : 6'h0;
  assign _T_1791 = _T_1729 ? tgtPagesOH_21 : 6'h0;
  assign _T_1793 = _T_1730 ? tgtPagesOH_22 : 6'h0;
  assign _T_1795 = _T_1731 ? tgtPagesOH_23 : 6'h0;
  assign _T_1797 = _T_1732 ? tgtPagesOH_24 : 6'h0;
  assign _T_1799 = _T_1733 ? tgtPagesOH_25 : 6'h0;
  assign _T_1801 = _T_1734 ? tgtPagesOH_26 : 6'h0;
  assign _T_1803 = _T_1735 ? tgtPagesOH_27 : 6'h0;
  assign _T_1805 = _T_1736 ? tgtPagesOH_28 : 6'h0;
  assign _T_1807 = _T_1737 ? tgtPagesOH_29 : 6'h0;
  assign _T_1809 = _T_1738 ? tgtPagesOH_30 : 6'h0;
  assign _T_1811 = _T_1739 ? tgtPagesOH_31 : 6'h0;
  assign _T_1813 = _T_1740 ? tgtPagesOH_32 : 6'h0;
  assign _T_1815 = _T_1741 ? tgtPagesOH_33 : 6'h0;
  assign _T_1817 = _T_1742 ? tgtPagesOH_34 : 6'h0;
  assign _T_1819 = _T_1743 ? tgtPagesOH_35 : 6'h0;
  assign _T_1821 = _T_1744 ? tgtPagesOH_36 : 6'h0;
  assign _T_1823 = _T_1745 ? tgtPagesOH_37 : 6'h0;
  assign _T_1825 = _T_1746 ? tgtPagesOH_38 : 6'h0;
  assign _T_1827 = _T_1747 ? tgtPagesOH_39 : 6'h0;
  assign _T_1829 = _T_1749 | _T_1751;
  assign _T_1830 = _T_1829 | _T_1753;
  assign _T_1831 = _T_1830 | _T_1755;
  assign _T_1832 = _T_1831 | _T_1757;
  assign _T_1833 = _T_1832 | _T_1759;
  assign _T_1834 = _T_1833 | _T_1761;
  assign _T_1835 = _T_1834 | _T_1763;
  assign _T_1836 = _T_1835 | _T_1765;
  assign _T_1837 = _T_1836 | _T_1767;
  assign _T_1838 = _T_1837 | _T_1769;
  assign _T_1839 = _T_1838 | _T_1771;
  assign _T_1840 = _T_1839 | _T_1773;
  assign _T_1841 = _T_1840 | _T_1775;
  assign _T_1842 = _T_1841 | _T_1777;
  assign _T_1843 = _T_1842 | _T_1779;
  assign _T_1844 = _T_1843 | _T_1781;
  assign _T_1845 = _T_1844 | _T_1783;
  assign _T_1846 = _T_1845 | _T_1785;
  assign _T_1847 = _T_1846 | _T_1787;
  assign _T_1848 = _T_1847 | _T_1789;
  assign _T_1849 = _T_1848 | _T_1791;
  assign _T_1850 = _T_1849 | _T_1793;
  assign _T_1851 = _T_1850 | _T_1795;
  assign _T_1852 = _T_1851 | _T_1797;
  assign _T_1853 = _T_1852 | _T_1799;
  assign _T_1854 = _T_1853 | _T_1801;
  assign _T_1855 = _T_1854 | _T_1803;
  assign _T_1856 = _T_1855 | _T_1805;
  assign _T_1857 = _T_1856 | _T_1807;
  assign _T_1858 = _T_1857 | _T_1809;
  assign _T_1859 = _T_1858 | _T_1811;
  assign _T_1860 = _T_1859 | _T_1813;
  assign _T_1861 = _T_1860 | _T_1815;
  assign _T_1862 = _T_1861 | _T_1817;
  assign _T_1863 = _T_1862 | _T_1819;
  assign _T_1864 = _T_1863 | _T_1821;
  assign _T_1865 = _T_1864 | _T_1823;
  assign _T_1866 = _T_1865 | _T_1825;
  assign _T_1867 = _T_1866 | _T_1827;
  assign _T_1868 = _T_1867;
  assign _T_1869 = _T_1868[0];
  assign _T_1870 = _T_1868[1];
  assign _T_1871 = _T_1868[2];
  assign _T_1872 = _T_1868[3];
  assign _T_1873 = _T_1868[4];
  assign _T_1874 = _T_1868[5];
  assign _T_1876 = _T_1869 ? pages_0 : 27'h0;
  assign _T_1878 = _T_1870 ? pages_1 : 27'h0;
  assign _T_1880 = _T_1871 ? pages_2 : 27'h0;
  assign _T_1882 = _T_1872 ? pages_3 : 27'h0;
  assign _T_1884 = _T_1873 ? pages_4 : 27'h0;
  assign _T_1886 = _T_1874 ? pages_5 : 27'h0;
  assign _T_1888 = _T_1876 | _T_1878;
  assign _T_1889 = _T_1888 | _T_1880;
  assign _T_1890 = _T_1889 | _T_1882;
  assign _T_1891 = _T_1890 | _T_1884;
  assign _T_1892 = _T_1891 | _T_1886;
  assign _T_1893 = _T_1892;
  assign _T_1935 = _T_1708 ? tgts_0 : 10'h0;
  assign _T_1937 = _T_1709 ? tgts_1 : 10'h0;
  assign _T_1939 = _T_1710 ? tgts_2 : 10'h0;
  assign _T_1941 = _T_1711 ? tgts_3 : 10'h0;
  assign _T_1943 = _T_1712 ? tgts_4 : 10'h0;
  assign _T_1945 = _T_1713 ? tgts_5 : 10'h0;
  assign _T_1947 = _T_1714 ? tgts_6 : 10'h0;
  assign _T_1949 = _T_1715 ? tgts_7 : 10'h0;
  assign _T_1951 = _T_1716 ? tgts_8 : 10'h0;
  assign _T_1953 = _T_1717 ? tgts_9 : 10'h0;
  assign _T_1955 = _T_1718 ? tgts_10 : 10'h0;
  assign _T_1957 = _T_1719 ? tgts_11 : 10'h0;
  assign _T_1959 = _T_1720 ? tgts_12 : 10'h0;
  assign _T_1961 = _T_1721 ? tgts_13 : 10'h0;
  assign _T_1963 = _T_1722 ? tgts_14 : 10'h0;
  assign _T_1965 = _T_1723 ? tgts_15 : 10'h0;
  assign _T_1967 = _T_1724 ? tgts_16 : 10'h0;
  assign _T_1969 = _T_1725 ? tgts_17 : 10'h0;
  assign _T_1971 = _T_1726 ? tgts_18 : 10'h0;
  assign _T_1973 = _T_1727 ? tgts_19 : 10'h0;
  assign _T_1975 = _T_1728 ? tgts_20 : 10'h0;
  assign _T_1977 = _T_1729 ? tgts_21 : 10'h0;
  assign _T_1979 = _T_1730 ? tgts_22 : 10'h0;
  assign _T_1981 = _T_1731 ? tgts_23 : 10'h0;
  assign _T_1983 = _T_1732 ? tgts_24 : 10'h0;
  assign _T_1985 = _T_1733 ? tgts_25 : 10'h0;
  assign _T_1987 = _T_1734 ? tgts_26 : 10'h0;
  assign _T_1989 = _T_1735 ? tgts_27 : 10'h0;
  assign _T_1991 = _T_1736 ? tgts_28 : 10'h0;
  assign _T_1993 = _T_1737 ? tgts_29 : 10'h0;
  assign _T_1995 = _T_1738 ? tgts_30 : 10'h0;
  assign _T_1997 = _T_1739 ? tgts_31 : 10'h0;
  assign _T_1999 = _T_1740 ? tgts_32 : 10'h0;
  assign _T_2001 = _T_1741 ? tgts_33 : 10'h0;
  assign _T_2003 = _T_1742 ? tgts_34 : 10'h0;
  assign _T_2005 = _T_1743 ? tgts_35 : 10'h0;
  assign _T_2007 = _T_1744 ? tgts_36 : 10'h0;
  assign _T_2009 = _T_1745 ? tgts_37 : 10'h0;
  assign _T_2011 = _T_1746 ? tgts_38 : 10'h0;
  assign _T_2013 = _T_1747 ? tgts_39 : 10'h0;
  assign _T_2015 = _T_1935 | _T_1937;
  assign _T_2016 = _T_2015 | _T_1939;
  assign _T_2017 = _T_2016 | _T_1941;
  assign _T_2018 = _T_2017 | _T_1943;
  assign _T_2019 = _T_2018 | _T_1945;
  assign _T_2020 = _T_2019 | _T_1947;
  assign _T_2021 = _T_2020 | _T_1949;
  assign _T_2022 = _T_2021 | _T_1951;
  assign _T_2023 = _T_2022 | _T_1953;
  assign _T_2024 = _T_2023 | _T_1955;
  assign _T_2025 = _T_2024 | _T_1957;
  assign _T_2026 = _T_2025 | _T_1959;
  assign _T_2027 = _T_2026 | _T_1961;
  assign _T_2028 = _T_2027 | _T_1963;
  assign _T_2029 = _T_2028 | _T_1965;
  assign _T_2030 = _T_2029 | _T_1967;
  assign _T_2031 = _T_2030 | _T_1969;
  assign _T_2032 = _T_2031 | _T_1971;
  assign _T_2033 = _T_2032 | _T_1973;
  assign _T_2034 = _T_2033 | _T_1975;
  assign _T_2035 = _T_2034 | _T_1977;
  assign _T_2036 = _T_2035 | _T_1979;
  assign _T_2037 = _T_2036 | _T_1981;
  assign _T_2038 = _T_2037 | _T_1983;
  assign _T_2039 = _T_2038 | _T_1985;
  assign _T_2040 = _T_2039 | _T_1987;
  assign _T_2041 = _T_2040 | _T_1989;
  assign _T_2042 = _T_2041 | _T_1991;
  assign _T_2043 = _T_2042 | _T_1993;
  assign _T_2044 = _T_2043 | _T_1995;
  assign _T_2045 = _T_2044 | _T_1997;
  assign _T_2046 = _T_2045 | _T_1999;
  assign _T_2047 = _T_2046 | _T_2001;
  assign _T_2048 = _T_2047 | _T_2003;
  assign _T_2049 = _T_2048 | _T_2005;
  assign _T_2050 = _T_2049 | _T_2007;
  assign _T_2051 = _T_2050 | _T_2009;
  assign _T_2052 = _T_2051 | _T_2011;
  assign _T_2053 = _T_2052 | _T_2013;
  assign _T_2054 = _T_2053;
  assign _GEN_484 = {{2'd0}, _T_2054};
  assign _T_2055 = _GEN_484 << 2;
  assign _T_2056 = {_T_1893,_T_2055};
  assign _T_2057 = hits[39:32];
  assign _T_2058 = hits[31:0];
  assign _T_2060 = _T_2057 != 8'h0;
  assign _GEN_485 = {{24'd0}, _T_2057};
  assign _T_2061 = _GEN_485 | _T_2058;
  assign _T_2062 = _T_2061[31:16];
  assign _T_2063 = _T_2061[15:0];
  assign _T_2065 = _T_2062 != 16'h0;
  assign _T_2066 = _T_2062 | _T_2063;
  assign _T_2067 = _T_2066[15:8];
  assign _T_2068 = _T_2066[7:0];
  assign _T_2070 = _T_2067 != 8'h0;
  assign _T_2071 = _T_2067 | _T_2068;
  assign _T_2072 = _T_2071[7:4];
  assign _T_2073 = _T_2071[3:0];
  assign _T_2075 = _T_2072 != 4'h0;
  assign _T_2076 = _T_2072 | _T_2073;
  assign _T_2077 = _T_2076[3:2];
  assign _T_2078 = _T_2076[1:0];
  assign _T_2080 = _T_2077 != 2'h0;
  assign _T_2081 = _T_2077 | _T_2078;
  assign _T_2082 = _T_2081[1];
  assign _T_2083 = {_T_2080,_T_2082};
  assign _T_2084 = {_T_2075,_T_2083};
  assign _T_2085 = {_T_2070,_T_2084};
  assign _T_2086 = {_T_2065,_T_2085};
  assign _T_2087 = {_T_2060,_T_2086};
  assign _T_2129 = _T_1708 ? brIdx_0 : 2'h0;
  assign _T_2131 = _T_1709 ? brIdx_1 : 2'h0;
  assign _T_2133 = _T_1710 ? brIdx_2 : 2'h0;
  assign _T_2135 = _T_1711 ? brIdx_3 : 2'h0;
  assign _T_2137 = _T_1712 ? brIdx_4 : 2'h0;
  assign _T_2139 = _T_1713 ? brIdx_5 : 2'h0;
  assign _T_2141 = _T_1714 ? brIdx_6 : 2'h0;
  assign _T_2143 = _T_1715 ? brIdx_7 : 2'h0;
  assign _T_2145 = _T_1716 ? brIdx_8 : 2'h0;
  assign _T_2147 = _T_1717 ? brIdx_9 : 2'h0;
  assign _T_2149 = _T_1718 ? brIdx_10 : 2'h0;
  assign _T_2151 = _T_1719 ? brIdx_11 : 2'h0;
  assign _T_2153 = _T_1720 ? brIdx_12 : 2'h0;
  assign _T_2155 = _T_1721 ? brIdx_13 : 2'h0;
  assign _T_2157 = _T_1722 ? brIdx_14 : 2'h0;
  assign _T_2159 = _T_1723 ? brIdx_15 : 2'h0;
  assign _T_2161 = _T_1724 ? brIdx_16 : 2'h0;
  assign _T_2163 = _T_1725 ? brIdx_17 : 2'h0;
  assign _T_2165 = _T_1726 ? brIdx_18 : 2'h0;
  assign _T_2167 = _T_1727 ? brIdx_19 : 2'h0;
  assign _T_2169 = _T_1728 ? brIdx_20 : 2'h0;
  assign _T_2171 = _T_1729 ? brIdx_21 : 2'h0;
  assign _T_2173 = _T_1730 ? brIdx_22 : 2'h0;
  assign _T_2175 = _T_1731 ? brIdx_23 : 2'h0;
  assign _T_2177 = _T_1732 ? brIdx_24 : 2'h0;
  assign _T_2179 = _T_1733 ? brIdx_25 : 2'h0;
  assign _T_2181 = _T_1734 ? brIdx_26 : 2'h0;
  assign _T_2183 = _T_1735 ? brIdx_27 : 2'h0;
  assign _T_2185 = _T_1736 ? brIdx_28 : 2'h0;
  assign _T_2187 = _T_1737 ? brIdx_29 : 2'h0;
  assign _T_2189 = _T_1738 ? brIdx_30 : 2'h0;
  assign _T_2191 = _T_1739 ? brIdx_31 : 2'h0;
  assign _T_2193 = _T_1740 ? brIdx_32 : 2'h0;
  assign _T_2195 = _T_1741 ? brIdx_33 : 2'h0;
  assign _T_2197 = _T_1742 ? brIdx_34 : 2'h0;
  assign _T_2199 = _T_1743 ? brIdx_35 : 2'h0;
  assign _T_2201 = _T_1744 ? brIdx_36 : 2'h0;
  assign _T_2203 = _T_1745 ? brIdx_37 : 2'h0;
  assign _T_2205 = _T_1746 ? brIdx_38 : 2'h0;
  assign _T_2207 = _T_1747 ? brIdx_39 : 2'h0;
  assign _T_2209 = _T_2129 | _T_2131;
  assign _T_2210 = _T_2209 | _T_2133;
  assign _T_2211 = _T_2210 | _T_2135;
  assign _T_2212 = _T_2211 | _T_2137;
  assign _T_2213 = _T_2212 | _T_2139;
  assign _T_2214 = _T_2213 | _T_2141;
  assign _T_2215 = _T_2214 | _T_2143;
  assign _T_2216 = _T_2215 | _T_2145;
  assign _T_2217 = _T_2216 | _T_2147;
  assign _T_2218 = _T_2217 | _T_2149;
  assign _T_2219 = _T_2218 | _T_2151;
  assign _T_2220 = _T_2219 | _T_2153;
  assign _T_2221 = _T_2220 | _T_2155;
  assign _T_2222 = _T_2221 | _T_2157;
  assign _T_2223 = _T_2222 | _T_2159;
  assign _T_2224 = _T_2223 | _T_2161;
  assign _T_2225 = _T_2224 | _T_2163;
  assign _T_2226 = _T_2225 | _T_2165;
  assign _T_2227 = _T_2226 | _T_2167;
  assign _T_2228 = _T_2227 | _T_2169;
  assign _T_2229 = _T_2228 | _T_2171;
  assign _T_2230 = _T_2229 | _T_2173;
  assign _T_2231 = _T_2230 | _T_2175;
  assign _T_2232 = _T_2231 | _T_2177;
  assign _T_2233 = _T_2232 | _T_2179;
  assign _T_2234 = _T_2233 | _T_2181;
  assign _T_2235 = _T_2234 | _T_2183;
  assign _T_2236 = _T_2235 | _T_2185;
  assign _T_2237 = _T_2236 | _T_2187;
  assign _T_2238 = _T_2237 | _T_2189;
  assign _T_2239 = _T_2238 | _T_2191;
  assign _T_2240 = _T_2239 | _T_2193;
  assign _T_2241 = _T_2240 | _T_2195;
  assign _T_2242 = _T_2241 | _T_2197;
  assign _T_2243 = _T_2242 | _T_2199;
  assign _T_2244 = _T_2243 | _T_2201;
  assign _T_2245 = _T_2244 | _T_2203;
  assign _T_2246 = _T_2245 | _T_2205;
  assign _T_2247 = _T_2246 | _T_2207;
  assign _T_2248 = _T_2247;
  assign _T_2250 = ~ io_resp_bits_bridx;
  assign _T_2252 = io_resp_bits_taken ? _T_2250 : 2'h0;
  assign _T_2253 = ~ _T_2252;
  assign _T_2254 = 4'h1 << _T_2253;
  assign _T_2256 = _T_2254 - 4'h1;
  assign _T_2257 = _T_2256[3:0];
  assign _T_2259 = {_T_2257,1'h1};
  assign _T_2260 = hits[19:0];
  assign _T_2261 = _T_2260[9:0];
  assign _T_2262 = _T_2261[4:0];
  assign _T_2263 = _T_2262[1:0];
  assign _T_2264 = _T_2263[0];
  assign _T_2267 = _T_2263[1];
  assign _T_2270 = _T_2264 | _T_2267;
  assign _T_2272 = _T_2264 & _T_2267;
  assign _T_2274 = _T_2262[4:2];
  assign _T_2275 = _T_2274[0];
  assign _T_2278 = _T_2274[2:1];
  assign _T_2279 = _T_2278[0];
  assign _T_2282 = _T_2278[1];
  assign _T_2285 = _T_2279 | _T_2282;
  assign _T_2287 = _T_2279 & _T_2282;
  assign _T_2289 = _T_2275 | _T_2285;
  assign _T_2291 = _T_2275 & _T_2285;
  assign _T_2292 = _T_2287 | _T_2291;
  assign _T_2293 = _T_2270 | _T_2289;
  assign _T_2294 = _T_2272 | _T_2292;
  assign _T_2295 = _T_2270 & _T_2289;
  assign _T_2296 = _T_2294 | _T_2295;
  assign _T_2297 = _T_2261[9:5];
  assign _T_2298 = _T_2297[1:0];
  assign _T_2299 = _T_2298[0];
  assign _T_2302 = _T_2298[1];
  assign _T_2305 = _T_2299 | _T_2302;
  assign _T_2307 = _T_2299 & _T_2302;
  assign _T_2309 = _T_2297[4:2];
  assign _T_2310 = _T_2309[0];
  assign _T_2313 = _T_2309[2:1];
  assign _T_2314 = _T_2313[0];
  assign _T_2317 = _T_2313[1];
  assign _T_2320 = _T_2314 | _T_2317;
  assign _T_2322 = _T_2314 & _T_2317;
  assign _T_2324 = _T_2310 | _T_2320;
  assign _T_2326 = _T_2310 & _T_2320;
  assign _T_2327 = _T_2322 | _T_2326;
  assign _T_2328 = _T_2305 | _T_2324;
  assign _T_2329 = _T_2307 | _T_2327;
  assign _T_2330 = _T_2305 & _T_2324;
  assign _T_2331 = _T_2329 | _T_2330;
  assign _T_2332 = _T_2293 | _T_2328;
  assign _T_2333 = _T_2296 | _T_2331;
  assign _T_2334 = _T_2293 & _T_2328;
  assign _T_2335 = _T_2333 | _T_2334;
  assign _T_2336 = _T_2260[19:10];
  assign _T_2337 = _T_2336[4:0];
  assign _T_2338 = _T_2337[1:0];
  assign _T_2339 = _T_2338[0];
  assign _T_2342 = _T_2338[1];
  assign _T_2345 = _T_2339 | _T_2342;
  assign _T_2347 = _T_2339 & _T_2342;
  assign _T_2349 = _T_2337[4:2];
  assign _T_2350 = _T_2349[0];
  assign _T_2353 = _T_2349[2:1];
  assign _T_2354 = _T_2353[0];
  assign _T_2357 = _T_2353[1];
  assign _T_2360 = _T_2354 | _T_2357;
  assign _T_2362 = _T_2354 & _T_2357;
  assign _T_2364 = _T_2350 | _T_2360;
  assign _T_2366 = _T_2350 & _T_2360;
  assign _T_2367 = _T_2362 | _T_2366;
  assign _T_2368 = _T_2345 | _T_2364;
  assign _T_2369 = _T_2347 | _T_2367;
  assign _T_2370 = _T_2345 & _T_2364;
  assign _T_2371 = _T_2369 | _T_2370;
  assign _T_2372 = _T_2336[9:5];
  assign _T_2373 = _T_2372[1:0];
  assign _T_2374 = _T_2373[0];
  assign _T_2377 = _T_2373[1];
  assign _T_2380 = _T_2374 | _T_2377;
  assign _T_2382 = _T_2374 & _T_2377;
  assign _T_2384 = _T_2372[4:2];
  assign _T_2385 = _T_2384[0];
  assign _T_2388 = _T_2384[2:1];
  assign _T_2389 = _T_2388[0];
  assign _T_2392 = _T_2388[1];
  assign _T_2395 = _T_2389 | _T_2392;
  assign _T_2397 = _T_2389 & _T_2392;
  assign _T_2399 = _T_2385 | _T_2395;
  assign _T_2401 = _T_2385 & _T_2395;
  assign _T_2402 = _T_2397 | _T_2401;
  assign _T_2403 = _T_2380 | _T_2399;
  assign _T_2404 = _T_2382 | _T_2402;
  assign _T_2405 = _T_2380 & _T_2399;
  assign _T_2406 = _T_2404 | _T_2405;
  assign _T_2407 = _T_2368 | _T_2403;
  assign _T_2408 = _T_2371 | _T_2406;
  assign _T_2409 = _T_2368 & _T_2403;
  assign _T_2410 = _T_2408 | _T_2409;
  assign _T_2411 = _T_2332 | _T_2407;
  assign _T_2412 = _T_2335 | _T_2410;
  assign _T_2413 = _T_2332 & _T_2407;
  assign _T_2414 = _T_2412 | _T_2413;
  assign _T_2415 = hits[39:20];
  assign _T_2416 = _T_2415[9:0];
  assign _T_2417 = _T_2416[4:0];
  assign _T_2418 = _T_2417[1:0];
  assign _T_2419 = _T_2418[0];
  assign _T_2422 = _T_2418[1];
  assign _T_2425 = _T_2419 | _T_2422;
  assign _T_2427 = _T_2419 & _T_2422;
  assign _T_2429 = _T_2417[4:2];
  assign _T_2430 = _T_2429[0];
  assign _T_2433 = _T_2429[2:1];
  assign _T_2434 = _T_2433[0];
  assign _T_2437 = _T_2433[1];
  assign _T_2440 = _T_2434 | _T_2437;
  assign _T_2442 = _T_2434 & _T_2437;
  assign _T_2444 = _T_2430 | _T_2440;
  assign _T_2446 = _T_2430 & _T_2440;
  assign _T_2447 = _T_2442 | _T_2446;
  assign _T_2448 = _T_2425 | _T_2444;
  assign _T_2449 = _T_2427 | _T_2447;
  assign _T_2450 = _T_2425 & _T_2444;
  assign _T_2451 = _T_2449 | _T_2450;
  assign _T_2452 = _T_2416[9:5];
  assign _T_2453 = _T_2452[1:0];
  assign _T_2454 = _T_2453[0];
  assign _T_2457 = _T_2453[1];
  assign _T_2460 = _T_2454 | _T_2457;
  assign _T_2462 = _T_2454 & _T_2457;
  assign _T_2464 = _T_2452[4:2];
  assign _T_2465 = _T_2464[0];
  assign _T_2468 = _T_2464[2:1];
  assign _T_2469 = _T_2468[0];
  assign _T_2472 = _T_2468[1];
  assign _T_2475 = _T_2469 | _T_2472;
  assign _T_2477 = _T_2469 & _T_2472;
  assign _T_2479 = _T_2465 | _T_2475;
  assign _T_2481 = _T_2465 & _T_2475;
  assign _T_2482 = _T_2477 | _T_2481;
  assign _T_2483 = _T_2460 | _T_2479;
  assign _T_2484 = _T_2462 | _T_2482;
  assign _T_2485 = _T_2460 & _T_2479;
  assign _T_2486 = _T_2484 | _T_2485;
  assign _T_2487 = _T_2448 | _T_2483;
  assign _T_2488 = _T_2451 | _T_2486;
  assign _T_2489 = _T_2448 & _T_2483;
  assign _T_2490 = _T_2488 | _T_2489;
  assign _T_2491 = _T_2415[19:10];
  assign _T_2492 = _T_2491[4:0];
  assign _T_2493 = _T_2492[1:0];
  assign _T_2494 = _T_2493[0];
  assign _T_2497 = _T_2493[1];
  assign _T_2500 = _T_2494 | _T_2497;
  assign _T_2502 = _T_2494 & _T_2497;
  assign _T_2504 = _T_2492[4:2];
  assign _T_2505 = _T_2504[0];
  assign _T_2508 = _T_2504[2:1];
  assign _T_2509 = _T_2508[0];
  assign _T_2512 = _T_2508[1];
  assign _T_2515 = _T_2509 | _T_2512;
  assign _T_2517 = _T_2509 & _T_2512;
  assign _T_2519 = _T_2505 | _T_2515;
  assign _T_2521 = _T_2505 & _T_2515;
  assign _T_2522 = _T_2517 | _T_2521;
  assign _T_2523 = _T_2500 | _T_2519;
  assign _T_2524 = _T_2502 | _T_2522;
  assign _T_2525 = _T_2500 & _T_2519;
  assign _T_2526 = _T_2524 | _T_2525;
  assign _T_2527 = _T_2491[9:5];
  assign _T_2528 = _T_2527[1:0];
  assign _T_2529 = _T_2528[0];
  assign _T_2532 = _T_2528[1];
  assign _T_2535 = _T_2529 | _T_2532;
  assign _T_2537 = _T_2529 & _T_2532;
  assign _T_2539 = _T_2527[4:2];
  assign _T_2540 = _T_2539[0];
  assign _T_2543 = _T_2539[2:1];
  assign _T_2544 = _T_2543[0];
  assign _T_2547 = _T_2543[1];
  assign _T_2550 = _T_2544 | _T_2547;
  assign _T_2552 = _T_2544 & _T_2547;
  assign _T_2554 = _T_2540 | _T_2550;
  assign _T_2556 = _T_2540 & _T_2550;
  assign _T_2557 = _T_2552 | _T_2556;
  assign _T_2558 = _T_2535 | _T_2554;
  assign _T_2559 = _T_2537 | _T_2557;
  assign _T_2560 = _T_2535 & _T_2554;
  assign _T_2561 = _T_2559 | _T_2560;
  assign _T_2562 = _T_2523 | _T_2558;
  assign _T_2563 = _T_2526 | _T_2561;
  assign _T_2564 = _T_2523 & _T_2558;
  assign _T_2565 = _T_2563 | _T_2564;
  assign _T_2566 = _T_2487 | _T_2562;
  assign _T_2567 = _T_2490 | _T_2565;
  assign _T_2568 = _T_2487 & _T_2562;
  assign _T_2569 = _T_2567 | _T_2568;
  assign _T_2571 = _T_2414 | _T_2569;
  assign _T_2572 = _T_2411 & _T_2566;
  assign _T_2573 = _T_2571 | _T_2572;
  assign _T_2574 = ~ hits;
  assign _T_2575 = isValid & _T_2574;
  assign _GEN_441 = _T_2573 ? {{24'd0}, _T_2575} : _GEN_391;
  assign _T_2578__T_2596_addr = _T_2595;
  assign _T_2578__T_2596_data = _T_2578[_T_2578__T_2596_addr];
  assign _T_2578__T_2603_data = _T_2612;
  assign _T_2578__T_2603_addr = _T_2602;
  assign _T_2578__T_2603_mask = _T_2600;
  assign _T_2578__T_2603_en = _T_2600;
  assign _T_2581 = hits & isJump;
  assign _T_2583 = _T_2581 != 40'h0;
  assign _T_2585 = _T_2583 == 1'h0;
  assign _T_2586 = io_req_valid & io_resp_valid;
  assign _T_2587 = _T_2586 & _T_2585;
  assign _T_2591_history = _T_2580;
  assign _T_2591_value = _T_2578__T_2596_data;
  assign _T_2594 = io_req_bits_addr[8:2];
  assign _T_2595 = _T_2594 ^ _T_2580;
  assign _T_2597 = _T_2591_value[0];
  assign _T_2598 = _T_2580[6:1];
  assign _T_2599 = {_T_2597,_T_2598};
  assign _GEN_442 = _T_2587 ? _T_2599 : _T_2580;
  assign _T_2600 = io_bht_update_valid & io_bht_update_bits_prediction_valid;
  assign _T_2601 = io_bht_update_bits_pc[8:2];
  assign _T_2602 = _T_2601 ^ io_bht_update_bits_prediction_bits_bht_history;
  assign _T_2604 = io_bht_update_bits_prediction_bits_bht_value[1];
  assign _T_2605 = io_bht_update_bits_prediction_bits_bht_value[0];
  assign _T_2606 = _T_2604 & _T_2605;
  assign _T_2609 = _T_2604 | _T_2605;
  assign _T_2610 = _T_2609 & io_bht_update_bits_taken;
  assign _T_2611 = _T_2606 | _T_2610;
  assign _T_2612 = {io_bht_update_bits_taken,_T_2611};
  assign _T_2613 = io_bht_update_bits_prediction_bits_bht_history[6:1];
  assign _T_2614 = {io_bht_update_bits_taken,_T_2613};
  assign _GEN_443 = io_bht_update_bits_mispredict ? _T_2614 : _GEN_442;
  assign _GEN_448 = _T_2600 ? _GEN_443 : _GEN_442;
  assign _T_2617 = _T_2597 == 1'h0;
  assign _T_2618 = _T_2617 & _T_2585;
  assign _GEN_449 = _T_2618 ? 1'h0 : 1'h1;
  assign _T_2629 = hits & isReturn;
  assign _T_2631 = _T_2629 != 40'h0;
  assign _T_2633 = _T_2621 == 2'h0;
  assign _T_2635 = _T_2633 == 1'h0;
  assign _T_2636 = _T_2635 & _T_2631;
  assign _GEN_5 = _GEN_450;
  assign _GEN_450 = _T_2623 ? _T_2627_1 : _T_2627_0;
  assign _GEN_451 = _T_2636 ? _GEN_5 : _T_2056;
  assign _T_2638 = _T_2621 < 2'h2;
  assign _T_2640 = _T_2621 + 2'h1;
  assign _T_2641 = _T_2640[1:0];
  assign _GEN_452 = _T_2638 ? _T_2641 : _T_2621;
  assign _T_2647 = _T_2623 + 1'h1;
  assign _T_2648 = _T_2647[0:0];
  assign _GEN_6 = io_ras_update_bits_returnAddr;
  assign _GEN_453 = 1'h0 == _T_2648 ? _GEN_6 : _T_2627_0;
  assign _GEN_454 = _T_2648 ? _GEN_6 : _T_2627_1;
  assign _GEN_455 = _T_2631 ? io_ras_update_bits_returnAddr : _GEN_451;
  assign _GEN_456 = io_ras_update_bits_isCall ? _GEN_452 : _T_2621;
  assign _GEN_457 = io_ras_update_bits_isCall ? _GEN_453 : _T_2627_0;
  assign _GEN_458 = io_ras_update_bits_isCall ? _GEN_454 : _T_2627_1;
  assign _GEN_459 = io_ras_update_bits_isCall ? _T_2648 : _T_2623;
  assign _GEN_460 = io_ras_update_bits_isCall ? _GEN_455 : _GEN_451;
  assign _T_2651 = io_ras_update_bits_isReturn & io_ras_update_bits_prediction_valid;
  assign _T_2653 = io_ras_update_bits_isCall == 1'h0;
  assign _T_2654 = _T_2653 & _T_2651;
  assign _T_2660 = _T_2621 - 2'h1;
  assign _T_2661 = _T_2660[1:0];
  assign _T_2667 = _T_2623 - 1'h1;
  assign _T_2668 = _T_2667[0:0];
  assign _GEN_461 = _T_2635 ? _T_2661 : _GEN_456;
  assign _GEN_462 = _T_2635 ? _T_2668 : _GEN_459;
  assign _GEN_463 = _T_2654 ? _GEN_461 : _GEN_456;
  assign _GEN_464 = _T_2654 ? _GEN_462 : _GEN_459;
  assign _GEN_465 = io_ras_update_valid ? _GEN_463 : _T_2621;
  assign _GEN_466 = io_ras_update_valid ? _GEN_457 : _T_2627_0;
  assign _GEN_467 = io_ras_update_valid ? _GEN_458 : _T_2627_1;
  assign _GEN_468 = io_ras_update_valid ? _GEN_464 : _T_2623;
  assign _GEN_469 = io_ras_update_valid ? _GEN_460 : _GEN_451;
`ifdef RANDOMIZE
  integer initvar;
  initial begin
    `ifndef verilator
      #0.002 begin end
    `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_444 = {1{$random}};
  idxs_0 = _GEN_444[9:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_445 = {1{$random}};
  idxs_1 = _GEN_445[9:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_446 = {1{$random}};
  idxs_2 = _GEN_446[9:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_447 = {1{$random}};
  idxs_3 = _GEN_447[9:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_470 = {1{$random}};
  idxs_4 = _GEN_470[9:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_471 = {1{$random}};
  idxs_5 = _GEN_471[9:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_472 = {1{$random}};
  idxs_6 = _GEN_472[9:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_473 = {1{$random}};
  idxs_7 = _GEN_473[9:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_474 = {1{$random}};
  idxs_8 = _GEN_474[9:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_475 = {1{$random}};
  idxs_9 = _GEN_475[9:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_478 = {1{$random}};
  idxs_10 = _GEN_478[9:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_480 = {1{$random}};
  idxs_11 = _GEN_480[9:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_482 = {1{$random}};
  idxs_12 = _GEN_482[9:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_486 = {1{$random}};
  idxs_13 = _GEN_486[9:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_487 = {1{$random}};
  idxs_14 = _GEN_487[9:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_488 = {1{$random}};
  idxs_15 = _GEN_488[9:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_489 = {1{$random}};
  idxs_16 = _GEN_489[9:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_490 = {1{$random}};
  idxs_17 = _GEN_490[9:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_491 = {1{$random}};
  idxs_18 = _GEN_491[9:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_492 = {1{$random}};
  idxs_19 = _GEN_492[9:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_493 = {1{$random}};
  idxs_20 = _GEN_493[9:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_494 = {1{$random}};
  idxs_21 = _GEN_494[9:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_495 = {1{$random}};
  idxs_22 = _GEN_495[9:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_496 = {1{$random}};
  idxs_23 = _GEN_496[9:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_497 = {1{$random}};
  idxs_24 = _GEN_497[9:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_498 = {1{$random}};
  idxs_25 = _GEN_498[9:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_499 = {1{$random}};
  idxs_26 = _GEN_499[9:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_500 = {1{$random}};
  idxs_27 = _GEN_500[9:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_501 = {1{$random}};
  idxs_28 = _GEN_501[9:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_502 = {1{$random}};
  idxs_29 = _GEN_502[9:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_503 = {1{$random}};
  idxs_30 = _GEN_503[9:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_504 = {1{$random}};
  idxs_31 = _GEN_504[9:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_505 = {1{$random}};
  idxs_32 = _GEN_505[9:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_506 = {1{$random}};
  idxs_33 = _GEN_506[9:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_507 = {1{$random}};
  idxs_34 = _GEN_507[9:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_508 = {1{$random}};
  idxs_35 = _GEN_508[9:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_509 = {1{$random}};
  idxs_36 = _GEN_509[9:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_510 = {1{$random}};
  idxs_37 = _GEN_510[9:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_511 = {1{$random}};
  idxs_38 = _GEN_511[9:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_512 = {1{$random}};
  idxs_39 = _GEN_512[9:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_513 = {1{$random}};
  idxPages_0 = _GEN_513[2:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_514 = {1{$random}};
  idxPages_1 = _GEN_514[2:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_515 = {1{$random}};
  idxPages_2 = _GEN_515[2:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_516 = {1{$random}};
  idxPages_3 = _GEN_516[2:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_517 = {1{$random}};
  idxPages_4 = _GEN_517[2:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_518 = {1{$random}};
  idxPages_5 = _GEN_518[2:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_519 = {1{$random}};
  idxPages_6 = _GEN_519[2:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_520 = {1{$random}};
  idxPages_7 = _GEN_520[2:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_521 = {1{$random}};
  idxPages_8 = _GEN_521[2:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_522 = {1{$random}};
  idxPages_9 = _GEN_522[2:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_523 = {1{$random}};
  idxPages_10 = _GEN_523[2:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_524 = {1{$random}};
  idxPages_11 = _GEN_524[2:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_525 = {1{$random}};
  idxPages_12 = _GEN_525[2:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_526 = {1{$random}};
  idxPages_13 = _GEN_526[2:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_527 = {1{$random}};
  idxPages_14 = _GEN_527[2:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_528 = {1{$random}};
  idxPages_15 = _GEN_528[2:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_529 = {1{$random}};
  idxPages_16 = _GEN_529[2:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_530 = {1{$random}};
  idxPages_17 = _GEN_530[2:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_531 = {1{$random}};
  idxPages_18 = _GEN_531[2:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_532 = {1{$random}};
  idxPages_19 = _GEN_532[2:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_533 = {1{$random}};
  idxPages_20 = _GEN_533[2:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_534 = {1{$random}};
  idxPages_21 = _GEN_534[2:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_535 = {1{$random}};
  idxPages_22 = _GEN_535[2:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_536 = {1{$random}};
  idxPages_23 = _GEN_536[2:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_537 = {1{$random}};
  idxPages_24 = _GEN_537[2:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_538 = {1{$random}};
  idxPages_25 = _GEN_538[2:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_539 = {1{$random}};
  idxPages_26 = _GEN_539[2:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_540 = {1{$random}};
  idxPages_27 = _GEN_540[2:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_541 = {1{$random}};
  idxPages_28 = _GEN_541[2:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_542 = {1{$random}};
  idxPages_29 = _GEN_542[2:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_543 = {1{$random}};
  idxPages_30 = _GEN_543[2:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_544 = {1{$random}};
  idxPages_31 = _GEN_544[2:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_545 = {1{$random}};
  idxPages_32 = _GEN_545[2:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_546 = {1{$random}};
  idxPages_33 = _GEN_546[2:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_547 = {1{$random}};
  idxPages_34 = _GEN_547[2:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_548 = {1{$random}};
  idxPages_35 = _GEN_548[2:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_549 = {1{$random}};
  idxPages_36 = _GEN_549[2:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_550 = {1{$random}};
  idxPages_37 = _GEN_550[2:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_551 = {1{$random}};
  idxPages_38 = _GEN_551[2:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_552 = {1{$random}};
  idxPages_39 = _GEN_552[2:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_553 = {1{$random}};
  tgts_0 = _GEN_553[9:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_554 = {1{$random}};
  tgts_1 = _GEN_554[9:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_555 = {1{$random}};
  tgts_2 = _GEN_555[9:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_556 = {1{$random}};
  tgts_3 = _GEN_556[9:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_557 = {1{$random}};
  tgts_4 = _GEN_557[9:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_558 = {1{$random}};
  tgts_5 = _GEN_558[9:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_559 = {1{$random}};
  tgts_6 = _GEN_559[9:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_560 = {1{$random}};
  tgts_7 = _GEN_560[9:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_561 = {1{$random}};
  tgts_8 = _GEN_561[9:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_562 = {1{$random}};
  tgts_9 = _GEN_562[9:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_563 = {1{$random}};
  tgts_10 = _GEN_563[9:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_564 = {1{$random}};
  tgts_11 = _GEN_564[9:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_565 = {1{$random}};
  tgts_12 = _GEN_565[9:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_566 = {1{$random}};
  tgts_13 = _GEN_566[9:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_567 = {1{$random}};
  tgts_14 = _GEN_567[9:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_568 = {1{$random}};
  tgts_15 = _GEN_568[9:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_569 = {1{$random}};
  tgts_16 = _GEN_569[9:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_570 = {1{$random}};
  tgts_17 = _GEN_570[9:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_571 = {1{$random}};
  tgts_18 = _GEN_571[9:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_572 = {1{$random}};
  tgts_19 = _GEN_572[9:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_573 = {1{$random}};
  tgts_20 = _GEN_573[9:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_574 = {1{$random}};
  tgts_21 = _GEN_574[9:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_575 = {1{$random}};
  tgts_22 = _GEN_575[9:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_576 = {1{$random}};
  tgts_23 = _GEN_576[9:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_577 = {1{$random}};
  tgts_24 = _GEN_577[9:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_578 = {1{$random}};
  tgts_25 = _GEN_578[9:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_579 = {1{$random}};
  tgts_26 = _GEN_579[9:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_580 = {1{$random}};
  tgts_27 = _GEN_580[9:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_581 = {1{$random}};
  tgts_28 = _GEN_581[9:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_582 = {1{$random}};
  tgts_29 = _GEN_582[9:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_583 = {1{$random}};
  tgts_30 = _GEN_583[9:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_584 = {1{$random}};
  tgts_31 = _GEN_584[9:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_585 = {1{$random}};
  tgts_32 = _GEN_585[9:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_586 = {1{$random}};
  tgts_33 = _GEN_586[9:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_587 = {1{$random}};
  tgts_34 = _GEN_587[9:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_588 = {1{$random}};
  tgts_35 = _GEN_588[9:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_589 = {1{$random}};
  tgts_36 = _GEN_589[9:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_590 = {1{$random}};
  tgts_37 = _GEN_590[9:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_591 = {1{$random}};
  tgts_38 = _GEN_591[9:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_592 = {1{$random}};
  tgts_39 = _GEN_592[9:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_593 = {1{$random}};
  tgtPages_0 = _GEN_593[2:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_594 = {1{$random}};
  tgtPages_1 = _GEN_594[2:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_595 = {1{$random}};
  tgtPages_2 = _GEN_595[2:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_596 = {1{$random}};
  tgtPages_3 = _GEN_596[2:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_597 = {1{$random}};
  tgtPages_4 = _GEN_597[2:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_598 = {1{$random}};
  tgtPages_5 = _GEN_598[2:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_599 = {1{$random}};
  tgtPages_6 = _GEN_599[2:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_600 = {1{$random}};
  tgtPages_7 = _GEN_600[2:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_601 = {1{$random}};
  tgtPages_8 = _GEN_601[2:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_602 = {1{$random}};
  tgtPages_9 = _GEN_602[2:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_603 = {1{$random}};
  tgtPages_10 = _GEN_603[2:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_604 = {1{$random}};
  tgtPages_11 = _GEN_604[2:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_605 = {1{$random}};
  tgtPages_12 = _GEN_605[2:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_606 = {1{$random}};
  tgtPages_13 = _GEN_606[2:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_607 = {1{$random}};
  tgtPages_14 = _GEN_607[2:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_608 = {1{$random}};
  tgtPages_15 = _GEN_608[2:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_609 = {1{$random}};
  tgtPages_16 = _GEN_609[2:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_610 = {1{$random}};
  tgtPages_17 = _GEN_610[2:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_611 = {1{$random}};
  tgtPages_18 = _GEN_611[2:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_612 = {1{$random}};
  tgtPages_19 = _GEN_612[2:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_613 = {1{$random}};
  tgtPages_20 = _GEN_613[2:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_614 = {1{$random}};
  tgtPages_21 = _GEN_614[2:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_615 = {1{$random}};
  tgtPages_22 = _GEN_615[2:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_616 = {1{$random}};
  tgtPages_23 = _GEN_616[2:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_617 = {1{$random}};
  tgtPages_24 = _GEN_617[2:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_618 = {1{$random}};
  tgtPages_25 = _GEN_618[2:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_619 = {1{$random}};
  tgtPages_26 = _GEN_619[2:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_620 = {1{$random}};
  tgtPages_27 = _GEN_620[2:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_621 = {1{$random}};
  tgtPages_28 = _GEN_621[2:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_622 = {1{$random}};
  tgtPages_29 = _GEN_622[2:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_623 = {1{$random}};
  tgtPages_30 = _GEN_623[2:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_624 = {1{$random}};
  tgtPages_31 = _GEN_624[2:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_625 = {1{$random}};
  tgtPages_32 = _GEN_625[2:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_626 = {1{$random}};
  tgtPages_33 = _GEN_626[2:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_627 = {1{$random}};
  tgtPages_34 = _GEN_627[2:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_628 = {1{$random}};
  tgtPages_35 = _GEN_628[2:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_629 = {1{$random}};
  tgtPages_36 = _GEN_629[2:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_630 = {1{$random}};
  tgtPages_37 = _GEN_630[2:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_631 = {1{$random}};
  tgtPages_38 = _GEN_631[2:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_632 = {1{$random}};
  tgtPages_39 = _GEN_632[2:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_633 = {1{$random}};
  pages_0 = _GEN_633[26:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_634 = {1{$random}};
  pages_1 = _GEN_634[26:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_635 = {1{$random}};
  pages_2 = _GEN_635[26:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_636 = {1{$random}};
  pages_3 = _GEN_636[26:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_637 = {1{$random}};
  pages_4 = _GEN_637[26:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_638 = {1{$random}};
  pages_5 = _GEN_638[26:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_639 = {1{$random}};
  pageValid = _GEN_639[5:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_640 = {2{$random}};
  isValid = _GEN_640[39:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_641 = {2{$random}};
  isReturn = _GEN_641[39:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_642 = {2{$random}};
  isJump = _GEN_642[39:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_643 = {1{$random}};
  brIdx_0 = _GEN_643[1:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_644 = {1{$random}};
  brIdx_1 = _GEN_644[1:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_645 = {1{$random}};
  brIdx_2 = _GEN_645[1:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_646 = {1{$random}};
  brIdx_3 = _GEN_646[1:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_647 = {1{$random}};
  brIdx_4 = _GEN_647[1:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_648 = {1{$random}};
  brIdx_5 = _GEN_648[1:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_649 = {1{$random}};
  brIdx_6 = _GEN_649[1:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_650 = {1{$random}};
  brIdx_7 = _GEN_650[1:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_651 = {1{$random}};
  brIdx_8 = _GEN_651[1:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_652 = {1{$random}};
  brIdx_9 = _GEN_652[1:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_653 = {1{$random}};
  brIdx_10 = _GEN_653[1:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_654 = {1{$random}};
  brIdx_11 = _GEN_654[1:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_655 = {1{$random}};
  brIdx_12 = _GEN_655[1:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_656 = {1{$random}};
  brIdx_13 = _GEN_656[1:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_657 = {1{$random}};
  brIdx_14 = _GEN_657[1:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_658 = {1{$random}};
  brIdx_15 = _GEN_658[1:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_659 = {1{$random}};
  brIdx_16 = _GEN_659[1:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_660 = {1{$random}};
  brIdx_17 = _GEN_660[1:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_661 = {1{$random}};
  brIdx_18 = _GEN_661[1:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_662 = {1{$random}};
  brIdx_19 = _GEN_662[1:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_663 = {1{$random}};
  brIdx_20 = _GEN_663[1:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_664 = {1{$random}};
  brIdx_21 = _GEN_664[1:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_665 = {1{$random}};
  brIdx_22 = _GEN_665[1:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_666 = {1{$random}};
  brIdx_23 = _GEN_666[1:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_667 = {1{$random}};
  brIdx_24 = _GEN_667[1:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_668 = {1{$random}};
  brIdx_25 = _GEN_668[1:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_669 = {1{$random}};
  brIdx_26 = _GEN_669[1:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_670 = {1{$random}};
  brIdx_27 = _GEN_670[1:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_671 = {1{$random}};
  brIdx_28 = _GEN_671[1:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_672 = {1{$random}};
  brIdx_29 = _GEN_672[1:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_673 = {1{$random}};
  brIdx_30 = _GEN_673[1:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_674 = {1{$random}};
  brIdx_31 = _GEN_674[1:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_675 = {1{$random}};
  brIdx_32 = _GEN_675[1:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_676 = {1{$random}};
  brIdx_33 = _GEN_676[1:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_677 = {1{$random}};
  brIdx_34 = _GEN_677[1:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_678 = {1{$random}};
  brIdx_35 = _GEN_678[1:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_679 = {1{$random}};
  brIdx_36 = _GEN_679[1:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_680 = {1{$random}};
  brIdx_37 = _GEN_680[1:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_681 = {1{$random}};
  brIdx_38 = _GEN_681[1:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_682 = {1{$random}};
  brIdx_39 = _GEN_682[1:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_683 = {1{$random}};
  _T_785 = _GEN_683[0:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_684 = {1{$random}};
  _T_824_prediction_valid = _GEN_684[0:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_685 = {1{$random}};
  _T_824_prediction_bits_taken = _GEN_685[0:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_686 = {1{$random}};
  _T_824_prediction_bits_mask = _GEN_686[3:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_687 = {1{$random}};
  _T_824_prediction_bits_bridx = _GEN_687[1:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_688 = {2{$random}};
  _T_824_prediction_bits_target = _GEN_688[38:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_689 = {1{$random}};
  _T_824_prediction_bits_entry = _GEN_689[5:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_690 = {1{$random}};
  _T_824_prediction_bits_bht_history = _GEN_690[6:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_691 = {1{$random}};
  _T_824_prediction_bits_bht_value = _GEN_691[1:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_692 = {2{$random}};
  _T_824_pc = _GEN_692[38:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_693 = {2{$random}};
  _T_824_target = _GEN_693[38:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_694 = {1{$random}};
  _T_824_taken = _GEN_694[0:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_695 = {1{$random}};
  _T_824_isValid = _GEN_695[0:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_696 = {1{$random}};
  _T_824_isJump = _GEN_696[0:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_697 = {1{$random}};
  _T_824_isReturn = _GEN_697[0:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_698 = {2{$random}};
  _T_824_br_pc = _GEN_698[38:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_699 = {1{$random}};
  nextRepl = _GEN_699[5:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_700 = {1{$random}};
  nextPageRepl = _GEN_700[2:0];
  `endif
  _GEN_701 = {1{$random}};
  `ifdef RANDOMIZE_MEM_INIT
  for (initvar = 0; initvar < 128; initvar = initvar+1)
    _T_2578[initvar] = _GEN_701[1:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_702 = {1{$random}};
  _T_2580 = _GEN_702[6:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_703 = {1{$random}};
  _T_2621 = _GEN_703[1:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_704 = {1{$random}};
  _T_2623 = _GEN_704[0:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_705 = {2{$random}};
  _T_2627_0 = _GEN_705[38:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_706 = {2{$random}};
  _T_2627_1 = _GEN_706[38:0];
  `endif
  end
`endif
  always @(posedge clock) begin
    if (r_btb_update_valid) begin
      if (6'h0 == _T_1668) begin
        idxs_0 <= _GEN_0;
      end
    end
    if (r_btb_update_valid) begin
      if (6'h1 == _T_1668) begin
        idxs_1 <= _GEN_0;
      end
    end
    if (r_btb_update_valid) begin
      if (6'h2 == _T_1668) begin
        idxs_2 <= _GEN_0;
      end
    end
    if (r_btb_update_valid) begin
      if (6'h3 == _T_1668) begin
        idxs_3 <= _GEN_0;
      end
    end
    if (r_btb_update_valid) begin
      if (6'h4 == _T_1668) begin
        idxs_4 <= _GEN_0;
      end
    end
    if (r_btb_update_valid) begin
      if (6'h5 == _T_1668) begin
        idxs_5 <= _GEN_0;
      end
    end
    if (r_btb_update_valid) begin
      if (6'h6 == _T_1668) begin
        idxs_6 <= _GEN_0;
      end
    end
    if (r_btb_update_valid) begin
      if (6'h7 == _T_1668) begin
        idxs_7 <= _GEN_0;
      end
    end
    if (r_btb_update_valid) begin
      if (6'h8 == _T_1668) begin
        idxs_8 <= _GEN_0;
      end
    end
    if (r_btb_update_valid) begin
      if (6'h9 == _T_1668) begin
        idxs_9 <= _GEN_0;
      end
    end
    if (r_btb_update_valid) begin
      if (6'ha == _T_1668) begin
        idxs_10 <= _GEN_0;
      end
    end
    if (r_btb_update_valid) begin
      if (6'hb == _T_1668) begin
        idxs_11 <= _GEN_0;
      end
    end
    if (r_btb_update_valid) begin
      if (6'hc == _T_1668) begin
        idxs_12 <= _GEN_0;
      end
    end
    if (r_btb_update_valid) begin
      if (6'hd == _T_1668) begin
        idxs_13 <= _GEN_0;
      end
    end
    if (r_btb_update_valid) begin
      if (6'he == _T_1668) begin
        idxs_14 <= _GEN_0;
      end
    end
    if (r_btb_update_valid) begin
      if (6'hf == _T_1668) begin
        idxs_15 <= _GEN_0;
      end
    end
    if (r_btb_update_valid) begin
      if (6'h10 == _T_1668) begin
        idxs_16 <= _GEN_0;
      end
    end
    if (r_btb_update_valid) begin
      if (6'h11 == _T_1668) begin
        idxs_17 <= _GEN_0;
      end
    end
    if (r_btb_update_valid) begin
      if (6'h12 == _T_1668) begin
        idxs_18 <= _GEN_0;
      end
    end
    if (r_btb_update_valid) begin
      if (6'h13 == _T_1668) begin
        idxs_19 <= _GEN_0;
      end
    end
    if (r_btb_update_valid) begin
      if (6'h14 == _T_1668) begin
        idxs_20 <= _GEN_0;
      end
    end
    if (r_btb_update_valid) begin
      if (6'h15 == _T_1668) begin
        idxs_21 <= _GEN_0;
      end
    end
    if (r_btb_update_valid) begin
      if (6'h16 == _T_1668) begin
        idxs_22 <= _GEN_0;
      end
    end
    if (r_btb_update_valid) begin
      if (6'h17 == _T_1668) begin
        idxs_23 <= _GEN_0;
      end
    end
    if (r_btb_update_valid) begin
      if (6'h18 == _T_1668) begin
        idxs_24 <= _GEN_0;
      end
    end
    if (r_btb_update_valid) begin
      if (6'h19 == _T_1668) begin
        idxs_25 <= _GEN_0;
      end
    end
    if (r_btb_update_valid) begin
      if (6'h1a == _T_1668) begin
        idxs_26 <= _GEN_0;
      end
    end
    if (r_btb_update_valid) begin
      if (6'h1b == _T_1668) begin
        idxs_27 <= _GEN_0;
      end
    end
    if (r_btb_update_valid) begin
      if (6'h1c == _T_1668) begin
        idxs_28 <= _GEN_0;
      end
    end
    if (r_btb_update_valid) begin
      if (6'h1d == _T_1668) begin
        idxs_29 <= _GEN_0;
      end
    end
    if (r_btb_update_valid) begin
      if (6'h1e == _T_1668) begin
        idxs_30 <= _GEN_0;
      end
    end
    if (r_btb_update_valid) begin
      if (6'h1f == _T_1668) begin
        idxs_31 <= _GEN_0;
      end
    end
    if (r_btb_update_valid) begin
      if (6'h20 == _T_1668) begin
        idxs_32 <= _GEN_0;
      end
    end
    if (r_btb_update_valid) begin
      if (6'h21 == _T_1668) begin
        idxs_33 <= _GEN_0;
      end
    end
    if (r_btb_update_valid) begin
      if (6'h22 == _T_1668) begin
        idxs_34 <= _GEN_0;
      end
    end
    if (r_btb_update_valid) begin
      if (6'h23 == _T_1668) begin
        idxs_35 <= _GEN_0;
      end
    end
    if (r_btb_update_valid) begin
      if (6'h24 == _T_1668) begin
        idxs_36 <= _GEN_0;
      end
    end
    if (r_btb_update_valid) begin
      if (6'h25 == _T_1668) begin
        idxs_37 <= _GEN_0;
      end
    end
    if (r_btb_update_valid) begin
      if (6'h26 == _T_1668) begin
        idxs_38 <= _GEN_0;
      end
    end
    if (r_btb_update_valid) begin
      if (6'h27 == _T_1668) begin
        idxs_39 <= _GEN_0;
      end
    end
    if (r_btb_update_valid) begin
      if (6'h0 == _T_1668) begin
        idxPages_0 <= _GEN_2;
      end
    end
    if (r_btb_update_valid) begin
      if (6'h1 == _T_1668) begin
        idxPages_1 <= _GEN_2;
      end
    end
    if (r_btb_update_valid) begin
      if (6'h2 == _T_1668) begin
        idxPages_2 <= _GEN_2;
      end
    end
    if (r_btb_update_valid) begin
      if (6'h3 == _T_1668) begin
        idxPages_3 <= _GEN_2;
      end
    end
    if (r_btb_update_valid) begin
      if (6'h4 == _T_1668) begin
        idxPages_4 <= _GEN_2;
      end
    end
    if (r_btb_update_valid) begin
      if (6'h5 == _T_1668) begin
        idxPages_5 <= _GEN_2;
      end
    end
    if (r_btb_update_valid) begin
      if (6'h6 == _T_1668) begin
        idxPages_6 <= _GEN_2;
      end
    end
    if (r_btb_update_valid) begin
      if (6'h7 == _T_1668) begin
        idxPages_7 <= _GEN_2;
      end
    end
    if (r_btb_update_valid) begin
      if (6'h8 == _T_1668) begin
        idxPages_8 <= _GEN_2;
      end
    end
    if (r_btb_update_valid) begin
      if (6'h9 == _T_1668) begin
        idxPages_9 <= _GEN_2;
      end
    end
    if (r_btb_update_valid) begin
      if (6'ha == _T_1668) begin
        idxPages_10 <= _GEN_2;
      end
    end
    if (r_btb_update_valid) begin
      if (6'hb == _T_1668) begin
        idxPages_11 <= _GEN_2;
      end
    end
    if (r_btb_update_valid) begin
      if (6'hc == _T_1668) begin
        idxPages_12 <= _GEN_2;
      end
    end
    if (r_btb_update_valid) begin
      if (6'hd == _T_1668) begin
        idxPages_13 <= _GEN_2;
      end
    end
    if (r_btb_update_valid) begin
      if (6'he == _T_1668) begin
        idxPages_14 <= _GEN_2;
      end
    end
    if (r_btb_update_valid) begin
      if (6'hf == _T_1668) begin
        idxPages_15 <= _GEN_2;
      end
    end
    if (r_btb_update_valid) begin
      if (6'h10 == _T_1668) begin
        idxPages_16 <= _GEN_2;
      end
    end
    if (r_btb_update_valid) begin
      if (6'h11 == _T_1668) begin
        idxPages_17 <= _GEN_2;
      end
    end
    if (r_btb_update_valid) begin
      if (6'h12 == _T_1668) begin
        idxPages_18 <= _GEN_2;
      end
    end
    if (r_btb_update_valid) begin
      if (6'h13 == _T_1668) begin
        idxPages_19 <= _GEN_2;
      end
    end
    if (r_btb_update_valid) begin
      if (6'h14 == _T_1668) begin
        idxPages_20 <= _GEN_2;
      end
    end
    if (r_btb_update_valid) begin
      if (6'h15 == _T_1668) begin
        idxPages_21 <= _GEN_2;
      end
    end
    if (r_btb_update_valid) begin
      if (6'h16 == _T_1668) begin
        idxPages_22 <= _GEN_2;
      end
    end
    if (r_btb_update_valid) begin
      if (6'h17 == _T_1668) begin
        idxPages_23 <= _GEN_2;
      end
    end
    if (r_btb_update_valid) begin
      if (6'h18 == _T_1668) begin
        idxPages_24 <= _GEN_2;
      end
    end
    if (r_btb_update_valid) begin
      if (6'h19 == _T_1668) begin
        idxPages_25 <= _GEN_2;
      end
    end
    if (r_btb_update_valid) begin
      if (6'h1a == _T_1668) begin
        idxPages_26 <= _GEN_2;
      end
    end
    if (r_btb_update_valid) begin
      if (6'h1b == _T_1668) begin
        idxPages_27 <= _GEN_2;
      end
    end
    if (r_btb_update_valid) begin
      if (6'h1c == _T_1668) begin
        idxPages_28 <= _GEN_2;
      end
    end
    if (r_btb_update_valid) begin
      if (6'h1d == _T_1668) begin
        idxPages_29 <= _GEN_2;
      end
    end
    if (r_btb_update_valid) begin
      if (6'h1e == _T_1668) begin
        idxPages_30 <= _GEN_2;
      end
    end
    if (r_btb_update_valid) begin
      if (6'h1f == _T_1668) begin
        idxPages_31 <= _GEN_2;
      end
    end
    if (r_btb_update_valid) begin
      if (6'h20 == _T_1668) begin
        idxPages_32 <= _GEN_2;
      end
    end
    if (r_btb_update_valid) begin
      if (6'h21 == _T_1668) begin
        idxPages_33 <= _GEN_2;
      end
    end
    if (r_btb_update_valid) begin
      if (6'h22 == _T_1668) begin
        idxPages_34 <= _GEN_2;
      end
    end
    if (r_btb_update_valid) begin
      if (6'h23 == _T_1668) begin
        idxPages_35 <= _GEN_2;
      end
    end
    if (r_btb_update_valid) begin
      if (6'h24 == _T_1668) begin
        idxPages_36 <= _GEN_2;
      end
    end
    if (r_btb_update_valid) begin
      if (6'h25 == _T_1668) begin
        idxPages_37 <= _GEN_2;
      end
    end
    if (r_btb_update_valid) begin
      if (6'h26 == _T_1668) begin
        idxPages_38 <= _GEN_2;
      end
    end
    if (r_btb_update_valid) begin
      if (6'h27 == _T_1668) begin
        idxPages_39 <= _GEN_2;
      end
    end
    if (r_btb_update_valid) begin
      if (6'h0 == _T_1668) begin
        tgts_0 <= _GEN_1;
      end
    end
    if (r_btb_update_valid) begin
      if (6'h1 == _T_1668) begin
        tgts_1 <= _GEN_1;
      end
    end
    if (r_btb_update_valid) begin
      if (6'h2 == _T_1668) begin
        tgts_2 <= _GEN_1;
      end
    end
    if (r_btb_update_valid) begin
      if (6'h3 == _T_1668) begin
        tgts_3 <= _GEN_1;
      end
    end
    if (r_btb_update_valid) begin
      if (6'h4 == _T_1668) begin
        tgts_4 <= _GEN_1;
      end
    end
    if (r_btb_update_valid) begin
      if (6'h5 == _T_1668) begin
        tgts_5 <= _GEN_1;
      end
    end
    if (r_btb_update_valid) begin
      if (6'h6 == _T_1668) begin
        tgts_6 <= _GEN_1;
      end
    end
    if (r_btb_update_valid) begin
      if (6'h7 == _T_1668) begin
        tgts_7 <= _GEN_1;
      end
    end
    if (r_btb_update_valid) begin
      if (6'h8 == _T_1668) begin
        tgts_8 <= _GEN_1;
      end
    end
    if (r_btb_update_valid) begin
      if (6'h9 == _T_1668) begin
        tgts_9 <= _GEN_1;
      end
    end
    if (r_btb_update_valid) begin
      if (6'ha == _T_1668) begin
        tgts_10 <= _GEN_1;
      end
    end
    if (r_btb_update_valid) begin
      if (6'hb == _T_1668) begin
        tgts_11 <= _GEN_1;
      end
    end
    if (r_btb_update_valid) begin
      if (6'hc == _T_1668) begin
        tgts_12 <= _GEN_1;
      end
    end
    if (r_btb_update_valid) begin
      if (6'hd == _T_1668) begin
        tgts_13 <= _GEN_1;
      end
    end
    if (r_btb_update_valid) begin
      if (6'he == _T_1668) begin
        tgts_14 <= _GEN_1;
      end
    end
    if (r_btb_update_valid) begin
      if (6'hf == _T_1668) begin
        tgts_15 <= _GEN_1;
      end
    end
    if (r_btb_update_valid) begin
      if (6'h10 == _T_1668) begin
        tgts_16 <= _GEN_1;
      end
    end
    if (r_btb_update_valid) begin
      if (6'h11 == _T_1668) begin
        tgts_17 <= _GEN_1;
      end
    end
    if (r_btb_update_valid) begin
      if (6'h12 == _T_1668) begin
        tgts_18 <= _GEN_1;
      end
    end
    if (r_btb_update_valid) begin
      if (6'h13 == _T_1668) begin
        tgts_19 <= _GEN_1;
      end
    end
    if (r_btb_update_valid) begin
      if (6'h14 == _T_1668) begin
        tgts_20 <= _GEN_1;
      end
    end
    if (r_btb_update_valid) begin
      if (6'h15 == _T_1668) begin
        tgts_21 <= _GEN_1;
      end
    end
    if (r_btb_update_valid) begin
      if (6'h16 == _T_1668) begin
        tgts_22 <= _GEN_1;
      end
    end
    if (r_btb_update_valid) begin
      if (6'h17 == _T_1668) begin
        tgts_23 <= _GEN_1;
      end
    end
    if (r_btb_update_valid) begin
      if (6'h18 == _T_1668) begin
        tgts_24 <= _GEN_1;
      end
    end
    if (r_btb_update_valid) begin
      if (6'h19 == _T_1668) begin
        tgts_25 <= _GEN_1;
      end
    end
    if (r_btb_update_valid) begin
      if (6'h1a == _T_1668) begin
        tgts_26 <= _GEN_1;
      end
    end
    if (r_btb_update_valid) begin
      if (6'h1b == _T_1668) begin
        tgts_27 <= _GEN_1;
      end
    end
    if (r_btb_update_valid) begin
      if (6'h1c == _T_1668) begin
        tgts_28 <= _GEN_1;
      end
    end
    if (r_btb_update_valid) begin
      if (6'h1d == _T_1668) begin
        tgts_29 <= _GEN_1;
      end
    end
    if (r_btb_update_valid) begin
      if (6'h1e == _T_1668) begin
        tgts_30 <= _GEN_1;
      end
    end
    if (r_btb_update_valid) begin
      if (6'h1f == _T_1668) begin
        tgts_31 <= _GEN_1;
      end
    end
    if (r_btb_update_valid) begin
      if (6'h20 == _T_1668) begin
        tgts_32 <= _GEN_1;
      end
    end
    if (r_btb_update_valid) begin
      if (6'h21 == _T_1668) begin
        tgts_33 <= _GEN_1;
      end
    end
    if (r_btb_update_valid) begin
      if (6'h22 == _T_1668) begin
        tgts_34 <= _GEN_1;
      end
    end
    if (r_btb_update_valid) begin
      if (6'h23 == _T_1668) begin
        tgts_35 <= _GEN_1;
      end
    end
    if (r_btb_update_valid) begin
      if (6'h24 == _T_1668) begin
        tgts_36 <= _GEN_1;
      end
    end
    if (r_btb_update_valid) begin
      if (6'h25 == _T_1668) begin
        tgts_37 <= _GEN_1;
      end
    end
    if (r_btb_update_valid) begin
      if (6'h26 == _T_1668) begin
        tgts_38 <= _GEN_1;
      end
    end
    if (r_btb_update_valid) begin
      if (6'h27 == _T_1668) begin
        tgts_39 <= _GEN_1;
      end
    end
    if (r_btb_update_valid) begin
      if (6'h0 == _T_1668) begin
        tgtPages_0 <= _GEN_3;
      end
    end
    if (r_btb_update_valid) begin
      if (6'h1 == _T_1668) begin
        tgtPages_1 <= _GEN_3;
      end
    end
    if (r_btb_update_valid) begin
      if (6'h2 == _T_1668) begin
        tgtPages_2 <= _GEN_3;
      end
    end
    if (r_btb_update_valid) begin
      if (6'h3 == _T_1668) begin
        tgtPages_3 <= _GEN_3;
      end
    end
    if (r_btb_update_valid) begin
      if (6'h4 == _T_1668) begin
        tgtPages_4 <= _GEN_3;
      end
    end
    if (r_btb_update_valid) begin
      if (6'h5 == _T_1668) begin
        tgtPages_5 <= _GEN_3;
      end
    end
    if (r_btb_update_valid) begin
      if (6'h6 == _T_1668) begin
        tgtPages_6 <= _GEN_3;
      end
    end
    if (r_btb_update_valid) begin
      if (6'h7 == _T_1668) begin
        tgtPages_7 <= _GEN_3;
      end
    end
    if (r_btb_update_valid) begin
      if (6'h8 == _T_1668) begin
        tgtPages_8 <= _GEN_3;
      end
    end
    if (r_btb_update_valid) begin
      if (6'h9 == _T_1668) begin
        tgtPages_9 <= _GEN_3;
      end
    end
    if (r_btb_update_valid) begin
      if (6'ha == _T_1668) begin
        tgtPages_10 <= _GEN_3;
      end
    end
    if (r_btb_update_valid) begin
      if (6'hb == _T_1668) begin
        tgtPages_11 <= _GEN_3;
      end
    end
    if (r_btb_update_valid) begin
      if (6'hc == _T_1668) begin
        tgtPages_12 <= _GEN_3;
      end
    end
    if (r_btb_update_valid) begin
      if (6'hd == _T_1668) begin
        tgtPages_13 <= _GEN_3;
      end
    end
    if (r_btb_update_valid) begin
      if (6'he == _T_1668) begin
        tgtPages_14 <= _GEN_3;
      end
    end
    if (r_btb_update_valid) begin
      if (6'hf == _T_1668) begin
        tgtPages_15 <= _GEN_3;
      end
    end
    if (r_btb_update_valid) begin
      if (6'h10 == _T_1668) begin
        tgtPages_16 <= _GEN_3;
      end
    end
    if (r_btb_update_valid) begin
      if (6'h11 == _T_1668) begin
        tgtPages_17 <= _GEN_3;
      end
    end
    if (r_btb_update_valid) begin
      if (6'h12 == _T_1668) begin
        tgtPages_18 <= _GEN_3;
      end
    end
    if (r_btb_update_valid) begin
      if (6'h13 == _T_1668) begin
        tgtPages_19 <= _GEN_3;
      end
    end
    if (r_btb_update_valid) begin
      if (6'h14 == _T_1668) begin
        tgtPages_20 <= _GEN_3;
      end
    end
    if (r_btb_update_valid) begin
      if (6'h15 == _T_1668) begin
        tgtPages_21 <= _GEN_3;
      end
    end
    if (r_btb_update_valid) begin
      if (6'h16 == _T_1668) begin
        tgtPages_22 <= _GEN_3;
      end
    end
    if (r_btb_update_valid) begin
      if (6'h17 == _T_1668) begin
        tgtPages_23 <= _GEN_3;
      end
    end
    if (r_btb_update_valid) begin
      if (6'h18 == _T_1668) begin
        tgtPages_24 <= _GEN_3;
      end
    end
    if (r_btb_update_valid) begin
      if (6'h19 == _T_1668) begin
        tgtPages_25 <= _GEN_3;
      end
    end
    if (r_btb_update_valid) begin
      if (6'h1a == _T_1668) begin
        tgtPages_26 <= _GEN_3;
      end
    end
    if (r_btb_update_valid) begin
      if (6'h1b == _T_1668) begin
        tgtPages_27 <= _GEN_3;
      end
    end
    if (r_btb_update_valid) begin
      if (6'h1c == _T_1668) begin
        tgtPages_28 <= _GEN_3;
      end
    end
    if (r_btb_update_valid) begin
      if (6'h1d == _T_1668) begin
        tgtPages_29 <= _GEN_3;
      end
    end
    if (r_btb_update_valid) begin
      if (6'h1e == _T_1668) begin
        tgtPages_30 <= _GEN_3;
      end
    end
    if (r_btb_update_valid) begin
      if (6'h1f == _T_1668) begin
        tgtPages_31 <= _GEN_3;
      end
    end
    if (r_btb_update_valid) begin
      if (6'h20 == _T_1668) begin
        tgtPages_32 <= _GEN_3;
      end
    end
    if (r_btb_update_valid) begin
      if (6'h21 == _T_1668) begin
        tgtPages_33 <= _GEN_3;
      end
    end
    if (r_btb_update_valid) begin
      if (6'h22 == _T_1668) begin
        tgtPages_34 <= _GEN_3;
      end
    end
    if (r_btb_update_valid) begin
      if (6'h23 == _T_1668) begin
        tgtPages_35 <= _GEN_3;
      end
    end
    if (r_btb_update_valid) begin
      if (6'h24 == _T_1668) begin
        tgtPages_36 <= _GEN_3;
      end
    end
    if (r_btb_update_valid) begin
      if (6'h25 == _T_1668) begin
        tgtPages_37 <= _GEN_3;
      end
    end
    if (r_btb_update_valid) begin
      if (6'h26 == _T_1668) begin
        tgtPages_38 <= _GEN_3;
      end
    end
    if (r_btb_update_valid) begin
      if (6'h27 == _T_1668) begin
        tgtPages_39 <= _GEN_3;
      end
    end
    if (r_btb_update_valid) begin
      if (_T_1693) begin
        if (_T_1688) begin
          pages_0 <= _T_1308;
        end else begin
          pages_0 <= _T_1017;
        end
      end
    end
    if (r_btb_update_valid) begin
      if (_T_1700) begin
        if (_T_1688) begin
          pages_1 <= _T_1017;
        end else begin
          pages_1 <= _T_1308;
        end
      end
    end
    if (r_btb_update_valid) begin
      if (_T_1694) begin
        if (_T_1688) begin
          pages_2 <= _T_1308;
        end else begin
          pages_2 <= _T_1017;
        end
      end
    end
    if (r_btb_update_valid) begin
      if (_T_1701) begin
        if (_T_1688) begin
          pages_3 <= _T_1017;
        end else begin
          pages_3 <= _T_1308;
        end
      end
    end
    if (r_btb_update_valid) begin
      if (_T_1695) begin
        if (_T_1688) begin
          pages_4 <= _T_1308;
        end else begin
          pages_4 <= _T_1017;
        end
      end
    end
    if (r_btb_update_valid) begin
      if (_T_1702) begin
        if (_T_1688) begin
          pages_5 <= _T_1017;
        end else begin
          pages_5 <= _T_1308;
        end
      end
    end
    if (reset) begin
      pageValid <= 6'h0;
    end else begin
      pageValid <= _GEN_440[5:0];
    end
    if (reset) begin
      isValid <= 40'h0;
    end else begin
      isValid <= _GEN_441[39:0];
    end
    isReturn <= _GEN_392[39:0];
    isJump <= _GEN_393[39:0];
    if (r_btb_update_valid) begin
      if (6'h0 == _T_1668) begin
        brIdx_0 <= _GEN_4;
      end
    end
    if (r_btb_update_valid) begin
      if (6'h1 == _T_1668) begin
        brIdx_1 <= _GEN_4;
      end
    end
    if (r_btb_update_valid) begin
      if (6'h2 == _T_1668) begin
        brIdx_2 <= _GEN_4;
      end
    end
    if (r_btb_update_valid) begin
      if (6'h3 == _T_1668) begin
        brIdx_3 <= _GEN_4;
      end
    end
    if (r_btb_update_valid) begin
      if (6'h4 == _T_1668) begin
        brIdx_4 <= _GEN_4;
      end
    end
    if (r_btb_update_valid) begin
      if (6'h5 == _T_1668) begin
        brIdx_5 <= _GEN_4;
      end
    end
    if (r_btb_update_valid) begin
      if (6'h6 == _T_1668) begin
        brIdx_6 <= _GEN_4;
      end
    end
    if (r_btb_update_valid) begin
      if (6'h7 == _T_1668) begin
        brIdx_7 <= _GEN_4;
      end
    end
    if (r_btb_update_valid) begin
      if (6'h8 == _T_1668) begin
        brIdx_8 <= _GEN_4;
      end
    end
    if (r_btb_update_valid) begin
      if (6'h9 == _T_1668) begin
        brIdx_9 <= _GEN_4;
      end
    end
    if (r_btb_update_valid) begin
      if (6'ha == _T_1668) begin
        brIdx_10 <= _GEN_4;
      end
    end
    if (r_btb_update_valid) begin
      if (6'hb == _T_1668) begin
        brIdx_11 <= _GEN_4;
      end
    end
    if (r_btb_update_valid) begin
      if (6'hc == _T_1668) begin
        brIdx_12 <= _GEN_4;
      end
    end
    if (r_btb_update_valid) begin
      if (6'hd == _T_1668) begin
        brIdx_13 <= _GEN_4;
      end
    end
    if (r_btb_update_valid) begin
      if (6'he == _T_1668) begin
        brIdx_14 <= _GEN_4;
      end
    end
    if (r_btb_update_valid) begin
      if (6'hf == _T_1668) begin
        brIdx_15 <= _GEN_4;
      end
    end
    if (r_btb_update_valid) begin
      if (6'h10 == _T_1668) begin
        brIdx_16 <= _GEN_4;
      end
    end
    if (r_btb_update_valid) begin
      if (6'h11 == _T_1668) begin
        brIdx_17 <= _GEN_4;
      end
    end
    if (r_btb_update_valid) begin
      if (6'h12 == _T_1668) begin
        brIdx_18 <= _GEN_4;
      end
    end
    if (r_btb_update_valid) begin
      if (6'h13 == _T_1668) begin
        brIdx_19 <= _GEN_4;
      end
    end
    if (r_btb_update_valid) begin
      if (6'h14 == _T_1668) begin
        brIdx_20 <= _GEN_4;
      end
    end
    if (r_btb_update_valid) begin
      if (6'h15 == _T_1668) begin
        brIdx_21 <= _GEN_4;
      end
    end
    if (r_btb_update_valid) begin
      if (6'h16 == _T_1668) begin
        brIdx_22 <= _GEN_4;
      end
    end
    if (r_btb_update_valid) begin
      if (6'h17 == _T_1668) begin
        brIdx_23 <= _GEN_4;
      end
    end
    if (r_btb_update_valid) begin
      if (6'h18 == _T_1668) begin
        brIdx_24 <= _GEN_4;
      end
    end
    if (r_btb_update_valid) begin
      if (6'h19 == _T_1668) begin
        brIdx_25 <= _GEN_4;
      end
    end
    if (r_btb_update_valid) begin
      if (6'h1a == _T_1668) begin
        brIdx_26 <= _GEN_4;
      end
    end
    if (r_btb_update_valid) begin
      if (6'h1b == _T_1668) begin
        brIdx_27 <= _GEN_4;
      end
    end
    if (r_btb_update_valid) begin
      if (6'h1c == _T_1668) begin
        brIdx_28 <= _GEN_4;
      end
    end
    if (r_btb_update_valid) begin
      if (6'h1d == _T_1668) begin
        brIdx_29 <= _GEN_4;
      end
    end
    if (r_btb_update_valid) begin
      if (6'h1e == _T_1668) begin
        brIdx_30 <= _GEN_4;
      end
    end
    if (r_btb_update_valid) begin
      if (6'h1f == _T_1668) begin
        brIdx_31 <= _GEN_4;
      end
    end
    if (r_btb_update_valid) begin
      if (6'h20 == _T_1668) begin
        brIdx_32 <= _GEN_4;
      end
    end
    if (r_btb_update_valid) begin
      if (6'h21 == _T_1668) begin
        brIdx_33 <= _GEN_4;
      end
    end
    if (r_btb_update_valid) begin
      if (6'h22 == _T_1668) begin
        brIdx_34 <= _GEN_4;
      end
    end
    if (r_btb_update_valid) begin
      if (6'h23 == _T_1668) begin
        brIdx_35 <= _GEN_4;
      end
    end
    if (r_btb_update_valid) begin
      if (6'h24 == _T_1668) begin
        brIdx_36 <= _GEN_4;
      end
    end
    if (r_btb_update_valid) begin
      if (6'h25 == _T_1668) begin
        brIdx_37 <= _GEN_4;
      end
    end
    if (r_btb_update_valid) begin
      if (6'h26 == _T_1668) begin
        brIdx_38 <= _GEN_4;
      end
    end
    if (r_btb_update_valid) begin
      if (6'h27 == _T_1668) begin
        brIdx_39 <= _GEN_4;
      end
    end
    if (reset) begin
      _T_785 <= 1'h0;
    end else begin
      _T_785 <= io_btb_update_valid;
    end
    if (io_btb_update_valid) begin
      _T_824_prediction_valid <= io_btb_update_bits_prediction_valid;
    end
    if (io_btb_update_valid) begin
      _T_824_prediction_bits_taken <= io_btb_update_bits_prediction_bits_taken;
    end
    if (io_btb_update_valid) begin
      _T_824_prediction_bits_mask <= io_btb_update_bits_prediction_bits_mask;
    end
    if (io_btb_update_valid) begin
      _T_824_prediction_bits_bridx <= io_btb_update_bits_prediction_bits_bridx;
    end
    if (io_btb_update_valid) begin
      _T_824_prediction_bits_target <= io_btb_update_bits_prediction_bits_target;
    end
    if (io_btb_update_valid) begin
      _T_824_prediction_bits_entry <= io_btb_update_bits_prediction_bits_entry;
    end
    if (io_btb_update_valid) begin
      _T_824_prediction_bits_bht_history <= io_btb_update_bits_prediction_bits_bht_history;
    end
    if (io_btb_update_valid) begin
      _T_824_prediction_bits_bht_value <= io_btb_update_bits_prediction_bits_bht_value;
    end
    if (io_btb_update_valid) begin
      _T_824_pc <= io_btb_update_bits_pc;
    end
    if (io_btb_update_valid) begin
      _T_824_target <= io_btb_update_bits_target;
    end
    if (io_btb_update_valid) begin
      _T_824_taken <= io_btb_update_bits_taken;
    end
    if (io_btb_update_valid) begin
      _T_824_isValid <= io_btb_update_bits_isValid;
    end
    if (io_btb_update_valid) begin
      _T_824_isJump <= io_btb_update_bits_isJump;
    end
    if (io_btb_update_valid) begin
      _T_824_isReturn <= io_btb_update_bits_isReturn;
    end
    if (io_btb_update_valid) begin
      _T_824_br_pc <= io_btb_update_bits_br_pc;
    end
    if (reset) begin
      nextRepl <= 6'h0;
    end else begin
      if (_T_1601) begin
        if (_T_1604) begin
          nextRepl <= 6'h0;
        end else begin
          nextRepl <= _T_1607;
        end
      end
    end
    if (_T_1656) begin
      if (_T_1664) begin
        nextPageRepl <= {{2'd0}, _T_1665};
      end else begin
        nextPageRepl <= _T_1662;
      end
    end
    if(_T_2578__T_2603_en & _T_2578__T_2603_mask) begin
      _T_2578[_T_2578__T_2603_addr] <= _T_2578__T_2603_data;
    end
    if (_T_2600) begin
      if (io_bht_update_bits_mispredict) begin
        _T_2580 <= _T_2614;
      end else begin
        if (_T_2587) begin
          _T_2580 <= _T_2599;
        end
      end
    end else begin
      if (_T_2587) begin
        _T_2580 <= _T_2599;
      end
    end
    if (io_ras_update_valid) begin
      if (_T_2654) begin
        if (_T_2635) begin
          _T_2621 <= _T_2661;
        end else begin
          if (io_ras_update_bits_isCall) begin
            if (_T_2638) begin
              _T_2621 <= _T_2641;
            end
          end
        end
      end else begin
        if (io_ras_update_bits_isCall) begin
          if (_T_2638) begin
            _T_2621 <= _T_2641;
          end
        end
      end
    end
    if (io_ras_update_valid) begin
      if (_T_2654) begin
        if (_T_2635) begin
          _T_2623 <= _T_2668;
        end else begin
          if (io_ras_update_bits_isCall) begin
            _T_2623 <= _T_2648;
          end
        end
      end else begin
        if (io_ras_update_bits_isCall) begin
          _T_2623 <= _T_2648;
        end
      end
    end
    if (io_ras_update_valid) begin
      if (io_ras_update_bits_isCall) begin
        if (1'h0 == _T_2648) begin
          _T_2627_0 <= _GEN_6;
        end
      end
    end
    if (io_ras_update_valid) begin
      if (io_ras_update_bits_isCall) begin
        if (_T_2648) begin
          _T_2627_1 <= _GEN_6;
        end
      end
    end
  end
endmodule