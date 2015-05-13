---
title: Java 8 Unsigned Int
date: 2015-05-13 06:30
---
When I recently profiled one of our applications, it turned out that a lot of memory was wasted on a huge number of
`long` primitives. They were used to represent IDs, which were originating from a 3rd party text file. Someone must
have loved huge numbers, so they chose an ID format that didn't fit into an `int`.

Well, while being huge, the IDs were at least always positive. So I was confident that some data massage would allow
me to squeeze them into primitive `int` values eventually. It took me be surprise that Java 8 actually supports unsigned
primitives out of the box. Guess we all missed that while wrapping our heads around lambdas and streams, right?

Here's how it works:
``` java
public class UnsignedIntTest {

    @Test
    public void roundTrip() {

        // compile error: 2^32 - 1 is too large for an int
        // int intValue = 4294967295;

        long longValue = (long) Math.pow(2, 32) - 1;
        String longValueAsString = String.valueOf(longValue);

        int unsignedInt = Integer.parseUnsignedInt(longValueAsString);

        long result = Integer.toUnsignedLong(unsignedInt);

        assertEquals(longValue, result);

    }

}
```