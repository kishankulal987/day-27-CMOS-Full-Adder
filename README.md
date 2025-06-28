# CMOS Full Adder in Verilog

## Overview

In this project, I implemented a full adder in Verilog using CMOS NAND gates to demonstrate transistor-level design. My goal was to create a circuit that computes the sum and carry-out for three input bits (`a`, `b`, `cin`), where:

- `sum = a XOR b XOR cin`
- `carry = ab + c(a XOR b)`

For example, with inputs `a=1`, `b=1`, `cin=0`, the output is `sum=0`, `carry=1` (1 + 1 + 0 = 2 in binary). I designed a `cmosnand` module to model a CMOS NAND gate using PMOS and NMOS transistors, then used it to build the full adder. I wrote a testbench to verify the functionality by testing all possible input combinations and confirmed the design works as expected through simulation.

---

## Module: `cmosnand`

### What I Did

I designed a CMOS NAND gate using transistor-level modeling.

### Inputs

- `x`: First input  
- `y`: Second input  

### Output

- `f`: NAND output (`f = ~(x & y)`)

### How It Works

- Two PMOS transistors (`p1`, `p2`) in **parallel** connect `f` to `vdd` (`supply1`) when `x=0` or `y=0`.
- Two NMOS transistors (`n1`, `n2`) in **series** connect `f` to `gnd` (`supply0`) via intermediate wire `a` when `x=1` and `y=1`.
- This configuration implements `f = ~(x & y)` as per CMOS NAND gate topology.

### Style

Transistor-level (switch-level) modeling using PMOS and NMOS primitives.

---

## Module: `fulladder_cmos`

### What I Did

I designed a full adder using CMOS NAND gates to compute the `sum` and `carry-out`.

### Inputs

- `a`: First input bit  
- `b`: Second input bit  
- `cin`: Carry-in bit  

### Outputs

- `sum`: `a XOR b XOR cin`  
- `cout`: `ab + c(a XOR b)`

### How It Works

#### XOR Logic for Sum

- NAND gates `n1` to `n4` compute `t4 = a XOR b`:  
  - `t1 = ~(a & b)`  
  - `t2 = ~(t1 & a)`  
  - `t3 = ~(t1 & b)`  
  - `t4 = ~(t2 & t3)`  

- NAND gates `n5` to `n8` compute `sum = t4 XOR cin`:  
  - `t5 = ~(t4 & cin)`  
  - `t6 = ~(t5 & t4)`  
  - `t7 = ~(t5 & cin)`  
  - `sum = ~(t6 & t7)`  

#### Carry Logic

- `cout = ab + cin(a XOR b)`  
- Implemented as `cout = ~(t1 & t5)`, where `t1 = ~(a & b)` and `t5 = ~(t4 & cin)`

### Style

Structural modeling using `cmosnand` module instantiations.

---

## Testbench: `fulladder_cmos_tb`

### What I Did

I created a testbench to verify the CMOS full adder’s functionality.

### How It Works

- Defined inputs `a`, `b`, `cin` and outputs `sum`, `cout`
- Used a `for` loop to iterate through all 8 possible input combinations `{a, b, cin} = 000 to 111`
- Each test case runs for 10 ns
- Simulation ends with `$finish`

### Time Scale

Set to `1ns / 1ps` for precise simulation timing.

### Purpose

To ensure the full adder correctly computes `sum` and `carry-out` for all input combinations.

---

## Files

- `cmosnand.v`: Verilog module for the CMOS NAND gate  
- `fulladder_cmos.v`: Verilog module for the CMOS full adder  
- `fulladder_cmos_tb.v`: Testbench for simulation

---

## Circuit Diagram

Below is the circuit diagram for the CMOS full adder.  
![CMOS Full Adder Circuit Diagram]  
*I will add my diagram here (e.g., a hand-drawn or tool-generated image from Vivado, Logisim, or similar, showing the transistor-level NAND gates and their connections to form the XOR and carry logic).*

---

## Simulation Waveform

Below is the simulation waveform showing inputs `a`, `b`, `cin` and outputs `sum`, `cout` over time.  

![Screenshot 2025-06-28 182525](https://github.com/user-attachments/assets/ad2cac29-5cb1-4627-bf91-0e179d6c182a)


---

## Console Output

Below is the console output from my testbench simulation.  

![Uploading Screenshot 2025-06-28 182509.png…]()
