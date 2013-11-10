// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
// You can use CoffeeScript in this file: http://coffeescript.org/

// Stupid way of displaying a rough review page
var displayReview = function() {
    alert("display");
        var info = $('#tab1').html();
        $('#tab3').html( info );
        info = $('#tab2').html();
        $('#tab3').append( info );
    };

$(function(){
    $('.chzn-select').select2();
    $("#destination").mask("99999");
    $("#credit").mask("9999-9999-9999-9999");
    $("#expiration-date").datepicker(); 
    $("#wizard").bootstrapWizard({onTabShow: function(tab, navigation, index) {
        var $total = navigation.find('li').length;
        var $current = index+1;
        var $percent = ($current/$total) * 100;
        var $wizard = $("#wizard");
        $wizard.find('.progress-bar').css({width:$percent+'%'});

        if($current >= $total) {
            $wizard.find('.pager .next').hide();
            $wizard.find('.pager .finish').show();
            $wizard.find('.pager .finish').removeClass('disabled');
            displayReview();
        } else {
            $wizard.find('.pager .next').show();
            $wizard.find('.pager .finish').hide();
        }
    }});
});



$(document).ready( function() {



    //var description = "POOP FROM AJAX";
    //var tags = "tag ajax";
    //var goon_email = "poop@eddy.com";
    //var tasks = ["task1","task2", "task3"];
    //var jsonTasks = JSON.stringify(tasks);

    $('#testTasks').on('click', function(e) {

        // Get form values
           var $title = $('#workflow_title').val();
           var $tags = $('#workflow_tags').val();
           var $description = $('#workflow_description').val();
           var $goon_email = $('#workflow_goon_email').val();

        // Get an array of all the task inputs
           var $tasks = $('.task').map( function() { return $(this).val(); }).get();

        // POST to workflows controller, hits #create action
        $.ajax({
            type: 'POST',
            url: '/workflows',
            data: { workflow: { title: $title, description: $description, tags: $tags, goon_email: $goon_email, tasks: JSON.stringify($tasks) } }
        });
    })
})

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
