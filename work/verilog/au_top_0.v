/*
   This file was generated automatically by Alchitry Labs version 1.2.1.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

module au_top_0 (
    input clk,
    input rst_n,
    output reg [7:0] led,
    input usb_rx,
    output reg usb_tx,
    output reg [15:0] led_matrix,
    output reg [15:0] seven_seg,
    input button1t,
    input button1f,
    input button2t,
    input button2f,
    input buttonreset,
    output reg [5:0] led_debug
  );
  
  
  
  reg rst;
  
  reg [2:0] wdsel;
  
  reg [2:0] asel;
  
  reg [2:0] bsel;
  
  reg [15:0] rb_data_fsm;
  
  reg [4:0] ra;
  
  reg [4:0] rb;
  
  reg [4:0] rc;
  
  reg we;
  
  reg [15:0] wd;
  
  reg clktwo;
  
  wire [1-1:0] M_ctr_value;
  counter_1 ctr (
    .clk(clk),
    .rst(rst),
    .value(M_ctr_value)
  );
  
  wire [1-1:0] M_reset_cond_out;
  reg [1-1:0] M_reset_cond_in;
  reset_conditioner_2 reset_cond (
    .clk(clk),
    .in(M_reset_cond_in),
    .out(M_reset_cond_out)
  );
  wire [1-1:0] M_player1t_out;
  reg [1-1:0] M_player1t_in;
  button_conditioner_3 player1t (
    .clk(clk),
    .in(M_player1t_in),
    .out(M_player1t_out)
  );
  wire [1-1:0] M_player1f_out;
  reg [1-1:0] M_player1f_in;
  button_conditioner_3 player1f (
    .clk(clk),
    .in(M_player1f_in),
    .out(M_player1f_out)
  );
  wire [1-1:0] M_player2t_out;
  reg [1-1:0] M_player2t_in;
  button_conditioner_3 player2t (
    .clk(clk),
    .in(M_player2t_in),
    .out(M_player2t_out)
  );
  wire [1-1:0] M_player2f_out;
  reg [1-1:0] M_player2f_in;
  button_conditioner_3 player2f (
    .clk(clk),
    .in(M_player2f_in),
    .out(M_player2f_out)
  );
  wire [1-1:0] M_gamereset_out;
  reg [1-1:0] M_gamereset_in;
  button_conditioner_3 gamereset (
    .clk(clk),
    .in(M_gamereset_in),
    .out(M_gamereset_out)
  );
  wire [1-1:0] M_edge1t_out;
  reg [1-1:0] M_edge1t_in;
  edge_detector_4 edge1t (
    .clk(clk),
    .in(M_edge1t_in),
    .out(M_edge1t_out)
  );
  wire [1-1:0] M_edge1f_out;
  reg [1-1:0] M_edge1f_in;
  edge_detector_4 edge1f (
    .clk(clk),
    .in(M_edge1f_in),
    .out(M_edge1f_out)
  );
  wire [1-1:0] M_edge2t_out;
  reg [1-1:0] M_edge2t_in;
  edge_detector_4 edge2t (
    .clk(clk),
    .in(M_edge2t_in),
    .out(M_edge2t_out)
  );
  wire [1-1:0] M_edge2f_out;
  reg [1-1:0] M_edge2f_in;
  edge_detector_4 edge2f (
    .clk(clk),
    .in(M_edge2f_in),
    .out(M_edge2f_out)
  );
  wire [1-1:0] M_edgereset_out;
  reg [1-1:0] M_edgereset_in;
  edge_detector_5 edgereset (
    .clk(clk),
    .in(M_edgereset_in),
    .out(M_edgereset_out)
  );
  wire [8-1:0] M_matrix_row;
  wire [8-1:0] M_matrix_col;
  reg [2-1:0] M_matrix_sign;
  led_matrix_driver_6 matrix (
    .clk(clk),
    .rst(rst),
    .sign(M_matrix_sign),
    .row(M_matrix_row),
    .col(M_matrix_col)
  );
  wire [32-1:0] M_randgen_num;
  reg [1-1:0] M_randgen_next;
  reg [32-1:0] M_randgen_seed;
  pn_gen_7 randgen (
    .clk(clk),
    .rst(rst),
    .next(M_randgen_next),
    .seed(M_randgen_seed),
    .num(M_randgen_num)
  );
  
  wire [16-1:0] M_register_ra_data;
  wire [16-1:0] M_register_rb_data;
  wire [7-1:0] M_register_numa;
  wire [7-1:0] M_register_numb;
  wire [4-1:0] M_register_p1_score;
  wire [4-1:0] M_register_p2_score;
  wire [2-1:0] M_register_sign;
  wire [1-1:0] M_register_answer;
  wire [1-1:0] M_register_p1_win;
  wire [1-1:0] M_register_p2_win;
  reg [5-1:0] M_register_ra;
  reg [5-1:0] M_register_rb;
  reg [5-1:0] M_register_rc;
  reg [16-1:0] M_register_write_data;
  reg [1-1:0] M_register_write_enable;
  register_8 register (
    .clk(clk),
    .ra(M_register_ra),
    .rb(M_register_rb),
    .rc(M_register_rc),
    .write_data(M_register_write_data),
    .write_enable(M_register_write_enable),
    .ra_data(M_register_ra_data),
    .rb_data(M_register_rb_data),
    .numa(M_register_numa),
    .numb(M_register_numb),
    .p1_score(M_register_p1_score),
    .p2_score(M_register_p2_score),
    .sign(M_register_sign),
    .answer(M_register_answer),
    .p1_win(M_register_p1_win),
    .p2_win(M_register_p2_win)
  );
  wire [16-1:0] M_alu_result;
  reg [16-1:0] M_alu_a;
  reg [16-1:0] M_alu_b;
  reg [6-1:0] M_alu_alufn;
  alu_9 alu (
    .clk(clk),
    .a(M_alu_a),
    .b(M_alu_b),
    .alufn(M_alu_alufn),
    .result(M_alu_result)
  );
  reg [5:0] M_fsm_state_d, M_fsm_state_q = 1'h0;
  reg [31:0] M_seed_d, M_seed_q = 1'h0;
  
  wire [8-1:0] M_digits_a_digits;
  reg [7-1:0] M_digits_a_value;
  bin_to_dec_10 digits_a (
    .value(M_digits_a_value),
    .digits(M_digits_a_digits)
  );
  
  wire [8-1:0] M_digits_b_digits;
  reg [7-1:0] M_digits_b_value;
  bin_to_dec_10 digits_b (
    .value(M_digits_b_value),
    .digits(M_digits_b_digits)
  );
  
  always @* begin
    M_seed_d = M_seed_q;
    M_fsm_state_d = M_fsm_state_q;
    
    clktwo = M_ctr_value[0+0-:1];
    M_reset_cond_in = ~rst_n;
    rst = M_reset_cond_out;
    usb_tx = usb_rx;
    led = 8'h00;
    led_matrix[0+7-:8] = 8'h00;
    M_randgen_next = 1'h0;
    M_randgen_seed = M_seed_q;
    asel = 1'h0;
    bsel = 1'h0;
    wdsel = 1'h0;
    led_matrix[0+7-:8] = M_matrix_col;
    led_matrix[8+7-:8] = M_matrix_row;
    ra = 1'h0;
    rb = 1'h0;
    we = 1'h0;
    rc = 1'h0;
    wd = 1'h0;
    seven_seg = 16'h0000;
    rb_data_fsm = M_register_rb_data;
    M_matrix_sign = M_register_sign;
    M_digits_a_value = M_register_numa[0+6-:7];
    M_digits_b_value = M_register_numb[0+6-:7];
    led_debug = 1'h0;
    
    case (M_register_p1_score)
      1'h1: begin
        led_debug[0+0-:1] = 1'h1;
      end
      2'h2: begin
        led_debug[0+1-:2] = 2'h3;
      end
      2'h3: begin
        led_debug[0+2-:3] = 3'h7;
      end
    endcase
    
    case (M_register_p2_score)
      1'h1: begin
        led_debug[3+0-:1] = 1'h1;
      end
      2'h2: begin
        led_debug[3+1-:2] = 2'h3;
      end
      2'h3: begin
        led_debug[3+2-:3] = 3'h7;
      end
    endcase
    seven_seg[0+3-:4] = M_digits_a_digits[4+3-:4];
    seven_seg[4+3-:4] = M_digits_a_digits[0+3-:4];
    seven_seg[8+3-:4] = M_digits_b_digits[4+3-:4];
    seven_seg[12+3-:4] = M_digits_b_digits[0+3-:4];
    M_alu_a = 1'h0;
    M_alu_b = 1'h0;
    M_alu_alufn = 1'h0;
    M_player1t_in = button1t;
    M_edge1t_in = M_player1t_out;
    M_player1f_in = button1f;
    M_edge1f_in = M_player1f_out;
    M_player2t_in = button2t;
    M_edge2t_in = M_player2t_out;
    M_player2f_in = button2f;
    M_edge2f_in = M_player2f_out;
    M_gamereset_in = buttonreset;
    M_edgereset_in = M_gamereset_out;
    
    case (M_fsm_state_q)
      6'h00: begin
        M_fsm_state_d = 6'h01;
      end
      6'h01: begin
        M_fsm_state_d = 6'h02;
      end
      6'h02: begin
        M_fsm_state_d = 6'h19;
      end
      6'h03: begin
        if (M_edge1t_out == 1'h1) begin
          M_fsm_state_d = 6'h04;
        end else begin
          if (M_edge1f_out == 1'h1) begin
            M_fsm_state_d = 6'h05;
          end else begin
            if (M_edge2t_out == 1'h1) begin
              M_fsm_state_d = 6'h0c;
            end else begin
              if (M_edge2f_out == 1'h1) begin
                M_fsm_state_d = 6'h0d;
              end
            end
          end
        end
      end
      6'h04: begin
        M_alu_alufn = 6'h33;
        asel = 3'h1;
        bsel = 3'h0;
        we = 1'h1;
        ra = 1'h0;
        rb = 5'h06;
        wdsel = 3'h0;
        rc = 5'h08;
        M_fsm_state_d = 6'h06;
      end
      6'h05: begin
        M_alu_alufn = 6'h33;
        asel = 3'h2;
        bsel = 3'h0;
        we = 1'h1;
        ra = 1'h0;
        rb = 5'h06;
        wdsel = 3'h0;
        rc = 5'h08;
        M_fsm_state_d = 6'h06;
      end
      6'h06: begin
        M_alu_alufn = 1'h0;
        asel = 1'h0;
        bsel = 1'h0;
        we = 1'h0;
        ra = 1'h0;
        rb = 5'h08;
        wdsel = 1'h0;
        rc = 1'h0;
        
        case (rb_data_fsm[0+0-:1])
          1'h1: begin
            M_fsm_state_d = 6'h07;
          end
          1'h0: begin
            M_fsm_state_d = 6'h02;
          end
        endcase
      end
      6'h07: begin
        M_alu_alufn = 6'h00;
        asel = 3'h0;
        bsel = 3'h1;
        we = 1'h1;
        ra = 5'h00;
        rb = 1'h0;
        wdsel = 3'h0;
        rc = 5'h00;
        M_fsm_state_d = 6'h08;
      end
      6'h08: begin
        M_alu_alufn = 6'h33;
        asel = 3'h0;
        bsel = 3'h3;
        we = 1'h1;
        ra = 5'h00;
        rb = 1'h0;
        wdsel = 3'h0;
        rc = 5'h09;
        M_fsm_state_d = 6'h09;
      end
      6'h09: begin
        M_alu_alufn = 1'h0;
        asel = 1'h0;
        bsel = 1'h0;
        we = 1'h0;
        ra = 1'h0;
        rb = 5'h09;
        wdsel = 1'h0;
        rc = 1'h0;
        
        case (rb_data_fsm[0+0-:1])
          1'h1: begin
            M_fsm_state_d = 6'h0a;
          end
          1'h0: begin
            M_fsm_state_d = 6'h02;
          end
        endcase
      end
      6'h0a: begin
        M_alu_alufn = 1'h0;
        asel = 1'h0;
        bsel = 1'h0;
        we = 1'h1;
        ra = 1'h0;
        rb = 1'h0;
        wdsel = 3'h1;
        rc = 5'h0a;
        M_fsm_state_d = 6'h0b;
      end
      6'h0b: begin
        M_alu_alufn = 1'h0;
        asel = 1'h0;
        bsel = 1'h0;
        we = 1'h1;
        ra = 1'h0;
        rb = 1'h0;
        wdsel = 3'h2;
        rc = 5'h0b;
        M_fsm_state_d = 6'h14;
      end
      6'h0c: begin
        M_alu_alufn = 6'h33;
        asel = 3'h1;
        bsel = 3'h0;
        we = 1'h1;
        ra = 1'h0;
        rb = 5'h06;
        wdsel = 3'h0;
        rc = 5'h08;
        M_fsm_state_d = 6'h0e;
      end
      6'h0d: begin
        M_alu_alufn = 6'h33;
        asel = 3'h2;
        bsel = 3'h0;
        we = 1'h1;
        ra = 1'h0;
        rb = 5'h06;
        wdsel = 3'h0;
        rc = 5'h08;
        M_fsm_state_d = 6'h0e;
      end
      6'h0e: begin
        M_alu_alufn = 1'h0;
        asel = 1'h0;
        bsel = 1'h0;
        we = 1'h0;
        ra = 1'h0;
        rb = 5'h08;
        wdsel = 1'h0;
        rc = 1'h0;
        
        case (rb_data_fsm[0+0-:1])
          1'h1: begin
            M_fsm_state_d = 6'h0f;
          end
          1'h0: begin
            M_fsm_state_d = 6'h02;
          end
        endcase
      end
      6'h0f: begin
        M_alu_alufn = 6'h00;
        asel = 3'h0;
        bsel = 3'h1;
        we = 1'h1;
        ra = 5'h02;
        rb = 1'h0;
        wdsel = 3'h0;
        rc = 5'h02;
        M_fsm_state_d = 6'h10;
      end
      6'h10: begin
        M_alu_alufn = 6'h33;
        asel = 3'h0;
        bsel = 3'h3;
        we = 1'h1;
        ra = 5'h02;
        rb = 1'h0;
        wdsel = 3'h0;
        rc = 5'h09;
        M_fsm_state_d = 6'h11;
      end
      6'h11: begin
        M_alu_alufn = 1'h0;
        asel = 1'h0;
        bsel = 1'h0;
        we = 1'h0;
        ra = 1'h0;
        rb = 5'h09;
        wdsel = 1'h0;
        rc = 1'h0;
        
        case (rb_data_fsm[0+0-:1])
          1'h1: begin
            M_fsm_state_d = 6'h12;
          end
          1'h0: begin
            M_fsm_state_d = 6'h02;
          end
        endcase
      end
      6'h12: begin
        M_alu_alufn = 1'h0;
        asel = 1'h0;
        bsel = 1'h0;
        we = 1'h1;
        ra = 1'h0;
        rb = 1'h0;
        wdsel = 3'h1;
        rc = 5'h0b;
        M_fsm_state_d = 6'h13;
      end
      6'h13: begin
        M_alu_alufn = 1'h0;
        asel = 1'h0;
        bsel = 1'h0;
        we = 1'h1;
        ra = 1'h0;
        rb = 1'h0;
        wdsel = 3'h2;
        rc = 5'h0a;
        M_fsm_state_d = 6'h14;
      end
      6'h14: begin
        M_alu_alufn = 1'h0;
        asel = 1'h0;
        bsel = 1'h0;
        we = 1'h0;
        ra = 1'h0;
        rb = 1'h0;
        wdsel = 1'h0;
        rc = 1'h0;
        
        case (M_edgereset_out)
          1'h0: begin
            M_fsm_state_d = 6'h14;
          end
          1'h1: begin
            M_fsm_state_d = 6'h15;
          end
        endcase
      end
      6'h15: begin
        M_alu_alufn = 1'h0;
        asel = 1'h0;
        bsel = 1'h0;
        we = 1'h1;
        ra = 1'h0;
        rb = 1'h0;
        wdsel = 3'h2;
        rc = 5'h0a;
        M_fsm_state_d = 6'h16;
      end
      6'h16: begin
        M_alu_alufn = 1'h0;
        asel = 1'h0;
        bsel = 1'h0;
        we = 1'h1;
        ra = 1'h0;
        rb = 1'h0;
        wdsel = 3'h2;
        rc = 5'h0b;
        M_fsm_state_d = 6'h17;
      end
      6'h17: begin
        M_alu_alufn = 1'h0;
        asel = 1'h0;
        bsel = 1'h0;
        we = 1'h1;
        ra = 1'h0;
        rb = 1'h0;
        wdsel = 3'h2;
        rc = 5'h00;
        M_fsm_state_d = 6'h18;
      end
      6'h18: begin
        M_alu_alufn = 1'h0;
        asel = 1'h0;
        bsel = 1'h0;
        we = 1'h1;
        ra = 1'h0;
        rb = 1'h0;
        wdsel = 3'h2;
        rc = 5'h02;
        M_fsm_state_d = 6'h02;
      end
      6'h19: begin
        M_alu_alufn = 1'h0;
        asel = 1'h0;
        bsel = 1'h0;
        we = 1'h1;
        ra = 1'h0;
        rb = 1'h0;
        wdsel = 3'h3;
        rc = 5'h04;
        M_fsm_state_d = 6'h1a;
        M_randgen_next = 1'h1;
        M_seed_d = M_seed_q + 1'h1;
      end
      6'h1a: begin
        M_alu_alufn = 6'h37;
        asel = 3'h0;
        bsel = 3'h6;
        we = 1'h1;
        ra = 5'h04;
        rb = 5'h04;
        wdsel = 3'h0;
        rc = 5'h0f;
        M_fsm_state_d = 6'h1b;
      end
      6'h1b: begin
        M_alu_alufn = 1'h0;
        asel = 1'h0;
        bsel = 1'h0;
        we = 1'h0;
        ra = 1'h0;
        rb = 5'h0f;
        wdsel = 1'h0;
        rc = 1'h0;
        
        case (rb_data_fsm[0+0-:1])
          1'h1: begin
            M_fsm_state_d = 6'h1c;
          end
          1'h0: begin
            M_fsm_state_d = 6'h19;
          end
        endcase
      end
      6'h1c: begin
        M_alu_alufn = 1'h0;
        asel = 1'h0;
        bsel = 1'h0;
        we = 1'h1;
        ra = 1'h0;
        rb = 1'h0;
        wdsel = 3'h3;
        rc = 5'h05;
        M_fsm_state_d = 6'h1d;
        M_randgen_next = 1'h1;
        M_seed_d = M_seed_q + 1'h1;
      end
      6'h1d: begin
        M_alu_alufn = 6'h37;
        asel = 3'h0;
        bsel = 3'h6;
        we = 1'h1;
        ra = 5'h05;
        rb = 1'h0;
        wdsel = 3'h0;
        rc = 5'h0f;
        M_fsm_state_d = 6'h1e;
      end
      6'h1e: begin
        M_alu_alufn = 1'h0;
        asel = 1'h0;
        bsel = 1'h0;
        we = 1'h0;
        ra = 1'h0;
        rb = 5'h0f;
        wdsel = 1'h0;
        rc = 1'h0;
        
        case (rb_data_fsm[0+0-:1])
          1'h1: begin
            M_fsm_state_d = 6'h1f;
          end
          1'h0: begin
            M_fsm_state_d = 6'h1c;
          end
        endcase
      end
      6'h1f: begin
        M_alu_alufn = 1'h0;
        asel = 1'h0;
        bsel = 1'h0;
        we = 1'h1;
        ra = 1'h0;
        rb = 1'h0;
        wdsel = 3'h4;
        rc = 5'h07;
        M_fsm_state_d = 6'h21;
        M_randgen_next = 1'h1;
        M_seed_d = M_seed_q + 1'h1;
      end
      6'h21: begin
        M_alu_alufn = 1'h0;
        asel = 1'h0;
        bsel = 1'h0;
        we = 1'h0;
        ra = 1'h0;
        rb = 5'h07;
        wdsel = 1'h0;
        rc = 1'h0;
        
        case (rb_data_fsm[0+1-:2])
          1'h0: begin
            M_fsm_state_d = 6'h22;
          end
          1'h1: begin
            M_fsm_state_d = 6'h23;
          end
          2'h2: begin
            M_fsm_state_d = 6'h24;
          end
          2'h3: begin
            M_fsm_state_d = 6'h1f;
          end
        endcase
      end
      6'h22: begin
        M_alu_alufn = 6'h35;
        asel = 3'h0;
        bsel = 3'h0;
        we = 1'h1;
        ra = 5'h04;
        rb = 5'h05;
        wdsel = 3'h0;
        rc = 5'h06;
        M_fsm_state_d = 6'h03;
      end
      6'h23: begin
        M_alu_alufn = 6'h35;
        asel = 3'h0;
        bsel = 3'h0;
        we = 1'h1;
        ra = 5'h05;
        rb = 5'h04;
        wdsel = 3'h0;
        rc = 5'h06;
        M_fsm_state_d = 6'h03;
      end
      6'h24: begin
        M_alu_alufn = 6'h33;
        asel = 3'h0;
        bsel = 3'h0;
        we = 1'h1;
        ra = 5'h04;
        rb = 5'h05;
        wdsel = 3'h0;
        rc = 5'h06;
        M_fsm_state_d = 6'h03;
      end
      default: begin
        M_fsm_state_d = 6'h01;
      end
    endcase
    wd = 16'h0000;
    
    case (wdsel)
      1'h0: begin
        wd = M_alu_result;
      end
      1'h1: begin
        wd = 16'hffff;
      end
      2'h2: begin
        wd = 1'h0;
      end
      2'h3: begin
        wd = M_randgen_num[0+6-:7];
      end
      3'h4: begin
        wd = M_randgen_num[0+1-:2];
      end
    endcase
    
    case (asel)
      1'h0: begin
        M_alu_a = M_register_ra_data;
      end
      1'h1: begin
        M_alu_a = 16'h0001;
      end
      2'h2: begin
        M_alu_a = 16'h0000;
      end
      2'h3: begin
        M_alu_a = 16'h0003;
      end
      3'h4: begin
        M_alu_a = 16'h001a;
      end
      3'h5: begin
        M_alu_a = 16'h001b;
      end
    endcase
    
    case (bsel)
      1'h0: begin
        M_alu_b = M_register_rb_data;
      end
      1'h1: begin
        M_alu_b = 16'h0001;
      end
      2'h2: begin
        M_alu_b = 16'h0000;
      end
      2'h3: begin
        M_alu_b = 16'h0003;
      end
      3'h4: begin
        M_alu_b = 16'h0007;
      end
      3'h5: begin
        M_alu_b = 16'h0009;
      end
      3'h6: begin
        M_alu_b = 16'h0063;
      end
    endcase
    M_register_ra = ra;
    M_register_rb = rb;
    M_register_write_data = wd;
    M_register_write_enable = we;
    M_register_rc = rc;
  end
  
  always @(posedge clk) begin
    M_fsm_state_q <= M_fsm_state_d;
    M_seed_q <= M_seed_d;
  end
  
endmodule
