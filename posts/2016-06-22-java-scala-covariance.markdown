---
title: "Covariance in Java and Scala"
date: 2016-06-22 08:45
---
While there are tons of articles explaining the concept of covariance in Java, this post attempts to highlight
how and why Java and Scala differ when it comes to collection type safety.

## Java Arrays

Let's start with Java arrays.
They are covariant, meaning that an array of type `S[]` is a subtype of an array of type `T[]` if `S` is a subtype of
`T`:
```java
Cat[] cats = { new Cat("Gizmo"), new Cat("Bella") };
Animal[] animals = cats;
```
Things are simple and life is good.
The fact that arrays are covariant makes code re-use possible.
Utility methods inside `java.util.Arrays` are perfect examples, e.g.:
```java
public static int binarySearch(Object[] a, Object key) {
  // ...
}
binarySearch(new Integer[]{1, 2, 3}, 2); // VALID
```
As usual, everything falls apart because of mutability.
Java arrays are mutable, making it possible to store the wrong type of object into an array without the compiler
being able to tell:
```java
Cat[] cats = { new Cat("Gizmo"), new Cat("Bella") };
Animal[] animals = cats;
animals[0] = new Dog("Max"); // FAILS AT RUNTIME
```
Ouch, heap pollution – an `ArrayStoreException` is thrown at runtime!
People obsessed with types tend to call this _unsound_.

## Java Generics

With Java 5 came generics, which allow "a type or method to operate on objects of various types while providing
compile-time type safety." ([Oracle Java 1.5 Docs](http://docs.oracle.com/javase/1.5.0/docs/guide/language/index.html)).
Let me repeat that: Generics were introduced to improve *type safety*.
It was thus not an option to accept the same unsound array behavior.
Because Java collections are mutable, the only option was to make a `List<T>` invariant:
```java
List<Cat> cats = Arrays.asList(new Cat("Gizmo"), new Cat("Bella"));
List<Animal> animals = cats; // DOES NOT COMPILE
```
Even though `Cat` is a subtype of `Animal`, `List<Cat>` is *not* a subtype of `List<Animal>`.
This is not very intuitive, but it is necessary to prevent heap pollution at runtime.

Obviously, we still want to write re-usable utility code.
[Wildcards](http://docs.oracle.com/javase/tutorial/extra/generics/wildcards.html) are making that possible.
Methods inside `java.util.Collections` are good examples, e.g.:
```java
public static <T> int binarySearch(List<? extends Comparable<? super T>> list, T key) {
  // ...
}
```
In Java, you thus get better compile-time safety when using generified collections than when using raw arrays.

## Scala Arrays

In Scala, things are a lot different.
`Array[T]` is Scala's representation for Java's `T[]`.
Like in Java, a Scala `Array` is mutable.
But in contrast to Java, Scala cares a lot more about compile-time type safety.
The only way to prevent unsound heap pollution is to make `Array[T]` invariant:
```scala
val cats: Array[Cat] = Array(Cat("Gizmo"), Cat("Bella"))
val animals: Array[Animal] = cats // DOES NOT COMPILE
```
Scala arrays are thus safer to use than Java arrays.

## Scala List

Things are even better for Scala `List`, which is immutable.
It is thus perfectly safe to make `List[+T]` covariant (notice the little `+`).
There's just no way to ever sneak in an object, let alone sneaking in an object with the wrong type:
```scala
val cats: List[Cat] = List(Cat("Gizmo"), Cat("Bella"))
val animals: List[Animal] = cats // VALID
```
In other words: In Scala, `List[S]` is a subtype of `List[T]` if `S` is a subtype of `T`.