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
   
}
</style>
<meta charset="ISO-8859-1">
<title>Registrazione</title>
</head>
<body>
	<%if(request.getSession().getAttribute("user") == null){ %>
		<%@include file="../fragments/Navbar.jsp"  %>	
	<%}else{ %>
		<%@include file="../fragments/LoggedNavbar.jsp"  %>
	<%} %>

	<section class="vh-100" style="background-color: rgba(45,48,70,255);">
		<div class="row justify-content-center" >
			<div class="col-md-6">
				<div class="card">
					<header class="card-header" style="background-color:rgba(57,95,151,255);">
						<h4 class="card-title mt-2">Registrati</h4>
					</header>
					<article class="card-body">
						<form action="SignUpServlet" method="post" >
							<div class="form-row">
								<div class="col form-group">
									<label>Nome </label>   
			  						<input type="text" class="form-control" placeholder="" name="nome">
								</div>
								<div class="col form-group">
									<label>Cognome</label>
								  	<input type="text" class="form-control" placeholder=" " name="cognome">
								</div> 
							</div>
							<div class="form-row">
								<div class="col form-group">
									<label>Contatto</label>
									<input type="text" class="form-control" placeholder="" name="contatto">
								</div> 
								<div class="col form-group">
									<label>Data di nascita</label>
								  	<input type="date" class="form-control" placeholder=" " name="data_nascita">
								</div> 
							</div>
		
							<div class="form-group">
								<label>Email</label>
								<input type="text" class="form-control" placeholder="" name="email">
							</div>
							<div class="form-group">
								<label>Username</label>
							    <input class="form-control" type="text" name="username">
							</div>
							<div class="form-group">
								<label>Password</label>
							    <input class="form-control" type="password" name="password">
							</div>  
						    <div class="form-group">
						        <button type="submit" class="btn btn-primary btn-block"> Registrati  </button>
						    </div>   
	    					<small class="text-muted">By clicking the 'Sign Up' button, you confirm that you accept our <br> Terms of use and Privacy Policy.</small>                                          
						</form>
					</article> 
				<div class="border-top card-body text-center">Hai gi&agrave; un account?<a href="PagesServlet?action=signin">Accedi</a></div>
			</div>
		</div> 	
	</div>
	</section>
	<%@include file="../fragments/Footer.jsp"  %>	
</body>
</html>