`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/01/2024 04:14:14 AM
// Design Name: 
// Module Name: FSMdoorLock
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


module FSMdoorLock(
    input logic clk,
    input logic reset,
    input logic [3:0]passWD,
    input logic b1,
    input logic b2,
    output logic [3:0]out
    );

    typedef enum logic [1:0] {locked,unlocked} state_t;
    
    logic [3:0]MypassWD=4'b1001;
    state_t current_state, next_state;
    
    always_ff @(posedge clk,negedge reset) begin
        if (!reset)
            current_state <=locked;
        else
            current_state <= next_state;
    end
    
    always_comb begin
        case(current_state)
            locked:   if(b1==1'b1 & passWD==MypassWD)
                             next_state = unlocked;
                      else
                             next_state = locked;       
            unlocked:  if(b2==1'b1) 
                            next_state = locked;
                      else
                            next_state= unlocked;
        endcase
    end
    
    always_comb begin
        if(current_state==locked & passWD!=MypassWD & b1==1)
            out=4'b1100;
        else if(current_state== unlocked)
            out=4'b0000;
        else 
            out=4'b0001;
    end    
endmodule
