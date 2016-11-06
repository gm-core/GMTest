/*
 * Ensures the passed in argument0 does not evalutate to argument1.
 * If it fails, it will log an error and fail the test.
 *
 * Example:
 * var player = instance_create(0, 0, obj_player);
 * var previous_health = player.health;
 * deal_random_damage(player);
 * assert_not(player.health, previous_health);
 */
global.testAssertNumber++;
if (argument0 == argument1) {
    var msg = create_assert_error(string(argument0) + " shouldn't be " + string(argument1));
    test_fail(msg);
}
