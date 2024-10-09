`timescale 1ns / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Company: San Diego State University
// Engineer: Abdul Karim Tamim
//////////////////////////////////////////////////////////////////////////////////


module UART_Transmitter (input baud_clk,           // Generated baud clock from UART_Baud_Rate_Gen module
                         input [7:0] data,         // 8-bit data to transmit
                         input data_valid,         // Signal to indicate whether there is data to -> transmit <- or not (data_valid = 1: there is data to transmit | data_valid = 0; there is NOT data to transmit)
                         output reg tx,            // Serial data output bit (1-bit)
                         output reg tx_busy        // Signal to indicate whether transmission is -> busy <- or not (tx_busy = 1: transmitter is busy and currently involved in transmitting data | tx_done = 0: transmitter is not busy or has completed its transmission)
                         );
    
    // State Machine States
    localparam [1:0] IDLE = 2'b00,
                     START = 2'b01,
                     DATA = 2'b10,
                     END = 2'b11;
                     
    reg [1:0] state = IDLE;        // Current_state of the machine and next_state of the machine
    reg [2:0] bit_index = 0;       // The index of the bit to be transmitted. Since we are 8-bis of data, this bit_index is capable of transmitting all 8 since it is 3-bits, which can range from 0 to 7
    reg [7:0] tx_data;             // Data to be transmitted
        
    always @(baud_clk) begin
        case (state)
            IDLE: begin
                tx <= 1;                // Logic HIGH (1) output bit (IDLE state)
                tx_busy <= 0;               // Transmitter is not busy
                // If data_valid signal is HIGH (equals to 1) meaning there is data to transmit
                if (data_valid) begin
                    state <= START;         // Move to START state
                end
            end
            
            START: begin
                tx <= 0;                // START bit always LOW
                tx_busy <= 1;           // Transmitter is busy
                tx_data <= data;        // Load data to tx_data
                state <= DATA;          // Move to DATA state
            end
            
            DATA: begin
                tx <= tx_data[bit_index];           // Transmit one bit at a time
                // Increment bit index to transmit all 8 bits
                if (bit_index < 7)
                    bit_index = bit_index + 1;
                else
                    state = END;                // Move to END state
            end
            
            END: begin
                tx <= 1;                 // STOP bit always HIGH
                bit_index <= 0;          // Reset bit index back to 0
                tx_busy <= 0;            // Transmitter is not busy
                
                // Check if there is more data to transmit
                if (data_valid)
                    state <= START;         // If there is, move to STATE state
                else
                    state <= IDLE;          // If there is not, move to IDLE state
            end
            
            // Default state
            default: state <= IDLE;
            
        endcase
    end
        
endmodule
