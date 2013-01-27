$(function(){
  $('.editable.result_score').editable({
    ajaxOptions: {
      type: 'put'
    },
    anim: 'slow',
    placement: 'right'
  });
  //turn to inline mode
  $.fn.editable.defaults.mode = 'inline';
});