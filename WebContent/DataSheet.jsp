<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="ISO-8859-1"%>

<%
	PhoneBean phone = (PhoneBean) request.getAttribute("specif");
%>

<%@ page contentType="text/html; charset=UTF-8"
	import="java.util.*, model.PhoneBean, model.UserBean"%>
<!DOCTYPE html>
<html>
<head>
<link rel="icon" type="image/png"
	href="<%=request.getContextPath()%>/img/Logo.png">
<style>
body { 
    padding-top: 60px; 
   
}

.parent{
	text-align:center;
	}
</style>
<meta charset="ISO-8859-1">
<title><%=phone.getNome() %></title>
</head>
	
<body bgcolor="#395f97">
	<%UserBean user = (UserBean)request.getSession().getAttribute("user");
		String admin = (String) request.getSession().getAttribute("admin");
		if(user == null){ %>
			<%@include file="../fragments/Navbar.jsp"  %>
		<%}else if(admin.equals("yes")){%>
			<%@include file="../fragments/AdminNavbar.jsp"  %>	
		<%}else{ %>
			<%@include file="../fragments/LoggedNavbar.jsp"  %>
		<%} %>
  		<div class="container py-5 h-100">
  		<div class="card" style="border-radius: 1rem;">
		<div class="parent"><h1 style="float:center"><%=phone.getNome() %></h1></div>
		<hr>
		<div class="row d-flex justify-content-center align-items-center h-100">
		<div class="form-row">
			<div class="col form-group">
				<img src="<%=phone.getFoto() %>" width="400px" height="400px">
			</div> 
				<table class="table" style="width: 500px; float: right;">
					 <tbody>
				    	<tr>
					      <th scope="row">Marca</th>
					      <td><%=phone.getMarca() %></td>
					    </tr>
					    <tr>
					      <th scope="row">Modello</th>
					      <td><%=phone.getNome() %></td>
					    </tr>
					    <tr>
					      <th scope="row">RAM:</th>
					      <%if(phone.getRam() > 30){ %>
					     	 <td><%=phone.getRam() %> Mb</td>
					      <%} else { %>
					      	<td><%=phone.getRam() %> Gb</td>
					      <%} %>
					    </tr>
					    <tr>
					      <th scope="row">Memoria</th>
					      <td><%=phone.getTaglia() %></td>
					    </tr>
					    <tr>
					      <th scope="row">Colore</th>
					      <td><%=phone.getColore() %></td>
					    </tr>
					    <tr>
					      <th scope="row">Particolarità</th>
					      <%if(phone.isRicondizionato()){ %>
					      	<td>Ricondizionato</td>
					      <%} else if (phone.isEpoca()) { %>
					      	<td>D'epoca</td>
					      <%} else { %>
					      	<td>Nessuna</td>
					      <%} %>
					    </tr>
					    <tr>
					      <th scope="row">Prezzo</th>
					      <td>&euro; <%=phone.getPrezzo() %></td>
					    </tr>
					    <%if(user != null && admin.equals("yes")){ %>
					    <tr>
					      <th scope="row">Quantit&agrave;</th>
					      <td><%=phone.getQuantita() %></td>
					    </tr>
					    <%} %>
				</table>
			</div> 
		</div>
		<div class="pt-1 mb-4">
			<%if(user != null && admin.equals("yes")){ %>
			<%-- AGGIUNGI LA MODIFICA --%> 
			<a href=" ">
	            <button class="btn btn-dark btn-lg btn-block" type="submit">Modifica</button>
	        </a>
			<%}else{ %>
			<form action="CartServlet" method="post">
				<input type="hidden" value="add" name="action">
				<input type="hidden" value="<%=phone.getID() %>" name="id">
				<input type="submit" class="btn btn-dark btn-lg btn-block" value="Aggiungi al carrello">
			</form>
	        <%} %>
        </div>
		</div>
		</div>
	<%@include file="../fragments/Footer.jsp"  %>
</body>
</html>