module smem_0_ext(
  input RW0_clk,
  input [6:0] RW0_addr,
  input RW0_en,
  input RW0_wmode,
  input [63:0] RW0_wmask,
  input [63:0] RW0_wdata,
  output [63:0] RW0_rdata
);

  reg [6:0] reg_RW0_addr;
  reg [63:0] ram [127:0];
  `ifdef RANDOMIZE
    integer initvar;
    initial begin
      #0.002 begin end
      for (initvar = 0; initvar < 128; initvar = initvar+1)
        ram[initvar] = {2 {$random}};
      reg_RW0_addr = {1 {$random}};
    end
  `endif
  integer i;
  always @(posedge RW0_clk)
    if (RW0_en && !RW0_wmode) reg_RW0_addr <= RW0_addr;
  always @(posedge RW0_clk)
    if (RW0_en && RW0_wmode) begin
      if (RW0_wmask[0]) ram[RW0_addr][0:0] <= RW0_wdata[0:0];
      if (RW0_wmask[1]) ram[RW0_addr][1:1] <= RW0_wdata[1:1];
      if (RW0_wmask[2]) ram[RW0_addr][2:2] <= RW0_wdata[2:2];
      if (RW0_wmask[3]) ram[RW0_addr][3:3] <= RW0_wdata[3:3];
      if (RW0_wmask[4]) ram[RW0_addr][4:4] <= RW0_wdata[4:4];
      if (RW0_wmask[5]) ram[RW0_addr][5:5] <= RW0_wdata[5:5];
      if (RW0_wmask[6]) ram[RW0_addr][6:6] <= RW0_wdata[6:6];
      if (RW0_wmask[7]) ram[RW0_addr][7:7] <= RW0_wdata[7:7];
      if (RW0_wmask[8]) ram[RW0_addr][8:8] <= RW0_wdata[8:8];
      if (RW0_wmask[9]) ram[RW0_addr][9:9] <= RW0_wdata[9:9];
      if (RW0_wmask[10]) ram[RW0_addr][10:10] <= RW0_wdata[10:10];
      if (RW0_wmask[11]) ram[RW0_addr][11:11] <= RW0_wdata[11:11];
      if (RW0_wmask[12]) ram[RW0_addr][12:12] <= RW0_wdata[12:12];
      if (RW0_wmask[13]) ram[RW0_addr][13:13] <= RW0_wdata[13:13];
      if (RW0_wmask[14]) ram[RW0_addr][14:14] <= RW0_wdata[14:14];
      if (RW0_wmask[15]) ram[RW0_addr][15:15] <= RW0_wdata[15:15];
      if (RW0_wmask[16]) ram[RW0_addr][16:16] <= RW0_wdata[16:16];
      if (RW0_wmask[17]) ram[RW0_addr][17:17] <= RW0_wdata[17:17];
      if (RW0_wmask[18]) ram[RW0_addr][18:18] <= RW0_wdata[18:18];
      if (RW0_wmask[19]) ram[RW0_addr][19:19] <= RW0_wdata[19:19];
      if (RW0_wmask[20]) ram[RW0_addr][20:20] <= RW0_wdata[20:20];
      if (RW0_wmask[21]) ram[RW0_addr][21:21] <= RW0_wdata[21:21];
      if (RW0_wmask[22]) ram[RW0_addr][22:22] <= RW0_wdata[22:22];
      if (RW0_wmask[23]) ram[RW0_addr][23:23] <= RW0_wdata[23:23];
      if (RW0_wmask[24]) ram[RW0_addr][24:24] <= RW0_wdata[24:24];
      if (RW0_wmask[25]) ram[RW0_addr][25:25] <= RW0_wdata[25:25];
      if (RW0_wmask[26]) ram[RW0_addr][26:26] <= RW0_wdata[26:26];
      if (RW0_wmask[27]) ram[RW0_addr][27:27] <= RW0_wdata[27:27];
      if (RW0_wmask[28]) ram[RW0_addr][28:28] <= RW0_wdata[28:28];
      if (RW0_wmask[29]) ram[RW0_addr][29:29] <= RW0_wdata[29:29];
      if (RW0_wmask[30]) ram[RW0_addr][30:30] <= RW0_wdata[30:30];
      if (RW0_wmask[31]) ram[RW0_addr][31:31] <= RW0_wdata[31:31];
      if (RW0_wmask[32]) ram[RW0_addr][32:32] <= RW0_wdata[32:32];
      if (RW0_wmask[33]) ram[RW0_addr][33:33] <= RW0_wdata[33:33];
      if (RW0_wmask[34]) ram[RW0_addr][34:34] <= RW0_wdata[34:34];
      if (RW0_wmask[35]) ram[RW0_addr][35:35] <= RW0_wdata[35:35];
      if (RW0_wmask[36]) ram[RW0_addr][36:36] <= RW0_wdata[36:36];
      if (RW0_wmask[37]) ram[RW0_addr][37:37] <= RW0_wdata[37:37];
      if (RW0_wmask[38]) ram[RW0_addr][38:38] <= RW0_wdata[38:38];
      if (RW0_wmask[39]) ram[RW0_addr][39:39] <= RW0_wdata[39:39];
      if (RW0_wmask[40]) ram[RW0_addr][40:40] <= RW0_wdata[40:40];
      if (RW0_wmask[41]) ram[RW0_addr][41:41] <= RW0_wdata[41:41];
      if (RW0_wmask[42]) ram[RW0_addr][42:42] <= RW0_wdata[42:42];
      if (RW0_wmask[43]) ram[RW0_addr][43:43] <= RW0_wdata[43:43];
      if (RW0_wmask[44]) ram[RW0_addr][44:44] <= RW0_wdata[44:44];
      if (RW0_wmask[45]) ram[RW0_addr][45:45] <= RW0_wdata[45:45];
      if (RW0_wmask[46]) ram[RW0_addr][46:46] <= RW0_wdata[46:46];
      if (RW0_wmask[47]) ram[RW0_addr][47:47] <= RW0_wdata[47:47];
      if (RW0_wmask[48]) ram[RW0_addr][48:48] <= RW0_wdata[48:48];
      if (RW0_wmask[49]) ram[RW0_addr][49:49] <= RW0_wdata[49:49];
      if (RW0_wmask[50]) ram[RW0_addr][50:50] <= RW0_wdata[50:50];
      if (RW0_wmask[51]) ram[RW0_addr][51:51] <= RW0_wdata[51:51];
      if (RW0_wmask[52]) ram[RW0_addr][52:52] <= RW0_wdata[52:52];
      if (RW0_wmask[53]) ram[RW0_addr][53:53] <= RW0_wdata[53:53];
      if (RW0_wmask[54]) ram[RW0_addr][54:54] <= RW0_wdata[54:54];
      if (RW0_wmask[55]) ram[RW0_addr][55:55] <= RW0_wdata[55:55];
      if (RW0_wmask[56]) ram[RW0_addr][56:56] <= RW0_wdata[56:56];
      if (RW0_wmask[57]) ram[RW0_addr][57:57] <= RW0_wdata[57:57];
      if (RW0_wmask[58]) ram[RW0_addr][58:58] <= RW0_wdata[58:58];
      if (RW0_wmask[59]) ram[RW0_addr][59:59] <= RW0_wdata[59:59];
      if (RW0_wmask[60]) ram[RW0_addr][60:60] <= RW0_wdata[60:60];
      if (RW0_wmask[61]) ram[RW0_addr][61:61] <= RW0_wdata[61:61];
      if (RW0_wmask[62]) ram[RW0_addr][62:62] <= RW0_wdata[62:62];
      if (RW0_wmask[63]) ram[RW0_addr][63:63] <= RW0_wdata[63:63];
    end
  assign RW0_rdata = ram[reg_RW0_addr];

endmodule