`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/10/2024 12:24:59 PM
// Design Name: 
// Module Name: ALUcontrol
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module ALUcontrol(
    input [1:0] ALUop,
    input [6:0] func7,
    input [2:0] func3,
    output reg [3:0] ALUinput
);

    wire [11:0] alu_code;

    assign alu_code = {ALUop, func7, func3};

    always@(ALUop, func7, func3) begin
        casex(alu_code)
            12'b100000000111: ALUinput <= 4'b0000; // and
            12'b100000000110: ALUinput <= 4'b0001; // or
            12'b11xxxxxxx110: ALUinput <= 4'b0001; // ori 
            12'b100000000000: ALUinput <= 4'b0010; // add
            12'b00xxxxxxxxxx: ALUinput <= 4'b0010; // ld, sd // ultimi 3 biti pot desemna load si store pt biti, hald, word
            12'b11xxxxxxx000: ALUinput <= 4'b0010; // addi
            12'b100000000100: ALUinput <= 4'b0011; // xor
            12'b1x000000x001: ALUinput <= 4'b0100; // sll, slli // si pt immediate si pt register
            12'b1x000000x101: ALUinput <= 4'b0101; // srl, srli
            12'b100100000000: ALUinput <= 4'b0110; // sub
            12'b01xxxxxxx000: ALUinput <= 4'b0110; // beq
            12'b01xxxxxxx001: ALUinput <= 4'b0110; // bne
            12'b100000000011: ALUinput <= 4'b0111; // sltu
            12'b01xxxxxxx110: ALUinput <= 4'b0111; // bltu (branch if less than unsigned)
            12'b01xxxxxxx111: ALUinput <= 4'b0111; // bgeu (branch if greater or equal unsigned)
            12'b100000000010: ALUinput <= 4'b1000; // slt    
            12'b01xxxxxxx100: ALUinput <= 4'b1000; // blt (branch if less than, signed)
            12'b01xxxxxxx101: ALUinput <= 4'b1000; // bge (branch if greater or equal, signed) 
            12'b1x010000x101: ALUinput <= 4'b1001; // sra, srai   
            default: ALUinput <= 4'bxxxx;       
        endcase 
    end

endmodule
