$(function(){
  // $.fn.editable.defaults.mode = 'inline';

  $('.editable.result_score').live('mouseup', function(){
    $(this).editable(
      {
        ajaxOptions: {
          type: 'put'
        },
        placement: 'right',
        clear: false
      }
    )
  });

  $('.editable.new_result_score').live('mouseup', function(){
    $(this).editable(
      {
        ajaxOptions: {
          type: 'post'
        },
        placement: 'right',
        clear: false
      }
    )
  });

  $('#period_selector').change(function(){
    $.ajax({
      url: "/game/"+$(this).attr("player_id")+"/",
      data: {
        period: $(this).val()
      },
      dataType: 'script'
    });
  });

  $('.selectpicker').selectpicker();
});