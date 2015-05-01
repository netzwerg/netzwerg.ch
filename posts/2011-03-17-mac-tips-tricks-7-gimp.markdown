---
comments: true
date: 2011-03-17 07:27:00
layout: post
slug: mac-tips-tricks-7-gimp
title: Mac Tips & Tricks #7: GIMP
wordpress_id: 189
---
Unless you are a proud owner of a Photoshop license (or a not-so-proud owner of a PS crack), [GIMP](http://www.gimp.org/) is probably your best bet when it comes to professional image editing software. It works on all platforms, the OS X version can be downloaded [here](http://gimp.lisanet.de/Website/Download.html).

GIMP uses a multi-window layout. On the Mac, it requires Apple's X11 window environment (which explains, why your menu bar will say "X11" once you launch GIMP). Unfortunately, X11 has a very annoying behavior by default: If you click on an inactive window, the click will just focus that window. Say you want to select a different brush from the "Toolbox" window, this requires two clicks: One to activate the window, another to select the brush — for me, this made GIMP unusable on the Mac at first.

Luckily, I stumbled across a hidden X11 preference which does the trick:

<img src='/images/x11.jpg' />

After this is ticked, GIMP & X11 cooperate just as you would expect them to!
