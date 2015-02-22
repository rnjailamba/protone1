/*Date time Picker*/
$(document).on('ready page:load', function () {
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

});


$(document).on('ready page:load', function () {
    $("#comp").masonry({
        // options
        itemSelector : '.masonry-item',
        // options...
      isFitWidth: true

    });
});

/* The dropdownFor Category*/

   $( document).on( 'click', '.categ li', function( event ) {

      var $target = $( event.currentTarget );
      console.log($target.text());

       $('#competition_category').val($target.text().toString());

      $target.closest( '.btn-group' )
         .find( '[data-bind="label"]' ).text( $target.text() )
            .end()
         .children( '.dropdown-toggle' ).dropdown( 'toggle' );

      return false;

   });

    $( document).on( 'click', '.onOff li', function( event ) {

      var $target2 = $( event.currentTarget );
      console.log($target2.text());

       $('#competition_onOff').val($target2.text().toString());

      $target2.closest( '.btn-group' )
         .find( '[data-bind="label"]' ).text( $target2.text() )
            .end()
         .children( '.dropdown-toggle' ).dropdown( 'toggle' );

      return false;

   });

/*Focus at the beggining of the form*/
$(function(){
  $(".Fname").focus();
});

/*Google Maps*/
$( function () {
    
});

/*Index page address taken*/
$( function () {
  

});



/*Access code*/
$( document).on( 'click', '.letMeIn', function( event ) {


  
  
  var entry = $('#accessCode').val();
  console.log(entry);
  if (entry == "e") {
    window.location="/competitions";
    return false;

  }
  else
  {
    alert("Retry the code you were sent");
      return true;
  }

  

});






