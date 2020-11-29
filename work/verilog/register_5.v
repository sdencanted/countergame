/*
   This file was generated automatically by Alchitry Labs version 1.2.1.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

module register_5 (
    input clk,
    input [4:0] ra,
    input [4:0] rb,
    output reg [15:0] ra_data,
    output reg [15:0] rb_data,
    input [4:0] rc,
    input [15:0] write_data,
    input write_enable,
    output reg [3:0] numa,
    output reg [3:0] numb,
    output reg [3:0] p1_score,
    output reg [3:0] p2_score,
    output reg [1:0] sign,
    output reg answer,
    output reg p1_win,
    output reg p2_win
  );
  
  
  
  reg [511:0] M_registers_d, M_registers_q = 1'h0;
  
  always @* begin
    M_registers_d = M_registers_q;
    
    ra_data = M_registers_q[(ra)*16+15-:16];
    rb_data = M_registers_q[(rb)*16+15-:16];
    if (rc != 5'h1f && write_enable) begin
      M_registers_d[(rc)*16+15-:16] = write_data;
    end
    if (ra == 5'h1f) begin
      ra_data = 16'h0000;
    end
    if (rb == 5'h1f) begin
      rb_data = 16'h0000;
    end
    numa = M_registers_q[64+0+3-:4];
    numb = M_registers_q[80+0+3-:4];
    p1_score = M_registers_q[0+0+3-:4];
    p2_score = M_registers_q[32+0+3-:4];
    sign = M_registers_q[112+0+1-:2];
    answer = M_registers_q[96+0+0-:1];
    p1_win = M_registers_q[160+0+0-:1];
    p2_win = M_registers_q[176+0+0-:1];
  end
  
  always @(posedge clk) begin
    M_registers_q <= M_registers_d;
  end
  
endmodule
