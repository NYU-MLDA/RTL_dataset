module RenameMapTableElement(
  input   clock,
  input   reset,
  output [6:0] io_element,
  input   io_wens_0,
  input   io_wens_1,
  input   io_wens_2,
  input   io_wens_3,
  input  [6:0] io_ren_pdsts_0,
  input  [6:0] io_ren_pdsts_1,
  input  [6:0] io_ren_pdsts_2,
  input  [6:0] io_ren_pdsts_3,
  input   io_ren_br_vals_0,
  input   io_ren_br_vals_1,
  input   io_ren_br_vals_2,
  input   io_ren_br_vals_3,
  input  [2:0] io_ren_br_tags_0,
  input  [2:0] io_ren_br_tags_1,
  input  [2:0] io_ren_br_tags_2,
  input  [2:0] io_ren_br_tags_3,
  input   io_br_mispredict,
  input  [2:0] io_br_mispredict_tag,
  input   io_rollback_wen,
  input  [6:0] io_rollback_stale_pdst,
  input   io_flush_pipeline,
  input   io_commit_wen,
  input  [6:0] io_commit_pdst,
  output [6:0] io_committed_element
);
  reg [6:0] element;
  reg [31:0] _GEN_1;
  reg [6:0] element_br_copies [0:7];
  reg [31:0] _GEN_2;
  wire [6:0] element_br_copies__T_73_data;
  wire [2:0] element_br_copies__T_73_addr;
  wire [6:0] element_br_copies__T_49_data;
  wire [2:0] element_br_copies__T_49_addr;
  wire  element_br_copies__T_49_mask;
  wire  element_br_copies__T_49_en;
  wire [6:0] element_br_copies__T_54_data;
  wire [2:0] element_br_copies__T_54_addr;
  wire  element_br_copies__T_54_mask;
  wire  element_br_copies__T_54_en;
  wire [6:0] element_br_copies__T_60_data;
  wire [2:0] element_br_copies__T_60_addr;
  wire  element_br_copies__T_60_mask;
  wire  element_br_copies__T_60_en;
  wire [6:0] element_br_copies__T_67_data;
  wire [2:0] element_br_copies__T_67_addr;
  wire  element_br_copies__T_67_mask;
  wire  element_br_copies__T_67_en;
  wire [6:0] _T_50;
  wire [6:0] _T_56;
  wire [6:0] _T_63;
  wire [6:0] _T_71;
  wire [6:0] _GEN_19;
  wire  _T_75;
  wire  _T_76;
  wire [6:0] _GEN_20;
  wire  _T_77;
  wire  _T_78;
  wire  _T_79;
  wire  _T_83;
  wire  _T_84;
  wire  _T_85;
  wire [6:0] _T_86;
  wire [6:0] _T_87;
  wire [6:0] _T_88;
  wire [6:0] _GEN_21;
  reg [6:0] _GEN_0;
  reg [31:0] _GEN_3;
  assign io_element = element;
  assign io_committed_element = _GEN_0;
  assign element_br_copies__T_73_addr = io_br_mispredict_tag;
  assign element_br_copies__T_73_data = element_br_copies[element_br_copies__T_73_addr];
  assign element_br_copies__T_49_data = _T_50;
  assign element_br_copies__T_49_addr = io_ren_br_tags_0;
  assign element_br_copies__T_49_mask = io_ren_br_vals_0;
  assign element_br_copies__T_49_en = io_ren_br_vals_0;
  assign element_br_copies__T_54_data = _T_56;
  assign element_br_copies__T_54_addr = io_ren_br_tags_1;
  assign element_br_copies__T_54_mask = io_ren_br_vals_1;
  assign element_br_copies__T_54_en = io_ren_br_vals_1;
  assign element_br_copies__T_60_data = _T_63;
  assign element_br_copies__T_60_addr = io_ren_br_tags_2;
  assign element_br_copies__T_60_mask = io_ren_br_vals_2;
  assign element_br_copies__T_60_en = io_ren_br_vals_2;
  assign element_br_copies__T_67_data = _T_71;
  assign element_br_copies__T_67_addr = io_ren_br_tags_3;
  assign element_br_copies__T_67_mask = io_ren_br_vals_3;
  assign element_br_copies__T_67_en = io_ren_br_vals_3;
  assign _T_50 = io_wens_0 ? io_ren_pdsts_0 : element;
  assign _T_56 = io_wens_1 ? io_ren_pdsts_1 : _T_50;
  assign _T_63 = io_wens_2 ? io_ren_pdsts_2 : _T_56;
  assign _T_71 = io_wens_3 ? io_ren_pdsts_3 : _T_63;
  assign _GEN_19 = io_br_mispredict ? element_br_copies__T_73_data : element;
  assign _T_75 = io_br_mispredict == 1'h0;
  assign _T_76 = _T_75 & io_rollback_wen;
  assign _GEN_20 = _T_76 ? io_rollback_stale_pdst : _GEN_19;
  assign _T_77 = io_wens_0 | io_wens_1;
  assign _T_78 = _T_77 | io_wens_2;
  assign _T_79 = _T_78 | io_wens_3;
  assign _T_83 = io_rollback_wen == 1'h0;
  assign _T_84 = _T_75 & _T_83;
  assign _T_85 = _T_84 & _T_79;
  assign _T_86 = io_wens_1 ? io_ren_pdsts_1 : io_ren_pdsts_0;
  assign _T_87 = io_wens_2 ? io_ren_pdsts_2 : _T_86;
  assign _T_88 = io_wens_3 ? io_ren_pdsts_3 : _T_87;
  assign _GEN_21 = _T_85 ? _T_88 : _GEN_20;
`ifdef RANDOMIZE
  integer initvar;
  initial begin
    `ifndef verilator
      #0.002 begin end
    `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_1 = {1{$random}};
  element = _GEN_1[6:0];
  `endif
  _GEN_2 = {1{$random}};
  `ifdef RANDOMIZE_MEM_INIT
  for (initvar = 0; initvar < 8; initvar = initvar+1)
    element_br_copies[initvar] = _GEN_2[6:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_3 = {1{$random}};
  _GEN_0 = _GEN_3[6:0];
  `endif
  end
`endif
  always @(posedge clock) begin
    if (reset) begin
      element <= 7'h0;
    end else begin
      if (_T_85) begin
        if (io_wens_3) begin
          element <= io_ren_pdsts_3;
        end else begin
          if (io_wens_2) begin
            element <= io_ren_pdsts_2;
          end else begin
            if (io_wens_1) begin
              element <= io_ren_pdsts_1;
            end else begin
              element <= io_ren_pdsts_0;
            end
          end
        end
      end else begin
        if (_T_76) begin
          element <= io_rollback_stale_pdst;
        end else begin
          if (io_br_mispredict) begin
            element <= element_br_copies__T_73_data;
          end
        end
      end
    end
    if(element_br_copies__T_49_en & element_br_copies__T_49_mask) begin
      element_br_copies[element_br_copies__T_49_addr] <= element_br_copies__T_49_data;
    end
    if(element_br_copies__T_54_en & element_br_copies__T_54_mask) begin
      element_br_copies[element_br_copies__T_54_addr] <= element_br_copies__T_54_data;
    end
    if(element_br_copies__T_60_en & element_br_copies__T_60_mask) begin
      element_br_copies[element_br_copies__T_60_addr] <= element_br_copies__T_60_data;
    end
    if(element_br_copies__T_67_en & element_br_copies__T_67_mask) begin
      element_br_copies[element_br_copies__T_67_addr] <= element_br_copies__T_67_data;
    end
  end
endmodule