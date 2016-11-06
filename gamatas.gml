#define assert
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

#define assert_exists
/*
 * Ensures that an instance of the given object exists.
 * If it fails, it will log an error and fail the test.
 *
 * Example:
 * spawn_boss();
 * assert_exists(obj_boss);
 */
global.testAssertNumber++;
if (!instance_exists(argument0)) {
    var msg;
    
    if (argument_count > 1) {
        msg = argument[1];
    } else {
        msg = create_assert_error(string(argument[0]) + " has no instances");
    }
    test_fail(msg);
}

#define assert_not
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
    var msg = "";
    
    if (argument_count > 2) {
        msg = argument[2];
    } else {
        msg = create_assert_error(string(argument[0]) + " shouldn't be " + string(argument[1]));
    }
    test_fail(msg);
}

#define assert_does_not_exist
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

#define describe
/*
 * Sets the description of the currently running test or exits
 * if the previous test fails. Use this to define specific tests
 * within a given test suite.
 * Example:
 * describe("Player Death", "The player should die at 0 health");
 */
if (global.testPassed) {
    global.testName = argument0;
    global.testDescription = argument1;
    global.testCount++;
} else {
    game_end();
}

#define test_init
/*
 * Initializes a test in an empty room
 */
global.testPassed = true;
global.testCount = 0;
global.testSuiteName = argument0;
global.testNumber = 0;
global.testAssertNumber = 0;
gamatas_info("TESTING SUITE: " + argument0);
test_next();

#define test_next
/*
 * Kicks off the next test in a suite (the next user defined
 * action). Used internally in end_test(). Use directly with
 * caution, as this is not supported for direct developer use
 * within the test automation suite.
 */
event_perform(ev_other, int_to_event(global.testNumber++));

#define test_fail
/*
 * Fails a test, printing the message and test info. This is used
 * internally by asserts, but can also be used to manually fail
 * tests if need be.
 */
 var msg = argument0; 
gamatas_info(msg);
gamatas_info("In suite " + global.testSuiteName);
gamatas_info("In test " + global.testName + ": " + global.testDescription);
global.testPassed = false;

#define test_end
/* 
 * Concludes an individual test in a test suite.
 * If the test passed, prints a success message and moves on
 * to the next test, otherwise, fails the test and exits.
 */
if (global.testPassed) {
    gamatas_info("TEST PASSED: " + global.testName);
    test_next();
} else {
    gamatas_info("TEST FAILED: " + global.testName);
    gamatas_info("TEST SUITE FAILED: " + global.testSuiteName);
    game_end();
}

#define test_suite_pass
/* 
 * Finishes the test suite and moves on if there are more tests/rooms,
 * otherwise, quits. This should be called by itself in the last user
 * defined action on your test controller object.
 */
gamatas_info("TEST SUITE PASSED: " + global.testSuiteName);
if (room != room_last) {
    room_goto_next();
} else {
    gamatas_info("ALL TESTS PASSING");
    game_end();
}

#define int_to_event
/* Converts a number to an ev_user event

    Arguments:
    0 - Event number
*/

switch (argument0) {
    case 0:
        return ev_user0;
        break;
    case 1:
        return ev_user1;
        break; 
    case 2:
        return ev_user2;
        break;
    case 3:
        return ev_user3;
        break;
    case 4:
        return ev_user4;
        break;
    case 5:
        return ev_user5;
        break;
    case 6:
        return ev_user6;
        break;
    case 7:
        return ev_user7;
        break;
    case 8:
        return ev_user8;
        break;
    case 9:
        return ev_user9;
        break;
    case 10:
        return ev_user10;
        break;
    case 11:
        return ev_user11;
        break;
    case 12:
        return ev_user12;
        break;
    case 13:
        return ev_user13;
        break;
    case 14:
        return ev_user14;
        break;
    case 15:
        return ev_user15;
        break;
    default:
        return ev_user0;
        break;
}
        

#define create_assert_error
/* 
 * Helper method for asserts to create standardized error
 * messages. Not meant for external use.
 */
return "ASSERT ERROR - " + string(argument0) + " - ASSERT #" + string(global.testAssertNumber);

#define gamatas_info
/*
 * Simplified logging. Prints all arguments to the output console.
 * If you are not using a version of GameMaker with an output console, you
 * may want to edit this script to output to a file or something else.
 */
var output = string(argument[0]);
for (var i = 1; i < argument_count; i++) {
    output += " " + string(argument[i])
}
show_debug_message(output);

