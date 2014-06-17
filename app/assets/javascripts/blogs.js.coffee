# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
$ ->
  $(".comments_container").on "click", ->
    $(this).next(".slider").slideToggle()

  $(".user_location").on "click", ->
    $(this).next(".google_map_location").slideToggle()

