---
comments: true
date: 2011-08-23 12:15:00
layout: post
slug: scala-gems-4-generating-data-matrices
title: "Scala Gems #4: Generating Data Matrices"
wordpress_id: 193
---
Generating matrix-shaped test data is easy in any spreadsheet application: Enter a few cell values and use the fill handle to complete all others. But firing up a spreadsheet somehow feels lame. This Scala three-liner can do the same:
``` scala
println(Array.fill(7, 3)("X").map(
  _.mkString("\t")).mkString("\n")
)
```
Is it readable? No. Is it handy? Yes!
