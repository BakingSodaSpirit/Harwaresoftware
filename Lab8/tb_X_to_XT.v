`timescale 1ns / 1ps

module tb_X_to_XT #(parameter m =3, n =2)();

reg [16*m*n-1:0] X;
wire [16*n*m-1:0] XT;

X_to_XT #(m,n) test (X, XT);

initial begin     
        X = 0;  #100;
        X = {16'd9,16'd7,16'd5,16'd1,16'd3,16'd6};      
end

endmodule