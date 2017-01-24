/// Event simulation example
test_start("Event Simulation", "Should allow for UI testing");

// Create our button and ensure it is in a normal state.
var button = instance_create_depth(50, 50, depth, obj_clickme);
assert_is_false(button.clicked);

// Simulate the user left clicking the button.
with (button) {
    event_perform(ev_mouse, ev_left_press);
}

// Check that the button is now in the state we would want it to be in 
// after clicking.
assert_is_true(button.clicked);
test_end();
    

