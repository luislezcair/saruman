import $ from 'jquery';
import Rails from 'rails-ujs';


function clearFilters(){

    $( ".reset-filter" ).click(function() {
        console.log('reset button press');
        $('#q_deposit_type_id_eq').val("")
        $('#q_city_id_eq').val("")
        $('#q_name_cont').val("")

    });
}



  document.addEventListener('deposits:index:load', clearFilters); 