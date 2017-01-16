var congressHTML = '<li class="congressMember"><img/><p></p></li>';

var congressList = document.getElementById('congressList');

var findReps = function(altZip){
  var zipcode = document.getElementById('zipcode').value;
  if(zipcode == ''){var zipcode = altZip}
  $.get("/congress/" + zipcode, function(data) {
    console.log(data);
    congressList.innerHTML = "";
    $.each(data, function(index, rep){
      var congressPersonItem = document.createElement('LI');
      congressPersonItem.setAttribute('class','congressMember');
      
      var congressPersonImg = document.createElement('IMG');
      congressPersonImg.setAttribute('src',rep.photoUrl);
      
      var congressPersonP = document.createElement('P');
//      var nameNode = createTextNode(rep.name);
      congressPersonP.innerHTML = rep.name + "<br>";
      
      var congressPersonWholeLink = document.createElement('A');
      congressPersonWholeLink.setAttribute('href',rep.contactUrl);
      
      var clickToContact = document.createElement('SPAN');
      clickToContact.innerHTML = "Click To Contact"
      
      congressPersonItem.appendChild(congressPersonImg);
      congressPersonItem.appendChild(congressPersonP);
      congressPersonItem.appendChild(clickToContact);
      congressPersonWholeLink.appendChild(congressPersonItem)
      congressList.appendChild(congressPersonWholeLink);
      
      $('#congressTitle').css('display','initial');
    });
  });
}