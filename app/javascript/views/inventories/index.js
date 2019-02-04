import $ from 'jquery';
import Rails from 'rails-ujs';


function clearFilters(){

    $( ".reset-filter" ).click(function() {
        console.log('reset button press');
        $('#q_product_name_or_product_product_number_cont').val("")
        $('#q_product_family_id_eq').val("")
        $('#q_product_producer_id_eq').val("")

    });
} 

function search(){
    console.log('into function search');

        $("#q_product_name_or_product_product_number_cont").keyup(function(event){
            console.log('into keyUp');
            console.log(this);

            $.ajax({
                type: "GET", 
                url: "/inventories",
                dataType: 'script',
                data: $(this).serialize(),
                success: function(data, textStatus, jqXHR){
                    
                },
                error: function(jqXHR, textStatus, errorThrown){}
            })
        })

        $("#q_product_family_id_eq, #q_product_producer_id_eq").change(function(event){
            console.log('into change');
            console.log(this); 
            const valor =  { 
                'product_family_id_eq':  $('#q_product_family_id_eq').val(),
                'product_producer_id_eq': $('#q_product_producer_id_eq').val()
        }
            $.ajax({
                type: "GET", 
                url: "/inventories",
                dataType: 'script',
                data: {"q": valor} ,
                success: function(data, textStatus, jqXHR){
                    
                },
                error: function(jqXHR, textStatus, errorThrown){}
            })
        })
    }





  document.addEventListener('inventories:index:load', clearFilters); 
  document.addEventListener('inventories:index:load', search); 


