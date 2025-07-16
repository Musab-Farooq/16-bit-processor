# 🧠 16-bit Custom Verilog Processor

This project implements a simple yet powerful **16-bit custom processor** using **Verilog HDL** based on a **Harvard architecture**. The processor supports a range of arithmetic, logic, memory, and control flow instructions. It is designed for educational purposes to demonstrate the functioning of a basic instruction-executing CPU.

---

## 🏗️ Architecture Overview

- **Architecture**: Harvard (Separate instruction and data memory)
- **Instruction Width**: 16-bit
- **Registers**: 8 general-purpose registers (`$t0` to `$t7`)
- **Memory**:
  - Instruction Memory: 256×16-bit ROM (`instructionMem`)
  - Data Memory: 256×16-bit RAM (`Data_Mem`)
- **Top-Level Module**: `Processor_main`
- **Data Path**: Controlled by the `data_path` module
- **Control Unit**: Generates control signals (`Control_Unit`)
- **ALU**: Arithmetic and logic operations
- **Custom Instruction Set**: Includes R-type, I-type, and J-type instructions

---

## 🧾 Instruction Formats

### ➤ R-Type (Register-based)
- Example: `add $t2, $t0, $t1` → `000_001_000_010_0000`

### ➤ I-Type (Immediate/Branch/Load/Store)
- Example: `li $t0, 9` → `001001_000_000_0110`

### ➤ J-Type (Jump)
- Example: `j loop` → `000_000010001_1001`

---

## ✅ Supported Instructions

| Mnemonic | Type | Description                   |
|----------|------|-------------------------------|
| `add`    | R    | Addition                      |
| `sub`    | R    | Subtraction                   |
| `mul`    | R    | Multiplication                |
| `and`    | R    | Bitwise AND                   |
| `or`     | R    | Bitwise OR                    |
| `sll`    | R    | Shift Left Logical            |
| `srl`    | R    | Shift Right Logical           |
| `li`     | I    | Load Immediate                |
| `addi`   | I    | Add Immediate                 |
| `lw`     | I    | Load Word from memory         |
| `sw`     | I    | Store Word to memory          |
| `beq`    | I    | Branch if registers equal     |
| `beqz`   | I    | Branch if register equals 0   |
| `j`      | J    | Jump to address               |

---

## 💾 Components and Modules

| Module             | Function                                             |
|--------------------|------------------------------------------------------|
| `Processor_main`   | Top-level processor that wires all components        |
| `data_path`        | Connects ALU, registers, data memory, and controls   |
| `ALU`              | Arithmetic and logic execution unit (external)       |
| `Data_Mem`         | 256x16-bit RAM for `lw` and `sw` instructions        |
| `instructionMem`   | 256x16-bit ROM storing the instruction program       |
| `Control_Unit`     | Instruction decoding and control signal generation   |

---

## 🧪 Sample Instruction Sequence

The `instructionMem` module is preloaded with a program that demonstrates:

- Register-to-register arithmetic (`add`, `sub`, `mul`, etc.)
- Immediate loading with `li`, `addi`
- Store and load from memory using `sw` and `lw`
- Looping using `beq`, `beqz`, and `j`
- Factorial-like logic using nested loops

### Example:

```verilog

	ROM [0]  = 16'b001001_000_000_0110;		// li $t0,9					// 9
  ROM [1]  = 16'b000010_000_001_0110;		// li $t1,2					// 2
  ROM [2]  = 16'b000_001_000_010_0000;	// add $t2,$t0,$t1		// 11
	ROM [3] = 16'b001010_000_010_0101;		// addi $t2,$t0,10   	// 19
  ROM [4]  = 16'b010_000_000_010_0001;	// sll $t2,$t0,$t1		// 36
  ROM [5]  = 16'b010_000_000_010_0010;	// srl $t2,$t0,$t1		// 2
  ROM [6]  = 16'b000_001_000_010_1101;	// mul $t2,$t0,$t1		// 18
  ROM [7]  = 16'b000_001_000_010_0011;	// or $t2,$t0,$t1			// 11
  ROM [8]  = 16'b000_001_000_010_0100;	// and $t2,$t0,$t1		// 0
	ROM [9]  = 16'b110010_000_011_0110;		// li $t3,50				// 50
  ROM [10]  = 16'b000_011_011_100_1101;	// mul $t4,$t3,$t3		// 2500
  ROM [11] = 16'b000_100_011_101_1101;	// mul $t5,$t4,$t3		// 59464
  ROM [12] = 16'b000000_000_010_1100;		// mflo $t2					// 1
  ROM [13] = 16'b000000_000_010_1110;		// mfhi $t2					// 59464
  ROM [14] = 16'b001001_000_000_0110;		// li $t0,9
	ROM [15] = 16'b001010_000_010_0110;		// li $t2,10
	ROM [16] = 16'b000000_000_001_0110;		// li $t1,0
  // loop:
	ROM [17] = 16'b000001_001_001_0101; 	// addi $t1,$t1,1
	ROM [18] = 16'b000_001_000_011_1101;	// mul $t3,$t0,$t1
	ROM [19] = 16'b000000_001_011_1000;		// sw $t3,0($t1)
	ROM [20] = 16'b011000_010_001_1011;		// beq $t1,$t2,exit
  ROM [21] = 16'b000_000010001_1001;		// j loop
	ROM [22] = 16'b001001_000_000_0110;
	ROM [23] = 16'b001001_000_000_0110;
  ROM [24] = 16'b001001_000_000_0110;
  // exit:
	ROM [25] = 16'b000001_000_000_0110;		// li $t0,1
	ROM [26] = 16'b001010_000_010_0110;		// li $t2,10
  // loop2:
	ROM [27] = 16'b000000_010_001_0111;		// lw $t1,0($t2)
	ROM [28] = 16'b100001_000_010_1011;		// beq $t2,$t0,exit2
	ROM [29] = 16'b000_000_010_010_1111;	// sub $t2,$t2,$t0
	ROM [30] = 16'b000_000011011_1001;		// j loop2
  ROM [31] = 16'b001001_000_000_0110;		
	ROM [32] = 16'b001001_000_000_0110;	
  // exit2:
  // rest all li $t0,9
	ROM [33] = 16'b001001_000_000_0110;
```
🛠️ How to Run the Simulation
🔧 Requirements
Any Verilog simulator (e.g., Icarus Verilog, ModelSim, Vivado)

🏃‍♂️ Steps
Place all .v files in one folder:
Processor_main.v
data_path.v
instructionMem.v
ALU.v
Data_Mem.v
Control_Unit.v

Run the simulation (example with Icarus Verilog):
iverilog -o cpu_sim Processor_main.v data_path.v instructionMem.v ALU.v Data_Mem.v Control_Unit.v
vvp cpu_sim

Observe outputs (from testbench or waveform viewer).

📋 Future Enhancements
✅ Add mflo, mfhi register handling for multi-cycle multiplication

✅ Support custom flags (zero, negative, overflow)

🚧 Add pipelining support (hazard detection, forwarding)

🚧 Include automated testbench.v for simulation

🚧 Use a proper PC incrementer module to make it fully clock-driven

📂 File Structure
├── Processor_main.v       # Top-level processor
├── data_path.v            # Core datapath for instruction execution
├── instructionMem.v       # Preloaded instruction ROM
├── Control_Unit.v         # Decodes instructions into control signals
├── ALU.v                  # Arithmetic Logic Unit (external)
├── Data_Mem.v             # Data Memory for lw/sw instructions
└── README.md              # Documentation

