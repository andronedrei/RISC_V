`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/14/2025 10:46:08 AM
// Design Name: 
// Module Name: data_memory
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


module data_memory(
    input clk,       
    input mem_read,
    input mem_write,
    input [31:0] address,
    input [31:0] write_data,
    output reg [31:0] read_data
);

    // memorie 1024 de cuvinte de 32 biti
    reg [31:0] DataMemory [0:1023];

    // ca sa avem 2^10 optiuni, atatea cuvinte sunt in memorie
    wire [9:0] address_index = address[11:2]; // >> 2 ca au cuvintele cate 4 baiti
    
    integer i;
    initial begin
        for (i = 0; i < 1024; i = i + 1) begin
            DataMemory[i] = 32'b0;
        end
    end
    
    // scriere date memorie
    always @(posedge clk) begin
        if (mem_write == 1) begin
            DataMemory[address_index] <= write_data;
        end
    end

    // ?? citire asincrona sa se realizeze in acelasi ciclu de ceas
    // always @(*) begin
    always @(posedge clk) begin
        if (mem_read == 1) begin
            // read_data = DataMemory[address_index];
            read_data <= DataMemory[address_index];
        end else begin
            // read_data = 32'hXXXXXXXX;
            read_data <= 32'hXXXXXXXX;
        end
    end

endmodule