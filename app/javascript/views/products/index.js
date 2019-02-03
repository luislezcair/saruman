import $ from 'jquery';
import Rails from 'rails-ujs';


function clearFilters(){

    $( ".reset-filter" ).click(function() {
        console.log('reset button press');
        $('#q_family_id_eq').val("")
        $('#q_producer_id_eq').val("")
        $('#q_category_id_eq').val("")
        $('#q_product_type_id_eq').val("")
        $('#q_product_number_or_name_cont').val("")
    });
}



  document.addEventListener('products:index:load', clearFilters); 