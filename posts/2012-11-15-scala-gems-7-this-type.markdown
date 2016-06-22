---
comments: true
date: 2012-11-15 10:07:02
layout: post
slug: scala-gems-7-this-type
title: "Scala Gems #7: this.type"
wordpress_id: 450
---
Suppose you have a simple class hierarchy with an API optimized for method chaining:
``` scala
abstract class Carnivore {

  def eat: Carnivore = {
    println("eating meat, yummy!")
    this
  }

}

class Dog extends Carnivore {

  def bark: Dog = {
    println("wuff!")
    this
  }
  
}
```

For obvious reasons, the compiler will only allow to chain methods in a certain order:

``` scala
val dog = new Dog()
// compiles ok
dog.bark.eat
// does not compile ('eat' returns a Carnivore, which cannot bark)
dog.eat.bark
```

In the Java world, possible work-arounds involve generics. Either via overriding, or with a self-reference trick. Here's how it would look in Scala:

``` scala
abstract class Carnivore[T] {

  def eat: T = {
    println("eating meat, yummy!")
    self
  }
  
  abstract def self: T

}

class Dog extends Carnivore[Dog] {

  def bark: Dog = {
    println("wuff!")
    this
  }
  
  def self = this

}
```

While this works just fine, it involves quite some clutter. And Scala can actually do better! A powerful (but yet not very well-known) construct can solve the problem: **`this.type`**

``` scala
abstract class Carnivore {

  def eat: this.type = {
    println("eating meat, yummy!")
    this
  }

}

class Dog extends Carnivore {

  def bark: Dog = {
    println("wuff!")
    this
  }

}
```

And now go spread the word!
