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

function search(){
    console.log('into function search');

        $("#q_product_number_or_name_cont").keyup(function(event){
            console.log('into keyUp');
            console.log(this);

            $.ajax({
                type: "GET", 
                url: "/products/products",
                dataType: 'script',
                data: $(this).serialize(),
                success: function(data, textStatus, jqXHR){
                    
                },
                error: function(jqXHR, textStatus, errorThrown){}
            })
        })

        $("#q_product_type_id_eq, #q_category_id_eq, #q_producer_id_eq, #q_family_id_eq").change(function(event){
            console.log('into change');
            console.log(this); 
            const valor =  { 
                'product_type_id_eq':  $('#q_product_type_id_eq').val(),
                'category_id_eq': $('#q_category_id_eq').val(),
                'producer_id_eq': $('#q_producer_id_eq').val(),
                'family_id_eq': $('#q_family_id_eq').val()
        }
            $.ajax({
                type: "GET", 
                url: "/products/products",
                dataType: 'script',
                data: {"q": valor} ,
                success: function(data, textStatus, jqXHR){
                    
                },
                error: function(jqXHR, textStatus, errorThrown){}
            })
        })
    }


  document.addEventListener('products:index:load', clearFilters);  
  document.addEventListener('products:index:load', search);  