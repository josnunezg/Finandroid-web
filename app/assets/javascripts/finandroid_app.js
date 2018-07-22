// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require materialize
//= require chartkick
//= require frontApp
//= require_tree .

$(document).ready(function() {
  $(".button-collapse").sideNav({
    menuWidth: 260
  });
  $(".modal").modal();
  $("#btn-notifications").on('click', function() {
    var count_badge = $("#count-notifications");
    var count = parseInt(count_badge.html().trim());
    if(count > 0) {
      $("#count-notifications").removeClass('red').addClass("grey lighten-1").html("0");
    }
  })
})

function buttonHoverable(button) {
  var id = button.id;
  $("#"+id).toggleClass('pulse');
}

function removeNotification(notification) {
  var id = notification.id;
  $("#"+id).remove();
}
