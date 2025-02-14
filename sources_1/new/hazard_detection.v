`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/14/2025 10:47:35 AM
// Design Name: 
// Module Name: hazard_detection
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

module hazard_detection(input [4:0] rd,
                        input [4:0] rs1,
                        input [4:0] rs2,
                        input MemRead,
                        output reg PCwrite,
                        output reg IF_IDwrite,
                        output reg set_control_zero);

// hazard se citeste dintr-o memorie in care se scrie                 
always@(*) begin
    if(MemRead && ((rd == rs1) || (rd == rs2))) begin
        PCwrite <= 1'b0;
        IF_IDwrite <= 1'b0;
        set_control_zero <= 1'b1;
    end else begin
        PCwrite <= 1'b1;
        IF_IDwrite <= 1'b1;
        set_control_zero <= 1'b0;
    end
end

endmodule

