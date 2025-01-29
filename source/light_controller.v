`timescale 1ns / 1ps

// ECE 6213
// Victor Nin
// Tail Light Controller
// Project 2

module light_controller (
    input wire clk,              // 100 MHz clock signal
    input wire rst_n,            // active-low asynchronous reset
    input wire brake,            // signal from brake pedal
    input wire turn_right,       // signal from right turn indicator
    input wire turn_left,        // signal from left turn indicator
    output reg [2:0] right_taillight_control,  // signal to turn on right taillight bulbs
    output reg [2:0] left_taillight_control    // signal to turn on left taillight bulbs
);

    reg [2:0] counter_clk;        // count the 5 cycles (0-4)
    reg [2:0] state;              // track current state
    reg [2:0] state_count_next;   // track next state

    // State encoding for the turn left/right sequence: {001}, {011}, {111}, {000}
    localparam S0 = 3'b001;
    localparam S1 = 3'b011;
    localparam S2 = 3'b111;
    localparam S3 = 3'b000;

    // State encoding for the brake and right turn sequence: {111}, {110}, {100}, {000}
    localparam BRAKE_S0 = 3'b111;
    localparam BRAKE_S1 = 3'b110;
    localparam BRAKE_S2 = 3'b100;
    localparam BRAKE_S3 = 3'b000;

    reg [2:0] prev_inputs;        // Store previous inputs (turn signals and brake) to detect mode change
    wire [2:0] current_inputs;    // Current input combination

    assign current_inputs = {brake, turn_right, turn_left}; // Combine inputs for easier comparison

    // Sequential logic for state transitions and counting clock cycles
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            counter_clk <= 3'b000;
            state <= S0;           // Start with the first state
            prev_inputs <= 3'b000;  // Reset stored inputs
        end
        else begin
            // Check if there is a mode change (inputs have changed)
            if (current_inputs != prev_inputs) begin
                if (brake) begin
                    state <= BRAKE_S0; // Go to brake state if brake is activated
                end
                else begin
                    state <= S0;       // Restart to turn left/right state if inputs changed
                end
                counter_clk <= 3'b000; // Reset clock counter
            end
            else if (counter_clk == 3'b101) begin // After 5 cycles (counter_clk counts 0 to 4)
                counter_clk <= 3'b000;           // Reset the counter
                state <= state_count_next;       // Move to the next state
            end
            else begin
                counter_clk <= counter_clk + 1;  // Increment the counter
            end
            prev_inputs <= current_inputs;       // Update stored inputs
        end
    end

    // Combinational logic for determining the next state based on mode
    always @(*) begin
        if (brake) begin
             if (turn_right || turn_left) begin
            case (state)
                BRAKE_S0: state_count_next = BRAKE_S1;
                BRAKE_S1: state_count_next = BRAKE_S2;
                BRAKE_S2: state_count_next = BRAKE_S3;
                BRAKE_S3: state_count_next = BRAKE_S0;
                default: state_count_next = BRAKE_S0;
            endcase
        end
        else begin
                state_count_next = BRAKE_S0; // Stay at {111}
            end
        end
        else if (turn_left && !turn_right) begin
            case (state)
                S0: state_count_next = S1;
                S1: state_count_next = S2;
                S2: state_count_next = S3;
                S3: state_count_next = S0;
                default: state_count_next = S0;
            endcase
        end
        else if (turn_right && !turn_left) begin
            case (state)
                S0: state_count_next = S1;
                S1: state_count_next = S2;
                S2: state_count_next = S3;
                S3: state_count_next = S0;
                default: state_count_next = S0;
            endcase
        end
        else begin
            state_count_next = S0; // Default state if no signal is active
        end
    end

    // Combinational logic for taillight control
    always @(*) begin
        // Default state: turn off all taillights
        right_taillight_control = 3'b000;
        left_taillight_control = 3'b000;

        if (brake && turn_right && !turn_left) begin
            left_taillight_control = 3'b111; // Full left taillight on
            case (state)
                BRAKE_S0: right_taillight_control = 3'b110; // Right sequence for braking
                BRAKE_S1: right_taillight_control = 3'b100;
                BRAKE_S2: right_taillight_control = 3'b000;
                BRAKE_S3: right_taillight_control = 3'b111; // Turn off all lights
            endcase
        end
        else if (brake && turn_left && !turn_right) begin
            right_taillight_control = 3'b111; // Full right taillight on
            case (state)
                BRAKE_S0: left_taillight_control = 3'b110;
                BRAKE_S1: left_taillight_control = 3'b100;
                BRAKE_S2: left_taillight_control = 3'b000;
                BRAKE_S3: left_taillight_control = 3'b111; // Turn off all lights
            endcase
        end
        else if (brake && !turn_left && !turn_right) begin
            right_taillight_control = 3'b111;
            left_taillight_control = 3'b111; // All lights on when only brake is active
        end
        else if (turn_left && !turn_right) begin
            case (state)
                S0: left_taillight_control = 3'b001;
                S1: left_taillight_control = 3'b011;
                S2: left_taillight_control = 3'b111;
                S3: left_taillight_control = 3'b000;
                default: left_taillight_control = 3'b000;
            endcase
        end
        else if (turn_right && !turn_left) begin
            case (state)
                S0: right_taillight_control = 3'b001;
                S1: right_taillight_control = 3'b011;
                S2: right_taillight_control = 3'b111;
                S3: right_taillight_control = 3'b000;
                default: right_taillight_control = 3'b000;
            endcase
        end
    end
endmodule
