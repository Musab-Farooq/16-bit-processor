`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   00:03:25 01/01/2025
// Design Name:   data_path
// Module Name:   C:/Users/Administrator/Documents/Sem 1/ICT/Project2/Processor/tb_data_path2.v
// Project Name:  Processor
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: data_path
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module tb_data_path2;

	// Inputs
	reg clk;
	reg reset;
	reg regdest;
	reg alusrc;
	reg memtoreg;
	reg regwrite;
	reg memread;
	reg memwrite;
	reg branch;
	reg jump;
	reg [15:0] instruct_reg;

	// Outputs
	wire [15:0] out;

	// Instantiate the Unit Under Test (UUT)
	data_path uut (
		.clk(clk), 
		.reset(reset), 
		.regdest(regdest), 
		.alusrc(alusrc), 
		.memtoreg(memtoreg), 
		.regwrite(regwrite), 
		.memread(memread), 
		.memwrite(memwrite), 
		.branch(branch), 
		.jump(jump), 
		.instruct_reg(instruct_reg), 
		.out(out)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		reset = 1;
		regdest = 1;
		alusrc = 0;
		memtoreg = 0;
		regwrite = 1;
		memread = 1;
		memwrite = 0;
		branch = 0;
		jump = 0;
		instruct_reg = 16'b0000100010000000;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		clk = 1;
		reset = 1;
		#100;
		
		reset = 0;
		#100;
	end
      
endmodule
