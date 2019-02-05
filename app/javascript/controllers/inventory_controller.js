import Rails from 'rails-ujs';
import $ from 'jquery';
import { Controller } from 'stimulus';

export default class extends Controller {
  initialize() {
    document.getElementById('inventories-deposit-table-container').style.display = 'none';
    document.getElementById('inventories-table-container').style.display = 'block';
    document.getElementById('filtro-deposito').style.display = 'none';
    document.getElementById('filtro-producto').style.display = 'block';
  }

  inventoryPerDeposit() {

    if (document.getElementById('change-inventory-view').checked) {
      document.getElementById('inventories-deposit-table-container').style.display = 'block';
      document.getElementById('inventories-table-container').style.display = 'none';
    } else {
      document.getElementById('inventories-deposit-table-container').style.display = 'none';
      document.getElementById('inventories-table-container').style.display = 'block';
    }
  }


}