module plru_1(clk, rst, acc, acc_en, lru);
  wire _0_;
  wire _1_;
  wire _2_;
  wire _3_;
  reg [1:0] _4_;
  input acc;
  wire acc;
  input acc_en;
  wire acc_en;
  input clk;
  wire clk;
  output lru;
  wire lru;
  input rst;
  wire rst;
  wire [1:0] tree;
  assign _0_ = ~ acc;
  assign _1_ = acc_en ? _0_ : tree[1];
  assign _2_ = rst ? 1'h0 : tree[0];
  assign _3_ = rst ? 1'h0 : _1_;
  always @(posedge clk)
    _4_ <= { _3_, _2_ };
  assign tree = _4_;
  assign lru = tree[1];
endmodule