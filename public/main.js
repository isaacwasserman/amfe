$("#alicemarchlogo").click(function() {
    $('html, body').animate({
        scrollTop: $("#bkg-2").offset().top
    }, 500);
});

var scroll = function(num){
  var bkgnum = parseInt(num) + 1;
  $('html, body').animate({
        scrollTop: $("#bkg-" + bkgnum.toString()).offset().top
    }, 300);
}