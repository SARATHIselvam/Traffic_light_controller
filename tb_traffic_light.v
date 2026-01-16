module tb_traffic_light;

    reg clk, rst;
    wire A_R, A_Y, A_G;
    wire B_R, B_Y, B_G;

    trafficlightcontroller dut(
        .clk(clk), .rst(rst),
        .A_R(A_R), .A_Y(A_Y), .A_G(A_G),
        .B_R(B_R), .B_Y(B_Y), .B_G(B_G)
    );

    always #5 clk = ~clk;

    initial begin
        clk = 0;
        rst = 1;
        #20 rst = 0;

        #500 $finish;
    end

endmodule

