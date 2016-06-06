function createStripes(appendBottomStripes) {
    
    var colors = [
        "#294877",
        "#E7797C",
        "#75B232",
        "#FEBC22",
        "#F46B20",
        "#85CECA",
        "#337726",
        "#D63F23",
        "#192D1E"];

    var randomColor = function () {
        return colors[Math.floor(Math.random() * colors.length)]
    };

    var randomHeight = function () {
        return 30 + d3_random.randomExponential(1 / 6)() + "px";
    };

    var data = new Array(100);

    var topStripes = d3.select(".stripes").selectAll("div").filter(".colored").data(data);

    var applyStripeStyle = function (selection) {
        selection
            .style("height", function (d, i) {
                return randomHeight()
            })

            .style("background-color", function () {
                return randomColor()
            });
    };

    applyStripeStyle(topStripes);

    if (appendBottomStripes) {
        var bottomStripes = topStripes.enter().append("div").classed("colored", true);
        applyStripeStyle(bottomStripes);
    }

}