`timescale 1ns / 1ps
module gradient_calc #(parameter m=20, n=3)
    (
        input [16*m*n-1:0] X,
        input [32*m-1:0] Y,
        input [16*n-1:0] theta,
        output [32*n-1:0] gradient_vector
    );
    
    wire [32*m-1:0] X_theta;
    wire [16*n*m-1:0] XT;
    wire [32*m-1:0] Xtheta_Y;
    
    X_multiply_theta #(m,n) m1(X,theta,X_theta);
    
    X_to_XT #(m,n) m2(X,XT);
    
    Xtheta_minus_Y #(m) m3(X_theta,Y,Xtheta_Y);
    
    XT_multiply_Xtheta_Y #(m,n) m4(XT,Xtheta_Y,gradient_vector);
    
endmodule

