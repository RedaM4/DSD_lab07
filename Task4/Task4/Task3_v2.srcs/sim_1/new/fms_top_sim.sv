`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/02/2024 09:30:15 AM
// Design Name: 
// Module Name: fms_top_sim
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


module fms_top_sim;

//module FSMdoorLock_top(
//input logic clk,
//    input logic reset,
//    input logic [3:0]passWD,
//    input logic b1,
//    input logic b2,
//    output logic [3:0]out

logic clk,reset,b1,b2;
logic [3:0]out,passWD ; 

FSMdoorLock_top #(50) ff(clk,reset,passWD,b1,b2,out);

  initial begin
        clk = 0;
        forever #5 clk = ~clk; 
    end
    
initial begin
reset = 0; passWD =4'b1001; b1=0; b2=0 ;   
#500
reset = 1 ; passWD =4'b1000; b1=1; b2=0 ;   
#500
reset = 1 ; passWD =4'b1000; b1=0; b2=0 ;  
#500
reset = 1 ; passWD =4'b1000; b1=1; b2=0 ;   
#500
reset = 1 ; passWD =4'b1000; b1=0; b2=0 ;  
#500
reset = 1 ; passWD =4'b1000; b1=1; b2=0 ;   
#500
reset = 1 ; passWD =4'b1000; b1=0; b2=0 ;  
#10000
reset = 1 ; passWD =4'b1001; b1=1; b2=0 ;  
#500



//reset = 1 ; passWD =4'b1001; b1=0; b2=1 ;
//#500
#2000000
$finish;
end
endmodule
