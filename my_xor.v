module my_xor(out, a, b);
input a, b;
output out;
wire a_inv, b_inv, res1, res2;
not(a_inv, a);
not(b_inv, b);
and(res1, a, b_inv);
and(res2, b, a_inv);
or(out, res1, res2);
endmodule