`timescale 1ns / 1ps

module sim_FIR_filter();

reg clk;
reg rst_n;
reg signed [15:0] data_in;
wire signed [31:0] data_out_1;
wire signed [31:0] data_out;

reg [31:0] data_in_seq[1000:0];
reg [31:0] signal_num;

FIR_filter fir(clk, rst_n, data_in, data_out);

assign data_out_1 = data_out/32767;

always
begin
	clk = 1; #5; clk = 0; #5;
end

initial
begin
		$readmemh("C:/Users/Huang/Dropbox/ELEC_4511_Hardware_Software/Lab6/hex_signal.txt", data_in_seq);
		signal_num = 0;
		rst_n = 0;
		#20;
		rst_n = 1;
end		

always @(posedge clk)
	begin
	   data_in = data_in_seq[signal_num];
	   signal_num = signal_num + 1;
	   if (signal_num == 1000) begin
		  $stop;
	   end
	end
endmodule
