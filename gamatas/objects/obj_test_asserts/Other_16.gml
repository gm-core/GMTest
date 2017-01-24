test_start("assert_is_false", "Should know false");

assert_is_false(false);
assert_is_false(!true);
assert_is_false(1 == 2);

test_end();