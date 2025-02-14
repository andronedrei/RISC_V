`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/05/2024 12:42:38 PM
// Design Name: 
// Module Name: adder
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

module IF(
    input clk, reset,
    input PCSrc, PC_write,
    input [31:0] PC_Branch,
    output [31:0] PC_IF, INSTRUCTION_IF
);
    
    wire [31:0] mux_output, PC_next, addr_output, inst_output, increment_value;

    assign increment_value = 32'd4;

    mux2_1 mux(addr_output, PC_Branch, PCSrc, mux_output);
    PC pc(clk, reset, PC_write, mux_output, PC_next);
    adder add(PC_next, increment_value, addr_output);
    instruction_memory mem(PC_next[11:2], inst_output);
  
    assign PC_IF = PC_next;
    assign INSTRUCTION_IF = inst_output;

endmodule
