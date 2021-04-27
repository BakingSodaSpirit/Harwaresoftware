`timescale 1ns / 1ps

module tb_Xtheta_minus_Y #(parameter m =3)();

reg [32*m-1:0] X_theta;
reg [32*m-1:0] Y;
wire [32*m-1:0] Xtheta_Y;

Xtheta_minus_Y #(m) test (X_theta, Y, Xtheta_Y);

initial begin     
        X_theta = 0;  Y = 0;  #100;
        X_theta = {32'd9,32'd7,32'd5}; Y = {32'd1,32'd2,32'd3}; #100;
        X_theta = {32'd4,-32'd7,32'd5}; Y = {-32'd1,32'd2,32'd8}; //[4,-7,5] - [-1,2,8] = [5,-9,-3]
end

endmodule
