---
comments: true
date: 2010-11-23 13:42:00
layout: post
slug: mac-tips-tricks-4-taking-screenshots
title: "Mac Tips & Tricks #4: Taking Screenshots"
wordpress_id: 184
---

In contrast to standard Windows keyboards, the Mac one does not have a dedicated `PrtScrn` key. Taking a screenshot is thus a little bit trickier on the Mac, but the utility behind the scenes is also quite a bit smarter than its Windows companion.

For matter of completeness, the `Command-Control-Shift-3` combination is the equivalent to the Windows key: it captures the complete screen and copies the PNG image to the clipboard. The service that processes this command is called `SystemUIServer`and it understands quite a few more shortcuts, all just modifications of the standard behavior. I spare you the [details](http://guides.macrumors.com/Taking_Screenshots_in_Mac_OS_X), but here are some goodies to play around with:

**Cross-hair Cursor**

As a side-effect of the `Command-Shift-4` variant (screenshot of selected area) the mouse cursor changes to a cross-hair variant which displays the pixel-based screen coordinates. This is really handy during UI development, especially when combined with magic mouse zooming.

**Capturing Individual Windows**

While the cross-hair cursor is visible, pressing the `Space` bar will turn it into a little camera cursor which then allows capturing only the focused window. This is quite similar to the `Alt-PrtScrn` combination on Windows, except that you can actually move the (blue) selection at your will and only trigger the shot once you're ready.

**Preview/Terminal**

All commands mentioned so far either put the captured image to clipboard or save it straight to your Desktop. If you regularly want to annotate or otherwise edit your screenshots before saving them, you may prefer to trigger them from the `Preview` application (File » Take Screen Shot). Finally, there's also a command-line utility called `screencapture`, but honestly, I've never used it so far.
