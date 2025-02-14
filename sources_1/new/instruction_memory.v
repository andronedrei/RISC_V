`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/05/2024 12:33:17 PM
// Design Name: 
// Module Name: instruction_memory
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


module instruction_memory(
    input [9:0] address, // 10 biti adresa
    // output
    output reg [31:0] instruction
    );
    
    // avem 2^10 adrese, deci o memorie de 1024
    reg [31:0] codeMemory [0:1023];
    
    // citim din "code.mem" in codeMemory
    initial $readmemh("code_stud.mem", codeMemory);

    always @(address)
        instruction <= codeMemory[address];
endmodule
