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

    $(document).on "click", "a[data-modal]",(ev) ->
        ev.preventDefault()
        num = $(this).data("modal")
        $('.modal-'+num).addClass "is-active"
   
    $('.close-modal').on "click", (ev) =>
        ev.preventDefault()
        $('.modal').removeClass "is-active"

    $('#tab_header ul li.item').on 'click', () ->
        number = $(this).data('option')
        $('#tab_header ul li.item').removeClass('is-active')
        $(this).addClass 'is-active'
        $('#tab_container .container_item').removeClass 'is-active' 
        $('div[data-item="'+number+'"]').addClass 'is-active' 
    $('.dropdown').on "click", () ->
        $(this).toggleClass('is-active')