---
comments: true
date: 2010-11-03 06:55:00
layout: post
slug: mac-tips-tricks-2-keyboard-navigation
title: "Mac Tips & Tricks #2: Keyboard Navigation"
wordpress_id: 181
---

Even though I like my slick & shiny magic mouse, I'm a keyboard person when it comes to daily computer life. As expected, a few things are different on the Mac compared to my previously used platforms (Linux & Windows) -- here's my selection of the  most important settings, tweaks & workarounds:

**Full Keyboard Access**

Let's assume that a program prompts you with a standard OK/Cancel dialog. On most platforms, such dialogs are navigable by keyboard: The _Tab_ key switches focus between the controls and _Enter_ triggers the selected button. Not on the Mac. For starters, full keyboard access is off by default -- turn it on via System Preferences » Keyboard » Keyboard Shortcuts » Full Keyboard Access (All Controls) . In addition, the behavior is slightly different: While the _Tab_ key works like expected, _Enter_ fires the default button (blue) while you need to press _Space_ to invoke the selected button (blue outline).

**Terminal Alt Key**

While I will probably write a separate post on Terminal issues, the most important tweak for me was the reassignment of the _Meta_ key (_Alt_ key on Windows). In bash, the _Meta_ key is quite crucial: _Meta-._ (insert last argument) IMHO is the most useful shortcut ever. Unfortunately, _Meta_ is emulated with the _Esc_ key on the Mac, which is really not very ergonomic. You can however reassign it in the _Terminal Settings_, on the _Keyboard_ tab (_"Use option as meta key"_).

**fn Key**

The function keys (_F1_ to _F12_) are another newbie pitfall. These keys are overloaded on the Mac, _F8_ e.g. plays your music library in iTunes. If you intend to use them as "raw" function keys (and e.g. use _F8_ to drive the debugger in Eclipse), you need to hold the special _fn_ key.

**Quicksilver**

One of my favorite Mac applications so far is [Quicksilver](http://www.blacktree.com/), which is best described by its mantra -- _Act without doing_. In essence, it is a smart version of _Spotlight_. A fully configurable application launcher/controller which is navigable by keyboard. Describing it further wouldn't do justice, so I'm just going to list my 3 favorite use cases and you can read the rest in one of the various online tutorials:

  1. Launching applications via keyboard. Over the last +7 years, I always launched a Terminal via _Ctrl-Esc_. Quicksilver does the trick on the Mac.
  2. Browsing directories. Quicksilver is also a smarter version of the _Finder_.
  3. Clipboard history: Maintains a (configurable) number of last clipboard entries, ready to be pasted anywhere.

I overloaded the _Spotlight_ keyboard shortcut _Ctrl-Space_ to trigger Quicksilver (and don't forget to say goodbye to the Dock, Finder & Spotlight before you install it, you will most likely never use them again ;-)).
