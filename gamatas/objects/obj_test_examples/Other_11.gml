/// @desc Async test example
test_it("Allows an object some time to perform an action and " + 
         "tests the end result");

// Instantiate our counting object (counts 1 per step).
instance_create_depth(0, 0, depth, obj_counter);

// Make sure it is in the state we expect.
assert_equal(obj_counter.count, 1);

// Now wait 10 steps.
alarm[0] = 10;

// We don't end the test here with test_end() because we continue the test
// in Alarm 0 on this object. Peek over there to see the end of this test!

