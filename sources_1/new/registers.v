`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/12/2024 01:05:38 PM
// Design Name: 
// Module Name: registers
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


module registers(
    input clk,
    input reg_write,
    input [4:0] read_reg1, read_reg2, write_reg,
    input [31:0] write_data,
    output [31:0] read_data1, read_data2
    );
    
    // 32 de registrii (32 = 2^5) a cate 32 de biti
    reg [31:0] registers [31:0];
    // reg [31:0] out_1, out_2; // auxiliare
    
    // initializare registre
    initial begin
       for (integer i = 0; i < 32; i = i + 1) begin
           registers[i] = i; 
       end
    end
    
    always @(posedge clk)
    begin
        if (reg_write && write_reg != 5'd0) begin // nu scriem in reg 0
            registers[write_reg] <= write_data;
        end
    end
    
//    always @(read_reg1)
//    begin
//        if (read_reg1 == 5'd0) begin
//            out_1 <= 32'd0;
//        end else begin // evitam read after write
//            if (read_reg1 != write_reg) begin
//                out_1 <= registers[read_reg1];
//            end else begin
//                out_1 <= write_data;
//            end
//        end
//    end

// always @(read_reg2)
//    begin
//        if (read_reg2 == 5'd0) begin
//            out_2 <= 32'd0;
//        end else begin // evitam read after write
//            if (read_reg2 != write_reg) begin
//                out_2 <= registers[read_reg2];
//            end else begin
//                out_2 <= write_data;
//            end
//        end
//    end

// assign read_data1 = out_1; 
// assign read_data2 = out_2;

    assign read_data1 = read_reg1 == 5'd0 ?
        32'd0 :
        ((read_reg1 != write_reg || reg_write == 0) ?
            registers[read_reg1] :
            write_data);

    assign read_data2 = read_reg2 == 5'd0 ?
        32'd0 :
        ((read_reg2 != write_reg || reg_write == 0) ?
            registers[read_reg2] :
            write_data);
     
endmodule
