`timescale 1ns / 1ns


module BCD_Counter (input [3:0] D,         // Data Input D
                    input ENABLE,          // Enable signal for counter operation
                    input LOAD,            // Load signal to load data into the counter
                    input UP,              // Up/Down control signal (1 for up-counting, 0 for down-counting)
                    input CLK,             // Clock signal for synchronization
                    input CLR,             // Clear signal to reset the counter
                    output wire [3:0] Q,   // 4-bit output reflecting the current counter value
                    output wire CO);        // Carry Output signal indicating counter overflow
   
    reg [3:0] Counter;      // 4-bit register to hold the current counter value
    reg Carry_Output;       // 1-bit register to hold the carry output value
    
    always @(posedge CLK or negedge CLR) begin
        // If CLR is active low (equals to 0)
        if (!CLR) begin
            Counter <= 4'b0000;     // Reset the counter to 0
            Carry_Output <= 1'b0;   // Reset the carry out to 0
        end
        // Else if ENABLE is active high (equals to 1)
        else if (ENABLE) begin
            // If LOAD and is active high (equals to 1)
            if (LOAD) begin
                Counter <= D;    // Load the data input D into the Counter
                Carry_Output <= 1'b0;      // Set the Carry_Output to 0, no overflow
            end
            // Else if LOAD is active low (equals to 0) and UP is active high (equals to 1)
            else if (UP) begin
                // And the Counter value is 9
                if (Counter == 4'b1001) begin
                    Counter <= 4'b0000;     // Reset the counter to 0
                    Carry_Output <= 1'b1;      // Set the Carry_Output to 1, there is an overflow
                end
                else begin
                    Counter <= Counter + 1;      // Increment the counter by 1
                    Carry_Output <= 1'b0;      // Set the Carry_Output to 0, no overflow
                end
            end
            // Else if LOAD is active low (equals to 0) and UP is active low (equals to 0)
            else begin
               // And the Counter value is 0
               if (Counter == 4'b0000) begin
                   Counter <= 4'b1001;      // Reset the counter to 9
                   Carry_Output <= 1'b1;       // Set the Carry_Output to 1, there is an overflow
               end
               else begin
                    Counter <= Counter - 1;      // Decrement the counter by 1
                    Carry_Output <= 1'b0;           // Set the Carry_Output to 0, no overflow
                end
            end
        end
    end
        
    assign Q = Counter;           // Continuously updates Q with the current value of Counter, ensuring Q reflects any changes in Counter
    assign CO = (ENABLE && UP && (Counter == 4'b1001)) || (ENABLE && !UP && (Counter == 4'b0000));           // Continuously updates CO
        
endmodule
