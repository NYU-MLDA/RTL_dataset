module AsyncResetReg(
  input clk,
  input rst,
  input en,
  input d,
  output q
);
   wire clk;
   wire rst;
   wire d;
   reg q;

always @ (posedge clk or posedge rst)
begin
    if (rst == 1'b1) begin
        q <= 0;
    end else if (en == 1'b1) begin
        q <= d;
    end
end    

endmodule