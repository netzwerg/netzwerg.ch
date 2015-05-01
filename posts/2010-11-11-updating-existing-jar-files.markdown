---
comments: true
date: 2010-11-11 08:01:00
layout: post
slug: updating-existing-jar-files
title: Updating existing JAR files
wordpress_id: 182
---

This is mostly a note to myself, because every time I have to alter a JAR, it takes me way longer than it should. In essence, adding or removing files to/from an existing Java archive is not possible. The official way to go is extracting the files, changing them as needed, and re-packaging the final set. This is cumbersome and error-prone -- suddenly you end-up with a different manifest, unintentionally packaged hidden system files (like `.DS_Store` on the Mac), or loose track of the folder hierarchies.

There is one good thing about JAR files: They are also ZIP files. Thus you can rename `existingArchive.jar` to `existingArchive.zip` and suddenly have all the zip command line tool goodness on your side:

Adding a file to a ZIP archive:    
```
ls foo/bar/new.txt | zip -@ existingArchive.zip
```
Removing a file from a ZIP archive: 
```
zip -d existingArchive.zip foo/bar/old.txt
```
If you just need to alter a single archive, using one of the various ZIP freeware GUIs might be even easier.