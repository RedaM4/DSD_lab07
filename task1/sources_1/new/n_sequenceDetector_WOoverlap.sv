`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/01/2024 02:01:50 AM
// Design Name: 
// Module Name: n_sequenceDetector_WOoverlap
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


module sequenceDetector_WOoverlap(
input logic clk,
input logic reset,
input logic in_bit,
output logic detected
    );
    
    
    typedef enum logic [2:0] {A,B,C,D,E} state_t;
    
    state_t current_state, next_state;
    
    always_ff @(posedge clk,negedge reset) begin
        if (!reset)
            current_state <=A;
        else
            current_state <= next_state;
    end
    
    always_comb begin
        case(current_state)
            A: next_state = in_bit ? B : A;
            B: next_state = in_bit ? C : A;
            C: next_state = in_bit ? A : D;
            D: next_state = in_bit ? E : B;
            E: next_state = in_bit ? B : A;
        endcase
    end
    
    always_comb begin
        detected = (current_state == E);
    end    
endmodule
