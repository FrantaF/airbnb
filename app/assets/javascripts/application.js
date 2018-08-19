// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require jquery3
//= require popper
//= require bootstrap-sprockets
//= require turbolinks
//= require_tree .

$('.carousel').carousel();

function registration_form_display(){
  let sender = document.getElementById("display-box-trigger");      

  let login = document.getElementById("loginBox");      
  let registration = document.getElementById("registrationBox");      

  if (login.style.display === "none") {
    login.style.display = "block";
    sender.innerHTML = "Register"
    registration.style.display = "none";
  } else {
    login.style.display = "none";
    sender.innerHTML = "Login"
    registration.style.display = "block";
  }
}

function updateUserDescription(){
 let sender = document.getElementById("update-user-description-btn"); 

 let userDescriptionCurrent = document.getElementById("user-description-current");
 let userDescriptionTextBox = document.getElementById("user-description-text-box");

 if (sender.innerHTML === "Update Description") {
  userDescriptionTextBox.style.display = "block";
  sender.innerHTML = "Cancel"
  userDescriptionCurrent.style.display = "none";
} else {
 userDescriptionTextBox.style.display = "none";
 sender.innerHTML = "Update Description"
 userDescriptionCurrent.style.display = "block";
}
}



