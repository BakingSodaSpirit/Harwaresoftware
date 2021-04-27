`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/21/2021 11:26:11 AM
// Design Name: 
// Module Name: X_to_XT
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


module X_to_XT#(parameter m=20, n=3)
(
    input [16*m*n-1:0] X,
    output reg [16*n*m-1:0] XT
    );

integer i,j;   
//reg signed [15:0] X_tmp;
//reg signed [15:0] tmp;

always@(*)begin
for (i=0;i<m;i=i+1)begin
    for(j=0; j<n; j=j+1)begin
        XT[16*(n-j)*m-1-16*i -:16] =X[16*(m-i)*n-1-16*j -:16];
    end
end
end
  
endmodule
