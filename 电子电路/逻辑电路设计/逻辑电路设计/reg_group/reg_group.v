module reg_group(clk,we,raa,rwba,i,s,d);
	input clk,we;
	input [1:0]raa;
	input [1:0]rwba;
	input [7:0]i;
	output reg [7:0]s;
	output reg [7:0]d;
	reg [7:0]a;
	reg [7:0]b;
	reg [7:0]c;
	initial c[7:0]=8'b01100000;
	//
	always@(raa or rwba)
	begin
		if(raa==2'b00) s<=a;
		else if(raa==2'b01) s<=b;
		else  s<=c;
		if(rwba==2'b00) d<=a;
		else if(rwba==2'b01) d<=b;
		else  d<=c;
	end
	//
	always@(negedge clk)
	begin
		if(!we)
		begin
			if(rwba==2'b00) a<=i;
			else if(rwba==2'b01) b<=i;
			else  c<=i;
		end
	end
endmodule