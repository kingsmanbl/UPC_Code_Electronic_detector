// Top-level module that defines the I/Os for the DE-1 SoC board
module DE1_SoC (
    output logic [6:0] HEX0, 
    output logic [6:0] HEX1, 
    output logic [6:0] HEX2,
    output logic [6:0] HEX3, 
    output logic [6:0] HEX4,
    output logic [6:0] HEX5, 
    output logic [9:0] LEDR,
    input logic [3:0] KEY,
    input logic [9:0] SW
);

    // Hex display module
    logic [2:0] U;  // 3-bit input for item selection
    logic P;        // Input for marked item
    logic C;        // Input for returned item

    // Assign U, P, and C based on switch inputs
    assign U = SW[9:7]; // Bits for item selection
    assign P = SW[8];   // Marked item indicator
    assign C = SW[0];   // Returned item indicator
	 
	 assign LEDR[0] = (SW[9] && SW[7] || SW[8]); // Discounted light
    assign LEDR[1] = (SW[9] && ~SW[8] && ~SW[0]) || (~SW[8] && ~SW[7] && ~SW[0]); // Stolen light

    // hex_display module
    always_comb begin
        // Default values for HEX displays
        HEX0 = 7'b1111111; // Turn off
        HEX1 = 7'b1111111; // Turn off
        HEX2 = 7'b1111111; // Turn off
        HEX3 = 7'b1111111; // Turn off
        HEX4 = 7'b1111111; // Turn off
        HEX5 = 7'b1111111; // Turn off

        case (U)
            3'b000: begin // Shoes
                HEX0 = 7'b0010010; // S
            end
            3'b001: begin // Costume Jewelry
                HEX0 = 7'b1110000; // J
            end
            3'b010: begin // Christmas Ornament
                HEX0 = 7'b1000000; // O
            end
            3'b100: begin // Business Suit
                HEX0 = 7'b0000000; // B
            end
            3'b101: begin // Winter Coat
                HEX0 = 7'b1000110; // C
            end
            3'b111: begin // Socks
                HEX0 = 7'b0001001; // K
            end
            default: begin
                HEX0 = 7'b0000000;
                HEX1 = 7'b0000000;
            end
        endcase
    end

endmodule

// Testbench for the DE1_SoC module
module DE1_SoC_testbench();
    logic [6:0] HEX0, HEX1, HEX2, HEX3, HEX4, HEX5;
    logic [9:0] LEDR;
    logic [3:0] KEY;
    logic [9:0] SW;

    DE1_SoC dut (.HEX0(HEX0), .HEX1(HEX1), .HEX2(HEX2), .HEX3(HEX3), .HEX4(HEX4), .HEX5(HEX5), .KEY(KEY), .LEDR(LEDR), .SW(SW));

    // Test various combinations of inputs
    integer i;
    initial begin
        for (i = 0; i < 16; i++) begin
            {SW[9:7], SW[0]} = i;; // Try different switch combinations
            #10; // Wait for 10 time units
        end
    end
endmodule
