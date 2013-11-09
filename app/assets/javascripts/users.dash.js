/**
 * users.dash.js
 *
 * Requires jQuey 1.9
 * Callback functions to populate asychnronous UI widgets on the user dash.
 *
 * Brad Stewart - Project Pinecone - 11.9.2013
 *
 */

 $(document).ready( { 

 	// Get currently onboarding
 	$.ajax({
  	url: "/dash/onboarding",
	  /*data: {
	    zipcode: 97201
	  },*/
	  success: function( data ) {
	    $( "#currentlyOnboarding" ).html( "<strong>" + data + "</strong> degrees" );
	  }
	});

	// Get currently onboarding
 	$.ajax({
  	url: "/dash/onboarding",
	  /*data: {
	    zipcode: 97201
	  },*/
	  success: function( data ) {
	    $( "#currentlyOnboarding" ).html( "<strong>" + data + "</strong> degrees" );
	  }
	});

 })
