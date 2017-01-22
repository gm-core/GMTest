/// Object relationship example
describe("Object Relationships", "The parent should remove the child if it is destroyed");

// Just to be sure there isn't anything mucking up the test room.
assert_does_not_exist(obj_parent_object);
assert_does_not_exist(obj_child_object);

// Create the parent, it is expected to create the child for us.
var parent = instance_create(0, 0, obj_parent_object);

assert_exists(obj_child_object);

// Now kill off the parent object, and we expect the child to be gone, too.
with (parent) {
    instance_destroy();
}

assert_does_not_exist(obj_child_object);
test_end();

