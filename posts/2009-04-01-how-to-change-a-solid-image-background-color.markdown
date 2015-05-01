---
comments: true
date: 2009-04-01 06:55:00
layout: post
slug: how-to-change-a-solid-image-background-color
title: How to change a solid image background color
wordpress_id: 161
---

Assume you would like to change the background color of the following image to black:

<img src="/images/blue_on_white.gif"/>

A quick attempt to do so could include some _magic wand_ or _lasso_ tool wizardry (in [Gimp](http://www.gimp.org/), Photoshop, or any other image manipulation program).

Bad solution:

<img src='/images/blue_on_black_with_halo.gif' />

Because the blue circle is semi-transparent and its edge is anti-aliased, the result looks rather crappy (the white edge is also known as the _halo-effect_). No matter how much you fiddle with the selection tool parameters, what's wrong is the usage of the _selection_ tool in the first place.

The proper approach is to convert the original background color to a transparent (alpha) color. In gimp 2.x the corresponding utility can be found in the "Colors" context menu and is called "Color to Alpha" (I am confident that you will find the equivalent in your program of choice):

<img src='/images/color_to_alpha.gif' />

It is a simple matter of adding a black layer to get to the desired result:

<img src='/images/blue_on_black.gif' />

_Note:_ depending on the original image type, you will need to convert your image to RGB mode in order to support transparency (otherwise the "Color to Alpha" menu command will be disabled).
