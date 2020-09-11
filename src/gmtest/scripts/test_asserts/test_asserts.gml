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

function test_assert_equal() {
	test_describe("assert_equal", function() {
		test_it("can tell when things are equal", function() {
			assert_equal(true, true);
			assert_equal(1, 1);
		});
		
		test_it("errors when things are not equal", function() {
			assert_throws(function() {
				assert_equal(1, 2);
			});
			
			assert_throws(function() {
				assert_equal(true, false);
			});
		});
	
	});
}

function test_assert_not_equal() {
	test_describe("assert_not_equal", function() {
		test_it("can tell when things are not equal", function() {
			assert_not_equal(true, false);
			assert_not_equal(1, 2);
		});
		
		test_it("errors when things are equal", function() {
			assert_throws(function() {
				assert_not_equal(1, 1);
			});
			
			assert_throws(function() {
				assert_not_equal(true, true);
			});
		});
	});
}

function test_assert_does_not_exist() {
	test_describe("assert_does_not_exist", function() {
		test_it("asserts when an object is not present", function() {
			assert_does_not_exist(obj_another_object);
		});
		
		test_it("errors when an object is present", function() {
			assert_throws(function() {
				instance_create_depth(0, 0, 0, obj_an_object);
				assert_does_not_exist(obj_an_object);
			}, "ASSERTION ERROR: " + string(obj_an_object) + " should not exist");
			
		});
	});
}

function test_assert() {
	test_describe("assert", function() {
		test_it("asserts when the content is true", function() {
			assert(true);
			assert(1 == 1);
			assert("hello" == "hello");
		});
		
		test_it("errors when the content is not true", function() {
			assert_throws(function() {
				assert(false);
			});
		});
	});
}

function test_assert_is_true() {
	test_describe("assert_is_true", function() {
		test_it("asserts when the content is true", function() {
			assert_is_true(true);
			assert_is_true(1 == 1);
			assert_is_true("hello" == "hello");
		});
		
		test_it("errors when the content is not true", function() {
			assert_throws(function() {
				assert_is_true(false);
			});
		});
	});
}

function test_assert_is_false() {
	test_describe("assert_is_false", function() {
		test_it("asserts when the content is false", function() {
			assert_is_false(false);
			assert_is_false(1 == 2);
			assert_is_false("hello" == "helloooo");
		});
		
		test_it("errors when the content is not false", function() {
			assert_throws(function() {
				assert_is_false(true);
			});
		});
	});
}

function test_assert_is_undefined() {
	test_describe("assert_is_undefined", function() {
		test_it("asserts when the content is undefined", function() {
			assert_is_undefined(undefined);
		});
		
		test_it("errors when the content is not undefined", function() {
			assert_throws(function() {
				assert_is_undefined(true);
			});
		});
	});
}

function test_assert_throws() {
	test_describe("assert_throws", function() {
		test_it("asserts when the provided function throws", function() {
			assert_throws(function() {
				throw "test";
			});
		});
		
		test_it("asserts when the provided function throws the right error message", function() {
			assert_throws(function() {
				throw "test";
			}, "test");
		});
		
		test_it("errors when the provided function does not throw", function() {
			try {
				assert_throws(function() {});
			} catch (error) {
				assert_is_true(string_pos("ASSERT", error) != 0);
			}
		});
		
		test_it("errors when the provided function does not throw the right error message", function() {
			try {
				assert_throws(function() {
					throw "wrong";
				}, "right");
			} catch (error) {
				assert_is_true(string_pos("ASSERT", error) != 0);
			}
		});
	});
}