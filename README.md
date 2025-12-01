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

### **1. Adders/Subtractors**
Adders and subtractors are the fundamental building blocks for arithmetic operations in digital circuits.

- **Half Adder**:  
  A Half Adder adds two single-bit binary numbers and outputs two results:
  - **Sum**: The least significant bit (LSB) of the result.
  - **Carry**: The most significant bit (MSB) of the result, representing any overflow beyond the sum bit-width.
  
  Logic:
  - **Sum** = A ⊕ B (XOR)
  - **Carry** = A ∧ B (AND)

  This is the simplest form of binary addition, but it doesn't handle carry-in from previous stages.

- **Full Adder**:  
  A Full Adder extends the Half Adder by including a third input: **Carry-In**. It has three inputs (A, B, and Carry-In) and produces two outputs:
  - **Sum**: The LSB of the result.
  - **Carry-Out**: The MSB of the result, which may be passed to the next adder in a multi-bit addition.

  Logic:
  - **Sum** = A ⊕ B ⊕ Carry-In
  - **Carry-Out** = (A ∧ B) ∨ (Carry-In ∧ (A ⊕ B))

  Full adders are the building blocks for multi-bit adders like 4-bit or 8-bit adders, often arranged in **ripple carry adders**.

- **Subtractor**:  
  A subtractor performs binary subtraction, and there are two main types:
  
  - **Half Subtractor**: This takes two inputs, A and B, and produces a **difference** and a **borrow**.
    - **Difference** = A ⊕ B
    - **Borrow** = (¬A) ∧ B

  - **Full Subtractor**: This is similar to the full adder but with an additional **Borrow-In** input. The outputs are **Difference** and **Borrow-Out**.
    - **Difference** = A ⊕ B ⊕ Borrow-In
    - **Borrow-Out** = (¬A ∧ B) ∨ (¬A ∧ Borrow-In) ∨ (B ∧ Borrow-In)

### **2. Code Converters**
- **Binary to Gray Code Converter**:  
  Gray code is a binary numeral system where two successive values differ in only one bit, reducing the possibility of errors during state transitions, especially in hardware like rotary encoders.

  To convert from binary to Gray:
  - **Gray(0) = Binary(0)**
  - **Gray(n) = Binary(n) ⊕ Binary(n-1)** for all bits (except the most significant one).

  Gray code is particularly useful in **position encoders** where minimizing errors during bit transitions is crucial.

- **Gray Code to Binary Converter**:  
  To convert Gray code back to binary, you use the following iterative process:
  - **Binary(0) = Gray(0)**
  - **Binary(n) = Binary(n-1) ⊕ Gray(n)** for all bits.

  Gray code is used in many practical applications, such as **error correction** in communication systems and **motion sensors**.

### **3. Multiplexers and Demultiplexers**
- **Multiplexer (MUX)**:  
  A multiplexer is a combinational circuit that selects one of many input signals and forwards the selected input to a single output line. The selection is determined by a set of **select lines**.
  
  A 2-to-1 multiplexer is represented by the following logic:
  - **Output** = (S̅ ∧ A) ∨ (S ∧ B), where S is the select line and A, B are input lines.

  **Applications**: Multiplexers are used in **data routing**, **signal processing**, and **CPU data selection**.

- **Demultiplexer (DEMUX)**:  
  A demultiplexer takes a single input and routes it to one of many output lines based on the select line. Essentially, it's the inverse of a multiplexer.
  
  A 1-to-2 demultiplexer is represented by the logic:
  - **Output 0** = S̅ ∧ Input
  - **Output 1** = S ∧ Input

  **Applications**: Demultiplexers are used in **data distribution systems** like routers, or in **memory address decoding**.

- **Priority Encoder**:  
  A priority encoder is a combinational circuit that converts multiple input lines into a binary code representing the index of the highest-priority active input. The encoder gives precedence to the highest input with a 1.

  For a 4-to-2 priority encoder:
  - If input lines I3, I2, I1, and I0 are the inputs, the output will represent the highest priority active input.
  
  **Applications**: Used in **interrupt controllers** or **priority decision-making systems**.

### **4. Arithmetic Logic Unit (ALU)**
An ALU is the heart of many digital computers, capable of performing a wide range of arithmetic and logical operations. A typical ALU supports several operations, controlled by **opcode inputs**.

Operations in a simple ALU might include:
- **Addition** (A + B)
- **Subtraction** (A - B)
- **Multiplication** (A × B)
- **Division** (A ÷ B)
- **Modulo** (A % B)
- **Logical AND, OR, NOT, XOR**

The ALU uses a set of multiplexers and logic gates to choose which operation to perform based on the opcode input. The **control unit** selects the operation by changing the opcode sent to the ALU.

**Applications**: Used in **processors** for executing instructions, **FPGA** and **ASIC** design for custom computation units, etc.

### **5. Decoders**
- **3-to-8 Decoder**:  
  A decoder takes an n-bit binary input and activates one of 2^n outputs. For example, a **3-to-8 decoder** takes a 3-bit input and activates one of 8 outputs corresponding to the binary value of the input.

  The **truth table** of a 3-to-8 decoder would have:
  - 000 → Output 0
  - 001 → Output 1
  - 010 → Output 2
  - 011 → Output 3
  - etc.

  **Applications**: Decoders are often used in **memory addressing** (e.g., RAM addressing) and **instruction decoding** in processors.

### **6. Utility Files**
- **run1.do**:  
  This script automates the process of compiling and simulating all Verilog files in the repository using ModelSim. By running this file, users can simulate the entire set of modules with one simple command, reducing setup time.

---

### **Conclusion**
Each of these circuits plays a critical role in digital systems, from basic arithmetic to complex data routing. Understanding their theory and practical applications forms the backbone of designing efficient and reliable digital systems, whether for FPGAs, ASICs, or software simulations.

These building blocks are widely used in **microprocessors**, **digital controllers**, **communication systems**, **embedded systems**, and many other applications, making them essential knowledge for anyone pursuing digital design, hardware development, or FPGA programming.

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
