module injetor(
  input [14:0] entrada,
  input [3:0] n,
  input erro,
  output reg [14:0] saida
);

  reg [14:0] mask;
    always @(*) begin
        if (erro == 1)
            case(n)
                0: mask = 15'b000000000000001;
                1: mask = 15'b000000000000010;
                2: mask = 15'b000000000000100;
                3: mask = 15'b000000000001000;
                4: mask = 15'b000000000010000;
                5: mask = 15'b000000000100000;
                6: mask = 15'b000000001000000;
                7: mask = 15'b000000010000000;
                8: mask = 15'b000000100000000;
                9: mask = 15'b000001000000000;
                10: mask = 15'b000010000000000;
                11: mask = 15'b000100000000000;
                12: mask = 15'b001000000000000;
                13: mask = 15'b010000000000000;
                14: mask = 15'b100000000000000;
                default: mask = 15'b000000000000000;

            endcase
        else 
            mask = 15'b000000000000000;            
        saida = entrada ^ mask;
    end  

endmodule
