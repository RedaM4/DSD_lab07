`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/01/2024 02:48:13 PM
// Design Name: 
// Module Name: Task2_sim
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


//module Task2(
//input logic clk,
//input logic reset,
//input logic in_bit,  
//output logic zero ,one

// );

module Task2_sim;


logic clk,reset,inbit,zero,one;


Task2 ta2(clk,reset,inbit,zero,one) ; 

  initial begin
        clk = 0;
        forever #5 clk = ~clk; 
    end
    
    
    initial begin
    reset =0; inbit=0;
    #10 
    reset=1;inbit=0;
    #10
    inbit=1;
    #10
     inbit=1;
       #10
     inbit=1;
      #10
     inbit=0;
       #10
     inbit=0;
     
            $finish;

    end



    
endmodule
