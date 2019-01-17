import Rails from 'rails-ujs';
import $ from 'jquery';
import { Controller } from 'stimulus';

export default class extends Controller {
  static targets = ['input'];

  /* initialize() {
    this.productsArray = [];
  } */
  
  /* catchProducts(e) {
    //const productsArray = [];
    const id = this.productsArray.indexOf(e.target.dataset.id);
    console.log(id)
    if (e.target.checked) { // inputTarget.checked
      id ? this.productsArray.splice(0, 0, e.target.dataset.id) : false;
      //id ? this.productsArray.push(e.target.dataset.id) : false;
    } else {
      id ? this.productsArray.splice(id, 1) : false;
    }
    console.log(this.productsArray)
  } */

  move() {
    var productsArray = [];
    $(".catchProducts:checked").each(function() {
      productsArray.push($(this).val());
    });

    console.log(productsArray.length)

    const url = '/elements/deposits/move';

    Rails.ajax({
      type: 'GET',
      dataType: 'json',
      data: "q=" + productsArray,
      url,
      success: () => {
        $('#deposit-move-modal').modal('show');
      },
    });
  }
}