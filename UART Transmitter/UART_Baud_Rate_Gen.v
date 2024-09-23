`timescale 1ns / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Company: San Diego State University
// Engineer: Abdul Karim Tamim
//////////////////////////////////////////////////////////////////////////////////

module UART_Baud_Rate_Gen #(
                            parameter N = 10,           // Total number of BITS transmitted 1: Start Bit, 8 Data Bits, 1 Optional Parity Bit (NOT USED), 1 Stop Bit --> 1 + 8 + 1 = 10 Bits
                            parameter BAUD_RATE = 9600,     // Baud rate for data transmission (9600 bits per second)
                            parameter CLOCK_RATE = 100_000_000   // System clock frequency (100 MHz)
                            )
                            (
                            input clk,              // 100 MHz clock
                            input reset,            // Reset signal                        
                            output reg baud_clk     // Clock signal used for transmitting data over the UART interface. Serves as time referance for "when" to send -> each bit <- of data
                            );
    
    /*
    How the Baud Rate Scaling value is calculated:
        - Baud Rate Scaling = Clock Frequency / Sampling Rate
            - Clock Frequency = 100 MHz = 100 * 10^6 Hz
            - Sampling Rate = Baud Rate * 16    (16 is used becasue UART samples the data line "16 times per bit" to ensure accuracy detection of transmitted data)
                - Baud Rate = 9600
                - Sampling Rate = 9600 * 16 = 153,600
        - Baud Rate Scaling = 100 * 10^6 / 153,600
        - Baud Rate Scaling = 651.04167
        - Counter Limit = 651   (Rounded Down)
    Calculations are preformed below
    */
    localparam OVERSAMPLING  = 16;
    localparam Sampling_Rate = BAUD_RATE * OVERSAMPLING;
    localparam BAUD_RATE_SCALING = CLOCK_RATE / Sampling_Rate;
    
    // Counter Register
    reg [N-1:0] counter;    // 10-bits counter; initialized to 10 bits as BAUD_RATE_SCALING = 651 fits within the range of a 10-bit binary value (0 to 1023)
    
    always @(posedge clk or posedge reset) begin
        // Check if rest signal is active high (equals to 1)
        if (reset) begin
            counter <= 0;       // Reset the counter to 0 to start counting from the beginning
            baud_clk <= 0;      // Reset baud clock to 0 to ensure proper timing on initialization
        end
        // Else if rest signal is active low (equals to 0)
        else begin
            // If the counter reaches the counter limit value (aka baud divisor)
            if (counter == BAUD_RATE_SCALING-1) begin
                counter <= 0;               // Reset the counter to 0 for the next counting cycle
                baud_clk <= ~baud_clk;      // Toggle the baud_clk signal: switches from high to low or low to high
            end
            // Else if it hasn't reached the limit
            else begin
                counter <= counter + 1;       // Increament the counter by 1
            end
        end
    end    
    
endmodule
