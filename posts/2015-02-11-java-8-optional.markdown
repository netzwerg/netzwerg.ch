---
layout: post
title: Java 8 Optional
date: 2015-02-11 06:30
comments: false
---
[Tony Hoare](http://en.wikipedia.org/wiki/Tony_Hoare), inventor of the `null` reference, apologetically called it "the billion dollar mistake".

The problem with `null` is not that it was invented back in 1965, but that we are still struggling with it 50 years later. Any Java developer has probably seen and written code like this:

``` java
String result = service.find("id");
String value;
if (result != null) {
    value = result.trim();
} else {
    value = "<absent>";
}
System.out.println("Value: " + value);
```

In fact, most Java monoglots have probably seen and written code like this so many times, that they don't
even see the problem anymore. And yet, with Java 8, they have to deal with a solution: the `Optional` type.

I recently came across this popular article:
[Embracing the Void: 6 Refined Tricks for Dealing with Nulls in Java](https://www.voxxed.com/blog/2015/01/embracing-void-6-refined-tricks-dealing-nulls-java/).
It gives a nice rundown of strategies around the `null` reference. Sadly, it discourages the use of Java 8's
`Optional`. In this post I will explain why the argumentation is flawed.

## Types to the rescue

One way to re-write the above snippet using `Optional` could look like this:

``` java
Optional<String> result = service.find("id");
String value;
if (result.isPresent()) {
    value = result.get().trim();
} else {
    value = "<absent>";
}
System.out.println("Value: " + value);
```

The service returns an `Optional<String>` and the caller is working her way around it. From a complexity point of
view, the change is argueably not much of an improvement: We still need a mutable `value` variable, and the overall
logic is roughly the same. And yet, the expressiveness has improved. The signature of the service has clearer
semantics now. Originally, the caller of the service could not distinguish between *"the implementor of the service
made a programming error"* and *"the value has not been found"* -- both were resulting in `null`. This is possible now
and -- even better -- the type system **forces** the caller to deal with absents values.

## But wait, there's more

Now that the semantics are straight, let's make the `value` variable immutable and eliminate the `if .. else`
construct:

``` java
Optional<String> result = service.find("id");
final String value = result.orElseGet(() -> "<absent>").trim();
```

This code is safer, more expressive, and more concise than the original version, but the `() -> "..."` clutter makes my Scala heart cringe, so I'm offering yet another variant:

``` java
Optional<String> result = service.find("id");
String value = result.map(String::trim).orElse("<absent>");
```

We are taking advantage of the fact that `Optional` behaves like a collection: If it is absent, it behaves like an empty list, the call to `map` is never executed, and the result is an empty `Optional` (which we handle via `orElse`). If the result is present, it behaves like a list with one element, which we trim and return. 

## Wrapping legacy code

Imagine that our original `service` interface is actually coming from a 3rd party library. You can't simply change
all the signatures to properly return `Option<T>`. But you can wrap the service calls and create yourself a
`null`-safe world:

``` java
Optional<String> result = Optional.ofNullable(legacyService.find("id"));
```

## Unboxing a cat in a box in a box

And finally: The holy grail of functional programming, `flatMap`.

Let's start with a simple `User` which has an optional middle name:

``` java
interface User {
    String getName();
    Option<String> getMiddleName();
}
```

Looking up the user via service is straightforward, but look at all those types:

``` java
Optional<User> result = service.find("id");
Optional<Optional<String>> middleName = result.map(User::getMiddleName);
```

The outer `Optional` is the result of the `map` call (presence/absence of `User`), while the inner `Optional` is
wrapping the middle name value.

`flatMap` is our power tool to unwrap the value from nested `Optional`s:

``` java
String middleName = result.flatMap(User::getMiddleName).orElse("Ada");
```

So next time you can't remember the semantics of `flatMap`, just think of all those cats stuck in their nested boxes:

<img src='/images/cat.png' />

*(via [@channingwalton](https://twitter.com/channingwalton/status/447778554114502657))*

I highly recommend [The Neophyte's Guide to Scala - Part 5: The Option Type](http://danielwestheide.com/blog/2012/12/19/the-neophytes-guide-to-scala-part-5-the-option-type.html) for anyone interested in further details.
