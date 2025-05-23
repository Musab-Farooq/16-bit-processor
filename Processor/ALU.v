`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:47:44 12/31/2024 
// Design Name: 
// Module Name:    ALU 
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
module ALU(A,B,opcode,out,zero_flag,neg_flag,overflow_flag);

// Declaration 
input [3:0]opcode;
input [15:0] A,B;
output reg[15:0] out;
reg [31:0] sr;
reg [15:0] hi,lo;
output reg overflow_flag,zero_flag,neg_flag;

// Selecting one value from opcode input
always @ (*)
begin
	if ((opcode == 0) || (opcode == 5) || (opcode == 6) || (opcode == 7) || (opcode == 8) || (opcode == 9))
	begin
		sr = A+B;
		out = sr[15:0];
	end
	
	else if (opcode == 1)
	begin
		sr = A<<B;
		out = sr[15:0];
	end
		
	else if (opcode == 2)
	begin
		sr = A>>B;
		out = sr[15:0];
	end
		
	else if (opcode == 3)
	begin
		sr = A|B;
		out = sr[15:0];
	end
		
	else if (opcode == 4)
	begin
		sr = A&B;
		out = sr[15:0];
	end
		
	else if (opcode == 13)
	begin
		sr = A*B;
		lo = sr[15:0];
		hi = sr[31:16];
		out = sr[15:0];
	end
	
	else if (opcode == 14)
	begin
		out = lo;
	end
	
	else if (opcode == 12)
	begin
		out = hi;
	end
	
	else if ( (opcode == 15))
	begin
		sr = A-B;
		out = sr[15:0];
	end
	
	else if ((opcode == 11) ||(opcode == 10))
	begin
		if (A == B)
			out = 0;
	end
end

// Giving signals to flags
always @ (out) 
begin 
	// Max value for 16 bit
	if (sr > 65535)		
	begin
		overflow_flag = 1;
		lo = sr[15:0];
		hi = sr[31:16];
	end
	
	else 
	begin
		overflow_flag = 0;
		lo = sr[15:0];
		hi = sr[31:16];
	end
	
	if (out < 0)
	begin
		neg_flag = 1;
	end
	
	else
	begin
		neg_flag = 0;
	end
	
	if (out == 0)
	begin
		zero_flag = 1;
	end
	
	else 
	begin
		zero_flag = 0;
	end
end

endmodule
