---
title: Programmatic JavaFX Styling
date: 2016-05-03 08:45
---
JavaFX components can be styled via CSS.
This is great, but sometimes wiring up a separate CSS file to set a simple background color is a bit over the top.
That's where the `setStyle` method comes in handy:

```java
Label label = new Label("Hello");
label.setStyle("-fx-background-color: deeppink");
```

CSS classes are used to style more advanced components.
A `ScatterChart`'s plot background can e.g. be styled via the `chart-plot-background` class.
This is how the styling would look like in a CSS file:
```css
.chart-plot-background {
    -fx-background-color: transparent;
}
```
Unfortunately, we cannot simply cram the same CSS into the `setStyle` method:
```java
NumberAxis xAxis = new NumberAxis();
NumberAxis yAxis = new NumberAxis();
ScatterChart<Number, Number> chart = new ScatterChart<>(xAxis, yAxis);

// DOES NOT COMPILE
chart.setStyle(
        ".chart-plot-background {\n" +
        "    -fx-background-color: transparent;\n" +
        "}"
);
```
Instead, the `lookup` method can be used to navigate the CSS hierarchy:
```java
chart.lookup(".chart-plot-background").setStyle("-fx-background-color: transparent");
```
In case you were wondering why you would ever want to have a transparent chart background:
The `ScatterChart` component does not support line connections.
Using a `StackPane` to layer a `ScatterChart` and a `LineChart` can serve as a simple workaround.
The chart in the top layer must then have a transparent background.