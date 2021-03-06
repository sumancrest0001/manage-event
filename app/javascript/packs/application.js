// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")

import "bootstrap";
import "./src/application.scss";

// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)
$(document).ready(function () {
  var notificationIcon = $("#navbarDropdown");
  var unreadCount = $(".unread-count");
  if (notificationIcon.length > 0) {
    $.ajax({
      url: "/notifications.json",
      dataType: "JSON",
      method: "GET",
      success: function (data, textStatus, jqXHR) {
        const items = $.map(data, function (notification) {
          return `<p class="item"><a href=${notification.actorUrl} class="full-name">${notification.actor}</a> ${notification.action} ${notification.notifiable.type} <span class="event-title">"${notification.notifiable.title}"</span></p>`
        });
        $(".unread-count").text(data.length == 0 ? '' : data.length);
        $("[data-behavior='dropdown-items']").html(items);
      },
      error: function (jqXHR, textStatus, errorThrown) { console.log(errorThrown); }
    });
  }

  notificationIcon.click(function () {
    $.ajax({
      url: "/notifications/mark_as_read",
      dataType: "JSON",
      method: "POST",
      success: function (data, textStatus, jqXHR) {
        $(".unread-count").text('');
      },
    });
  });

  $(".toggle-button").click(function () {
    $(".notification-section").toggleClass("show");
  });

  /*   $(".attendees-lists-button").click(function(){
  
    }) */
});
