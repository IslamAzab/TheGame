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
//= require jquery.remotipart
//= require bootstrap
//= require bootstrap-editable
//= require jquery.ui.datepicker
//= require_tree .
//= require jquery_nested_form

jQuery(function ($) {
    $('.remove_nested_fields').live('click', function(e){
      if("scoring_cards" == $(this).data('association')){
        $(this).parents(".scoring_cards_fields").fadeOut('slow');
      }
      return this;
    });

    $('.modal').on('show', function(e) {
     var modal = $(this);

     modal.css('margin-top', (modal.outerHeight() / 2) * -1)
          .css('margin-left', (modal.outerWidth() / 2) * -1);

     return this;
    });

    $('#modal_submit').on('click', function(e){
      var modal = $(this).parents('.modal');
      var form = $(modal).children('.modal-body').children('form');
      $(form).submit();
      $(modal).modal('hide');
      return true;
    });



  });

function popUp (link) {
  $(link).popover('toggle');
}

$(function(){
  $('.datePicker').datepicker({
    dateFormat: 'dd-mm-yy'
  });

  $('.tooltip').tooltip();
});