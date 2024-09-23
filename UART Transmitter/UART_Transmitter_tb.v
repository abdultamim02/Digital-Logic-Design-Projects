`timescale 1ns / 1ns

module UART_Transmitter_tb;

    parameter CLK_PERIOD = 10; // 100 MHz clock

    reg clk;
    reg reset;
    reg tx_start;
    reg [7:0] data;
    wire tx_done;
    wire tx_out;
    wire baud_clk; // Change this to wire
    
    // Instantiate the UART Transmitter
    UART_Transmitter #(
        .N(10),
        .D(8)
    ) uut (
        .clk(clk),
        .reset(reset),
        .tx_start(tx_start),
        .data(data),
        .baud_clk(baud_clk), // This remains unchanged
        .tx_done(tx_done),
        .tx_out(tx_out)
    );
    
    // Instantiate the Baud Rate Generator
    UART_Baud_Rate_Gen #(
        .N(10),
        .BAUD_RATE(9600),
        .CLOCK_RATE(100_000_000)
    ) baud_gen (
        .clk(clk),
        .reset(reset),
        .baud_clk(baud_clk) // This remains unchanged
    );
    

    // Clock Generation
    initial begin
        clk = 0;
        forever #(CLK_PERIOD / 2) clk = ~clk; // Toggle clock
    end
    
    // Test Sequence
    initial begin
        reset = 1;
        tx_start = 0;
        data = 0;
        #20;
        
        reset = 0;  // Release reset
        
        // Transmit characters 'a' to 'e'
        send_char(8'h41);
        #100; // Wait for enough time before sending the next character
        send_char(8'h42);
        #100; // Wait for enough time before sending the next character
        send_char(8'h43);
        #100; // Wait for enough time before sending the next character
        send_char(8'h44);
        #100; // Wait for enough time before sending the next character
        send_char(8'h45);
        
        // Finish simulation after all characters have been sent
        #100000000;
        $finish;
    end
    
    // Task to send a character
    task send_char(input [7:0] char);
        begin
            data = char;        // Load data
            tx_start = 1;      // Start transmission
            #10;                // Wait for a clock cycle
            tx_start = 0;      // Clear start signal
            wait(tx_done);     // Wait until transmission is done
            #10;                // Wait a bit before sending the next character
        end
    endtask

endmodule
