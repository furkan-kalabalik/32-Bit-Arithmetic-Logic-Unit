module mux_4x1(S0,S1, I0, I1, I2, I3, R);
input S0,S1, I0, I1, I2, I3;
output R;
wire S0_inv, S1_inv, select0, select1, select2, select3;
not(S0_inv, S0);
not(S1_inv, S1);
and(select0, I0, S0_inv, S1_inv);
and(select1, I1, S0, S1_inv);
and(select2, I2, S0_inv, S1);
and(select3, I3, S0, S1);
or(R, select0, select1, select2, select3);
endmodule