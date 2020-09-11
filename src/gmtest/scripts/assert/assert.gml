function _test_create_assert_error(argument0) {
	/* 
	 * Helper method for asserts to create standardized error
	 * messages. Not meant for external use.
	 */
	throw ("ASSERT ERROR - " + string(argument0));
}


/// @desc Convenience method for assert_is_true
/// @param Value
/// @param OptionalMessage
function assert() {
	if (argument_count > 1) {
	    assert_is_true(argument[0], argument[1]);
	} else {
	    assert_is_true(argument[0]);
	}
}

/// @desc Ensures the passed in object/instance does not exist in this room
/// @param Object
function assert_does_not_exist() {
	if (instance_exists(argument0)) {
	    if (argument_count > 1) {
	        msg = argument[1];
	    } else {
	        msg = _test_create_assert_error(string(argument[0]) + " should not exist");
	    }
		
	    throw (msg);
	}
}

/// @desc Ensures the passed values are equal
/// @param TestValue
/// @param ExpectedValue
/// @param OptionalMessage
function assert_equal() {
	if (argument[0] != argument[1]) {

	    var msg;
	    if (argument_count > 2) {
	        msg = argument[2];
	    } else {
	        msg = _test_create_assert_error(string(argument[0]) + " is not " + string(argument[1]));
	    }
	    throw (msg);
	}
}

/// @desc Ensures the passed in object/instance exists
/// @param Object
function assert_exists() {
	if (!instance_exists(argument0)) {
	    var msg;
    
	    if (argument_count > 1) {
	        msg = argument[1];
	    } else {
	        msg = _test_create_assert_error(string(argument[0]) + " has no instances");
	    }
	    throw (msg);
	}
}

/// @desc Asserts that the passed in argument is false
/// @param Value
/// @param OptionalMessage
function assert_is_false() {
	if (argument_count > 1) {
	    assert_equal(argument[0], false, argument[1]);
	} else {
	    assert_equal(argument[0], false);
	}
}

/// @desc Asserts that the passed in argument is true
/// @param Value
/// @param OptionalMessage
function assert_is_true() {
	if (argument_count > 1) {
	    assert_equal(argument[0], true, argument[1]);
	} else {
	    assert_equal(argument[0], true);
	}
}

/// @desc Ensures the passed in argument is undefined
/// @param TestValue
/// @param OptionalMessage
function assert_is_undefined() {
	if (!is_undefined(argument[0])) {

	    var msg;
	    if (argument_count > 1) {
	        msg = argument[1];
	    } else {
	        msg = _test_create_assert_error(string(argument[0]) + " is not undefined.");
	    }
	    throw (msg);
	}
}

/// @desc Ensures the passed in values are not equal
/// @param TestValue
/// @param UnexpectedValue
/// @param OptionalMessage
function assert_not_equal() {
	if (argument[0] == argument[1]) {
	    var msg = "";
    
	    if (argument_count > 2) {
	        msg = argument[2];
	    } else {
	        msg = _test_create_assert_error(string(argument[0]) + " shouldn\'t be " + string(argument[1]));
	    }
	    throw (msg);
	}
}
