# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$('#workflowAddTask').select2({
	placeholder: 'Add a task...',
	minimumInputLength: 1,
	ajax: {
		url: '/tasknames.json',
		datatype: 'jsonp',
		data: function( term, page ) {
			return {
				q: term, //search term
			};
		},
		results: function ( data, page ) {
			return {
				results: data
			};
		}
	},
	initSelection: function( element, callback ) {

	}
})
