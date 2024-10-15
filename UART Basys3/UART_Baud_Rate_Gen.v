`timescale 1ns / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Company: San Diego State University
// Engineer: Abdul Karim Tamim
//////////////////////////////////////////////////////////////////////////////////

module UART_Baud_Rate_Gen (
                            input clk,                                          
                            output reg baud_clk    
                            );
    
    localparam BAUD_RATE_SCALING = 100000000 / 9600;

    reg [15:0] counter;
    
    initial begin
        counter = 0; 
        baud_clk = 0;
    end
    
    always @(posedge clk) begin
            if (counter == BAUD_RATE_SCALING-1) begin
                counter <= 0;             
                baud_clk <= ~baud_clk;     
            end
            else begin
                counter <= counter + 1; 
            end
    end    
    
endmodule
