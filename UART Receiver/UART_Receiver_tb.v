`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: San Diego State University
// Engineer: Abdul Karim Tamim
//////////////////////////////////////////////////////////////////////////////////


module UART_Receiver_tb;

    reg clk;                // System Clock
    reg rx;            // Serial data input bit (1-bit)
    wire [7:0] data;         // 8-bit data to transmit
    wire rx_busy;        // Signal to indicate whether transmission is -> busy <- or not (tx_busy = 1: transmitter is busy and currently involved in transmitting data | tx_done = 0: transmitter is not busy or has completed its transmission)
    wire rx_out;
    
    UART_Baud_Rate_Gen generator 
                         (.clk(clk),
                          .baud_clk(baud_clk)
                         );
    wire baud_clk;                      // Output baud_clk from UART_Baud_Rate_Gen module 

    UART_Receiver 
          Receiver 
          (
          .baud_clk(baud_clk),
          .rx(rx),
          .data(data),
          .rx_busy(rx_busy),
          .rx_out(rx_out)
          );
          
    parameter CLK_PERIOD = 10; // 100 MHz clock
    
    // Clock Generation
    initial begin
        clk = 0;
        forever #(CLK_PERIOD / 2) clk = ~clk; // Toggle clock
    end
    
    
    initial begin
        clk <= 0;
        rx <= 1; @(posedge baud_clk);           // Default IDLE state (HIGH)
        
        rx <= 0;                                // Start bit (LOW)
        @(posedge baud_clk);                    // First Check (IDLE state)
        @(posedge baud_clk);                    // Second Check (START state)
        
        // Letter T in binary (01010100) in reverse -> (00101010)
        rx <= 0; @(posedge baud_clk);
        rx <= 0; @(posedge baud_clk);
        rx <= 1; @(posedge baud_clk);
        rx <= 0; @(posedge baud_clk);
        rx <= 1; @(posedge baud_clk);
        rx <= 0; @(posedge baud_clk);
        rx <= 1; @(posedge baud_clk);
        rx <= 0; @(posedge baud_clk);
        
        rx <= 1;  @(posedge baud_clk);          // Stop bit (HIGH)
        
        rx <= 1; @(posedge baud_clk);           // Default IDLE state (HIGH)
        
        rx <= 0;                                // Start bit (LOW)
        @(posedge baud_clk);                    // First Check (IDLE state)
        @(posedge baud_clk);                    // Second Check (START state)
        
        // Letter A in binary (01000001) in reverse -> (10000010)
        rx <= 1; @(posedge baud_clk);
        rx <= 0; @(posedge baud_clk);
        rx <= 0; @(posedge baud_clk);
        rx <= 0; @(posedge baud_clk);
        rx <= 0; @(posedge baud_clk);
        rx <= 0; @(posedge baud_clk);
        rx <= 1; @(posedge baud_clk);
        rx <= 0; @(posedge baud_clk);
        
        rx <= 1;  @(posedge baud_clk);          // Stop bit (HIGH)
        
        rx <= 1; @(posedge baud_clk);           // Default IDLE state (HIGH)
        
        rx <= 0;                                // Start bit (LOW)
        @(posedge baud_clk);                    // First Check (IDLE state)
        @(posedge baud_clk);                    // Second Check (START state)
        
        // Letter M in binary (01001101) in reverse -> (10110010)
        rx <= 1; @(posedge baud_clk);
        rx <= 0; @(posedge baud_clk);
        rx <= 1; @(posedge baud_clk);
        rx <= 1; @(posedge baud_clk);
        rx <= 0; @(posedge baud_clk);
        rx <= 0; @(posedge baud_clk);
        rx <= 1; @(posedge baud_clk);
        rx <= 0; @(posedge baud_clk);
        
        rx <= 1;  @(posedge baud_clk);          // Stop bit (HIGH)
        
        rx <= 1; @(posedge baud_clk);           // Default IDLE state (HIGH)
        
        rx <= 0;                                // Start bit (LOW)
        @(posedge baud_clk);                    // First Check (IDLE state)
        @(posedge baud_clk);                    // Second Check (START state)
        
        // Letter I in binary (01001001) in reverse -> (10010010)
        rx <= 1; @(posedge baud_clk);
        rx <= 0; @(posedge baud_clk);
        rx <= 0; @(posedge baud_clk);
        rx <= 1; @(posedge baud_clk);
        rx <= 0; @(posedge baud_clk);
        rx <= 0; @(posedge baud_clk);
        rx <= 1; @(posedge baud_clk);
        rx <= 0; @(posedge baud_clk);
        
        rx <= 1;  @(posedge baud_clk);          // Stop bit (HIGH)
        
        rx <= 1; @(posedge baud_clk);           // Default IDLE state (HIGH)
        
        rx <= 0;                                // Start bit (LOW)
        @(posedge baud_clk);                    // First Check (IDLE state)
        @(posedge baud_clk);                    // Second Check (START state)
        
        // Letter M in binary (01001101) in reverse -> (10110010)
        rx <= 1; @(posedge baud_clk);
        rx <= 0; @(posedge baud_clk);
        rx <= 1; @(posedge baud_clk);
        rx <= 1; @(posedge baud_clk);
        rx <= 0; @(posedge baud_clk);
        rx <= 0; @(posedge baud_clk);
        rx <= 1; @(posedge baud_clk);
        rx <= 0; @(posedge baud_clk);
        
        rx <= 1;  @(posedge baud_clk);           // Stop bit (HIGH)
    end          

endmodule
