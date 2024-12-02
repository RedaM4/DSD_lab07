`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/02/2024 09:24:11 AM
// Design Name: 
// Module Name: FSMdoorLock_top
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


//module FSMdoorLock(
//    input logic clk,
//    input logic reset,
//    input logic [3:0]passWD,
//    input logic b1,
//    input logic b2,
//    output logic [3:0]out
//    );



//module n_clockDivider #(parameter n=4)(
//    input logic clk,
//    input logic reset,
//    output logic newClk
//    );
module FSMdoorLock_top #(parameter n=4)(
input logic clk,
    input logic reset,
    input logic [3:0]passWD,
    input logic b1,
    input logic b2,
    output logic [3:0]out
    );
    logic newclk ; 
    
    n_clockDivider #(.n(n))cl (clk,reset,newclk);
    FSMdoorLock fsm(newclk,reset,passWD,b1,b2,out);
    
endmodule
