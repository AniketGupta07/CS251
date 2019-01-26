`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:33:42 01/23/2019 
// Design Name: 
// Module Name:    seven 
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
module s7_bit_adder(PB1,PB2,PB3,PB4,Y,z,carry
    );
	 input PB1,PB2,PB3,PB4;
input [3:0] Y;
output [6:0] z;
wire [6:0]z;
output carry;
wire carry;
reg [6:0] A;
reg [6:0] B;
always @(posedge PB1) begin
A[3:0]<=Y;
end
always @(posedge PB3) begin
B[3:0]<=Y;
end
always @(posedge PB2) begin
A[6:4]<=Y[2:0];
end
always @(posedge PB4) begin
B[6:4]<=Y[2:0];
end
wire carry0,carry1,carry2,carry3,carry4,carry5;
full_adder FA0 (A[0], B[0], 1'b0, z[0], carry0);
full_adder FA1 (A[1], B[1], carry0, z[1], carry1);
full_adder FA2 (A[2], B[2], carry1, z[2], carry2);
full_adder FA3 (A[3], B[3], carry2, z[3], carry3);
full_adder FA4 (A[4], B[4], carry3, z[4], carry4);
full_adder FA5 (A[5], B[5], carry4, z[5], carry5);
full_adder FA6 (A[6], B[6], carry5, z[6], carry);

endmodule
