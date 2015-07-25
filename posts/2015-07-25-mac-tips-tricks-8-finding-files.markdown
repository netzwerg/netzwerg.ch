---
title: Mac OSX Tips & Tricks #8: Finding Files via Terminal
date: 2015-05-29 14:30
---
This is how you recursively search all `notes.txt` files in your home directory (`~`)
for the text snippet `foo` (from an OSX terminal):

```bash
mdfind -name notes.txt -onlyin ~ -0 | xargs -0 grep -i "foo"
```

This has at least 3 advantages over the traditional `find/grep` combo:

* `mdfind` is the terminal version of Spotlight: It is blazingly fast because it uses an
index
* `mdfind` does not lead to "Permission denied" noise
* The `-0` flag works around spaces in file/folder names

Happy searching!