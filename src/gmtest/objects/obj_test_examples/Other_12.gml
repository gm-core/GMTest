/// @desc Object definitions example
test_it("should allow for complex variable definitions to be verified");

// Define a dummy object and populate it with some data.
var props = instance_create_depth(0, 0, depth, obj_blank);
props.speed = 10;
props.direction = 20;
props.gravity = 30;

// Now define our cloning object and pass props in as a variable.
var receiver = instance_create_depth(0, 0, depth, obj_receiver);
receiver.props = props;

// Perform the cloning event we have defined in the object.
with (receiver) {
    event_perform(ev_other, ev_user0);
}

// Check that the data has successfully been copied over.
assert_equal(receiver.speed, props.speed);
assert_equal(receiver.direction, props.direction);
assert_equal(receiver.gravity, props.gravity);

test_end();

