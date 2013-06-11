//get current url
var current_url = document.URL;

//get number from end of string
var id = current_url.match(/\d+$/);

//ajax login form
function ajaxifyLoginForm(){
$('form#sign_in').bind('ajax:success', function(e, data, status, xhr){
    if(data.success){
	  	$.fancybox.close(); 
	  	$('#login_box').remove();
      	$('nav').after(data.admin_blog, data.login_box);
	  
		if(current_url == "http://protected-everglades-2935.herokuapp.com/posts/" + id){
			document.location.reload(true);
		}
    }else{
	  $('#sign_in_errors').html(data.errors).hide();
	  $("#sign_in_errors").fadeIn(2000);
    }
  });
}

//ajax register form 
function ajaxifyRegisterForm(){
$('form#sign_up').bind('ajax:success', function(e, data, status, xhr){
    if(data.success){
		alert("You have successfully registered, please login");
	    $.fancybox.close();  
    }else{
		$('#sign_up_errors').empty();
		$('#sign_up_errors').html(data.errors).hide();
	    $("#sign_up_errors").fadeIn(2000);
    }
  });
}

//ajax contact form
$('form#new_contact').bind('ajax:success', function(e, data, status, xhr){
	if(data.success){  
		$.fancybox.close(); 
		alert("Success!");
	}else{
		$('#contact_errors').html(data.errors);
	}
	
});

		

