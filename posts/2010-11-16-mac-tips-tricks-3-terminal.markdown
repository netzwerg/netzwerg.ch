---
comments: true
date: 2010-11-16 07:30:00
layout: post
slug: mac-tips-tricks-3-terminal
title: Mac Tips & Tricks #3: Terminal
wordpress_id: 183
---

One of the reasons I really love the Mac as a development machine, is the fact that it has a real terminal. As much as I appreciate the nice Cocoa GUI, the command line interface (CLI) is often the most efficient way to control files and directories, especially for bulk operations.

The default shell on Mac OS X is Bash, and it comes equipped with a variety of commands and utilities. However, the way it is initially configured on the Mac is quite disappointing. Thus, here are a few simple tweaks to improve it:

**Coloring**

The first weakness becomes visible after a simple `ls` command: The default Terminal is not colored. I am not referring to the simple background/foreground themes that are easily controllable from the settings, but I'd like directories to be displayed in a different color than files, symbolic links, etc. On the Mac, the best place to control bash settings is `~/.bash_profile`. Open it with any editor an add the following two lines to it:
```
export CLICOLOR=1
export LSCOLORS=dxfxcxdxbxegedabagacad
```
You will then need to issue a `source ~/.bash_profile` for your changes to take effect -- tada!

**Prompt**

Another simple improvement is the configuration of a better prompt (the text to the left of your blinking command line cursor). This is controlled via the `PS1` environment variable (again in `~/.bash_profile`). A good start could be
```
PS1='u@h:w$ '
```
**Aliases**

Whenever you catch yourself repeating lengthy commands, consider adding an alias configuration to `~/.bash_profile`. A standard one covers the "show a long listing of all files (including hidden ones) in the current directory":
```
alias ll='ls -al'
```
**Open Files & Directories**

The Terminal comes with an `open` command which does exactly what it says on the tin (do a `man open` to read the fine print). The two variants I use most are `open .` to open a Finder window for the current directory, and `open -a TextMate.app foo.txt` to edit a text file in my favorite editor (no, it's not vi nor emacs). Again, this command is way too long, so I mapped it to `e` (like edit) in my `~/.bash_profile`:
```
e () { open -a TextMate.app $*; }
```
**Shortcuts**

And finally, my personal faves among bash shortcuts:

`Ctrl-a` -- go to the start of command line  
`Ctrl-e` -- go to the end of command line  
`Meta-f` -- go to next word in command line  
`Meta-b`  -- go to previous word in command line  
`Ctrl-k` -- delete from cursor to end of command line  
`Ctrl-u` -- delete from cursor to beginning of command line  
`Arrow Up` -- insert previous command in history  
`Ctrl-r` -- reverse serach in history file  
`Meta-.` -- insert last argument  

Don't forget to map the Terminal itself to a handy Quicksilver shortcut. [As mentioned already](http://www.netzwerg.ch/2010/11/mac-tips-tricks-2-keyboard-navigation.html), mine is launched via `Ctrl-Esc`.
