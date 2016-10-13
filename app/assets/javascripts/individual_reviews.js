// # Place all the behaviors and hooks related to the matching controller here.
// # All this logic will automatically be available in application.js.
// # You can use CoffeeScript in this file: http://coffeescript.org/

var Review = {};
Paloma.controller('IndividualReviews', {
	new: function(){
		Review.updateViewPrevious('#individual_review_employee_id')
		$('#individual_review_employee_id').on('change', function(){
			Review.updateViewPrevious(this);
		});
		
	}
});



Review.updateViewPrevious = function(employee_id){
	var base_url = window.location.origin
	var employee_id = $(employee_id).val()	
	console.log(employee_id, ' employee_id')
	var $show_button = $('#show-previous')	
	$show_button.attr('href', base_url + '/profiles/' + employee_id)
}
