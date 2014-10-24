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
if (argument0 != argument1) {
    var msg = create_assert_error(string(argument0) + " is not " + string(argument1));
    test_fail(msg);
}
