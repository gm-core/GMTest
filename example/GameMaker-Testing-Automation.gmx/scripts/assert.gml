/*
 * Ensures the passed in argument0 evalutates to argument1.
 * If it fails, it will log an error and fail the test.
 *
 * Example:
 * var player = instance_create(0, 0, obj_player);
 * player.health = 100;
 * hurt_player(10);
 * assert(player.health, 90);
 */
global.testAssertNumber++;
if (argument[0] != argument[1]) {

    var msg;
    if (argument_count > 2) {
        msg = argument[2];
    } else {
        msg = create_assert_error(string(argument[0]) + " is not " + string(argument[1]));
    }
    test_fail(msg);
}
