`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/09/2026 03:02:07 PM
// Design Name: 
// Module Name: display_controller
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


// Refreshes the four-digit display as 0, address, data high, data low
   module display_controller (
       input  logic       clk,
       input  logic       reset,
       input  logic [3:0] address,
       input  logic [7:0] data_out,
       output logic [6:0] seg,
       output logic [3:0] an
   );

       localparam int unsigned DISPLAY_SCAN_BIT = 16;

       logic [DISPLAY_SCAN_BIT:0] display_counter;
       logic [3:0] digit_value;

       hex_decoder decoder (
           .hex_value(digit_value),
           .seg(seg)
       );

       // Advance the multiplexing counter
       always_ff @(posedge clk) begin
           if (reset) begin
               display_counter <= '0;
           end
           else begin
               display_counter <= display_counter + 1'b1;
           end
       end

       // Enable exactly one active-low digit at a time
       always_comb begin
           case (display_counter[DISPLAY_SCAN_BIT -: 2])
               2'b00: begin
                   an = 4'b1110;
                   digit_value = data_out[3:0];
               end

               2'b01: begin
                   an = 4'b1101;
                   digit_value = data_out[7:4];
               end

               2'b10: begin
                   an = 4'b1011;
                   digit_value = address;
               end

               default: begin
                   an = 4'b0111;
                   digit_value = 4'h0;
               end
           endcase
       end

   endmodule
