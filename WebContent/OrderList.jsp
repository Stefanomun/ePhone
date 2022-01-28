<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="ISO-8859-1"%>

<%
	Collection<OrderBean> ordini = (Collection<OrderBean>)request.getAttribute("ordini");
%>

<%@ page contentType="text/html; charset=UTF-8"
	import="java.util.*, model.OrderBean, model.UserBean"%>
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
<title>I tuoi ordini</title>
</head>
<body>

	<%if(request.getSession().getAttribute("user") == null){ %>
		<%@include file="../fragments/Navbar.jsp"  %>	
	<%}else{ %>
		<%@include file="../fragments/LoggedNavbar.jsp"  %>
	<%} %>
	
	<h2 style="padding-left: 15px">I tuoi ordini</h2>
	<hr>
	<table class="table">
		 <thead>
		    <tr>
		      <th scope="col">#</th>
		      <th scope="col">Data</th>
		      <th scope="col">Importo pagato</th>
		      <th scope="col">Di cui IVA</th>
		      <th scope="col"></th>
		    </tr>
		  </thead>
	 	 	<%if (ordini != null && ordini.size() != 0) {
			Iterator<?> it = ordini.iterator();
			while (it.hasNext()) {
				OrderBean ordine = (OrderBean) it.next(); %>
				<tr>
			      	<th scope="row"><%=ordine.getId()%></th>
					<td><%=ordine.getDate() %></td>
					<td><%=ordine.getSomma() %></td>
					<td><%=ordine.getIVA() %></td>
					<td>
					<form action="OrderServlet" method="post">
						<input type="hidden" value="detail" name="action">
						<input type="hidden" value="<%=ordine.getId() %>" name="id">
						<input type="submit" class="btn btn-outline-secondary" value="Dettagli">
					</form>
					</td>
				</tr>
  		<%} 
  		}%>
		</table>
		<%@include file="../fragments/Footer.jsp"  %>
</body>
</html>