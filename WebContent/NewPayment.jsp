<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<link rel="icon" type="image/png"
	href="<%=request.getContextPath()%>/img/Logo.png">
<style>
body { 
    padding-top: 65px; 
   
}
</style>
<meta charset="ISO-8859-1">
<title>Nuovo metodo di pagamento</title>
</head>
<body style="background-color: rgba(45,48,70,255);">
<%if(request.getSession().getAttribute("user") == null){ %>
		<%@include file="../fragments/Navbar.jsp"  %>	
	<%}else{ %>
		<%@include file="../fragments/LoggedNavbar.jsp"  %>
	<%} %>

<section class="vh-100" style="padding-top: 80px;">
		<div class="row justify-content-center" >
			<div class="col-md-6">
				<div class="card">
					<header class="card-header" style="background-color:rgba(57,95,151,255);">
						<h4 class="card-title mt-2">Nuovo metodo di pagamento</h4>
					</header>
					<article class="card-body">
						<form action="NewPaymentServlet" method="post" onsubmit="event.preventDefault(); cardCheck(this)">
							<div class="form-row">
								<div class="col form-group">
									<label>Numero di carta </label>   
			  						<input type="text" class="form-control" placeholder="" name="numero" id="numero">
									<div class="invalid-feedback" id="errorid">Inserisci un numero valido</div>
			  						<div class="valid-feedback" id="errorName">Corretto</div>
								</div>
								<div class="col form-group">
									<label>Circuito</label>
								  	<select class="form-control" name="circuito" id="circuito">
								  		<option value="circuito">Circuito</option>
								  		<option value="Visa">Visa</option>
										<option value="Mastercard">Mastercard</option>
										<option value="American Express">American Express</option>
								  	</select>
									<div class="invalid-feedback" id="errorid">Inserisci un circuito valido</div>
			  						<div class="valid-feedback" id="errorName">Corretto</div>
								</div>
								<div class="col form-group">
									<label>CVV</label>
									<input type="text" class="form-control" placeholder="" name="cvv" id="cvv">
									<div class="invalid-feedback" id="errorid">Inserisci un CVV valido</div>
			  						<div class="valid-feedback" id="errorName">Corretto</div>
								</div> 
							</div> 
							<div class="form-row">
								<div class="col form-group">
									<label>Scadenza</label>
								  	<input type="month" class="form-control" placeholder=" " name="scadenza" id="scadenza">
									<div class="invalid-feedback" id="errorid">Inserisci una data di scadenza valida</div>
			  						<div class="valid-feedback" id="errorName">Corretto</div>
								</div> 
							</div>
							<div class="form-row">
								<div class="col form-group">
									<label>Nome del titolare</label>
									<input type="text" class="form-control" placeholder="" name="nome_titolare" id="nome_titolare">
									<div class="invalid-feedback" id="errorid">Inserisci un nome valido</div>
			  						<div class="valid-feedback" id="errorName">Corretto</div>
								</div>
								<div class="col form-group">
									<label>Cognome del titolare</label>
									<input type="text" class="form-control" placeholder="" name="cognome_titolare" id="cognome_titolare">
									<div class="invalid-feedback" id="errorid">Inserisci un cognome valido</div>
			  						<div class="valid-feedback" id="errorName">Corretto</div>
								</div>
							</div>
						    <div class="form-group">
						        <button type="submit" class="btn btn-primary btn-block"> Registra la carta  </button>
						    </div>    
						</form>
					</article> 
			</div>
		</div> 	
	</div>
</section>
<%@include file="../fragments/Footer.jsp"  %>
<script type="text/javascript" src="javascript/card.js"></script>
</body>
</html>