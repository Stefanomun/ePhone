<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="ISO-8859-1"%>

<%
	Collection<UserBean> users = (Collection<UserBean>) request.getAttribute("users");
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
<title>Lista utenti</title>
</head>
<body>
<%@include file="../fragments/AdminNavbar.jsp"  %>

<h1 style="padding-left: 20px;">Lista Utenti</h1>
	<table class="table">
		 <thead>
		    <tr>
		      <th scope="col">Username</th>
		      <th scope="col">Nome</th>
		      <th scope="col">Cognome</th>
		      <th scope="col">Email</th>
		      <th scope="col">Contatto</th>
		      <th scope="col"></th>
		      <th scope="col"></th>
		    </tr>
		  </thead>
		  <%
		  if (users != null && users.size() != 0) {
				Iterator<?> it = users.iterator();
				while (it.hasNext()) {
					UserBean user = (UserBean) it.next();
			%>
				<tr>
			      	<th scope="row"><%=user.getUsername() %></th>
					<td><%=user.getName() %></td>
					<td><%=user.getSurname() %></td>
					<td><%=user.getEmail() %></td>
					<td><%=user.getContact() %></td>
					<%if (!user.isAmministratore()){ %>
					<td>
						<form action="UserServlet" method="post">
							<input type="hidden" value="makeAdmin" name="action">
							<input type="hidden" value="<%=user.getUsername() %>" name="id">
							<input type="submit" class="btn btn-sm btn-outline-secondary" value="Rendi amministratore">
						</form>
					</td>
					<%} else {%>
					<td>Utente amministratore</td>
				</tr>
				<%}
				}
		  }
				%>
		</table>
</body>
</html>