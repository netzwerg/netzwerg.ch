---
title: Partial Function Application in Haskell
date: 2015-05-29 14:30
---
[Learning myself a Haskell should be for great good](http://learnyouahaskell.com/), so grasping the basics is essential.
I am forcing myself to go slowly, taking baby steps in the REPL.

Today, I came across this really simple example:
``` haskell
map (>10) [1,42,99]
```
Figuring out that this will give `[False,True,True]` is not exactly rocket science, but what exactly **is** this
`(>10)` term? Given that we're talking about Haskell, it **must** be a function, right? Also, inferring from the types
involved, it must be a function that accepts a `Num` and returns a `Bool`. But how does this come about?

Back to more basics -- here's another simple function:
``` haskell
greaterThan :: Int -> Int -> Bool
greaterThan x y = x > y

greaterThan 10 42 -- False
```
Confusingly, the type signature does not distinguish between parameters and the return type. This has been my most
important Haskell epiphany yet: **Every function in Haskell actually only takes one parameter**

<img src='/images/sink.jpg' style='padding-top:30;padding-bottom:30;'/>

Calling `greaterThan 10 42` just *looks* as if we were passing two parameters, but we're actually calling the function
with one parameter, getting a function from `Int -> Bool` in return, and then immediately calling this function with the
second parameter to get the result. Let's make this explicit by breaking the call down to the individual steps:
``` haskell
tenGreaterThan = greaterThan 10 -- returns a function with Int -> Bool signature
tenGreaterThan 42 -- returns the final result (still False)
```
Now back to the `(>10)` term: Pretty much everything in Haskell is a function, so `>` is a function, too. It is usually
called with infix notation, e.g. `10 > 42`, but it can actually be converted to a postfix function by putting it in
parenthesis:
```haskell
(>) 10 42 -- still False
```
Obviously, we can also partially apply here:
```haskell
tenGreaterThan = (>) 10
tenGreaterThan 42 -- also still False
```
Back to our initial example -- here it is again:
``` haskell
map (>10) [1,42,99] -- [False,True,True]
```
Applying `(>10)` to 42 correctly gives `True`, but applying `(>)10` to 42 did give `False` in the example before, right?
Things that make you go hmmmm...

Turns out the parenthesis are **really** crucial here! In Haskell there is a syntax called
[sectioning](https://wiki.haskell.org/Section_of_an_infix_operator), which is
special for partial application on infix operators. The term `(>10)` corresponds to a *right section*, which
is equivalent to `flip (>) 10`. No wonder the semantics seemed flipped!

Long story short: While it is quite intuitive that the `(>10)` corresponds to a `\x -> x > 10` in the initial map example,
 the magic happens through Haskell's special sectioning syntax.