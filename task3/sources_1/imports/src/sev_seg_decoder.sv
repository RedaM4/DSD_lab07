module seven_seg_decoder(
    input   [3:0] bin,      // 4-bit binary input (0–F)
    output  [6:0] seg       // 7-bit output for segments a-g
);

// Add your code here -----------------------------------
assign seg[6] = (   (~bin[3]&~bin[2]&~bin[1]) | (~bin[1]&bin[2]&bin[3]) | (~bin[3]&bin[2]&bin[1]&bin[0])  );
assign seg[5] = (   (bin[1]&~bin[3]&~bin[2])  | (bin[1]&bin[0]&~bin[3]) | (bin[0]&~bin[3]&~bin[2])  );
assign seg[4] = (   (~bin[3]&bin[0])  |  (~bin[1]&~bin[3]&bin[2])  |  (~bin[2]&~bin[1]&bin[0])  );
assign seg[3] = (   (~bin[3]&~bin[2]&~bin[1]&bin[0])  |  (~bin[3]&bin[2]&~bin[1]&~bin[0])  |  (bin[3]&~bin[2]&bin[1]&~bin[0])  |  (bin[2]&bin[1]&bin[0])  );
assign seg[2] = (   (bin[1]&~bin[0]&~bin[3]&~bin[2])  |  (bin[1]&bin[2]&bin[3])  |  (~bin[0]&bin[3]&bin[2])  );
assign seg[1] = (   (~bin[0]&bin[1]&bin[2])     |       (~bin[0]&bin[3]&bin[2])     |   (bin[1]&bin[2]&bin[3]) | (~bin[1]&bin[0]&~bin[3]&bin[2])  );
assign seg[0] = (   (~bin[1]&bin[0]&~bin[3]&~bin[2])  |   (~bin[1]&~bin[0]&~bin[3]&bin[2])    );


// Add your code here -----------------------------------

endmodule
