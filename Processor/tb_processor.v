`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   19:25:52 01/12/2025
// Design Name:   Processor_main
// Module Name:   C:/Users/Administrator/Documents/Sem 1/ICT/Project_main/Processor/tb_processor.v
// Project Name:  Processor
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Processor_main
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module tb_processor;

	// Inputs
	reg clk;
	reg reset;

	// Outputs
	wire [15:0] out;

	// Instantiate the Unit Under Test (UUT)
	Processor_main uut (
		.clk(clk), 
		.reset(reset), 
		.out(out)
	);

		initial begin
		// Initialize Inputs
		clk = 0;
		reset = 0;

		// Wait 100 ns for global reset to finish
		#20;
        
		// Add stimulus here
		reset = 1;
		clk = 1;
		#20;
		
		reset = 0;
		
	end
	always
	begin
	#20;
	clk = !clk;
	end
      
endmodule




