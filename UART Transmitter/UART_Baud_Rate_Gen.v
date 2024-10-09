`timescale 1ns / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Company: San Diego State University
// Engineer: Abdul Karim Tamim
//////////////////////////////////////////////////////////////////////////////////


module UART_Baud_Rate_Gen (input clk,                                          
                           output reg baud_clk    
                           );
    
    localparam BAUD_RATE_SCALING = 100_000_000 / 9600;


    reg [15:0] counter;         // 16 bit counter
    
    initial begin
        counter = 0;            // Initialize counter to 0
        baud_clk = 0;           // Initialize baud_clk to 0
    end
    
    always @(posedge clk) begin
        // If the counter reaches the BAUD_RATE_SCALING
        if (counter == BAUD_RATE_SCALING-1) begin
            counter <= 0;                   // Reset the counter to 0 for the next counting cycle
            baud_clk <= ~baud_clk;          // Toggle the baud_clk signal: switches from high to low or low to high
        end
        // Else if it hasn't reached the limit
        else begin
            counter <= counter + 1;        // Increment the counter by 1
        end
    end    
    
endmodule
