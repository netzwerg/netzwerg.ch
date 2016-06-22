---
layout: post
title: "Scala Gems #8: Breeze"
date: 2012-12-11 14:11
comments: true
---
I have recently bought Hilary Mason's [An Introduction to Machine Learning with Web 
Data](http://shop.oreilly.com/product/0636920017493.do) to refresh my rusty ML 
memory. The video class offers a very solid, yet entertaining mix of 
coding and theory, and is definitely worth watching.

Hilary is coding in Python, but I took her excellent examples as an inspiration to 
further practice my Scala. Based on [Breeze](http://www.scalanlp.org), a set 
of libraries for machine learning and numerical computing, I wrote my first little 
classifier.

My classifier uses a
[support vector machine (SVM)](http://en.wikipediaorg/wiki/Support_vector_machine) 
to distinguish images of two distinct categories &mdash; one containing circles, 
the other containing crosses. I used 10 different fonts to create the two sets of 
test images:

<img src='http://raw.github.com/netzwerg/ml-scala/master/src/main/resources/o/0.png' />
<img src='http://raw.github.com/netzwerg/ml-scala/master/src/main/resources/o/1.png' />
<img src='http://raw.github.com/netzwerg/ml-scala/master/src/main/resources/o/2.png' />
<img src='http://raw.github.com/netzwerg/ml-scala/master/src/main/resources/o/3.png' />
<img src='http://raw.github.com/netzwerg/ml-scala/master/src/main/resources/o/4.png' />
<img src='http://raw.github.com/netzwerg/ml-scala/master/src/main/resources/o/5.png' />
<img src='http://raw.github.com/netzwerg/ml-scala/master/src/main/resources/o/6.png' />
<img src='http://raw.github.com/netzwerg/ml-scala/master/src/main/resources/o/7.png' />
<img src='http://raw.github.com/netzwerg/ml-scala/master/src/main/resources/o/8.png' />
<img src='http://raw.github.com/netzwerg/ml-scala/master/src/main/resources/o/9.png' />

<img src='http://raw.github.com/netzwerg/ml-scala/master/src/main/resources/x/0.png' />
<img src='http://raw.github.com/netzwerg/ml-scala/master/src/main/resources/x/1.png' />
<img src='http://raw.github.com/netzwerg/ml-scala/master/src/main/resources/x/2.png' />
<img src='http://raw.github.com/netzwerg/ml-scala/master/src/main/resources/x/3.png' />
<img src='http://raw.github.com/netzwerg/ml-scala/master/src/main/resources/x/4.png' />
<img src='http://raw.github.com/netzwerg/ml-scala/master/src/main/resources/x/5.png' />
<img src='http://raw.github.com/netzwerg/ml-scala/master/src/main/resources/x/6.png' />
<img src='http://raw.github.com/netzwerg/ml-scala/master/src/main/resources/x/7.png' />
<img src='http://raw.github.com/netzwerg/ml-scala/master/src/main/resources/x/8.png' />
<img src='http://raw.github.com/netzwerg/ml-scala/master/src/main/resources/x/9.png' />

I used the red component of each pixel's RGB value as a feature vector. Given that
all images are in grey scale, this seemed like a good first choice. And indeed, 
after training the SVM with 9 images of each category, the 10th image can be 
classified with a probability of roughly 0.75.

All code can be found on [GitHub](http://github.com/netzwerg/ml-scala).
