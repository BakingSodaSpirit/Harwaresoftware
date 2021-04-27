`timescale 1ns / 1ps

module tb_gradient_calc #(parameter m =3, n= 2)();

reg  [16*m*n-1:0] X;
reg  [32*m-1:0] Y;
reg  [16*n-1:0] theta;
wire [32*n-1:0] gradient_vector;

gradient_calc #(m,n) test (X, Y, theta, gradient_vector);

initial begin     
        X = 0;  Y = 0; theta = 0; #100;
        X = {16'd1,16'd2,16'd3,16'd4,16'd5,16'd6}; Y = {32'd10,32'd20,32'd25}; theta = {16'd10,-16'd3};  
end

endmodule
