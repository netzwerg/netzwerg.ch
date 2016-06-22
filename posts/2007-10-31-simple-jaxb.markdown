---
comments: true
date: 2007-10-31 21:00:00
layout: post
slug: simple-jaxb
title: "Simple JAXB"
wordpress_id: 142
---

At [work](http://www.genedata.com/screener), we use the _Java Architecture for XML Binding_ ([JAXB](http://en.wikipedia.org/wiki/JAXB)) for almost all of our XML input/output. Our approach consists of the following steps:

  1. We start with the definition of a schema	
  2. Use ant to compile Java classes from this schema (via xjc)
  3. Have a dedicated conversion layer where we translate back and forth between the generated Java classes and our business objects.

We have deliberately chosen this architecture because we need total control over XML format changes (1.), want to automate the process as much as possible (2.), and want to keep all xml-related code in a dedicated layer (3.).

This approach works really well for a big project. However, if all you need is reading a simple xml and accessing its data from your java classes (or vice-versa: dumping parts of your java objects to xml), you'd probably want to use something less heavy-weight.

what's quite cool, is that you can also use jaxb for such simple tasks. when the jaxb compiler generates java classes, it uses annotations like `@XmlRootElement` to map from java types to xml elements. manually annotating your java classes can thus serve as a very simple marshalling/unmarshalling strategy, which doesn't involve a schema, nor an xjc task, nor any further manual work.

Here is an example of a simple Java → XML → Java round-trip:
``` java
JAXBContext context = JAXBContext.newInstance(Foo.class);

Foo foo = new Foo();
foo.setText("bar");
System.out.println("Original: " + foo);

StringWriter result = new StringWriter();
Marshaller marshaller = context.createMarshaller();
marshaller.marshal(foo, result);
String xml = new String(result.getBuffer());
System.out.println("Marshalled: " + xml);

Unmarshaller um = context.createUnmarshaller();
Object o = um.unmarshal(new StringReader(xml));
System.out.println("Unmarshalled: " + o);

@XmlRootElement
private static class Foo {

    @XmlAttribute
    private String text;

    public void setText(String text) {
        this.text = text;
    }

    @Override
    public String toString() {
        return "["
          + Foo.class.getSimpleName()
          + "] " + text;
    }
}
```

The fact that JAXB 2.0 is part of [Java 6](http://java.sun.com/javase/6/) makes this approach even more attractive.
