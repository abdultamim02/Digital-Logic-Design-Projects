`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/15/2024 11:00:57 AM
// Design Name: 
// Module Name: UART_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module UART_tb;

    reg clk;                // System Clock
    reg rx;            // Serial data input bit (1-bit)
    wire tx;                // Serial data output bit (1-bit)
    
    UART_Baud_Rate_Gen generator 
                         (.clk(clk),
                          .baud_clk(baud_clk)
                         );
    wire baud_clk; 
    
    Top top (.clk(clk),
             .rx(rx),
             .tx(tx)
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
