import Rails from 'rails-ujs';
import $ from 'jquery';
import { Controller } from 'stimulus'
 
export default class extends Controller {

	static targets = [ "fields" ]
	

	addContact(event) {
		console.log('into function');
		console.log(event);
		var regexp, time;
		// var time = new Date().getTime();
		//  regexp = new RegExp($(this).data('id'), 'g');
		// $('.fields').append($(this).data('fields').replace(regexp, time));
		//  event.preventDefault();
		time = new Date().getTime()
		regexp = new RegExp($(this).data('id'), 'g')
		 console.log('regexp' + regexp);
		 console.log('time '+ time);
		 console.log('length .. '+ $(".fields").length );

		
		// $(this).before($(this).data('fields').replace(regexp, time))
		// $('.fields').append($(this).data('fields').replace(regexp, time));
		this.fieldsTarget.append($(this).data('fields').replace(regexp, time));
		event.preventDefault()
	
	  }

} 