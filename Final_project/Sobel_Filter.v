`timescale 1ns / 1ps

module Sobel_Filter(
    input clk,
    input en,
    input[31:0] stream_input,
    output[31:0] stream_output
    );
    parameter PixPerLine = 695;
    reg signed [31:0] x[2*PixPerLine+3:0]; //Buffer
    reg signed [31:0] acc_X;
    reg signed [31:0] acc_Y;
    reg signed [31:0] abs_acc_X;
    reg signed [31:0] abs_acc_Y;
    reg signed [31:0] acc_X_out;
    reg signed [31:0] acc_Y_out;
    reg signed [31:0] register_stream_out;
    integer j; //counter for shifiting operation
    assign stream_output= register_stream_out; //assigned to register output
    
 always @ (posedge clk) begin
    if (en == 1) begin
        acc_X <= x[0]-x[2]+(x[PixPerLine]-x[PixPerLine+2])*2+x[2*PixPerLine]-x[2*PixPerLine+2];//filterX calcuation
        acc_Y <= x[0]+x[2]-x[PixPerLine*2]-x[2+PixPerLine*2]+ 2*(x[1]-x[1+2*PixPerLine]);//filterY calcuation
        acc_X_out <= acc_X/8+128; //range 0-255
        acc_Y_out <= acc_Y/8+128; //range 0-255
        abs_acc_X <= (acc_X_out[31]? ~acc_X_out+1 : acc_X_out); //find the absolute value of X
        abs_acc_Y <= (acc_Y_out[31]? ~acc_Y_out+1 : acc_Y_out); //find the absolute value of Y
        register_stream_out <= acc_X_out+acc_Y_out;
        end
    else
        begin
        register_stream_out <= 255;
        end
    
    //shifter operation
    for(j=1; j<(2*PixPerLine+3); j=j+1)begin
         x[j] <= x[j-1]; //shift to the left
    end
    x[0] <= stream_input; // New data to buffer
   end
endmodule
