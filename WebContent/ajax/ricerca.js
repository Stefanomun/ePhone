
/*
*
*
*
*
*/

$(document).ready(function() {

 $.ajaxSetup({ cache: false });
 
 $('#inputSearch').keyup(function(){
  $('#result').html('');
  $('#state').val('');
  
  var searchField = $('#inputSearch').val();
  var expression = new RegExp(searchField, "i");
  $.getJSON('AjaxRetrieveInformation', function(data) {
  $('#result').html('');
   $.each(data, function(key, value){
    if (value.modello.search(expression) != -1 )
    {
     $('#result').append('<a class="list-group-item list-group-item-action list-group-item-light" onclick="clickSuggerimento('+value.ID+')"> '+ value.modello+'</a>');
    }
   });   
  });
 });
 
 $('#result').on('click', 'li', function() {
  var click_text = $(this).text().split('|');
  $('#search').val($.trim(click_text[0]));
  $("#result").html('');
 });
});

	
function clickSuggerimento(ID) {
	console.log("ID: "+ ID);
	location.href= encodeURI("PhoneServlet?id=" + ID);
}