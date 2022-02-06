<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<link rel="icon" type="image/png"
	href="<%=request.getContextPath()%>/img/Logo.png">
<meta charset="ISO-8859-1">
<title>Login</title>
<style>
body { 
    padding-top: 30px; 
   
}
</style>
</head>
<body>
	<%if(request.getSession().getAttribute("user") == null){ %>
		<%@include file="../fragments/Navbar.jsp"  %>	
	<%}else{ %>
		<%@include file="../fragments/LoggedNavbar.jsp"  %>
	<%} %>

	<section class="vh-100" style="background-color: rgba(57,95,151,255);">
		<div class="container py-5 h-100">
			<div class="row d-flex justify-content-center align-items-center h-100">
      			<div class="col col-xl-10">
        			<div class="card" style="border-radius: 1rem;">
          				<div class="row g-0">
            				<div class="col-md-6 col-lg-5 d-none d-md-block">
              				<img
			                src="img/smartphones.jpg"
			                alt="login form"
			                class="img-fluid" style="border-radius: 1rem 0 0 1rem;"
			              	/>
            				</div>
            				<div class="col-md-6 col-lg-7 d-flex align-items-center">
	              				<div class="card-body p-4 p-lg-5 text-black">
	
									<form action="SignInServlet" method="post" onsubmit="event.preventDefault(); loginCheck(this)">
	
										<div class="d-flex align-items-center mb-3 pb-1">
	                   						<img
								                src="img/Logo.png"
								                alt="logo"
								                height="100" width="170"
								                class="img-fluid" style="border-radius: 1rem 0 0 1rem;"
								              />
	                  					</div>
	
	                  					<h5 class="fw-normal mb-3 pb-3" style="letter-spacing: 1px;">Accedi</h5>
	
										<div class="form-outline mb-4">
	                    					<input type="text" id="username" name="username" class="form-control form-control-lg" />
	                    						<label class="form-label" for="username">Username</label>
	                  					</div>
	                  					<div class="invalid-feedback" id="error">Inserisci l'Username</div>
	                  					
	                					<div id="passwordError"></div>
	                  					<div class="form-outline mb-4">
		                    				<input type="password" id="password" name="password" class="form-control form-control-lg" />
		                    				<label class="form-label" for="password">Password</label>
		                  				</div>
		                  				<div class="invalid-feedback" id="error">Inserisci la password</div>
	                 
	                  					<div class="form-check form-switch">
						  					<input class="form-check-input" type="checkbox" id="admin" name="admin" value="true">
						  					<label class="form-check-label" for="admin">Voglio accedere come amministratore</label>
					  					</div>
					  					<br>
	
	                  					<div class="pt-1 mb-4">
	                    					<button class="btn btn-dark btn-lg btn-block" type="submit">Login</button>
	                  					</div>
									</form>
	                  			<p class="mb-5 pb-lg-2" style="color: #393f81;">Non hai un account? 
	                  			<a href="PagesServlet?action=signup" style="color: #393f81;">Registrati!</a></p>
				              </div>
			            </div>
			          </div>
			        </div>
			      </div>
			    </div>
			  </div>
	</section>
<%@include file="../fragments/Footer.jsp"  %>
<script type="text/javascript" src="javascript/login.js"></script>
</body>
</html>