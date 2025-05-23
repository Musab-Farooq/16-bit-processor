`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:46:16 12/31/2024 
// Design Name: 
// Module Name:    Control_Unit 
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
module Control_Unit(clk,reset,regdest,alusrc,memtoreg,regwrite,memread,memwrite,branch,jump,PC,PC_update,jump_signal,out_reg);

input clk,reset,jump_signal;
input [7:0] PC_update;
output reg regdest,alusrc,memtoreg,regwrite,memread,memwrite,branch,jump;
output [7:0] PC;
output [15:0] out_reg;

reg [7:0] PC;
wire [15:0] instruct_reg;
wire [3:0] opcode;

// Calculating PC
always@(posedge clk, posedge reset)
begin
	if (reset == 1)
	begin
		PC <= 0;
	end
	
	else if (jump_signal == 1)
	begin
		PC <= PC_update;
	end
	
	else
	begin
		PC <= PC + 1;
	end
end

instructionMem uut(PC,instruct_reg);

assign opcode = instruct_reg[3:0];

always @ (*)
begin
	// R type
	if ((opcode == 0) || (opcode == 1) || (opcode == 2) || (opcode == 13) || (opcode == 14) || (opcode == 12) || (opcode == 3) || (opcode == 4)|| (opcode == 15))
	begin
		regdest = 1;
		alusrc = 0;
		memtoreg = 0;
		regwrite = 1;
		memread = 0;
		memwrite = 0;
		branch = 0;
		jump = 0;
	end
	
	// li and addi
	else if ((opcode == 5) || (opcode == 6))
	begin
		regdest = 1;
		alusrc = 1;
		memtoreg = 0;
		regwrite = 1;
		memread = 0;
		memwrite = 0;
		branch = 0;
		jump = 0;
	end
	
	// lw
	else if (opcode == 7)
	begin
		regdest = 0;
		alusrc = 1;
		memtoreg = 1;
		regwrite = 1;
		memread = 1;
		memwrite = 0;
		branch = 0;
		jump = 0;
	end
	
	// sw
	else if (opcode == 8)
	begin
		regdest = 0;
		alusrc = 1;
		memtoreg = 0;
		regwrite = 0;
		memread = 0;
		memwrite = 1;
		branch = 0;
		jump = 0;
	end
	
	// beq,beqz
	else if ((opcode == 10) | (opcode == 11))
	begin
		regdest = 0;
		alusrc = 0;
		memtoreg = 0;
		regwrite = 0;
		memread = 0;
		memwrite = 0;
		branch = 1;
		jump = 0;
	end
	
	// Jump
	else if (opcode == 9)
	begin
		regdest = 0;
		alusrc = 0;
		memtoreg = 0;
		regwrite = 0;
		memread = 0;
		memwrite = 0;
		branch = 0;
		jump = 1;
	end
end

assign out_reg = instruct_reg;
endmodule
