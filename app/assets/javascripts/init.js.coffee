$(document).ready ->
  $('#da-slider').cslider()
  $('#clients-flexslider').flexslider
    animation: "slide",
    easing: "swing",
    animationLoop: true,
    itemWidth: 1,
    itemMargin: 1,
    minItems: 2,
    maxItems: 9,
    controlNav: false,
    directionNav: false,
    move: 2
