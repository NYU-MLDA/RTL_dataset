module Queue_23(
  input   clock,
  input   reset,
  output  io_enq_ready,
  input   io_enq_valid,
  input  [7:0] io_enq_bits_id,
  input  [1:0] io_enq_bits_resp,
  input   io_deq_ready,
  output  io_deq_valid,
  output [7:0] io_deq_bits_id,
  output [1:0] io_deq_bits_resp,
  output  io_count
);
  reg [7:0] ram_id [0:0];
  reg [31:0] _GEN_0;
  wire [7:0] ram_id__T_62_data;
  wire  ram_id__T_62_addr;
  wire [7:0] ram_id__T_51_data;
  wire  ram_id__T_51_addr;
  wire  ram_id__T_51_mask;
  wire  ram_id__T_51_en;
  reg [1:0] ram_resp [0:0];
  reg [31:0] _GEN_1;
  wire [1:0] ram_resp__T_62_data;
  wire  ram_resp__T_62_addr;
  wire [1:0] ram_resp__T_51_data;
  wire  ram_resp__T_51_addr;
  wire  ram_resp__T_51_mask;
  wire  ram_resp__T_51_en;
  reg  maybe_full;
  reg [31:0] _GEN_2;
  wire  _T_45;
  wire  _T_48;
  wire  do_enq;
  wire  _T_49;
  wire  do_deq;
  wire  _T_56;
  wire  _GEN_5;
  wire  _T_58;
  wire  _GEN_6;
  wire  _GEN_7;
  wire [7:0] _GEN_8;
  wire [1:0] _GEN_9;
  wire  _GEN_10;
  wire  _GEN_11;
  wire [1:0] _T_68;
  wire  _T_69;
  wire [1:0] _T_71;
  assign io_enq_ready = _T_45;
  assign io_deq_valid = _GEN_6;
  assign io_deq_bits_id = _GEN_8;
  assign io_deq_bits_resp = _GEN_9;
  assign io_count = _T_71[0];
  assign ram_id__T_62_addr = 1'h0;
  assign ram_id__T_62_data = ram_id[ram_id__T_62_addr];
  assign ram_id__T_51_data = io_enq_bits_id;
  assign ram_id__T_51_addr = 1'h0;
  assign ram_id__T_51_mask = do_enq;
  assign ram_id__T_51_en = do_enq;
  assign ram_resp__T_62_addr = 1'h0;
  assign ram_resp__T_62_data = ram_resp[ram_resp__T_62_addr];
  assign ram_resp__T_51_data = io_enq_bits_resp;
  assign ram_resp__T_51_addr = 1'h0;
  assign ram_resp__T_51_mask = do_enq;
  assign ram_resp__T_51_en = do_enq;
  assign _T_45 = maybe_full == 1'h0;
  assign _T_48 = io_enq_ready & io_enq_valid;
  assign do_enq = _GEN_11;
  assign _T_49 = io_deq_ready & io_deq_valid;
  assign do_deq = _GEN_10;
  assign _T_56 = do_enq != do_deq;
  assign _GEN_5 = _T_56 ? do_enq : maybe_full;
  assign _T_58 = _T_45 == 1'h0;
  assign _GEN_6 = io_enq_valid ? 1'h1 : _T_58;
  assign _GEN_7 = io_deq_ready ? 1'h0 : _T_48;
  assign _GEN_8 = _T_45 ? io_enq_bits_id : ram_id__T_62_data;
  assign _GEN_9 = _T_45 ? io_enq_bits_resp : ram_resp__T_62_data;
  assign _GEN_10 = _T_45 ? 1'h0 : _T_49;
  assign _GEN_11 = _T_45 ? _GEN_7 : _T_48;
  assign _T_68 = 1'h0 - 1'h0;
  assign _T_69 = _T_68[0:0];
  assign _T_71 = {maybe_full,_T_69};
`ifdef RANDOMIZE
  integer initvar;
  initial begin
    `ifndef verilator
      #0.002 begin end
    `endif
  _GEN_0 = {1{$random}};
  `ifdef RANDOMIZE_MEM_INIT
  for (initvar = 0; initvar < 1; initvar = initvar+1)
    ram_id[initvar] = _GEN_0[7:0];
  `endif
  _GEN_1 = {1{$random}};
  `ifdef RANDOMIZE_MEM_INIT
  for (initvar = 0; initvar < 1; initvar = initvar+1)
    ram_resp[initvar] = _GEN_1[1:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_2 = {1{$random}};
  maybe_full = _GEN_2[0:0];
  `endif
  end
`endif
  always @(posedge clock) begin
    if(ram_id__T_51_en & ram_id__T_51_mask) begin
      ram_id[ram_id__T_51_addr] <= ram_id__T_51_data;
    end
    if(ram_resp__T_51_en & ram_resp__T_51_mask) begin
      ram_resp[ram_resp__T_51_addr] <= ram_resp__T_51_data;
    end
    if (reset) begin
      maybe_full <= 1'h0;
    end else begin
      if (_T_56) begin
        maybe_full <= do_enq;
      end
    end
  end
endmodule