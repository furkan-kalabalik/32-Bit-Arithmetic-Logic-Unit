module one_bit_alu_msb(a, b, Cin, less, op, R, Cout, V, set);
input [2:0] op;
input a, b, Cin, less;
output R, Cout, V, set;
wire xor_res, first_or, first_and, first_not, second_and, second_not, fourth_and;
my_xor invert(xor_res, b, op[2]);
or(first_or, a, xor_res);
and(first_and, a, xor_res);
not(first_not, first_and);
and(second_and, first_or,first_not);
and(third_and, second_and, Cin);
or(second_or, second_and, Cin);
not(second_not, third_and);
and(fourth_and, second_not, second_or);
or(Cout, third_and, first_and);
my_xor v_xor(V, Cin, Cout);
my_xor set_xor(set, V, fourth_and);
mux_4x1 select(op[0], op[1], first_and, first_or, fourth_and, less, R);
endmodule