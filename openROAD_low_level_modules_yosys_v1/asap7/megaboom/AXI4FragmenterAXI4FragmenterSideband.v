module AXI4FragmenterAXI4FragmenterSideband(
  input   clock,
  input   reset,
  output  io_enq_ready,
  input   io_enq_valid,
  input   io_enq_bits,
  input   io_deq_ready,
  output  io_deq_valid,
  output  io_deq_bits,
  output [5:0] io_count
);
  reg [1:0] state;
  reg [31:0] _GEN_11;
  reg [4:0] count;
  reg [31:0] _GEN_12;
  wire  full;
  wire  empty;
  wire  last;
  wire  _T_31;
  wire  _T_32;
  wire  _T_33;
  wire  _T_34;
  wire  _T_36;
  wire  _T_38;
  wire  _T_39;
  wire  _T_40;
  wire  _T_41;
  wire  _T_42;
  wire  _T_43;
  wire  _T_44;
  wire  _T_45;
  wire  _T_47;
  wire  _T_48;
  wire  _T_49;
  wire  _T_51;
  wire  _GEN_0;
  wire  _GEN_1;
  wire  _GEN_2;
  wire  _T_53;
  wire [4:0] _GEN_9;
  wire [5:0] _T_54;
  wire [4:0] _T_55;
  wire  _T_56;
  wire [4:0] _GEN_10;
  wire [5:0] _T_57;
  wire [4:0] _T_58;
  wire  _T_59;
  wire  _T_61;
  wire  _T_62;
  wire  _T_63;
  wire [1:0] _GEN_3;
  wire [1:0] _GEN_4;
  wire  _T_64;
  wire  _T_65;
  wire  _T_68;
  wire [1:0] _T_69;
  wire [1:0] _GEN_5;
  wire [1:0] _GEN_6;
  wire  _T_70;
  wire  _T_71;
  wire [1:0] _GEN_7;
  wire [1:0] _GEN_8;
  assign io_enq_ready = _T_44;
  assign io_deq_valid = _GEN_1;
  assign io_deq_bits = _GEN_2;
  assign io_count = 6'h0;
  assign full = count == 5'h1f;
  assign empty = count == 5'h0;
  assign last = count == 5'h1;
  assign _T_31 = state[1];
  assign _T_32 = state[0];
  assign _T_33 = last & _T_32;
  assign _T_34 = _T_31 | _T_33;
  assign _T_36 = empty == 1'h0;
  assign _T_38 = full == 1'h0;
  assign _T_39 = state == 2'h0;
  assign _T_40 = empty | _T_39;
  assign _T_41 = state == 2'h2;
  assign _T_42 = _T_41 & io_enq_bits;
  assign _T_43 = _T_40 | _T_42;
  assign _T_44 = _T_38 & _T_43;
  assign _T_45 = state != 2'h1;
  assign _T_47 = count != 5'h0;
  assign _T_48 = _T_45 | _T_47;
  assign _T_49 = _T_48 | reset;
  assign _T_51 = _T_49 == 1'h0;
  assign _GEN_0 = empty ? io_enq_bits : _T_34;
  assign _GEN_1 = io_enq_valid ? 1'h1 : _T_36;
  assign _GEN_2 = io_enq_valid ? _GEN_0 : _T_34;
  assign _T_53 = io_enq_ready & io_enq_valid;
  assign _GEN_9 = {{4'd0}, _T_53};
  assign _T_54 = count + _GEN_9;
  assign _T_55 = _T_54[4:0];
  assign _T_56 = io_deq_ready & io_deq_valid;
  assign _GEN_10 = {{4'd0}, _T_56};
  assign _T_57 = _T_55 - _GEN_10;
  assign _T_58 = _T_57[4:0];
  assign _T_59 = 2'h2 == state;
  assign _T_61 = io_enq_bits == 1'h0;
  assign _T_62 = io_enq_valid & _T_61;
  assign _T_63 = _T_62 & empty;
  assign _GEN_3 = _T_63 ? 2'h0 : state;
  assign _GEN_4 = _T_59 ? _GEN_3 : state;
  assign _T_64 = 2'h0 == state;
  assign _T_65 = io_enq_valid & io_enq_bits;
  assign _T_68 = _T_65 & _T_38;
  assign _T_69 = empty ? 2'h2 : 2'h1;
  assign _GEN_5 = _T_68 ? _T_69 : _GEN_4;
  assign _GEN_6 = _T_64 ? _GEN_5 : _GEN_4;
  assign _T_70 = 2'h1 == state;
  assign _T_71 = last & io_deq_ready;
  assign _GEN_7 = _T_71 ? 2'h2 : _GEN_6;
  assign _GEN_8 = _T_70 ? _GEN_7 : _GEN_6;
`ifdef RANDOMIZE
  integer initvar;
  initial begin
    `ifndef verilator
      #0.002 begin end
    `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_11 = {1{$random}};
  state = _GEN_11[1:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_12 = {1{$random}};
  count = _GEN_12[4:0];
  `endif
  end
`endif
  always @(posedge clock) begin
    if (reset) begin
      state <= 2'h2;
    end else begin
      if (_T_70) begin
        if (_T_71) begin
          state <= 2'h2;
        end else begin
          if (_T_64) begin
            if (_T_68) begin
              if (empty) begin
                state <= 2'h2;
              end else begin
                state <= 2'h1;
              end
            end else begin
              if (_T_59) begin
                if (_T_63) begin
                  state <= 2'h0;
                end
              end
            end
          end else begin
            if (_T_59) begin
              if (_T_63) begin
                state <= 2'h0;
              end
            end
          end
        end
      end else begin
        if (_T_64) begin
          if (_T_68) begin
            if (empty) begin
              state <= 2'h2;
            end else begin
              state <= 2'h1;
            end
          end else begin
            if (_T_59) begin
              if (_T_63) begin
                state <= 2'h0;
              end
            end
          end
        end else begin
          if (_T_59) begin
            if (_T_63) begin
              state <= 2'h0;
            end
          end
        end
      end
    end
    if (reset) begin
      count <= 5'h0;
    end else begin
      count <= _T_58;
    end
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_51) begin
          $fwrite(32'h80000002,"Assertion failed\n    at Fragmenter.scala:267 assert (state =/= WAIT || count =/= UInt(0))\n");
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_T_51) begin
          $fatal;
        end
    `ifdef STOP_COND
      end
    `endif
    `endif
  end
endmodule