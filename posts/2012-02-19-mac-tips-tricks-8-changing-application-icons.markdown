---
comments: true
date: 2012-02-19 14:24:50
layout: post
slug: mac-tips-tricks-8-changing-application-icons
title: "Mac Tips & Tricks #8: Changing application icons"
wordpress_id: 317
---
There are many reasons why you might want to change an application's icon. In my case, I wanted to be able to
distinguish the stable IntelliJ IDEA 11 version from an early access 11.1 build:

<img src='/images/idea_icons.jpg' />

Here's how I changed the default (blue) icon to the new (pink) one:

First, reveal the application's installation location in _Finder_ (from the _Dock_ context menu: _Options » Show in Finder_).
From within _Finder_, invoke the context menu on the selected application, and _Show Package Contents_. Locate the icon file
(`*.icns`) inside _Contents » Resources_. Make a backup copy, edit the icon in your favorite image editor (I simply overlaid
a red color filter in [Acorn](http://flyingmeat.com/acorn/)), and save it as a `*.png`.

Now comes the tricky part: [Apple's icon format](http://en.wikipedia.org/wiki/Apple_Icon_Image_format) includes more than
just an image, it actually contains a collection of images in different sizes, resolutions & states. To create a new `*.icns`
file, launch _Icon Composer_ (which ships with OSX). Open the original application icon to check which sizes your new icon
should support:

<img src='/images/icon_composer.jpg' />

Create a new file, drag & drop your edited `*.png` to the required image size containers, and save the result.
Re-launch your application -- tada!
