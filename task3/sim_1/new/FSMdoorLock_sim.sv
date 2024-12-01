`timescale 1ns / 1ps
`timescale 1ns / 1ps
/*
module FSMdoorLock(
    input logic clk,
    input logic reset,
    input logic [3:0]passWD,
    input logic b1,
    input logic b2,
    output logic [3:0]out
    );

    typedef enum logic [2:0] {locked,unlocked} state_t;
    
    logic MypassWD=4'b1001;
    state_t current_state, next_state;
    
    always_ff @(posedge clk,negedge reset) begin
        if (!reset)
            current_state <=locked;
        else
            current_state <= next_state;
    end
    
    always_comb begin
        case(current_state)
            locked:   if(b1==1) next_state = (passWD==MypassWD) ? unlocked : locked;
            unlocked:  if(b2==1) next_state = locked;
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
*/

module FSMdoorLock_sim;

    logic logic clk=0;
    logic logic reset;
    logic logic [3:0]passWD,
    logic logic b1,
    logic logic b2,
    logic logic [3:0]out
endmodule
