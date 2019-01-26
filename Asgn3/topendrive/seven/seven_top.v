`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   18:35:34 01/23/2019
// Design Name:   s7_bit_adder
// Module Name:   /users/btech/aniketg/topendrive/seven/seven_top.v
// Project Name:  seven
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: s7_bit_adder
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module seven_top;

	// Inputs
	reg PB1;
	reg PB2;
	reg PB3;
	reg PB4;
	reg [3:0] Y;

	// Outputs
	wire [6:0] z;
	wire carry;

	// Instantiate the Unit Under Test (UUT)
	s7_bit_adder uut (
		.PB1(PB1), 
		.PB2(PB2), 
		.PB3(PB3), 
		.PB4(PB4), 
		.Y(Y), 
		.z(z), 
		.carry(carry)
	);

initial begin
		// Initialize Inputs
		Y = 4'b0000;
		

		// Wait 100 ns for global reset to finish
		#4
       Y = 4'b0100;
			#5
			Y = 4'b1110;
			#5
			Y = 4'b0111;
			#5
			Y = 4'b1111;
			#5
		$finish;
		// Add stimulus here

	end
   initial begin
	PB1=0;PB2=0;PB3=0;PB4=0;
	PB1=1;PB2=1;PB3=1;PB4=1;
	forever begin
	PB1=0;PB2=0;PB3=0;PB4=0;
	
	#5
	PB1=1;PB2=1;PB3=1;PB4=1;
	#5
	PB1=0;PB2=0;PB3=0;PB4=0;
	end  
end	
      
endmodule

