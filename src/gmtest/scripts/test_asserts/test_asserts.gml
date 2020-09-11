function test_assert_exists() {
	test_describe("assert_exists", function() {
		test_before(function() {
			instance_create_depth(0, 0, 0, obj_another_object);
		});
		
		test_after(function() {
			instance_destroy(obj_another_object);
		});
		
		test_it("asserts when an object is present", function() {
			assert_exists(obj_another_object);
		});
		
		test_it("errors when an object is not present", function() {
			assert_throws(function() {
				assert_exists(obj_an_object);
			}, "ASSERTION ERROR: " + string(obj_an_object) + " has no instances");
			
		});
	});
}

function test_assertions() {
	test_describe("Other assertions", function() {
		test_it("can tell when things are equal", function() {
			assert_equal(true, true);
			assert_equal(1, 1);
		});
	
		test_it("can tell when things are not equal", function() {
			assert_not_equal(true, false);
			assert_not_equal(1, 2);
		});
	
		test_it("can tell when an object does not exist", function() {
			assert_does_not_exist(obj_another_object);
		});
	
		test_it("can assert truths", function() {
			assert(true);
			assert(1);
			assert(2 == 2);
			assert(is_undefined(undefined));
		});
	
		test_it("knows what is true", function() {
			assert_is_true(true);
			assert_is_true(!false);
			assert_is_true(1 == 1);
		});
	
		test_it("knows what is false", function() {
			assert_is_false(false);
			assert_is_false(!true);
			assert_is_false(1 == 2);
		});
	
		test_it("knows what undefined is", function() {
			assert_is_undefined(undefined);
		});
	});
}
