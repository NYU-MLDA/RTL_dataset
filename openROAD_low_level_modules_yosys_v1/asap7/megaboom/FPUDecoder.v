module FPUDecoder(
  input   clock,
  input   reset,
  input  [31:0] io_inst,
  output [4:0] io_sigs_cmd,
  output  io_sigs_ldst,
  output  io_sigs_wen,
  output  io_sigs_ren1,
  output  io_sigs_ren2,
  output  io_sigs_ren3,
  output  io_sigs_swap12,
  output  io_sigs_swap23,
  output  io_sigs_single,
  output  io_sigs_fromint,
  output  io_sigs_toint,
  output  io_sigs_fastpipe,
  output  io_sigs_fma,
  output  io_sigs_div,
  output  io_sigs_sqrt,
  output  io_sigs_round,
  output  io_sigs_wflags
);
  wire [31:0] _T_23;
  wire  _T_25;
  wire [31:0] _T_27;
  wire  _T_29;
  wire  _T_32;
  wire [31:0] _T_34;
  wire  _T_36;
  wire [31:0] _T_38;
  wire  _T_40;
  wire  _T_43;
  wire [31:0] _T_45;
  wire  _T_47;
  wire [31:0] _T_49;
  wire  _T_51;
  wire  _T_54;
  wire [31:0] _T_56;
  wire  _T_58;
  wire  _T_61;
  wire [31:0] _T_63;
  wire  _T_65;
  wire [1:0] _T_68;
  wire [1:0] _T_69;
  wire [2:0] _T_70;
  wire [4:0] decoder_0;
  wire [31:0] _T_73;
  wire  _T_75;
  wire [31:0] _T_77;
  wire  _T_79;
  wire [31:0] _T_81;
  wire  _T_83;
  wire  _T_86;
  wire  decoder_2;
  wire [31:0] _T_88;
  wire  _T_90;
  wire [31:0] _T_92;
  wire  _T_94;
  wire [31:0] _T_96;
  wire  _T_98;
  wire  _T_101;
  wire  decoder_3;
  wire [31:0] _T_103;
  wire  _T_105;
  wire [31:0] _T_107;
  wire  _T_109;
  wire  _T_112;
  wire  decoder_4;
  wire [31:0] _T_115;
  wire  _T_117;
  wire  decoder_6;
  wire [31:0] _T_121;
  wire  _T_123;
  wire [31:0] _T_126;
  wire  _T_128;
  wire [31:0] _T_130;
  wire  _T_132;
  wire  decoder_8;
  wire [31:0] _T_136;
  wire  _T_138;
  wire  _T_143;
  wire  decoder_10;
  wire [31:0] _T_147;
  wire  _T_149;
  wire [31:0] _T_151;
  wire  _T_153;
  wire  decoder_11;
  wire [31:0] _T_157;
  wire  _T_159;
  wire [31:0] _T_161;
  wire  _T_163;
  wire  _T_166;
  wire  decoder_12;
  wire [31:0] _T_168;
  wire  _T_170;
  wire  _T_175;
  wire [31:0] _T_178;
  wire  _T_180;
  wire [31:0] _T_182;
  wire  _T_184;
  wire  _T_187;
  wire  decoder_15;
  wire [31:0] _T_189;
  wire  _T_191;
  wire [31:0] _T_193;
  wire  _T_195;
  wire  _T_199;
  wire  decoder_16;
  assign io_sigs_cmd = decoder_0;
  assign io_sigs_ldst = _T_47;
  assign io_sigs_wen = decoder_2;
  assign io_sigs_ren1 = decoder_3;
  assign io_sigs_ren2 = decoder_4;
  assign io_sigs_ren3 = _T_98;
  assign io_sigs_swap12 = decoder_6;
  assign io_sigs_swap23 = _T_123;
  assign io_sigs_single = decoder_8;
  assign io_sigs_fromint = _T_138;
  assign io_sigs_toint = decoder_10;
  assign io_sigs_fastpipe = decoder_11;
  assign io_sigs_fma = decoder_12;
  assign io_sigs_div = _T_170;
  assign io_sigs_sqrt = _T_175;
  assign io_sigs_round = decoder_15;
  assign io_sigs_wflags = decoder_16;
  assign _T_23 = io_inst & 32'h4;
  assign _T_25 = _T_23 == 32'h4;
  assign _T_27 = io_inst & 32'h8000010;
  assign _T_29 = _T_27 == 32'h8000010;
  assign _T_32 = _T_25 | _T_29;
  assign _T_34 = io_inst & 32'h8;
  assign _T_36 = _T_34 == 32'h8;
  assign _T_38 = io_inst & 32'h10000010;
  assign _T_40 = _T_38 == 32'h10000010;
  assign _T_43 = _T_36 | _T_40;
  assign _T_45 = io_inst & 32'h40;
  assign _T_47 = _T_45 == 32'h0;
  assign _T_49 = io_inst & 32'h20000000;
  assign _T_51 = _T_49 == 32'h20000000;
  assign _T_54 = _T_47 | _T_51;
  assign _T_56 = io_inst & 32'h40000000;
  assign _T_58 = _T_56 == 32'h40000000;
  assign _T_61 = _T_47 | _T_58;
  assign _T_63 = io_inst & 32'h10;
  assign _T_65 = _T_63 == 32'h0;
  assign _T_68 = {_T_43,_T_32};
  assign _T_69 = {_T_65,_T_61};
  assign _T_70 = {_T_69,_T_54};
  assign decoder_0 = {_T_70,_T_68};
  assign _T_73 = io_inst & 32'h80000020;
  assign _T_75 = _T_73 == 32'h0;
  assign _T_77 = io_inst & 32'h30;
  assign _T_79 = _T_77 == 32'h0;
  assign _T_81 = io_inst & 32'h10000020;
  assign _T_83 = _T_81 == 32'h10000000;
  assign _T_86 = _T_75 | _T_79;
  assign decoder_2 = _T_86 | _T_83;
  assign _T_88 = io_inst & 32'h80000004;
  assign _T_90 = _T_88 == 32'h0;
  assign _T_92 = io_inst & 32'h10000004;
  assign _T_94 = _T_92 == 32'h0;
  assign _T_96 = io_inst & 32'h50;
  assign _T_98 = _T_96 == 32'h40;
  assign _T_101 = _T_90 | _T_94;
  assign decoder_3 = _T_101 | _T_98;
  assign _T_103 = io_inst & 32'h40000004;
  assign _T_105 = _T_103 == 32'h0;
  assign _T_107 = io_inst & 32'h20;
  assign _T_109 = _T_107 == 32'h20;
  assign _T_112 = _T_105 | _T_109;
  assign decoder_4 = _T_112 | _T_98;
  assign _T_115 = io_inst & 32'h50000010;
  assign _T_117 = _T_115 == 32'h50000010;
  assign decoder_6 = _T_47 | _T_117;
  assign _T_121 = io_inst & 32'h30000010;
  assign _T_123 = _T_121 == 32'h10;
  assign _T_126 = io_inst & 32'h1040;
  assign _T_128 = _T_126 == 32'h0;
  assign _T_130 = io_inst & 32'h2000040;
  assign _T_132 = _T_130 == 32'h40;
  assign decoder_8 = _T_128 | _T_132;
  assign _T_136 = io_inst & 32'h90000010;
  assign _T_138 = _T_136 == 32'h90000010;
  assign _T_143 = _T_136 == 32'h80000010;
  assign decoder_10 = _T_109 | _T_143;
  assign _T_147 = io_inst & 32'ha0000010;
  assign _T_149 = _T_147 == 32'h20000010;
  assign _T_151 = io_inst & 32'hd0000010;
  assign _T_153 = _T_151 == 32'h40000010;
  assign decoder_11 = _T_149 | _T_153;
  assign _T_157 = io_inst & 32'h70000004;
  assign _T_159 = _T_157 == 32'h0;
  assign _T_161 = io_inst & 32'h68000004;
  assign _T_163 = _T_161 == 32'h0;
  assign _T_166 = _T_159 | _T_163;
  assign decoder_12 = _T_166 | _T_98;
  assign _T_168 = io_inst & 32'h58000010;
  assign _T_170 = _T_168 == 32'h18000010;
  assign _T_175 = _T_151 == 32'h50000010;
  assign _T_178 = io_inst & 32'h20000004;
  assign _T_180 = _T_178 == 32'h0;
  assign _T_182 = io_inst & 32'h40002000;
  assign _T_184 = _T_182 == 32'h40000000;
  assign _T_187 = _T_180 | _T_98;
  assign decoder_15 = _T_187 | _T_184;
  assign _T_189 = io_inst & 32'h8002000;
  assign _T_191 = _T_189 == 32'h8000000;
  assign _T_193 = io_inst & 32'hc0000004;
  assign _T_195 = _T_193 == 32'h80000000;
  assign _T_199 = _T_187 | _T_191;
  assign decoder_16 = _T_199 | _T_195;
endmodule