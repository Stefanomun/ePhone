<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="ISO-8859-1"%>

<%
	Collection<PhoneBean> phones = (Collection<PhoneBean>) request.getAttribute("phones");
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
<title>Gestione Catalogo</title>
</head>
<body>

<%@include file="../fragments/AdminNavbar.jsp"  %>

<h1 style="padding-left: 20px;">Catalogo</h1>
	<table class="table">
		 <thead>
		    <tr>
		      <th scope="col">#</th>
		      <th scope="col">Foto</th>
		      <th scope="col">Marca</th>
		      <th scope="col">Modello</th>
		      <th scope="col">Prezzo</th>
		      <th scope="col">Quantità</th>
		      <th scope="col"></th>
		      <th scope="col"></th>
		    </tr>
		  </thead>
		  <%
		  if (phones != null && phones.size() != 0) {
				Iterator<?> it = phones.iterator();
				while (it.hasNext()) {
					PhoneBean phone = (PhoneBean) it.next();
			%>
				<tr>
			      	<th scope="row"><%=phone.getID()%></th>
				    <td><img src="<%=phone.getFoto() %>" alt="<%=phone.getNome() %>" class="img-fluid" 
				    	 height="60" width="60"/>
				    </td>
					<td><%=phone.getMarca() %></td>
					<td><%=phone.getNome() %></td>
					<td><%=phone.getPrezzo() %></td>
					<td><%=phone.getQuantita() %></td>
					<td>
						<form action="PhoneServlet" method="post">
							<input type="hidden" value="modifyPage" name="action">
							<input type="hidden" value="<%=phone.getID() %>" name="id">
							<input type="submit" class="btn btn-sm btn-outline-secondary" value="Modifica">
						</form>
					</td>
					<td>
						<form action="PhoneServlet" method="post">
							<input type="hidden" value="remove" name="action">
							<input type="hidden" value="<%=phone.getID() %>" name="id">
							<input type="submit" class="btn btn-sm btn-outline-secondary" value="Rimuovi">
						</form>
					</td>
				</tr>
  		<%}
				}%>
		</table>
		<form action="PhoneServlet" method="post">
			<input type="hidden" value="addPage" name="action">
			<input type="submit" class="btn btn-sm btn-outline-secondary" value="Aggiungi un nuovo articolo">
		</form>
<%@include file="../fragments/Footer.jsp"  %>
</body>
</html>