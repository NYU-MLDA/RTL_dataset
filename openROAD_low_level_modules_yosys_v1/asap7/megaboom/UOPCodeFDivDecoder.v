module UOPCodeFDivDecoder(
  input   clock,
  input   reset,
  input  [8:0] io_uopc,
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
  wire [8:0] _T_32;
  wire  _T_34;
  wire [1:0] _T_39;
  wire [2:0] _T_40;
  wire [4:0] decoder_0;
  wire [8:0] _T_43;
  wire  _T_45;
  wire [8:0] _T_48;
  wire  _T_50;
  assign io_sigs_cmd = decoder_0;
  assign io_sigs_ldst = 1'h0;
  assign io_sigs_wen = 1'h0;
  assign io_sigs_ren1 = 1'h1;
  assign io_sigs_ren2 = _T_45;
  assign io_sigs_ren3 = 1'h0;
  assign io_sigs_swap12 = 1'h0;
  assign io_sigs_swap23 = 1'h0;
  assign io_sigs_single = _T_50;
  assign io_sigs_fromint = 1'h0;
  assign io_sigs_toint = 1'h0;
  assign io_sigs_fastpipe = 1'h0;
  assign io_sigs_fma = 1'h0;
  assign io_sigs_div = _T_45;
  assign io_sigs_sqrt = _T_34;
  assign io_sigs_round = 1'h1;
  assign io_sigs_wflags = 1'h1;
  assign _T_32 = io_uopc & 9'h4;
  assign _T_34 = _T_32 == 9'h0;
  assign _T_39 = {1'h0,_T_34};
  assign _T_40 = {_T_39,1'h0};
  assign decoder_0 = {_T_40,2'h3};
  assign _T_43 = io_uopc & 9'h8;
  assign _T_45 = _T_43 == 9'h0;
  assign _T_48 = io_uopc & 9'h1;
  assign _T_50 = _T_48 == 9'h0;
endmodule