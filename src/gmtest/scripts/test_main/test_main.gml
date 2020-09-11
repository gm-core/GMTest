function test_main() {
	test_assert_exists();
	test_assert_does_not_exist();
	test_assert_equal();
	test_assert_not_equal();
	test_assert();
	test_assert_is_true();
	test_assert_is_false();
	test_assert_is_undefined();
	test_assert_throws();
	
	test_run_all(true);
}