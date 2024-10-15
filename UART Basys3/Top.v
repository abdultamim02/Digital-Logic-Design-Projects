`timescale 1ns / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Company: San Diego State University
// Engineer: Abdul Karim Tamim
//////////////////////////////////////////////////////////////////////////////////


module Top (input clk, RsRx,
            output RsTx
            );
    
    wire baud_clk;
    wire [7:0] data;
    wire data_valid;
    wire tx_busy;
    wire rx_busy;
    
    UART_Baud_Rate_Gen generator (.clk(clk),
                                  .baud_clk(baud_clk)
                                  );
    
    UART_Receiver receiver (.baud_clk(baud_clk),
                            .rx(RsRx),
                            .data(data), 
                            .rx_busy(rx_busy)
                            );
    
    // Correction to the data_valid signal
    assign data_valid = !rx_busy;  // Data valid when receiver is not busy and data is available

    UART_Transmitter transmitter (.baud_clk(baud_clk),
                                  .data(data), 
                                  .data_valid(data_valid), 
                                  .tx(RsTx),   
                                  .tx_busy(tx_busy)
                                  );

endmodule
