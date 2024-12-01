module sev_seg_top(
    input wire BTNC,
    input wire CLK100MHZ,    // using the same name as pin names
    input wire CPU_RESETN,   
    output wire CA, CB, CC, CD, CE, CF, CG, DP,
    output wire [7:0] AN,    
    input wire [15:0]SW
    
);
logic reset_n;
logic clk;
logic myClk;
logic out;
logic [3:0]disp;
assign reset_n = CPU_RESETN;
assign clk = CLK100MHZ;
assign myClk=BTNC;


wire [6:0] Seg;
wire [3:0] digits[0:7];


sequenceDetector_Woverlap  sd1(.clk(myClk),.reset(reset_n),.in_bit(SW[0]),.detected(out));

assign disp={1'b0,1'b0,1'b0,out};

assign digits[0] = out;
assign digits[1] = 4'b0000;
assign digits[2] = 4'b0000;
assign digits[3] = 4'b0000;
assign digits[4] = 4'b0000;
assign digits[5] = 4'b0000;
assign digits[6] = 4'b0000;
assign digits[7] = 4'b0000;



sev_seg_controller ssc(
    .clk(clk),
    .resetn(reset_n),
    .digits(digits),
    .Seg(Seg),
    .AN(AN)
);


assign CA = Seg[0];
assign CB = Seg[1];
assign CC = Seg[2];
assign CD = Seg[3];
assign CE = Seg[4];
assign CF = Seg[5];
assign CG = Seg[6];
assign DP = 1'b1; // turn off the dot point on seven segs


endmodule : sev_seg_top