module CoreplexLocalInterrupter_clint(
  input   clock,
  input   reset,
  output  io_in_0_a_ready,
  input   io_in_0_a_valid,
  input  [2:0] io_in_0_a_bits_opcode,
  input  [2:0] io_in_0_a_bits_param,
  input  [2:0] io_in_0_a_bits_size,
  input  [6:0] io_in_0_a_bits_source,
  input  [25:0] io_in_0_a_bits_address,
  input  [7:0] io_in_0_a_bits_mask,
  input  [63:0] io_in_0_a_bits_data,
  input   io_in_0_b_ready,
  output  io_in_0_b_valid,
  output [2:0] io_in_0_b_bits_opcode,
  output [1:0] io_in_0_b_bits_param,
  output [2:0] io_in_0_b_bits_size,
  output [6:0] io_in_0_b_bits_source,
  output [25:0] io_in_0_b_bits_address,
  output [7:0] io_in_0_b_bits_mask,
  output [63:0] io_in_0_b_bits_data,
  output  io_in_0_c_ready,
  input   io_in_0_c_valid,
  input  [2:0] io_in_0_c_bits_opcode,
  input  [2:0] io_in_0_c_bits_param,
  input  [2:0] io_in_0_c_bits_size,
  input  [6:0] io_in_0_c_bits_source,
  input  [25:0] io_in_0_c_bits_address,
  input  [63:0] io_in_0_c_bits_data,
  input   io_in_0_c_bits_error,
  input   io_in_0_d_ready,
  output  io_in_0_d_valid,
  output [2:0] io_in_0_d_bits_opcode,
  output [1:0] io_in_0_d_bits_param,
  output [2:0] io_in_0_d_bits_size,
  output [6:0] io_in_0_d_bits_source,
  output  io_in_0_d_bits_sink,
  output [2:0] io_in_0_d_bits_addr_lo,
  output [63:0] io_in_0_d_bits_data,
  output  io_in_0_d_bits_error,
  output  io_in_0_e_ready,
  input   io_in_0_e_valid,
  input   io_in_0_e_bits_sink,
  output  io_tiles_0_mtip,
  output  io_tiles_0_msip,
  input   io_rtcTick
);
  reg [31:0] time_0;
  reg [31:0] _GEN_42;
  reg [31:0] time_1;
  reg [31:0] _GEN_43;
  wire [63:0] _T_904;
  wire [64:0] _T_906;
  wire [63:0] _T_907;
  wire [31:0] _T_909;
  wire [63:0] _GEN_6;
  wire [31:0] _GEN_7;
  reg [31:0] timecmp_0_0;
  reg [31:0] _GEN_44;
  reg [31:0] timecmp_0_1;
  reg [31:0] _GEN_45;
  reg  ipi_0;
  reg [31:0] _GEN_46;
  wire [63:0] _T_915;
  wire  _T_916;
  wire  _T_940_ready;
  wire  _T_940_valid;
  wire  _T_940_bits_read;
  wire [12:0] _T_940_bits_index;
  wire [63:0] _T_940_bits_data;
  wire [7:0] _T_940_bits_mask;
  wire [12:0] _T_940_bits_extra;
  wire  _T_958;
  wire [22:0] _T_959;
  wire [2:0] _T_960;
  wire [9:0] _T_961;
  wire [12:0] _T_962;
  wire  _T_980_ready;
  wire  _T_980_valid;
  wire  _T_980_bits_read;
  wire [63:0] _T_980_bits_data;
  wire [12:0] _T_980_bits_extra;
  wire  _T_1016_ready;
  wire  _T_1016_valid;
  wire  _T_1016_bits_read;
  wire [12:0] _T_1016_bits_index;
  wire [63:0] _T_1016_bits_data;
  wire [7:0] _T_1016_bits_mask;
  wire [12:0] _T_1016_bits_extra;
  wire [12:0] _T_1044;
  wire [12:0] _T_1045;
  wire  _T_1047;
  wire [12:0] _T_1053;
  wire [12:0] _T_1054;
  wire  _T_1056;
  wire [12:0] _T_1063;
  wire  _T_1065;
  wire  _T_1073_0;
  wire  _T_1073_1;
  wire  _T_1073_2;
  wire  _T_1073_3;
  wire  _T_1073_4;
  wire  _T_1078_0;
  wire  _T_1078_1;
  wire  _T_1078_2;
  wire  _T_1078_3;
  wire  _T_1078_4;
  wire  _T_1083_0;
  wire  _T_1083_1;
  wire  _T_1083_2;
  wire  _T_1083_3;
  wire  _T_1083_4;
  wire  _T_1088_0;
  wire  _T_1088_1;
  wire  _T_1088_2;
  wire  _T_1088_3;
  wire  _T_1088_4;
  wire  _T_1093_0;
  wire  _T_1093_1;
  wire  _T_1093_2;
  wire  _T_1093_3;
  wire  _T_1093_4;
  wire  _T_1098_0;
  wire  _T_1098_1;
  wire  _T_1098_2;
  wire  _T_1098_3;
  wire  _T_1098_4;
  wire  _T_1103_0;
  wire  _T_1103_1;
  wire  _T_1103_2;
  wire  _T_1103_3;
  wire  _T_1103_4;
  wire  _T_1108_0;
  wire  _T_1108_1;
  wire  _T_1108_2;
  wire  _T_1108_3;
  wire  _T_1108_4;
  wire  _T_1130;
  wire  _T_1131;
  wire  _T_1132;
  wire  _T_1133;
  wire  _T_1134;
  wire  _T_1135;
  wire  _T_1136;
  wire  _T_1137;
  wire [7:0] _T_1141;
  wire [7:0] _T_1145;
  wire [7:0] _T_1149;
  wire [7:0] _T_1153;
  wire [7:0] _T_1157;
  wire [7:0] _T_1161;
  wire [7:0] _T_1165;
  wire [7:0] _T_1169;
  wire [15:0] _T_1170;
  wire [15:0] _T_1171;
  wire [31:0] _T_1172;
  wire [15:0] _T_1173;
  wire [15:0] _T_1174;
  wire [31:0] _T_1175;
  wire [63:0] _T_1176;
  wire [31:0] _T_1224;
  wire [31:0] _T_1228;
  wire  _T_1230;
  wire  _T_1243;
  wire [31:0] _T_1244;
  wire [31:0] _GEN_8;
  wire [31:0] _T_1264;
  wire [31:0] _T_1268;
  wire  _T_1270;
  wire  _T_1283;
  wire [31:0] _T_1284;
  wire [31:0] _GEN_9;
  wire [63:0] _GEN_31;
  wire [63:0] _T_1299;
  wire [63:0] _GEN_32;
  wire [63:0] _T_1303;
  wire  _T_1323;
  wire [63:0] _GEN_10;
  wire  _T_1363;
  wire [31:0] _GEN_11;
  wire [63:0] _GEN_33;
  wire [63:0] _T_1379;
  wire [63:0] _GEN_34;
  wire [63:0] _T_1383;
  wire  _T_1403;
  wire [31:0] _GEN_12;
  wire [31:0] _T_1422;
  wire  _T_1425;
  wire  _T_1427;
  wire  _T_1429;
  wire  _T_1430;
  wire  _T_1432;
  wire  _T_1434;
  wire  _T_1435;
  wire  _T_1437;
  wire  _T_1448_0;
  wire  _T_1448_1;
  wire  _T_1448_2;
  wire  _T_1448_3;
  wire  _T_1458;
  wire  _T_1461;
  wire  _T_1463;
  wire  _T_1466;
  wire  _T_1468;
  wire  _T_1479_0;
  wire  _T_1479_1;
  wire  _T_1479_2;
  wire  _T_1479_3;
  wire  _T_1489;
  wire  _T_1492;
  wire  _T_1494;
  wire  _T_1497;
  wire  _T_1499;
  wire  _T_1510_0;
  wire  _T_1510_1;
  wire  _T_1510_2;
  wire  _T_1510_3;
  wire  _T_1520;
  wire  _T_1523;
  wire  _T_1525;
  wire  _T_1528;
  wire  _T_1530;
  wire  _T_1541_0;
  wire  _T_1541_1;
  wire  _T_1541_2;
  wire  _T_1541_3;
  wire  _T_1548;
  wire  _T_1559;
  wire [1:0] _T_1561;
  wire  _GEN_0;
  wire  _GEN_13;
  wire  _GEN_14;
  wire  _GEN_15;
  wire  _GEN_1;
  wire  _GEN_16;
  wire  _GEN_17;
  wire  _GEN_18;
  wire  _T_1578;
  wire  _GEN_2;
  wire  _GEN_19;
  wire  _GEN_20;
  wire  _GEN_21;
  wire  _GEN_3;
  wire  _GEN_22;
  wire  _GEN_23;
  wire  _GEN_24;
  wire  _T_1581;
  wire  _T_1582;
  wire  _T_1583;
  wire  _T_1584;
  wire  _T_1585;
  wire [3:0] _T_1587;
  wire [1:0] _T_1588;
  wire [1:0] _T_1589;
  wire [3:0] _T_1590;
  wire [3:0] _T_1591;
  wire  _T_1598;
  wire  _T_1599;
  wire  _T_1600;
  wire  _T_1601;
  wire  _T_1604;
  wire  _T_1605;
  wire  _T_1607;
  wire  _T_1608;
  wire  _T_1609;
  wire  _T_1611;
  wire  _T_1615;
  wire  _T_1617;
  wire  _T_1620;
  wire  _T_1621;
  wire  _T_1627;
  wire  _T_1631;
  wire  _T_1637;
  wire  _T_1640;
  wire  _T_1641;
  wire  _T_1647;
  wire  _T_1651;
  wire  _T_1657;
  wire  _T_1678;
  wire  _T_1680;
  wire  _T_1682;
  wire  _T_1684;
  wire  _T_1686;
  wire  _T_1688;
  wire  _T_1690;
  wire  _T_1692;
  wire  _T_1694;
  wire  _T_1696;
  wire  _T_1698;
  wire  _T_1700;
  wire  _T_1702;
  wire  _T_1704;
  wire  _T_1706;
  wire  _T_1708;
  wire  _T_1721_0;
  wire  _T_1721_1;
  wire  _T_1721_2;
  wire  _T_1721_3;
  wire [63:0] _T_1736_0;
  wire [63:0] _T_1736_1;
  wire [63:0] _T_1736_2;
  wire [63:0] _T_1736_3;
  wire  _GEN_4;
  wire  _GEN_25;
  wire  _GEN_26;
  wire  _GEN_27;
  wire [63:0] _GEN_5;
  wire [63:0] _GEN_28;
  wire [63:0] _GEN_29;
  wire [63:0] _GEN_30;
  wire [63:0] _T_1745;
  wire [2:0] _T_1746;
  wire [6:0] _T_1748;
  wire [2:0] _T_1749;
  wire [2:0] _T_1760_opcode;
  wire [1:0] _T_1760_param;
  wire [2:0] _T_1760_size;
  wire [6:0] _T_1760_source;
  wire  _T_1760_sink;
  wire [2:0] _T_1760_addr_lo;
  wire [63:0] _T_1760_data;
  wire  _T_1760_error;
  reg [2:0] _GEN_35;
  reg [31:0] _GEN_47;
  reg [1:0] _GEN_36;
  reg [31:0] _GEN_48;
  reg [2:0] _GEN_37;
  reg [31:0] _GEN_49;
  reg [6:0] _GEN_38;
  reg [31:0] _GEN_50;
  reg [25:0] _GEN_39;
  reg [31:0] _GEN_51;
  reg [7:0] _GEN_40;
  reg [31:0] _GEN_52;
  reg [63:0] _GEN_41;
  reg [63:0] _GEN_53;
  assign io_in_0_a_ready = _T_940_ready;
  assign io_in_0_b_valid = 1'h0;
  assign io_in_0_b_bits_opcode = _GEN_35;
  assign io_in_0_b_bits_param = _GEN_36;
  assign io_in_0_b_bits_size = _GEN_37;
  assign io_in_0_b_bits_source = _GEN_38;
  assign io_in_0_b_bits_address = _GEN_39;
  assign io_in_0_b_bits_mask = _GEN_40;
  assign io_in_0_b_bits_data = _GEN_41;
  assign io_in_0_c_ready = 1'h1;
  assign io_in_0_d_valid = _T_980_valid;
  assign io_in_0_d_bits_opcode = {{2'd0}, _T_980_bits_read};
  assign io_in_0_d_bits_param = _T_1760_param;
  assign io_in_0_d_bits_size = _T_1760_size;
  assign io_in_0_d_bits_source = _T_1760_source;
  assign io_in_0_d_bits_sink = _T_1760_sink;
  assign io_in_0_d_bits_addr_lo = _T_1760_addr_lo;
  assign io_in_0_d_bits_data = _T_980_bits_data;
  assign io_in_0_d_bits_error = _T_1760_error;
  assign io_in_0_e_ready = 1'h1;
  assign io_tiles_0_mtip = _T_916;
  assign io_tiles_0_msip = ipi_0;
  assign _T_904 = {time_1,time_0};
  assign _T_906 = _T_904 + 64'h1;
  assign _T_907 = _T_906[63:0];
  assign _T_909 = _T_907[63:32];
  assign _GEN_6 = io_rtcTick ? _T_907 : {{32'd0}, time_0};
  assign _GEN_7 = io_rtcTick ? _T_909 : time_1;
  assign _T_915 = {timecmp_0_1,timecmp_0_0};
  assign _T_916 = _T_904 >= _T_915;
  assign _T_940_ready = _T_1582;
  assign _T_940_valid = io_in_0_a_valid;
  assign _T_940_bits_read = _T_958;
  assign _T_940_bits_index = _T_959[12:0];
  assign _T_940_bits_data = io_in_0_a_bits_data;
  assign _T_940_bits_mask = io_in_0_a_bits_mask;
  assign _T_940_bits_extra = _T_962;
  assign _T_958 = io_in_0_a_bits_opcode == 3'h4;
  assign _T_959 = io_in_0_a_bits_address[25:3];
  assign _T_960 = io_in_0_a_bits_address[2:0];
  assign _T_961 = {_T_960,io_in_0_a_bits_source};
  assign _T_962 = {_T_961,io_in_0_a_bits_size};
  assign _T_980_ready = io_in_0_d_ready;
  assign _T_980_valid = _T_1585;
  assign _T_980_bits_read = _T_1016_bits_read;
  assign _T_980_bits_data = _T_1745;
  assign _T_980_bits_extra = _T_1016_bits_extra;
  assign _T_1016_ready = _T_1584;
  assign _T_1016_valid = _T_1583;
  assign _T_1016_bits_read = _T_940_bits_read;
  assign _T_1016_bits_index = _T_940_bits_index;
  assign _T_1016_bits_data = _T_940_bits_data;
  assign _T_1016_bits_mask = _T_940_bits_mask;
  assign _T_1016_bits_extra = _T_940_bits_extra;
  assign _T_1044 = _T_1016_bits_index ^ 13'h800;
  assign _T_1045 = _T_1044 & 13'h17fe;
  assign _T_1047 = _T_1045 == 13'h0;
  assign _T_1053 = _T_1016_bits_index ^ 13'h17ff;
  assign _T_1054 = _T_1053 & 13'h17fe;
  assign _T_1056 = _T_1054 == 13'h0;
  assign _T_1063 = _T_1016_bits_index & 13'h17fe;
  assign _T_1065 = _T_1063 == 13'h0;
  assign _T_1073_0 = _T_1678;
  assign _T_1073_1 = _T_1686;
  assign _T_1073_2 = _T_1694;
  assign _T_1073_3 = _T_1702;
  assign _T_1073_4 = _T_1601;
  assign _T_1078_0 = _T_1680;
  assign _T_1078_1 = _T_1688;
  assign _T_1078_2 = _T_1696;
  assign _T_1078_3 = _T_1704;
  assign _T_1078_4 = _T_1607;
  assign _T_1083_0 = 1'h1;
  assign _T_1083_1 = 1'h1;
  assign _T_1083_2 = 1'h1;
  assign _T_1083_3 = 1'h1;
  assign _T_1083_4 = 1'h1;
  assign _T_1088_0 = 1'h1;
  assign _T_1088_1 = 1'h1;
  assign _T_1088_2 = 1'h1;
  assign _T_1088_3 = 1'h1;
  assign _T_1088_4 = 1'h1;
  assign _T_1093_0 = 1'h1;
  assign _T_1093_1 = 1'h1;
  assign _T_1093_2 = 1'h1;
  assign _T_1093_3 = 1'h1;
  assign _T_1093_4 = 1'h1;
  assign _T_1098_0 = 1'h1;
  assign _T_1098_1 = 1'h1;
  assign _T_1098_2 = 1'h1;
  assign _T_1098_3 = 1'h1;
  assign _T_1098_4 = 1'h1;
  assign _T_1103_0 = _T_1682;
  assign _T_1103_1 = _T_1690;
  assign _T_1103_2 = _T_1698;
  assign _T_1103_3 = _T_1706;
  assign _T_1103_4 = _T_1611;
  assign _T_1108_0 = _T_1684;
  assign _T_1108_1 = _T_1692;
  assign _T_1108_2 = _T_1700;
  assign _T_1108_3 = _T_1708;
  assign _T_1108_4 = _T_1617;
  assign _T_1130 = _T_1016_bits_mask[0];
  assign _T_1131 = _T_1016_bits_mask[1];
  assign _T_1132 = _T_1016_bits_mask[2];
  assign _T_1133 = _T_1016_bits_mask[3];
  assign _T_1134 = _T_1016_bits_mask[4];
  assign _T_1135 = _T_1016_bits_mask[5];
  assign _T_1136 = _T_1016_bits_mask[6];
  assign _T_1137 = _T_1016_bits_mask[7];
  assign _T_1141 = _T_1130 ? 8'hff : 8'h0;
  assign _T_1145 = _T_1131 ? 8'hff : 8'h0;
  assign _T_1149 = _T_1132 ? 8'hff : 8'h0;
  assign _T_1153 = _T_1133 ? 8'hff : 8'h0;
  assign _T_1157 = _T_1134 ? 8'hff : 8'h0;
  assign _T_1161 = _T_1135 ? 8'hff : 8'h0;
  assign _T_1165 = _T_1136 ? 8'hff : 8'h0;
  assign _T_1169 = _T_1137 ? 8'hff : 8'h0;
  assign _T_1170 = {_T_1145,_T_1141};
  assign _T_1171 = {_T_1153,_T_1149};
  assign _T_1172 = {_T_1171,_T_1170};
  assign _T_1173 = {_T_1161,_T_1157};
  assign _T_1174 = {_T_1169,_T_1165};
  assign _T_1175 = {_T_1174,_T_1173};
  assign _T_1176 = {_T_1175,_T_1172};
  assign _T_1224 = _T_1176[31:0];
  assign _T_1228 = ~ _T_1224;
  assign _T_1230 = _T_1228 == 32'h0;
  assign _T_1243 = _T_1108_0 & _T_1230;
  assign _T_1244 = _T_1016_bits_data[31:0];
  assign _GEN_8 = _T_1243 ? _T_1244 : timecmp_0_0;
  assign _T_1264 = _T_1176[63:32];
  assign _T_1268 = ~ _T_1264;
  assign _T_1270 = _T_1268 == 32'h0;
  assign _T_1283 = _T_1108_1 & _T_1270;
  assign _T_1284 = _T_1016_bits_data[63:32];
  assign _GEN_9 = _T_1283 ? _T_1284 : timecmp_0_1;
  assign _GEN_31 = {{32'd0}, timecmp_0_1};
  assign _T_1299 = _GEN_31 << 32;
  assign _GEN_32 = {{32'd0}, timecmp_0_0};
  assign _T_1303 = _GEN_32 | _T_1299;
  assign _T_1323 = _T_1108_2 & _T_1230;
  assign _GEN_10 = _T_1323 ? {{32'd0}, _T_1244} : _GEN_6;
  assign _T_1363 = _T_1108_3 & _T_1270;
  assign _GEN_11 = _T_1363 ? _T_1284 : _GEN_7;
  assign _GEN_33 = {{32'd0}, time_1};
  assign _T_1379 = _GEN_33 << 32;
  assign _GEN_34 = {{32'd0}, time_0};
  assign _T_1383 = _GEN_34 | _T_1379;
  assign _T_1403 = _T_1108_4 & _T_1230;
  assign _GEN_12 = _T_1403 ? _T_1244 : {{31'd0}, ipi_0};
  assign _T_1422 = {{31'd0}, ipi_0};
  assign _T_1425 = _T_1065 == 1'h0;
  assign _T_1427 = _T_1425 | _T_1083_4;
  assign _T_1429 = _T_1056 == 1'h0;
  assign _T_1430 = _T_1083_3 & _T_1083_2;
  assign _T_1432 = _T_1429 | _T_1430;
  assign _T_1434 = _T_1047 == 1'h0;
  assign _T_1435 = _T_1083_1 & _T_1083_0;
  assign _T_1437 = _T_1434 | _T_1435;
  assign _T_1448_0 = _T_1427;
  assign _T_1448_1 = _T_1432;
  assign _T_1448_2 = _T_1437;
  assign _T_1448_3 = 1'h1;
  assign _T_1458 = _T_1425 | _T_1088_4;
  assign _T_1461 = _T_1088_3 & _T_1088_2;
  assign _T_1463 = _T_1429 | _T_1461;
  assign _T_1466 = _T_1088_1 & _T_1088_0;
  assign _T_1468 = _T_1434 | _T_1466;
  assign _T_1479_0 = _T_1458;
  assign _T_1479_1 = _T_1463;
  assign _T_1479_2 = _T_1468;
  assign _T_1479_3 = 1'h1;
  assign _T_1489 = _T_1425 | _T_1093_4;
  assign _T_1492 = _T_1093_3 & _T_1093_2;
  assign _T_1494 = _T_1429 | _T_1492;
  assign _T_1497 = _T_1093_1 & _T_1093_0;
  assign _T_1499 = _T_1434 | _T_1497;
  assign _T_1510_0 = _T_1489;
  assign _T_1510_1 = _T_1494;
  assign _T_1510_2 = _T_1499;
  assign _T_1510_3 = 1'h1;
  assign _T_1520 = _T_1425 | _T_1098_4;
  assign _T_1523 = _T_1098_3 & _T_1098_2;
  assign _T_1525 = _T_1429 | _T_1523;
  assign _T_1528 = _T_1098_1 & _T_1098_0;
  assign _T_1530 = _T_1434 | _T_1528;
  assign _T_1541_0 = _T_1520;
  assign _T_1541_1 = _T_1525;
  assign _T_1541_2 = _T_1530;
  assign _T_1541_3 = 1'h1;
  assign _T_1548 = _T_1016_bits_index[0];
  assign _T_1559 = _T_1016_bits_index[11];
  assign _T_1561 = {_T_1559,_T_1548};
  assign _GEN_0 = _GEN_15;
  assign _GEN_13 = 2'h1 == _T_1561 ? _T_1448_1 : _T_1448_0;
  assign _GEN_14 = 2'h2 == _T_1561 ? _T_1448_2 : _GEN_13;
  assign _GEN_15 = 2'h3 == _T_1561 ? _T_1448_3 : _GEN_14;
  assign _GEN_1 = _GEN_18;
  assign _GEN_16 = 2'h1 == _T_1561 ? _T_1479_1 : _T_1479_0;
  assign _GEN_17 = 2'h2 == _T_1561 ? _T_1479_2 : _GEN_16;
  assign _GEN_18 = 2'h3 == _T_1561 ? _T_1479_3 : _GEN_17;
  assign _T_1578 = _T_1016_bits_read ? _GEN_0 : _GEN_1;
  assign _GEN_2 = _GEN_21;
  assign _GEN_19 = 2'h1 == _T_1561 ? _T_1510_1 : _T_1510_0;
  assign _GEN_20 = 2'h2 == _T_1561 ? _T_1510_2 : _GEN_19;
  assign _GEN_21 = 2'h3 == _T_1561 ? _T_1510_3 : _GEN_20;
  assign _GEN_3 = _GEN_24;
  assign _GEN_22 = 2'h1 == _T_1561 ? _T_1541_1 : _T_1541_0;
  assign _GEN_23 = 2'h2 == _T_1561 ? _T_1541_2 : _GEN_22;
  assign _GEN_24 = 2'h3 == _T_1561 ? _T_1541_3 : _GEN_23;
  assign _T_1581 = _T_1016_bits_read ? _GEN_2 : _GEN_3;
  assign _T_1582 = _T_1016_ready & _T_1578;
  assign _T_1583 = _T_940_valid & _T_1578;
  assign _T_1584 = _T_980_ready & _T_1581;
  assign _T_1585 = _T_1016_valid & _T_1581;
  assign _T_1587 = 4'h1 << _T_1561;
  assign _T_1588 = {_T_1056,_T_1065};
  assign _T_1589 = {1'h1,_T_1047};
  assign _T_1590 = {_T_1589,_T_1588};
  assign _T_1591 = _T_1587 & _T_1590;
  assign _T_1598 = _T_940_valid & _T_1016_ready;
  assign _T_1599 = _T_1598 & _T_1016_bits_read;
  assign _T_1600 = _T_1591[0];
  assign _T_1601 = _T_1599 & _T_1600;
  assign _T_1604 = _T_1016_bits_read == 1'h0;
  assign _T_1605 = _T_1598 & _T_1604;
  assign _T_1607 = _T_1605 & _T_1600;
  assign _T_1608 = _T_1016_valid & _T_980_ready;
  assign _T_1609 = _T_1608 & _T_1016_bits_read;
  assign _T_1611 = _T_1609 & _T_1600;
  assign _T_1615 = _T_1608 & _T_1604;
  assign _T_1617 = _T_1615 & _T_1600;
  assign _T_1620 = _T_1591[1];
  assign _T_1621 = _T_1599 & _T_1620;
  assign _T_1627 = _T_1605 & _T_1620;
  assign _T_1631 = _T_1609 & _T_1620;
  assign _T_1637 = _T_1615 & _T_1620;
  assign _T_1640 = _T_1591[2];
  assign _T_1641 = _T_1599 & _T_1640;
  assign _T_1647 = _T_1605 & _T_1640;
  assign _T_1651 = _T_1609 & _T_1640;
  assign _T_1657 = _T_1615 & _T_1640;
  assign _T_1678 = _T_1641 & _T_1083_1;
  assign _T_1680 = _T_1647 & _T_1088_1;
  assign _T_1682 = _T_1651 & _T_1093_1;
  assign _T_1684 = _T_1657 & _T_1098_1;
  assign _T_1686 = _T_1641 & _T_1083_0;
  assign _T_1688 = _T_1647 & _T_1088_0;
  assign _T_1690 = _T_1651 & _T_1093_0;
  assign _T_1692 = _T_1657 & _T_1098_0;
  assign _T_1694 = _T_1621 & _T_1083_3;
  assign _T_1696 = _T_1627 & _T_1088_3;
  assign _T_1698 = _T_1631 & _T_1093_3;
  assign _T_1700 = _T_1637 & _T_1098_3;
  assign _T_1702 = _T_1621 & _T_1083_2;
  assign _T_1704 = _T_1627 & _T_1088_2;
  assign _T_1706 = _T_1631 & _T_1093_2;
  assign _T_1708 = _T_1637 & _T_1098_2;
  assign _T_1721_0 = _T_1065;
  assign _T_1721_1 = _T_1056;
  assign _T_1721_2 = _T_1047;
  assign _T_1721_3 = 1'h1;
  assign _T_1736_0 = {{32'd0}, _T_1422};
  assign _T_1736_1 = _T_1383;
  assign _T_1736_2 = _T_1303;
  assign _T_1736_3 = 64'h0;
  assign _GEN_4 = _GEN_27;
  assign _GEN_25 = 2'h1 == _T_1561 ? _T_1721_1 : _T_1721_0;
  assign _GEN_26 = 2'h2 == _T_1561 ? _T_1721_2 : _GEN_25;
  assign _GEN_27 = 2'h3 == _T_1561 ? _T_1721_3 : _GEN_26;
  assign _GEN_5 = _GEN_30;
  assign _GEN_28 = 2'h1 == _T_1561 ? _T_1736_1 : _T_1736_0;
  assign _GEN_29 = 2'h2 == _T_1561 ? _T_1736_2 : _GEN_28;
  assign _GEN_30 = 2'h3 == _T_1561 ? _T_1736_3 : _GEN_29;
  assign _T_1745 = _GEN_4 ? _GEN_5 : 64'h0;
  assign _T_1746 = _T_980_bits_extra[12:10];
  assign _T_1748 = _T_980_bits_extra[9:3];
  assign _T_1749 = _T_980_bits_extra[2:0];
  assign _T_1760_opcode = 3'h0;
  assign _T_1760_param = 2'h0;
  assign _T_1760_size = _T_1749;
  assign _T_1760_source = _T_1748;
  assign _T_1760_sink = 1'h0;
  assign _T_1760_addr_lo = _T_1746;
  assign _T_1760_data = 64'h0;
  assign _T_1760_error = 1'h0;
`ifdef RANDOMIZE
  integer initvar;
  initial begin
    `ifndef verilator
      #0.002 begin end
    `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_42 = {1{$random}};
  time_0 = _GEN_42[31:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_43 = {1{$random}};
  time_1 = _GEN_43[31:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_44 = {1{$random}};
  timecmp_0_0 = _GEN_44[31:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_45 = {1{$random}};
  timecmp_0_1 = _GEN_45[31:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_46 = {1{$random}};
  ipi_0 = _GEN_46[0:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_47 = {1{$random}};
  _GEN_35 = _GEN_47[2:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_48 = {1{$random}};
  _GEN_36 = _GEN_48[1:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_49 = {1{$random}};
  _GEN_37 = _GEN_49[2:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_50 = {1{$random}};
  _GEN_38 = _GEN_50[6:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_51 = {1{$random}};
  _GEN_39 = _GEN_51[25:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_52 = {1{$random}};
  _GEN_40 = _GEN_52[7:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_53 = {2{$random}};
  _GEN_41 = _GEN_53[63:0];
  `endif
  end
`endif
  always @(posedge clock) begin
    if (reset) begin
      time_0 <= 32'h0;
    end else begin
      time_0 <= _GEN_10[31:0];
    end
    if (reset) begin
      time_1 <= 32'h0;
    end else begin
      if (_T_1363) begin
        time_1 <= _T_1284;
      end else begin
        if (io_rtcTick) begin
          time_1 <= _T_909;
        end
      end
    end
    if (_T_1243) begin
      timecmp_0_0 <= _T_1244;
    end
    if (_T_1283) begin
      timecmp_0_1 <= _T_1284;
    end
    if (reset) begin
      ipi_0 <= 1'h0;
    end else begin
      ipi_0 <= _GEN_12[0];
    end
  end
endmodule