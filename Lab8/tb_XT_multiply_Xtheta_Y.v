`timescale 1ns / 1ps

module tb_XT_multiply_Xtheta_Y #(parameter m =3, n= 2)();

reg [16*n*m-1:0] XT;
reg [32*m-1:0] Xtheta_Y;
wire [32*n-1:0] gradient_vector;

XT_multiply_Xtheta_Y #(m,n) test (XT, Xtheta_Y, gradient_vector);

initial begin
        
        XT = 0;  Xtheta_Y = 0;  #100;
        XT = {16'd1,16'd2,16'd3,16'd4,16'd5,16'd6}; Xtheta_Y = {32'd1,32'd2,32'd3}; #100;
        XT = {16'd1,16'd2,16'd3,16'd4,16'd5,16'd6}; Xtheta_Y = {32'd1,-32'd2,-32'd3};
end

endmodule
