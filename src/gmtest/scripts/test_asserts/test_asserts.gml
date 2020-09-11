function test_assertions() {
	test_describe("Assertions", function() {
		test_it("can tell when things are equal", function() {
			assert_equal(true, true);
			assert_equal(1, 1);
		});
	
		test_it("can tell when things are not equal", function() {
			assert_not_equal(true, false);
			assert_not_equal(1, 2);
		});
	
		test_it("can tell when an object exists", function() {
			instance_create_depth(0, 0, 0, obj_another_object);
			assert_exists(obj_another_object);
			instance_destroy(obj_another_object);
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

function tests_main() {
	test_bootstrap(true);
	test_assertions();
	test_finalize();
}