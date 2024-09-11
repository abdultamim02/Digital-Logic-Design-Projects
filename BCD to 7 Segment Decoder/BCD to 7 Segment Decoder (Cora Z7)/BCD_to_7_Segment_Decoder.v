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

    // ------> Uncomment each 'assign' statement individually to display the corresponding digit on the 7-segment display <------
    
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
