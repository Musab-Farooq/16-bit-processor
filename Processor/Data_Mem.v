`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:48:35 12/31/2024 
// Design Name: 
// Module Name:    Data_Mem 
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
module Data_Mem(clk,memread,memwrite,address,data_in,data_out);

input clk,memread,memwrite;
input [7:0] address;
input [15:0] data_in;
output reg [15:0] data_out;

reg [15:0] RAM [255:0];

initial
begin
   RAM [0] = 0;
   RAM [1] = 0;
   RAM [2] = 0;
   RAM [3] = 0;
   RAM [4] = 0;
   RAM [5] = 0;
   RAM [6] = 0;
   RAM [7] = 0;
   RAM [8] = 0;
   RAM [9] = 0;
   RAM [10] = 0;
   RAM [11] = 0;
   RAM [12] = 0;
   RAM [13] = 0;
   RAM [14] = 0;
   RAM [15] = 0;
   RAM [16] = 0;
   RAM [17] = 0;
   RAM [18] = 0;
   RAM [19] = 0;
   RAM [20] = 0;
   RAM [21] = 0;
   RAM [22] = 0;
   RAM [23] = 0;
   RAM [24] = 0;
   RAM [25] = 0;
   RAM [26] = 0;
   RAM [27] = 0;
   RAM [28] = 0;
   RAM [29] = 0;
   RAM [30] = 0;
   RAM [31] = 0;
   RAM [32] = 0;
   RAM [33] = 0;
   RAM [34] = 0;
   RAM [35] = 0;
   RAM [36] = 0;
   RAM [37] = 0;
   RAM [38] = 0;
   RAM [39] = 0;
   RAM [40] = 0;
   RAM [41] = 0;
   RAM [42] = 0;
   RAM [43] = 0;
   RAM [44] = 0;
   RAM [45] = 0;
   RAM [46] = 0;
   RAM [47] = 0;
   RAM [48] = 0;
   RAM [49] = 0;
   RAM [50] = 0;
   RAM [51] = 0;
   RAM [52] = 0;
   RAM [53] = 0;
   RAM [54] = 0;
   RAM [55] = 0;
   RAM [56] = 0;
   RAM [57] = 0;
   RAM [58] = 0;
   RAM [59] = 0;
   RAM [60] = 0;
   RAM [61] = 0;
   RAM [62] = 0;
   RAM [63] = 0;
   RAM [64] = 0;
   RAM [65] = 0;
   RAM [66] = 0;
   RAM [67] = 0;
   RAM [68] = 0;
   RAM [69] = 0;
   RAM [70] = 0;
   RAM [71] = 0;
   RAM [72] = 0;
   RAM [73] = 0;
   RAM [74] = 0;
   RAM [75] = 0;
   RAM [76] = 0;
   RAM [77] = 0;
   RAM [78] = 0;
   RAM [79] = 0;
   RAM [80] = 0;
   RAM [81] = 0;
   RAM [82] = 0;
   RAM [83] = 0;
   RAM [84] = 0;
   RAM [85] = 0;
   RAM [86] = 0;
   RAM [87] = 0;
   RAM [88] = 0;
   RAM [89] = 0;
   RAM [90] = 0;
   RAM [91] = 0;
   RAM [92] = 0;
   RAM [93] = 0;
   RAM [94] = 0;
   RAM [95] = 0;
   RAM [96] = 0;
   RAM [97] = 0;
   RAM [98] = 0;
   RAM [99] = 0;
   RAM [100] = 0;
   RAM [101] = 0;
   RAM [102] = 0;
   RAM [103] = 0;
   RAM [104] = 0;
   RAM [105] = 0;
   RAM [106] = 0;
   RAM [107] = 0;
   RAM [108] = 0;
   RAM [109] = 0;
   RAM [110] = 0;
   RAM [111] = 0;
   RAM [112] = 0;
   RAM [113] = 0;
   RAM [114] = 0;
   RAM [115] = 0;
   RAM [116] = 0;
   RAM [117] = 0;
   RAM [118] = 0;
   RAM [119] = 0;
   RAM [120] = 0;
   RAM [121] = 0;
   RAM [122] = 0;
   RAM [123] = 0;
   RAM [124] = 0;
   RAM [125] = 0;
   RAM [126] = 0;
   RAM [127] = 0;
   RAM [128] = 0;
   RAM [129] = 0;
   RAM [130] = 0;
   RAM [131] = 0;
   RAM [132] = 0;
   RAM [133] = 0;
   RAM [134] = 0;
   RAM [135] = 0;
   RAM [136] = 0;
   RAM [137] = 0;
   RAM [138] = 0;
   RAM [139] = 0;
   RAM [140] = 0;
   RAM [141] = 0;
   RAM [142] = 0;
   RAM [143] = 0;
   RAM [144] = 0;
   RAM [145] = 0;
   RAM [146] = 0;
   RAM [147] = 0;
   RAM [148] = 0;
   RAM [149] = 0;
   RAM [150] = 0;
   RAM [151] = 0;
   RAM [152] = 0;
   RAM [153] = 0;
   RAM [154] = 0;
   RAM [155] = 0;
   RAM [156] = 0;
   RAM [157] = 0;
   RAM [158] = 0;
   RAM [159] = 0;
   RAM [160] = 0;
   RAM [161] = 0;
   RAM [162] = 0;
   RAM [163] = 0;
   RAM [164] = 0;
   RAM [165] = 0;
   RAM [166] = 0;
   RAM [167] = 0;
   RAM [168] = 0;
   RAM [169] = 0;
   RAM [170] = 0;
   RAM [171] = 0;
   RAM [172] = 0;
   RAM [173] = 0;
   RAM [174] = 0;
   RAM [175] = 0;
   RAM [176] = 0;
   RAM [177] = 0;
   RAM [178] = 0;
   RAM [179] = 0;
   RAM [180] = 0;
   RAM [181] = 0;
   RAM [182] = 0;
   RAM [183] = 0;
   RAM [184] = 0;
   RAM [185] = 0;
   RAM [186] = 0;
   RAM [187] = 0;
   RAM [188] = 0;
   RAM [189] = 0;
   RAM [190] = 0;
   RAM [191] = 0;
   RAM [192] = 0;
   RAM [193] = 0;
   RAM [194] = 0;
   RAM [195] = 0;
   RAM [196] = 0;
   RAM [197] = 0;
   RAM [198] = 0;
   RAM [199] = 0;
   RAM [200] = 0;
   RAM [201] = 0;
   RAM [202] = 0;
   RAM [203] = 0;
   RAM [204] = 0;
   RAM [205] = 0;
   RAM [206] = 0;
   RAM [207] = 0;
   RAM [208] = 0;
   RAM [209] = 0;
   RAM [210] = 0;
   RAM [211] = 0;
   RAM [212] = 0;
   RAM [213] = 0;
   RAM [214] = 0;
   RAM [215] = 0;
   RAM [216] = 0;
   RAM [217] = 0;
   RAM [218] = 0;
   RAM [219] = 0;
   RAM [220] = 0;
   RAM [221] = 0;
   RAM [222] = 0;
   RAM [223] = 0;
   RAM [224] = 0;
   RAM [225] = 0;
   RAM [226] = 0;
   RAM [227] = 0;
   RAM [228] = 0;
   RAM [229] = 0;
   RAM [230] = 0;
   RAM [231] = 0;
   RAM [232] = 0;
   RAM [233] = 0;
   RAM [234] = 0;
   RAM [235] = 0;
   RAM [236] = 0;
   RAM [237] = 0;
   RAM [238] = 0;
   RAM [239] = 0;
   RAM [240] = 0;
   RAM [241] = 0;
   RAM [242] = 0;
   RAM [243] = 0;
   RAM [244] = 0;
   RAM [245] = 0;
   RAM [246] = 0;
   RAM [247] = 0;
   RAM [248] = 0;
   RAM [249] = 0;
   RAM [250] = 0;
   RAM [251] = 0;
   RAM [252] = 0;
   RAM [253] = 0;
   RAM [254] = 0;
   RAM [255] = 0;
end

always @ (*)
begin
	if (memread == 1)
	begin
		data_out = RAM[address];
	end
	
	else if (memwrite == 1) 
	begin
		RAM[address] = data_in;
		data_out = 0;
	end
end

endmodule
