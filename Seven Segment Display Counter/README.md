# Project 3 - Seven Segment Display Counter

## Description

This project implements a counter that displays hexadecimal numbers from F to 0 on a seven-segment display, using Verilog HDL and the Cora Z7 FPGA development board. The counter cycles continuously, starting over from F after reaching 0.

### Key Features

- Counts down from hexadecimal F to 0
- Displays the count on a seven-segment display
- Configurable counting period
- Implemented using Verilog HDL
- Designed for the Cora Z7 FPGA board

### Hardware Requirements

- Cora Z7 FPGA Development Board
- External seven-segment display (Common Anode or Common Cathode)
- Breadboard
- Jumper wires
- Resistors (typically 220Ω - 330Ω) for current limiting

## Deliverables

The task was to write  a Verilog description of the seven-segment display counter, then show a demo of the seven-segment display counter that counts from F to 0, and then start from F again with a period of 1 second.

### Implementation Details
- Cora Z7 Board
- Uses external switches and a 7-segment display
- Requires breadboard setup
- IO connections made through appropriate GPIO pins
- Requires additional physical constraint file for pin assignments

## Files

- `Seven_Segment_Display_Counter.v`: The Verilog description of the Seven Segment Display_Counter.
- `CoraZ7.xdc`: The Physical constraint file for pin assignments.
