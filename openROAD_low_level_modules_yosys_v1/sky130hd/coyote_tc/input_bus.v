module input_bus #(parameter WIDTH = 1) (
  input [WIDTH-1:0] PAD,
  output [WIDTH-1:0] y,
  `ABUT_PORTS
);
  input_pad u_io [WIDTH-1:0] (.PAD(PAD), .y(y), `ABUT_CONNECT);
endmodule