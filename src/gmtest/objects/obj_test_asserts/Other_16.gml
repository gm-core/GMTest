/// @desc assert_is_false
test_it("should know false");

assert_is_false(false);
assert_is_false(!true);
assert_is_false(1 == 2);

test_end();