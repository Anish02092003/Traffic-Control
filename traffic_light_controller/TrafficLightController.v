module TrafficLightController(
    input clk,
    input rst,
    output reg [2:0] lights // [2]=Red, [1]=Yellow, [0]=Green
);

    typedef enum reg [1:0] {RED, GREEN, YELLOW} state_t;
    state_t current_state, next_state;
    reg [23:0] counter;

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            current_state <= RED;
            counter <= 0;
        end else begin
            if (counter == 24'd9999999) begin
                current_state <= next_state;
                counter <= 0;
            end else begin
                counter <= counter + 1;
            end
        end
    end

    always @(*) begin
        case (current_state)
            RED: begin
                lights = 3'b100;
                next_state = GREEN;
            end
            GREEN: begin
                lights = 3'b001;
                next_state = YELLOW;
            end
            YELLOW: begin
                lights = 3'b010;
                next_state = RED;
            end
        endcase
    end
endmodule
