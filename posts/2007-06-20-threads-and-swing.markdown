---
comments: true
date: 2007-06-20 14:54:00
layout: post
slug: threads-and-swing
title: "Threads and Swing"
wordpress_id: 137
---

Anyone who has done some serious Swing development has (hopefully) heard about the "single thread rule":

> Once a Swing component has been realized, all code that might affect or depend on the state of that component should be executed in the event-dispatching thread.</p>

The rule is well explained in the classical [threads and swing](http://java.sun.com/products/jfc/tsc/articles/threads/threads1.html) article.

`SwingUtilities.invokeLater()` is your friend, so this rule is not particularly difficult to follow. However, until a few minutes (read: [some](http://weblogs.java.net/blog/cayhorstmann/archive/2007/06/the_single_thre.html) [posts](http://bitguru.wordpress.com/2007/03/21/will-the-real-swing-single-threading-rule-please-stand-up/)) ago, i wasn't aware that the rule has changed in 2004:

> To avoid the possibility of deadlock, you must take extreme care that Swing components and models are created, modified, and queried only from the event-dispatching thread.

It is the subtle difference between _realized_ (`setVisible(true)`, `show()`, or `pack()` has been called) and _created_. While it was totally fine to launch your UI like this:
``` java
public static void main(String[] args) {
  JFrame frame = new JFrame("HelloWorldSwing");
  frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
  JLabel label = new JLabel("Hello World");
  frame.getContentPane().add(label);
  frame.pack();
  frame.setVisible(true);
}
```
you are now required to create and show all swing components in the EDT (from the [official sun swing tutorial](http://java.sun.com/docs/books/tutorial/uiswing/examples/start/HelloWorldSwingProject/src/start/HelloWorldSwing.java)):
``` java
public class HelloWorldSwing {

  private static void createAndShowGUI() {
    //Create and set up the window.
    JFrame frame = new JFrame("HelloWorldSwing");
    frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);

    //Add the ubiquitous "Hello World" label.
    JLabel label = new JLabel("Hello World");
    frame.getContentPane().add(label);

    //Display the window.
    frame.pack();
    frame.setVisible(true);
  }

  public static void main(String[] args) {
    //Schedule a job for the event-dispatching thread:
    //creating and showing this application's GUI.
    javax.swing.SwingUtilities.invokeLater(new Runnable() {
        public void run() {
          createAndShowGUI();
        }
    });
  }
}
``` 
I am a bit puzzled — can the real swing experts please stand up?
