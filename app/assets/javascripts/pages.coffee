# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
#ready = ->
#    $(".toggle-menu").on "click", ->
#        $(".main-sidebar").addClass "is-active"
#    $(".toggle-close").on "click", ->
#       $(".main-sidebar").removeClass "is-active"
    
#    $(".delete").on "click", ->
#        $(this).parent('.notification').remove();
    
#$(document).ready ready

$(document).on "turbolinks:load", () ->
    $(".toggle-menu").on "click", ->
        $(".menu-bg").addClass "is-active"
        $(".main-sidebar").addClass "is-active"
    $(".toggle-close").on "click", ->
        $(".main-sidebar").removeClass "is-active"
        $(".menu-bg").removeClass "is-active"
    $(".menu-bg").on "click", ->
        $(this).removeClass "is-active"
        $(".main-sidebar").removeClass "is-active"
    
    $(".delete").on "click", ->
        $(this).parent().slideUp()