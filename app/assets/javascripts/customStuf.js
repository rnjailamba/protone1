

/*Date time Picker*/

$(document).ready(function(){
    $('#competition_startDateText').datetimepicker({
      sideBySide: true,
      format: "MMMM Do YYYY, h a",
       widgetPositioning: {
        vertical: 'top',
        horizontal: 'right'
      }

      
    });

    
    $('#competition_endDateText').datetimepicker({
      sideBySide: true,
      format: "MMMM Do YYYY, h a",
       widgetPositioning: {
        vertical: 'top',
        horizontal: 'right'
      }
      
    });
    $("#competition_startDateText").on("dp.change",function (e) {
        $('#competition_endDateText').data("DateTimePicker").minDate(e.date);
    });
    $("#competition_endDateText").on("dp.change",function (e) {
        $('#competition_startDateText').data("DateTimePicker").maxDate(e.date);
    });

})
