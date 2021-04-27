`timescale 1ns / 1ps

module tb_X_multiply_theta #(parameter m =3, n= 2)();

reg [16*m*n-1:0] X;
reg [16*n-1:0] theta;
wire [32*m-1:0] X_theta;

X_multiply_theta #(m,n) test (X, theta, X_theta);

initial begin
        
        X = 0;  theta = 0;  #100;
        X = {16'd1,16'd2,16'd3,16'd4,16'd5,16'd6}; theta = {16'd1,16'd2}; #100;
        X = {16'd1,16'd2,16'd3,16'd4,16'd5,16'd6}; theta = {16'd1,-16'd2};
end

endmodule
