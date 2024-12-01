`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/01/2024 02:36:06 PM
// Design Name: 
// Module Name: Task2
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


module Task2(
input logic BTNC,
input logic CPU_RESETN,
input logic in_bit,  
output logic zero ,one
 );
 logic clk,reset ; 
assign reset = CPU_RESETN ; 
assign clk = BTNC ; 


typedef enum logic [2:0] {
S0,
S1,
S2,
S3
} state_t;

state_t current_state, next_state;

 always_ff @(posedge clk or negedge reset) begin
if (!reset)
current_state <= S0;
else
current_state <= next_state;
end

 
// Next-state logic
always_comb begin
case (current_state)
S0: next_state = in_bit ? S2 : S1;
S1: next_state = in_bit ? S3 : S0;
S2: next_state = in_bit ? S0 : S3;
S3: next_state = in_bit ? S1 : S2;

default: next_state = S0;
endcase
end


// Output logic
always_comb begin
zero = (current_state == S0 | current_state == S2 );
one = (current_state == S0 | current_state == S1 );

end
endmodule
 
 
 
 
 