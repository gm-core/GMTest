/// Event simulation example
describe("Event Simulation", "Should allow for UI testing");

// Create our button and ensure it is in a normal state.
var button = instance_create(50, 50, obj_clickme);
assert(button.clicked, false);

// Simulate the user left clicking the button.
with (button) {
    event_perform(ev_mouse, ev_left_press);
}

// Check that the button is now in the state we would want it to be in 
// after clicking.
assert(button.clicked, true);
test_end();
    

