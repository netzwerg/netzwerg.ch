---
comments: true
date: 2011-09-28 15:03:38
layout: post
slug: groovy-gems-1-generating-data-matrices
title: Groovy Gems #1: Generating Data Matrices
wordpress_id: 287
---
In contrast to its [Scala friend](/blog/2011/08/23/scala-gems-4-generating-data-matrices/), this Groovy one-liner is handy _and_ readable:
``` groovy
7.times { 3.times { print("X\t") } print("\n") }
```
