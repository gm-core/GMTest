/// @desc Ensures the passed in object/instance does not exist in this room
/// @param Object
function assert_does_not_exist() {
	if (instance_exists(argument0)) {
	    if (argument_count > 1) {
	        msg = argument[1];
	    } else {
	        msg = gamatas_create_assert_error(string(argument[0]) + " should not exist");
	    }
	    test_fail(msg);
	}
}
