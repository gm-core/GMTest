// Initialise the global array that allows the lookup of the depth of a given object
// GM2.0 does not have a depth on objects so on import from 1.x a global array is created
// NOTE: MacroExpansion is used to insert the array initialisation at import time
gml_pragma( "global", "__global_object_depths()");

// insert the generated arrays here
global.__objectDepths[0] = 0; // obj_child_object
global.__objectDepths[1] = 0; // obj_blank
global.__objectDepths[2] = 0; // obj_clickme
global.__objectDepths[3] = 0; // obj_parent_object
global.__objectDepths[4] = 0; // obj_test_asserts
global.__objectDepths[5] = 0; // obj_test_examples
global.__objectDepths[6] = 0; // obj_receiver
global.__objectDepths[7] = 0; // obj_another_object
global.__objectDepths[8] = 0; // obj_counter


global.__objectNames[0] = "obj_child_object";
global.__objectNames[1] = "obj_blank";
global.__objectNames[2] = "obj_clickme";
global.__objectNames[3] = "obj_parent_object";
global.__objectNames[4] = "obj_test_asserts";
global.__objectNames[5] = "obj_test_examples";
global.__objectNames[6] = "obj_receiver";
global.__objectNames[7] = "obj_another_object";
global.__objectNames[8] = "obj_counter";


// create another array that has the correct entries
var len = array_length_1d(global.__objectDepths);
global.__objectID2Depth = [];
for( var i=0; i<len; ++i ) {
	var objID = asset_get_index( global.__objectNames[i] );
	if (objID >= 0) {
		global.__objectID2Depth[ objID ] = global.__objectDepths[i];
	} // end if
} // end for