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

//= require jquery3
//= require popper
//= require bootstrap-sprockets

//= require rails-ujs
//= require turbolinks
//= require_tree .

// My custom carousel function
// let counter = 2
// let started = true
// window.setInterval(function(){

// // Reset counter
// if (counter === 4){
//   counter = 1
//   started = false
// }
// // Add active class
// if(counter !== 0){
//   let nextItem = document.getElementById('carousel' + String(counter))    
//   nextItem.classList.add("active")  
// } else{
//   let nextItem = document.getElementById('carousel1')
//   nextItem.classList.add("active")  
// }

// // Remove active class
// if (counter === 1 && started === false){
//   let prevItem = document.getElementById('carousel3')
//   prevItem.classList.remove("active") 
// } else if (counter === 2){
//   let prevItem = document.getElementById('carousel1')
//   prevItem.classList.remove("active") 
// } else if(counter === 3){
//   let prevItem = document.getElementById('carousel2')
//   prevItem.classList.remove("active") 
// }

// counter += 1

// }, 7000);



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


// Show/Hide upload files seciton
function showUploadArea(){
 document.getElementById("upload-files-area").style.display = "block";
 document.getElementById("main-content").style.display = "none";  
}

function hideUploadArea(){
 document.getElementById("upload-files-area").style.display = "none";  
 document.getElementById("main-content").style.display = "block";  
}

// Drag and drop upload file
// + function($) {
//   'use strict';

//     // UPLOAD CLASS DEFINITION
//     // ======================

//     let dropZone = document.getElementById('drop-zone');
//     let uploadForm = document.getElementById('js-upload-form');

//     let startUpload = function(files) {
//      console.log(files)
//    }

//    uploadForm.addEventListener('submit', function(e) {
//      let uploadFiles = document.getElementById('js-upload-files').files;
//      e.preventDefault()

//      startUpload(uploadFiles)
//    })

//    dropZone.ondrop = function(e) {
//      e.preventDefault();
//      this.className = 'upload-drop-zone';

//      startUpload(e.dataTransfer.files)
//    }

//    dropZone.ondragover = function() {
//      this.className = 'upload-drop-zone drop';
//      return false;
//    }

//    dropZone.ondragleave = function() {
//      this.className = 'upload-drop-zone';
//      return false;
//    }

//  }(jQuery);

