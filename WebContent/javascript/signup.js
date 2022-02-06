function signupCheck(form){
	var nome = $("#nome").val();
	var cognome = $("#cognome").val();
	var contatto = $("#contatto").val();
	var data_nascita = $("#data_nascita").val();
	var email = $("#email").val();
	var username = $("#username").val();
	var password = $("#password").val();

	$(".error").remove();

	if (nome.length < 1 && nome.length > 15) {
		$("#nome").removeClass("is-valid");
		$("#nome").addClass("is-invalid");
	} else {
		$("#nome").removeClass("is-invalid");
		$("#nome").addClass("is-valid");
	}

	if (cognome.length < 1 && cognome.length > 30) {
		$("#cognome").removeClass("is-valid");
		$("#cognome").addClass("is-invalid");
	} else {
		$("#cognome").removeClass("is-invalid");
		$("#cognome").addClass("is-valid");
	}

	var telformat = /^\(([0-9]{3})\)[-\.\s]([0-9]{3})[-\.\s]([0-9]{4})$/;
	if (!contatto.match(telformat) && contatto.length < 10 && contatto.length > 10) {
		$("#contatto").removeClass("is-valid");
		$("#contatto").addClass("is-invalid");
	} else {
		$("#contatto").removeClass("is-invalid");
		$("#contatto").addClass("is-valid");
	}

	if(data_nascita == ""){
		$("#data_nascita").removeClass("is-valid");
		$("#data_nascita").addClass("is-invalid");
	} else {
		$("#data_nascita").removeClass("is-invalid");
		$("#data_nascita").addClass("is-valid");
	}
	
	var mailformat = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
	if (!email.match(mailformat)) {
		$("#email").removeClass("is-valid");
		$("#email").addClass("is-invalid");
	} else {
		$("#email").removeClass("is-invalid");
		$("#email").addClass("is-valid");
	}
	
	if (username.length < 1 ) {
		$("#username").removeClass("is-valid");
		$("#username").addClass("is-invalid");
	} else {
		$("#username").removeClass("is-invalid");
		$("#username").addClass("is-valid");
	}

	if (password.length < 8 ) {
		$("#password").removeClass("is-valid");
		$("#password").addClass("is-invalid");
	} else {
		$("#password").removeClass("is-invalid");
		$("#password").addClass("is-valid");
	}

}