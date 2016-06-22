---
comments: true
date: 2012-02-08 19:51:26
layout: post
slug: intellij-idea-reveal-in-terminal
title: IntelliJ IDEA':' Reveal in Terminal
wordpress_id: 307
---
IntelliJ IDEA ships with a very handy _Reveal in Finder_ action, but unfortunately,
I am still a terminal person. Today I put together a tiny AppleScript which creates a new
[iTerm2](http://www.iterm2.com) session and changes to a directory of choice:
``` applescript
on run dir
  tell application "iTerm"
    activate
    tell last terminal
      set mysession to (make new session at the beginning of sessions)
      tell mysession
        set name to "Default"
        exec command "/bin/bash -l"
      end tell
      tell mysession
        write text "cd " & dir
      end tell
    end tell
  end tell
end run
```
IDEA allows to add custom actions via _Settings » External Tools_. Save the above script to a file (e.g.
`launchTerminalAndChangeDir.scpt`) and configure a new _Reveal in Terminal_ action as follows:

<img src='/images/reveal.jpg' />

Additionally, you may want to associate a key binding via _Settings » Keymap_. I chose `Ctrl-Shift-T`, which seems
intuitive and is not conflicting with any OSX defaults.
