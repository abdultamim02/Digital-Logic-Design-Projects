`timescale 1ns / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Company: San Diego State University
// Engineer: Abdul Karim Tamim
//////////////////////////////////////////////////////////////////////////////////

module UART_Transmitter #(
                          parameter N = 10,          // Total number of BITS transmitted 1: Start Bit, 8 Data Bits, 1 Optional Parity Bit (NOT USED), 1 Stop Bit --> 1 + 8 + 1 = 10 Bits
                          parameter D = 8,           // Total number of Data bits
                          parameter SB_TICK = 16     // Number of stop bit / oversampling cycles (1 stop bit)

                         )
                         (
                          input clk,                 // System clock
                          input reset,               // Reset signal
                          input tx_start,            // Input signal to start the transmission process
                          input [D-1:0] data,        // 8-bit data input
                          input baud_clk,            // Baud clock signal from the Baud Rate Generator
                          output reg tx_done,        // End of transmission signal
                          output tx_out              // Serial data output for transmission (UART data line)
                         );
    
    // State Machine States
    localparam [1:0] IDLE = 2'b00,
                     START = 2'b01,
                     DATA = 2'b10,
                     END = 2'b11;
    
    // Initialize Registers
    reg [1:0] current_state, next_state;            // Initialize current state and next state registers
    reg [3:0] baud_counter, next_baud_counter;      // Baud counter for timing
    reg [2:0] bit_counter, next_bit_counter;        // Number of bits transmitted in data state
    reg [N-1:0] data_reg, next_data_reg;            // Data word to transmit serially
    reg tx_reg, next_tx_reg;                        // Data filter for potential glitches

    // Register Logic
    always @(posedge clk or posedge reset) begin
        if (reset) begin
            current_state <= IDLE;
            baud_counter <= 0;
            bit_counter <= 0;
            data_reg <= 0;
            tx_reg <= 1'b1;
        end
        else begin
            current_state <= next_state;
            baud_counter <= next_baud_counter;
            bit_counter <= next_bit_counter;
            data_reg <= next_data_reg;
            tx_reg <= next_tx_reg;
        end
    end
    
    // State Machine Logic
    always @* begin
        next_state = current_state;
        tx_done = 1'b0;
        next_baud_counter = baud_counter;
        next_bit_counter = bit_counter;
        next_data_reg = data_reg;
        next_tx_reg = tx_reg;
        
        case (current_state)
            IDLE: begin                     // No data in FIFO
                next_tx_reg = 1'b1;         // Transmit idle
                if (tx_start) begin          // When FIFO is NOT empty
                    next_state = START;
                    next_baud_counter = 0;
                    next_data_reg = data;
                end
            end
            
            START: begin
                next_tx_reg = 1'b0;          // Start bit
                if (baud_clk) begin
                    if (baud_counter == 15) begin
                        next_state = DATA;
                        next_baud_counter = 0;
                        next_bit_counter = 0;
                    end
                    else
                        next_baud_counter = baud_counter + 1;
                end
            end
            
            DATA: begin
                next_tx_reg = data_reg[0];  // Transmit current data bit
                if (baud_clk) begin
                    if (baud_counter == 15) begin
                        next_baud_counter = 0;
                        next_data_reg = data_reg >> 1;  // Shift right for next bit
                        if (bit_counter == (N - 1))
                            next_state = END;  // All data bits transmitted
                        else
                            next_bit_counter = bit_counter + 1;
                    end
                    else
                        next_baud_counter = baud_counter + 1;
                end
            end
            
            END: begin
                next_tx_reg = 1'b1;          // Back to idle
                if (baud_clk) begin
                    if (baud_counter == (SB_TICK - 1)) begin
                        next_state = IDLE;
                        tx_done = 1'b1;      // Transmission complete
                    end
                    else
                        next_baud_counter = baud_counter + 1;
                end
            end
        endcase    
    end
    
    // Output Logic
    assign tx_out = tx_reg;
 
endmodule
