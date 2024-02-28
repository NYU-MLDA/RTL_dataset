module BranchMaskGenerationLogic(
  input   clock,
  input   reset,
  input   io_is_branch_0,
  input   io_is_branch_1,
  input   io_is_branch_2,
  input   io_is_branch_3,
  input   io_will_fire_0,
  input   io_will_fire_1,
  input   io_will_fire_2,
  input   io_will_fire_3,
  output [2:0] io_br_tag_0,
  output [2:0] io_br_tag_1,
  output [2:0] io_br_tag_2,
  output [2:0] io_br_tag_3,
  output [7:0] io_br_mask_0,
  output [7:0] io_br_mask_1,
  output [7:0] io_br_mask_2,
  output [7:0] io_br_mask_3,
  output  io_is_full_0,
  output  io_is_full_1,
  output  io_is_full_2,
  output  io_is_full_3,
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
  input   io_flush_pipeline,
  output [7:0] io_debug_branch_mask
);
  reg [7:0] branch_mask;
  reg [31:0] _GEN_67;
  wire [7:0] tag_masks_0;
  wire [7:0] tag_masks_1;
  wire [7:0] tag_masks_2;
  wire [7:0] tag_masks_3;
  wire  _T_80;
  wire  _T_81;
  wire [2:0] _T_83;
  wire  _T_86;
  wire  _T_87;
  wire [7:0] _T_91;
  wire [2:0] _GEN_0;
  wire [7:0] _GEN_1;
  wire  _T_92;
  wire  _T_93;
  wire [7:0] _T_97;
  wire [2:0] _GEN_2;
  wire [7:0] _GEN_3;
  wire  _T_98;
  wire  _T_99;
  wire [7:0] _T_103;
  wire [2:0] _GEN_4;
  wire [7:0] _GEN_5;
  wire  _T_104;
  wire  _T_105;
  wire [7:0] _T_109;
  wire [2:0] _GEN_6;
  wire [7:0] _GEN_7;
  wire  _T_110;
  wire  _T_111;
  wire [3:0] _T_115;
  wire [2:0] _GEN_8;
  wire [7:0] _GEN_9;
  wire  _T_116;
  wire  _T_117;
  wire [3:0] _T_121;
  wire [2:0] _GEN_10;
  wire [7:0] _GEN_11;
  wire  _T_122;
  wire  _T_123;
  wire [1:0] _T_127;
  wire [2:0] _GEN_12;
  wire [7:0] _GEN_13;
  wire  _T_128;
  wire  _T_129;
  wire [1:0] _T_133;
  wire [2:0] _GEN_14;
  wire [7:0] _GEN_15;
  wire [7:0] _T_134;
  wire [7:0] _T_135;
  wire  _T_138;
  wire  _T_139;
  wire [2:0] _T_141;
  wire  _T_144;
  wire  _T_145;
  wire [2:0] _GEN_16;
  wire [7:0] _GEN_17;
  wire  _T_150;
  wire  _T_151;
  wire [2:0] _GEN_18;
  wire [7:0] _GEN_19;
  wire  _T_156;
  wire  _T_157;
  wire [2:0] _GEN_20;
  wire [7:0] _GEN_21;
  wire  _T_162;
  wire  _T_163;
  wire [2:0] _GEN_22;
  wire [7:0] _GEN_23;
  wire  _T_168;
  wire  _T_169;
  wire [2:0] _GEN_24;
  wire [7:0] _GEN_25;
  wire  _T_174;
  wire  _T_175;
  wire [2:0] _GEN_26;
  wire [7:0] _GEN_27;
  wire  _T_180;
  wire  _T_181;
  wire [2:0] _GEN_28;
  wire [7:0] _GEN_29;
  wire  _T_186;
  wire  _T_187;
  wire [2:0] _GEN_30;
  wire [7:0] _GEN_31;
  wire [7:0] _T_192;
  wire [7:0] _T_193;
  wire  _T_196;
  wire  _T_197;
  wire [2:0] _T_199;
  wire  _T_202;
  wire  _T_203;
  wire [2:0] _GEN_32;
  wire [7:0] _GEN_33;
  wire  _T_208;
  wire  _T_209;
  wire [2:0] _GEN_34;
  wire [7:0] _GEN_35;
  wire  _T_214;
  wire  _T_215;
  wire [2:0] _GEN_36;
  wire [7:0] _GEN_37;
  wire  _T_220;
  wire  _T_221;
  wire [2:0] _GEN_38;
  wire [7:0] _GEN_39;
  wire  _T_226;
  wire  _T_227;
  wire [2:0] _GEN_40;
  wire [7:0] _GEN_41;
  wire  _T_232;
  wire  _T_233;
  wire [2:0] _GEN_42;
  wire [7:0] _GEN_43;
  wire  _T_238;
  wire  _T_239;
  wire [2:0] _GEN_44;
  wire [7:0] _GEN_45;
  wire  _T_244;
  wire  _T_245;
  wire [2:0] _GEN_46;
  wire [7:0] _GEN_47;
  wire [7:0] _T_250;
  wire [7:0] _T_251;
  wire  _T_254;
  wire  _T_255;
  wire [2:0] _T_257;
  wire  _T_260;
  wire  _T_261;
  wire [2:0] _GEN_48;
  wire [7:0] _GEN_49;
  wire  _T_266;
  wire  _T_267;
  wire [2:0] _GEN_50;
  wire [7:0] _GEN_51;
  wire  _T_272;
  wire  _T_273;
  wire [2:0] _GEN_52;
  wire [7:0] _GEN_53;
  wire  _T_278;
  wire  _T_279;
  wire [2:0] _GEN_54;
  wire [7:0] _GEN_55;
  wire  _T_284;
  wire  _T_285;
  wire [2:0] _GEN_56;
  wire [7:0] _GEN_57;
  wire  _T_290;
  wire  _T_291;
  wire [2:0] _GEN_58;
  wire [7:0] _GEN_59;
  wire  _T_296;
  wire  _T_297;
  wire [2:0] _GEN_60;
  wire [7:0] _GEN_61;
  wire  _T_302;
  wire  _T_303;
  wire [2:0] _GEN_62;
  wire [7:0] _GEN_63;
  wire [7:0] _T_309;
  wire [7:0] _T_310;
  wire [7:0] _T_311;
  wire [7:0] _T_313;
  wire [7:0] _T_315;
  wire [7:0] _T_316;
  wire [7:0] _T_317;
  wire [7:0] _T_318;
  wire [7:0] _T_320;
  wire [7:0] _T_321;
  wire [7:0] _T_322;
  wire [7:0] _T_323;
  wire [7:0] _T_325;
  wire [7:0] _T_326;
  wire [7:0] _T_327;
  wire [7:0] curr_mask;
  wire [7:0] _GEN_64;
  wire  _T_329;
  wire  _T_331;
  wire  _T_332;
  wire [7:0] _GEN_65;
  wire  _T_336;
  wire  _T_337;
  wire [7:0] _T_339;
  wire [7:0] _T_340;
  wire [7:0] _GEN_66;
  assign io_br_tag_0 = _T_83;
  assign io_br_tag_1 = _T_141;
  assign io_br_tag_2 = _T_199;
  assign io_br_tag_3 = _T_257;
  assign io_br_mask_0 = _T_311;
  assign io_br_mask_1 = _T_316;
  assign io_br_mask_2 = _T_321;
  assign io_br_mask_3 = _T_326;
  assign io_is_full_0 = _T_81;
  assign io_is_full_1 = _T_139;
  assign io_is_full_2 = _T_197;
  assign io_is_full_3 = _T_255;
  assign io_debug_branch_mask = branch_mask;
  assign tag_masks_0 = _GEN_15;
  assign tag_masks_1 = _GEN_31;
  assign tag_masks_2 = _GEN_47;
  assign tag_masks_3 = _GEN_63;
  assign _T_80 = branch_mask == 8'hff;
  assign _T_81 = _T_80 & io_is_branch_0;
  assign _T_83 = _GEN_14;
  assign _T_86 = branch_mask[7];
  assign _T_87 = ~ _T_86;
  assign _T_91 = 8'h1 << 3'h7;
  assign _GEN_0 = _T_87 ? 3'h7 : 3'h0;
  assign _GEN_1 = _T_87 ? _T_91 : 8'h0;
  assign _T_92 = branch_mask[6];
  assign _T_93 = ~ _T_92;
  assign _T_97 = 8'h1 << 3'h6;
  assign _GEN_2 = _T_93 ? 3'h6 : _GEN_0;
  assign _GEN_3 = _T_93 ? _T_97 : _GEN_1;
  assign _T_98 = branch_mask[5];
  assign _T_99 = ~ _T_98;
  assign _T_103 = 8'h1 << 3'h5;
  assign _GEN_4 = _T_99 ? 3'h5 : _GEN_2;
  assign _GEN_5 = _T_99 ? _T_103 : _GEN_3;
  assign _T_104 = branch_mask[4];
  assign _T_105 = ~ _T_104;
  assign _T_109 = 8'h1 << 3'h4;
  assign _GEN_6 = _T_105 ? 3'h4 : _GEN_4;
  assign _GEN_7 = _T_105 ? _T_109 : _GEN_5;
  assign _T_110 = branch_mask[3];
  assign _T_111 = ~ _T_110;
  assign _T_115 = 4'h1 << 2'h3;
  assign _GEN_8 = _T_111 ? 3'h3 : _GEN_6;
  assign _GEN_9 = _T_111 ? {{4'd0}, _T_115} : _GEN_7;
  assign _T_116 = branch_mask[2];
  assign _T_117 = ~ _T_116;
  assign _T_121 = 4'h1 << 2'h2;
  assign _GEN_10 = _T_117 ? 3'h2 : _GEN_8;
  assign _GEN_11 = _T_117 ? {{4'd0}, _T_121} : _GEN_9;
  assign _T_122 = branch_mask[1];
  assign _T_123 = ~ _T_122;
  assign _T_127 = 2'h1 << 1'h1;
  assign _GEN_12 = _T_123 ? 3'h1 : _GEN_10;
  assign _GEN_13 = _T_123 ? {{6'd0}, _T_127} : _GEN_11;
  assign _T_128 = branch_mask[0];
  assign _T_129 = ~ _T_128;
  assign _T_133 = 2'h1 << 1'h0;
  assign _GEN_14 = _T_129 ? 3'h0 : _GEN_12;
  assign _GEN_15 = _T_129 ? {{6'd0}, _T_133} : _GEN_13;
  assign _T_134 = tag_masks_0 | branch_mask;
  assign _T_135 = io_is_branch_0 ? _T_134 : branch_mask;
  assign _T_138 = _T_135 == 8'hff;
  assign _T_139 = _T_138 & io_is_branch_1;
  assign _T_141 = _GEN_30;
  assign _T_144 = _T_135[7];
  assign _T_145 = ~ _T_144;
  assign _GEN_16 = _T_145 ? 3'h7 : 3'h0;
  assign _GEN_17 = _T_145 ? _T_91 : 8'h0;
  assign _T_150 = _T_135[6];
  assign _T_151 = ~ _T_150;
  assign _GEN_18 = _T_151 ? 3'h6 : _GEN_16;
  assign _GEN_19 = _T_151 ? _T_97 : _GEN_17;
  assign _T_156 = _T_135[5];
  assign _T_157 = ~ _T_156;
  assign _GEN_20 = _T_157 ? 3'h5 : _GEN_18;
  assign _GEN_21 = _T_157 ? _T_103 : _GEN_19;
  assign _T_162 = _T_135[4];
  assign _T_163 = ~ _T_162;
  assign _GEN_22 = _T_163 ? 3'h4 : _GEN_20;
  assign _GEN_23 = _T_163 ? _T_109 : _GEN_21;
  assign _T_168 = _T_135[3];
  assign _T_169 = ~ _T_168;
  assign _GEN_24 = _T_169 ? 3'h3 : _GEN_22;
  assign _GEN_25 = _T_169 ? {{4'd0}, _T_115} : _GEN_23;
  assign _T_174 = _T_135[2];
  assign _T_175 = ~ _T_174;
  assign _GEN_26 = _T_175 ? 3'h2 : _GEN_24;
  assign _GEN_27 = _T_175 ? {{4'd0}, _T_121} : _GEN_25;
  assign _T_180 = _T_135[1];
  assign _T_181 = ~ _T_180;
  assign _GEN_28 = _T_181 ? 3'h1 : _GEN_26;
  assign _GEN_29 = _T_181 ? {{6'd0}, _T_127} : _GEN_27;
  assign _T_186 = _T_135[0];
  assign _T_187 = ~ _T_186;
  assign _GEN_30 = _T_187 ? 3'h0 : _GEN_28;
  assign _GEN_31 = _T_187 ? {{6'd0}, _T_133} : _GEN_29;
  assign _T_192 = tag_masks_1 | _T_135;
  assign _T_193 = io_is_branch_1 ? _T_192 : _T_135;
  assign _T_196 = _T_193 == 8'hff;
  assign _T_197 = _T_196 & io_is_branch_2;
  assign _T_199 = _GEN_46;
  assign _T_202 = _T_193[7];
  assign _T_203 = ~ _T_202;
  assign _GEN_32 = _T_203 ? 3'h7 : 3'h0;
  assign _GEN_33 = _T_203 ? _T_91 : 8'h0;
  assign _T_208 = _T_193[6];
  assign _T_209 = ~ _T_208;
  assign _GEN_34 = _T_209 ? 3'h6 : _GEN_32;
  assign _GEN_35 = _T_209 ? _T_97 : _GEN_33;
  assign _T_214 = _T_193[5];
  assign _T_215 = ~ _T_214;
  assign _GEN_36 = _T_215 ? 3'h5 : _GEN_34;
  assign _GEN_37 = _T_215 ? _T_103 : _GEN_35;
  assign _T_220 = _T_193[4];
  assign _T_221 = ~ _T_220;
  assign _GEN_38 = _T_221 ? 3'h4 : _GEN_36;
  assign _GEN_39 = _T_221 ? _T_109 : _GEN_37;
  assign _T_226 = _T_193[3];
  assign _T_227 = ~ _T_226;
  assign _GEN_40 = _T_227 ? 3'h3 : _GEN_38;
  assign _GEN_41 = _T_227 ? {{4'd0}, _T_115} : _GEN_39;
  assign _T_232 = _T_193[2];
  assign _T_233 = ~ _T_232;
  assign _GEN_42 = _T_233 ? 3'h2 : _GEN_40;
  assign _GEN_43 = _T_233 ? {{4'd0}, _T_121} : _GEN_41;
  assign _T_238 = _T_193[1];
  assign _T_239 = ~ _T_238;
  assign _GEN_44 = _T_239 ? 3'h1 : _GEN_42;
  assign _GEN_45 = _T_239 ? {{6'd0}, _T_127} : _GEN_43;
  assign _T_244 = _T_193[0];
  assign _T_245 = ~ _T_244;
  assign _GEN_46 = _T_245 ? 3'h0 : _GEN_44;
  assign _GEN_47 = _T_245 ? {{6'd0}, _T_133} : _GEN_45;
  assign _T_250 = tag_masks_2 | _T_193;
  assign _T_251 = io_is_branch_2 ? _T_250 : _T_193;
  assign _T_254 = _T_251 == 8'hff;
  assign _T_255 = _T_254 & io_is_branch_3;
  assign _T_257 = _GEN_62;
  assign _T_260 = _T_251[7];
  assign _T_261 = ~ _T_260;
  assign _GEN_48 = _T_261 ? 3'h7 : 3'h0;
  assign _GEN_49 = _T_261 ? _T_91 : 8'h0;
  assign _T_266 = _T_251[6];
  assign _T_267 = ~ _T_266;
  assign _GEN_50 = _T_267 ? 3'h6 : _GEN_48;
  assign _GEN_51 = _T_267 ? _T_97 : _GEN_49;
  assign _T_272 = _T_251[5];
  assign _T_273 = ~ _T_272;
  assign _GEN_52 = _T_273 ? 3'h5 : _GEN_50;
  assign _GEN_53 = _T_273 ? _T_103 : _GEN_51;
  assign _T_278 = _T_251[4];
  assign _T_279 = ~ _T_278;
  assign _GEN_54 = _T_279 ? 3'h4 : _GEN_52;
  assign _GEN_55 = _T_279 ? _T_109 : _GEN_53;
  assign _T_284 = _T_251[3];
  assign _T_285 = ~ _T_284;
  assign _GEN_56 = _T_285 ? 3'h3 : _GEN_54;
  assign _GEN_57 = _T_285 ? {{4'd0}, _T_115} : _GEN_55;
  assign _T_290 = _T_251[2];
  assign _T_291 = ~ _T_290;
  assign _GEN_58 = _T_291 ? 3'h2 : _GEN_56;
  assign _GEN_59 = _T_291 ? {{4'd0}, _T_121} : _GEN_57;
  assign _T_296 = _T_251[1];
  assign _T_297 = ~ _T_296;
  assign _GEN_60 = _T_297 ? 3'h1 : _GEN_58;
  assign _GEN_61 = _T_297 ? {{6'd0}, _T_127} : _GEN_59;
  assign _T_302 = _T_251[0];
  assign _T_303 = ~ _T_302;
  assign _GEN_62 = _T_303 ? 3'h0 : _GEN_60;
  assign _GEN_63 = _T_303 ? {{6'd0}, _T_133} : _GEN_61;
  assign _T_309 = ~ io_brinfo_mask;
  assign _T_310 = branch_mask & _T_309;
  assign _T_311 = io_brinfo_valid ? _T_310 : branch_mask;
  assign _T_313 = io_will_fire_0 ? _T_134 : branch_mask;
  assign _T_315 = _T_313 & _T_309;
  assign _T_316 = io_brinfo_valid ? _T_315 : _T_313;
  assign _T_317 = tag_masks_1 | _T_313;
  assign _T_318 = io_will_fire_1 ? _T_317 : _T_313;
  assign _T_320 = _T_318 & _T_309;
  assign _T_321 = io_brinfo_valid ? _T_320 : _T_318;
  assign _T_322 = tag_masks_2 | _T_318;
  assign _T_323 = io_will_fire_2 ? _T_322 : _T_318;
  assign _T_325 = _T_323 & _T_309;
  assign _T_326 = io_brinfo_valid ? _T_325 : _T_323;
  assign _T_327 = tag_masks_3 | _T_323;
  assign curr_mask = io_will_fire_3 ? _T_327 : _T_323;
  assign _GEN_64 = io_flush_pipeline ? 8'h0 : branch_mask;
  assign _T_329 = io_brinfo_valid & io_brinfo_mispredict;
  assign _T_331 = io_flush_pipeline == 1'h0;
  assign _T_332 = _T_331 & _T_329;
  assign _GEN_65 = _T_332 ? io_brinfo_exe_mask : _GEN_64;
  assign _T_336 = _T_329 == 1'h0;
  assign _T_337 = _T_331 & _T_336;
  assign _T_339 = curr_mask & _T_309;
  assign _T_340 = io_brinfo_valid ? _T_339 : curr_mask;
  assign _GEN_66 = _T_337 ? _T_340 : _GEN_65;
`ifdef RANDOMIZE
  integer initvar;
  initial begin
    `ifndef verilator
      #0.002 begin end
    `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_67 = {1{$random}};
  branch_mask = _GEN_67[7:0];
  `endif
  end
`endif
  always @(posedge clock) begin
    if (reset) begin
      branch_mask <= 8'h0;
    end else begin
      if (_T_337) begin
        if (io_brinfo_valid) begin
          branch_mask <= _T_339;
        end else begin
          if (io_will_fire_3) begin
            branch_mask <= _T_327;
          end else begin
            if (io_will_fire_2) begin
              branch_mask <= _T_322;
            end else begin
              if (io_will_fire_1) begin
                branch_mask <= _T_317;
              end else begin
                if (io_will_fire_0) begin
                  branch_mask <= _T_134;
                end
              end
            end
          end
        end
      end else begin
        if (_T_332) begin
          branch_mask <= io_brinfo_exe_mask;
        end else begin
          if (io_flush_pipeline) begin
            branch_mask <= 8'h0;
          end
        end
      end
    end
  end
endmodule