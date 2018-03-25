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
// require activestorage
//= require turbolinks
// require_tree .


function focusFeelingInput(){
  document.querySelector("[data-feeling-input]").focus();
}

function isCtrlEnter(event) {
  return event.keyCode == 13 && event.ctrlKey;
}

function bindFeelingEvents(){
  var feelingInput = document.querySelector("[data-feeling-input]");

  var handleFeelingKeyup = function(event){
    var form          = feelingInput.closest('form');
    var hiddenInput   = document.querySelector("#feeling_content");
    // set value of hidden input
    hiddenInput.value = feelingInput.innerText;
    // submit form if shift+enter
    if(isCtrlEnter(event)){
      event.preventDefault();
      Rails.fire(form, 'submit');
      return false;
    }
  }

  var handleFeelingKeydown = function(event){
    if(isCtrlEnter(event)) event.preventDefault();
  }

  feelingInput.addEventListener('keyup', handleFeelingKeyup);
  feelingInput.addEventListener('keydown', handleFeelingKeydown);
}

function startCyclingHeadingHints() {
  var hintElement = document.querySelector("[data-heading-hint]");
  var hints = [
    "Need to vent? Tell the world how you're feeling.",
    "Let it all out. It's healthy, I promise.",
    "No need to bottle everything up.",
    "Catharsis is an important part of stress relief.",
    "No one to talk to about your feelings? Tell the internet instead.",
  ]
  var randomHint = function(){ return hints[Math.floor(Math.random()*hints.length)]; }
  var setNewHint = function(){ return hintElement.innerText = randomHint(); }
  setInterval(setNewHint, 7000)
}

window.onload = function(){
  focusFeelingInput();
  bindFeelingEvents();
  startCyclingHeadingHints();
}
