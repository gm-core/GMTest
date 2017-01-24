test_start("assert_not_equal", "Should know right from right");

assert_not_equal("hello", "world");
assert_not_equal(true, false);
assert_not_equal(100, 200);
assert_not_equal(assert_not_equal, assert_equal);
assert_not_equal(obj_test_asserts, obj_another_object);

test_end();

