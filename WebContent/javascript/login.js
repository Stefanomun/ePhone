function loginCheck(form){
	var username = $("#username").val();
	var password = $("#password").val();

	$(".error").remove();

	if (username.length<1 ) {
		$("#username").removeClass("is-valid");
		$("#username").addClass("is-invalid");
	} else {
		$("#username").removeClass("is-invalid");
		$("#username").addClass("is-valid");
	}

	if (password.length<1 ) {
		$("#password").removeClass("is-valid");
		$("#password").addClass("is-invalid");
	} else {
		$("#password").removeClass("is-invalid");
		$("#password").addClass("is-valid");
	}
}