/*
   This file was generated automatically by Alchitry Labs version 1.2.1.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

module arithmetic_12 (
    input [15:0] a,
    input [15:0] b,
    input [5:0] alufn,
    output reg z,
    output reg v,
    output reg n,
    output reg [15:0] op
  );
  
  
  
  reg [15:0] arith;
  
  always @* begin
    
    case (alufn)
      6'h00: begin
        arith = $signed(a) + $signed(b);
      end
      6'h01: begin
        arith = $signed(a) - $signed(b);
      end
      6'h02: begin
        arith = $signed(a) * $signed(b);
      end
      default: begin
        arith = 1'h0;
      end
    endcase
    op = arith;
    if (arith == 16'h0000) begin
      z = 1'h1;
    end else begin
      z = 1'h0;
    end
    v = (a[15+0-:1] & (b[15+0-:1] ^ alufn[0+0-:1]) & ~arith[15+0-:1]) | (~a[15+0-:1] & ~(b[15+0-:1] ^ alufn[0+0-:1]) & arith[15+0-:1]);
    n = arith[15+0-:1];
  end
endmodule