module tb_TrafficLightController;
    reg clk = 0, rst = 1;
    wire [2:0] lights;

    TrafficLightController uut(.clk(clk), .rst(rst), .lights(lights));
    always #5 clk = ~clk;

    initial begin
        #10 rst = 0;
        #500 $stop;
    end
endmodule
