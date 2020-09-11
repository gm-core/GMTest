GMTest - Testing automation for GameMaker: Studio
=======

Version 5.0.0

## Table of Contents
1. [Introduction](#introduction)
2. [Installation](#installation)
3. [Usage](#usage)
4. [API](#api)
5. [GM Core](#gm-core)
6. [License](#license)


## Introduction

GMTest is a behavioral testing suite for GameMaker: Studio 2.3 and above.

## Installation

Download the latest [gmtest.yymps from releases](https://github.com/gm-core/gmtest/releases) and import the package into your project. For detailed instructiosn, see [Installing .yymp Packages](https://gmcore.io/installing.html) on the GM Core website.

## Usage

### 1. Define some tests

In a script function or in an object create script, define a test suite using `test_describe`. This function will contain all of the tests related to a single subject. Let's write tests for a function called `hurt_player` which takes an amount of damage to apply to the player. Begin by defining the test suite. In this case, we'll write our test in a script resource called `test_hurt_player`.

```GML
function test_hurt_player() {
  test_describe('hurt_player', function() {
    // Tests will go here!
  });
}
```


### 2. Write some tests

Now we can write the actual tests. We will describe the behavior of our `hurt_player` function using the `test_it` function. The first parameter we provide is a string describing the expected behavior. It can be written like a statement - `test_it("subtracts health from the player"...`. Read it aloud! "It subtracts health from the player".

The second parameter of `test_it` is a function to be run to test this behavior. We will call the `hurt_player` function and test that the `health` variable has been altered as we expect, using one of the `assert` methods provided by GM Test. We will get into "asserts" later, but for now, just know that `assert_equal` tests that two values are equal.

So, our full script now looks like this:


```GML
function test_hurt_player() {
  test_describe('hurt_player', function() {
    
    test_it("subtracts health from the player", function() {
      health = 100;
      hurt_player(10);
      assert_equal(health, 90);
    });

  });
}
```

Lookin' good. You can have as many `test_it` calls as you want inside of a `test_describe`, and you can have as many `test_describe` calls as you want as well. In general, you should use a new `test_describe` for each new component you want to test, and a `test_it` for each behavior of the component you are testing.

### 3. Run your tests

We've got the test written but now we need to run it. Create an empty room, or a new Object, and in the creation code for either the room or the object, we will write just a few lines of code to run our tests. Reminder: if you are doing this in an object, be sure to place the object in the first room in your game so the code runs!

We just need to call the function that contains our test code to set up the test, then run the tests with `test_run_all()`.

```
// Register our test
test_hurt_player();

// Run the tests!
test_run_all();
```

Now, run your project. In the debug console output, you will see the results of your test:

```
hurt_player
|- It subtracts health from the player

[1/1] Test exeuction end

-----------
All tests passing!
```

We've got a passing test! Great! If you've got the feel for things, check out the API docs below.

If you want some more deeper examples, check out the docs on the [GMTest website @ GM Core](https://gmcore.io/gmtest)


## API

### Test Management

#### `test_describe(suiteName, suiteMethod)`

Wraps a suite of tests

```gml
@param {string} testName         The name of the test suite
@param {method} testSuiteMethod  A method containing the individual tests

test_describe("hurt_player", function() {
  // ...
});
```

#### `test_it(description, testMethod)`

Defines an individual test.

```gml
@param {string} description  The description of the functionality being tested
@param {method} testMethod   A method containing the test

test_it("subtracts from the health variable", function() {
  // ...
});
```

#### `test_before(beforeMethod)`

Defines a setup function for a suite of tests. This function is run once before the any tests in the test suite runs.

```gml
@param {method} setupMethod  A method containing the setup for a test suite

test_before(function() {
  health = 100;
});
```

#### `test_before_each(beforeEachMethod)`

Defines a setup function for each test in a suite. This function is before each test defined in a suite.

```gml
@param {method} setupMethod  A method containing the setup for eachtest in a suite.

test_beforeEach(function() {
  health = 100;
});
```

#### `test_after(afterMethod)`

Defines a cleanup function for a suite of tests. This function is run once after all tests in the suite have finished.

```gml
@param {method} cleanupMethod  A method containing the cleanup for a test suite

test_after(function() {
  score = 0;
});
```

#### `test_after_each(afterMethod)`

Defines a cleanup function for each test in a suite of tests.

```gml
@param {method} cleanupMethod  A method containing the cleanup for a test suite

test_after_each(function() {
  score = 0;
});
```

#### `test_run_all(optionalAutoEnd)`

Runs every test that has been defined within a `test_describe` before calling.

```gml
@param autoEnd {boolean}  If GM Test should close the game upon completion of the tests. Defaults to false.

test_run_all(true);
```

### Assert Types

All assertions can optionally take a custom error message as a third argument.

#### `assert(value, [, customMessage])`

Ensures that the given `value` is true (convenience for `assert_is_true`).

#### `assert_equal(value, expectedValue [, customMessage])`

Ensures that the given `value` is equal to `expectedValue`.

#### `assert_not_equal(value, unexpectedValue [, customMessage])`

Ensures that the given `value` is NOT equal to `unexpectedValue`.

#### `assert_exists(object [, customMessage])`

Ensures that an instance of `object` exists in the room.

#### `assert_does_not_exist(object [, customMessage])`

Ensures that an instance of `object` does not exist in the room.

#### `assert_is_true(value [, customMessage])`

Ensures the given `value` is `true`.

#### `assert_is_false(value [, customMessage])`

Ensures the given `value` is `false`.

#### `assert_is_undefined(value [, customMessage])`

Ensures the given `value` passes `is_undefined()`.

#### `assert_throws(function [, expectedErrorMessage])`

Ensures the given function throws an error message. Optionally specify `expectedErrorMessage` to validate the error message.

```gml
assert_throws(function() {
  throw "test";
}, "test");
```

## GM Core

GMTest is a part of the [GM Core](https://github.com/gm-core) project.

## License

Copyright (c) 2017 Michael Barrett

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
