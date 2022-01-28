<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="ISO-8859-1"%>

<%
	UserBean user = (UserBean) request.getSession().getAttribute("user");
%>

<%@ page contentType="text/html; charset=UTF-8"
	import="java.util.*, model.UserBean"%>
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
<title><%=user.getUsername() %></title>
</head>
<body>
<%if(request.getSession().getAttribute("user") == null){ %>
		<%@include file="../fragments/Navbar.jsp"  %>	
	<%}else{ %>
		<%@include file="../fragments/LoggedNavbar.jsp"  %>
	<%} %>

<hr>
<h3>Area personale di <%=user.getUsername() %></h3>
<hr>

<div class="row" style=" padding-right: 15px;padding-left: 15px;">
  <div class="col-sm-6">
    <div class="card">
      <div class="card-body">
        <h5 class="card-title">Dati Personali</h5>
        <p class="card-text">Visualizza i dati inseriti in fase di iscrizione</p>
        <form action="PagesServlet" method="post">
			<input type="hidden" value="dp" name="action">
			<input type="submit" class="btn btn-outline-secondary" value="Vai!">
		</form>
      </div>
    </div>
  </div>
  <div class="col-sm-6">
    <div class="card">
      <div class="card-body">
        <h5 class="card-title">I miei ordini</h5>
        <p class="card-text">Visualizza i tuoi ordini</p>
        <form action="OrderServlet" method="post">
			<input type="hidden" value="view" name="action">
			<input type="submit" class="btn btn-outline-secondary" value="Vai!">
		</form>
      </div>
    </div>
  </div>
  <div class="col-sm-6">
    <div class="card">
      <div class="card-body">
        <h5 class="card-title">I miei indirizzi</h5>
        <p class="card-text">Visualizza gli indirizzi che hai registrato per la consegna ordini</p>
        <form action="AddressServlet" method="post">
			<input type="hidden" value="view" name="action">
			<input type="hidden" value="0" name="subaction">
			<input type="submit" class="btn btn-outline-secondary" value="Vai!">
		</form>
      </div>
    </div>
  </div>
   <div class="col-sm-6">
    <div class="card">
      <div class="card-body">
        <h5 class="card-title">I miei metodi di pagamento</h5>
        <p class="card-text">Visualizza le carte che hai registrato per il pagamento ordini</p>
        <form action="PaymentsServlet" method="post">
			<input type="hidden" value="view" name="action">
			<input type="hidden" value="0" name="subaction">
			<input type="submit" class="btn btn-outline-secondary" value="Vai!">
		</form>
      </div>
    </div>
  </div>
</div>
<%@include file="../fragments/Footer.jsp"  %>
</body>
</html>