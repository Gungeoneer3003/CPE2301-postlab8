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


// Connects the Basys3 inputs, memory, display, and operation LEDs
module byteAddress (
       input  logic        clk,
       input  logic [11:0] sw,
       input  logic        btnU,
       input  logic        btnD,
       input  logic        btnC,

       output logic [1:0] led,
       output logic [6:0]  seg,
       output logic [3:0]  an,
       output logic        dp
   );
    
    logic [7:0] data_out;
    logic pastWriteButton;
    logic pastReadButton;
    logic writePulse;
    logic readpulse;
    
    // Remember the prior button states for simple edge detection
    always_ff @(posedge clk) begin
        if (btnC) begin
            pastWriteButton <= 1'b0;
            pastReadButton <= 1'b0;
        end 
        else begin
            pastWriteButton <= btnU;
            pastReadButton <= btnD;
        end
        
    end
    
    
    // Check for button bounce, pulse is read
    assign writePulse = btnU && !pastWriteButton;
    assign readpulse = btnD && !pastReadButton;
    
    // Connect switches and button pulses to the byte-addressable memory
    memory4x32 memory (
           .clk(clk),
           .reset(btnC),
           .writeEnabled(writePulse),
           .readEnabled(readpulse),
           .byteAddress(sw[11:8]),
           .data_in(sw[7:0]),
           .data_out(data_out)
    );
       
    // Show 0, selected address, and the last read byte
    display_controller display (
           .clk(clk),
           .reset(btnC),
           .address(sw[11:8]),
           .data_out(data_out),
           .seg(seg),
           .an(an)
     );
     
     // leds are lit while their matching operation button is pressed
     assign led[1] = btnU;
     assign led[0] = btnD;
     
     
     // Decimal point is active-low, so 1 turns it off
     assign dp = 1'b1;
endmodule
