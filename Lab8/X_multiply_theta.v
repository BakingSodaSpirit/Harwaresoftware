module X_multiply_theta#(parameter m=20, n=3)
(
    input[16*m*n-1:0]X,
    input[16*n-1:0] theta,
    output reg [32*m-1:0] X_theta
    );
    
 reg signed [15:0] X_tmp;
 reg signed [15:0] theta_tmp;
 reg signed [31:0] tmp;
 integer i,j;
 
 always@(*)begin
 
 for (i=0;i<m;i=i+1)begin
    tmp=0;
    for(j=0;j<n;j=j+1)begin
    X_tmp=X[16*(m-i)*n-1-16*j -:16];
    theta_tmp=theta[16*n-1-16*j -:16];
    tmp= tmp+X_tmp*theta_tmp;
    end
    X_theta[32*m-1-32*i -:32] = tmp;
end
end

endmodule
