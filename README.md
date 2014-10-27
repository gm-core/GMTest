GaMaTas
=======

Testing automation for GameMaker

## Table of Contents
1. [Introduction](#introduction)
2. [Example](#example)
3. [How To Use Gamatas](#how-to-use-gamatas)
4. [API](#api)
5. [Developer Information](#developer-information)


## Introduction

GameMaker is a widely used game development IDE that features a very robust
decidated scripting language, GML. While GameMaker has a lot of utility built in
and is approachable for people from all levels of expertise in programming, it
does still fall short in providing some utilities for the more advanced
developer. One of the missing pieces is a testing suite, a system in place for
automating tests on the objects and scripts in the game project to ensure that
everything is working as expected. Well, here is Gamatas, a collection of
GML scripts ready to help you with exactly that.

## Example

**There is a fully working example .gmx file in the top level `example`
directory.**

Gamatas is written in a way that requires the use of Objects in GameMaker to run
tests. Leveraging "User Defined" events, Gamatas runs through tests defined by
the developer programmatically.

### Step 1 - Define the test suite

Create an objet and name it based on your test. Lets say we're testing our
player health and death mechanic. We'll name our test `obj_test_player_health`.

In the `create` event of your object, use the `test_init()` function to define
your test:

```GML
test_init("Player Health and Death Tests");
```

We have now declared that this portion of our test suite is titled "Player 
Health and Death Tests" so we can see in our logs later on that the suite of 
tests passed or failed.

### Step 2 - Write some tests

Gamatas will run through tests in order based on your User Defined events. On
your test object, add an event. Under the "other" category, open the "User 
Defined" subcategory and select `User Defined 0`. This is the first user defined
event, and therefore will be the first test to run.

Now, we can define our specific test with `describe()`:

```GML
describe("Player Takes Damage", "Should cause the health variable to be lower")
```

The first argument to `describe` is the title of the test itself. The second
argument explains the expected behavior that the test is looking for.

Now, its time to write the actual test code. Write some code to ensure that
there is a player object in the game, then hurt it, then check that it has
lower health than before.

```GML
instance_create(100, 100, obj_player);
var oldHP = obj_player.hp;
var damageAmount = 10;
hurt_player(damageAmount); // A script to cause damage to the player.

assert(obj_player.hp, oldHP - damageAmount);

test_end();
```

So what did we do? We added a player, checked its health and stored that to a 
variable, then ran a script to hurt the player. We then used `assert()` to
ensure that the player's health is what we expect. Assert functions check to see
that the arguments meet a condition, and will fail your test if they do not. See
[assert types](#assert-types) for information on the kinds of asserts you can
use in your tests.

The last thing we did was call `test_end()`, which will look at the status of
your test based on the asserts, and either continue to the next test (which 
would be in `User Defined 1` in this case), or will fail the tests and exit the
game with information about where the test failed.

From here, you can repeat this for as many tests you like (as long as there is
a User Defined event left to use).

Finally, when you have written the tests, your last User Defined event should
contain:

```GML
test_suite_pass();
```

This will alert Gamatas that the entire test suite for that test object has
passed, and to either continue on to the next test suite, or end the game with
a status report of all your tests.

All tests should have their own rooms. Simply make a room with nothing but the
test running object and any objects you need to run the tests. All test rooms
should be back-to-back, so Gamatas can just run right through all of them in
order. In no time, you'll have your whole game set up with automated tests, so
you don't have to worry about things changing out from under you!

## How To Use Gamatas

Gamatas comes in the form of pure GML scripts. It did not seem appropriate to 
turn them into a GameMaker Extension, as the argument typing system for
extensions limits the assert functionality.

**To use Gamatas in your game, download the 'gamatas.zip' file from the
[releases](https://github.com/twisterghost/gamatas/releases) page**, and unzip 
the files somewhere on your computer. You can then import the script files to 
your game, and you're ready to go!


It may help to put them in a folder of their own within your game's resource
tree.

## API

### Test Management

#### test_init(name)

Initializes a test suite with the given name.

#### describe(title, description)

Defines an individual test named `title`, expecting the behavior defined in
`description`.

#### test_end()

Ends the current individual test, passing on to the next test or failing and
quitting.

#### test_fail()

Forces the current test to fail. Mainly used by assert functions, but can be
called directly if need be.

#### test_suite_pass()

Passes the current test suite, to be called on the final user defined event on 
the test object. If there is a room after the current one, it will move on to
that room, otherwise, quits the game with an information dump in the console.

### Assert Types

#### assert(value, expectedValue)

Ensures that the given `value` is equal to `expectedValue`.

#### assert_not(value, unexpectedValue)

Ensures that the given `value` is NOT equal to `unexpectedValue`.

#### assert_exists(object)

Ensures that an instance of `object` exists in the room.

#### assert_does_not_exist(object)

Ensures that an instance of `object` does not exist in the room.

### Utility

#### info(string1[, string2, string3, ... string16])

Combines all of the given strings and prints them all to the console. Only the
first string is mandatory. If you are using a version of GameMaker that does not
support the console output, you may want to change this function to output to a
medium of your liking. Alternates of this file are on the way.

## Developer Information

If you would like to contribute to Gamatas, I would happily accept pull
requests that seem to add value or fix bugs. If you find an issue with Gamatas,
please report it by opening a GitHub Issue on this repo.

If you are having issues using Gamatas, you can feel free to email me directly
at twisterghost@gmail.com
