/// @desc Bootstraps GMTest systems
function test_bootstrap(autoEnd) {
	global.__gmtest_autoEnd = autoEnd;
	global.__gmtest_suites = [];
	global.__gmtest_testsCollection = [];
	global.__gmtest_before = function() {};
	global.__gmtest_after = function() {};
	global.__gmtest_beforeEach = function() {};
	global.__gmtest_afterEach = function() {};
}

/// @desc Defines an individual test
/// @param {string} description  The description of the functionality being tested
/// @param {method} testMethod   A method containing the test
function test_it(testName, testMethod) {
	var testCount = array_length(global.__gmtest_testsCollection);
	global.__gmtest_testsCollection[testCount] = {
		name: testName,
		test: testMethod,
	}
}

/// @desc Defines a setup function for a suite of tests
/// @param {method} setupMethod  A method containing the setup for a test suite
function test_before(setupMethod) {
	global.__gmtest_before = setupMethod;
}

/// @desc Defines a cleanup function for a suite of tests
/// @param {method} cleanupMethod  A method containing the cleanup for a test suite
function test_after(setupMethod) {
	global.__gmtest_after = setupMethod;
}

/// @desc Defines a setup function for each test in a suite of tests
/// @param {method} setupMethod  A method containing the setup for a test suite
function test_beforeEach(setupMethod) {
	global.__gmtest_beforeEach = setupMethod;
}

/// @desc Defines a cleanup function for each test in a suite of tests
/// @param {method} cleanupMethod  A method containing the cleanup for a test suite
function test_afterEach(setupMethod) {
	global.__gmtest_afterEach = setupMethod;
}

/// @desc Wraps a suite of tests
/// @param {string} testName         The name of the test suite
/// @param {method} testSuiteMethod  A method containing the individual tests
function test_describe(testName, testSuiteMethod){
	global.__gmtest_testsCollection = [];
	global.__gmtest_before = function() {};
	global.__gmtest_after = function() {};
	global.__gmtest_beforeEach = function() {};
	global.__gmtest_afterEach = function() {};
	
	testSuiteMethod();
	
	global.__gmtest_suites[array_length(global.__gmtest_suites)] = {
		name: testName,
		tests: global.__gmtest_testsCollection,
		before: global.__gmtest_before,
		after: global.__gmtest_after,
		beforeEach: global.__gmtest_beforeEach,
		afterEach: global.__gmtest_afterEach,
	};
}

/// @desc Runs all registered tests
function test_run() {
	var testCount = array_length(global.__gmtest_suites);
	var totalTests = 0;
	var passedTests = 0;
	for (var i = 0; i < testCount; i++) {
		// Prepare for this suite
		global.__gmtest_before = -1;
		global.__gmtest_after = -1;
		
		// Print suite info
		var testSuite = global.__gmtest_suites[i];
		show_debug_message(testSuite.name);
		
		var suiteTestCount = array_length(testSuite.tests);
		testSuite.before();
		
		for (var testIdx = 0; testIdx < suiteTestCount; testIdx++) {
			
			totalTests++;
			var testPassed = true;
			var testExceptionMessage = "";

			// Run the test
			testSuite.beforeEach();
			
			try {
				testSuite.tests[testIdx].test();
			} catch (error) {
				testPassed = false;
				testExceptionMessage = typeof(error) == "string" ? error : error.message;
			} finally {
				testSuite.afterEach();
			}
			
			if (testPassed) {
				show_debug_message("|- ✓ It " + testSuite.tests[testIdx].name);
				passedTests++;
			} else {
				show_debug_message("|- × It " + testSuite.tests[testIdx].name);
				show_debug_message("|-- ERROR: " + testExceptionMessage);
			}
		}
		testSuite.after();

	}
	
	show_debug_message("[" + string(passedTests) + "/" + string(totalTests) + "] Test exeuction end");
	
	if (global.__gmtest_autoEnd) {
		game_end();
	}
}
