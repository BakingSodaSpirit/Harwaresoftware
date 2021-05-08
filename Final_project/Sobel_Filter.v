`timescale 1ns / 1ps

module Sobel_Filter(
 input clk,
 input en,
 input [31:0] stream_input,
 output [31:0] stream_output
    );
    
    parameter PixPerLine = 695;    
    reg signed[31:0] x[2*PixPerLine+2:0];
    reg signed[31:0] y[2*PixPerLine+2:0];
    reg signed[31:0] acc_X;
    reg signed[31:0] acc_Y;
    reg signed [31:0] abs_acc_X;
    reg signed [31:0] abs_acc_Y;
    integer i;   
    
    
    always@(posedge clk) begin
        if(en)begin    
            x[0] <= $signed(stream_input);
            y[0] <= $signed(stream_input);
    
            for(i=0; i<2*PixPerLine+2; i=i+1) begin
                x[i+1]<= x[i];
                y[i+1]<= y[i];
            end
       
            acc_X <= x[0]-x[2] + 2*(x[PixPerLine]-x[PixPerLine+2]) + x[2*PixPerLine]-x[2*PixPerLine+2];
            acc_Y <= -x[0]-2*x[1]-x[2]+x[2*PixPerLine]+2*x[2*PixPerLine+1]+x[2*PixPerLine+2];
        end
    end 
       
    always@(posedge clk)begin
        if(acc_X < 0) begin
            abs_acc_X = ~acc_X+1;        
        end
        else begin
            abs_acc_X = acc_X;
        end
        
        if(acc_Y < 0) begin
            abs_acc_Y = ~acc_Y+1;        
        end
        else begin
            abs_acc_Y = acc_Y;
        end  
    end
    
    assign stream_output = abs_acc_X + abs_acc_Y;
endmodule