`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:45:04 12/31/2024 
// Design Name: 
// Module Name:    Processor_main 
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

/*
		ICT Final Project
		16 bit Processor
		
		CE-46-A
		Musab Farooq (528553)
		Maryam Sarfraz (512217)
*/


module Processor_main(clk,reset,out);

input clk,reset;
output [15:0] out;

wire regdest,alusrc,memtoreg,regwrite,memread,memwrite,branch,jump;
wire [15:0] out_reg;
wire [7:0] PC;
wire [7:0] PC_update;
wire jump_signal;

Control_Unit uut1(clk,reset,regdest,alusrc,memtoreg,regwrite,memread,memwrite,branch,jump,PC,PC_update,jump_signal,out_reg);

data_path uut2(clk,reset,regdest,alusrc,memtoreg,regwrite,memread,memwrite,branch,jump,PC,out_reg,out,jump_signal);

assign PC_update = out[7:0];
endmodule
