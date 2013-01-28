$(function(){
  $('.editable.result_score').live('mouseup', function(){
      $(this).editable(
      {
        ajaxOptions: {
          type: 'put'
        },
        placement: 'right'
      }
      )
  });

  $('#period_selector').change(function(){
    $.ajax({
      url: "/game.js",
      data: {
        period: $(this).val()
      }
    });
  });
  $('.selectpicker').selectpicker();
});