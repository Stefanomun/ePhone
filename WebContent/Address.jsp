<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="ISO-8859-1"%>

<%
	Collection<AddressBean> address = (Collection<AddressBean>) request.getAttribute("address");
	String subaction = request.getParameter("subaction");
%>

<%@ page contentType="text/html; charset=UTF-8"
	import="java.util.*, model.AddressBean, model.UserBean"%>
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
<title>I tuoi indirizzi</title>
</head>
<body>
	<%if(request.getSession().getAttribute("user") == null){ %>
		<%@include file="../fragments/Navbar.jsp"  %>	
	<%}else{ %>
		<%@include file="../fragments/LoggedNavbar.jsp"  %>
	<%} %>

	<h1 style="padding-left: 15px;">I tuoi indirizzi</h1>
	<hr>
	<%if(subaction.equals("checkout")){ %>
		<h3 style="padding-left: 15px;">Scegli l'indirizzo di spedizione</h3>
		<hr>
	<%} %>
	<div class="row" style=" padding-right: 15px;padding-left: 15px;">
		<%
			if (address != null && address.size() != 0) {
				Iterator<?> it = address.iterator();
				while (it.hasNext()) {
					AddressBean ad = (AddressBean) it.next();
		%>
		<div class="col-sm-6">
   			<div class="card">
      			<div class="card-body">
        			<h5 class="card-title"><%=ad.getComune() %> (<%=ad.getProvincia() %>)</h5>
        				<p class="card-text">Via/Piazza <%=ad.getVia() %>, <%=ad.getCivico() %></p>
        				<%if(subaction.equals("checkout")){%>
        					 <form action="CheckoutServlet" method="post">
				             	<input type="hidden" value="2" name="step">
				             	<input type="hidden" value="<%=ad.getId() %>" name="address">
				              	<input type="submit" class="btn btn-sm btn-outline-secondary" value="Scegli">
				              </form>
        				<%} %>
      			</div>
    		</div>
  		</div>
		<%}
				}%>
	</div>
	<div style="padding-left: 15px; padding-top: 20px">
	 <form action="AddressServlet" method="post">
		<input type="hidden" value="add" name="action">
		<input type="submit" class="btn btn-sm btn-outline-secondary" value="Aggiungi un nuovo indirizzo">
	</form>
	</div>
	<%@include file="../fragments/Footer.jsp"  %>
</body>
</html>