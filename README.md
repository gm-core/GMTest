GaMaTas - Testing automation for GameMaker: Studio
=======

Version 4.0.0

## Table of Contents
1. [Introduction](#introduction)
2. [Installation](#installation)
3. [Usage](#usage)
4. [API](#api)
5. [GM Core](#gm-core)
6. [License](#license)


## Introduction

Gamatas is a collection of GML scripts to add automated testing to GameMaker.

## Installation

Download the latest [gamatas.zip from releases](https://github.com/gm-core/gamatas/releases) and import the scripts
into your project.

## GameMaker: Studio 2 Polyfills

If you are using GameMaker: Studio 2, you must have the `instance_create` script imported to your game as well from the `polyfills` folder. GameMaker: Studio 1.4 does not need this script, as it will cause an error. If you imported your project from GM:S 1.4, you may already have this script from the compatability scripts.

## Usage

### 1. Define the test suite

Create an object to house the tests for a suite. You can have as many test
suites as you want. Each suite is represented by an object.

In the `create` event of your object, use the `test_suite_init()` function to define
your test:

```GML
test_suite_init("Player Health and Death Tests");
```

### 2. Write some tests

Gamatas will run through tests in order based on your User Defined events. On
your test object, add a `User Defined 0` event. This is the first user defined
event, and therefore will be the first test to run.

Now, define a specific test with `test_start()`:

```GML
test_start("Player Takes Damage", "Should cause the health variable to be lower")
```
Next, write the actual test code. Write some code to ensure that
there is a player object in the game, then hurt it, then check that it has
lower health than before with an assertion:

```GML
instance_create(100, 100, obj_player);
var oldHP = obj_player.hp;
var damageAmount = 10;
hurt_player(damageAmount); // A script to cause damage to the player.

assert_equal(obj_player.hp, oldHP - damageAmount);

test_end();
```

`assert_equal(x, y)` ensures that `x` and `y` are equal. See the [API](#api) for all
documentation on assertions.

`test_end()` finishes the test and moves on to the next `User Defined` event.

When you have written the tests, your last User Defined event should contain:

```GML
test_suite_pass();
```

This will alert Gamatas that the entire test suite for that test object has
passed, and to either continue on to the next test suite, or end the game with
a status report of all your tests.

> **Note:** When a test suite passes, Gamatas moves to the next room to begin the next test.
> make a room for each test suite that you need, containing the test runner object for that suite.

## API

### Test Management

#### `test_describe(systemName)`

Initializes a test suite of the given system name, and begins running the first test (User Event 0)

```gml
/// @param {String} systemName
/*
 * example:
 */

test_describe("obj_player");
```

#### `test_it(behaviorDescription)`

Begins a test of the given behavior.

```gml
/// @param {String} behaviorDescription
/*
 * Example:
 */

test_it("dies when health is 0");
```

#### `test_end()`

Ends the current individual test, passing on to the next test or failing and quitting.

#### `test_fail()`

Forces the current test to fail. Mainly used by assert functions, but can be called directly if need be.

#### `test_describe_pass(optionalNextObject)`

Passes the current test suite, to be called on the final user defined event on the test object.

If you pass another test object to this function, it will create that object and destroy this one to continue tests.

Otherwise, if there is a room after the current one, it will move on to that room, otherwise, quits the game with an information dump in the console.

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

## GM Core

Gamatas is a part of the [GM Core](https://github.com/gm-core) project.

## License

Copyright (c) 2017 Michael Barrett

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
