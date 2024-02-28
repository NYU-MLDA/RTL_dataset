module IMul(
  input   clock,
  input   reset,
  input   io_valid,
  input  [3:0] io_fn,
  input   io_dw,
  input  [63:0] io_in0,
  input  [63:0] io_in1,
  output [63:0] io_out
);
  wire  _T_16;
  wire  _T_17;
  wire  _T_20;
  wire  _T_21;
  wire  sxl64;
  wire  _T_26;
  wire  _T_27;
  wire  zxl32;
  wire  _T_35;
  wire  zxr32;
  wire  _T_39;
  wire  sxl32;
  wire  _T_47;
  wire  _T_48;
  wire  _T_49;
  wire [31:0] _T_53;
  wire [31:0] _T_54;
  wire [31:0] _T_55;
  wire  _T_56;
  wire  _T_57;
  wire [31:0] _T_61;
  wire [31:0] _T_62;
  wire [31:0] _T_63;
  wire [32:0] _T_64;
  wire [64:0] lhs;
  wire  _T_65;
  wire  _T_66;
  wire  _T_67;
  wire [31:0] _T_71;
  wire [31:0] _T_72;
  wire [31:0] _T_73;
  wire  _T_74;
  wire  _T_75;
  wire [31:0] _T_79;
  wire [31:0] _T_80;
  wire [31:0] _T_81;
  wire [32:0] _T_82;
  wire [64:0] rhs;
  wire [64:0] _T_83;
  wire [64:0] _T_84;
  wire [129:0] mul_result;
  wire  _T_88;
  wire  _T_89;
  wire [63:0] _T_90;
  wire [63:0] _T_95;
  wire  _T_99;
  wire  _T_109;
  wire  _T_110;
  wire [31:0] _T_114;
  wire [31:0] _T_115;
  wire [63:0] _T_116;
  wire  _T_121;
  wire [31:0] _T_125;
  wire [31:0] _T_126;
  wire [63:0] _T_127;
  wire [63:0] _T_150;
  wire [63:0] _T_151;
  wire [63:0] _T_152;
  wire [63:0] _T_153;
  wire [63:0] _T_154;
  wire [63:0] _T_155;
  wire [63:0] _T_156;
  wire [63:0] mul_output_mux;
  reg  _T_159;
  reg [31:0] _GEN_3;
  reg [63:0] _T_161;
  reg [63:0] _GEN_4;
  wire [63:0] _GEN_0;
  reg  _T_164;
  reg [31:0] _GEN_5;
  reg [63:0] _T_166;
  reg [63:0] _GEN_6;
  wire [63:0] _GEN_1;
  reg  _T_169;
  reg [31:0] _GEN_7;
  reg [63:0] _T_171;
  reg [63:0] _GEN_8;
  wire [63:0] _GEN_2;
  wire  _T_177_valid;
  wire [63:0] _T_177_bits;
  assign io_out = _T_177_bits;
  assign _T_16 = io_fn == 4'h1;
  assign _T_17 = io_dw & _T_16;
  assign _T_20 = io_fn == 4'hc;
  assign _T_21 = io_dw & _T_20;
  assign sxl64 = _T_17 | _T_21;
  assign _T_26 = io_dw == 1'h0;
  assign _T_27 = io_fn == 4'he;
  assign zxl32 = _T_26 & _T_27;
  assign _T_35 = _T_26 & _T_20;
  assign zxr32 = zxl32 | _T_35;
  assign _T_39 = _T_26 & _T_16;
  assign sxl32 = _T_39 | _T_35;
  assign _T_47 = io_in0[63];
  assign _T_48 = _T_47 & sxl64;
  assign _T_49 = ~ zxl32;
  assign _T_53 = _T_49 ? 32'hffffffff : 32'h0;
  assign _T_54 = io_in0[63:32];
  assign _T_55 = _T_53 & _T_54;
  assign _T_56 = io_in0[31];
  assign _T_57 = sxl32 & _T_56;
  assign _T_61 = _T_57 ? 32'hffffffff : 32'h0;
  assign _T_62 = _T_55 | _T_61;
  assign _T_63 = io_in0[31:0];
  assign _T_64 = {_T_48,_T_62};
  assign lhs = {_T_64,_T_63};
  assign _T_65 = io_in1[63];
  assign _T_66 = _T_65 & _T_17;
  assign _T_67 = ~ zxr32;
  assign _T_71 = _T_67 ? 32'hffffffff : 32'h0;
  assign _T_72 = io_in1[63:32];
  assign _T_73 = _T_71 & _T_72;
  assign _T_74 = io_in1[31];
  assign _T_75 = _T_39 & _T_74;
  assign _T_79 = _T_75 ? 32'hffffffff : 32'h0;
  assign _T_80 = _T_73 | _T_79;
  assign _T_81 = io_in1[31:0];
  assign _T_82 = {_T_66,_T_80};
  assign rhs = {_T_82,_T_81};
  assign _T_83 = $signed(lhs);
  assign _T_84 = $signed(rhs);
  assign mul_result = $signed(_T_83) * $signed(_T_84);
  assign _T_88 = io_fn == 4'h0;
  assign _T_89 = io_dw & _T_88;
  assign _T_90 = mul_result[63:0];
  assign _T_95 = mul_result[127:64];
  assign _T_99 = io_dw & _T_27;
  assign _T_109 = _T_26 & _T_88;
  assign _T_110 = mul_result[31];
  assign _T_114 = _T_110 ? 32'hffffffff : 32'h0;
  assign _T_115 = mul_result[31:0];
  assign _T_116 = {_T_114,_T_115};
  assign _T_121 = mul_result[63];
  assign _T_125 = _T_121 ? 32'hffffffff : 32'h0;
  assign _T_126 = mul_result[63:32];
  assign _T_127 = {_T_125,_T_126};
  assign _T_150 = _T_35 ? _T_127 : 64'h0;
  assign _T_151 = zxl32 ? _T_127 : _T_150;
  assign _T_152 = _T_39 ? _T_127 : _T_151;
  assign _T_153 = _T_109 ? _T_116 : _T_152;
  assign _T_154 = _T_21 ? _T_95 : _T_153;
  assign _T_155 = _T_99 ? _T_95 : _T_154;
  assign _T_156 = _T_17 ? _T_95 : _T_155;
  assign mul_output_mux = _T_89 ? _T_90 : _T_156;
  assign _GEN_0 = io_valid ? mul_output_mux : _T_161;
  assign _GEN_1 = _T_159 ? _T_161 : _T_166;
  assign _GEN_2 = _T_164 ? _T_166 : _T_171;
  assign _T_177_valid = _T_169;
  assign _T_177_bits = _T_171;
`ifdef RANDOMIZE
  integer initvar;
  initial begin
    `ifndef verilator
      #0.002 begin end
    `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_3 = {1{$random}};
  _T_159 = _GEN_3[0:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_4 = {2{$random}};
  _T_161 = _GEN_4[63:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_5 = {1{$random}};
  _T_164 = _GEN_5[0:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_6 = {2{$random}};
  _T_166 = _GEN_6[63:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_7 = {1{$random}};
  _T_169 = _GEN_7[0:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_8 = {2{$random}};
  _T_171 = _GEN_8[63:0];
  `endif
  end
`endif
  always @(posedge clock) begin
    if (reset) begin
      _T_159 <= 1'h0;
    end else begin
      _T_159 <= io_valid;
    end
    if (io_valid) begin
      if (_T_89) begin
        _T_161 <= _T_90;
      end else begin
        if (_T_17) begin
          _T_161 <= _T_95;
        end else begin
          if (_T_99) begin
            _T_161 <= _T_95;
          end else begin
            if (_T_21) begin
              _T_161 <= _T_95;
            end else begin
              if (_T_109) begin
                _T_161 <= _T_116;
              end else begin
                if (_T_39) begin
                  _T_161 <= _T_127;
                end else begin
                  if (zxl32) begin
                    _T_161 <= _T_127;
                  end else begin
                    if (_T_35) begin
                      _T_161 <= _T_127;
                    end else begin
                      _T_161 <= 64'h0;
                    end
                  end
                end
              end
            end
          end
        end
      end
    end
    if (reset) begin
      _T_164 <= 1'h0;
    end else begin
      _T_164 <= _T_159;
    end
    if (_T_159) begin
      _T_166 <= _T_161;
    end
    if (reset) begin
      _T_169 <= 1'h0;
    end else begin
      _T_169 <= _T_164;
    end
    if (_T_164) begin
      _T_171 <= _T_166;
    end
  end
endmodule