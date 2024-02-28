module WritebackUnit(
  input   clock,
  input   reset,
  output  io_req_ready,
  input   io_req_valid,
  input  [19:0] io_req_bits_tag,
  input  [5:0] io_req_bits_idx,
  input  [1:0] io_req_bits_source,
  input  [2:0] io_req_bits_param,
  input  [3:0] io_req_bits_way_en,
  input   io_req_bits_voluntary,
  input   io_meta_read_ready,
  output  io_meta_read_valid,
  output [5:0] io_meta_read_bits_idx,
  output [3:0] io_meta_read_bits_way_en,
  output [19:0] io_meta_read_bits_tag,
  input   io_data_req_ready,
  output  io_data_req_valid,
  output [3:0] io_data_req_bits_way_en,
  output [11:0] io_data_req_bits_addr,
  input  [127:0] io_data_resp,
  input   io_release_ready,
  output  io_release_valid,
  output [2:0] io_release_bits_opcode,
  output [2:0] io_release_bits_param,
  output [3:0] io_release_bits_size,
  output [1:0] io_release_bits_source,
  output [31:0] io_release_bits_address,
  output [127:0] io_release_bits_data,
  output  io_release_bits_error
);
  reg [19:0] req_tag;
  reg [31:0] _GEN_7;
  reg [5:0] req_idx;
  reg [31:0] _GEN_28;
  reg [1:0] req_source;
  reg [31:0] _GEN_29;
  reg [2:0] req_param;
  reg [31:0] _GEN_30;
  reg [3:0] req_way_en;
  reg [31:0] _GEN_31;
  reg  req_voluntary;
  reg [31:0] _GEN_32;
  reg  active;
  reg [31:0] _GEN_33;
  reg  r1_data_req_fired;
  reg [31:0] _GEN_34;
  reg  r2_data_req_fired;
  reg [31:0] _GEN_35;
  reg [2:0] data_req_cnt;
  reg [31:0] _GEN_36;
  wire  _T_126;
  wire [22:0] _T_129;
  wire [7:0] _T_130;
  wire [7:0] _T_131;
  wire [3:0] _T_132;
  wire  _T_133;
  wire [3:0] _T_135;
  reg [3:0] _T_137;
  reg [31:0] _GEN_37;
  wire [4:0] _T_139;
  wire [3:0] _T_140;
  wire  _T_142;
  wire [3:0] _T_148;
  wire [3:0] _GEN_0;
  wire  _T_151;
  wire  _T_152;
  wire  _T_153;
  wire [3:0] _T_156;
  wire [2:0] _T_157;
  wire [2:0] _GEN_2;
  wire  _T_160;
  wire [1:0] _T_167;
  wire [2:0] _GEN_25;
  wire [3:0] _T_168;
  wire [2:0] _T_169;
  wire  _GEN_3;
  wire  _GEN_4;
  wire [2:0] _GEN_5;
  wire  _T_171;
  wire  _T_173;
  wire  _T_176;
  wire  _GEN_6;
  wire  _GEN_8;
  wire  _GEN_9;
  wire [2:0] _GEN_10;
  wire  _GEN_11;
  wire  _GEN_12;
  wire  _GEN_13;
  wire [2:0] _GEN_14;
  wire  _GEN_15;
  wire  _GEN_16;
  wire  _T_177;
  wire  _GEN_17;
  wire [2:0] _GEN_18;
  wire [19:0] _GEN_19;
  wire [5:0] _GEN_20;
  wire [1:0] _GEN_21;
  wire [2:0] _GEN_22;
  wire [3:0] _GEN_23;
  wire  _GEN_24;
  wire  _T_181;
  wire  fire;
  wire [1:0] _T_184;
  wire [7:0] _T_185;
  wire [11:0] _GEN_26;
  wire [11:0] _T_186;
  wire [25:0] _T_187;
  wire [31:0] _GEN_27;
  wire [31:0] r_address;
  wire [2:0] probeResponse_opcode;
  wire [2:0] probeResponse_param;
  wire [3:0] probeResponse_size;
  wire [1:0] probeResponse_source;
  wire [31:0] probeResponse_address;
  wire [127:0] probeResponse_data;
  wire  probeResponse_error;
  wire [31:0] _T_208;
  wire [32:0] _T_209;
  wire [32:0] _T_211;
  wire [32:0] _T_212;
  wire  _T_214;
  wire [31:0] _T_216;
  wire [32:0] _T_217;
  wire [32:0] _T_219;
  wire [32:0] _T_220;
  wire  _T_222;
  wire [32:0] _T_225;
  wire [32:0] _T_227;
  wire [32:0] _T_228;
  wire  _T_230;
  wire [31:0] _T_232;
  wire [32:0] _T_233;
  wire [32:0] _T_235;
  wire [32:0] _T_236;
  wire  _T_238;
  wire [31:0] _T_240;
  wire [32:0] _T_241;
  wire [32:0] _T_243;
  wire [32:0] _T_244;
  wire  _T_246;
  wire [31:0] _T_248;
  wire [32:0] _T_249;
  wire [32:0] _T_251;
  wire [32:0] _T_252;
  wire  _T_254;
  wire [31:0] _T_256;
  wire [32:0] _T_257;
  wire [32:0] _T_259;
  wire [32:0] _T_260;
  wire  _T_262;
  wire  _T_273_0;
  wire  _T_273_1;
  wire  _T_273_2;
  wire  _T_273_3;
  wire  _T_273_4;
  wire  _T_273_5;
  wire  _T_273_6;
  wire  _T_323;
  wire  _T_326;
  wire [2:0] voluntaryRelease_opcode;
  wire [2:0] voluntaryRelease_param;
  wire [3:0] voluntaryRelease_size;
  wire [1:0] voluntaryRelease_source;
  wire [31:0] voluntaryRelease_address;
  wire [127:0] voluntaryRelease_data;
  wire  voluntaryRelease_error;
  wire [2:0] _T_344_opcode;
  wire [2:0] _T_344_param;
  wire [3:0] _T_344_size;
  wire [1:0] _T_344_source;
  wire [31:0] _T_344_address;
  wire [127:0] _T_344_data;
  wire  _T_344_error;
  reg [3:0] _GEN_1;
  reg [31:0] _GEN_38;
  assign io_req_ready = _T_181;
  assign io_meta_read_valid = fire;
  assign io_meta_read_bits_idx = req_idx;
  assign io_meta_read_bits_way_en = _GEN_1;
  assign io_meta_read_bits_tag = req_tag;
  assign io_data_req_valid = fire;
  assign io_data_req_bits_way_en = req_way_en;
  assign io_data_req_bits_addr = _T_186;
  assign io_release_valid = _GEN_15;
  assign io_release_bits_opcode = _T_344_opcode;
  assign io_release_bits_param = _T_344_param;
  assign io_release_bits_size = _T_344_size;
  assign io_release_bits_source = _T_344_source;
  assign io_release_bits_address = _T_344_address;
  assign io_release_bits_data = _T_344_data;
  assign io_release_bits_error = _T_344_error;
  assign _T_126 = io_release_ready & io_release_valid;
  assign _T_129 = 23'hff << io_release_bits_size;
  assign _T_130 = _T_129[7:0];
  assign _T_131 = ~ _T_130;
  assign _T_132 = _T_131[7:4];
  assign _T_133 = io_release_bits_opcode[0];
  assign _T_135 = _T_133 ? _T_132 : 4'h0;
  assign _T_139 = _T_137 - 4'h1;
  assign _T_140 = _T_139[3:0];
  assign _T_142 = _T_137 == 4'h0;
  assign _T_148 = _T_142 ? _T_135 : _T_140;
  assign _GEN_0 = _T_126 ? _T_148 : _T_137;
  assign _T_151 = io_data_req_ready & io_data_req_valid;
  assign _T_152 = io_meta_read_ready & io_meta_read_valid;
  assign _T_153 = _T_151 & _T_152;
  assign _T_156 = data_req_cnt + 3'h1;
  assign _T_157 = _T_156[2:0];
  assign _GEN_2 = _T_153 ? _T_157 : data_req_cnt;
  assign _T_160 = io_release_ready == 1'h0;
  assign _T_167 = r1_data_req_fired ? 2'h2 : 2'h1;
  assign _GEN_25 = {{1'd0}, _T_167};
  assign _T_168 = data_req_cnt - _GEN_25;
  assign _T_169 = _T_168[2:0];
  assign _GEN_3 = _T_160 ? 1'h0 : _T_153;
  assign _GEN_4 = _T_160 ? 1'h0 : r1_data_req_fired;
  assign _GEN_5 = _T_160 ? _T_169 : _GEN_2;
  assign _T_171 = r1_data_req_fired == 1'h0;
  assign _T_173 = data_req_cnt < 3'h4;
  assign _T_176 = _T_173 | _T_160;
  assign _GEN_6 = _T_171 ? _T_176 : active;
  assign _GEN_8 = r2_data_req_fired ? _GEN_3 : _T_153;
  assign _GEN_9 = r2_data_req_fired ? _GEN_4 : r1_data_req_fired;
  assign _GEN_10 = r2_data_req_fired ? _GEN_5 : _GEN_2;
  assign _GEN_11 = r2_data_req_fired ? _GEN_6 : active;
  assign _GEN_12 = active ? _GEN_8 : r1_data_req_fired;
  assign _GEN_13 = active ? _GEN_9 : r2_data_req_fired;
  assign _GEN_14 = active ? _GEN_10 : data_req_cnt;
  assign _GEN_15 = active ? r2_data_req_fired : 1'h0;
  assign _GEN_16 = active ? _GEN_11 : active;
  assign _T_177 = io_req_ready & io_req_valid;
  assign _GEN_17 = _T_177 ? 1'h1 : _GEN_16;
  assign _GEN_18 = _T_177 ? 3'h0 : _GEN_14;
  assign _GEN_19 = _T_177 ? io_req_bits_tag : req_tag;
  assign _GEN_20 = _T_177 ? io_req_bits_idx : req_idx;
  assign _GEN_21 = _T_177 ? io_req_bits_source : req_source;
  assign _GEN_22 = _T_177 ? io_req_bits_param : req_param;
  assign _GEN_23 = _T_177 ? io_req_bits_way_en : req_way_en;
  assign _GEN_24 = _T_177 ? io_req_bits_voluntary : req_voluntary;
  assign _T_181 = active == 1'h0;
  assign fire = active & _T_173;
  assign _T_184 = data_req_cnt[1:0];
  assign _T_185 = {req_idx,_T_184};
  assign _GEN_26 = {{4'd0}, _T_185};
  assign _T_186 = _GEN_26 << 4;
  assign _T_187 = {req_tag,req_idx};
  assign _GEN_27 = {{6'd0}, _T_187};
  assign r_address = _GEN_27 << 6;
  assign probeResponse_opcode = 3'h5;
  assign probeResponse_param = req_param;
  assign probeResponse_size = 4'h6;
  assign probeResponse_source = req_source;
  assign probeResponse_address = r_address;
  assign probeResponse_data = io_data_resp;
  assign probeResponse_error = 1'h0;
  assign _T_208 = r_address ^ 32'hc000000;
  assign _T_209 = {1'b0,$signed(_T_208)};
  assign _T_211 = $signed(_T_209) & $signed(33'shac000000);
  assign _T_212 = $signed(_T_211);
  assign _T_214 = $signed(_T_212) == $signed(33'sh0);
  assign _T_216 = r_address ^ 32'h20000000;
  assign _T_217 = {1'b0,$signed(_T_216)};
  assign _T_219 = $signed(_T_217) & $signed(33'sha0000000);
  assign _T_220 = $signed(_T_219);
  assign _T_222 = $signed(_T_220) == $signed(33'sh0);
  assign _T_225 = {1'b0,$signed(r_address)};
  assign _T_227 = $signed(_T_225) & $signed(33'shafff1000);
  assign _T_228 = $signed(_T_227);
  assign _T_230 = $signed(_T_228) == $signed(33'sh0);
  assign _T_232 = r_address ^ 32'h80000000;
  assign _T_233 = {1'b0,$signed(_T_232)};
  assign _T_235 = $signed(_T_233) & $signed(33'sha0000000);
  assign _T_236 = $signed(_T_235);
  assign _T_238 = $signed(_T_236) == $signed(33'sh0);
  assign _T_240 = r_address ^ 32'ha000000;
  assign _T_241 = {1'b0,$signed(_T_240)};
  assign _T_243 = $signed(_T_241) & $signed(33'shae000000);
  assign _T_244 = $signed(_T_243);
  assign _T_246 = $signed(_T_244) == $signed(33'sh0);
  assign _T_248 = r_address ^ 32'h2000000;
  assign _T_249 = {1'b0,$signed(_T_248)};
  assign _T_251 = $signed(_T_249) & $signed(33'shafff0000);
  assign _T_252 = $signed(_T_251);
  assign _T_254 = $signed(_T_252) == $signed(33'sh0);
  assign _T_256 = r_address ^ 32'h1000;
  assign _T_257 = {1'b0,$signed(_T_256)};
  assign _T_259 = $signed(_T_257) & $signed(33'shafff1000);
  assign _T_260 = $signed(_T_259);
  assign _T_262 = $signed(_T_260) == $signed(33'sh0);
  assign _T_273_0 = _T_214;
  assign _T_273_1 = _T_222;
  assign _T_273_2 = _T_230;
  assign _T_273_3 = _T_238;
  assign _T_273_4 = _T_246;
  assign _T_273_5 = _T_254;
  assign _T_273_6 = _T_262;
  assign _T_323 = _T_273_3 | _T_273_4;
  assign _T_326 = _T_323;
  assign voluntaryRelease_opcode = 3'h7;
  assign voluntaryRelease_param = req_param;
  assign voluntaryRelease_size = 4'h6;
  assign voluntaryRelease_source = req_source;
  assign voluntaryRelease_address = r_address;
  assign voluntaryRelease_data = io_data_resp;
  assign voluntaryRelease_error = 1'h0;
  assign _T_344_opcode = req_voluntary ? voluntaryRelease_opcode : probeResponse_opcode;
  assign _T_344_param = req_voluntary ? voluntaryRelease_param : probeResponse_param;
  assign _T_344_size = req_voluntary ? voluntaryRelease_size : probeResponse_size;
  assign _T_344_source = req_voluntary ? voluntaryRelease_source : probeResponse_source;
  assign _T_344_address = req_voluntary ? voluntaryRelease_address : probeResponse_address;
  assign _T_344_data = req_voluntary ? voluntaryRelease_data : probeResponse_data;
  assign _T_344_error = req_voluntary ? voluntaryRelease_error : probeResponse_error;
`ifdef RANDOMIZE
  integer initvar;
  initial begin
    `ifndef verilator
      #0.002 begin end
    `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_7 = {1{$random}};
  req_tag = _GEN_7[19:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_28 = {1{$random}};
  req_idx = _GEN_28[5:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_29 = {1{$random}};
  req_source = _GEN_29[1:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_30 = {1{$random}};
  req_param = _GEN_30[2:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_31 = {1{$random}};
  req_way_en = _GEN_31[3:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_32 = {1{$random}};
  req_voluntary = _GEN_32[0:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_33 = {1{$random}};
  active = _GEN_33[0:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_34 = {1{$random}};
  r1_data_req_fired = _GEN_34[0:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_35 = {1{$random}};
  r2_data_req_fired = _GEN_35[0:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_36 = {1{$random}};
  data_req_cnt = _GEN_36[2:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_37 = {1{$random}};
  _T_137 = _GEN_37[3:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_38 = {1{$random}};
  _GEN_1 = _GEN_38[3:0];
  `endif
  end
`endif
  always @(posedge clock) begin
    if (_T_177) begin
      req_tag <= io_req_bits_tag;
    end
    if (_T_177) begin
      req_idx <= io_req_bits_idx;
    end
    if (_T_177) begin
      req_source <= io_req_bits_source;
    end
    if (_T_177) begin
      req_param <= io_req_bits_param;
    end
    if (_T_177) begin
      req_way_en <= io_req_bits_way_en;
    end
    if (_T_177) begin
      req_voluntary <= io_req_bits_voluntary;
    end
    if (reset) begin
      active <= 1'h0;
    end else begin
      if (_T_177) begin
        active <= 1'h1;
      end else begin
        if (active) begin
          if (r2_data_req_fired) begin
            if (_T_171) begin
              active <= _T_176;
            end
          end
        end
      end
    end
    if (reset) begin
      r1_data_req_fired <= 1'h0;
    end else begin
      if (active) begin
        if (r2_data_req_fired) begin
          if (_T_160) begin
            r1_data_req_fired <= 1'h0;
          end else begin
            r1_data_req_fired <= _T_153;
          end
        end else begin
          r1_data_req_fired <= _T_153;
        end
      end
    end
    if (reset) begin
      r2_data_req_fired <= 1'h0;
    end else begin
      if (active) begin
        if (r2_data_req_fired) begin
          if (_T_160) begin
            r2_data_req_fired <= 1'h0;
          end else begin
            r2_data_req_fired <= r1_data_req_fired;
          end
        end else begin
          r2_data_req_fired <= r1_data_req_fired;
        end
      end
    end
    if (reset) begin
      data_req_cnt <= 3'h0;
    end else begin
      if (_T_177) begin
        data_req_cnt <= 3'h0;
      end else begin
        if (active) begin
          if (r2_data_req_fired) begin
            if (_T_160) begin
              data_req_cnt <= _T_169;
            end else begin
              if (_T_153) begin
                data_req_cnt <= _T_157;
              end
            end
          end else begin
            if (_T_153) begin
              data_req_cnt <= _T_157;
            end
          end
        end
      end
    end
    if (reset) begin
      _T_137 <= 4'h0;
    end else begin
      if (_T_126) begin
        if (_T_142) begin
          if (_T_133) begin
            _T_137 <= _T_132;
          end else begin
            _T_137 <= 4'h0;
          end
        end else begin
          _T_137 <= _T_140;
        end
      end
    end
  end
endmodule