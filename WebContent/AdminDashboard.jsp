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

		<%@include file="../fragments/AdminNavbar.jsp"  %>

<hr>
<h3>Area personale di <%=user.getUsername() %></h3>
<hr>

<div class="row" style=" padding-right: 15px;padding-left: 15px;">
  <div class="col-sm-6">
    <div class="card">
      <div class="card-body">
        <h5 class="card-title">Catalogo</h5>
        <p class="card-text">Gestisci il catalogo</p>
        <form action="PhoneServlet" method="post">
			<input type="hidden" value="admin" name="action">
			<input type="submit" class="btn btn-outline-secondary" value="Vai!">
		</form>
      </div>
    </div>
  </div>
  <div class="col-sm-6">
    <div class="card">
      <div class="card-body">
        <h5 class="card-title">Ordini</h5>
        <p class="card-text">Visualizza gli ordini dei tuoi clienti</p>
        <form action="OrderServlet" method="post">
			<input type="hidden" value="admin" name="action">
			<input type="submit" class="btn btn-outline-secondary" value="Vai!">
		</form>
      </div>
    </div>
  </div>
  <div class="col-sm-6">
    <div class="card">
      <div class="card-body">
        <h5 class="card-title">Utenti</h5>
        <p class="card-text">Visualizza la lista degli utenti registrati ad ePhone</p>
        <form action="UserServlet" method="post">
			<input type="hidden" value="view" name="action">
			<input type="submit" class="btn btn-outline-secondary" value="Vai!">
		</form>
      </div>
    </div>
  </div>
</div>
<%@include file="../fragments/Footer.jsp"  %>
</body>
</html>