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

module imm_gen(
    input [31:0] in,
    output reg [31:0] out
    );
    
    wire [9:0] instruction_code;
    
    assign instruction_code = {in[14:12], in[6:0]}; // func3 + opcode
    
    always @(in)
    begin
        casex(instruction_code)
            10'b0000010011:  // ADDI
            begin
                out[31:11] <= {21{in[31]}}; // extensie semn bit poz 11
                out[10:0] <= in[30:20];
            end
            10'b1100010011:  // ORI
            begin
                out[31:11] <= {21{in[31]}};
                out[10:0] <= in[30:20];
            end
            10'b1110010011:  // ANDI
            begin
                out[31:11] <= {21{in[31]}};
                out[10:0] <= in[30:20];
            end
            10'b1000010011:  // XORI
            begin
                out[31:11] <= {21{in[31]}};
                out[10:0] <= in[30:20];
            end
            10'b0100010011:  // SLTI
            begin
                out[31:11] <= {21{in[31]}};
                out[10:0] <= in[30:20];
            end
            10'b0110010011:  // SLTIU
            begin
                out[31:11] <= {21{in[31]}};
                out[10:0] <= in[30:20];
            end
            10'b1010010011:  // SRLI / SRAI (au func3 + opcode la fel)
            begin
                out[31:5] <= {27{1'b0}};
                out[4:0] <= in[24:20];
            end
            10'b0010010011:  // SLLI
            begin
                out[31:5] <= {27{1'b0}};
                out[4:0] <= in[24:20];
            end
            10'bxxx0100011:  // SW (Store Word) (Ex SB)
            begin
                out[31:11] <= {21{in[31]}};
                out[10:5] <= in[30:25];
                out[4:0] <= in[11:7];
            end
            10'bxxx0000011:  // LW (Load Word) (Ex LB)
            begin
                out[31:11] <= {21{in[31]}};
                out[10:0] <= in[30:20];
            end
            10'bxxx1100011:  // B-type (Branch) (Ex BEQ)
            begin
                out[31:12] <= {20{in[31]}};  // extensie semn
                out[11] <= in[7];
                out[10:5] <= in[30:25];
                out[4:1] <= in[11:8];
                out[0] <= 1'b0;
            end        
            default:
            begin
                out <= 32'b0;  // Default case
            end
        endcase
    end
endmodule