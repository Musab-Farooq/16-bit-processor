`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:58:54 12/31/2024 
// Design Name: 
// Module Name:    reg_file 
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
module reg_file(clk,reset,regwrite,address_reg1,address_reg2,address_dest,data_dest,data_reg1,data_reg2);

input clk,reset,regwrite;
input [2:0] address_reg1,address_reg2,address_dest;
input [15:0] data_dest;
output [15:0] data_reg1,data_reg2;

reg [15:0] register [7:0];

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

always @ (posedge clk)
begin
	if (regwrite == 1)
	begin
		register [address_dest] = data_dest;
	end
end

assign data_reg1 = register[address_reg1];
assign data_reg2 = register[address_reg2];

endmodule
