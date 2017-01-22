/*
 * Ensures that an instance of the given object exists.
 * If it fails, it will log an error and fail the test.
 *
 * Example:
 * spawn_boss();
 * assert_exists(obj_boss);
 */
global.gamatas_testAssertNumber++;
if (!instance_exists(argument0)) {
    var msg;
    
    if (argument_count > 1) {
        msg = argument[1];
    } else {
        msg = gamatas_create_assert_error(string(argument[0]) + " has no instances");
    }
    test_fail(msg);
}
