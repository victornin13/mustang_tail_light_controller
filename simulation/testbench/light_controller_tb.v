`timescale 1ns/1ps

// ECE 6213
// Victor Nin
// Tail Light Controller Testbench
// Project 2

module light_controller_tb();

// Inputs
reg clk;
reg rst_n;
reg brake;
reg turn_left;
reg turn_right;

// Outputs
wire [2:0] right_taillight_control;
wire [2:0] left_taillight_control;

light_controller tester(
    .clk(clk),
    .rst_n(rst_n),
    .brake(brake),
    .turn_left(turn_left),
    .turn_right(turn_right),
    .right_taillight_control(right_taillight_control),
    .left_taillight_control(left_taillight_control)
);

// Clock generation
always begin
    #5 clk = ~clk;
end

// Testbench stimulus
initial begin
    // Initialization
    clk = 0;
    rst_n = 0;
    brake = 0;
    turn_left = 0;
    turn_right = 0;

    // Apply reset for 10 clock cycles
    repeat(10) @(posedge clk);

    // Deactivate reset
    rst_n = 1;
    $display("Reset deactivated.");

     $monitor("Time: %0t | Right Taillights: %b | Left Taillights: %b", $time, right_taillight_control, left_taillight_control);
    // Wait for 20 clock cycles after reset
    repeat(20) @(posedge clk);

    // 1. Test only turn_left active
    turn_left = 1;
    $display("Turn Left activated.");
    repeat(20) @(posedge clk);
    turn_left = 0; // Turn off
    $display("Turn Left deactivated.");

    // 2. Test only turn_right active
    repeat(20) @(posedge clk);
    turn_right = 1;
    $display("Turn Right activated.");


    repeat(20) @(posedge clk);
    turn_right = 0; // Turn off
    $display("Turn Right deactivated.");

    // 3. Test only brake active
    brake = 1;
    $display("Brake activated.");
    repeat(20) @(posedge clk);

    // 4. Test turn_right and brake active
    turn_right = 1;
    $display("Turn Right and Brake activated.");
    repeat(20) @(posedge clk);
    turn_right = 0; // Turn off
    $display("Turn Right and Brake deactivated.");

    repeat(20) @(posedge clk);
    // 5. Test turn_left and brake active
    turn_left = 1;
    $display("Turn Left and Brake activated.");

    repeat(20) @(posedge clk);
    turn_left = 0; // Turn off
    $display("Turn Left and Brake deactivated.");

    repeat(20) @(posedge clk);
    brake = 0;
    $display("Brake Deactivated.");

    repeat(20) @(posedge clk);
    // 6. Test transition from turn_left to turn_right
    turn_left = 1;
    $display("Turn Left activated.");

    repeat(10) @(posedge clk);
    turn_right = 1; // Activate right turn
    turn_left = 0;  // Turn off left turn
    $display("Transitioning from Turn Left to Turn Right.");


    @(posedge clk); // Wait for the next clock edge

    // Check the output after transition
    if (right_taillight_control !== 3'b001) begin
        $display("ERROR: Right taillight control did not reset to {001} after switching from left to right.");
    end else begin
        $display("SUCCESS: Right taillight control correctly reset to {001} after switching from left to right.");
    end

    // Let the right turn sequence run for a few cycles
    repeat(15) @(posedge clk);
    
    // 7. Clean up
    turn_right = 0;
    $display("Turn Right deactivated.");

    // Wait for 20 clock cycles and finish simulation
    repeat(20) @(posedge clk);
    $display("Simulation finished.");
    $finish;
end

endmodule
