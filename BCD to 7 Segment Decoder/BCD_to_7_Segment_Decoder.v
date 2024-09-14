`timescale 1ns / 1ns

//////////////////////////////////////////////////////////////////////////////////
// Company: San Diego State University
// Engineer: Abdul Karim Tamim
//////////////////////////////////////////////////////////////////////////////////

module BCD_to_7_Segment_Decoder(
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
    localparam [3:0] STATE0 = 4'b0000,
                     STATE1 = 4'b0001,
                     STATE2 = 4'b0010,
                     STATE3 = 4'b0011,
                     STATE4 = 4'b0100,
                     STATE5 = 4'b0101,
                     STATE6 = 4'b0110,
                     STATE7 = 4'b0111,
                     STATE8 = 4'b1000,
                     STATE9 = 4'b1001;
                     
    reg [31:0] count = 0;
    reg [6:0] data_out = 0;      // Data to display on the 7 segment display
    
    reg [4:0] state = STATE0;    // State Register
    
    // Assign the corresponding digit to data_out
    assign {ck_io30, ck_io29, ck_io26, ck_io27, ck_io28, ck_io31, ck_io32} = data_out;
                                
    assign {ck_io30, ck_io29, ck_io26, ck_io27, ck_io28, ck_io31, ck_io32} = 7'b1111110;    // Number 0
    
    // assign {ck_io30, ck_io29, ck_io26, ck_io27, ck_io28, ck_io31, ck_io32} = 7'b0110000;    // Number 1
    
    // assign {ck_io30, ck_io29, ck_io26, ck_io27, ck_io28, ck_io31, ck_io32} = 7'b1101101;    // Number 2
    
    // assign {ck_io30, ck_io29, ck_io26, ck_io27, ck_io28, ck_io31, ck_io32} = 7'b1111001;    // Number 3
    
    // assign {ck_io30, ck_io29, ck_io26, ck_io27, ck_io28, ck_io31, ck_io32} = 7'b0110011;    // Number 4
    
    // assign {ck_io30, ck_io29, ck_io26, ck_io27, ck_io28, ck_io31, ck_io32} = 7'b1011011;    // Number 5
    
    // assign {ck_io30, ck_io29, ck_io26, ck_io27, ck_io28, ck_io31, ck_io32} = 7'b1011111;    // Number 6
    
    // assign {ck_io30, ck_io29, ck_io26, ck_io27, ck_io28, ck_io31, ck_io32} = 7'b1110000;    // Number 7
    
    // assign {ck_io30, ck_io29, ck_io26, ck_io27, ck_io28, ck_io31, ck_io32} = 7'b1111111;    // Number 8

    // assign {ck_io30, ck_io29, ck_io26, ck_io27, ck_io28, ck_io31, ck_io32} = 7'b1111011;    // Number 9
    
endmodule



