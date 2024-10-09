`timescale 1ns / 1ns


module UART_Transmitter_tb;


    reg clk;                // System Clock
    reg [7:0] data;         // 8-bit data to transmit
    reg data_valid;         // Signal to indicate whether there is data to -> transmit <- or not (data_valid = 1: there is data to transmit | data_valid = 0; there is NOT data to transmit)
    wire tx;                // Serial data output bit (1-bit)
    wire tx_busy;           // Signal to indicate whether transmission is -> busy <- or not (tx_busy = 1: transmitter is busy and currently involved in transmitting data | tx_done = 0: transmitter is not busy or has completed its transmission)
    
    wire [7:0] lastname [0:4];      // 2D array of wires to store 5 elements, each 8 bits
    
    assign lastname[0] = "T";
    assign lastname[1] = "A";
    assign lastname[2] = "M";
    assign lastname[3] = "I";
    assign lastname[4] = "M";
    
    reg [4:0] index = 0;            // Lastname index
    
    UART_Baud_Rate_Gen generator 
                         (.clk(clk),
                          .baud_clk(baud_clk)
                         );
    wire baud_clk;                      // Output baud_clk from UART_Baud_Rate_Gen module 


    UART_Transmitter 
          transmitter 
          (
          .baud_clk(baud_clk),
          .data(data),
          .data_valid(data_valid),
          .tx(tx),
          .tx_busy(tx_busy)
          );
    
    parameter CLK_PERIOD = 10; // 100 MHz clock
    
    // Clock Generation
    initial begin
        clk = 0;
        forever #(CLK_PERIOD / 2) clk = ~clk; // Toggle clock
    end
    
    initial begin
        clk <= 0;
        data_valid <= 0;
        
        @(posedge baud_clk);
        @(posedge baud_clk);
        
        data_valid <= 1;
    end
        
    always @(posedge tx_busy) begin
        if (index == 4)
            data_valid <= 0;
        else
            index <= index + 1;
    end
        
    always @(*) data <= lastname[index];
    
endmodule
