function phoneCheck(form){
	var marca = $("#marca").val();
	var modello = $("#modello").val();
	var ram = $("#ram").val();
	var taglia = $("#taglia").val();
	var colore = $("#colore").val();
	var quantita = $("#quantita").val();
	var prezzo = $("#prezzo").val();
	var foto = $("#foto").val();
	var flag = true;
	
	if(marca == "marca"){
		flag=false;
		$("#marca").removeClass("is-valid");
		$("#marca").addClass("is-invalid");
	} else {
		$("#marca").removeClass("is-invalid");
		$("#marca").addClass("is-valid");
	}
	
	if(modello == ""){
		flag=false;
		$("#modello").removeClass("is-valid");
		$("#modello").addClass("is-invalid");
	} else {
		$("#modello").removeClass("is-invalid");
		$("#modello").addClass("is-valid");
	}
	
	var patternNumeri = /^[0-9]*$/;
	if (!ram.match(patternNumeri) || ram == "") {
		flag=false;
		$("#ram").removeClass("is-valid");
		$("#ram").addClass("is-invalid");
	} else {
		$("#ram").removeClass("is-invalid");
		$("#ram").addClass("is-valid");
	}
	
	if (!taglia.match(patternNumeri) || taglia == "") {
		flag=false;
		$("#taglia").removeClass("is-valid");
		$("#taglia").addClass("is-invalid");
	} else {
		$("#taglia").removeClass("is-invalid");
		$("#taglia").addClass("is-valid");
	}
	
	var patternLettere = /^[a-zA-Z ]+$/;
	if (!colore.match(patternLettere)) {
		flag=false;
		$("#colore").removeClass("is-valid");
		$("#colore").addClass("is-invalid");
	} else {
		$("#colore").removeClass("is-invalid");
		$("#colore").addClass("is-valid");
	}
	
	if (!quantita.match(patternNumeri) || quantita <= 0 || quantita == "" ) {
		flag=false;
		$("#quantita").removeClass("is-valid");
		$("#quantita").addClass("is-invalid");
	} else {
		$("#quantita").removeClass("is-invalid");
		$("#quantita").addClass("is-valid");
	}
	
	var patternDouble = /^[0-9\.]*$/;
	if(!prezzo.match(patternDouble) || prezzo < 0 || prezzo == ""){
		flag=false;
		$("#prezzo").removeClass("is-valid");
		$("#prezzo").addClass("is-invalid");
	} else {
		$("#prezzo").removeClass("is-invalid");
		$("#prezzo").addClass("is-valid");
	}
	
	var patternURL=/[-a-zA-Z0-9@:%._\+~#=]{1,256}\.[a-zA-Z0-9()]{1,6}\b([-a-zA-Z0-9()@:%_\+.~#?&//=]*)/;
	if(!foto.match(patternURL)){
		flag=false;
		$("#foto").removeClass("is-valid");
		$("#foto").addClass("is-invalid");
	} else {
		$("#foto").removeClass("is-invalid");
		$("#foto").addClass("is-valid");
	}
	
	if (flag) {
		form.submit();
	}
}