---
comments: true
date: 2009-04-28 20:30:00
layout: post
slug: klassische-akupunktur-ch
title: "klassische-akupunktur.ch"
wordpress_id: 164
---

Tomorrow, my sister Carol will celebrate the opening of her acupuncture practice. Over the last month, I had the pleasure to help her design and implement a corporate identity, including business cards, flyers, and a website. The [site ](http://klassische-akupunktur.ch)actually went live just a few moments ago, so while everything is still fresh and warm, I'd like to share some of the experiences i have made in the course of its making:

The most profound decision was probably to use [scalable vector graphics](http://en.wikipedia.org/wiki/Scalable_Vector_Graphics) as a result-independent model behind all work. This turned out to be a good decision. In practice, we initially designed everything in [Inkscape](http://www.inkscape.org) and later converted to pdf (for print), or to jpg/gif (for the web). Inkscape itself is a simple and stable open source application which is comparable to illustrator, freehand, or coreldraw. The pdf-conversion is built-in and just works (print margins can only be defined via script though). The creation of bitmap images however is very disappointing. No matter how much i fiddled, the font rendering seemed to be broken and the results all looked very crappy (probably due to the missing font hinting, who knows?). Luckily, i remembered the java-based batik toolkit, which includes a stand-alone [svg rasterizing utility](http://xmlgraphics.apache.org/batik/tools/rasterizer.html). It is a simple jar file that can be invoked from the command line and which produces great results.

With the pdfs, the printing was basically solved – the visuals turned out exactly as we designed them, so we were able to focus our resources on the website.

My web design "skills" were dating back to the time when tables and invisible spacer.gifs used to be the ultimate tools, so i first had to brush-up my css knowledge (or actually: steal snippets from here and there – and spend the rest of the day on [http://www.quirksmode.org](http://www.quirksmode.org/)). Now that it's done, I really like the clean separation between content and style. I used [eclipse](http://eclipse.org/) to (hand-)write all html and css code, but even in an editor I know cold, it was a pain to e.g. manually insert the same [IE 8 compatibility tag](http://weblog.helpware.net/?p=119) on every single page. Thus, in retrospect, we probably should have used a content management system, even for a very small site.

The main part that's still not done is the complete search engine optimization work – while it's probably the most important part, I keep procrastinating. If anyone is an expert, please speak up (and I am confident that we can arrange for some needle pain in return ;-)).