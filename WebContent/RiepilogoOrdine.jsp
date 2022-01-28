<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="ISO-8859-1"%>

<%
	UserBean user = (UserBean) session.getAttribute("user");
	AddressBean address = (AddressBean) session.getAttribute("address");
	PaymentBean carta = (PaymentBean) session.getAttribute("carta");
	Cart carrello = (Cart) session.getAttribute("cart");
	double totOrdine = 0, totIvaOrdine = 0;
%>

<%@ page contentType="text/html; charset=UTF-8"
	import="java.util.*, model.AddressBean, model.UserBean, model.PaymentBean, model.Cart, model.PhoneBean"%>
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
<title>Riepilogo Ordine</title>
</head>
<body>
<%if(request.getSession().getAttribute("user") == null){ %>
		<%@include file="../fragments/Navbar.jsp"  %>	
	<%}else{ %>
		<%@include file="../fragments/LoggedNavbar.jsp"  %>
	<%} %>
	<h1>Riepilogo ordine</h1>
	<hr>
	<div class="container py-5 h-100">
		<h3>Articoli acquistati</h3>
		<table class="table">
			<thead>
		    	<tr>
		      		<th scope="col">#</th>
		      		<th scope="col">Foto</th>
		      		<th scope="col">Marca</th>
		      		<th scope="col">Modello</th>
		      		<th scope="col">Prezzo</th>
		      		<th scope="col">Quantità</th>
		    	</tr>
		  	</thead>
		  <%
		    ArrayList <PhoneBean> phones = carrello.getPhones(); 
			ArrayList<Integer> click = carrello.getClick(); 
			for (int i = 0; i < phones.size(); i++) {
				PhoneBean phone = phones.get(i); 
				int clicks = click.get(i);
			%>
				<tr>
			      	<th scope="row"><%=i+1%></th>
				    <td><img src="<%=phone.getFoto() %>" alt="<%=phone.getNome() %>" class="img-fluid" 
				    	 height="60" width="60"/>
				    </td>
					<td><%=phone.getMarca() %></td>
					<td><%=phone.getNome() %></td>
					<td><%=phone.getPrezzo() %></td>
					<td><%=clicks %></td>
				</tr>
				<%totOrdine = totOrdine + (phone.getPrezzo() * clicks);
				totIvaOrdine = totIvaOrdine + (phone.getIVA() * clicks); %>
			
  		<%} %>
		</table>
		</div>
		<div class="container py-5 h-100">
			<div class="row d-flex justify-content-center align-items-center h-100">
				<div class="form-row">
					<div class="col form-group">
						<div style="float: left;">
							<h2>Da consegnare a</h2>
						</div>
						<br><br><br>
						<div style="float:left;">
							<table class="table" style="width: 500px; float: right;">
								<tbody>
						    		<tr>
							      		<th scope="row">Nome</th>
							      		<td><%=user.getName() %></td>
							    	</tr>
							    	<tr>
							      		<th scope="row">Cognome</th>
							      		<td><%=user.getSurname() %></td>
							    	</tr>
							    </tbody>
							</table>
						</div>
					</div>
					<div class="col form-group">
						<div style="float: right;">
							<h2 >Presso</h2>
						</div>
						<br><br><br>
						<div style="float:right;">
							<table class="table" style="width: 500px;">
								<tbody>
						    		<tr>
							      		<th scope="row">Comune</th>
							      		<td><%=address.getComune() %></td>
							   		</tr>
							    	<tr>
							      		<th scope="row">Provincia</th>
							      		<td><%=address.getProvincia() %></td>
							    	</tr>
							    	<tr>
							      		<th scope="row">CAP</th>
							      		<td><%=address.getCap() %></td>
							    	</tr>
							    	<tr>
							      		<th scope="row">Via/Piazza</th>
							      		<td><%=address.getVia() %></td>
							    	</tr>
							    	<tr>
							      		<th scope="row">Civico</th>
							      		<td><%=address.getCivico() %></td>
							    	</tr>
							    </tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>	
		<div class="container py-5 h-100">
			<div class="row d-flex justify-content-center align-items-center h-100">
			<form action="CheckoutServlet" method="post">
				<input type="hidden" value="acquisto" name="step">
				<input type="submit" class="btn btn-dark btn-lg btn-block" value="Acquista">
			</form>
			</div>
		</div>	
		
		<%@include file="../fragments/Footer.jsp"  %>
	
</body>
</html>