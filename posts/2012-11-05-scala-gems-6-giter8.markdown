---
comments: true
date: 2012-11-05 09:41:55
layout: post
slug: scala-gems-6-giter8
title: "Scala Gems #6: Giter8"
wordpress_id: 427
---
When building Scala projects, your best bets are to either use the official [sbt](http://www.scala-sbt.org/), the
_simple build tool_ which is actually not so simple, or [Gradle](http://gradle.org/), my personal preference.

Both of them are very much based on conventions, i.e. they require only minimal configuration if you stick to the rules of a
default project structure. But what is the default project structure? And how can you set one up with minimal effort?

Enter [giter8](https://github.com/n8han/giter8): A command line tool to generate files and directories from templates
published on github.

**For sbt:**

The official sbt templates maintained by Typesafe can be found [here](http://typesafe.com/stack/download#template) (note 
that they publish g8 templates for their complete stack, even for examples & tutorials).

**For Gradle:**

There's no official Gradle counterpart, but [https://github.com/coacoas/scala-gradle.g8](https://github.com/coacoas/scala-
gradle.g8) works like a charm.

As usual, just fork & improve if you need the templates to behave differently.
