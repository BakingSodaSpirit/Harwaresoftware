`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/21/2021 12:01:46 PM
// Design Name: 
// Module Name: XT_multiply_Xtheta_Y
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


module XT_multiply_Xtheta_Y#(parameter m=20, n=3)
(
    input [16*n*m-1:0] XT,
    input [32*m-1:0] Xtheta_Y,
    output reg [32*n-1:0] gradient_vector
    );
    
reg signed [15:0]XT_tmp;
reg signed [31:0]Xtheta_Y_tmp;
reg signed [31:0]tmp;
integer i,j;

always@(*)begin

for(j=0;j<n;j=j+1)begin
    tmp=0;
    for(i=0;i<m;i=i+1)begin
        XT_tmp=XT[16*(n-j)*m-1-16*i -:16];
        Xtheta_Y_tmp=Xtheta_Y[32*m-1-32*i -:32];
        tmp=tmp + XT_tmp * Xtheta_Y_tmp;
    end
    gradient_vector[32*n-1-32*j -:32]=tmp;
end
end     
endmodule