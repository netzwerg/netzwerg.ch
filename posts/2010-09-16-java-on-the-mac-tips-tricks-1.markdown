---
comments: true
date: 2010-09-16 12:01:00
layout: post
slug: java-on-the-mac-tips-tricks-1
title: "Java on the Mac: Tips & Tricks #1"
wordpress_id: 180
---

Two months ago, I volunteered to be the Mac guinea pig in our team. We are developing [UI intense Java applications](http://www.genedata.com/products/screener/genedata-screener.html), and have learned from past experience that it might pay off having someone permanently develop on the OSX platform (in addition to the existing XP, Vista & Linux variety). I was lucky enough to get a brand-new iMac, with a gigantic 27-inch display.

Long story short: I love it.

However, there obviously was (and still is!) a learning curve, and I'd like to share some of my experiences. Starting with:

**Tips & Tricks #1: _How to increase the font size in Eclipse's Package Explorer_**

27 inches of display diameter are a blast, but have one big caveat: Everything is ridiculously small! While it is possible to tweak font sizes in most applications, it is in fact _not_ possible to change the font size of the system menu bar (Hard to believe, isn't it? But no, I am not willing to change the resolution, nor use zooming just to read some labels. Nor am I willing to use [Tinker Tool](http://tinkertool.softonic.de/mac) to tweak some hidden features, just to end up with labels overlapping the UI widgets, c'mon!).

Unfortunately, Eclipse (my Java IDE) is a nicely written application, which -- instead of defining its own fonts -- blends in nicely with the OS. As a consequence, browsing through a gazillion of source files in the Package Explorer, at a font size of felt 8 pt, is _impossible_.

Until Apple has fixed the issue, there is a hidden Eclipse property which can be disabled: Remove `-Dorg.eclipse.swt.internal.carbon.smallFonts` from your `$ECLIPSE_HOME » Eclipse.app » Contents » MacOS » eclipse.ini` -- doesn't exactly solve the problem, but makes things bearable.

Any actual solutions are greatly appreciated!
