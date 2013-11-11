# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$('.task').keyup(function() {
    var emtpyTaskFields = $(this).closest('.control-group')
                                 .find('input[value=""]');

    if (emptyTaskFields.length == 0) {
        var taskFields = $(this).closest("fieldset");

        var num = taskFields.length + 1;
        var group = document.createElement('div');
        group.setAttribute("class", "control-group");

        var label = document.createElement('label');
        label.setAttribute("class", "control-label");
        label.setAttribute("for", "task" + num);
        group.appendChild(label);

        var formGroup = document.createElement('div');
        formGroup.setAttribute("class", "form-group");
        var col = document.createElement('div');
        col.setAttribute("class", "col-md-10");

        var input = document.createElement('input');
        input.setAttribute("type", "text");
        input.setAttribute("id", "task" + num);
        input.setAttribute("name", "task" + num);
        input.setAttribute("placeholder", "");
        input.setAttribute("class", "form-control task");

        col.appendChild(input);
        formGroup.appendChild(col);
        group.appendChild(formGroup);
        emptyTaskFields.appendChild(group);
    }
})

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
