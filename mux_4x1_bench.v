module mux_4x1_bench;

reg S0,S1, I0, I1, I2, I3;
wire R;

mux_4x1 test(S0,S1, I0, I1, I2, I3, R);

initial begin
//Desined to select always 1.
S0 = 1'b0;
S1 = 1'b0;
I0 = 1'b1;
I1 = 1'b0;
I2 = 1'b0;
I3 = 1'b0;
#100 S0 = 1'b1;
I0 = 1'b0;
I1 = 1'b1;
I2 = 1'b0;
I3 = 1'b0;
#100 S1 = 1'b1; S0 = 1'b0;
I0 = 1'b0;
I1 = 1'b0;
I2 = 1'b1;
I3 = 1'b0;
#100 S0 = 1'b1;
I0 = 1'b0;
I1 = 1'b0;
I2 = 1'b0;
I3 = 1'b1;
//Let's select 0
#100 S0 = 1'b0;
end
initial #500 $finish;
initial begin
	$monitor("Select Bits: %b%b and Result: %b", S1, S0, R);
end
endmodule