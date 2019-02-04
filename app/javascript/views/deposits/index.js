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

function search(){
    console.log('into function search');

        $("#q_name_cont").keyup(function(event){
            console.log('into keyUp');
            console.log(this);

            $.ajax({
                type: "GET", 
                url: "/elements/deposits",
                dataType: 'script',
                data: $(this).serialize(),
                success: function(data, textStatus, jqXHR){
                    
                },
                error: function(jqXHR, textStatus, errorThrown){}
            })
        })

        $("#q_city_id_eq, #q_deposit_type_id_eq").change(function(event){
            console.log('into change');
            console.log(this); 
            const valor =  { 
                'city_id_eq':  $('#q_city_id_eq').val(),
                'deposit_type_id_eq': $('#q_deposit_type_id_eq').val()
        }
            $.ajax({
                type: "GET", 
                url: "/elements/deposits",
                dataType: 'script',
                data: {"q": valor} ,
                success: function(data, textStatus, jqXHR){
                    
                },
                error: function(jqXHR, textStatus, errorThrown){}
            })
        })
    }


document.addEventListener('deposits:index:load', search); 
document.addEventListener('deposits:index:load', clearFilters); 