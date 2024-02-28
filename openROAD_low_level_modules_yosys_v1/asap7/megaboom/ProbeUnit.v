module ProbeUnit(
  input   clock,
  input   reset,
  output  io_req_ready,
  input   io_req_valid,
  input  [2:0] io_req_bits_opcode,
  input  [1:0] io_req_bits_param,
  input  [3:0] io_req_bits_size,
  input  [1:0] io_req_bits_source,
  input  [31:0] io_req_bits_address,
  input  [15:0] io_req_bits_mask,
  input  [127:0] io_req_bits_data,
  input   io_rep_ready,
  output  io_rep_valid,
  output [2:0] io_rep_bits_opcode,
  output [2:0] io_rep_bits_param,
  output [3:0] io_rep_bits_size,
  output [1:0] io_rep_bits_source,
  output [31:0] io_rep_bits_address,
  output [127:0] io_rep_bits_data,
  output  io_rep_bits_error,
  input   io_meta_read_ready,
  output  io_meta_read_valid,
  output [5:0] io_meta_read_bits_idx,
  output [3:0] io_meta_read_bits_way_en,
  output [19:0] io_meta_read_bits_tag,
  input   io_meta_write_ready,
  output  io_meta_write_valid,
  output [5:0] io_meta_write_bits_idx,
  output [3:0] io_meta_write_bits_way_en,
  output [19:0] io_meta_write_bits_tag,
  output [1:0] io_meta_write_bits_data_coh_state,
  output [19:0] io_meta_write_bits_data_tag,
  input   io_wb_req_ready,
  output  io_wb_req_valid,
  output [19:0] io_wb_req_bits_tag,
  output [5:0] io_wb_req_bits_idx,
  output [1:0] io_wb_req_bits_source,
  output [2:0] io_wb_req_bits_param,
  output [3:0] io_wb_req_bits_way_en,
  output  io_wb_req_bits_voluntary,
  input  [3:0] io_way_en,
  input   io_mshr_rdy,
  input  [1:0] io_block_state_state
);
  reg [3:0] state;
  reg [31:0] _GEN_20;
  reg [2:0] req_opcode;
  reg [31:0] _GEN_21;
  reg [1:0] req_param;
  reg [31:0] _GEN_22;
  reg [3:0] req_size;
  reg [31:0] _GEN_23;
  reg [1:0] req_source;
  reg [31:0] _GEN_24;
  reg [31:0] req_address;
  reg [31:0] _GEN_25;
  reg [15:0] req_mask;
  reg [31:0] _GEN_26;
  reg [127:0] req_data;
  reg [127:0] _GEN_27;
  wire [5:0] req_idx;
  wire [19:0] req_tag;
  reg [3:0] way_en;
  reg [31:0] _GEN_28;
  wire  tag_matches;
  reg [1:0] old_coh_state;
  reg [31:0] _GEN_29;
  wire [1:0] miss_coh_state;
  wire [1:0] reply_coh_state;
  wire [3:0] _T_187;
  wire  _T_263;
  wire [2:0] _T_265;
  wire  _T_267;
  wire [2:0] _T_269;
  wire  _T_271;
  wire [2:0] _T_273;
  wire  _T_275;
  wire [2:0] _T_277;
  wire  _T_279;
  wire  _T_280;
  wire [2:0] _T_281;
  wire  _T_283;
  wire  _T_284;
  wire [2:0] _T_285;
  wire [1:0] _T_286;
  wire  _T_287;
  wire  _T_288;
  wire [2:0] _T_289;
  wire [1:0] _T_290;
  wire  _T_291;
  wire  _T_292;
  wire [2:0] _T_293;
  wire [1:0] _T_294;
  wire  _T_295;
  wire  _T_296;
  wire [2:0] _T_297;
  wire [1:0] _T_298;
  wire  _T_299;
  wire  _T_300;
  wire [2:0] _T_301;
  wire [1:0] _T_302;
  wire  _T_303;
  wire  _T_304;
  wire [2:0] _T_305;
  wire [1:0] _T_306;
  wire  _T_307;
  wire  is_dirty;
  wire [2:0] report_param;
  wire [1:0] _T_308;
  wire [1:0] new_coh_state;
  wire  _T_312;
  wire  _T_313;
  wire [2:0] _T_322_opcode;
  wire [2:0] _T_322_param;
  wire [3:0] _T_322_size;
  wire [1:0] _T_322_source;
  wire [31:0] _T_322_address;
  wire [127:0] _T_322_data;
  wire  _T_322_error;
  wire  _T_334;
  wire  _T_335;
  wire  _T_337;
  wire  _T_338;
  wire  _T_339;
  wire  _T_341;
  wire  _T_342;
  wire  _T_343;
  wire  _T_344;
  wire  _T_346;
  wire [3:0] _GEN_0;
  wire [2:0] _GEN_1;
  wire [1:0] _GEN_2;
  wire [3:0] _GEN_3;
  wire [1:0] _GEN_4;
  wire [31:0] _GEN_5;
  wire [15:0] _GEN_6;
  wire [127:0] _GEN_7;
  wire  _T_347;
  wire [3:0] _GEN_8;
  wire  _T_348;
  wire [3:0] _GEN_9;
  wire  _T_349;
  wire [3:0] _T_350;
  wire [1:0] _GEN_10;
  wire [3:0] _GEN_11;
  wire [3:0] _GEN_12;
  wire  _T_351;
  wire  _T_352;
  wire [3:0] _T_353;
  wire [3:0] _GEN_13;
  wire  _T_355;
  wire [3:0] _T_356;
  wire [3:0] _GEN_14;
  wire  _T_357;
  wire [3:0] _GEN_15;
  wire  _T_358;
  wire  _T_359;
  wire [3:0] _GEN_16;
  wire  _T_360;
  wire [3:0] _GEN_17;
  reg [3:0] _GEN_18;
  reg [31:0] _GEN_30;
  reg [19:0] _GEN_19;
  reg [31:0] _GEN_31;
  assign io_req_ready = _T_312;
  assign io_rep_valid = _T_313;
  assign io_rep_bits_opcode = _T_322_opcode;
  assign io_rep_bits_param = _T_322_param;
  assign io_rep_bits_size = _T_322_size;
  assign io_rep_bits_source = _T_322_source;
  assign io_rep_bits_address = _T_322_address;
  assign io_rep_bits_data = _T_322_data;
  assign io_rep_bits_error = _T_322_error;
  assign io_meta_read_valid = _T_342;
  assign io_meta_read_bits_idx = req_idx;
  assign io_meta_read_bits_way_en = _GEN_18;
  assign io_meta_read_bits_tag = req_tag;
  assign io_meta_write_valid = _T_343;
  assign io_meta_write_bits_idx = req_idx;
  assign io_meta_write_bits_way_en = way_en;
  assign io_meta_write_bits_tag = _GEN_19;
  assign io_meta_write_bits_data_coh_state = new_coh_state;
  assign io_meta_write_bits_data_tag = req_tag;
  assign io_wb_req_valid = _T_344;
  assign io_wb_req_bits_tag = req_tag;
  assign io_wb_req_bits_idx = req_idx;
  assign io_wb_req_bits_source = req_source;
  assign io_wb_req_bits_param = report_param;
  assign io_wb_req_bits_way_en = way_en;
  assign io_wb_req_bits_voluntary = 1'h0;
  assign req_idx = req_address[11:6];
  assign req_tag = req_address[31:12];
  assign tag_matches = way_en != 4'h0;
  assign miss_coh_state = 2'h0;
  assign reply_coh_state = tag_matches ? old_coh_state : miss_coh_state;
  assign _T_187 = {req_param,reply_coh_state};
  assign _T_263 = 4'h8 == _T_187;
  assign _T_265 = _T_263 ? 3'h5 : 3'h0;
  assign _T_267 = 4'h9 == _T_187;
  assign _T_269 = _T_267 ? 3'h2 : _T_265;
  assign _T_271 = 4'ha == _T_187;
  assign _T_273 = _T_271 ? 3'h1 : _T_269;
  assign _T_275 = 4'hb == _T_187;
  assign _T_277 = _T_275 ? 3'h1 : _T_273;
  assign _T_279 = 4'h4 == _T_187;
  assign _T_280 = _T_279 ? 1'h0 : _T_275;
  assign _T_281 = _T_279 ? 3'h2 : _T_277;
  assign _T_283 = 4'h5 == _T_187;
  assign _T_284 = _T_283 ? 1'h0 : _T_280;
  assign _T_285 = _T_283 ? 3'h4 : _T_281;
  assign _T_286 = _T_283 ? 2'h1 : 2'h0;
  assign _T_287 = 4'h6 == _T_187;
  assign _T_288 = _T_287 ? 1'h0 : _T_284;
  assign _T_289 = _T_287 ? 3'h0 : _T_285;
  assign _T_290 = _T_287 ? 2'h1 : _T_286;
  assign _T_291 = 4'h7 == _T_187;
  assign _T_292 = _T_291 ? 1'h1 : _T_288;
  assign _T_293 = _T_291 ? 3'h0 : _T_289;
  assign _T_294 = _T_291 ? 2'h1 : _T_290;
  assign _T_295 = 4'h0 == _T_187;
  assign _T_296 = _T_295 ? 1'h0 : _T_292;
  assign _T_297 = _T_295 ? 3'h5 : _T_293;
  assign _T_298 = _T_295 ? 2'h0 : _T_294;
  assign _T_299 = 4'h1 == _T_187;
  assign _T_300 = _T_299 ? 1'h0 : _T_296;
  assign _T_301 = _T_299 ? 3'h4 : _T_297;
  assign _T_302 = _T_299 ? 2'h1 : _T_298;
  assign _T_303 = 4'h2 == _T_187;
  assign _T_304 = _T_303 ? 1'h0 : _T_300;
  assign _T_305 = _T_303 ? 3'h3 : _T_301;
  assign _T_306 = _T_303 ? 2'h2 : _T_302;
  assign _T_307 = 4'h3 == _T_187;
  assign is_dirty = _T_307 ? 1'h1 : _T_304;
  assign report_param = _T_307 ? 3'h3 : _T_305;
  assign _T_308 = _T_307 ? 2'h2 : _T_306;
  assign new_coh_state = _T_308;
  assign _T_312 = state == 4'h0;
  assign _T_313 = state == 4'h5;
  assign _T_322_opcode = 3'h4;
  assign _T_322_param = report_param;
  assign _T_322_size = req_size;
  assign _T_322_source = req_source;
  assign _T_322_address = req_address;
  assign _T_322_data = 128'h0;
  assign _T_322_error = 1'h0;
  assign _T_334 = io_rep_valid == 1'h0;
  assign _T_335 = io_rep_bits_opcode[0];
  assign _T_337 = _T_335 == 1'h0;
  assign _T_338 = _T_334 | _T_337;
  assign _T_339 = _T_338 | reset;
  assign _T_341 = _T_339 == 1'h0;
  assign _T_342 = state == 4'h1;
  assign _T_343 = state == 4'h8;
  assign _T_344 = state == 4'h6;
  assign _T_346 = io_req_ready & io_req_valid;
  assign _GEN_0 = _T_346 ? 4'h1 : state;
  assign _GEN_1 = _T_346 ? io_req_bits_opcode : req_opcode;
  assign _GEN_2 = _T_346 ? io_req_bits_param : req_param;
  assign _GEN_3 = _T_346 ? io_req_bits_size : req_size;
  assign _GEN_4 = _T_346 ? io_req_bits_source : req_source;
  assign _GEN_5 = _T_346 ? io_req_bits_address : req_address;
  assign _GEN_6 = _T_346 ? io_req_bits_mask : req_mask;
  assign _GEN_7 = _T_346 ? io_req_bits_data : req_data;
  assign _T_347 = io_meta_read_ready & io_meta_read_valid;
  assign _GEN_8 = _T_347 ? 4'h2 : _GEN_0;
  assign _T_348 = state == 4'h2;
  assign _GEN_9 = _T_348 ? 4'h3 : _GEN_8;
  assign _T_349 = state == 4'h3;
  assign _T_350 = io_mshr_rdy ? 4'h4 : 4'h1;
  assign _GEN_10 = _T_349 ? io_block_state_state : old_coh_state;
  assign _GEN_11 = _T_349 ? io_way_en : way_en;
  assign _GEN_12 = _T_349 ? _T_350 : _GEN_9;
  assign _T_351 = state == 4'h4;
  assign _T_352 = tag_matches & is_dirty;
  assign _T_353 = _T_352 ? 4'h6 : 4'h5;
  assign _GEN_13 = _T_351 ? _T_353 : _GEN_12;
  assign _T_355 = _T_313 & io_rep_ready;
  assign _T_356 = tag_matches ? 4'h8 : 4'h0;
  assign _GEN_14 = _T_355 ? _T_356 : _GEN_13;
  assign _T_357 = io_wb_req_ready & io_wb_req_valid;
  assign _GEN_15 = _T_357 ? 4'h7 : _GEN_14;
  assign _T_358 = state == 4'h7;
  assign _T_359 = _T_358 & io_wb_req_ready;
  assign _GEN_16 = _T_359 ? 4'h8 : _GEN_15;
  assign _T_360 = io_meta_write_ready & io_meta_write_valid;
  assign _GEN_17 = _T_360 ? 4'h0 : _GEN_16;
`ifdef RANDOMIZE
  integer initvar;
  initial begin
    `ifndef verilator
      #0.002 begin end
    `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_20 = {1{$random}};
  state = _GEN_20[3:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_21 = {1{$random}};
  req_opcode = _GEN_21[2:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_22 = {1{$random}};
  req_param = _GEN_22[1:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_23 = {1{$random}};
  req_size = _GEN_23[3:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_24 = {1{$random}};
  req_source = _GEN_24[1:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_25 = {1{$random}};
  req_address = _GEN_25[31:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_26 = {1{$random}};
  req_mask = _GEN_26[15:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_27 = {4{$random}};
  req_data = _GEN_27[127:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_28 = {1{$random}};
  way_en = _GEN_28[3:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_29 = {1{$random}};
  old_coh_state = _GEN_29[1:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_30 = {1{$random}};
  _GEN_18 = _GEN_30[3:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_31 = {1{$random}};
  _GEN_19 = _GEN_31[19:0];
  `endif
  end
`endif
  always @(posedge clock) begin
    if (reset) begin
      state <= 4'h0;
    end else begin
      if (_T_360) begin
        state <= 4'h0;
      end else begin
        if (_T_359) begin
          state <= 4'h8;
        end else begin
          if (_T_357) begin
            state <= 4'h7;
          end else begin
            if (_T_355) begin
              if (tag_matches) begin
                state <= 4'h8;
              end else begin
                state <= 4'h0;
              end
            end else begin
              if (_T_351) begin
                if (_T_352) begin
                  state <= 4'h6;
                end else begin
                  state <= 4'h5;
                end
              end else begin
                if (_T_349) begin
                  if (io_mshr_rdy) begin
                    state <= 4'h4;
                  end else begin
                    state <= 4'h1;
                  end
                end else begin
                  if (_T_348) begin
                    state <= 4'h3;
                  end else begin
                    if (_T_347) begin
                      state <= 4'h2;
                    end else begin
                      if (_T_346) begin
                        state <= 4'h1;
                      end
                    end
                  end
                end
              end
            end
          end
        end
      end
    end
    if (_T_346) begin
      req_opcode <= io_req_bits_opcode;
    end
    if (_T_346) begin
      req_param <= io_req_bits_param;
    end
    if (_T_346) begin
      req_size <= io_req_bits_size;
    end
    if (_T_346) begin
      req_source <= io_req_bits_source;
    end
    if (_T_346) begin
      req_address <= io_req_bits_address;
    end
    if (_T_346) begin
      req_mask <= io_req_bits_mask;
    end
    if (_T_346) begin
      req_data <= io_req_bits_data;
    end
    if (_T_349) begin
      way_en <= io_way_en;
    end
    if (_T_349) begin
      old_coh_state <= io_block_state_state;
    end
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_341) begin
          $fwrite(32'h80000002,"Assertion failed: ProbeUnit should not send ProbeAcks with data, WritebackUnit should handle it\n    at NBDcache.scala:550 assert(!io.rep.valid || !edge.hasData(io.rep.bits),\n");
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_T_341) begin
          $fatal;
        end
    `ifdef STOP_COND
      end
    `endif
    `endif
  end
endmodule