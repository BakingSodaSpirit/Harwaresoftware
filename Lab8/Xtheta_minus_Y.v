`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/21/2021 11:08:49 AM
// Design Name: 
// Module Name: Xtheta_minus_Y
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


module Xtheta_minus_Y#(parameter m=20)
(
    input[32*m-1:0] X_theta,
    input[32*m-1:0] Y,
    output reg [32*m-1:0] Xtheta_Y
    );
reg signed [31:0]theta_tmp;
reg signed [31:0]Y_tmp;
reg signed [31:0]tmp;
integer i;

always@(*)begin

for(i=0;i<m;i=i+1)begin
    tmp=0;
    theta_tmp=X_theta[32*m-1-32*i -:32];
    Y_tmp=Y[32*m-1-32*i -:32];
    tmp=theta_tmp- Y_tmp;
    Xtheta_Y[32*m-1-32*i -:32] = tmp;
end
end
endmodule
