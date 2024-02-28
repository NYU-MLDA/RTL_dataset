module net_dff #(parameter WIDTH=8, parameter BHC=10)
    (input wire [WIDTH-1:0] d,
    output reg [WIDTH-1:0] q,
    input wire clk);

always @ (posedge clk)
begin
    q <= d;
end

endmodule