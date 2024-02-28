module TLB(
  input   clock,
  input   reset,
  output  io_req_ready,
  input   io_req_valid,
  input  [27:0] io_req_bits_vpn,
  input   io_req_bits_passthrough,
  input   io_req_bits_instruction,
  input   io_req_bits_store,
  output  io_resp_miss,
  output [19:0] io_resp_ppn,
  output  io_resp_xcpt_ld,
  output  io_resp_xcpt_st,
  output  io_resp_xcpt_if,
  output  io_resp_cacheable,
  input   io_ptw_req_ready,
  output  io_ptw_req_valid,
  output [1:0] io_ptw_req_bits_prv,
  output  io_ptw_req_bits_pum,
  output  io_ptw_req_bits_mxr,
  output [26:0] io_ptw_req_bits_addr,
  output  io_ptw_req_bits_store,
  output  io_ptw_req_bits_fetch,
  input   io_ptw_resp_valid,
  input  [15:0] io_ptw_resp_bits_pte_reserved_for_hardware,
  input  [37:0] io_ptw_resp_bits_pte_ppn,
  input  [1:0] io_ptw_resp_bits_pte_reserved_for_software,
  input   io_ptw_resp_bits_pte_d,
  input   io_ptw_resp_bits_pte_a,
  input   io_ptw_resp_bits_pte_g,
  input   io_ptw_resp_bits_pte_u,
  input   io_ptw_resp_bits_pte_x,
  input   io_ptw_resp_bits_pte_w,
  input   io_ptw_resp_bits_pte_r,
  input   io_ptw_resp_bits_pte_v,
  input  [6:0] io_ptw_ptbr_asid,
  input  [37:0] io_ptw_ptbr_ppn,
  input   io_ptw_invalidate,
  input   io_ptw_status_debug,
  input  [31:0] io_ptw_status_isa,
  input  [1:0] io_ptw_status_prv,
  input   io_ptw_status_sd,
  input  [30:0] io_ptw_status_zero3,
  input   io_ptw_status_sd_rv32,
  input  [1:0] io_ptw_status_zero2,
  input  [4:0] io_ptw_status_vm,
  input  [3:0] io_ptw_status_zero1,
  input   io_ptw_status_mxr,
  input   io_ptw_status_pum,
  input   io_ptw_status_mprv,
  input  [1:0] io_ptw_status_xs,
  input  [1:0] io_ptw_status_fs,
  input  [1:0] io_ptw_status_mpp,
  input  [1:0] io_ptw_status_hpp,
  input   io_ptw_status_spp,
  input   io_ptw_status_mpie,
  input   io_ptw_status_hpie,
  input   io_ptw_status_spie,
  input   io_ptw_status_upie,
  input   io_ptw_status_mie,
  input   io_ptw_status_hie,
  input   io_ptw_status_sie,
  input   io_ptw_status_uie
);
  reg [7:0] valid;
  reg [31:0] _GEN_61;
  reg [19:0] ppns_0;
  reg [31:0] _GEN_63;
  reg [19:0] ppns_1;
  reg [31:0] _GEN_64;
  reg [19:0] ppns_2;
  reg [31:0] _GEN_65;
  reg [19:0] ppns_3;
  reg [31:0] _GEN_66;
  reg [19:0] ppns_4;
  reg [31:0] _GEN_67;
  reg [19:0] ppns_5;
  reg [31:0] _GEN_68;
  reg [19:0] ppns_6;
  reg [31:0] _GEN_69;
  reg [19:0] ppns_7;
  reg [31:0] _GEN_70;
  reg [33:0] tags_0;
  reg [63:0] _GEN_71;
  reg [33:0] tags_1;
  reg [63:0] _GEN_72;
  reg [33:0] tags_2;
  reg [63:0] _GEN_73;
  reg [33:0] tags_3;
  reg [63:0] _GEN_74;
  reg [33:0] tags_4;
  reg [63:0] _GEN_75;
  reg [33:0] tags_5;
  reg [63:0] _GEN_76;
  reg [33:0] tags_6;
  reg [63:0] _GEN_77;
  reg [33:0] tags_7;
  reg [63:0] _GEN_78;
  reg [1:0] state;
  reg [31:0] _GEN_79;
  reg [33:0] r_refill_tag;
  reg [63:0] _GEN_80;
  reg [2:0] r_refill_waddr;
  reg [31:0] _GEN_81;
  reg [27:0] r_req_vpn;
  reg [31:0] _GEN_82;
  reg  r_req_passthrough;
  reg [31:0] _GEN_83;
  reg  r_req_instruction;
  reg [31:0] _GEN_84;
  reg  r_req_store;
  reg [31:0] _GEN_85;
  wire  _T_230;
  wire  do_mprv;
  wire [1:0] priv;
  wire  priv_s;
  wire  _T_233;
  wire  _T_235;
  wire  priv_uses_vm;
  wire [19:0] passthrough_ppn;
  wire [19:0] refill_ppn;
  wire [19:0] mpu_ppn;
  wire [31:0] _GEN_57;
  wire [31:0] mpu_physaddr;
  wire [31:0] _T_238;
  wire [32:0] _T_239;
  wire [32:0] _T_241;
  wire [32:0] _T_242;
  wire  _T_244;
  wire [31:0] _T_246;
  wire [32:0] _T_247;
  wire [32:0] _T_249;
  wire [32:0] _T_250;
  wire  _T_252;
  wire [32:0] _T_255;
  wire [32:0] _T_257;
  wire [32:0] _T_258;
  wire  _T_260;
  wire [31:0] _T_262;
  wire [32:0] _T_263;
  wire [32:0] _T_265;
  wire [32:0] _T_266;
  wire  _T_268;
  wire [31:0] _T_270;
  wire [32:0] _T_271;
  wire [32:0] _T_273;
  wire [32:0] _T_274;
  wire  _T_276;
  wire [31:0] _T_278;
  wire [32:0] _T_279;
  wire [32:0] _T_281;
  wire [32:0] _T_282;
  wire  _T_284;
  wire [31:0] _T_286;
  wire [32:0] _T_287;
  wire [32:0] _T_289;
  wire [32:0] _T_290;
  wire  _T_292;
  wire  _T_303_0;
  wire  _T_303_1;
  wire  _T_303_2;
  wire  _T_303_3;
  wire  _T_303_4;
  wire  _T_303_5;
  wire  _T_303_6;
  wire  _T_313;
  wire  _T_314;
  wire  _T_315;
  wire  _T_316;
  wire  _T_317;
  wire  legal_address;
  wire [32:0] _T_322;
  wire [32:0] _T_323;
  wire  _T_325;
  wire [31:0] _T_327;
  wire [32:0] _T_328;
  wire [32:0] _T_330;
  wire [32:0] _T_331;
  wire  _T_333;
  wire [32:0] _T_338;
  wire [32:0] _T_339;
  wire  _T_341;
  wire [32:0] _T_346;
  wire [32:0] _T_347;
  wire  _T_349;
  wire [32:0] _T_354;
  wire [32:0] _T_355;
  wire  _T_357;
  wire [32:0] _T_362;
  wire [32:0] _T_363;
  wire  _T_365;
  wire [32:0] _T_370;
  wire [32:0] _T_371;
  wire  _T_373;
  wire  _T_384_0;
  wire  _T_384_1;
  wire  _T_384_2;
  wire  _T_384_3;
  wire  _T_384_4;
  wire  _T_384_5;
  wire  _T_384_6;
  wire  _T_423;
  wire  _T_424;
  wire  _T_425;
  wire  _T_426;
  wire  _T_427;
  wire  _T_428;
  wire  _T_429;
  wire  prot_r;
  wire  _T_496_0;
  wire  _T_496_1;
  wire  _T_496_2;
  wire  _T_496_3;
  wire  _T_496_4;
  wire  _T_496_5;
  wire  _T_496_6;
  wire  _T_535;
  wire  _T_536;
  wire  _T_537;
  wire  _T_538;
  wire  _T_539;
  wire  _T_541;
  wire  prot_w;
  wire  _T_608_0;
  wire  _T_608_1;
  wire  _T_608_2;
  wire  _T_608_3;
  wire  _T_608_4;
  wire  _T_608_5;
  wire  _T_608_6;
  wire  _T_648;
  wire  _T_649;
  wire  _T_650;
  wire  _T_652;
  wire  _T_653;
  wire  prot_x;
  wire  _T_720_0;
  wire  _T_720_1;
  wire  _T_720_2;
  wire  _T_720_3;
  wire  _T_720_4;
  wire  _T_720_5;
  wire  _T_720_6;
  wire  _T_762;
  wire  _T_765;
  wire  cacheable;
  wire [26:0] _T_766;
  wire [33:0] lookup_tag;
  wire  _T_768;
  wire  _T_770;
  wire  _T_772;
  wire  vm_enabled;
  wire  _T_773;
  wire  _T_774;
  wire  _T_775;
  wire  hitsVec_0;
  wire  _T_776;
  wire  _T_777;
  wire  _T_778;
  wire  hitsVec_1;
  wire  _T_779;
  wire  _T_780;
  wire  _T_781;
  wire  hitsVec_2;
  wire  _T_782;
  wire  _T_783;
  wire  _T_784;
  wire  hitsVec_3;
  wire  _T_785;
  wire  _T_786;
  wire  _T_787;
  wire  hitsVec_4;
  wire  _T_788;
  wire  _T_789;
  wire  _T_790;
  wire  hitsVec_5;
  wire  _T_791;
  wire  _T_792;
  wire  _T_793;
  wire  hitsVec_6;
  wire  _T_794;
  wire  _T_795;
  wire  _T_796;
  wire  hitsVec_7;
  wire  hitsVec_8;
  wire [1:0] _T_798;
  wire [1:0] _T_799;
  wire [3:0] _T_800;
  wire [1:0] _T_801;
  wire [1:0] _T_802;
  wire [2:0] _T_803;
  wire [4:0] _T_804;
  wire [8:0] hits;
  reg [15:0] pte_array_reserved_for_hardware;
  reg [31:0] _GEN_86;
  reg [37:0] pte_array_ppn;
  reg [63:0] _GEN_87;
  reg [1:0] pte_array_reserved_for_software;
  reg [31:0] _GEN_88;
  reg  pte_array_d;
  reg [31:0] _GEN_89;
  reg  pte_array_a;
  reg [31:0] _GEN_90;
  reg  pte_array_g;
  reg [31:0] _GEN_91;
  reg  pte_array_u;
  reg [31:0] _GEN_92;
  reg  pte_array_x;
  reg [31:0] _GEN_93;
  reg  pte_array_w;
  reg [31:0] _GEN_94;
  reg  pte_array_r;
  reg [31:0] _GEN_95;
  reg  pte_array_v;
  reg [31:0] _GEN_96;
  reg [7:0] u_array;
  reg [31:0] _GEN_97;
  reg [7:0] sw_array;
  reg [31:0] _GEN_98;
  reg [7:0] sx_array;
  reg [31:0] _GEN_99;
  reg [7:0] sr_array;
  reg [31:0] _GEN_100;
  reg [7:0] xr_array;
  reg [31:0] _GEN_101;
  reg [7:0] cash_array;
  reg [31:0] _GEN_102;
  reg [7:0] dirty_array;
  reg [31:0] _GEN_103;
  wire [19:0] _GEN_0;
  wire [19:0] _GEN_2;
  wire [19:0] _GEN_3;
  wire [19:0] _GEN_4;
  wire [19:0] _GEN_5;
  wire [19:0] _GEN_6;
  wire [19:0] _GEN_7;
  wire [19:0] _GEN_8;
  wire [19:0] _GEN_9;
  wire [33:0] _GEN_1;
  wire [33:0] _GEN_10;
  wire [33:0] _GEN_11;
  wire [33:0] _GEN_12;
  wire [33:0] _GEN_13;
  wire [33:0] _GEN_14;
  wire [33:0] _GEN_15;
  wire [33:0] _GEN_16;
  wire [33:0] _GEN_17;
  wire [7:0] _T_836;
  wire [7:0] _T_837;
  wire [7:0] _T_838;
  wire [7:0] _T_839;
  wire [7:0] _T_840;
  wire [7:0] _T_841;
  wire  _T_843;
  wire  _T_844;
  wire  _T_845;
  wire  _T_846;
  wire  _T_847;
  wire  _T_848;
  wire [7:0] _T_849;
  wire [7:0] _T_851;
  wire [7:0] _T_852;
  wire  _T_858;
  wire  _T_859;
  wire [7:0] _T_860;
  wire [7:0] _T_862;
  wire [7:0] _T_863;
  wire  _T_869;
  wire  _T_870;
  wire [7:0] _T_871;
  wire [7:0] _T_873;
  wire [7:0] _T_874;
  wire  _T_881;
  wire [7:0] _T_882;
  wire [7:0] _T_884;
  wire [7:0] _T_885;
  wire [7:0] _T_886;
  wire [7:0] _T_888;
  wire [7:0] _T_889;
  wire [7:0] _T_890;
  wire [7:0] _T_892;
  wire [7:0] _T_893;
  wire [19:0] _GEN_18;
  wire [19:0] _GEN_19;
  wire [19:0] _GEN_20;
  wire [19:0] _GEN_21;
  wire [19:0] _GEN_22;
  wire [19:0] _GEN_23;
  wire [19:0] _GEN_24;
  wire [19:0] _GEN_25;
  wire [33:0] _GEN_26;
  wire [33:0] _GEN_27;
  wire [33:0] _GEN_28;
  wire [33:0] _GEN_29;
  wire [33:0] _GEN_30;
  wire [33:0] _GEN_31;
  wire [33:0] _GEN_32;
  wire [33:0] _GEN_33;
  wire [7:0] _GEN_34;
  wire [7:0] _GEN_35;
  wire [7:0] _GEN_36;
  wire [7:0] _GEN_37;
  wire [7:0] _GEN_38;
  wire [7:0] _GEN_39;
  wire [7:0] _GEN_40;
  wire [7:0] _GEN_41;
  reg [7:0] _T_895;
  reg [31:0] _GEN_104;
  wire [7:0] _T_896;
  wire  _T_898;
  wire  _T_900;
  wire  _T_902;
  wire  _T_903;
  wire  _T_904;
  wire  _T_905;
  wire  _T_906;
  wire  _T_907;
  wire  _T_908;
  wire [2:0] _T_918;
  wire [2:0] _T_919;
  wire [2:0] _T_920;
  wire [2:0] _T_921;
  wire [2:0] _T_922;
  wire [2:0] _T_923;
  wire [2:0] _T_924;
  wire [7:0] _T_926;
  wire  _T_927;
  wire [1:0] _T_928;
  wire [7:0] _T_929;
  wire  _T_930;
  wire [2:0] _T_931;
  wire [7:0] _T_932;
  wire  _T_933;
  wire [3:0] _T_934;
  wire [2:0] _T_935;
  wire [2:0] repl_waddr;
  wire [7:0] _T_937;
  wire [7:0] _T_938;
  wire [7:0] priv_ok;
  wire [7:0] _T_939;
  wire [8:0] w_array;
  wire [7:0] _T_940;
  wire [8:0] x_array;
  wire [7:0] _T_942;
  wire [7:0] _T_943;
  wire [7:0] _T_944;
  wire [8:0] r_array;
  wire [8:0] c_array;
  wire  _T_945;
  wire  _T_946;
  wire  bad_va;
  wire [7:0] _T_947;
  wire [8:0] _T_949;
  wire [8:0] _T_950;
  wire [8:0] _GEN_58;
  wire [8:0] _T_951;
  wire [8:0] _GEN_59;
  wire [8:0] tlb_hits;
  wire  tlb_hit;
  wire  _T_954;
  wire  _T_955;
  wire  _T_957;
  wire  tlb_miss;
  wire  _T_959;
  wire  _T_960;
  wire [3:0] _T_962;
  wire [3:0] _T_963;
  wire  _T_965;
  wire [3:0] _T_966;
  wire [1:0] _T_967;
  wire [1:0] _T_968;
  wire  _T_970;
  wire [1:0] _T_971;
  wire  _T_972;
  wire [1:0] _T_973;
  wire [2:0] _T_974;
  wire  _T_976;
  wire  _T_978;
  wire [1:0] _T_980;
  wire [7:0] _GEN_60;
  wire [7:0] _T_981;
  wire [7:0] _T_982;
  wire [7:0] _T_983;
  wire [7:0] _T_984;
  wire [7:0] _T_985;
  wire [1:0] _T_986;
  wire  _T_987;
  wire  _T_989;
  wire [3:0] _T_991;
  wire [7:0] _GEN_62;
  wire [7:0] _T_992;
  wire [7:0] _T_993;
  wire [7:0] _T_994;
  wire [7:0] _T_995;
  wire [7:0] _T_996;
  wire [2:0] _T_997;
  wire  _T_998;
  wire  _T_1000;
  wire [7:0] _T_1002;
  wire [7:0] _T_1003;
  wire [7:0] _T_1004;
  wire [7:0] _T_1005;
  wire [7:0] _T_1006;
  wire [7:0] _T_1007;
  wire [7:0] _GEN_42;
  wire  _T_1009;
  wire [8:0] _T_1010;
  wire [8:0] _T_1011;
  wire  _T_1013;
  wire  _T_1014;
  wire [8:0] _T_1015;
  wire [8:0] _T_1016;
  wire  _T_1018;
  wire  _T_1019;
  wire [8:0] _T_1020;
  wire [8:0] _T_1021;
  wire  _T_1023;
  wire  _T_1024;
  wire [8:0] _T_1025;
  wire  _T_1027;
  wire  _T_1028;
  wire [19:0] _T_1030;
  wire [19:0] _T_1032;
  wire [19:0] _T_1034;
  wire [19:0] _T_1036;
  wire [19:0] _T_1038;
  wire [19:0] _T_1040;
  wire [19:0] _T_1042;
  wire [19:0] _T_1044;
  wire [19:0] _T_1046;
  wire [19:0] _T_1048;
  wire [19:0] _T_1049;
  wire [19:0] _T_1050;
  wire [19:0] _T_1051;
  wire [19:0] _T_1052;
  wire [19:0] _T_1053;
  wire [19:0] _T_1054;
  wire [19:0] _T_1055;
  wire [19:0] _T_1056;
  wire  _T_1057;
  wire  _T_1058;
  wire  _T_1059;
  wire [1:0] _GEN_43;
  wire [33:0] _GEN_44;
  wire [2:0] _GEN_45;
  wire [27:0] _GEN_46;
  wire  _GEN_47;
  wire  _GEN_48;
  wire  _GEN_49;
  wire [1:0] _GEN_50;
  wire [1:0] _GEN_51;
  wire [1:0] _GEN_52;
  wire [1:0] _GEN_53;
  wire  _T_1061;
  wire  _T_1062;
  wire [1:0] _GEN_54;
  wire [1:0] _GEN_55;
  wire [7:0] _GEN_56;
  assign io_req_ready = _T_1009;
  assign io_resp_miss = _T_1028;
  assign io_resp_ppn = _T_1056;
  assign io_resp_xcpt_ld = _T_1014;
  assign io_resp_xcpt_st = _T_1019;
  assign io_resp_xcpt_if = _T_1024;
  assign io_resp_cacheable = _T_1027;
  assign io_ptw_req_valid = _T_1057;
  assign io_ptw_req_bits_prv = io_ptw_status_prv;
  assign io_ptw_req_bits_pum = io_ptw_status_pum;
  assign io_ptw_req_bits_mxr = io_ptw_status_mxr;
  assign io_ptw_req_bits_addr = r_refill_tag[26:0];
  assign io_ptw_req_bits_store = r_req_store;
  assign io_ptw_req_bits_fetch = r_req_instruction;
  assign _T_230 = io_req_bits_instruction == 1'h0;
  assign do_mprv = io_ptw_status_mprv & _T_230;
  assign priv = do_mprv ? io_ptw_status_mpp : io_ptw_status_prv;
  assign priv_s = priv == 2'h1;
  assign _T_233 = priv <= 2'h1;
  assign _T_235 = io_ptw_status_debug == 1'h0;
  assign priv_uses_vm = _T_233 & _T_235;
  assign passthrough_ppn = io_req_bits_vpn[19:0];
  assign refill_ppn = io_ptw_resp_bits_pte_ppn[19:0];
  assign mpu_ppn = io_ptw_resp_valid ? refill_ppn : passthrough_ppn;
  assign _GEN_57 = {{12'd0}, mpu_ppn};
  assign mpu_physaddr = _GEN_57 << 12;
  assign _T_238 = mpu_physaddr ^ 32'hc000000;
  assign _T_239 = {1'b0,$signed(_T_238)};
  assign _T_241 = $signed(_T_239) & $signed(33'sh1fc000000);
  assign _T_242 = $signed(_T_241);
  assign _T_244 = $signed(_T_242) == $signed(33'sh0);
  assign _T_246 = mpu_physaddr ^ 32'h60000000;
  assign _T_247 = {1'b0,$signed(_T_246)};
  assign _T_249 = $signed(_T_247) & $signed(33'sh1e0000000);
  assign _T_250 = $signed(_T_249);
  assign _T_252 = $signed(_T_250) == $signed(33'sh0);
  assign _T_255 = {1'b0,$signed(mpu_physaddr)};
  assign _T_257 = $signed(_T_255) & $signed(33'sh1fffff000);
  assign _T_258 = $signed(_T_257);
  assign _T_260 = $signed(_T_258) == $signed(33'sh0);
  assign _T_262 = mpu_physaddr ^ 32'h80000000;
  assign _T_263 = {1'b0,$signed(_T_262)};
  assign _T_265 = $signed(_T_263) & $signed(33'sh1f0000000);
  assign _T_266 = $signed(_T_265);
  assign _T_268 = $signed(_T_266) == $signed(33'sh0);
  assign _T_270 = mpu_physaddr ^ 32'ha000000;
  assign _T_271 = {1'b0,$signed(_T_270)};
  assign _T_273 = $signed(_T_271) & $signed(33'sh1fe000000);
  assign _T_274 = $signed(_T_273);
  assign _T_276 = $signed(_T_274) == $signed(33'sh0);
  assign _T_278 = mpu_physaddr ^ 32'h2000000;
  assign _T_279 = {1'b0,$signed(_T_278)};
  assign _T_281 = $signed(_T_279) & $signed(33'sh1ffff0000);
  assign _T_282 = $signed(_T_281);
  assign _T_284 = $signed(_T_282) == $signed(33'sh0);
  assign _T_286 = mpu_physaddr ^ 32'h1000;
  assign _T_287 = {1'b0,$signed(_T_286)};
  assign _T_289 = $signed(_T_287) & $signed(33'sh1fffff000);
  assign _T_290 = $signed(_T_289);
  assign _T_292 = $signed(_T_290) == $signed(33'sh0);
  assign _T_303_0 = _T_244;
  assign _T_303_1 = _T_252;
  assign _T_303_2 = _T_260;
  assign _T_303_3 = _T_268;
  assign _T_303_4 = _T_276;
  assign _T_303_5 = _T_284;
  assign _T_303_6 = _T_292;
  assign _T_313 = _T_303_0 | _T_303_1;
  assign _T_314 = _T_313 | _T_303_2;
  assign _T_315 = _T_314 | _T_303_3;
  assign _T_316 = _T_315 | _T_303_4;
  assign _T_317 = _T_316 | _T_303_5;
  assign legal_address = _T_317 | _T_303_6;
  assign _T_322 = $signed(_T_239) & $signed(33'shac000000);
  assign _T_323 = $signed(_T_322);
  assign _T_325 = $signed(_T_323) == $signed(33'sh0);
  assign _T_327 = mpu_physaddr ^ 32'h20000000;
  assign _T_328 = {1'b0,$signed(_T_327)};
  assign _T_330 = $signed(_T_328) & $signed(33'sha0000000);
  assign _T_331 = $signed(_T_330);
  assign _T_333 = $signed(_T_331) == $signed(33'sh0);
  assign _T_338 = $signed(_T_255) & $signed(33'shafff1000);
  assign _T_339 = $signed(_T_338);
  assign _T_341 = $signed(_T_339) == $signed(33'sh0);
  assign _T_346 = $signed(_T_263) & $signed(33'sha0000000);
  assign _T_347 = $signed(_T_346);
  assign _T_349 = $signed(_T_347) == $signed(33'sh0);
  assign _T_354 = $signed(_T_271) & $signed(33'shae000000);
  assign _T_355 = $signed(_T_354);
  assign _T_357 = $signed(_T_355) == $signed(33'sh0);
  assign _T_362 = $signed(_T_279) & $signed(33'shafff0000);
  assign _T_363 = $signed(_T_362);
  assign _T_365 = $signed(_T_363) == $signed(33'sh0);
  assign _T_370 = $signed(_T_287) & $signed(33'shafff1000);
  assign _T_371 = $signed(_T_370);
  assign _T_373 = $signed(_T_371) == $signed(33'sh0);
  assign _T_384_0 = _T_325;
  assign _T_384_1 = _T_333;
  assign _T_384_2 = _T_341;
  assign _T_384_3 = _T_349;
  assign _T_384_4 = _T_357;
  assign _T_384_5 = _T_365;
  assign _T_384_6 = _T_373;
  assign _T_423 = _T_384_0 | _T_384_1;
  assign _T_424 = _T_423 | _T_384_2;
  assign _T_425 = _T_424 | _T_384_3;
  assign _T_426 = _T_425 | _T_384_4;
  assign _T_427 = _T_426 | _T_384_5;
  assign _T_428 = _T_427 | _T_384_6;
  assign _T_429 = _T_428;
  assign prot_r = legal_address & _T_429;
  assign _T_496_0 = _T_325;
  assign _T_496_1 = _T_333;
  assign _T_496_2 = _T_341;
  assign _T_496_3 = _T_349;
  assign _T_496_4 = _T_357;
  assign _T_496_5 = _T_365;
  assign _T_496_6 = _T_373;
  assign _T_535 = _T_496_0 | _T_496_1;
  assign _T_536 = _T_535 | _T_496_2;
  assign _T_537 = _T_536 | _T_496_3;
  assign _T_538 = _T_537 | _T_496_4;
  assign _T_539 = _T_538 | _T_496_5;
  assign _T_541 = _T_539;
  assign prot_w = legal_address & _T_541;
  assign _T_608_0 = _T_325;
  assign _T_608_1 = _T_333;
  assign _T_608_2 = _T_341;
  assign _T_608_3 = _T_349;
  assign _T_608_4 = _T_357;
  assign _T_608_5 = _T_365;
  assign _T_608_6 = _T_373;
  assign _T_648 = _T_608_1 | _T_608_2;
  assign _T_649 = _T_648 | _T_608_3;
  assign _T_650 = _T_649 | _T_608_4;
  assign _T_652 = _T_650 | _T_608_6;
  assign _T_653 = _T_652;
  assign prot_x = legal_address & _T_653;
  assign _T_720_0 = _T_325;
  assign _T_720_1 = _T_333;
  assign _T_720_2 = _T_341;
  assign _T_720_3 = _T_349;
  assign _T_720_4 = _T_357;
  assign _T_720_5 = _T_365;
  assign _T_720_6 = _T_373;
  assign _T_762 = _T_720_3 | _T_720_4;
  assign _T_765 = _T_762;
  assign cacheable = legal_address & _T_765;
  assign _T_766 = io_req_bits_vpn[26:0];
  assign lookup_tag = {io_ptw_ptbr_asid,_T_766};
  assign _T_768 = io_ptw_status_vm[3];
  assign _T_770 = _T_768 & priv_uses_vm;
  assign _T_772 = io_req_bits_passthrough == 1'h0;
  assign vm_enabled = _T_770 & _T_772;
  assign _T_773 = valid[0];
  assign _T_774 = _T_773 & vm_enabled;
  assign _T_775 = tags_0 == lookup_tag;
  assign hitsVec_0 = _T_774 & _T_775;
  assign _T_776 = valid[1];
  assign _T_777 = _T_776 & vm_enabled;
  assign _T_778 = tags_1 == lookup_tag;
  assign hitsVec_1 = _T_777 & _T_778;
  assign _T_779 = valid[2];
  assign _T_780 = _T_779 & vm_enabled;
  assign _T_781 = tags_2 == lookup_tag;
  assign hitsVec_2 = _T_780 & _T_781;
  assign _T_782 = valid[3];
  assign _T_783 = _T_782 & vm_enabled;
  assign _T_784 = tags_3 == lookup_tag;
  assign hitsVec_3 = _T_783 & _T_784;
  assign _T_785 = valid[4];
  assign _T_786 = _T_785 & vm_enabled;
  assign _T_787 = tags_4 == lookup_tag;
  assign hitsVec_4 = _T_786 & _T_787;
  assign _T_788 = valid[5];
  assign _T_789 = _T_788 & vm_enabled;
  assign _T_790 = tags_5 == lookup_tag;
  assign hitsVec_5 = _T_789 & _T_790;
  assign _T_791 = valid[6];
  assign _T_792 = _T_791 & vm_enabled;
  assign _T_793 = tags_6 == lookup_tag;
  assign hitsVec_6 = _T_792 & _T_793;
  assign _T_794 = valid[7];
  assign _T_795 = _T_794 & vm_enabled;
  assign _T_796 = tags_7 == lookup_tag;
  assign hitsVec_7 = _T_795 & _T_796;
  assign hitsVec_8 = vm_enabled == 1'h0;
  assign _T_798 = {hitsVec_1,hitsVec_0};
  assign _T_799 = {hitsVec_3,hitsVec_2};
  assign _T_800 = {_T_799,_T_798};
  assign _T_801 = {hitsVec_5,hitsVec_4};
  assign _T_802 = {hitsVec_8,hitsVec_7};
  assign _T_803 = {_T_802,hitsVec_6};
  assign _T_804 = {_T_803,_T_801};
  assign hits = {_T_804,_T_800};
  assign _GEN_0 = io_ptw_resp_bits_pte_ppn[19:0];
  assign _GEN_2 = 3'h0 == r_refill_waddr ? _GEN_0 : ppns_0;
  assign _GEN_3 = 3'h1 == r_refill_waddr ? _GEN_0 : ppns_1;
  assign _GEN_4 = 3'h2 == r_refill_waddr ? _GEN_0 : ppns_2;
  assign _GEN_5 = 3'h3 == r_refill_waddr ? _GEN_0 : ppns_3;
  assign _GEN_6 = 3'h4 == r_refill_waddr ? _GEN_0 : ppns_4;
  assign _GEN_7 = 3'h5 == r_refill_waddr ? _GEN_0 : ppns_5;
  assign _GEN_8 = 3'h6 == r_refill_waddr ? _GEN_0 : ppns_6;
  assign _GEN_9 = 3'h7 == r_refill_waddr ? _GEN_0 : ppns_7;
  assign _GEN_1 = r_refill_tag;
  assign _GEN_10 = 3'h0 == r_refill_waddr ? _GEN_1 : tags_0;
  assign _GEN_11 = 3'h1 == r_refill_waddr ? _GEN_1 : tags_1;
  assign _GEN_12 = 3'h2 == r_refill_waddr ? _GEN_1 : tags_2;
  assign _GEN_13 = 3'h3 == r_refill_waddr ? _GEN_1 : tags_3;
  assign _GEN_14 = 3'h4 == r_refill_waddr ? _GEN_1 : tags_4;
  assign _GEN_15 = 3'h5 == r_refill_waddr ? _GEN_1 : tags_5;
  assign _GEN_16 = 3'h6 == r_refill_waddr ? _GEN_1 : tags_6;
  assign _GEN_17 = 3'h7 == r_refill_waddr ? _GEN_1 : tags_7;
  assign _T_836 = 8'h1 << r_refill_waddr;
  assign _T_837 = valid | _T_836;
  assign _T_838 = u_array | _T_836;
  assign _T_839 = ~ _T_836;
  assign _T_840 = u_array & _T_839;
  assign _T_841 = io_ptw_resp_bits_pte_u ? _T_838 : _T_840;
  assign _T_843 = io_ptw_resp_bits_pte_w == 1'h0;
  assign _T_844 = io_ptw_resp_bits_pte_x & _T_843;
  assign _T_845 = io_ptw_resp_bits_pte_r | _T_844;
  assign _T_846 = io_ptw_resp_bits_pte_v & _T_845;
  assign _T_847 = _T_846 & io_ptw_resp_bits_pte_w;
  assign _T_848 = _T_847 & prot_w;
  assign _T_849 = sw_array | _T_836;
  assign _T_851 = sw_array & _T_839;
  assign _T_852 = _T_848 ? _T_849 : _T_851;
  assign _T_858 = _T_846 & io_ptw_resp_bits_pte_x;
  assign _T_859 = _T_858 & prot_x;
  assign _T_860 = sx_array | _T_836;
  assign _T_862 = sx_array & _T_839;
  assign _T_863 = _T_859 ? _T_860 : _T_862;
  assign _T_869 = _T_846 & io_ptw_resp_bits_pte_r;
  assign _T_870 = _T_869 & prot_r;
  assign _T_871 = sr_array | _T_836;
  assign _T_873 = sr_array & _T_839;
  assign _T_874 = _T_870 ? _T_871 : _T_873;
  assign _T_881 = _T_858 & prot_r;
  assign _T_882 = xr_array | _T_836;
  assign _T_884 = xr_array & _T_839;
  assign _T_885 = _T_881 ? _T_882 : _T_884;
  assign _T_886 = cash_array | _T_836;
  assign _T_888 = cash_array & _T_839;
  assign _T_889 = cacheable ? _T_886 : _T_888;
  assign _T_890 = dirty_array | _T_836;
  assign _T_892 = dirty_array & _T_839;
  assign _T_893 = io_ptw_resp_bits_pte_d ? _T_890 : _T_892;
  assign _GEN_18 = io_ptw_resp_valid ? _GEN_2 : ppns_0;
  assign _GEN_19 = io_ptw_resp_valid ? _GEN_3 : ppns_1;
  assign _GEN_20 = io_ptw_resp_valid ? _GEN_4 : ppns_2;
  assign _GEN_21 = io_ptw_resp_valid ? _GEN_5 : ppns_3;
  assign _GEN_22 = io_ptw_resp_valid ? _GEN_6 : ppns_4;
  assign _GEN_23 = io_ptw_resp_valid ? _GEN_7 : ppns_5;
  assign _GEN_24 = io_ptw_resp_valid ? _GEN_8 : ppns_6;
  assign _GEN_25 = io_ptw_resp_valid ? _GEN_9 : ppns_7;
  assign _GEN_26 = io_ptw_resp_valid ? _GEN_10 : tags_0;
  assign _GEN_27 = io_ptw_resp_valid ? _GEN_11 : tags_1;
  assign _GEN_28 = io_ptw_resp_valid ? _GEN_12 : tags_2;
  assign _GEN_29 = io_ptw_resp_valid ? _GEN_13 : tags_3;
  assign _GEN_30 = io_ptw_resp_valid ? _GEN_14 : tags_4;
  assign _GEN_31 = io_ptw_resp_valid ? _GEN_15 : tags_5;
  assign _GEN_32 = io_ptw_resp_valid ? _GEN_16 : tags_6;
  assign _GEN_33 = io_ptw_resp_valid ? _GEN_17 : tags_7;
  assign _GEN_34 = io_ptw_resp_valid ? _T_837 : valid;
  assign _GEN_35 = io_ptw_resp_valid ? _T_841 : u_array;
  assign _GEN_36 = io_ptw_resp_valid ? _T_852 : sw_array;
  assign _GEN_37 = io_ptw_resp_valid ? _T_863 : sx_array;
  assign _GEN_38 = io_ptw_resp_valid ? _T_874 : sr_array;
  assign _GEN_39 = io_ptw_resp_valid ? _T_885 : xr_array;
  assign _GEN_40 = io_ptw_resp_valid ? _T_889 : cash_array;
  assign _GEN_41 = io_ptw_resp_valid ? _T_893 : dirty_array;
  assign _T_896 = ~ valid;
  assign _T_898 = _T_896 == 8'h0;
  assign _T_900 = _T_898 == 1'h0;
  assign _T_902 = _T_896[0];
  assign _T_903 = _T_896[1];
  assign _T_904 = _T_896[2];
  assign _T_905 = _T_896[3];
  assign _T_906 = _T_896[4];
  assign _T_907 = _T_896[5];
  assign _T_908 = _T_896[6];
  assign _T_918 = _T_908 ? 3'h6 : 3'h7;
  assign _T_919 = _T_907 ? 3'h5 : _T_918;
  assign _T_920 = _T_906 ? 3'h4 : _T_919;
  assign _T_921 = _T_905 ? 3'h3 : _T_920;
  assign _T_922 = _T_904 ? 3'h2 : _T_921;
  assign _T_923 = _T_903 ? 3'h1 : _T_922;
  assign _T_924 = _T_902 ? 3'h0 : _T_923;
  assign _T_926 = _T_895 >> 1'h1;
  assign _T_927 = _T_926[0];
  assign _T_928 = {1'h1,_T_927};
  assign _T_929 = _T_895 >> _T_928;
  assign _T_930 = _T_929[0];
  assign _T_931 = {_T_928,_T_930};
  assign _T_932 = _T_895 >> _T_931;
  assign _T_933 = _T_932[0];
  assign _T_934 = {_T_931,_T_933};
  assign _T_935 = _T_934[2:0];
  assign repl_waddr = _T_900 ? _T_924 : _T_935;
  assign _T_937 = io_ptw_status_pum ? u_array : 8'h0;
  assign _T_938 = ~ _T_937;
  assign priv_ok = priv_s ? _T_938 : u_array;
  assign _T_939 = priv_ok & sw_array;
  assign w_array = {prot_w,_T_939};
  assign _T_940 = priv_ok & sx_array;
  assign x_array = {prot_x,_T_940};
  assign _T_942 = io_ptw_status_mxr ? xr_array : 8'h0;
  assign _T_943 = sr_array | _T_942;
  assign _T_944 = priv_ok & _T_943;
  assign r_array = {prot_r,_T_944};
  assign c_array = {cacheable,cash_array};
  assign _T_945 = io_req_bits_vpn[27];
  assign _T_946 = io_req_bits_vpn[26];
  assign bad_va = _T_945 != _T_946;
  assign _T_947 = hits[7:0];
  assign _T_949 = io_req_bits_store ? w_array : 9'h0;
  assign _T_950 = ~ _T_949;
  assign _GEN_58 = {{1'd0}, dirty_array};
  assign _T_951 = _GEN_58 | _T_950;
  assign _GEN_59 = {{1'd0}, _T_947};
  assign tlb_hits = _GEN_59 & _T_951;
  assign tlb_hit = tlb_hits != 9'h0;
  assign _T_954 = bad_va == 1'h0;
  assign _T_955 = vm_enabled & _T_954;
  assign _T_957 = tlb_hit == 1'h0;
  assign tlb_miss = _T_955 & _T_957;
  assign _T_959 = tlb_miss == 1'h0;
  assign _T_960 = io_req_valid & _T_959;
  assign _T_962 = _T_947[7:4];
  assign _T_963 = _T_947[3:0];
  assign _T_965 = _T_962 != 4'h0;
  assign _T_966 = _T_962 | _T_963;
  assign _T_967 = _T_966[3:2];
  assign _T_968 = _T_966[1:0];
  assign _T_970 = _T_967 != 2'h0;
  assign _T_971 = _T_967 | _T_968;
  assign _T_972 = _T_971[1];
  assign _T_973 = {_T_970,_T_972};
  assign _T_974 = {_T_965,_T_973};
  assign _T_976 = _T_974[2];
  assign _T_978 = _T_976 == 1'h0;
  assign _T_980 = 2'h1 << 1'h1;
  assign _GEN_60 = {{6'd0}, _T_980};
  assign _T_981 = _T_895 | _GEN_60;
  assign _T_982 = ~ _T_895;
  assign _T_983 = _T_982 | _GEN_60;
  assign _T_984 = ~ _T_983;
  assign _T_985 = _T_978 ? _T_981 : _T_984;
  assign _T_986 = {1'h1,_T_976};
  assign _T_987 = _T_974[1];
  assign _T_989 = _T_987 == 1'h0;
  assign _T_991 = 4'h1 << _T_986;
  assign _GEN_62 = {{4'd0}, _T_991};
  assign _T_992 = _T_985 | _GEN_62;
  assign _T_993 = ~ _T_985;
  assign _T_994 = _T_993 | _GEN_62;
  assign _T_995 = ~ _T_994;
  assign _T_996 = _T_989 ? _T_992 : _T_995;
  assign _T_997 = {_T_986,_T_987};
  assign _T_998 = _T_974[0];
  assign _T_1000 = _T_998 == 1'h0;
  assign _T_1002 = 8'h1 << _T_997;
  assign _T_1003 = _T_996 | _T_1002;
  assign _T_1004 = ~ _T_996;
  assign _T_1005 = _T_1004 | _T_1002;
  assign _T_1006 = ~ _T_1005;
  assign _T_1007 = _T_1000 ? _T_1003 : _T_1006;
  assign _GEN_42 = _T_960 ? _T_1007 : _T_895;
  assign _T_1009 = state == 2'h0;
  assign _T_1010 = ~ r_array;
  assign _T_1011 = _T_1010 & hits;
  assign _T_1013 = _T_1011 != 9'h0;
  assign _T_1014 = bad_va | _T_1013;
  assign _T_1015 = ~ w_array;
  assign _T_1016 = _T_1015 & hits;
  assign _T_1018 = _T_1016 != 9'h0;
  assign _T_1019 = bad_va | _T_1018;
  assign _T_1020 = ~ x_array;
  assign _T_1021 = _T_1020 & hits;
  assign _T_1023 = _T_1021 != 9'h0;
  assign _T_1024 = bad_va | _T_1023;
  assign _T_1025 = c_array & hits;
  assign _T_1027 = _T_1025 != 9'h0;
  assign _T_1028 = io_ptw_resp_valid | tlb_miss;
  assign _T_1030 = hitsVec_0 ? ppns_0 : 20'h0;
  assign _T_1032 = hitsVec_1 ? ppns_1 : 20'h0;
  assign _T_1034 = hitsVec_2 ? ppns_2 : 20'h0;
  assign _T_1036 = hitsVec_3 ? ppns_3 : 20'h0;
  assign _T_1038 = hitsVec_4 ? ppns_4 : 20'h0;
  assign _T_1040 = hitsVec_5 ? ppns_5 : 20'h0;
  assign _T_1042 = hitsVec_6 ? ppns_6 : 20'h0;
  assign _T_1044 = hitsVec_7 ? ppns_7 : 20'h0;
  assign _T_1046 = hitsVec_8 ? passthrough_ppn : 20'h0;
  assign _T_1048 = _T_1030 | _T_1032;
  assign _T_1049 = _T_1048 | _T_1034;
  assign _T_1050 = _T_1049 | _T_1036;
  assign _T_1051 = _T_1050 | _T_1038;
  assign _T_1052 = _T_1051 | _T_1040;
  assign _T_1053 = _T_1052 | _T_1042;
  assign _T_1054 = _T_1053 | _T_1044;
  assign _T_1055 = _T_1054 | _T_1046;
  assign _T_1056 = _T_1055;
  assign _T_1057 = state == 2'h1;
  assign _T_1058 = io_req_ready & io_req_valid;
  assign _T_1059 = _T_1058 & tlb_miss;
  assign _GEN_43 = _T_1059 ? 2'h1 : state;
  assign _GEN_44 = _T_1059 ? lookup_tag : r_refill_tag;
  assign _GEN_45 = _T_1059 ? repl_waddr : r_refill_waddr;
  assign _GEN_46 = _T_1059 ? io_req_bits_vpn : r_req_vpn;
  assign _GEN_47 = _T_1059 ? io_req_bits_passthrough : r_req_passthrough;
  assign _GEN_48 = _T_1059 ? io_req_bits_instruction : r_req_instruction;
  assign _GEN_49 = _T_1059 ? io_req_bits_store : r_req_store;
  assign _GEN_50 = io_ptw_invalidate ? 2'h0 : _GEN_43;
  assign _GEN_51 = io_ptw_invalidate ? 2'h3 : 2'h2;
  assign _GEN_52 = io_ptw_req_ready ? _GEN_51 : _GEN_50;
  assign _GEN_53 = _T_1057 ? _GEN_52 : _GEN_43;
  assign _T_1061 = state == 2'h2;
  assign _T_1062 = _T_1061 & io_ptw_invalidate;
  assign _GEN_54 = _T_1062 ? 2'h3 : _GEN_53;
  assign _GEN_55 = io_ptw_resp_valid ? 2'h0 : _GEN_54;
  assign _GEN_56 = io_ptw_invalidate ? 8'h0 : _GEN_34;
`ifdef RANDOMIZE
  integer initvar;
  initial begin
    `ifndef verilator
      #0.002 begin end
    `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_61 = {1{$random}};
  valid = _GEN_61[7:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_63 = {1{$random}};
  ppns_0 = _GEN_63[19:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_64 = {1{$random}};
  ppns_1 = _GEN_64[19:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_65 = {1{$random}};
  ppns_2 = _GEN_65[19:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_66 = {1{$random}};
  ppns_3 = _GEN_66[19:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_67 = {1{$random}};
  ppns_4 = _GEN_67[19:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_68 = {1{$random}};
  ppns_5 = _GEN_68[19:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_69 = {1{$random}};
  ppns_6 = _GEN_69[19:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_70 = {1{$random}};
  ppns_7 = _GEN_70[19:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_71 = {2{$random}};
  tags_0 = _GEN_71[33:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_72 = {2{$random}};
  tags_1 = _GEN_72[33:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_73 = {2{$random}};
  tags_2 = _GEN_73[33:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_74 = {2{$random}};
  tags_3 = _GEN_74[33:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_75 = {2{$random}};
  tags_4 = _GEN_75[33:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_76 = {2{$random}};
  tags_5 = _GEN_76[33:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_77 = {2{$random}};
  tags_6 = _GEN_77[33:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_78 = {2{$random}};
  tags_7 = _GEN_78[33:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_79 = {1{$random}};
  state = _GEN_79[1:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_80 = {2{$random}};
  r_refill_tag = _GEN_80[33:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_81 = {1{$random}};
  r_refill_waddr = _GEN_81[2:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_82 = {1{$random}};
  r_req_vpn = _GEN_82[27:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_83 = {1{$random}};
  r_req_passthrough = _GEN_83[0:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_84 = {1{$random}};
  r_req_instruction = _GEN_84[0:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_85 = {1{$random}};
  r_req_store = _GEN_85[0:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_86 = {1{$random}};
  pte_array_reserved_for_hardware = _GEN_86[15:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_87 = {2{$random}};
  pte_array_ppn = _GEN_87[37:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_88 = {1{$random}};
  pte_array_reserved_for_software = _GEN_88[1:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_89 = {1{$random}};
  pte_array_d = _GEN_89[0:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_90 = {1{$random}};
  pte_array_a = _GEN_90[0:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_91 = {1{$random}};
  pte_array_g = _GEN_91[0:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_92 = {1{$random}};
  pte_array_u = _GEN_92[0:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_93 = {1{$random}};
  pte_array_x = _GEN_93[0:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_94 = {1{$random}};
  pte_array_w = _GEN_94[0:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_95 = {1{$random}};
  pte_array_r = _GEN_95[0:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_96 = {1{$random}};
  pte_array_v = _GEN_96[0:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_97 = {1{$random}};
  u_array = _GEN_97[7:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_98 = {1{$random}};
  sw_array = _GEN_98[7:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_99 = {1{$random}};
  sx_array = _GEN_99[7:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_100 = {1{$random}};
  sr_array = _GEN_100[7:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_101 = {1{$random}};
  xr_array = _GEN_101[7:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_102 = {1{$random}};
  cash_array = _GEN_102[7:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_103 = {1{$random}};
  dirty_array = _GEN_103[7:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_104 = {1{$random}};
  _T_895 = _GEN_104[7:0];
  `endif
  end
`endif
  always @(posedge clock) begin
    if (reset) begin
      valid <= 8'h0;
    end else begin
      if (io_ptw_invalidate) begin
        valid <= 8'h0;
      end else begin
        if (io_ptw_resp_valid) begin
          valid <= _T_837;
        end
      end
    end
    if (io_ptw_resp_valid) begin
      if (3'h0 == r_refill_waddr) begin
        ppns_0 <= _GEN_0;
      end
    end
    if (io_ptw_resp_valid) begin
      if (3'h1 == r_refill_waddr) begin
        ppns_1 <= _GEN_0;
      end
    end
    if (io_ptw_resp_valid) begin
      if (3'h2 == r_refill_waddr) begin
        ppns_2 <= _GEN_0;
      end
    end
    if (io_ptw_resp_valid) begin
      if (3'h3 == r_refill_waddr) begin
        ppns_3 <= _GEN_0;
      end
    end
    if (io_ptw_resp_valid) begin
      if (3'h4 == r_refill_waddr) begin
        ppns_4 <= _GEN_0;
      end
    end
    if (io_ptw_resp_valid) begin
      if (3'h5 == r_refill_waddr) begin
        ppns_5 <= _GEN_0;
      end
    end
    if (io_ptw_resp_valid) begin
      if (3'h6 == r_refill_waddr) begin
        ppns_6 <= _GEN_0;
      end
    end
    if (io_ptw_resp_valid) begin
      if (3'h7 == r_refill_waddr) begin
        ppns_7 <= _GEN_0;
      end
    end
    if (io_ptw_resp_valid) begin
      if (3'h0 == r_refill_waddr) begin
        tags_0 <= _GEN_1;
      end
    end
    if (io_ptw_resp_valid) begin
      if (3'h1 == r_refill_waddr) begin
        tags_1 <= _GEN_1;
      end
    end
    if (io_ptw_resp_valid) begin
      if (3'h2 == r_refill_waddr) begin
        tags_2 <= _GEN_1;
      end
    end
    if (io_ptw_resp_valid) begin
      if (3'h3 == r_refill_waddr) begin
        tags_3 <= _GEN_1;
      end
    end
    if (io_ptw_resp_valid) begin
      if (3'h4 == r_refill_waddr) begin
        tags_4 <= _GEN_1;
      end
    end
    if (io_ptw_resp_valid) begin
      if (3'h5 == r_refill_waddr) begin
        tags_5 <= _GEN_1;
      end
    end
    if (io_ptw_resp_valid) begin
      if (3'h6 == r_refill_waddr) begin
        tags_6 <= _GEN_1;
      end
    end
    if (io_ptw_resp_valid) begin
      if (3'h7 == r_refill_waddr) begin
        tags_7 <= _GEN_1;
      end
    end
    if (reset) begin
      state <= 2'h0;
    end else begin
      if (io_ptw_resp_valid) begin
        state <= 2'h0;
      end else begin
        if (_T_1062) begin
          state <= 2'h3;
        end else begin
          if (_T_1057) begin
            if (io_ptw_req_ready) begin
              if (io_ptw_invalidate) begin
                state <= 2'h3;
              end else begin
                state <= 2'h2;
              end
            end else begin
              if (io_ptw_invalidate) begin
                state <= 2'h0;
              end else begin
                if (_T_1059) begin
                  state <= 2'h1;
                end
              end
            end
          end else begin
            if (_T_1059) begin
              state <= 2'h1;
            end
          end
        end
      end
    end
    if (_T_1059) begin
      r_refill_tag <= lookup_tag;
    end
    if (_T_1059) begin
      if (_T_900) begin
        if (_T_902) begin
          r_refill_waddr <= 3'h0;
        end else begin
          if (_T_903) begin
            r_refill_waddr <= 3'h1;
          end else begin
            if (_T_904) begin
              r_refill_waddr <= 3'h2;
            end else begin
              if (_T_905) begin
                r_refill_waddr <= 3'h3;
              end else begin
                if (_T_906) begin
                  r_refill_waddr <= 3'h4;
                end else begin
                  if (_T_907) begin
                    r_refill_waddr <= 3'h5;
                  end else begin
                    if (_T_908) begin
                      r_refill_waddr <= 3'h6;
                    end else begin
                      r_refill_waddr <= 3'h7;
                    end
                  end
                end
              end
            end
          end
        end
      end else begin
        r_refill_waddr <= _T_935;
      end
    end
    if (_T_1059) begin
      r_req_vpn <= io_req_bits_vpn;
    end
    if (_T_1059) begin
      r_req_passthrough <= io_req_bits_passthrough;
    end
    if (_T_1059) begin
      r_req_instruction <= io_req_bits_instruction;
    end
    if (_T_1059) begin
      r_req_store <= io_req_bits_store;
    end
    if (io_ptw_resp_valid) begin
      if (io_ptw_resp_bits_pte_u) begin
        u_array <= _T_838;
      end else begin
        u_array <= _T_840;
      end
    end
    if (io_ptw_resp_valid) begin
      if (_T_848) begin
        sw_array <= _T_849;
      end else begin
        sw_array <= _T_851;
      end
    end
    if (io_ptw_resp_valid) begin
      if (_T_859) begin
        sx_array <= _T_860;
      end else begin
        sx_array <= _T_862;
      end
    end
    if (io_ptw_resp_valid) begin
      if (_T_870) begin
        sr_array <= _T_871;
      end else begin
        sr_array <= _T_873;
      end
    end
    if (io_ptw_resp_valid) begin
      if (_T_881) begin
        xr_array <= _T_882;
      end else begin
        xr_array <= _T_884;
      end
    end
    if (io_ptw_resp_valid) begin
      if (cacheable) begin
        cash_array <= _T_886;
      end else begin
        cash_array <= _T_888;
      end
    end
    if (io_ptw_resp_valid) begin
      if (io_ptw_resp_bits_pte_d) begin
        dirty_array <= _T_890;
      end else begin
        dirty_array <= _T_892;
      end
    end
    if (_T_960) begin
      if (_T_1000) begin
        _T_895 <= _T_1003;
      end else begin
        _T_895 <= _T_1006;
      end
    end
  end
endmodule