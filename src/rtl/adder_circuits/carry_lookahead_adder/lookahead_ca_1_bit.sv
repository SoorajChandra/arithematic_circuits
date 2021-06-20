module carry_lookahead_adder(
                                input logic in1,
                                input logic in2,
                                input logic cin,
                                output logic sum,
                                output logic carry,
                                output logic p,
                                output logic g
);

    //generating propagated carry and generated carry for next stage
    assign p = in1 ^ in2;
    assign g = in1 & in2;

    //generating sum and carry for this stage
    assign sum = p ^ cin;
    assign carry = g | (p&cin);

endmodule
