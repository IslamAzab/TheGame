$(function(){
  // $.fn.editable.defaults.mode = 'inline';

  $('.editable.result_score').live('mouseup', function(){
    $(this).editable(
      {
        send: 'always',
        ajaxOptions: {
          type: 'put'
        },
        placement: 'bottom',
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
  
  // swap the dates if end < start
  if (isSmaller(end_date, start_date)){
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

/**
compares two dates with format (dd-mm-yyyy) and return true if start date < end date
*/
function isSmaller(start, end){
  var sParts = start.split("-");
  var eParts = end.split("-");
  var result = sParts[2] == eParts[2] ? sParts[1] == eParts[1] ? sParts[0] == eParts[0] ? false : sParts[0] < eParts[0] : sParts[1] < eParts[1]  : sParts[2] < eParts[2] 
  return result
}

function alignHeaderAndBody(){
  var header = $("thead").children().first();
  var rows = $("tbody").children();
  header.children().first().width(rows.first().children().first().width());
  rows.each(function(index, row){
    $(row).children().each(function(i, td) {
     $(td).width($(header.children().get(i)).width());
   });
  })
}