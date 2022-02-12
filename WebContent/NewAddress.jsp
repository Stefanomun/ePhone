<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<link rel="icon" type="image/png"
	href="<%=request.getContextPath()%>/img/Logo.png">
<style>
body { 
    padding-top: 60px; 
   	backgroud-color: rgba(45,48,70,255);
}
</style>
<meta charset="ISO-8859-1">
<title>Nuovo indirizzo</title>
</head>
<body style="background-color: rgba(45,48,70,255);">
<%if(request.getSession().getAttribute("user") == null){ %>
		<%@include file="../fragments/Navbar.jsp"  %>	
	<%}else{ %>
		<%@include file="../fragments/LoggedNavbar.jsp"  %>
	<%} %>
<section class="vh-100" style="padding-top: 100px;">
		<div class="row justify-content-center" >
			<div class="col-md-6">
				<div class="card">
					<header class="card-header" style="background-color:rgba(57,95,151,255);">
						<h4 class="card-title mt-2">Nuovo indirizzo</h4>
					</header>
					<article class="card-body">
						<form action="NewAddressServlet" method="post" onsubmit="event.preventDefault(); addressCheck(this)">
							<div class="form-row">
								<div class="col form-group">
									<label>Comune </label>   
			  						<input type="text" class="form-control" placeholder="" id="comune" name="comune">
									<div class="invalid-feedback" id="errorid">Inserisci un comune valido</div>
			  						<div class="valid-feedback" id="errorName">Corretto</div>
								</div>
								<div class="col form-group">
									<label>Provincia</label>
								  	<select class="form-control" name="provincia" id="provincia">
								  		<option value="provincia">Provincia</option>
								  		<option value="AG">AG</option>
										<option value="AL">AL</option>
										<option value="AN">AN</option>
										<option value="AO">AO</option>
										<option value="AQ">AQ</option>
										<option value="AR">AR</option>
										<option value="AP">AP</option>
										<option value="AT">AT</option>
										<option value="AV">AV</option>
										<option value="BA">BA</option>
										<option value="BT">BT</option>
										<option value="BL">BL</option>
										<option value="BN">BN</option>
										<option value="BG">BG</option>
										<option value="BI">BI</option>
										<option value="BO">BO</option>
										<option value="BZ">BZ</option>
										<option value="BS">BS</option>
										<option value="BR">BR</option>
										<option value="CA">CA</option>
										<option value="CL">CL</option>
										<option value="CB">CB</option>
										<option value="CI">CI</option>
										<option value="CE">CE</option>
										<option value="CT">CT</option>
										<option value="CZ">CZ</option>
										<option value="CH">CH</option>
										<option value="CO">CO</option>
										<option value="CS">CS</option>
										<option value="CR">CR</option>
										<option value="KR">KR</option>
										<option value="CN">CN</option>
										<option value="EN">EN</option>
										<option value="FM">FM</option>
										<option value="FE">FE</option>
										<option value="FI">FI</option>
										<option value="FG">FG</option>
										<option value="FC">FC</option>
										<option value="FR">FR</option>
										<option value="GE">GE</option>
										<option value="GO">GO</option>
										<option value="GR">GR</option>
										<option value="IM">IM</option>
										<option value="IS">IS</option>
										<option value="SP">SP</option>
										<option value="LT">LT</option>
										<option value="LE">LE</option>
										<option value="LC">LC</option>
										<option value="LI">LI</option>
										<option value="LO">LO</option>
										<option value="LU">LU</option>
										<option value="MC">MC</option>
										<option value="MN">MN</option>
										<option value="MS">MS</option>
										<option value="MT">MT</option>
										<option value="VS">VS</option>
										<option value="ME">ME</option>
										<option value="MI">MI</option>
										<option value="MO">MO</option>
										<option value="MB">MB</option>
										<option value="NA">NA</option>
										<option value="NO">NO</option>
										<option value="NU">NU</option>
										<option value="OG">OG</option>
										<option value="OT">OT</option>
										<option value="OR">OR</option>
										<option value="PD">PD</option>
										<option value="PA">PA</option>
										<option value="PR">PR</option>
										<option value="PV">PV</option>
										<option value="PG">PG</option>
										<option value="PU">PU</option>
										<option value="PE">PE</option>
										<option value="PC">PC</option>
										<option value="PI">PI</option>
										<option value="PT">PT</option>
										<option value="PN">PN</option>
										<option value="PZ">PZ</option>
										<option value="PO">PO</option>
										<option value="RG">RG</option>
										<option value="RA">RA</option>
										<option value="RC">RC</option>
										<option value="RE">RE</option>
										<option value="RI">RI</option>
										<option value="RN">RN</option>
										<option value="RM">RM</option>
										<option value="RO">RO</option>
										<option value="SA">SA</option>
										<option value="SS">SS</option>
										<option value="SV">SV</option>
										<option value="SI">SI</option>
										<option value="SR">SR</option>
										<option value="SO">SO</option>
										<option value="TA">TA</option>
										<option value="TE">TE</option>
										<option value="TR">TR</option>
										<option value="TO">TO</option>
										<option value="TP">TP</option>
										<option value="TN">TN</option>
										<option value="TV">TV</option>
										<option value="TS">TS</option>
										<option value="UD">UD</option>
										<option value="VA">VA</option>
										<option value="VE">VE</option>
										<option value="VB">VB</option>
										<option value="VC">VC</option>
										<option value="VR">VR</option>
										<option value="VV">VV</option>
										<option value="VI">VI</option>
										<option value="VT">VT</option>
								  	</select>
								  	<div class="invalid-feedback" id="errorid">Inserisci una provincia valida</div>
			  						<div class="valid-feedback" id="errorName">Corretto</div>
								</div>
								<div class="col form-group">
									<label>CAP</label>
									<input type="text" class="form-control" placeholder="" name="cap" id="cap">
									<div class="invalid-feedback" id="errorid">Inserisci un CAP valido</div>
			  						<div class="valid-feedback" id="errorName">Corretto</div>
								</div> 
							</div> 
							<div class="form-row">
								<div class="col form-group">
									<label>Via</label>
								  	<input type="text" class="form-control" placeholder=" " name="via" id="via">
									<div class="invalid-feedback" id="errorid">Inserisci una via valida</div>
			  						<div class="valid-feedback" id="errorName">Corretto</div>
								</div> 
								<div class="col form-group">
								<label>Civico</label>
								<input type="text" class="form-control" placeholder="" name="civico" id="civico">
								<div class="invalid-feedback" id="errorid">Inserisci un civico valido</div>
			  					<div class="valid-feedback" id="errorName">Corretto</div>
							</div>
							</div>
						    <div class="form-group">
						        <button type="submit" class="btn btn-primary btn-block"> Registra l'indirizzo  </button>
						    </div>    
						</form>
					</article> 
			</div>
		</div> 	
	</div>
</section>
<%@include file="../fragments/Footer.jsp"  %>
<script type="text/javascript" src="javascript/address.js"></script>
</body>
</html>