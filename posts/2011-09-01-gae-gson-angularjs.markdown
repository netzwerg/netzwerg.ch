---
comments: true
date: 2011-09-01 20:51:03
layout: post
slug: gae-gson-angularjs
title: GAE + Gson + AngularJS
wordpress_id: 259
---
I have been playing with [AngularJS](http://angularjs.org) lately. It is a JavaScript library with the following tag line:
{% blockquote %}
What HTML would have been had it been designed for web apps.
{% endblockquote %}
All I can say after a few hours: HTML would haven been great! It would have had a clear MVC separation, data binding, dependency-injection, and it would have kept development simple & fun.

My web app know-how is very rusty, so I hacked together a simple proof-of-concept, just to see how AngularJS actually _feels_. Here are the crucial snippets from my Google App Engine Java back-end (to generate JSON), and the HTML/AngularJS view (to render it).

The Servlet part:
``` java
protected void doGet(...) {
  response.setContentType("text/plain");
  String[] movies = new String[]{
    "Buffalo 66",
    "Jackie Brown",
    "Vicky Cristina Barcelona"};
  response.getWriter().print(new Gson().toJson(movies));
}
```
The AngularJS Controller:
``` javascript
function MovieListCtrl($xhr) {
  var self = this;
  $xhr('GET', 'http://localhost:8080/json',
    function(code, response) {
      self.movies = response;
    }
  );
}
```
The HTML/AngularJS View:
``` html
<body ng:controller="MovieListCtrl">
  Rahel's favorite movies:
  <ul>
    <li ng:repeat="movie in movies">
      {movie}
    </li>
  </ul>
</body>
```
Check out the official [AngularJS Tutorial](http://docs.angularjs.org/#!/tutorial) for more details and a ton of cool examples.