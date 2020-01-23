module my_xor_bench;

reg a, b;
wire out;

my_xor test_xor(out, a, b);

initial begin
	a = 1'b0;
	b = 1'b0;
	#100 a = 1'b1;
	#100 a = 1'b0; b = 1'b1;
	#100 a = 1'b1;
end
initial #400 $finish;
initial begin
	$monitor("A: %b B: %b and Result: %b", a, b, out);
end
endmodule