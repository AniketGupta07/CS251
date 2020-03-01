`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date:    15:22:14 03/11/2019
// Design Name:
// Module Name:    interface
// Project Name:
// Target Devices:
// Tool versions:
// Description:
//
// Dependencies:
//
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
//
//////////////////////////////////////////////////////////////////////////////////
module interface(clk, RP1, RP2, WP1, WD, bit_1, bit_2, bit_3, RD11, RD21);
    input clk;
    input [4:0] RP1;
    input [4:0] RP2;
    input [4:0] WP1;
    input [15:0] WD;
    input bit_1, bit_2, bit_3;
     
    output [15:0] RD11;
    output [15:0] RD21;
    reg [15:0] RD1;
    reg [15:0] RD2;
   
    wire [15:0] RD11;
    wire [15:0] RD21;
     
    reg [15:0] register_file [0:31];
     
    initial begin
        register_file[0] <= 16'b0;
        register_file[1] <= 16'b0;
        register_file[2] <= 16'b0;
        register_file[3] <= 16'b0;
        register_file[4] <= 16'b0;
        register_file[5] <= 16'b0;
        register_file[6] <= 16'b0;
        register_file[7] <= 16'b0;
        register_file[8] <= 16'b0;
        register_file[9] <= 16'b0;
        register_file[10] <= 16'b0;
        register_file[11] <= 16'b0;
        register_file[12] <= 16'b0;
        register_file[13] <= 16'b0;
        register_file[14] <= 16'b0;
        register_file[15] <= 16'b0;
        register_file[16] <= 16'b0;
        register_file[17] <= 16'b0;
        register_file[18] <= 16'b0;
        register_file[19] <= 16'b0;
        register_file[20] <= 16'b0;
        register_file[21] <= 16'b0;
        register_file[22] <= 16'b0;
        register_file[23] <= 16'b0;
        register_file[24] <= 16'b0;
        register_file[25] <= 16'b0;
        register_file[26] <= 16'b0;
        register_file[27] <= 16'b0;
        register_file[28] <= 16'b0;
        register_file[29] <= 16'b0;
        register_file[30] <= 16'b0;
        register_file[31] <= 16'b0;
        RD1 <= 16'b0;
        RD2 <= 16'b0;
    end
     
    assign RD11 = RD1;
    assign RD21 = RD2;
   
    always @(posedge clk) begin
        if(bit_1 == 1)
            RD1 <= register_file[RP1];
         
        if(bit_2 == 1)
            RD2 <= register_file[RP2];
           
        if(bit_3 == 1)
            register_file[WP1] <= WD;
    end
     
endmodule
