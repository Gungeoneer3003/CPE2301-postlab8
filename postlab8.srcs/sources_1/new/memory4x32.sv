`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/09/2026 03:02:07 PM
// Design Name: 
// Module Name: memory4x32
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


// Stores four 32-bit words as sixteen individually addressable bytes
module memory4x32 (
       input  logic       clk,
       input  logic       reset,
       input  logic       writeEnabled,
       input  logic       readEnabled,
       input  logic [3:0] byteAddress,
       input  logic [7:0] data_in,

       output logic [7:0] data_out
   );
   
   logic [31:0] memory [3:0];
   logic [1:0] wordIndex;
   logic [1:0] byteIndex;
   
   assign wordIndex = byteAddress[3:2];
   assign byteIndex = byteAddress[1:0];
   
   always_ff @(posedge clk) begin
    if(reset) begin
        for(int i = 0; i < 4; i++)
            memory[i] <= '0;
        
        data_out <= '0;
        
    end
    else begin
        if (writeEnabled) 
            memory[wordIndex][8 * byteIndex +: 8] <= data_in;
        
        if (readEnabled)
             data_out <= memory[wordIndex][8 * byteIndex +: 8];
    end 
   end
           
endmodule
