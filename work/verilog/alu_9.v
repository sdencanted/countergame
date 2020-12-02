/*
   This file was generated automatically by Alchitry Labs version 1.2.1.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

module alu_9 (
    input clk,
    input [15:0] a,
    input [15:0] b,
    input [5:0] alufn,
    output reg [15:0] result
  );
  
  
  
  wire [16-1:0] M_bool_c;
  reg [6-1:0] M_bool_alufn;
  reg [16-1:0] M_bool_a;
  reg [16-1:0] M_bool_b;
  boole_13 bool (
    .alufn(M_bool_alufn),
    .a(M_bool_a),
    .b(M_bool_b),
    .c(M_bool_c)
  );
  
  wire [16-1:0] M_shif_c;
  reg [6-1:0] M_shif_alufn;
  reg [16-1:0] M_shif_a;
  reg [4-1:0] M_shif_b;
  shift_14 shif (
    .alufn(M_shif_alufn),
    .a(M_shif_a),
    .b(M_shif_b),
    .c(M_shif_c)
  );
  
  wire [1-1:0] M_arith_z;
  wire [1-1:0] M_arith_v;
  wire [1-1:0] M_arith_n;
  wire [16-1:0] M_arith_op;
  reg [16-1:0] M_arith_a;
  reg [16-1:0] M_arith_b;
  reg [6-1:0] M_arith_alufn;
  arithmetic_15 arith (
    .a(M_arith_a),
    .b(M_arith_b),
    .alufn(M_arith_alufn),
    .z(M_arith_z),
    .v(M_arith_v),
    .n(M_arith_n),
    .op(M_arith_op)
  );
  
  wire [16-1:0] M_comp_cmp;
  reg [1-1:0] M_comp_z;
  reg [1-1:0] M_comp_n;
  reg [1-1:0] M_comp_v;
  reg [6-1:0] M_comp_alufn;
  compare_16 comp (
    .z(M_comp_z),
    .n(M_comp_n),
    .v(M_comp_v),
    .alufn(M_comp_alufn),
    .cmp(M_comp_cmp)
  );
  
  wire [1-1:0] M_comparith_z;
  wire [1-1:0] M_comparith_v;
  wire [1-1:0] M_comparith_n;
  wire [16-1:0] M_comparith_op;
  reg [16-1:0] M_comparith_a;
  reg [16-1:0] M_comparith_b;
  reg [6-1:0] M_comparith_alufn;
  arithmetic_15 comparith (
    .a(M_comparith_a),
    .b(M_comparith_b),
    .alufn(M_comparith_alufn),
    .z(M_comparith_z),
    .v(M_comparith_v),
    .n(M_comparith_n),
    .op(M_comparith_op)
  );
  
  
  always @* begin
    M_bool_a = a;
    M_bool_b = b;
    M_bool_alufn = alufn;
    M_shif_a = a;
    M_shif_b = b[0+3-:4];
    M_shif_alufn = alufn;
    M_arith_a = a;
    M_arith_b = b;
    M_arith_alufn = alufn;
    M_comparith_a = a;
    M_comparith_b = b;
    M_comparith_alufn = 6'h01;
    M_comp_v = M_comparith_v;
    M_comp_z = M_comparith_z;
    M_comp_n = M_comparith_n;
    M_comp_alufn = alufn;
    result = 1'h0;
    
    case (alufn[5+0-:1])
      1'h0: begin
        
        case (alufn[4+0-:1])
          1'h0: begin
            result = M_arith_op;
          end
          1'h1: begin
            result = M_bool_c;
          end
        endcase
      end
      1'h1: begin
        
        case (alufn[4+0-:1])
          1'h0: begin
            result = M_shif_c;
          end
          1'h1: begin
            result = M_comp_cmp;
          end
        endcase
      end
    endcase
  end
endmodule