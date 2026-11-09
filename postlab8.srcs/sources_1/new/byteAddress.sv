`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/09/2026 02:26:51 PM
// Design Name: 
// Module Name: byteAddress
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module byteAddress (
       input  logic        CLK100MHZ,
       input  logic [11:0] SW,
       input  logic        BTNU,
       input  logic        BTND,
       input  logic        BTNC,

       output logic [15:0] LED,
       output logic [6:0]  SEG,
       output logic [3:0]  AN,
       output logic        DP
   );
    
    logic [31:0] memory [0:3];
    
    
    Word index = byte_address[3:2];
    Byte index = byte_address[1:0];
    
    Use always_ff @(posedge clk)
    
    
    If reset:
        // Initialize memory words
    Else if write_enable:
        // Select the correct word
        // Select the correct byte
        // Write only the selected 8-bit byte
            
    memory[word_index][8*byte_index +: 8] <= data_in;
endmodule
