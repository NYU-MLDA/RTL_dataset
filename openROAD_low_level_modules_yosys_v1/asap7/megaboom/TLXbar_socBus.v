module TLXbar_socBus(
  input   clock,
  input   reset,
  output  io_in_0_a_ready,
  input   io_in_0_a_valid,
  input  [2:0] io_in_0_a_bits_opcode,
  input  [2:0] io_in_0_a_bits_param,
  input  [3:0] io_in_0_a_bits_size,
  input  [3:0] io_in_0_a_bits_source,
  input  [30:0] io_in_0_a_bits_address,
  input  [15:0] io_in_0_a_bits_mask,
  input  [127:0] io_in_0_a_bits_data,
  input   io_in_0_b_ready,
  output  io_in_0_b_valid,
  output [2:0] io_in_0_b_bits_opcode,
  output [1:0] io_in_0_b_bits_param,
  output [3:0] io_in_0_b_bits_size,
  output [3:0] io_in_0_b_bits_source,
  output [30:0] io_in_0_b_bits_address,
  output [15:0] io_in_0_b_bits_mask,
  output [127:0] io_in_0_b_bits_data,
  output  io_in_0_c_ready,
  input   io_in_0_c_valid,
  input  [2:0] io_in_0_c_bits_opcode,
  input  [2:0] io_in_0_c_bits_param,
  input  [3:0] io_in_0_c_bits_size,
  input  [3:0] io_in_0_c_bits_source,
  input  [30:0] io_in_0_c_bits_address,
  input  [127:0] io_in_0_c_bits_data,
  input   io_in_0_c_bits_error,
  input   io_in_0_d_ready,
  output  io_in_0_d_valid,
  output [2:0] io_in_0_d_bits_opcode,
  output [1:0] io_in_0_d_bits_param,
  output [3:0] io_in_0_d_bits_size,
  output [3:0] io_in_0_d_bits_source,
  output  io_in_0_d_bits_sink,
  output [3:0] io_in_0_d_bits_addr_lo,
  output [127:0] io_in_0_d_bits_data,
  output  io_in_0_d_bits_error,
  output  io_in_0_e_ready,
  input   io_in_0_e_valid,
  input   io_in_0_e_bits_sink,
  input   io_out_0_a_ready,
  output  io_out_0_a_valid,
  output [2:0] io_out_0_a_bits_opcode,
  output [2:0] io_out_0_a_bits_param,
  output [3:0] io_out_0_a_bits_size,
  output [3:0] io_out_0_a_bits_source,
  output [30:0] io_out_0_a_bits_address,
  output [15:0] io_out_0_a_bits_mask,
  output [127:0] io_out_0_a_bits_data,
  output  io_out_0_b_ready,
  input   io_out_0_b_valid,
  input  [2:0] io_out_0_b_bits_opcode,
  input  [1:0] io_out_0_b_bits_param,
  input  [3:0] io_out_0_b_bits_size,
  input  [3:0] io_out_0_b_bits_source,
  input  [30:0] io_out_0_b_bits_address,
  input  [15:0] io_out_0_b_bits_mask,
  input  [127:0] io_out_0_b_bits_data,
  input   io_out_0_c_ready,
  output  io_out_0_c_valid,
  output [2:0] io_out_0_c_bits_opcode,
  output [2:0] io_out_0_c_bits_param,
  output [3:0] io_out_0_c_bits_size,
  output [3:0] io_out_0_c_bits_source,
  output [30:0] io_out_0_c_bits_address,
  output [127:0] io_out_0_c_bits_data,
  output  io_out_0_c_bits_error,
  output  io_out_0_d_ready,
  input   io_out_0_d_valid,
  input  [2:0] io_out_0_d_bits_opcode,
  input  [1:0] io_out_0_d_bits_param,
  input  [3:0] io_out_0_d_bits_size,
  input  [3:0] io_out_0_d_bits_source,
  input   io_out_0_d_bits_sink,
  input  [3:0] io_out_0_d_bits_addr_lo,
  input  [127:0] io_out_0_d_bits_data,
  input   io_out_0_d_bits_error,
  input   io_out_0_e_ready,
  output  io_out_0_e_valid,
  output  io_out_0_e_bits_sink,
  input   io_out_1_a_ready,
  output  io_out_1_a_valid,
  output [2:0] io_out_1_a_bits_opcode,
  output [2:0] io_out_1_a_bits_param,
  output [3:0] io_out_1_a_bits_size,
  output [3:0] io_out_1_a_bits_source,
  output [30:0] io_out_1_a_bits_address,
  output [15:0] io_out_1_a_bits_mask,
  output [127:0] io_out_1_a_bits_data,
  output  io_out_1_b_ready,
  input   io_out_1_b_valid,
  input  [2:0] io_out_1_b_bits_opcode,
  input  [1:0] io_out_1_b_bits_param,
  input  [3:0] io_out_1_b_bits_size,
  input  [3:0] io_out_1_b_bits_source,
  input  [30:0] io_out_1_b_bits_address,
  input  [15:0] io_out_1_b_bits_mask,
  input  [127:0] io_out_1_b_bits_data,
  input   io_out_1_c_ready,
  output  io_out_1_c_valid,
  output [2:0] io_out_1_c_bits_opcode,
  output [2:0] io_out_1_c_bits_param,
  output [3:0] io_out_1_c_bits_size,
  output [3:0] io_out_1_c_bits_source,
  output [30:0] io_out_1_c_bits_address,
  output [127:0] io_out_1_c_bits_data,
  output  io_out_1_c_bits_error,
  output  io_out_1_d_ready,
  input   io_out_1_d_valid,
  input  [2:0] io_out_1_d_bits_opcode,
  input  [1:0] io_out_1_d_bits_param,
  input  [3:0] io_out_1_d_bits_size,
  input  [3:0] io_out_1_d_bits_source,
  input   io_out_1_d_bits_sink,
  input  [3:0] io_out_1_d_bits_addr_lo,
  input  [127:0] io_out_1_d_bits_data,
  input   io_out_1_d_bits_error,
  input   io_out_1_e_ready,
  output  io_out_1_e_valid,
  output  io_out_1_e_bits_sink
);
  wire  in_0_a_ready;
  wire  in_0_a_valid;
  wire [2:0] in_0_a_bits_opcode;
  wire [2:0] in_0_a_bits_param;
  wire [3:0] in_0_a_bits_size;
  wire [3:0] in_0_a_bits_source;
  wire [30:0] in_0_a_bits_address;
  wire [15:0] in_0_a_bits_mask;
  wire [127:0] in_0_a_bits_data;
  wire  in_0_b_ready;
  wire  in_0_b_valid;
  wire [2:0] in_0_b_bits_opcode;
  wire [1:0] in_0_b_bits_param;
  wire [3:0] in_0_b_bits_size;
  wire [3:0] in_0_b_bits_source;
  wire [30:0] in_0_b_bits_address;
  wire [15:0] in_0_b_bits_mask;
  wire [127:0] in_0_b_bits_data;
  wire  in_0_c_ready;
  wire  in_0_c_valid;
  wire [2:0] in_0_c_bits_opcode;
  wire [2:0] in_0_c_bits_param;
  wire [3:0] in_0_c_bits_size;
  wire [3:0] in_0_c_bits_source;
  wire [30:0] in_0_c_bits_address;
  wire [127:0] in_0_c_bits_data;
  wire  in_0_c_bits_error;
  wire  in_0_d_ready;
  wire  in_0_d_valid;
  wire [2:0] in_0_d_bits_opcode;
  wire [1:0] in_0_d_bits_param;
  wire [3:0] in_0_d_bits_size;
  wire [3:0] in_0_d_bits_source;
  wire  in_0_d_bits_sink;
  wire [3:0] in_0_d_bits_addr_lo;
  wire [127:0] in_0_d_bits_data;
  wire  in_0_d_bits_error;
  wire  in_0_e_ready;
  wire  in_0_e_valid;
  wire  in_0_e_bits_sink;
  wire  out_0_a_ready;
  wire  out_0_a_valid;
  wire [2:0] out_0_a_bits_opcode;
  wire [2:0] out_0_a_bits_param;
  wire [3:0] out_0_a_bits_size;
  wire [3:0] out_0_a_bits_source;
  wire [30:0] out_0_a_bits_address;
  wire [15:0] out_0_a_bits_mask;
  wire [127:0] out_0_a_bits_data;
  wire  out_0_b_ready;
  wire  out_0_b_valid;
  wire [2:0] out_0_b_bits_opcode;
  wire [1:0] out_0_b_bits_param;
  wire [3:0] out_0_b_bits_size;
  wire [3:0] out_0_b_bits_source;
  wire [30:0] out_0_b_bits_address;
  wire [15:0] out_0_b_bits_mask;
  wire [127:0] out_0_b_bits_data;
  wire  out_0_c_ready;
  wire  out_0_c_valid;
  wire [2:0] out_0_c_bits_opcode;
  wire [2:0] out_0_c_bits_param;
  wire [3:0] out_0_c_bits_size;
  wire [3:0] out_0_c_bits_source;
  wire [30:0] out_0_c_bits_address;
  wire [127:0] out_0_c_bits_data;
  wire  out_0_c_bits_error;
  wire  out_0_d_ready;
  wire  out_0_d_valid;
  wire [2:0] out_0_d_bits_opcode;
  wire [1:0] out_0_d_bits_param;
  wire [3:0] out_0_d_bits_size;
  wire [3:0] out_0_d_bits_source;
  wire  out_0_d_bits_sink;
  wire [3:0] out_0_d_bits_addr_lo;
  wire [127:0] out_0_d_bits_data;
  wire  out_0_d_bits_error;
  wire  out_0_e_ready;
  wire  out_0_e_valid;
  wire  out_0_e_bits_sink;
  wire  out_1_a_ready;
  wire  out_1_a_valid;
  wire [2:0] out_1_a_bits_opcode;
  wire [2:0] out_1_a_bits_param;
  wire [3:0] out_1_a_bits_size;
  wire [3:0] out_1_a_bits_source;
  wire [30:0] out_1_a_bits_address;
  wire [15:0] out_1_a_bits_mask;
  wire [127:0] out_1_a_bits_data;
  wire  out_1_b_ready;
  wire  out_1_b_valid;
  wire [2:0] out_1_b_bits_opcode;
  wire [1:0] out_1_b_bits_param;
  wire [3:0] out_1_b_bits_size;
  wire [3:0] out_1_b_bits_source;
  wire [30:0] out_1_b_bits_address;
  wire [15:0] out_1_b_bits_mask;
  wire [127:0] out_1_b_bits_data;
  wire  out_1_c_ready;
  wire  out_1_c_valid;
  wire [2:0] out_1_c_bits_opcode;
  wire [2:0] out_1_c_bits_param;
  wire [3:0] out_1_c_bits_size;
  wire [3:0] out_1_c_bits_source;
  wire [30:0] out_1_c_bits_address;
  wire [127:0] out_1_c_bits_data;
  wire  out_1_c_bits_error;
  wire  out_1_d_ready;
  wire  out_1_d_valid;
  wire [2:0] out_1_d_bits_opcode;
  wire [1:0] out_1_d_bits_param;
  wire [3:0] out_1_d_bits_size;
  wire [3:0] out_1_d_bits_source;
  wire  out_1_d_bits_sink;
  wire [3:0] out_1_d_bits_addr_lo;
  wire [127:0] out_1_d_bits_data;
  wire  out_1_d_bits_error;
  wire  out_1_e_ready;
  wire  out_1_e_valid;
  wire  out_1_e_bits_sink;
  wire [31:0] _T_3684;
  wire [31:0] _T_3686;
  wire [31:0] _T_3687;
  wire  _T_3689;
  wire [30:0] _T_3691;
  wire [31:0] _T_3692;
  wire [31:0] _T_3694;
  wire [31:0] _T_3695;
  wire  _T_3697;
  wire  _T_3703_0;
  wire  _T_3703_1;
  wire  requestAIO_0_0;
  wire  requestAIO_0_1;
  wire [31:0] _T_3749;
  wire [31:0] _T_3751;
  wire [31:0] _T_3752;
  wire  _T_3754;
  wire [30:0] _T_3756;
  wire [31:0] _T_3757;
  wire [31:0] _T_3759;
  wire [31:0] _T_3760;
  wire  _T_3762;
  wire  _T_3768_0;
  wire  _T_3768_1;
  wire  requestCIO_0_0;
  wire  requestCIO_0_1;
  wire  _T_3824_0;
  wire  _T_3840_0;
  wire  requestBOI_0_0;
  wire  requestBOI_1_0;
  wire  _T_3901_0;
  wire  _T_3917_0;
  wire  requestDOI_0_0;
  wire  requestDOI_1_0;
  wire  _T_3969;
  wire  _T_3975_0;
  wire  _T_3975_1;
  wire  requestEIO_0_0;
  wire  requestEIO_0_1;
  wire [22:0] _T_4021;
  wire [7:0] _T_4022;
  wire [7:0] _T_4023;
  wire [3:0] _T_4024;
  wire  _T_4025;
  wire  _T_4027;
  wire [3:0] _T_4029;
  wire [3:0] beatsAI_0;
  wire [3:0] beatsBO_0;
  wire [3:0] beatsBO_1;
  wire [22:0] _T_4072;
  wire [7:0] _T_4073;
  wire [7:0] _T_4074;
  wire [3:0] _T_4075;
  wire  _T_4076;
  wire [3:0] _T_4078;
  wire [3:0] beatsCI_0;
  wire [20:0] _T_4088;
  wire [5:0] _T_4089;
  wire [5:0] _T_4090;
  wire [1:0] _T_4091;
  wire [22:0] _T_4098;
  wire [7:0] _T_4099;
  wire [7:0] _T_4100;
  wire [3:0] _T_4101;
  wire  _T_4102;
  wire [3:0] _T_4104;
  wire [3:0] beatsDO_0;
  wire [3:0] beatsDO_1;
  wire  beatsEI_0;
  wire  _T_4184_0_ready;
  wire  _T_4184_0_valid;
  wire [2:0] _T_4184_0_bits_opcode;
  wire [2:0] _T_4184_0_bits_param;
  wire [3:0] _T_4184_0_bits_size;
  wire [3:0] _T_4184_0_bits_source;
  wire [30:0] _T_4184_0_bits_address;
  wire [15:0] _T_4184_0_bits_mask;
  wire [127:0] _T_4184_0_bits_data;
  wire  _T_4184_1_ready;
  wire  _T_4184_1_valid;
  wire [2:0] _T_4184_1_bits_opcode;
  wire [2:0] _T_4184_1_bits_param;
  wire [3:0] _T_4184_1_bits_size;
  wire [3:0] _T_4184_1_bits_source;
  wire [30:0] _T_4184_1_bits_address;
  wire [15:0] _T_4184_1_bits_mask;
  wire [127:0] _T_4184_1_bits_data;
  wire  _T_4246;
  wire  _T_4247;
  wire  _T_4250;
  wire  _T_4253;
  wire  _T_4255;
  wire  _T_4256;
  wire  _T_4299_0_ready;
  wire  _T_4299_0_valid;
  wire [2:0] _T_4299_0_bits_opcode;
  wire [1:0] _T_4299_0_bits_param;
  wire [3:0] _T_4299_0_bits_size;
  wire [3:0] _T_4299_0_bits_source;
  wire [30:0] _T_4299_0_bits_address;
  wire [15:0] _T_4299_0_bits_mask;
  wire [127:0] _T_4299_0_bits_data;
  wire  _T_4341;
  wire  _T_4384_0_ready;
  wire  _T_4384_0_valid;
  wire [2:0] _T_4384_0_bits_opcode;
  wire [1:0] _T_4384_0_bits_param;
  wire [3:0] _T_4384_0_bits_size;
  wire [3:0] _T_4384_0_bits_source;
  wire [30:0] _T_4384_0_bits_address;
  wire [15:0] _T_4384_0_bits_mask;
  wire [127:0] _T_4384_0_bits_data;
  wire  _T_4426;
  wire  _T_4489_0_ready;
  wire  _T_4489_0_valid;
  wire [2:0] _T_4489_0_bits_opcode;
  wire [2:0] _T_4489_0_bits_param;
  wire [3:0] _T_4489_0_bits_size;
  wire [3:0] _T_4489_0_bits_source;
  wire [30:0] _T_4489_0_bits_address;
  wire [127:0] _T_4489_0_bits_data;
  wire  _T_4489_0_bits_error;
  wire  _T_4489_1_ready;
  wire  _T_4489_1_valid;
  wire [2:0] _T_4489_1_bits_opcode;
  wire [2:0] _T_4489_1_bits_param;
  wire [3:0] _T_4489_1_bits_size;
  wire [3:0] _T_4489_1_bits_source;
  wire [30:0] _T_4489_1_bits_address;
  wire [127:0] _T_4489_1_bits_data;
  wire  _T_4489_1_bits_error;
  wire  _T_4551;
  wire  _T_4552;
  wire  _T_4555;
  wire  _T_4558;
  wire  _T_4560;
  wire  _T_4561;
  wire  _T_4608_0_ready;
  wire  _T_4608_0_valid;
  wire [2:0] _T_4608_0_bits_opcode;
  wire [1:0] _T_4608_0_bits_param;
  wire [3:0] _T_4608_0_bits_size;
  wire [3:0] _T_4608_0_bits_source;
  wire  _T_4608_0_bits_sink;
  wire [3:0] _T_4608_0_bits_addr_lo;
  wire [127:0] _T_4608_0_bits_data;
  wire  _T_4608_0_bits_error;
  wire  _T_4654;
  wire  _T_4701_0_ready;
  wire  _T_4701_0_valid;
  wire [2:0] _T_4701_0_bits_opcode;
  wire [1:0] _T_4701_0_bits_param;
  wire [3:0] _T_4701_0_bits_size;
  wire [3:0] _T_4701_0_bits_source;
  wire  _T_4701_0_bits_sink;
  wire [3:0] _T_4701_0_bits_addr_lo;
  wire [127:0] _T_4701_0_bits_data;
  wire  _T_4701_0_bits_error;
  wire  _T_4747;
  wire  _T_4774_0_ready;
  wire  _T_4774_0_valid;
  wire  _T_4774_0_bits_sink;
  wire  _T_4774_1_ready;
  wire  _T_4774_1_valid;
  wire  _T_4774_1_bits_sink;
  wire  _T_4800;
  wire  _T_4801;
  wire  _T_4804;
  wire  _T_4807;
  wire  _T_4809;
  wire  _T_4810;
  reg [3:0] _T_4812;
  reg [31:0] _GEN_32;
  wire  _T_4814;
  wire  _T_4815;
  wire  _T_4818;
  wire  _T_4824_0;
  wire  _T_4828;
  wire  _T_4833_0;
  wire  _T_4849;
  wire  _T_4850;
  wire  _T_4852;
  wire [3:0] _T_4854;
  wire  _T_4855;
  wire [3:0] _GEN_0;
  wire [4:0] _T_4856;
  wire [3:0] _T_4857;
  wire [3:0] _T_4858;
  wire  _T_4864_0;
  reg  _T_4868_0;
  reg [31:0] _GEN_33;
  wire  _T_4872_0;
  reg [3:0] _T_4880;
  reg [31:0] _GEN_34;
  wire  _T_4882;
  wire  _T_4883;
  wire  _T_4886;
  wire  _T_4892_0;
  wire  _T_4896;
  wire  _T_4901_0;
  wire  _T_4917;
  wire  _T_4918;
  wire  _T_4920;
  wire [3:0] _T_4922;
  wire  _T_4923;
  wire [3:0] _GEN_1;
  wire [4:0] _T_4924;
  wire [3:0] _T_4925;
  wire [3:0] _T_4926;
  wire  _T_4932_0;
  reg  _T_4936_0;
  reg [31:0] _GEN_35;
  wire  _T_4940_0;
  reg [3:0] _T_4949;
  reg [31:0] _GEN_36;
  wire  _T_4951;
  wire  _T_4952;
  wire  _T_4955;
  wire  _T_4965_0;
  wire  _T_4965_1;
  wire  _T_4970;
  wire  _T_4971;
  wire  _T_4977_0;
  wire  _T_4977_1;
  wire  _T_4984;
  wire  _T_4988;
  wire  _T_4993;
  wire  _T_4994;
  wire  _T_4996;
  wire  _T_4998;
  wire  _T_4999;
  wire  _T_5001;
  wire  _T_5003;
  wire  _T_5004;
  wire  _T_5006;
  wire [3:0] _T_5008;
  wire [3:0] _T_5010;
  wire [3:0] _T_5011;
  wire  _T_5012;
  wire [3:0] _GEN_2;
  wire [4:0] _T_5013;
  wire [3:0] _T_5014;
  wire [3:0] _T_5015;
  wire  _T_5023_0;
  wire  _T_5023_1;
  reg  _T_5028_0;
  reg [31:0] _GEN_37;
  reg  _T_5028_1;
  reg [31:0] _GEN_38;
  wire  _T_5033_0;
  wire  _T_5033_1;
  wire  _T_5038_0;
  wire  _T_5038_1;
  wire  _T_5043;
  wire  _T_5044;
  wire  _T_5048;
  wire  _T_5051;
  wire  _T_5053;
  wire  _T_5054;
  wire  _T_5055;
  wire [128:0] _T_5056;
  wire [4:0] _T_5057;
  wire [133:0] _T_5058;
  wire [7:0] _T_5059;
  wire [4:0] _T_5060;
  wire [12:0] _T_5061;
  wire [146:0] _T_5062;
  wire [146:0] _T_5064;
  wire [128:0] _T_5065;
  wire [4:0] _T_5066;
  wire [133:0] _T_5067;
  wire [7:0] _T_5068;
  wire [4:0] _T_5069;
  wire [12:0] _T_5070;
  wire [146:0] _T_5071;
  wire [146:0] _T_5073;
  wire [146:0] _T_5083;
  wire [2:0] _T_5093_opcode;
  wire [1:0] _T_5093_param;
  wire [3:0] _T_5093_size;
  wire [3:0] _T_5093_source;
  wire  _T_5093_sink;
  wire [3:0] _T_5093_addr_lo;
  wire [127:0] _T_5093_data;
  wire  _T_5093_error;
  wire  _T_5102;
  wire  _T_5103;
  wire [127:0] _T_5104;
  wire [127:0] _T_5105;
  wire [3:0] _T_5106;
  wire [3:0] _T_5107;
  wire  _T_5108;
  wire  _T_5109;
  wire [3:0] _T_5110;
  wire [3:0] _T_5111;
  wire [3:0] _T_5112;
  wire [3:0] _T_5113;
  wire [1:0] _T_5114;
  wire [1:0] _T_5115;
  wire [2:0] _T_5116;
  wire [2:0] _T_5117;
  reg [2:0] _GEN_3;
  reg [31:0] _GEN_39;
  reg [1:0] _GEN_4;
  reg [31:0] _GEN_40;
  reg [3:0] _GEN_5;
  reg [31:0] _GEN_41;
  reg [3:0] _GEN_6;
  reg [31:0] _GEN_42;
  reg [30:0] _GEN_7;
  reg [31:0] _GEN_43;
  reg [15:0] _GEN_8;
  reg [31:0] _GEN_44;
  reg [127:0] _GEN_9;
  reg [127:0] _GEN_45;
  reg [2:0] _GEN_10;
  reg [31:0] _GEN_46;
  reg [2:0] _GEN_11;
  reg [31:0] _GEN_47;
  reg [3:0] _GEN_12;
  reg [31:0] _GEN_48;
  reg [3:0] _GEN_13;
  reg [31:0] _GEN_49;
  reg [30:0] _GEN_14;
  reg [31:0] _GEN_50;
  reg [127:0] _GEN_15;
  reg [127:0] _GEN_51;
  reg  _GEN_16;
  reg [31:0] _GEN_52;
  reg  _GEN_17;
  reg [31:0] _GEN_53;
  reg [2:0] _GEN_18;
  reg [31:0] _GEN_54;
  reg [2:0] _GEN_19;
  reg [31:0] _GEN_55;
  reg [3:0] _GEN_20;
  reg [31:0] _GEN_56;
  reg [3:0] _GEN_21;
  reg [31:0] _GEN_57;
  reg [30:0] _GEN_22;
  reg [31:0] _GEN_58;
  reg [127:0] _GEN_23;
  reg [127:0] _GEN_59;
  reg  _GEN_24;
  reg [31:0] _GEN_60;
  reg  _GEN_25;
  reg [31:0] _GEN_61;
  reg  _GEN_26;
  reg [31:0] _GEN_62;
  reg  _GEN_27;
  reg [31:0] _GEN_63;
  reg  _GEN_28;
  reg [31:0] _GEN_64;
  reg  _GEN_29;
  reg [31:0] _GEN_65;
  reg  _GEN_30;
  reg [31:0] _GEN_66;
  reg  _GEN_31;
  reg [31:0] _GEN_67;
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
  assign io_out_1_a_valid = out_1_a_valid;
  assign io_out_1_a_bits_opcode = out_1_a_bits_opcode;
  assign io_out_1_a_bits_param = out_1_a_bits_param;
  assign io_out_1_a_bits_size = out_1_a_bits_size;
  assign io_out_1_a_bits_source = out_1_a_bits_source;
  assign io_out_1_a_bits_address = out_1_a_bits_address;
  assign io_out_1_a_bits_mask = out_1_a_bits_mask;
  assign io_out_1_a_bits_data = out_1_a_bits_data;
  assign io_out_1_b_ready = out_1_b_ready;
  assign io_out_1_c_valid = out_1_c_valid;
  assign io_out_1_c_bits_opcode = out_1_c_bits_opcode;
  assign io_out_1_c_bits_param = out_1_c_bits_param;
  assign io_out_1_c_bits_size = out_1_c_bits_size;
  assign io_out_1_c_bits_source = out_1_c_bits_source;
  assign io_out_1_c_bits_address = out_1_c_bits_address;
  assign io_out_1_c_bits_data = out_1_c_bits_data;
  assign io_out_1_c_bits_error = out_1_c_bits_error;
  assign io_out_1_d_ready = out_1_d_ready;
  assign io_out_1_e_valid = out_1_e_valid;
  assign io_out_1_e_bits_sink = 1'h0;
  assign in_0_a_ready = _T_4256;
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
  assign in_0_b_bits_opcode = _GEN_3;
  assign in_0_b_bits_param = _GEN_4;
  assign in_0_b_bits_size = _GEN_5;
  assign in_0_b_bits_source = _GEN_6;
  assign in_0_b_bits_address = _GEN_7;
  assign in_0_b_bits_mask = _GEN_8;
  assign in_0_b_bits_data = _GEN_9;
  assign in_0_c_ready = _T_4561;
  assign in_0_c_valid = io_in_0_c_valid;
  assign in_0_c_bits_opcode = io_in_0_c_bits_opcode;
  assign in_0_c_bits_param = io_in_0_c_bits_param;
  assign in_0_c_bits_size = io_in_0_c_bits_size;
  assign in_0_c_bits_source = io_in_0_c_bits_source;
  assign in_0_c_bits_address = io_in_0_c_bits_address;
  assign in_0_c_bits_data = io_in_0_c_bits_data;
  assign in_0_c_bits_error = io_in_0_c_bits_error;
  assign in_0_d_ready = io_in_0_d_ready;
  assign in_0_d_valid = _T_5055;
  assign in_0_d_bits_opcode = _T_5093_opcode;
  assign in_0_d_bits_param = _T_5093_param;
  assign in_0_d_bits_size = _T_5093_size;
  assign in_0_d_bits_source = _T_5093_source;
  assign in_0_d_bits_sink = _T_5093_sink;
  assign in_0_d_bits_addr_lo = _T_5093_addr_lo;
  assign in_0_d_bits_data = _T_5093_data;
  assign in_0_d_bits_error = _T_5093_error;
  assign in_0_e_ready = _T_4810;
  assign in_0_e_valid = io_in_0_e_valid;
  assign in_0_e_bits_sink = io_in_0_e_bits_sink;
  assign out_0_a_ready = io_out_0_a_ready;
  assign out_0_a_valid = _T_4184_0_valid;
  assign out_0_a_bits_opcode = _T_4184_0_bits_opcode;
  assign out_0_a_bits_param = _T_4184_0_bits_param;
  assign out_0_a_bits_size = _T_4184_0_bits_size;
  assign out_0_a_bits_source = _T_4184_0_bits_source;
  assign out_0_a_bits_address = _T_4184_0_bits_address;
  assign out_0_a_bits_mask = _T_4184_0_bits_mask;
  assign out_0_a_bits_data = _T_4184_0_bits_data;
  assign out_0_b_ready = _T_4299_0_ready;
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
  assign out_0_c_bits_opcode = _GEN_10;
  assign out_0_c_bits_param = _GEN_11;
  assign out_0_c_bits_size = _GEN_12;
  assign out_0_c_bits_source = _GEN_13;
  assign out_0_c_bits_address = _GEN_14;
  assign out_0_c_bits_data = _GEN_15;
  assign out_0_c_bits_error = _GEN_16;
  assign out_0_d_ready = _T_4608_0_ready;
  assign out_0_d_valid = io_out_0_d_valid;
  assign out_0_d_bits_opcode = io_out_0_d_bits_opcode;
  assign out_0_d_bits_param = io_out_0_d_bits_param;
  assign out_0_d_bits_size = io_out_0_d_bits_size;
  assign out_0_d_bits_source = io_out_0_d_bits_source;
  assign out_0_d_bits_sink = 1'h1;
  assign out_0_d_bits_addr_lo = io_out_0_d_bits_addr_lo;
  assign out_0_d_bits_data = io_out_0_d_bits_data;
  assign out_0_d_bits_error = io_out_0_d_bits_error;
  assign out_0_e_ready = io_out_0_e_ready;
  assign out_0_e_valid = 1'h0;
  assign out_0_e_bits_sink = _GEN_17;
  assign out_1_a_ready = io_out_1_a_ready;
  assign out_1_a_valid = _T_4184_1_valid;
  assign out_1_a_bits_opcode = _T_4184_1_bits_opcode;
  assign out_1_a_bits_param = _T_4184_1_bits_param;
  assign out_1_a_bits_size = _T_4184_1_bits_size;
  assign out_1_a_bits_source = _T_4184_1_bits_source;
  assign out_1_a_bits_address = _T_4184_1_bits_address;
  assign out_1_a_bits_mask = _T_4184_1_bits_mask;
  assign out_1_a_bits_data = _T_4184_1_bits_data;
  assign out_1_b_ready = _T_4384_0_ready;
  assign out_1_b_valid = io_out_1_b_valid;
  assign out_1_b_bits_opcode = io_out_1_b_bits_opcode;
  assign out_1_b_bits_param = io_out_1_b_bits_param;
  assign out_1_b_bits_size = io_out_1_b_bits_size;
  assign out_1_b_bits_source = io_out_1_b_bits_source;
  assign out_1_b_bits_address = io_out_1_b_bits_address;
  assign out_1_b_bits_mask = io_out_1_b_bits_mask;
  assign out_1_b_bits_data = io_out_1_b_bits_data;
  assign out_1_c_ready = io_out_1_c_ready;
  assign out_1_c_valid = 1'h0;
  assign out_1_c_bits_opcode = _GEN_18;
  assign out_1_c_bits_param = _GEN_19;
  assign out_1_c_bits_size = _GEN_20;
  assign out_1_c_bits_source = _GEN_21;
  assign out_1_c_bits_address = _GEN_22;
  assign out_1_c_bits_data = _GEN_23;
  assign out_1_c_bits_error = _GEN_24;
  assign out_1_d_ready = _T_4701_0_ready;
  assign out_1_d_valid = io_out_1_d_valid;
  assign out_1_d_bits_opcode = io_out_1_d_bits_opcode;
  assign out_1_d_bits_param = io_out_1_d_bits_param;
  assign out_1_d_bits_size = io_out_1_d_bits_size;
  assign out_1_d_bits_source = io_out_1_d_bits_source;
  assign out_1_d_bits_sink = io_out_1_d_bits_sink;
  assign out_1_d_bits_addr_lo = io_out_1_d_bits_addr_lo;
  assign out_1_d_bits_data = io_out_1_d_bits_data;
  assign out_1_d_bits_error = io_out_1_d_bits_error;
  assign out_1_e_ready = io_out_1_e_ready;
  assign out_1_e_valid = 1'h0;
  assign out_1_e_bits_sink = _GEN_25;
  assign _T_3684 = {1'b0,$signed(in_0_a_bits_address)};
  assign _T_3686 = $signed(_T_3684) & $signed(32'sh20000000);
  assign _T_3687 = $signed(_T_3686);
  assign _T_3689 = $signed(_T_3687) == $signed(32'sh0);
  assign _T_3691 = in_0_a_bits_address ^ 31'h20000000;
  assign _T_3692 = {1'b0,$signed(_T_3691)};
  assign _T_3694 = $signed(_T_3692) & $signed(32'sh20000000);
  assign _T_3695 = $signed(_T_3694);
  assign _T_3697 = $signed(_T_3695) == $signed(32'sh0);
  assign _T_3703_0 = _T_3689;
  assign _T_3703_1 = _T_3697;
  assign requestAIO_0_0 = _T_3703_0;
  assign requestAIO_0_1 = _T_3703_1;
  assign _T_3749 = {1'b0,$signed(in_0_c_bits_address)};
  assign _T_3751 = $signed(_T_3749) & $signed(32'sh20000000);
  assign _T_3752 = $signed(_T_3751);
  assign _T_3754 = $signed(_T_3752) == $signed(32'sh0);
  assign _T_3756 = in_0_c_bits_address ^ 31'h20000000;
  assign _T_3757 = {1'b0,$signed(_T_3756)};
  assign _T_3759 = $signed(_T_3757) & $signed(32'sh20000000);
  assign _T_3760 = $signed(_T_3759);
  assign _T_3762 = $signed(_T_3760) == $signed(32'sh0);
  assign _T_3768_0 = _T_3754;
  assign _T_3768_1 = _T_3762;
  assign requestCIO_0_0 = _T_3768_0;
  assign requestCIO_0_1 = _T_3768_1;
  assign _T_3824_0 = 1'h1;
  assign _T_3840_0 = 1'h1;
  assign requestBOI_0_0 = _T_3824_0;
  assign requestBOI_1_0 = _T_3840_0;
  assign _T_3901_0 = 1'h1;
  assign _T_3917_0 = 1'h1;
  assign requestDOI_0_0 = _T_3901_0;
  assign requestDOI_1_0 = _T_3917_0;
  assign _T_3969 = 1'h0 == in_0_e_bits_sink;
  assign _T_3975_0 = in_0_e_bits_sink;
  assign _T_3975_1 = _T_3969;
  assign requestEIO_0_0 = _T_3975_0;
  assign requestEIO_0_1 = _T_3975_1;
  assign _T_4021 = 23'hff << in_0_a_bits_size;
  assign _T_4022 = _T_4021[7:0];
  assign _T_4023 = ~ _T_4022;
  assign _T_4024 = _T_4023[7:4];
  assign _T_4025 = in_0_a_bits_opcode[2];
  assign _T_4027 = _T_4025 == 1'h0;
  assign _T_4029 = _T_4027 ? _T_4024 : 4'h0;
  assign beatsAI_0 = _T_4029;
  assign beatsBO_0 = 4'h0;
  assign beatsBO_1 = 4'h0;
  assign _T_4072 = 23'hff << in_0_c_bits_size;
  assign _T_4073 = _T_4072[7:0];
  assign _T_4074 = ~ _T_4073;
  assign _T_4075 = _T_4074[7:4];
  assign _T_4076 = in_0_c_bits_opcode[0];
  assign _T_4078 = _T_4076 ? _T_4075 : 4'h0;
  assign beatsCI_0 = _T_4078;
  assign _T_4088 = 21'h3f << out_0_d_bits_size;
  assign _T_4089 = _T_4088[5:0];
  assign _T_4090 = ~ _T_4089;
  assign _T_4091 = _T_4090[5:4];
  assign _T_4098 = 23'hff << out_1_d_bits_size;
  assign _T_4099 = _T_4098[7:0];
  assign _T_4100 = ~ _T_4099;
  assign _T_4101 = _T_4100[7:4];
  assign _T_4102 = out_1_d_bits_opcode[0];
  assign _T_4104 = _T_4102 ? _T_4101 : 4'h0;
  assign beatsDO_0 = {{2'd0}, _T_4091};
  assign beatsDO_1 = _T_4104;
  assign beatsEI_0 = 1'h0;
  assign _T_4184_0_ready = out_0_a_ready;
  assign _T_4184_0_valid = _T_4246;
  assign _T_4184_0_bits_opcode = in_0_a_bits_opcode;
  assign _T_4184_0_bits_param = in_0_a_bits_param;
  assign _T_4184_0_bits_size = in_0_a_bits_size;
  assign _T_4184_0_bits_source = in_0_a_bits_source;
  assign _T_4184_0_bits_address = in_0_a_bits_address;
  assign _T_4184_0_bits_mask = in_0_a_bits_mask;
  assign _T_4184_0_bits_data = in_0_a_bits_data;
  assign _T_4184_1_ready = out_1_a_ready;
  assign _T_4184_1_valid = _T_4247;
  assign _T_4184_1_bits_opcode = in_0_a_bits_opcode;
  assign _T_4184_1_bits_param = in_0_a_bits_param;
  assign _T_4184_1_bits_size = in_0_a_bits_size;
  assign _T_4184_1_bits_source = in_0_a_bits_source;
  assign _T_4184_1_bits_address = in_0_a_bits_address;
  assign _T_4184_1_bits_mask = in_0_a_bits_mask;
  assign _T_4184_1_bits_data = in_0_a_bits_data;
  assign _T_4246 = in_0_a_valid & requestAIO_0_0;
  assign _T_4247 = in_0_a_valid & requestAIO_0_1;
  assign _T_4250 = requestAIO_0_0 ? _T_4184_0_ready : 1'h0;
  assign _T_4253 = requestAIO_0_1 ? _T_4184_1_ready : 1'h0;
  assign _T_4255 = _T_4250 | _T_4253;
  assign _T_4256 = _T_4255;
  assign _T_4299_0_ready = _GEN_26;
  assign _T_4299_0_valid = _T_4341;
  assign _T_4299_0_bits_opcode = out_0_b_bits_opcode;
  assign _T_4299_0_bits_param = out_0_b_bits_param;
  assign _T_4299_0_bits_size = out_0_b_bits_size;
  assign _T_4299_0_bits_source = out_0_b_bits_source;
  assign _T_4299_0_bits_address = out_0_b_bits_address;
  assign _T_4299_0_bits_mask = out_0_b_bits_mask;
  assign _T_4299_0_bits_data = out_0_b_bits_data;
  assign _T_4341 = out_0_b_valid & requestBOI_0_0;
  assign _T_4384_0_ready = _GEN_27;
  assign _T_4384_0_valid = _T_4426;
  assign _T_4384_0_bits_opcode = out_1_b_bits_opcode;
  assign _T_4384_0_bits_param = out_1_b_bits_param;
  assign _T_4384_0_bits_size = out_1_b_bits_size;
  assign _T_4384_0_bits_source = out_1_b_bits_source;
  assign _T_4384_0_bits_address = out_1_b_bits_address;
  assign _T_4384_0_bits_mask = out_1_b_bits_mask;
  assign _T_4384_0_bits_data = out_1_b_bits_data;
  assign _T_4426 = out_1_b_valid & requestBOI_1_0;
  assign _T_4489_0_ready = _GEN_28;
  assign _T_4489_0_valid = _T_4551;
  assign _T_4489_0_bits_opcode = in_0_c_bits_opcode;
  assign _T_4489_0_bits_param = in_0_c_bits_param;
  assign _T_4489_0_bits_size = in_0_c_bits_size;
  assign _T_4489_0_bits_source = in_0_c_bits_source;
  assign _T_4489_0_bits_address = in_0_c_bits_address;
  assign _T_4489_0_bits_data = in_0_c_bits_data;
  assign _T_4489_0_bits_error = in_0_c_bits_error;
  assign _T_4489_1_ready = _GEN_29;
  assign _T_4489_1_valid = _T_4552;
  assign _T_4489_1_bits_opcode = in_0_c_bits_opcode;
  assign _T_4489_1_bits_param = in_0_c_bits_param;
  assign _T_4489_1_bits_size = in_0_c_bits_size;
  assign _T_4489_1_bits_source = in_0_c_bits_source;
  assign _T_4489_1_bits_address = in_0_c_bits_address;
  assign _T_4489_1_bits_data = in_0_c_bits_data;
  assign _T_4489_1_bits_error = in_0_c_bits_error;
  assign _T_4551 = in_0_c_valid & requestCIO_0_0;
  assign _T_4552 = in_0_c_valid & requestCIO_0_1;
  assign _T_4555 = requestCIO_0_0 ? _T_4489_0_ready : 1'h0;
  assign _T_4558 = requestCIO_0_1 ? _T_4489_1_ready : 1'h0;
  assign _T_4560 = _T_4555 | _T_4558;
  assign _T_4561 = _T_4560;
  assign _T_4608_0_ready = _T_5043;
  assign _T_4608_0_valid = _T_4654;
  assign _T_4608_0_bits_opcode = out_0_d_bits_opcode;
  assign _T_4608_0_bits_param = out_0_d_bits_param;
  assign _T_4608_0_bits_size = out_0_d_bits_size;
  assign _T_4608_0_bits_source = out_0_d_bits_source;
  assign _T_4608_0_bits_sink = out_0_d_bits_sink;
  assign _T_4608_0_bits_addr_lo = out_0_d_bits_addr_lo;
  assign _T_4608_0_bits_data = out_0_d_bits_data;
  assign _T_4608_0_bits_error = out_0_d_bits_error;
  assign _T_4654 = out_0_d_valid & requestDOI_0_0;
  assign _T_4701_0_ready = _T_5044;
  assign _T_4701_0_valid = _T_4747;
  assign _T_4701_0_bits_opcode = out_1_d_bits_opcode;
  assign _T_4701_0_bits_param = out_1_d_bits_param;
  assign _T_4701_0_bits_size = out_1_d_bits_size;
  assign _T_4701_0_bits_source = out_1_d_bits_source;
  assign _T_4701_0_bits_sink = out_1_d_bits_sink;
  assign _T_4701_0_bits_addr_lo = out_1_d_bits_addr_lo;
  assign _T_4701_0_bits_data = out_1_d_bits_data;
  assign _T_4701_0_bits_error = out_1_d_bits_error;
  assign _T_4747 = out_1_d_valid & requestDOI_1_0;
  assign _T_4774_0_ready = _GEN_30;
  assign _T_4774_0_valid = _T_4800;
  assign _T_4774_0_bits_sink = in_0_e_bits_sink;
  assign _T_4774_1_ready = _GEN_31;
  assign _T_4774_1_valid = _T_4801;
  assign _T_4774_1_bits_sink = in_0_e_bits_sink;
  assign _T_4800 = in_0_e_valid & requestEIO_0_0;
  assign _T_4801 = in_0_e_valid & requestEIO_0_1;
  assign _T_4804 = requestEIO_0_0 ? _T_4774_0_ready : 1'h0;
  assign _T_4807 = requestEIO_0_1 ? _T_4774_1_ready : 1'h0;
  assign _T_4809 = _T_4804 | _T_4807;
  assign _T_4810 = _T_4809;
  assign _T_4814 = _T_4812 == 4'h0;
  assign _T_4815 = _T_4814 & out_0_a_ready;
  assign _T_4818 = _T_4184_0_valid == 1'h0;
  assign _T_4824_0 = 1'h1;
  assign _T_4828 = _T_4824_0 & _T_4184_0_valid;
  assign _T_4833_0 = _T_4828;
  assign _T_4849 = _T_4818 | _T_4833_0;
  assign _T_4850 = _T_4849 | reset;
  assign _T_4852 = _T_4850 == 1'h0;
  assign _T_4854 = _T_4833_0 ? beatsAI_0 : 4'h0;
  assign _T_4855 = out_0_a_ready & out_0_a_valid;
  assign _GEN_0 = {{3'd0}, _T_4855};
  assign _T_4856 = _T_4812 - _GEN_0;
  assign _T_4857 = _T_4856[3:0];
  assign _T_4858 = _T_4815 ? _T_4854 : _T_4857;
  assign _T_4864_0 = 1'h0;
  assign _T_4872_0 = _T_4814 ? _T_4833_0 : _T_4868_0;
  assign _T_4882 = _T_4880 == 4'h0;
  assign _T_4883 = _T_4882 & out_1_a_ready;
  assign _T_4886 = _T_4184_1_valid == 1'h0;
  assign _T_4892_0 = 1'h1;
  assign _T_4896 = _T_4892_0 & _T_4184_1_valid;
  assign _T_4901_0 = _T_4896;
  assign _T_4917 = _T_4886 | _T_4901_0;
  assign _T_4918 = _T_4917 | reset;
  assign _T_4920 = _T_4918 == 1'h0;
  assign _T_4922 = _T_4901_0 ? beatsAI_0 : 4'h0;
  assign _T_4923 = out_1_a_ready & out_1_a_valid;
  assign _GEN_1 = {{3'd0}, _T_4923};
  assign _T_4924 = _T_4880 - _GEN_1;
  assign _T_4925 = _T_4924[3:0];
  assign _T_4926 = _T_4883 ? _T_4922 : _T_4925;
  assign _T_4932_0 = 1'h0;
  assign _T_4940_0 = _T_4882 ? _T_4901_0 : _T_4936_0;
  assign _T_4951 = _T_4949 == 4'h0;
  assign _T_4952 = _T_4951 & in_0_d_ready;
  assign _T_4955 = _T_4608_0_valid == 1'h0;
  assign _T_4965_0 = 1'h1;
  assign _T_4965_1 = _T_4955;
  assign _T_4970 = _T_4965_0 & _T_4608_0_valid;
  assign _T_4971 = _T_4965_1 & _T_4701_0_valid;
  assign _T_4977_0 = _T_4970;
  assign _T_4977_1 = _T_4971;
  assign _T_4984 = _T_4977_0 | _T_4977_1;
  assign _T_4988 = _T_4977_0 == 1'h0;
  assign _T_4993 = _T_4977_1 == 1'h0;
  assign _T_4994 = _T_4988 | _T_4993;
  assign _T_4996 = _T_4994 | reset;
  assign _T_4998 = _T_4996 == 1'h0;
  assign _T_4999 = _T_4608_0_valid | _T_4701_0_valid;
  assign _T_5001 = _T_4999 == 1'h0;
  assign _T_5003 = _T_5001 | _T_4984;
  assign _T_5004 = _T_5003 | reset;
  assign _T_5006 = _T_5004 == 1'h0;
  assign _T_5008 = _T_4977_0 ? beatsDO_0 : 4'h0;
  assign _T_5010 = _T_4977_1 ? beatsDO_1 : 4'h0;
  assign _T_5011 = _T_5008 | _T_5010;
  assign _T_5012 = in_0_d_ready & in_0_d_valid;
  assign _GEN_2 = {{3'd0}, _T_5012};
  assign _T_5013 = _T_4949 - _GEN_2;
  assign _T_5014 = _T_5013[3:0];
  assign _T_5015 = _T_4952 ? _T_5011 : _T_5014;
  assign _T_5023_0 = 1'h0;
  assign _T_5023_1 = 1'h0;
  assign _T_5033_0 = _T_4951 ? _T_4977_0 : _T_5028_0;
  assign _T_5033_1 = _T_4951 ? _T_4977_1 : _T_5028_1;
  assign _T_5038_0 = _T_4951 ? _T_4965_0 : _T_5028_0;
  assign _T_5038_1 = _T_4951 ? _T_4965_1 : _T_5028_1;
  assign _T_5043 = in_0_d_ready & _T_5038_0;
  assign _T_5044 = in_0_d_ready & _T_5038_1;
  assign _T_5048 = _T_5028_0 ? _T_4608_0_valid : 1'h0;
  assign _T_5051 = _T_5028_1 ? _T_4701_0_valid : 1'h0;
  assign _T_5053 = _T_5048 | _T_5051;
  assign _T_5054 = _T_5053;
  assign _T_5055 = _T_4951 ? _T_4999 : _T_5054;
  assign _T_5056 = {_T_4608_0_bits_data,_T_4608_0_bits_error};
  assign _T_5057 = {_T_4608_0_bits_sink,_T_4608_0_bits_addr_lo};
  assign _T_5058 = {_T_5057,_T_5056};
  assign _T_5059 = {_T_4608_0_bits_size,_T_4608_0_bits_source};
  assign _T_5060 = {_T_4608_0_bits_opcode,_T_4608_0_bits_param};
  assign _T_5061 = {_T_5060,_T_5059};
  assign _T_5062 = {_T_5061,_T_5058};
  assign _T_5064 = _T_5033_0 ? _T_5062 : 147'h0;
  assign _T_5065 = {_T_4701_0_bits_data,_T_4701_0_bits_error};
  assign _T_5066 = {_T_4701_0_bits_sink,_T_4701_0_bits_addr_lo};
  assign _T_5067 = {_T_5066,_T_5065};
  assign _T_5068 = {_T_4701_0_bits_size,_T_4701_0_bits_source};
  assign _T_5069 = {_T_4701_0_bits_opcode,_T_4701_0_bits_param};
  assign _T_5070 = {_T_5069,_T_5068};
  assign _T_5071 = {_T_5070,_T_5067};
  assign _T_5073 = _T_5033_1 ? _T_5071 : 147'h0;
  assign _T_5083 = _T_5064 | _T_5073;
  assign _T_5093_opcode = _T_5117;
  assign _T_5093_param = _T_5115;
  assign _T_5093_size = _T_5113;
  assign _T_5093_source = _T_5111;
  assign _T_5093_sink = _T_5109;
  assign _T_5093_addr_lo = _T_5107;
  assign _T_5093_data = _T_5105;
  assign _T_5093_error = _T_5103;
  assign _T_5102 = _T_5083[0];
  assign _T_5103 = _T_5102;
  assign _T_5104 = _T_5083[128:1];
  assign _T_5105 = _T_5104;
  assign _T_5106 = _T_5083[132:129];
  assign _T_5107 = _T_5106;
  assign _T_5108 = _T_5083[133];
  assign _T_5109 = _T_5108;
  assign _T_5110 = _T_5083[137:134];
  assign _T_5111 = _T_5110;
  assign _T_5112 = _T_5083[141:138];
  assign _T_5113 = _T_5112;
  assign _T_5114 = _T_5083[143:142];
  assign _T_5115 = _T_5114;
  assign _T_5116 = _T_5083[146:144];
  assign _T_5117 = _T_5116;
`ifdef RANDOMIZE
  integer initvar;
  initial begin
    `ifndef verilator
      #0.002 begin end
    `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_32 = {1{$random}};
  _T_4812 = _GEN_32[3:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_33 = {1{$random}};
  _T_4868_0 = _GEN_33[0:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_34 = {1{$random}};
  _T_4880 = _GEN_34[3:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_35 = {1{$random}};
  _T_4936_0 = _GEN_35[0:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_36 = {1{$random}};
  _T_4949 = _GEN_36[3:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_37 = {1{$random}};
  _T_5028_0 = _GEN_37[0:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_38 = {1{$random}};
  _T_5028_1 = _GEN_38[0:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_39 = {1{$random}};
  _GEN_3 = _GEN_39[2:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_40 = {1{$random}};
  _GEN_4 = _GEN_40[1:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_41 = {1{$random}};
  _GEN_5 = _GEN_41[3:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_42 = {1{$random}};
  _GEN_6 = _GEN_42[3:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_43 = {1{$random}};
  _GEN_7 = _GEN_43[30:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_44 = {1{$random}};
  _GEN_8 = _GEN_44[15:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_45 = {4{$random}};
  _GEN_9 = _GEN_45[127:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_46 = {1{$random}};
  _GEN_10 = _GEN_46[2:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_47 = {1{$random}};
  _GEN_11 = _GEN_47[2:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_48 = {1{$random}};
  _GEN_12 = _GEN_48[3:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_49 = {1{$random}};
  _GEN_13 = _GEN_49[3:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_50 = {1{$random}};
  _GEN_14 = _GEN_50[30:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_51 = {4{$random}};
  _GEN_15 = _GEN_51[127:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_52 = {1{$random}};
  _GEN_16 = _GEN_52[0:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_53 = {1{$random}};
  _GEN_17 = _GEN_53[0:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_54 = {1{$random}};
  _GEN_18 = _GEN_54[2:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_55 = {1{$random}};
  _GEN_19 = _GEN_55[2:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_56 = {1{$random}};
  _GEN_20 = _GEN_56[3:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_57 = {1{$random}};
  _GEN_21 = _GEN_57[3:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_58 = {1{$random}};
  _GEN_22 = _GEN_58[30:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_59 = {4{$random}};
  _GEN_23 = _GEN_59[127:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_60 = {1{$random}};
  _GEN_24 = _GEN_60[0:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_61 = {1{$random}};
  _GEN_25 = _GEN_61[0:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_62 = {1{$random}};
  _GEN_26 = _GEN_62[0:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_63 = {1{$random}};
  _GEN_27 = _GEN_63[0:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_64 = {1{$random}};
  _GEN_28 = _GEN_64[0:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_65 = {1{$random}};
  _GEN_29 = _GEN_65[0:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_66 = {1{$random}};
  _GEN_30 = _GEN_66[0:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  _GEN_67 = {1{$random}};
  _GEN_31 = _GEN_67[0:0];
  `endif
  end
`endif
  always @(posedge clock) begin
    if (reset) begin
      _T_4812 <= 4'h0;
    end else begin
      if (_T_4815) begin
        if (_T_4833_0) begin
          _T_4812 <= beatsAI_0;
        end else begin
          _T_4812 <= 4'h0;
        end
      end else begin
        _T_4812 <= _T_4857;
      end
    end
    if (reset) begin
      _T_4868_0 <= _T_4864_0;
    end else begin
      if (_T_4814) begin
        _T_4868_0 <= _T_4833_0;
      end
    end
    if (reset) begin
      _T_4880 <= 4'h0;
    end else begin
      if (_T_4883) begin
        if (_T_4901_0) begin
          _T_4880 <= beatsAI_0;
        end else begin
          _T_4880 <= 4'h0;
        end
      end else begin
        _T_4880 <= _T_4925;
      end
    end
    if (reset) begin
      _T_4936_0 <= _T_4932_0;
    end else begin
      if (_T_4882) begin
        _T_4936_0 <= _T_4901_0;
      end
    end
    if (reset) begin
      _T_4949 <= 4'h0;
    end else begin
      if (_T_4952) begin
        _T_4949 <= _T_5011;
      end else begin
        _T_4949 <= _T_5014;
      end
    end
    if (reset) begin
      _T_5028_0 <= _T_5023_0;
    end else begin
      if (_T_4951) begin
        _T_5028_0 <= _T_4977_0;
      end
    end
    if (reset) begin
      _T_5028_1 <= _T_5023_1;
    end else begin
      if (_T_4951) begin
        _T_5028_1 <= _T_4977_1;
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
        if (_T_4852) begin
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
        if (_T_4852) begin
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
        if (_T_4920) begin
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
        if (_T_4920) begin
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
        if (_T_4998) begin
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
        if (_T_4998) begin
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
        if (_T_5006) begin
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
        if (_T_5006) begin
          $fatal;
        end
    `ifdef STOP_COND
      end
    `endif
    `endif
  end
endmodule