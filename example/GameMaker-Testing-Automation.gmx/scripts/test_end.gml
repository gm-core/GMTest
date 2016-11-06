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
