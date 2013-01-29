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
    $("#from_date").val($('#period_selector :selected').attr('start_day'));
    $("#to_date").val($('#period_selector :selected').attr('end_day'));
    $.ajax({
      url: "/game/"+$(this).attr("player_id"),
      data: {
        start_day: $("#from_date").val(),
        end_day: $("#to_date").val()
      },
      dataType: 'script'
    });
  });

  $('#from_date, #to_date').change(function(){
    $.ajax({
      url: "/game/"+$('#period_selector').attr("player_id"),
      data: {
        start_day: $("#from_date").val(),
        end_day: $("#to_date").val()
      },
      dataType: 'script'
    });
  });

  $('.selectpicker').selectpicker();
});