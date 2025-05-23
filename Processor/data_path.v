`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:49:09 12/31/2024 
// Design Name: 
// Module Name:    data_path 
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

module data_path(clk,reset,regdest,alusrc,memtoreg,regwrite,memread,memwrite,branch,jump,PC,instruct_reg,out,jump_signal);

// Inputs and Output declaration 
input clk,reset;
input regdest,alusrc,memtoreg,regwrite,memread,memwrite,branch,jump;
input [7:0] PC;
input [15:0] instruct_reg;
output reg [15:0] out;
output reg jump_signal;

// Registers and Wire declaration 
wire [2:0] address_reg1,address_reg2,address_dest;
reg [15:0] alu_in1,alu_in2;
wire [15:0] alu_out, data_out;
reg [15:0] register [7:0];
wire neg_flag,zero_flag,overflow_flag;
reg [15:0] data_mem_data_in;

// Giving resgisters address
assign address_reg1 = instruct_reg[9:7];
assign address_reg2 = instruct_reg[12:10];
assign address_dest = instruct_reg[6:4];

// Initializing registers
initial
begin
	register [0] = 0;
	register [1] = 0;
	register [2] = 0;
	register [3] = 0;
	register [4] = 0;
	register [5] = 0;
	register [6] = 0;
	register [7] = 0;
end

// deciding inputs for ALU 
always @ (*) 
begin
	 // Calculating for R type
	 if ((regdest == 1) && (regwrite == 1))
	 begin
		alu_in1 = register[address_reg1];
		alu_in2 = register[address_reg2];
		jump_signal = 0;
	 end
	 
	 // Calculating for Jump
	 if (jump == 1)
	 begin
		alu_in1 = 0;													//{8'b0000000000000, PC};
		alu_in2 = {7'b0000000000000,instruct_reg[12:4]};
		jump_signal = 1;
	 end
	 
	 // Calculating for Shampt 
    if ((instruct_reg[3:0] == 1) || (instruct_reg[3:0] == 2)) 
	 begin
        alu_in2 = {13'b0000000000000, instruct_reg[15:13]};
    end 
	 
	 // Calculating for addi,lw,sw
	 else if (alusrc == 1) 
	 begin
		  data_mem_data_in = register[address_dest];
		  alu_in1 = register[address_reg1];
        alu_in2 = {10'b0000000000, instruct_reg[15:10]};
		  jump_signal = 0;
    end
	 
	 // Calculating for beq
	 if ((branch == 1) && (instruct_reg[3:0] == 11))
	 begin
		alu_in1 = register[address_dest];
		alu_in2 = register[address_reg1];
	 end
	 
	 // Calculating for beqz
	 else if ((branch == 1) && (instruct_reg[3:0] == 10))
	 begin
		alu_in1 = register[address_dest];
		alu_in2 = 16'b1111111111111111;
	 end
	 
	 // Calculating for li
	 if (instruct_reg[3:0] == 6)
		alu_in1 = 0;
end

// Taking outputs from ALU
ALU uut2 (alu_in1, alu_in2,instruct_reg[3:0],alu_out,zero_flag,neg_flag,overflow_flag);

// Taking outputs from RAM 
Data_Mem uut1 (clk,memread,memwrite,alu_out,data_mem_data_in,data_out);

// Writing registers
always @ (posedge clk)
begin
	if (memread == 1) 
	begin
		register[address_dest] = data_out;
	end
	
	else if (regwrite == 1) 
	begin
		register[address_dest] = alu_out;
	end
end

// Assiging final output 
always @ (*)
begin
	// For lw and sw instruction
	if((instruct_reg[3:0] == 8) || (instruct_reg[3:0] == 7))
	begin
		out = data_out;
	end
	
	// For Branch instruction
	else if ((branch ==1) && (zero_flag == 1))
	begin
		out = {10'b0000000000, instruct_reg[15:10]};
		jump_signal = 1;
	end
	
	// For Rest instruction
	else
	begin
		out = alu_out;
	end
end
 
endmodule

