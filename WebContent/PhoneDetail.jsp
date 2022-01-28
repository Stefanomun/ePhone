<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="ISO-8859-1"%>

<%
	OrderBean order = (OrderBean) request.getAttribute("order");
	ArrayList<PhoneBean> phones = order.getPhones();
	double totCell = 0;
%>

<%@ page contentType="text/html; charset=UTF-8"
	import="java.util.*, model.OrderBean, model.PhoneBean"%>
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
<title>Dettaglio ordine</title>
</head>
<body>
	<%if(request.getSession().getAttribute("user") == null){ %>
		<%@include file="../fragments/Navbar.jsp"  %>	
	<%}else{ %>
		<%@include file="../fragments/LoggedNavbar.jsp"  %>
	<%} %>

	<h3>Ordine n.<%=order.getId() %></h3>
	<hr>
	<h2>Effettuato in giorno: <b><%=order.getDate() %></b></h2>
	<p>Contenente:</p>
	<table class="table">
		 <thead>
		    <tr>
		      <th scope="col">Marca</th>
		      <th scope="col">Modello</th>
		      <th scope="col">Taglia</th>
		      <th scope="col">Ram</th>
		      <th scope="col">Colore</th>
		      <th scope="col">Particolarit&agrave;</th>
		      <th scope="col">Prezzo</th>
		      <th scope="col">Di cui IVA</th>
		      <th scope="col">Quantit&agrave;</th>
		    </tr>
		  </thead>
	 	 	<%if (phones != null && phones.size() != 0) {
				Iterator<?> it = phones.iterator();
				while (it.hasNext()) {
					PhoneBean phone = (PhoneBean) it.next(); %>
				<tr>
			      	<td><%=phone.getMarca()%></td>
					<td><%=phone.getNome() %></td>
					<td><%=phone.getTaglia() %></td>
					
					<% if(phone.getRam() > 200){%>
						<td><%=phone.getRam() %> mB</td>
					<%}else{ %>
						<td><%=phone.getRam() %> gB</td>
					<%} %>
						<td><%=phone.getColore() %></td>
					
					<% if(phone.isEpoca()){%>
						<td>D'epoca</td>
					<%}else if(phone.isRicondizionato()){ %>
						<td>Ricondizionato</td>
					<%}else{ %>
						<td>Nessuna</td>
					<%} %>
					
					<%if(phone.getPrezzo() % 10 == 0){ %>
					<td>&euro; <%=(int)phone.getPrezzo() %></td>
					<%}else{ %>
					<td>&euro; <%=phone.getPrezzo() %></td>
					<%} %>
					<%if(phone.getIVA() % 10 == 0){ %>
					<td>&euro;<%=(int)phone.getIVA() %></td>
					<%}else{ %>
					<td>&euro;<%=phone.getIVA() %></td>
					<%} %>
					
					<td><%=phone.getQuantita() %></td>
					
					<%totCell = totCell + phone.getPrezzo(); %>
				</tr>
  		<%} 
  		}%>
		</table>
	
	
	
	
	<hr>
	<b>Acquisti: </b>&euro; <%=totCell %><br>
	<b>Costi di spedizione: </b> &euro; 5,90<br>
	<b>Totale</b>&euro; <%=totCell + 5.90 %>
	<%@include file="../fragments/Footer.jsp"  %>
</body>
</html>