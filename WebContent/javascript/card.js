function cardCheck(form){
	var numero = $("#numero").val();
	var circuito = $("#circuito").val();
	var cvv = $("#cvv").val();
	var scadenza = $("#scadenza").val();
	var nome_titolare = $("#nome_titolare").val();
	var cognome_titolare = $("#cognome_titolare").val();
	var flag = true;
	
	var patternCarta = /^[0-9]{16}$/;
	if (!numero.match(patternCarta) ) {
		flag=false;
		$("#numero").removeClass("is-valid");
		$("#numero").addClass("is-invalid");
	} else {
		$("#numero").removeClass("is-invalid");
		$("#numero").addClass("is-valid");
	}

	if(circuito == "circuito"){
		flag=false;
		$("#circuito").removeClass("is-valid");
		$("#circuito").addClass("is-invalid");
	} else {
		$("#circuito").removeClass("is-invalid");
		$("#circuito").addClass("is-valid");
	}

	var patternCvv = /^[0-9]{3}$/;
	if (!cvv.match(patternCvv) ) {
		flag=false;
		$("#cvv").removeClass("is-valid");
		$("#cvv").addClass("is-invalid");
	} else {
		$("#cvv").removeClass("is-invalid");
		$("#cvv").addClass("is-valid");
	}


	var annoInserito = scadenza.substring(0,4);
	var meseInserito = scadenza.substring(5);
	if(meseInserito.substring(0,1) == 0){
		meseInserito = meseInserito.substring(1, 2);
	}
	var date = new Date();
	var meseCorrente = date.getMonth() + 1;
	var annoCorrente = date.getFullYear();
	if ((annoInserito < annoCorrente) || (meseInserito < meseCorrente && annoInserito <= annoCorrente)) {
		flag=false;
		$("#scadenza").removeClass("is-valid");
		$("#scadenza").addClass("is-invalid");
	} else {
		$("#scadenza").removeClass("is-invalid");
		$("#scadenza").addClass("is-valid");
	}
	
	
	var patternLettere = /^[a-zA-Z ]+$/;
	if (!nome_titolare.match(patternLettere) || nome_titolare.length < 1 || nome_titolare.length > 20) {
		flag=false;
		$("#nome_titolare").removeClass("is-valid");
		$("#nome_titolare").addClass("is-invalid");
	} else {
		$("#nome_titolare").removeClass("is-invalid");
		$("#nome_titolare").addClass("is-valid");
	}

	if (!cognome_titolare.match(patternLettere) || cognome_titolare.length < 1 || cognome_titolare.length > 50) {
		flag=false;
		$("#cognome_titolare").removeClass("is-valid");
		$("#cognome_titolare").addClass("is-invalid");
	} else {
		$("#cognome_titolare").removeClass("is-invalid");
		$("#cognome_titolare").addClass("is-valid");
	}

	if (flag) {
		form.submit();
	}

}