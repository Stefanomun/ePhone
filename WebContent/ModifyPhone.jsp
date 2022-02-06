<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="ISO-8859-1"%>

<%
	PhoneBean phone = (PhoneBean) request.getAttribute("phone");
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

a{
	text-decoration: none;
}
</style>
<meta charset="ISO-8859-1">
<title>Modifica Dettagli</title>
</head>
<body>
<%@include file="../fragments/AdminNavbar.jsp"  %>	
  		<div class="container py-5 h-100">
  		<div class="card" style="border-radius: 1rem;">
		<div class="parent"><h1 style="float:center"><%=phone.getNome() %></h1></div>
		<hr>
		<div class="row d-flex justify-content-center align-items-center h-100">
		<div class="form-row">
			<div class="col form-group">
				<img src="<%=phone.getFoto() %>" width="400px" height="400px">
			</div> 
			<form action = "PhoneServlet" method = "post">
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
					      <th scope="row">Quantita</th>
					      <td><input type="number" name="quantita" value="<%=phone.getQuantita() %>"></td>
					    </tr>
					    <tr>
					      <th scope="row">Prezzo</th>
					      <td><input type="text" id="prezzo" name="prezzo" placeholder="<%=phone.getPrezzo() %>"></td>
					      <script>
					     	 document.getElementById("prezzo").value = "<%=phone.getPrezzo() %>";
					      </script>
					    </tr>
				</table>
				<input type="hidden" value="<%=phone.getID() %>" name="id">
				<input type="hidden" value="modify" name="action">
				<input type="submit" class="btn btn-dark btn-lg btn-block" value="Modifica">
				</form>
			</div> 
		</div>
		</div>
		</div>

</body>
</html>