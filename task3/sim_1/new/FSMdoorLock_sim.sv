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

    logic clk=0;
    logic reset=0;
    logic [3:0]passWD=4'b0000;
    logic b1=0;
    logic b2=0;
    logic [3:0]out;
    
    
    
  FSMdoorLock lock1(.clk(clk),.reset(reset),.passWD(passWD),.b1(b1),.b2(b2),.out(out));  
    
    
always #10 clk = ~clk;

//   `define disp $display("%0\t\t %b\t\t %b\t\t %b\t\t\t %b\t ",$time,clk,reset,inp_bit,out);
   `define sampTime #25;
   
initial begin 
#5
reset=1;
passWD=4'b0000;
b1=0;
b2=0;
`sampTime;
passWD=4'b1001;
b1=0;
b2=0;
`sampTime;
passWD=4'b1001;
b1=1;
b2=0;
`sampTime;
passWD=4'b1000;
b1=0;
b2=0;
`sampTime;
passWD=4'b0001;
b1=0;
b2=0;
`sampTime;
passWD=4'b0000;
b1=0;
b2=1;
`sampTime;
passWD=4'b0000;
b1=1;
b2=0;
`sampTime;
passWD=4'b1111;
b1=0;
b2=0;
`sampTime;


$finish;
end
endmodule
