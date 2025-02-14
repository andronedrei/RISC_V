`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/14/2025 10:34:59 AM
// Design Name: 
// Module Name: mux4_1
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

// mux 4_1 din 2 mux-uri 2_1
module mux4_1(
    input [31:0] in0, in1, in2, in3,
    input [1:0] sel,
    output [31:0] out
    );

    wire [31:0] mux_a_out;
    wire [31:0] mux_b_out;

    mux2_1 mux_a (in0, in1, sel[0],mux_a_out);
    mux2_1 mux_b (in2, in3, sel[0], mux_b_out);
    mux2_1 mux_c (mux_a_out, mux_b_out, sel[1], out);

endmodule
