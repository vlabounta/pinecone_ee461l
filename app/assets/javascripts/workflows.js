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

    $('#createWorkflow').on('click', function(e) {

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
            data: { workflow: { title: $title, description: $description, tags: $tags, goon_email: $goon_email, tasks: JSON.stringify($tasks) } },
        });
        
    });

    // Event handler, create new input field when the last one has data entered
    $('#tab2 fieldset').on('keyup', 'input.final-task', function() {
        $(this).removeClass('final-task');
       // '#tab2 div:last-child'
       $('#tab2 fieldset').append('<div class="control-group">'+
                            '<label class="control-label" for="task9">Task3</label><div class="controls form-group">'+
                                           '<div class="col-md-10">'+
                                            '<input type="text" id="task9" name="task9" placeholder="" class="form-control task final-task">'+
                                            '</div>');
       //$('.final-task').bind('keyup');
    });

    $('.task').typeahead({
        name: 'tasks',
        remote: '/tasks'
    });

    /*$('.task').each( function( i, e ) {
        var select = $(e);
        options = {};
        options.ajax = {
            url: '/tasks',
            dataType: 'json',
            data: function( term, page ) { return { q: term, page: page } },
            results: function( data, page ) { return { results: data } }
        };

        options.dropdownCssClass = 'bigdrop';
    
        select.select2(options);
    });*/

   
    
})




    /*var emtpyTaskFields = $(this).val();

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
    }*/



