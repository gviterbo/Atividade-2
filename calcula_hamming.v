module calcula_hamming (
  input [0:10] entrada,
  output [0:14] saida
);

  // Calculate the parity bits
  assign saida[0] = entrada[0] ^ entrada[1] ^ entrada[3] ^ entrada[4] ^ entrada[6] ^ entrada[8] ^ entrada[10]; // P1
  assign saida[1] = entrada[0] ^ entrada[2] ^ entrada[3] ^ entrada[5] ^ entrada[6] ^ entrada[9] ^ entrada[10]; // P2
  assign saida[3] = entrada[1] ^ entrada[2] ^ entrada[3] ^ entrada[7] ^ entrada[8] ^ entrada[9] ^ entrada[10]; // P4
  assign saida[7] = entrada[4] ^ entrada[5] ^ entrada[6] ^ entrada[7] ^ entrada[8] ^ entrada[9] ^ entrada[10]; // P8

  // Assign the data bits to their respective positions
  assign saida[2] = entrada[0]; // D1
  assign saida[4] = entrada[1]; // D2
  assign saida[5] = entrada[2]; // D3
  assign saida[6] = entrada[3]; // D4
  assign saida[8] = entrada[4]; // D5
  assign saida[9] = entrada[5]; // D6
  assign saida[10] = entrada[6]; // D7
  assign saida[11] = entrada[7]; // D8
  assign saida[12] = entrada[8]; // D9
  assign saida[13] = entrada[9]; // D10
  assign saida[14] = entrada[10]; // D11

endmodule
