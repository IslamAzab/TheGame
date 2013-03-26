$(function(){
	$('#month_selector').change(function(){
    $.ajax({
      url: "/team",
      data: {
        month: $('#month_selector :selected').data('month')
      },
      dataType: 'script'
    });
    
  });
});