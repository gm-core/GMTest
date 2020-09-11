/// @desc Bootstraps GMTest systems
function test_bootstrap(autoEnd) {
	global.__gmtest_autoEnd = autoEnd;
	global.__gmtest_suites = [];
	global.__gmtest_before = -1;
	global.__gmtest_after = -1;
}

/// @desc Defines an individual test
/// @param {string} description  The description of the functionality being tested
/// @param {methpd} testMethod   A method containing the test
function test_it(testName, testMethod) {
	show_debug_message("It " + string(testName) + "...");
	testMethod();
}

/// @desc Wraps a suite of tests
/// @param {string} testName         The name of the test suite
/// @param {method} testSuiteMethod  A method containing the individual tests
function test_describe(testName, testSuiteMethod){
	global.__gmtest_suites[array_length(global.__gmtest_suites)] = {
		name: testName,
		testMethod: testSuiteMethod,
	};
}

/// @desc Runs all registered tests
function test_finalize() {
	var testCount = array_length(global.__gmtest_suites);
	for (var i = 0; i < testCount; i++) {
		// Prepare for this suite
		global.__gmtest_before = -1;
		global.__gmtest_after = -1;
		
		// Print suite info
		var testSuite = global.__gmtest_suites[i];
		show_debug_message("SUITE: " + testSuite.name);
		
		// Run the suite
		testSuite.testMethod();
	}
	
	show_debug_message("All tests complete.");
	
	if (global.__gmtest_autoEnd) {
		game_end();
	}
}
