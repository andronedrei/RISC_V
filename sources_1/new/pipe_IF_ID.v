`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/19/2024 01:06:28 PM
// Design Name: 
// Module Name: pipe_IF_ID
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


module pipe_IF_ID(
    input clk,  
    input reset, 
    input IF_ID_write, 
    input [31:0] PC_IF, INSTR_IF, 
    output reg [31:0] PC_IF_out, INSTR_IF_out
);

   always@(posedge clk) begin
        if (reset == 1) begin
            PC_IF_out <= 32'd0;
            INSTR_IF_out <= 32'd0;
        end
        else if (IF_ID_write == 1) begin
            PC_IF_out <= PC_IF;
            INSTR_IF_out <= INSTR_IF;
        end
    end
endmodule
