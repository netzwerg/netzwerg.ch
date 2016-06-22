---
comments: true
date: 2012-09-28 11:29:10
layout: post
slug: scala-gems-5-fp-principles-coursera
title: "Scala Gems #5: FP @ Coursera"
wordpress_id: 337
---
Along with more than 40k others, I am in the second week of Odersky's free online course titled _"Functional Programming
Principles in Scala"_. The video lectures are really well structured and very entertaining -- it's great to learn from
the master himself. Given that the course only requires 1 year of programming background, the assignments are not too
complex yet, but I have no doubt that things will get trickier soon!

Afaik, it's still not too late to register, and it's FREE:
[http://www.coursera.org/course/progfun](http://www.coursera.org/course/)

Regarding tool setup: Don't even download the Eclipse-based Scala IDE, it sucks **big** time. How can these people get
anything done with a piece of crap that crashes every few minutes, even with just a 2-file project?! Luckily, the 
assignments can as well be completed with [IntelliJ IDEA](http://www.jetbrains.com/idea/), with the community edition Scala 
plugin.

To end this post with some code, this is how the first exercise looks like:
``` scala
def pascal(c: Int, r: Int): Int = ???
```
The cool thing is that this code compiles -- Scala method naming FTW!
