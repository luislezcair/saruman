import Rails from 'rails-ujs';
import $ from 'jquery';
import { Controller } from 'stimulus'
 
export default class extends Controller {
	add(event){
		console.log('intro');
		  // time = new Date().getTime()
		  // regexp = new RegExp($(this).data('id'), 'g')
		  // $(this).before($(this).data('fields').replace(regexp, time))
		  // event.preventDefault()
	}
}