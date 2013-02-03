$(function(){
  // $.fn.editable.defaults.mode = 'inline';

  $('.editable.result_score').live('mouseup', function(){
    $(this).editable(
      {
        send: 'always',
        ajaxOptions: {
          type: 'put'
        },
        placement: 'right',
        clear: false
      }
    );    
  });

  $('#period_selector').change(function(){

    $("#from_date").val($('#period_selector :selected').attr('data-start_day'));
    $("#to_date").val($('#period_selector :selected').attr('data-end_day'));

    $.ajax({
      url: "/game/"+$(this).attr("player_id"),
      data: {
        start_day: $("#from_date").val(),
        end_day: $("#to_date").val()
      },
      dataType: 'script'
    });
    
  });

  $('.selectpicker').selectpicker();
});

/**
  called when pressing the apply button in game page
  switches the two date fields values if end_date < start_date
  then send ajax request to display player's results within the given range  
*/
function displayResult(){
  var start_date = $("#from_date").val();
  var end_date = $("#to_date").val();
  
  // swap the dates if end > start
  if (end_date < start_date){
    var temp = start_date;
    start_date = end_date;
    end_date = temp;$(function(){
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
    );    
  });

  // $('.editable.new_result_score').live('mouseup', function(){
    
  // });

  $('#period_selector').change(function(){

    $("#from_date").val($('#period_selector :selected').attr('data-start_day'));
    $("#to_date").val($('#period_selector :selected').attr('data-end_day'));

    $.ajax({
      url: "/game/"+$(this).attr("player_id"),
      data: {
        start_day: $("#from_date").val(),
        end_day: $("#to_date").val()
      },
      dataType: 'script'
    });
    
  });

  $('.selectpicker').selectpicker();
});

/**
  called when pressing the apply button in game page
  switches the two date fields values if end_date < start_date
  then send ajax request to display player's results within the given range  
*/
function displayResult(){
  var start_date = $("#from_date").val();
  var end_date = $("#to_date").val();
  
  // swap the dates if end > start
  if (end_date < start_date){
    var temp = start_date;
    start_date = end_date;
    end_date = temp;
    // also swap in the view
    $("#from_date").val(start_date);
    $("#to_date").val(end_date);
  }
  
  // send the ajax request
  $.ajax({
    url: "/game/"+$('#period_selector').attr("player_id"),
    data: {
      start_day: start_date,
      end_day: end_date
    },
    dataType: 'script'
  });
}
    // also swap in the view
    $("#from_date").val(start_date);
    $("#to_date").val(end_date);
  }
  
  // send the ajax request
  $.ajax({
    url: "/game/"+$('#period_selector').attr("player_id"),
    data: {
      start_day: start_date,
      end_day: end_date
    },
    dataType: 'script'
  });
}