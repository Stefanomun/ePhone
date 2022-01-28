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
<h3>I tuoi dati personali</h3>
<hr>

<table class="table">
	 <tbody>
    	<tr>
	      <th scope="row">Nome</th>
	      <td><%=user.getName() %></td>
	    </tr>
	    <tr>
	      <th scope="row">Cognome</th>
	      <td><%=user.getSurname() %></td>
	    </tr>
	    <tr>
	      <th scope="row">Username</th>
	      <td><%=user.getUsername() %></td>
	    </tr>
	    <tr>
	      <th scope="row">Data di nascita</th>
	      <td><%=user.getData_nascita() %></td>
	    </tr>
	    <tr>
	      <th scope="row">Email</th>
	      <td><%=user.getEmail() %></td>
	    </tr>
	    <tr>
	      <th scope="row">Contatto</th>
	      <td><%=user.getContact() %></td>
	    </tr>
</table>
<%@include file="../fragments/Footer.jsp"  %>
</body>
</html>