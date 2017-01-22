/// assert_not()
test_start("Assert Not", "Should know right from right");

assert_not("hello", "world");
assert_not(true, false);
assert_not(100, 200);
assert_not(assert_not, assert);
assert_not(obj_test_asserts, obj_another_object);

test_end();

