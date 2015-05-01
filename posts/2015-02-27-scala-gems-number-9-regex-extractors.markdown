---
layout: post
title: Scala Gems #9: Regex Extractors
date: 2015-02-27 16:33:55 +0100
comments: false
---
Suppose you have a simple date string: `"2015-02-27"`

Regular expressions allow to parse the date and extract parts thereof[^1]: `(\d\d\d\d)-(\d\d)-(\d\d)` defines a pattern
which matches the digits and defines capturing groups for the year, month, and day parts.  

In Java, a simple example usage would look like this:

``` java
Pattern pattern = Pattern.compile("(\\d\\d\\d\\d)-(\\d\\d)-(\\d\\d)");
Matcher matcher = pattern.matcher("2015-02-27");
while (matcher.find()) {
    System.out.println("Year: " + matcher.group(1));
    System.out.println("Month: " + matcher.group(2));
    System.out.println("Day: " + matcher.group(3));
}
```

Accessing the groups by index is rather awkward and error prone. Luckily, Java 7 introduced support for named groups:

``` java
Pattern pattern = Pattern.compile("(?<year>\\d\\d\\d\\d)-(?<month>\\d\\d)-(?<day>\\d\\d)");
Matcher matcher = pattern.matcher("2015-02-27");
while (matcher.find()) {
    System.out.println("Year: " + matcher.group("year"));
    System.out.println("Month: " + matcher.group("month"));
    System.out.println("Day: " + matcher.group("day"));
}
```

That's better, but I personally don't like how the group names pollute the pattern. Regular expressions are hard
to read already, the Java escape characters add yet more clutter, and the additional `?<group>` constructs are a
kiss of death.

Let's look at how the same problem can be tackled in Scala:

[According to the docs](http://www.scala-lang.org/api/current/index.html#scala.util.matching.Regex), the canonical way
to create a `Regex` is by using the method `r`, which is provided implicitly for strings:

``` scala
val Date = """(\d\d\d\d)-(\d\d)-(\d\d)""".r
```

Note the triple quotes, which allow to use the backslashes without further escaping. While this is nice, the true
advantage of Scala is that regular expressions can be used as extractors in a pattern match. The pattern stays plain
and simple, and yet we have all the freedom to name groups as we please:

``` scala
"2015-02-27" match {
  case Date(year, month, day) =>
    println(s"Year: $year")
    println(s"Month: $month")
    println(s"Day: $day")
}
```

Look ma, no clutter!
[^1]:Yes, using [java.time.format.DateTimeFormatter](https://docs.oracle.com/javase/8/docs/api/java/time/format/DateTimeFormatter.html) would be easier in this simple case.
