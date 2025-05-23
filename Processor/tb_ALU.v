`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   21:56:33 01/03/2025
// Design Name:   ALU
// Module Name:   C:/Users/Administrator/Documents/Sem 1/ICT/Project_main/Processor/tb_ALU.v
// Project Name:  Processor
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: ALU
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module tb_ALU;

	// Inputs
	reg [15:0] A;
	reg [15:0] B;
	reg [3:0] opcode;

	// Outputs
	wire [15:0] out;
	wire zero_flag;
	wire neg_flag;
	wire overflow_flag;

	// Instantiate the Unit Under Test (UUT)
	ALU uut (
		.A(A), 
		.B(B), 
		.opcode(opcode), 
		.out(out), 
		.zero_flag(zero_flag), 
		.neg_flag(neg_flag), 
		.overflow_flag(overflow_flag)
	);

	initial begin
		// Initialize Inputs
		A = 7;
		B = 5;
		opcode = 15;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
      
endmodule

