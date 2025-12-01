# Combinational Circuits Verilog Repository

Welcome to the **Combinational Circuits Verilog Repository**! This repository contains a comprehensive set of Verilog modules for fundamental combinational digital circuits. Whether you're a beginner learning digital design or a professional building larger systems, these modules serve as both learning tools and practical components for your projects.

Each module includes:
- **Theoretical Context**: A brief description of the circuit’s purpose and functionality.
- **Testbenches**: Corresponding Verilog testbenches to help you verify the correctness of the circuits via simulation.

The designs range from basic building blocks to more complex components widely used in modern digital systems.

---

## 📋 **Contents and Circuit Descriptions**

### 1. **Basic Combinational Logic**
- **Half Adder**  
  Adds two 1-bit inputs to produce a sum and carry; fundamental for binary addition.
  
- **Full Adder**  
  Extends the half adder with a carry-in, producing a sum and carry-out; scalable to multi-bit adders.

- **Comparator (1-bit to N-bit, parameterized)**  
  Compares two binary numbers and outputs equality and magnitude relations.

### 2. **Code Converters**
- **Binary to Gray & Gray to Binary**  
  Converts between binary and Gray codes, reducing bit transitions in sequential counts—useful in position encoders.

### 3. **Multiplexers and Demultiplexers**
- **All Types of Demux**  
  Routes input signals to one of multiple outputs based on select lines. Includes parameterized versions for flexibility.

- **Priority Encoder**  
  Outputs the binary representation of the highest-priority active input.

### 4. **Arithmetic Units**
- **Full Subtractor Variants**  
  Implements bitwise subtraction with borrow management, and is parameterized for scalable widths.

- **ALU (Arithmetic Logic Unit)**  
  Performs six arithmetic operations (Add, Subtract, Multiply, Divide, Power, Modulo), selectable via opcode, with comprehensive testing support.

### 5. **Decoders**
- **3-to-8 Decoder**  
  Converts 3-bit input into one of 8 active outputs. A key component for address decoding and instruction interpretation.

### 6. **Utility Files**
- **run1.do**  
  ModelSim automation script for compiling and simulating all modules in one go, making it easier to use.

---

## 🚀 **How to Use**

1. **Import the .v files** into a ModelSim or any compatible simulation environment.
   
2. **Run the `run1.do` script** to compile and simulate all modules with a single command.

3. Each module comes with its own **testbench**, verifying all input combinations and edge cases for robust functional testing.

4. **Modify parameters** for customizable configurations (e.g., bit-width in comparators or ALUs).

---

## 🧠 **Circuit Theory Recap**

- **Adders/Subtractors**: Perform binary addition and subtraction using logic gates that output sum/difference and carry/borrow bits.
  
- **Code Converters**: Ensure only one bit changes at a time (Gray code), which reduces errors in digital transitions.

- **Comparators**: Enable decision-making logic by evaluating equality and order of binary inputs.

- **Multiplexers/Demultiplexers**: Efficiently route data signals within digital circuits.

- **ALU**: A central unit for performing arithmetic operations controlled by operation codes.

- **Decoders**: Decode input codes to activate a single output line, essential for memory addressing and instruction decoding.

---

## 🎯 **Purpose of This Repository**

This repository is designed to:
- Serve as a **learning aid** for those new to Verilog or digital circuit design.
- Provide **practical reference** for seasoned engineers working on larger digital systems or FPGA/ASIC designs.

The modules are:
- **Modular and scalable**
- **Tested** to ensure correctness
- Ready for **integration** into your digital system projects.

---

## 🤝 **Contributing**

Have a suggestion or found a bug? Feel free to open an issue or submit a pull request. We encourage contributions from the community to make this repository even better!

---

Happy coding and learning! 🚀
