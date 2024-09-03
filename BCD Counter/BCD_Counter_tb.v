`timescale 1ns / 1ns


module BCD_Counter_tb;
    
    reg [3:0] D;            // Data Input D
    reg ENABLE;             // Enable signal for counter operation
    reg LOAD;               // Load signal to load data into the counter
    reg UP;                 // Up/Down control signal (1 for up-counting)
    reg CLK;                // Clock signal for synchronization
    reg CLR;                // Clear signal to reset the counter
    wire [3:0] Q;           // 4-bit output reflecting the current counter value
    wire CO;                // Carry Output signal indicating counter overflow
    
    parameter ClockPeriod = 20;     // ClockPeriod is 20 ns
    
    // Clock generation
    initial CLK = 0;            // Initialize clock signal to active low (0) at the start of simulation
    always #(ClockPeriod / 2) CLK = ~CLK;       // Continuously toggle the clock every (20 / 2 = 10 ns) to create a waveform
    
    // Instantiate the BCD_Counter module under test (MUT)
    BCD_Counter BCD (
        .D(D), 
        .ENABLE(ENABLE), 
        .LOAD(LOAD), 
        .UP(UP), 
        .CLK(CLK), 
        .CLR(CLR), 
        .Q(Q), 
        .CO(CO)
    );
    
    // Test Scenarios
    initial begin
        // Initialize Inputs
        D <= 4'b0100;    // Initialize with last digit of RedID, which is 4
        ENABLE <= 0;
        LOAD <= 0;
        UP <= 0;
        CLR <= 0;
        
        @(posedge CLK);
        
        // Activate ENABLE and LOAD to load the data input D to counter and CLR to prevent resetting the counter
        LOAD <= 1;
        ENABLE <= 1;
        CLR <= 1;
        
        @(posedge CLK);
        
        // Deactivate LOAD and activate both ENABLE and UP to increment the counter --> 4 times <--
        LOAD <= 0;
        UP <= 1;
        
        // (First Increment)
        @(posedge CLK);


        // (Second Increment)
        @(posedge CLK);
                
        // (Third Increment)
        @(posedge CLK);


        // (Fourth Increment)
        @(posedge CLK);
        
        // Deactivate both LOAD and UP and activate ENABLE to decrement the counter --> Once <--
        UP <= 0;
        
        // (Decrement)
        @(posedge CLK);
        
        @(posedge CLK);
        // Clear the counter by deactivating CLR to active low (setting CLR to 0)
        CLR <= 0;
                
        // Stop the simulation after 40 ns
        #(ClockPeriod * 5) $finish;
        
    end
endmodule
