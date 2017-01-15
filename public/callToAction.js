var allReps = {};
var findReps = function(){
  var zipcode = document.getElementById('zipcode').value;
  $.get("/congress/" + zipcode, function(data) {
    console.log(data);
  });
}