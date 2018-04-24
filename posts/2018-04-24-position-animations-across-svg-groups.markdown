---
title: "Position animations across SVG groups"
date: 2018-04-24 11:30
---
Animated transitions between UI states can greatly enhance the usability of applications because they reduce the likelihood of [change blindness](https://en.wikipedia.org/wiki/Change_blindness).

In a typical web application, UI state is represented by the DOM.
Instead of switching from one DOM state to the next instantaneously, animations smoothly transition DOM element properties over time.

On a technical level, a multitude of libraries provide abstractions to create animated transitions with minimal effort.

This is how an animation of an SVG circle would look like with D3.js (notice the "Rerun" button which appears once you hover the right pane):
\
&nbsp;
<p data-height="265" data-theme-id="0" data-slug-hash="JvXobe" data-default-tab="js,result" data-user="netzwerg" data-embed-version="2" data-pen-title="D3.js Animation" class="codepen">See the Pen <a href="https://codepen.io/netzwerg/pen/JvXobe/">D3.js Animation</a> by Rahel Lüthy (<a href="https://codepen.io/netzwerg">@netzwerg</a>) on <a href="https://codepen.io">CodePen</a>.</p>
<script async src="https://static.codepen.io/assets/embed/ei.js"></script>
\
&nbsp;

D3.js is interpolating the circle's `cx` attribute from `10` to `190` pixels over the course of a second.

Well, this is a simple example because the SVG scene graph is simple – it just contains one circle.
Unfortunately, SVG scene graphs tend to get very complex in real applications.
One way to tame this complexity, is by breaking applications into components, each responsible for rendering a sub-graph of the final SVG.

## Components FTW

Component-based libraries like React come in handy here: Each component is responsible for rendering a small, human-digestible SVG chunk.

Here's a React component which renders a box with a circle at its center:

<img src='/images/box-static-circle.png' width="25%" style="padding: 20 0 20 0;"/>

```typescript
const Box = ({width, height}: BoxProps) => {
    return (
        <g>
            <rect width={width} height={height}/>
            <circle cx={width / 2} cy={height / 2}/>
        </g>
    );
};
```

Using simple composition, we can then stack two boxes on top of each other:

<img src='/images/boxes-static-circle.png' width="25%" style="padding: 20 0 20 0;"/>

```typescript
<g>
    <Box width={width} height={height / 2} />
</g>
<g transform={`translate(0,${height / 2})`}>
    <Box width={width} height={height / 2} />
</g>
```

Note how the second box gets moved to the bottom by translating its container group by `height/2`.

To make things a bit more interesting, let's make the circle alternate between boxes at a fixed interval:

<img src='/images/boxes-jumping-circle.gif' width="25%" style="padding: 20 0 20 0;"/>

```typescript
type State = {
    readonly box: 'UPPER' | 'LOWER';
};

class App extends React.Component<object, State> {

    private readonly circleId = 'circleId';
    private timer: Timer;

    constructor(props: object) {
        super(props);
        this.state = {box: 'UPPER'};
    }

    componentDidMount() {
        this.timer = setInterval(() => this.switchBox(), 1000);
    }

    switchBox() {
        this.setState(prevState => ({box: prevState.box === 'UPPER' ? 'LOWER' : 'UPPER'}));
    }

    render() {

        const viewBox = {width: 100, height: 100};
        const margin = {top: 10, right: 10, bottom: 10, left: 10};
        const width = viewBox.width - margin.left - margin.right;
        const height = viewBox.height - margin.top - margin.bottom;

        return (
            <div className="App">
                <svg viewBox={`0 0 ${viewBox.width} ${viewBox.height}`}>
                    <g transform={`translate(${margin.left}, ${margin.top})`}>
                        <g>
                            <Box
                                circleId={this.circleId}
                                showCircle={this.state.box === 'UPPER'}
                                width={width}
                                height={height / 2}
                            />
                        </g>
                        <g transform={`translate(0,${height / 2})`}>
                            <Box
                                circleId={this.circleId}
                                showCircle={this.state.box === 'LOWER'}
                                width={width}
                                height={height / 2}
                            />
                        </g>
                    </g>
                </svg>
            </div>
        );
    }

    componentWillUnmount() {
        clearInterval(this.timer);
    }

}
```

*Complete code on [GitHub](https://github.com/netzwerg/react-animation-demo)*

## Smoothly Moving Circles

Blinking UIs are almost never a good idea, so back to animations!
Smoothly moving the circle between boxes looks way better:

<img src='/images/boxes-animated-circle.gif' width="25%" style="padding: 20 0 20 0;"/>

We already know how to animate a circle's position with D3.js, so **this should be simple, right**?

Well... the circle's y-coordinate in the upper box is `height/2`, and its coordinate in the lower box is `height/2`, too!
So how are we supposed to animate between these identical states?!

I vividly remember my own confusion when I first encountered this problem in one of our research projects.

The complexity is caused by the fact that our components all use their own, 0-based coordinate system.
But that's exactly what made the components simple in the first place, so we don't want to give this up!

## Animations Across Component Boundaries

Situation recap:

**What we have** (and want to keep): _Simple components with 0-based coordinate systems_

**What we want**: _Animations across component boundaries_

There's no easy fix, but we know that animations are simple as long as they are happening on a **common coordinate system**.
Thus the idea is simple: We keep using 0-based components, but switch to a common coordinate system while performing an animation.
One very suitable common coordinate system is the view port coordinate system of our SVG's root node.

Here's the rough recipe:

* Calculate the circle's global coordinates (relative to the svg view port)
* Create a dedicated clone of the circle to be used for the animation
* Attach the clone to the SVG root element
* Hide the original circle during the course of the animation (so only the clone is visible)
* **Animate!**
* Detach the clone once the animation is done
* Un-hide the original circle at the final state

And in code (remember, the complete project is on [GitHub](https://github.com/netzwerg/react-animation-demo)):
```typescript
const circle = this.svgRoot.getElementById(this.circleId) as SVGCircleElement;

if (circle) {

    // (0) Calculate current coordinates relative to global view port
    const currentCoordinates = this.getCoordinates(this.svgRoot, circle);

    const previousCoordinates = this.coordinateCache || currentCoordinates;

    this.coordinateCache = currentCoordinates;

    const easingFunction = currentCoordinates.cy > previousCoordinates.cy ? easeBounceOut : easeCubicInOut;

    // (1) This clone will be used for the animation
    const animatedCircle = circle.cloneNode(true) as SVGCircleElement;

    // (2) Attach to root element (animated x/y coordinates are in the system of the global view port)
    this.svgRoot.appendChild(animatedCircle);

    // (3) The DOM already contains the circle at the new position -> hide it until the animation is over
    select(circle)
        .attr('visibility', 'hidden');

    // (4) The actual animation
    select(animatedCircle)
        .attr('visibility', 'visible')
        .attr('cx', previousCoordinates.cx)
        .attr('cy', previousCoordinates.cy)
        .transition()
        .duration(1000)
        .ease(easingFunction)
        .attr('cx', currentCoordinates.cx)
        .attr('cy', currentCoordinates.cy)
        .remove() // (5) Detach the animated circle once we're done
        .on('end', () => { // (6) Un-hide new state (already properly placed in the DOM)
            select(circle)
                .attr('visibility', 'visible');
        });

}
```

Phew, some things are harder than they should be – let me know if there's a simpler way!