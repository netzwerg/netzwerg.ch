---
comments: true
date: 2011-01-27 12:24:00
layout: post
slug: mac-tips-tricks-6-applescript
title: "Mac Tips & Tricks #6: AppleScript"
wordpress_id: 186
---
<blockquote>
  <p>AppleScript was designed to be used as an accessible end-user scripting language, offering users an intelligent mechanism to control applications, and to access and modify data and documents.</p>
  <small><a href="http://en.wikipedia.org/wiki/AppleScript">Wikipedia</a></small>
</blockquote>

Yet another scripting language -- but honestly, the fact that it is built into Mac OS (no installation) and was initially designed to automate repetitive tasks, makes the getting started quite easy & fun.

Here's my problem (and how I managed to solve it with AppleScript in about 30 minutes): As you might know by now, I am a happy Quicksilver user and I sometimes take it as a challenge to do as much of my programming & office work via keyboard as possible. One task I regularly do throughout the day, is creating "Task" entries ;-) I do this via the "Mail" application, which eventually adds its entries to Exchange, so they are accessible from any machine/device. Long story short, adding tasks should be simple via Quicksilver, given that it can cope with textual input and pass it on to any AppleScript. Here's the `todo.scpt` that I came up with (aka [structured procrastination](http://www.structuredprocrastination.com/)):
``` 
using terms from application "Quicksilver"
 on process text inputText
  tell application "Mail" to activate
  tell application "System Events"
   keystroke "y"
      using {command down, option down}
   keystroke inputText
   key code 36
  end tell
 end process text
end using terms from
```
Or in other words:
```
# use Quicksilver's dictionary
# Quicksilver's script handler
# bring up "Mail"
# access keystroke functionality
# create TODO item via keyboard
# with modifier keys
# insert text from Quicksilver
# enter
```
To try it out yourself, just store the script in `~/Library/Application Support/Quicksilver/Actions` and invoke it as usual:

1. Invoke Quicksilver and press period to go to text entry mode
2. Enter your task (e.g. "Remember the milk")
3. Hit tab and start typing "todo" until the script action shows
4. Hit Enter and watch your task being created

I am confident that you can come up with even better AppleScript usages to waste the rest of your day ;-)
