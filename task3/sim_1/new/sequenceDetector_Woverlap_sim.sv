`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/01/2024 02:40:18 AM
// Design Name: 
// Module Name: sequenceDetector_WOoverlap_sim
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


module sequenceDetector_Woverlap_sim;


logic clk=0;
logic inp_bit=0;
logic out;
logic reset=0;


sequenceDetector_Woverlap  sd1(.clk(clk),.reset(reset),.in_bit(inp_bit),.detected(out));

always #10 clk = ~clk;

//   `define disp $display("%0\t\t %b\t\t %b\t\t %b\t\t\t %b\t ",$time,clk,reset,inp_bit,out);
   `define sampTime #25;
   
initial begin 
#5
reset=1;
inp_bit=0;
`sampTime;
inp_bit=0;
`sampTime;
inp_bit=1;
`sampTime;
inp_bit=1;
`sampTime;
inp_bit=0;
`sampTime;
inp_bit=1;
`sampTime;
inp_bit=1;
`sampTime;
inp_bit=1;
`sampTime;
inp_bit=0;
`sampTime;
inp_bit=1;
`sampTime;
inp_bit=0;
`sampTime;
inp_bit=1;
`sampTime;
inp_bit=1;
`sampTime;
inp_bit=1;
`sampTime;
inp_bit=0;
`sampTime;
inp_bit=0;
`sampTime;



$finish;
end
endmodule
