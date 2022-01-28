<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="ISO-8859-1"%>

<%
	Collection<PaymentBean> carte = (Collection<PaymentBean>) request.getAttribute("payment");
String subaction = request.getParameter("subaction");
%>

<%@ page contentType="text/html; charset=UTF-8"
	import="java.util.*, model.PaymentBean, model.UserBean"%>
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
<title>Le tue carte</title>
</head>
<body>
<%if(request.getSession().getAttribute("user") == null){ %>
		<%@include file="../fragments/Navbar.jsp"  %>	
	<%}else{ %>
		<%@include file="../fragments/LoggedNavbar.jsp"  %>
	<%} %>

	<h1 style="padding-left: 15px;">Le tue carte</h1>
	<hr>
	<%if(subaction.equals("checkout")){ %>
		<h3 style="padding-left: 15px;">Scegli il metodo di pagamento</h3>
		<hr>
	<%} %>
	<div class="row" style=" padding-right: 15px;padding-left: 15px;">
		<%
			if (carte != null && carte.size() != 0) {
				Iterator<?> it = carte.iterator();
				while (it.hasNext()) {
					PaymentBean carta = (PaymentBean) it.next();
		%>
		<div class="col-sm-6">
   			<div class="card">
      			<div class="card-body">
        			<h5 class="card-title">Carta n. <%=carta.getNumero() %></h5>
        				<p class="card-text">Circuito: <%=carta.getCircuito() %></p>
        				<p class="card-text">Scadenza: <%=carta.getScadenza() %></p>
        				<p class="card-text">Titolare: <%=carta.getNome_titolare()%> <%=carta.getCognome_titolare() %></p>
        				<%if(subaction.equals("checkout")){%>
        					<form action="CheckoutServlet" method="post">
								<input type="hidden" value="3" name="step">
								<input type="hidden" value="<%=carta.getNumero() %>" name="carta">
								<input type="submit" class="btn btn-outline-secondary" value="Scegli">
							</form>
        				<%} %>
      			</div>
    		</div>
  		</div>
		<%}
				}%>
	</div>
	<div style="padding-left: 15px; padding-top: 20px">
		<form action="PaymentsServlet" method="post">
			<input type="hidden" value="add" name="action">
			<input type="submit" class="btn btn-outline-secondary" value="Aggiungi una nuova carta">
		</form>
	</div>
<%@include file="../fragments/Footer.jsp"  %>
</body>
</html>