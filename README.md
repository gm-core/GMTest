GaMaTas - Testing automation for GameMaker: Studio
=======

Version 2.0.0

## Table of Contents
1. [Introduction](#introduction)
2. [Installation](#installation)
3. [Usage](#usage)
4. [API](#api)
5. [Developer Information](#developer-information)


## Introduction

Gamatas is a collection of GML scripts to add automated testing to GameMaker.

## Installation

Download the latest [gamatas.zip from releases](https://github.com/twisterghost/gamatas/releases) and import the scripts
into your project.

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

assert(obj_player.hp, oldHP - damageAmount);

test_end();
```

`assert(x, y)` ensures that `x` and `y` are equal. See the [API](#api) for all
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

#### `test_suite_init(name)`

Initializes a test suite with the given name.

#### `test_start(title, description)`

Defines an individual test named `title`, expecting the behavior defined in
`description`.

#### `test_end()`

Ends the current individual test, passing on to the next test or failing and
quitting.

#### `test_fail()`

Forces the current test to fail. Mainly used by assert functions, but can be
called directly if need be.

#### `test_suite_pass()`

Passes the current test suite, to be called on the final user defined event on 
the test object. If there is a room after the current one, it will move on to
that room, otherwise, quits the game with an information dump in the console.

### Assert Types

All assertions can optionally take a custom error message as a third argument.

#### `assert(value, expectedValue [, customMessage])`

Ensures that the given `value` is equal to `expectedValue`.

#### `assert_not(value, unexpectedValue [, customMessage])`

Ensures that the given `value` is NOT equal to `unexpectedValue`.

#### `assert_exists(object [, customMessage])`

Ensures that an instance of `object` exists in the room.

#### `assert_does_not_exist(object [, customMessage])`

Ensures that an instance of `object` does not exist in the room.

## Developer Information

If you would like to contribute to Gamatas, I would happily accept pull
requests that seem to add value or fix bugs. If you find an issue with Gamatas,
please report it by opening a GitHub Issue on this repo.

If you are having issues using Gamatas, you can feel free to email me directly
at twisterghost@gmail.com
