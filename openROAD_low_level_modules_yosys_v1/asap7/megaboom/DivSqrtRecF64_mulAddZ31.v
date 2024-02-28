module DivSqrtRecF64_mulAddZ31(
  input   clock,
  input   reset,
  output  io_inReady_div,
  output  io_inReady_sqrt,
  input   io_inValid,
  input   io_sqrtOp,
  input  [64:0] io_a,
  input  [64:0] io_b,
  input  [1:0] io_roundingMode,
  output  io_outValid_div,
  output  io_outValid_sqrt,
  output [64:0] io_out,
  output [4:0] io_exceptionFlags,
  output [3:0] io_usingMulAdd,
  output  io_latchMulAddA_0,
  output [53:0] io_mulAddA_0,
  output  io_latchMulAddB_0,
  output [53:0] io_mulAddB_0,
  output [104:0] io_mulAddC_2,
  input  [104:0] io_mulAddResult_3
);
  reg  valid_PA;
  reg [31:0] _GEN_115;
  reg  sqrtOp_PA;
  reg [31:0] _GEN_119;
  reg  sign_PA;
  reg [31:0] _GEN_120;
  reg [2:0] specialCodeB_PA;
  reg [31:0] _GEN_121;
  reg  fractB_51_PA;
  reg [31:0] _GEN_122;
  reg [1:0] roundingMode_PA;
  reg [31:0] _GEN_123;
  reg [2:0] specialCodeA_PA;
  reg [31:0] _GEN_124;
  reg  fractA_51_PA;
  reg [31:0] _GEN_125;
  reg [13:0] exp_PA;
  reg [31:0] _GEN_126;
  reg [50:0] fractB_other_PA;
  reg [63:0] _GEN_127;
  reg [50:0] fractA_other_PA;
  reg [63:0] _GEN_128;
  reg  valid_PB;
  reg [31:0] _GEN_129;
  reg  sqrtOp_PB;
  reg [31:0] _GEN_130;
  reg  sign_PB;
  reg [31:0] _GEN_131;
  reg [2:0] specialCodeA_PB;
  reg [31:0] _GEN_132;
  reg  fractA_51_PB;
  reg [31:0] _GEN_133;
  reg [2:0] specialCodeB_PB;
  reg [31:0] _GEN_134;
  reg  fractB_51_PB;
  reg [31:0] _GEN_135;
  reg [1:0] roundingMode_PB;
  reg [31:0] _GEN_136;
  reg [13:0] exp_PB;
  reg [31:0] _GEN_137;
  reg  fractA_0_PB;
  reg [31:0] _GEN_138;
  reg [50:0] fractB_other_PB;
  reg [63:0] _GEN_139;
  reg  valid_PC;
  reg [31:0] _GEN_140;
  reg  sqrtOp_PC;
  reg [31:0] _GEN_141;
  reg  sign_PC;
  reg [31:0] _GEN_142;
  reg [2:0] specialCodeA_PC;
  reg [31:0] _GEN_143;
  reg  fractA_51_PC;
  reg [31:0] _GEN_144;
  reg [2:0] specialCodeB_PC;
  reg [31:0] _GEN_145;
  reg  fractB_51_PC;
  reg [31:0] _GEN_146;
  reg [1:0] roundingMode_PC;
  reg [31:0] _GEN_147;
  reg [13:0] exp_PC;
  reg [31:0] _GEN_148;
  reg  fractA_0_PC;
  reg [31:0] _GEN_149;
  reg [50:0] fractB_other_PC;
  reg [63:0] _GEN_150;
  reg [2:0] cycleNum_A;
  reg [31:0] _GEN_151;
  reg [3:0] cycleNum_B;
  reg [31:0] _GEN_152;
  reg [2:0] cycleNum_C;
  reg [31:0] _GEN_153;
  reg [2:0] cycleNum_E;
  reg [31:0] _GEN_154;
  reg [8:0] fractR0_A;
  reg [31:0] _GEN_155;
  reg [9:0] hiSqrR0_A_sqrt;
  reg [31:0] _GEN_156;
  reg [20:0] partNegSigma0_A;
  reg [31:0] _GEN_157;
  reg [8:0] nextMulAdd9A_A;
  reg [31:0] _GEN_158;
  reg [8:0] nextMulAdd9B_A;
  reg [31:0] _GEN_159;
  reg [16:0] ER1_B_sqrt;
  reg [31:0] _GEN_160;
  reg [31:0] ESqrR1_B_sqrt;
  reg [31:0] _GEN_161;
  reg [57:0] sigX1_B;
  reg [63:0] _GEN_162;
  reg [32:0] sqrSigma1_C;
  reg [63:0] _GEN_163;
  reg [57:0] sigXN_C;
  reg [63:0] _GEN_164;
  reg [30:0] u_C_sqrt;
  reg [31:0] _GEN_165;
  reg  E_E_div;
  reg [31:0] _GEN_166;
  reg [52:0] sigT_E;
  reg [63:0] _GEN_167;
  reg  extraT_E;
  reg [31:0] _GEN_168;
  reg  isNegRemT_E;
  reg [31:0] _GEN_169;
  reg  isZeroRemT_E;
  reg [31:0] _GEN_170;
  wire  ready_PA;
  wire  ready_PB;
  wire  ready_PC;
  wire  leaving_PA;
  wire  leaving_PB;
  wire  leaving_PC;
  wire  cyc_B10_sqrt;
  wire  cyc_B9_sqrt;
  wire  cyc_B8_sqrt;
  wire  cyc_B7_sqrt;
  wire  cyc_B6;
  wire  cyc_B5;
  wire  cyc_B4;
  wire  cyc_B3;
  wire  cyc_B2;
  wire  cyc_B1;
  wire  cyc_B6_div;
  wire  cyc_B5_div;
  wire  cyc_B4_div;
  wire  cyc_B3_div;
  wire  cyc_B2_div;
  wire  cyc_B1_div;
  wire  cyc_B6_sqrt;
  wire  cyc_B5_sqrt;
  wire  cyc_B4_sqrt;
  wire  cyc_B3_sqrt;
  wire  cyc_B2_sqrt;
  wire  cyc_B1_sqrt;
  wire  cyc_C5;
  wire  cyc_C4;
  wire  cyc_C3;
  wire  cyc_C2;
  wire  cyc_C1;
  wire  cyc_E4;
  wire  cyc_E3;
  wire  cyc_E2;
  wire  cyc_E1;
  wire [45:0] zSigma1_B4;
  wire [57:0] sigXNU_B3_CX;
  wire [53:0] zComplSigT_C1_sqrt;
  wire [53:0] zComplSigT_C1;
  wire  _T_133;
  wire  _T_134;
  wire  _T_136;
  wire  _T_137;
  wire  _T_139;
  wire  _T_140;
  wire  _T_142;
  wire  _T_143;
  wire  _T_145;
  wire  _T_146;
  wire  _T_148;
  wire  _T_149;
  wire  _T_151;
  wire  _T_152;
  wire  _T_154;
  wire  _T_155;
  wire  _T_157;
  wire  _T_158;
  wire  _T_161;
  wire  _T_164;
  wire  _T_167;
  wire  _T_169;
  wire  _T_170;
  wire  _T_173;
  wire  _T_174;
  wire  _T_176;
  wire  cyc_S_div;
  wire  _T_177;
  wire  cyc_S_sqrt;
  wire  cyc_S;
  wire  signA_S;
  wire [11:0] expA_S;
  wire [51:0] fractA_S;
  wire [2:0] specialCodeA_S;
  wire  isZeroA_S;
  wire [1:0] _T_179;
  wire  isSpecialA_S;
  wire  signB_S;
  wire [11:0] expB_S;
  wire [51:0] fractB_S;
  wire [2:0] specialCodeB_S;
  wire  isZeroB_S;
  wire [1:0] _T_182;
  wire  isSpecialB_S;
  wire  _T_184;
  wire  sign_S;
  wire  _T_186;
  wire  _T_188;
  wire  _T_189;
  wire  _T_191;
  wire  _T_192;
  wire  _T_194;
  wire  normalCase_S_div;
  wire  _T_199;
  wire  _T_201;
  wire  normalCase_S_sqrt;
  wire  normalCase_S;
  wire  cyc_A4_div;
  wire  cyc_A7_sqrt;
  wire  entering_PA_normalCase;
  wire  _T_203;
  wire  _T_204;
  wire  _T_205;
  wire  entering_PA;
  wire  _T_207;
  wire  _T_208;
  wire  _T_210;
  wire  _T_211;
  wire  _T_213;
  wire  _T_215;
  wire  _T_216;
  wire  _T_217;
  wire  entering_PB_S;
  wire  _T_226;
  wire  entering_PC_S;
  wire  _T_227;
  wire  _GEN_0;
  wire  _T_228;
  wire  _GEN_1;
  wire  _GEN_2;
  wire [2:0] _GEN_3;
  wire  _GEN_4;
  wire [1:0] _GEN_5;
  wire  _T_231;
  wire  _T_232;
  wire [2:0] _GEN_6;
  wire  _GEN_7;
  wire  _T_233;
  wire [2:0] _T_237;
  wire [10:0] _T_238;
  wire [10:0] _T_239;
  wire [13:0] _T_240;
  wire [13:0] _GEN_53;
  wire [14:0] _T_241;
  wire [13:0] _T_242;
  wire [13:0] _T_243;
  wire [50:0] _T_244;
  wire [13:0] _GEN_8;
  wire [50:0] _GEN_9;
  wire [50:0] _T_245;
  wire [50:0] _GEN_10;
  wire  isZeroA_PA;
  wire [1:0] _T_247;
  wire  isSpecialA_PA;
  wire [1:0] _T_250;
  wire [52:0] sigA_PA;
  wire  isZeroB_PA;
  wire [1:0] _T_252;
  wire  isSpecialB_PA;
  wire [1:0] _T_255;
  wire [52:0] sigB_PA;
  wire  _T_257;
  wire  _T_259;
  wire  _T_260;
  wire  _T_262;
  wire  _T_263;
  wire  _T_265;
  wire  _T_268;
  wire  _T_270;
  wire  _T_271;
  wire  _T_274;
  wire  normalCase_PA;
  wire  valid_normalCase_leaving_PA;
  wire  valid_leaving_PA;
  wire  _T_275;
  wire  _T_278;
  wire  _T_279;
  wire  entering_PB_normalCase;
  wire  entering_PB;
  wire  _T_280;
  wire  _GEN_11;
  wire  _T_281;
  wire  _T_282;
  wire [2:0] _T_283;
  wire  _T_285;
  wire [2:0] _T_286;
  wire  _T_288;
  wire [1:0] _T_289;
  wire  _GEN_12;
  wire  _GEN_13;
  wire [2:0] _GEN_14;
  wire  _GEN_15;
  wire [2:0] _GEN_16;
  wire  _GEN_17;
  wire [1:0] _GEN_18;
  wire  _T_290;
  wire [13:0] _GEN_19;
  wire  _GEN_20;
  wire [50:0] _GEN_21;
  wire  isZeroA_PB;
  wire [1:0] _T_292;
  wire  isSpecialA_PB;
  wire  isZeroB_PB;
  wire [1:0] _T_295;
  wire  isSpecialB_PB;
  wire  _T_298;
  wire  _T_300;
  wire  _T_301;
  wire  _T_303;
  wire  _T_304;
  wire  _T_306;
  wire  _T_309;
  wire  _T_311;
  wire  _T_312;
  wire  _T_315;
  wire  normalCase_PB;
  wire  valid_leaving_PB;
  wire  _T_316;
  wire  _T_319;
  wire  _T_320;
  wire  entering_PC_normalCase;
  wire  entering_PC;
  wire  _T_321;
  wire  _GEN_22;
  wire  _T_322;
  wire  _T_323;
  wire [2:0] _T_324;
  wire  _T_326;
  wire [2:0] _T_327;
  wire  _T_329;
  wire [1:0] _T_330;
  wire  _GEN_23;
  wire  _GEN_24;
  wire [2:0] _GEN_25;
  wire  _GEN_26;
  wire [2:0] _GEN_27;
  wire  _GEN_28;
  wire [1:0] _GEN_29;
  wire [13:0] _GEN_30;
  wire  _GEN_31;
  wire [50:0] _GEN_32;
  wire  isZeroA_PC;
  wire [1:0] _T_332;
  wire  isSpecialA_PC;
  wire  _T_334;
  wire  _T_336;
  wire  isInfA_PC;
  wire  isNaNA_PC;
  wire  _T_339;
  wire  isSigNaNA_PC;
  wire  isZeroB_PC;
  wire [1:0] _T_341;
  wire  isSpecialB_PC;
  wire  _T_343;
  wire  _T_345;
  wire  isInfB_PC;
  wire  isNaNB_PC;
  wire  _T_348;
  wire  isSigNaNB_PC;
  wire [1:0] _T_350;
  wire [52:0] sigB_PC;
  wire  _T_352;
  wire  _T_354;
  wire  _T_355;
  wire  _T_357;
  wire  _T_358;
  wire  _T_360;
  wire  _T_363;
  wire  _T_365;
  wire  _T_366;
  wire  _T_369;
  wire  normalCase_PC;
  wire [14:0] _T_371;
  wire [13:0] expP2_PC;
  wire  _T_372;
  wire [12:0] _T_373;
  wire [13:0] _T_375;
  wire [12:0] _T_376;
  wire [13:0] _T_378;
  wire [13:0] expP1_PC;
  wire  roundingMode_near_even_PC;
  wire  roundingMode_min_PC;
  wire  roundingMode_max_PC;
  wire  roundMagUp_PC;
  wire  overflowY_roundMagUp_PC;
  wire  _T_380;
  wire  _T_382;
  wire  roundMagDown_PC;
  wire  _T_384;
  wire  valid_leaving_PC;
  wire  _T_385;
  wire  _T_387;
  wire  _T_388;
  wire  _T_390;
  wire  _T_391;
  wire  _T_392;
  wire  _T_394;
  wire  _T_395;
  wire [1:0] _T_398;
  wire [2:0] _T_401;
  wire [2:0] _GEN_54;
  wire [2:0] _T_402;
  wire  _T_404;
  wire [3:0] _T_406;
  wire [2:0] _T_407;
  wire [2:0] _T_409;
  wire [2:0] _T_410;
  wire [2:0] _GEN_33;
  wire  cyc_A6_sqrt;
  wire  cyc_A5_sqrt;
  wire  cyc_A4_sqrt;
  wire  cyc_A4;
  wire  cyc_A3;
  wire  cyc_A2;
  wire  cyc_A1;
  wire  _T_418;
  wire  cyc_A3_div;
  wire  cyc_A2_div;
  wire  cyc_A1_div;
  wire  cyc_A3_sqrt;
  wire  cyc_A1_sqrt;
  wire  _T_424;
  wire  _T_425;
  wire [3:0] _T_428;
  wire [4:0] _T_430;
  wire [3:0] _T_431;
  wire [3:0] _T_432;
  wire [3:0] _GEN_34;
  wire  _T_434;
  wire  _T_436;
  wire  _T_438;
  wire  _T_440;
  wire  _T_442;
  wire  _T_444;
  wire  _T_446;
  wire  _T_448;
  wire  _T_450;
  wire  _T_452;
  wire  _T_453;
  wire  _T_456;
  wire  _T_457;
  wire  _T_460;
  wire  _T_461;
  wire  _T_464;
  wire  _T_466;
  wire  _T_467;
  wire  _T_470;
  wire  _T_473;
  wire  _T_474;
  wire  _T_475;
  wire  _T_476;
  wire  _T_477;
  wire  _T_478;
  wire  _T_479;
  wire  _T_480;
  wire  _T_481;
  wire  _T_482;
  wire  _T_484;
  wire  _T_485;
  wire [2:0] _T_488;
  wire [3:0] _T_490;
  wire [2:0] _T_491;
  wire [2:0] _T_492;
  wire [2:0] _GEN_35;
  wire  cyc_C6_sqrt;
  wire  _T_495;
  wire  _T_497;
  wire  _T_499;
  wire  _T_501;
  wire  _T_503;
  wire  cyc_C5_div;
  wire  cyc_C4_div;
  wire  cyc_C1_div;
  wire  cyc_C5_sqrt;
  wire  cyc_C4_sqrt;
  wire  cyc_C3_sqrt;
  wire  cyc_C1_sqrt;
  wire  _T_515;
  wire  _T_516;
  wire [3:0] _T_519;
  wire [2:0] _T_520;
  wire [2:0] _T_521;
  wire [2:0] _GEN_36;
  wire  _T_523;
  wire  _T_525;
  wire  _T_527;
  wire  _T_529;
  wire  cyc_E3_div;
  wire  cyc_E3_sqrt;
  wire [51:0] zFractB_A4_div;
  wire [2:0] _T_539;
  wire  _T_541;
  wire  zLinPiece_0_A4_div;
  wire  _T_544;
  wire  zLinPiece_1_A4_div;
  wire  _T_547;
  wire  zLinPiece_2_A4_div;
  wire  _T_550;
  wire  zLinPiece_3_A4_div;
  wire  _T_553;
  wire  zLinPiece_4_A4_div;
  wire  _T_556;
  wire  zLinPiece_5_A4_div;
  wire  _T_559;
  wire  zLinPiece_6_A4_div;
  wire  _T_562;
  wire  zLinPiece_7_A4_div;
  wire [8:0] _T_565;
  wire [8:0] _T_568;
  wire [8:0] _T_569;
  wire [8:0] _T_572;
  wire [8:0] _T_573;
  wire [8:0] _T_576;
  wire [8:0] _T_577;
  wire [8:0] _T_580;
  wire [8:0] _T_581;
  wire [8:0] _T_584;
  wire [8:0] _T_585;
  wire [8:0] _T_588;
  wire [8:0] _T_589;
  wire [8:0] _T_592;
  wire [8:0] zK1_A4_div;
  wire [11:0] _T_596;
  wire [11:0] _T_600;
  wire [11:0] _T_601;
  wire [11:0] _T_605;
  wire [11:0] _T_606;
  wire [11:0] _T_610;
  wire [11:0] _T_611;
  wire [11:0] _T_615;
  wire [11:0] _T_616;
  wire [11:0] _T_620;
  wire [11:0] _T_621;
  wire [11:0] _T_625;
  wire [11:0] _T_626;
  wire [11:0] _T_630;
  wire [11:0] zComplFractK0_A4_div;
  wire [51:0] zFractB_A7_sqrt;
  wire  _T_632;
  wire  _T_634;
  wire  _T_635;
  wire  _T_638;
  wire  zQuadPiece_0_A7_sqrt;
  wire  zQuadPiece_1_A7_sqrt;
  wire  _T_645;
  wire  zQuadPiece_2_A7_sqrt;
  wire  zQuadPiece_3_A7_sqrt;
  wire [8:0] _T_654;
  wire [8:0] _T_657;
  wire [8:0] _T_658;
  wire [8:0] _T_661;
  wire [8:0] _T_662;
  wire [8:0] _T_665;
  wire [8:0] zK2_A7_sqrt;
  wire [9:0] _T_669;
  wire [9:0] _T_673;
  wire [9:0] _T_674;
  wire [9:0] _T_678;
  wire [9:0] _T_679;
  wire [9:0] _T_683;
  wire [9:0] zComplK1_A7_sqrt;
  wire  _T_684;
  wire  _T_686;
  wire  _T_687;
  wire  _T_688;
  wire  _T_690;
  wire  zQuadPiece_0_A6_sqrt;
  wire  zQuadPiece_1_A6_sqrt;
  wire  _T_697;
  wire  zQuadPiece_2_A6_sqrt;
  wire  zQuadPiece_3_A6_sqrt;
  wire [12:0] _T_707;
  wire [12:0] _T_711;
  wire [12:0] _T_712;
  wire [12:0] _T_716;
  wire [12:0] _T_717;
  wire [12:0] _T_721;
  wire [12:0] zComplFractK0_A6_sqrt;
  wire [8:0] _T_722;
  wire [8:0] _T_723;
  wire  _T_725;
  wire [8:0] _T_727;
  wire [8:0] mulAdd9A_A;
  wire [8:0] _T_728;
  wire [8:0] _T_729;
  wire [8:0] _T_733;
  wire [8:0] mulAdd9B_A;
  wire [9:0] _T_737;
  wire [19:0] _T_738;
  wire [5:0] _T_742;
  wire [13:0] _T_743;
  wire [19:0] _T_744;
  wire [19:0] _T_745;
  wire [7:0] _T_749;
  wire [12:0] _T_750;
  wire [20:0] _T_751;
  wire [20:0] _GEN_55;
  wire [20:0] _T_752;
  wire [18:0] _GEN_56;
  wire [18:0] _T_754;
  wire [19:0] _GEN_57;
  wire [20:0] _T_755;
  wire [19:0] _T_756;
  wire [19:0] _T_758;
  wire [20:0] _GEN_58;
  wire [20:0] _T_759;
  wire  _T_760;
  wire  _T_762;
  wire  _T_763;
  wire [10:0] _T_766;
  wire [20:0] _GEN_59;
  wire [20:0] _T_767;
  wire  _T_769;
  wire  _T_770;
  wire [20:0] _T_771;
  wire [21:0] _T_773;
  wire [20:0] _T_774;
  wire [20:0] _T_776;
  wire [20:0] _T_777;
  wire  _T_778;
  wire [20:0] _T_780;
  wire [20:0] _T_781;
  wire [24:0] _GEN_60;
  wire [24:0] _T_782;
  wire [24:0] _T_784;
  wire [24:0] _GEN_61;
  wire [24:0] _T_785;
  wire [23:0] _GEN_62;
  wire [23:0] _T_786;
  wire [23:0] _T_788;
  wire [24:0] _GEN_63;
  wire [24:0] mulAdd9C_A;
  wire [17:0] _T_789;
  wire [17:0] _T_791;
  wire [18:0] _T_792;
  wire [18:0] _GEN_64;
  wire [19:0] _T_793;
  wire [18:0] loMulAdd9Out_A;
  wire  _T_794;
  wire [6:0] _T_795;
  wire [7:0] _T_797;
  wire [6:0] _T_798;
  wire [6:0] _T_800;
  wire [17:0] _T_801;
  wire [24:0] mulAdd9Out_A;
  wire  _T_802;
  wire  _T_803;
  wire [24:0] _T_804;
  wire [14:0] _T_805;
  wire [14:0] _T_807;
  wire [8:0] zFractR0_A6_sqrt;
  wire [25:0] _GEN_65;
  wire [25:0] _T_809;
  wire [25:0] sqrR0_A5_sqrt;
  wire  _T_810;
  wire  _T_811;
  wire [13:0] _T_813;
  wire [13:0] _T_815;
  wire [8:0] zFractR0_A4_div;
  wire  _T_816;
  wire  _T_817;
  wire [22:0] _T_819;
  wire [22:0] _T_821;
  wire [8:0] zSigma0_A2;
  wire [14:0] _T_822;
  wire [15:0] _T_823;
  wire [15:0] _T_824;
  wire [14:0] fractR1_A1;
  wire [15:0] r1_A1;
  wire [16:0] _GEN_66;
  wire [16:0] _T_827;
  wire [16:0] ER1_A1_sqrt;
  wire  _T_828;
  wire [8:0] _T_829;
  wire [8:0] _GEN_37;
  wire [15:0] _T_830;
  wire [15:0] _GEN_38;
  wire  _T_831;
  wire [24:0] _T_833;
  wire [20:0] _T_834;
  wire [20:0] _GEN_39;
  wire  _T_835;
  wire  _T_836;
  wire  _T_837;
  wire  _T_838;
  wire  _T_839;
  wire [13:0] _T_843;
  wire [13:0] _GEN_67;
  wire [13:0] _T_844;
  wire [8:0] _T_845;
  wire [8:0] _T_847;
  wire [13:0] _GEN_68;
  wire [13:0] _T_848;
  wire [8:0] _T_849;
  wire [13:0] _GEN_69;
  wire [13:0] _T_850;
  wire  _T_851;
  wire [8:0] _T_852;
  wire [8:0] _T_854;
  wire [13:0] _GEN_70;
  wire [13:0] _T_855;
  wire [13:0] _GEN_71;
  wire [13:0] _T_856;
  wire [13:0] _GEN_40;
  wire  _T_860;
  wire [8:0] _T_862;
  wire [8:0] _T_863;
  wire [8:0] _T_865;
  wire [8:0] _T_866;
  wire [8:0] _T_867;
  wire [8:0] _T_868;
  wire [8:0] _T_870;
  wire [8:0] _T_871;
  wire [7:0] _T_873;
  wire [8:0] _T_874;
  wire [8:0] _T_876;
  wire [8:0] _T_877;
  wire [8:0] _GEN_41;
  wire [16:0] _GEN_42;
  wire  _T_878;
  wire  _T_879;
  wire  _T_880;
  wire  _T_881;
  wire  _T_882;
  wire  _T_883;
  wire  _T_884;
  wire [52:0] _GEN_72;
  wire [52:0] _T_885;
  wire [52:0] _T_887;
  wire  _T_888;
  wire [52:0] _T_890;
  wire [52:0] _T_891;
  wire [52:0] _T_893;
  wire [52:0] _T_894;
  wire [33:0] _T_895;
  wire [52:0] _GEN_73;
  wire [52:0] _T_896;
  wire  _T_897;
  wire [45:0] _T_898;
  wire [45:0] _T_900;
  wire [52:0] _GEN_74;
  wire [52:0] _T_901;
  wire [32:0] _T_902;
  wire [45:0] _GEN_75;
  wire [45:0] _T_903;
  wire [45:0] _T_905;
  wire [52:0] _GEN_76;
  wire [52:0] _T_906;
  wire [45:0] _GEN_77;
  wire [45:0] _T_907;
  wire [45:0] _T_909;
  wire [52:0] _GEN_78;
  wire [52:0] _T_910;
  wire [52:0] _T_912;
  wire [52:0] _T_913;
  wire [53:0] _GEN_79;
  wire [53:0] _T_914;
  wire  _T_916;
  wire  _T_917;
  wire  _T_918;
  wire  _T_919;
  wire  _T_920;
  wire [51:0] _GEN_80;
  wire [51:0] _T_921;
  wire [51:0] _T_923;
  wire [50:0] _GEN_81;
  wire [50:0] _T_924;
  wire [50:0] _T_926;
  wire [51:0] _GEN_82;
  wire [51:0] _T_927;
  wire [52:0] _GEN_83;
  wire [52:0] _T_928;
  wire [52:0] _T_930;
  wire [52:0] _GEN_84;
  wire [52:0] _T_931;
  wire [52:0] _GEN_85;
  wire [52:0] _T_932;
  wire [29:0] _T_933;
  wire [29:0] _T_935;
  wire [52:0] _GEN_86;
  wire [52:0] _T_936;
  wire [32:0] _T_938;
  wire [52:0] _GEN_87;
  wire [52:0] _T_939;
  wire [53:0] _GEN_88;
  wire [53:0] _T_940;
  wire  _T_941;
  wire  _T_942;
  wire  _T_943;
  wire  _T_944;
  wire  _T_945;
  wire  _T_946;
  wire  _T_947;
  wire  _T_948;
  wire  _T_949;
  wire  _T_950;
  wire  _T_951;
  wire  _T_952;
  wire  _T_953;
  wire  _T_954;
  wire  _T_955;
  wire  _T_956;
  wire  _T_957;
  wire  _T_958;
  wire  _T_959;
  wire  _T_960;
  wire  _T_961;
  wire  _T_962;
  wire  _T_963;
  wire  _T_964;
  wire  _T_965;
  wire  _T_966;
  wire  _T_967;
  wire  _T_968;
  wire  _T_969;
  wire  _T_970;
  wire  _T_971;
  wire  _T_972;
  wire [1:0] _T_973;
  wire [1:0] _T_974;
  wire [3:0] _T_975;
  wire [104:0] _GEN_89;
  wire [104:0] _T_976;
  wire [104:0] _T_978;
  wire [103:0] _GEN_90;
  wire [103:0] _T_979;
  wire [103:0] _T_981;
  wire [104:0] _GEN_91;
  wire [104:0] _T_982;
  wire  _T_983;
  wire [104:0] _GEN_92;
  wire [104:0] _T_984;
  wire [104:0] _T_986;
  wire [104:0] _T_987;
  wire  _T_989;
  wire  _T_990;
  wire [53:0] _GEN_93;
  wire [53:0] _T_991;
  wire [53:0] _T_993;
  wire [104:0] _GEN_94;
  wire [104:0] _T_994;
  wire  _T_996;
  wire [1:0] _T_998;
  wire  _T_999;
  wire  _T_1001;
  wire [1:0] _T_1003;
  wire [1:0] _T_1004;
  wire  _T_1006;
  wire [1:0] _T_1008;
  wire [1:0] _T_1009;
  wire [55:0] _GEN_95;
  wire [55:0] _T_1010;
  wire [55:0] _T_1012;
  wire [104:0] _GEN_96;
  wire [104:0] _T_1013;
  wire [31:0] ESqrR1_B8_sqrt;
  wire [45:0] _T_1014;
  wire [45:0] _T_1015;
  wire [45:0] _T_1017;
  wire [32:0] sqrSigma1_B1;
  wire [57:0] _T_1018;
  wire  _T_1019;
  wire  E_C1_div;
  wire  _T_1022;
  wire  _T_1023;
  wire  _T_1024;
  wire [53:0] _T_1025;
  wire [53:0] _T_1026;
  wire [53:0] _T_1028;
  wire  _T_1029;
  wire [52:0] _T_1031;
  wire [52:0] _T_1032;
  wire [53:0] _T_1033;
  wire [53:0] _T_1035;
  wire [53:0] _T_1036;
  wire [53:0] _T_1040;
  wire [53:0] sigT_C1;
  wire [55:0] remT_E2;
  wire [31:0] _GEN_43;
  wire [57:0] _GEN_44;
  wire [32:0] _GEN_45;
  wire  _T_1041;
  wire  _T_1042;
  wire [57:0] _GEN_46;
  wire [30:0] _T_1043;
  wire [30:0] _GEN_47;
  wire [52:0] _T_1044;
  wire  _T_1045;
  wire  _GEN_48;
  wire [52:0] _GEN_49;
  wire  _GEN_50;
  wire  _T_1046;
  wire  _T_1047;
  wire  _T_1048;
  wire [53:0] _T_1049;
  wire  _T_1051;
  wire [1:0] _T_1054;
  wire  _T_1056;
  wire  _T_1057;
  wire  _T_1058;
  wire  _GEN_51;
  wire  _GEN_52;
  wire  _T_1061;
  wire [13:0] _T_1063;
  wire  _T_1068;
  wire [13:0] _T_1070;
  wire [13:0] _T_1071;
  wire [12:0] _T_1072;
  wire [13:0] _T_1074;
  wire [12:0] _T_1075;
  wire [12:0] _T_1077;
  wire [13:0] _GEN_97;
  wire [13:0] sExpX_E;
  wire [12:0] posExpX_E;
  wire [12:0] _T_1078;
  wire  _T_1079;
  wire [11:0] _T_1080;
  wire  _T_1081;
  wire [10:0] _T_1082;
  wire  _T_1083;
  wire [9:0] _T_1084;
  wire  _T_1085;
  wire [8:0] _T_1086;
  wire  _T_1088;
  wire [7:0] _T_1089;
  wire  _T_1091;
  wire [6:0] _T_1092;
  wire  _T_1094;
  wire [5:0] _T_1095;
  wire [64:0] _T_1098;
  wire [49:0] _T_1099;
  wire [31:0] _T_1100;
  wire [15:0] _T_1105;
  wire [31:0] _T_1106;
  wire [15:0] _T_1107;
  wire [31:0] _GEN_98;
  wire [31:0] _T_1108;
  wire [31:0] _T_1110;
  wire [31:0] _T_1111;
  wire [23:0] _T_1115;
  wire [31:0] _GEN_99;
  wire [31:0] _T_1116;
  wire [23:0] _T_1117;
  wire [31:0] _GEN_100;
  wire [31:0] _T_1118;
  wire [31:0] _T_1120;
  wire [31:0] _T_1121;
  wire [27:0] _T_1125;
  wire [31:0] _GEN_101;
  wire [31:0] _T_1126;
  wire [27:0] _T_1127;
  wire [31:0] _GEN_102;
  wire [31:0] _T_1128;
  wire [31:0] _T_1130;
  wire [31:0] _T_1131;
  wire [29:0] _T_1135;
  wire [31:0] _GEN_103;
  wire [31:0] _T_1136;
  wire [29:0] _T_1137;
  wire [31:0] _GEN_104;
  wire [31:0] _T_1138;
  wire [31:0] _T_1140;
  wire [31:0] _T_1141;
  wire [30:0] _T_1145;
  wire [31:0] _GEN_105;
  wire [31:0] _T_1146;
  wire [30:0] _T_1147;
  wire [31:0] _GEN_106;
  wire [31:0] _T_1148;
  wire [31:0] _T_1150;
  wire [31:0] _T_1151;
  wire [17:0] _T_1152;
  wire [15:0] _T_1153;
  wire [7:0] _T_1158;
  wire [15:0] _T_1159;
  wire [7:0] _T_1160;
  wire [15:0] _GEN_107;
  wire [15:0] _T_1161;
  wire [15:0] _T_1163;
  wire [15:0] _T_1164;
  wire [11:0] _T_1168;
  wire [15:0] _GEN_108;
  wire [15:0] _T_1169;
  wire [11:0] _T_1170;
  wire [15:0] _GEN_109;
  wire [15:0] _T_1171;
  wire [15:0] _T_1173;
  wire [15:0] _T_1174;
  wire [13:0] _T_1178;
  wire [15:0] _GEN_110;
  wire [15:0] _T_1179;
  wire [13:0] _T_1180;
  wire [15:0] _GEN_111;
  wire [15:0] _T_1181;
  wire [15:0] _T_1183;
  wire [15:0] _T_1184;
  wire [14:0] _T_1188;
  wire [15:0] _GEN_112;
  wire [15:0] _T_1189;
  wire [14:0] _T_1190;
  wire [15:0] _GEN_113;
  wire [15:0] _T_1191;
  wire [15:0] _T_1193;
  wire [15:0] _T_1194;
  wire [1:0] _T_1195;
  wire  _T_1196;
  wire  _T_1197;
  wire [1:0] _T_1198;
  wire [17:0] _T_1199;
  wire [49:0] _T_1200;
  wire [49:0] _T_1201;
  wire [49:0] _T_1202;
  wire [49:0] _T_1203;
  wire [49:0] _T_1204;
  wire [49:0] _T_1205;
  wire [49:0] _T_1206;
  wire [49:0] _T_1207;
  wire [49:0] _T_1208;
  wire [49:0] _T_1209;
  wire [49:0] _T_1210;
  wire [49:0] _T_1211;
  wire [49:0] _T_1212;
  wire [52:0] _T_1214;
  wire [2:0] _T_1225;
  wire [1:0] _T_1226;
  wire  _T_1227;
  wire  _T_1228;
  wire [1:0] _T_1229;
  wire  _T_1230;
  wire [2:0] _T_1231;
  wire [2:0] _T_1233;
  wire [2:0] _T_1235;
  wire [2:0] _T_1237;
  wire [2:0] _T_1239;
  wire [52:0] _T_1240;
  wire [52:0] _T_1242;
  wire [52:0] roundMask_E;
  wire [53:0] _T_1245;
  wire [53:0] _T_1246;
  wire [53:0] _T_1248;
  wire [53:0] incrPosMask_E;
  wire [52:0] _T_1249;
  wire [52:0] _T_1250;
  wire  hiRoundPosBitT_E;
  wire [51:0] _T_1252;
  wire [52:0] _GEN_114;
  wire [52:0] _T_1255;
  wire [52:0] _T_1257;
  wire  all1sHiRoundExtraT_E;
  wire  _T_1259;
  wire  _T_1261;
  wire  _T_1262;
  wire  all1sHiRoundT_E;
  wire [53:0] _GEN_116;
  wire [54:0] _T_1264;
  wire [53:0] _T_1265;
  wire [53:0] _GEN_117;
  wire [54:0] _T_1266;
  wire [53:0] sigAdjT_E;
  wire [52:0] _T_1268;
  wire [53:0] _T_1269;
  wire [53:0] sigY0_E;
  wire [53:0] _T_1272;
  wire [54:0] _T_1274;
  wire [53:0] sigY1_E;
  wire  _T_1276;
  wire  _T_1278;
  wire  _T_1279;
  wire  trueLtX_E1;
  wire  _T_1282;
  wire  _T_1283;
  wire  _T_1284;
  wire  _T_1285;
  wire  hiRoundPosBit_E1;
  wire  _T_1290;
  wire  _T_1292;
  wire  anyRoundExtra_E1;
  wire  _T_1293;
  wire  _T_1295;
  wire  _T_1296;
  wire [53:0] roundEvenMask_E1;
  wire  _T_1298;
  wire  _T_1301;
  wire  _T_1302;
  wire  _T_1305;
  wire  _T_1308;
  wire  _T_1310;
  wire  _T_1311;
  wire  _T_1312;
  wire  _T_1313;
  wire  _T_1316;
  wire  _T_1320;
  wire  _T_1321;
  wire  _T_1325;
  wire  _T_1326;
  wire  _T_1327;
  wire  _T_1328;
  wire [53:0] _T_1329;
  wire [53:0] _T_1330;
  wire [53:0] sigY_E1;
  wire [51:0] fractY_E1;
  wire  inexactY_E1;
  wire  _T_1331;
  wire  _T_1333;
  wire [13:0] _T_1335;
  wire  _T_1339;
  wire  _T_1340;
  wire [13:0] _T_1342;
  wire [13:0] _T_1343;
  wire  _T_1350;
  wire [13:0] _T_1352;
  wire [13:0] _T_1353;
  wire  _T_1355;
  wire [12:0] _T_1356;
  wire [13:0] _T_1358;
  wire [12:0] _T_1359;
  wire [12:0] _T_1361;
  wire [13:0] _GEN_118;
  wire [13:0] sExpY_E1;
  wire [11:0] expY_E1;
  wire  _T_1362;
  wire  _T_1364;
  wire [2:0] _T_1366;
  wire  _T_1367;
  wire  overflowY_E1;
  wire [12:0] _T_1369;
  wire  _T_1371;
  wire  totalUnderflowY_E1;
  wire  _T_1373;
  wire  _T_1374;
  wire  underflowY_E1;
  wire  _T_1376;
  wire  _T_1379;
  wire  _T_1380;
  wire  _T_1381;
  wire  _T_1382;
  wire  _T_1383;
  wire  notSigNaN_invalid_PC;
  wire  _T_1386;
  wire  _T_1387;
  wire  invalid_PC;
  wire  _T_1392;
  wire  _T_1395;
  wire  infinity_PC;
  wire  overflow_E1;
  wire  underflow_E1;
  wire  _T_1396;
  wire  _T_1397;
  wire  inexact_E1;
  wire  _T_1398;
  wire  _T_1401;
  wire  _T_1402;
  wire  notSpecial_isZeroOut_E1;
  wire  _T_1403;
  wire  pegMinFiniteMagOut_E1;
  wire  _T_1405;
  wire  pegMaxFiniteMagOut_E1;
  wire  _T_1406;
  wire  _T_1407;
  wire  _T_1408;
  wire  notNaN_isInfOut_E1;
  wire  _T_1411;
  wire  _T_1412;
  wire  isNaNOut_PC;
  wire  _T_1414;
  wire  _T_1415;
  wire  _T_1416;
  wire  signOut_PC;
  wire [11:0] _T_1420;
  wire [11:0] _T_1421;
  wire [11:0] _T_1422;
  wire [11:0] _T_1426;
  wire [11:0] _T_1427;
  wire [11:0] _T_1428;
  wire [11:0] _T_1432;
  wire [11:0] _T_1433;
  wire [11:0] _T_1434;
  wire [11:0] _T_1438;
  wire [11:0] _T_1439;
  wire [11:0] _T_1440;
  wire [11:0] _T_1443;
  wire [11:0] _T_1444;
  wire [11:0] _T_1447;
  wire [11:0] _T_1448;
  wire [11:0] _T_1451;
  wire [11:0] _T_1452;
  wire [11:0] _T_1455;
  wire [11:0] expOut_E1;
  wire  _T_1456;
  wire  _T_1457;
  wire [51:0] _T_1461;
  wire [51:0] _T_1462;
  wire [51:0] _T_1466;
  wire [51:0] fractOut_E1;
  wire [12:0] _T_1467;
  wire [64:0] _T_1468;
  wire [1:0] _T_1469;
  wire [1:0] _T_1470;
  wire [2:0] _T_1471;
  wire [4:0] _T_1472;
  assign io_inReady_div = _T_158;
  assign io_inReady_sqrt = _T_173;
  assign io_outValid_div = _T_391;
  assign io_outValid_sqrt = _T_392;
  assign io_out = _T_1468;
  assign io_exceptionFlags = _T_1472;
  assign io_usingMulAdd = _T_975;
  assign io_latchMulAddA_0 = _T_884;
  assign io_mulAddA_0 = _T_914;
  assign io_latchMulAddB_0 = _T_920;
  assign io_mulAddB_0 = _T_940;
  assign io_mulAddC_2 = _T_1013;
  assign ready_PA = _T_278;
  assign ready_PB = _T_319;
  assign ready_PC = _T_388;
  assign leaving_PA = _T_275;
  assign leaving_PB = _T_316;
  assign leaving_PC = _T_385;
  assign cyc_B10_sqrt = _T_434;
  assign cyc_B9_sqrt = _T_436;
  assign cyc_B8_sqrt = _T_438;
  assign cyc_B7_sqrt = _T_440;
  assign cyc_B6 = _T_442;
  assign cyc_B5 = _T_444;
  assign cyc_B4 = _T_446;
  assign cyc_B3 = _T_448;
  assign cyc_B2 = _T_450;
  assign cyc_B1 = _T_452;
  assign cyc_B6_div = _T_456;
  assign cyc_B5_div = _T_460;
  assign cyc_B4_div = _T_464;
  assign cyc_B3_div = _T_467;
  assign cyc_B2_div = _T_470;
  assign cyc_B1_div = _T_473;
  assign cyc_B6_sqrt = _T_475;
  assign cyc_B5_sqrt = _T_477;
  assign cyc_B4_sqrt = _T_479;
  assign cyc_B3_sqrt = _T_480;
  assign cyc_B2_sqrt = _T_481;
  assign cyc_B1_sqrt = _T_482;
  assign cyc_C5 = _T_495;
  assign cyc_C4 = _T_497;
  assign cyc_C3 = _T_499;
  assign cyc_C2 = _T_501;
  assign cyc_C1 = _T_503;
  assign cyc_E4 = _T_523;
  assign cyc_E3 = _T_525;
  assign cyc_E2 = _T_527;
  assign cyc_E1 = _T_529;
  assign zSigma1_B4 = _T_1017;
  assign sigXNU_B3_CX = _T_1018;
  assign zComplSigT_C1_sqrt = _T_1040;
  assign zComplSigT_C1 = _T_1036;
  assign _T_133 = cyc_B7_sqrt == 1'h0;
  assign _T_134 = ready_PA & _T_133;
  assign _T_136 = cyc_B6_sqrt == 1'h0;
  assign _T_137 = _T_134 & _T_136;
  assign _T_139 = cyc_B5_sqrt == 1'h0;
  assign _T_140 = _T_137 & _T_139;
  assign _T_142 = cyc_B4_sqrt == 1'h0;
  assign _T_143 = _T_140 & _T_142;
  assign _T_145 = cyc_B3 == 1'h0;
  assign _T_146 = _T_143 & _T_145;
  assign _T_148 = cyc_B2 == 1'h0;
  assign _T_149 = _T_146 & _T_148;
  assign _T_151 = cyc_B1_sqrt == 1'h0;
  assign _T_152 = _T_149 & _T_151;
  assign _T_154 = cyc_C5 == 1'h0;
  assign _T_155 = _T_152 & _T_154;
  assign _T_157 = cyc_C4 == 1'h0;
  assign _T_158 = _T_155 & _T_157;
  assign _T_161 = ready_PA & _T_136;
  assign _T_164 = _T_161 & _T_139;
  assign _T_167 = _T_164 & _T_142;
  assign _T_169 = cyc_B2_div == 1'h0;
  assign _T_170 = _T_167 & _T_169;
  assign _T_173 = _T_170 & _T_151;
  assign _T_174 = io_inReady_div & io_inValid;
  assign _T_176 = io_sqrtOp == 1'h0;
  assign cyc_S_div = _T_174 & _T_176;
  assign _T_177 = io_inReady_sqrt & io_inValid;
  assign cyc_S_sqrt = _T_177 & io_sqrtOp;
  assign cyc_S = cyc_S_div | cyc_S_sqrt;
  assign signA_S = io_a[64];
  assign expA_S = io_a[63:52];
  assign fractA_S = io_a[51:0];
  assign specialCodeA_S = expA_S[11:9];
  assign isZeroA_S = specialCodeA_S == 3'h0;
  assign _T_179 = specialCodeA_S[2:1];
  assign isSpecialA_S = _T_179 == 2'h3;
  assign signB_S = io_b[64];
  assign expB_S = io_b[63:52];
  assign fractB_S = io_b[51:0];
  assign specialCodeB_S = expB_S[11:9];
  assign isZeroB_S = specialCodeB_S == 3'h0;
  assign _T_182 = specialCodeB_S[2:1];
  assign isSpecialB_S = _T_182 == 2'h3;
  assign _T_184 = signA_S ^ signB_S;
  assign sign_S = io_sqrtOp ? signB_S : _T_184;
  assign _T_186 = isSpecialA_S == 1'h0;
  assign _T_188 = isSpecialB_S == 1'h0;
  assign _T_189 = _T_186 & _T_188;
  assign _T_191 = isZeroA_S == 1'h0;
  assign _T_192 = _T_189 & _T_191;
  assign _T_194 = isZeroB_S == 1'h0;
  assign normalCase_S_div = _T_192 & _T_194;
  assign _T_199 = _T_188 & _T_194;
  assign _T_201 = signB_S == 1'h0;
  assign normalCase_S_sqrt = _T_199 & _T_201;
  assign normalCase_S = io_sqrtOp ? normalCase_S_sqrt : normalCase_S_div;
  assign cyc_A4_div = cyc_S_div & normalCase_S_div;
  assign cyc_A7_sqrt = cyc_S_sqrt & normalCase_S_sqrt;
  assign entering_PA_normalCase = cyc_A4_div | cyc_A7_sqrt;
  assign _T_203 = ready_PB == 1'h0;
  assign _T_204 = valid_PA | _T_203;
  assign _T_205 = cyc_S & _T_204;
  assign entering_PA = entering_PA_normalCase | _T_205;
  assign _T_207 = normalCase_S == 1'h0;
  assign _T_208 = cyc_S & _T_207;
  assign _T_210 = valid_PA == 1'h0;
  assign _T_211 = _T_208 & _T_210;
  assign _T_213 = valid_PB == 1'h0;
  assign _T_215 = ready_PC == 1'h0;
  assign _T_216 = _T_213 & _T_215;
  assign _T_217 = leaving_PB | _T_216;
  assign entering_PB_S = _T_211 & _T_217;
  assign _T_226 = _T_211 & _T_213;
  assign entering_PC_S = _T_226 & ready_PC;
  assign _T_227 = entering_PA | leaving_PA;
  assign _GEN_0 = _T_227 ? entering_PA : valid_PA;
  assign _T_228 = fractB_S[51];
  assign _GEN_1 = entering_PA ? io_sqrtOp : sqrtOp_PA;
  assign _GEN_2 = entering_PA ? sign_S : sign_PA;
  assign _GEN_3 = entering_PA ? specialCodeB_S : specialCodeB_PA;
  assign _GEN_4 = entering_PA ? _T_228 : fractB_51_PA;
  assign _GEN_5 = entering_PA ? io_roundingMode : roundingMode_PA;
  assign _T_231 = entering_PA & _T_176;
  assign _T_232 = fractA_S[51];
  assign _GEN_6 = _T_231 ? specialCodeA_S : specialCodeA_PA;
  assign _GEN_7 = _T_231 ? _T_232 : fractA_51_PA;
  assign _T_233 = expB_S[11];
  assign _T_237 = _T_233 ? 3'h7 : 3'h0;
  assign _T_238 = expB_S[10:0];
  assign _T_239 = ~ _T_238;
  assign _T_240 = {_T_237,_T_239};
  assign _GEN_53 = {{2'd0}, expA_S};
  assign _T_241 = _GEN_53 + _T_240;
  assign _T_242 = _T_241[13:0];
  assign _T_243 = io_sqrtOp ? {{2'd0}, expB_S} : _T_242;
  assign _T_244 = fractB_S[50:0];
  assign _GEN_8 = entering_PA_normalCase ? _T_243 : exp_PA;
  assign _GEN_9 = entering_PA_normalCase ? _T_244 : fractB_other_PA;
  assign _T_245 = fractA_S[50:0];
  assign _GEN_10 = cyc_A4_div ? _T_245 : fractA_other_PA;
  assign isZeroA_PA = specialCodeA_PA == 3'h0;
  assign _T_247 = specialCodeA_PA[2:1];
  assign isSpecialA_PA = _T_247 == 2'h3;
  assign _T_250 = {1'h1,fractA_51_PA};
  assign sigA_PA = {_T_250,fractA_other_PA};
  assign isZeroB_PA = specialCodeB_PA == 3'h0;
  assign _T_252 = specialCodeB_PA[2:1];
  assign isSpecialB_PA = _T_252 == 2'h3;
  assign _T_255 = {1'h1,fractB_51_PA};
  assign sigB_PA = {_T_255,fractB_other_PA};
  assign _T_257 = isSpecialB_PA == 1'h0;
  assign _T_259 = isZeroB_PA == 1'h0;
  assign _T_260 = _T_257 & _T_259;
  assign _T_262 = sign_PA == 1'h0;
  assign _T_263 = _T_260 & _T_262;
  assign _T_265 = isSpecialA_PA == 1'h0;
  assign _T_268 = _T_265 & _T_257;
  assign _T_270 = isZeroA_PA == 1'h0;
  assign _T_271 = _T_268 & _T_270;
  assign _T_274 = _T_271 & _T_259;
  assign normalCase_PA = sqrtOp_PA ? _T_263 : _T_274;
  assign valid_normalCase_leaving_PA = cyc_B4_div | cyc_B7_sqrt;
  assign valid_leaving_PA = normalCase_PA ? valid_normalCase_leaving_PA : ready_PB;
  assign _T_275 = valid_PA & valid_leaving_PA;
  assign _T_278 = _T_210 | valid_leaving_PA;
  assign _T_279 = valid_PA & normalCase_PA;
  assign entering_PB_normalCase = _T_279 & valid_normalCase_leaving_PA;
  assign entering_PB = entering_PB_S | leaving_PA;
  assign _T_280 = entering_PB | leaving_PB;
  assign _GEN_11 = _T_280 ? entering_PB : valid_PB;
  assign _T_281 = valid_PA ? sqrtOp_PA : io_sqrtOp;
  assign _T_282 = valid_PA ? sign_PA : sign_S;
  assign _T_283 = valid_PA ? specialCodeA_PA : specialCodeA_S;
  assign _T_285 = valid_PA ? fractA_51_PA : _T_232;
  assign _T_286 = valid_PA ? specialCodeB_PA : specialCodeB_S;
  assign _T_288 = valid_PA ? fractB_51_PA : _T_228;
  assign _T_289 = valid_PA ? roundingMode_PA : io_roundingMode;
  assign _GEN_12 = entering_PB ? _T_281 : sqrtOp_PB;
  assign _GEN_13 = entering_PB ? _T_282 : sign_PB;
  assign _GEN_14 = entering_PB ? _T_283 : specialCodeA_PB;
  assign _GEN_15 = entering_PB ? _T_285 : fractA_51_PB;
  assign _GEN_16 = entering_PB ? _T_286 : specialCodeB_PB;
  assign _GEN_17 = entering_PB ? _T_288 : fractB_51_PB;
  assign _GEN_18 = entering_PB ? _T_289 : roundingMode_PB;
  assign _T_290 = fractA_other_PA[0];
  assign _GEN_19 = entering_PB_normalCase ? exp_PA : exp_PB;
  assign _GEN_20 = entering_PB_normalCase ? _T_290 : fractA_0_PB;
  assign _GEN_21 = entering_PB_normalCase ? fractB_other_PA : fractB_other_PB;
  assign isZeroA_PB = specialCodeA_PB == 3'h0;
  assign _T_292 = specialCodeA_PB[2:1];
  assign isSpecialA_PB = _T_292 == 2'h3;
  assign isZeroB_PB = specialCodeB_PB == 3'h0;
  assign _T_295 = specialCodeB_PB[2:1];
  assign isSpecialB_PB = _T_295 == 2'h3;
  assign _T_298 = isSpecialB_PB == 1'h0;
  assign _T_300 = isZeroB_PB == 1'h0;
  assign _T_301 = _T_298 & _T_300;
  assign _T_303 = sign_PB == 1'h0;
  assign _T_304 = _T_301 & _T_303;
  assign _T_306 = isSpecialA_PB == 1'h0;
  assign _T_309 = _T_306 & _T_298;
  assign _T_311 = isZeroA_PB == 1'h0;
  assign _T_312 = _T_309 & _T_311;
  assign _T_315 = _T_312 & _T_300;
  assign normalCase_PB = sqrtOp_PB ? _T_304 : _T_315;
  assign valid_leaving_PB = normalCase_PB ? cyc_C3 : ready_PC;
  assign _T_316 = valid_PB & valid_leaving_PB;
  assign _T_319 = _T_213 | valid_leaving_PB;
  assign _T_320 = valid_PB & normalCase_PB;
  assign entering_PC_normalCase = _T_320 & cyc_C3;
  assign entering_PC = entering_PC_S | leaving_PB;
  assign _T_321 = entering_PC | leaving_PC;
  assign _GEN_22 = _T_321 ? entering_PC : valid_PC;
  assign _T_322 = valid_PB ? sqrtOp_PB : io_sqrtOp;
  assign _T_323 = valid_PB ? sign_PB : sign_S;
  assign _T_324 = valid_PB ? specialCodeA_PB : specialCodeA_S;
  assign _T_326 = valid_PB ? fractA_51_PB : _T_232;
  assign _T_327 = valid_PB ? specialCodeB_PB : specialCodeB_S;
  assign _T_329 = valid_PB ? fractB_51_PB : _T_228;
  assign _T_330 = valid_PB ? roundingMode_PB : io_roundingMode;
  assign _GEN_23 = entering_PC ? _T_322 : sqrtOp_PC;
  assign _GEN_24 = entering_PC ? _T_323 : sign_PC;
  assign _GEN_25 = entering_PC ? _T_324 : specialCodeA_PC;
  assign _GEN_26 = entering_PC ? _T_326 : fractA_51_PC;
  assign _GEN_27 = entering_PC ? _T_327 : specialCodeB_PC;
  assign _GEN_28 = entering_PC ? _T_329 : fractB_51_PC;
  assign _GEN_29 = entering_PC ? _T_330 : roundingMode_PC;
  assign _GEN_30 = entering_PC_normalCase ? exp_PB : exp_PC;
  assign _GEN_31 = entering_PC_normalCase ? fractA_0_PB : fractA_0_PC;
  assign _GEN_32 = entering_PC_normalCase ? fractB_other_PB : fractB_other_PC;
  assign isZeroA_PC = specialCodeA_PC == 3'h0;
  assign _T_332 = specialCodeA_PC[2:1];
  assign isSpecialA_PC = _T_332 == 2'h3;
  assign _T_334 = specialCodeA_PC[0];
  assign _T_336 = _T_334 == 1'h0;
  assign isInfA_PC = isSpecialA_PC & _T_336;
  assign isNaNA_PC = isSpecialA_PC & _T_334;
  assign _T_339 = fractA_51_PC == 1'h0;
  assign isSigNaNA_PC = isNaNA_PC & _T_339;
  assign isZeroB_PC = specialCodeB_PC == 3'h0;
  assign _T_341 = specialCodeB_PC[2:1];
  assign isSpecialB_PC = _T_341 == 2'h3;
  assign _T_343 = specialCodeB_PC[0];
  assign _T_345 = _T_343 == 1'h0;
  assign isInfB_PC = isSpecialB_PC & _T_345;
  assign isNaNB_PC = isSpecialB_PC & _T_343;
  assign _T_348 = fractB_51_PC == 1'h0;
  assign isSigNaNB_PC = isNaNB_PC & _T_348;
  assign _T_350 = {1'h1,fractB_51_PC};
  assign sigB_PC = {_T_350,fractB_other_PC};
  assign _T_352 = isSpecialB_PC == 1'h0;
  assign _T_354 = isZeroB_PC == 1'h0;
  assign _T_355 = _T_352 & _T_354;
  assign _T_357 = sign_PC == 1'h0;
  assign _T_358 = _T_355 & _T_357;
  assign _T_360 = isSpecialA_PC == 1'h0;
  assign _T_363 = _T_360 & _T_352;
  assign _T_365 = isZeroA_PC == 1'h0;
  assign _T_366 = _T_363 & _T_365;
  assign _T_369 = _T_366 & _T_354;
  assign normalCase_PC = sqrtOp_PC ? _T_358 : _T_369;
  assign _T_371 = exp_PC + 14'h2;
  assign expP2_PC = _T_371[13:0];
  assign _T_372 = exp_PC[0];
  assign _T_373 = expP2_PC[13:1];
  assign _T_375 = {_T_373,1'h0};
  assign _T_376 = exp_PC[13:1];
  assign _T_378 = {_T_376,1'h1};
  assign expP1_PC = _T_372 ? _T_375 : _T_378;
  assign roundingMode_near_even_PC = roundingMode_PC == 2'h0;
  assign roundingMode_min_PC = roundingMode_PC == 2'h2;
  assign roundingMode_max_PC = roundingMode_PC == 2'h3;
  assign roundMagUp_PC = sign_PC ? roundingMode_min_PC : roundingMode_max_PC;
  assign overflowY_roundMagUp_PC = roundingMode_near_even_PC | roundMagUp_PC;
  assign _T_380 = roundMagUp_PC == 1'h0;
  assign _T_382 = roundingMode_near_even_PC == 1'h0;
  assign roundMagDown_PC = _T_380 & _T_382;
  assign _T_384 = normalCase_PC == 1'h0;
  assign valid_leaving_PC = _T_384 | cyc_E1;
  assign _T_385 = valid_PC & valid_leaving_PC;
  assign _T_387 = valid_PC == 1'h0;
  assign _T_388 = _T_387 | valid_leaving_PC;
  assign _T_390 = sqrtOp_PC == 1'h0;
  assign _T_391 = leaving_PC & _T_390;
  assign _T_392 = leaving_PC & sqrtOp_PC;
  assign _T_394 = cycleNum_A != 3'h0;
  assign _T_395 = entering_PA_normalCase | _T_394;
  assign _T_398 = cyc_A4_div ? 2'h3 : 2'h0;
  assign _T_401 = cyc_A7_sqrt ? 3'h6 : 3'h0;
  assign _GEN_54 = {{1'd0}, _T_398};
  assign _T_402 = _GEN_54 | _T_401;
  assign _T_404 = entering_PA_normalCase == 1'h0;
  assign _T_406 = cycleNum_A - 3'h1;
  assign _T_407 = _T_406[2:0];
  assign _T_409 = _T_404 ? _T_407 : 3'h0;
  assign _T_410 = _T_402 | _T_409;
  assign _GEN_33 = _T_395 ? _T_410 : cycleNum_A;
  assign cyc_A6_sqrt = cycleNum_A == 3'h6;
  assign cyc_A5_sqrt = cycleNum_A == 3'h5;
  assign cyc_A4_sqrt = cycleNum_A == 3'h4;
  assign cyc_A4 = cyc_A4_sqrt | cyc_A4_div;
  assign cyc_A3 = cycleNum_A == 3'h3;
  assign cyc_A2 = cycleNum_A == 3'h2;
  assign cyc_A1 = cycleNum_A == 3'h1;
  assign _T_418 = sqrtOp_PA == 1'h0;
  assign cyc_A3_div = cyc_A3 & _T_418;
  assign cyc_A2_div = cyc_A2 & _T_418;
  assign cyc_A1_div = cyc_A1 & _T_418;
  assign cyc_A3_sqrt = cyc_A3 & sqrtOp_PA;
  assign cyc_A1_sqrt = cyc_A1 & sqrtOp_PA;
  assign _T_424 = cycleNum_B != 4'h0;
  assign _T_425 = cyc_A1 | _T_424;
  assign _T_428 = sqrtOp_PA ? 4'ha : 4'h6;
  assign _T_430 = cycleNum_B - 4'h1;
  assign _T_431 = _T_430[3:0];
  assign _T_432 = cyc_A1 ? _T_428 : _T_431;
  assign _GEN_34 = _T_425 ? _T_432 : cycleNum_B;
  assign _T_434 = cycleNum_B == 4'ha;
  assign _T_436 = cycleNum_B == 4'h9;
  assign _T_438 = cycleNum_B == 4'h8;
  assign _T_440 = cycleNum_B == 4'h7;
  assign _T_442 = cycleNum_B == 4'h6;
  assign _T_444 = cycleNum_B == 4'h5;
  assign _T_446 = cycleNum_B == 4'h4;
  assign _T_448 = cycleNum_B == 4'h3;
  assign _T_450 = cycleNum_B == 4'h2;
  assign _T_452 = cycleNum_B == 4'h1;
  assign _T_453 = cyc_B6 & valid_PA;
  assign _T_456 = _T_453 & _T_418;
  assign _T_457 = cyc_B5 & valid_PA;
  assign _T_460 = _T_457 & _T_418;
  assign _T_461 = cyc_B4 & valid_PA;
  assign _T_464 = _T_461 & _T_418;
  assign _T_466 = sqrtOp_PB == 1'h0;
  assign _T_467 = cyc_B3 & _T_466;
  assign _T_470 = cyc_B2 & _T_466;
  assign _T_473 = cyc_B1 & _T_466;
  assign _T_474 = cyc_B6 & valid_PB;
  assign _T_475 = _T_474 & sqrtOp_PB;
  assign _T_476 = cyc_B5 & valid_PB;
  assign _T_477 = _T_476 & sqrtOp_PB;
  assign _T_478 = cyc_B4 & valid_PB;
  assign _T_479 = _T_478 & sqrtOp_PB;
  assign _T_480 = cyc_B3 & sqrtOp_PB;
  assign _T_481 = cyc_B2 & sqrtOp_PB;
  assign _T_482 = cyc_B1 & sqrtOp_PB;
  assign _T_484 = cycleNum_C != 3'h0;
  assign _T_485 = cyc_B1 | _T_484;
  assign _T_488 = sqrtOp_PB ? 3'h6 : 3'h5;
  assign _T_490 = cycleNum_C - 3'h1;
  assign _T_491 = _T_490[2:0];
  assign _T_492 = cyc_B1 ? _T_488 : _T_491;
  assign _GEN_35 = _T_485 ? _T_492 : cycleNum_C;
  assign cyc_C6_sqrt = cycleNum_C == 3'h6;
  assign _T_495 = cycleNum_C == 3'h5;
  assign _T_497 = cycleNum_C == 3'h4;
  assign _T_499 = cycleNum_C == 3'h3;
  assign _T_501 = cycleNum_C == 3'h2;
  assign _T_503 = cycleNum_C == 3'h1;
  assign cyc_C5_div = cyc_C5 & _T_466;
  assign cyc_C4_div = cyc_C4 & _T_466;
  assign cyc_C1_div = cyc_C1 & _T_390;
  assign cyc_C5_sqrt = cyc_C5 & sqrtOp_PB;
  assign cyc_C4_sqrt = cyc_C4 & sqrtOp_PB;
  assign cyc_C3_sqrt = cyc_C3 & sqrtOp_PB;
  assign cyc_C1_sqrt = cyc_C1 & sqrtOp_PC;
  assign _T_515 = cycleNum_E != 3'h0;
  assign _T_516 = cyc_C1 | _T_515;
  assign _T_519 = cycleNum_E - 3'h1;
  assign _T_520 = _T_519[2:0];
  assign _T_521 = cyc_C1 ? 3'h4 : _T_520;
  assign _GEN_36 = _T_516 ? _T_521 : cycleNum_E;
  assign _T_523 = cycleNum_E == 3'h4;
  assign _T_525 = cycleNum_E == 3'h3;
  assign _T_527 = cycleNum_E == 3'h2;
  assign _T_529 = cycleNum_E == 3'h1;
  assign cyc_E3_div = cyc_E3 & _T_390;
  assign cyc_E3_sqrt = cyc_E3 & sqrtOp_PC;
  assign zFractB_A4_div = cyc_A4_div ? fractB_S : 52'h0;
  assign _T_539 = fractB_S[51:49];
  assign _T_541 = _T_539 == 3'h0;
  assign zLinPiece_0_A4_div = cyc_A4_div & _T_541;
  assign _T_544 = _T_539 == 3'h1;
  assign zLinPiece_1_A4_div = cyc_A4_div & _T_544;
  assign _T_547 = _T_539 == 3'h2;
  assign zLinPiece_2_A4_div = cyc_A4_div & _T_547;
  assign _T_550 = _T_539 == 3'h3;
  assign zLinPiece_3_A4_div = cyc_A4_div & _T_550;
  assign _T_553 = _T_539 == 3'h4;
  assign zLinPiece_4_A4_div = cyc_A4_div & _T_553;
  assign _T_556 = _T_539 == 3'h5;
  assign zLinPiece_5_A4_div = cyc_A4_div & _T_556;
  assign _T_559 = _T_539 == 3'h6;
  assign zLinPiece_6_A4_div = cyc_A4_div & _T_559;
  assign _T_562 = _T_539 == 3'h7;
  assign zLinPiece_7_A4_div = cyc_A4_div & _T_562;
  assign _T_565 = zLinPiece_0_A4_div ? 9'h1c7 : 9'h0;
  assign _T_568 = zLinPiece_1_A4_div ? 9'h16c : 9'h0;
  assign _T_569 = _T_565 | _T_568;
  assign _T_572 = zLinPiece_2_A4_div ? 9'h12a : 9'h0;
  assign _T_573 = _T_569 | _T_572;
  assign _T_576 = zLinPiece_3_A4_div ? 9'hf8 : 9'h0;
  assign _T_577 = _T_573 | _T_576;
  assign _T_580 = zLinPiece_4_A4_div ? 9'hd2 : 9'h0;
  assign _T_581 = _T_577 | _T_580;
  assign _T_584 = zLinPiece_5_A4_div ? 9'hb4 : 9'h0;
  assign _T_585 = _T_581 | _T_584;
  assign _T_588 = zLinPiece_6_A4_div ? 9'h9c : 9'h0;
  assign _T_589 = _T_585 | _T_588;
  assign _T_592 = zLinPiece_7_A4_div ? 9'h89 : 9'h0;
  assign zK1_A4_div = _T_589 | _T_592;
  assign _T_596 = zLinPiece_0_A4_div ? 12'h1c : 12'h0;
  assign _T_600 = zLinPiece_1_A4_div ? 12'h3a2 : 12'h0;
  assign _T_601 = _T_596 | _T_600;
  assign _T_605 = zLinPiece_2_A4_div ? 12'h675 : 12'h0;
  assign _T_606 = _T_601 | _T_605;
  assign _T_610 = zLinPiece_3_A4_div ? 12'h8c6 : 12'h0;
  assign _T_611 = _T_606 | _T_610;
  assign _T_615 = zLinPiece_4_A4_div ? 12'hab4 : 12'h0;
  assign _T_616 = _T_611 | _T_615;
  assign _T_620 = zLinPiece_5_A4_div ? 12'hc56 : 12'h0;
  assign _T_621 = _T_616 | _T_620;
  assign _T_625 = zLinPiece_6_A4_div ? 12'hdbd : 12'h0;
  assign _T_626 = _T_621 | _T_625;
  assign _T_630 = zLinPiece_7_A4_div ? 12'hef4 : 12'h0;
  assign zComplFractK0_A4_div = _T_626 | _T_630;
  assign zFractB_A7_sqrt = cyc_A7_sqrt ? fractB_S : 52'h0;
  assign _T_632 = expB_S[0];
  assign _T_634 = _T_632 == 1'h0;
  assign _T_635 = cyc_A7_sqrt & _T_634;
  assign _T_638 = _T_228 == 1'h0;
  assign zQuadPiece_0_A7_sqrt = _T_635 & _T_638;
  assign zQuadPiece_1_A7_sqrt = _T_635 & _T_228;
  assign _T_645 = cyc_A7_sqrt & _T_632;
  assign zQuadPiece_2_A7_sqrt = _T_645 & _T_638;
  assign zQuadPiece_3_A7_sqrt = _T_645 & _T_228;
  assign _T_654 = zQuadPiece_0_A7_sqrt ? 9'h1c8 : 9'h0;
  assign _T_657 = zQuadPiece_1_A7_sqrt ? 9'hc1 : 9'h0;
  assign _T_658 = _T_654 | _T_657;
  assign _T_661 = zQuadPiece_2_A7_sqrt ? 9'h143 : 9'h0;
  assign _T_662 = _T_658 | _T_661;
  assign _T_665 = zQuadPiece_3_A7_sqrt ? 9'h89 : 9'h0;
  assign zK2_A7_sqrt = _T_662 | _T_665;
  assign _T_669 = zQuadPiece_0_A7_sqrt ? 10'h2f : 10'h0;
  assign _T_673 = zQuadPiece_1_A7_sqrt ? 10'h1df : 10'h0;
  assign _T_674 = _T_669 | _T_673;
  assign _T_678 = zQuadPiece_2_A7_sqrt ? 10'h14d : 10'h0;
  assign _T_679 = _T_674 | _T_678;
  assign _T_683 = zQuadPiece_3_A7_sqrt ? 10'h27e : 10'h0;
  assign zComplK1_A7_sqrt = _T_679 | _T_683;
  assign _T_684 = exp_PA[0];
  assign _T_686 = _T_684 == 1'h0;
  assign _T_687 = cyc_A6_sqrt & _T_686;
  assign _T_688 = sigB_PA[51];
  assign _T_690 = _T_688 == 1'h0;
  assign zQuadPiece_0_A6_sqrt = _T_687 & _T_690;
  assign zQuadPiece_1_A6_sqrt = _T_687 & _T_688;
  assign _T_697 = cyc_A6_sqrt & _T_684;
  assign zQuadPiece_2_A6_sqrt = _T_697 & _T_690;
  assign zQuadPiece_3_A6_sqrt = _T_697 & _T_688;
  assign _T_707 = zQuadPiece_0_A6_sqrt ? 13'h1a : 13'h0;
  assign _T_711 = zQuadPiece_1_A6_sqrt ? 13'hbca : 13'h0;
  assign _T_712 = _T_707 | _T_711;
  assign _T_716 = zQuadPiece_2_A6_sqrt ? 13'h12d3 : 13'h0;
  assign _T_717 = _T_712 | _T_716;
  assign _T_721 = zQuadPiece_3_A6_sqrt ? 13'h1b17 : 13'h0;
  assign zComplFractK0_A6_sqrt = _T_717 | _T_721;
  assign _T_722 = zFractB_A4_div[48:40];
  assign _T_723 = _T_722 | zK2_A7_sqrt;
  assign _T_725 = cyc_S == 1'h0;
  assign _T_727 = _T_725 ? nextMulAdd9A_A : 9'h0;
  assign mulAdd9A_A = _T_723 | _T_727;
  assign _T_728 = zFractB_A7_sqrt[50:42];
  assign _T_729 = zK1_A4_div | _T_728;
  assign _T_733 = _T_725 ? nextMulAdd9B_A : 9'h0;
  assign mulAdd9B_A = _T_729 | _T_733;
  assign _T_737 = cyc_A7_sqrt ? 10'h3ff : 10'h0;
  assign _T_738 = {zComplK1_A7_sqrt,_T_737};
  assign _T_742 = cyc_A6_sqrt ? 6'h3f : 6'h0;
  assign _T_743 = {cyc_A6_sqrt,zComplFractK0_A6_sqrt};
  assign _T_744 = {_T_743,_T_742};
  assign _T_745 = _T_738 | _T_744;
  assign _T_749 = cyc_A4_div ? 8'hff : 8'h0;
  assign _T_750 = {cyc_A4_div,zComplFractK0_A4_div};
  assign _T_751 = {_T_750,_T_749};
  assign _GEN_55 = {{1'd0}, _T_745};
  assign _T_752 = _GEN_55 | _T_751;
  assign _GEN_56 = {{10'd0}, fractR0_A};
  assign _T_754 = _GEN_56 << 10;
  assign _GEN_57 = {{1'd0}, _T_754};
  assign _T_755 = 20'h40000 + _GEN_57;
  assign _T_756 = _T_755[19:0];
  assign _T_758 = cyc_A5_sqrt ? _T_756 : 20'h0;
  assign _GEN_58 = {{1'd0}, _T_758};
  assign _T_759 = _T_752 | _GEN_58;
  assign _T_760 = hiSqrR0_A_sqrt[9];
  assign _T_762 = _T_760 == 1'h0;
  assign _T_763 = cyc_A4_sqrt & _T_762;
  assign _T_766 = _T_763 ? 11'h400 : 11'h0;
  assign _GEN_59 = {{10'd0}, _T_766};
  assign _T_767 = _T_759 | _GEN_59;
  assign _T_769 = cyc_A4_sqrt & _T_760;
  assign _T_770 = _T_769 | cyc_A3_div;
  assign _T_771 = sigB_PA[46:26];
  assign _T_773 = _T_771 + 21'h400;
  assign _T_774 = _T_773[20:0];
  assign _T_776 = _T_770 ? _T_774 : 21'h0;
  assign _T_777 = _T_767 | _T_776;
  assign _T_778 = cyc_A3_sqrt | cyc_A2;
  assign _T_780 = _T_778 ? partNegSigma0_A : 21'h0;
  assign _T_781 = _T_777 | _T_780;
  assign _GEN_60 = {{16'd0}, fractR0_A};
  assign _T_782 = _GEN_60 << 16;
  assign _T_784 = cyc_A1_sqrt ? _T_782 : 25'h0;
  assign _GEN_61 = {{4'd0}, _T_781};
  assign _T_785 = _GEN_61 | _T_784;
  assign _GEN_62 = {{15'd0}, fractR0_A};
  assign _T_786 = _GEN_62 << 15;
  assign _T_788 = cyc_A1_div ? _T_786 : 24'h0;
  assign _GEN_63 = {{1'd0}, _T_788};
  assign mulAdd9C_A = _T_785 | _GEN_63;
  assign _T_789 = mulAdd9A_A * mulAdd9B_A;
  assign _T_791 = mulAdd9C_A[17:0];
  assign _T_792 = {1'h0,_T_791};
  assign _GEN_64 = {{1'd0}, _T_789};
  assign _T_793 = _GEN_64 + _T_792;
  assign loMulAdd9Out_A = _T_793[18:0];
  assign _T_794 = loMulAdd9Out_A[18];
  assign _T_795 = mulAdd9C_A[24:18];
  assign _T_797 = _T_795 + 7'h1;
  assign _T_798 = _T_797[6:0];
  assign _T_800 = _T_794 ? _T_798 : _T_795;
  assign _T_801 = loMulAdd9Out_A[17:0];
  assign mulAdd9Out_A = {_T_800,_T_801};
  assign _T_802 = mulAdd9Out_A[19];
  assign _T_803 = cyc_A6_sqrt & _T_802;
  assign _T_804 = ~ mulAdd9Out_A;
  assign _T_805 = _T_804[24:10];
  assign _T_807 = _T_803 ? _T_805 : 15'h0;
  assign zFractR0_A6_sqrt = _T_807[8:0];
  assign _GEN_65 = {{1'd0}, mulAdd9Out_A};
  assign _T_809 = _GEN_65 << 1;
  assign sqrR0_A5_sqrt = _T_684 ? _T_809 : {{1'd0}, mulAdd9Out_A};
  assign _T_810 = mulAdd9Out_A[20];
  assign _T_811 = cyc_A4_div & _T_810;
  assign _T_813 = _T_804[24:11];
  assign _T_815 = _T_811 ? _T_813 : 14'h0;
  assign zFractR0_A4_div = _T_815[8:0];
  assign _T_816 = mulAdd9Out_A[11];
  assign _T_817 = cyc_A2 & _T_816;
  assign _T_819 = _T_804[24:2];
  assign _T_821 = _T_817 ? _T_819 : 23'h0;
  assign zSigma0_A2 = _T_821[8:0];
  assign _T_822 = mulAdd9Out_A[24:10];
  assign _T_823 = mulAdd9Out_A[24:9];
  assign _T_824 = sqrtOp_PA ? {{1'd0}, _T_822} : _T_823;
  assign fractR1_A1 = _T_824[14:0];
  assign r1_A1 = {1'h1,fractR1_A1};
  assign _GEN_66 = {{1'd0}, r1_A1};
  assign _T_827 = _GEN_66 << 1;
  assign ER1_A1_sqrt = _T_684 ? _T_827 : {{1'd0}, r1_A1};
  assign _T_828 = cyc_A6_sqrt | cyc_A4_div;
  assign _T_829 = zFractR0_A6_sqrt | zFractR0_A4_div;
  assign _GEN_37 = _T_828 ? _T_829 : fractR0_A;
  assign _T_830 = sqrR0_A5_sqrt[25:10];
  assign _GEN_38 = cyc_A5_sqrt ? _T_830 : {{6'd0}, hiSqrR0_A_sqrt};
  assign _T_831 = cyc_A4_sqrt | cyc_A3;
  assign _T_833 = cyc_A4_sqrt ? mulAdd9Out_A : {{9'd0}, _T_823};
  assign _T_834 = _T_833[20:0];
  assign _GEN_39 = _T_831 ? _T_834 : partNegSigma0_A;
  assign _T_835 = cyc_A7_sqrt | cyc_A6_sqrt;
  assign _T_836 = _T_835 | cyc_A5_sqrt;
  assign _T_837 = _T_836 | cyc_A4;
  assign _T_838 = _T_837 | cyc_A3;
  assign _T_839 = _T_838 | cyc_A2;
  assign _T_843 = cyc_A7_sqrt ? _T_813 : 14'h0;
  assign _GEN_67 = {{5'd0}, zFractR0_A6_sqrt};
  assign _T_844 = _T_843 | _GEN_67;
  assign _T_845 = sigB_PA[43:35];
  assign _T_847 = cyc_A4_sqrt ? _T_845 : 9'h0;
  assign _GEN_68 = {{5'd0}, _T_847};
  assign _T_848 = _T_844 | _GEN_68;
  assign _T_849 = zFractB_A4_div[43:35];
  assign _GEN_69 = {{5'd0}, _T_849};
  assign _T_850 = _T_848 | _GEN_69;
  assign _T_851 = cyc_A5_sqrt | cyc_A3;
  assign _T_852 = sigB_PA[52:44];
  assign _T_854 = _T_851 ? _T_852 : 9'h0;
  assign _GEN_70 = {{5'd0}, _T_854};
  assign _T_855 = _T_850 | _GEN_70;
  assign _GEN_71 = {{5'd0}, zSigma0_A2};
  assign _T_856 = _T_855 | _GEN_71;
  assign _GEN_40 = _T_839 ? _T_856 : {{5'd0}, nextMulAdd9A_A};
  assign _T_860 = _T_837 | cyc_A2;
  assign _T_862 = _T_728 | zFractR0_A6_sqrt;
  assign _T_863 = sqrR0_A5_sqrt[9:1];
  assign _T_865 = cyc_A5_sqrt ? _T_863 : 9'h0;
  assign _T_866 = _T_862 | _T_865;
  assign _T_867 = _T_866 | zFractR0_A4_div;
  assign _T_868 = hiSqrR0_A_sqrt[8:0];
  assign _T_870 = cyc_A4_sqrt ? _T_868 : 9'h0;
  assign _T_871 = _T_867 | _T_870;
  assign _T_873 = fractR0_A[8:1];
  assign _T_874 = {1'h1,_T_873};
  assign _T_876 = cyc_A2 ? _T_874 : 9'h0;
  assign _T_877 = _T_871 | _T_876;
  assign _GEN_41 = _T_860 ? _T_877 : nextMulAdd9B_A;
  assign _GEN_42 = cyc_A1_sqrt ? ER1_A1_sqrt : ER1_B_sqrt;
  assign _T_878 = cyc_A1 | cyc_B7_sqrt;
  assign _T_879 = _T_878 | cyc_B6_div;
  assign _T_880 = _T_879 | cyc_B4;
  assign _T_881 = _T_880 | cyc_B3;
  assign _T_882 = _T_881 | cyc_C6_sqrt;
  assign _T_883 = _T_882 | cyc_C4;
  assign _T_884 = _T_883 | cyc_C1;
  assign _GEN_72 = {{36'd0}, ER1_A1_sqrt};
  assign _T_885 = _GEN_72 << 36;
  assign _T_887 = cyc_A1_sqrt ? _T_885 : 53'h0;
  assign _T_888 = cyc_B7_sqrt | cyc_A1_div;
  assign _T_890 = _T_888 ? sigB_PA : 53'h0;
  assign _T_891 = _T_887 | _T_890;
  assign _T_893 = cyc_B6_div ? sigA_PA : 53'h0;
  assign _T_894 = _T_891 | _T_893;
  assign _T_895 = zSigma1_B4[45:12];
  assign _GEN_73 = {{19'd0}, _T_895};
  assign _T_896 = _T_894 | _GEN_73;
  assign _T_897 = cyc_B3 | cyc_C6_sqrt;
  assign _T_898 = sigXNU_B3_CX[57:12];
  assign _T_900 = _T_897 ? _T_898 : 46'h0;
  assign _GEN_74 = {{7'd0}, _T_900};
  assign _T_901 = _T_896 | _GEN_74;
  assign _T_902 = sigXN_C[57:25];
  assign _GEN_75 = {{13'd0}, _T_902};
  assign _T_903 = _GEN_75 << 13;
  assign _T_905 = cyc_C4_div ? _T_903 : 46'h0;
  assign _GEN_76 = {{7'd0}, _T_905};
  assign _T_906 = _T_901 | _GEN_76;
  assign _GEN_77 = {{15'd0}, u_C_sqrt};
  assign _T_907 = _GEN_77 << 15;
  assign _T_909 = cyc_C4_sqrt ? _T_907 : 46'h0;
  assign _GEN_78 = {{7'd0}, _T_909};
  assign _T_910 = _T_906 | _GEN_78;
  assign _T_912 = cyc_C1_div ? sigB_PC : 53'h0;
  assign _T_913 = _T_910 | _T_912;
  assign _GEN_79 = {{1'd0}, _T_913};
  assign _T_914 = _GEN_79 | zComplSigT_C1_sqrt;
  assign _T_916 = _T_878 | cyc_B6_sqrt;
  assign _T_917 = _T_916 | cyc_B4;
  assign _T_918 = _T_917 | cyc_C6_sqrt;
  assign _T_919 = _T_918 | cyc_C4;
  assign _T_920 = _T_919 | cyc_C1;
  assign _GEN_80 = {{36'd0}, r1_A1};
  assign _T_921 = _GEN_80 << 36;
  assign _T_923 = cyc_A1 ? _T_921 : 52'h0;
  assign _GEN_81 = {{19'd0}, ESqrR1_B_sqrt};
  assign _T_924 = _GEN_81 << 19;
  assign _T_926 = cyc_B7_sqrt ? _T_924 : 51'h0;
  assign _GEN_82 = {{1'd0}, _T_926};
  assign _T_927 = _T_923 | _GEN_82;
  assign _GEN_83 = {{36'd0}, ER1_B_sqrt};
  assign _T_928 = _GEN_83 << 36;
  assign _T_930 = cyc_B6_sqrt ? _T_928 : 53'h0;
  assign _GEN_84 = {{1'd0}, _T_927};
  assign _T_931 = _GEN_84 | _T_930;
  assign _GEN_85 = {{7'd0}, zSigma1_B4};
  assign _T_932 = _T_931 | _GEN_85;
  assign _T_933 = sqrSigma1_C[30:1];
  assign _T_935 = cyc_C6_sqrt ? _T_933 : 30'h0;
  assign _GEN_86 = {{23'd0}, _T_935};
  assign _T_936 = _T_932 | _GEN_86;
  assign _T_938 = cyc_C4 ? sqrSigma1_C : 33'h0;
  assign _GEN_87 = {{20'd0}, _T_938};
  assign _T_939 = _T_936 | _GEN_87;
  assign _GEN_88 = {{1'd0}, _T_939};
  assign _T_940 = _GEN_88 | zComplSigT_C1;
  assign _T_941 = cyc_A4 | cyc_A3_div;
  assign _T_942 = _T_941 | cyc_A1_div;
  assign _T_943 = _T_942 | cyc_B10_sqrt;
  assign _T_944 = _T_943 | cyc_B9_sqrt;
  assign _T_945 = _T_944 | cyc_B7_sqrt;
  assign _T_946 = _T_945 | cyc_B6;
  assign _T_947 = _T_946 | cyc_B5_sqrt;
  assign _T_948 = _T_947 | cyc_B3_sqrt;
  assign _T_949 = _T_948 | cyc_B2_div;
  assign _T_950 = _T_949 | cyc_B1_sqrt;
  assign _T_951 = _T_950 | cyc_C4;
  assign _T_952 = cyc_A3 | cyc_A2_div;
  assign _T_953 = _T_952 | cyc_B9_sqrt;
  assign _T_954 = _T_953 | cyc_B8_sqrt;
  assign _T_955 = _T_954 | cyc_B6;
  assign _T_956 = _T_955 | cyc_B5;
  assign _T_957 = _T_956 | cyc_B4_sqrt;
  assign _T_958 = _T_957 | cyc_B2_sqrt;
  assign _T_959 = _T_958 | cyc_B1_div;
  assign _T_960 = _T_959 | cyc_C6_sqrt;
  assign _T_961 = _T_960 | cyc_C3;
  assign _T_962 = cyc_A2 | cyc_A1_div;
  assign _T_963 = _T_962 | cyc_B8_sqrt;
  assign _T_964 = _T_963 | cyc_B7_sqrt;
  assign _T_965 = _T_964 | cyc_B5;
  assign _T_966 = _T_965 | cyc_B4;
  assign _T_967 = _T_966 | cyc_B3_sqrt;
  assign _T_968 = _T_967 | cyc_B1_sqrt;
  assign _T_969 = _T_968 | cyc_C5;
  assign _T_970 = _T_969 | cyc_C2;
  assign _T_971 = io_latchMulAddA_0 | cyc_B6;
  assign _T_972 = _T_971 | cyc_B2_sqrt;
  assign _T_973 = {_T_970,_T_972};
  assign _T_974 = {_T_951,_T_961};
  assign _T_975 = {_T_974,_T_973};
  assign _GEN_89 = {{47'd0}, sigX1_B};
  assign _T_976 = _GEN_89 << 47;
  assign _T_978 = cyc_B1 ? _T_976 : 105'h0;
  assign _GEN_90 = {{46'd0}, sigX1_B};
  assign _T_979 = _GEN_90 << 46;
  assign _T_981 = cyc_C6_sqrt ? _T_979 : 104'h0;
  assign _GEN_91 = {{1'd0}, _T_981};
  assign _T_982 = _T_978 | _GEN_91;
  assign _T_983 = cyc_C4_sqrt | cyc_C2;
  assign _GEN_92 = {{47'd0}, sigXN_C};
  assign _T_984 = _GEN_92 << 47;
  assign _T_986 = _T_983 ? _T_984 : 105'h0;
  assign _T_987 = _T_982 | _T_986;
  assign _T_989 = E_E_div == 1'h0;
  assign _T_990 = cyc_E3_div & _T_989;
  assign _GEN_93 = {{53'd0}, fractA_0_PC};
  assign _T_991 = _GEN_93 << 53;
  assign _T_993 = _T_990 ? _T_991 : 54'h0;
  assign _GEN_94 = {{51'd0}, _T_993};
  assign _T_994 = _T_987 | _GEN_94;
  assign _T_996 = sigB_PC[0];
  assign _T_998 = {_T_996,1'h0};
  assign _T_999 = sigB_PC[1];
  assign _T_1001 = _T_999 ^ _T_996;
  assign _T_1003 = {_T_1001,_T_996};
  assign _T_1004 = _T_372 ? _T_998 : _T_1003;
  assign _T_1006 = extraT_E == 1'h0;
  assign _T_1008 = {_T_1006,1'h0};
  assign _T_1009 = _T_1004 ^ _T_1008;
  assign _GEN_95 = {{54'd0}, _T_1009};
  assign _T_1010 = _GEN_95 << 54;
  assign _T_1012 = cyc_E3_sqrt ? _T_1010 : 56'h0;
  assign _GEN_96 = {{49'd0}, _T_1012};
  assign _T_1013 = _T_994 | _GEN_96;
  assign ESqrR1_B8_sqrt = io_mulAddResult_3[103:72];
  assign _T_1014 = io_mulAddResult_3[90:45];
  assign _T_1015 = ~ _T_1014;
  assign _T_1017 = cyc_B4 ? _T_1015 : 46'h0;
  assign sqrSigma1_B1 = io_mulAddResult_3[79:47];
  assign _T_1018 = io_mulAddResult_3[104:47];
  assign _T_1019 = io_mulAddResult_3[104];
  assign E_C1_div = _T_1019 == 1'h0;
  assign _T_1022 = E_C1_div == 1'h0;
  assign _T_1023 = cyc_C1_div & _T_1022;
  assign _T_1024 = _T_1023 | cyc_C1_sqrt;
  assign _T_1025 = io_mulAddResult_3[104:51];
  assign _T_1026 = ~ _T_1025;
  assign _T_1028 = _T_1024 ? _T_1026 : 54'h0;
  assign _T_1029 = cyc_C1_div & E_C1_div;
  assign _T_1031 = io_mulAddResult_3[102:50];
  assign _T_1032 = ~ _T_1031;
  assign _T_1033 = {1'h0,_T_1032};
  assign _T_1035 = _T_1029 ? _T_1033 : 54'h0;
  assign _T_1036 = _T_1028 | _T_1035;
  assign _T_1040 = cyc_C1_sqrt ? _T_1026 : 54'h0;
  assign sigT_C1 = ~ zComplSigT_C1;
  assign remT_E2 = io_mulAddResult_3[55:0];
  assign _GEN_43 = cyc_B8_sqrt ? ESqrR1_B8_sqrt : ESqrR1_B_sqrt;
  assign _GEN_44 = cyc_B3 ? sigXNU_B3_CX : sigX1_B;
  assign _GEN_45 = cyc_B1 ? sqrSigma1_B1 : sqrSigma1_C;
  assign _T_1041 = cyc_C6_sqrt | cyc_C5_div;
  assign _T_1042 = _T_1041 | cyc_C3_sqrt;
  assign _GEN_46 = _T_1042 ? sigXNU_B3_CX : sigXN_C;
  assign _T_1043 = sigXNU_B3_CX[56:26];
  assign _GEN_47 = cyc_C5_sqrt ? _T_1043 : u_C_sqrt;
  assign _T_1044 = sigT_C1[53:1];
  assign _T_1045 = sigT_C1[0];
  assign _GEN_48 = cyc_C1 ? E_C1_div : E_E_div;
  assign _GEN_49 = cyc_C1 ? _T_1044 : sigT_E;
  assign _GEN_50 = cyc_C1 ? _T_1045 : extraT_E;
  assign _T_1046 = remT_E2[55];
  assign _T_1047 = remT_E2[53];
  assign _T_1048 = sqrtOp_PC ? _T_1046 : _T_1047;
  assign _T_1049 = remT_E2[53:0];
  assign _T_1051 = _T_1049 == 54'h0;
  assign _T_1054 = remT_E2[55:54];
  assign _T_1056 = _T_1054 == 2'h0;
  assign _T_1057 = _T_390 | _T_1056;
  assign _T_1058 = _T_1051 & _T_1057;
  assign _GEN_51 = cyc_E2 ? _T_1048 : isNegRemT_E;
  assign _GEN_52 = cyc_E2 ? _T_1058 : isZeroRemT_E;
  assign _T_1061 = _T_390 & E_E_div;
  assign _T_1063 = _T_1061 ? exp_PC : 14'h0;
  assign _T_1068 = _T_390 & _T_989;
  assign _T_1070 = _T_1068 ? expP1_PC : 14'h0;
  assign _T_1071 = _T_1063 | _T_1070;
  assign _T_1072 = exp_PC[13:1];
  assign _T_1074 = _T_1072 + 13'h400;
  assign _T_1075 = _T_1074[12:0];
  assign _T_1077 = sqrtOp_PC ? _T_1075 : 13'h0;
  assign _GEN_97 = {{1'd0}, _T_1077};
  assign sExpX_E = _T_1071 | _GEN_97;
  assign posExpX_E = sExpX_E[12:0];
  assign _T_1078 = ~ posExpX_E;
  assign _T_1079 = _T_1078[12];
  assign _T_1080 = _T_1078[11:0];
  assign _T_1081 = _T_1080[11];
  assign _T_1082 = _T_1080[10:0];
  assign _T_1083 = _T_1082[10];
  assign _T_1084 = _T_1082[9:0];
  assign _T_1085 = _T_1084[9];
  assign _T_1086 = _T_1084[8:0];
  assign _T_1088 = _T_1086[8];
  assign _T_1089 = _T_1086[7:0];
  assign _T_1091 = _T_1089[7];
  assign _T_1092 = _T_1089[6:0];
  assign _T_1094 = _T_1092[6];
  assign _T_1095 = _T_1092[5:0];
  assign _T_1098 = $signed(65'sh10000000000000000) >>> _T_1095;
  assign _T_1099 = _T_1098[63:14];
  assign _T_1100 = _T_1099[31:0];
  assign _T_1105 = _T_1100[31:16];
  assign _T_1106 = {{16'd0}, _T_1105};
  assign _T_1107 = _T_1100[15:0];
  assign _GEN_98 = {{16'd0}, _T_1107};
  assign _T_1108 = _GEN_98 << 16;
  assign _T_1110 = _T_1108 & 32'hffff0000;
  assign _T_1111 = _T_1106 | _T_1110;
  assign _T_1115 = _T_1111[31:8];
  assign _GEN_99 = {{8'd0}, _T_1115};
  assign _T_1116 = _GEN_99 & 32'hff00ff;
  assign _T_1117 = _T_1111[23:0];
  assign _GEN_100 = {{8'd0}, _T_1117};
  assign _T_1118 = _GEN_100 << 8;
  assign _T_1120 = _T_1118 & 32'hff00ff00;
  assign _T_1121 = _T_1116 | _T_1120;
  assign _T_1125 = _T_1121[31:4];
  assign _GEN_101 = {{4'd0}, _T_1125};
  assign _T_1126 = _GEN_101 & 32'hf0f0f0f;
  assign _T_1127 = _T_1121[27:0];
  assign _GEN_102 = {{4'd0}, _T_1127};
  assign _T_1128 = _GEN_102 << 4;
  assign _T_1130 = _T_1128 & 32'hf0f0f0f0;
  assign _T_1131 = _T_1126 | _T_1130;
  assign _T_1135 = _T_1131[31:2];
  assign _GEN_103 = {{2'd0}, _T_1135};
  assign _T_1136 = _GEN_103 & 32'h33333333;
  assign _T_1137 = _T_1131[29:0];
  assign _GEN_104 = {{2'd0}, _T_1137};
  assign _T_1138 = _GEN_104 << 2;
  assign _T_1140 = _T_1138 & 32'hcccccccc;
  assign _T_1141 = _T_1136 | _T_1140;
  assign _T_1145 = _T_1141[31:1];
  assign _GEN_105 = {{1'd0}, _T_1145};
  assign _T_1146 = _GEN_105 & 32'h55555555;
  assign _T_1147 = _T_1141[30:0];
  assign _GEN_106 = {{1'd0}, _T_1147};
  assign _T_1148 = _GEN_106 << 1;
  assign _T_1150 = _T_1148 & 32'haaaaaaaa;
  assign _T_1151 = _T_1146 | _T_1150;
  assign _T_1152 = _T_1099[49:32];
  assign _T_1153 = _T_1152[15:0];
  assign _T_1158 = _T_1153[15:8];
  assign _T_1159 = {{8'd0}, _T_1158};
  assign _T_1160 = _T_1153[7:0];
  assign _GEN_107 = {{8'd0}, _T_1160};
  assign _T_1161 = _GEN_107 << 8;
  assign _T_1163 = _T_1161 & 16'hff00;
  assign _T_1164 = _T_1159 | _T_1163;
  assign _T_1168 = _T_1164[15:4];
  assign _GEN_108 = {{4'd0}, _T_1168};
  assign _T_1169 = _GEN_108 & 16'hf0f;
  assign _T_1170 = _T_1164[11:0];
  assign _GEN_109 = {{4'd0}, _T_1170};
  assign _T_1171 = _GEN_109 << 4;
  assign _T_1173 = _T_1171 & 16'hf0f0;
  assign _T_1174 = _T_1169 | _T_1173;
  assign _T_1178 = _T_1174[15:2];
  assign _GEN_110 = {{2'd0}, _T_1178};
  assign _T_1179 = _GEN_110 & 16'h3333;
  assign _T_1180 = _T_1174[13:0];
  assign _GEN_111 = {{2'd0}, _T_1180};
  assign _T_1181 = _GEN_111 << 2;
  assign _T_1183 = _T_1181 & 16'hcccc;
  assign _T_1184 = _T_1179 | _T_1183;
  assign _T_1188 = _T_1184[15:1];
  assign _GEN_112 = {{1'd0}, _T_1188};
  assign _T_1189 = _GEN_112 & 16'h5555;
  assign _T_1190 = _T_1184[14:0];
  assign _GEN_113 = {{1'd0}, _T_1190};
  assign _T_1191 = _GEN_113 << 1;
  assign _T_1193 = _T_1191 & 16'haaaa;
  assign _T_1194 = _T_1189 | _T_1193;
  assign _T_1195 = _T_1152[17:16];
  assign _T_1196 = _T_1195[0];
  assign _T_1197 = _T_1195[1];
  assign _T_1198 = {_T_1196,_T_1197};
  assign _T_1199 = {_T_1194,_T_1198};
  assign _T_1200 = {_T_1151,_T_1199};
  assign _T_1201 = ~ _T_1200;
  assign _T_1202 = _T_1094 ? 50'h0 : _T_1201;
  assign _T_1203 = ~ _T_1202;
  assign _T_1204 = ~ _T_1203;
  assign _T_1205 = _T_1091 ? 50'h0 : _T_1204;
  assign _T_1206 = ~ _T_1205;
  assign _T_1207 = ~ _T_1206;
  assign _T_1208 = _T_1088 ? 50'h0 : _T_1207;
  assign _T_1209 = ~ _T_1208;
  assign _T_1210 = ~ _T_1209;
  assign _T_1211 = _T_1085 ? 50'h0 : _T_1210;
  assign _T_1212 = ~ _T_1211;
  assign _T_1214 = {_T_1212,3'h7};
  assign _T_1225 = _T_1098[2:0];
  assign _T_1226 = _T_1225[1:0];
  assign _T_1227 = _T_1226[0];
  assign _T_1228 = _T_1226[1];
  assign _T_1229 = {_T_1227,_T_1228};
  assign _T_1230 = _T_1225[2];
  assign _T_1231 = {_T_1229,_T_1230};
  assign _T_1233 = _T_1094 ? _T_1231 : 3'h0;
  assign _T_1235 = _T_1091 ? _T_1233 : 3'h0;
  assign _T_1237 = _T_1088 ? _T_1235 : 3'h0;
  assign _T_1239 = _T_1085 ? _T_1237 : 3'h0;
  assign _T_1240 = _T_1083 ? _T_1214 : {{50'd0}, _T_1239};
  assign _T_1242 = _T_1081 ? _T_1240 : 53'h0;
  assign roundMask_E = _T_1079 ? _T_1242 : 53'h0;
  assign _T_1245 = {1'h0,roundMask_E};
  assign _T_1246 = ~ _T_1245;
  assign _T_1248 = {roundMask_E,1'h1};
  assign incrPosMask_E = _T_1246 & _T_1248;
  assign _T_1249 = incrPosMask_E[53:1];
  assign _T_1250 = sigT_E & _T_1249;
  assign hiRoundPosBitT_E = _T_1250 != 53'h0;
  assign _T_1252 = roundMask_E[52:1];
  assign _GEN_114 = {{1'd0}, _T_1252};
  assign _T_1255 = ~ sigT_E;
  assign _T_1257 = _T_1255 & _GEN_114;
  assign all1sHiRoundExtraT_E = _T_1257 == 53'h0;
  assign _T_1259 = roundMask_E[0];
  assign _T_1261 = _T_1259 == 1'h0;
  assign _T_1262 = _T_1261 | hiRoundPosBitT_E;
  assign all1sHiRoundT_E = _T_1262 & all1sHiRoundExtraT_E;
  assign _GEN_116 = {{1'd0}, sigT_E};
  assign _T_1264 = 54'h0 + _GEN_116;
  assign _T_1265 = _T_1264[53:0];
  assign _GEN_117 = {{53'd0}, roundMagUp_PC};
  assign _T_1266 = _T_1265 + _GEN_117;
  assign sigAdjT_E = _T_1266[53:0];
  assign _T_1268 = ~ roundMask_E;
  assign _T_1269 = {1'h1,_T_1268};
  assign sigY0_E = sigAdjT_E & _T_1269;
  assign _T_1272 = sigAdjT_E | _T_1245;
  assign _T_1274 = _T_1272 + 54'h1;
  assign sigY1_E = _T_1274[53:0];
  assign _T_1276 = isNegRemT_E == 1'h0;
  assign _T_1278 = isZeroRemT_E == 1'h0;
  assign _T_1279 = _T_1276 & _T_1278;
  assign trueLtX_E1 = sqrtOp_PC ? _T_1279 : isNegRemT_E;
  assign _T_1282 = trueLtX_E1 == 1'h0;
  assign _T_1283 = _T_1259 & _T_1282;
  assign _T_1284 = _T_1283 & all1sHiRoundExtraT_E;
  assign _T_1285 = _T_1284 & extraT_E;
  assign hiRoundPosBit_E1 = hiRoundPosBitT_E ^ _T_1285;
  assign _T_1290 = _T_1278 | _T_1006;
  assign _T_1292 = all1sHiRoundExtraT_E == 1'h0;
  assign anyRoundExtra_E1 = _T_1290 | _T_1292;
  assign _T_1293 = roundingMode_near_even_PC & hiRoundPosBit_E1;
  assign _T_1295 = anyRoundExtra_E1 == 1'h0;
  assign _T_1296 = _T_1293 & _T_1295;
  assign roundEvenMask_E1 = _T_1296 ? incrPosMask_E : 54'h0;
  assign _T_1298 = roundMagDown_PC & extraT_E;
  assign _T_1301 = _T_1298 & _T_1282;
  assign _T_1302 = _T_1301 & all1sHiRoundT_E;
  assign _T_1305 = extraT_E & _T_1282;
  assign _T_1308 = _T_1305 & _T_1278;
  assign _T_1310 = all1sHiRoundT_E == 1'h0;
  assign _T_1311 = _T_1308 | _T_1310;
  assign _T_1312 = roundMagUp_PC & _T_1311;
  assign _T_1313 = _T_1302 | _T_1312;
  assign _T_1316 = extraT_E | _T_1282;
  assign _T_1320 = _T_1316 & _T_1261;
  assign _T_1321 = hiRoundPosBitT_E | _T_1320;
  assign _T_1325 = _T_1305 & all1sHiRoundExtraT_E;
  assign _T_1326 = _T_1321 | _T_1325;
  assign _T_1327 = roundingMode_near_even_PC & _T_1326;
  assign _T_1328 = _T_1313 | _T_1327;
  assign _T_1329 = _T_1328 ? sigY1_E : sigY0_E;
  assign _T_1330 = ~ roundEvenMask_E1;
  assign sigY_E1 = _T_1329 & _T_1330;
  assign fractY_E1 = sigY_E1[51:0];
  assign inexactY_E1 = hiRoundPosBit_E1 | anyRoundExtra_E1;
  assign _T_1331 = sigY_E1[53];
  assign _T_1333 = _T_1331 == 1'h0;
  assign _T_1335 = _T_1333 ? sExpX_E : 14'h0;
  assign _T_1339 = _T_1331 & _T_390;
  assign _T_1340 = _T_1339 & E_E_div;
  assign _T_1342 = _T_1340 ? expP1_PC : 14'h0;
  assign _T_1343 = _T_1335 | _T_1342;
  assign _T_1350 = _T_1339 & _T_989;
  assign _T_1352 = _T_1350 ? expP2_PC : 14'h0;
  assign _T_1353 = _T_1343 | _T_1352;
  assign _T_1355 = _T_1331 & sqrtOp_PC;
  assign _T_1356 = expP2_PC[13:1];
  assign _T_1358 = _T_1356 + 13'h400;
  assign _T_1359 = _T_1358[12:0];
  assign _T_1361 = _T_1355 ? _T_1359 : 13'h0;
  assign _GEN_118 = {{1'd0}, _T_1361};
  assign sExpY_E1 = _T_1353 | _GEN_118;
  assign expY_E1 = sExpY_E1[11:0];
  assign _T_1362 = sExpY_E1[13];
  assign _T_1364 = _T_1362 == 1'h0;
  assign _T_1366 = sExpY_E1[12:10];
  assign _T_1367 = 3'h3 <= _T_1366;
  assign overflowY_E1 = _T_1364 & _T_1367;
  assign _T_1369 = sExpY_E1[12:0];
  assign _T_1371 = _T_1369 < 13'h3ce;
  assign totalUnderflowY_E1 = _T_1362 | _T_1371;
  assign _T_1373 = posExpX_E <= 13'h401;
  assign _T_1374 = _T_1373 & inexactY_E1;
  assign underflowY_E1 = totalUnderflowY_E1 | _T_1374;
  assign _T_1376 = isNaNB_PC == 1'h0;
  assign _T_1379 = _T_1376 & _T_354;
  assign _T_1380 = _T_1379 & sign_PC;
  assign _T_1381 = isZeroA_PC & isZeroB_PC;
  assign _T_1382 = isInfA_PC & isInfB_PC;
  assign _T_1383 = _T_1381 | _T_1382;
  assign notSigNaN_invalid_PC = sqrtOp_PC ? _T_1380 : _T_1383;
  assign _T_1386 = _T_390 & isSigNaNA_PC;
  assign _T_1387 = _T_1386 | isSigNaNB_PC;
  assign invalid_PC = _T_1387 | notSigNaN_invalid_PC;
  assign _T_1392 = _T_390 & _T_360;
  assign _T_1395 = _T_1392 & _T_365;
  assign infinity_PC = _T_1395 & isZeroB_PC;
  assign overflow_E1 = normalCase_PC & overflowY_E1;
  assign underflow_E1 = normalCase_PC & underflowY_E1;
  assign _T_1396 = overflow_E1 | underflow_E1;
  assign _T_1397 = normalCase_PC & inexactY_E1;
  assign inexact_E1 = _T_1396 | _T_1397;
  assign _T_1398 = isZeroA_PC | isInfB_PC;
  assign _T_1401 = totalUnderflowY_E1 & _T_380;
  assign _T_1402 = _T_1398 | _T_1401;
  assign notSpecial_isZeroOut_E1 = sqrtOp_PC ? isZeroB_PC : _T_1402;
  assign _T_1403 = normalCase_PC & totalUnderflowY_E1;
  assign pegMinFiniteMagOut_E1 = _T_1403 & roundMagUp_PC;
  assign _T_1405 = overflowY_roundMagUp_PC == 1'h0;
  assign pegMaxFiniteMagOut_E1 = overflow_E1 & _T_1405;
  assign _T_1406 = isInfA_PC | isZeroB_PC;
  assign _T_1407 = overflow_E1 & overflowY_roundMagUp_PC;
  assign _T_1408 = _T_1406 | _T_1407;
  assign notNaN_isInfOut_E1 = sqrtOp_PC ? isInfB_PC : _T_1408;
  assign _T_1411 = _T_390 & isNaNA_PC;
  assign _T_1412 = _T_1411 | isNaNB_PC;
  assign isNaNOut_PC = _T_1412 | notSigNaN_invalid_PC;
  assign _T_1414 = isNaNOut_PC == 1'h0;
  assign _T_1415 = isZeroB_PC & sign_PC;
  assign _T_1416 = sqrtOp_PC ? _T_1415 : sign_PC;
  assign signOut_PC = _T_1414 & _T_1416;
  assign _T_1420 = notSpecial_isZeroOut_E1 ? 12'he00 : 12'h0;
  assign _T_1421 = ~ _T_1420;
  assign _T_1422 = expY_E1 & _T_1421;
  assign _T_1426 = pegMinFiniteMagOut_E1 ? 12'hc31 : 12'h0;
  assign _T_1427 = ~ _T_1426;
  assign _T_1428 = _T_1422 & _T_1427;
  assign _T_1432 = pegMaxFiniteMagOut_E1 ? 12'h400 : 12'h0;
  assign _T_1433 = ~ _T_1432;
  assign _T_1434 = _T_1428 & _T_1433;
  assign _T_1438 = notNaN_isInfOut_E1 ? 12'h200 : 12'h0;
  assign _T_1439 = ~ _T_1438;
  assign _T_1440 = _T_1434 & _T_1439;
  assign _T_1443 = pegMinFiniteMagOut_E1 ? 12'h3ce : 12'h0;
  assign _T_1444 = _T_1440 | _T_1443;
  assign _T_1447 = pegMaxFiniteMagOut_E1 ? 12'hbff : 12'h0;
  assign _T_1448 = _T_1444 | _T_1447;
  assign _T_1451 = notNaN_isInfOut_E1 ? 12'hc00 : 12'h0;
  assign _T_1452 = _T_1448 | _T_1451;
  assign _T_1455 = isNaNOut_PC ? 12'he00 : 12'h0;
  assign expOut_E1 = _T_1452 | _T_1455;
  assign _T_1456 = notSpecial_isZeroOut_E1 | totalUnderflowY_E1;
  assign _T_1457 = _T_1456 | isNaNOut_PC;
  assign _T_1461 = isNaNOut_PC ? 52'h8000000000000 : 52'h0;
  assign _T_1462 = _T_1457 ? _T_1461 : fractY_E1;
  assign _T_1466 = pegMaxFiniteMagOut_E1 ? 52'hfffffffffffff : 52'h0;
  assign fractOut_E1 = _T_1462 | _T_1466;
  assign _T_1467 = {signOut_PC,expOut_E1};
  assign _T_1468 = {_T_1467,fractOut_E1};
  assign _T_1469 = {underflow_E1,inexact_E1};
  assign _T_1470 = {invalid_PC,infinity_PC};
  assign _T_1471 = {_T_1470,overflow_E1};
  assign _T_1472 = {_T_1471,_T_1469};
`ifdef RANDOMIZE
  integer initvar;
  initial begin
    `ifndef verilator
      #0.002 begin end
    `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_115 = {1{$random}};
  valid_PA = _GEN_115[0:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_119 = {1{$random}};
  sqrtOp_PA = _GEN_119[0:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_120 = {1{$random}};
  sign_PA = _GEN_120[0:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_121 = {1{$random}};
  specialCodeB_PA = _GEN_121[2:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_122 = {1{$random}};
  fractB_51_PA = _GEN_122[0:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_123 = {1{$random}};
  roundingMode_PA = _GEN_123[1:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_124 = {1{$random}};
  specialCodeA_PA = _GEN_124[2:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_125 = {1{$random}};
  fractA_51_PA = _GEN_125[0:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_126 = {1{$random}};
  exp_PA = _GEN_126[13:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_127 = {2{$random}};
  fractB_other_PA = _GEN_127[50:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_128 = {2{$random}};
  fractA_other_PA = _GEN_128[50:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_129 = {1{$random}};
  valid_PB = _GEN_129[0:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_130 = {1{$random}};
  sqrtOp_PB = _GEN_130[0:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_131 = {1{$random}};
  sign_PB = _GEN_131[0:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_132 = {1{$random}};
  specialCodeA_PB = _GEN_132[2:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_133 = {1{$random}};
  fractA_51_PB = _GEN_133[0:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_134 = {1{$random}};
  specialCodeB_PB = _GEN_134[2:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_135 = {1{$random}};
  fractB_51_PB = _GEN_135[0:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_136 = {1{$random}};
  roundingMode_PB = _GEN_136[1:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_137 = {1{$random}};
  exp_PB = _GEN_137[13:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_138 = {1{$random}};
  fractA_0_PB = _GEN_138[0:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_139 = {2{$random}};
  fractB_other_PB = _GEN_139[50:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_140 = {1{$random}};
  valid_PC = _GEN_140[0:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_141 = {1{$random}};
  sqrtOp_PC = _GEN_141[0:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_142 = {1{$random}};
  sign_PC = _GEN_142[0:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_143 = {1{$random}};
  specialCodeA_PC = _GEN_143[2:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_144 = {1{$random}};
  fractA_51_PC = _GEN_144[0:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_145 = {1{$random}};
  specialCodeB_PC = _GEN_145[2:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_146 = {1{$random}};
  fractB_51_PC = _GEN_146[0:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_147 = {1{$random}};
  roundingMode_PC = _GEN_147[1:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_148 = {1{$random}};
  exp_PC = _GEN_148[13:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_149 = {1{$random}};
  fractA_0_PC = _GEN_149[0:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_150 = {2{$random}};
  fractB_other_PC = _GEN_150[50:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_151 = {1{$random}};
  cycleNum_A = _GEN_151[2:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_152 = {1{$random}};
  cycleNum_B = _GEN_152[3:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_153 = {1{$random}};
  cycleNum_C = _GEN_153[2:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_154 = {1{$random}};
  cycleNum_E = _GEN_154[2:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_155 = {1{$random}};
  fractR0_A = _GEN_155[8:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_156 = {1{$random}};
  hiSqrR0_A_sqrt = _GEN_156[9:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_157 = {1{$random}};
  partNegSigma0_A = _GEN_157[20:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_158 = {1{$random}};
  nextMulAdd9A_A = _GEN_158[8:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_159 = {1{$random}};
  nextMulAdd9B_A = _GEN_159[8:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_160 = {1{$random}};
  ER1_B_sqrt = _GEN_160[16:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_161 = {1{$random}};
  ESqrR1_B_sqrt = _GEN_161[31:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_162 = {2{$random}};
  sigX1_B = _GEN_162[57:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_163 = {2{$random}};
  sqrSigma1_C = _GEN_163[32:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_164 = {2{$random}};
  sigXN_C = _GEN_164[57:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_165 = {1{$random}};
  u_C_sqrt = _GEN_165[30:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_166 = {1{$random}};
  E_E_div = _GEN_166[0:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_167 = {2{$random}};
  sigT_E = _GEN_167[52:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_168 = {1{$random}};
  extraT_E = _GEN_168[0:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_169 = {1{$random}};
  isNegRemT_E = _GEN_169[0:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_170 = {1{$random}};
  isZeroRemT_E = _GEN_170[0:0];
  `endif
  end
`endif
  always @(posedge clock) begin
    if (reset) begin
      valid_PA <= 1'h0;
    end else begin
      if (_T_227) begin
        valid_PA <= entering_PA;
      end
    end
    if (entering_PA) begin
      sqrtOp_PA <= io_sqrtOp;
    end
    if (entering_PA) begin
      if (io_sqrtOp) begin
        sign_PA <= signB_S;
      end else begin
        sign_PA <= _T_184;
      end
    end
    if (entering_PA) begin
      specialCodeB_PA <= specialCodeB_S;
    end
    if (entering_PA) begin
      fractB_51_PA <= _T_228;
    end
    if (entering_PA) begin
      roundingMode_PA <= io_roundingMode;
    end
    if (_T_231) begin
      specialCodeA_PA <= specialCodeA_S;
    end
    if (_T_231) begin
      fractA_51_PA <= _T_232;
    end
    if (entering_PA_normalCase) begin
      if (io_sqrtOp) begin
        exp_PA <= {{2'd0}, expB_S};
      end else begin
        exp_PA <= _T_242;
      end
    end
    if (entering_PA_normalCase) begin
      fractB_other_PA <= _T_244;
    end
    if (cyc_A4_div) begin
      fractA_other_PA <= _T_245;
    end
    if (reset) begin
      valid_PB <= 1'h0;
    end else begin
      if (_T_280) begin
        valid_PB <= entering_PB;
      end
    end
    if (entering_PB) begin
      if (valid_PA) begin
        sqrtOp_PB <= sqrtOp_PA;
      end else begin
        sqrtOp_PB <= io_sqrtOp;
      end
    end
    if (entering_PB) begin
      if (valid_PA) begin
        sign_PB <= sign_PA;
      end else begin
        if (io_sqrtOp) begin
          sign_PB <= signB_S;
        end else begin
          sign_PB <= _T_184;
        end
      end
    end
    if (entering_PB) begin
      if (valid_PA) begin
        specialCodeA_PB <= specialCodeA_PA;
      end else begin
        specialCodeA_PB <= specialCodeA_S;
      end
    end
    if (entering_PB) begin
      if (valid_PA) begin
        fractA_51_PB <= fractA_51_PA;
      end else begin
        fractA_51_PB <= _T_232;
      end
    end
    if (entering_PB) begin
      if (valid_PA) begin
        specialCodeB_PB <= specialCodeB_PA;
      end else begin
        specialCodeB_PB <= specialCodeB_S;
      end
    end
    if (entering_PB) begin
      if (valid_PA) begin
        fractB_51_PB <= fractB_51_PA;
      end else begin
        fractB_51_PB <= _T_228;
      end
    end
    if (entering_PB) begin
      if (valid_PA) begin
        roundingMode_PB <= roundingMode_PA;
      end else begin
        roundingMode_PB <= io_roundingMode;
      end
    end
    if (entering_PB_normalCase) begin
      exp_PB <= exp_PA;
    end
    if (entering_PB_normalCase) begin
      fractA_0_PB <= _T_290;
    end
    if (entering_PB_normalCase) begin
      fractB_other_PB <= fractB_other_PA;
    end
    if (reset) begin
      valid_PC <= 1'h0;
    end else begin
      if (_T_321) begin
        valid_PC <= entering_PC;
      end
    end
    if (entering_PC) begin
      if (valid_PB) begin
        sqrtOp_PC <= sqrtOp_PB;
      end else begin
        sqrtOp_PC <= io_sqrtOp;
      end
    end
    if (entering_PC) begin
      if (valid_PB) begin
        sign_PC <= sign_PB;
      end else begin
        if (io_sqrtOp) begin
          sign_PC <= signB_S;
        end else begin
          sign_PC <= _T_184;
        end
      end
    end
    if (entering_PC) begin
      if (valid_PB) begin
        specialCodeA_PC <= specialCodeA_PB;
      end else begin
        specialCodeA_PC <= specialCodeA_S;
      end
    end
    if (entering_PC) begin
      if (valid_PB) begin
        fractA_51_PC <= fractA_51_PB;
      end else begin
        fractA_51_PC <= _T_232;
      end
    end
    if (entering_PC) begin
      if (valid_PB) begin
        specialCodeB_PC <= specialCodeB_PB;
      end else begin
        specialCodeB_PC <= specialCodeB_S;
      end
    end
    if (entering_PC) begin
      if (valid_PB) begin
        fractB_51_PC <= fractB_51_PB;
      end else begin
        fractB_51_PC <= _T_228;
      end
    end
    if (entering_PC) begin
      if (valid_PB) begin
        roundingMode_PC <= roundingMode_PB;
      end else begin
        roundingMode_PC <= io_roundingMode;
      end
    end
    if (entering_PC_normalCase) begin
      exp_PC <= exp_PB;
    end
    if (entering_PC_normalCase) begin
      fractA_0_PC <= fractA_0_PB;
    end
    if (entering_PC_normalCase) begin
      fractB_other_PC <= fractB_other_PB;
    end
    if (reset) begin
      cycleNum_A <= 3'h0;
    end else begin
      if (_T_395) begin
        cycleNum_A <= _T_410;
      end
    end
    if (reset) begin
      cycleNum_B <= 4'h0;
    end else begin
      if (_T_425) begin
        if (cyc_A1) begin
          if (sqrtOp_PA) begin
            cycleNum_B <= 4'ha;
          end else begin
            cycleNum_B <= 4'h6;
          end
        end else begin
          cycleNum_B <= _T_431;
        end
      end
    end
    if (reset) begin
      cycleNum_C <= 3'h0;
    end else begin
      if (_T_485) begin
        if (cyc_B1) begin
          if (sqrtOp_PB) begin
            cycleNum_C <= 3'h6;
          end else begin
            cycleNum_C <= 3'h5;
          end
        end else begin
          cycleNum_C <= _T_491;
        end
      end
    end
    if (reset) begin
      cycleNum_E <= 3'h0;
    end else begin
      if (_T_516) begin
        if (cyc_C1) begin
          cycleNum_E <= 3'h4;
        end else begin
          cycleNum_E <= _T_520;
        end
      end
    end
    if (_T_828) begin
      fractR0_A <= _T_829;
    end
    hiSqrR0_A_sqrt <= _GEN_38[9:0];
    if (_T_831) begin
      partNegSigma0_A <= _T_834;
    end
    nextMulAdd9A_A <= _GEN_40[8:0];
    if (_T_860) begin
      nextMulAdd9B_A <= _T_877;
    end
    if (cyc_A1_sqrt) begin
      if (_T_684) begin
        ER1_B_sqrt <= _T_827;
      end else begin
        ER1_B_sqrt <= {{1'd0}, r1_A1};
      end
    end
    if (cyc_B8_sqrt) begin
      ESqrR1_B_sqrt <= ESqrR1_B8_sqrt;
    end
    if (cyc_B3) begin
      sigX1_B <= sigXNU_B3_CX;
    end
    if (cyc_B1) begin
      sqrSigma1_C <= sqrSigma1_B1;
    end
    if (_T_1042) begin
      sigXN_C <= sigXNU_B3_CX;
    end
    if (cyc_C5_sqrt) begin
      u_C_sqrt <= _T_1043;
    end
    if (cyc_C1) begin
      E_E_div <= E_C1_div;
    end
    if (cyc_C1) begin
      sigT_E <= _T_1044;
    end
    if (cyc_C1) begin
      extraT_E <= _T_1045;
    end
    if (cyc_E2) begin
      if (sqrtOp_PC) begin
        isNegRemT_E <= _T_1046;
      end else begin
        isNegRemT_E <= _T_1047;
      end
    end
    if (cyc_E2) begin
      isZeroRemT_E <= _T_1058;
    end
  end
endmodule