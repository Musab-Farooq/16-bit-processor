`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   02:06:55 01/09/2025
// Design Name:   data_path
// Module Name:   C:/Users/Administrator/Documents/Sem 1/ICT/Project_main/Processor/tb_data_path.v
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

module tb_data_path;

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
	reg [7:0] PC;
	reg [15:0] instruct_reg;

	// Outputs
	wire [15:0] out;
	wire jump_signal;

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
		.PC(PC), 
		.instruct_reg(instruct_reg), 
		.out(out), 
		.jump_signal(jump_signal)
	);

	initial begin
	
 /*
		// Initialize Inputs
		clk = 0;
		reset = 0;
		regdest = 1;
		alusrc = 1;
		memtoreg = 0;
		regwrite = 1;
		memread = 0;
		memwrite = 0;
		branch = 0;
		jump = 0;
		PC = 0;
		instruct_reg = 16'b110010_000_000_0110;


		// Wait 100 ns for global reset to finish
		#100;
		clk =1;
		reset = 1;
		#100;
		
		reset = 0;
        #100;
		// Add stimulus here
		regdest = 1;
		alusrc = 1;
		memtoreg = 0;
		regwrite = 1;
		memread = 0;
		memwrite = 0;
		branch = 0;
		jump = 0;
		
		instruct_reg = 16'b010000_000_001_0110;
		clk = 0;
		#100;
		
		clk = 1;
		#100;
		
		regdest = 0;
		alusrc = 1;
		memtoreg = 0;
		regwrite = 0;
		memread = 0;
		memwrite = 1;
		branch = 0;
		jump = 0;
		instruct_reg = 16'b000000_001_000_1000;
		clk = 0;
		#100;
		
		clk = 1;
		#100;
		
		regdest = 0;
		alusrc = 1;
		memtoreg = 1;
		regwrite = 1;
		memread = 1;
		memwrite = 0;
		branch = 0;
		jump = 0;
		instruct_reg = 16'b000000_001_000_0111;
		clk = 0;
		#100;
		
		clk = 1;
		#100;
		
		
		
		clk = 0;
		reset = 0;
		regdest = 1;
		alusrc = 1;
		memtoreg = 0;
		regwrite = 1;
		memread = 0;
		memwrite = 0;
		branch = 0;
		jump = 0;
		PC = 0;
		instruct_reg = 16'b110010_000_000_0110;
		clk = 0;
		#100;
		
		clk = 1;
		#100;
		
		regdest = 1;
		alusrc = 1;
		memtoreg = 0;
		regwrite = 1;
		memread = 0;
		memwrite = 0;
		branch = 0;
		jump = 0;
		
		instruct_reg = 16'b010000_000_001_0110;
		clk = 0;
		#100;
		
		clk = 1;
		#100;
		
		regdest = 0;
		alusrc = 1;
		memtoreg = 0;
		regwrite = 0;
		memread = 0;
		memwrite = 1;
		branch = 0;
		jump = 0;
		instruct_reg = 16'b000000_001_000_1000;
		clk = 0;
		#100;
		
		clk = 1;
		#100;
		
		regdest = 0;
		alusrc = 1;
		memtoreg = 1;
		regwrite = 1;
		memread = 1;
		memwrite = 0;
		branch = 0;
		jump = 0;
		instruct_reg = 16'b000000_001_000_0111;
		clk = 0;
		#100;
		
		clk = 1;
		#100;
 */

///*
		clk = 0;
		reset = 0;
		regdest = 1;
		alusrc = 1;
		memtoreg = 0;
		regwrite = 1;
		memread = 0;
		memwrite = 0;
		branch = 0;
		jump = 0;
		PC = 0;
		instruct_reg = 16'b110010_000_000_0110;

      #100;
		clk =1;
		reset = 1;
		#100;
		clk = 0;
		reset = 0;
      #100;
		
		clk = 1;
		regdest = 1;
		alusrc = 1;
		memtoreg = 0;
		regwrite = 1;
		memread = 0;
		memwrite = 0;
		branch = 0;
		jump = 0;
		
		instruct_reg = 16'b010000_000_001_0110;
		#100;
		
		clk = 0;
		#100;
		
		clk = 1;	
		regdest = 0;
		alusrc = 1;
		memtoreg = 0;
		regwrite = 0;
		memread = 0;
		memwrite = 1;
		branch = 0;
		jump = 0;
		instruct_reg = 16'b000000_001_000_1000;
		#100;
		clk = 0;
		#100;
		
		clk = 1;
		regdest = 0;
		alusrc = 1;
		memtoreg = 1;
		regwrite = 1;
		memread = 1;
		memwrite = 0;
		branch = 0;
		jump = 0;
		instruct_reg = 16'b000000_001_000_0111;
		
		#100;
		clk = 0;
		#100;
		
		clk=1;
		reset = 0;
		regdest = 1;
		alusrc = 1;
		memtoreg = 0;
		regwrite = 1;
		memread = 0;
		memwrite = 0;
		branch = 0;
		jump = 0;
		PC = 0;
		instruct_reg = 16'b111_000000000_1001;
		#100;
		clk = 0;
		#100;
		
		clk = 1;	
		regdest = 1;
		alusrc = 1;
		memtoreg = 0;
		regwrite = 1;
		memread = 0;
		memwrite = 0;
		branch = 0;
		jump = 0;
		
		instruct_reg = 16'b010000_000_001_0110;
		#100;
		clk = 0;
		#100;
		
		clk = 1;
		regdest = 0;
		alusrc = 1;
		memtoreg = 0;
		regwrite = 0;
		memread = 0;
		memwrite = 1;
		branch = 0;
		jump = 0;
		instruct_reg = 16'b000000_001_000_1000;
		#100;
		clk = 0;
		#100;
		
		clk = 1;
		regdest = 0;
		alusrc = 1;
		memtoreg = 1;
		regwrite = 1;
		memread = 1;
		memwrite = 0;
		branch = 0;
		jump = 0;
		instruct_reg = 16'b111111_111_000_0111;
		#100;
		clk = 0;
		#100;
//*/

		
	end
      
endmodule


/*
initial begin
		// Initialize Inputs
		clk = 0;
		reset = 0;
		regdest = 1;
		alusrc = 0;
		memtoreg = 0;
		regwrite = 1;
		memread = 0;
		memwrite = 0;
		branch = 0;
		jump = 0;
		PC = 0;
		instruct_reg = 0;

		// Wait 100 ns for global reset to finish
		#100;
		clk =1;
		reset = 1;
		#100;
		
		reset = 0;
        #100;
		// Add stimulus here
		regdest = 1;
		alusrc = 1;
		memtoreg = 0;
		regwrite = 1;
		memread = 0;
		memwrite = 0;
		branch = 0;
		jump = 0;
		instruct_reg = 16'b000010_000_000_0110;
		clk = 0;
		#100;
		
		clk = 1;
		#100;
		
		regdest = 1;
		alusrc = 1;
		memtoreg = 0;
		regwrite = 1;
		memread = 0;
		memwrite = 0;
		branch = 0;
		jump = 0;
		instruct_reg = 16'b001010_000_001_0110;
		clk = 0;
		#100;
		
		clk = 1;
		#100;
		
		
		regdest = 1;
		alusrc = 0;
		memtoreg = 0;
		regwrite = 1;
		memread = 0;
		memwrite = 0;
		branch = 0;
		jump = 0;
		instruct_reg = 16'b000_000_001_010_1111;
		clk = 0;
		#100;
		
		clk = 1;
		#100;
		
		
		
	end
      
endmodule


*/

