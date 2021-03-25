`timescale 1ns / 1ps

module FIR_filter(
    input clk,
    input rst_n,
    input signed [15:0] data_in,
    output reg signed [31:0] data_out
    );
    wire signed [15:0] H0,H1,H2,H3,H4,H5,H6,H7,H8,H9,H10,H11,H12,H13,H14,H15,H16,H17,H18,H19,H20,H21,H22,H23,H24,H25,H26;
    wire signed [31:0] CM0,CM1,CM2,CM3,CM4,CM5,CM6,CM7,CM8,CM9,CM10,CM11,CM12,CM13,CM14,CM15,CM16,CM17,CM18,CM19,CM20,CM21,CM22,CM23,CM24,CM25,CM26,
                       addo1,addo2,addo3,addo4,addo5,addo6,addo7,addo8,addo9,addo10,addo11,addo12,addo13,addo14,addo15,addo16,addo17,addo18,addo19,addo20,
                       addo21,addo22,addo23,addo24,addo25,addo26;
    wire signed [31:0] Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q8,Q9,Q10,Q11,Q12,Q13,Q14,Q15,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26;
    //filter coefficient 
    assign H0= -255;
    assign H1= -260;
    assign H2= -312;
    assign H3= -288;
    assign H4= -144;
    assign H5= 153;
    assign H6= 616;
    assign H7= 1233;
    assign H8= 1963;
    assign H9= 2739;
    assign H10= 3474;
    assign H11= 4081;
    assign H12= 4481;
    assign H13= 4620;
    assign H14= 4481;
    assign H15= 4081;
    assign H16= 3474;
    assign H17= 2739;
    assign H18= 1963;
    assign H19= 1233;
    assign H20= 616;
    assign H21= 153;
    assign H22= -144;
    assign H23= -288;
    assign H24= -312;
    assign H25= -260;
    assign H26= -255;
    
    //Constant multiplication
    assign CM26= H26 * data_in;
    assign CM25= H25 * data_in;
    assign CM24= H24 * data_in;
    assign CM23= H23 * data_in;
    assign CM22= H22 * data_in;
    assign CM21= H21 * data_in;
    assign CM20= H20 * data_in;
    assign CM19= H19 * data_in;
    assign CM18= H18 * data_in;
    assign CM17= H17 * data_in;
    assign CM16= H16 * data_in;
    assign CM15= H15 * data_in;
    assign CM14= H14 * data_in;
    assign CM13= H13 * data_in;
    assign CM12= H12 * data_in;
    assign CM11= H11 * data_in;
    assign CM10= H10 * data_in;
    assign CM9= H9 * data_in;
    assign CM8= H8 * data_in;
    assign CM7= H7 * data_in;
    assign CM6= H6 * data_in;
    assign CM5= H5 * data_in;
    assign CM4= H4 * data_in;
    assign CM3= H3 * data_in;
    assign CM2= H2 * data_in;
    assign CM1= H1 * data_in;
    assign CM0= H0 * data_in;
    
    //adding the terms
    assign addo1 = Q1 + CM25;
    assign addo2 = Q2 + CM24;
    assign addo3 = Q3 + CM23;
    assign addo4 = Q4 + CM22;
    assign addo5 = Q5 + CM21;
    assign addo6 = Q6 + CM20;
    assign addo7 = Q7 + CM19;
    assign addo8 = Q8 + CM18;
    assign addo9 = Q9 + CM17;
    assign addo10 = Q10 + CM16;
    assign addo11 = Q11 + CM15;
    assign addo12 = Q12 + CM14;
    assign addo13 = Q13 + CM13;
    assign addo14 = Q14 + CM12;
    assign addo15 = Q15 + CM11;
    assign addo16 = Q16 + CM10;
    assign addo17 = Q17 + CM9;
    assign addo18 = Q18 + CM8;
    assign addo19 = Q19 + CM7;
    assign addo20 = Q20 + CM6;
    assign addo21 = Q21 + CM5;
    assign addo22 = Q22 + CM4;
    assign addo23 = Q23 + CM3;
    assign addo24 = Q24 + CM2;
    assign addo25 = Q25 + CM1;
    assign addo26 = Q26 + CM0;
    
    //FF for each step
    DFF dff1 (.clk(clk),.D(CM26),.Q(Q1));
    DFF dff2 (.clk(clk),.D(addo1),.Q(Q2));
    DFF dff3 (.clk(clk),.D(addo2),.Q(Q3));
    DFF dff4 (.clk(clk),.D(addo3),.Q(Q4));
    DFF dff5 (.clk(clk),.D(addo4),.Q(Q5));
    DFF dff6 (.clk(clk),.D(addo5),.Q(Q6));
    DFF dff7 (.clk(clk),.D(addo6),.Q(Q7));
    DFF dff8 (.clk(clk),.D(addo7),.Q(Q8));
    DFF dff9 (.clk(clk),.D(addo8),.Q(Q9));
    DFF dff10 (.clk(clk),.D(addo9),.Q(Q10));
    DFF dff11 (.clk(clk),.D(addo10),.Q(Q11));
    DFF dff12 (.clk(clk),.D(addo11),.Q(Q12));
    DFF dff13 (.clk(clk),.D(addo12),.Q(Q13));
    DFF dff14 (.clk(clk),.D(addo13),.Q(Q14));
    DFF dff15 (.clk(clk),.D(addo14),.Q(Q15));
    DFF dff16 (.clk(clk),.D(addo15),.Q(Q16));
    DFF dff17 (.clk(clk),.D(addo16),.Q(Q17));
    DFF dff18 (.clk(clk),.D(addo17),.Q(Q18));
    DFF dff19 (.clk(clk),.D(addo18),.Q(Q19));
    DFF dff20 (.clk(clk),.D(addo19),.Q(Q20));
    DFF dff21 (.clk(clk),.D(addo20),.Q(Q21));
    DFF dff22 (.clk(clk),.D(addo21),.Q(Q22));
    DFF dff23 (.clk(clk),.D(addo22),.Q(Q23));
    DFF dff24 (.clk(clk),.D(addo23),.Q(Q24));
    DFF dff25 (.clk(clk),.D(addo24),.Q(Q25));
    DFF dff26 (.clk(clk),.D(addo25),.Q(Q26));
    
 always@ (posedge clk)
        data_out <= addo26; 
endmodule

//D filp flop
module DFF(
        input clk,
        input rst_n,
        input [31:0] D,
        output reg [31:0] Q
        );
    
    always@ (posedge clk)begin
        if(rst_n==1)
            begin
                Q = 0;
            end
        else
            begin
                Q = D;
            end
   end    
endmodule