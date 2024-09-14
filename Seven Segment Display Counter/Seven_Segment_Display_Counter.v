`timescale 1ns / 1ns

//////////////////////////////////////////////////////////////////////////////////
// Company: San Diego State University
// Engineer: Abdul Karim Tamim
//////////////////////////////////////////////////////////////////////////////////

module Seven_Segment_Display_Counter(
                                input clk,
                                output wire ck_io26,        // C
                                output wire ck_io27,        // D
                                output wire ck_io28,        // E
                                output wire ck_io29,        // B
                                output wire ck_io30,        // A
                                output wire ck_io31,        // F
                                output wire ck_io32         // G
                                );
                                
    /*
    In Order Pins:
        A = ck_io30
        B = ck_io29
        C = ck_io26
        D = ck_io27
        E = ck_io28
        F = ck_io31
        G = ck_io32
    */
    
    // State Declarations
    localparam [3:0] STATEF = 4'b1111,
                     STATEE = 4'b1110,
                     STATED = 4'b1101,
                     STATEC = 4'b1100,
                     STATEB = 4'b1011,
                     STATEA = 4'b1010,
                     STATE9 = 4'b1001,
                     STATE8 = 4'b1000,
                     STATE7 = 4'b0111,
                     STATE6 = 4'b0110,
                     STATE5 = 4'b0101,
                     STATE4 = 4'b0100,
                     STATE3 = 4'b0011,
                     STATE2 = 4'b0010,
                     STATE1 = 4'b0001,
                     STATE0 = 4'b0000;             
                     
    reg [31:0] count = 0;        // // 32-bit counter initialized to 0
    reg [6:0] data_out = 0;      // Data to display on the 7 segment display
    
    reg [4:0] state = STATEF;    // State Register
    
    // Assign the corresponding digit to data_out
    assign {ck_io30, ck_io29, ck_io26, ck_io27, ck_io28, ck_io31, ck_io32} = data_out;
                     
    always @(posedge clk) begin
        count <= count + 1;                           // Increment the counter by 1
        case (state)
            STATEF: begin
                if (count == 100_000_000)             // Check if the counter has reached 100_000_000
                    state <= STATEE;                  // Move to STATEE if the count is met
                else
                    data_out <= 7'b1000111;           // Display 'F' on a 7-segment display
            end
            STATEE: begin
                    if (count == 200_000_000)             // Check if the counter has reached 200_000_000
                        state <= STATED;                  // Move to STATED if the count is met
                    else
                        data_out <= 7'b1001111;           // Display 'E' on a 7-segment display
            end
            STATED: begin
                    if (count == 300_000_000)             // Check if the counter has reached 300_000_000
                        state <= STATEC;                  // Move to STATEC if the count is met
                    else
                        data_out <= 7'b0111101;           // Display 'D' on a 7-segment display
            end
            STATEC: begin
                    if (count == 400_000_000)             // Check if the counter has reached 400_000_000
                        state <= STATEB;                  // Move to STATEB if the count is met
                    else
                        data_out <= 7'b1001110;           // Display 'C' on a 7-segment display
            end
            STATEB: begin
                    if (count == 500_000_000)             // Check if the counter has reached 500_000_000
                        state <= STATEA;                  // Move to STATEA if the count is met
                    else
                        data_out <= 7'b0011111;           // Display 'B' on a 7-segment display
            end
            STATEA: begin
                    if (count == 600_000_000)             // Check if the counter has reached 600_000_000
                        state <= STATE9;                  // Move to STATE9 if the count is met
                    else
                        data_out <= 7'b1110111;           // Display 'A' on a 7-segment display
            end
            STATE9: begin
                    if (count == 700_000_000)             // Check if the counter has reached 700_000_000
                        state <= STATE8;                  // Move to STATE8 if the count is met
                    else
                        data_out <= 7'b1111011;           // Display '9' on a 7-segment display
            end
            STATE8: begin
                    if (count == 800_000_000)             // Check if the counter has reached 800_000_000
                        state <= STATE7;                  // Move to STATE7 if the count is met
                    else
                        data_out <= 7'b1111111;           // Display '8' on a 7-segment display
            end
            STATE7: begin
                    if (count == 900_000_000)             // Check if the counter has reached 900_000_000
                        state <= STATE6;                  // Move to STATE6 if the count is met
                    else
                        data_out <= 7'b1110000;           // Display '7' on a 7-segment display
            end
            STATE6: begin
                    if (count == 1_000_000_000)           // Check if the counter has reached 1_000_000_000
                        state <= STATE5;                  // Move to STATE5 if the count is met
                    else
                        data_out <= 7'b1011111;           // Display '6' on a 7-segment display
            end            
            STATE5: begin
                    if (count == 1_100_000_000)           // Check if the counter has reached 1_100_000_000
                        state <= STATE4;                  // Move to STATE4 if the count is met
                    else
                        data_out <= 7'b1011011;           // Display '5' on a 7-segment display
            end            
            STATE4: begin
                    if (count == 1_200_000_000)           // Check if the counter has reached 1_200_000_000
                        state <= STATE3;                  // Move to STATE3 if the count is met
                    else
                        data_out <= 7'b0110011;           // Display '4' on a 7-segment display
            end            
            STATE3: begin
                    if (count == 1_300_000_000)           // Check if the counter has reached 1_300_000_000
                        state <= STATE2;                  // Move to STATE2 if the count is met
                    else
                        data_out <= 7'b1111001;           // Display '3' on a 7-segment display
            end            
            STATE2: begin
                    if (count == 1_400_000_000)           // Check if the counter has reached 1_400_000_000
                        state <= STATE1;                  // Move to STATE1 if the count is met
                    else
                        data_out <= 7'b1101101;           // Display '2' on a 7-segment display
            end            
            STATE1: begin
                    if (count == 1_500_000_000)           // Check if the counter has reached 1_500_000_000
                        state <= STATE0;                  // Move to STATE0 if the count is met
                    else
                        data_out <= 7'b0110000;           // Display '1' on a 7-segment display
            end            
            STATE0: begin
                    if (count == 1_600_000_000) begin     // Check if the counter has reached 1_600_000_000
                        state <= STATEF;                  // Move to STATEF if the count is met
                        count <= 0;                       // Reset the counter back to 0
                    end
                    else
                        data_out <= 7'b1111110;           // Display '0' on a 7-segment display
            end
        endcase
    end

endmodule
