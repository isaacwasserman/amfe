var menuanim = function(){
  
  if($('#top-bar').attr("class").indexOf("oddAnimation-top") != -1) {
            $('#top-bar').removeClass('oddAnimation-top').addClass('evenAnimation-top');
            $('#mid-bar').removeClass('oddAnimation-mid').addClass('evenAnimation-mid');
            $('#bot-bar').removeClass('oddAnimation-bot').addClass('evenAnimation-bot');
            $('body')[0].style.marginLeft = "0px";
            console.log("Odd");
        }
        else {
            $("#top-bar").removeClass('evenAnimation-top').addClass('oddAnimation-top');
            $("#mid-bar").removeClass('evenAnimation-mid').addClass('oddAnimation-mid');
            $("#bot-bar").removeClass('evenAnimation-bot').addClass('oddAnimation-bot');
            $('body')[0].style.marginLeft = "300px";
            console.log("Even");
        }
  
}

var mobilemenuanim = function(){
  
  if($('#mobile-menu-button #top-bar').attr("class").indexOf("oddAnimation-top") != -1) {
            $('#mobile-menu-button #top-bar').removeClass('oddAnimation-top').addClass('evenAnimation-top');
            $('#mobile-menu-button #mid-bar').removeClass('oddAnimation-mid').addClass('evenAnimation-mid');
            $('#mobile-menu-button #bot-bar').removeClass('oddAnimation-bot').addClass('evenAnimation-bot');
            $('#mobile-menu').css("left","-90%");
            $('#mobile-menu-button .bar').css("background-color","#ffffff");
            console.log("Mobile Odd");
        }
        else {
            $("#mobile-menu-button #top-bar").removeClass('evenAnimation-top').addClass('oddAnimation-top');
            $("#mobile-menu-button #mid-bar").removeClass('evenAnimation-mid').addClass('oddAnimation-mid');
            $("#mobile-menu-button #bot-bar").removeClass('evenAnimation-bot').addClass('oddAnimation-bot');
            $('#mobile-menu').css("left","0%");
            $('#mobile-menu-button .bar').css("background-color","#5e4c9f");
            console.log("Mobile Even");
        }
  
}