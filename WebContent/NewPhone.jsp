<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="ISO-8859-1"%>

<%
	Collection<BrandBean> marche = (Collection<BrandBean>) request.getAttribute("marche");
%>

<%@ page contentType="text/html; charset=UTF-8"
	import="java.util.*, model.PhoneBean, model.BrandBean"%>
<!DOCTYPE html>
<html>
<head>
<link rel="icon" type="image/png"
	href="<%=request.getContextPath()%>/img/Logo.png">
<style>
body { 
    padding-top: 60px; 
    padding-bottom: 0px;
   
}

a{
	text-decoration: none;
}
</style>
<meta charset="ISO-8859-1">
<title>Gestione Catalogo</title>
</head>
<body>
<%@include file="../fragments/AdminNavbar.jsp"  %>
<section class="vh-100" style="background-color: rgba(45,48,70,255);">
		<div class="row justify-content-center" >
				<div class="card">
					<header class="card-header" style="background-color:rgba(57,95,151,255);">
						<h4 class="card-title mt-2">Aggiungi un nuovo telefono al catalogo</h4>
					</header>
					<article class="card-body">
						<form action="PhoneServlet" method="post" onsubmit="event.preventDefault(); phoneCheck(this)">
							<div class="form-row">
								<div class="col form-group">
									<label for="marca">Marca</label>
										<select class="form-control" name="marca" id="marca">
											<option value="marca">Marca</option>
										<%if (marche != null && marche.size() != 0) {
											Iterator<?> it = marche.iterator();
											while (it.hasNext()) {
												BrandBean marca = (BrandBean) it.next(); %>
												<option value="<%=marca.getID()%>"><%=marca.getName()%></option>
												<%} 
												}%>
										</select>
										<div class="invalid-feedback" id="errorid">Inserisci una marca valida</div>
			  							<div class="valid-feedback" id="errorName">Corretto</div>
								</div>
								<div class="col form-group">
									<label>Modello</label>
								  	<input type="text" class="form-control" placeholder=" " name="modello" id="modello">
								  	<div class="invalid-feedback" id="errorid">Inserisci un modello valido</div>
			  						<div class="valid-feedback" id="errorName">Corretto</div>
								</div>
							</div>
							<div class="form-row">
								<div class="col form-group">
									<label>RAM</label>
								  	<input type="text" class="form-control" placeholder=" " name="ram" id="ram">
								  	<div class="invalid-feedback" id="errorid">Inserisci un quantitativo di RAM valido</div>
			  						<div class="valid-feedback" id="errorName">Corretto</div>
								</div>
								<div class="col form-group">
									<label>Taglia</label>
								  	<input type="text" class="form-control" placeholder=" " name="taglia" id="taglia">
								  	<div class="invalid-feedback" id="errorid">Inserisci una taglia valida</div>
			  						<div class="valid-feedback" id="errorName">Corretto</div>
								</div>
							</div>
							<div class="form-row">
								<div class="col form-group">
									<label>Particolarità</label>
										<select class="form-control" name="particolarita" id="particolarita">
													<option value="nessuna">Nessuna</option>
													<option value="ricondizionato">Ricondizionato</option>
													<option value="epoca">D'epoca</option>
										</select>
								</div>
								<div class="col form-group">
										<label>Colore</label>
									  	<input type="text" class="form-control" placeholder=" " name="colore" id="colore">
									  	<div class="invalid-feedback" id="errorid">Inserisci un colore valido</div>
			  							<div class="valid-feedback" id="errorName">Corretto</div>
								</div>
							</div>
							<div class="form-row">
								<div class="form-group">
									<label>Prezzo</label>
								  	<input type="text" class="form-control" placeholder=" " name="prezzo" id="prezzo">
								  	<div class="invalid-feedback" id="errorid">Inserisci un prezzo valido</div>
			  						<div class="valid-feedback" id="errorName">Corretto</div>
								</div>
									
								<div class="col form-group">
									<label>Quantità</label>
								  	<input type="number" class="form-control" placeholder=" " name="quantita" id="quantita">
								  	<div class="invalid-feedback" id="errorid">Inserisci una quantità valido</div>
			  						<div class="valid-feedback" id="errorName">Corretto</div>
								</div>
								<div class="col form-group">
									<label>Foto(URL)</label>
								  	<input type="text" class="form-control" placeholder=" " name="foto" id="foto">
								  	<div class="invalid-feedback" id="errorid">Inserisci un URL valido</div>
			  						<div class="valid-feedback" id="errorName">Corretto</div>
								</div>
							</div>
						    <div class="form-group">
						    	<input type="hidden" name="action" value="add">
						        <button type="submit" class="btn btn-primary btn-block"> Aggiungi al catalogo  </button>
						    </div>             
						</form>
					</article> 
			</div>
		</div> 	

	</section>
	<%@include file="../fragments/Footer.jsp"  %>
	<script type="text/javascript" src="javascript/phone.js"></script>
</body>
</html>