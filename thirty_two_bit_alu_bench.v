module thirty_two_bit_alu_bench;

reg [31:0] a;
reg [31:0] b;
reg [2:0] op;
reg Cin, less;
wire [31:0] R;
wire Cout, V;

thirty_two_bit_alu test_alu(a, b, Cin, less, op, R, Cout, V);

initial begin
//AND
a = 32'b10101010101010101010101010101010;
b = 32'b01010101010101010101010101010101;
op = 3'b000;
less = 1'b0;
Cin = op[2];
#100 a = 32'b00000000000000001111111111111111; b = 32'b11111111111111110000000000000000;
//OR
#100 op = 3'b001;
less = 1'b0;
Cin = op[2];
a = 32'b10101010101010101010101010101010;
b = 32'b01010101010101010101010101010101;
#100 a = 32'b00000000000000001111111111111111; b = 32'b11111111111111110000000000000000;
//ADD
#100 op = 3'b010;
less = 1'b0;
Cin = op[2];
a = 32'b10101010101010101010101010101010;
b = 32'b01010101010101010101010101010101;
#100 a = 32'b00000000000000001111111111111111; b = 32'b11111111111111110000000000000000;
//SUBS
#100 op = 3'b110;
less = 1'b0;
Cin = op[2];
a = 32'b10101010101010101010101010101010;
b = 32'b01010101010101010101010101010101;
#100 a = 32'b00000000000000001111111111111111; b = 32'b11111111111111110000000000000000;
//SET-ON-LESS-THAN
#100 op = 3'b111;
less = 1'b0;
Cin = op[2];
a = 32'b10101010101010101010101010101010;
b = 32'b01010101010101010101010101010101;
#100 a = 32'b00000000000000001111111111111111; b = 32'b0000000000000000000000000001111;
end
initial #1200 $finish;
initial begin
	$monitor("OPCODE: %b%b%b\nA: %b%b%b%b%b%b%b%b%b%b%b%b%b%b%b%b%b%b%b%b%b%b%b%b%b%b%b%b%b%b%b%b\nB: %b%b%b%b%b%b%b%b%b%b%b%b%b%b%b%b%b%b%b%b%b%b%b%b%b%b%b%b%b%b%b%b\nResult: %b%b%b%b%b%b%b%b%b%b%b%b%b%b%b%b%b%b%b%b%b%b%b%b%b%b%b%b%b%b%b%b, Cout: %b V: %b", op[2],op[1],op[0],
	a[31],a[30],a[29], a[28],a[27],a[26],a[25], a[24],a[23],a[22],a[21], a[20],a[19],a[18],a[17], a[16],a[15],a[14],a[13], a[12],a[11],a[10],a[9], a[8],a[7],a[6],a[5], a[4],a[3],a[2],a[1], a[0],
	b[31],b[30],b[29], b[28],b[27],b[26],b[25], b[24],b[23],b[22],b[21], b[20],b[19],b[18],b[17], b[16],b[15],b[14],b[13], b[12],b[11],b[10],b[9], b[8],b[7],b[6],b[5], b[4],b[3],b[2],b[1], b[0],
	R[31],R[30],R[29], R[28],R[27],R[26],R[25], R[24],R[23],R[22],R[21], R[20],R[19],R[18],R[17], R[16],R[15],R[14],R[13], R[12],R[11],R[10],R[9], R[8],R[7],R[6],R[5], R[4],R[3],R[2],R[1], R[0], Cout, V);
	#1200 $finish;
end
endmodule
