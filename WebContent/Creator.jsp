<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Accesso negato</title>
<style>
body { 
    padding-top: 30px; 
   
}
</style>
</head>
<body>
<%@include file="../fragments/Navbar.jsp"  %>
<section class="vh-100" style="background-color: rgba(57,95,151,255);">
		<div class="container py-5 h-100">
    		<div class="row d-flex justify-content-center align-items-center h-100">
      			<div class="col col-xl-10">
			        <div class="card" style="border-radius: 1rem;">
			          <div class="row g-0">
			            <div class="col-md-6 col-lg-5 d-none d-md-block">
			              <img
			                src="img/smartphones.jpg"
			                alt="Carrello Vuoto"
			                class="img-fluid" style="border-radius: 1rem 0 0 1rem;"
			              />
			            </div>
            			<div class="col-md-6 col-lg-7 d-flex align-items-center">    
             				<div class="card-body p-4 p-lg-5 text-black">
             					<h1>Oooops!<br>Non hai i permessi per accedere a questa sezione</h1>
              					<form action="PagesServlet" method="post">
									<input type="hidden" value="signin" name="action">
									<input type="submit" class="btn btn-dark btn-lg btn-block" value="Torna alla pagina di login">
								</form>
							</div>
            			</div>
          			  </div>
        			</div>
      			</div>
    		</div>
  		</div>
	</section>
<%@include file="../fragments/Footer.jsp"  %>
</body>
</html>