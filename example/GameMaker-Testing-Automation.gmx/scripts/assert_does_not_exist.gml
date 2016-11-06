/*
 * Ensures that an instance of the given object exists.
 * If it fails, it will log an error and fail the test.
 *
 * Example:
 * kill_boss();
 * assert_does_not_exist(obj_boss);
 */
global.testAssertNumber++;
if (instance_exists(argument0)) {

    if (argument_count > 1) {
        msg = argument[1];
    } else {
        msg = create_assert_error(string(argument[0]) + " should not exist");
    }
    test_fail(msg);
}
