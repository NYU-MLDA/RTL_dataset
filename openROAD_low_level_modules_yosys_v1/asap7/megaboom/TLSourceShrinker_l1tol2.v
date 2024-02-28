module TLSourceShrinker_l1tol2(
  input   clock,
  input   reset,
  output  io_in_0_a_ready,
  input   io_in_0_a_valid,
  input  [2:0] io_in_0_a_bits_opcode,
  input  [2:0] io_in_0_a_bits_param,
  input  [3:0] io_in_0_a_bits_size,
  input  [8:0] io_in_0_a_bits_source,
  input  [31:0] io_in_0_a_bits_address,
  input  [15:0] io_in_0_a_bits_mask,
  input  [127:0] io_in_0_a_bits_data,
  input   io_in_0_b_ready,
  output  io_in_0_b_valid,
  output [2:0] io_in_0_b_bits_opcode,
  output [1:0] io_in_0_b_bits_param,
  output [3:0] io_in_0_b_bits_size,
  output [8:0] io_in_0_b_bits_source,
  output [31:0] io_in_0_b_bits_address,
  output [15:0] io_in_0_b_bits_mask,
  output [127:0] io_in_0_b_bits_data,
  output  io_in_0_c_ready,
  input   io_in_0_c_valid,
  input  [2:0] io_in_0_c_bits_opcode,
  input  [2:0] io_in_0_c_bits_param,
  input  [3:0] io_in_0_c_bits_size,
  input  [8:0] io_in_0_c_bits_source,
  input  [31:0] io_in_0_c_bits_address,
  input  [127:0] io_in_0_c_bits_data,
  input   io_in_0_c_bits_error,
  input   io_in_0_d_ready,
  output  io_in_0_d_valid,
  output [2:0] io_in_0_d_bits_opcode,
  output [1:0] io_in_0_d_bits_param,
  output [3:0] io_in_0_d_bits_size,
  output [8:0] io_in_0_d_bits_source,
  output [3:0] io_in_0_d_bits_sink,
  output [3:0] io_in_0_d_bits_addr_lo,
  output [127:0] io_in_0_d_bits_data,
  output  io_in_0_d_bits_error,
  output  io_in_0_e_ready,
  input   io_in_0_e_valid,
  input  [3:0] io_in_0_e_bits_sink,
  input   io_out_0_a_ready,
  output  io_out_0_a_valid,
  output [2:0] io_out_0_a_bits_opcode,
  output [2:0] io_out_0_a_bits_param,
  output [3:0] io_out_0_a_bits_size,
  output [1:0] io_out_0_a_bits_source,
  output [31:0] io_out_0_a_bits_address,
  output [15:0] io_out_0_a_bits_mask,
  output [127:0] io_out_0_a_bits_data,
  output  io_out_0_b_ready,
  input   io_out_0_b_valid,
  input  [2:0] io_out_0_b_bits_opcode,
  input  [1:0] io_out_0_b_bits_param,
  input  [3:0] io_out_0_b_bits_size,
  input  [1:0] io_out_0_b_bits_source,
  input  [31:0] io_out_0_b_bits_address,
  input  [15:0] io_out_0_b_bits_mask,
  input  [127:0] io_out_0_b_bits_data,
  input   io_out_0_c_ready,
  output  io_out_0_c_valid,
  output [2:0] io_out_0_c_bits_opcode,
  output [2:0] io_out_0_c_bits_param,
  output [3:0] io_out_0_c_bits_size,
  output [1:0] io_out_0_c_bits_source,
  output [31:0] io_out_0_c_bits_address,
  output [127:0] io_out_0_c_bits_data,
  output  io_out_0_c_bits_error,
  output  io_out_0_d_ready,
  input   io_out_0_d_valid,
  input  [2:0] io_out_0_d_bits_opcode,
  input  [1:0] io_out_0_d_bits_param,
  input  [3:0] io_out_0_d_bits_size,
  input  [1:0] io_out_0_d_bits_source,
  input  [3:0] io_out_0_d_bits_sink,
  input  [3:0] io_out_0_d_bits_addr_lo,
  input  [127:0] io_out_0_d_bits_data,
  input   io_out_0_d_bits_error,
  input   io_out_0_e_ready,
  output  io_out_0_e_valid,
  output [3:0] io_out_0_e_bits_sink
);
  reg [8:0] _T_1409 [0:3];
  reg [31:0] _GEN_24;
  wire [8:0] _T_1409__T_1505_data;
  wire [1:0] _T_1409__T_1505_addr;
  wire [8:0] _T_1409__T_1509_data;
  wire [1:0] _T_1409__T_1509_addr;
  wire  _T_1409__T_1509_mask;
  wire  _T_1409__T_1509_en;
  reg [3:0] _T_1411;
  reg [31:0] _GEN_25;
  wire [3:0] _T_1412;
  wire [4:0] _GEN_13;
  wire [4:0] _T_1413;
  wire [3:0] _T_1414;
  wire [3:0] _T_1415;
  wire [5:0] _GEN_14;
  wire [5:0] _T_1416;
  wire [3:0] _T_1417;
  wire [3:0] _T_1418;
  wire [4:0] _GEN_15;
  wire [4:0] _T_1419;
  wire [4:0] _T_1420;
  wire [4:0] _T_1422;
  wire  _T_1423;
  wire [3:0] _T_1424;
  wire [3:0] _GEN_17;
  wire [3:0] _T_1427;
  wire [1:0] _T_1428;
  wire [1:0] _T_1429;
  wire  _T_1431;
  wire [1:0] _T_1432;
  wire  _T_1433;
  wire [1:0] _T_1434;
  wire [2:0] _T_1435;
  wire  _T_1438;
  wire  _T_1439;
  wire [22:0] _T_1442;
  wire [7:0] _T_1443;
  wire [7:0] _T_1444;
  wire [3:0] _T_1445;
  wire  _T_1446;
  wire  _T_1448;
  wire [3:0] _T_1450;
  reg [3:0] _T_1452;
  reg [31:0] _GEN_26;
  wire [4:0] _T_1454;
  wire [3:0] _T_1455;
  wire  _T_1457;
  wire [3:0] _T_1466;
  wire [3:0] _GEN_0;
  wire  _T_1467;
  wire [22:0] _T_1470;
  wire [7:0] _T_1471;
  wire [7:0] _T_1472;
  wire [3:0] _T_1473;
  wire  _T_1474;
  wire [3:0] _T_1476;
  reg [3:0] _T_1478;
  reg [31:0] _GEN_27;
  wire [4:0] _T_1480;
  wire [3:0] _T_1481;
  wire  _T_1483;
  wire  _T_1485;
  wire  _T_1487;
  wire  _T_1488;
  wire  _T_1489;
  wire [3:0] _T_1492;
  wire [3:0] _GEN_1;
  wire  _T_1493;
  wire  _T_1495;
  wire  _T_1496;
  wire  _T_1499;
  wire  _T_1501;
  reg [2:0] _T_1503;
  reg [31:0] _GEN_28;
  wire [2:0] _GEN_2;
  wire [2:0] _T_1504;
  wire  _T_1507;
  wire [1:0] _T_1508;
  wire [4:0] _T_1515;
  wire [3:0] _T_1517;
  wire [3:0] _T_1519;
  wire [4:0] _GEN_18;
  wire [4:0] _T_1520;
  wire [3:0] _T_1521;
  wire [4:0] _GEN_19;
  wire [4:0] _T_1522;
  reg [2:0] _GEN_3;
  reg [31:0] _GEN_29;
  reg [1:0] _GEN_4;
  reg [31:0] _GEN_30;
  reg [3:0] _GEN_5;
  reg [31:0] _GEN_31;
  reg [8:0] _GEN_6;
  reg [31:0] _GEN_32;
  reg [31:0] _GEN_7;
  reg [31:0] _GEN_33;
  reg [15:0] _GEN_8;
  reg [31:0] _GEN_34;
  reg [127:0] _GEN_9;
  reg [127:0] _GEN_35;
  reg [2:0] _GEN_10;
  reg [31:0] _GEN_36;
  reg [2:0] _GEN_11;
  reg [31:0] _GEN_37;
  reg [3:0] _GEN_12;
  reg [31:0] _GEN_38;
  reg [1:0] _GEN_16;
  reg [31:0] _GEN_39;
  reg [31:0] _GEN_20;
  reg [31:0] _GEN_40;
  reg [127:0] _GEN_21;
  reg [127:0] _GEN_41;
  reg  _GEN_22;
  reg [31:0] _GEN_42;
  reg [3:0] _GEN_23;
  reg [31:0] _GEN_43;
  assign io_in_0_a_ready = _T_1496;
  assign io_in_0_b_valid = 1'h0;
  assign io_in_0_b_bits_opcode = _GEN_3;
  assign io_in_0_b_bits_param = _GEN_4;
  assign io_in_0_b_bits_size = _GEN_5;
  assign io_in_0_b_bits_source = _GEN_6;
  assign io_in_0_b_bits_address = _GEN_7;
  assign io_in_0_b_bits_mask = _GEN_8;
  assign io_in_0_b_bits_data = _GEN_9;
  assign io_in_0_c_ready = 1'h1;
  assign io_in_0_d_valid = io_out_0_d_valid;
  assign io_in_0_d_bits_opcode = io_out_0_d_bits_opcode;
  assign io_in_0_d_bits_param = io_out_0_d_bits_param;
  assign io_in_0_d_bits_size = io_out_0_d_bits_size;
  assign io_in_0_d_bits_source = _T_1409__T_1505_data;
  assign io_in_0_d_bits_sink = io_out_0_d_bits_sink;
  assign io_in_0_d_bits_addr_lo = io_out_0_d_bits_addr_lo;
  assign io_in_0_d_bits_data = io_out_0_d_bits_data;
  assign io_in_0_d_bits_error = io_out_0_d_bits_error;
  assign io_in_0_e_ready = 1'h1;
  assign io_out_0_a_valid = _T_1499;
  assign io_out_0_a_bits_opcode = io_in_0_a_bits_opcode;
  assign io_out_0_a_bits_param = io_in_0_a_bits_param;
  assign io_out_0_a_bits_size = io_in_0_a_bits_size;
  assign io_out_0_a_bits_source = _T_1504[1:0];
  assign io_out_0_a_bits_address = io_in_0_a_bits_address;
  assign io_out_0_a_bits_mask = io_in_0_a_bits_mask;
  assign io_out_0_a_bits_data = io_in_0_a_bits_data;
  assign io_out_0_b_ready = 1'h1;
  assign io_out_0_c_valid = 1'h0;
  assign io_out_0_c_bits_opcode = _GEN_10;
  assign io_out_0_c_bits_param = _GEN_11;
  assign io_out_0_c_bits_size = _GEN_12;
  assign io_out_0_c_bits_source = _GEN_16;
  assign io_out_0_c_bits_address = _GEN_20;
  assign io_out_0_c_bits_data = _GEN_21;
  assign io_out_0_c_bits_error = _GEN_22;
  assign io_out_0_d_ready = io_in_0_d_ready;
  assign io_out_0_e_valid = 1'h0;
  assign io_out_0_e_bits_sink = _GEN_23;
  assign _T_1409__T_1505_addr = io_out_0_d_bits_source;
  assign _T_1409__T_1505_data = _T_1409[_T_1409__T_1505_addr];
  assign _T_1409__T_1509_data = io_in_0_a_bits_source;
  assign _T_1409__T_1509_addr = _T_1508;
  assign _T_1409__T_1509_mask = _T_1507;
  assign _T_1409__T_1509_en = _T_1507;
  assign _T_1412 = ~ _T_1411;
  assign _GEN_13 = {{1'd0}, _T_1412};
  assign _T_1413 = _GEN_13 << 1;
  assign _T_1414 = _T_1413[3:0];
  assign _T_1415 = _T_1412 | _T_1414;
  assign _GEN_14 = {{2'd0}, _T_1415};
  assign _T_1416 = _GEN_14 << 2;
  assign _T_1417 = _T_1416[3:0];
  assign _T_1418 = _T_1415 | _T_1417;
  assign _GEN_15 = {{1'd0}, _T_1418};
  assign _T_1419 = _GEN_15 << 1;
  assign _T_1420 = ~ _T_1419;
  assign _T_1422 = _T_1420 & _GEN_13;
  assign _T_1423 = _T_1422[4];
  assign _T_1424 = _T_1422[3:0];
  assign _GEN_17 = {{3'd0}, _T_1423};
  assign _T_1427 = _GEN_17 | _T_1424;
  assign _T_1428 = _T_1427[3:2];
  assign _T_1429 = _T_1427[1:0];
  assign _T_1431 = _T_1428 != 2'h0;
  assign _T_1432 = _T_1428 | _T_1429;
  assign _T_1433 = _T_1432[1];
  assign _T_1434 = {_T_1431,_T_1433};
  assign _T_1435 = {_T_1423,_T_1434};
  assign _T_1438 = _T_1412 == 4'h0;
  assign _T_1439 = io_in_0_a_ready & io_in_0_a_valid;
  assign _T_1442 = 23'hff << io_in_0_a_bits_size;
  assign _T_1443 = _T_1442[7:0];
  assign _T_1444 = ~ _T_1443;
  assign _T_1445 = _T_1444[7:4];
  assign _T_1446 = io_in_0_a_bits_opcode[2];
  assign _T_1448 = _T_1446 == 1'h0;
  assign _T_1450 = _T_1448 ? _T_1445 : 4'h0;
  assign _T_1454 = _T_1452 - 4'h1;
  assign _T_1455 = _T_1454[3:0];
  assign _T_1457 = _T_1452 == 4'h0;
  assign _T_1466 = _T_1457 ? _T_1450 : _T_1455;
  assign _GEN_0 = _T_1439 ? _T_1466 : _T_1452;
  assign _T_1467 = io_in_0_d_ready & io_in_0_d_valid;
  assign _T_1470 = 23'hff << io_in_0_d_bits_size;
  assign _T_1471 = _T_1470[7:0];
  assign _T_1472 = ~ _T_1471;
  assign _T_1473 = _T_1472[7:4];
  assign _T_1474 = io_in_0_d_bits_opcode[0];
  assign _T_1476 = _T_1474 ? _T_1473 : 4'h0;
  assign _T_1480 = _T_1478 - 4'h1;
  assign _T_1481 = _T_1480[3:0];
  assign _T_1483 = _T_1478 == 4'h0;
  assign _T_1485 = _T_1478 == 4'h1;
  assign _T_1487 = _T_1476 == 4'h0;
  assign _T_1488 = _T_1485 | _T_1487;
  assign _T_1489 = _T_1488 & _T_1467;
  assign _T_1492 = _T_1483 ? _T_1476 : _T_1481;
  assign _GEN_1 = _T_1467 ? _T_1492 : _T_1478;
  assign _T_1493 = _T_1457 & _T_1438;
  assign _T_1495 = _T_1493 == 1'h0;
  assign _T_1496 = io_out_0_a_ready & _T_1495;
  assign _T_1499 = io_in_0_a_valid & _T_1495;
  assign _T_1501 = _T_1457 == 1'h0;
  assign _GEN_2 = _T_1457 ? _T_1435 : _T_1503;
  assign _T_1504 = _T_1501 ? _T_1503 : _T_1435;
  assign _T_1507 = _T_1457 & _T_1439;
  assign _T_1508 = _T_1435[1:0];
  assign _T_1515 = _T_1507 ? _T_1422 : 5'h0;
  assign _T_1517 = 4'h1 << io_out_0_d_bits_source;
  assign _T_1519 = _T_1489 ? _T_1517 : 4'h0;
  assign _GEN_18 = {{1'd0}, _T_1411};
  assign _T_1520 = _GEN_18 | _T_1515;
  assign _T_1521 = ~ _T_1519;
  assign _GEN_19 = {{1'd0}, _T_1521};
  assign _T_1522 = _T_1520 & _GEN_19;
`ifdef RANDOMIZE
  integer initvar;
  initial begin
    `ifndef verilator
      #0.002 begin end
    `endif
  _GEN_24 = {1{$random}};
  `ifdef RANDOMIZE_MEM_INIT
  for (initvar = 0; initvar < 4; initvar = initvar+1)
    _T_1409[initvar] = _GEN_24[8:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_25 = {1{$random}};
  _T_1411 = _GEN_25[3:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_26 = {1{$random}};
  _T_1452 = _GEN_26[3:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_27 = {1{$random}};
  _T_1478 = _GEN_27[3:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_28 = {1{$random}};
  _T_1503 = _GEN_28[2:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_29 = {1{$random}};
  _GEN_3 = _GEN_29[2:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_30 = {1{$random}};
  _GEN_4 = _GEN_30[1:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_31 = {1{$random}};
  _GEN_5 = _GEN_31[3:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_32 = {1{$random}};
  _GEN_6 = _GEN_32[8:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_33 = {1{$random}};
  _GEN_7 = _GEN_33[31:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_34 = {1{$random}};
  _GEN_8 = _GEN_34[15:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_35 = {4{$random}};
  _GEN_9 = _GEN_35[127:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_36 = {1{$random}};
  _GEN_10 = _GEN_36[2:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_37 = {1{$random}};
  _GEN_11 = _GEN_37[2:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_38 = {1{$random}};
  _GEN_12 = _GEN_38[3:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_39 = {1{$random}};
  _GEN_16 = _GEN_39[1:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_40 = {1{$random}};
  _GEN_20 = _GEN_40[31:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_41 = {4{$random}};
  _GEN_21 = _GEN_41[127:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_42 = {1{$random}};
  _GEN_22 = _GEN_42[0:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_43 = {1{$random}};
  _GEN_23 = _GEN_43[3:0];
  `endif
  end
`endif
  always @(posedge clock) begin
    if(_T_1409__T_1509_en & _T_1409__T_1509_mask) begin
      _T_1409[_T_1409__T_1509_addr] <= _T_1409__T_1509_data;
    end
    if (reset) begin
      _T_1411 <= 4'h0;
    end else begin
      _T_1411 <= _T_1522[3:0];
    end
    if (reset) begin
      _T_1452 <= 4'h0;
    end else begin
      if (_T_1439) begin
        if (_T_1457) begin
          if (_T_1448) begin
            _T_1452 <= _T_1445;
          end else begin
            _T_1452 <= 4'h0;
          end
        end else begin
          _T_1452 <= _T_1455;
        end
      end
    end
    if (reset) begin
      _T_1478 <= 4'h0;
    end else begin
      if (_T_1467) begin
        if (_T_1483) begin
          if (_T_1474) begin
            _T_1478 <= _T_1473;
          end else begin
            _T_1478 <= 4'h0;
          end
        end else begin
          _T_1478 <= _T_1481;
        end
      end
    end
    if (_T_1457) begin
      _T_1503 <= _T_1435;
    end
  end
endmodule