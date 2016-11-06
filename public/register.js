window.onload = function() {
  var typevalue = "individual"
  var addRegistrationSection = function(){
    var typeValue = document.getElementById("registrationtype").value;
    if(typeValue == "individual") {
      document.getElementById("groupregistration").style.display = "none";
      document.getElementById("individualregistration").style.display = "block";
    }
    if(typeValue == "group") {
      document.getElementById("individualregistration").style.display = "none";
      document.getElementById("groupregistration").style.display = "block";
    }
  }
  
  function ValidateEmail(mail)  {  
    if (/^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/.test(myForm.emailAddr.value)) {
      return (true)
    }  
    else {
      return (false)
    }  
  }  
  
  function validateEmail(email) {
    var re = /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
    return re.test(email);
  }
  
  var validate = function(){
    if(typevalue == "individual"){
      var emailInput = document.getElementById("indemail");
    }
    else {
      var emailInput = document.getElementById("grpemail");
    }
    
    if(validateEmail(emailInput.value)) {
      emailInput.style.backgroundColor = "rgb(255,255,255)";
      document.getElementById("submitbutton").style.opacity = "1";
      document.getElementById("submitbutton").removeAttribute("disabled");
    }
    else {
      emailInput.style.backgroundColor = "rgba(255,0,0,0.2)";
      document.getElementById("submitbutton").style.opacity = "0.5";
      document.getElementById("submitbutton").setAttribute("disabled", "true");
    }
  }
  
  document.getElementById("registrationtype").addEventListener("change", function(){addRegistrationSection();});
  
  document.getElementById("indemail").addEventListener("keyup", function(){validate();});
  document.getElementById("grpemail").addEventListener("keyup", function(){validate();});
};