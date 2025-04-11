module hex_display(
    input logic [9:7] U,
    input logic P,       
    input logic C,     
    output logic [6:0] HEX0, 
    output logic [6:0] HEX1, 
    output logic [6:0] HEX2,
    output logic [6:0] HEX3, 
    output logic [6:0] HEX4,
    output logic [6:0] HEX5 
);
    always_comb begin
        // Default values (not displaying anything)
        HEX0 = 7'b1111111;
        HEX1 = 7'b1111111;
        HEX2 = 7'b1111111;
        HEX3 = 7'b1111111;
        HEX4 = 7'b1111111;
        HEX5 = 7'b1111111;

        case (U)
            3'b000: begin // Shoes
                HEX0 = 7'b1011011; // S
            end
            3'b001: begin // Costume Jewelry
                HEX0 = 7'b1111000; // J
            end
            3'b010: begin // Christmas Ornament
                HEX0 = 7'b1111110; // O
            end
            3'b100: begin // Business Suit
                HEX0 = 7'b1111111; // B
            end
            3'b101: begin // Winter Coat
                HEX0 = 7'b1001110; // C
            end
            3'b111: begin // Socks
                HEX0 = 7'b0110111; // K
            end
            default: begin
                HEX0 = 7'b0000000;
                HEX1 = 7'b0000000;
            end
        endcase
    end
endmodule