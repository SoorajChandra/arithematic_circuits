module claa #(parameter ADDER_WIDTH = 8)(
                input logic [ADDER_WIDTH-1:0] in,
                input logic [ADDER_WIDTH-1:0] in,
                input logic cin,
                output logic [ADDER_WIDTH-1:0] sum,
                output logic carry_out
);

    logic [ADDER_WIDTH-1:0] p;
    logic [ADDER_WIDTH-1:0] g;
    logic [ADDER_WIDTH:0] carry;

    //input carry
    assign carry[0] = cin;

    //first stage logic

    assign p[0] = a[0] ^ b[0];
    assign g[0] = a[0] & b[0];

    assign sum[0] = p[0] ^ c[0];
    assign carry[1] = g[0] | (p[0] & carry[0])

    //Adder generating logic
    genvar adder_num;
    generate
        for(adder_num = 1; adder_num < ADDER_WIDTH ; adder_num = adder_num+1) begin
            //generating propagated and generated carry
            assign p[adder_num] = a[adder_num] ^ b[adder_num];
            assign g[adder_num] = a[adder_num] & b[adder_num];
            
            //generating sum and carry for each stage
            assign sum[adder_num] = p[adder_num] ^ c[adder_num];
            assign carry[adder_num+1] = g[adder_num] | (p[adder_num] & c[adder_num]);
        end
    endgenerate

    //Final carry out logic
    assign carry_out = carry[ADDER_WIDTH];

endmodule
