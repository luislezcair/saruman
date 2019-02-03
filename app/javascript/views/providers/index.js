import $ from 'jquery';
import Rails from 'rails-ujs';


function clearFilters(){

    $( ".reset-filter" ).click(function() {
        console.log('reset button press');
        $('#q_identification_number_cont').val("")
        $('#q_tax_category_number_cont').val("")
        $('#q_name_cont').val("")

    });
}



  document.addEventListener('providers:index:load', clearFilters); 