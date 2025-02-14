`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/18/2025 08:05:35 PM
// Design Name: 
// Module Name: branch_control
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

module branch_control(
    input ZERO, ALU_OUT, BRANCH, // zero de la ALU, ALU_OUT primul bit, branch carat de la control path
    input [2:0] FUNCT3,
    output PCSrc
);

wire beq; assign beq = ZERO & (~FUNCT3[2]) & (~FUNCT3[1]) & (~FUNCT3[0]);
wire bne; assign bne = (~ZERO) & (~FUNCT3[2]) & (~FUNCT3[1]) & FUNCT3[0];
wire blt; assign blt = ALU_OUT & FUNCT3[2] & (~FUNCT3[0]);
wire bge; assign bge = (~ALU_OUT) & FUNCT3[2] & FUNCT3[0];

assign PCSrc = BRANCH & (beq|bne|blt|bge); 

endmodule
