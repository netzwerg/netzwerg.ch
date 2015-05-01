---
comments: true
date: 2011-04-14 18:43:00
layout: post
slug: scala-gems-2-getting-functional
title: Scala Gems #2: Getting Functional
wordpress_id: 191
---
As promised, here is the second post in my haphazardly thrown together Scala series. Over the past few days I have read some chapters in Odersky's [Programming in Scala](http://www.artima.com/shop/programming_in_scala_2ed), and most importantly, I have written my first ~100 lines of code (a basic Minesweeper app with a simple Swing UI). It's been a lot of fun, and I am still very enthusiastic about many new concepts & constructs. When coding, the biggest challenge is to not fall back to imperative Java style, but really use the functional concepts wherever applicable. I am probably still not radical enough, but for the time being, here is my take on revealing non-mined cells:
``` scala
def reveal = {
  if (revealed == false) {
    revealed = true
    if (adjacentMineCount == 0) {
      adjacentCells.foreach (cell => cell.reveal)
    }
  }
}
```
In summary: 1 usage of `=>` (and even a recursion ;-)).
