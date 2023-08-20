// fancybox-init.js
$(document).ready(function() {
  $('[data-fancybox="gallery"]').fancybox({
    loop: true,
    buttons: ["zoom", "slideShow", "fullScreen", "thumbs", "close"],
    animationEffect: "fade",
    transitionEffect: "slide",
    slideShow: { autoStart: true, speed: 3000 }
  });
});
