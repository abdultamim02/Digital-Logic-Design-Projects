# Project 2 - BCD to 7-Segment Decoder

## Description

The BCD to 7-segment decoder is a combinational logic circuit designed to convert BCD inputs into control signals for a 7-segment display. This project is implemented on the Cora Z7 FPGA board.

### Key Features:
- Verilog HDL implementation
- Designed for the Cora Z7 FPGA board
- Input via switches
- Output displayed on a 7-segment display

### Hardware Requirements

- Cora Z7 FPGA Development Board
- External switches
- External 7-segment display
- Breadboard
- Resistors (100Ω – 1KΩ) for LED protection

## Deliverables

The task was to write a Verilog description of the BCD to 7-segment decoder and then demonstrate the display of different decimal values on the 7-segment decoder for various decoder inputs.

### Implementation Details
- Cora Z7 Board
  - Uses external switches and 7-segment display
  - Requires breadboard setup
  - IO connections made through appropriate GPIO pins
  - Requires additional physical constraint file for pin assignments

## Results

<p align="center">
  <code>assign {ck_io30, ck_io29, ck_io26, ck_io27, ck_io28, ck_io31, ck_io32} = 7'b1111110;    // Number 0</code>
</p>

<p align="center">
  <code>assign {ck_io30, ck_io29, ck_io26, ck_io27, ck_io28, ck_io31, ck_io32} = 7'b0110000;    // Number 1</code>
</p>

<p align="center">
  <code>assign {ck_io30, ck_io29, ck_io26, ck_io27, ck_io28, ck_io31, ck_io32} = 7'b1101101;    // Number 2</code>
</p>

<p align="center">
  <code>assign {ck_io30, ck_io29, ck_io26, ck_io27, ck_io28, ck_io31, ck_io32} = 7'b1111001;    // Number 3</code>
</p>

<p align="center">
  <code>assign {ck_io30, ck_io29, ck_io26, ck_io27, ck_io28, ck_io31, ck_io32} = 7'b0110011;    // Number 4</code>
</p>

<p align="center">
  <code>assign {ck_io30, ck_io29, ck_io26, ck_io27, ck_io28, ck_io31, ck_io32} = 7'b1011011;    // Number 5</code>
</p>

<p align="center">
  <code>assign {ck_io30, ck_io29, ck_io26, ck_io27, ck_io28, ck_io31, ck_io32} = 7'b1011111;    // Number 6</code>
</p>

<p align="center">
  <code>assign {ck_io30, ck_io29, ck_io26, ck_io27, ck_io28, ck_io31, ck_io32} = 7'b1110000;    // Number 7</code>
</p>

<p align="center">
  <code>assign {ck_io30, ck_io29, ck_io26, ck_io27, ck_io28, ck_io31, ck_io32} = 7'b1111111;    // Number 8</code>
</p>

<p align="center">
  <code>assign {ck_io30, ck_io29, ck_io26, ck_io27, ck_io28, ck_io31, ck_io32} = 7'b1111011;    // Number 9</code>
</p>

## Files

- `BCD_to_7_Segment_Decoder.v`: The Verilog description of the BCD to 7 Segment_Decoder.
- `CoraZ7.xdc`: The Physical constraint file for pin assignments.
