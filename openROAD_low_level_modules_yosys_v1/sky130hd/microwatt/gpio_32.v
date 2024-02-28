module gpio_32(clk, rst, \wb_in.adr , \wb_in.dat , \wb_in.sel , \wb_in.cyc , \wb_in.stb , \wb_in.we , gpio_in, \wb_out.dat , \wb_out.ack , \wb_out.stall , gpio_out, gpio_dir, intr);
  wire _00_;
  wire _01_;
  wire _02_;
  wire _03_;
  wire [31:0] _04_;
  wire _05_;
  wire _06_;
  wire _07_;
  wire _08_;
  wire [31:0] _09_;
  wire _10_;
  wire [31:0] _11_;
  wire [31:0] _12_;
  wire _13_;
  wire [31:0] _14_;
  wire [31:0] _15_;
  wire [31:0] _16_;
  wire [31:0] _17_;
  wire _18_;
  wire [31:0] _19_;
  wire [31:0] _20_;
  reg [33:0] _21_;
  reg [31:0] _22_ = 32'd0;
  reg [31:0] _23_ = 32'd0;
  reg [31:0] _24_;
  reg [31:0] _25_;
  input clk;
  wire clk;
  output [31:0] gpio_dir;
  wire [31:0] gpio_dir;
  input [31:0] gpio_in;
  wire [31:0] gpio_in;
  output [31:0] gpio_out;
  wire [31:0] gpio_out;
  output intr;
  wire intr;
  wire [31:0] reg_data;
  wire [31:0] reg_dirn;
  wire [31:0] reg_in1;
  wire [31:0] reg_in2;
  wire [31:0] reg_out;
  input rst;
  wire rst;
  input [29:0] \wb_in.adr ;
  wire [29:0] \wb_in.adr ;
  input \wb_in.cyc ;
  wire \wb_in.cyc ;
  input [31:0] \wb_in.dat ;
  wire [31:0] \wb_in.dat ;
  input [3:0] \wb_in.sel ;
  wire [3:0] \wb_in.sel ;
  input \wb_in.stb ;
  wire \wb_in.stb ;
  input \wb_in.we ;
  wire \wb_in.we ;
  output \wb_out.ack ;
  wire \wb_out.ack ;
  output [31:0] \wb_out.dat ;
  wire [31:0] \wb_out.dat ;
  output \wb_out.stall ;
  wire \wb_out.stall ;
  wire [33:0] wb_rsp;
  assign _00_ = \wb_in.cyc  & \wb_in.stb ;
  assign _01_ = \wb_in.adr [4:0] == 5'h00;
  assign _02_ = \wb_in.adr [4:0] == 5'h01;
  assign _03_ = \wb_in.adr [4:0] == 5'h02;
  function [31:0] \5670 ;
    input [31:0] a;
    input [95:0] b;
    input [2:0] s;
    (* parallel_case *)
    casez (s)
      3'b??1:
        \5670  = b[31:0];
      3'b?1?:
        \5670  = b[63:32];
      3'b1??:
        \5670  = b[95:64];
      default:
        \5670  = a;
    endcase
  endfunction
  assign _04_ = \5670 (32'd0, { reg_dirn, reg_in2, reg_data }, { _03_, _02_, _01_ });
  assign _05_ = \wb_in.cyc  & \wb_in.stb ;
  assign _06_ = _05_ & \wb_in.we ;
  assign _07_ = \wb_in.adr [4:0] == 5'h00;
  assign _08_ = \wb_in.adr [4:0] == 5'h02;
  assign _09_ = reg_data | \wb_in.dat ;
  assign _10_ = \wb_in.adr [4:0] == 5'h04;
  assign _11_ = ~ \wb_in.dat ;
  assign _12_ = reg_data & _11_;
  assign _13_ = \wb_in.adr [4:0] == 5'h05;
  function [31:0] \5697 ;
    input [31:0] a;
    input [127:0] b;
    input [3:0] s;
    (* parallel_case *)
    casez (s)
      4'b???1:
        \5697  = b[31:0];
      4'b??1?:
        \5697  = b[63:32];
      4'b?1??:
        \5697  = b[95:64];
      4'b1???:
        \5697  = b[127:96];
      default:
        \5697  = a;
    endcase
  endfunction
  assign _14_ = \5697 (reg_data, { _12_, _09_, reg_data, \wb_in.dat  }, { _13_, _10_, _08_, _07_ });
  function [31:0] \5698 ;
    input [31:0] a;
    input [127:0] b;
    input [3:0] s;
    (* parallel_case *)
    casez (s)
      4'b???1:
        \5698  = b[31:0];
      4'b??1?:
        \5698  = b[63:32];
      4'b?1??:
        \5698  = b[95:64];
      4'b1???:
        \5698  = b[127:96];
      default:
        \5698  = a;
    endcase
  endfunction
  assign _15_ = \5698 (reg_dirn, { reg_dirn, reg_dirn, \wb_in.dat , reg_dirn }, { _13_, _10_, _08_, _07_ });
  assign _16_ = _06_ ? _14_ : reg_data;
  assign _17_ = _06_ ? _15_ : reg_dirn;
  assign _18_ = rst ? 1'h0 : wb_rsp[32];
  assign _19_ = rst ? 32'd0 : _16_;
  assign _20_ = rst ? 32'd0 : _17_;
  always @(posedge clk)
    _21_ <= { wb_rsp[33], _18_, wb_rsp[31:0] };
  always @(posedge clk)
    _22_ <= _19_;
  always @(posedge clk)
    _23_ <= _20_;
  always @(posedge clk)
    _24_ <= gpio_in;
  always @(posedge clk)
    _25_ <= reg_in1;
  assign reg_data = _22_;
  assign reg_dirn = _23_;
  assign reg_in1 = _24_;
  assign reg_in2 = _25_;
  assign wb_rsp = { 1'h0, _00_, reg_out };
  assign reg_out = _04_;
  assign \wb_out.dat  = _21_[31:0];
  assign \wb_out.ack  = _21_[32];
  assign \wb_out.stall  = _21_[33];
  assign gpio_out = reg_data;
  assign gpio_dir = reg_dirn;
  assign intr = 1'h0;
endmodule