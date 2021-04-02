`timescale 1ns / 1ps

module SobelX(
    input clk,
    input en,
    input[31:0] stream_input,
    output[31:0] stream_output
    );
    parameter PixPerLine = 695;
    reg [31:0] x[2*PixPerLine+3:0]; //Buffer
    reg signed [31:0] acc; 
    reg signed [31:0] y; 
    
    reg [31:0] register_stream_out;
    reg [31:0] j; //counter for shifiting operation
    assign stream_output= register_stream_out; //assigned to register output
    
 always @ (posedge clk) begin
    if (en == 1) begin
        acc <= x[0]-x[2]+(x[695]-x[695+2])*2+x[2*695]-x[2*695+2];//filter calcuation
        y <= acc/8+128; //range 0-255
        register_stream_out <= y;
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
