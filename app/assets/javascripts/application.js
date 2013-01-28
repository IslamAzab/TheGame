// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require bootstrap
//= require bootstrap-editable
//= require bootstrap-editable-rails
//= require_tree .
//= require jquery_nested_form

function remove_fields(link) {
  $(link).prev("input[type=hidden]").val("1");
  $(link).parent().parent().hide();
}

function add_fields(link, association, content) {
  var new_id = new Date().getTime();
  var regexp = new RegExp("new_" + association, "g");
  $('[style = "display: none"]').show();
  $(link).siblings("table").children("tbody").append(content.replace(regexp, new_id));
}

jQuery(function ($) {
    //override nested_form insertFields to work with table
    window.NestedFormEvents.prototype.insertFields = function (content, assoc, link) {
      var $table = $(link).siblings('table');
      // Show the table and save button if player has no cards
      $(link).siblings("[style='display: none']").show();
      return $(content).appendTo($table);
    }
  });

function popUp (link) {
  $(link).popover('toggle');
}