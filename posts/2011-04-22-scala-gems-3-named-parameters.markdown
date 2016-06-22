---
comments: true
date: 2011-04-22 20:21:00
layout: post
slug: scala-gems-3-named-parameters
title: "Scala Gems #3: Named Parameters"
wordpress_id: 192
---
Just a quick one this time (it's easter holiday and the weather is simply too beautiful to waste time in front of a computer). Anyway, have a look at this constructor call:

``` scala
MigrosEgg(GREEN, BLUE)
```

Unless you're Swiss and just know that I'm referring to the "Extra" variant, wouldn't it be a lot less ambiguous to write

``` scala
val aMigrosEgg = MigrosEgg(dotColor = GREEN, bgColor = BLUE)
```

As of Scala 2.8 you can name your arguments. You can also leave out those which have default values, shuffle their order -- or you can simply have another one of those little suckers:

``` scala
val notAMigrosEgg = aMigrosEgg.copy(dotColor = PINK)
```

Happy easter everyone!