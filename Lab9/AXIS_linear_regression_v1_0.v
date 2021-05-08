
`timescale 1 ns / 1 ps

	module AXIS_linear_regression_v1_0 #
		(
		
		// Users to add parameters here
        parameter M = 20,   //New Line
        parameter N = 3,    //New Line

		// User parameters ends
		// Do not modify the parameters beyond this line
		
		// Parameters of Axi Slave Bus Interface S00_AXIS
		parameter integer C_S00_AXIS_TDATA_WIDTH	= 32,

		// Parameters of Axi Master Bus Interface M00_AXIS
		parameter integer C_M00_AXIS_TDATA_WIDTH	= 32,
		parameter integer C_M00_AXIS_START_COUNT	= 32
	)
	(
	
		// Users to add ports here
		//input wire prepare_data_done,
		// User ports ends

		input wire  s00_axis_aclk,
		input wire  s00_axis_aresetn,
		output wire  s00_axis_tready,
		input wire [C_S00_AXIS_TDATA_WIDTH-1 : 0] s00_axis_tdata,
		input wire  s00_axis_tlast,
		input wire  s00_axis_tvalid,

		// Ports of Axi Master Bus Interface M00_AXIS
		input wire  m00_axis_aclk,
		input wire  m00_axis_aresetn,
		output wire  m00_axis_tvalid,
		output wire [C_M00_AXIS_TDATA_WIDTH-1 : 0] m00_axis_tdata,
		output wire  m00_axis_tlast,
		input wire  m00_axis_tready
	);
	integer i=0; //New Line
    integer j=0; //New Line
    integer t=0; //New Line
    integer w=0; //New Line
    integer count=0; //New Line
    
    reg s00_axis_tready_reg;
	reg m00_axis_tvalid_reg;
	reg m00_axis_tlast_reg;
	reg [C_M00_AXIS_TDATA_WIDTH-1 : 0] m00_axis_tdata_reg;
	wire [C_M00_AXIS_TDATA_WIDTH-1 : 0] data_out;
    wire [32*N-1:0] gradient_vector;

    reg [16*20*3-1:0] X;
    reg [32*20-1:0] Y;
    reg [16*3-1:0] theta;
    reg temp1_tlast = 0;
	reg temp2_tlast = 0;
	reg temp3_tlast = 0;
	reg temp1_valid = 0;
	reg temp2_valid = 0;
	reg temp3_valid = 0;
	reg prepare_data_done = 0;

    assign m00_axis_tvalid = m00_axis_tvalid_reg;
    assign m00_axis_tlast = m00_axis_tlast_reg;
    assign m00_axis_tdata = m00_axis_tdata_reg;
    assign s00_axis_tready = s00_axis_tready_reg;
   
    
    gradient_calc #(20,3) gradient (X,Y,theta,gradient_vector);

   
   //----------------------------------------------------------------------------
   //Newpart
   always @(posedge s00_axis_aclk)begin
   //Reset
        if(s00_axis_aresetn==0)begin
            i=0;
            j=0;
            t=0;
            count=0;
        end
        else begin
            s00_axis_tready_reg <= m00_axis_tready;
           //reset prepare_Data_done after w=3
            if (w == 2)begin
               prepare_data_done <= 0;
               i <= 0;
               j <= 0;
               t <= 0;
               count <= 0;
            end
            
            else if(s00_axis_tvalid & s00_axis_tready_reg) begin
          //give ready signal
                if(count==83)begin
                       prepare_data_done <= 1;
                end
                t <= t+1;
          //theta stream
                if (j == 20)begin
                       theta[16*N-1-(16*t) -:16] <= s00_axis_tdata[15:0];
                end
          //x stream
                if(j < M) begin //Column
                       if(t < N)begin   //Row
                            X[16*M*N-1-16*t-16*N*j -:16] <= s00_axis_tdata;
                       end
          //Y stream
                       if(t == 3) begin
                       Y[32*M-1-(32*j) -:32] <= s00_axis_tdata;
                       t <= 0;
                       j <= j+1;
                       end
                end
                count <= count+1;
            end
     end
end
        
    
	always @(posedge m00_axis_aclk)begin
	//reset
	    if (m00_axis_aresetn==0)begin
	        m00_axis_tvalid_reg <= 0;
            m00_axis_tlast_reg <= 0;
            m00_axis_tdata_reg <= 0;
            w <= 0;
        end 
        else begin
        //Three clock cycle delay for valid
            temp1_valid <= s00_axis_tvalid;
            temp2_valid <= temp1_valid;
            temp3_valid <= temp2_valid;
            m00_axis_tvalid_reg <= temp3_valid;
       
       //Three clock cycle delay for last
            temp1_tlast <= s00_axis_tlast;
            temp2_tlast <= temp1_tlast;
            temp3_tlast <= temp2_tlast;
            m00_axis_tlast_reg <= temp3_tlast;
      //Stream to master data
            if (m00_axis_tready & prepare_data_done== 1) begin
                m00_axis_tdata_reg <= gradient_vector[32*N-1-32*w -:32];
                w <= w+1;
                if(w == 2) begin
                   w <= 0;
                end
            end
      end
end
endmodule