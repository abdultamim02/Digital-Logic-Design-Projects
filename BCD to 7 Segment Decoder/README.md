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

The task was to write a Verilog description of the BCD to a 7-segment decoder and then demonstrate the display of different decimal values on the 7-segment decoder for various decoder inputs.

### Implementation Details
- Cora Z7 Board
  - Uses external switches and a 7-segment display
  - Requires breadboard setup
  - IO connections made through appropriate GPIO pins
  - Requires additional physical constraint file for pin assignments

## Results

<p align="center">
  <code>assign {ck_io30, ck_io29, ck_io26, ck_io27, ck_io28, ck_io31, ck_io32} = 7'b1111110;    // Number 0</code>
  <p align="center">
    <img width="150" alt="Display '0'" src="https://github.com/user-attachments/assets/8c9d0545-3c7d-4ae1-9950-2048f67bcf13">
  </p>
</p>

-----

<p align="center">
  <code>assign {ck_io30, ck_io29, ck_io26, ck_io27, ck_io28, ck_io31, ck_io32} = 7'b0110000;    // Number 1</code>
  <p align="center">
    <img width="150" alt="Display '1'" src="https://github.com/user-attachments/assets/445086dd-f552-4473-9de5-1f170660230c">
  </p>
</p>

-----

<p align="center">
  <code>assign {ck_io30, ck_io29, ck_io26, ck_io27, ck_io28, ck_io31, ck_io32} = 7'b1101101;    // Number 2</code>
  <p align="center">
    <img width="150" alt="Display '2'" src="https://github.com/user-attachments/assets/c5cefc19-a5c6-47fc-8fc0-46f639a1654d">
  </p>
</p>

-----

<p align="center">
  <code>assign {ck_io30, ck_io29, ck_io26, ck_io27, ck_io28, ck_io31, ck_io32} = 7'b1111001;    // Number 3</code>
  <p align="center">
    <img width="150" alt="Display '3'" src="https://github.com/user-attachments/assets/c2e3be66-93c7-4d4e-aee9-70099a6bff15">
  </p>
</p>

-----

<p align="center">
  <code>assign {ck_io30, ck_io29, ck_io26, ck_io27, ck_io28, ck_io31, ck_io32} = 7'b0110011;    // Number 4</code>
  <p align="center">
    <img width="150" alt="Display '4'" src="https://github.com/user-attachments/assets/179756b2-f3bc-4ac7-968b-27ba81f7d45b">
  </p>
</p>

-----

<p align="center">
  <code>assign {ck_io30, ck_io29, ck_io26, ck_io27, ck_io28, ck_io31, ck_io32} = 7'b1011011;    // Number 5</code>
  <p align="center">
    <img width="150" alt="Display '5'" src="https://github.com/user-attachments/assets/2e1f0b73-ee6d-4924-94cc-813269b26b6b">
  </p>
</p>

-----

<p align="center">
  <code>assign {ck_io30, ck_io29, ck_io26, ck_io27, ck_io28, ck_io31, ck_io32} = 7'b1011111;    // Number 6</code>
  <p align="center">
    <img width="150" alt="Display '6'" src="https://github.com/user-attachments/assets/56445c13-eaaf-44d5-82ee-d873c8984ef8">
  </p>
</p>

-----

<p align="center">
  <code>assign {ck_io30, ck_io29, ck_io26, ck_io27, ck_io28, ck_io31, ck_io32} = 7'b1110000;    // Number 7</code>
  <p align="center">
    <img width="150" alt="Display '7'" src="https://github.com/user-attachments/assets/eb938588-78ad-42ae-b574-59e402be4da3">
  </p>
</p>

-----

<p align="center">
  <code>assign {ck_io30, ck_io29, ck_io26, ck_io27, ck_io28, ck_io31, ck_io32} = 7'b1111111;    // Number 8</code>
  <p align="center">
    <img width="150" alt="Display '8'" src="https://github.com/user-attachments/assets/fadd9c33-09f4-4acf-8e38-3446809c2f44">
  </p>
</p>

-----

<p align="center">
  <code>assign {ck_io30, ck_io29, ck_io26, ck_io27, ck_io28, ck_io31, ck_io32} = 7'b1111011;    // Number 9</code>
  <p align="center">
    <img width="150" alt="Display '9'" src="https://github.com/user-attachments/assets/30098bd7-e010-42d8-84d8-b86ff054b6ce">
  </p>
</p>

## Files

- `BCD_to_7_Segment_Decoder.v`: The Verilog description of the BCD to 7 Segment_Decoder.
- `CoraZ7.xdc`: The Physical constraint file for pin assignments.
