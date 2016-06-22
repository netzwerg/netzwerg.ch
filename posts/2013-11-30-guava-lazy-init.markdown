---
layout: post
title: "Guava Lazy Init"
date: 2013-11-30 07:17
comments: true
---
Note to self: How to lazily initialize a value with Java/Guava
``` java
private final Supplier<Integer> lazyValue = Suppliers.memoize(new Supplier<Integer>() { 
  public Integer get() {
    return 42;
  };
});
```

