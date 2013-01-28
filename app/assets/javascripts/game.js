$(function(){
  $('.editable.result_score').editable({
    ajaxOptions: {
      type: 'put'
    },
    placement: 'right'
  });
  //turn to inline mode
  $.fn.editable.defaults.mode = 'inline';

  $('#period_selector').change(function(){
    $.ajax({
      url: '/game',
      data: {period: $(this).val()}
    });
  });
});