`timescale 1ns/1ps
module ripple_carry_adder(
	input wire [3:0] a,
	input wire [3:0] b,
	input wire cin,
	output wire[3:0] sum,
	output wire cout
);
	wire c1,c2,c3;
	
	full_adder fa0(
		.a(a[0]), .b(b[0]), .cin(cin), .sum(sum[0]), .carry(c1)
	);
	
	full_adder fa1(
		.a(a[1]), .b(b[1]), .cin(c1), .sum(sum[1]), .carry(c2)
	);	
	
	full_adder fa2(
		.a(a[2]), .b(b[2]), .cin(c2), .sum(sum[2]), .carry(c3)
	);
	
	full_adder fa3(
		.a(a[3]), .b(b[3]), .cin(c3), .sum(sum[3]), .carry(cout)
	);
	
endmodule