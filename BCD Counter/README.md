# Project 1 - Binary Coded Decimal (BCD) Counter

## Description

This project involves implementing a one-digit Binary Coded Decimal (BCD) counter. The counter is a synchronous (4-bit) up/down decade counter with a 4-bit output `Q` that operates as follows:

- **Synchronous Operation**: All state changes occur on the rising edge of the `CLK` input, except for the asynchronous clear (`CLR`).
- **Reset (CLR)**: When `CLR = 0`, the counter resets regardless of the other inputs.
- **Load and Enable**:
  - If `LOAD = ENABLE = 1`, the data input `D` is loaded into the counter.
  - If `LOAD = 0` and `ENABLE = UP = 1`, the counter increments.
  - If `LOAD = 0`, `ENABLE = 1`, and `UP = 0`, the counter decrements.
- **Carry Output (CO)**:
  - `CO = 1` when `ENABLE = 1` and `UP = 1`, and the counter’s value is 9.
  - `CO = 1` when `ENABLE = 1` and `UP = 0`, and the counter’s value is 0.
 
A block diagram of the BCD counter:

<p align="center">
  <img width="400" alt="BCD Counter Block Diagram" src="https://github.com/user-attachments/assets/5dca78af-e9dd-47df-a976-17c96e494570">
</p>
<p align="center">
  "BCD Counter Block Diagram"
</p>

## Deliverables

The task was to write a Verilog description of the BCD counter. For this project, I went with a behavioral description because it is straightforward and easy to understand.

### Simulation

For the simulation, I followed these steps:

1. Load the counter with the last digit of my Red ID number.
2. Increment the counter four times.
3. Decrement the counter once.
4. Clear the counter.

## Results

<p align="center">
  <img width="1100" alt="BCD Counter Simulation Results" src="https://github.com/user-attachments/assets/a1852ba7-ff55-426b-8a7e-a1c40ff863cc">
</p>
<p align="center">
  "BCD Counter Simulation Results"
</p>

## Files

- `BCD_Counter.v`: The Verilog description of the BCD counter.
- `BCD_Counter_tb.v`: The testbench used to simulate the counter.
