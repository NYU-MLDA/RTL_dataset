module TLXbar_peripheryBus(
  input   clock,
  input   reset,
  output  io_in_0_a_ready,
  input   io_in_0_a_valid,
  input  [2:0] io_in_0_a_bits_opcode,
  input  [2:0] io_in_0_a_bits_param,
  input  [2:0] io_in_0_a_bits_size,
  input  [3:0] io_in_0_a_bits_source,
  input  [12:0] io_in_0_a_bits_address,
  input  [3:0] io_in_0_a_bits_mask,
  input  [31:0] io_in_0_a_bits_data,
  input   io_in_0_b_ready,
  output  io_in_0_b_valid,
  output [2:0] io_in_0_b_bits_opcode,
  output [1:0] io_in_0_b_bits_param,
  output [2:0] io_in_0_b_bits_size,
  output [3:0] io_in_0_b_bits_source,
  output [12:0] io_in_0_b_bits_address,
  output [3:0] io_in_0_b_bits_mask,
  output [31:0] io_in_0_b_bits_data,
  output  io_in_0_c_ready,
  input   io_in_0_c_valid,
  input  [2:0] io_in_0_c_bits_opcode,
  input  [2:0] io_in_0_c_bits_param,
  input  [2:0] io_in_0_c_bits_size,
  input  [3:0] io_in_0_c_bits_source,
  input  [12:0] io_in_0_c_bits_address,
  input  [31:0] io_in_0_c_bits_data,
  input   io_in_0_c_bits_error,
  input   io_in_0_d_ready,
  output  io_in_0_d_valid,
  output [2:0] io_in_0_d_bits_opcode,
  output [1:0] io_in_0_d_bits_param,
  output [2:0] io_in_0_d_bits_size,
  output [3:0] io_in_0_d_bits_source,
  output  io_in_0_d_bits_sink,
  output [1:0] io_in_0_d_bits_addr_lo,
  output [31:0] io_in_0_d_bits_data,
  output  io_in_0_d_bits_error,
  output  io_in_0_e_ready,
  input   io_in_0_e_valid,
  input   io_in_0_e_bits_sink,
  input   io_out_0_a_ready,
  output  io_out_0_a_valid,
  output [2:0] io_out_0_a_bits_opcode,
  output [2:0] io_out_0_a_bits_param,
  output [2:0] io_out_0_a_bits_size,
  output [3:0] io_out_0_a_bits_source,
  output [12:0] io_out_0_a_bits_address,
  output [3:0] io_out_0_a_bits_mask,
  output [31:0] io_out_0_a_bits_data,
  output  io_out_0_b_ready,
  input   io_out_0_b_valid,
  input  [2:0] io_out_0_b_bits_opcode,
  input  [1:0] io_out_0_b_bits_param,
  input  [2:0] io_out_0_b_bits_size,
  input  [3:0] io_out_0_b_bits_source,
  input  [12:0] io_out_0_b_bits_address,
  input  [3:0] io_out_0_b_bits_mask,
  input  [31:0] io_out_0_b_bits_data,
  input   io_out_0_c_ready,
  output  io_out_0_c_valid,
  output [2:0] io_out_0_c_bits_opcode,
  output [2:0] io_out_0_c_bits_param,
  output [2:0] io_out_0_c_bits_size,
  output [3:0] io_out_0_c_bits_source,
  output [12:0] io_out_0_c_bits_address,
  output [31:0] io_out_0_c_bits_data,
  output  io_out_0_c_bits_error,
  output  io_out_0_d_ready,
  input   io_out_0_d_valid,
  input  [2:0] io_out_0_d_bits_opcode,
  input  [1:0] io_out_0_d_bits_param,
  input  [2:0] io_out_0_d_bits_size,
  input  [3:0] io_out_0_d_bits_source,
  input   io_out_0_d_bits_sink,
  input  [1:0] io_out_0_d_bits_addr_lo,
  input  [31:0] io_out_0_d_bits_data,
  input   io_out_0_d_bits_error,
  input   io_out_0_e_ready,
  output  io_out_0_e_valid,
  output  io_out_0_e_bits_sink
);
  wire  in_0_a_ready;
  wire  in_0_a_valid;
  wire [2:0] in_0_a_bits_opcode;
  wire [2:0] in_0_a_bits_param;
  wire [2:0] in_0_a_bits_size;
  wire [3:0] in_0_a_bits_source;
  wire [12:0] in_0_a_bits_address;
  wire [3:0] in_0_a_bits_mask;
  wire [31:0] in_0_a_bits_data;
  wire  in_0_b_ready;
  wire  in_0_b_valid;
  wire [2:0] in_0_b_bits_opcode;
  wire [1:0] in_0_b_bits_param;
  wire [2:0] in_0_b_bits_size;
  wire [3:0] in_0_b_bits_source;
  wire [12:0] in_0_b_bits_address;
  wire [3:0] in_0_b_bits_mask;
  wire [31:0] in_0_b_bits_data;
  wire  in_0_c_ready;
  wire  in_0_c_valid;
  wire [2:0] in_0_c_bits_opcode;
  wire [2:0] in_0_c_bits_param;
  wire [2:0] in_0_c_bits_size;
  wire [3:0] in_0_c_bits_source;
  wire [12:0] in_0_c_bits_address;
  wire [31:0] in_0_c_bits_data;
  wire  in_0_c_bits_error;
  wire  in_0_d_ready;
  wire  in_0_d_valid;
  wire [2:0] in_0_d_bits_opcode;
  wire [1:0] in_0_d_bits_param;
  wire [2:0] in_0_d_bits_size;
  wire [3:0] in_0_d_bits_source;
  wire  in_0_d_bits_sink;
  wire [1:0] in_0_d_bits_addr_lo;
  wire [31:0] in_0_d_bits_data;
  wire  in_0_d_bits_error;
  wire  in_0_e_ready;
  wire  in_0_e_valid;
  wire  in_0_e_bits_sink;
  wire  out_0_a_ready;
  wire  out_0_a_valid;
  wire [2:0] out_0_a_bits_opcode;
  wire [2:0] out_0_a_bits_param;
  wire [2:0] out_0_a_bits_size;
  wire [3:0] out_0_a_bits_source;
  wire [12:0] out_0_a_bits_address;
  wire [3:0] out_0_a_bits_mask;
  wire [31:0] out_0_a_bits_data;
  wire  out_0_b_ready;
  wire  out_0_b_valid;
  wire [2:0] out_0_b_bits_opcode;
  wire [1:0] out_0_b_bits_param;
  wire [2:0] out_0_b_bits_size;
  wire [3:0] out_0_b_bits_source;
  wire [12:0] out_0_b_bits_address;
  wire [3:0] out_0_b_bits_mask;
  wire [31:0] out_0_b_bits_data;
  wire  out_0_c_ready;
  wire  out_0_c_valid;
  wire [2:0] out_0_c_bits_opcode;
  wire [2:0] out_0_c_bits_param;
  wire [2:0] out_0_c_bits_size;
  wire [3:0] out_0_c_bits_source;
  wire [12:0] out_0_c_bits_address;
  wire [31:0] out_0_c_bits_data;
  wire  out_0_c_bits_error;
  wire  out_0_d_ready;
  wire  out_0_d_valid;
  wire [2:0] out_0_d_bits_opcode;
  wire [1:0] out_0_d_bits_param;
  wire [2:0] out_0_d_bits_size;
  wire [3:0] out_0_d_bits_source;
  wire  out_0_d_bits_sink;
  wire [1:0] out_0_d_bits_addr_lo;
  wire [31:0] out_0_d_bits_data;
  wire  out_0_d_bits_error;
  wire  out_0_e_ready;
  wire  out_0_e_valid;
  wire  out_0_e_bits_sink;
  wire  _T_3169_0;
  wire  requestAIO_0_0;
  wire  _T_3216_0;
  wire  requestCIO_0_0;
  wire  _T_3263_0;
  wire  requestBOI_0_0;
  wire  _T_3310_0;
  wire  requestDOI_0_0;
  wire  _T_3346;
  wire  _T_3351_0;
  wire  requestEIO_0_0;
  wire [3:0] beatsAI_0;
  wire [3:0] beatsBO_0;
  wire [12:0] _T_3426;
  wire [5:0] _T_3427;
  wire [5:0] _T_3428;
  wire [3:0] _T_3429;
  wire  _T_3430;
  wire [3:0] _T_3432;
  wire [3:0] beatsCI_0;
  wire [12:0] _T_3442;
  wire [5:0] _T_3443;
  wire [5:0] _T_3444;
  wire [3:0] _T_3445;
  wire [3:0] beatsDO_0;
  wire  beatsEI_0;
  wire  _T_3507_0_ready;
  wire  _T_3507_0_valid;
  wire [2:0] _T_3507_0_bits_opcode;
  wire [2:0] _T_3507_0_bits_param;
  wire [2:0] _T_3507_0_bits_size;
  wire [3:0] _T_3507_0_bits_source;
  wire [12:0] _T_3507_0_bits_address;
  wire [3:0] _T_3507_0_bits_mask;
  wire [31:0] _T_3507_0_bits_data;
  wire  _T_3549;
  wire  _T_3592_0_ready;
  wire  _T_3592_0_valid;
  wire [2:0] _T_3592_0_bits_opcode;
  wire [1:0] _T_3592_0_bits_param;
  wire [2:0] _T_3592_0_bits_size;
  wire [3:0] _T_3592_0_bits_source;
  wire [12:0] _T_3592_0_bits_address;
  wire [3:0] _T_3592_0_bits_mask;
  wire [31:0] _T_3592_0_bits_data;
  wire  _T_3634;
  wire  _T_3677_0_ready;
  wire  _T_3677_0_valid;
  wire [2:0] _T_3677_0_bits_opcode;
  wire [2:0] _T_3677_0_bits_param;
  wire [2:0] _T_3677_0_bits_size;
  wire [3:0] _T_3677_0_bits_source;
  wire [12:0] _T_3677_0_bits_address;
  wire [31:0] _T_3677_0_bits_data;
  wire  _T_3677_0_bits_error;
  wire  _T_3719;
  wire  _T_3766_0_ready;
  wire  _T_3766_0_valid;
  wire [2:0] _T_3766_0_bits_opcode;
  wire [1:0] _T_3766_0_bits_param;
  wire [2:0] _T_3766_0_bits_size;
  wire [3:0] _T_3766_0_bits_source;
  wire  _T_3766_0_bits_sink;
  wire [1:0] _T_3766_0_bits_addr_lo;
  wire [31:0] _T_3766_0_bits_data;
  wire  _T_3766_0_bits_error;
  wire  _T_3812;
  wire  _T_3831_0_ready;
  wire  _T_3831_0_valid;
  wire  _T_3831_0_bits_sink;
  wire  _T_3849;
  reg [3:0] _T_3851;
  reg [31:0] _GEN_20;
  wire  _T_3853;
  wire  _T_3854;
  wire  _T_3857;
  wire  _T_3863_0;
  wire  _T_3867;
  wire  _T_3872_0;
  wire  _T_3888;
  wire  _T_3889;
  wire  _T_3891;
  wire [3:0] _T_3893;
  wire  _T_3894;
  wire [3:0] _GEN_0;
  wire [4:0] _T_3895;
  wire [3:0] _T_3896;
  wire [3:0] _T_3897;
  wire  _T_3903_0;
  reg  _T_3907_0;
  reg [31:0] _GEN_21;
  wire  _T_3911_0;
  reg [3:0] _T_3920;
  reg [31:0] _GEN_22;
  wire  _T_3922;
  wire  _T_3923;
  wire  _T_3926;
  wire  _T_3932_0;
  wire  _T_3936;
  wire  _T_3941_0;
  wire  _T_3957;
  wire  _T_3958;
  wire  _T_3960;
  wire [3:0] _T_3962;
  wire  _T_3963;
  wire [3:0] _GEN_1;
  wire [4:0] _T_3964;
  wire [3:0] _T_3965;
  wire [3:0] _T_3966;
  wire  _T_3972_0;
  reg  _T_3976_0;
  reg [31:0] _GEN_23;
  wire  _T_3980_0;
  reg [2:0] _GEN_2;
  reg [31:0] _GEN_24;
  reg [1:0] _GEN_3;
  reg [31:0] _GEN_25;
  reg [2:0] _GEN_4;
  reg [31:0] _GEN_26;
  reg [3:0] _GEN_5;
  reg [31:0] _GEN_27;
  reg [12:0] _GEN_6;
  reg [31:0] _GEN_28;
  reg [3:0] _GEN_7;
  reg [31:0] _GEN_29;
  reg [31:0] _GEN_8;
  reg [31:0] _GEN_30;
  reg [2:0] _GEN_9;
  reg [31:0] _GEN_31;
  reg [2:0] _GEN_10;
  reg [31:0] _GEN_32;
  reg [2:0] _GEN_11;
  reg [31:0] _GEN_33;
  reg [3:0] _GEN_12;
  reg [31:0] _GEN_34;
  reg [12:0] _GEN_13;
  reg [31:0] _GEN_35;
  reg [31:0] _GEN_14;
  reg [31:0] _GEN_36;
  reg  _GEN_15;
  reg [31:0] _GEN_37;
  reg  _GEN_16;
  reg [31:0] _GEN_38;
  reg  _GEN_17;
  reg [31:0] _GEN_39;
  reg  _GEN_18;
  reg [31:0] _GEN_40;
  reg  _GEN_19;
  reg [31:0] _GEN_41;
  assign io_in_0_a_ready = in_0_a_ready;
  assign io_in_0_b_valid = in_0_b_valid;
  assign io_in_0_b_bits_opcode = in_0_b_bits_opcode;
  assign io_in_0_b_bits_param = in_0_b_bits_param;
  assign io_in_0_b_bits_size = in_0_b_bits_size;
  assign io_in_0_b_bits_source = in_0_b_bits_source;
  assign io_in_0_b_bits_address = in_0_b_bits_address;
  assign io_in_0_b_bits_mask = in_0_b_bits_mask;
  assign io_in_0_b_bits_data = in_0_b_bits_data;
  assign io_in_0_c_ready = in_0_c_ready;
  assign io_in_0_d_valid = in_0_d_valid;
  assign io_in_0_d_bits_opcode = in_0_d_bits_opcode;
  assign io_in_0_d_bits_param = in_0_d_bits_param;
  assign io_in_0_d_bits_size = in_0_d_bits_size;
  assign io_in_0_d_bits_source = in_0_d_bits_source;
  assign io_in_0_d_bits_sink = in_0_d_bits_sink;
  assign io_in_0_d_bits_addr_lo = in_0_d_bits_addr_lo;
  assign io_in_0_d_bits_data = in_0_d_bits_data;
  assign io_in_0_d_bits_error = in_0_d_bits_error;
  assign io_in_0_e_ready = in_0_e_ready;
  assign io_out_0_a_valid = out_0_a_valid;
  assign io_out_0_a_bits_opcode = out_0_a_bits_opcode;
  assign io_out_0_a_bits_param = out_0_a_bits_param;
  assign io_out_0_a_bits_size = out_0_a_bits_size;
  assign io_out_0_a_bits_source = out_0_a_bits_source;
  assign io_out_0_a_bits_address = out_0_a_bits_address;
  assign io_out_0_a_bits_mask = out_0_a_bits_mask;
  assign io_out_0_a_bits_data = out_0_a_bits_data;
  assign io_out_0_b_ready = out_0_b_ready;
  assign io_out_0_c_valid = out_0_c_valid;
  assign io_out_0_c_bits_opcode = out_0_c_bits_opcode;
  assign io_out_0_c_bits_param = out_0_c_bits_param;
  assign io_out_0_c_bits_size = out_0_c_bits_size;
  assign io_out_0_c_bits_source = out_0_c_bits_source;
  assign io_out_0_c_bits_address = out_0_c_bits_address;
  assign io_out_0_c_bits_data = out_0_c_bits_data;
  assign io_out_0_c_bits_error = out_0_c_bits_error;
  assign io_out_0_d_ready = out_0_d_ready;
  assign io_out_0_e_valid = out_0_e_valid;
  assign io_out_0_e_bits_sink = 1'h0;
  assign in_0_a_ready = _T_3507_0_ready;
  assign in_0_a_valid = io_in_0_a_valid;
  assign in_0_a_bits_opcode = io_in_0_a_bits_opcode;
  assign in_0_a_bits_param = io_in_0_a_bits_param;
  assign in_0_a_bits_size = io_in_0_a_bits_size;
  assign in_0_a_bits_source = io_in_0_a_bits_source;
  assign in_0_a_bits_address = io_in_0_a_bits_address;
  assign in_0_a_bits_mask = io_in_0_a_bits_mask;
  assign in_0_a_bits_data = io_in_0_a_bits_data;
  assign in_0_b_ready = io_in_0_b_ready;
  assign in_0_b_valid = 1'h0;
  assign in_0_b_bits_opcode = _GEN_2;
  assign in_0_b_bits_param = _GEN_3;
  assign in_0_b_bits_size = _GEN_4;
  assign in_0_b_bits_source = _GEN_5;
  assign in_0_b_bits_address = _GEN_6;
  assign in_0_b_bits_mask = _GEN_7;
  assign in_0_b_bits_data = _GEN_8;
  assign in_0_c_ready = _T_3677_0_ready;
  assign in_0_c_valid = io_in_0_c_valid;
  assign in_0_c_bits_opcode = io_in_0_c_bits_opcode;
  assign in_0_c_bits_param = io_in_0_c_bits_param;
  assign in_0_c_bits_size = io_in_0_c_bits_size;
  assign in_0_c_bits_source = io_in_0_c_bits_source;
  assign in_0_c_bits_address = io_in_0_c_bits_address;
  assign in_0_c_bits_data = io_in_0_c_bits_data;
  assign in_0_c_bits_error = io_in_0_c_bits_error;
  assign in_0_d_ready = io_in_0_d_ready;
  assign in_0_d_valid = _T_3766_0_valid;
  assign in_0_d_bits_opcode = _T_3766_0_bits_opcode;
  assign in_0_d_bits_param = _T_3766_0_bits_param;
  assign in_0_d_bits_size = _T_3766_0_bits_size;
  assign in_0_d_bits_source = _T_3766_0_bits_source;
  assign in_0_d_bits_sink = _T_3766_0_bits_sink;
  assign in_0_d_bits_addr_lo = _T_3766_0_bits_addr_lo;
  assign in_0_d_bits_data = _T_3766_0_bits_data;
  assign in_0_d_bits_error = _T_3766_0_bits_error;
  assign in_0_e_ready = _T_3831_0_ready;
  assign in_0_e_valid = io_in_0_e_valid;
  assign in_0_e_bits_sink = io_in_0_e_bits_sink;
  assign out_0_a_ready = io_out_0_a_ready;
  assign out_0_a_valid = _T_3507_0_valid;
  assign out_0_a_bits_opcode = _T_3507_0_bits_opcode;
  assign out_0_a_bits_param = _T_3507_0_bits_param;
  assign out_0_a_bits_size = _T_3507_0_bits_size;
  assign out_0_a_bits_source = _T_3507_0_bits_source;
  assign out_0_a_bits_address = _T_3507_0_bits_address;
  assign out_0_a_bits_mask = _T_3507_0_bits_mask;
  assign out_0_a_bits_data = _T_3507_0_bits_data;
  assign out_0_b_ready = _T_3592_0_ready;
  assign out_0_b_valid = io_out_0_b_valid;
  assign out_0_b_bits_opcode = io_out_0_b_bits_opcode;
  assign out_0_b_bits_param = io_out_0_b_bits_param;
  assign out_0_b_bits_size = io_out_0_b_bits_size;
  assign out_0_b_bits_source = io_out_0_b_bits_source;
  assign out_0_b_bits_address = io_out_0_b_bits_address;
  assign out_0_b_bits_mask = io_out_0_b_bits_mask;
  assign out_0_b_bits_data = io_out_0_b_bits_data;
  assign out_0_c_ready = io_out_0_c_ready;
  assign out_0_c_valid = 1'h0;
  assign out_0_c_bits_opcode = _GEN_9;
  assign out_0_c_bits_param = _GEN_10;
  assign out_0_c_bits_size = _GEN_11;
  assign out_0_c_bits_source = _GEN_12;
  assign out_0_c_bits_address = _GEN_13;
  assign out_0_c_bits_data = _GEN_14;
  assign out_0_c_bits_error = _GEN_15;
  assign out_0_d_ready = _T_3766_0_ready;
  assign out_0_d_valid = io_out_0_d_valid;
  assign out_0_d_bits_opcode = io_out_0_d_bits_opcode;
  assign out_0_d_bits_param = io_out_0_d_bits_param;
  assign out_0_d_bits_size = io_out_0_d_bits_size;
  assign out_0_d_bits_source = io_out_0_d_bits_source;
  assign out_0_d_bits_sink = io_out_0_d_bits_sink;
  assign out_0_d_bits_addr_lo = io_out_0_d_bits_addr_lo;
  assign out_0_d_bits_data = io_out_0_d_bits_data;
  assign out_0_d_bits_error = io_out_0_d_bits_error;
  assign out_0_e_ready = io_out_0_e_ready;
  assign out_0_e_valid = 1'h0;
  assign out_0_e_bits_sink = _GEN_16;
  assign _T_3169_0 = 1'h1;
  assign requestAIO_0_0 = _T_3169_0;
  assign _T_3216_0 = 1'h1;
  assign requestCIO_0_0 = _T_3216_0;
  assign _T_3263_0 = 1'h1;
  assign requestBOI_0_0 = _T_3263_0;
  assign _T_3310_0 = 1'h1;
  assign requestDOI_0_0 = _T_3310_0;
  assign _T_3346 = 1'h0 == in_0_e_bits_sink;
  assign _T_3351_0 = _T_3346;
  assign requestEIO_0_0 = _T_3351_0;
  assign beatsAI_0 = 4'h0;
  assign beatsBO_0 = 4'h0;
  assign _T_3426 = 13'h3f << in_0_c_bits_size;
  assign _T_3427 = _T_3426[5:0];
  assign _T_3428 = ~ _T_3427;
  assign _T_3429 = _T_3428[5:2];
  assign _T_3430 = in_0_c_bits_opcode[0];
  assign _T_3432 = _T_3430 ? _T_3429 : 4'h0;
  assign beatsCI_0 = _T_3432;
  assign _T_3442 = 13'h3f << out_0_d_bits_size;
  assign _T_3443 = _T_3442[5:0];
  assign _T_3444 = ~ _T_3443;
  assign _T_3445 = _T_3444[5:2];
  assign beatsDO_0 = _T_3445;
  assign beatsEI_0 = 1'h0;
  assign _T_3507_0_ready = out_0_a_ready;
  assign _T_3507_0_valid = _T_3549;
  assign _T_3507_0_bits_opcode = in_0_a_bits_opcode;
  assign _T_3507_0_bits_param = in_0_a_bits_param;
  assign _T_3507_0_bits_size = in_0_a_bits_size;
  assign _T_3507_0_bits_source = in_0_a_bits_source;
  assign _T_3507_0_bits_address = in_0_a_bits_address;
  assign _T_3507_0_bits_mask = in_0_a_bits_mask;
  assign _T_3507_0_bits_data = in_0_a_bits_data;
  assign _T_3549 = in_0_a_valid & requestAIO_0_0;
  assign _T_3592_0_ready = _GEN_17;
  assign _T_3592_0_valid = _T_3634;
  assign _T_3592_0_bits_opcode = out_0_b_bits_opcode;
  assign _T_3592_0_bits_param = out_0_b_bits_param;
  assign _T_3592_0_bits_size = out_0_b_bits_size;
  assign _T_3592_0_bits_source = out_0_b_bits_source;
  assign _T_3592_0_bits_address = out_0_b_bits_address;
  assign _T_3592_0_bits_mask = out_0_b_bits_mask;
  assign _T_3592_0_bits_data = out_0_b_bits_data;
  assign _T_3634 = out_0_b_valid & requestBOI_0_0;
  assign _T_3677_0_ready = _GEN_18;
  assign _T_3677_0_valid = _T_3719;
  assign _T_3677_0_bits_opcode = in_0_c_bits_opcode;
  assign _T_3677_0_bits_param = in_0_c_bits_param;
  assign _T_3677_0_bits_size = in_0_c_bits_size;
  assign _T_3677_0_bits_source = in_0_c_bits_source;
  assign _T_3677_0_bits_address = in_0_c_bits_address;
  assign _T_3677_0_bits_data = in_0_c_bits_data;
  assign _T_3677_0_bits_error = in_0_c_bits_error;
  assign _T_3719 = in_0_c_valid & requestCIO_0_0;
  assign _T_3766_0_ready = in_0_d_ready;
  assign _T_3766_0_valid = _T_3812;
  assign _T_3766_0_bits_opcode = out_0_d_bits_opcode;
  assign _T_3766_0_bits_param = out_0_d_bits_param;
  assign _T_3766_0_bits_size = out_0_d_bits_size;
  assign _T_3766_0_bits_source = out_0_d_bits_source;
  assign _T_3766_0_bits_sink = out_0_d_bits_sink;
  assign _T_3766_0_bits_addr_lo = out_0_d_bits_addr_lo;
  assign _T_3766_0_bits_data = out_0_d_bits_data;
  assign _T_3766_0_bits_error = out_0_d_bits_error;
  assign _T_3812 = out_0_d_valid & requestDOI_0_0;
  assign _T_3831_0_ready = _GEN_19;
  assign _T_3831_0_valid = _T_3849;
  assign _T_3831_0_bits_sink = in_0_e_bits_sink;
  assign _T_3849 = in_0_e_valid & requestEIO_0_0;
  assign _T_3853 = _T_3851 == 4'h0;
  assign _T_3854 = _T_3853 & out_0_a_ready;
  assign _T_3857 = _T_3507_0_valid == 1'h0;
  assign _T_3863_0 = 1'h1;
  assign _T_3867 = _T_3863_0 & _T_3507_0_valid;
  assign _T_3872_0 = _T_3867;
  assign _T_3888 = _T_3857 | _T_3872_0;
  assign _T_3889 = _T_3888 | reset;
  assign _T_3891 = _T_3889 == 1'h0;
  assign _T_3893 = _T_3872_0 ? beatsAI_0 : 4'h0;
  assign _T_3894 = out_0_a_ready & out_0_a_valid;
  assign _GEN_0 = {{3'd0}, _T_3894};
  assign _T_3895 = _T_3851 - _GEN_0;
  assign _T_3896 = _T_3895[3:0];
  assign _T_3897 = _T_3854 ? _T_3893 : _T_3896;
  assign _T_3903_0 = 1'h0;
  assign _T_3911_0 = _T_3853 ? _T_3872_0 : _T_3907_0;
  assign _T_3922 = _T_3920 == 4'h0;
  assign _T_3923 = _T_3922 & in_0_d_ready;
  assign _T_3926 = _T_3766_0_valid == 1'h0;
  assign _T_3932_0 = 1'h1;
  assign _T_3936 = _T_3932_0 & _T_3766_0_valid;
  assign _T_3941_0 = _T_3936;
  assign _T_3957 = _T_3926 | _T_3941_0;
  assign _T_3958 = _T_3957 | reset;
  assign _T_3960 = _T_3958 == 1'h0;
  assign _T_3962 = _T_3941_0 ? beatsDO_0 : 4'h0;
  assign _T_3963 = in_0_d_ready & in_0_d_valid;
  assign _GEN_1 = {{3'd0}, _T_3963};
  assign _T_3964 = _T_3920 - _GEN_1;
  assign _T_3965 = _T_3964[3:0];
  assign _T_3966 = _T_3923 ? _T_3962 : _T_3965;
  assign _T_3972_0 = 1'h0;
  assign _T_3980_0 = _T_3922 ? _T_3941_0 : _T_3976_0;
`ifdef RANDOMIZE
  integer initvar;
  initial begin
    `ifndef verilator
      #0.002 begin end
    `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_20 = {1{$random}};
  _T_3851 = _GEN_20[3:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_21 = {1{$random}};
  _T_3907_0 = _GEN_21[0:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_22 = {1{$random}};
  _T_3920 = _GEN_22[3:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_23 = {1{$random}};
  _T_3976_0 = _GEN_23[0:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_24 = {1{$random}};
  _GEN_2 = _GEN_24[2:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_25 = {1{$random}};
  _GEN_3 = _GEN_25[1:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_26 = {1{$random}};
  _GEN_4 = _GEN_26[2:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_27 = {1{$random}};
  _GEN_5 = _GEN_27[3:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_28 = {1{$random}};
  _GEN_6 = _GEN_28[12:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_29 = {1{$random}};
  _GEN_7 = _GEN_29[3:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_30 = {1{$random}};
  _GEN_8 = _GEN_30[31:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_31 = {1{$random}};
  _GEN_9 = _GEN_31[2:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_32 = {1{$random}};
  _GEN_10 = _GEN_32[2:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_33 = {1{$random}};
  _GEN_11 = _GEN_33[2:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_34 = {1{$random}};
  _GEN_12 = _GEN_34[3:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_35 = {1{$random}};
  _GEN_13 = _GEN_35[12:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_36 = {1{$random}};
  _GEN_14 = _GEN_36[31:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_37 = {1{$random}};
  _GEN_15 = _GEN_37[0:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_38 = {1{$random}};
  _GEN_16 = _GEN_38[0:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_39 = {1{$random}};
  _GEN_17 = _GEN_39[0:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_40 = {1{$random}};
  _GEN_18 = _GEN_40[0:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_41 = {1{$random}};
  _GEN_19 = _GEN_41[0:0];
  `endif
  end
`endif
  always @(posedge clock) begin
    if (reset) begin
      _T_3851 <= 4'h0;
    end else begin
      if (_T_3854) begin
        if (_T_3872_0) begin
          _T_3851 <= beatsAI_0;
        end else begin
          _T_3851 <= 4'h0;
        end
      end else begin
        _T_3851 <= _T_3896;
      end
    end
    if (reset) begin
      _T_3907_0 <= _T_3903_0;
    end else begin
      if (_T_3853) begin
        _T_3907_0 <= _T_3872_0;
      end
    end
    if (reset) begin
      _T_3920 <= 4'h0;
    end else begin
      if (_T_3923) begin
        if (_T_3941_0) begin
          _T_3920 <= beatsDO_0;
        end else begin
          _T_3920 <= 4'h0;
        end
      end else begin
        _T_3920 <= _T_3965;
      end
    end
    if (reset) begin
      _T_3976_0 <= _T_3972_0;
    end else begin
      if (_T_3922) begin
        _T_3976_0 <= _T_3941_0;
      end
    end
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (1'h0) begin
          $fwrite(32'h80000002,"Assertion failed\n    at Arbiter.scala:48 assert((prefixOR zip winner) map { case (p,w) => !p || !w } reduce {_ && _})\n");
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (1'h0) begin
          $fatal;
        end
    `ifdef STOP_COND
      end
    `endif
    `endif
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_3891) begin
          $fwrite(32'h80000002,"Assertion failed\n    at Arbiter.scala:50 assert (!valids.reduce(_||_) || winner.reduce(_||_))\n");
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_T_3891) begin
          $fatal;
        end
    `ifdef STOP_COND
      end
    `endif
    `endif
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (1'h0) begin
          $fwrite(32'h80000002,"Assertion failed\n    at Arbiter.scala:48 assert((prefixOR zip winner) map { case (p,w) => !p || !w } reduce {_ && _})\n");
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (1'h0) begin
          $fatal;
        end
    `ifdef STOP_COND
      end
    `endif
    `endif
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_3960) begin
          $fwrite(32'h80000002,"Assertion failed\n    at Arbiter.scala:50 assert (!valids.reduce(_||_) || winner.reduce(_||_))\n");
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_T_3960) begin
          $fatal;
        end
    `ifdef STOP_COND
      end
    `endif
    `endif
  end
endmodule