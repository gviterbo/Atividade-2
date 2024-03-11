module corrige_hamming (
  input [0:14] entrada, // a paridade é o bit mais significativo (dado[8])
  output reg [0:10] saida
);

  // Temporary variables declaration
  wire p1, p2, p4, p8;
  wire [3:0] n;
  reg [0:14] mask;
  reg [0:14] result;

  // Calculating parity bits
  assign p1 = entrada[2] ^ entrada[4] ^ entrada[6] ^ entrada[8] ^ entrada[10] ^ entrada[12] ^ entrada[14];
  assign p2 = entrada[2] ^ entrada[5] ^ entrada[6] ^ entrada[9] ^ entrada[10] ^ entrada[13] ^ entrada[14];
  assign p4 = entrada[4] ^ entrada[5] ^ entrada[6] ^ entrada[11] ^ entrada[12] ^ entrada[13] ^ entrada[14];
  assign p8 = entrada[8] ^ entrada[9] ^ entrada[10] ^ entrada[11] ^ entrada[12] ^ entrada[13] ^ entrada[14];

  // Assigning input bits to result
  //assign result = {entrada[2], entrada[4:6], entrada[8:14]};

  // Calculating the error position (if any)
  assign n = ((p1 ^ entrada[0])) + 2*((p2 ^ entrada[1])) + 4*((p4 ^ entrada[3])) + 8*((p8 ^ entrada[7]));

  // Correcting the error (if any)
  always @(*) begin
    case(n)
      15: mask = 15'b000000000000001;
      14: mask = 15'b000000000000010;
      13: mask = 15'b000000000000100;
      12: mask = 15'b000000000001000;
      11: mask = 15'b000000000010000;
      10: mask = 15'b000000000100000;
      9: mask = 15'b000000001000000;
      8: mask = 15'b000000010000000;
      7: mask = 15'b000000100000000;
      6: mask = 15'b000001000000000;
      5: mask = 15'b000010000000000;
      4: mask = 15'b000100000000000;
      3: mask = 15'b001000000000000;
      2: mask = 15'b010000000000000;
      1: mask = 15'b100000000000000;
      default: mask = 15'b000000000000000;

    endcase
    result = entrada ^ mask;
    saida = {result[2], result[4:6], result[8:14]};
  end
endmodule