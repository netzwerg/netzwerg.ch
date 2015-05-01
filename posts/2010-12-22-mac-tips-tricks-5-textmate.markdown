---
comments: true
date: 2010-12-22 07:32:00
layout: post
slug: mac-tips-tricks-5-textmate
title: Mac Tips & Tricks #5: TextMate
wordpress_id: 185
---

After almost 10 years of professional software development, I had my share of [Editor war](http://en.wikipedia.org/wiki/Editor_war), and I tend to avoid discussions around it as much as possible. My recent switch to the Mac however forced me to switch to a new editor (wouldn't have happend to neither _emacs_ nor _vi_ folks, would it?), and since the pre-installed TextEdit is really not an option, I spent 50 bucks on a [TextMate](http://macromates.com/) license. Here are 3 reasons why I think it was totally worth it:

**Shallow Learning Curve**

I vividly remember my first encounter with _vi_: After my simple keystrokes totally messed up the file, I couldn't even figure out how to close the editor. Today, after way too many introductory tutorials, I know just enough to edit a line, save, and exit without further damage, but I still try to avoid _vi_ like the plague.

_TextMate_ is just the opposite: It pretends to be a simple editor that just works, while actually it is very "extensible" and extremely "powerful" (my favorite word in editor-war-lingo). Its richness comes in customizable bundles, macros & commands (all extensively documented, so I won't repeat the basics here). What makes the learning curve shallow, is that you can conquer one after the other, just when they come in handy. To illustrate that further: I installed TextMate about 2 months ago, fired it up maybe 20 times, didn't read more than 2 pages of tutorials, but can already list two features that facilitate my programming life:

**Command Execution**

The first great feature is running shell commands from the editor, and inserting results straight into the document: Type `cal`, press Ctrl-R (_Text » Execute Line Inserting Result_), and TextMate will insert this month's calendar in textual form. A simple one-liner can generate output for which you would otherwise need to fire up a terminal or even a spreadsheet application: `ruby -e "3.times { puts rand }"`.

**Multi-Line Editing**

Just yesterday I had to reformat column-based test data (available in a spreadsheet) to pass it into the Java `Arrays.asList(T... a)` method. Essentially, I had to reformat values like these
```
aaa
bbb
ccc
```
into a comma separated array of strings like these
```
"aaa", "bbb", "ccc"
```
My _bash/awk/sed_ knowledge is really poor, so one simple way would have been a _Find/Replace_ with regular expressions (to match the line beginning/ending). With TextMate's column editing support this is even simpler: Select the column, press Alt/Option (_Edit » Change to Column Selection_), and watch how the cursor now spans across all selected lines. In this mode, every keystroke is reflected in each line and it is thus easy to insert the quotes and comma at the beginning and end. Joining the string literals to one line is then a simple matter of another shortcut (Ctrl-Shift-J or _Bundes » Text » Join Line With Next_). Obviously, editing multiple lines is slightly more complicated when the lines have various length, but with _Text » Edit Each Line in Selection_ this is a piece of cake as well.
